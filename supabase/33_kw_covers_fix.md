-- 33. 카카오웹툰 표지 8편 복구 — 화면에 표지가 뜨지 않던 것을 고친다.
--
-- 원인: scripts/sync_serial.py 가 카카오웹툰 표지 주소를 만들 때 공유이미지 UUID 하나를
--       모든 작품에 돌려 썼다. 그 UUID를 쓰는 25편 중 17편은 우연히 맞았고 8편이 404였다.
--       (같은 커밋에서 스크립트도 고쳐, 앞으로는 살아 있는 주소만 저장한다.)
-- 근거: 각 작품 페이지의 og:image. 전부 200 · image/jpeg 로 확인했다(600x600).
--
-- 실행: SQL Editor 에서 Run. update 8건 + 확인 select. 멱등이다.


update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/4931/sharing/2x/8f255f31-f464-4e9e-acbe-4105051646cb.jpg'
 where id = 4569;  -- 인간관계는 너무 어려워!

update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/4933/sharing/2x/5795c03f-1fd7-4492-b45f-745e2da47bab.jpg'
 where id = 7658;  -- 오늘 메뉴 추천 좀!

update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/4932/sharing/2x/7c7a5168-cdb3-40c7-9a59-ed0156d02546.jpg'
 where id = 7659;  -- 여름을 찾아서

update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/4955/sharing/2x/5b04765b-aed3-4d57-a8e4-1a0908b40780.jpg'
 where id = 9270;  -- 내 로판에서 꺼져

update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/4958/sharing/2x/53049759-5422-49ac-b229-850e76fe07bf.jpg'
 where id = 12920;  -- 역전의 무쌍급 플레이어

update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/4944/sharing/2x/3748ec39-4bd3-48c4-9953-0616242b032a.jpg'
 where id = 12922;  -- 집착 시리즈

update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/4962/sharing/2x/8a2dba17-c3fc-476d-95ee-8f5f6f734299.jpg'
 where id = 12923;  -- 걸즈 밴드 크라이 ~Secret Live~

update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/4954/sharing/2x/c4a7d138-aa19-4c0a-b252-e76471fa78a8.jpg'
 where id = 12930;  -- 그럴만한 동기


-- ── 확인 ──────────────────────────────────────────────────────────────

select id, title_ko, cover_url
from public.works
where id in (4569, 7658, 7659, 9270, 12920, 12922, 12923, 12930)
order by id;

-- 8행이 나오고 cover_url 이 전부 /sharing/2x/ 로 끝나는 서로 다른 주소면 정상.
-- 기존에는 8편 모두 eacb00ec-9034-42cb-a533-7c7690741113.jpg 를 가리키고 있었다.
