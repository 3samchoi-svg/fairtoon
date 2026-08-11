-- ============================================================
-- Fairtoon · 플랫폼 귀속 오류 수정 + 딥링크 반영 (P4)
-- 2026-08-02 대표님 지적으로 발견. 윤태호 작가의 두 작품은
-- 네이버웹툰이 아니라 다음 만화속세상(현 카카오웹툰) 연재작이다.
-- 실행: SQL Editor 에서 Run (여러 번 실행해도 안전)
-- ============================================================

-- ① 미생 — 카카오웹툰으로 정정 + 작품 딥링크 적용
update public.work_legal_links l
   set platform_key = 'kakaowebtoon',
       url = 'https://webtoon.kakao.com/content/%EB%AF%B8%EC%83%9D/818?tab=episode',
       price_tag = null
  from public.works w
 where l.work_id = w.id and w.title_ko = '미생';

-- ② 이끼 — 카카오웹툰으로 정정 (딥링크 미확보 → 검색 주소)
--    ※ 지호님 확인 부탁: 이끼도 다음 만화속세상 연재작으로 파악됩니다.
update public.work_legal_links l
   set platform_key = 'kakaowebtoon',
       url = 'https://webtoon.kakao.com/search?keyword=%EC%9D%B4%EB%81%BC',
       price_tag = null
  from public.works w
 where l.work_id = w.id and w.title_ko = '이끼';

-- 확인용
select w.title_ko, w.author, l.platform_key, l.url
  from public.works w join public.work_legal_links l on l.work_id = w.id
 where w.title_ko in ('미생','이끼');
