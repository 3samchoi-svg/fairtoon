# -*- coding: utf-8 -*-
"""index.html을 복사해 로고 컨셉 기반 디자인 시안 3안을 생성한다."""
import re, os

ROOT = "/Users/ad02636682/Library/Mobile Documents/com~apple~CloudDocs/10. Project/fairtoon"
OUT = os.path.join(ROOT, "output", "디자인시안")

src = open(os.path.join(ROOT, "index.html"), encoding="utf-8").read()

# 헤더·푸터의 인라인 SVG 브랜드 마크를 로고 이미지로 교체
src = re.sub(
    r'<span class="brand-mark">\s*<svg.*?</svg>\s*</span>',
    '<span class="brand-mark"><img src="logo-mark.png" alt="Fairtoon"></span>',
    src, flags=re.S)

# ---------------------------------------------------------------- 공통 토큰
COMMON = """
/* ===== 로고 기반 공통 토큰 ===== */
:root{
  --navy:#001A4C;          /* 로고 아웃라인 — 새 잉크색 */
  --navy-2:#0B2C6B;
  --blue:#0062FD;          /* 로고 블루 */
  --blue-dark:#0047C2;
  --blue-soft:rgba(0,98,253,.10);
  --blue-softer:#EAF1FF;
  --ink:#001A4C;
  --ink-soft:#22396B;
  --gray:#4C5E85;
  --gray-light:#8695B6;
  --line:#D7E1F3;
  --line-soft:#E9EFFA;
  --surface-2:#F2F6FE;
}
/* 브랜드 마크를 로고 이미지로 */
.brand-mark{width:auto;height:36px;background:none;border-radius:0;}
.brand-mark img{height:36px;width:auto;display:block;}
footer .brand-mark, footer .brand-mark img{height:30px;}
.brand-name{color:var(--navy);letter-spacing:-.4px;}
/* 랭킹 숫자가 카드 제목을 덮지 않도록 커버 하단에 맞춤 */
.rank-card .rk-num{margin-bottom:38px;}
/* 시안 라벨 */
.sian-label{
  background:var(--navy);color:#fff;padding:11px 28px;font-size:13px;font-weight:800;
  font-family:'Inter',sans-serif;letter-spacing:-.1px;
}
.sian-label b{color:#6FA8FF;}
"""

# ---------------------------------------------------------------- A안
A = COMMON + """
/* ===== A안 · 코믹 임팩트 ===== */
header.site-header{border-bottom:3px solid var(--navy);background:rgba(255,255,255,.94);}
.nav-link.active{background:var(--navy);}
.nav-link:hover{background:var(--blue-softer);color:var(--navy);}

/* 히어로 — 집중선 */
.spotlight{background:#fff;border-bottom:3px solid var(--navy);}
.spotlight::before{
  background:repeating-conic-gradient(from 0deg at 50% 38%,
    rgba(0,98,253,.10) 0deg 2.4deg, transparent 2.4deg 7.5deg);
  -webkit-mask-image:radial-gradient(58% 62% at 50% 38%, transparent 34%, #000 78%);
          mask-image:radial-gradient(58% 62% at 50% 38%, transparent 34%, #000 78%);
}
.spotlight-inner{padding:64px 28px 54px;}
.spotlight h1{font-style:italic;color:var(--navy);letter-spacing:-2px;}
.spotlight h1 .accent{
  color:#fff;background:var(--blue);padding:0 14px;border-radius:10px;
  border:3px solid var(--navy);box-shadow:5px 5px 0 var(--navy);display:inline-block;
}
.spotlight-search .hero-search{
  border:3px solid var(--navy);box-shadow:6px 6px 0 var(--navy);border-radius:999px;
}
.hero-search button{border-radius:999px;font-weight:900;}
.chip{border:2px solid var(--navy);color:var(--navy);font-weight:800;box-shadow:2px 2px 0 var(--navy);}
.chip:hover{background:var(--blue);color:#fff;border-color:var(--navy);}

/* 버튼 — 오프셋 그림자 */
.btn-primary{
  background:var(--blue);border:3px solid var(--navy);
  box-shadow:4px 4px 0 var(--navy);font-weight:900;
}
.btn-primary:hover{background:var(--blue);transform:translate(3px,3px);box-shadow:1px 1px 0 var(--navy);}
.btn-ghost{border:3px solid var(--navy);color:var(--navy);font-weight:900;box-shadow:4px 4px 0 var(--navy);}
.btn-ghost:hover{color:var(--navy);border-color:var(--navy);transform:translate(3px,3px);box-shadow:1px 1px 0 var(--navy);}

/* 장르 pill */
.genre-pill{
  border:2.5px solid var(--navy);color:var(--navy);font-weight:800;
  box-shadow:3px 3px 0 var(--navy);background:#fff;
}
.genre-pill:hover{background:var(--blue);color:#fff;transform:translate(3px,3px);box-shadow:0 0 0 var(--navy);}

/* 셸프 제목 — 말풍선 */
.shelf-head h2{
  display:inline-flex;background:var(--navy);color:#fff;padding:9px 17px;border-radius:11px;
  position:relative;font-style:italic;font-size:19px;
}
.shelf-head h2::after{
  content:"";position:absolute;left:24px;bottom:-11px;
  border-left:8px solid var(--navy);border-right:12px solid transparent;
  border-top:12px solid var(--navy);border-bottom:0;
  transform:skewX(-14deg);
}
.shelf-head{align-items:center;margin-bottom:22px;}
.shelf-head .more{color:var(--navy);font-weight:800;}

/* 카드 — 굵은 아웃라인 + 오프셋 */
.hcard .hc-cover{
  border:3px solid var(--navy);box-shadow:5px 5px 0 var(--navy);border-radius:10px;
}
.hcard:hover .hc-cover{box-shadow:7px 7px 0 var(--navy);}
.hcard .hc-title{color:var(--navy);font-weight:800;}
.hcard .hc-badge{border:2px solid var(--navy);font-weight:900;box-shadow:none;}
.rank-card .rk-num{
  color:#fff;-webkit-text-stroke:3.5px var(--navy);font-style:italic;
}
.rank-card:hover .rk-num{color:var(--blue);}

/* 아티클 카드 */
.acard{border:3px solid var(--navy);box-shadow:5px 5px 0 var(--navy);border-radius:12px;}
.acard:hover{transform:translate(-2px,-2px);box-shadow:8px 8px 0 var(--navy);background:#fff;}
.acard .ac-top{border-bottom:3px solid var(--navy);font-style:italic;}
.acard .ac-h{color:var(--navy);}

/* 수익 카운터 */
.counter-band{background:var(--navy);border:3px solid var(--navy);box-shadow:7px 7px 0 rgba(0,26,76,.22);}
.counter-value{font-style:italic;}

/* 퀴즈 배너 */
.quiz-banner{border:3px solid var(--navy);box-shadow:6px 6px 0 var(--navy);background:var(--blue);}
.quiz-banner .qb-text h3{font-style:italic;}
.quiz-banner .btn-primary{background:#fff;color:var(--navy);border-color:var(--navy);}

/* 작동 방식 카드 */
.how-card{border:3px solid var(--navy);box-shadow:5px 5px 0 var(--navy);border-radius:12px;}
.how-card h3{color:var(--navy);}
.how-num{background:var(--blue);color:#fff;border:2.5px solid var(--navy);font-style:italic;}

/* 인터뷰 숏츠 */
.vshort{border:3px solid var(--navy);box-shadow:5px 5px 0 var(--navy);}
"""

# ---------------------------------------------------------------- B안
B = COMMON + """
/* ===== B안 · 절제형 ===== */
header.site-header{border-bottom:1px solid var(--line);}
.nav-link.active{background:var(--navy);}

.spotlight{background:#fff;border-bottom:1px solid var(--line);}
.spotlight::before{
  background:repeating-conic-gradient(from 0deg at 50% 36%,
    rgba(0,98,253,.055) 0deg 2.2deg, transparent 2.2deg 8deg);
  -webkit-mask-image:radial-gradient(56% 60% at 50% 36%, transparent 36%, #000 82%);
          mask-image:radial-gradient(56% 60% at 50% 36%, transparent 36%, #000 82%);
}
.spotlight h1{color:var(--navy);letter-spacing:-1.6px;}
.spotlight h1 .accent{color:var(--blue);}
.spotlight-search .hero-search{
  border:2px solid var(--navy);box-shadow:0 10px 26px rgba(0,26,76,.14);border-radius:999px;
}
.hero-search button{border-radius:999px;font-weight:800;}
.chip{border:1.5px solid var(--line);color:var(--gray);font-weight:700;}
.chip:hover{border-color:var(--navy);color:var(--navy);}

.btn-primary{
  background:var(--blue);border:2px solid var(--navy);
  box-shadow:3px 3px 0 var(--navy);font-weight:800;
}
.btn-primary:hover{background:var(--blue);transform:translate(2px,2px);box-shadow:1px 1px 0 var(--navy);}
.btn-ghost{border:2px solid var(--navy);color:var(--navy);font-weight:800;}
.btn-ghost:hover{color:var(--navy);border-color:var(--navy);background:var(--blue-softer);}

.genre-pill{border:1.5px solid var(--line);color:var(--navy);font-weight:700;}
.genre-pill:hover{background:var(--navy);color:#fff;border-color:var(--navy);}

/* 셸프 제목 — 왼쪽 블루 바 */
.shelf-head h2{
  color:var(--navy);font-size:19.5px;padding-left:14px;position:relative;
}
.shelf-head h2::before{
  content:"";position:absolute;left:0;top:9%;height:82%;width:5px;
  background:var(--blue);border-radius:3px;
}
.shelf-head .more{color:var(--gray);font-weight:800;}
.shelf-head .more:hover{color:var(--blue);}

.hcard .hc-cover{
  border:1.5px solid rgba(0,26,76,.16);border-radius:12px;
  box-shadow:0 8px 20px rgba(0,26,76,.13);
}
.hcard .hc-title{color:var(--navy);font-weight:800;}
.rank-card .rk-num{color:#C2D3F2;}
.rank-card:hover .rk-num{color:var(--blue);}

.acard{border:1.5px solid var(--line);border-radius:14px;}
.acard:hover{background:var(--surface-2);}
.acard .ac-h{color:var(--navy);}

.counter-band{background:var(--navy);border:1px solid var(--navy-2);}

.quiz-banner{background:var(--blue);border:2px solid var(--navy);box-shadow:4px 4px 0 var(--navy);}
.quiz-banner .btn-primary{background:#fff;color:var(--navy);border-color:var(--navy);}

.how-card{border:1.5px solid var(--line);border-radius:14px;}
.how-card h3{color:var(--navy);}
.how-num{background:var(--blue-soft);color:var(--blue);}
"""

# ---------------------------------------------------------------- C안
C = B + """
/* ===== C안 · 네이비 히어로 (B안 기반) ===== */
.spotlight{background:var(--navy);border-bottom:0;}
.spotlight::before{
  background:repeating-conic-gradient(from 0deg at 50% 34%,
    rgba(255,255,255,.085) 0deg 2.4deg, transparent 2.4deg 7.5deg);
  -webkit-mask-image:radial-gradient(60% 66% at 50% 34%, transparent 26%, #000 80%);
          mask-image:radial-gradient(60% 66% at 50% 34%, transparent 26%, #000 80%);
}
.spotlight-inner{padding:52px 28px 58px;}
/* 헤더 로고는 뺀다 — 히어로에 크게 있으므로 워드마크만 남긴다 */
.site-header .brand-mark{display:none;}
.site-header .brand-name{font-size:20.5px;}
/* 히어로 — 로고와 헤드라인을 한 줄로 */
.spotlight h1{
  display:flex;align-items:center;justify-content:center;gap:30px;flex-wrap:wrap;
  color:#fff;letter-spacing:-1.8px;font-size:clamp(28px,4.4vw,50px);
}
.spotlight .hero-logo{
  flex:0 0 auto;width:170px;height:165px;
  background:url('logo-full.png') center/contain no-repeat;
  filter:drop-shadow(0 10px 26px rgba(0,0,0,.35));
}
/* 헤드라인 ↔ 검색창 실측 간격 50px.
   로고가 글자보다 커서 h1 아래에 56px이 이미 깔리므로 여백은 -6px가 된다.
   .spotlight-search와 자식 .hero-search-wrap의 위 여백은 서로 상쇄되므로 둘 다 지정한다 */
.spotlight-search{margin-top:-6px;}
.spotlight-search .hero-search-wrap{margin-top:-6px;}
/* 인터뷰 숏츠 — 영상임이 드러나도록. 배경 지정은 인터뷰 미등록 상태의 임시 처리 */
.vshort{
  flex-basis:172px;width:172px;border-radius:14px;
  background:linear-gradient(158deg,#123A82,#001A4C) !important;
  box-shadow:0 10px 24px rgba(0,26,76,.18);
}
.vshort .vs-ov{background:linear-gradient(to top,rgba(0,9,30,.92),rgba(0,9,30,.10) 64%);}
.vshort .vs-t{font-size:12.5px;padding:14px;}
.vshort::after{
  content:"";position:absolute;left:50%;top:42%;transform:translate(-50%,-50%);
  width:48px;height:48px;border-radius:50%;background:rgba(255,255,255,.94);
  box-shadow:0 6px 18px rgba(0,0,0,.32);
}
.vshort::before{
  content:"";position:absolute;left:50%;top:42%;transform:translate(-32%,-50%);z-index:2;
  border-left:16px solid var(--navy);border-top:10px solid transparent;border-bottom:10px solid transparent;
}
@media(max-width:760px){
  .spotlight h1{gap:16px;}
  .spotlight .hero-logo{width:124px;height:120px;}
  /* 로고가 위로 접히면 헤드라인이 h1 맨 아래에 오므로 음수 여백을 되돌린다 */
  .spotlight-search{margin-top:26px;}
  .spotlight-search .hero-search-wrap{margin-top:26px;}
}
.spotlight h1 .accent{color:#6FA8FF;}
.spotlight-search .hero-search{
  border:0;box-shadow:0 16px 40px rgba(0,0,0,.34);background:#fff;
}
.trending .label{color:#93A9D0;}
.chip{background:rgba(255,255,255,.11);border:1.5px solid rgba(255,255,255,.26);color:#DDE7FA;}
.chip:hover{background:#fff;color:var(--navy);border-color:#fff;}
"""

LABELS = {
    "a": ('A안 · 코믹 임팩트', '로고 톤을 끝까지 — 굵은 네이비 아웃라인 + 오프셋 그림자 + 집중선 + 이탤릭 헤딩'),
    "b": ('B안 · 절제형', '색과 잉크만 로고에 맞춤 — 네이비 헤딩 + 로고 블루. 오프셋 그림자는 버튼·배너에만'),
    "c": ('C안 · 네이비 히어로', 'B안 기반 + 첫 화면을 로고 네이비로 채우고 로고를 크게 노출'),
}

for key, css in (("a", A), ("b", B), ("c", C)):
    name, desc = LABELS[key]
    base = src
    if key == "c":
        # 작가의 목소리 셸프를 '지금 인기' 바로 아래로 이동
        lines = base.split("\n")
        vi = next(i for i, l in enumerate(lines) if "🎙 작가의 목소리" in l)
        voice_block = lines[vi:vi + 3]
        del lines[vi:vi + 3]
        pi = next(i for i, l in enumerate(lines) if "🔥 지금 인기" in l)
        lines[pi + 3:pi + 3] = voice_block          # head + track + 닫는 줄 다음
        # 수익 카운터를 작가의 목소리 바로 아래로 (작가의 목소리 → 피해 규모 → 합법 이용)
        ci = next(i for i, l in enumerate(lines) if l.strip() == "counterBandHTML()+")
        counter_line = lines.pop(ci)
        vi2 = next(i for i, l in enumerate(lines) if "🎙 작가의 목소리" in l)
        lines.insert(vi2 + 3, counter_line)
        base = "\n".join(lines)
        # 히어로 헤드라인에 로고를 같은 줄의 형제로 넣는다
        base = base.replace(
            '\'<h1>보고 싶은 웹툰, <span class="accent">합법으로</span> 찾기</h1>\'',
            '\'<h1><span class="hero-logo"></span>'
            '<span class="hero-text">보고 싶은 웹툰, <span class="accent">합법으로</span> 찾기</span></h1>\'',
            1)
    out = base.replace("</head>", "<style>\n" + css + "\n</style>\n</head>", 1)
    label = ('<div class="sian-label"><b>' + name + '</b> &nbsp;—&nbsp; ' + desc + '</div>')
    out = re.sub(r'(<header class="site-header">)', label + r'\1', out, count=1)
    path = os.path.join(OUT, "theme-%s.html" % key)
    open(path, "w", encoding="utf-8").write(out)
    print("wrote", path, len(out))
