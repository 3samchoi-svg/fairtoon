#!/usr/bin/env python3
"""네이버웹툰 완결작 수집 — 회차별 배치 SQL 생성.

근거: docs/완결작_수집계획.md
사용: python3 scripts/collect_finished_naver.py --start 27 --target 500 --sort-base 3500 \
        --out supabase/16_finished_batch03.sql

절차는 계획서 4절 그대로다. 목록 API로 페이지를 훑고, 작품별 정보 API에서
장르·줄거리·표지·연령등급을 받아 성인물을 걷어내고, Supabase의 기존 제목과
대조해 중복을 뺀 뒤 단일 문장 CTE SQL로 떨어뜨린다.

페이지 단위로만 채운다. 목표 편수를 넘어서면 그 페이지까지 마치고 멈추므로
다음 회차는 --start 를 마지막 페이지 + 1 로 주면 된다.
"""

import argparse
import json
import sys
import time
import urllib.parse
import urllib.request

SB_URL = "https://wrvllrxwgautewttvffe.supabase.co/rest/v1"
SB_KEY = "sb_publishable_wuImInmyi0WtmCQKetBBhw_QJI-AZAY"

HEADERS = {
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36",
    "Referer": "https://comic.naver.com/webtoon/finish",
}

# 네이버 장르 태그 → 사이트 장르 체계. 매핑되지 않는 것은 드라마로 둔다(계획서 4절).
GENRE_MAP = {
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

RATE = 1 / 3.0   # 초당 3건 이하


def get_json(url):
    req = urllib.request.Request(url, headers=HEADERS)
    with urllib.request.urlopen(req, timeout=20) as r:
        return json.load(r)


def existing_titles():
    """DB가 곧 진실이다. 기존 제목 전체를 읽어온다(1,000행 페이징 주의)."""
    titles, offset = set(), 0
    while True:
        req = urllib.request.Request(
            SB_URL + "/works?select=title_ko&order=id&limit=1000&offset=%d" % offset,
            headers={"apikey": SB_KEY, "Authorization": "Bearer " + SB_KEY},
        )
        with urllib.request.urlopen(req, timeout=30) as r:
            rows = json.load(r)
        titles.update(x["title_ko"] for x in rows)
        if len(rows) < 1000:
            return titles
        offset += 1000


def is_adult(info, listed):
    if listed.get("adult") or info.get("adult"):
        return True
    age = (info.get("age") or {}).get("type", "")
    return "19" in age


def pick_genre(info):
    for tag in info.get("curationTagList", []):
        if tag.get("curationType", "").startswith("GENRE_"):
            return GENRE_MAP.get(tag["tagName"], "드라마")
    return "드라마"


def first_line(text):
    for line in (text or "").split("\n"):
        line = line.strip()
        if line:
            return line[:200]
    return ""


def authors(info, listed):
    names = [a["name"] for a in info.get("communityArtists", []) if a.get("name")]
    if not names:
        return (listed.get("author") or "").replace(" / ", "·")
    seen, out = set(), []
    for n in names:
        if n not in seen:
            seen.add(n)
            out.append(n)
    return "·".join(out)


def q(s):
    return "'" + (s or "").replace("'", "''") + "'"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--start", type=int, required=True, help="시작 페이지")
    ap.add_argument("--target", type=int, default=500, help="목표 편수(페이지 단위로 넘겨서 멈춤)")
    ap.add_argument("--sort-base", type=int, required=True, help="sort 시작값(회차 구분)")
    ap.add_argument("--out", required=True, help="생성할 SQL 경로")
    ap.add_argument("--batch-no", default="", help="SQL 헤더에 적을 회차 표기")
    a = ap.parse_args()

    known = existing_titles()
    print("DB 기존 제목 %d건" % len(known), file=sys.stderr)

    rows, page = [], a.start
    stat = {"listed": 0, "adult": 0, "dup": 0, "nocover": 0, "fail": 0}
    while len(rows) < a.target:
        lst = get_json(
            "https://comic.naver.com/api/webtoon/titlelist/finished?page=%d&order=UPDATE" % page
        ).get("titleList", [])
        if not lst:
            print("page %d 비었음 — 목록 끝" % page, file=sys.stderr)
            break
        for it in lst:
            stat["listed"] += 1
            title = it["titleName"].strip()
            if it.get("adult"):
                stat["adult"] += 1
                continue
            if title in known:
                stat["dup"] += 1
                continue
            time.sleep(RATE)
            try:
                info = get_json(
                    "https://comic.naver.com/api/article/list/info?titleId=%d" % it["titleId"]
                )
            except Exception as e:
                stat["fail"] += 1
                print("  정보 실패 %s (%s)" % (title, e), file=sys.stderr)
                continue
            if is_adult(info, it):
                stat["adult"] += 1
                continue
            cover = info.get("sharedThumbnailUrl") or ""
            if not cover:
                stat["nocover"] += 1
            known.add(title)
            rows.append({
                "title": title,
                "author": authors(info, it),
                "genre": pick_genre(info),
                "blurb": first_line(info.get("synopsis")),
                "url": "https://comic.naver.com/webtoon/list?titleId=%d" % it["titleId"],
                "cover": cover,
            })
        print("page %d 완료 — 누적 %d편" % (page, len(rows)), file=sys.stderr)
        page += 1

    last_page = page - 1
    header = (
        "-- ------------------------------------------------------------\n"
        "-- %s 완결작 — 네이버웹툰 %d편 (표지 포함)\n"
        "--     근거: docs/완결작_수집계획.md\n"
        "--\n"
        "--     네이버 완결 목록 page %d~%d에서 수집. 성인물 %d편·기존 중복 %d편 제외.\n"
        "--     is_curated = false — 명작 큐레이션 화면은 그대로다. 검색으로만 닿는다.\n"
        "--     sort는 %d번대 — 회차별로 골라 지울 수 있다(파일 하단 참조).\n"
        "--\n"
        "--     ※ 단일 문장 CTE. Supabase SQL Editor에서 임시테이블은 쓰지 않는다.\n"
        "-- ------------------------------------------------------------\n\n"
        % (a.batch_no or "완결작 배치", len(rows), a.start, last_page,
           stat["adult"], stat["dup"], a.sort_base)
    )

    body = ["with imp(title, author, genres, blurb, pk, url, cover) as (values"]
    for i, r in enumerate(rows):
        body.append(
            "(%s,%s,array[%s]::text[],%s,'naver',%s,%s)%s"
            % (q(r["title"]), q(r["author"]), q(r["genre"]), q(r["blurb"]),
               q(r["url"]), q(r["cover"]), "," if i < len(rows) - 1 else "")
        )
    body.append("),")
    body.append("ins as (")
    body.append("  insert into public.works (title_ko, author, genres, blurb_ko, cover_url, status, is_curated, sort)")
    body.append("  select i.title, i.author, i.genres, i.blurb, nullif(i.cover,''), '완결', false,")
    body.append("         %d + row_number() over (order by i.title)" % a.sort_base)
    body.append("    from imp i")
    body.append("   where not exists (select 1 from public.works w where w.title_ko = i.title)")
    body.append("  returning id, title_ko")
    body.append(")")
    body.append("insert into public.work_legal_links (work_id, platform_key, url, sort)")
    body.append("select ins.id, imp.pk, imp.url, 0")
    body.append("  from imp join ins on ins.title_ko = imp.title;")
    body.append("")
    body.append("")
    body.append("-- 【철회】 이 회차만 지운다")
    body.append("-- delete from public.works where is_curated = false and sort between %d and %d;"
                % (a.sort_base + 1, a.sort_base + len(rows)))
    body.append("")

    with open(a.out, "w") as f:
        f.write(header + "\n".join(body))

    print(json.dumps({"rows": len(rows), "pages": [a.start, last_page], **stat},
                     ensure_ascii=False), file=sys.stderr)


if __name__ == "__main__":
    main()
