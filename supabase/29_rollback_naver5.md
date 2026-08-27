-- 28번 되돌리기용 — 삭제한 네이버 중복 5편을 원래 값 그대로 되살린다.
-- 28번을 실행하기 전 시점의 값을 그대로 떠 놓은 것이다(2026-08-27 작성).
-- 평소에는 실행하지 않는다. 28번 정리를 취소하고 싶을 때만 Run 한다.
-- 되살아난 행은 id가 새로 부여된다(원래 id: 2173, 1560, 1689, 1408, 1712).

with imp(title, author, genres, blurb, cover, st, srt, url) as (values
('마음의소리','조석',array['코미디']::text[],'솔직 담백 최강의 개그 만화 <마음의 소리>','https://shared-comic.pstatic.net/thumb/webtoon/20853/thumbnail/thumbnail_IMAG21_a715d0bd-fe55-4658-a573-669e0c0261f6.jpg','완결',3649,'https://comic.naver.com/webtoon/list?titleId=20853'),
('데드데이즈(DEAD DAYS)','DEY',array['스릴러']::text[],'좀비성 바이러스가 퍼진 세계. 4일 후의 이야기.','https://shared-comic.pstatic.net/thumb/webtoon/628998/thumbnail/thumbnail_IMAG21_3544673975281137465.jpg','완결',2629,'https://comic.naver.com/webtoon/list?titleId=628998'),
('송곳 1~3부','최규석',array['드라마']::text[],'''어쨌든 나는 세상 모든 곳에서 누군가의 걸림돌이었다.''','https://shared-comic.pstatic.net/thumb/webtoon/602922/thumbnail/thumbnail_IMAG21_3774353369472250470.jpg','완결',2758,'https://comic.naver.com/webtoon/list?titleId=602922'),
('하이브 1~2','김규삼',array['판타지']::text[],'거대해진 곤충들이 인간을 습격한다!','https://shared-comic.pstatic.net/thumb/webtoon/609480/thumbnail/thumbnail_IMAG21_4049638099174778162.jpg','완결',2477,'https://comic.naver.com/webtoon/list?titleId=609480'),
('심연의 하늘 시즌 1~3','윤인완·김선희',array['스릴러']::text[],'한치 앞도 보이지 않는 어둠 속 서울.','https://shared-comic.pstatic.net/thumb/webtoon/608261/thumbnail/thumbnail_IMAG21_c158a14d-1efc-4738-bccc-31e5d1ca50b1.jpg','완결',2781,'https://comic.naver.com/webtoon/list?titleId=608261')
), ins as (
  insert into public.works (title_ko, author, genres, blurb_ko, cover_url, status, is_curated, sort)
  select i.title, i.author, i.genres, nullif(i.blurb,''), nullif(i.cover,''), i.st, false, i.srt
    from imp i
   where not exists (select 1 from public.works w where w.title_ko = i.title)
  returning id, title_ko
)
insert into public.work_legal_links (work_id, platform_key, url, sort)
select ins.id, 'naver', imp.url, 0
  from imp join ins on ins.title_ko = imp.title;

-- 확인용
select count(*) as works from public.works;
