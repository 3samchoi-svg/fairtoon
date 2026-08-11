-- ============================================================
-- Fairtoon · 플랫폼 검색 URL 실측 반영 (P4)
-- 2026-08-02 실제 브라우저로 5개 플랫폼 검색 주소를 검증한 결과.
-- 실행: SQL Editor 에서 Run (여러 번 실행해도 안전)
-- ============================================================

-- 카카오페이지: 기존 /search?keyword= 는 홈으로 리다이렉트되어 검색이 되지 않음.
--               실제 동작 경로는 /search/result?keyword= 로 확인됨.
update public.platforms
   set search_url_pattern = 'https://page.kakao.com/search/result?keyword={q}'
 where key = 'kakaopage';

-- 검증 기록(2026-08-02, 검색어 "미생")
--   naver        https://comic.naver.com/search?keyword={q}          정상 (검색 결과 페이지)
--   kakaopage    https://page.kakao.com/search/result?keyword={q}    정상 (수정 반영분)
--   kakaowebtoon https://webtoon.kakao.com/search?keyword={q}        정상
--   ridi         https://ridibooks.com/search?q={q}                  봇 차단으로 자동 확인 불가 · 표준 경로 유지
--   lezhin       https://www.lezhin.com/ko/search?q={q}              정상 (내부적으로 t=all 붙은 주소로 이동)

select key, search_url_pattern from public.platforms order by sort;
