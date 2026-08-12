-- ------------------------------------------------------------
-- 15) 작가의 목소리 — 첫 영상 13편 등록
--     작성 2026-08-12 · 대표님 지시("아래 영상 올려줘" → "채워줘" → "시리즈 전편")
--
--     12편은 **한국저작권보호원 × 한국만화가협회 「2025 릴레이 한컷웹툰」 전편**이다.
--     실제 만화가가 저작권을 주제로 그린 한 컷이라 '작가의 목소리' 자리에 맞는다.
--     나머지 1편은 기관 캠페인 영상이라 작가명 대신 기관명으로 적고 맨 뒤에 둔다.
--
--     ※ 카드 문구는 영상 제목·시리즈명과 썸네일에 인쇄된 작품명에서만 가져왔다.
--       영상을 보지 않은 채 작가가 한 말처럼 따옴표를 붙여 지어내지 않는다.
--     ※ 썸네일은 쇼츠 세로 규격(1080×1920)을 쓴다. 3화만 oardefault가 없어 oar2를 쓴다.
--
--     홈에는 앞의 5편만 나온다(선반 한 줄). 나머지는 '작가의 목소리' 전체 화면에서 본다.
-- ------------------------------------------------------------

insert into public.creator_voices
  (creator_name, work, quote_ko, interview_youtube_url, thumb_url, summary_ko, is_published, sort)
select v.creator_name, v.work, v.quote_ko, v.url, v.thumb, v.summary, true, v.sort
from (values
  ('슬리피-C','전지적 독자 시점','「전지적 독자 시점」 슬리피-C 팀이 그린 저작권 한 컷','https://youtube.com/shorts/9qG9MKPmFYQ','https://i.ytimg.com/vi/9qG9MKPmFYQ/oardefault.jpg','한국저작권보호원과 한국만화가협회가 함께한 「2025 릴레이 한컷웹툰」 1화. 『전지적 독자 시점』의 슬리피-C 팀이 저작권을 주제로 그린 한 컷입니다.',0),
  ('남수','바른연애 길잡이','「바른연애 길잡이」 남수 작가가 그린 저작권 한 컷','https://youtube.com/shorts/3sGKTPR6LM4','https://i.ytimg.com/vi/3sGKTPR6LM4/oardefault.jpg','한국저작권보호원과 한국만화가협회가 함께한 「2025 릴레이 한컷웹툰」 2화. 『바른연애 길잡이』의 남수 작가가 저작권을 주제로 그린 한 컷입니다.',1),
  ('이선','개를 낳았다','「개를 낳았다」 이선 작가가 그린 저작권 한 컷','https://youtube.com/shorts/ju3x7u8oK3I','https://i.ytimg.com/vi/ju3x7u8oK3I/oar2.jpg','한국저작권보호원과 한국만화가협회가 함께한 「2025 릴레이 한컷웹툰」 3화. 『개를 낳았다』의 이선 작가가 저작권을 주제로 그린 한 컷입니다.',2),
  ('오성대','기기괴괴','「기기괴괴」 오성대 작가가 그린 저작권 한 컷','https://youtube.com/shorts/0FxyZHPARM4','https://i.ytimg.com/vi/0FxyZHPARM4/oardefault.jpg','한국저작권보호원과 한국만화가협회가 함께한 「2025 릴레이 한컷웹툰」 4화입니다. 『기기괴괴』의 오성대 작가가 저작권을 주제로 그린 한 컷입니다.',3),
  ('치즈','백수세끼','「백수세끼」 치즈 작가가 그린 저작권 한 컷','https://youtube.com/shorts/RibCgqnMr1A','https://i.ytimg.com/vi/RibCgqnMr1A/oardefault.jpg','한국저작권보호원과 한국만화가협회가 함께한 「2025 릴레이 한컷웹툰」 5화. 『백수세끼』의 치즈 작가가 저작권을 주제로 그린 한 컷입니다.',4),
  ('911','빌드업','「빌드업」 911 작가가 그린 저작권 한 컷','https://youtube.com/shorts/ExhzjkIXhUo','https://i.ytimg.com/vi/ExhzjkIXhUo/oardefault.jpg','한국저작권보호원과 한국만화가협회가 함께한 「2025 릴레이 한컷웹툰」 6화입니다. 『빌드업』의 911 작가가 저작권을 주제로 그린 한 컷입니다.',5),
  ('유기','부동산이 없는 자에게 치명적인','「부동산이 없는 자에게 치명적인」 유기 작가가 그린 저작권 한 컷','https://youtube.com/shorts/C7JsmIMsXqE','https://i.ytimg.com/vi/C7JsmIMsXqE/oardefault.jpg','한국저작권보호원과 한국만화가협회가 함께한 「2025 릴레이 한컷웹툰」 7화입니다. 『부동산이 없는 자에게 치명적인』의 유기 작가가 저작권을 주제로 그린 한 컷입니다.',6),
  ('진돌','진돌히디만화','「진돌히디만화」 진돌 작가가 그린 저작권 한 컷','https://youtube.com/shorts/M4B9rZtUYqI','https://i.ytimg.com/vi/M4B9rZtUYqI/oardefault.jpg','한국저작권보호원과 한국만화가협회가 함께한 「2025 릴레이 한컷웹툰」 8화입니다. 『진돌히디만화』의 진돌 작가가 저작권을 주제로 그린 한 컷입니다.',7),
  ('한큰빛','VS','「VS」 한큰빛 작가가 그린 저작권 한 컷','https://youtube.com/shorts/_GiqJNclL4s','https://i.ytimg.com/vi/_GiqJNclL4s/oardefault.jpg','한국저작권보호원과 한국만화가협회가 함께한 「2025 릴레이 한컷웹툰」 9화입니다. 『VS』의 한큰빛 작가가 저작권을 주제로 그린 한 컷입니다.',8),
  ('신일숙','마누의 딸들','「마누의 딸들」 신일숙 작가가 그린 저작권 한 컷','https://youtube.com/shorts/wb_qn8Wglf0','https://i.ytimg.com/vi/wb_qn8Wglf0/oardefault.jpg','한국저작권보호원과 한국만화가협회가 함께한 「2025 릴레이 한컷웹툰」 10화입니다. 『마누의 딸들』의 신일숙 작가가 저작권을 주제로 그린 한 컷입니다.',9),
  ('난','틴틴팅클','「틴틴팅클」 난 작가가 그린 저작권 한 컷','https://youtube.com/shorts/eNILi_tNZtc','https://i.ytimg.com/vi/eNILi_tNZtc/oardefault.jpg','한국저작권보호원과 한국만화가협회가 함께한 「2025 릴레이 한컷웹툰」 11화입니다. 『틴틴팅클』의 난 작가가 저작권을 주제로 그린 한 컷입니다.',10),
  ('배민기','무사만리행','「무사만리행」 배민기 작가가 그린 저작권 한 컷','https://youtube.com/shorts/1rb-s0aQhmw','https://i.ytimg.com/vi/1rb-s0aQhmw/oardefault.jpg','한국저작권보호원과 한국만화가협회가 함께한 「2025 릴레이 한컷웹툰」 12화입니다. 『무사만리행』의 배민기 작가가 저작권을 주제로 그린 한 컷입니다.',11),
  ('한국저작권보호원','공식 캠페인 영상',
   '거기 웹툰 보고 계신 분! 혹시 불법사이트에서 즐기고 있진 않으신가요?',
   'https://youtube.com/shorts/50BpeUBku3E',
   'https://i.ytimg.com/vi/50BpeUBku3E/oardefault.jpg',
   '한국저작권보호원이 만든 불법사이트 이용 경고 영상입니다. 작가 인터뷰가 아니라 기관 캠페인 영상이며, 정식 인터뷰가 확보되기 전까지 함께 둡니다.', 12)
) as v(creator_name, work, quote_ko, url, thumb, summary, sort)
where not exists (
  select 1 from public.creator_voices c where c.interview_youtube_url = v.url
);


-- 확인용
-- select sort, creator_name, work from public.creator_voices order by sort;


-- ------------------------------------------------------------
-- 【철회】 이번에 넣은 것만 내린다
-- delete from public.creator_voices
--  where interview_youtube_url like 'https://youtube.com/shorts/%';
-- 잠시 감추기만 하려면
-- update public.creator_voices set is_published = false;
-- ------------------------------------------------------------
