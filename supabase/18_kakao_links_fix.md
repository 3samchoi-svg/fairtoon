-- ============================================================
-- Fairtoon · 카카오웹툰 링크 정정 — 검색 페이지 → 작품 페이지 59편
-- 2026-08-15 대표님 지적. 카드를 눌러도 카카오웹툰 검색 결과로만 가고
-- 연재 페이지로 들어가지 않던 문제다.
--
--   원인: 작품 페이지가 외부 요청에 403이라 수집 당시 검색 주소로 낮춰 뒀다.
--   해결: 카카오웹툰 자체 검색 API(gateway-kw.kakao.com/search/v2/content)가
--         contentId·seoId를 그대로 준다. 59편 전부 제목·작가명 완전일치로 확인했고,
--         무작위 6편을 실제 브라우저로 열어 200 + 작품 페이지 렌더까지 검증했다.
--
--   대상: work_legal_links 중 platform_key='kakaowebtoon' 이면서 url이 /search 인 59행.
--         네이버 2,776행·카카오페이지 43행에는 검색 주소가 없다(전수 확인).
--
--   실행: SQL Editor 에서 Run. 여러 번 실행해도 안전하다(같은 값으로 덮어쓴다).
--   ※ 단일 문장 CTE. Supabase SQL Editor에서 임시테이블은 쓰지 않는다.
-- ============================================================

with fix(link_id, title, url) as (values
(864,'24분의 1 로맨스','https://webtoon.kakao.com/content/24%EB%B6%84%EC%9D%98-1-%EB%A1%9C%EB%A7%A8%EC%8A%A4/2650'),
(893,'99대장','https://webtoon.kakao.com/content/99%EB%8C%80%EC%9E%A5/3862'),
(878,'DELETE','https://webtoon.kakao.com/content/DELETE/3717'),
(909,'RAINBOW','https://webtoon.kakao.com/content/RAINBOW/4122'),
(907,'S급 집사','https://webtoon.kakao.com/content/S%EA%B8%89-%EC%A7%91%EC%82%AC/4580'),
(901,'가드패스','https://webtoon.kakao.com/content/%EA%B0%80%EB%93%9C%ED%8C%A8%EC%8A%A4/2511'),
(863,'감정사는 조회수로 레벨업한다','https://webtoon.kakao.com/content/%EA%B0%90%EC%A0%95%EC%82%AC%EB%8A%94-%EC%A1%B0%ED%9A%8C%EC%88%98%EB%A1%9C-%EB%A0%88%EB%B2%A8%EC%97%85%ED%95%9C%EB%8B%A4/3659'),
(868,'거인의 꽃','https://webtoon.kakao.com/content/%EA%B1%B0%EC%9D%B8%EC%9D%98-%EA%BD%83/4344'),
(876,'검은 머리 아빠는 거두는 게 아니다','https://webtoon.kakao.com/content/%EA%B2%80%EC%9D%80-%EB%A8%B8%EB%A6%AC-%EC%95%84%EB%B9%A0%EB%8A%94-%EA%B1%B0%EB%91%90%EB%8A%94-%EA%B2%8C-%EC%95%84%EB%8B%88%EB%8B%A4/4599'),
(860,'괴력 영애는 연약해지고 싶어','https://webtoon.kakao.com/content/%EA%B4%B4%EB%A0%A5-%EC%98%81%EC%95%A0%EB%8A%94-%EC%97%B0%EC%95%BD%ED%95%B4%EC%A7%80%EA%B3%A0-%EC%8B%B6%EC%96%B4/4650'),
(895,'귀짤 로맨스','https://webtoon.kakao.com/content/%EA%B7%80%EC%A7%A4-%EB%A1%9C%EB%A7%A8%EC%8A%A4/3371'),
(877,'그녀의 해피엔딩 공략기','https://webtoon.kakao.com/content/%EA%B7%B8%EB%85%80%EC%9D%98-%ED%95%B4%ED%94%BC%EC%97%94%EB%94%A9-%EA%B3%B5%EB%9E%B5%EA%B8%B0/4553'),
(899,'극락왕생','https://webtoon.kakao.com/content/%EA%B7%B9%EB%9D%BD%EC%99%95%EC%83%9D/2680'),
(871,'기간한정 대리결혼이지만 씩씩합니다','https://webtoon.kakao.com/content/%EA%B8%B0%EA%B0%84%ED%95%9C%EC%A0%95-%EB%8C%80%EB%A6%AC%EA%B2%B0%ED%98%BC%EC%9D%B4%EC%A7%80%EB%A7%8C-%EC%94%A9%EC%94%A9%ED%95%A9%EB%8B%88%EB%8B%A4/4873'),
(887,'나를 죽인 황제의 딸로 살아남는 방법','https://webtoon.kakao.com/content/%EB%82%98%EB%A5%BC-%EC%A3%BD%EC%9D%B8-%ED%99%A9%EC%A0%9C%EC%9D%98-%EB%94%B8%EB%A1%9C-%EC%82%B4%EC%95%84%EB%82%A8%EB%8A%94-%EB%B0%A9%EB%B2%95/4589'),
(903,'내가 버린 개에게 물렸을 때','https://webtoon.kakao.com/content/%EB%82%B4%EA%B0%80-%EB%B2%84%EB%A6%B0-%EA%B0%9C%EC%97%90%EA%B2%8C-%EB%AC%BC%EB%A0%B8%EC%9D%84-%EB%95%8C/3800'),
(872,'냉혈','https://webtoon.kakao.com/content/%EB%83%89%ED%98%88/3929'),
(873,'당골의 신부','https://webtoon.kakao.com/content/%EB%8B%B9%EA%B3%A8%EC%9D%98-%EC%8B%A0%EB%B6%80/3228'),
(896,'대표님과 위장 가족이 되었습니다','https://webtoon.kakao.com/content/%EB%8C%80%ED%91%9C%EB%8B%98%EA%B3%BC-%EC%9C%84%EC%9E%A5-%EA%B0%80%EC%A1%B1%EC%9D%B4-%EB%90%98%EC%97%88%EC%8A%B5%EB%8B%88%EB%8B%A4/4116'),
(866,'더 챌린저','https://webtoon.kakao.com/content/%EB%8D%94-%EC%B1%8C%EB%A6%B0%EC%A0%80/2536'),
(856,'덕혜옹주를 도와줘','https://webtoon.kakao.com/content/%EB%8D%95%ED%98%9C%EC%98%B9%EC%A3%BC%EB%A5%BC-%EB%8F%84%EC%99%80%EC%A4%98/4918'),
(898,'도사 아카데미 무위관','https://webtoon.kakao.com/content/%EB%8F%84%EC%82%AC-%EC%95%84%EC%B9%B4%EB%8D%B0%EB%AF%B8-%EB%AC%B4%EC%9C%84%EA%B4%80/3850'),
(912,'디어 마이 파라다이스','https://webtoon.kakao.com/content/%EB%94%94%EC%96%B4-%EB%A7%88%EC%9D%B4-%ED%8C%8C%EB%9D%BC%EB%8B%A4%EC%9D%B4%EC%8A%A4/4278'),
(884,'레드스톰 - 왕의 귀환','https://webtoon.kakao.com/content/%EB%A0%88%EB%93%9C%EC%8A%A4%ED%86%B0---%EC%99%95%EC%9D%98-%EA%B7%80%ED%99%98/823'),
(858,'마교일진','https://webtoon.kakao.com/content/%EB%A7%88%EA%B5%90%EC%9D%BC%EC%A7%84/4481'),
(886,'먼지 덩어리 짱덕','https://webtoon.kakao.com/content/%EB%A8%BC%EC%A7%80-%EB%8D%A9%EC%96%B4%EB%A6%AC-%EC%A7%B1%EB%8D%95/4288'),
(910,'멍냥패밀리','https://webtoon.kakao.com/content/%EB%A9%8D%EB%83%A5%ED%8C%A8%EB%B0%80%EB%A6%AC/4621'),
(905,'무색의 빛','https://webtoon.kakao.com/content/%EB%AC%B4%EC%83%89%EC%9D%98-%EB%B9%9B/4732'),
(883,'무장 - 무투전','https://webtoon.kakao.com/content/%EB%AC%B4%EC%9E%A5---%EB%AC%B4%ED%88%AC%EC%A0%84/4064'),
(906,'미대괴담','https://webtoon.kakao.com/content/%EB%AF%B8%EB%8C%80%EA%B4%B4%EB%8B%B4/4604'),
(904,'바퀴벌레 잔혹사','https://webtoon.kakao.com/content/%EB%B0%94%ED%80%B4%EB%B2%8C%EB%A0%88-%EC%9E%94%ED%98%B9%EC%82%AC/4602'),
(879,'반지하셋방','https://webtoon.kakao.com/content/%EB%B0%98%EC%A7%80%ED%95%98%EC%85%8B%EB%B0%A9/1347'),
(890,'백일의 나홍이','https://webtoon.kakao.com/content/%EB%B0%B1%EC%9D%BC%EC%9D%98-%EB%82%98%ED%99%8D%EC%9D%B4/4908'),
(894,'붉은 달밤의 끝자락에서','https://webtoon.kakao.com/content/%EB%B6%89%EC%9D%80-%EB%8B%AC%EB%B0%A4%EC%9D%98-%EB%81%9D%EC%9E%90%EB%9D%BD%EC%97%90%EC%84%9C/4695'),
(892,'블러드레인 제로','https://webtoon.kakao.com/content/%EB%B8%94%EB%9F%AC%EB%93%9C%EB%A0%88%EC%9D%B8-%EC%A0%9C%EB%A1%9C/4690'),
(891,'비엘로 빌런 탈출','https://webtoon.kakao.com/content/%EB%B9%84%EC%97%98%EB%A1%9C-%EB%B9%8C%EB%9F%B0-%ED%83%88%EC%B6%9C/4899'),
(900,'샤이닝 썸머','https://webtoon.kakao.com/content/%EC%83%A4%EC%9D%B4%EB%8B%9D-%EC%8D%B8%EB%A8%B8/3749'),
(880,'샤크','https://webtoon.kakao.com/content/%EC%83%A4%ED%81%AC/2308'),
(867,'세자, 죽이기','https://webtoon.kakao.com/content/%EC%84%B8%EC%9E%90-%EC%A3%BD%EC%9D%B4%EA%B8%B0/4629'),
(902,'슬프게도 이게 내 인생','https://webtoon.kakao.com/content/%EC%8A%AC%ED%94%84%EA%B2%8C%EB%8F%84-%EC%9D%B4%EA%B2%8C-%EB%82%B4-%EC%9D%B8%EC%83%9D/1575'),
(889,'아무튼 로판 맞습니다','https://webtoon.kakao.com/content/%EC%95%84%EB%AC%B4%ED%8A%BC-%EB%A1%9C%ED%8C%90-%EB%A7%9E%EC%8A%B5%EB%8B%88%EB%8B%A4/4834'),
(908,'어느 날 남주가 우리 집에 떨어졌다','https://webtoon.kakao.com/content/%EC%96%B4%EB%8A%90-%EB%82%A0-%EB%82%A8%EC%A3%BC%EA%B0%80-%EC%9A%B0%EB%A6%AC-%EC%A7%91%EC%97%90-%EB%96%A8%EC%96%B4%EC%A1%8C%EB%8B%A4/4893'),
(855,'연하남편의 미래를 위해 이혼장을 두고 나간 결과','https://webtoon.kakao.com/content/%EC%97%B0%ED%95%98%EB%82%A8%ED%8E%B8%EC%9D%98-%EB%AF%B8%EB%9E%98%EB%A5%BC-%EC%9C%84%ED%95%B4-%EC%9D%B4%ED%98%BC%EC%9E%A5%EC%9D%84-%EB%91%90%EA%B3%A0-%EB%82%98%EA%B0%84-%EA%B2%B0%EA%B3%BC/4746'),
(875,'연하는 욕구불만 [15세 개정판]','https://webtoon.kakao.com/content/%EC%97%B0%ED%95%98%EB%8A%94-%EC%9A%95%EA%B5%AC%EB%B6%88%EB%A7%8C15%EC%84%B8-%EA%B0%9C%EC%A0%95%ED%8C%90/4170'),
(897,'위아영','https://webtoon.kakao.com/content/%EC%9C%84%EC%95%84%EC%98%81/4229'),
(882,'유니유니툰','https://webtoon.kakao.com/content/%EC%9C%A0%EB%8B%88%EC%9C%A0%EB%8B%88%ED%88%B0/4624'),
(874,'이세계 덤프트럭','https://webtoon.kakao.com/content/%EC%9D%B4%EC%84%B8%EA%B3%84-%EB%8D%A4%ED%94%84%ED%8A%B8%EB%9F%AD/3479'),
(869,'인생이 레몬을 건네면 위스키를 더하라','https://webtoon.kakao.com/content/%EC%9D%B8%EC%83%9D%EC%9D%B4-%EB%A0%88%EB%AA%AC%EC%9D%84-%EA%B1%B4%EB%84%A4%EB%A9%B4-%EC%9C%84%EC%8A%A4%ED%82%A4%EB%A5%BC-%EB%8D%94%ED%95%98%EB%9D%BC/4780'),
(861,'일보신권','https://webtoon.kakao.com/content/%EC%9D%BC%EB%B3%B4%EC%8B%A0%EA%B6%8C/4220'),
(881,'재워주는 사이','https://webtoon.kakao.com/content/%EC%9E%AC%EC%9B%8C%EC%A3%BC%EB%8A%94-%EC%82%AC%EC%9D%B4/2986'),
(870,'제목이 보이는데요','https://webtoon.kakao.com/content/%EC%A0%9C%EB%AA%A9%EC%9D%B4-%EB%B3%B4%EC%9D%B4%EB%8A%94%EB%8D%B0%EC%9A%94/4702'),
(859,'존버닥터: 닥터 섬보이','https://webtoon.kakao.com/content/%EC%A1%B4%EB%B2%84%EB%8B%A5%ED%84%B0-%EB%8B%A5%ED%84%B0-%EC%84%AC%EB%B3%B4%EC%9D%B4/3813'),
(911,'진짜 x됐다.','https://webtoon.kakao.com/content/%EC%A7%84%EC%A7%9C-x%EB%90%90%EB%8B%A4./4535'),
(885,'칠흑이 삼킨 여름','https://webtoon.kakao.com/content/%EC%B9%A0%ED%9D%91%EC%9D%B4-%EC%82%BC%ED%82%A8-%EC%97%AC%EB%A6%84/4500'),
(865,'퀴퀴한 일기','https://webtoon.kakao.com/content/%ED%80%B4%ED%80%B4%ED%95%9C-%EC%9D%BC%EA%B8%B0/1295'),
(913,'플렉스(FLEX)','https://webtoon.kakao.com/content/%ED%94%8C%EB%A0%89%EC%8A%A4FLEX/3584'),
(888,'하백의 신부 2','https://webtoon.kakao.com/content/%ED%95%98%EB%B0%B1%EC%9D%98-%EC%8B%A0%EB%B6%80-2/4680'),
(857,'홍택의 반격','https://webtoon.kakao.com/content/%ED%99%8D%ED%83%9D%EC%9D%98-%EB%B0%98%EA%B2%A9/4239'),
(862,'환생보스','https://webtoon.kakao.com/content/%ED%99%98%EC%83%9D%EB%B3%B4%EC%8A%A4/3788')
)
update public.work_legal_links l
   set url = f.url
  from fix f
 where l.id = f.link_id
   and l.platform_key = 'kakaowebtoon';


-- 확인용 ① 검색 주소가 남아 있으면 0이 아니다 (기대값 0)
select count(*) as remaining_search_urls
  from public.work_legal_links
 where platform_key = 'kakaowebtoon' and url like '%/search%';

-- 확인용 ② 정정된 59편 목록
select w.title_ko, l.url
  from public.work_legal_links l join public.works w on w.id = l.work_id
 where l.platform_key = 'kakaowebtoon' and l.url like '%/content/%'
 order by w.title_ko;
