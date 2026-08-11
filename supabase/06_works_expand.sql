-- ============================================================
-- Fairtoon · 작품 DB 1차 확장 (P4-B) — 한국 웹툰 대표작 38편
-- 기존 12편 + 이 파일 38편 = 총 50편
-- 실행: SQL Editor 에서 Run (이미 있는 제목은 건너뜁니다 · 여러 번 실행해도 안전)
--
-- ※ 작가명·연재 플랫폼은 지호님 검수 대상입니다. 검수표: output/작품DB_1차_검수표.md
-- ============================================================

insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '갓 오브 하이스쿨', 'The God of High School', array['갓오하'], '박용제', array['액션','판타지'], '전국 고교생 무술대회로 시작해 신들의 싸움으로 번지는 초대형 액션.', '완결', true, 12
where not exists (select 1 from public.works where title_ko = '갓 오브 하이스쿨');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '스위트홈', 'Sweet Home', '{}', '김칸비·황영찬', array['스릴러','호러'], '욕망이 괴물을 만든다. 아파트에 갇힌 사람들의 생존 드라마.', '완결', true, 13
where not exists (select 1 from public.works where title_ko = '스위트홈');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '지옥', 'Hellbound', '{}', '연상호·최규석', array['스릴러','미스터리'], '예고된 죽음 앞에서 드러나는 인간과 사회의 민낯.', '완결', true, 14
where not exists (select 1 from public.works where title_ko = '지옥');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '송곳', 'The Awl', '{}', '최규석', array['드라마','사회'], '대형마트 노동조합을 통해 일터의 부조리를 정면으로 그린 문제작.', '완결', true, 15
where not exists (select 1 from public.works where title_ko = '송곳');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '좀비딸', 'Zombie Daughter', '{}', '이윤창', array['코미디','드라마'], '좀비가 된 딸을 지키는 아빠의 눈물겹고 유쾌한 육아기.', '완결', true, 16
where not exists (select 1 from public.works where title_ko = '좀비딸');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '패션왕', 'Fashion King', '{}', '기안84', array['코미디','드라마'], '외모와 패션에 인생을 건 고등학생들의 웃프고 잔혹한 성장담.', '완결', true, 17
where not exists (select 1 from public.works where title_ko = '패션왕');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '연애혁명', 'Love Revolution', '{}', '232', array['로맨스','코미디'], '고등학생 커플의 좌충우돌 연애, 웃음과 설렘을 동시에.', '완결', true, 18
where not exists (select 1 from public.works where title_ko = '연애혁명');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '헬퍼', 'Helper', '{}', '삭', array['액션','판타지'], '지하세계의 규칙과 폭력을 밀도 높게 그려낸 하드보일드 액션.', '완결', true, 19
where not exists (select 1 from public.works where title_ko = '헬퍼');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '덴마', 'Denma', '{}', '양영순', array['SF','액션'], '우주 택배기사의 시점으로 펼쳐지는 방대한 SF 세계관.', '완결', true, 20
where not exists (select 1 from public.works where title_ko = '덴마');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '하이브', 'Hive', '{}', '김규삼', array['스릴러','재난'], '거대 곤충의 습격, 도시가 무너지는 재난 서바이벌.', '완결', true, 21
where not exists (select 1 from public.works where title_ko = '하이브');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '죽음에 관하여', 'About Death', '{}', '시니·혀노', array['드라마','판타지'], '죽음 이후를 마주한 사람들의 이야기로 삶을 되묻는 옴니버스.', '완결', true, 22
where not exists (select 1 from public.works where title_ko = '죽음에 관하여');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '대학일기', 'College Diary', '{}', '자까', array['일상','코미디'], '공감 200% 대학 생활의 소소하고 웃긴 기록.', '완결', true, 23
where not exists (select 1 from public.works where title_ko = '대학일기');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '소녀의 세계', 'Girls'' World', '{}', '모랑지', array['드라마','일상'], '교실 안 네 소녀의 관계를 섬세하게 그린 성장 드라마.', '완결', true, 24
where not exists (select 1 from public.works where title_ko = '소녀의 세계');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '아 지갑놓고 나왔다', 'I Left My Wallet', '{}', '치즈', array['스릴러','미스터리'], '사소한 실수로 시작되는 숨 막히는 추격 스릴러.', '완결', true, 25
where not exists (select 1 from public.works where title_ko = '아 지갑놓고 나왔다');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '놓지마 정신줄', 'Hold Your Mind', '{}', '신태훈·나승훈', array['개그','일상'], '가족의 일상을 초고속 개그로 풀어낸 장수 명랑만화.', '완결', true, 26
where not exists (select 1 from public.works where title_ko = '놓지마 정신줄');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '심연의 하늘', 'Sky of Abyss', '{}', '윤인완·김선희', array['스릴러','재난'], '땅이 꺼진 도시에서 살아남기 위한 처절한 생존기.', '완결', true, 27
where not exists (select 1 from public.works where title_ko = '심연의 하늘');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '신도림', 'Sindorim', '{}', '전선욱', array['액션','판타지'], '평범한 회사원이 초능력의 세계에 휘말리는 도심 액션.', '완결', true, 28
where not exists (select 1 from public.works where title_ko = '신도림');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '랜덤채팅의 그녀!', 'Random Chat', '{}', '마사토끼·레노', array['로맨스','코미디'], '랜덤채팅으로 시작된 인연이 만들어내는 유쾌한 로맨스.', '완결', true, 29
where not exists (select 1 from public.works where title_ko = '랜덤채팅의 그녀!');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '복학왕', 'Boarding House', array['봉지은'], '기안84', array['코미디','드라마'], '지방대 복학생의 현실 밀착 생존기, 씁쓸한 웃음의 연속.', '완결', true, 30
where not exists (select 1 from public.works where title_ko = '복학왕');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '신의 탑', 'Tower of God', array['신탑'], 'SIU', array['판타지','액션'], '탑을 오르는 소년의 여정. 한국 웹툰의 세계적 대표작.', '연재', false, 31
where not exists (select 1 from public.works where title_ko = '신의 탑');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '이태원 클라쓰', 'Itaewon Class', array['이태원클라스'], '광진', array['드라마','성장'], '신념 하나로 거대 기업에 맞서는 청년들의 창업 드라마.', '완결', true, 32
where not exists (select 1 from public.works where title_ko = '이태원 클라쓰');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '은밀하게 위대하게', 'Secretly Greatly', '{}', 'HUN', array['액션','드라마'], '동네 바보로 위장한 남파 공작원의 비극적 청춘.', '완결', true, 33
where not exists (select 1 from public.works where title_ko = '은밀하게 위대하게');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '순정만화', 'Pure Love Story', '{}', '강풀', array['로맨스','드라마'], '나이 차 나는 두 커플의 담백하고 뭉클한 사랑 이야기.', '완결', true, 34
where not exists (select 1 from public.works where title_ko = '순정만화');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '그대를 사랑합니다', 'I Love You', '{}', '강풀', array['로맨스','드라마'], '노년의 사랑을 따뜻하게 그려 세대를 넘어 사랑받은 작품.', '완결', true, 35
where not exists (select 1 from public.works where title_ko = '그대를 사랑합니다');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '타이밍', 'Timing', '{}', '강풀', array['스릴러','판타지'], '각기 다른 능력자들이 한 사건으로 얽히는 시간 추적 스릴러.', '완결', true, 36
where not exists (select 1 from public.works where title_ko = '타이밍');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '26년', '26 Years', '{}', '강풀', array['드라마','스릴러'], '5·18을 정면으로 다룬 문제작. 기억과 책임에 관한 이야기.', '완결', true, 37
where not exists (select 1 from public.works where title_ko = '26년');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '아파트', 'Apartment', '{}', '강풀', array['호러','미스터리'], '같은 시각 불이 꺼지는 아파트, 한국 웹툰 공포의 고전.', '완결', true, 38
where not exists (select 1 from public.works where title_ko = '아파트');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '무빙', 'Moving', '{}', '강풀', array['액션','드라마'], '초능력을 숨기고 살아온 부모와 자식 세대의 대서사.', '완결', true, 39
where not exists (select 1 from public.works where title_ko = '무빙');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '계룡선녀전', 'Gyeryong Fairy Tale', '{}', '돌배', array['판타지','로맨스'], '선녀 설화를 현대로 옮겨 온 유쾌하고 다정한 판타지.', '완결', true, 40
where not exists (select 1 from public.works where title_ko = '계룡선녀전');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '쌍갑포차', 'Mystic Pop-up Bar', '{}', '배혜수', array['판타지','드라마'], '손님의 한을 풀어주는 신비한 포장마차 이야기.', '완결', true, 41
where not exists (select 1 from public.works where title_ko = '쌍갑포차');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '나빌레라', 'Like a Butterfly', '{}', 'HUN·지민', array['드라마','성장'], '칠십에 발레를 시작한 노인과 청년 발레리노의 성장기.', '완결', true, 42
where not exists (select 1 from public.works where title_ko = '나빌레라');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '어글리후드', 'Uglyhood', '{}', '나야', array['액션','드라마'], '거리의 아이들이 살아남는 법을 그린 강렬한 액션 드라마.', '완결', true, 43
where not exists (select 1 from public.works where title_ko = '어글리후드');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '나 혼자만 레벨업', 'Solo Leveling', array['나혼렙'], '추공·장성락', array['액션','판타지'], '최약체 헌터가 홀로 성장하는 사이다 레벨업 판타지.', '완결', true, 44
where not exists (select 1 from public.works where title_ko = '나 혼자만 레벨업');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '사내맞선', 'Business Proposal', '{}', '해화', array['로맨스','코미디'], '대타로 나간 맞선 상대가 회사 대표. 유쾌한 오피스 로맨스.', '완결', true, 45
where not exists (select 1 from public.works where title_ko = '사내맞선');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '김비서가 왜 그럴까', 'What''s Wrong with Secretary Kim', array['김비서'], '정경윤', array['로맨스','코미디'], '완벽한 비서의 퇴사 선언에서 시작되는 로맨틱 코미디.', '완결', true, 46
where not exists (select 1 from public.works where title_ko = '김비서가 왜 그럴까');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '템빨', 'Item Level Up', '{}', '박새날', array['판타지','액션'], '게임 속 아이템으로 성장하는 헌터의 통쾌한 성장기.', '완결', true, 47
where not exists (select 1 from public.works where title_ko = '템빨');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '황제의 외동딸', 'The Emperor''s Only Daughter', '{}', '윤슬·로담', array['로맨스','판타지'], '폭군 아버지를 바꾸는 어린 황녀의 서양풍 궁정 판타지.', '완결', true, 48
where not exists (select 1 from public.works where title_ko = '황제의 외동딸');
insert into public.works (title_ko, title_en, aliases, author, genres, blurb_ko, status, is_curated, sort)
select '악녀는 마리오네트', 'The Villainess Is a Marionette', '{}', '한이레·만보', array['로맨스','판타지'], '조종당하던 악역이 스스로 운명을 쥐는 역전 서사.', '완결', true, 49
where not exists (select 1 from public.works where title_ko = '악녀는 마리오네트');

-- ---------- 작품별 합법 플랫폼 링크 ----------
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EA%B0%93%20%EC%98%A4%EB%B8%8C%20%ED%95%98%EC%9D%B4%EC%8A%A4%EC%BF%A8', 0 from public.works w
where w.title_ko = '갓 오브 하이스쿨'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EC%8A%A4%EC%9C%84%ED%8A%B8%ED%99%88', 0 from public.works w
where w.title_ko = '스위트홈'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EC%A7%80%EC%98%A5', 0 from public.works w
where w.title_ko = '지옥'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EC%86%A1%EA%B3%B3', 0 from public.works w
where w.title_ko = '송곳'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EC%A2%80%EB%B9%84%EB%94%B8', 0 from public.works w
where w.title_ko = '좀비딸'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%ED%8C%A8%EC%85%98%EC%99%95', 0 from public.works w
where w.title_ko = '패션왕'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EC%97%B0%EC%95%A0%ED%98%81%EB%AA%85', 0 from public.works w
where w.title_ko = '연애혁명'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%ED%97%AC%ED%8D%BC', 0 from public.works w
where w.title_ko = '헬퍼'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EB%8D%B4%EB%A7%88', 0 from public.works w
where w.title_ko = '덴마'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%ED%95%98%EC%9D%B4%EB%B8%8C', 0 from public.works w
where w.title_ko = '하이브'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EC%A3%BD%EC%9D%8C%EC%97%90%20%EA%B4%80%ED%95%98%EC%97%AC', 0 from public.works w
where w.title_ko = '죽음에 관하여'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EB%8C%80%ED%95%99%EC%9D%BC%EA%B8%B0', 0 from public.works w
where w.title_ko = '대학일기'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EC%86%8C%EB%85%80%EC%9D%98%20%EC%84%B8%EA%B3%84', 0 from public.works w
where w.title_ko = '소녀의 세계'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EC%95%84%20%EC%A7%80%EA%B0%91%EB%86%93%EA%B3%A0%20%EB%82%98%EC%99%94%EB%8B%A4', 0 from public.works w
where w.title_ko = '아 지갑놓고 나왔다'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EB%86%93%EC%A7%80%EB%A7%88%20%EC%A0%95%EC%8B%A0%EC%A4%84', 0 from public.works w
where w.title_ko = '놓지마 정신줄'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EC%8B%AC%EC%97%B0%EC%9D%98%20%ED%95%98%EB%8A%98', 0 from public.works w
where w.title_ko = '심연의 하늘'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EC%8B%A0%EB%8F%84%EB%A6%BC', 0 from public.works w
where w.title_ko = '신도림'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EB%9E%9C%EB%8D%A4%EC%B1%84%ED%8C%85%EC%9D%98%20%EA%B7%B8%EB%85%80!', 0 from public.works w
where w.title_ko = '랜덤채팅의 그녀!'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EB%B3%B5%ED%95%99%EC%99%95', 0 from public.works w
where w.title_ko = '복학왕'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'naver', 'https://comic.naver.com/search?keyword=%EC%8B%A0%EC%9D%98%20%ED%83%91', 0 from public.works w
where w.title_ko = '신의 탑'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'naver');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'kakaowebtoon', 'https://webtoon.kakao.com/search?keyword=%EC%9D%B4%ED%83%9C%EC%9B%90%20%ED%81%B4%EB%9D%BC%EC%93%B0', 0 from public.works w
where w.title_ko = '이태원 클라쓰'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'kakaowebtoon');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'kakaowebtoon', 'https://webtoon.kakao.com/search?keyword=%EC%9D%80%EB%B0%80%ED%95%98%EA%B2%8C%20%EC%9C%84%EB%8C%80%ED%95%98%EA%B2%8C', 0 from public.works w
where w.title_ko = '은밀하게 위대하게'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'kakaowebtoon');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'kakaowebtoon', 'https://webtoon.kakao.com/search?keyword=%EC%88%9C%EC%A0%95%EB%A7%8C%ED%99%94', 0 from public.works w
where w.title_ko = '순정만화'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'kakaowebtoon');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'kakaowebtoon', 'https://webtoon.kakao.com/search?keyword=%EA%B7%B8%EB%8C%80%EB%A5%BC%20%EC%82%AC%EB%9E%91%ED%95%A9%EB%8B%88%EB%8B%A4', 0 from public.works w
where w.title_ko = '그대를 사랑합니다'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'kakaowebtoon');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'kakaowebtoon', 'https://webtoon.kakao.com/search?keyword=%ED%83%80%EC%9D%B4%EB%B0%8D', 0 from public.works w
where w.title_ko = '타이밍'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'kakaowebtoon');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'kakaowebtoon', 'https://webtoon.kakao.com/search?keyword=26%EB%85%84', 0 from public.works w
where w.title_ko = '26년'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'kakaowebtoon');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'kakaowebtoon', 'https://webtoon.kakao.com/search?keyword=%EC%95%84%ED%8C%8C%ED%8A%B8', 0 from public.works w
where w.title_ko = '아파트'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'kakaowebtoon');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'kakaowebtoon', 'https://webtoon.kakao.com/search?keyword=%EB%AC%B4%EB%B9%99', 0 from public.works w
where w.title_ko = '무빙'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'kakaowebtoon');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'kakaowebtoon', 'https://webtoon.kakao.com/search?keyword=%EA%B3%84%EB%A3%A1%EC%84%A0%EB%85%80%EC%A0%84', 0 from public.works w
where w.title_ko = '계룡선녀전'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'kakaowebtoon');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'kakaowebtoon', 'https://webtoon.kakao.com/search?keyword=%EC%8C%8D%EA%B0%91%ED%8F%AC%EC%B0%A8', 0 from public.works w
where w.title_ko = '쌍갑포차'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'kakaowebtoon');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'kakaowebtoon', 'https://webtoon.kakao.com/search?keyword=%EB%82%98%EB%B9%8C%EB%A0%88%EB%9D%BC', 0 from public.works w
where w.title_ko = '나빌레라'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'kakaowebtoon');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'kakaowebtoon', 'https://webtoon.kakao.com/search?keyword=%EC%96%B4%EA%B8%80%EB%A6%AC%ED%9B%84%EB%93%9C', 0 from public.works w
where w.title_ko = '어글리후드'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'kakaowebtoon');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'kakaopage', 'https://page.kakao.com/search/result?keyword=%EB%82%98%20%ED%98%BC%EC%9E%90%EB%A7%8C%20%EB%A0%88%EB%B2%A8%EC%97%85', 0 from public.works w
where w.title_ko = '나 혼자만 레벨업'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'kakaopage');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'kakaopage', 'https://page.kakao.com/search/result?keyword=%EC%82%AC%EB%82%B4%EB%A7%9E%EC%84%A0', 0 from public.works w
where w.title_ko = '사내맞선'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'kakaopage');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'kakaopage', 'https://page.kakao.com/search/result?keyword=%EA%B9%80%EB%B9%84%EC%84%9C%EA%B0%80%20%EC%99%9C%20%EA%B7%B8%EB%9F%B4%EA%B9%8C', 0 from public.works w
where w.title_ko = '김비서가 왜 그럴까'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'kakaopage');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'kakaopage', 'https://page.kakao.com/search/result?keyword=%ED%85%9C%EB%B9%A8', 0 from public.works w
where w.title_ko = '템빨'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'kakaopage');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'kakaopage', 'https://page.kakao.com/search/result?keyword=%ED%99%A9%EC%A0%9C%EC%9D%98%20%EC%99%B8%EB%8F%99%EB%94%B8', 0 from public.works w
where w.title_ko = '황제의 외동딸'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'kakaopage');
insert into public.work_legal_links (work_id, platform_key, url, sort)
select w.id, 'kakaopage', 'https://page.kakao.com/search/result?keyword=%EC%95%85%EB%85%80%EB%8A%94%20%EB%A7%88%EB%A6%AC%EC%98%A4%EB%84%A4%ED%8A%B8', 0 from public.works w
where w.title_ko = '악녀는 마리오네트'
  and not exists (select 1 from public.work_legal_links l where l.work_id = w.id and l.platform_key = 'kakaopage');

-- ---------- 확인용 ----------
select count(*) as 작품수, count(*) filter (where is_curated) as 큐레이션노출 from public.works;
