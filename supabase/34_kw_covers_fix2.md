-- 34. 카카오웹툰 표지 2편 복구 — 33번 이후 새로 들어온 신작이 같은 이유로 깨졌다.
--
-- 무슨 일이 있었나
--   33번(09-02)은 데이터를 고쳤고, 같은 날 `scripts/sync_serial.py` 도 고쳤다. 그런데
--   **자동화가 도는 코드는 그 파이썬 파일이 아니었다.** GitHub Actions는 Supabase Edge
--   Function(`supabase/functions/sync-serial/index.ts`)을 부르고, 그 함수는 여전히
--   공유이미지 UUID 하나를 전 작품에 돌려 쓰고 있었다. 그래서 그 뒤 들어온 신작 2편이
--   또 404 표지를 갖게 됐다(09-02 · 09-03 자동 추가분).
--
-- 재발 차단
--   Edge Function과 파이썬 스크립트 양쪽 모두, 이제 작품 페이지의 og:image 를 읽어
--   확인된 주소만 저장한다(같은 커밋). 확인 안 되면 빈 값 → 화면은 장르 그라데이션.
--   **Edge Function은 배포해야 반영된다** — `supabase/functions/README.md` 5)번 항목.
--
-- 근거: 각 작품 페이지 og:image. 둘 다 200 · image/jpeg 확인.
-- 실행: SQL Editor 에서 Run. update 2건 + 확인 select. 멱등이다.


update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/4956/sharing/2x/e104c654-4e1a-41a6-9152-be1d9987eb82.jpg'
 where id = 12935;  -- 남자 어디서 만나요?

update public.works set cover_url = 'https://kr-a.kakaopagecdn.com/P/C/4968/sharing/2x/de98c89f-e2ef-4917-a1cd-2be2ea5ab0a1.jpg'
 where id = 12937;  -- 은퇴한 킬러는 힐링하고 싶다


-- ── 확인 ──────────────────────────────────────────────────────────────

select id, title_ko, cover_url
from public.works
where id in (12935, 12937)
order by id;

-- 2행이 나오고 cover_url 이 서로 다른 주소면 정상.
-- 기존에는 둘 다 eacb00ec-9034-42cb-a533-7c7690741113.jpg 를 가리켜 404였다.


-- 참고 · 나머지 카카오웹툰은 이상 없다
--
-- 09-04에 카카오웹툰 작품 209편의 표지 주소를 전수 점검했다(HEAD 요청). 깨진 것은 위 2편뿐이고,
-- 옛 UUID를 그대로 쓰는 17편은 그 UUID가 실제로 그 작품의 og:image 여서 정상이다
-- (미생·순정만화·무빙·이끼·유부녀 킬러 5편은 이미지 해시까지 대조해 같은 그림임을 확인).
-- 표지 주소가 빈 작품은 1편이며, 이는 장르 그라데이션으로 정상 표시된다.
