#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
레진코믹스 작품 수집 — 전체 목록 API를 끝까지 훑어 DB에 없는 것만 SQL로 낸다.

    python3 scripts/collect_lezhin.py --out-prefix supabase/25_lezhin --sort-base 11000

주의
  · 목록은 offset 을 hasNext 가 꺼질 때까지 넘긴다. 첫 페이지만 읽으면 크게 누락된다.
  · 비로그인 목록에는 성인물이 나오지 않지만, 작품 페이지의 이용등급을 한 번 더 확인해
    '청소년 이용불가'는 제외한다.
  · 같은 작품의 [단행본]·[개정판] 변형은 하나만 남긴다(연재중 > 완결, 꼬리표 없는 쪽 우선).
  · 제목이 DB에 이미 있으면 넣지 않는다.
  · DB 쓰기는 하지 않는다. 생성된 SQL 을 SQL Editor 에서 실행한다.
"""
import argparse
import json
import re
import sys
import time
import urllib.request
from concurrent.futures import ThreadPoolExecutor

SB_URL = "https://wrvllrxwgautewttvffe.supabase.co/rest/v1"
SB_KEY = "sb_publishable_wuImInmyi0WtmCQKetBBhw_QJI-AZAY"

UA = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0 Safari/537.36"
H_LZ = {"User-Agent": UA, "Accept": "application/json", "Referer": "https://www.lezhin.com/ko/"}
H_WEB = {"User-Agent": UA}

GENRE_LEZHIN = {
    "romance": "로맨스", "bl": "로맨스", "gl": "로맨스",
    "fantasy": "판타지", "drama": "드라마", "school": "드라마",
    "action": "액션", "mystery": "스릴러", "gag": "코미디", "day": "일상",
}


def get_json(url, tries=3):
    for attempt in range(tries):
        try:
            req = urllib.request.Request(url, headers=H_LZ)
            with urllib.request.urlopen(req, timeout=25) as r:
                return json.loads(r.read().decode())
        except Exception:
            if attempt == tries - 1:
                return None
            time.sleep(1.5)
    return None


def norm(s):
    return re.sub(r"[\s\W_]+", "", (s or "").lower())


def base_title(s):
    """[단행본]·[개정판] 같은 대괄호 꼬리를 뗀 비교용 제목."""
    return norm(re.sub(r"\[[^\]]*\]", "", s or ""))


def q(s):
    return "'" + (s or "").replace("'", "''") + "'"


def live_all():
    """전체 목록. hasNext 가 꺼질 때까지 offset 을 넘긴다."""
    out, off = {}, 0
    while True:
        d = get_json("https://www.lezhin.com/lz-api/v2/contents?limit=100&offset=%d" % off) or {}
        items = d.get("data") or []
        for it in items:
            out[it["id"]] = it
        if not items or not d.get("hasNext"):
            print("목록 %d편 (선언 %s)" % (len(out), d.get("count")), file=sys.stderr)
            return out
        off += 100
        time.sleep(0.3)


def db_snapshot():
    """works·work_legal_links 전체. 한 응답에 1,000행까지만 오므로 페이징한다."""
    def fetch_all(path):
        rows, off = [], 0
        while True:
            req = urllib.request.Request(SB_URL + path + "&limit=1000&offset=%d" % off,
                                         headers={"apikey": SB_KEY, "Authorization": "Bearer " + SB_KEY})
            with urllib.request.urlopen(req, timeout=60) as r:
                d = json.loads(r.read().decode())
            rows += d
            if len(d) < 1000:
                return rows
            off += 1000

    works = fetch_all("/works?select=id,title_ko")
    links = fetch_all("/work_legal_links?select=work_id,platform_key,url")
    aliases = set()
    for l in links:
        if l["platform_key"] == "lezhin":
            m = re.search(r"/comic/([^/?#]+)", l["url"] or "")
            if m:
                aliases.add(m.group(1))
    titles = set()
    for w in works:
        titles.add(norm(w["title_ko"]))
        titles.add(base_title(w["title_ko"]))
    return titles, aliases


def detail(it):
    """작품 페이지에서 이용등급과 줄거리를 읽는다. 실패하면 등급 불명으로 둔다."""
    url = "https://www.lezhin.com/ko/comic/" + it["alias"]
    for attempt in range(2):
        try:
            req = urllib.request.Request(url, headers=H_WEB)
            with urllib.request.urlopen(req, timeout=25) as r:
                html = r.read().decode("utf-8", "replace")
            break
        except Exception:
            if attempt == 1:
                return None, ""
            time.sleep(1.0)
    adult = "청소년 이용불가" in html
    m = re.search(r'og:description" content="([^"]*)"', html)
    blurb = re.sub(r"&#x27;", "'", m.group(1)) if m else ""
    blurb = re.sub(r"&quot;", '"', blurb).replace("&amp;", "&").strip()
    return adult, blurb[:200]


def cover_ok(url):
    try:
        req = urllib.request.Request(url, headers={"User-Agent": UA, "Referer": "https://www.lezhin.com/"},
                                     method="HEAD")
        with urllib.request.urlopen(req, timeout=20) as r:
            return r.status == 200 and (r.headers.get("Content-Type") or "").startswith("image")
    except Exception:
        return False


def emit(path, rows, sort_base, part, parts):
    out = ["-- 레진코믹스 수집 %d/%d — scripts/collect_lezhin.py 생성" % (part, parts),
           "-- %d편. 청소년 이용불가 제외 · 제목이 이미 있으면 넣지 않는다." % len(rows),
           "-- 실행: SQL Editor 에서 Run. 여러 번 실행해도 안전하다.", "",
           "with imp(title, author, genres, blurb, url, cover, st) as (values",
           ",\n".join("(%s,%s,array[%s]::text[],%s,%s,%s,%s)" % (q(t), q(au), g, q(bl), q(u), q(cv), q(st))
                      for t, au, g, bl, u, cv, st in rows),
           "), ins as (",
           "  insert into public.works (title_ko, author, genres, blurb_ko, cover_url, status, is_curated, sort)",
           "  select i.title, i.author, i.genres, nullif(i.blurb,''), nullif(i.cover,''), i.st, false,",
           "         %d + row_number() over (order by i.title)" % sort_base,
           "    from imp i",
           "   where not exists (select 1 from public.works w where w.title_ko = i.title)",
           "  returning id, title_ko",
           ")",
           "insert into public.work_legal_links (work_id, platform_key, url, sort)",
           "select ins.id, 'lezhin', imp.url, 0",
           "  from imp join ins on ins.title_ko = imp.title;", "",
           "-- 확인용",
           "select status, count(*) from public.works group by status order by status;", ""]
    body = "\n".join(out)
    for p in (path + ".sql", path + ".md"):
        with open(p, "w", encoding="utf-8") as f:
            f.write(body)
    print("작성: %s.sql (+.md) — %d편" % (path, len(rows)), file=sys.stderr)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out-prefix", required=True)
    ap.add_argument("--sort-base", type=int, default=11000)
    ap.add_argument("--chunk", type=int, default=800)
    ap.add_argument("--limit", type=int, default=0, help="시험 실행용 상한")
    a = ap.parse_args()

    live = live_all()
    known_titles, known_aliases = db_snapshot()

    # 같은 작품의 변형은 하나만: 연재중 우선, 그다음 꼬리표 없는 제목 우선
    best = {}
    for v in live.values():
        k = base_title(v["title"])
        rank = (0 if v.get("contentsState") == "scheduled" else 1, 0 if "[" not in v["title"] else 1)
        if k not in best or rank < best[k][0]:
            best[k] = (rank, v)

    new, dup_alias, dup_title = [], 0, 0
    for k, (_, v) in best.items():
        if v["alias"] in known_aliases:
            dup_alias += 1
            continue
        if k in known_titles or norm(v["title"]) in known_titles:
            dup_title += 1
            continue
        new.append(v)
    new.sort(key=lambda v: -(v.get("viewCount") or 0))
    if a.limit:
        new = new[:a.limit]
    print("변형 정리 후 %d · 이미 수집 %d · 제목 중복 %d → 신규 %d편"
          % (len(best), dup_alias, dup_title, len(new)), file=sys.stderr)
    if not new:
        return

    with ThreadPoolExecutor(max_workers=8) as ex:
        details = list(ex.map(detail, new))
    adult = sum(1 for ad, _ in details if ad)
    unknown = sum(1 for ad, _ in details if ad is None)
    keep = [(v, bl) for v, (ad, bl) in zip(new, details) if ad is False]
    print("이용등급 확인 — 청소년 이용불가 %d 제외 · 확인실패 %d 제외 → %d편"
          % (adult, unknown, len(keep)), file=sys.stderr)

    covers = ["https://ccdn.lezhin.com/v2/comics/%d/images/tall.webp?updated=%d&width=420"
              % (v["id"], v.get("updatedAt") or 0) for v, _ in keep]
    with ThreadPoolExecutor(max_workers=12) as ex:
        ok = list(ex.map(cover_ok, covers))
    print("표지 확보 %d / %d편" % (sum(ok), len(keep)), file=sys.stderr)

    rows = []
    for (v, blurb), cv, good in zip(keep, covers, ok):
        author = "·".join(dict.fromkeys(x.get("name", "").strip()
                                        for x in (v.get("artists") or []) if x.get("name")))
        gs = [GENRE_LEZHIN[g] for g in (v.get("genres") or []) if g in GENRE_LEZHIN]
        gs = list(dict.fromkeys(gs)) or ["드라마"]
        rows.append((v["title"], author, ",".join(q(g) for g in gs), blurb,
                     "https://www.lezhin.com/ko/comic/" + v["alias"],
                     cv if good else "",
                     "완결" if v.get("contentsState") == "completed" else "연재"))

    chunks = [rows[i:i + a.chunk] for i in range(0, len(rows), a.chunk)]
    for i, c in enumerate(chunks, 1):
        emit("%s_batch%02d" % (a.out_prefix, i), c, a.sort_base + (i - 1) * a.chunk, i, len(chunks))


if __name__ == "__main__":
    main()
