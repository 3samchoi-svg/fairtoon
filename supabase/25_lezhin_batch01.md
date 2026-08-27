-- 레진코믹스 수집 1/16 — scripts/collect_lezhin.py 생성
-- 320편. 청소년 이용불가 제외 · 제목이 이미 있으면 넣지 않는다.
-- 실행: SQL Editor 에서 Run. 여러 번 실행해도 안전하다.

with imp(title, author, genres, blurb, url, cover, st) as (values
('레바툰','레바',array['일상']::text[],'본격 나사 빠진 유해불건전장르불문개그만화.','https://www.lezhin.com/ko/comic/revatoon','https://ccdn.lezhin.com/v2/comics/260/images/tall.webp?updated=1765350735795&width=420','연재'),
('천지해','핑푸',array['판타지']::text[],'천계에 올바른 질서를 가져오기 위해 초대 옥황상제가 12지, 십장생, 오방신의 대표를 한 명씩 모아만든 기구 천지해. 이 조직에 황룡의 대표로 참가하게 된 수습 천지해 륜. 그녀가 첫 출근에서 보게된 천지해의 모습이란...? 다양한 종족이 부대끼며 살아가는 천계를 배경으로 벌어지는 특무기관 판타지 드라마.','https://www.lezhin.com/ko/comic/cheonjihae','https://ccdn.lezhin.com/v2/comics/59/images/tall.webp?updated=1762862966152&width=420','완결'),
('4컷용사','고지라군',array['판타지']::text[],'마왕을 해치운 용사는 드디어 공주를 구하고 새 삶을 찾는다. 하지만 공주와의 달콤한 미래는 상상으로 끝나버리고... 마왕 격퇴 이후 평범백수로 전락한 용사의 구차한 일상. 고지라군 작가님의 화제작 4컷용사가 리메이크로 찾아왔다!','https://www.lezhin.com/ko/comic/cartoon_hero','https://ccdn.lezhin.com/v2/comics/248/images/tall.webp?updated=1771298713442&width=420','완결'),
('박씨유대기','슬라정',array['코미디']::text[],'평범한 남학생 박남주는 같은 반의 큐트한 여학생 박여주에게 끌린다. 하지만 그녀의 정체는 상상도 할 수 없는...! ''극강의 연재처 선정능력'' 보유자, [초딩이지만 우리 사귀어요] 슬라정 작가의 레진 데뷔작! 레진은 여기까진가, 아니면 이제부터인가...!','https://www.lezhin.com/ko/comic/waitmrpark','https://ccdn.lezhin.com/v2/comics/6727405857669120/images/tall.webp?updated=1787301688830&width=420','연재'),
('그 끝에 있는 것','하리보',array['로맨스']::text[],'사고로 인해 왕따 시원의 몸으로 들어가게 된 태민. 겉은 왕따지만 속은 반항아인 그의 복학은 학교를 떠들썩하게 만들고, 그곳에서 태민은 과거의 인연이었던 우진과 재회한다. 어째서인지 우진은 왕따였던 시원에게서 태민의 냄새를 맡게 되고, 그렇게 또 다시 두 사람의 기이한 인연은 과거보다 더욱 질기게 이어지게 되는데...!','https://www.lezhin.com/ko/comic/end','https://ccdn.lezhin.com/v2/comics/4668122139459584/images/tall.webp?updated=1787301449957&width=420','완결'),
('표준규격전사','오솟',array['코미디']::text[],'지극히 정상적인(?) 그들의 표준적인 모험 이야기가 시작된다!','https://www.lezhin.com/ko/comic/standardheroes','https://ccdn.lezhin.com/v2/comics/4733152235356160/images/tall.webp?updated=1745988991894&width=420','연재'),
('너의 돈이 보여','S리아·민국23',array['로맨스']::text[],'사람들이 가진, 그리고 가질 ''돈''을 볼 수 있는 성춘, 다사다난했던 지난 날을 딛고 이제는 편히 살고 싶다. 일확천금의 꿈을 안고 그의 앞에 나타난 대기업 막내딸 지향을 붙잡지만···. 성춘을 바라보는 지향의 눈에 보이는 것은 다름 아닌 성춘의 돈?! 돈을 보는 두 남녀의 동상이몽 로맨스 [너의 돈이 보여] 시작합니다.','https://www.lezhin.com/ko/comic/moneylover','https://ccdn.lezhin.com/v2/comics/6732978288328704/images/tall.webp?updated=1534398367209&width=420','완결'),
('비밀스러운 짝사랑','정',array['로맨스']::text[],'짝사랑하고 있는 상대가 나를 짝사랑할 확률을 얼마나 될까? 1년을 바라만 보며 세연을 짝사랑한 진선, 그리고 그런 진선을 남몰래 짝사랑하던 세연. 서로의 환상 때문일까, 접점이 생길수록 애정과 함께 오해도 쌓여가는데...! 이 둘, 무사히 맞사랑할 수 있을까요? 로맨틱 코미디 [비밀스러운 짝사랑]! 시작합니다.','https://www.lezhin.com/ko/comic/secretmylove','https://ccdn.lezhin.com/v2/comics/6222637011828736/images/tall.webp?updated=1621998422401&width=420','완결'),
('아가씨와 우렁총각','제이드',array['로맨스']::text[],'남에게 기대는 것을 싫어하는 수하의 인생엔 남자도 연애도 없을 예정. 그런 그녀의 아파트에 어느 날 건장한 총각 태수가 난입한다! 아파트 계약 사기를 당해 갈 곳이 없어진 그는 자칭 게이에 타고난 살림꾼?! 수하는 고민 끝에 그를 가정부로 들이게 되는데...','https://www.lezhin.com/ko/comic/snail','https://ccdn.lezhin.com/v2/comics/5310249108766720/images/tall.webp?updated=1771298837861&width=420','완결'),
('더블캐스팅','신영우',array['액션']::text[],'막강하게 떠오르는 신흥 조직의 보스가 20년 만에 찾은 쌍둥이 동생이 그가 보는 앞에서 살해를 당한다.
그는 범인을 잡기 위해 동생의 인생을 살기로 하는데. 동생의 직업은 경찰학교를 졸업한 신참 경찰!
낮에는 무능한 형사로, 밤에는 유능한 조폭 보스로 이중생활을 시작한다.
더 강하고 수위높은 액션으로 돌아 온 신영우 작가의 더블캐스팅 리메이크 버전.','https://www.lezhin.com/ko/comic/double_casting','https://ccdn.lezhin.com/v2/comics/252/images/tall.webp?updated=1667186288571&width=420','완결'),
('백서사시','늴릴·GMAN',array['판타지']::text[],'인간과 수인이 공존하는 시대. 식인수인에 고통받던 시대는 영웅 솔반리에 의해 막을 내리고 그 이후 500년, 세상은 또다시 요괴의 출현으로 혼란에 빠진다. 세상을 구하기 위해 홍길동은 모험을 떠나는데... [백도사]의 프리퀄, 영웅 홍길동의 서사시! [백도사]의 늴릴작가의 치밀한 세계관을 GMAN 작가의 그림으로 강렬하게 풀어낸 액션 판타지.','https://www.lezhin.com/ko/comic/white_epic','https://ccdn.lezhin.com/v2/comics/6291928042176512/images/tall.webp?updated=1777272489230&width=420','완결'),
('불멸의 날들','허긴개',array['액션']::text[],'오랜 연구 끝에 인류는 더이상 죽지도 다치지도 않게 된다. 하지만 언제나 돌연변이는 존재하는 법. 죽을 수 있는 존재로 태어난 ''멸''은 불사의 사람들 사이에서 갖은 고생을 하며 살아간다. 외로이 고군분투를 하며 지내던 때, 멸은 자신과 같은 돌연변이 해결사 ''필''을 만나게 된다. 그리고 필은 자신과 같이 일을 하자며 멸에게 구애(?)하는데. 안전지상주의 ''','https://www.lezhin.com/ko/comic/ImmortalDays','https://ccdn.lezhin.com/v2/comics/5308438415671296/images/tall.webp?updated=1776994538655&width=420','연재'),
('롤플레잉겜만화','개차반',array['판타지']::text[],'현 동시접속률 1위의 버추얼 MMORPG 에스페라. 전설과도 같았던 한 유저의 잠수로 인해 게임의 업데이트는 멈춰 버리고... 그로부터 2년 후 느닷없이 복귀한 전설! 과연 에스페라의 운명은...?!','https://www.lezhin.com/ko/comic/rpg_comics','https://ccdn.lezhin.com/v2/comics/390/images/tall.webp?updated=1661763868467&width=420','완결'),
('그다이','최용성',array['스릴러']::text[],'소식이 끊어진 누나를 찾아 머나먼 호주까지 찾아온 시온. 누나가 머물렀던 셰어 하우스에 찾아간 시온은 수상해 보이는 한국인 거주자들을 만나게 되고, 수수께끼의 사내 한스에게서 누나의 흔적을 찾게 되는데...!','https://www.lezhin.com/ko/comic/g_day','https://ccdn.lezhin.com/v2/comics/398/images/tall.webp?updated=1719976358598&width=420','완결'),
('야수의 노래','YOON·리쿤',array['판타지']::text[],'이승과 저승을 넘나드는 오리엔탈 판타지! 한국 신화·설화를 재해석해 태어난 캐릭터, 박력 있는 전개와 빈틈없는 설정, 깊은 상상력으로 꿰맨 광활한 세계가 당신을 매료시킨다.','https://www.lezhin.com/ko/comic/yasusing','https://ccdn.lezhin.com/v2/comics/293/images/tall.webp?updated=1620185459990&width=420','완결'),
('전설의 읍내최강','배드이리',array['코미디']::text[],'10대 후반의 나이에 거대 조직인 [대하]를 괴멸시키고 어느날 소리없이 사라진 전설 “어린 도살자”. 타고난 싸움꾼 김민수의 목표는 주먹계의 전설 "어린 도살자"를 꺾고 자신이 전설이 되는 것이다. 그런데 일이 왜이렇게...???','https://www.lezhin.com/ko/comic/strongestintown','https://ccdn.lezhin.com/v2/comics/5558254478557184/images/tall.webp?updated=1625736458521&width=420','완결'),
('부랄친구','한라감귤',array['코미디']::text[],'낭랑 18세의 지은은 길건너 옆집에 사는 민철과 10년도 더 된 부랄친구다. 남녀사이에 친구는 없다지만 꾸준히 둘은 친구임을 주장하고 있기를 10여년.. 하지만 아침에 함께 등교, 하교도 같이, 아프면 병문안, 놀러갈 때도 단둘이.. 이런 둘이 정말 단순한 친구 사이로 남을 수 있을까..? 사랑보다 먼~ 우정보다는 가까운~ 지은과 민철의 미묘한 학원일기 [','https://www.lezhin.com/ko/comic/bff','https://ccdn.lezhin.com/v2/comics/5474379383439360/images/tall.webp?updated=1786522956590&width=420','연재'),
('김철수씨 이야기','수사반장',array['드라마']::text[],'인생이 이보다 더 불행할 수 있을까! 태어나자마자 쓰레기장에 버려진 김철수씨. 그의 험난한 인생은 한국 현대사의 아픔과 절망을 고스란히 담고 있다. 꿈도 희망도 없는 삶이 계속되며 인간 혐오의 영역으로 들어가버린 김철수씨는 결국 모든 불행의 원인제공자인 ‘인간’을 말살하고자 마음 먹는데…!','https://www.lezhin.com/ko/comic/ssdj2002','https://ccdn.lezhin.com/v2/comics/35/images/tall.webp?updated=1763601817379&width=420','완결'),
('바퀴멘터리','박바퀴',array['일상']::text[],'제가 이러고 삽니다.','https://www.lezhin.com/ko/comic/baquimentary','https://ccdn.lezhin.com/v2/comics/6185833387393024/images/tall.webp?updated=1767835110625&width=420','연재'),
('이름 없는 가게','하몽',array['판타지']::text[],'원하는 물건은 뭐든 구해주는 가게? 그러나 그 물건을 사용하는 데는 엄청난 대가가 따른다. 때로는 행복을, 때로는 파멸을 부르는 영력이 담긴 물건들을 다루는 수수께끼의 가게, 그리고 더욱 미스터리한 주인의 정체는 무엇인가!','https://www.lezhin.com/ko/comic/noname_shop','https://ccdn.lezhin.com/v2/comics/5967542155214848/images/tall.webp?updated=1759295840852&width=420','완결'),
('환관제조일기','김달',array['코미디']::text[],'19세기 청나라 궁궐의 서쪽, 환관을 만드는 여자 도자장의 이야기. 본격 고추 자르는 만화 [환관제조일기] 개시!','https://www.lezhin.com/ko/comic/castration','https://ccdn.lezhin.com/v2/comics/6528753551540224/images/tall.webp?updated=1786694494294&width=420','완결'),
('하루종일 조아영','김맹',array['일상']::text[],'201동 202호에는 무뚝뚝하지만 다정한 오빠와 언제나 해맑은 아영이가 삽니다. 귀여운 남매와 엉뚱한 이웃들의 유쾌한 하루하루! 오늘도 아영이와 [하루종일 조아영]♡','https://www.lezhin.com/ko/comic/joayoung','https://ccdn.lezhin.com/v2/comics/4537933260652544/images/tall.webp?updated=1768289336337&width=420','완결'),
('저승GO','최가은',array['판타지']::text[],'인간의 냄새를 풍기지 말라. 저승고등학교 8반 담임으로 부임한 김인간 선생님의 치열한 저승고 적응기.','https://www.lezhin.com/ko/comic/phantom_school','https://ccdn.lezhin.com/v2/comics/160/images/tall.webp?updated=1667185843675&width=420','완결'),
('도리도심','이지피',array['로맨스']::text[],'소문난 호구인 강돌은 짝사랑하던 양양에게 술기운에 고백을 한다. 그런데 눈을 뜨니 그곳에 있는 사람은 양양이 아닌 연극과 여신 민도심?! 그리고 돌의 고백에 도심은 자신도 짝사랑해왔다고 고백하는데..?! [그놈학개론] 이지피 작가의 유쾌한 캠퍼스로맨스, [도리도심]!','https://www.lezhin.com/ko/comic/doridosim','https://ccdn.lezhin.com/v2/comics/6404357085200384/images/tall.webp?updated=1655803562759&width=420','완결'),
('구원하소서','1230',array['액션']::text[],'남고생이 가득한 한 교실. 신체장애가 있는 형오는 학교의 일진들에게 반항하지 않는 좋은 놀잇감이다. 그렇게 표적이 되어 누구도 다가가지 않는 형오. 폭력과 조롱,  이 이유없는 괴롭힘에 고립된 소년을 구하기 위해 구원자가 그 옆에 선다!','https://www.lezhin.com/ko/comic/saveme','https://ccdn.lezhin.com/v2/comics/6452844527091712/images/tall.webp?updated=1787190990290&width=420','완결'),
('밍기뉴','권계림',array['로맨스']::text[],'어디서든지 사람들 무리 속에 끼어들지 못했던 왕따 연우에겐 항상 위로를 해주는 키다리 아저씨 같은 얼굴 모를 첫사랑이 있다. 그러나 연우는 대학생이 되면서 그 첫사랑과 함께 자신의 흑역사 같은 모든 과거를 떨쳐내고 싶어한다. 하지만 얼굴 모를 첫사랑은 그런 연우를 놓아주려 하지 않는데...','https://www.lezhin.com/ko/comic/minguinho','https://ccdn.lezhin.com/v2/comics/5597285332811776/images/tall.webp?updated=1702365737835&width=420','완결'),
('길 잃은 마왕의 딸이 숲속 나무꾼 부려먹는 만화','눅쓰',array['판타지']::text[],'인간계와의 대전쟁에서 승리한 마왕(4000살 추정)의 무용담을 믿지 못한 딸은 우연히 인간계 입구로 들어갔다가 길을 잃는다. 인간계에 편도로 떨어진 마계의 공주와, 그녀를 줍게 된 나무꾼의 이야기! 귀여움인가, 두려움인가!!','https://www.lezhin.com/ko/comic/lostgirl','https://ccdn.lezhin.com/v2/comics/476/images/tall.webp?updated=1626418641419&width=420','완결'),
('친하게 지내자','영일',array['일상']::text[],'1인용 삶을 추구하며 살아온 로맨스 소설가 한수씨. 그런 한수씨의 삶에 불쑥 나타난, 시크한 매력 가득한 조카 모나. 철없는 삼촌과 애어른 조카의 기묘한 동거가 시작되었다. 두 사람 사이는 언제 쯤 가까워질까요? 한수씨, 모나, 그리고 매..매력만점 이웃들과 함께 오늘도 내일도 &lt;친하게 지내자&gt;!','https://www.lezhin.com/ko/comic/together','https://ccdn.lezhin.com/v2/comics/4807559635271680/images/tall.webp?updated=1762862631993&width=420','완결'),
('먹는 존재','들개이빨',array['일상']::text[],'본격 까칠한 식도락 만화. 나는 먹는다. 고로 존재한다!','https://www.lezhin.com/ko/comic/ee','https://ccdn.lezhin.com/v2/comics/119/images/tall.webp?updated=1771298739773&width=420','완결'),
('살신성인','허세녀',array['스릴러']::text[],'의문의 죽음 그리고 부활 하지만 몸은 죽은 채 그대로인 좀비가 되어버린 남주, 그리고 24시간 감시받는 남주의 가족. 수상한 좀비들과 엮이며 혼란스러워하는 그들의 일상.','https://www.lezhin.com/ko/comic/sacrifice','https://ccdn.lezhin.com/v2/comics/285/images/tall.webp?updated=1543460407776&width=420','완결'),
('마법사의 아이','산작약',array['판타지']::text[],'잠들어 있는 마왕을 부활시키기 위해 그를 봉인한 대마법사의 아들을 납치하라! 자신도 모르는 사이 그 감시 역을 맡게 된 마족 트리샤는 울며 겨자 먹기로 마법사의 나라에 밀입국한다. 과연 그녀는 정체를 들키지 않고 대마법사의 아들로부터 무사히 정보를 캐낼 수 있을 것인가…!','https://www.lezhin.com/ko/comic/sorcerer','https://ccdn.lezhin.com/v2/comics/4790228505591808/images/tall.webp?updated=1546570802636&width=420','완결'),
('언노운 코드','김칸비·HOOPA',array['스릴러']::text[],'문명의 이기는 언제까지 우리의 친구인가. 친숙한 그것들에게 우리는 지금, 공격 받고 있다!','https://www.lezhin.com/ko/comic/unknown_code','https://ccdn.lezhin.com/v2/comics/4898461438181376/images/tall.webp?updated=1661762264250&width=420','완결'),
('히어로즈 플랜비','인디고',array['액션']::text[],'인디고 작가의 틴에이저 히어로물 [내츄럴스]가 본격적인 스케일로 다시 돌아왔다.','https://www.lezhin.com/ko/comic/planb','https://ccdn.lezhin.com/v2/comics/312/images/tall.webp?updated=1785903931460&width=420','완결'),
('하얀데레','남별·프릿슈',array['로맨스']::text[],'좋아하는 사람이 괴로워하고 슬퍼하는 걸 즐기는 서우현에게 최근 흥미로운 상대가 생겼다. 바로 같은 반의 하얀. 전혀 다른 반응을 보이는 하얀을 향한 우현의 괴롭힘은 점점 심해져만 가는데... 사실 이 모든 것은 하얀의 의도대로였다? 끝없는 집착과 질척임 속에서 피어나는, 은밀하고 소름 돋는 사랑 이야기.','https://www.lezhin.com/ko/comic/hayandere','https://ccdn.lezhin.com/v2/comics/5662308507975680/images/tall.webp?updated=1787189433600&width=420','완결'),
('백도사','늴릴·이끼',array['판타지']::text[],'인간과 수인이 공존하는 시대. 인간의 왕은 잔인한 성정으로 수인들을 핍박한다. 폭군에게 시달리는 수인들을 구하기 위한 모험.','https://www.lezhin.com/ko/comic/thewizard','https://ccdn.lezhin.com/v2/comics/208/images/tall.webp?updated=1553742006975&width=420','완결'),
('너란 남자','JS·WAJE',array['로맨스']::text[],'시각디자인과를 전공 중인 평범한 대학생 고시원. 어느 날 그의 꿈에 같은 과 동기인 강진하가 나오기 시작했다! 꿈속의 강진하는 계속해서 고시원이 기억하지 못하는 ''사건''을 얘기하고, 꿈에서 벗어나고 싶은 고시원은 강진하에 대해 캐내기 시작하는데… 시간이 흐르면서 점차 떠오르는 기억. 과연 그 기억의 끝에서 두 사람을 기다리는 운명은...?!','https://www.lezhin.com/ko/comic/man_like_you','https://ccdn.lezhin.com/v2/comics/4672804020813824/images/tall.webp?updated=1787301464700&width=420','완결'),
('브리아노의 연구소','엉덩국',array['코미디']::text[],'가난뱅이 고등학생 다비가 미스테리 과학자 브리아노의 연구소에 들어가면서 펼쳐지는 기괴한 나날들','https://www.lezhin.com/ko/comic/brianoslab','https://ccdn.lezhin.com/v2/comics/5794272204095488/images/tall.webp?updated=1771299039981&width=420','완결'),
('데들리 키스','박만두',array['스릴러']::text[],'남자인데 너무 ''예뻐서'' 여자친구도 한번 사귀지 못한 은빈이는 우연히 마주친 학교 퀸카 여리 선배를 따라 사이비 종교 순결교에 들어가게 되는데..한편 여의도에 현실의 인간이라고는 믿기 힘든 미모의 꽃미남,꽃미녀들이 나타나 거리의 시민들에게 무작정 키스를 퍼붓기 시작하고 키스를 받은 사람들은 사지가 비틀리며 그들과 똑같은 꽃미남,꽃미녀로 변하기 시작한다. 신','https://www.lezhin.com/ko/comic/deadly_kiss','https://ccdn.lezhin.com/v2/comics/29/images/tall.webp?updated=1556855378375&width=420','완결'),
('불편한 진실','이이런',array['스릴러']::text[],'세상에서 가장 소중한 재하형. 형도 내가 제일 소중하지? - 8명의 시민을 살해해 사회를 충격에 몰아넣은 살해범 요섭. 침묵하던 요섭은 갑작스럽게 진술을 시작하고, 그 입에서 하나씩 진실이 밝혀지면 밝혀질수록, 불안감만 고조되는데… 서정적인 작화의 서스펜스 스릴러 &lt;불편한 진실&gt;.','https://www.lezhin.com/ko/comic/another_secret','https://ccdn.lezhin.com/v2/comics/5674520276107264/images/tall.webp?updated=1786685416977&width=420','완결'),
('데명의 그림일기','데명',array['일상']::text[],'Eat, Sleep, Shit! 이제까지 만나보지 못한 새로운 코드의 개그와 독설로 무장한 일상툰! SNS 세상에서 수많은 이들에게 일침과 치유를 안겨준 화제의 그 작품 [데명의 그림일기], 드디어 레진코믹스에서 정식연재!','https://www.lezhin.com/ko/comic/diary_diaemyung','https://ccdn.lezhin.com/v2/comics/5626195062816768/images/tall.webp?updated=1550044534157&width=420','완결'),
('커튼콜 아래그랑','바싹탄숯',array['판타지']::text[],'신의 능력 ''커튼콜''을 가진 사설 심부름꾼 비기난, 책을 먹으며 식신을 다루는 ''지식인'' 스콘, 말괄량이 의사 콜롬보, 상냥하고 잔혹한 악마 이오나들의 모험과 배후에 숨겨진 천사와 악마의 음모가 장대하게 펼쳐지는 판타지 대 서사시!','https://www.lezhin.com/ko/comic/curtain_call','https://ccdn.lezhin.com/v2/comics/5/images/tall.webp?updated=1730858345198&width=420','완결'),
('내 집사는 비정규직','마사토끼·ASURA',array['코미디']::text[],'집사로서의 완벽한 길을 추구하는 엘리트 집사 유진 에반스. 하지만 영광스러워야 할 집사로의 첫걸음은 고용주의 야반도주로 엉망이 되고... 신세 사나운 집사와 눈매 사나운 아가씨, 팔자 사나운 메이드의 기묘한 동거가 시작된다.','https://www.lezhin.com/ko/comic/my_butler','https://ccdn.lezhin.com/v2/comics/5433266843156480/images/tall.webp?updated=1626417943460&width=420','완결'),
('데일리 위치','성원',array['로맨스']::text[],'판타지가 남아 있는 현실 세계에서 생계를 위해 BL 작가로 살고 있는 마녀 미스티와 초보 마녀 이브, 그리고 정체를 알 수 없는 인형 바바야가. 수수께끼의 집단에게 미스티가 잡혀간 순간, 마녀들의 정신사나운 ''비일상''이 시작된다!','https://www.lezhin.com/ko/comic/dailywitch','https://ccdn.lezhin.com/v2/comics/5479198263607296/images/tall.webp?updated=1550136511920&width=420','완결'),
('너의 HEART를 나에게 줄래?','비아이',array['로맨스']::text[],'고등학교 입학식, 초등학교때 첫사랑이 었던 류원하가 싸가지 얼짱이 되어 눈앞에 나타났다! 하지만 원하는 나를 기억하지 못하고 무시하기만 하는데..? 진성유와 류원하의 엇갈리는 풋풋한 학원 로맨스!','https://www.lezhin.com/ko/comic/giveme_ur_heart','https://ccdn.lezhin.com/v2/comics/18/images/tall.webp?updated=1723527642882&width=420','완결'),
('그녀의 암캐','피토',array['로맨스']::text[],'학창시절 동경하던 소하 선배를 위해 가윤은 그녀만이 할 수 있는 일을 선택했다. 그녀의 빈 곳을 채워주기 위한 가윤의 선택은 과연? &lt;나의 보람&gt; 피토 작가의 2015년 새 야심작!','https://www.lezhin.com/ko/comic/her_dog','https://ccdn.lezhin.com/v2/comics/376/images/tall.webp?updated=1520223436225&width=420','완결'),
('어느 날 잠에서 깨어보니 베이글녀가 되어 있었다','탱크가이',array['코미디']::text[],'자고 일어나 보니 하루아침에 베이글녀가 되어 있는 26세 독신남 정봉기. 평범한 알바 인생 A를 살아왔던 그(그녀?)의 인생은 밑바닥 부터 송두리채 뒤엎힌다. 우선, 입을 수 있는 옷(속옷 포함)이 없단 말입니다! 알바는, 예비군은? 랭킹전은 여자라도 뭐 별 문제 없긴 하지만!','https://www.lezhin.com/ko/comic/bagel','https://ccdn.lezhin.com/v2/comics/151/images/tall.webp?updated=1707815326694&width=420','완결'),
('기절소녀 하나미!','호이',array['로맨스']::text[],'기절까지 앞으로 30초! 어릴 적 좋아하는 남자에게 고백했다가 비참하게 차인 하나미는 그 트라우마로 좋아하는 사람 앞에만 서면 기절하게 된다. 고교 입학식에서 첫눈에 반한 선배에게 고백하려는 하나미의 치밀한 계획. 그 계획 속으로 아역배우 출신 대스타 K가 끼어드는데… 과연 그녀는 고백에 성공할 수 있을까?!','https://www.lezhin.com/ko/comic/haami','https://ccdn.lezhin.com/v2/comics/4649055289081856/images/tall.webp?updated=1654157849375&width=420','완결'),
('잠자는 공주와 꿈꾸는 악마','마사토끼·Kirty',array['판타지']::text[],'어느 날 나타나 승부를 제안하는 여학생 악마. 그 대가로 어떤 소원이든 한 가지 들어 주겠다는 달콤한 유혹... 하지만 패배했을 땐 영혼을 빼앗긴다. 잠든 여동생을 구하기 위해 발을 들이게 되는 꿈꾸는 악마와의 위험한 승부!','https://www.lezhin.com/ko/comic/play_with_devil','https://ccdn.lezhin.com/v2/comics/486/images/tall.webp?updated=1545879601440&width=420','완결'),
('닥터 레진의 무책임 하스스톤 연구소','김도',array['일상']::text[],'국민 모바일 게임 [하스스톤]의 본격 만화화, 미국 블리자드의 본사 승인을 거친 정식 하스스톤 웹툰이 막을 엽니다! ''노루야캐요''를 만든 김도 작가의 개그 센스와 하스스톤 빠돌이 다운 카드 설명법으로 새 확장팩 대 마상시합부터 낱낱이 파헤쳐드립니다!!','https://www.lezhin.com/ko/comic/dr_hearthstone','https://ccdn.lezhin.com/v2/comics/5978137257574400/images/tall.webp?updated=1626417880298&width=420','완결'),
('애제자','김영조',array['로맨스']::text[],'도심의 건물, 자취방의 월세, 하이힐의 굽, 깔창의 높이, 그리고 취업의 벽까지 모든 것이 높기만 한 이곳은 거인들의 도시 서울. 그 속에서 주은유는 그저 허우적대기만 한다. 사랑하는 그녀에게도 말도 제대로 붙이지 못하고 지켜보기만 여러 날, 오매불망 바라보다 놓쳐버린 그녀를 다시 만난 곳은 다름 아닌..?! [그리고...여름] 김영조 작가의 유려한 작화로','https://www.lezhin.com/ko/comic/mad_teacher','https://ccdn.lezhin.com/v2/comics/6558302232641536/images/tall.webp?updated=1719975233519&width=420','완결'),
('마계탈출록','무멘',array['판타지']::text[],'동생 노아를 찾아내 마계를 탈출해 보이겠어!! … 살해된 마왕의 첫 목격자인 마계 간부 세실은 꿍꿍이를 가지고 몰래 인간들을 납치해 와 가장 마왕과 닮은 멀린에게 마왕 대역을 시킨다. 멀린은 대역을 거부하려 했지만 동생이 인질이 되자 어쩔 수 없이 꼭두각시 마왕 연기를 하게 되는데.. 한낱 인간인 줄 알았던 멀린이 의외로 적응을 잘한다?! 알고 보니 겁나 ','https://www.lezhin.com/ko/comic/devildom','https://ccdn.lezhin.com/v2/comics/5350116366745600/images/tall.webp?updated=1644732359511&width=420','완결'),
('옆자리 짝꿍의 비밀','채군',array['드라마']::text[],'평범한 남자 고등학생 양기룡.
그리고 언제나 헤실헤실하고 가끔 나사빠진 행동을 하는
그의 짝꿍 유재경.
그럭저럭 귀엽다고 생각되는 반 친구였을 뿐인데..
어느 날 우연히 그녀의 위험한 비밀을 알게 된다.
이 심장의 두근거림은 두려움인지, 설렘인지..?','https://www.lezhin.com/ko/comic/secretofjjak','https://ccdn.lezhin.com/v2/comics/6127795410632704/images/tall.webp?updated=1736747427718&width=420','연재'),
('못생겨서 좋겠다','허세녀',array['드라마']::text[],'평범하지 않은 외모 때문에 좋아하는 사람과의 인연도 어릴적부터의 꿈도 이루기 힘든 현실 앞에서 포기하지 않고 최선을 다하는 못생긴(?) 주인공들의 서바이벌 스토리.','https://www.lezhin.com/ko/comic/ugly','https://ccdn.lezhin.com/v2/comics/5257433893830656/images/tall.webp?updated=1737439879342&width=420','완결'),
('소꿉친구가 자꾸 괴롭혀!','NAKTA',array['드라마']::text[],'고등학교 2학년 새 학기를 맞이하는 한누리.
초등학교 시절 전학 갔던 소꿉친구 강호밀이 같은 반 옆자리 짝꿍으로 돌아왔다!
키 147cm로 멈춰버린 자신과 다르게 몇 년 새 많은 것이 달라진 호밀.
그의 등장으로 흠칫 긴장하고 덜컹 가슴 뛰는 일상이 시작된다!','https://www.lezhin.com/ko/comic/nuri','https://ccdn.lezhin.com/v2/comics/5015838139940864/images/tall.webp?updated=1786522993803&width=420','완결'),
('여자 제갈량','김달',array['드라마']::text[],'조조의 위, 손권의 오, 그리고 유비의 촉. 과거 삼등분 되어 있던 중국 대륙의 한복판에서 여러 책사들이 자신의 책략을 뽐내며 화려하게 꽃을 피웠다. 그리고 그 중에서 가장 밝게 빛나던 제갈량을 여성으로 재해석한다! 본격 성별반전 대하드라마 &lt;여자 제갈량&gt;!','https://www.lezhin.com/ko/comic/girlgongmyung','https://ccdn.lezhin.com/v2/comics/313/images/tall.webp?updated=1786694342843&width=420','완결'),
('하얀천사에게 날개는 없다','가도',array['로맨스']::text[],'성모 마리아의 수호 아래 엄정한 마음가짐을 가르침받는 여고의 한 교실. 경건해보이는 여고생들이 모인 그 곳에 환영받지 못하는 왕따 아연이 있다. 괴롭힘과 다른 반친구들의 외면에 나날이 지쳐가는 아연에게 도움을 주겠다며 다가온 하얀 천사와 같은 연화. 하지만 연화의 미소는 잔인함을 띄고 있는데...','https://www.lezhin.com/ko/comic/white','https://ccdn.lezhin.com/v2/comics/5750159751512064/images/tall.webp?updated=1777550729612&width=420','완결'),
('악마의 소년','권기린·윤지현',array['액션']::text[],'왕따당하는 고통으로 자해까지 하게 된 정호에게 대악마 메피스토펠레스가 나타나 솔깃한 제안을 던진다. 증오하는 상대를 떠올리며 자해하면 그 고통이 고스란히 상대방에게 전해진다는 무서운 능력! 정호는 자신을 괴롭혔던 아이들에게 하나둘씩 복수하기 시작하는데…!','https://www.lezhin.com/ko/comic/demon','https://ccdn.lezhin.com/v2/comics/4559666564694016/images/tall.webp?updated=1737019487242&width=420','완결'),
('어바웃 제인','엠제이',array['판타지']::text[],'과학이 비약적으로 발전한 2099년 신행성 ''에텔'', 고도화된 발전 뒤에는 가장 영향력 있는 인물인 세계 최고의 로봇설계 권위자 렌 크라프트가 있다. 그리고 그녀의 하나뿐인 딸 제인은 학교의 킹카 네이선을 짝사랑하는 평범한 학교생활을 보내고 있다. 이전처럼 네이선을 몰래 지켜보던 어느날, 제인은 네이선에게 데이트 신청을 받는다. 얼떨결에 네이선과 새해를 맞','https://www.lezhin.com/ko/comic/aboutjane','https://ccdn.lezhin.com/v2/comics/4832793653936128/images/tall.webp?updated=1717480658346&width=420','완결'),
('블랙보이','노커',array['판타지']::text[],'블랙보이와 한스 그리고 카이드락. 용사와 마왕의 불안한 우정 .''어나더월드'' 노커 작가의 또 다른 다크 판타지!','https://www.lezhin.com/ko/comic/blackboy','https://ccdn.lezhin.com/v2/comics/235/images/tall.webp?updated=1764727486955&width=420','완결'),
('아람이랑 삽니다!','콕',array['드라마']::text[],'룸메이트 구할 건데 "잘 아는 친구, 아예 모르는 생판 남" 누가 좋을 것 같아?... 성격 특이하신 룸메 덕분에 갑작스레 새 룸메를 맞게 된 예지. 알바까지 짤린 심란한 상태라 이것저것 가릴 것 없다지만... 야! 새 룸메가 남자라고는 얘기 안 했잖아?!! 생활력X개그력 만렙 찍은 로맨틱 코미디 &lt;아람이랑 삽니다!&gt;','https://www.lezhin.com/ko/comic/aram','https://ccdn.lezhin.com/v2/comics/5793662341218304/images/tall.webp?updated=1754988724387&width=420','완결'),
('빌더','문하늘·이동준',array['판타지']::text[],'가까운 미래, 원하는 꿈을 꿀 수 있게 된 세상. 그리고 그 속에서 신이 되고자 하는 이들을 우리는 ''빌더''라 부른다. 과연 그녀는 왜 빌더가 되고 싶어 하는가?!','https://www.lezhin.com/ko/comic/builder','https://ccdn.lezhin.com/v2/comics/365/images/tall.webp?updated=1601890930957&width=420','완결'),
('별과 하나의 시','새별숯·유나물',array['로맨스']::text[],'구독자 10만 시 낭독 방송으로 초 인기 스트리머인 김참새의 정체는 친구도 없이 시집만 읽고 사는 여중생 김하나?! 그런데 그 많은 구독자 중 한 명이 하필 같은 반에 있을 줄이야...! 국어 시간에 지문을 읽는 김하나의 목소리를 듣고 김하나=김참새임을 눈치챈 이한별은 김하나에게 호감을 품고, 결국 사귀고 싶어 안달이 나버리는데!','https://www.lezhin.com/ko/comic/sparrow','https://ccdn.lezhin.com/v2/comics/5791250995609600/images/tall.webp?updated=1618363369165&width=420','완결'),
('어게인2002 - 모두의 추억','문요셉',array['드라마']::text[],'명장 거스 히딩크와 태극전사들. 2002년 월드컵의 4강전설을 되새기며 그날의 눈물의 드라마를 다시 한번!','https://www.lezhin.com/ko/comic/again2002','https://ccdn.lezhin.com/v2/comics/270/images/tall.webp?updated=1550044676600&width=420','완결'),
('튄 공','이삼',array['드라마']::text[],'결승전의 결정적인 실수로 다시는 농구를 하지 못하게 된 동경은 농구밖에 모르는 바보 오철 그리고 달명과 우연히 마주치며 인생을 건 길거리 농구 한판이 시작된다! 꺾어진 청춘에 봄은 다시 오는가?','https://www.lezhin.com/ko/comic/rebound_ball','https://ccdn.lezhin.com/v2/comics/200/images/tall.webp?updated=1714443760656&width=420','완결'),
('독일 만화','맨오브피스',array['일상']::text[],'"독일하면 떠오르는 것은?맥주,소시지,베를린...그것만이 다가 아니다!
직접 다녀오거나 살아보지 않으면 모를 생활밀착형 독일이야기.맨오브피스 작가가 직접 겪은 에피소드와 함께 지금 가장 핫한 그들만의 문화와 이슈, 생활정보 등을 절제된 독일식 매력으로 매주 전해드립니다."','https://www.lezhin.com/ko/comic/germantoon','https://ccdn.lezhin.com/v2/comics/5692661497856000/images/tall.webp?updated=1550052382770&width=420','완결'),
('백억년을 자는 남자','수사반장',array['드라마']::text[],'하루에 3시간만 자도 정상 생활이 가능한 35세 양승조씨. 남들보다 5시간씩 남는 잠시간을 온전히 자신을 위해 써왔고, 그 사이에 사랑하는 아내와 자식들, 그리고 훌륭한 직장과 동료들과 함께 하게 되었다. 그러나, 36세 생일날 잠에서 깬 그의 인생은 크게 뒤틀리는데... &lt;김철수씨 이야기&gt; 수사반장 작가의 장대한 대우주 서사시!','https://www.lezhin.com/ko/comic/sleepingman','https://ccdn.lezhin.com/v2/comics/5551016703033344/images/tall.webp?updated=1763601729130&width=420','완결'),
('망고의 뼈','골드키위새·넋부자들',array['로맨스']::text[],'고교 수석입학 모범생 백주인은 입학 선서 때 차석 함소복에게 첫눈에 반한다. 그러나 고백 플랜은 정반대 성향의 쌍둥이 동생 백주율의 방해로 꼬여가고, 설상가상으로 평판 나쁜 같은 반 여학생 유리사까지 엮이면서 통제 불능으로 빠져드는데… 골드키위새 작가의 글에 넋부자들의 아름다운 그림, 그러나 아름답지만은 않을지도 모를 뼈 있는 이야기!','https://www.lezhin.com/ko/comic/mangoseed','https://ccdn.lezhin.com/v2/comics/5613460917846016/images/tall.webp?updated=1697618257113&width=420','완결'),
('이성연애박사','참새·반숙',array['로맨스']::text[],'이성관계에 고민이 많던 대학생 이레는 홀리듯 발견한 자칭 연애박사의 광고지에 마음을 뺏긴다. 연애의 모든 것을 가르쳐준다는 이 사람, 믿어도 되는 걸까?','https://www.lezhin.com/ko/comic/master_of_love','https://ccdn.lezhin.com/v2/comics/4535001206489088/images/tall.webp?updated=1550044728387&width=420','완결'),
('시크릿 동맹','레로',array['드라마']::text[],'&lt;식욕&gt; 레로작가의 은밀하고 파격적인 삼각 로맨스.
사랑하는 누나에게 다가갈 수만 있다면, 무슨 짓이든 할 수 있어.

극심한 남자공포증을 앓지만 고독한 모습에 여자들에게 인기가 많은 ''시안''. 
그녀 앞에 남자들의 이목을 한눈에 받는 신입생 ''유리''가 나타나 고백을 하는데… 
광기 어린 눈동자에 숨은 비밀은 무엇일까?','https://www.lezhin.com/ko/comic/secretcontract','https://ccdn.lezhin.com/v2/comics/6406678520922112/images/tall.webp?updated=1644732087504&width=420','완결'),
('갬블러 VS. 초능력자','마사토끼·도현',array['스릴러']::text[],'초능력자 VS. 세계제일의 갬블러. 전부 얻거나 전부 잃기 전에는 일어날 수 없는 판돈 총 3천억의 데스매치. 도박의 본질과 역사가 인간의 한계를 넘어 도전받는 희대의 승부가 지금 펼쳐진다!','https://www.lezhin.com/ko/comic/gambler_vs_psychic','https://ccdn.lezhin.com/v2/comics/6450438253051904/images/tall.webp?updated=1548300213136&width=420','완결'),
('클라우드','김파스',array['로맨스']::text[],'짝사랑하는 찬일이의 사진을 모으는 것이 취미인 하늘이.
그러나 실수로 같은 반 실장인 현운이에게 들키고 만다.
하늘은 착하고 모범생인 현운이 비밀을 지켜줄 것이라고 기대하지만...
왜인지 현운이 손안에서 놀아나는 것 같은데...?','https://www.lezhin.com/ko/comic/cloud','https://ccdn.lezhin.com/v2/comics/5183802990723072/images/tall.webp?updated=1749426521366&width=420','완결'),
('매운맛 커플','깜지루',array['일상']::text[],'"야외인데...", "장소가 중요해?"
캡사이신 과다 함량 남녀들의 일상이란?
끝맛엔 달짝지근함이 감도는 매운맛 커플들의 레시피!','https://www.lezhin.com/ko/comic/hotcouple','https://ccdn.lezhin.com/v2/comics/5758960471965696/images/tall.webp?updated=1771934851800&width=420','연재'),
('흑역사처리반','단투',array['판타지']::text[],'어느 날 갑자기 침대에서 죽음을 맞이하게 된 주인공 박영우. 그는 자신을 데리러 온 저승사자 비선에게 빌고 빌어 그녀의 일을 돕기로 약속하고 죽을 운명을 거슬러 부활한다. 깊은 한으로 이승에 묶인 원혼. 그 원혼들이 되는 비극을 사전에 막는 "흑역사처리반"이 된 영우는 과연 임무를 완수하고 비선의 손아귀에서 벗어나 평범한 일상으로 돌아갈 수 있을 것인가?!','https://www.lezhin.com/ko/comic/rescuer','https://ccdn.lezhin.com/v2/comics/4736813649494016/images/tall.webp?updated=1575531204163&width=420','완결'),
('오크의 포로가 된 엘프 여사령관','삭둑',array['판타지']::text[],'치열한 전쟁 끝에 오크군에 사로잡혀 버린 엘프 여사령관 ''이시르''와 ''레나''.
무자비한 엘프 포로와 가녀린 오크군의 파란만장한 병영 생활기!','https://www.lezhin.com/ko/comic/totokkan','https://ccdn.lezhin.com/v2/comics/6093218132590592/images/tall.webp?updated=1780029022644&width=420','완결'),
('백은아란전','송정욱·송의섭',array['액션']::text[],'속세에 나쁜 영향을 주지 않기 위해 스스로의 힘을 봉인하고 살아가는 숨은 무림 정파 고수들이 어느날 정체불명의 기계인간들에게 습격 당하는 사건이 발생하는데.. 평범한 소년 아란은 우연히 휘말려 500년 무공을 몸속에 전수받게 된다. 아란의 몸속의 내공을 노리는 정파, 사파, 그리고 기계인간들의 전쟁이 시작된다!','https://www.lezhin.com/ko/comic/aran','https://ccdn.lezhin.com/v2/comics/110/images/tall.webp?updated=1549949150206&width=420','완결'),
('히어로 왈츠','펭귄쥬스',array['드라마']::text[],'히어로가 국력의 기준이 되어버린 시대. ‘국가의 무기로써 비밀리에 육성되는 히어로’라는 정체를 숨기기 위해 빵셔틀 행세 중인 고성태와, 그의 정체를 눈치챈 은가람. 그리고 이 소년 소녀에게 다가오는 거대한 음모.','https://www.lezhin.com/ko/comic/hero_waltz','https://ccdn.lezhin.com/v2/comics/158/images/tall.webp?updated=1661764012689&width=420','완결'),
('나와 호랑이님','윤재호·카넬',array['판타지']::text[],'평범한 학생이었던 성훈은 어느날 자신이 환웅에게 선택받지 못한 호랑이 요괴와 결혼을 하지 않으면 온세상이 요괴로 덮히게 된다는 것을 듣게 되고.. 미소녀로 변한 호랑이와의 기묘한 동거가 시작된다.','https://www.lezhin.com/ko/comic/mylovetiger','https://ccdn.lezhin.com/v2/comics/277/images/tall.webp?updated=1787301531435&width=420','완결'),
('남고 소년','박지',array['드라마']::text[],'대문 남고의 유일한 홍일점인 ''홍일탁''.
물론 이름과 별명과는 다르게 남자다.
    
왜소한 체격과 곱상한 외모 덕분에 찐따부터 일진에 이르기까지
자신을 무시하기에 이르고 교내 서열 꼴찌에 머무르고 있었다.
    
과거, 중학교 2학년까지만 해도 유명한 일진이었던 일탁은
자신의 한 문제로 인해 먹이 사슬 맨 아래에 위치하게 되었는데...
     
''그','https://www.lezhin.com/ko/comic/highschoolboy','https://ccdn.lezhin.com/v2/comics/5082862571421696/images/tall.webp?updated=1770011250131&width=420','연재'),
('찐따들의 제국','최현호',array['액션']::text[],'학교라는 정글 가장 깊고 어두운 곳에서 고통받는 인간들… 그 이름하여 ''찐따’. 찐따들이여, 언제까지 당하고만 있을 것인가. 무시받는 그들을 구원하기 위해 그가 나타났다! 약자들의 우상, 찐따들의 구세주!! 찐따왕 오덕훈의 파란만장한 일대기, 시~작!','https://www.lezhin.com/ko/comic/Empire_Z','https://ccdn.lezhin.com/v2/comics/5844165540970496/images/tall.webp?updated=1737601232610&width=420','완결'),
('하라는 공부는 안하고','하우진',array['드라마']::text[],'의대 진학이 목표인 재수생 ''남주호'' , 어째선지 같은 재수학원에 다니는 같은 반 여자애 ''여지우''의 타겟이 되고
평범하기만 할 줄 알았던 재수학원 생활에 위협을 받기 시작한다','https://www.lezhin.com/ko/comic/academy_of_card','https://ccdn.lezhin.com/v2/comics/6210470602932224/images/tall.webp?updated=1776997651738&width=420','완결'),
('유성의 기사를 부탁해!','수정과',array['로맨스']::text[],'유성우가 내리던 날 밤, 골목에서 남자 요정을 주워버렸다...! 시험을 치르기 위해 인간세계에 왔다는 요정 레몬과 한때 흑마법사가 꿈이었던 여자 미라의 반전 로맨스 코미디!','https://www.lezhin.com/ko/comic/shooting_star','https://ccdn.lezhin.com/v2/comics/5882171144536064/images/tall.webp?updated=1754988567149&width=420','연재'),
('마들레느가 9번지','진혜리',array['드라마']::text[],'어느 날 갑자기 유럽의 동네 제과점에서 일하게 된다면? 행동파 모건 부인, 쿨한 파티쉐 비숍, 아르바이트 겸 작가 지망생 줄리가 꾸려나가는 작은 제과점 이야기.','https://www.lezhin.com/ko/comic/m_street_no9','https://ccdn.lezhin.com/v2/comics/6/images/tall.webp?updated=1761792220778&width=420','완결'),
('방과후에','권골수',array['스릴러']::text[],'혼자 살고 머리가 긴 것 외에는 보통의 남중생인 수현. 잠이 많은 준휘, 숫기 없는 정훈이와 함께 방과후에 놀러가는 것을 낙으로 평범한 일상을 보내고 있다. 여느때와 같은 방과후 수업을 빠지고 놀러가기 위해 나간 그날. 평범한 일상이 될 거라 생각했던 것과 달리 갑작스럽게 사건에 휘말리고 마는데...','https://www.lezhin.com/ko/comic/afterschool','https://ccdn.lezhin.com/v2/comics/5912899326836736/images/tall.webp?updated=1550038360851&width=420','완결'),
('두근워치','개호주·홍차',array['코미디']::text[],'사랑의 두근거림 수치를 측정하는 시계인 ''두근워치''. 두근워치 수치 1만을 달성하면 상금 100억을 받을 수 있다! 누군가는 돈 때문에, 누군가는 사랑을 위해, 또 누군가는 재미를 위해 두근워치 1만에 도전하는데… &lt;태양초고추장연구소&gt;의 개호주 작가와 포텐신인 홍차 작가의 신작 &lt;두근워치&gt;!!','https://www.lezhin.com/ko/comic/pitapatwatch','https://ccdn.lezhin.com/v2/comics/394/images/tall.webp?updated=1661764498501&width=420','완결'),
('애완소녀들의 동향분석과 대응방안','고용찬·류수진',array['코미디']::text[],'덕후임을 숨기고 모범생처럼 살아온 유현오. 친구로부터 게임 "애완소녀"를 입수해 실행한 순간 게임 속들로 들어와버렸다. 여동생처럼 귀여운 토끼귀 소녀 라애, 강아지귀를 가진 여자친구 도희, 비밀을 감춘 고양이귀 소녀 체린. 게임 속 인물들과의 미션을 수행하면 게임을 빠져나갈 수 있다는 정보를 접하고 게임 캐릭터들을 하나 씩 클리어하기 시작한다.','https://www.lezhin.com/ko/comic/pet_girl','https://ccdn.lezhin.com/v2/comics/304/images/tall.webp?updated=1667186358350&width=420','완결'),
('판도라의 선택','유도리',array['드라마']::text[],'19세기 미국 북동부의 작은 마을. 타고난 미모의 소유자인 크리스와 그런 아빠를 울리는 게 유일한 취미인 판도라. 둘은 고립된 사회 속에서 영원한 대립 상태로 살아간다. 만성 우울증 아버지와 어른스럽고 씩씩한 딸의 성장 이야기. 제2회 세계만화공모전 최우수상 수상작!','https://www.lezhin.com/ko/comic/pandoras_choice','https://ccdn.lezhin.com/v2/comics/5487695569879040/images/tall.webp?updated=1563092314760&width=420','완결'),
('머쉬룸 스프','부발',array['판타지']::text[],'18살 생일, 이상한 꿈과 함께 잠에서 깨어난 아리는 시골 마을로 전학을 가게 된다. 이번 생일 선물은 특별하다며 그녀를 거대한 나무 앞으로 데려간 부모님이 나무에 노크를 두 번 하자 아리는 땅속으로 끊임없이 떨어지게 되는데?! 매력넘치는 버섯족 친구들의 이야기가 시작된다! 제4회 세계만화공모전 우수상 수상작!','https://www.lezhin.com/ko/comic/mushroomsoup','https://ccdn.lezhin.com/v2/comics/6614679117758464/images/tall.webp?updated=1759295847879&width=420','완결'),
('삼국지 가후전 R','마사토끼·입개',array['드라마']::text[],'여러 주인을 바꿔 섬겼고, 음흉한 계책에 거리낌이 없었다. 인간의 마음에 의심을 심는 난세의 책략가이자, 전쟁에서 단 한 번도 패하지 않은 자… 그의 이름은 바로 가후. 마사토끼X입개 콤비로 새롭게 만들어지는 진짜 가후전, 그 단단한 재기동!','https://www.lezhin.com/ko/comic/gahu_r','https://ccdn.lezhin.com/v2/comics/4609020734078976/images/tall.webp?updated=1751499873944&width=420','완결'),
('토끼의 왕','엄세윤·병장',array['액션']::text[],'2017년, 이 나라에는 아직 신분제도가 존재한다. 이곳에서 벌어지는 노비들의 격투시합 “판크라티온”. 10연승을 달성한 자만이 노비 신분에서 해방될 수 있다! &lt;국민사형투표&gt; 엄세윤 + &lt;소년이여&gt; 병장 작가의 특급 액션 콜라보.','https://www.lezhin.com/ko/comic/rabbit_king','https://ccdn.lezhin.com/v2/comics/4718199999561728/images/tall.webp?updated=1551927604739&width=420','완결'),
('달의 상자','김달',array['판타지']::text[],'김달작가가 새롭게 선보이는 단편만화집. 한편 한편이 아라비안나이트의 세헤라자데가 별빛 아래 왕에게 속삭이던 이야기처럼 기묘하고 신비롭다. 이국적인 술탄, 황제의 막내딸, 용의 이야기가 지금 우리의 삶과 겹쳐지어 거울이 된다. 덤덤히 마음을 울리는 그들의 이야기를 들어보자','https://www.lezhin.com/ko/comic/dalbox','https://ccdn.lezhin.com/v2/comics/6014243980443648/images/tall.webp?updated=1786694526138&width=420','완결'),
('그놈학 개론','이지피',array['드라마']::text[],'허세며 반항이며 그야말로 고2병의 표본 이비루와 돈 있고 집 있지만 철이 없는 꿈만소설가 이혁의 동거생활. 우정과 증오로 비벼진 그들의 시끌벅적한 일상이 시작됩니다!','https://www.lezhin.com/ko/comic/introduction_him','https://ccdn.lezhin.com/v2/comics/467/images/tall.webp?updated=1655803775436&width=420','완결'),
('런웨이는 거짓말로 시작된다','지우너',array['드라마']::text[],'독보적인 패션 센스에 화려한 외모를 겸비한 패션과의 잇☆걸 유니키는 내면의 트라우마를 이겨내고 완벽한 모델을 구해 패션쇼에서 우승할 수 있을까?','https://www.lezhin.com/ko/comic/fakerunway','https://ccdn.lezhin.com/v2/comics/4920991700090880/images/tall.webp?updated=1737010665388&width=420','완결'),
('1 더하기 1은','소루',array['로맨스']::text[],'대학생 성은의 윗집으로 소란스러운 사람이 이사 온다. 그런데 그는 같은 과 동기에 겹치는 수업도 여러 개, 심지어 성은과 앞뒤 글자만 바뀐 이름이다. 무시할 수 없는 우연들로 엮여 떨어지려야 떨어질 수 없는 두 사람... 그들이 풀어나가는 1+1 로맨스!','https://www.lezhin.com/ko/comic/oneplusone','https://ccdn.lezhin.com/v2/comics/5382463174868992/images/tall.webp?updated=1737360789112&width=420','완결'),
('새빨간 결혼','유승종',array['로맨스']::text[],'꿈같은 내집마련을 위해서라면..사랑없이도 부부 행세가 가능하다? N포세대였던 연주와 지훈은 우연히 결혼정보업체 이벤트에 당첨되어 아파트를 얻게된다. 놓치기엔 너무 아까운 기회..결국 그들은 위장결혼을 감행하게 되는데! 그렇게 시작된 쿨하고도 아슬아슬한 가짜 부부 생활. 과연 성공할 수 있을까?','https://www.lezhin.com/ko/comic/red_marriage','https://ccdn.lezhin.com/v2/comics/4996086850125824/images/tall.webp?updated=1660269744920&width=420','완결'),
('피치러브','푸죠킹',array['로맨스']::text[],'매梅 고등학교의 일인자 피치, 목각인형 만들기가 취미인 순수소년 러브에게 한눈에 반해버리다! 그러나... 피치 자신은 피와 살이 튀기는 약육강식 세계의 정점에 있는 몸. 이대로는 러브를 지켜낼 수 없단 판단 아래, 그를 일인자로 추대하는 무모한 계획을 세우는데...! 소년만화를 방불케하는 액션과 열혈, 엉뚱함이 난무하는 각양각색 소년들의 사랑 이야기, 시작','https://www.lezhin.com/ko/comic/peach_love','https://ccdn.lezhin.com/v2/comics/6377018608844800/images/tall.webp?updated=1655804426367&width=420','완결'),
('금요정의 금요극장','금요정',array['코미디']::text[],'극장 내 연극에서의 모든 해프닝 및 대사와 등장인물의 감정 표현은 전부 가상의 각본과 배우의 연기입니다.
배우들은 행복하게 촬영했습니다. 아마도.','https://www.lezhin.com/ko/comic/goldpixinema','https://ccdn.lezhin.com/v2/comics/5376382661361664/images/tall.webp?updated=1759895859380&width=420','연재'),
('삼작미인가','므앵갱',array['드라마']::text[],'춘향, 심청, 배뱅… 동갑내기 세 소녀의 기기괴괴한 수난기! ‘도원’이라는 고을의 세 부인이 기도 끝에 딸을 하나씩 낳고, 그 셋은 죽마고우로 자라난다. 세 소녀가 17세가 되던 무렵, ‘도원’에는 괴이한 일들이 연달아 벌어지는데…! [어둠이 스러지는 꽃] 므앵갱 작가 컴백!','https://www.lezhin.com/ko/comic/3girls','https://ccdn.lezhin.com/v2/comics/5533113486409728/images/tall.webp?updated=1718088004359&width=420','완결'),
('외모윤리','이아영',array['로맨스']::text[],'세상은 결국 외모가 전부일까? 외모 때문에 오해받는 소년소녀들의 이야기.','https://www.lezhin.com/ko/comic/vis_ethics','https://ccdn.lezhin.com/v2/comics/90/images/tall.webp?updated=1520223386113&width=420','완결'),
('음지탐구보고서','양말젤리',array['코미디']::text[],'박사와 조수가 음지문화를 똥인지 된장인지 굳이 찍어먹어 보고 쓰는 연구보고서 만화','https://www.lezhin.com/ko/comic/shady_research_report','https://ccdn.lezhin.com/v2/comics/5596969058500608/images/tall.webp?updated=1786806614440&width=420','연재'),
('호레','지호',array['판타지']::text[],'영혼의 돌을 이용하여 인간의 능력을 초월한 존재 ''그릇''. 그들은 자신도 이유를 모른채 본능적으로 성지로 향한다. 각자의 마음속의 응어리를 담고 성지로 향하는 호레와 동료들. 그리고 성지에 숨겨진 음모와 진실이 밝혀진다.','https://www.lezhin.com/ko/comic/hore','https://ccdn.lezhin.com/v2/comics/76/images/tall.webp?updated=1707961443278&width=420','완결'),
('17세, 오늘부터 동거 시작합니다!','모모타 아코·우로코·넥스큐브·미즈',array['로맨스']::text[],'"친구로 끝낼 생각이었지만…이젠 적당히 봐주지 않겠어!"
고교 진학을 계기로 동경하던 자취를 시작하게 된 히요리. 부푼 꿈을 안고 문을 여는 순간,
같은 중학교를 졸업한 소꿉친구인 소우시가 눈앞에 나타났다?!
난데없이 시작하게 된 룸쉐어로 당황스러운 가운데 묘~한 분위기 속에서 소우시는 예고도 없이 키스를 하고,
그동안 친구로만 느껴졌던 그가 남자로 느껴지','https://www.lezhin.com/ko/comic/17_livetogether','https://ccdn.lezhin.com/v2/comics/5408762474528768/images/tall.webp?updated=1619579003874&width=420','연재'),
('나의 그녀는 구미호 (무삭제판)','서락',array['판타지']::text[],'어느날 나타난 사람을 빨아 먹는 미녀의 나무요괴.
그리고 양기가 충만한 주인공 봉석과 그 곁에 갑자기 나타난 미녀의 구미호..
매혹적인 구미호와 주인공 봉석이 인간세상에 나타난 요괴들에게 맞서 벌이는 모험 러브 판타지 액션물

회를 거듭할수록 더 진화하고 다양한 요괴들이 등장하는데…
주인공 봉석을 보호하는 미녀 구미호의 진짜 정체는 무엇인가?','https://www.lezhin.com/ko/comic/mygirlfox','https://ccdn.lezhin.com/v2/comics/5224792803770368/images/tall.webp?updated=1654184641891&width=420','연재'),
('방황하는 신','1230',array['스릴러']::text[],'잔인한 범죄, 떠도는 악령, 믿음을 강령하는 종교가 뒤섞인 황폐한 세상. 그 속에 인간이 흘린 내면의 흔적을 볼 수 있는 형사 김동. 세상을 구원하라고 떠밀린 그에게 닥친 수많은 위기들! 혼탁을 뛰어넘은 혼돈의 세상을 그가 구원할 수 있을까?','https://www.lezhin.com/ko/comic/lostgod','https://ccdn.lezhin.com/v2/comics/413/images/tall.webp?updated=1787190964386&width=420','완결'),
('룩앳미','KONY',array['드라마']::text[],'사람들의 시선을 피하고 싶은 릴리와 그 시선을 즐기는 니노. 성격도 성향도 정반대인 두 사람은 어느새 10년을 함께 하고 있다. 그리고 이제 그 10년의 우정이 어긋나려 하는데...','https://www.lezhin.com/ko/comic/look_at_me','https://ccdn.lezhin.com/v2/comics/5596823196008448/images/tall.webp?updated=1528945225517&width=420','완결'),
('네 사람','개호주·입개',array['스릴러']::text[],'스트레스를 받으면 도벽으로 푸는 지훈은 같은 반의 인기 많은 여학생 예휘의 스타킹을 훔치다 그녀에게 들키고 만다... 지훈의 약점을 쥐자 평소의 상냥했던 모습과 정반대의 얼굴을 보여주는 예휘. 이제 꼼짝없이 그녀의 &lt;개 노릇&gt;을 하게 된 지훈의 앞날은??','https://www.lezhin.com/ko/comic/4people','https://ccdn.lezhin.com/v2/comics/6327689990111232/images/tall.webp?updated=1668052856805&width=420','완결'),
('우주교도소 바다붐','김용키',array['코미디']::text[],'평범한 외계인 레이첼 맥아담스. 어느 날 살인 혐의로 우주교도소 바다붐에 수감된다. 그는 과연 거친 악당들과 간수들 사이에서 무사히 누명을 벗고 교도소를 벗어날 수 있을것인가?','https://www.lezhin.com/ko/comic/badaboom','https://ccdn.lezhin.com/v2/comics/261/images/tall.webp?updated=1626418336797&width=420','완결'),
('은수','작업실 시보',array['드라마']::text[],'"당신은 누구인가요?" 무엇이든 주목받지 않고는 못 배기는 배은수는 남자친구에게 청혼을 받고 인생의 가장 행복한 시간을 보낸다. 하지만 그 다음날 남자친구의 자살소식을 접하는데... 배은수에게 몰아치는 인생의 천국과 지옥. 강렬한 작품을 선보이는 작업실 시보의 신작!','https://www.lezhin.com/ko/comic/eunsoo','https://ccdn.lezhin.com/v2/comics/6080299074584576/images/tall.webp?updated=1757735015191&width=420','완결'),
('505 생활만화','오배고',array['일상']::text[],'아빠는 유쾌한 방귀쟁이, 엄마는 호전적 웃음쟁이! 오빠는... 그냥 못생겼습니다. 무서우리만치 자비심 없는 표현력, 누구나 따라할 수 있을 것 같은 만만한 그림체! 생활만화계의 이단아 오배고 작가의 회심의 데뷔작! 매주 목요일, 평일 아침 출근길의 씁쓸함을 달래보아요!','https://www.lezhin.com/ko/comic/505_livingtoon','https://ccdn.lezhin.com/v2/comics/495/images/tall.webp?updated=1718085498502&width=420','완결'),
('킬링서클','마사토끼·녹차',array['판타지']::text[],'어느 날 접점도 공통점도 없는 10명의 인간들 앞에 수수께끼의 카드가 나타났다. 그리고 그 카드를 집어드는 순간 그들 사이에서 이 세상의 상식을 벗어난 데스게임이 시작된다! 카드의 능력을 사용해 단 한 명에게만 허락된 승리를 거머쥐고 생존하는 플레이어는 과연 누가 될것인가...?','https://www.lezhin.com/ko/comic/killing_circle','https://ccdn.lezhin.com/v2/comics/4623518973820928/images/tall.webp?updated=1536202800609&width=420','완결'),
('나무 한 그루','이슬기',array['로맨스']::text[],'늦더위가 한창인 어느 여름날. 재수생 여운은 도피하듯 내려온 시골에서 미스터리에 쌓인 남자 차현을 만나게 된다. 바깥세상과의 접촉을 극도로 피하는 그. 하지만 어딘지 말 못할 상처가 있어 보여 자꾸만 궁금하고, 누군가를 닮은 것 같아 신경이 쓰인다. 관심과 위로를 내밀며 천천히 다가가는 여운에게 차현은 과연 마음의 문을 열게 될 것인가...?!','https://www.lezhin.com/ko/comic/a_tree','https://ccdn.lezhin.com/v2/comics/5238784944242688/images/tall.webp?updated=1737086264393&width=420','완결'),
('인헤일','차슈·한큐',array['판타지']::text[],'폭우가 내리던 밤 갑자기 사라진 동생. 사이코메트리 초능력자인 도영은 떨어져 있는 신발을 만져보고 도희가 납치됐음을 알게 되는데, 그때부터 수수께끼의 인물들이 도영을 습격해오기 시작한다. 지구와 균형을 이룬 다른 세계가 존재한다는 사실을 알게 된 도영. 그리고 밝혀지기 시작하는 ‘초능력’과 이세계 ''리브리엄''의 정체…!','https://www.lezhin.com/ko/comic/inhale','https://ccdn.lezhin.com/v2/comics/4690985855221760/images/tall.webp?updated=1651826041244&width=420','완결'),
('벌건 대낮','최용성',array['로맨스']::text[],'제대 후 첫 등교일, 터미널에서 은태는 누군가가 떨어뜨린 버스표로 겨우 지각을 면한다. 강의실에서 어떤 여학생을 보고 한눈에 반한 은태는 출석 체크 때 이름을 알아내는 데 성공했지만, 정작 그 이름의 주인은...  [그다이] 최용성 작가의 로맨스 작품!','https://www.lezhin.com/ko/comic/day','https://ccdn.lezhin.com/v2/comics/5039365024382976/images/tall.webp?updated=1719976395462&width=420','완결'),
('꼴데툰 2018','샤다라빠',array['코미디']::text[],'2017년 처음 맛본 가을 연재. 그리고 2018년! 손아섭의 드라마틱한 잔류, 대형 FA 민병헌의 영입, (구)타격천재 채태인 줍줍. 올해 롯데는 드디어 우승?! 그런데 강민호가 왜 대구에서 나와... 롯데의 성적이 떨어질수록 재밌어진다는 이상한 야구만화 꼴데툰! 전날 경기의 빡침이 잊혀지기 전인 다음 날 오전 11시에 업데이트됩니다. 화요일만 뺀 주6회','https://www.lezhin.com/ko/comic/ggtoon2018','https://ccdn.lezhin.com/v2/comics/5909752900091904/images/tall.webp?updated=1661761937462&width=420','완결'),
('매드 독','하리보',array['로맨스']::text[],'조폭이라는 집안 내력으로 ‘평범한’ 일상에 집착하는 하민. 어느 날 하민이 적대 세력에 납치를 당하는 사건이 벌어지자 그의 아버지는 그 옆에 세혁을 붙여 준다. 그런데 튀어도 너무 튀는 세혁. 평범하고 싶은 하민의 일상에 세혁이라는 강렬한 파문이 일기 시작한다.','https://www.lezhin.com/ko/comic/mad_dog','https://ccdn.lezhin.com/v2/comics/5290374773145600/images/tall.webp?updated=1776996240135&width=420','완결'),
('한여름 이겨울','군밤',array['로맨스']::text[],'한여름에 만나는 이겨울의 서늘한 밀당! 그냥 “겨울이 싫다”고 말했을 뿐인데, 그걸 이겨울이 들어버렸다. 어색함이 싫어 이겨울을 쫓아가던 한여름은 신비한 장소에 다다르는데… 이겨울의 비밀을 알게 된 한여름은 이제 이겨울과 친하게 지낼 수밖에 없는 상황! 신비하고 서늘하면서도 뜨거운 겨울과 여름의 이야기, [한여름 이겨울]의 계절이 시작됩니다!','https://www.lezhin.com/ko/comic/summer_winter','https://ccdn.lezhin.com/v2/comics/6023976890138624/images/tall.webp?updated=1554343203890&width=420','완결'),
('파워 오브 러브','요스',array['판타지']::text[],'꼬맹이 용사와 마왕이 팀 먹고 세계를 제패… 아니 세계를 지키기 위해 싸우는 판타지(스릴, 미스터리, 코믹)액션 만화!!!ㅡ제3회 세계만화공모전 우수상 수상작!','https://www.lezhin.com/ko/comic/thepoweroflove','https://ccdn.lezhin.com/v2/comics/6000717347291136/images/tall.webp?updated=1737602219707&width=420','완결'),
('볕내','박혜민',array['드라마']::text[],'겉으로 보기엔 너무나 평범한 여고, 누가 봐도 똑같아 보였을 우리의 모습. 하지만 2학년 13반 34명 우리들은 저마다의 독특한 취향을 숨 기 고 있 다 ! 일상의 틈을 파고드는 예리한 감성이 매력적인 개성 넘치는 작품. 제2회 세계만화공모전 우수상 수상작!','https://www.lezhin.com/ko/comic/private','https://ccdn.lezhin.com/v2/comics/5835837207216128/images/tall.webp?updated=1737438613663&width=420','완결'),
('고고 스윗맘','뚠뚜루',array['드라마']::text[],'육아 휴직 후 복귀한 회사. 나만 빼고 모두가 앞선 듯한 울적한 느낌에 이래 저래 꿀꿀한 일만 가득하다...! 그럼에도 불구하고 기합 넘치는 워킹맘 홍수진, 아슬아슬한 회사생활도 무사히 헤쳐나갈 수 있을까?','https://www.lezhin.com/ko/comic/sweetmom','https://ccdn.lezhin.com/v2/comics/5785192695070720/images/tall.webp?updated=1737440149562&width=420','완결'),
('보고 싶은 얼굴','진성민',array['스릴러']::text[],'경찰공무원 준비생 3년차 순태. 합격자 명단에 자신의 이름은 없다. 그간 뒷바라지해준 여자친구 나연에게 불합격 소식을 숨긴 채 자취방을 뛰쳐나오고, 홀로 남겨진 나연을 누군가 지켜보고 있다. 순태는 스토커로 추정되는 인물을 발견하고 계속 쫓게 되는데, 그의 얼굴을 본 순간…!','https://www.lezhin.com/ko/comic/signs_of_rain','https://ccdn.lezhin.com/v2/comics/5032382206574592/images/tall.webp?updated=1714443801340&width=420','완결'),
('새장의 소녀','koer',array['로맨스']::text[],'2년 전, 자신을 구해준 소녀를 사랑하게 된 청은. 그녀를 만나길 꿈처럼 기다려오던 어느 날, 학교에서 바로 그 생명의 은인 유미를 만나게 된다. 운명처럼 유미에게 끌리는 청은과, 그런 청은에게 늘 친절한 유미. 그런데 청은을 바라보는 유미의 눈빛은 어딘가 묘한데...구원받은 천재와 구원한 범재의 이야기.','https://www.lezhin.com/ko/comic/cage','https://ccdn.lezhin.com/v2/comics/5299755943067648/images/tall.webp?updated=1737438440850&width=420','완결'),
('이 무슨 대자연인가','상덕이',array['코미디']::text[],'진짜 얕은 정보, 깊은 사심.
특이한 생물들을 뒤틀린 시각으로 알아보는 만화.','https://www.lezhin.com/ko/comic/mothernature','https://ccdn.lezhin.com/v2/comics/6179963773714432/images/tall.webp?updated=1763451757522&width=420','연재'),
('연애경험없는 여기사에게 들이대 보았다','뭐가요·토마토',array['판타지']::text[],'평화의 시대, 최전선에서 숱한 활약을 하고 후방으로 내려와 조용히 복무 중인 기사 리를.
조용한 일상도 잠시, 정체 모를 후배기사 카토가 찾아와 매일마다 연심을 표한다.
일평생 이런 구애를 받아 본 적 없어 늘 당황하는 리를
그런 건 모르겠고 매번 들이대는 카토
사실상 결말은 정해져있지만, 그 과정 속에 그들에겐 어떠한 일들이 있을까','https://www.lezhin.com/ko/comic/femaleknight','https://ccdn.lezhin.com/v2/comics/4506351437676544/images/tall.webp?updated=1746584482670&width=420','완결'),
('마나마나','름새',array['판타지']::text[],'부모님이 갑자기 여행을 가셨다. 그것도 세계여행! 게다가 6개월! 그렇게, 부모님이 돌아오실 때까지 알아서 지내게 된 8남매의 앞에 처음 보는 어린 소녀가 찾아왔다. 어? 뭐라고? 우주에서 왔다고? 그럼… 외계인?!','https://www.lezhin.com/ko/comic/manamana','https://ccdn.lezhin.com/v2/comics/5293032012775424/images/tall.webp?updated=1626417930566&width=420','완결'),
('이림이야기','천호냥',array['드라마']::text[],'고등학교 1학년이 된 조이림 앞에 나타난
미친 돌직진남 채은호.
과연 이림이는 은호가 꽂아대는 직구 세례를 버틸 수 있을 것인가','https://www.lezhin.com/ko/comic/ilimstory','https://ccdn.lezhin.com/v2/comics/5547609250136064/images/tall.webp?updated=1771298780522&width=420','완결'),
('작은 성 : 시들지 않는 꽃','마윤',array['드라마']::text[],'유난히 젊고 아름다운 외모를 유지하고자 노력하는 친구같은 우리 엄마. 어느 날 엄마에게 관심가는 남자가 생긴 것 같은 느낌적인 느낌! 그런데 그 상대는 알고보니 사랑하는 내 남자친구?! 영원한 젊음과 관심에 대한 엄마의 욕망은 과연 어디까지 일까...!!','https://www.lezhin.com/ko/comic/little_castle','https://ccdn.lezhin.com/v2/comics/5004416026673152/images/tall.webp?updated=1771299108284&width=420','완결'),
('방과후에 2','권골수',array['스릴러']::text[],'참혹했던 살인사건이 있고 2년 후 준휘는 고3을 앞두고 있다. 겉으로는 친구들도 사귀며 괜찮아 보이지만 여전히 죽은 친구들의 환영을 보며 그 일을 잊지 못한다. [ 찰칵,찰칵 ] 그러던 어느 날 20대 여성 연쇄 실종 사건으로 또다시 주변이 시끄러워지기 시작하는데, 준휘와 친구들의 앞에 드리우는 어두운 그림자, 그리고 카메라 셔터음[ 찰칵- ] 과연 그들에','https://www.lezhin.com/ko/comic/afterschool2','https://ccdn.lezhin.com/v2/comics/6379868015820800/images/tall.webp?updated=1550038384410&width=420','완결'),
('일진녀 길들이기[완전판]','유종표',array['드라마']::text[],'빵셔틀 규연은 빵셔틀 탈출을 목표로 고등학교에 진학 했지만, 입학 첫날부터 일진 아린이와 입맞춤을 해버리면서 모든게 꼬여버렸다?!  
 
시즌3 95화~
시즌2 38화~94화
시즌1 1화~37화','https://www.lezhin.com/ko/comic/hell_fist_girl','https://ccdn.lezhin.com/v2/comics/6465665868496896/images/tall.webp?updated=1627960200404&width=420','완결'),
('흔해빠진 세계관 만화 II','폴빠',array['판타지']::text[],'갑작스런 죽음을 맞이한 젊은 학자 알레리. 자신의 영혼을 거두어갈 존재는 신이라 믿었으나, 정작 찾아온 건 사신이 아닌 평범한 노인과 여자(?)였다. 자신이 고민하고 상상하던 것과 많이 다른 사후세계를 만나게 된 알레리… 이 이야기는 죽음은 또 다른 시작임을 깨닫게 된 알레리의 내세 관광일지인 것이다. 레진코믹스의 명작 판타지 ''흔세만'', 그 두 번째 이야','https://www.lezhin.com/ko/comic/commonworld2','https://ccdn.lezhin.com/v2/comics/4711695488647168/images/tall.webp?updated=1769509117790&width=420','완결'),
('강하다! 이서영','개구락지',array['드라마']::text[],'학교의 짱 ''김우준''. 짱의 자리를 위협(?)하는 강한 짝꿍 ''이서영''.
불안한 짱의 자리를 두고 항상 승부를 거는 우준이지만 어째 서영에겐 귀여운 장난에 불과하다.
승부가 일상이 되어갈 때 쯤, 서로에게 새로운 감정이 싹트기 시작하는데...','https://www.lezhin.com/ko/comic/strong','https://ccdn.lezhin.com/v2/comics/4842032246620160/images/tall.webp?updated=1771298796451&width=420','완결'),
('예전고','김선우',array['코미디']::text[],'예체능계열 전문 고등학교에 전학 온 최고의 아이돌 성민지. 그녀의 이상형은 "강한 남자". 세상 어디에도 없었던 이상한 전쟁이 시작된다. [노멀모드] 김선우 작가의 데뷔작, 고화질 재편집. 프리미엄 병맛 학원물.','https://www.lezhin.com/ko/comic/artshighschool','https://ccdn.lezhin.com/v2/comics/6381972271661056/images/tall.webp?updated=1676279924965&width=420','완결'),
('라즈베리 샌드위치','차우민',array['드라마']::text[],'개학, 이사, 새로운 이웃- 정후에게 이번 학기는 유난히도 새롭다. 그중에서도 새로운 이웃 지영은 자신을 귀찮게 만든다. 단순히 귀찮은 이웃이라 생각했지만 왠지모르게 정후의 눈에는 그녀와 그녀의 반지가 자꾸만 신경 쓰이는데. &lt;오타쿠를 짝사랑하는 법&gt; 차우민 작가의 로맨스 드라마 &lt;라즈베리 샌드위치&gt;!','https://www.lezhin.com/ko/comic/raspberry','https://ccdn.lezhin.com/v2/comics/6624158499995648/images/tall.webp?updated=1692161221937&width=420','완결'),
('공백기','전민지',array['드라마']::text[],'평범한 아이돌 팬이었던 백희 앞에 펼쳐지는 비범한 일상들','https://www.lezhin.com/ko/comic/kuhakuki','https://ccdn.lezhin.com/v2/comics/5624953393643520/images/tall.webp?updated=1727235371656&width=420','완결'),
('구룡특급','이해민',array['로맨스']::text[],'대역배우로 일하고 있는 첸추옌은 홍콩에서 열리는 종합격투기 경기 퍼시픽의 장민 메인 이벤트를 보기 위해 여행 계획을 짜던 중 숙식을 해결해주는 대가로 애인대행을 요구하는 궉런을 알게 된다. 그의 요구를 수락하고 첸추옌은 홍콩의 거리로 떠나게 되는데. [복서들]의 이해민 작가 신작, 보는 것만으로도 눈이 즐거운 신작 BL [구룡특급] 시작합니다.','https://www.lezhin.com/ko/comic/kowloonextraclass','https://ccdn.lezhin.com/v2/comics/266/images/tall.webp?updated=1550130278607&width=420','완결'),
('이름을 말하지 않는 악마','성범',array['판타지']::text[],'어느 날 자고 일어나보니 내 옆에 악마가 떨어졌다. 그런데 이 악마,다짜고짜 빌붙어 지내는게 밉기는 커녕 귀엽고 엉뚱한 허당매력 덩어리다! 보면 볼수록 어딘지 챙겨주고 싶은 여동생같은 그녀는 자신의 이름을 ''안''이라 소개하는데.. 인간 ''유해이''와 악마 ''안''의 꽁냥넘치는 동거동락 일상 판타지!','https://www.lezhin.com/ko/comic/noname','https://ccdn.lezhin.com/v2/comics/4736046550745088/images/tall.webp?updated=1737438498537&width=420','완결'),
('가후전','마사토끼·배민수',array['드라마']::text[],'가후! 단 한번도 실패한 계책을 내지 않았다. 제갈량보다 뛰어난 책사. 또는 한 주군을 섬기지 않는 변절자. 극과 극의 평가를 오가는 그는 인간의 마음 속 어둠을 들여다보며 욕망을 주무른다. 그의 시점에서 바라보는 또 다른 삼국지. 희대의 이야기꾼 마사토끼와 강력한 작화력을 가진 배민수 작가 작품.','https://www.lezhin.com/ko/comic/gahu','https://ccdn.lezhin.com/v2/comics/33/images/tall.webp?updated=1550208017474&width=420','완결'),
('새벽을 얽매는 뱀 - 흔세만 스핀오프 2','폴빠·lot',array['판타지']::text[],'신이 몰락하고 새로운 시대가 시작된 지 50년, 요정들은 신앙이 몰락해 혼돈에 빠진 인간들과 함께 살게 되었다. 그리고 옛부터 서로 대립해오던 인간 왕국들의 갈등과 사건들이 맞물려 만드는 거대한 소용돌이! ‘흔해빠진 세계관 만화’ 결말로부터 50년 후, 두 모험가의 발자취를 따라가며 바뀌어버린 세상을 내딛는다!','https://www.lezhin.com/ko/comic/dawn_snake','https://ccdn.lezhin.com/v2/comics/316/images/tall.webp?updated=1769509090204&width=420','완결'),
('언더페인팅','내리',array['드라마']::text[],'색칠해 줘. 우리들의 인생을, 철 없는 밑그림을. 서로 다른 욕망을 가진 청춘들의 섹시하고 아릿한 로맨틱 성장 드라마.','https://www.lezhin.com/ko/comic/underpainting','https://ccdn.lezhin.com/v2/comics/5229324152864768/images/tall.webp?updated=1737360295842&width=420','완결'),
('트러블X트러블 돌','로에트하이',array['코미디']::text[],'인형과 마법이 발전된 시대, 힐러 아데르트는 일상의 적적함을 달래기 위해 메이드 마법인형 밀드를 구입한다. 그렇게 시작된 밀드와의 생활은 행복 끝, 고생시작? 히키코모리 주인님 아데르트와 주인님을 너무 좋아하는 깨발랄 마법인형 밀드의 시끌벅적 일상 이야기!','https://www.lezhin.com/ko/comic/troublextroubledoll','https://ccdn.lezhin.com/v2/comics/4648163528409088/images/tall.webp?updated=1626417582988&width=420','완결'),
('초년의 맛','앵무',array['드라마']::text[],'살기 위한 에너지원 그 이상... 우리는 음식을 통해 위로받고 소통하고 또 마음을 나눈다. 음식을 통해 만나고 나아가는 이 시대 초년생들의 달콤 쌉쌀한 인생의 맛, 먹방 청춘만화 &lt;초년의 맛&gt;!','https://www.lezhin.com/ko/comic/rookie','https://ccdn.lezhin.com/v2/comics/5771872688144384/images/tall.webp?updated=1602321641534&width=420','완결'),
('누설','손일지',array['판타지']::text[],'어느 날 부터 혼령과 접신하는 자들이 나타난다. 기이한 모양으로 태어난 이들은 영매사라 불리우며 이내 사람들에게 배척당하고, 그들은 자신만의 삶을 찾아 각지를 떠도는데.. 타고난 접신술로 혼령과 소통하는 영매사와 이들을 잡는 혼령사냥꾼의 한 판 활극','https://www.lezhin.com/ko/comic/nooseol','https://ccdn.lezhin.com/v2/comics/217/images/tall.webp?updated=1601537337275&width=420','완결'),
('소라소라','모미',array['로맨스']::text[],'뚱보 콤플렉스의 강소라는 전학 첫날부터 차갑고 잘생긴 동급생 백소라를 짝사랑하게 된다. 하지만 백소라는 어째서인지 강소라의 감정을 거부하는데… 낙담한 강소라의 발길이 닿은 곳은 소원을 들어준다는 전설의 벚나무 앞이었다.','https://www.lezhin.com/ko/comic/sorasora','https://ccdn.lezhin.com/v2/comics/6197498578468864/images/tall.webp?updated=1714443575105&width=420','완결'),
('독고','민·백승훈·투유드림·투유',array['액션']::text[],'왕따를 당하던 형의 죽음으로 한 가정이 파괴되었다. 참을 수 없는 울분을 동생은 조용히 삼키며 학교로 가게된다. 
완벽히 일년 전 강후가 사고로 죽던 그날이 재연되면서 곧이어 일진회를 박살내기 위한 혁의 전투가 시작되는데...','https://www.lezhin.com/ko/comic/dokgo','https://ccdn.lezhin.com/v2/comics/5540785488920576/images/tall.webp?updated=1554343203890&width=420','완결'),
('달토끼와 안드로이드','개호주·뉴꼬',array['코미디']::text[],'영재소녀 세오는 고등학생이 되자 WASA에 스카우트 되어 달을 가게 된다. 오랫동안 세오를 짝사랑했던 연우는 그녀가 남기고 간 연구소를 관리하기로 한다. 그녀의 환심을 사기 위해 연구소를 청소하던 중 수상한 캐비닛을 발견한 연우. 호기심을 참지 못하고 열고 만다. 
경고음 소리와 들리는 익숙한 목소리는……세오...투?!','https://www.lezhin.com/ko/comic/moonrabbit','https://ccdn.lezhin.com/v2/comics/4508665371033600/images/tall.webp?updated=1689316982399&width=420','완결'),
('나오미','서지',array['액션']::text[],'프로복서를 지망하는 토니의 잣 같은 인생에 한줄기 청량음료같은 여자, 나오미가 나타났다.','https://www.lezhin.com/ko/comic/naomi','https://ccdn.lezhin.com/v2/comics/230/images/tall.webp?updated=1550050906831&width=420','완결'),
('이렇게 귀여운 간첩은 어디에 신고하나요?','이현민·여강현·JQ스튜디오',array['액션']::text[],'수학천재 박동구에게 찾아온 북조선 애미나이?! 날 유혹해서 북으로 데려간다니!! 근데 얘 간첩 맞아? 이렇게 귀여운 간첩이라니~♥','https://www.lezhin.com/ko/comic/cute_spy','https://ccdn.lezhin.com/v2/comics/5768553949691904/images/tall.webp?updated=1617093694167&width=420','완결'),
('왓치가이','마사토끼·ASURA',array['드라마']::text[],'시간의 왜곡을 감지할 수 있는 소년 성운협은 시간을 멈출 수 있는 소녀 정은하와의 만남으로 인해 시간능력의 본질과 그 능력의 소유자들의 존재에 대해 파고들게 된다. 그러던 중 시간능력이 십수 년 전에 일어난 어떤 사건과 깊숙이 연결되어 있다는 사실을 알게 되는데...','https://www.lezhin.com/ko/comic/watchguy','https://ccdn.lezhin.com/v2/comics/4625200343023616/images/tall.webp?updated=1762862588647&width=420','완결'),
('월하노인','꿀자몽',array['판타지']::text[],'매일밤 꿈속에 나타나는 그녀가 현실에 나타나다! 중국에서 온 수수께끼의 미녀 라메이는 호준에게 자신이 운명의 상대라고 주장하는데.. 과연 그녀의 정체는?','https://www.lezhin.com/ko/comic/undermoon','https://ccdn.lezhin.com/v2/comics/4910621803413504/images/tall.webp?updated=1520223474332&width=420','완결'),
('노멀 모드','김선우',array['코미디']::text[],'얼핏보면 평범해 보이는 일상세계. 하지만 남자가 25살이 될 때까지 동정이면 마법사가 된다는 전설이 있다. 그러던 어느날, 전 세계의 남자들 중 “마법사”의 비중이 절반을 넘어가고... 그들은 자신들의 모든 마력을 모아 염원을 담아 세상을 뒤집어버린다.
그것은 바로 남녀의 역할과 개념이 완전히 바뀌어 버린 세상. 여자가 군대에 가고, 남자가 임신을 하는 세','https://www.lezhin.com/ko/comic/normal_mode','https://ccdn.lezhin.com/v2/comics/97/images/tall.webp?updated=1549868108662&width=420','완결'),
('탈격소년','윤소함',array['코미디']::text[],'어느날 나에게 ''능력''이 생겼다. 어릴적부터 특별한 사람이 되고 싶었지만 어째서 하필 이 능력이었을까...손에 닿는 사람을 강제로 탈의시키는 능력을 얻게 된 강하진의 엉망진창 히어로 대작전!','https://www.lezhin.com/ko/comic/undressingpunchboy','https://ccdn.lezhin.com/v2/comics/6190538380541952/images/tall.webp?updated=1691487588750&width=420','완결'),
('데스티니','천지이변',array['판타지']::text[],'죽어도 죽지 않는 녀석들
무엇이든 척척 해결하지만 결벽증인 리더 잭
소심하면서도 엉뚱한 고스트 잭
고통을 즐기는 마조히스트 마조 잭
그리고..
어리버리한 신입사원 막내 잭
평범한듯 평범하지 않은 회사생활.
네명의 잭(Jack)이 뭉쳐 사건을 해결한다!','https://www.lezhin.com/ko/comic/destiny','https://ccdn.lezhin.com/v2/comics/271/images/tall.webp?updated=1665558312513&width=420','완결'),
('킬러가 사랑에 빠졌을 때','에레세모',array['로맨스']::text[],'[속보] 프로 킬러 주태만이 국내 최고의 배우 강다혁에게 반해버렸다! 

극강의 훈련과 교육 그리고 잔인한 고문도 견뎌낸 프로 킬러 주태만, 그러나 어째서인지 강다혁의 다정함에는 손쉽게 무너지는데...?
ㅡ 프로킬러 NN년차, 설마 이게 바로 사랑? 그러면 이럴 때는 어떻게 해야 하지?','https://www.lezhin.com/ko/comic/killer','https://ccdn.lezhin.com/v2/comics/6181022497832960/images/tall.webp?updated=1777863133632&width=420','연재'),
('두근두근 사내연애','푸픈',array['로맨스']::text[],'만난지 어느덧 10년.  행복하기만 했던 학창시절을 지나 주성은 어엿한 신입사원이 되었고 명하는 아직 취준생 신세를 벗어나지 못하고 있다. 늘 함께였고 모든 것을 공유해온 두 사람은 주성의 새로운 팀장, 영군이 나타나면서 둘의 관계에 크고 작은 갈등을 겪게 되는데…','https://www.lezhin.com/ko/comic/dokidoki_love_in_office','https://ccdn.lezhin.com/v2/comics/5813390907015168/images/tall.webp?updated=1557738059824&width=420','완결'),
('금지 구역','단추',array['로맨스']::text[],'상처 많고 위태롭던 청춘의 그 시절, 어른들이 정해놓은 금지 구역, 그곳에서 위험한 쌍둥이를 만났다. 거칠어 보이지만 속은 따뜻한 하루, 늘 웃고 다니지만 속을 알 수 없는 영원. 소문이 무성한 쌍둥이 형제의 엇갈린 사랑이 그곳에서 시작된다...','https://www.lezhin.com/ko/comic/exclusion_zone','https://ccdn.lezhin.com/v2/comics/4554142476664832/images/tall.webp?updated=1700208872737&width=420','완결'),
('바람','반메',array['판타지']::text[],'이세계의 경계와 존재를 인지하는 지상계의 생명들. 그 중 인간을 도사, 축생을 요괴라 부른다. 인간 도사 제철, 여우 요괴 문수, 그리고 돗가비 납은 각자의 바람과 운명을 지니고 저승문으로의 여정을 떠나는데... 제3회 세계만화공모전 대상 수상작 &lt;바람&gt;, 드디어 그 기나긴 여정이 시작됩니다.','https://www.lezhin.com/ko/comic/wind','https://ccdn.lezhin.com/v2/comics/6400253992501248/images/tall.webp?updated=1667379477270&width=420','완결'),
('마사토끼 극장','마사토끼',array['코미디']::text[],'소재불문 장르불문 마사토끼 단편극장.','https://www.lezhin.com/ko/comic/masamana','https://ccdn.lezhin.com/v2/comics/5883592652357632/images/tall.webp?updated=1626417166775&width=420','완결'),
('재즈처럼','클라쥬',array['로맨스']::text[],'“음악실에서 연주하는 거 한 번만 더 내 눈에 띄면 죽는다” 세헌은 전학 온 첫 날부터 음악실을 찾아 피아노를 친다. 홀린 듯 세헌의 연주를 듣다가 정신이 든 태이는 음악실 문을 박차고 들어가 무슨 이유인지 세헌을 협박하는데… 정해진 룰도 없이 즉흥적으로 연주하는 음악 재즈. 과연 어떤 과거와 현재, 미래가 이 아이들을 연주할까?','https://www.lezhin.com/ko/comic/jazz','https://ccdn.lezhin.com/v2/comics/6252585199337472/images/tall.webp?updated=1787301553724&width=420','완결'),
('메꽃 ~오후 3시의 연인들~','김정현',array['드라마']::text[],'레진코믹스와 김정현 작가가 2014년 일본 여름을 강타한 후지TV의 드라마 [메꽃]을 만화화했다! 남편만을 바라보는 평범한 가정주부 사와와 불륜이 가정을 지킬 수 있다는 리카코. 절대 공통점이 없을 것만 같은 두사람도 오후 3시의 적적함만은 다르지 않았다. 죄의식을 꿰뚫고 은밀하게 피어난 그녀들의 불륜. 용서할 수 있는 죄와 용서할 수 없는 죄, 당신은 어','https://www.lezhin.com/ko/comic/hirugao','https://ccdn.lezhin.com/v2/comics/6395077662867456/images/tall.webp?updated=1556858083856&width=420','완결'),
('꼴데툰 2019','샤다라빠',array['코미디']::text[],'대형 FA는 아무도 오지 않았고 지구 온난화 때문인지 ''봄데''의 시범경기 성적도 바닥. 설상가상 뜬다던 달의 정체는 양상... 그러나 우린 그가 비밀번호를 끊어버린 걸 아직 기억하고 있다. 원래 가을 야구는 격년제... 그러니 올해 롯데는 드디어 우승! 샤다라빠 작가의 어깨는 쓰면 쓸수록 강해지니까 올해도 화요일만 뺀 주6회 혹사 연재로 (가을까지) 갑시다','https://www.lezhin.com/ko/comic/ggtoon2019','https://ccdn.lezhin.com/v2/comics/5396897098760192/images/tall.webp?updated=1661761939824&width=420','완결'),
('달콤한 나의 초콜릿','한민기',array['드라마']::text[],'16살 초코. 사람 나이로 80세에 가까운 반려견. 크리스마스 이브 야근중에 엄마에게 날아온 문자 "초코가 많이 아프다” 언제나 함께 있는 게 당연하다 생각했던 초코는 노견이 되었다. 개를 싫어했던 첫째 소미, 초코와 함께 살겠다며 가족과 싸운 둘째 소영, 초코와 가장 많은 시간을 보낸 셋째 소진. 그들은 이제 초코와의 이별을 준비해야 한다. &lt;우리는','https://www.lezhin.com/ko/comic/choco','https://ccdn.lezhin.com/v2/comics/4964897716830208/images/tall.webp?updated=1769151662883&width=420','완결'),
('전학생 장득칠','이동길',array['코미디']::text[],'착하게 생겼고, 착하고 싶은 깡패 장득칠! 거칠게 생겼지만 모범생에 마음까지 착한 그의 추종자들! 안 맞는 것 같지만 알고보면 찰떡궁합, 엉뚱하고 언밸런스한 그들의 학교생활이 시작됐다!','https://www.lezhin.com/ko/comic/jandeuk7','https://ccdn.lezhin.com/v2/comics/450/images/tall.webp?updated=1626418634652&width=420','완결'),
('춤추는 도련님','하양지',array['일상']::text[],'교수님의 부탁으로 시골에서 홀로 생활하게 된 용주. 잔잔한 전원생활은 만족하지만 어딘가 외롭다고 느낀다. 외로운 용주, 수상한 이웃 도련님과 친해지기 위해 고군분투를 하는데..! 어색하기만한 용주와 도련님이 서서히 마음을 열어가는 잔잔하지만 가볍지 않은 이야기. 특유의 감성으로 돌아온 [달콤한애드립], [우리는 시간문제] 하양지 작가의 최신작, [춤추는 도','https://www.lezhin.com/ko/comic/dancewithme','https://ccdn.lezhin.com/v2/comics/6598828365447168/images/tall.webp?updated=1520223549444&width=420','완결'),
('김무녀는 무녓무녓해!!','리치후',array['판타지']::text[],'16살 김무녀, 그녀의 인생에서 가장 대단한 이벤트는 치킨집 오픈, 장래희망은 치킨집 손님! 김무녀에게 세상에서 치킨보다 중요한 것은 없었다... 등교길에 마물을 만나기 전까지는! 압도적인 힘으로 사람들을 해치며 김무녀에게 다가오는 마물. 짧은 무녀의 생은 이대로 끝난 것인가 싶었던 그 순간! 그녀의 주먹 한 방에 마물이 쓰러졌다? 갑작스럽게 각성된 힘, ','https://www.lezhin.com/ko/comic/munyeo','https://ccdn.lezhin.com/v2/comics/6506490831831040/images/tall.webp?updated=1737439539320&width=420','완결'),
('신세계의 주민','김정훈',array['코미디']::text[],'인류멸망이 현실이 된 세상 ''신세계''. 우연히 살아남게된 정일호는 자칭 신세계의 주인이라고 하는 서주민을 만나 노예 1호로 불리게 되는데..','https://www.lezhin.com/ko/comic/newworld','https://ccdn.lezhin.com/v2/comics/306/images/tall.webp?updated=1700645974236&width=420','완결'),
('탐정 메모리즈','마사토끼·ASURA',array['스릴러']::text[],'내게는 특별한 능력이 있다. 그것은 타인의 기억 속으로 들어갈 수 있는 능력. 나는 오늘도 그 기억 속을 종횡무진하고 있다. 내 탐정 인생의 원점이 된, 어린 시절 단 한 번 기억 속에서 스쳐 지나간 그녀를 구하기 위해서... 내 이름은 김유진, 좀처럼 사무실에서 나가는 일 없는 약간 치사한 탐정이다.','https://www.lezhin.com/ko/comic/detective','https://ccdn.lezhin.com/v2/comics/6290704991780864/images/tall.webp?updated=1550718000942&width=420','완결'),
('파라독스(PARADOX)','김현수',array['판타지']::text[],'꿈 속 그곳에서도 가장 깊은, 몽마가 인간의 공포심을 얻기 위해 악몽을 꾸게하는 몽마들의 세계 ''파라독스''. 그곳에 나타난 몽마살해범 미스트로 더이상 악몽은 인간만의 것이 아니게 된다! 기억을 잃은 채 모든 몽마를 죽이기 위해 싸우는 몽마 미스트와 그를 주변으로 모이는 친구, 동료, 그리고 적까지. 몽마들의 악몽이 시작됩니다!','https://www.lezhin.com/ko/comic/paradox','https://ccdn.lezhin.com/v2/comics/6588281834176512/images/tall.webp?updated=1550043508393&width=420','완결'),
('니 친구 김저키','김저키',array['일상']::text[],'악마에게 항문을 판 블록버스터 일상툰','https://www.lezhin.com/ko/comic/kimjerky','https://ccdn.lezhin.com/v2/comics/5118126189576192/images/tall.webp?updated=1761617646964&width=420','완결'),
('블랙 서바이벌 - Bottomless Pit','권나현·소루',array['액션']::text[],'살인이 벌어지던 섬. 이 곳에 위클라인은 기억을 잃은 채 버려져 있었다. 살기 위해 괴물들로부터 도망치고, 사람들을 죽여가며 그녀는 조금씩 기억을 되찾아 가는데… ‘블랙 서바이벌’ 위클라인의 이야기.','https://www.lezhin.com/ko/comic/black_survival_bp','https://ccdn.lezhin.com/v2/comics/5341080231346176/images/tall.webp?updated=1520223491375&width=420','완결'),
('미앙 가문의 돼지','늴릴·삼박',array['판타지']::text[],'강한 자들의 식량으로 길러진 이름 없는 소년과 그를 흡혈한 소녀. 그리고 저주받은 가면과 감정이 없는 미치광이. 그들이 함께 대륙을 돌아다니며 겪는 기묘한 이야기.','https://www.lezhin.com/ko/comic/pig','https://ccdn.lezhin.com/v2/comics/4820972082954240/images/tall.webp?updated=1737438555442&width=420','완결'),
('꼴데툰 2020','샤다라빠',array['코미디']::text[],'유례없는 방식의 FA계약으로 우승청부사 안치홍 영입! 
그리고 월드빠던스타 전준우는 염가(?)에 FA연장계약!!
사실상 스토브리그 최고 대어는 24시간, 일주일 내내 전력보강에 힘쓰는 성단장이었나..
꼴데툰 최초 어린이날 연재 개시! 올해도 주6회 등판하는 웹툰계 혹사만화!!
(그런데 이대로라면 올해는 모든 팀이 가을야구?!)','https://www.lezhin.com/ko/comic/ggtoon2020','https://ccdn.lezhin.com/v2/comics/4548712561967104/images/tall.webp?updated=1661762082408&width=420','완결'),
('수컷의 경우','이뱅',array['드라마']::text[],'꼬봉 생활만 3년! 중학교 들어오자마자 전태용에게 찍혀 까라면 까고 기라면 기는
괴로운 학창시절을 보내야만 했던 진경우.. 드디어 고등학교 배정을 받아 꼬봉생활을 청산하는 줄 알았는데…..?','https://www.lezhin.com/ko/comic/male','https://ccdn.lezhin.com/v2/comics/6186237313548288/images/tall.webp?updated=1707813887750&width=420','완결'),
('나의 기사님이랑','마요너구리',array['드라마']::text[],'콧대 높은 공작가의 후계자 아벨 라이언은 매너없이 중매를 거절하는 것으로 유명하다. 여느 때와 같이 중매를 파토내고 나오던 길, 상대의 기사 로렌은 아벨에게 결투를 신청한다. 괘씸함에 로렌에게 한마디를 하려던 아벨! 그런데 얘, 좀 귀엽다..? 공작가의 철벽남 아벨이 남자에게 반하는 전대미문의 사건! 과연 아벨은 그렇게 게이가 되고 마는가..!','https://www.lezhin.com/ko/comic/with_my_knight','https://ccdn.lezhin.com/v2/comics/5096934880051200/images/tall.webp?updated=1737439263422&width=420','완결'),
('아깨사','우빵',array['판타지']::text[],'그날 이후 사람들의 수면시간이 늘었다. 한번 잠들면 언제 깨어날지 알 수 없게 된 사람들. 하지만 매일 잠들어 있는 사람들을 찾아가 그들의 아침을 깨워주는 직업이 존재한다면? 독특한 설정의 경쾌발랄한 현대 판타지 &lt;아깨사&gt; 지금 시작합니다.','https://www.lezhin.com/ko/comic/morning','https://ccdn.lezhin.com/v2/comics/5084060970647552/images/tall.webp?updated=1737601738618&width=420','완결'),
('LOVE WINS','목도리',array['로맨스']::text[],'「 레진챌린지에서 독자들의 정신이 아찔해지게 웃기고 설렜던 선 결혼 후 연애 로맨스!! 」
동성혼 합법화 소식에 들떠 번개에 나간 모쏠 레즈 이다연. 
술에 취해 모르는 여자와 혼인신고를 해버렸다....!?','https://www.lezhin.com/ko/comic/lovewins','https://ccdn.lezhin.com/v2/comics/4527189402124288/images/tall.webp?updated=1759895879508&width=420','완결'),
('꼴데툰 2017','샤다라빠',array['코미디']::text[],'이대호가 돌아왔다. 이대로 꼴데 우승?! 2013년 꼴데툰 시리즈가 시작된 이래로 롯데는 가을야구, 샤다라빠는 가을연재를 해본 적이 없다. 과연 2017년은 더블 징크스 파괴의 한 해가 될 것인가?! 딥빡과 감동의 롯데 만화, 올해는 하루 빠른 개막에 맞춰 연재 개시! 시즌 중엔 무료 연재!!','https://www.lezhin.com/ko/comic/ggtoon2017','https://ccdn.lezhin.com/v2/comics/5560126669586432/images/tall.webp?updated=1661762069156&width=420','완결'),
('세상에서 젤 어려운 연애','유승종',array['로맨스']::text[],'나만 그런 건가? 남들 다한다는 연애. 도대체 왜 이렇게 어려운 걸까?! 어릴 때부터 한집에 살아온 시원털털 미녀 지원과 부드럽고 섬세한 덩치 모쏠남 장군. 둘 다 연애랑 담쌓은 지 오래. 익숙해도 너무 익숙한 둘 사이에도 과연 두근두근한 기류가 생기는 게 가능할까? &lt;웰컴 투 미미살롱&gt;&lt;새빨간 결혼&gt;의 유승종 작가의 새로운 심쿵로맨스','https://www.lezhin.com/ko/comic/tough_love','https://ccdn.lezhin.com/v2/comics/6672741312495616/images/tall.webp?updated=1660269439374&width=420','완결'),
('5月 하늘의 돋보기','김탁',array['로맨스']::text[],'원래 죽으면 천국이든 지옥이든 가버려야 맞지만, 네가 29개의 꽝과 1개의 당첨중 당첨쪽에 걸린다면..다른 세계에서 한번의 삶을 더 살수 있을지도 모르거든.'' 그렇게 나는 두번째 삶을 살게 되었다.','https://www.lezhin.com/ko/comic/maysky','https://ccdn.lezhin.com/v2/comics/212/images/tall.webp?updated=1550040799127&width=420','완결'),
('청춘어람','김민소',array['스릴러']::text[],'14년 전, 고등학생 한 명이 자살한다. 병명은 우울증. 이 소식이 뉴스로 보도된 날 밤, 자살한 학생과 같은 교복을 입은 네 명이 사건 현장으로 은밀히 숨어드는데… 그리고 14년 후, 형사 앞으로 전달된 수취인 불명의 서류 봉투 속에 든 진실은 과연?! &lt;딜리셔스&gt; 김민소 작가의 컴백작!','https://www.lezhin.com/ko/comic/better_spring','https://ccdn.lezhin.com/v2/comics/5695752626765824/images/tall.webp?updated=1702905905342&width=420','완결'),
('대표님의 삐뚤어진 사랑','Hongshu·Rose Studio·Nianhuarexiao·스토리숲',array['로맨스']::text[],'[휴재 중] "도망쳐 봐야 내 손바닥 안이지." 

자신을 버린 전 남자 친구에게 복수하기 위해 악마 같은 남자 강재준과 계약을 하게 된 문가영. 그런데 이 남자 정말 괜찮은 걸까? 문가영은 자신의 주변인들까지 조여오는 강재준의 집착에서 벗어나기 위해 고군분투하는데...
​
문가영은 삐뚤어진 강재준에게서 벗어나 원래의 평범한 삶을 살아갈 수 있을까?','https://www.lezhin.com/ko/comic/ceos_crooked_love','https://ccdn.lezhin.com/v2/comics/5459019290705920/images/tall.webp?updated=1744189406392&width=420','연재'),
('흔해빠진 세계관 만화','폴빠',array['판타지']::text[],'빛, 어둠, 생명, 죽음의 4대신이 존재하는 세상, 인류의 힘으로는 닿을 수 없는 신화의 벽이 존재하고 있다. 인생 마지막 저서로 미약하나마 세계의 형태를 최대한 자세하게 기록하려던 인간 노학자 그레고리 엘름, 그리고 그를 통해 최초로 인간 세계를 접하게 된 엘프 지니에. 유한한 인간의 삶으로 인한 이별이 찾아왔을 때, 세계를 뒤덮는 급격한 운명의 파도가 ','https://www.lezhin.com/ko/comic/commonworld','https://ccdn.lezhin.com/v2/comics/27/images/tall.webp?updated=1769509154405&width=420','완결'),
('너도 좋고 너도 좋고 너도 좋고','이준',array['로맨스']::text[],'〈 왜 꼭 한 명만 사랑해야 해? 〉 전 세계 인구 73억 명 중 반이 남자인데 오직 단 한 사람을 사랑해야 한다는 것을 이해할 수 없는 퍼펙트 한 X년 반하다. 그리고 반하다가 사랑한 세 명의 매력적인 남자들이 펼쳐 나가는, 좌충우돌 본격 로맨틱 코미디.','https://www.lezhin.com/ko/comic/likeyouyouyou','https://ccdn.lezhin.com/v2/comics/4611369868197888/images/tall.webp?updated=1737439136510&width=420','완결'),
('citrus 시트러스','사부로우타·레진코믹스',array['로맨스']::text[],'외모는 영락없이 노는 여고생이지만 한 번도 사랑을 해본 적 없는 유즈는, 부모님의 재혼으로 전학가게 된다.남자친구가 안 생겨! 하고 불만이 폭발한 전학 첫날, 검은 머리 미인인 학생회장 메이와 최악의 방식으로 만나게 된다. 그후 우연히 메이와 훈남 담임선생님의 키스 장면을 목격하고 마음과는 반대로 그 장면을 머리에서 지울 수 없는 유즈. 게다가 학생회장과 ','https://www.lezhin.com/ko/comic/citrus','https://ccdn.lezhin.com/v2/comics/4520115655147520/images/tall.webp?updated=1749090532477&width=420','연재'),
('어둠이 스러지는 꽃','므앵갱',array['판타지']::text[],'죽은 자의 영혼을 거두는 저승사자, "어둠"을 보는 어느 노인과 "어둠"을 벗삼아 자란 난길. 그리고 노인의 곁을 떠나지 않는 또 다른 어둠이 있다. 어느 날 할머니와 난길의 앞에 어둠을 베는 칼과 남자가 나타난다.
한국적인 삶과 죽음의 세계를 "어둠"이라는 존재로 풀어내는 퓨전 판타지 사극.','https://www.lezhin.com/ko/comic/audum_kkot','https://ccdn.lezhin.com/v2/comics/9/images/tall.webp?updated=1718088257693&width=420','완결'),
('게임은 살인이다','우왕이·핫핑크',array['판타지']::text[],'정체불명의 가상현실 게임 ''케이지''
자신과 인연이 있던 스승이자 어린아이인 &lt;요를&gt;을 GM인 유타기의 손에 잃고나서
유타기를 진심으로 죽이기 위한 방법을 찾기 위해 강해질 방법을 찾게 되는데...
&lt;내게 게임은 살인이다&gt;의 정식 후속작.','https://www.lezhin.com/ko/comic/gamesal','https://ccdn.lezhin.com/v2/comics/4948172147064832/images/tall.webp?updated=1757656336282&width=420','연재'),
('요즘 요괴','이즐라',array['판타지']::text[],'염라대왕의 실수로 죽어버린 여주인공. 그런데 저승사자의 조수를 하라고? 요괴가 되라... 그말인가?! 죽기 전날의 사람들을 만나 소원을 들어주고 성불(?)시키는 일을 맡게 되면서 벌어지는 이판사판 이승저승 이야기! [129페이지로 보내는 편지] 이즐라 작가, 여전한 큐트와 감성으로 오랜만에 컴백!','https://www.lezhin.com/ko/comic/yoyo','https://ccdn.lezhin.com/v2/comics/5716222617845760/images/tall.webp?updated=1520223510718&width=420','완결'),
('제 3 경호팀','카리보',array['액션']::text[],'최고의 경호팀에 예사롭지 않은 신참이 들어왔다. 생사를 넘나드는 치열한 현장에서 겪는 경호팀의 활약상.','https://www.lezhin.com/ko/comic/3rd_security','https://ccdn.lezhin.com/v2/comics/185/images/tall.webp?updated=1761627526823&width=420','완결'),
('청춘연쇄','사해',array['로맨스']::text[],'평범한 소녀 지아의 눈에 천사처럼 예쁜 윤아는 너무나 사랑스럽다. 설령 간절한 마음으로 쓴 러브레터를 눈 앞에서 읽더라도, 그 러브레터를 역겹다고 말하더라도… 잔인할 정도로 아름다운 전교생의 아이돌 윤아와, 윤아에게 짓밟혀도 사랑하는 것을 멈추지 않는 지아의 로맨스 스릴러, &lt;청춘연쇄&gt;.','https://www.lezhin.com/ko/comic/Myyouthchain','https://ccdn.lezhin.com/v2/comics/5988373564227584/images/tall.webp?updated=1714443542523&width=420','완결'),
('사랑하는 죽음','이언',array['스릴러']::text[],'우리는 오늘 죽는다. 작년의 오늘, 그렇게 정했다. 자살을 시도한 네 사람, 그러나 ‘죽음’의 변덕으로 자살은 실패하고 죽을 자격마저 박탈당한다. “자격을 돌려받길 원하면 나로부터 달아난 자를 데리고 와야 한다"는 죽음의 제안에 네 사람은 ‘달아난 자’를 찾아 교도소로 향하는데… [노수] 작가의 신작! 과연 당신은 죽음을 설득할 수 있을 것인가?!','https://www.lezhin.com/ko/comic/death','https://ccdn.lezhin.com/v2/comics/6308132787322880/images/tall.webp?updated=1782822547398&width=420','완결'),
('팬티요정 미미미','영식',array['코미디']::text[],'내 이름은 우민! 파릇파릇한 중학생이다. 그런 내가... 길바닥에 지려버렸다?! 천천히 고개를 돌리자 눈이 마주친 미미. 머리에 팬티를 쓴 그녀는 우민에게 팬티 한장을 건네고 사라진다. 그렇게 자신의 흑역사가 잊혀지길 바라던 우민 앞에 나타난 전학생은 미미?! 다시 만난 두 사람, 그리고 팬티! "야, 내 팬티 내놔."','https://www.lezhin.com/ko/comic/mimimi','https://ccdn.lezhin.com/v2/comics/5354102247522304/images/tall.webp?updated=1679481982546&width=420','완결'),
('대표님, 사모님이 도망가요','Hongshu·Anyouran·스토리숲',array['로맨스']::text[],'결혼식 전날, 약혼자의 불륜을 목격한 것도 모자라 사랑하는 가족까지 잃게 된 노신아. 세상이 무너지는 것 같던 그때 그녀 앞에 나타난 권욱진! "네가 잃은 모든 걸 되찾아 줄 수 있어. 단, 한 가지 요구만 들어준다면..." 모든 걸 잃어버린 그녀에게 나타난 이 남자. 과연 행운일까? 불행일까?','https://www.lezhin.com/ko/comic/runaway_wife','https://ccdn.lezhin.com/v2/comics/4732211905757184/images/tall.webp?updated=1639963332642&width=420','완결'),
('이웃집 길드원','ANGELA·비작·허니트랩',array['로맨스']::text[],'스토커에게 시달린 뒤 사람을 지독하게 경계하는 윤지구. 때마침 이웃집에 성적취향이 이상한 남자가 이사를 왔다...?
"옆집에 변태 새끼가 사는 것 같아여..."

현실에서는 오해 가득, 수상한 이웃인 이여운과 윤지구.
게임에서는 티격태격 좌충우돌 커플 neutaaaa(이여운)와 ㅈi9별.
게임과 현실 안팎으로 두 사람의 관계는 과연 어떻게 달라지게 될까?','https://www.lezhin.com/ko/comic/neighbor_bf','https://ccdn.lezhin.com/v2/comics/6313950063689728/images/tall.webp?updated=1762861923172&width=420','연재'),
('매치스틱 트웬티','마사토끼·도현',array['스릴러']::text[],'세계 제일의 테러리스트에 점거당한 빌딩. 죽음을 앞 둔 인질들 앞에 세계 제일의 이야기꾼이 나타난다. 삶과 죽음의 경계 위에서 들려주는 세계 최고로 재미있는 이야기란 무엇인가? 마사토끼, 도현 콤비의 이름을 세상에 알린 세계제일 시리즈 제 1탄.','https://www.lezhin.com/ko/comic/matchstick20','https://ccdn.lezhin.com/v2/comics/64/images/tall.webp?updated=1553742006975&width=420','완결'),
('나쁜 아이들','전수영',array['스릴러']::text[],'소년원에 있던 ''수''는 담임으로부터 여자친구 ''미래''의 자살소식을 전해듣는다. 소년원을 나온 ''수''는 ''미래''의 방에서 수수께끼의 물품보관영수증을 발견하는데... ''미래''의 죽음 뒤에 숨겨져 있던 무거운 진실이 ''수''의 앞을 가로막는다! 제 1회 세계만화공모전 우수상 수상작 &lt;나쁜 아이들&gt;','https://www.lezhin.com/ko/comic/bads','https://ccdn.lezhin.com/v2/comics/434/images/tall.webp?updated=1563008152248&width=420','완결'),
('퍼펫플레이','키키',array['판타지']::text[],'에임, 하이그, 래디. 3명의 소년은 기사단이 지키고 있는 경계의 울타리를 넘어 바깥 세상으로의 여행을 시작한다. 악마를 섬기는 종교집단 "다르달다르"의 주술사가 인간의 영혼을 집어넣어 만든 기계인형 "마리의 아이들". 경계를 넘자마자 그들의 표적이 된 소년들은 각자의 목적을 위해 목숨을 건 싸움을 계속하는데…!','https://www.lezhin.com/ko/comic/puppet_play','https://ccdn.lezhin.com/v2/comics/5255174490947584/images/tall.webp?updated=1719976032962&width=420','완결'),
('그레이 - 영웅 죽이기','울리',array['액션']::text[],'그레이 탄생 후 1년. 계속되는 그의 비리 고발로 정부의 신뢰는 바닥으로 추락한다. 당황한 정부는 사태의 심각성을 인지하고 특단의 조치를 취하는데... 그리고 혜성처럼 등장한 뉴 히어로 “레드 머플러”. 같은 하늘 아래 두 영웅, 과연 그들은 공생할 수 있을 것인지...?','https://www.lezhin.com/ko/comic/gray_red','https://ccdn.lezhin.com/v2/comics/5644954244481024/images/tall.webp?updated=1547694000888&width=420','완결'),
('할배툰','증조할배',array['일상']::text[],'어둠에 춤추듯 내려온 노인','https://www.lezhin.com/ko/comic/ggftoon','https://ccdn.lezhin.com/v2/comics/4524665480740864/images/tall.webp?updated=1771298964539&width=420','완결'),
('잿빛설원','현락·햄록',array['판타지']::text[],'괴물로 배척받지만 인간으로서 살고 싶은 ''에이셴'' 민재는 가족이자 친구였던 정원을 찾아 설원을 헤맨다. 하지만 그 행방을 쫓으려 할수록 자꾸만 위험에 빠지는데... 약육강식만이 존재하는 세상, 이형의 신체와 기이한 능력을 가진 신인류들의 생존을 건 싸움이 펼쳐진다!','https://www.lezhin.com/ko/comic/ashen_snowfield','https://ccdn.lezhin.com/v2/comics/4552198946684928/images/tall.webp?updated=1776997345590&width=420','완결'),
('무책임 공주는 힘들어!','무선혜드셋·빠타',array['코미디']::text[],'하늘의 장난으로 여왕이 되어버린 막내 공주.
왕이 하기 싫어 제멋대로 권력을 휘둘러도
왕국은 태평성대... 여왕 덕에 전성기가 오고 말았다.

옆 나라 왕들이 벌벌 떨고 백성들이 두 손 모아 존경하는
무책임 왕국의 최고의 왕 무책임 공주의 운명은...?','https://www.lezhin.com/ko/comic/irresponsible_princess','https://ccdn.lezhin.com/v2/comics/4686578887491584/images/tall.webp?updated=1771298815848&width=420','완결'),
('그 남자가 대신 시집간 사정','백리군혜·강당·디앤씨미디어·비랩코믹스',array['로맨스']::text[],'진북왕 군현효는 심지부 딸이 미인이라는 소문을 듣고 첩으로 들이라 명한다. 진북왕의 잔인한 소문을 두려워한 심지부는 벙어리 노비 심옥을 여장시켜 대신 시집을 보낸다. 절세미인인 심옥에게 진북왕이 빠져들어 집착하자, 이를 질투한 왕비는 다양한 계략으로 심옥을 이간질하며 괴롭힌다. 자신을 ‘벙어리’가 아닌 ‘심옥’으로 대해 주는 진북왕을 사랑하게 된 심옥은 비','https://www.lezhin.com/ko/comic/reason_of_marriage','https://ccdn.lezhin.com/v2/comics/5254360371363840/images/tall.webp?updated=1699524207540&width=420','연재'),
('절망 VS 소녀','마사토끼·도현',array['스릴러']::text[],'네 명의 악한에게 외딴 별장으로 납치 감금된 한 명의 소녀. 은행 강도들은 강도질 도중에 우연히 끌고 오게 된 인질을 소중히 다룰 생각은 없었다. 세계 최고의 절망 앞에서 그녀가 할 수 있는 일이란.... 마사토끼/도현 콤비가 보내드리는 매치스틱 트웬티에 이은 두 번째 세계제일 시리즈.','https://www.lezhin.com/ko/comic/girl_vs_dispair','https://ccdn.lezhin.com/v2/comics/34/images/tall.webp?updated=1785483519600&width=420','완결'),
('고홈런','감대',array['드라마']::text[],'억울하게 살인죄를 뒤집어 쓰고 13년형을 받게 된 22세 강일루. 험악한 교도소를 탈출하는 유일한 방법은 야구대회 우승뿐..?!','https://www.lezhin.com/ko/comic/gohomerun','https://ccdn.lezhin.com/v2/comics/6361678876246016/images/tall.webp?updated=1520223539818&width=420','완결'),
('바다가 소년에게','이현민·이진영·JQ스튜디오',array['드라마']::text[],'"아무도 날 찾지 마!" 거짓된 아이돌의 삶에 질려버린 전력기사단 ''케이-D''. 아무도 자신을 모를 만큼 외딴 섬 마을로 도망치지만, 어쩐지 첫 날부터 불안한데..?!','https://www.lezhin.com/ko/comic/sea_to_the_boy','https://ccdn.lezhin.com/v2/comics/4540744709832704/images/tall.webp?updated=1622465438202&width=420','완결'),
('죽은 장미의 전장 - 흔세만 스핀오프 3','폴빠·MOSSA',array['판타지']::text[],'전쟁의 시대! 아스타드 대륙의 국가들은 서로의 이상을 내세워 충돌한다. 난세를 틈타 통일제국을 꿈꾸는 브리오덴, 이를 저지하고 자국을 지키려는 피르벤. 그 혼란 속에서 고개를 드는 제3의 세력... 돈을 벌기 위해 용병으로서 전쟁에 뛰어들었던 발트루이스는 시대의 소용돌이 속으로 빠져드는데! &lt;아스타드 왕립유랑극단&gt; &lt;새벽을 얽매는 뱀&gt;','https://www.lezhin.com/ko/comic/dead_roses','https://ccdn.lezhin.com/v2/comics/4838424233246720/images/tall.webp?updated=1769509104210&width=420','완결'),
('685일','새얀',array['로맨스']::text[],'"미안해..." 거절당한 고백과 함께 어색한 사이가 된 주연과 미향,오해와 걱정으로 서로 피하기만 하던 시간이 지나고 고등학교 2학년 새학기를 맞이한다. 둘은 다시 한번 마주치게 되고, 설레는 마음으로 이전과는 다른 조금 특별한 이야기가 시작된다. 두근거렸던 고백으로부터 두사람에게 첫 눈이 내리는 날까지, &lt;685일&gt;','https://www.lezhin.com/ko/comic/685','https://ccdn.lezhin.com/v2/comics/5059460702011392/images/tall.webp?updated=1719976286356&width=420','완결'),
('사랑은 환상! ~슈퍼스타~','파고',array['로맨스']::text[],'혜성과 도진의 아들인 ''박별'' 은 예전에는 아이돌 연습생이었으나 현재는 그만두고 평범한 고등학교 생활을 보내고 있다. 갑작스럽게 동생이 생겨 혼란스러운 와중에, 별은 한동안 소원해졌던 소꿉친구 ''시우''가 자꾸만 눈에 밟히게 되는데.. 꿈과 우정(?)을 찾는 별이의 반짝반짝 하이틴 성장기!','https://www.lezhin.com/ko/comic/superstar','https://ccdn.lezhin.com/v2/comics/7011729836488210/images/tall.webp?updated=1774956710941&width=420','연재'),
('도박사의 유산','마사토끼·보로콤',array['스릴러']::text[],'한 도박사가 거액의 유산을 남긴 채로 죽었다. 그리고 생전에 인연이 있었던 10명에게 유산의 상속을 건 게임의 초대장이 보내지는데... 한 치 앞도 보이지 않는 상황 속을 각자의 계산과 계략을 품은 채 방황하는 참가자들... 그리고 그 사이에서 홀로 미소 짓는 이야기꾼. 이성과 광기가 교차하는 생사의 도박 끝에 유산을 손에 넣는 것은 과연 누구일까?','https://www.lezhin.com/ko/comic/legacy','https://ccdn.lezhin.com/v2/comics/4649392630530048/images/tall.webp?updated=1553742006966&width=420','완결'),
('브릴리 [개정판]','찬란한·블뤼엔',array['로맨스']::text[],'10년만에 찾은 내 소중한 형.
이제 영원히 함께 있을 것이다.
또다시 놓칠 바엔, 차라리…','https://www.lezhin.com/ko/comic/brilly','https://ccdn.lezhin.com/v2/comics/5780624315056128/images/tall.webp?updated=1721318683425&width=420','완결'),
('모모세 헬프!!','성원',array['판타지']::text[],'단 하나 남은 가족인 남동생마저 불의의 사고로 떠난 후, 그녀는 죽고 싶어도 죽지 못하는 신세가 돼버렸다. 17세 고등학생 모모세, 그녀에게 붙은 수호천사는 축복, 아니면 저주? 그러던 어느 날 모모세는 동네 전단지에서 수상쩍은 단어를 발견한다. 그것은 바로 ‘심.령.사.무.소'' &lt;데일리 위치&gt; 성원 작가 신작!','https://www.lezhin.com/ko/comic/momose','https://ccdn.lezhin.com/v2/comics/6453048194760704/images/tall.webp?updated=1692607584600&width=420','완결'),
('피곤한 직장인 일기','유',array['일상']::text[],'주말, 칼퇴, 월급을 사랑합니다. 아, 남편과 반려견 꽃남이두요! 직장인이라면 누구든 끄덕끄덕할 맞장구 에피소드 한가득. 평일의 한가운데 수요일에 엿보는 우리 모두의 일기장 &lt;피곤한 직장인 일기&gt;','https://www.lezhin.com/ko/comic/hard_worker_diary','https://ccdn.lezhin.com/v2/comics/4948467973357568/images/tall.webp?updated=1737601264201&width=420','완결'),
('생존주의','꿀딩이',array['스릴러']::text[],'화성정착프로젝트의 실험체로 화성에 가게 된 소년범들이 괴물들과 싸우며 성장하는 생존물.','https://www.lezhin.com/ko/comic/survivalism','https://ccdn.lezhin.com/v2/comics/77/images/tall.webp?updated=1550134689952&width=420','완결'),
('페이백(PAYBACK) [개정판]','푸죠킹·samk·키다리스튜디오',array['로맨스']::text[],'[본 작품은 &lt;페이백(PAYBACK)&gt; 성인 버전의 일부 장면을 수정한 15세 개정판입니다. ''성인판''과 다른 회차는 아래와 같습니다. 이용에 참고 바랍니다.]
* ''성인판''과 다른 회차 : 13, 14, 15, 16, 19, 28, 31, 32, 42, 43, 51, 52, 62, 63, 74, 78, 79, 외전2, 외전3, 외전5, 외전8,','https://www.lezhin.com/ko/comic/payback_15','https://ccdn.lezhin.com/v2/comics/4917322736533504/images/tall.webp?updated=1774316392672&width=420','완결'),
('요람을 흔드는 섬','이동욱',array['코미디']::text[],'생존을 위해서는 사랑해야 한다?! 대해일이 닥친 지구, 운좋게 살아남은 이들은 이름 모를 무인도에 모인다. 하지만, 섬이 가라앉는 것을 막기 위해서는 생존자들 가운데 커플이 나와야 하는데... 지구 최후의 섬에서 펼쳐지는 연애서사시!!
사랑해야 생존할 수 있다! 본격 살아남기 개그청춘물!!','https://www.lezhin.com/ko/comic/secret_island','https://ccdn.lezhin.com/v2/comics/280/images/tall.webp?updated=1549868741740&width=420','완결'),
('나의 보람','피토',array['로맨스']::text[],'육상부 에이스 남수, 해외 귀국 자녀 혜연. 평범한 여고생 보람이를 둘러싸고 벌어지는 두 여학생의 깊은.... 청춘 러브 스토리.','https://www.lezhin.com/ko/comic/mypleasure','https://ccdn.lezhin.com/v2/comics/8/images/tall.webp?updated=1550206879391&width=420','완결'),
('집착공의 인형놀이','집사스튜디오·스토리숲',array['로맨스']::text[],'매일 함께 시간을 보내는 집, 그가 사준 옷, 향수, 액세서리가 가득한 방, 모든 것이 완벽하고 더 없이 행복할 수 없다고 생각했는데 … 

사랑하는 그의 생일 날, 나와 똑같은 모습을 하고 있는 내 남자의 첫사랑이 돌아왔다.','https://www.lezhin.com/ko/comic/playing_with_doll','https://ccdn.lezhin.com/v2/comics/6082275279437824/images/tall.webp?updated=1786522472269&width=420','완결'),
('통 2부','민·백승훈·투유드림·투유',array['액션']::text[],'부산 주먹의 전설로 살아 서울에서는 조용히 살기 원했지만
그건 이정우의 삶이 아니라는 걸 우리 모두 알고 있다.
학교 내외 일진들과의 대결에서 극강의 실력을 뽐낸 이정우는
단시간에 그 지역을 평정하게 된다.
그 후 일대 조직폭력배들은 ''통'' 이정우를 가만히 내버려두지 않는다.
''통''이지만 다른 이들에게 피해를 주기 싫은 이정우의 삶도 이에
따라 다른 방향으','https://www.lezhin.com/ko/comic/tong_2','https://ccdn.lezhin.com/v2/comics/4573933040041984/images/tall.webp?updated=1508468473237&width=420','완결'),
('까마귀 기사','govy',array['판타지']::text[],'태초의 왕들이 다스리는 세계,
까마귀는 소중한 것을 지키기 위해 싸운다','https://www.lezhin.com/ko/comic/crowknight','https://ccdn.lezhin.com/v2/comics/5132794414170112/images/tall.webp?updated=1786523021650&width=420','연재'),
('시선 끝, 30도','여로·소보로',array['로맨스']::text[],'도진에게 연우는 그저 특이한 애였다. 그러나 언젠가부터 도진의 시선은 연우를 쫓고 있었다. 도진은 어째서 그 애에게 시선을 뗄 수 없는 걸까? 그리고 도진이 느끼는 그 감정은 대체 무엇일까?','https://www.lezhin.com/ko/comic/stare','https://ccdn.lezhin.com/v2/comics/5073458287935488/images/tall.webp?updated=1756195318588&width=420','완결'),
('쉴라 건','마사토끼·밀',array['드라마']::text[],'저 담장을 경계로 저택 안은 바깥과는 완전 다른 공간, 임영환 회장님이라고 하는 절대자가 다스리는 작은 세계다. 법률도 상식도 초월한, 설령 진짜 신이 나타난다 해도 그것은 뒤집을 수도 거역할 수도 없는 절대적 사실이었다... 간이 배 밖으로 튀어나온 그 녀석이 나타나기 전까지는!','https://www.lezhin.com/ko/comic/sheela_gun','https://ccdn.lezhin.com/v2/comics/5072753211342848/images/tall.webp?updated=1554701675940&width=420','완결'),
('OK툰','김옥현',array['일상']::text[],'아메리카노는 나왔습니다, 프라푸치노는 나오셨습니다!!? SNS와 각종 커뮤니티를 웃기고 울린 자칭 ''개드립 만화'' OK툰, 드디어 레진코믹스에 안착! 활력충전 병맛 만화의 완전체를 만나자!','https://www.lezhin.com/ko/comic/oktoon','https://ccdn.lezhin.com/v2/comics/4791026780209152/images/tall.webp?updated=1626418343192&width=420','완결'),
('던전 속 사정[개정판]','레바',array['판타지']::text[],'[개정판]
해당 작품은 &lt;던전 속 사정&gt; 성인 버전의 일부 장면을 수정한 개정판입니다.
마물을 물리치고 얻게 되는 전리품. 그 용도의 새로운(?) 해석으로 인해 재구축된 대륙에 처음 발을 들인 한 소녀는 여러 황당한 사건들을 겪으며 성장해 나가는데... &lt;레바툰&gt;에 이은 레바 작가의 액션개그판타지!','https://www.lezhin.com/ko/comic/dungeon_15','https://ccdn.lezhin.com/v2/comics/5145070025637888/images/tall.webp?updated=1781856388434&width=420','연재'),
('국제결혼 절대로 하지 마라','쑤',array['일상']::text[],'"미국에도 동양인 많이 살고 좋은 곳도 많은데...나는 왜 이런 곳으로 와버린걸까?
이럴 거면 국제 결혼 하지 말 걸 그랬어!"

남친에서 남편이 된 롯과 함께 미국으로 향한 쑤.  뉴욕과 캘리포니아만 알던 ''쑤''의 미국 생활기가 지금 시작됩니다.','https://www.lezhin.com/ko/comic/never_marry_a_foreigner','https://ccdn.lezhin.com/v2/comics/6631616049119232/images/tall.webp?updated=1776994984549&width=420','완결'),
('강호협영록','심유검',array['액션']::text[],'독비문의 무림일통 후 자운은 숙청을 피해 무림을 떠나 필부의 삶을 살아가지만, 조정은 암군이 무림은 광인이 지배하는 난세 속 소중한 것을 지키기 위해 다시금 검을 들게 되는데..  ㅡ제3회 세계 만화 공모전 우수상 수상작.','https://www.lezhin.com/ko/comic/master_of_martial_art','https://ccdn.lezhin.com/v2/comics/5035797597257728/images/tall.webp?updated=1737601522856&width=420','완결'),
('오류탐구영역','사자·진월·망고곰',array['로맨스']::text[],'중학생 때까지 전교 1등을 놓쳐본 적 없는 ''오승표''는 고등학교 진학 후 ''류재민''에게 전교 1등 자리를 뺏기고 만다. 
전교 1등은 류재민, 전교 2등은 오승표. 아무리 열심히 공부해도 이 순서를 뒤집을 수가 없다. 태어나 처음으로 느끼는 열등감에 승표는 저도 모르게 재민을 계속 지켜보게 된다.
그러던 어느 비 오는 날, 승표와 재민이 길에서 우연히 부딪','https://www.lezhin.com/ko/comic/error_zone','https://ccdn.lezhin.com/v2/comics/7011737621132804/images/tall.webp?updated=1776994518580&width=420','연재'),
('레벨 업','JUN·서영웅',array['드라마']::text[],'국내 최고의 게임 개발사 리버풀, 첫 면접자리에서 만난 현우와 세린. 어리바리 열정만 가득한 현우와 능력빵빵한 알파걸 세린이 정직원의 자리를 두고 펼쳐지는 두 청춘의 평행선. 이 둘 이대로 괜찮을까? 굿모닝티처의 서영웅 작가 최신작.','https://www.lezhin.com/ko/comic/level_up','https://ccdn.lezhin.com/v2/comics/297/images/tall.webp?updated=1549868713605&width=420','완결'),
('2인실','마사토끼·신군',array['스릴러']::text[],'어느날 나는 갑자기 지하에 갇혀 버렸다.'' 밀실에서 벌어지는 팽팽한 두뇌싸움! 마사토끼X신군의 역대급 스릴러.','https://www.lezhin.com/ko/comic/double_room','https://ccdn.lezhin.com/v2/comics/207/images/tall.webp?updated=1546484401440&width=420','완결'),
('어쩌면 용사','마셀린·마사토끼',array['코미디']::text[],'모험도 소동도 없이 조용히 살고 싶은 나의 일상에 외계인(자칭)과 로봇(자칭)과 지구방위대(자칭)와 대마왕(자칭)이 찾아왔다. 나 빼고 전부 정신병자인 중2병 월드에서 소중한 나의 일상을 지켜나가는 장대한 모험기.','https://www.lezhin.com/ko/comic/brave','https://ccdn.lezhin.com/v2/comics/6267928034410496/images/tall.webp?updated=1520223536837&width=420','완결'),
('당신의 지니','임현정',array['드라마']::text[],'&lt;여행의 발견&gt; 임현정 작가의 컴백작! 인공지능 채팅봇과 인간을 구별할 수 없게 된 근미래. 과학기술 비관론자이자 순진한 낭만주의자 제시는 빅데이터 분석으로 만든 흥행작으로 가득한 출판시장에서 ‘순수 작가’로 인정받으려고 몸부림치고 있다. 제시의 남친이자 업계 1위 VR게임 제작사의 CEO인 로이는 논리적이고 이성적인 여자를 원하고, 둘의 갈등이','https://www.lezhin.com/ko/comic/genie','https://ccdn.lezhin.com/v2/comics/5413693209968640/images/tall.webp?updated=1692604812696&width=420','완결'),
('꼴데툰 2016','샤다라빠',array['코미디']::text[],'새로운 감독, 새로운 마무리, 그리고 새로운 돔구장의 첫 상대팀! 명분은 충분하다. 이제 가을에 야구만 하면 된다! 감동, 일침, 딥빡이 절묘하게 뒤섞인 샤다라빠의 롯데 만화, 올해도 플레이볼!','https://www.lezhin.com/ko/comic/ggtoon2016','https://ccdn.lezhin.com/v2/comics/5686323091865600/images/tall.webp?updated=1661762014800&width=420','완결'),
('방과후에 3','권골수',array['스릴러']::text[],'&lt;방과후에&gt; 3부작 대망의 마지막 시리즈! 더 커진 스케일과 갈등. 그리고 뒤늦게 밝혀지는 진실들.. 그는 정말 돌이킬 수 없는 짓을 저질렀을까?

ㅡ 친구들이 살해당하고 위험한 상황 속에서도 침착하게 살인범을 잡아왔던 준휘. 
그러나 너무 깊이 관여해 버린 걸까? 살인범들의 조직이 그의 영리함을 주시하게 되면서,
'' 자신도 언젠가 그들처럼 되어','https://www.lezhin.com/ko/comic/afterschool3','https://ccdn.lezhin.com/v2/comics/6657732865032192/images/tall.webp?updated=1644485270560&width=420','완결'),
('오늘도 항해','윙브릿지',array['일상']::text[],'남들과 다를것 없다고 생각해 왔던 나의 평범하고도 치열한 20대. 그런 내게 어느날 예고없이 찾아온 암. 처음으로 나의 죽음과 마주친 순간, 항해는 다시 시작된다. 윙브릿지 작가만의 소녀스런 감성으로 담담하게 풀어낸 자전적 일상툰 [오늘도 항해]','https://www.lezhin.com/ko/comic/voyage','https://ccdn.lezhin.com/v2/comics/6003405965492224/images/tall.webp?updated=1620788910800&width=420','완결'),
('이토록 다채로운 핏빛','므앵갱',array['판타지']::text[],'피의 색으로 모든 것이 나뉘는 세상.
순수한 색일수록 높은 신분을, 섞이고 섞여 혼탁한 색일수록 낮은 신분을 지닌 채 살아가는 인간들 앞에 어느 날 ''흡색''이라는 무시무시한 존재가 나타난다.
아무 색도 없는 흡색들은 닥치는 대로 인간의 피를 탐하고, 이에 대항할 수 있는 것은 오직 ‘빛눈의 은덕‘을 입은 사람들뿐.
바로 그 ‘빛눈의 은덕’이 어느 보잘것없던','https://www.lezhin.com/ko/comic/colorful','https://ccdn.lezhin.com/v2/comics/4705963879235584/images/tall.webp?updated=1761627379538&width=420','완결'),
('꼴데툰 2021','샤다라빠',array['코미디']::text[],'지난 몇 년 간 꿇었던 건 추신수 아니 추진력을 얻기 위함이었다!
보고 있는가, 추신수.. 여기 자네보다 뛰어난 인재가 있네. 무려 둘이나..
투타를 책임질 김진욱과 나승엽은 꼴데의 환장 대모험(?)을
아름다운 역사로 바꿔줄 것인가..!
올해도 주6회 등판하는 웹툰계 슈퍼 세이브 야구만화!','https://www.lezhin.com/ko/comic/ggtoon2021','https://ccdn.lezhin.com/v2/comics/6690294575988736/images/tall.webp?updated=1661761967593&width=420','완결'),
('단금지교','핑푸',array['로맨스']::text[],'왕세자 지교는 동생을 죽였다는 누명을 쓰고 귀양길에 오른다. 그를 따르던 호위무사 단금은 죽음을 목전에 둔 유배지에서 지교를 향한 연정을 숨기지 못하고, 그로 인해 지교 또한 마음이 어지러운데..','https://www.lezhin.com/ko/comic/dangeum_jigyo','https://ccdn.lezhin.com/v2/comics/5778995370655744/images/tall.webp?updated=1762862230113&width=420','완결'),
('조만국의 영화캠프','조만국',array['코미디']::text[],'생일에는 미역국, 해장에는 북엇국, 영화리뷰는 조만국!
누구든 영잘알로 만들어드립니다.  
(주의 : 영화를 이상한 쪽으로 잘 알게 될 수 있음)','https://www.lezhin.com/ko/comic/movie','https://ccdn.lezhin.com/v2/comics/5437222505283584/images/tall.webp?updated=1663741452158&width=420','연재'),
('데우스 바드 마키나','폴빠·쿠카부라',array['판타지']::text[],'''적당히 써먹고 버려야지…'' 의욕 제로, 정의감 제로의 용사 일행 나가신다! 
사상 최강의 음유시인, 소넷에게 저당잡혀 서사시의 등장인물이 돼버린 일행들. 돈, 명예, 자유를 위한 환장의 쇼! 뭔가 보여드리겠습니다. 
판타지 외길 폴빠 작가의 야심찬 신작 &lt;데우스 바드 마키나&gt;','https://www.lezhin.com/ko/comic/bard','https://ccdn.lezhin.com/v2/comics/5544547320922112/images/tall.webp?updated=1769509172794&width=420','완결'),
('오타쿠에게 사랑은 어려워','후지타·레진코믹스',array['로맨스']::text[],'나루미는 매번 오타쿠라는 이유로 차이고, 그럴 때마다 게임 오타쿠인 히로타카에게 하소연한다. 사귀는 게 아까울 정도로 죽이 잘 맞던 두 사람, 둘의 관계에 변화가 일어나는데!  "나라면 아이템 수집이든 렙업이든 얼마든지 같이 해줄거고, 야근해도 기다려 줄거고, 실망시키지도 울리지도 않을 거야."
일본 pixiv 초인기 연재작 레진 독점 선공개','https://www.lezhin.com/ko/comic/otakoi','https://ccdn.lezhin.com/v2/comics/6466786480095232/images/tall.webp?updated=1683877946839&width=420','완결'),
('그들의 사정','S리아·차현',array['로맨스']::text[],'환상인지 귀신인지 10년 된 여자친구이자 교통사고로 사망한 지혜가 눈앞에 나타나 하루하루를 폐인처럼 살아가고 있는 현우. 어느 날 보다 못한 어머니의 부탁으로 소개팅 자리에 나가게 되고, 그곳에서 믿을 수 없을 정도로 지혜와 똑같이 생긴 지민이라는 여자(?)를 만나게 된다. 혼란스러운 현우는 자꾸만 겹쳐 보이는 지혜의 모습에 술에 취해 키스하고 마는데…. ','https://www.lezhin.com/ko/comic/Their_circumstances','https://ccdn.lezhin.com/v2/comics/5832902317965312/images/tall.webp?updated=1777012239947&width=420','완결'),
('스바루 군의 절대명령!','우루 아쿠아·우로코·넥스큐브·미즈',array['로맨스']::text[],'"넌 내 거잖아."
소꿉친구이자 인기 모델로 활약 중인 스바루(통칭 S 왕자)에게 매일 같이 휘둘리는 하토코.

어느 날 친구들과 미팅 약속에 나가려 하지만 스바루에게 잡혀 알 수 없는 곳에 끌려가게 되고,
도착하고 보니… 촬영 스튜디오?!
연인 역할을 해달라는 말에 혼란스러워하던 하토코는
무릎 위에 앉히며 좋아한다는 말과 함께
키스할 듯 얼굴을 가까이하는','https://www.lezhin.com/ko/comic/s_prince','https://ccdn.lezhin.com/v2/comics/5679225792626688/images/tall.webp?updated=1637832601376&width=420','연재'),
('나는 너의 귀여운 카피캣!','마롭-믹',array['로맨스']::text[],'편입생 염세민은 복학 첫날 회화 수업에서 자신이 염탐해 온 John(조요한)과 마주치게 된다. 기쁨과 동시에 양심의 가책을 느낀 세민은 더 이상 요한과 엮이지 않길 바라지만, 그의 바람이 무색하게 요한은 세민에게 접근해 오는데… 조요한을 따라하는 “카피캣” 염세민의 아슬아슬한 3학년 2학기!','https://www.lezhin.com/ko/comic/copycat','https://ccdn.lezhin.com/v2/comics/5305536612728832/images/tall.webp?updated=1762861732887&width=420','완결'),
('아르카나 판타지','유희·포엠',array['판타지']::text[],'온 세상을 장악한 모바일 게임 아르카나판타지. 하지만 이 게임에 접속한 플레이어는 게임 속에 의식이 갇혀버리고 만다. 수많은 피해자들은 흐릿해진 현실과 가상의 경계 속에서 탈출할 수 있을 것인가? 주인공 윤의 파란만장한 이 세계 모험 성장기. 제4회 세계만화공모전 우수상 수상작!','https://www.lezhin.com/ko/comic/arcana_fantasy','https://ccdn.lezhin.com/v2/comics/6657233319231488/images/tall.webp?updated=1737438954924&width=420','연재'),
('내게 게임은 살인이다','우왕이·핫핑크',array['판타지']::text[],'정체불명의 가상현실 게임 ''케이지''
그래도 뭐, 게임이 재밌으면 그만 아닌가? 라는 생각으로 게임을 시작한 시련은
게임 속 연쇄 살인마 가이샤와 엮이게 되며 온갖 사건 사고에 휘말리게 되는데...
''내게, 게임은 살인이다.''','https://www.lezhin.com/ko/comic/naegamesal','https://ccdn.lezhin.com/v2/comics/5660040028815360/images/tall.webp?updated=1718350365827&width=420','완결'),
('지젤 씨의 피[개정판]','이연지',array['판타지']::text[],'[개정판]
해당 작품은 &lt;지젤 씨의 피&gt; 성인 버전의 일부 장면을 수정한 개정판입니다. 

네이슨 가 당주의 정숙한 아내가 되어 꼭두각시로 살아가던 지젤은 우연히 발을 디딘 지하에서 아름다운 모습을 한 소년에게 피를 빨리게 된다. 불행했던 그녀의 삶에 나타난 ''피를 마시며 자라는 꽃''이라고 불리는 흡혈귀. 지젤은 남편의 눈을 피해 위험한 만남을 ','https://www.lezhin.com/ko/comic/giselle_15','https://ccdn.lezhin.com/v2/comics/6607767147184128/images/tall.webp?updated=1769160089319&width=420','완결'),
('숨비소리','휘이',array['일상']::text[],'우울증에 걸린 엄마와 웃픈 여자 경복이의 울고 웃는 하루 하루.','https://www.lezhin.com/ko/comic/sumbi','https://ccdn.lezhin.com/v2/comics/168/images/tall.webp?updated=1693285888407&width=420','완결'),
('눈매가 사나운 반친구','맛감쟈',array['드라마']::text[],'사나운 눈매와 날카로운 인상으로 주변 사람들에게 경계를 받고 있는 요주의 그녀 ''안세영''.
모두가 경계심을 놓지 못할 때 그녀의 앞에 한 남자애가 마주선다.
"나 너 좋아해, 나랑 사귀자!"
"......뭐?!"
난데없는 사랑고백에 진땀이 빠지는 세영, 하지만 이건 시작에 불과했으니...
가까이 다가갈수록 반전의 모습을 보이는 그녀 ''안세영''과
그 모습을 ','https://www.lezhin.com/ko/comic/sharpeyes','https://ccdn.lezhin.com/v2/comics/6131748064919552/images/tall.webp?updated=1764727195267&width=420','완결'),
('요정을 아십니까?','야얌이·잡화·키다리스튜디오',array['로맨스']::text[],'은오는 수호요정을 볼 수 있는 특이한 체질 때문에 항상 외톨이 신세다. 그런 은오에게 거리낌 없이 다가오는 전학생, 재휘! ''너와 있으면 기분이 좋아진다''며 은오의 마음을 헤집어 놓는데…','https://www.lezhin.com/ko/comic/know_a_fairy','https://ccdn.lezhin.com/v2/comics/6669206508404736/images/tall.webp?updated=1773999553570&width=420','완결'),
('사랑할 수 없는 그녀','Chunfeng Studio·kkworld·zero·스토리숲',array['로맨스']::text[],'“더 이상 사랑 따윈 믿지 않아.” 2년 전 약혼자의 배신으로 결혼식에서 도망친 하수현은 자신은 더 이상 누군가를 사랑할 수 없는 사람이라 여기며 일만 보고 살아 왔다. 하지만 어린 시절부터 자신을 졸래졸래 따라다니던 이웃집 남동생 임호와 재회한 뒤, 꽁꽁 얼어붙어 있는 그녀의 마음도 녹아 내리기 시작하는데…….','https://www.lezhin.com/ko/comic/unloveable_woman','https://ccdn.lezhin.com/v2/comics/4535643469840384/images/tall.webp?updated=1726199129248&width=420','완결'),
('교화하라','이준',array['스릴러']::text[],'"이 새끼들 기회만 있으면 사람.. 또 죽인다고 할걸"

강력범죄자들을 교화하는 국가 극비 프로젝트에 참여하게 된 채령.
어떠한 사람도 변할 수 있다고 믿는 채령은 섬 위에 위치한 시설에서 
7명의 범죄자들과 함께 위험한 생활을 시작한다. 
채령은 악마들을 교화시키고 무사히 돌아갈 수 있을 것인가?','https://www.lezhin.com/ko/comic/edification','https://ccdn.lezhin.com/v2/comics/5909796202020864/images/tall.webp?updated=1737442819724&width=420','완결'),
('11번가의 기묘한 이야기','가재',array['스릴러']::text[],'기묘한 사건들을 쫒는 탐정 알렉산더 포우와 쿼터 왓슨. 그들의 수사가 시작됩니다.','https://www.lezhin.com/ko/comic/eleven','https://ccdn.lezhin.com/v2/comics/157/images/tall.webp?updated=1717480114137&width=420','완결'),
('사랑은 개싸움!','JOY',array['로맨스']::text[],'좋아하는 것을 위해서는 개싸움(?)을 불사해야만 할 때도 있는 법!
솔로 아이돌 가수 ‘록시’의 열성적인 팬 ‘류미나’.
록시의 라이벌 격 존재인 ‘별이’의 열렬한 팬 ‘진영’.
두 사람의 개싸움의 행방은 과연 어디로 향할 것인가!?','https://www.lezhin.com/ko/comic/dog_fight','https://ccdn.lezhin.com/v2/comics/4916466885394432/images/tall.webp?updated=1631260346909&width=420','완결'),
('통','민·백승훈',array['액션']::text[],'부산 주먹의 전설로 살아 서울에서는 조용히 살기 원했지만 그건 이정우의 삶이 아니라는 걸 우리 모두 알고 있다. 학교 내외 일진들과의 대결에서 극강의 실력을 뽐낸 이정우는 단시간에 그 지역을 평정하게 된다. 그 후 일대 조직폭력배들은 ‘통’ 이정우를 가만히 내버려두지 않는다. ‘통’이지만 다른 이들에게 피해를 주기 싫은 이정우의 삶도 이에 따라 다른 방향으','https://www.lezhin.com/ko/comic/tong','https://ccdn.lezhin.com/v2/comics/657/images/tall.webp?updated=1508468473237&width=420','연재'),
('더 라스트 미션','요냥·하링',array['스릴러']::text[],'미션 1. 반에서 꼴찌를 하면 배팅 금액의 10배를 지급한다!? 생긴건 아이돌이지만 공부는 지지리 못하는 영수에게 어느날 의문의 미션이 떨어지는데..상금으로 폼 나게! 간지 나게! 살아보고 싶은 영수의 전국 꼴찌를 향한 파이널 로드가 시작 된다!','https://www.lezhin.com/ko/comic/lastmission','https://ccdn.lezhin.com/v2/comics/5496788936556544/images/tall.webp?updated=1520223501451&width=420','완결'),
('레이디 셜록','김달',array['드라마']::text[],'"세기의 명탐정 셜록홈스가 여자였다면?!" 단 하나의 변화로 명작이 어떻게 바뀔까? 존 왓슨 박사와 사랑이 싹틀까? 행동의 제약으로 어려움을 겪을까? 악당 모리어티는??.. ㅡ 이 모든 발칙한 상상의 결정체를 보여주기 위해 김달작가가 돌아왔다. 19C 런던 베이커 거리를 배경으로 펼쳐지는 "여자"지만 남장을 즐기는 레이디 셜록과 그냥 "남자" 존 왓슨 박사','https://www.lezhin.com/ko/comic/lady_sherlock','https://ccdn.lezhin.com/v2/comics/5033976744640512/images/tall.webp?updated=1786694570320&width=420','완결'),
('타의적 로맨스','수키',array['로맨스']::text[],'오랜 소꿉친구이자 자칭 타칭 똥차 컬렉터인 지찬을 위로해 주던 일상을 보내던 백야는 어느 날 문득 그들 앞에 나타난 만인의 이상형, 이현의 등장이 신경 쓰인다.
역시나 지찬의 감이 틀리지 않았는지, 이현은 학교 내 문란한 소문을 흘리고 다니며, 모든 화제의 중심이었다.
백야는 지찬에게 이현만은 안 된다고 완강히 반대하지만, 지찬은 오히려 백야에게 이현과 친','https://www.lezhin.com/ko/comic/involuntary_romance','https://ccdn.lezhin.com/v2/comics/5908808241709056/images/tall.webp?updated=1770179062726&width=420','완결'),
('안쌤의 시카고 일기','싸싼',array['일상']::text[],'미국에서 가장 미국적인 도시, 화려한 야경과 마천루의 도시. 이번에 안쌤이 살아볼 곳은... 시카고, 시카고입니다! &lt;안쌤의 베트남 일기&gt; 싸싼 작가의 또다른 이웃 나라 이야기!','https://www.lezhin.com/ko/comic/chicago','https://ccdn.lezhin.com/v2/comics/5330520734171136/images/tall.webp?updated=1687237335371&width=420','완결'),
('뽕규네 식탁','꿀연어',array['일상']::text[],'안녕? 난 "공미규"라고 해. 반려견 "뽕규"와 함께 사는 평범한 여자야. 그런데 어느 날 뽕규가 사람으로 변신한 거야, 글쎄!! 말 그대로 개노답 상황...도 모자라 이 자식이 비싸고 맛있는 것만 먹어서 내 지갑을 털기 시작하는데...! 어쩌면좋지? ㅠㅠ
평범녀 공미규와 비범견 뽕규의 맛깔나는 일상개그음식만화 등장!','https://www.lezhin.com/ko/comic/gourmet','https://ccdn.lezhin.com/v2/comics/6651953033641984/images/tall.webp?updated=1787032900701&width=420','완결'),
('럽미닥터! [개정판]','아나·키다리스튜디오',array['로맨스']::text[],'[해당 작품은 &lt;럽미닥터!&gt; 성인 버전의 일부 장면을 수정한 15세 개정판입니다. 이용에 참고 부탁드립니다.]
여자친구를 만족시켜야 한다는 심리적 중압감 때문에 젊은 나이에 성기능이 제대로 돌아가지 않는 강혁. 결국 비뇨기과를 찾게된다.
그리고 그곳에서 소위 비뇨기과계의 ‘갓핸드’라고 불리는 뼈게이 의사 한유준을 만난다.
“반응 올 것 같으면 자','https://www.lezhin.com/ko/comic/loveme_doctor_re','https://ccdn.lezhin.com/v2/comics/5077577112289280/images/tall.webp?updated=1782957067471&width=420','완결'),
('A와 B의 초상','두긍',array['로맨스']::text[],'어떤 저택의 괴기한 소문이 흐르는 마을. 그 속의 평범한 남고생 윤A는 갑작스러운 편지 한 통으로 이별통보를 받게 된다. 그 속내와 본심을 알기 위해 (전)여자친구의 흔적을 더듬어가는 와중, 조금은 어둡고 이상한 도서부원 신B와 친해지게 되는데... 제1회 레진코믹스 BL 공모전 대상 수상작!','https://www.lezhin.com/ko/comic/portrait','https://ccdn.lezhin.com/v2/comics/6735413248917504/images/tall.webp?updated=1776995319852&width=420','완결'),
('조만국박람회','조만국',array['일상']::text[],'조만국 : 일상툰 하겠습니다.
PD : 오
조만국 : 하지만 제 일상은 비밀입니다.
PD : ?
조만국 : 저는 여러분께 제 일상을 공유할 생각이 없습니다.
PD : ?!!

원고를 읽고 킹받은 담당PD가 퇴사까지 고민하게 만든, 조만국 작가의 신비주의 일상툰!','https://www.lezhin.com/ko/comic/expo','https://ccdn.lezhin.com/v2/comics/5275168827310080/images/tall.webp?updated=1761627507178&width=420','완결'),
('자존감 없는 소선화양','크로옹',array['드라마']::text[],'오지랖이 넓어 호구 같이 모두를 도와주는 ''강황''. 우연히 짝사랑하던 ''소선화''를 도와주게 되자, 자존감 낮은 소선화양은 호구같이 착한 강황에게 친구(?)로서 들이대기 시작하는데...!','https://www.lezhin.com/ko/comic/sosunhwa','https://ccdn.lezhin.com/v2/comics/4719049832202240/images/tall.webp?updated=1761295981253&width=420','완결'),
('나와 그녀와 그녀와 그녀의 건전하지 못한 관계','서영일·최지인',array['드라마']::text[],'공부밖에 모르는 쑥맥 안경현. 그의 앞에 자신의 여자 친구라고 주장하는 세명의 여자가 나타났다! 안경현을 차지하기 위해 한치도 물러설 생각이 없는 세 여자친구의 전쟁이 지금 시작된다!','https://www.lezhin.com/ko/comic/threegirlfriends','https://ccdn.lezhin.com/v2/comics/392/images/tall.webp?updated=1549868145789&width=420','완결'),
('고교수와 나','마레',array['스릴러']::text[],'생명공학이 발달한 가까운 미래. 친하게 지내던 스승인 고승원 교수의 집을 찾아간 석현은 노회한 그가 그를 살해하려 했던 아들 용민과 함께 지내는 것을 알게 된다. 그리고 얼마 뒤 고교수는 상태가 급격히 악화되고, 석현은 용민이 자꾸만 미심쩍은데…','https://www.lezhin.com/ko/comic/prof_go','https://ccdn.lezhin.com/v2/comics/5478943293177856/images/tall.webp?updated=1737440052660&width=420','완결'),
('언밸런스X3','임달영·이수현·디투컴퍼니',array['드라마']::text[],'어린 시절 교통사고로 부모님을 잃은 대학생 최태현은 성공한 벤처사업가인 누나 최하경과 단 둘이 살아가고 있다. 
 그런데 누나에게는 말 못할 비밀이!? 대한민국 최강 러브코미디 언밸런스X2의 정통 후속작! 이번엔 친 누나다!?','https://www.lezhin.com/ko/comic/unbalancex3','https://ccdn.lezhin.com/v2/comics/4898410625892352/images/tall.webp?updated=1554871127636&width=420','연재'),
('판타지 괴물원','시다림·야생화',array['코미디']::text[],'엘프, 요정, 슬라임, 미믹, 드래곤까지..! 이세계의 몬스터와 이종족들을 전시하는 ''판타지 괴물원'' 한국 지부 오픈!! 
몬스터 관리인으로 일하게 된 세 명의 소년, 소녀와 이세계 친구들의 비일상적인 일상이 여기 펼쳐집니다ㅡ.','https://www.lezhin.com/ko/comic/monsterpark','https://ccdn.lezhin.com/v2/comics/5861225047916544/images/tall.webp?updated=1651826385243&width=420','완결'),
('모두의 경찰','붉은코끼리',array['코미디']::text[],'“신입순경 김용입니다. 잘 부탁… 살려주세요” 첫 출근 날 서의 문을 열자마자 누군가 김용에게 총을 겨누는데! 이 기묘한 파트너는 이름마저 ‘광이’였다! 김용에게 주어진 특수 임무는 바로 광이의 곁을 지키는 것! 과연 묭묭, 아니 김용의 경찰 공무원 생활은 순탄할 수 있을 것인가! 이래서는 안되는 경찰 이야기 &lt;모두의 경찰&gt;. 약 냄새가 나지만 ','https://www.lezhin.com/ko/comic/policeman','https://ccdn.lezhin.com/v2/comics/5455834269351936/images/tall.webp?updated=1773639669357&width=420','완결'),
('햄스터와 독신녀','오계',array['일상']::text[],'고민 끝에 결정한 햄스터 키우기. "찌"와 같이 생활하며 알게 되는 햄스터의 오해와 진실들!
운명적으로 만나게 된 햄스터의 모든 이야기.
&lt;순결한 죄&gt; 오계 작가의 데뷔작!','https://www.lezhin.com/ko/comic/hamster','https://ccdn.lezhin.com/v2/comics/5137332015071232/images/tall.webp?updated=1786008800745&width=420','완결'),
('신데렐라 리미트','깨알',array['로맨스']::text[],'12시가 울리면 다림의 성별이 변한다!? 이런 상황에서도 그녀는 태후를 도저히 포기할 수가 없다.
그런데 잠깐, 여자 모습으로 공략이 안되면...남자 모습이 있잖아?
본격 이중공략 로맨스 &lt;신데렐라 리미트&gt;!','https://www.lezhin.com/ko/comic/limit','https://ccdn.lezhin.com/v2/comics/6170000663052288/images/tall.webp?updated=1661761803153&width=420','완결'),
('혈압상승주의보','DJ구름',array['코미디']::text[],'손자의 얼굴이 잘생겨지는 동안 할아버지의 혈압은 점점 올라간다?! 손자를 향한 초능력자 할아버지의 사랑! 과연 할아버지는 자신의 고혈압과 맞바꿔 손자의 인생을 장미빛으로 만들어 줄 수 있을 것인가?!','https://www.lezhin.com/ko/comic/blood_pressure','https://ccdn.lezhin.com/v2/comics/391/images/tall.webp?updated=1520223440389&width=420','완결'),
('정열맨 시즌3','귀귀·재담미디어',array['코미디']::text[],'현무신공과 숨은 무공 고수들의 등장! 이에 맞서 분투하는 김정열과 그의 동료들! 더 큰 재미로 돌아온 정열맨 시즌3!!','https://www.lezhin.com/ko/comic/passionman_3','https://ccdn.lezhin.com/v2/comics/5130280144601088/images/tall.webp?updated=1714110282688&width=420','완결'),
('안나 이야기','김지효',array['로맨스']::text[],'안나는 대장간에서 검 만드는 일을 한다. 어느 날 단골 손님인 알렉스를 숲속 도적떼로부터 구한 이후 그녀의 평범한 일상이 깨지게 되는데…!','https://www.lezhin.com/ko/comic/story_of_anna','https://ccdn.lezhin.com/v2/comics/4907714540535808/images/tall.webp?updated=1779350543272&width=420','완결'),
('브로큰 릴리','sage',array['로맨스']::text[],'감추고 싶은 과거를 지닌 채 런던으로 도피한 주인공 릴리. 그곳에서 여의사 테일러를 만나 자신의 주치의로 고용한다. 릴리는 병약한 자신과는 다르게 당차고 카리스마 넘치는 테일러를 동경하고, 그 마음은 주체할 수 없이 커져만 가는데... 원치않는 현실과 진정한 사랑 사이에서 점점 파멸의 길을 걷는 릴리의 운명은? [쓰리먼스] sage 작가의 가슴 저미는 백합','https://www.lezhin.com/ko/comic/broken_lily','https://ccdn.lezhin.com/v2/comics/5920843941543936/images/tall.webp?updated=1721974781410&width=420','완결'),
('이번에는 닿기를','에레혼·위츠·엠젯패밀리',array['로맨스']::text[],'&lt;오메가버스 BL&gt; 이번에는 닿기를.
학교 최고 인기남에, 알파인 강빈을 10년간 짝사랑해 온 채서율.
대학교 졸업파티에서 취한 강빈을 데려다 주었다가 밤을 보내게 된다.
그를 좋아한다는 사실을 부인하고 도망쳐 온 채서율, 자신이 뒤늦게 발현한 오메가이며 강빈의 아이를 임신했다는 사실을 알게 되는데…','https://www.lezhin.com/ko/comic/this_time_touch','https://ccdn.lezhin.com/v2/comics/6585948657745920/images/tall.webp?updated=1689301972149&width=420','완결'),
('그림 그리는 생각','안순현',array['일상']::text[],'기쁨, 슬픔, 사랑, 그리움... 우리의 마음을, 우리의 생각을 그린다','https://www.lezhin.com/ko/comic/drawingmind','https://ccdn.lezhin.com/v2/comics/6016680231174144/images/tall.webp?updated=1520223526809&width=420','완결'),
('방과 후, 러브호텔에서 선생님과','우츠기 유아·우로코·넥스큐브·미즈',array['로맨스']::text[],'“여긴 그런 장소잖아?”
낮에는 여고생, 밤에는 러브호텔의 오너인 칸나.
물론 학교에는 비밀이다.
바쁜 매일에 성적은 뚝뚝 떨어져 가고,
덕분에 낙제 스트레스까지 받고 있지만, 그래도 은근히 짝사랑 중인
사이토 선생님과 둘이서만 보충 수업을 하게 되어
조금은 기쁘다고 생각하던 어느 날,
러브호텔에 여자와 함께 나타난 손님이… 선생님……?
그것도 제일 인기 ','https://www.lezhin.com/ko/comic/teacher_in_iovehotel','https://ccdn.lezhin.com/v2/comics/6320083902660608/images/tall.webp?updated=1741931296256&width=420','완결'),
('좋아한다는 걸 잊지마','로또·북큐브네트웍스·북큐브',array['로맨스']::text[],'＂잘생긴 게 최고야!＂ 복학생 정민은 신입생 환영회에서 지호를 처음 만나고 시선을 빼앗기게 되는데...사실 남녀를 가리지 않는 얼빠(*얼굴이 아름답거나 잘생긴 이에게 열광하는 사람)인 정민에게 지호는 너무나 존잘남이었던 것. 그런데 스치듯만난 둘의 인연이 자꾸만 꼬이게 된다?!','https://www.lezhin.com/ko/comic/dont_forget','https://ccdn.lezhin.com/v2/comics/5635590376259584/images/tall.webp?updated=1762862099137&width=420','완결'),
('홀로','이삼',array['드라마']::text[],'국가재난급 바이러스의 확산으로 서울이 폐쇄됐다! 1년 전 사고로 반친구들을 모두 잃었던 해빈은 또다시 혼자가 되지 않기 위해 집을 나서는데... 일상을 되찾기 위한 그의 앞을 가로막는 뜻밖의 진실은?!','https://www.lezhin.com/ko/comic/by_myself','https://ccdn.lezhin.com/v2/comics/5367809780613120/images/tall.webp?updated=1737439313947&width=420','완결'),
('진격의 거인','이사야마 하지메',array['판타지']::text[],'일본 ｢2011년 이 만화가 대단하다!｣ 1위 선정!! 만화 마니아들의 입소문으로 널리 알려진 화제의 작품 발매!! 
수십 미터 크기의 거인과 인류의 대립이라는 거대한 스케일의 만화가 발행된다. 인간을 잡아먹는 거인 앞에서 인간의 공포와 절망이 극한에 치닫는 상황과 더불어 거인에게 맞서는 인류의 저항 의지를 보여주는 작품은 신인 작가답지 않은 꼼꼼한 설정을','https://www.lezhin.com/ko/comic/jinkyuk','https://ccdn.lezhin.com/v2/comics/4844924040642560/images/tall.webp?updated=1784513672682&width=420','완결'),
('마도조사','광풍취고당·묵향동후·디앤씨미디어·비랩코믹스',array['로맨스']::text[],'사문을 배신하고 인간의 길을 포기한 악마 위무선.
모두의 미움을 산 끝에 벌어진
끔찍한 난장강 대토벌에서 죽임당한 그가
13년의 세월이 흐른 뒤 다시 돌아오다!

새로운 몸에 깃든 옛 영혼,
위무선의 주위로 다시 모여드는 옛 인연과 새로운 이들.
다가오는 거대한 음모 속에서
이번에는, 행복한 결말을 맞이할 수 있을까?

국내 서점 종합 1위 베스트셀러,
묵','https://www.lezhin.com/ko/comic/modaozushi','https://ccdn.lezhin.com/v2/comics/5778025909125120/images/tall.webp?updated=1695308100428&width=420','완결'),
('올바른 인생을 살아가는 법','마사토끼·김빛',array['드라마']::text[],'올바른 품행으로 유명한 여학생인 서노아는 어느 날 학교에서 두 명의 남학생에 의해 납치 당한다. 그러나 눈앞에 닥친 악의에도 아랑곳하지 않고 그녀는 자신의 올바름을 관철해 나가는데... 악의와 악의가 맞부딪치는 납치극은 어떤 형태로 막을 내릴 것인가?','https://www.lezhin.com/ko/comic/how_to_live','https://ccdn.lezhin.com/v2/comics/6575268919574528/images/tall.webp?updated=1666575438848&width=420','완결'),
('파라노이드 안드로이드','쏘요',array['드라마']::text[],'인간의 운명을 읽는 점쟁이 맥(Mc). 사실은 인간의 손가락에 내장된 칩을 통해 인간의 과거를 읽어내고 미래를 예지한다. 여러 인간들을 만나 데이터를 수집해나가며 점점 인간에 가까와지는 그는 사실 모종의 목적으로 만들어진 로봇이었으니...! 인간만이 지닌 ''비합리적 측면''을 심리학적으로 짚어낸 속 깊은 만화, 2016 SF어워드 수상작 [파라노이드 안드로이','https://www.lezhin.com/ko/comic/pa','https://ccdn.lezhin.com/v2/comics/5756808370585600/images/tall.webp?updated=1702625665880&width=420','완결'),
('뮤지션','단추',array['로맨스']::text[],'무대 앞에서는 수많은 별들이 뜨고 지지만, 빛을 발할 기회조차 가지지 못하는 별들도 있다. 화려한 무대 뒤, 뮤지션을 꿈꾸는 연습생들의 엇갈린 사랑, 거부할 수 없는 유혹과 배신을 그린 청춘 로맨스.','https://www.lezhin.com/ko/comic/musician','https://ccdn.lezhin.com/v2/comics/55/images/tall.webp?updated=1550051611923&width=420','완결'),
('늪의 나락','순보·북큐브네트웍스·북큐브',array['로맨스']::text[],'집으로 돌아가다 입과 옷에 피를 묻힌 하진과 마주친 도경은 놀라 도망치지만 붙잡힌다.
위기의 순간, 갑자기 나타난 고양이 덕에 하진이 도망가면서 도경은 무사히 풀려난다. 다음 날 학교에서 전날 있던 일로 심란해하던 도경은 우연히 하진과 다시 마주친다.
결국 하진에게 붙잡혀 제 이름과 반까지 다 까발려진 도경은 불안함에 떨며 자신의 기숙사로 돌아가는데….
그','https://www.lezhin.com/ko/comic/hell_of_swamp','https://ccdn.lezhin.com/v2/comics/5391838902616064/images/tall.webp?updated=1672895000429&width=420','완결'),
('나의 수하[개정판]','차현',array['로맨스']::text[],'[개정판]
해당 작품은 &lt;나의 수하&gt; 성인 버전의 일부 장면을 수정한 개정판입니다. 낮에는 유능한 ''비서''로, 밤에는 유능한 ''남자''로 이중생활을 즐기는 수하. 칼퇴 후 게이바에서 상대를 거절하고 나오는 순간 문 앞에서 누군가와 부딪히는데…. 몸에 집 한 채는 걸치고 다니는 이 남자... "박지운...이사님?!"','https://www.lezhin.com/ko/comic/my_suha_15','https://ccdn.lezhin.com/v2/comics/6234227991969792/images/tall.webp?updated=1777012260317&width=420','연재'),
('마법사와 춤을','꽉',array['판타지']::text[],'"나를 찾아와요. 당신을 기다리고 있어요."

자신의 기억을 빼앗은 대마법사 ''오즈''를 찾아다니는 미아 ''도로시''.
하지만 겨우 찾아낸 오즈는 마법사는커녕, 오히려 불운의 저주를 받은 동명이인의 오즈이다. 진짜 오즈를 찾기 위해서는, 대륙의 동서남북을 관리하는 4명의 마녀들을 찾아가야 한다는데...?

마법사가 숨겨둔 진실을 찾기 위한 여행길. 과연 도로시','https://www.lezhin.com/ko/comic/dance_with_wizard','https://ccdn.lezhin.com/v2/comics/6005406548426752/images/tall.webp?updated=1785903458496&width=420','완결'),
('레진 라이브 후기 만화','레진코믹스',array['일상']::text[],'2015년 3월 3일. 레진엔터테인먼트의 또 한번의 도약을 위한 행사 LEZHIN LIVE! 그 현장을 함께한 작가님들의 후기 입니다.','https://www.lezhin.com/ko/comic/lezhinlive','https://ccdn.lezhin.com/v2/comics/1021/images/tall.webp?updated=1520223460918&width=420','완결'),
('당신의 숲','별무리',array['로맨스']::text[],'숲을 지키며 외로이 살아가던 마법사에게 잘생긴 기사님이 찾아왔다! 게다가 당분간은 외로운 숲에서 단둘이, 함께, 지내시겠다는데?! 산책 가듯 한걸음씩 가까워지는 두 사람의 반짝반짝 힐링 판타지 &lt;당신의 숲&gt;','https://www.lezhin.com/ko/comic/your_forest','https://ccdn.lezhin.com/v2/comics/6588515756015616/images/tall.webp?updated=1601537394270&width=420','완결'),
('아나밸과 대한민국','아나밸',array['일상']::text[],'때로는 한국인보다 한국을 더 잘 바라볼 수 있는 사람이 있다. K-POP, 아이돌과 같은 ‘문화’ 이전에 좀더 민낯스러운 한국은 어떤 모습일지…? 한국을 사랑하는 프랑스인 아나밸, 그녀의 눈으로 들여다본 한국 이야기!','https://www.lezhin.com/ko/comic/annabelle','https://ccdn.lezhin.com/v2/comics/5777262465253376/images/tall.webp?updated=1700118955401&width=420','완결'),
('잠겨진 양호실에서 선생님과','카놀라 유·넥스큐브·미즈',array['로맨스']::text[],'"나 지금 발정 중이니까―."
양호실에서 온기를 갈구하는 듯이 부드럽게, 몇 번이나 입술을 겹치는 히로키.
그는 ''여성 의존증''이었다….

과거의 트라우마로 인해 남자와의 접촉이 두려운 양호 선생님 시호.
하지만 어느 날, 몸이 안 좋아 양호실에 온 남학생 히로키에게 붙잡혀 키스 당하고 만다.
곧바로 저를 덮친 몸을 밀어내지만, 실은 그도 ''여성 의존증''이','https://www.lezhin.com/ko/comic/in_a_looked_room','https://ccdn.lezhin.com/v2/comics/4755963969798144/images/tall.webp?updated=1785733351714&width=420','연재'),
('꿈꾸는 먹잇감','Kuaikan Comics·스토리숲',array['로맨스']::text[],'악몽을 먹고 사는 강찬 앞에 나타난 순도 100% 악몽러 한유안!
처음 사귄 친구라는 이유로 강찬만을 믿고 따르는 유안은 
그야말로 잘 차려진 밥상!
 
그런데 이 맛있는 먹잇감을 눈 앞에 두고도 도무지 먹을 수가 없다!
 
“그림의 떡 같은 먹잇감 같으니…
어떻게든 먹고 말겠어!”','https://www.lezhin.com/ko/comic/dreaming_prey','https://ccdn.lezhin.com/v2/comics/5349097371664384/images/tall.webp?updated=1688976351532&width=420','완결'),
('안쌤의 베트남 일기','싸싼',array['일상']::text[],'내가 결혼할 줄은 몰랐지만, 신혼집이 베트남일 줄은 더더욱 몰랐다! 왕까불 오버쟁이 안쌤의 알면 알수록 매력적인 베트남 이야기!','https://www.lezhin.com/ko/comic/vietnam','https://ccdn.lezhin.com/v2/comics/407/images/tall.webp?updated=1687237381971&width=420','완결'),
('선화의 그늘가','크림빵디아',array['로맨스']::text[],'예쁜 외모와 사랑스러운 목소리, 그리고 비상한 두뇌까지
어디 하나 빠지는 구석 없이 누구에게나 사랑받는 ''선화''는
단짝 친구인 ''규리''를 그 누구보다도 좋아한다.
그렇게 영원히 이어질 것만 같던 관계가 갑작스럽게 흔들리기 시작하는데..

"너도 날 좋아해야 해"','https://www.lezhin.com/ko/comic/narcissus','https://ccdn.lezhin.com/v2/comics/6174950587957248/images/tall.webp?updated=1771298756943&width=420','완결'),
('짝꿍이랑 나눠먹는 만화','가량',array['드라마']::text[],'소심하고 조용한 서민희, 다정하지만 눈치 없는 짝꿍 김태훈을 짝사랑 하고 있다.

스윽
"⋯⋯."

어느 날 말없이 건넨 과자 하나.
과연 민희의 사랑은 이루어질 수 있을까?','https://www.lezhin.com/ko/comic/minhee','https://ccdn.lezhin.com/v2/comics/5013322411081728/images/tall.webp?updated=1771298852437&width=420','완결'),
('한 철 어스름','나뭇·북큐브네트웍스·북큐브',array['로맨스']::text[],'쓸데없이 공간 낭비하며 붙어 있던 문은 또 다른 공간으로 통하는 문이었다?!
부모님 직장 때문에 자주 이사 다니던 호수는 새집에서 신기한 문을 발견한다.
그리고 문 건너편에 사는 동갑내기 소년 승우와 만나게 된다.
신비한 경험을 공유하게 된 두 소년은 문을 통해 왕래하기 시작하고,
둘 사이에는 늦은 오후처럼 따듯한 공기가 스며든다.
그리고 서서히 또 다른 ','https://www.lezhin.com/ko/comic/dusk_of_the_season','https://ccdn.lezhin.com/v2/comics/5184615507951616/images/tall.webp?updated=1548644534531&width=420','완결'),
('인스턴트 글라스','가재',array['로맨스']::text[],'11번가의 기묘한 이야기 가재 작가의 사춘기 소녀의 감성으로 버무린 백합 호러 단편집.','https://www.lezhin.com/ko/comic/instant_glass','https://ccdn.lezhin.com/v2/comics/290/images/tall.webp?updated=1717480075468&width=420','완결'),
('일상환상지남','백정',array['로맨스']::text[],'주인공 대성이는 남다른 재능이 있었는데… 그건 바로, 모든 사물이 사람처럼 보이는 것?! 핸드폰, 화분, 컴퓨터, 강아지, 물컵… 이것들이 매일 떠들어대면 신선하고 재미있는 경험일 것 같지만… 다른 사람 눈에는 평범한 물건들처럼 보이니, 정신병자 취급 당하지 않으면 다행이다. 그러던 어느 날…. 자신과 똑같은 재능을 가진 남자가 옆집에 이사를 오는데…','https://www.lezhin.com/ko/comic/a_friendly_neighborhood','https://ccdn.lezhin.com/v2/comics/5267685657804800/images/tall.webp?updated=1545106717247&width=420','연재'),
('웰컴 투 미미살롱','유승종',array['로맨스']::text[],'주인공 지우는 이발사인 아버지와 단 둘이 도란도란 잘 살고 있었다. 이발소 건너편에 미미살롱이 오픈하기 전까지는...! 가족의 삶에 위기를 가져다준 얄미운 미용실 미미살롱. 지우는 군대 가기 전 아버지를 위한 마지막 효도라고 생각하고 미미살롱에 잠입하는데...!','https://www.lezhin.com/ko/comic/mimisalon','https://ccdn.lezhin.com/v2/comics/437/images/tall.webp?updated=1660269591824&width=420','완결'),
('죽거나 펀치','노도환',array['액션']::text[],'오늘도 거르지 않고 괴롭힘을 당하던 고등학생 민호는 다리 밑에서 정체불명의 행인을 만나 도움을 받게 된다.
민호는 겉보기와 다른 강우혁의 비범한 싸움실력을 보고 경호원을 맡아달라는 부탁을 한다. 
그대신 강우혁이 내건 조건은 합법적으로 자신이 사망하여, 생명보험금을 누군가가 받을 수 있게 해주는 것.
가진 자들의 횡포 속의 선택지 없던 두명의 삶, 주먹과 ','https://www.lezhin.com/ko/comic/deathorpunch','https://ccdn.lezhin.com/v2/comics/6233640418541568/images/tall.webp?updated=1775205730894&width=420','완결'),
('글라스 러버스','펭귄쥬스',array['드라마']::text[],'메타버스에서 이상형의 AI와 연애를 할 수 있는 시대.
여자에게 트라우마가 있던 ''김신호''는 성인이 되자마자 VR에서 이상형인 AI ''유화니''를 만나 거사를 치르려 하는데….
미래의 솔로들을 구원할 신개념 메타버스 청춘 성장 로맨...스?','https://www.lezhin.com/ko/comic/glassesl','https://ccdn.lezhin.com/v2/comics/5716170964795392/images/tall.webp?updated=1761617256639&width=420','연재'),
('FREAK-QUENCY : 프릭-퀀시','Xero·Sakon',array['판타지']::text[],'손냐의 오빠(마일로)는 갑자기 사라지고 유일한 단서라고는 이상한 문자 한통. 손냐는 수소문 끝에 갑작스럽게 서비스 종료된 인기작 RPG, "Freak-quency"와 마일로의 사라짐이 관련 있다는 사실을 알게 된다. 또 알게 된 사실은 Freak-quency를 접했던 많은 유저들이 사라지고 있다는 것과 게임이 가상공간에 국한되어 있지 않다는 것! 사라진 마','https://www.lezhin.com/ko/comic/freak','https://ccdn.lezhin.com/v2/comics/6504189639000064/images/tall.webp?updated=1663742395295&width=420','연재'),
('코스믹 콘키스타','이운',array['액션']::text[],'귀족과 평민의 불평등이 첨예한 머나먼 전 우주시대. 평민으로 태어났지만 귀족이 되는 기적을 누릴 수 있는 방법이 있다면? 그것은 바로 특수 우주용병 ''밴퀴''가 되는 것! 주인공 ''주휘'' 또한 지긋지긋한 가난에서 벗어나기 위해 누구보다 열렬히 밴퀴가 되고자 하는데... 천부적 재능 없이 오직 노력만으로 시작된 그의 용감한 도전!','https://www.lezhin.com/ko/comic/cosmic_conquistar','https://ccdn.lezhin.com/v2/comics/5651132341026816/images/tall.webp?updated=1737438985524&width=420','완결'),
('0의 고백','언젯·단남',array['로맨스']::text[],'권영은 매번 윤제영에게 알아들을 수 없는 말로 걷어차였다.
무려 여섯 번이나.

문제는 실연을 하게 되면 무조건 윤제영을 처음 만난 새 학기 첫 날로 돌아간다는 것이었다.
그리하여 결국 0으로 남은 권영의 고백.

“더럽고 치사한 윤제영. 나도 이제 너 안 좋아할 거다!”
“…뭐?”

하지만 포기의 순간, 다시 루프가 시작되며 관계가 미묘하게 바뀌기 시작했','https://www.lezhin.com/ko/comic/zero_goback','https://ccdn.lezhin.com/v2/comics/6693551842983936/images/tall.webp?updated=1749426225327&width=420','완결'),
('희망안식처','김승현·강민석',array['스릴러']::text[],'"커서" 김작가와 "소시아스" 강민석 작가의 컬래버레이션 스릴러. 태식은 오랜만에 친구들을 만난 자리에서 사업 실패로 폐인이 된 줄 알았던 친구 상수를 만난다. 하지만 그 어디에서도 은둔생활의 흔적을 찾을 수 없는 평범한 모습의 상수는 "희망안식처" 덕분에 새로운 삶을 찾았다고 말하고… 그로부터 며칠 후 같은 자리에 함께했던 친구 인철이 목을 매단 사체로 ','https://www.lezhin.com/ko/comic/pseudo','https://ccdn.lezhin.com/v2/comics/6517346050244608/images/tall.webp?updated=1737438637176&width=420','완결'),
('손각시','이정윤',array['액션']::text[],'손각시 탈, 파이프랜치, 너트를 박은 장갑도 모자라 아이까지. 
작은 몸뚱아리 하나에 모두를 짊어지고 
용서할 수 없는 인간들에게 용서 받지 못할 복수를 시작한다.
완벽하게 새로운 느낌의 스릴러 &lt;손각시&gt;가 찾아왔다!','https://www.lezhin.com/ko/comic/songaksi','https://ccdn.lezhin.com/v2/comics/335/images/tall.webp?updated=1520223431524&width=420','완결'),
('버텨내라 김숙희','cafe92·kamille',array['일상']::text[],'베프와 같은 대학교를 가기 위해 열심히 공부했는데 돌아오는 결말은 절교 선언. 대학교에 가서는 눈에 띄지 말아 야지 결심하지만 또다시 외톨이가 되어버린 숙희. 과연 숙희는 오늘도 이 험난한 대학교 생활에서 버틸 수 있을까?','https://www.lezhin.com/ko/comic/endure','https://ccdn.lezhin.com/v2/comics/6078436601626624/images/tall.webp?updated=1776995853596&width=420','완결'),
('멈춰진 시간 속에서','인디고',array['로맨스']::text[],'옛 시골집으로 이사온 연호는 숨겨진 다락방을 발견하고 그곳에 있던 낡은 전화기는 죽은 친구 재하와 같은 이름의 고등학생의 목소리를 들려 주었다...초능력 소년 소녀들의 하이틴 코믹 &lt;내츄럴스&gt;의 인디고 작가가 판타지 소프트BL로 돌아왔다!','https://www.lezhin.com/ko/comic/backintime_to_you','https://ccdn.lezhin.com/v2/comics/231/images/tall.webp?updated=1718087101365&width=420','완결'),
('설레는 기분','쌈바·위즈덤하우스',array['로맨스']::text[],'백설아. 명실상부한 경영학과 퀸. 백설아는
입학할 때부터 그 존재감이 남달랐다.

일찍이 성적으로 검증된 명석함.
굳이 말이 필요없는 외모.

미모와 지성을 겸비한 재원이란 표현이 딱이랄까?

그리고 백설아는 지금 내 자취방 바로 앞 건물에 살고 있다.

"지금이라도 딱 기억할게. 알려 줘, 네 이름."

백설아가 내게 말했다.','https://www.lezhin.com/ko/comic/flutter','https://ccdn.lezhin.com/v2/comics/4708028236496896/images/tall.webp?updated=1681894347190&width=420','완결'),
('마녀도시 리린이야기','레드렌',array['로맨스']::text[],'자살한 사람들의 유서를 먹고 사는 이 세상에 마지막 남은 꼬마 마녀들의 귀여운 잔혹동화.','https://www.lezhin.com/ko/comic/lilinstory','https://ccdn.lezhin.com/v2/comics/174/images/tall.webp?updated=1520223405261&width=420','완결'),
('너를 찾는 파도: 방울이를 돌봐줘 CG툰','청연',array['로맨스']::text[],'아기 천재 &lt;너를 찾는 파도&gt; 청연 작가님이 말아주시는 귀한 방울이 CG툰 등장!
방울이와 놀고 먹고 돌봐주면서 일상을 함께하고 더 친하게 지내봐요. ( ღ''ᴗ''ღ )','https://www.lezhin.com/ko/comic/dewdrop','https://ccdn.lezhin.com/v2/comics/4952778572890112/images/tall.webp?updated=1725525393610&width=420','완결'),
('너의 그 말','비아이',array['로맨스']::text[],'누군가의 스치듯 지나가는 말이 가슴 한켠에 오래 남은 적이 있나요? 친구들과의 내기에서 진 임해경. 그는 벌칙으로 반에서 가장 못생긴 여학생에게 하루에 한번씩 칭찬을 해야하게 되는데...? 작지만 귀여운 러브스토리!','https://www.lezhin.com/ko/comic/u_say','https://ccdn.lezhin.com/v2/comics/19/images/tall.webp?updated=1723527746358&width=420','완결'),
('달래야','춘애',array['로맨스']::text[],'길고양이 달래를 만났던 날, 그 애를 처음 만났지. 주인공 보은은 첫사랑 세연을 떠올릴수록 고양이 달래를 닮았다고 생각한다. 그리고 같은 꿈이 반복되는 이상한 나날들... 첫사랑의 설렘을 따뜻한 색감으로 듬뿍 담아낸 감성 GL. 제3회 세계만화 공모전 우수상 수상작!','https://www.lezhin.com/ko/comic/dallae','https://ccdn.lezhin.com/v2/comics/4949780253638656/images/tall.webp?updated=1563095406609&width=420','완결'),
('BJ 알렉스[개정판]','밍과',array['로맨스']::text[],'[개정판] 
해당 작품은 &lt;BJ 알렉스&gt; 성인 버전의 일부 장면을 수정한 개정판입니다. 방송 전문 bj 알렉스에게 푹 빠진 진성팬 남동균은 그의 방송을 보며 홀로 그와 함께하는 상상을 하곤 하는데... 어느 날 인기 많은 엘리트 학생회장 안지원에게서 알렉스와 똑같은 나비 무늬 반점을 발견한다면?? 상상이 현실로 이루어질 수 있을까?','https://www.lezhin.com/ko/comic/bjalex_15','https://ccdn.lezhin.com/v2/comics/5367962326859776/images/tall.webp?updated=1779268202505&width=420','완결'),
('깊은 곡선','김상이·비아이',array['로맨스']::text[],'애증이 교차하는 두 남녀의 눈빛. 냉정함 속에 감춰진 욕망이 가슴을 뒤흔든다. 비아이 작가의 신작 로맨스.','https://www.lezhin.com/ko/comic/curve','https://ccdn.lezhin.com/v2/comics/140/images/tall.webp?updated=1676255977761&width=420','완결'),
('나는 귀신과 결혼했다','홍부용·사기곰',array['판타지']::text[],'내 아내는 귀신?! 힘든 시절 돈 때문에 영혼결혼식을 올린 황이수. 그의 앞에 귀신 아내가 나타났다.','https://www.lezhin.com/ko/comic/myghostwife','https://ccdn.lezhin.com/v2/comics/164/images/tall.webp?updated=1541041200697&width=420','완결'),
('꿰인 사이','iCiyuan·스토리숲',array['로맨스']::text[],'"마음만 꿰인 줄 알았는데, 이제는 몸까지 꿰여버렸다!"
무명 배우 윤지안,
대학 동창이자 국민 배우인 정시우를 짝사랑 한 지 8년 째.
그를 꼬실 수 있는 방법은 다 해봤다!
넘어올 듯 하더니 정시우가 다른 배우랑 스캔들이 났다고?
​
그럼 여태 나랑 몸으로 했던 것들은 뭔데!?','https://www.lezhin.com/ko/comic/sewn_relationship','https://ccdn.lezhin.com/v2/comics/5579913437708288/images/tall.webp?updated=1706227951517&width=420','완결'),
('골동','권동현',array['드라마']::text[],'어느 깊은 산 속 암자 아미사의 주지인 무형의 골동품을 노리는 도자기 연구가 영민. 그가 무형에게서 빼돌린 찻잔은 전설의 도선 대사 찻잔으로 신비로운 비밀을 담고 있다. 골동품 시장을 뜨겁게 달군 그 전설의 찻잔을 노리는 전국 각지의 수집가들, 그리고 보물을 되찾기 위한 무형과 영민의 얽히고설키는 두뇌 싸움이 펼쳐진다.','https://www.lezhin.com/ko/comic/antique','https://ccdn.lezhin.com/v2/comics/5156658229805056/images/tall.webp?updated=1550038311180&width=420','완결'),
('데우스 바드 마키나 2 : 선택받은 잡것','폴빠·쿠카부라',array['판타지']::text[],'"전쟁 임박! 어둠의 군세를 막을 방법은 단 하나, 그것은 빛과 함께 나타날 구원자의 존재!"
그건 님들 사정이잖아! 난 내일 아침에 전역할 예정이었다고!!
전역 전날 판타지 세계로 떨어져버린 말년 병장 철수의 이세계 군대 깽판 수난기..!!','https://www.lezhin.com/ko/comic/bard2','https://ccdn.lezhin.com/v2/comics/6171464924725248/images/tall.webp?updated=1769509195950&width=420','완결'),
('킬링 미 텐더','마사토끼·보로콤',array['드라마']::text[],'죽음으로 인간을 구원할 수 있다고 믿는 세계제일의 자살조력자와, 생명이야말로 인격보다도 우선한다고 믿는 세계제일의 의사. 죽기를 원함에도 스스로는 죽음을 택할 수 없는 한 의뢰인으로 인해 양립할 수 없는 두 사람의 운명이 교차한다. 이야기의 끝에 의뢰인이 도달할 장소는 삶일까? 죽음일까?','https://www.lezhin.com/ko/comic/killing_me_tender','https://ccdn.lezhin.com/v2/comics/6704126837522432/images/tall.webp?updated=1585812066820&width=420','완결'),
('남고덕뿐','용도',array['로맨스']::text[],'청춘, 용기와 사랑의 열일곱!...은 모두 옆학교 이야기. 땀냄새와 근육이 득실거리는 남고지만 예상과는 다르게 여기에도 청춘이 피어오른다? 팔방미인 존잘남 도영을 향한 승일의 덕후 인생이 펼쳐지고, 덕질 아래 하나되는 남고생들의 울끈불끈한 이야기.','https://www.lezhin.com/ko/comic/namgo','https://ccdn.lezhin.com/v2/comics/5016321036779520/images/tall.webp?updated=1717480599634&width=420','완결'),
('네가 쏟아지다','이준',array['로맨스']::text[],'&lt;연애 세포 억제제&gt;로 인해 청소년들이 사랑을 못 느끼는 세상. 
부모의 싸움을 보며 자란 ''이도''는 세상에 감사하며 성인이 되지 않기를 바란다. 
그런데 왜... 관심도 없던 전학생의 우는 얼굴이 자꾸만 떠오르는 걸까?
사랑을 혐오했던 이도에게 찾아온 저주와 같은 감정. 
그의 애련한 이야기가 시작한다.','https://www.lezhin.com/ko/comic/love_is_pouring_in','https://ccdn.lezhin.com/v2/comics/4706278361923584/images/tall.webp?updated=1737439204762&width=420','완결'),
('Teach Me!','뉴라',array['로맨스']::text[],'삼수생 재홍은 층수를 착각해 잘못 찾아온 윗집 명문대생 은성을 새로운 과외선생님으로 알고 수업을 받는다. 은성이 장난친 것을 알게 되었지만 자기와 생각보다 잘 맞았던 은성에게 재홍은 진지하게 자신을 가르쳐줄 것을 권유하게 된다. "...저기 과외 해보실래요?" 제4회 세계만화공모전 우수상 수상작!','https://www.lezhin.com/ko/comic/teachme','https://ccdn.lezhin.com/v2/comics/5411508990312448/images/tall.webp?updated=1718861984438&width=420','완결'),
('행운의 신','징니',array['드라마']::text[],'평생 남에게 싫은 소리 한번 못 해보고 살아온 착한 사람 경득씨. 그에게 찾아온 일생 단 한 번의 행운이란... 세상 사람들에게 행운을 나눠주는 ''행운의 신''이 될 수 있는 기회였습니다.','https://www.lezhin.com/ko/comic/god_luck','https://ccdn.lezhin.com/v2/comics/326/images/tall.webp?updated=1550038139117&width=420','완결'),
('디기탈리스','설·랙',array['로맨스']::text[],'전생은 현재로, 운명은 필연으로ㅡ근무를 마치고 수능이 끝난 여동생을 픽업하러 간 차진우는 우연히 여동생과 같은 반 친구인 오유성을 만나게 된다. 여동생을 내려주고 유성을 픽업하던 중 교통사고를 당한 진우. 그로 인해 전생의 연인이 유성임을 떠올리게 되는데... 운명을 붙잡으려는 진우와 괴로운 현실 때문에 운명에서 도망치려는 유성. 이 둘의 갈림길의 끝은 어','https://www.lezhin.com/ko/comic/digitalis','https://ccdn.lezhin.com/v2/comics/4949787657502720/images/tall.webp?updated=1704184195117&width=420','완결')
), ins as (
  insert into public.works (title_ko, author, genres, blurb_ko, cover_url, status, is_curated, sort)
  select i.title, i.author, i.genres, nullif(i.blurb,''), nullif(i.cover,''), i.st, false,
         11000 + row_number() over (order by i.title)
    from imp i
   where not exists (select 1 from public.works w where w.title_ko = i.title)
  returning id, title_ko
)
insert into public.work_legal_links (work_id, platform_key, url, sort)
select ins.id, 'lezhin', imp.url, 0
  from imp join ins on ins.title_ko = imp.title;

-- 확인용
select status, count(*) from public.works group by status order by status;
