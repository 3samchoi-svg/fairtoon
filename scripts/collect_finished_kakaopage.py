#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
카카오페이지 완결작 수집 — 완결 탭(tab_uid=12)을 끝까지 훑어 DB에 없는 것만 SQL로 낸다.

    python3 scripts/collect_finished_kakaopage.py --out-prefix supabase/24_kp_finished --sort-base 7300

주의
  · 목록은 is_end 까지 끝까지 넘긴다. 첫 페이지만 읽으면 크게 누락된다(21번 SQL의 교훈).
  · 성인물(age_grade >= 19)은 제외한다.
  · 제목이 DB에 이미 있으면 넣지 않는다. 카카오웹툰·카카오페이지가 같은 작품을 함께 서비스한다.
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
H_KP = {"User-Agent": UA, "Referer": "https://page.kakao.com/", "Accept": "application/json"}

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
                return json.loads(r.read().decode())
        except Exception:
            if attempt == tries - 1:
                return None
            time.sleep(1.5)
    return None


def norm(s):
    return re.sub(r"[\s\W_]+", "", (s or "").lower())


def q(s):
    return "'" + (s or "").replace("'", "''") + "'"


def live_finished():
    """완결 탭 전체. is_end 까지 넘긴다."""
    out, page = {}, 0
    while True:
        url = ("https://bff-page.kakao.com/api/gateway/view/v2/landing/dayofweek"
               "?category_uid=10&page=%d&bm=A&subcategory_uid=0&tab_uid=12&screen_uid=52") % page
        res = (get(url, H_KP) or {}).get("result") or {}
        items = res.get("list") or []
        for it in items:
            if it.get("category") != "웹툰" or not it.get("series_id"):
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
        if res.get("is_end") or not items:
            break
        page += 1
        time.sleep(0.25)
    print("완결 탭 %d페이지 · 웹툰 %d편" % (page + 1, len(out)), file=sys.stderr)
    return out


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
    ids = set()
    for l in links:
        if l["platform_key"] == "kakaopage":
            m = re.search(r"/content/(\d+)", l["url"] or "")
            if m:
                ids.add(m.group(1))
    return {norm(w["title_ko"]) for w in works}, ids


def cover(imgs):
    """카드 이미지 후보를 순서대로 시도해 실제로 살아 있는 주소를 고른다."""
    for kid in imgs:
        url = "https://dn-img-page.kakao.com/download/resource?kid=%s&filename=th3" % kid
        try:
            req = urllib.request.Request(url, headers=H_KP, method="HEAD")
            with urllib.request.urlopen(req, timeout=20) as r:
                if r.status == 200 and r.headers.get("Content-Type", "").startswith("image") \
                        and int(r.headers.get("Content-Length") or 0) > 3000:
                    return url
        except Exception:
            continue
    return None


def emit(path, rows, sort_base, part, parts):
    out = ["-- 카카오페이지 완결작 수집 %d/%d — scripts/collect_finished_kakaopage.py 생성" % (part, parts),
           "-- %d편. 성인물 제외 · 제목이 이미 있으면 넣지 않는다." % len(rows),
           "-- 실행: SQL Editor 에서 Run. 여러 번 실행해도 안전하다.", "",
           "with imp(title, author, genres, blurb, url, cover) as (values",
           ",\n".join("(%s,%s,array[%s]::text[],%s,%s,%s)" % (q(t), q(au), q(g), q(bl), q(u), q(cv))
                      for t, au, g, bl, u, cv in rows),
           "), ins as (",
           "  insert into public.works (title_ko, author, genres, blurb_ko, cover_url, status, is_curated, sort)",
           "  select i.title, i.author, i.genres, nullif(i.blurb,''), nullif(i.cover,''), '완결', false,",
           "         %d + row_number() over (order by i.title)" % sort_base,
           "    from imp i",
           "   where not exists (select 1 from public.works w where w.title_ko = i.title)",
           "  returning id, title_ko",
           ")",
           "insert into public.work_legal_links (work_id, platform_key, url, sort)",
           "select ins.id, 'kakaopage', imp.url, 0",
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
    ap.add_argument("--sort-base", type=int, default=7300)
    ap.add_argument("--chunk", type=int, default=800)
    a = ap.parse_args()

    live = live_finished()
    known_titles, known_ids = db_snapshot()

    new, adult, dup_id, dup_title = [], 0, 0, 0
    seen = set()
    for v in live.values():
        if v["adult"]:
            adult += 1
            continue
        if str(v["id"]) in known_ids:
            dup_id += 1
            continue
        n = norm(v["title"])
        if n in known_titles or n in seen:
            dup_title += 1
            continue
        seen.add(n)
        new.append(v)

    print("성인 제외 %d · 이미 수집 %d · 제목 중복 %d → 신규 %d편"
          % (adult, dup_id, dup_title, len(new)), file=sys.stderr)
    if not new:
        return

    with ThreadPoolExecutor(max_workers=12) as ex:
        covers = list(ex.map(lambda v: cover(v["imgs"]), new))
    print("표지 확보 %d / %d편" % (sum(1 for c in covers if c), len(new)), file=sys.stderr)

    rows = []
    for v, cv in zip(new, covers):
        author = "·".join(x.strip() for x in (v.get("authors") or "").split(",") if x.strip())
        rows.append((v["title"], author, GENRE_KAKAOPAGE.get(v.get("sub"), "드라마"),
                     (v.get("copy") or "").strip()[:200],
                     "https://page.kakao.com/content/%d" % v["id"], cv or ""))

    chunks = [rows[i:i + a.chunk] for i in range(0, len(rows), a.chunk)]
    for i, c in enumerate(chunks, 1):
        emit("%s_batch%02d" % (a.out_prefix, i), c, a.sort_base + (i - 1) * a.chunk, i, len(chunks))


if __name__ == "__main__":
    main()
