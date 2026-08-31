-- 아티클 3번·6번 본문 투입 — 화면에 "준비 중"으로 뜨던 두 편을 채운다.
-- 3번 revenue-share-value-chain (수익배분) · 6번 korea-webtoon-by-numbers (데이터)
-- 실행: SQL Editor 에서 Run. 여러 번 실행해도 안전하다(같은 값으로 덮어쓴다).
--
-- 주의: 본문은 빈 줄로 문단을 나눈다(화면이 \n{2,} 로 쪼갠다). 빈 줄을 지우지 말 것.
--       '<' 로 시작하는 문단은 그림 블록이며 한 줄로 유지해야 한다.

-- ── 3번 ──────────────────────────────────────────────────────────────
update public.articles set body_ko = $b3$웹툰 한 편에 1,000원을 결제했다고 하자. 잠깐 멈춰서 생각해 볼 것이 있다. 이 1,000원은 누구에게 갈까. 많은 사람이 막연히 "작가에게 간다"고 여긴다. 절반만 맞는 말이다. 정확히는, 1,000원은 작가에게 '가는 중'이고 도착할 때는 처음의 크기가 아니다.

경제학에서는 상품이 만들어져 소비자에게 닿기까지 거치는 단계들을 가치사슬이라 부른다. 사슬의 각 단계는 저마다 역할을 하고, 그 대가로 몫을 가져간다. 웹툰도 예외가 아니다. 그림을 그리는 사람과 그것을 읽는 사람 사이에는 최소한 두 개의 단계가 더 있다.

첫 번째는 플랫폼이다. 서버를 굴리고, 결제를 처리하고, 작품을 노출하고, 프로모션을 돌린다. 그 대가로 결제액에서 수수료를 뗀다. 국내에서 통용되는 것으로 알려진 범위는 대체로 35~40% 선이다. 1,000원이면 350~400원이 여기서 빠진다. (웹이 아니라 앱으로 결제하면 그 앞단에 앱 마켓 수수료가 한 번 더 붙는다.)

두 번째는 흔히 CP라 불리는 제작사·에이전시다. 작가를 발굴하고 계약을 대행하고 연재 일정과 각색·번역·해외 유통을 관리한다. 플랫폼이 떼고 남은 600~650원을 여기서 작가와 나눈다. 그런데 이 구간의 비율은 공개되지 않는다. 계약마다 다르고 대체로 비공개다. 숫자가 없다는 사실 자체가 이 사슬의 중요한 특징이다.

<div style="margin:26px 0;border:1px solid var(--line-soft);border-radius:12px;padding:20px 20px 16px;background:var(--surface-2);"><div style="font-size:12px;font-weight:800;color:var(--gray-light);letter-spacing:.3px;margin-bottom:14px;">1,000원의 이동 경로 (예시)</div><div style="display:flex;height:38px;border-radius:8px;overflow:hidden;font-size:11.5px;font-weight:700;"><div style="flex:0 0 38%;background:var(--blue);color:#fff;display:flex;align-items:center;justify-content:center;text-align:center;">플랫폼<br>350~400원</div><div style="flex:1;background:var(--blue-softer);color:var(--ink-soft);display:flex;align-items:center;justify-content:center;text-align:center;">CP · 작가<br>600~650원</div></div><div style="margin-top:8px;display:flex;height:38px;border-radius:8px;overflow:hidden;font-size:11.5px;font-weight:700;"><div style="flex:0 0 38%;background:var(--line-soft);color:var(--gray-light);display:flex;align-items:center;justify-content:center;">—</div><div style="flex:1;background:repeating-linear-gradient(135deg,#EAF1FF,#EAF1FF 7px,#D9E5FF 7px,#D9E5FF 14px);color:var(--ink-soft);display:flex;align-items:center;justify-content:center;text-align:center;padding:0 8px;">이 안의 분배 비율은<br>공개되지 않는다</div></div><div style="font-size:12px;color:var(--gray-light);margin-top:12px;line-height:1.6;">위 — 결제액에서 플랫폼 몫이 먼저 빠진다. 아래 — 남은 몫을 CP와 작가가 나누는 구간. 계약마다 다르고 공개된 통계가 없다.</div></div>

구조를 한 겹 더 복잡하게 만드는 장치도 있다. 선지급금이다. 연재를 시작할 때 미리 받는 돈인데, 나중에 정산에서 차감된다. 그래서 정산액이 선지급금을 넘어서기 전까지는 조회수가 올라도 통장에 추가로 들어오는 돈이 없다. "작품이 잘된다"와 "작가가 번다" 사이에는 시차가 있다는 뜻이다.

그렇다면 끝에 남는 몫은 얼마일까. 2023년 웹툰 작가의 연평균 소득은 약 8,540만 원으로 조사됐다(문체부·한국콘텐츠진흥원). 같은 해 산업 매출 2조 1,890억 원과 나란히 놓으면 나쁘지 않아 보인다. 다만 평균은 상위 소수의 큰 수입에 끌려 올라가는 값이다. 사슬의 끝에 설수록 몫은 작아지고 편차는 커진다.

이 구조를 알고 나면 합법 결제의 의미가 조금 달라진다. "1,000원이 작가에게 간다"기보다는, "1,000원을 내야 사슬이 돌기 시작한다"에 가깝다. 그리고 불법으로 보면 작가만 손해를 보는 것이 아니다. 사슬의 어느 단계에도 아무것도 들어가지 않는다. 400원도 600원도 아니고, 나눌 것 자체가 생기지 않는다.

떼어 가는 손이 여럿이라는 사실은 불편하게 들릴 수 있다. 하지만 사슬이 도는 동안에만 다음 화가 그려진다. 그 사슬이 멈출 때 무슨 일이 벌어지는지는 다음 편에서 숫자로 본다(→ 4편 불법유통의 진짜 비용).

<div style="font-size:12px;color:var(--gray-light);line-height:1.7;border-left:2px solid var(--line);padding-left:12px;">플랫폼 수수료 35~40%는 업계 통용 범위로 보도된 값이며, 플랫폼·계약에 따라 다르다. 위 그림의 1,000원 배분은 이 범위로 짠 예시이지 특정 플랫폼의 실제 정산표가 아니다.</div>$b3$
where slug = 'revenue-share-value-chain';

-- ── 6번 ──────────────────────────────────────────────────────────────
update public.articles set body_ko = $b6$이 글은 주장을 담지 않는다. 한국 웹툰 생태계를 설명하는 숫자 다섯 개를 모아 놓고, 각각에 한두 문장만 붙였다. 모두 공개된 조사 자료에서 가져왔고 기준 연도는 2023년이다.

<div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(160px,1fr));gap:12px;margin:26px 0;"><div style="border:1px solid var(--line-soft);border-radius:12px;padding:16px;background:var(--surface-2);"><div style="font-family:var(--font-kr-display);font-weight:900;font-size:23px;color:var(--blue);letter-spacing:-.5px;">2조 1,890억</div><div style="font-size:12.5px;font-weight:800;color:var(--ink);margin-top:6px;">웹툰 산업 매출 · 2023</div><div style="font-size:12.5px;color:var(--gray);line-height:1.65;margin-top:6px;">10년 전에는 규모를 셀 통계조차 없던 시장이다. 지금은 조 단위로 센다. 아래 숫자들은 모두 이 시장 안의 이야기다.</div></div><div style="border:1px solid var(--line-soft);border-radius:12px;padding:16px;background:var(--surface-2);"><div style="font-family:var(--font-kr-display);font-weight:900;font-size:23px;color:var(--red);letter-spacing:-.5px;">4,465억</div><div style="font-size:12.5px;font-weight:800;color:var(--ink);margin-top:6px;">불법복제 피해 추정액 · 2023</div><div style="font-size:12.5px;color:var(--gray);line-height:1.65;margin-top:6px;">산업 매출의 약 20%에 해당한다. 실측이 아니라 조사기관의 추정치다.</div></div><div style="border:1px solid var(--line-soft);border-radius:12px;padding:16px;background:var(--surface-2);"><div style="font-family:var(--font-kr-display);font-weight:900;font-size:23px;color:var(--amber);letter-spacing:-.5px;">20.4%</div><div style="font-size:12.5px;font-weight:800;color:var(--ink);margin-top:6px;">웹툰 불법 이용률 · 2023</div><div style="font-size:12.5px;color:var(--gray);line-height:1.65;margin-top:6px;">다섯 명 중 한 명꼴이다. 일부 극단적인 이용자의 문제로 보기 어려운 비율이다.</div></div><div style="border:1px solid var(--line-soft);border-radius:12px;padding:16px;background:var(--surface-2);"><div style="font-family:var(--font-kr-display);font-weight:900;font-size:23px;color:var(--ink);letter-spacing:-.5px;">8,540만원</div><div style="font-size:12.5px;font-weight:800;color:var(--ink);margin-top:6px;">웹툰 작가 연평균 소득 · 2023</div><div style="font-size:12.5px;color:var(--gray);line-height:1.65;margin-top:6px;">평균값이다. 아래 "평균은 가운데가 아니다"와 함께 읽어야 오해가 없다.</div></div><div style="border:1px solid var(--line-soft);border-radius:12px;padding:16px;background:var(--surface-2);"><div style="font-family:var(--font-kr-display);font-weight:900;font-size:23px;color:var(--blue);letter-spacing:-.5px;">32.8%</div><div style="font-size:12.5px;font-weight:800;color:var(--ink);margin-top:6px;">불법 이용 이유 1위 "비용 부담" · 2023</div><div style="font-size:12.5px;color:var(--gray);line-height:1.65;margin-top:6px;">"콘텐츠가 값어치를 못 한다"는 응답은 12.2%에 그쳤다. 대부분은 알면서 택한다.</div></div></div>

추이를 하나만 덧붙인다. 불법복제 피해 추정액은 2022년 3,932억 원에서 2023년 4,465억 원으로 약 13.6% 늘었다. 같은 기간 산업 자체도 커졌으므로 "피해가 늘었다"와 "산업이 나빠졌다"는 다른 이야기다. 다만 시장이 커지는 만큼 새어 나가는 쪽도 함께 커지고 있다는 사실은 남는다.

이제 숫자를 다룰 때 조심할 것 셋을 적어 둔다. 이 시리즈가 통계를 고르는 기준이기도 하다.

첫째, 출처가 다르면 섞지 않는다. 웹툰 불법유통 규모로 8,427억 원(2021, 문화체육관광부)이라는 수치도 종종 인용된다. 위의 4,465억 원보다 훨씬 크다. 하지만 두 값은 재는 대상이 다르다 — 하나는 피해 추정액이고 다른 하나는 불법시장 규모다. 큰 쪽을 골라 쓰면 글은 세지지만 근거는 약해진다. 이 사이트는 보수적인 쪽을 쓴다.

둘째, 평균은 가운데가 아니다. 작가 연평균 소득 8,540만 원은 상위 소수의 큰 수입에 끌려 올라간 값이다. 작가의 절반이 8,540만 원을 번다는 뜻이 결코 아니다. 평균만 보면 분포가 보이지 않는다.

셋째, 같은 숫자라고 같은 뜻은 아니다. 불법 이용률 20.4%는 이용자 중의 비율이고, 피해 추정액 4,465억 원은 공교롭게도 산업 매출의 약 20%다. 두 20%는 서로 다른 것을 재고 있다. 나란히 놓고 "그래서 20%"라고 묶는 순간 틀린 문장이 된다.

숫자를 모아 놓으면 대개 무력해진다. 2조도 4,465억도 개인이 어쩔 수 있는 크기가 아니다. 그래서 마지막 숫자는 이 사이트에 두었다 — 페어툰은 국내 주요 플랫폼에서 합법으로 볼 수 있는 작품 1만 편 이상의 열람 경로를 모아 두었다. 위의 숫자들을 바꾸는 방법은 결국 하나다. 합법으로 가는 길을 불법으로 가는 길보다 짧게 만드는 것(→ 5편 넛지의 경제학).$b6$
where slug = 'korea-webtoon-by-numbers';

-- ── 확인 ─────────────────────────────────────────────────────────────
-- 6편 모두 body_ko 가 차 있어야 한다(빈 편 0건).
select id, slug, length(body_ko) as body_len
from public.articles
order by id;
