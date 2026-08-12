-- ------------------------------------------------------------
-- 15) 작가의 목소리 — 첫 영상 5편 등록
--     작성 2026-08-12 · 대표님 지시("아래 영상 올려줘" → "채워줘")
--
--     출처는 모두 한국저작권보호원 공식 유튜브(@kcopa_copyright)다.
--     이 가운데 4편은 **한국저작권보호원 × 한국만화가협회 「2025 릴레이 한컷웹툰」** 으로,
--     실제 만화가가 저작권을 주제로 그린 한 컷이다. 그래서 '작가의 목소리' 자리에 맞는다.
--     나머지 1편은 기관 캠페인 영상이라 작가명 대신 기관명으로 적고 맨 뒤에 둔다.
--
--     ※ 카드 문구는 영상 제목과 시리즈명에서만 가져왔다. 영상을 보지 않고
--       작가가 한 말처럼 따옴표를 붙여 지어내지 않는다. 실제 발언 인용은
--       영상을 확인한 뒤에 채운다.
--
--     정식 인터뷰가 확보되면 sort를 조정해 이 다섯 편을 뒤로 물린다.
--     썸네일은 쇼츠 세로 규격(oardefault, 1080×1920)을 쓴다. 가로 규격은 카드에서 잘린다.
-- ------------------------------------------------------------

insert into public.creator_voices
  (creator_name, work, quote_ko, quote_en, interview_youtube_url, thumb_url, summary_ko, is_published, sort)
select v.creator_name, v.work, v.quote_ko, v.quote_en, v.url, v.thumb, v.summary, true, v.sort
from (values
  ('오성대','기기괴괴',
   '「기기괴괴」 오성대 작가가 그린 저작권 한 컷',
   'A copyright panel drawn by Oh Seong-dae (Tales of the Unusual)',
   'https://youtube.com/shorts/0FxyZHPARM4',
   'https://i.ytimg.com/vi/0FxyZHPARM4/oardefault.jpg',
   '한국저작권보호원과 한국만화가협회가 함께한 「2025 릴레이 한컷웹툰」 4화. 『기기괴괴』의 오성대 작가가 저작권을 주제로 그린 한 컷입니다.', 0),

  ('신일숙','마누의 딸들',
   '「마누의 딸들」 신일숙 작가가 그린 저작권 한 컷',
   'A copyright panel drawn by Shin Il-sook',
   'https://youtube.com/shorts/wb_qn8Wglf0',
   'https://i.ytimg.com/vi/wb_qn8Wglf0/oardefault.jpg',
   '「2025 릴레이 한컷웹툰」 10화. 『마누의 딸들』의 신일숙 작가가 저작권을 주제로 그린 한 컷입니다.', 1),

  ('배민기','무사만리행',
   '「무사만리행」 배민기 작가가 그린 저작권 한 컷',
   'A copyright panel drawn by Bae Min-gi',
   'https://youtube.com/shorts/1rb-s0aQhmw',
   'https://i.ytimg.com/vi/1rb-s0aQhmw/oardefault.jpg',
   '「2025 릴레이 한컷웹툰」 12화. 『무사만리행』의 배민기 작가가 저작권을 주제로 그린 한 컷입니다.', 2),

  ('911','빌드업',
   '「빌드업」 911 작가가 그린 저작권 한 컷',
   'A copyright panel drawn by 911 (Build Up)',
   'https://youtube.com/shorts/ExhzjkIXhUo',
   'https://i.ytimg.com/vi/ExhzjkIXhUo/oardefault.jpg',
   '「2025 릴레이 한컷웹툰」 6화. 『빌드업』의 911 작가가 저작권을 주제로 그린 한 컷입니다.', 3),

  ('한국저작권보호원','공식 캠페인 영상',
   '거기 웹툰 보고 계신 분! 혹시 불법사이트에서 즐기고 있진 않으신가요?',
   'Watching webtoons? Are you sure it is not a pirate site?',
   'https://youtube.com/shorts/50BpeUBku3E',
   'https://i.ytimg.com/vi/50BpeUBku3E/oardefault.jpg',
   '한국저작권보호원이 만든 불법사이트 이용 경고 영상입니다. 작가 인터뷰가 아니라 기관 캠페인 영상이며, 정식 인터뷰가 확보되기 전까지 함께 둡니다.', 4)
) as v(creator_name, work, quote_ko, quote_en, url, thumb, summary, sort)
where not exists (
  select 1 from public.creator_voices c where c.interview_youtube_url = v.url
);


-- 확인용
-- select id, sort, creator_name, work, is_published from public.creator_voices order by sort;


-- ------------------------------------------------------------
-- 【철회】 이번에 넣은 5편만 내린다
-- delete from public.creator_voices where interview_youtube_url in (
--   'https://youtube.com/shorts/0FxyZHPARM4','https://youtube.com/shorts/wb_qn8Wglf0',
--   'https://youtube.com/shorts/1rb-s0aQhmw','https://youtube.com/shorts/ExhzjkIXhUo',
--   'https://youtube.com/shorts/50BpeUBku3E');
-- 잠시 감추기만 하려면
-- update public.creator_voices set is_published = false;
-- ------------------------------------------------------------
