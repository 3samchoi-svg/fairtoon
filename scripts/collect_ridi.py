#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
리디 웹툰 수집 — 웹툰 장르의 목록·큐레이션 화면을 긁어 DB에 없는 것만 SQL로 낸다.

    python3 scripts/collect_ridi.py --out-prefix supabase/26_ridi --sort-base 16000

한계 (2026-08-22 조사)
  · 리디 웹툰 7개 장르 중 전체 목록 화면이 있는 것은 4개(드라마·액션/무협·GL·공포/추리)뿐이다.
    로맨스·BL·판타지/SF 는 추천 큐레이션 화면만 제공하며, 페이지 넘김도 정렬 변경도 없다.
    따라서 이 스크립트로 얻는 것은 리디 웹툰의 '일부'다. 같은 경로를 다시 파도 더 나오지 않는다.
  · 목록에 성인물(isAdultOnly)이 섞여 나온다. 반드시 걸러낸다.
  · 서버가 렌더한 HTML 안의 JSON 객체를 읽는다. 화면 구조가 바뀌면 파싱이 먼저 깨진다.
"""
import argparse
import json
import re
import subprocess
import sys
import time
import urllib.request

SB_URL = "https://wrvllrxwgautewttvffe.supabase.co/rest/v1"
SB_KEY = "sb_publishable_wuImInmyi0WtmCQKetBBhw_QJI-AZAY"

UA = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0 Safari/537.36"

SOURCES = [
    "https://ridibooks.com/webtoon/view-category-1603",   # 드라마
    "https://ridibooks.com/webtoon/view-category-1605",   # 액션/무협
    "https://ridibooks.com/webtoon/view-category-1609",   # GL
    "https://ridibooks.com/webtoon/view-category-1610",   # 공포/추리
    "https://ridibooks.com/webtoon/recommendation",
    "https://ridibooks.com/webtoon/romance",
    "https://ridibooks.com/webtoon/fantasy",
    "https://ridibooks.com/webtoon/bl",
]

GENRE_RIDI = {
    "액션/무협": "액션", "드라마": "드라마", "판타지/SF": "판타지",
    "GL": "로맨스", "로판": "로맨스", "로맨스": "로맨스", "BL 웹툰": "로맨스",
    "공포/추리": "스릴러", "코믹": "코미디", "스포츠/학원": "드라마",
}


def norm(s):
    return re.sub(r"[\s\W_]+", "", (s or "").lower())


def base_title(s):
    return norm(re.sub(r"\[[^\]]*\]", "", s or ""))


def q(s):
    return "'" + (s or "").replace("'", "''") + "'"


def fetch(url, tries=3):
    """리디는 파이썬 기본 클라이언트에 403 을 준다(TLS 지문 차단). curl 로 받아 온다."""
    for attempt in range(tries):
        r = subprocess.run(["curl", "-s", "-A", UA, url], capture_output=True, timeout=60)
        if r.returncode == 0 and len(r.stdout) > 10000:
            return r.stdout.decode("utf-8", "replace")
        if attempt == tries - 1:
            return ""
        time.sleep(1.5)
    return ""


def books_in(html):
    """서버 렌더 HTML 안의 book 객체를 중괄호 짝을 세며 통째로 읽는다."""
    out = []
    for m in re.finditer(r'\{"bookId":"', html):
        st, depth = m.start(), 0
        for j in range(st, min(len(html), st + 8000)):
            if html[j] == "{":
                depth += 1
            elif html[j] == "}":
                depth -= 1
                if depth == 0:
                    try:
                        out.append(json.loads(html[st:j + 1]))
                    except Exception:
                        pass
                    break
    return out


def live_all():
    books = {}
    for u in SOURCES:
        got = books_in(fetch(u))
        for o in got:
            books[o["bookId"]] = o
        print("  %-52s %4d편 (누적 %d)" % (u.split("/")[-1], len(got), len(books)), file=sys.stderr)
        time.sleep(0.4)
    return books


def db_snapshot():
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
    ids = set()
    for l in links:
        if l["platform_key"] == "ridi":
            m = re.search(r"/books/(\d+)", l["url"] or "")
            if m:
                ids.add(m.group(1))
    titles = set()
    for w in works:
        titles.add(norm(w["title_ko"]))
        titles.add(base_title(w["title_ko"]))
    return titles, ids


def emit(path, rows, sort_base, part, parts):
    out = ["-- 리디 웹툰 수집 %d/%d — scripts/collect_ridi.py 생성" % (part, parts),
           "-- %d편. 성인물 제외 · 제목이 이미 있으면 넣지 않는다." % len(rows),
           "-- 리디는 전체 목록 화면이 없는 장르가 있어 '일부'만 담긴다(스크립트 주석 참조).",
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
           "select ins.id, 'ridi', imp.url, 0",
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
    ap.add_argument("--sort-base", type=int, default=16000)
    ap.add_argument("--chunk", type=int, default=320)
    a = ap.parse_args()

    live = live_all()
    known_titles, known_ids = db_snapshot()

    # 같은 작품의 [완전판]·[개정판] 변형은 하나만 남긴다(꼬리표 없는 쪽 우선)
    best = {}
    for o in live.values():
        if o.get("isAdultOnly"):
            continue
        k = base_title(o.get("title"))
        rank = 0 if "[" not in (o.get("title") or "") else 1
        if k not in best or rank < best[k][0]:
            best[k] = (rank, o)

    adult = sum(1 for o in live.values() if o.get("isAdultOnly"))
    new, dup_id, dup_title = [], 0, 0
    for k, (_, o) in best.items():
        if o["bookId"] in known_ids:
            dup_id += 1
            continue
        if k in known_titles or norm(o.get("title")) in known_titles:
            dup_title += 1
            continue
        new.append(o)

    print("수집 %d · 성인 제외 %d · 이미 수집 %d · 제목 중복 %d → 신규 %d편"
          % (len(live), adult, dup_id, dup_title, len(new)), file=sys.stderr)
    if not new:
        return

    rows = []
    for o in new:
        extra = o.get("extra") or {}
        series = extra.get("series") or {}
        author = "·".join(dict.fromkeys(x.get("name", "").strip()
                                        for x in (o.get("authors") or []) if x.get("name")))
        g = GENRE_RIDI.get(extra.get("genre"), "드라마")
        cover = (((o.get("thumbnail") or {}).get("source") or {}).get("large") or "")
        rows.append((o.get("title"), author, q(g), (extra.get("description") or "").strip()[:200],
                     "https://ridibooks.com/books/%s" % o["bookId"], cover,
                     "완결" if series.get("completion") else "연재"))

    chunks = [rows[i:i + a.chunk] for i in range(0, len(rows), a.chunk)]
    for i, c in enumerate(chunks, 1):
        emit("%s_batch%02d" % (a.out_prefix, i), c, a.sort_base + (i - 1) * a.chunk, i, len(chunks))


if __name__ == "__main__":
    main()
