# -*- coding: utf-8 -*-
"""Fairtoon 표지 목업 v2 — 실제 큐레이션 카드 규격(210px 그리드) 그대로 재현"""
import os, json

OUT = os.path.dirname(os.path.abspath(__file__))
RAW = json.load(open("/tmp/ft_works.json"))
BY = {r["title_ko"]: r for r in RAW}
PICK = ["미생", "이끼", "여신강림", "신과함께", "마음의 소리",
        "갓 오브 하이스쿨", "조명가게", "스위트홈", "유미의 세포들", "트레이스"]
WORKS = [BY[t] for t in PICK]

PLAT = {"미생": "카카오웹툰", "이끼": "카카오웹툰", "조명가게": "카카오웹툰", "스위트홈": "네이버웹툰",
        "여신강림": "네이버웹툰", "신과함께": "네이버웹툰", "마음의 소리": "네이버웹툰",
        "갓 오브 하이스쿨": "네이버웹툰", "유미의 세포들": "네이버웹툰", "트레이스": "카카오페이지"}

GENRE = {
    "드라마":   ["#141E31", "#2E4A7D", "#7FA8E8"],
    "스릴러":   ["#0F1317", "#2C3B44", "#8FB6C4"],
    "로맨스":   ["#2C1018", "#8C3348", "#F0909F"],
    "판타지":   ["#190F2D", "#5B2E96", "#B78CF0"],
    "액션":     ["#280C09", "#A62F22", "#F09080"],
    "개그":     ["#291D06", "#B07818", "#F5C36B"],
    "미스터리": ["#0D181C", "#255055", "#7FC0C4"],
    "일상":     ["#15200E", "#4A7038", "#A8CE8C"],
    "SF":       ["#0D1526", "#2D6FA8", "#84BDEA"],
}
CUR = [["#FF7A59", "#FF3D81"], ["#2F5BFF", "#7C3AED"], ["#00C853", "#00A0E3"],
       ["#FFB020", "#FF5630"], ["#7C3AED", "#2F5BFF"], ["#0EA5A5", "#2F5BFF"],
       ["#E5484D", "#FFB020"], ["#202229", "#2F5BFF"], ["#FF3D81", "#7C3AED"],
       ["#00A0E3", "#00C853"]]
GRAIN = ("url(\"data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='120' height='120'%3E"
         "%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='.85' numOctaves='3'/%3E"
         "%3C/filter%3E%3Crect width='120' height='120' filter='url(%23n)' opacity='.5'/%3E%3C/svg%3E\")")

BASE = """
*{box-sizing:border-box;margin:0;padding:0;}
body{background:#121212;color:#fff;width:1320px;padding:38px 40px 44px;
  font-family:'Inter',-apple-system,'Apple SD Gothic Neo',sans-serif;-webkit-font-smoothing:antialiased;}
.tag{display:inline-block;font-size:11px;font-weight:800;letter-spacing:.5px;color:#1ED760;
  background:rgba(30,215,96,.14);border-radius:999px;padding:5px 12px;margin-bottom:11px;}
h1{font-family:'Archivo Black','Apple SD Gothic Neo',sans-serif;font-size:24px;letter-spacing:-.4px;}
.sub{color:#B3B3B3;font-size:13px;line-height:1.62;margin-top:8px;max-width:900px;}
.toon-grid{display:grid;grid-template-columns:repeat(5,1fr);gap:20px;margin-top:26px;}
.toon-card{background:#181818;border:1px solid #232323;border-radius:16px;overflow:hidden;
  display:flex;flex-direction:column;}
.toon-cover{aspect-ratio:3/4;width:100%;position:relative;overflow:hidden;}
.toon-body{padding:15px 15px 17px;display:flex;flex-direction:column;gap:8px;flex:1;}
.toon-title{font-family:'Archivo Black','Apple SD Gothic Neo',sans-serif;font-size:14.5px;letter-spacing:-.2px;line-height:1.25;}
.toon-author{font-size:12px;color:#B3B3B3;}
.toon-blurb{font-size:12px;color:#CBCBCB;line-height:1.5;}
.toon-tags{display:flex;gap:5px;flex-wrap:wrap;}
.gtag{font-size:10.5px;background:#232323;color:#1DB954;border-radius:999px;padding:3px 8px;font-weight:600;}
.toon-foot{margin-top:auto;padding-top:8px;}
.legal-link{display:flex;align-items:center;justify-content:center;gap:6px;width:100%;font-size:11.5px;
  font-weight:800;background:#1f1f1f;color:#fff;padding:10px 12px;border-radius:999px;}
.grain{position:absolute;inset:0;background-image:GRAINURL;mix-blend-mode:overlay;opacity:.5;pointer-events:none;}
.sb2{position:absolute;top:11px;right:11px;z-index:6;font-size:9.5px;font-weight:800;padding:4px 8px;
  border-radius:999px;background:rgba(0,0,0,.5);color:#fff;}
"""

SHELL = """<!doctype html><html lang="ko"><head><meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Archivo+Black&family=Inter:wght@400;500;600;700;800&family=Black+Han+Sans&family=Noto+Sans+KR:wght@400;500;700;900&family=Nanum+Myeongjo:wght@400;700;800&display=swap" rel="stylesheet">
<style>BASECSS
VARCSS</style></head><body>
<span class="tag">TAGTEXT</span><h1>TITLE</h1><div class="sub">SUBTEXT</div>
<div class="toon-grid">CARDS</div></body></html>"""


def page(tag, title, sub, css, cards):
    return (SHELL.replace("BASECSS", BASE.replace("GRAINURL", GRAIN))
            .replace("VARCSS", css).replace("TAGTEXT", tag).replace("TITLE", title)
            .replace("SUBTEXT", sub).replace("CARDS", cards))


def card(cover, w):
    tags = "".join('<span class="gtag">%s</span>' % g for g in w["genres"])
    return ('<div class="toon-card"><div class="toon-cover">' + cover + '</div>'
            '<div class="toon-body"><div class="toon-title">%s</div>'
            '<div class="toon-author">%s</div><div class="toon-blurb">%s</div>'
            '<div class="toon-tags">%s</div>'
            '<div class="toon-foot"><span class="legal-link">%s에서 보기 ↗</span></div>'
            '</div></div>' % (w["title_ko"], w["author"], w["blurb_ko"], tags, PLAT[w["title_ko"]]))


def g(w):
    return GENRE.get(w["genres"][0], GENRE["드라마"])


# ───────────── BEFORE
css0 = """
.b0{position:absolute;inset:0;display:flex;align-items:center;justify-content:center;padding:16px;}
.b0 .ti{font-family:'Archivo Black','Apple SD Gothic Neo',sans-serif;color:#fff;font-size:20px;
  letter-spacing:-.3px;text-align:center;line-height:1.2;text-shadow:0 1px 8px rgba(0,0,0,.22);}
.sb{position:absolute;top:10px;left:10px;background:rgba(255,255,255,.92);border-radius:999px;
  padding:4px 10px;font-size:11px;font-weight:700;color:#1ED760;z-index:4;}
"""
cards = "".join(card(
    '<div class="b0" style="background:linear-gradient(145deg,%s,%s);"><span class="sb">완결</span>'
    '<span class="ti">%s</span></div>' % (CUR[i][0], CUR[i][1], w["title_ko"]), w)
    for i, w in enumerate(WORKS))
open(os.path.join(OUT, "v0_before.html"), "w").write(page(
    "BEFORE · 현재 라이브 화면", "현재 표지 — 12색 그라데이션 순환",
    "색은 작품 순번으로 정해집니다. 장르·분위기와 아무 관련이 없고, 목록을 스크롤하면 같은 색이 반복됩니다. "
    "제목 텍스트만 가운데 있어 커버가 '빈 자리'처럼 보입니다.", css0, cards))


# ───────────── 방향 1 — 장르 컬러 블록
css1 = """
.c1{position:absolute;inset:0;display:flex;flex-direction:column;justify-content:flex-end;padding:14px 13px 13px;}
.c1 .bar{position:absolute;left:0;top:0;width:100%;height:3px;z-index:4;}
.c1 .en{position:absolute;top:13px;left:13px;right:56px;font-size:8.5px;font-weight:800;letter-spacing:1px;
  text-transform:uppercase;opacity:.6;line-height:1.35;z-index:4;}
.c1 .kt{position:relative;z-index:4;font-family:'Black Han Sans','Apple SD Gothic Neo',sans-serif;
  font-size:26px;line-height:1.06;letter-spacing:-1.1px;color:#fff;word-break:keep-all;
  text-shadow:0 2px 16px rgba(0,0,0,.5);}
.c1 .gl{position:relative;z-index:4;display:flex;gap:4px;margin-top:9px;}
.c1 .gl span{font-size:8.5px;font-weight:800;padding:3px 6px;border-radius:3px;
  background:rgba(255,255,255,.14);border:1px solid rgba(255,255,255,.15);}
.c1 .glow{position:absolute;width:170%;height:62%;left:-35%;top:-18%;border-radius:50%;filter:blur(30px);opacity:.55;}
.sb2{position:absolute;top:11px;right:11px;z-index:6;font-size:9.5px;font-weight:800;padding:4px 8px;
  border-radius:999px;background:rgba(0,0,0,.5);color:#fff;}
"""
cards = ""
for w in WORKS:
    d, m, a = g(w)
    cards += card(
        '<div class="c1" style="background:linear-gradient(168deg,%s 0%%,%s 90%%);">'
        '<div class="glow" style="background:%s;"></div><div class="bar" style="background:%s;"></div>'
        '<span class="sb2">완결</span><div class="en">%s</div><div class="kt">%s</div>'
        '<div class="gl"><span>%s</span><span>%s</span></div><div class="grain"></div></div>'
        % (m, d, m, a, w["title_en"], w["title_ko"], w["genres"][0], w["genres"][1] if len(w["genres"]) > 1 else w["genres"][0]), w)
open(os.path.join(OUT, "v1_editorial.html"), "w").write(page(
    "방향 1", "장르 컬러 블록 — 굵은 한글 타이포",
    "장르가 색을 정합니다. 드라마=딥블루 · 스릴러=차가운 그레이 · 로맨스=로즈 · 판타지=바이올렛 · 액션=버건디 · 개그=앰버 · 미스터리=틸. "
    "한글 제목을 커버의 주인공으로 키우고 영문 제목·장르 태그·상단 액센트 바를 정렬했습니다. 표지가 없어도 목록에서 성격이 바로 읽힙니다.",
    css1, cards))


# ───────────── 방향 2 — 장르 패턴 모티프
PAT = {
    "드라마":   "repeating-linear-gradient(180deg,rgba(255,255,255,.07) 0 1px,transparent 1px 8px)",
    "스릴러":   "repeating-linear-gradient(180deg,rgba(255,255,255,.10) 0 1px,transparent 1px 4px)",
    "로맨스":   "radial-gradient(circle at 50% 60%,transparent 0 20%,rgba(255,255,255,.10) 20% 21%,transparent 21% 33%,rgba(255,255,255,.08) 33% 34%,transparent 34% 47%,rgba(255,255,255,.06) 47% 48%,transparent 48%)",
    "판타지":   "repeating-conic-gradient(from 0deg at 50% 108%,rgba(255,255,255,.09) 0 3deg,transparent 3deg 10deg)",
    "액션":     "repeating-linear-gradient(122deg,rgba(255,255,255,.10) 0 7px,transparent 7px 21px)",
    "개그":     "radial-gradient(circle,rgba(255,255,255,.17) 1.5px,transparent 2px) 0 0/14px 14px",
    "미스터리": "repeating-linear-gradient(90deg,rgba(255,255,255,.07) 0 1px,transparent 1px 12px),repeating-linear-gradient(180deg,rgba(255,255,255,.07) 0 1px,transparent 1px 12px)",
}
css2 = """
.c2{position:absolute;inset:0;display:flex;align-items:center;justify-content:center;padding:18px 14px;}
.c2 .pt{position:absolute;inset:0;}
.c2 .vig{position:absolute;inset:0;background:radial-gradient(115% 85% at 50% 44%,transparent 38%,rgba(0,0,0,.6));}
.c2 .in{position:relative;z-index:4;text-align:center;}
.c2 .kt{font-family:'Noto Sans KR','Apple SD Gothic Neo',sans-serif;font-weight:900;font-size:21px;
  line-height:1.16;letter-spacing:-1.2px;word-break:keep-all;text-shadow:0 2px 14px rgba(0,0,0,.6);}
.c2 .rule{width:22px;height:2px;margin:9px auto 8px;}
.c2 .au{font-size:10px;font-weight:700;letter-spacing:.3px;opacity:.88;}
.c2 .gg{position:absolute;bottom:12px;left:0;right:0;text-align:center;font-size:8.5px;font-weight:800;
  letter-spacing:1.3px;text-transform:uppercase;opacity:.55;z-index:4;}
"""
cards = ""
for w in WORKS:
    d, m, a = g(w)
    cards += card(
        '<div class="c2" style="background:linear-gradient(150deg,%s,%s);">'
        '<div class="pt" style="background:%s;"></div><div class="vig"></div>'
        '<span class="sb2">완결</span>'
        '<div class="in"><div class="kt">%s</div><div class="rule" style="background:%s;"></div>'
        '<div class="au">%s</div></div><div class="gg">%s</div><div class="grain"></div></div>'
        % (m, d, PAT.get(w["genres"][0], PAT["드라마"]), w["title_ko"], a, w["author"], w["genres"][0]), w)
open(os.path.join(OUT, "v2_pattern.html"), "w").write(page(
    "방향 2", "장르 패턴 모티프 — 중앙 정렬",
    "장르마다 배경 패턴이 다릅니다. 스릴러=촘촘한 스캔라인 · 로맨스=겹원 · 판타지=방사선 · 액션=사선 스트라이프 · 개그=도트 · 미스터리=격자. "
    "제목을 중앙에 두고 작가명까지 커버 안에 담아, 카드 하나가 완결된 오브제로 보입니다.", css2, cards))


# ───────────── 방향 3 — 미니멀 프레임
css3 = """
.c3{position:absolute;inset:0;background:#17181A;}
.c3 .fr{position:absolute;inset:11px;border:1px solid rgba(255,255,255,.16);}
.c3 .acc{position:absolute;left:11px;top:11px;bottom:11px;width:4px;}
.c3 .bd{position:absolute;left:28px;right:17px;top:22px;bottom:20px;display:flex;flex-direction:column;}
.c3 .en{font-family:'Archivo Black',sans-serif;font-size:8px;letter-spacing:1.2px;text-transform:uppercase;
  line-height:1.45;margin-bottom:auto;}
.c3 .kt{font-family:'Nanum Myeongjo',serif;font-weight:800;font-size:23px;line-height:1.18;
  letter-spacing:-.9px;color:#fff;word-break:keep-all;}
.c3 .ln{width:100%;height:1px;background:rgba(255,255,255,.2);margin:11px 0 9px;}
.c3 .ft{display:flex;justify-content:space-between;align-items:baseline;font-size:9.5px;}
.c3 .ft .au{font-weight:700;color:#D8D8D8;}
.c3 .ft .gn{font-weight:800;}
.c3 .no{position:absolute;right:18px;top:46px;font-family:'Archivo Black',sans-serif;font-size:28px;
  line-height:1;opacity:.14;}
"""
cards = ""
for i, w in enumerate(WORKS):
    d, m, a = g(w)
    cards += card(
        '<div class="c3"><div class="fr"></div><div class="acc" style="background:%s;"></div>'
        '<span class="sb2">완결</span><div class="no">%02d</div>'
        '<div class="bd"><div class="en" style="color:%s;">%s</div><div class="kt">%s</div>'
        '<div class="ln"></div><div class="ft"><span class="au">%s</span>'
        '<span class="gn" style="color:%s;">%s</span></div></div>'
        '<div class="grain" style="opacity:.14;"></div></div>'
        % (a, i + 1, a, w["title_en"], w["title_ko"], w["author"], a, w["genres"][0]), w)
open(os.path.join(OUT, "v3_minimal.html"), "w").write(page(
    "방향 3", "미니멀 프레임 — 출판물 표지 느낌",
    "무채색 카드에 얇은 프레임과 명조 제목을 얹고, 장르 컬러는 왼쪽 바와 글자 색에만 씁니다. "
    "절제된 큐레이션 매체의 인상을 주고, 작품이 300편으로 늘어도 화면이 시끄러워지지 않습니다.", css3, cards))

print("ok")
