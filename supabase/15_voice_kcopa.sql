-- ------------------------------------------------------------
-- 15) 작가의 목소리 — 첫 영상 등록 (한국저작권보호원 캠페인 쇼츠)
--     작성 2026-08-12 · 대표님 지시
--
--     ※ 작가 인터뷰가 아니다. 한국저작권보호원(공공기관)의 불법사이트 이용 경고 영상이다.
--       그래서 creator_name을 기관명으로 적어, 작가 인터뷰인 것처럼 보이지 않게 한다.
--       인터뷰가 확보되면 그때 sort를 조정해 뒤로 물린다.
--
--     영상: https://youtube.com/shorts/50BpeUBku3E
--     채널: 한국저작권보호원 (@kcopa_copyright)
--     제목: "거기 웹툰 보고 계신 분! 혹시 불법사이트에서 즐기고 있진 않으신가요?"
--     썸네일은 쇼츠 세로 규격(1080×1920)을 쓴다. 가로 규격을 쓰면 카드에서 잘린다.
-- ------------------------------------------------------------

insert into public.creator_voices
  (creator_name, work, quote_ko, quote_en, interview_youtube_url, thumb_url, summary_ko, is_published, sort)
select '한국저작권보호원',
       '공식 캠페인 영상',
       '“거기 웹툰 보고 계신 분! 혹시 불법사이트에서 즐기고 있진 않으신가요?”',
       'Watching webtoons? Are you sure it is not a pirate site?',
       'https://youtube.com/shorts/50BpeUBku3E',
       'https://i.ytimg.com/vi/50BpeUBku3E/oardefault.jpg',
       '한국저작권보호원이 만든 불법사이트 이용 경고 영상입니다. 작가 인터뷰가 아니라 공공기관의 캠페인 영상이며, 작가 인터뷰가 확보되기 전까지 이 자리에 함께 둡니다.',
       true,
       0
where not exists (
  select 1 from public.creator_voices
   where interview_youtube_url = 'https://youtube.com/shorts/50BpeUBku3E'
);


-- 확인용
-- select id, creator_name, work, is_published, sort from public.creator_voices order by sort;


-- ------------------------------------------------------------
-- 【철회】
-- delete from public.creator_voices where interview_youtube_url = 'https://youtube.com/shorts/50BpeUBku3E';
-- 잠시 내리기만 하려면
-- update public.creator_voices set is_published = false where interview_youtube_url = 'https://youtube.com/shorts/50BpeUBku3E';
-- ------------------------------------------------------------
