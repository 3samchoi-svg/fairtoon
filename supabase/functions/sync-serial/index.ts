// 연재작 동기화 Edge Function
//
// 왜 함수로 두는가
//   DB 전권 키(service_role)를 GitHub에 두지 않기 위해서다. 전권 키는 Supabase 안에만
//   있고, GitHub은 이 함수 하나를 부를 수 있는 토큰(SYNC_TOKEN)만 갖는다. 토큰이 새도
//   피해는 '작품 추가·상태 변경'을 넘지 못한다.
//   결정 배경: docs/progress.md 2026-08-13~15 6절 (A안으로 검증 → D안으로 자동화)
//
// 하는 일 (scripts/sync_serial.py 와 같은 로직)
//   1. 3사 요일연재 목록을 끝까지 읽는다.
//   2. DB에 없는 비성인 작품을 works + work_legal_links 에 넣는다.
//   3. 완결로 바뀐 작품의 status 를 '완결'로 고친다.
//
// 자동화하지 않는 것 — 카카오웹툰 완결 전환
//   카카오웹툰은 작품의 연재/완결 상태를 API로 주지 않는다. 회차 목록 최신 항목의
//   '(완결)' 표기를 봐야 하고, 그건 브라우저 렌더가 필요해 이 런타임에서 할 수 없다.
//   그래서 후보만 세어 응답에 담는다. 실제 전환은 scripts/sync_serial.py 를 사람이
//   돌린다. 확인할 수 없는 것을 추측으로 바꾸지 않는다.
//
// 배포·호출은 supabase/functions/README.md 참조.

import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const UA =
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0 Safari/537.36";

const GENRE_NAVER: Record<string, string> = {
  "로맨스": "로맨스", "로맨스판타지": "로맨스", "순정": "로맨스",
  "판타지": "판타지", "무협": "판타지", "사극": "판타지",
  "액션": "액션", "스포츠": "액션",
  "스릴러": "스릴러", "공포": "호러", "호러": "호러",
  "추리": "미스터리", "미스터리": "미스터리",
  "일상": "일상", "감성": "일상",
  "개그": "코미디", "코미디": "코미디",
  "SF": "SF", "과학": "SF",
  "드라마": "드라마", "옴니버스": "드라마", "스토리": "드라마",
};
const GENRE_KAKAOPAGE: Record<string, string> = {
  "로판": "로맨스", "로맨스": "로맨스", "BL": "로맨스",
  "판타지": "판타지", "무협": "판타지",
  "드라마": "드라마", "액션": "액션",
};

/** 제목 대조용 정규화. 공백·기호를 지운다. 파이썬 쪽과 같은 규칙을 쓴다. */
function norm(s: string | null | undefined): string {
  return (s ?? "").replace(/[\s\-–—~:·・,.!?'"“”‘’()\[\]<>《》〈〉&+/]+/g, "").toLowerCase();
}

async function getJson(url: string, referer: string, tries = 3): Promise<any> {
  for (let i = 0; i < tries; i++) {
    try {
      const r = await fetch(url, {
        headers: { "User-Agent": UA, "Referer": referer, "Accept": "application/json" },
      });
      if (!r.ok) throw new Error(`HTTP ${r.status}`);
      return await r.json();
    } catch (e) {
      if (i === tries - 1) {
        console.error("요청 실패", url.slice(0, 90), String(e));
        return null;
      }
      await new Promise((s) => setTimeout(s, 1500));
    }
  }
}

type Live = {
  key: string;
  title: string;
  author: string;
  genre: string;
  blurb: string;
  platform: string;
  url: string;
  cover: string;
  adult: boolean;
};

async function liveNaver(): Promise<Live[]> {
  const out: Live[] = [];
  const seen = new Set<number>();
  for (const day of ["mon", "tue", "wed", "thu", "fri", "sat", "sun"]) {
    const d = await getJson(
      `https://comic.naver.com/api/webtoon/titlelist/weekday?week=${day}&order=user`,
      "https://comic.naver.com/",
    );
    for (const t of d?.titleList ?? []) {
      if (seen.has(t.titleId)) continue;
      seen.add(t.titleId);
      out.push({
        key: `naver:${t.titleId}`, title: t.titleName ?? "", author: (t.author ?? "").replace(" / ", "·"),
        genre: "드라마", blurb: "", platform: "naver",
        url: `https://comic.naver.com/webtoon/list?titleId=${t.titleId}`,
        cover: t.thumbnailUrl ?? "", adult: !!t.adult,
      });
    }
    await new Promise((s) => setTimeout(s, 300));
  }
  return out;
}

/** 네이버는 신규분만 상세를 한 번 더 읽어 장르·줄거리·공유표지를 채운다. */
async function fillNaverDetail(w: Live): Promise<Live> {
  const id = w.url.split("titleId=")[1];
  const d = await getJson(
    `https://comic.naver.com/api/article/list/info?titleId=${id}`,
    "https://comic.naver.com/",
  );
  if (!d) return w;
  let genre = "드라마";
  for (const tag of d.curationTagList ?? []) {
    if (String(tag.curationType ?? "").startsWith("GENRE_")) {
      genre = GENRE_NAVER[tag.tagName] ?? "드라마";
      break;
    }
  }
  const names: string[] = [];
  for (const a of d.communityArtists ?? []) {
    if (a?.name && !names.includes(a.name)) names.push(a.name);
  }
  const blurb = String(d.synopsis ?? "").split("\n").map((l: string) => l.trim())
    .find((l: string) => l.length > 0) ?? "";
  return {
    ...w,
    title: d.titleName ?? w.title,
    author: names.length ? names.join("·") : w.author,
    genre,
    blurb: blurb.slice(0, 200),
    cover: d.sharedThumbnailUrl ?? d.thumbnailUrl ?? w.cover,
    adult: !!d.adult || String(d.age?.type ?? "").includes("19"),
  };
}

async function liveKakaoWebtoon(): Promise<Live[]> {
  const out: Live[] = [];
  const seen = new Set<number>();
  const d = await getJson(
    "https://gateway-kw.kakao.com/section/v1/pages/general-weekdays",
    "https://webtoon.kakao.com/",
  );
  for (const sec of d?.data?.sections ?? []) {
    for (const group of sec.cardGroups ?? []) {
      for (const card of group.cards ?? []) {
        const c = card.content;
        if (!c?.id || seen.has(c.id)) continue;
        seen.add(c.id);
        const authors = (c.authors ?? [])
          .filter((a: any) => a.type === "AUTHOR" || a.type === "ILLUSTRATOR")
          .map((a: any) => a.name);
        const blurb = String(c.synopsis ?? "").split("\n").map((l: string) => l.trim())
          .find((l: string) => l.length > 0) ?? "";
        out.push({
          key: `kakaowebtoon:${c.id}`, title: c.title ?? "", author: authors.join("·"),
          genre: GENRE_NAVER[c.mainGenre ?? ""] ?? "드라마", blurb: blurb.slice(0, 200),
          platform: "kakaowebtoon",
          url: `https://webtoon.kakao.com/content/${encodeURIComponent(c.seoId)}/${c.id}`,
          // 기존 카카오웹툰 표지와 같은 형식. CDN이 경로의 작품 id로 그림을 고른다.
          cover: `https://kr-a.kakaopagecdn.com/P/C/${c.id}/sharing/2x/eacb00ec-9034-42cb-a533-7c7690741113.jpg`,
          adult: !!c.adult || (c.ageLimit ?? 0) >= 19,
        });
      }
    }
  }
  return out;
}

/** tabs 1~7 이 요일연재, 12 가 완결이다. 페이지 끝까지 넘겨야 한다 — 첫 페이지만 읽으면 크게 누락된다. */
async function liveKakaoPage(tabs: number[]): Promise<Live[]> {
  const out: Live[] = [];
  const seen = new Set<number>();
  for (const tab of tabs) {
    for (let page = 0; page <= 25; page++) {
      const url = "https://bff-page.kakao.com/api/gateway/view/v2/landing/dayofweek" +
        `?category_uid=10&page=${page}&bm=A&subcategory_uid=0&tab_uid=${tab}&screen_uid=52`;
      const d = await getJson(url, "https://page.kakao.com/");
      const items = d?.result?.list ?? [];
      for (const it of items) {
        if (it.category !== "웹툰" || seen.has(it.series_id)) continue;
        seen.add(it.series_id);
        const asset = it.asset_property ?? {};
        const kid = asset.card_img ?? asset.card_set?.background_img ?? asset.banner_img ?? "";
        out.push({
          key: `kakaopage:${it.series_id}`, title: it.title ?? "",
          author: String(it.authors ?? "").split(",").map((x) => x.trim()).filter(Boolean).join("·"),
          genre: GENRE_KAKAOPAGE[it.sub_category] ?? "드라마",
          blurb: String(it.operator_property?.copy ?? "").trim().slice(0, 200),
          platform: "kakaopage",
          url: `https://page.kakao.com/content/${it.series_id}`,
          cover: kid ? `https://dn-img-page.kakao.com/download/resource?kid=${kid}&filename=th3` : "",
          adult: (it.age_grade ?? 0) >= 19,
        });
      }
      if (d?.result?.is_end || items.length === 0) break;
      await new Promise((s) => setTimeout(s, 250));
    }
  }
  return out;
}

Deno.serve(async (req) => {
  // 이 함수를 부를 수 있는 것은 SYNC_TOKEN 을 가진 쪽뿐이다.
  const expected = Deno.env.get("SYNC_TOKEN");
  const given = req.headers.get("x-sync-token");
  if (!expected || given !== expected) {
    return new Response(JSON.stringify({ error: "unauthorized" }), {
      status: 401, headers: { "Content-Type": "application/json" },
    });
  }
  const dryRun = new URL(req.url).searchParams.get("dry") === "1";

  const db = createClient(
    Deno.env.get("SUPABASE_URL")!,
    Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
  );

  // ── DB 스냅샷. 한 응답에 1,000행까지만 오므로 반드시 나눠 받는다.
  const works: { id: number; title_ko: string; status: string }[] = [];
  for (let from = 0; ; from += 1000) {
    const { data, error } = await db.from("works").select("id,title_ko,status")
      .order("id").range(from, from + 999);
    if (error) return new Response(JSON.stringify({ error: error.message }), { status: 500 });
    works.push(...(data ?? []));
    if ((data ?? []).length < 1000) break;
  }
  const links: { work_id: number; platform_key: string }[] = [];
  for (let from = 0; ; from += 1000) {
    const { data } = await db.from("work_legal_links").select("work_id,platform_key")
      .order("work_id").range(from, from + 999);
    links.push(...(data ?? []));
    if ((data ?? []).length < 1000) break;
  }
  const platformOf = new Map(links.map((l) => [l.work_id, l.platform_key]));
  const known = new Set(works.map((w) => norm(w.title_ko)));

  // ── 라이브 목록
  const naver = await liveNaver();
  const kw = await liveKakaoWebtoon();
  const kp = await liveKakaoPage([1, 2, 3, 4, 5, 6, 7]);

  // ── 신규: DB에 없고 성인물이 아닌 것. 플랫폼 간 중복은 네이버 > 카카오웹툰 > 카카오페이지 순으로 하나만.
  const picked = new Set<string>();
  const fresh: Live[] = [];
  let adultSkipped = 0;
  for (const w of [...naver, ...kw, ...kp]) {
    const k = norm(w.title);
    if (!k || known.has(k) || picked.has(k)) continue;
    if (w.adult) { adultSkipped++; continue; }
    picked.add(k);
    fresh.push(w);
  }
  // 네이버 신규만 상세를 채운다(요일 목록에는 장르·줄거리가 없다).
  const detailed: Live[] = [];
  for (const w of fresh) {
    detailed.push(w.platform === "naver" ? await fillNaverDetail(w) : w);
  }
  const toInsert = detailed.filter((w) => !w.adult);
  adultSkipped += detailed.length - toInsert.length;

  // ── 완결 전환
  const liveTitles: Record<string, Set<string>> = {
    naver: new Set(naver.map((w) => norm(w.title))),
    kakaowebtoon: new Set(kw.map((w) => norm(w.title))),
    kakaopage: new Set(kp.map((w) => norm(w.title))),
  };
  const gone = works.filter((w) => {
    if (w.status !== "연재") return false;
    const pk = platformOf.get(w.id);
    return !!pk && !liveTitles[pk]?.has(norm(w.title_ko));
  });

  const finishedIds: number[] = [];
  // 네이버 — 작품정보 API의 finished 가 근거다.
  for (const w of gone.filter((x) => platformOf.get(x.id) === "naver")) {
    const { data } = await db.from("work_legal_links").select("url").eq("work_id", w.id).limit(1);
    const m = /titleId=(\d+)/.exec(data?.[0]?.url ?? "");
    if (!m) continue;
    const d = await getJson(
      `https://comic.naver.com/api/article/list/info?titleId=${m[1]}`,
      "https://comic.naver.com/",
    );
    if (d?.finished) finishedIds.push(w.id);
    await new Promise((s) => setTimeout(s, 300));
  }
  // 카카오페이지 — 완결 탭(12) 목록에 있으면 완결이다.
  const kpGone = gone.filter((x) => platformOf.get(x.id) === "kakaopage");
  if (kpGone.length) {
    const done = new Set((await liveKakaoPage([12])).map((w) => norm(w.title)));
    for (const w of kpGone) if (done.has(norm(w.title_ko))) finishedIds.push(w.id);
  }
  // 카카오웹툰 — 여기서는 판정할 수 없다. 후보만 알린다.
  const kwPending = gone.filter((x) => platformOf.get(x.id) === "kakaowebtoon")
    .map((x) => x.title_ko);

  const result = {
    dry_run: dryRun,
    db_before: { works: works.length, serial: works.filter((w) => w.status === "연재").length },
    live: { naver: naver.length, kakaowebtoon: kw.length, kakaopage: kp.length },
    new_works: toInsert.length,
    adult_skipped: adultSkipped,
    finished_candidates: gone.length,
    finished_applied: finishedIds.length,
    kakaowebtoon_needs_manual_check: kwPending,
    inserted: [] as string[],
    errors: [] as string[],
  };

  if (dryRun) {
    result.inserted = toInsert.map((w) => w.title);
    return new Response(JSON.stringify(result, null, 1), {
      headers: { "Content-Type": "application/json" },
    });
  }

  // ── 쓰기. 작품을 넣고, 받은 id로 링크를 넣는다.
  for (const w of toInsert) {
    const { data, error } = await db.from("works").insert({
      title_ko: w.title, author: w.author, genres: [w.genre],
      blurb_ko: w.blurb || null, cover_url: w.cover || null,
      status: "연재", is_curated: false,
    }).select("id").single();
    if (error || !data) { result.errors.push(`${w.title}: ${error?.message}`); continue; }
    const { error: le } = await db.from("work_legal_links").insert({
      work_id: data.id, platform_key: w.platform, url: w.url, sort: 0,
    });
    if (le) result.errors.push(`${w.title} 링크: ${le.message}`);
    else result.inserted.push(w.title);
  }
  if (finishedIds.length) {
    const { error } = await db.from("works")
      .update({ status: "완결", updated_at: new Date().toISOString() })
      .in("id", finishedIds).eq("status", "연재");
    if (error) result.errors.push(`완결 전환: ${error.message}`);
  }

  return new Response(JSON.stringify(result, null, 1), {
    status: result.errors.length ? 207 : 200,
    headers: { "Content-Type": "application/json" },
  });
});
