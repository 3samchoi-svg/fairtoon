-- ============================================================
-- Fairtoon · 초기 콘텐츠 seed (P1)
-- 출처: index.html 하드코딩 콘텐츠 (플랫폼 5 · 작품 12 · 아티클 6 · 안전카드 11)
-- 실행: 01~03 적용 후 SQL Editor 에서 Run
-- 멱등: 이미 있는 행은 건너뜁니다. 여러 번 실행해도 안전합니다.
-- ============================================================


-- ---------- platforms (5) ----------
insert into public.platforms (key, name, color, search_url_pattern, price_note_ko, price_note_en, sort)
values ('naver', '네이버웹툰', '#00DC64', 'https://comic.naver.com/search?keyword={q}', '기본 무료 + 미리보기 유료(쿠키). 완결작 다수 무료.', 'Mostly free + paid preview. Many completed titles free.', 0)
on conflict (key) do update set
  name = excluded.name, color = excluded.color,
  search_url_pattern = excluded.search_url_pattern,
  price_note_ko = excluded.price_note_ko, price_note_en = excluded.price_note_en,
  sort = excluded.sort;
insert into public.platforms (key, name, color, search_url_pattern, price_note_ko, price_note_en, sort)
values ('kakaopage', '카카오페이지', '#FFB900', 'https://page.kakao.com/search?keyword={q}', '기다리면 무료 + 캐시 결제.', 'Wait-for-free + paid cash.', 1)
on conflict (key) do update set
  name = excluded.name, color = excluded.color,
  search_url_pattern = excluded.search_url_pattern,
  price_note_ko = excluded.price_note_ko, price_note_en = excluded.price_note_en,
  sort = excluded.sort;
insert into public.platforms (key, name, color, search_url_pattern, price_note_ko, price_note_en, sort)
values ('kakaowebtoon', '카카오웹툰', '#111214', 'https://webtoon.kakao.com/search?keyword={q}', '기다리면 무료 + 캐시 결제.', 'Wait-for-free + paid cash.', 2)
on conflict (key) do update set
  name = excluded.name, color = excluded.color,
  search_url_pattern = excluded.search_url_pattern,
  price_note_ko = excluded.price_note_ko, price_note_en = excluded.price_note_en,
  sort = excluded.sort;
insert into public.platforms (key, name, color, search_url_pattern, price_note_ko, price_note_en, sort)
values ('ridi', '리디', '#1F8CE6', 'https://ridibooks.com/search?q={q}', '화별·단권 구매, 대여.', 'Per-episode / per-volume purchase.', 3)
on conflict (key) do update set
  name = excluded.name, color = excluded.color,
  search_url_pattern = excluded.search_url_pattern,
  price_note_ko = excluded.price_note_ko, price_note_en = excluded.price_note_en,
  sort = excluded.sort;
insert into public.platforms (key, name, color, search_url_pattern, price_note_ko, price_note_en, sort)
values ('lezhin', '레진코믹스', '#111214', 'https://www.lezhin.com/ko/search?q={q}', '코인 결제. 성인·독점작 다수.', 'Coin-based. Many exclusives.', 4)
on conflict (key) do update set
  name = excluded.name, color = excluded.color,
  search_url_pattern = excluded.search_url_pattern,
  price_note_ko = excluded.price_note_ko, price_note_en = excluded.price_note_en,
  sort = excluded.sort;


-- ---------- works (12, 전부 명작 큐레이션) ----------
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '미생', 'Misaeng', array['미생 incomplete life'], '윤태호', array['드라마','직장'], '바둑밖에 모르던 청년의 회사 생존기. 웹툰의 격을 끌어올린 대표작.', '완결', true, 0
where not exists (select 1 from public.works where title_ko = '미생');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '신과함께', 'Along with the Gods', array['신과 함께'], '주호민', array['판타지','드라마'], '저승 재판으로 삶과 죽음, 제도와 인간을 다시 보게 하는 대서사.', '완결', true, 1
where not exists (select 1 from public.works where title_ko = '신과함께');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '이끼', 'Moss', '{}', '윤태호', array['스릴러','미스터리'], '작은 마을에 스민 거대한 위선. 손에 땀을 쥐게 하는 완결 스릴러.', '완결', true, 2
where not exists (select 1 from public.works where title_ko = '이끼');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '치즈인더트랩', 'Cheese in the Trap', array['치인트','치즈 인 더 트랩'], '순끼', array['로맨스','드라마'], '평범한 대학생과 완벽해 보이는 선배. 심리 묘사의 정석.', '완결', true, 3
where not exists (select 1 from public.works where title_ko = '치즈인더트랩');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '유미의 세포들', 'Yumi''s Cells', array['유세포'], '이동건', array['로맨스','코미디'], '머릿속 세포들이 그리는 한 사람의 연애와 성장. 완결의 여운.', '완결', true, 4
where not exists (select 1 from public.works where title_ko = '유미의 세포들');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '조명가게', 'The Light Shop', '{}', '강풀', array['미스터리','드라마'], '골목 조명가게에 얽힌 사람들. 강풀 미스터리의 정점.', '완결', true, 5
where not exists (select 1 from public.works where title_ko = '조명가게');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '노블레스', 'Noblesse', '{}', '손제호·이광수', array['액션','판타지'], '820년을 잠든 귀족의 현대 부활기. 초창기 액션 웹툰의 완결작.', '완결', true, 6
where not exists (select 1 from public.works where title_ko = '노블레스');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '목욕의 신', 'God of Bath', '{}', '하일권', array['코미디','드라마'], '목욕탕을 무대로 한 뜨끈한 성장 코미디. 하일권 유머의 진수.', '완결', true, 7
where not exists (select 1 from public.works where title_ko = '목욕의 신');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '마음의 소리', 'The Sound of Your Heart', array['마소'], '조석', array['개그','일상'], '천만 독자를 웃긴 국민 개그 웹툰. 완결까지 1000화가 넘는 여정.', '완결', true, 8
where not exists (select 1 from public.works where title_ko = '마음의 소리');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '데드데이즈', 'Dead Days', '{}', 'DEY', array['스릴러','좀비'], '하루아침에 무너진 도시에서의 생존극. 몰입도 높은 완결 스릴러.', '완결', true, 9
where not exists (select 1 from public.works where title_ko = '데드데이즈');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '트레이스', 'Trace', '{}', '고영훈', array['액션','SF'], '초능력자들이 뒤섞인 세계의 히어로물. 스케일 큰 완결 액션.', '완결', true, 10
where not exists (select 1 from public.works where title_ko = '트레이스');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '여신강림', 'True Beauty', array['여강'], '야옹이', array['로맨스','코미디'], '화장으로 감춘 얼굴과 진짜 나. 세대를 사로잡은 완결 로맨스.', '완결', true, 11
where not exists (select 1 from public.works where title_ko = '여신강림');


-- ---------- work_legal_links (작품별 대표 합법 플랫폼 검색 링크) ----------
-- 딥링크 확보 전까지는 플랫폼 검색 URL을 사용합니다(작품명 자동 치환).
insert into public.work_legal_links (work_id, platform_key, url, price_tag, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EB%AF%B8%EC%83%9D', '기본 무료 + 미리보기 유료(쿠키)', 0
from public.works w
where w.title_ko = '미생'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, price_tag, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EC%8B%A0%EA%B3%BC%ED%95%A8%EA%BB%98', '기본 무료 + 미리보기 유료(쿠키)', 0
from public.works w
where w.title_ko = '신과함께'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, price_tag, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EC%9D%B4%EB%81%BC', '기본 무료 + 미리보기 유료(쿠키)', 0
from public.works w
where w.title_ko = '이끼'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, price_tag, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EC%B9%98%EC%A6%88%EC%9D%B8%EB%8D%94%ED%8A%B8%EB%9E%A9', '기본 무료 + 미리보기 유료(쿠키)', 0
from public.works w
where w.title_ko = '치즈인더트랩'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, price_tag, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EC%9C%A0%EB%AF%B8%EC%9D%98%20%EC%84%B8%ED%8F%AC%EB%93%A4', '기본 무료 + 미리보기 유료(쿠키)', 0
from public.works w
where w.title_ko = '유미의 세포들'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, price_tag, sort)
select w.id, 'kakaowebtoon', 'https://webtoon.kakao.com/search?keyword=%EC%A1%B0%EB%AA%85%EA%B0%80%EA%B2%8C', '기다리면 무료 + 캐시 결제', 0
from public.works w
where w.title_ko = '조명가게'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'kakaowebtoon');
insert into public.work_legal_links (work_id, platform_key, url, price_tag, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EB%85%B8%EB%B8%94%EB%A0%88%EC%8A%A4', '기본 무료 + 미리보기 유료(쿠키)', 0
from public.works w
where w.title_ko = '노블레스'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, price_tag, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EB%AA%A9%EC%9A%95%EC%9D%98%20%EC%8B%A0', '기본 무료 + 미리보기 유료(쿠키)', 0
from public.works w
where w.title_ko = '목욕의 신'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, price_tag, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EB%A7%88%EC%9D%8C%EC%9D%98%20%EC%86%8C%EB%A6%AC', '기본 무료 + 미리보기 유료(쿠키)', 0
from public.works w
where w.title_ko = '마음의 소리'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, price_tag, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EB%8D%B0%EB%93%9C%EB%8D%B0%EC%9D%B4%EC%A6%88', '기본 무료 + 미리보기 유료(쿠키)', 0
from public.works w
where w.title_ko = '데드데이즈'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, price_tag, sort)
select w.id, 'kakaowebtoon', 'https://webtoon.kakao.com/search?keyword=%ED%8A%B8%EB%A0%88%EC%9D%B4%EC%8A%A4', '기다리면 무료 + 캐시 결제', 0
from public.works w
where w.title_ko = '트레이스'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'kakaowebtoon');
insert into public.work_legal_links (work_id, platform_key, url, price_tag, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EC%97%AC%EC%8B%A0%EA%B0%95%EB%A6%BC', '기본 무료 + 미리보기 유료(쿠키)', 0
from public.works w
where w.title_ko = '여신강림'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');


-- ---------- articles (6) ----------
-- body_ko 가 비어 있는 2편(3·6번)은 본문 준비 중 상태입니다. 목록에는 노출됩니다.
insert into public.articles (slug, category, concept, title_ko, excerpt_ko, body_ko, read_time, is_published, published_at)
values ('price-discrimination-wait-for-free', '가격차별', '시점 간 가격차별 · 지불의사', '기다리면 무료는 사실 ‘가격차별’이다', '‘기다무’는 급한 독자는 돈으로, 안 급한 독자는 시간으로 값을 치르게 한다. 경제학 교과서의 가격차별을 한국 웹툰이 대중화한 방식.', '웹툰을 보다 보면 익숙한 문장을 만난다. “지금 결제하고 바로 보기” 또는 “24시간 기다리면 무료.” 같은 화(話)를 두고, 어떤 사람은 돈을 내고 지금 보고, 어떤 사람은 하루를 기다려 공짜로 본다. 아무렇지 않아 보이는 이 장치가 사실 경제학 교과서에 나오는 ‘가격차별(price discrimination)’의 교과서적 사례다.

가격차별은 같은 상품을 사람마다 다른 가격에 파는 전략이다. 핵심은 ‘지불의사’가 사람마다 다르다는 것. 다음 화가 너무 궁금해 참을 수 없는 독자는 그 조바심에 값을 매길 의사가 있고, 느긋한 독자는 그렇지 않다. 플랫폼은 이 둘을 한 가격으로 묶는 대신, 급한 사람에게는 ‘돈’이라는 가격을, 느긋한 사람에게는 ‘기다림’이라는 가격을 매긴다.

여기서 ‘기다림’도 엄연한 비용이라는 점이 중요하다. 24시간을 기다린다는 건 그 시간 동안 다른 걸 못 한다는 뜻이고, 무엇보다 ‘지금 바로 보고 싶다’는 욕구를 참는 대가다. 경제학은 이를 시간의 기회비용이라 부른다. 즉 기다무는 겉보기엔 ‘무료’지만, 시간이라는 화폐로 값을 치르는 유료 모델에 가깝다.

카카오페이지가 2014년 ‘기다리면 무료’를 도입한 뒤 이 모델은 한국 웹툰의 표준이 됐다. 흥미로운 건, 이 설계가 불법 유통과 정면으로 부딪힌다는 점이다. 불법 사이트는 ‘돈도 시간도 안 든다’고 유혹한다. 하지만 그 ‘공짜’의 진짜 가격은 창작 생태계의 붕괴(→ 4편)와 당신 기기의 위험(→ 안전 수칙)으로 청구된다. 어떤 가격을 치를지는 결국 선택의 문제다.

정리하면, 기다무는 ‘착한 무료’가 아니라 정교한 가격 설계다. 그리고 이 설계가 작동한다는 건, 사람들이 콘텐츠에 값을 치를 의사가 분명히 있다는 증거이기도 하다. 문제는 그 값이 창작자에게 가느냐, 아니면 불법 사이트의 광고 수익으로 새느냐다.', '6분', true, now())
on conflict (slug) do nothing;
insert into public.articles (slug, category, concept, title_ko, excerpt_ko, body_ko, read_time, is_published, published_at)
values ('public-goods-free-rider', '공공재', '공공재 · 무임승차 · 공유지의 비극', '공짜 웹툰의 역설 — 무임승차와 공유지의 비극', '웹툰은 한 번 만들면 복제 비용이 0에 가깝다. 그래서 무임승차 유인이 크고, 모두가 그러면 볼 작품 자체가 사라진다.', '경제학에는 ‘공공재’라는 개념이 있다. 한 사람이 더 쓴다고 남이 못 쓰게 되지 않고(비경합성), 돈 안 낸 사람을 막기도 어려운(비배제성) 재화다. 디지털 콘텐츠인 웹툰은 순수 공공재는 아니지만, 그 성질을 상당히 닮았다. 이미 그려진 한 화를 한 명이 더 본다고 해서 추가 제작비가 드는 것도 아니고, 파일 하나가 퍼지면 막기가 대단히 어렵다.

이런 재화에는 필연적으로 ‘무임승차’ 유인이 생긴다. 남들이 정당하게 값을 치러 창작 생태계가 유지되는 한, 나 하나쯤 공짜로 봐도 티가 안 난다고 느끼기 쉽다. 개인의 계산으로는 합리적이다. 문제는 모두가 똑같이 생각할 때 벌어진다.

이것이 ‘공유지의 비극’이다. 마을 공유 목초지에 저마다 소를 풀어놓으면, 각자에겐 이득이지만 결국 풀밭은 황폐해진다. 웹툰도 같다. 모두가 무임승차하면 창작자에게 돌아갈 수익이 사라지고, 수익이 없으면 창작할 이유가 사라진다. 그 끝은 ‘볼 만한 새 작품이 더 이상 나오지 않는’ 세계다. 공짜를 누리려던 선택이 공짜로 볼 것 자체를 없애는 역설.

실제 숫자도 이 방향을 가리킨다. 2023년 웹툰 불법 이용률은 20.4%로 조사됐고, 같은 시기 연재 작가의 소득은 하락세를 보였다(한국콘텐츠진흥원 『2024 웹툰산업 실태조사』). 인과를 단정할 순 없지만, 무임승차가 창작 유인을 갉아먹는다는 이론과 어긋나지 않는다.

해법의 실마리도 경제학에 있다. 공유지의 비극은 ‘접근을 정당한 통로로 유도’할 때 완화된다. 합법으로 보는 길이 불법만큼 쉬워지면, 굳이 무임승차할 이유가 줄어든다. 이 사이트가 검색 패스스루로 하려는 일이 바로 그것이다(→ 5편).', '7분', true, now())
on conflict (slug) do nothing;
insert into public.articles (slug, category, concept, title_ko, excerpt_ko, body_ko, read_time, is_published, published_at)
values ('revenue-share-value-chain', '수익배분', '가치사슬 · 수익 배분 · 인센티브', '웹툰 1편 결제하면 그 돈은 어디로 가나', '독자가 낸 1,000원이 플랫폼·CP·작가로 갈라지는 경로. 합법 결제가 왜 창작자에게 의미 있는지를 감정이 아니라 구조로 설명한다.', null, '5분', true, now())
on conflict (slug) do nothing;
insert into public.articles (slug, category, concept, title_ko, excerpt_ko, body_ko, read_time, is_published, published_at)
values ('externality-real-cost-of-piracy', '시장실패', '외부효과 · 시장실패 · 과소공급', '불법유통의 진짜 비용', '불법유통은 창작자에게 부(負)의 외부효과를 지운다. ‘개인의 공짜’가 어떻게 사회적 손실로 전이되는가 — 그리고 그 규모.', '‘나 하나 공짜로 보는 게 뭐가 그리 큰 문제냐’는 말은 절반만 맞다. 나 한 사람의 불법 열람이 특정 작가의 통장에서 정확히 얼마를 빼갔는지는 계산하기 어렵다. 하지만 경제학은 개인 단위가 아니라 ‘전체의 합’을 본다. 그리고 그 합은 결코 작지 않다.

핵심 개념은 ‘외부효과(externality)’다. 어떤 행동이 시장 거래 밖에서 제3자에게 비용을 지우는 현상이다. 불법 열람은 독자에게는 공짜지만, 그 비용은 거래에 끼지 못한 창작자에게 고스란히 전가된다. 이렇게 비용이 엉뚱한 곳으로 새면 시장은 ‘창작에 대한 정당한 보상’을 제대로 매기지 못하고, 그 결과 사회적으로 필요한 만큼의 창작이 이뤄지지 않는 과소공급, 즉 ‘시장실패’가 일어난다.

규모를 보자. 한국콘텐츠진흥원 『2024 웹툰산업 실태조사』에 따르면 2023년 웹툰 불법복제 피해규모는 약 4,465억 원으로 추산됐다. 1년 전인 2022년의 3,932억 원보다 늘었다. 산업 자체는 2023년 매출 2조 1,890억 원 규모로 성장했지만, 그 성장의 그늘에서 4천억 원대의 가치가 창작 생태계 밖으로 새고 있다는 뜻이다.

이 손실을 사람의 단위로 바꾸면 감이 더 온다. 4,465억 원은 웹툰 작가 1인의 연평균 소득(약 8,540만 원, 2023 기준)으로 환산하면 대략 작가 5,200명의 1년 벌이에 해당한다. 아래 카운터는 이 연간 피해액을 초 단위로 환산해, 당신이 이 글을 읽는 동안에도 손실이 쌓이고 있음을 보여준다. 정밀 실측이 아니라 공개 통계에 근거한 ‘추정’임을 분명히 밝힌다.

외부효과로 인한 시장실패는 보통 세금·규제 같은 외부 개입으로 교정한다. 하지만 웹툰에는 더 직접적인 해법이 있다. 불법으로 새는 열람을 합법 통로로 되돌리는 것. 그것은 규제가 아니라 ‘선택의 마찰을 줄이는 설계’로도 가능하다(→ 5편).', '7분', true, now())
on conflict (slug) do nothing;
insert into public.articles (slug, category, concept, title_ko, excerpt_ko, body_ko, read_time, is_published, published_at)
values ('behavioral-nudge-friction', '행동경제', '행동경제 · 현재편향 · 마찰 · 선택설계', '왜 알면서도 불법을 볼까 — 넛지의 경제학', '사람들이 불법을 보는 건 대개 도덕의 문제가 아니라 ‘마찰’과 현재편향 탓이다. 마찰을 줄이면 선택이 바뀐다 — 그래서 우리는 이 도구를 만들었다.', '설문을 보면 사람들이 불법 웹툰을 보는 가장 큰 이유는 ‘죄책감이 없어서’가 아니다. 2023년 조사에서 불법 이용의 가장 큰 이유는 ‘비용 부담(약 32.8%)’이었고, ‘콘텐츠에 가치를 못 느껴서’는 12.2%에 그쳤다(한국콘텐츠진흥원). 대부분은 합법이 옳다는 걸 알면서도 불법을 택한다. 왜일까?

행동경제학은 두 가지를 지목한다. 첫째, ‘현재편향’. 사람은 지금 당장의 편익을 미래의 비용보다 과대평가한다. ‘지금 공짜로 바로 보기’의 유혹은, ‘나중에 창작 생태계가 무너진다’는 먼 비용을 쉽게 이긴다. 둘째, ‘마찰(friction)’. 합법으로 보려면 어느 플랫폼에 있는지 찾고, 앱을 깔고, 결제 수단을 등록해야 한다. 반면 불법 사이트는 검색 한 번이면 끝이다. 이 작은 마찰의 차이가 선택을 가른다.

여기서 리처드 세일러와 캐스 선스타인의 ‘넛지(nudge)’ 개념이 등장한다. 강제하거나 금지하지 않고, 선택의 환경을 살짝 바꿔 더 나은 선택으로 유도하는 설계다. 핵심 통찰은 명료하다. 사람을 탓하지 말고, 선택의 구조를 바꿔라. 불법이 이기는 이유가 ‘더 쉬워서’라면, 합법을 그만큼 쉽게 만들면 된다.

그래서 우리는 ‘검색 패스스루’를 만들었다. 작품 이름만 넣으면 네이버웹툰·카카오페이지·리디 등 합법 플랫폼의 검색 결과로 곧장 보내주는 장치다. 카탈로그를 일일이 관리하지 않고도, 합법으로 가는 마찰을 불법 수준까지 낮추는 것이 목표다. 이것은 계몽이 아니라 설계다 — 옳은 선택을 설교하는 대신, 옳은 선택을 가장 쉬운 선택으로 만든다.

이 프로젝트 자체가 하나의 작은 행동경제학 실험이다. ‘마찰을 줄이면 사람들이 정말 합법으로 옮겨갈까?’ 우리는 그 가설을 믿고 도구를 만들었고, 클릭 데이터로 검증해 나갈 것이다. 인식(왜 합법이어야 하나)에서 행동(그럼 여기서 바로)으로 — 그 다리를 놓는 일이 페어툰이 하려는 전부다.', '8분', true, now())
on conflict (slug) do nothing;
insert into public.articles (slug, category, concept, title_ko, excerpt_ko, body_ko, read_time, is_published, published_at)
values ('korea-webtoon-by-numbers', '데이터', '종합 · 데이터 리터러시', '숫자로 보는 한국 웹툰', '산업 규모 2.19조, 불법 피해 4,465억, 불법 이용률 20.4%… 한국 웹툰 생태계를 한 페이지 대시보드로.', null, '4분', true, now())
on conflict (slug) do nothing;


-- ---------- safety_cards ----------
-- (1) 위협 카드 3장 · 공통
insert into public.safety_cards (device, icon, title_ko, body_ko, sort)
select '공통', '⚠', '멀웨어 광고(멀버타이징)', '불법 사이트의 광고 네트워크는 페이지를 여는 것만으로 악성코드를 심는 코드를 실행할 수 있습니다. 클릭하지 않아도 노출됩니다.', 0
where not exists (select 1 from public.safety_cards where device = '공통' and title_ko = '멀웨어 광고(멀버타이징)');
insert into public.safety_cards (device, icon, title_ko, body_ko, sort)
select '공통', '⟳', '가짜 ‘업데이트 하세요’ 팝업', '영상 플레이어가 오래됐다며 설치를 유도하는 팝업. 문제는 당신의 플레이어가 아니라 그 다운로드 파일 자체입니다.', 1
where not exists (select 1 from public.safety_cards where device = '공통' and title_ko = '가짜 ‘업데이트 하세요’ 팝업');
insert into public.safety_cards (device, icon, title_ko, body_ko, sort)
select '공통', '🔔', '알림 권한 악용', '알림을 한 번 허용하면, 탭을 닫은 뒤에도 잠금화면으로 위장 광고가 계속 날아올 수 있습니다.', 2
where not exists (select 1 from public.safety_cards where device = '공통' and title_ko = '알림 권한 악용');

-- (2) 기기별 점검 체크리스트 / 감염 의심 시 조치 — 항목은 줄바꿈 구분
insert into public.safety_cards (device, icon, title_ko, body_ko, sort)
select 'iphone', '✅', '아이폰 점검 체크리스트', '- 설정 > 알림에서 모르는 사이트의 알림을 끕니다
- 설정 > Safari > 고급 > 웹사이트 데이터에서 낯선 항목을 지웁니다
- 설정 > 일반 > VPN 및 기기 관리에서 모르는 프로파일을 삭제합니다
- Safari의 ‘가짜 웹사이트 경고’가 켜져 있는지 확인합니다
- iOS를 최신 버전으로 유지합니다', 10
where not exists (select 1 from public.safety_cards where device = 'iphone' and title_ko = '아이폰 점검 체크리스트');
insert into public.safety_cards (device, icon, title_ko, body_ko, sort)
select 'iphone', '🛟', '아이폰 감염 의심 시 조치', '- 설정 > 알림에서 해당 사이트의 권한을 즉시 제거합니다.
- 설정 > 일반 > VPN 및 기기 관리에서 모르는 구성 프로파일을 삭제합니다.
- 설정 > Safari에서 최근 방문 기록·데이터를 지웁니다.
- 비슷한 시기에 로그인한 계정(이메일부터)의 비밀번호를 바꿉니다.
- ‘플레이어 업데이트’ 파일을 받았다면 열지 말고 삭제 후 재부팅합니다.', 20
where not exists (select 1 from public.safety_cards where device = 'iphone' and title_ko = '아이폰 감염 의심 시 조치');
insert into public.safety_cards (device, icon, title_ko, body_ko, sort)
select 'android', '✅', '갤럭시 점검 체크리스트', '- 설정 > 애플리케이션에서 설치한 기억이 없는 앱을 확인합니다
- Chrome > 설정 > 사이트 설정 > 알림에서 모르는 사이트를 제거합니다
- Google Play 프로텍트를 켜고 검사를 실행합니다
- Play 스토어 외부의 APK 설치를 피합니다
- 특수 접근 권한(다른 앱 위에 표시 등)을 점검합니다', 11
where not exists (select 1 from public.safety_cards where device = 'android' and title_ko = '갤럭시 점검 체크리스트');
insert into public.safety_cards (device, icon, title_ko, body_ko, sort)
select 'android', '🛟', '갤럭시 감염 의심 시 조치', '- 설정 > 애플리케이션에서 방문 직후 설치된 낯선 앱을 삭제합니다.
- Play 프로텍트로 검사를 실행합니다.
- 특수 접근 권한에서 모르는 앱의 알림 접근을 해제합니다.
- Chrome 사이트 설정에서 해당 도메인의 데이터를 지웁니다.
- 사이트에서 입력한 적 있는 계정 비밀번호를 변경합니다.', 21
where not exists (select 1 from public.safety_cards where device = 'android' and title_ko = '갤럭시 감염 의심 시 조치');
insert into public.safety_cards (device, icon, title_ko, body_ko, sort)
select 'mac', '✅', '맥북 점검 체크리스트', '- 시스템 설정 > 알림에서 낯선 항목을 확인합니다
- 시스템 설정 > 일반 > 로그인 항목에서 모르는 자동 실행을 제거합니다
- 브라우저 확장 프로그램 중 설치한 적 없는 것을 삭제합니다
- 개인정보 보호 및 보안 > 프로파일의 미확인 항목을 삭제합니다
- macOS와 브라우저를 최신으로 유지합니다', 12
where not exists (select 1 from public.safety_cards where device = 'mac' and title_ko = '맥북 점검 체크리스트');
insert into public.safety_cards (device, icon, title_ko, body_ko, sort)
select 'mac', '🛟', '맥북 감염 의심 시 조치', '- 브라우저 확장에서 낯선 항목을 제거합니다.
- 시스템 설정 > 로그인 항목에서 모르는 자동 실행을 삭제합니다.
- 프로파일 항목 중 직접 설치하지 않은 것을 삭제합니다.
- Mac을 재부팅해 내장 보호기능이 새 파일을 재검사하게 합니다.
- 방문 전후 사용한 계정의 비밀번호를 바꿉니다.', 22
where not exists (select 1 from public.safety_cards where device = 'mac' and title_ko = '맥북 감염 의심 시 조치');
insert into public.safety_cards (device, icon, title_ko, body_ko, sort)
select 'windows', '✅', '윈도우 점검 체크리스트', '- 설정 > 앱에서 낯선 프로그램을 확인합니다
- 작업 관리자 > 시작 프로그램에서 새 항목을 점검합니다
- Windows 보안의 실시간 보호가 켜져 있는지 확인합니다
- 브라우저 알림 설정에서 모르는 사이트를 제거합니다
- 스트리밍·불법 페이지에서 받은 .exe 실행을 피합니다', 13
where not exists (select 1 from public.safety_cards where device = 'windows' and title_ko = '윈도우 점검 체크리스트');
insert into public.safety_cards (device, icon, title_ko, body_ko, sort)
select 'windows', '🛟', '윈도우 감염 의심 시 조치', '- 설정 > 앱에서 최근 설치된 낯선 프로그램을 제거합니다.
- 작업 관리자 > 시작 프로그램에서 모르는 항목을 비활성화합니다.
- Windows 보안으로 전체 검사를 실행합니다.
- 낯선 확장을 제거하고 해당 도메인의 사이트 데이터를 지웁니다.
- 방문 전후 사용한 계정(이메일부터) 비밀번호를 변경합니다.', 23
where not exists (select 1 from public.safety_cards where device = 'windows' and title_ko = '윈도우 감염 의심 시 조치');


-- ---------- 확인용 ----------
select 'platforms' as t, count(*) from public.platforms
union all select 'works', count(*) from public.works
union all select 'work_legal_links', count(*) from public.work_legal_links
union all select 'articles', count(*) from public.articles
union all select 'safety_cards', count(*) from public.safety_cards;
