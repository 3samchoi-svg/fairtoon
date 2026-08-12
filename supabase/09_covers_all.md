-- ------------------------------------------------------------
-- 09) 큐레이션 50편 전체 · 표지 이미지 + 작품 딥링크 적용
--     작성 2026-08-11 · 근거: docs/표지이미지_처리방안.md 7절 루트 2
--
--     08_covers_top5.sql을 대체한다(상위 5편 포함, 이 파일 하나만 실행하면 된다).
--     표지는 각 플랫폼이 공유·목록용으로 배포하는 이미지를 참조만 한다. 서버 복제 없음.
--     50편 전부 2026-08-11 기준 200 정상 응답을 확인했다.
--
--     ※ 철회는 맨 아래 스크립트 한 번이면 된다. cover_url이 비면 장르 커버로 자동 폴백.
-- ------------------------------------------------------------

begin;

-- 1) 표지 이미지
update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/818/sharing/2x/eacb00ec-9034-42cb-a533-7c7690741113.jpg'
  where title_ko = '미생';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/697685/thumbnail/thumbnail_IMAG21_7220736075942344240.jpg'
  where title_ko = '신과함께';
update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/67/sharing/2x/eacb00ec-9034-42cb-a533-7c7690741113.jpg'
  where title_ko = '이끼';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/720121/thumbnail/thumbnail_IMAG21_7221302526240580196.jpg'
  where title_ko = '치즈인더트랩';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/651673/thumbnail/thumbnail_IMAG21_fba9683b-260e-4a07-984c-deda6d87f62d.jpg'
  where title_ko = '유미의 세포들';
update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/762/sharing/2x/eacb00ec-9034-42cb-a533-7c7690741113.jpg'
  where title_ko = '조명가게';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/25455/thumbnail/thumbnail_IMAG21_4122592688643585123.jpg'
  where title_ko = '노블레스';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/697681/thumbnail/thumbnail_IMAG21_3905576580996674097.jpg'
  where title_ko = '목욕의 신';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/20853/thumbnail/thumbnail_IMAG21_a715d0bd-fe55-4658-a573-669e0c0261f6.jpg'
  where title_ko = '마음의 소리';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/628998/thumbnail/thumbnail_IMAG21_3544673975281137465.jpg'
  where title_ko = '데드데이즈';
update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/1047/sharing/2x/eacb00ec-9034-42cb-a533-7c7690741113.jpg'
  where title_ko = '트레이스';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/703846/thumbnail/thumbnail_IMAG21_3617626786448291892.jpg'
  where title_ko = '여신강림';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/318995/thumbnail/thumbnail_IMAG21_38f18e00-09f2-4a0c-b36a-3aa56dfe0b3b.jpg'
  where title_ko = '갓 오브 하이스쿨';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/701081/thumbnail/thumbnail_IMAG21_3761692268951647077.jpg'
  where title_ko = '스위트홈';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/730465/thumbnail/thumbnail_IMAG21_3558515947031770930.jpg'
  where title_ko = '지옥';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/602922/thumbnail/thumbnail_IMAG21_3774353369472250470.jpg'
  where title_ko = '송곳';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/715772/thumbnail/thumbnail_IMAG21_3847820352753578853.jpg'
  where title_ko = '좀비딸';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/325629/thumbnail/thumbnail_IMAG21_7233964317446005042.jpg'
  where title_ko = '패션왕';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/570503/thumbnail/thumbnail_IMAG21_7b907ee6-a61e-495b-9b8f-be2f0a4be44b.jpeg'
  where title_ko = '연애혁명';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/389848/thumbnail/thumbnail_IMAG21_3631362767026742836.JPEG'
  where title_ko = '헬퍼';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/119874/thumbnail/thumbnail_IMAG21_3762587498966376754.jpg'
  where title_ko = '덴마';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/609480/thumbnail/thumbnail_IMAG21_4049638099174778162.jpg'
  where title_ko = '하이브';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/703845/thumbnail/thumbnail_IMAG21_4120902941892752226.JPEG'
  where title_ko = '죽음에 관하여';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/679519/thumbnail/thumbnail_IMAG21_3559076483126814265.jpg'
  where title_ko = '대학일기';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/654774/thumbnail/thumbnail_IMAG21_1209b520-bcd9-4031-b76f-bc8a7f5527fd.jpg'
  where title_ko = '소녀의 세계';
update public.works set cover_url = 'https://dn-img-page.kakao.com/download/resource?kid=cNSdtk/hybOLo9cJO/5Hi9hPHwRwXeMCKKqT8oMk&filename=th3'
  where title_ko = '아 지갑놓고 나왔다';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/81482/thumbnail/thumbnail_IMAG21_3702579259720938341.jpg'
  where title_ko = '놓지마 정신줄';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/608261/thumbnail/thumbnail_IMAG21_c158a14d-1efc-4738-bccc-31e5d1ca50b1.jpg'
  where title_ko = '심연의 하늘';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/683496/thumbnail/thumbnail_IMAG21_7365463893838160438.jpg'
  where title_ko = '신도림';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/702608/thumbnail/thumbnail_IMAG21_7005692479348499809.jpg'
  where title_ko = '랜덤채팅의 그녀!';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/626907/thumbnail/thumbnail_IMAG21_7077799770473063780.jpg'
  where title_ko = '복학왕';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/183559/thumbnail/thumbnail_IMAG21_5f3fec31-5c95-4afe-a73f-3046288edb47.jpg'
  where title_ko = '신의 탑';
update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/1338/sharing/2x/eacb00ec-9034-42cb-a533-7c7690741113.jpg'
  where title_ko = '이태원 클라쓰';
update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/529/sharing/2x/eacb00ec-9034-42cb-a533-7c7690741113.jpg'
  where title_ko = '은밀하게 위대하게';
update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/4/sharing/2x/eacb00ec-9034-42cb-a533-7c7690741113.jpg'
  where title_ko = '순정만화';
update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/35/sharing/2x/eacb00ec-9034-42cb-a533-7c7690741113.jpg'
  where title_ko = '그대를 사랑합니다';
update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/13/sharing/2x/eacb00ec-9034-42cb-a533-7c7690741113.jpg'
  where title_ko = '타이밍';
update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/21/sharing/2x/eacb00ec-9034-42cb-a533-7c7690741113.jpg'
  where title_ko = '26년';
update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/6/sharing/2x/eacb00ec-9034-42cb-a533-7c7690741113.jpg'
  where title_ko = '아파트';
update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/1183/sharing/2x/eacb00ec-9034-42cb-a533-7c7690741113.jpg'
  where title_ko = '무빙';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/693431/thumbnail/thumbnail_IMAG21_4121129229976418354.jpg'
  where title_ko = '계룡선녀전';
update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/1299/sharing/2x/f4e31eb4-bf63-48a1-9458-831bb66cebde.jpg'
  where title_ko = '쌍갑포차';
update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/1313/sharing/2x/eacb00ec-9034-42cb-a533-7c7690741113.jpg'
  where title_ko = '나빌레라';
update public.works set cover_url = 'https://shared-comic.pstatic.net/thumb/webtoon/703630/thumbnail/thumbnail_IMAG21_5501365b-0934-4683-b4a8-cc76ef1ec585.jpg'
  where title_ko = '어글리후드';
update public.works set cover_url = 'https://dn-img-page.kakao.com/download/resource?kid=Cf0LJ/hynaH4y8E5/l5Qk7VWfAsyYkE8yKmRFdk&filename=th3'
  where title_ko = '나 혼자만 레벨업';
update public.works set cover_url = 'https://dn-img-page.kakao.com/download/resource?kid=A6jNz/hAKLGUh1nQ/55NPDUdPluO3Kyi2clpnek&filename=th3'
  where title_ko = '사내맞선';
update public.works set cover_url = 'https://dn-img-page.kakao.com/download/resource?kid=bwPNJO/hymrftXeP0/VoUKJWehublPKZhKgletTK&filename=th3'
  where title_ko = '김비서가 왜 그럴까';
update public.works set cover_url = 'https://dn-img-page.kakao.com/download/resource?kid=bC9DPM/dJMcafMW4I4/kR0B2HMpIR4MYeGbBTtEAk&filename=th3'
  where title_ko = '템빨';
update public.works set cover_url = 'https://dn-img-page.kakao.com/download/resource?kid=fhAOt/hzmU1ucGko/dLPMISpdwGGfXNoF44MIW0&filename=th3'
  where title_ko = '황제의 외동딸';
update public.works set cover_url = 'https://dn-img-page.kakao.com/download/resource?kid=yP2j1/dJMcacuXqb7/sL8r3bkgsGHVzAIpO66JJ1&filename=th3'
  where title_ko = '악녀는 마리오네트';

-- 2) 작품 딥링크 (기존 대부분이 검색 URL이었다)
update public.work_legal_links l set url = 'https://webtoon.kakao.com/content/%EB%AF%B8%EC%83%9D/818'
  from public.works w where l.work_id = w.id and w.title_ko = '미생';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=697685'
  from public.works w where l.work_id = w.id and w.title_ko = '신과함께';
update public.work_legal_links l set url = 'https://webtoon.kakao.com/content/%EC%9D%B4%EB%81%BC/67'
  from public.works w where l.work_id = w.id and w.title_ko = '이끼';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=720121'
  from public.works w where l.work_id = w.id and w.title_ko = '치즈인더트랩';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=651673'
  from public.works w where l.work_id = w.id and w.title_ko = '유미의 세포들';
update public.work_legal_links l set url = 'https://webtoon.kakao.com/content/%EC%A1%B0%EB%AA%85%EA%B0%80%EA%B2%8C/762'
  from public.works w where l.work_id = w.id and w.title_ko = '조명가게';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=25455'
  from public.works w where l.work_id = w.id and w.title_ko = '노블레스';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=697681'
  from public.works w where l.work_id = w.id and w.title_ko = '목욕의 신';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=20853'
  from public.works w where l.work_id = w.id and w.title_ko = '마음의 소리';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=628998'
  from public.works w where l.work_id = w.id and w.title_ko = '데드데이즈';
update public.work_legal_links l set url = 'https://webtoon.kakao.com/content/%ED%8A%B8%EB%A0%88%EC%9D%B4%EC%8A%A4/1047'
  from public.works w where l.work_id = w.id and w.title_ko = '트레이스';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=703846'
  from public.works w where l.work_id = w.id and w.title_ko = '여신강림';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=318995'
  from public.works w where l.work_id = w.id and w.title_ko = '갓 오브 하이스쿨';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=701081'
  from public.works w where l.work_id = w.id and w.title_ko = '스위트홈';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=730465'
  from public.works w where l.work_id = w.id and w.title_ko = '지옥';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=602922'
  from public.works w where l.work_id = w.id and w.title_ko = '송곳';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=715772'
  from public.works w where l.work_id = w.id and w.title_ko = '좀비딸';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=325629'
  from public.works w where l.work_id = w.id and w.title_ko = '패션왕';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=570503'
  from public.works w where l.work_id = w.id and w.title_ko = '연애혁명';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=389848'
  from public.works w where l.work_id = w.id and w.title_ko = '헬퍼';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=119874'
  from public.works w where l.work_id = w.id and w.title_ko = '덴마';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=609480'
  from public.works w where l.work_id = w.id and w.title_ko = '하이브';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=703845'
  from public.works w where l.work_id = w.id and w.title_ko = '죽음에 관하여';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=679519'
  from public.works w where l.work_id = w.id and w.title_ko = '대학일기';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=654774'
  from public.works w where l.work_id = w.id and w.title_ko = '소녀의 세계';
update public.work_legal_links l set url = 'https://page.kakao.com/content/48019290'
  from public.works w where l.work_id = w.id and w.title_ko = '아 지갑놓고 나왔다';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=81482'
  from public.works w where l.work_id = w.id and w.title_ko = '놓지마 정신줄';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=608261'
  from public.works w where l.work_id = w.id and w.title_ko = '심연의 하늘';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=683496'
  from public.works w where l.work_id = w.id and w.title_ko = '신도림';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=702608'
  from public.works w where l.work_id = w.id and w.title_ko = '랜덤채팅의 그녀!';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=626907'
  from public.works w where l.work_id = w.id and w.title_ko = '복학왕';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=183559'
  from public.works w where l.work_id = w.id and w.title_ko = '신의 탑';
update public.work_legal_links l set url = 'https://webtoon.kakao.com/content/%EC%9D%B4%ED%83%9C%EC%9B%90-%ED%81%B4%EB%9D%BC%EC%93%B0/1338'
  from public.works w where l.work_id = w.id and w.title_ko = '이태원 클라쓰';
update public.work_legal_links l set url = 'https://webtoon.kakao.com/content/%EC%9D%80%EB%B0%80%ED%95%98%EA%B2%8C-%EC%9C%84%EB%8C%80%ED%95%98%EA%B2%8C/529'
  from public.works w where l.work_id = w.id and w.title_ko = '은밀하게 위대하게';
update public.work_legal_links l set url = 'https://webtoon.kakao.com/content/%EC%88%9C%EC%A0%95%EB%A7%8C%ED%99%94/4'
  from public.works w where l.work_id = w.id and w.title_ko = '순정만화';
update public.work_legal_links l set url = 'https://webtoon.kakao.com/content/%EA%B7%B8%EB%8C%80%EB%A5%BC-%EC%82%AC%EB%9E%91%ED%95%A9%EB%8B%88%EB%8B%A4/35'
  from public.works w where l.work_id = w.id and w.title_ko = '그대를 사랑합니다';
update public.work_legal_links l set url = 'https://webtoon.kakao.com/content/%ED%83%80%EC%9D%B4%EB%B0%8D/13'
  from public.works w where l.work_id = w.id and w.title_ko = '타이밍';
update public.work_legal_links l set url = 'https://webtoon.kakao.com/content/26%EB%85%84/21'
  from public.works w where l.work_id = w.id and w.title_ko = '26년';
update public.work_legal_links l set url = 'https://webtoon.kakao.com/content/%EC%95%84%ED%8C%8C%ED%8A%B8/6'
  from public.works w where l.work_id = w.id and w.title_ko = '아파트';
update public.work_legal_links l set url = 'https://webtoon.kakao.com/content/%EB%AC%B4%EB%B9%99/1183'
  from public.works w where l.work_id = w.id and w.title_ko = '무빙';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=693431'
  from public.works w where l.work_id = w.id and w.title_ko = '계룡선녀전';
update public.work_legal_links l set url = 'https://webtoon.kakao.com/content/%EC%8C%8D%EA%B0%91%ED%8F%AC%EC%B0%A8/1299'
  from public.works w where l.work_id = w.id and w.title_ko = '쌍갑포차';
update public.work_legal_links l set url = 'https://webtoon.kakao.com/content/%EB%82%98%EB%B9%8C%EB%A0%88%EB%9D%BC/1313'
  from public.works w where l.work_id = w.id and w.title_ko = '나빌레라';
update public.work_legal_links l set url = 'https://comic.naver.com/webtoon/list?titleId=703630'
  from public.works w where l.work_id = w.id and w.title_ko = '어글리후드';
update public.work_legal_links l set url = 'https://page.kakao.com/content/50866481'
  from public.works w where l.work_id = w.id and w.title_ko = '나 혼자만 레벨업';
update public.work_legal_links l set url = 'https://page.kakao.com/content/51477737'
  from public.works w where l.work_id = w.id and w.title_ko = '사내맞선';
update public.work_legal_links l set url = 'https://page.kakao.com/content/48704250'
  from public.works w where l.work_id = w.id and w.title_ko = '김비서가 왜 그럴까';
update public.work_legal_links l set url = 'https://page.kakao.com/content/54727849'
  from public.works w where l.work_id = w.id and w.title_ko = '템빨';
update public.work_legal_links l set url = 'https://page.kakao.com/content/47686939'
  from public.works w where l.work_id = w.id and w.title_ko = '황제의 외동딸';
update public.work_legal_links l set url = 'https://page.kakao.com/content/56422254'
  from public.works w where l.work_id = w.id and w.title_ko = '악녀는 마리오네트';

-- 3) 플랫폼 정정 — 실제 연재처를 확인한 결과 DB 값이 달랐다
update public.work_legal_links l set platform_key = 'naver'
  from public.works w where l.work_id = w.id and w.title_ko = '계룡선녀전';  -- kakaowebtoon → naver
update public.work_legal_links l set platform_key = 'naver'
  from public.works w where l.work_id = w.id and w.title_ko = '어글리후드';  -- kakaowebtoon → naver
update public.work_legal_links l set platform_key = 'kakaopage'
  from public.works w where l.work_id = w.id and w.title_ko = '아 지갑놓고 나왔다';  -- naver → kakaopage

commit;


-- 확인용
-- select w.sort, w.title_ko, l.platform_key, w.cover_url is not null as has_cover, l.url
--   from public.works w left join public.work_legal_links l on l.work_id = w.id order by w.sort;


-- ------------------------------------------------------------
-- 【철회 스크립트】 권리자 이의제기 시 이것만 실행하면 즉시 장르 커버로 돌아간다.
-- 딥링크·플랫폼 정정은 남겨둔다 — 표지와 무관하게 이용자에게 유익한 정보다.
-- ------------------------------------------------------------
-- update public.works set cover_url = null;

-- 특정 플랫폼만 내릴 때
-- update public.works w set cover_url = null
--   from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver';
