#!/usr/bin/env python3
"""
페어툰 인기 순위 수집기 — 3사 공식 랭킹을 받아 data/rankings.json 으로 저장한다.

산정 규칙은 사이트(index.html의 popularList)가 갖고 있다. 이 스크립트는 가공하지 않는다.
각 플랫폼이 공개한 순위를 그대로 받아 적을 뿐이다.

DB 자격증명을 쓰지 않는다. 결과는 리포에 파일로 커밋되고, 사이트가 그 파일을 읽는다.

사용: python3 scripts/collect_rankings.py
"""
import datetime
import json
import os
import sys
import time
import urllib.request

TOPN = 30
OUT = os.path.join(os.path.dirname(__file__), "..", "data", "rankings.json")

UA = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0 Safari/537.36"
H_NAVER = {"User-Agent": UA, "Referer": "https://comic.naver.com/"}
H_KW = {"User-Agent": UA, "Referer": "https://webtoon.kakao.com/"}
H_KP = {"User-Agent": UA, "Referer": "https://page.kakao.com/"}

KST = datetime.timezone(datetime.timedelta(hours=9))
WEEKDAYS = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"]


def get(url, headers, tries=3):
    last = None
    for i in range(tries):
        try:
            req = urllib.request.Request(url, headers=headers)
            return json.loads(urllib.request.urlopen(req, timeout=25).read())
        except Exception as e:  # 일시적 실패는 재시도한다
            last = e
            time.sleep(2)
    raise last


def naver(today):
    """요일별 인기순. 네이버는 실시간 통합 랭킹을 공개하지 않아 그날 요일 목록을 쓴다."""
    wd = WEEKDAYS[today.weekday()]
    rows = get("https://comic.naver.com/api/webtoon/titlelist/weekday?week=%s&order=user" % wd, H_NAVER)
    out, n = [], 0
    for t in rows["titleList"]:
        if t.get("adult"):
            continue
        n += 1
        if n > TOPN:
            break
        out.append({"pk": "naver", "rank": n, "title": t["titleName"]})
    return out, wd


def kakaowebtoon():
    d = get("https://gateway-kw.kakao.com/section/v4/sections?placement=rank_all", H_KW)
    cards = []
    for cg in d["data"][0].get("cardGroups") or []:
        cards += cg.get("cards") or []
    out, n = [], 0
    for c in cards:
        ct = c.get("content") or {}
        if ct.get("adult") or (ct.get("ageLimit") or 0) >= 19:
            continue
        n += 1
        if n > TOPN:
            break
        out.append({"pk": "kakaowebtoon", "rank": n, "title": ct["title"]})
    return out


def kakaopage():
    d = get("https://bff-page.kakao.com/api/gateway/view/v1/landing/ranking?category_uid=10&screen_uid=93", H_KP)
    out, n = [], 0
    for it in d["result"]["list"]:
        if it.get("category") != "웹툰":
            continue
        if (it.get("age_grade") or 0) >= 19:
            continue
        if "19세" in it["title"] or "[성인" in it["title"]:
            continue
        n += 1
        if n > TOPN:
            break
        out.append({"pk": "kakaopage", "rank": n, "title": it["title"]})
    return out


def main():
    today = datetime.datetime.now(KST).date()
    rank, wd = naver(today)
    errors = []
    for name, fn in (("kakaowebtoon", kakaowebtoon), ("kakaopage", kakaopage)):
        try:
            rank += fn()
        except Exception as e:  # 한 곳이 막혀도 나머지는 살린다
            errors.append("%s: %s" % (name, e))

    counts = {}
    for r in rank:
        counts[r["pk"]] = counts.get(r["pk"], 0) + 1
    print("수집 %d건 %s (네이버 %s요일 기준)" % (len(rank), counts, wd))
    for e in errors:
        print("실패:", e, file=sys.stderr)

    # 네이버가 통째로 비면 이전 파일을 유지한다. 반쪽짜리로 덮어쓰지 않는다.
    if counts.get("naver", 0) == 0:
        print("네이버 수집 실패 — 기존 파일을 유지하고 종료한다", file=sys.stderr)
        return 1

    out = {"fetched_on": str(today), "naver_weekday": wd, "counts": counts, "rank": rank}
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    with open(OUT, "w", encoding="utf-8") as f:
        json.dump(out, f, ensure_ascii=False, indent=1)
        f.write("\n")
    print("저장:", os.path.normpath(OUT))
    return 0


if __name__ == "__main__":
    sys.exit(main())
