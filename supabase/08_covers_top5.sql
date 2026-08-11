-- ------------------------------------------------------------
-- 08) 인기 상위 5편 · 표지 이미지 + 작품 딥링크 적용
--     작성 2026-08-11 · 근거: docs/표지이미지_처리방안.md 7절 루트 2
--
--     플랫폼이 공유용으로 배포하는 og:image를 참조만 한다(우리 서버 복제 없음).
--     표지를 쓰는 작품은 검색 URL이 아니라 작품 페이지 딥링크를 반드시 갖는다.
--
--     ※ 권리자 이의제기 시 맨 아래 철회 스크립트 한 번이면 원상복구된다.
--       cover_url이 비면 프론트가 장르 커버로 자동 폴백한다(coverInner()).
-- ------------------------------------------------------------

begin;

-- 1) 표지 이미지 (og:image · 2026-08-11 수집)
update public.works set cover_url =
  'https://kr-a.kakaopagecdn.com/P/C/818/sharing/2x/eacb00ec-9034-42cb-a533-7c7690741113.jpg'
  where title_ko = '미생';
update public.works set cover_url =
  'https://shared-comic.pstatic.net/thumb/webtoon/697685/thumbnail/thumbnail_IMAG21_7220736075942344240.jpg'
  where title_ko = '신과함께';
update public.works set cover_url =
  'https://kr-a.kakaopagecdn.com/P/C/67/sharing/2x/eacb00ec-9034-42cb-a533-7c7690741113.jpg'
  where title_ko = '이끼';
update public.works set cover_url =
  'https://shared-comic.pstatic.net/thumb/webtoon/720121/thumbnail/thumbnail_IMAG21_7221302526240580196.jpg'
  where title_ko = '치즈인더트랩';
update public.works set cover_url =
  'https://shared-comic.pstatic.net/thumb/webtoon/651673/thumbnail/thumbnail_IMAG21_fba9683b-260e-4a07-984c-deda6d87f62d.jpg'
  where title_ko = '유미의 세포들';


-- 2) 작품 딥링크 (기존은 검색 URL이었다. 미생은 이미 딥링크라 제외)
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=697685'
  from public.works w where l.work_id = w.id and w.title_ko = '신과함께';
update public.work_legal_links l set url = 'https://webtoon.kakao.com/content/%EC%9D%B4%EB%81%BC/67'
  from public.works w where l.work_id = w.id and w.title_ko = '이끼';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=720121'
  from public.works w where l.work_id = w.id and w.title_ko = '치즈인더트랩';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=651673'
  from public.works w where l.work_id = w.id and w.title_ko = '유미의 세포들';

commit;


-- 확인용
-- select w.sort, w.title_ko, w.cover_url, l.platform_key, l.url
--   from public.works w left join public.work_legal_links l on l.work_id = w.id
--   where w.sort < 5 order by w.sort;


-- ------------------------------------------------------------
-- 【철회 스크립트】 권리자 이의제기 시 이것만 실행하면 즉시 장르 커버로 돌아간다.
-- 딥링크는 남겨둔다 — 표지와 무관하게 이용자에게 유익한 정보다.
-- ------------------------------------------------------------
-- update public.works set cover_url = null
--   where title_ko in ('미생','신과함께','이끼','치즈인더트랩','유미의 세포들');
