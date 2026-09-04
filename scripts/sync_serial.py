#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
연재작 동기화 — 3사 요일연재 목록을 읽어 DB와 대조하고 SQL을 만든다.

    python3 scripts/sync_serial.py --out supabase/22_serial_sync02.sql --sort-base 6200

하는 일
  1. 3사 요일연재 목록을 끝까지 읽는다(페이지네이션 주의 — 첫 페이지만 읽으면 크게 누락된다).
  2. DB에 없는 작품을 신규로 잡는다. 성인물은 제외한다.
  3. DB 연재작 중 목록에서 사라진 것을 완결 후보로 잡고, **작품별로 원본을 확인한다.**
     목록 부재만으로 완결 처리하지 않는다 — 요일 편성이 없는 상시 연재작이 있다.
  4. 신규 insert + 완결 update 를 한 파일로 낸다. DB 쓰기는 하지 않는다(SQL Editor에서 실행).

완결 판정 근거
  · 네이버      — 작품정보 API의 finished
  · 카카오웹툰  — 회차 목록 최신 항목의 '(완결)' 표기. 요일 목록·profile API에는 상태가 없다.
                  playwright가 있어야 확인 가능하며, 없으면 '판정불가'로 두고 건드리지 않는다.
  · 카카오페이지 — 요일 탭(1~7)과 별도로 완결 탭(tab_uid=12)이 있어 목록 대조로 판정한다.
"""
import argparse
import json
import re
import sys
import time
import urllib.parse
import urllib.request
from concurrent.futures import ThreadPoolExecutor

SB_URL = "https://wrvllrxwgautewttvffe.supabase.co/rest/v1"
SB_KEY = "sb_publishable_wuImInmyi0WtmCQKetBBhw_QJI-AZAY"

UA = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0 Safari/537.36"
H_NAVER = {"User-Agent": UA, "Referer": "https://comic.naver.com/"}
H_KW = {"User-Agent": UA, "Referer": "https://webtoon.kakao.com/", "Accept": "application/json"}
H_KP = {"User-Agent": UA, "Referer": "https://page.kakao.com/", "Accept": "application/json"}

# 각 플랫폼 하위장르 → 사이트 장르 체계. 매핑되지 않는 것은 드라마로 둔다.
GENRE_NAVER = {
    "로맨스": "로맨스", "로맨스판타지": "로맨스", "순정": "로맨스",
    "판타지": "판타지", "무협": "판타지", "사극": "판타지",
    "액션": "액션", "스포츠": "액션",
    "스릴러": "스릴러", "공포": "호러", "호러": "호러",
    "추리": "미스터리", "미스터리": "미스터리",
    "일상": "일상", "감성": "일상",
    "개그": "코미디", "코미디": "코미디",
    "SF": "SF", "과학": "SF",
    "드라마": "드라마", "옴니버스": "드라마", "스토리": "드라마",
}
GENRE_KAKAOPAGE = {
    "로판": "로맨스", "로맨스": "로맨스", "BL": "로맨스",
    "판타지": "판타지", "무협": "판타지",
    "드라마": "드라마", "액션": "액션",
}


def get(url, headers, tries=3):
    for attempt in range(tries):
        try:
            req = urllib.request.Request(url, headers=headers)
            with urllib.request.urlopen(req, timeout=25) as r:
                return json.load(r)
        except Exception as e:
            if attempt == tries - 1:
                print("  요청 실패 %s %s" % (getattr(e, "code", "?"), url[:90]), file=sys.stderr)
                return None
            time.sleep(2)


def norm(s):
    """제목 대조용 정규화. 공백·기호를 지운다."""
    return re.sub(r"[\s\-–—~:·・,.!?'\"“”‘’()\[\]<>《》〈〉&+/]+", "", (s or "")).lower()


def q(s):
    return "'" + (s or "").replace("'", "''") + "'"


# ---------------------------------------------------------------- DB
def db_snapshot():
    """works·work_legal_links 전체. 1,000행씩 페이징한다."""
    def all_rows(path):
        out, offset = [], 0
        while True:
            req = urllib.request.Request(
                "%s/%s&order=id&limit=1000&offset=%d" % (SB_URL, path, offset),
                headers={"apikey": SB_KEY, "Authorization": "Bearer " + SB_KEY})
            with urllib.request.urlopen(req, timeout=30) as r:
                rows = json.load(r)
            out += rows
            if len(rows) < 1000:
                return out
            offset += 1000

    works = all_rows("works?select=id,title_ko,status")
    links = all_rows("work_legal_links?select=work_id,platform_key,url")
    return works, {l["work_id"]: l for l in links}


# ---------------------------------------------------------------- 라이브 목록
def live_naver():
    out = {}
    for day in ["mon", "tue", "wed", "thu", "fri", "sat", "sun"]:
        r = get("https://comic.naver.com/api/webtoon/titlelist/weekday?week=%s&order=user" % day, H_NAVER)
        for t in (r or {}).get("titleList", []) or []:
            out[str(t["titleId"])] = {
                "id": t["titleId"], "title": t.get("titleName"), "author": t.get("author"),
                "adult": bool(t.get("adult")), "thumb": t.get("thumbnailUrl"),
            }
        time.sleep(0.35)
    return out


def live_kakaowebtoon():
    out = {}
    r = get("https://gateway-kw.kakao.com/section/v1/pages/general-weekdays", H_KW)
    for sec in (r or {}).get("data", {}).get("sections", []):
        for group in sec.get("cardGroups", []):
            for card in group.get("cards", []):
                c = card.get("content") or {}
                if not c.get("id"):
                    continue
                out[str(c["id"])] = {
                    "id": c["id"], "title": c.get("title"), "seoId": c.get("seoId"),
                    "authors": [a["name"] for a in c.get("authors", []) if a.get("type") in ("AUTHOR", "ILLUSTRATOR")],
                    "adult": bool(c.get("adult")) or (c.get("ageLimit") or 0) >= 19,
                    "genre": c.get("mainGenre"), "synopsis": c.get("synopsis"),
                }
    return out


def live_kakaopage(tabs=(1, 2, 3, 4, 5, 6, 7)):
    """요일 탭. tabs=(12,)로 부르면 완결 목록이 나온다."""
    out = {}
    for tab in tabs:
        page = 0
        while True:
            url = ("https://bff-page.kakao.com/api/gateway/view/v2/landing/dayofweek"
                   "?category_uid=10&page=%d&bm=A&subcategory_uid=0&tab_uid=%d&screen_uid=52") % (page, tab)
            r = get(url, H_KP)
            result = (r or {}).get("result") or {}
            items = result.get("list") or []
            for it in items:
                if it.get("category") != "웹툰":
                    continue
                asset = it.get("asset_property") or {}
                card_set = asset.get("card_set") or {}
                banner_set = asset.get("banner_set") or {}
                out[str(it["series_id"])] = {
                    "id": it["series_id"], "title": it.get("title"), "authors": it.get("authors"),
                    "adult": (it.get("age_grade") or 0) >= 19, "sub": it.get("sub_category"),
                    "copy": (it.get("operator_property") or {}).get("copy"),
                    "imgs": [x for x in [asset.get("card_img"), card_set.get("background_img"),
                                         asset.get("banner_img"), banner_set.get("background_img"),
                                         banner_set.get("main_img")] if x],
                }
            if result.get("is_end") or not items or page > 25:
                break
            page += 1
            time.sleep(0.3)
    return out


# ---------------------------------------------------------------- 상세·검증
def naver_detail(title_id):
    d = get("https://comic.naver.com/api/article/list/info?titleId=%d" % title_id, H_NAVER)
    if not d:
        return None
    genre = "드라마"
    for tag in d.get("curationTagList", []):
        if (tag.get("curationType") or "").startswith("GENRE_"):
            genre = GENRE_NAVER.get(tag["tagName"], "드라마")
            break
    names, seen = [], set()
    for a in d.get("communityArtists", []):
        n = a.get("name")
        if n and n not in seen:
            seen.add(n)
            names.append(n)
    blurb = next((l.strip() for l in (d.get("synopsis") or "").split("\n") if l.strip()), "")[:200]
    return {
        "title": d.get("titleName"), "author": "·".join(names), "genre": genre, "blurb": blurb,
        "cover": d.get("sharedThumbnailUrl") or d.get("thumbnailUrl"),
        "adult": bool(d.get("adult")) or "19" in ((d.get("age") or {}).get("type") or ""),
        "finished": bool(d.get("finished")),
    }


def kakaopage_cover(imgs):
    """카드 이미지 후보를 순서대로 시도해 실제로 살아 있는 주소를 고른다."""
    for kid in imgs:
        url = "https://dn-img-page.kakao.com/download/resource?kid=%s&filename=th3" % kid
        try:
            req = urllib.request.Request(url, headers=H_KP, method="HEAD")
            with urllib.request.urlopen(req, timeout=20) as r:
                if r.status == 200 and (r.headers.get("Content-Type", "").startswith("image")) \
                        and int(r.headers.get("Content-Length") or 0) > 3000:
                    return url
        except Exception:
            continue
    return ""


def kakaowebtoon_cover(cid):
    """카카오웹툰 표지. 작품 페이지의 og:image 만 근거로 삼는다.

    공유이미지 UUID는 작품마다 다르다. 예전에는 한 작품의 값을 전 작품에 돌려 써서 404가
    섞였고(09-02에 8편 발견 · 33번 SQL로 복구), 09-04에 신작 2편이 또 깨졌다(34번 SQL로 복구).
    그래서 추측하지 않고 페이지에서 읽는다. 못 읽으면 빈 값을 주고, 화면은 장르 그라데이션으로 받는다.
    """
    try:
        req = urllib.request.Request("https://webtoon.kakao.com/content/x/%d" % cid,
                                     headers={"User-Agent": UA, "Referer": "https://webtoon.kakao.com/"})
        with urllib.request.urlopen(req, timeout=20) as r:
            html = r.read().decode("utf-8", "replace")
        m = re.search(r'<meta property="og:image" content="([^"]+)"', html)
        url = m.group(1) if m else ""
        if not url.startswith("https://"):
            return ""
        req = urllib.request.Request(url, headers={"User-Agent": UA}, method="HEAD")
        with urllib.request.urlopen(req, timeout=20) as r:
            if r.status == 200 and (r.headers.get("Content-Type", "").startswith("image")) \
                    and int(r.headers.get("Content-Length") or 0) > 3000:
                return url
    except Exception:
        pass
    return ""


def kakaowebtoon_url(title, db_url):
    if "/content/" in (db_url or ""):
        return db_url
    d = get("https://gateway-kw.kakao.com/search/v2/content?limit=5&offset=0&word="
            + urllib.parse.quote_plus(title), H_KW)
    for c in ((d or {}).get("data") or {}).get("content", []) or []:
        if norm(c.get("title")) == norm(title):
            return "https://webtoon.kakao.com/content/%s/%d" % (urllib.parse.quote(c["seoId"]), c["id"])
    return None


def kakaowebtoon_finished(cands):
    """회차 목록 최신 항목의 '(완결)' 표기로 판정. playwright가 없으면 전부 판정불가."""
    try:
        from playwright.sync_api import sync_playwright
    except ImportError:
        print("  playwright 없음 — 카카오웹툰 완결 판정을 건너뛴다", file=sys.stderr)
        return {c["id"]: "판정불가" for c in cands}

    verdict = {}
    with sync_playwright() as p:
        browser = p.chromium.launch()
        page = browser.new_page()
        for c in cands:
            url = kakaowebtoon_url(c["title"], c["url"])
            if not url:
                verdict[c["id"]] = "판정불가"
                continue
            try:
                page.goto(url, wait_until="domcontentloaded", timeout=40000)
                page.wait_for_timeout(2200)
                verdict[c["id"]] = "완결" if "(완결)" in page.inner_text("body")[:1200] else "연재유지"
            except Exception:
                verdict[c["id"]] = "판정불가"
        browser.close()
    return verdict


# ---------------------------------------------------------------- main
def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", required=True, help="생성할 SQL 경로")
    ap.add_argument("--sort-base", type=int, required=True, help="신규분 sort 시작값(회차 구분)")
    ap.add_argument("--skip-kakaopage", action="store_true", help="카카오페이지 신규는 건너뛴다")
    a = ap.parse_args()

    works, links = db_snapshot()
    known = {norm(w["title_ko"]) for w in works}
    print("DB %d편 (연재 %d)" % (len(works), sum(1 for w in works if w["status"] == "연재")), file=sys.stderr)

    live = {"naver": live_naver(), "kakaowebtoon": live_kakaowebtoon()}
    live["kakaopage"] = {} if a.skip_kakaopage else live_kakaopage()
    for pk, d in live.items():
        print("  %s 라이브 %d편" % (pk, len(d)), file=sys.stderr)

    # ── 신규
    stat = {"adult": 0, "dup": 0}
    rows, seen = [], set()
    for v in live["naver"].values():
        if norm(v["title"]) in known or norm(v["title"]) in seen:
            continue
        if v["adult"]:
            stat["adult"] += 1
            continue
        d = naver_detail(v["id"])
        time.sleep(0.35)
        if not d or d["adult"]:
            stat["adult"] += 1
            continue
        seen.add(norm(v["title"]))
        rows.append((d["title"], d["author"], d["genre"], d["blurb"], "naver",
                     "https://comic.naver.com/webtoon/list?titleId=%d" % v["id"], d["cover"]))

    for v in live["kakaowebtoon"].values():
        if norm(v["title"]) in known or norm(v["title"]) in seen:
            continue
        if v["adult"]:
            stat["adult"] += 1
            continue
        seen.add(norm(v["title"]))
        blurb = next((l.strip() for l in (v.get("synopsis") or "").split("\n") if l.strip()), "")[:200]
        rows.append((v["title"], "·".join(v["authors"]), GENRE_NAVER.get(v.get("genre") or "", "드라마"),
                     blurb, "kakaowebtoon",
                     "https://webtoon.kakao.com/content/%s/%d" % (urllib.parse.quote(v["seoId"]), v["id"]),
                     kakaowebtoon_cover(v["id"])))

    kp_new = [v for v in live["kakaopage"].values()
              if norm(v["title"]) not in known and norm(v["title"]) not in seen and not v["adult"]]
    stat["adult"] += sum(1 for v in live["kakaopage"].values() if norm(v["title"]) not in known and v["adult"])
    if kp_new:
        with ThreadPoolExecutor(max_workers=12) as ex:
            covers = list(ex.map(lambda v: kakaopage_cover(v["imgs"]), kp_new))
        for v, cover in zip(kp_new, covers):
            seen.add(norm(v["title"]))
            author = "·".join(x.strip() for x in (v.get("authors") or "").split(",") if x.strip())
            rows.append((v["title"], author, GENRE_KAKAOPAGE.get(v.get("sub"), "드라마"),
                         (v.get("copy") or "").strip()[:200], "kakaopage",
                         "https://page.kakao.com/content/%d" % v["id"], cover))

    # ── 완결 전환: 목록에서 사라진 것만 후보로 잡고 개별 확인
    live_titles = {pk: {norm(v["title"]) for v in d.values()} for pk, d in live.items()}
    cands = []
    for w in works:
        if w["status"] != "연재":
            continue
        pk = links.get(w["id"], {}).get("platform_key")
        if not pk or not live[pk] or norm(w["title_ko"]) in live_titles[pk]:
            continue
        cands.append({"id": w["id"], "title": w["title_ko"], "platform": pk,
                      "url": links[w["id"]]["url"]})

    finished = []
    for c in [x for x in cands if x["platform"] == "naver"]:
        m = re.search(r"titleId=(\d+)", c["url"])
        if not m:
            continue
        d = naver_detail(int(m.group(1)))
        time.sleep(0.35)
        if d and d["finished"]:
            finished.append(c)
    kw_cands = [x for x in cands if x["platform"] == "kakaowebtoon"]
    if kw_cands:
        verdict = kakaowebtoon_finished(kw_cands)
        finished += [c for c in kw_cands if verdict.get(c["id"]) == "완결"]
    if any(x["platform"] == "kakaopage" for x in cands):
        done = {norm(v["title"]) for v in live_kakaopage(tabs=(12,)).values()}
        finished += [c for c in cands if c["platform"] == "kakaopage" and norm(c["title"]) in done]

    print("신규 %d편 (성인 제외 %d) · 완결 후보 %d → 실제 완결 %d"
          % (len(rows), stat["adult"], len(cands), len(finished)), file=sys.stderr)

    # ── SQL
    out = ["-- 연재작 동기화 — scripts/sync_serial.py 생성",
           "-- 신규 %d편 · 완결 전환 %d편 (완결 후보 %d편 중 원본 확인으로 걸러냈다)"
           % (len(rows), len(finished), len(cands)),
           "-- 실행: SQL Editor 에서 Run. 여러 번 실행해도 안전하다.", ""]
    if finished:
        out += ["-- ① 완결 전환",
                "--    " + " · ".join(c["title"] for c in finished),
                "update public.works set status = '완결', updated_at = now()",
                " where id in (%s) and status = '연재';" % ", ".join(str(c["id"]) for c in finished), ""]
    if rows:
        out += ["-- ② 신규 추가",
                "with imp(title, author, genres, blurb, pk, url, cover) as (values",
                ",\n".join("(%s,%s,array[%s]::text[],%s,%s,%s,%s)"
                           % (q(t), q(au), q(g), q(bl), q(pk), q(u), q(cv))
                           for t, au, g, bl, pk, u, cv in rows),
                "), ins as (",
                "  insert into public.works (title_ko, author, genres, blurb_ko, cover_url, status, is_curated, sort)",
                "  select i.title, i.author, i.genres, nullif(i.blurb,''), nullif(i.cover,''), '연재', false,",
                "         %d + row_number() over (order by i.title)" % a.sort_base,
                "    from imp i",
                "   where not exists (select 1 from public.works w where w.title_ko = i.title)",
                "  returning id, title_ko",
                ")",
                "insert into public.work_legal_links (work_id, platform_key, url, sort)",
                "select ins.id, imp.pk, imp.url, 0",
                "  from imp join ins on ins.title_ko = imp.title;", ""]
    out += ["-- 확인용", "select status, count(*) from public.works group by status order by status;", ""]
    with open(a.out, "w", encoding="utf-8") as f:
        f.write("\n".join(out))
    print("작성: %s" % a.out, file=sys.stderr)


if __name__ == "__main__":
    main()
