-- ============================================================
-- Fairtoon · 연재작 동기화 1차 — 완결 전환 6편 + 네이버 신작 3편
-- 2026-08-16. progress.md 2026-08-13~15 6절에서 확정한 A안(수동 1~2회로
-- 로직을 검증한 뒤 자동화)의 첫 실행이다.
--
--   방법: 3사 요일연재 목록을 다시 읽어 DB 연재 924편과 대조했다.
--         목록에서 사라진 작품을 곧바로 완결로 바꾸지 않고 작품별로 원본을 확인했다.
--         요일 편성이 없는 상시 연재작이 상당수 있어 목록 부재만으로는 완결이 아니다.
--
--   완결 확인 근거
--     · 네이버      — 작품정보 API의 finished = true
--     · 카카오웹툰  — 회차 목록 최신 항목의 '(완결)' 표기
--                     (요일 목록·profile API로는 판정할 수 없었다)
--   완결 후보 36편 중 실제 완결은 6편. 나머지 30편은 연재 유지가 맞다.
--
--   ※ 카카오페이지 신규 1,153편은 규모가 커서 21번으로 분리했다.
--
--   실행: SQL Editor 에서 Run. 여러 번 실행해도 안전하다.
--   ※ 단일 문장 CTE. Supabase SQL Editor에서 임시테이블은 쓰지 않는다.
-- ============================================================


-- ① 완결 전환 6편
--    다육이는 잘 자란다 · 두번째 신의아이 · 가족같은 XX · 마교일진 · 도굴왕 · 리셋팅 레이디
update public.works set status = '완결', updated_at = now()
 where id in (237, 273, 85, 298, 1991, 1994)
   and status = '연재';


-- ② 네이버 신작 3편 추가 (요일연재에 새로 올라온 작품)
with imp(title, author, genres, blurb, pk, url, cover) as (values
('우리 커플 아님!','봄소희·신토',array['로맨스']::text[],'예술고 선남선녀 커플이 헤어지고 배우가 되었는데, 전남친 선호는 유명 톱스타, 나은은 무명 여배우… 이게 맞아? 전남친보다 더 잘나가기는커녕 현타가 와서 연예계를 은퇴하려는 찰나, A급 대본을 받게 된다. 그런데 로코 드라마의 상대 남주가 전남친이라고? 걔랑 키스신을 어떻게 찍냐!','naver','https://comic.naver.com/webtoon/list?titleId=853820','https://shared-comic.pstatic.net/thumb/webtoon/853820/thumbnail/thumbnail_IMAG21_cd189a91-37f7-4315-8e4c-586c199e6437.jpg'),
('악몽무당','공현곤',array['스릴러']::text[],'대한민국 최고의 무당 범구는 그가 모시는 무영장군신의 죽음으로 한순간에 나락에 떨어진다. 신을 부활시킬 방법은 단 하나, “무당이여! 살인사건 트라우마로 들어가 악귀를 처단하라.” 최악의 피해자들을 구원함으로써, 무당 범구는 스스로를 구원할 수 있을까!','naver','https://comic.naver.com/webtoon/list?titleId=853837','https://shared-comic.pstatic.net/thumb/webtoon/853837/thumbnail/thumbnail_IMAG21_00f17e8b-67e4-4814-a09e-804ece0f5562.jpg'),
('악녀의 시집살이는 즐겁다','최무탁·GIM·준예',array['로맨스']::text[],'사랑 하나만 믿고 시댁살이를 견딘 ‘에시카’.','naver','https://comic.naver.com/webtoon/list?titleId=853972','https://shared-comic.pstatic.net/thumb/webtoon/853972/thumbnail/thumbnail_IMAG21_5ba46f86-fca3-468a-9bb6-c6e87d1d21b6.jpg')
), ins as (
  insert into public.works (title_ko, author, genres, blurb_ko, cover_url, status, is_curated, sort)
  select i.title, i.author, i.genres, i.blurb, nullif(i.cover,''), '연재', false,
         6000 + row_number() over (order by i.title)
    from imp i
   where not exists (select 1 from public.works w where w.title_ko = i.title)
  returning id, title_ko
)
insert into public.work_legal_links (work_id, platform_key, url, sort)
select ins.id, imp.pk, imp.url, 0
  from imp join ins on ins.title_ko = imp.title;


-- 확인용 ① 상태별 편수 (기대: 완결 2,099 · 연재 921 → 신작 3편 반영 후 연재 924)
select status, count(*) from public.works group by status order by status;

-- 확인용 ② 완결로 바뀐 6편
select title_ko, status from public.works where id in (237, 273, 85, 298, 1991, 1994) order by title_ko;
