-- 리디 웹툰 수집 2/2 — scripts/collect_ridi.py 생성
-- 92편. 성인물 제외 · 제목이 이미 있으면 넣지 않는다.
-- 리디는 전체 목록 화면이 없는 장르가 있어 '일부'만 담긴다(스크립트 주석 참조).
-- 실행: SQL Editor 에서 Run. 여러 번 실행해도 안전하다.

with imp(title, author, genres, blurb, url, cover, st) as (values
('상자속 고양이의 반전','Dr.K',array['판타지']::text[],'','https://ridibooks.com/books/5401000128','https://img.ridicdn.net/cover/5401000128/large','완결'),
('더 트랩','이야기농장·차씨',array['드라마']::text[],'','https://ridibooks.com/books/5372001081','https://img.ridicdn.net/cover/5372001081/large','완결'),
('미씽','그린비·복희',array['스릴러']::text[],'','https://ridibooks.com/books/4116001740','https://img.ridicdn.net/cover/4116001740/large','완결'),
('숨겨진 남자','아밤',array['스릴러']::text[],'','https://ridibooks.com/books/845025246','https://img.ridicdn.net/cover/845025246/large','완결'),
('사소한 거짓말','겅생·박설미·책 끝을 접다',array['스릴러']::text[],'','https://ridibooks.com/books/4158000152','https://img.ridicdn.net/cover/4158000152/large','완결'),
('[책끝툰] 옥상으로 가는 길','너구리·황태환·책 끝을 접다',array['스릴러']::text[],'','https://ridibooks.com/books/4158000106','https://img.ridicdn.net/cover/4158000106/large','완결'),
('[책끝툰] 초대받은 손','임재명·남유하·책 끝을 접다',array['스릴러']::text[],'','https://ridibooks.com/books/4158000101','https://img.ridicdn.net/cover/4158000101/large','완결'),
('[책끝툰] 아이','현검·정해연·책 끝을 접다',array['스릴러']::text[],'','https://ridibooks.com/books/4158000077','https://img.ridicdn.net/cover/4158000077/large','완결'),
('[책끝툰] 허수아비','임재명·배명은·책 끝을 접다',array['스릴러']::text[],'','https://ridibooks.com/books/4158000066','https://img.ridicdn.net/cover/4158000066/large','완결'),
('[책끝툰]부활','겅생·전건우·책 끝을 접다',array['스릴러']::text[],'','https://ridibooks.com/books/4158000061','https://img.ridicdn.net/cover/4158000061/large','완결'),
('흡혈좀비','아러',array['스릴러']::text[],'','https://ridibooks.com/books/2584002605','https://img.ridicdn.net/cover/2584002605/large','완결'),
('[책끝툰] 옆집에 킬러가 산다','서루·김성희·책 끝을 접다',array['스릴러']::text[],'','https://ridibooks.com/books/4131000012','https://img.ridicdn.net/cover/4131000012/large','완결'),
('[책끝툰] 박 과장 죽이기','보일러김씨·신원섭·책 끝을 접다',array['스릴러']::text[],'','https://ridibooks.com/books/4158000049','https://img.ridicdn.net/cover/4158000049/large','완결'),
('바디셰이드','선데이영',array['스릴러']::text[],'','https://ridibooks.com/books/847002876','https://img.ridicdn.net/cover/847005337/large','연재'),
('염라의 법칙','묵비',array['스릴러']::text[],'','https://ridibooks.com/books/297022000','https://img.ridicdn.net/cover/297024618/large','연재'),
('악으로','신건우·한여름',array['스릴러']::text[],'','https://ridibooks.com/books/1962112061','https://img.ridicdn.net/cover/1962112061/large','완결'),
('오컬티스트','온기·Dr. Z',array['스릴러']::text[],'','https://ridibooks.com/books/3283000005','https://img.ridicdn.net/cover/3283000016/large','연재'),
('면죄부','지상·냥빠·로프트스토리',array['스릴러']::text[],'','https://ridibooks.com/books/3645000002','https://img.ridicdn.net/cover/3645000002/large','완결'),
('쓰리','월붓·삼대팔',array['스릴러']::text[],'','https://ridibooks.com/books/1746008545','https://img.ridicdn.net/cover/1746008545/large','완결'),
('괴기목욕탕 시즌2','김경일',array['스릴러']::text[],'','https://ridibooks.com/books/1746005312','https://img.ridicdn.net/cover/1746005312/large','완결'),
('노이즈','안재서·본코믹스',array['스릴러']::text[],'','https://ridibooks.com/books/1292000422','https://img.ridicdn.net/cover/1292000428/large','연재'),
('칼데라','최해웅·강두식',array['스릴러']::text[],'','https://ridibooks.com/books/1746004828','https://img.ridicdn.net/cover/1746004828/large','완결'),
('갈피','권지현',array['드라마']::text[],'','https://ridibooks.com/books/1962111959','https://img.ridicdn.net/cover/1962111959/large','완결'),
('좀비인간','임재용·한여름',array['스릴러']::text[],'','https://ridibooks.com/books/1962093770','https://img.ridicdn.net/cover/1962093770/large','완결'),
('아리동 라스트 카우보이','제피가루',array['스릴러']::text[],'','https://ridibooks.com/books/1746004080','https://img.ridicdn.net/cover/1746004080/large','완결'),
('68단계','김경일',array['스릴러']::text[],'','https://ridibooks.com/books/1746002455','https://img.ridicdn.net/cover/1746002455/large','완결'),
('경성탐정록','양은지·한동진',array['스릴러']::text[],'','https://ridibooks.com/books/297011081','https://img.ridicdn.net/cover/297011081/large','완결'),
('살신성인','허세녀',array['드라마']::text[],'','https://ridibooks.com/books/4419002477','https://img.ridicdn.net/cover/4419002477/large','완결'),
('시티 오브 플라워','타파리',array['스릴러']::text[],'','https://ridibooks.com/books/505002599','https://img.ridicdn.net/cover/505002599/large','완결'),
('인격장애 시리즈 시즌2 - 벽 너머','지니 정',array['판타지']::text[],'','https://ridibooks.com/books/1292000059','https://img.ridicdn.net/cover/1292000059/large','완결'),
('이세계 착각 헌터','ab Entertainment·대대원',array['판타지']::text[],'','https://ridibooks.com/books/5289000001','https://img.ridicdn.net/cover/5289000124/large','연재'),
('악인 남편','스르륵코믹스·사하',array['로맨스']::text[],'','https://ridibooks.com/books/6039000001','https://img.ridicdn.net/cover/6039000042/large','연재'),
('던전을 그리는 화가','글리·오솟·취미글주의',array['판타지']::text[],'','https://ridibooks.com/books/6305000001','https://img.ridicdn.net/cover/6305000021/large','연재'),
('상수리나무 아래','P·서말·나무·김수지',array['로맨스']::text[],'웹소설 『상수리나무 아래』를 아름다운 판타지 로맨스 웹툰으로 재탄생!

말더듬이 공작 영애 맥시밀리언은
아버지의 강요로 비천한 출생의 기사와 결혼하게 된다.
첫날밤을 치르고 원정을 떠나간 남편은
3년 후, 전 대륙에 명성을 떨치는 기사가 되어 돌아오는데….

<strong>"너를 생각하면 생각할수록 나는 고독하고 외로워져
이렇게나 괴로운데도 그만 둘 수 없','https://ridibooks.com/books/4766000001','https://img.ridicdn.net/cover/4766000164/large','연재'),
('백조 무덤 [개정판]','앤트 스튜디오·구물·켄',array['로맨스']::text[],'','https://ridibooks.com/books/4328000361','https://img.ridicdn.net/cover/4328000462/large','연재'),
('우리 이제 모르는 사이 해요','그리피스·다맏·예훤',array['로맨스']::text[],'','https://ridibooks.com/books/3776003633','https://img.ridicdn.net/cover/3776003956/large','연재'),
('장미 저택에 어서 오세요','팀 모쿠·이다란',array['로맨스']::text[],'','https://ridibooks.com/books/1746028077','https://img.ridicdn.net/cover/1746036040/large','연재'),
('교활하지 못한 마녀에게','콩고물·론나·김다현',array['로맨스']::text[],'','https://ridibooks.com/books/1962140228','https://img.ridicdn.net/cover/1962140228/large','연재'),
('폭군 남편 [개정판]','Nari·뒷골목의 곽철규·골드드럼',array['로맨스']::text[],'','https://ridibooks.com/books/6266000089','https://img.ridicdn.net/cover/6266000089/large','연재'),
('폐하, 저를 잊어주세요','Ayahara Bobo·아사히 마아사',array['로맨스']::text[],'','https://ridibooks.com/books/5409000431','https://img.ridicdn.net/cover/5409000431/large','연재'),
('같이 야근하실래요, 황태자님','MKC Studio·하이주',array['로맨스']::text[],'','https://ridibooks.com/books/4403015141','https://img.ridicdn.net/cover/4403015141/large','연재'),
('약탈혼','헤라·사하',array['로맨스']::text[],'','https://ridibooks.com/books/1746036198','https://img.ridicdn.net/cover/1746036198/large','연재'),
('세상만 구하고 은퇴하겠습니다','손·스튜디오 담·푸르세르·밀렘',array['판타지']::text[],'','https://ridibooks.com/books/1746023143','https://img.ridicdn.net/cover/1746036142/large','연재'),
('데페이즈망','스르륵코믹스',array['로맨스']::text[],'강제로 백작가에 팔려와 아버지뻘인 남편의 무시와 기만 속에서 살아가는 이블린.
그녀에게 허락된 세상은 오직 캔버스 안, 사각의 화폭뿐이었다.

그러던 어느 날, 자신의 유일한 도피처인 화실에만 숨어살던 그녀의 삶에
결코 들여서는 안 될 불청객이 찾아온다.

뻔뻔하게 저택을 활보하는 남편의 정부가 데려온 그녀의 아들, 제이.
가장 경멸해야 마땅할','https://ridibooks.com/books/4158001169','https://img.ridicdn.net/cover/4158001260/large','연재'),
('상류 사회','스르륵코믹스·견우',array['로맨스']::text[],'','https://ridibooks.com/books/5536000001','https://img.ridicdn.net/cover/5536000093/large','연재'),
('오월의 정원에서','스르륵코믹스·서담연',array['로맨스']::text[],'','https://ridibooks.com/books/6253000001','https://img.ridicdn.net/cover/6253000029/large','연재'),
('배덕한 타인에게 [개정판]','핫퍼지코믹스·Hirachell',array['로맨스']::text[],'','https://ridibooks.com/books/5690000002','https://img.ridicdn.net/cover/5690000002/large','완결'),
('폐하의 밤 [개정판]','핫퍼지코믹스·티야베',array['로맨스']::text[],'','https://ridibooks.com/books/6032000025','https://img.ridicdn.net/cover/6032000172/large','연재'),
('야행(夜行) [개정판]','핫퍼지코믹스·춈춈',array['로맨스']::text[],'','https://ridibooks.com/books/5796000002','https://img.ridicdn.net/cover/5796000116/large','연재'),
('파륜(破倫) [개정판]','핫퍼지코믹스',array['로맨스']::text[],'','https://ridibooks.com/books/4158001206','https://img.ridicdn.net/cover/4158001264/large','연재'),
('메리 사이코 [개정판]','핫퍼지코믹스·건어물녀',array['로맨스']::text[],'','https://ridibooks.com/books/4800000185','https://img.ridicdn.net/cover/4800000326/large','연재'),
('폭야(暴夜) [개정판]','핫퍼지코믹스·진소예',array['로맨스']::text[],'','https://ridibooks.com/books/4658000174','https://img.ridicdn.net/cover/4658000174/large','완결'),
('늑대 신랑 [개정판]','핫퍼지코믹스·박죠죠',array['로맨스']::text[],'','https://ridibooks.com/books/5690000129','https://img.ridicdn.net/cover/5690000129/large','완결'),
('황녀의 침실 인형 [개정판]','핫퍼지코믹스·꿀이흐르는',array['로맨스']::text[],'','https://ridibooks.com/books/5047000192','https://img.ridicdn.net/cover/5047000192/large','완결'),
('상사와 몰래 하는 짓 [개정판]','핫퍼지코믹스·김살구',array['로맨스']::text[],'','https://ridibooks.com/books/4879000185','https://img.ridicdn.net/cover/4879000185/large','완결'),
('환멸이 그대를 삼킬지라도','스르륵코믹스',array['판타지']::text[],'','https://ridibooks.com/books/4158000651','https://img.ridicdn.net/cover/4158000651/large','완결'),
('적국의 왕자로 사는 법','스르륵코믹스·자서현',array['판타지']::text[],'','https://ridibooks.com/books/5337000001','https://img.ridicdn.net/cover/5337000115/large','연재'),
('폭군의 망나니 오빠로 사는 법','황금콩·진자두·콘티메이커·방울뱀',array['판타지']::text[],'','https://ridibooks.com/books/5931000001','https://img.ridicdn.net/cover/5931000040/large','연재'),
('초능력 F반','스르륵코믹스',array['판타지']::text[],'','https://ridibooks.com/books/4158000963','https://img.ridicdn.net/cover/4158001054/large','연재'),
('북부드래곤생태계','해달',array['판타지']::text[],'','https://ridibooks.com/books/5074000806','https://img.ridicdn.net/cover/5074000806/large','완결'),
('팀 제로','박창환·스튜디오 담·곰달·박하민',array['로맨스']::text[],'','https://ridibooks.com/books/1746023498','https://img.ridicdn.net/cover/1746023498/large','완결'),
('기레기와 함께하는 연예계 생활','스르륵코믹스·피제이',array['판타지']::text[],'','https://ridibooks.com/books/5141000001','https://img.ridicdn.net/cover/5141000039/large','연재'),
('마왕의 세계정복은 처음부터 글러먹었다','백란·ELIN',array['판타지']::text[],'','https://ridibooks.com/books/5580000024','https://img.ridicdn.net/cover/5580000024/large','완결'),
('마탑의 사서','우주·양인산',array['판타지']::text[],'','https://ridibooks.com/books/4921002416','https://img.ridicdn.net/cover/4921002416/large','완결'),
('기적의 앱스토어','삼각설탕·정준',array['판타지']::text[],'','https://ridibooks.com/books/4921001948','https://img.ridicdn.net/cover/4921001948/large','완결'),
('판피아 전기','지페리',array['판타지']::text[],'','https://ridibooks.com/books/3092042547','https://img.ridicdn.net/cover/3092042547/large','완결'),
('프로테시아','돌낙지',array['판타지']::text[],'','https://ridibooks.com/books/3214038766','https://img.ridicdn.net/cover/3214039453/large','연재'),
('무한 루프에서 탈출하기','JSCR studio·상택·비로',array['판타지']::text[],'','https://ridibooks.com/books/3000017166','https://img.ridicdn.net/cover/3000017166/large','연재'),
('조선귀신전','솔호',array['판타지']::text[],'','https://ridibooks.com/books/5601002503','https://img.ridicdn.net/cover/5601002503/large','연재'),
('슈체나리움','미이·NIHONFALCOM',array['판타지']::text[],'','https://ridibooks.com/books/6144000010','https://img.ridicdn.net/cover/6144000010/large','연재'),
('워록','진솔',array['판타지']::text[],'','https://ridibooks.com/books/2968010643','https://img.ridicdn.net/cover/2968010524/large','완결'),
('불멸의 마에스트로','스토리아크·Arnandra',array['판타지']::text[],'','https://ridibooks.com/books/1962139265','https://img.ridicdn.net/cover/1962129376/large','완결'),
('모노크롬 루머','momoko·NORANG·올리·치율·편백나무숲',array['로맨스']::text[],'','https://ridibooks.com/books/4664000001','https://img.ridicdn.net/cover/4664000001/large','완결'),
('헌터는 조용히 살고 싶다','리공·오로라 스튜디오·MAGMA·백삼',array['로맨스']::text[],'','https://ridibooks.com/books/2404013544','https://img.ridicdn.net/cover/2404038763/large','연재'),
('테이밍(The Taming) [개정판]','차다·CHU·우수',array['로맨스']::text[],'','https://ridibooks.com/books/3498026960','https://img.ridicdn.net/cover/3498026960/large','연재'),
('엑스 스폰서 (개정판)','옴·Dips',array['로맨스']::text[],'','https://ridibooks.com/books/3093004075','https://img.ridicdn.net/cover/3093004075/large','연재'),
('다니엘의 인어','Yasheng+Houby/YoudbG Studio',array['로맨스']::text[],'','https://ridibooks.com/books/3000017162','https://img.ridicdn.net/cover/3000017162/large','연재'),
('집착공의 인형놀이','집사스튜디오',array['로맨스']::text[],'','https://ridibooks.com/books/3000017356','https://img.ridicdn.net/cover/3000017356/large','연재'),
('아르카디아(일반판)','희리·조도차',array['로맨스']::text[],'','https://ridibooks.com/books/297091815','https://img.ridicdn.net/cover/297091815/large','연재'),
('이러려고 입사한 건 아닌데요 (일반판)','배요·복슬이·경금',array['로맨스']::text[],'','https://ridibooks.com/books/297091811','https://img.ridicdn.net/cover/297091811/large','연재'),
('테소로 오브 더 가이드 (개정판)','호우·호찌·코혈압',array['로맨스']::text[],'','https://ridibooks.com/books/2404038791','https://img.ridicdn.net/cover/2404038791/large','연재'),
('팝업! (POP UP!)','연유라',array['로맨스']::text[],'','https://ridibooks.com/books/4566000002','https://img.ridicdn.net/cover/4566000002/large','완결'),
('나는 비서다','바트',array['로맨스']::text[],'','https://ridibooks.com/books/565026867','https://img.ridicdn.net/cover/565026867/large','완결'),
('몰락한 영주님의 사정','스르륵코믹스·포와송',array['로맨스']::text[],'','https://ridibooks.com/books/5143000001','https://img.ridicdn.net/cover/5143000030/large','연재'),
('시절인연','썸머',array['로맨스']::text[],'','https://ridibooks.com/books/5113000001','https://img.ridicdn.net/cover/5113000135/large','연재'),
('유성의 궤도','마마들·모스카레토',array['로맨스']::text[],'','https://ridibooks.com/books/4543000001','https://img.ridicdn.net/cover/4543000001/large','완결'),
('소라의 눈','썸머',array['로맨스']::text[],'','https://ridibooks.com/books/3013000004','https://img.ridicdn.net/cover/3013000004/large','완결'),
('인어의 추락','LibertyHome·Lin Qian/Changpei Tech',array['로맨스']::text[],'','https://ridibooks.com/books/1746021189','https://img.ridicdn.net/cover/1746021189/large','완결'),
('사장님의 고뇌','무나무',array['로맨스']::text[],'','https://ridibooks.com/books/297004889','https://img.ridicdn.net/cover/297004889/large','완결'),
('그놈이 그놈이다','도원·소열·차선',array['로맨스']::text[],'','https://ridibooks.com/books/1746027081','https://img.ridicdn.net/cover/1746036059/large','연재'),
('호우주의보','203',array['로맨스']::text[],'','https://ridibooks.com/books/3885041402','https://img.ridicdn.net/cover/3885041402/large','완결'),
('권태','인혜린',array['로맨스']::text[],'','https://ridibooks.com/books/1746014738','https://img.ridicdn.net/cover/1746014738/large','완결')
), ins as (
  insert into public.works (title_ko, author, genres, blurb_ko, cover_url, status, is_curated, sort)
  select i.title, i.author, i.genres, nullif(i.blurb,''), nullif(i.cover,''), i.st, false,
         16320 + row_number() over (order by i.title)
    from imp i
   where not exists (select 1 from public.works w where w.title_ko = i.title)
  returning id, title_ko
)
insert into public.work_legal_links (work_id, platform_key, url, sort)
select ins.id, 'ridi', imp.url, 0
  from imp join ins on ins.title_ko = imp.title;

-- 확인용
select status, count(*) from public.works group by status order by status;
