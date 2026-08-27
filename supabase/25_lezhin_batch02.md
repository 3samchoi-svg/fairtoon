-- 레진코믹스 수집 2/16 — scripts/collect_lezhin.py 생성
-- 320편. 청소년 이용불가 제외 · 제목이 이미 있으면 넣지 않는다.
-- 실행: SQL Editor 에서 Run. 여러 번 실행해도 안전하다.

with imp(title, author, genres, blurb, url, cover, st) as (values
('오해가 계속되면 오예입니다','카리보',array['로맨스']::text[],'학교의 여신 정연에게 문자로 고백한 금사빠 민규. 그러나 잘못 저장된 번호의 주인은 정''현''! 그런데, 정현이 민규의 고백을 받아들였고, 정신 차려보니 민규에겐 키 192의 무뚝뚝한 남자친구가 생겨 있었다...!!','https://www.lezhin.com/ko/comic/oheoye','https://ccdn.lezhin.com/v2/comics/6519182347337728/images/tall.webp?updated=1761629402896&width=420','완결'),
('이상한 날','노키드',array['판타지']::text[],'헤어진 그녀의 페북 사진 속에서 빌려준 그 책을 발견하고는 그녀를 찾아 아일랜드행 비행기에 올랐다. 그리고, 놀라운 하루가 시작되었다. [8군 플레이 그라운드 쑈] [감기]의 노키드 작가가 오랜만에 선보이는 환상적이고도 로맨틱한 단편 모음집!','https://www.lezhin.com/ko/comic/whataday','https://ccdn.lezhin.com/v2/comics/6097005586153472/images/tall.webp?updated=1550208348434&width=420','완결'),
('발화','영재영',array['드라마']::text[],'가족이 불편하다. 친오빠가 싫다. 이대로... 내가 사라졌으면 좋겠다.

조형예술학과에 갓 입학한 대학생 "정인혜"는 룸메이트 "안수진"과 함께 정신없는 신입생 생활을 보낸다. 구김살 없이 해맑은 캠퍼스 라이프를 즐기는 수진, 그런 수진과 지낼수록 인혜는 과거 가족으로부터 얻은 트라우마가 떠오르며 열등감을 느끼기 시작한다. 예술에 대한 열정으로 일상을 유지','https://www.lezhin.com/ko/comic/inflame','https://ccdn.lezhin.com/v2/comics/6608868420026368/images/tall.webp?updated=1785487112776&width=420','연재'),
('애교당번','소곡',array['드라마']::text[],'쿨시크한 긴생머리 지윤은 사실 다정다감한 반장 소연을 짝사랑한다. 그런데 어느 날 소연에게 들은 말. “너처럼 하얗고 키크고 예쁜 아이를 왜 몰랐을까?” 그리고 의외로 빨리 찾아온 기회(?)는 단 둘만의...','https://www.lezhin.com/ko/comic/school','https://ccdn.lezhin.com/v2/comics/5399160962285568/images/tall.webp?updated=1737438707806&width=420','완결'),
('새디스틱 뷰티:외전B [개정판]','우연희·이금산·키다리스튜디오',array['로맨스']::text[],'''차우경  X 변민호 : 늘 자신보다 한 수 아래라고 생각했던 두나가 대상을 받던 날, 모두의 축하를 받는 두나를 뒤에서 지켜보던 변민호는 질투심과 패배감이 뒤섞인 미묘한 감정에 학교 옥상으로 올라가 숨죽여 울음을 뱉어냈다. 아무도 모르게.. 그런 그를 몰래 지켜보던 차우경은 변민호의 가식 없는 날 것의 표정을 본 그날부터 오롯이 그를 갖는 것을 꿈꿔왔다.','https://www.lezhin.com/ko/comic/sadi_bt_b','https://ccdn.lezhin.com/v2/comics/4777537292140544/images/tall.webp?updated=1770279928427&width=420','완결'),
('한번 해볼래?','Tosay Culture Company Limited·Xinmengjing·스토리숲',array['로맨스']::text[],'"네가 아무리 튕겨도 내 공략법이면 결국 넘어오게 될 거야!"

미소년 연애 공략게임 전문가 로운.
교내 최고 인기남 강수호를 꼬셔서 내 공략법이 최고라는걸 보여주겠어!

하지만 강수호 이 남자, 쉽지 않다.
넘어올 듯 넘어오지 않는 게…

나랑 한번 해보면 생각이 달라질 걸?','https://www.lezhin.com/ko/comic/want_to_try','https://ccdn.lezhin.com/v2/comics/6170109304700928/images/tall.webp?updated=1715580684623&width=420','완결'),
('비하인드 스캔들','칠구·북큐브네트웍스·북큐브',array['로맨스']::text[],'8년 지기 이 새끼는 얼마 전, 내게 고백했다.

친구라는 관계를 유지하기 위해
도운에게 향하는 마음을 숨긴 채 옆에서 조용히 좋아해 온 찬.
그런데 어느 날 도운이 찬에게 좋아한다 고백하는데...

그렇지만 그 고백 후에 터진 배우 도운의 스캔들에
찬은 도운의 마음이 진심인지 아닌지 헷갈린다.','https://www.lezhin.com/ko/comic/behind_scandal','https://ccdn.lezhin.com/v2/comics/6520515475996672/images/tall.webp?updated=1762862071272&width=420','완결'),
('세상에 없는 이웃','1230',array['판타지']::text[],'&lt;구원하소서&gt;, &lt;방황하는 신&gt;으로 밀도 높은 비주얼과 독특한 시나리오로 독자를 매료시킨 1230 작가의 신작!!
꿈을 쫓는 섬, 노량진. 그리고 허름한 고시원들 사이에 우두커니 서 있는 교회. 어떤 연유로 망한 교회 안에 언제부턴가 사람들에게 피를 사는, 이름도 나이도 모르는 두 남자가 살기 시작했다. 사람을 흉내내며 사람이 되고 싶','https://www.lezhin.com/ko/comic/neighbor','https://ccdn.lezhin.com/v2/comics/6424482819211264/images/tall.webp?updated=1773639608488&width=420','완결'),
('슬기로운 생활','어진·지애',array['로맨스']::text[],'지고지순한 미모를 지니고 태어난 유창이의 본격 찌질이 되기 프로젝트! 
꽃미남 유창이를 차지하기 위한 꽃미남들의 치열한 암투가 여러분을 찾아갑니다!','https://www.lezhin.com/ko/comic/sulgilife','https://ccdn.lezhin.com/v2/comics/6546486057238528/images/tall.webp?updated=1554793781280&width=420','연재'),
('세인트 영멘','나카무라 히카루',array['코미디']::text[],'누구도 생각하지 못했던 기발하고 파격적이며 재기 넘치는 소재!!
발행 전부터 무수히 많은 관심과 논란의 대상이 되었던 "세인트☆영멘" 정식 한국어판 발행!
깨달음을 얻은 사람 붓다. 하느님의 아들 예수.
세기말을 무사히 넘긴 두 사람은 도쿄 다치카와에 공동으로 아파트를 빌려 하계에서 휴가를 보내고 있다. 
동네 아줌마처럼 잔돈 하나까지 챙기며 알뜰살뜰 생활','https://www.lezhin.com/ko/comic/saintyoungmen','https://ccdn.lezhin.com/v2/comics/4782140921741312/images/tall.webp?updated=1764235803995&width=420','연재'),
('풍월주 - 바람과 달의 주인','박윤선·909',array['로맨스']::text[],'신라시대 최고의 남자 기생으로 귀부인들의 사랑을 독차지한 열. 
그와 어린 시절부터 생사고락을 같이한 친구, 사담. 
어느 날, 신라 최고의 권력자 진성여왕의 눈에 들어버린 열은 사담의 곁을 떠나야할 상황에 처하지만, 
열의 마음은 그저 한결같이 사담을 향하고 있을 뿐인데... 
ⓒ풍월주/박윤선,909','https://www.lezhin.com/ko/comic/windandmoon','https://ccdn.lezhin.com/v2/comics/5108965871976448/images/tall.webp?updated=1711352507587&width=420','완결'),
('너의 사랑에 대하여','박노덕·북극여우',array['로맨스']::text[],'''짝사랑은 부질 없다''
친형의 비참한 짝사랑의 말로를 보며 ''요한''이 내린 결론이다.

"형 이준서 좋아하는 거 다 티나요."
"게이?"

동아리 선배인 ''무경''이 동급생 ''준서''를 짝사랑하는 걸 알게 된 요한은
그저 준서를 바라보기만 하는 무경의 행동이 꼴사납기만 하고,
자신의 정체성이 탄로난 무경은 자신을 아니꼽게 보는 요한이 무척 껄끄럽게 느껴진다.
','https://www.lezhin.com/ko/comic/about_your_luv','https://ccdn.lezhin.com/v2/comics/5350681733824512/images/tall.webp?updated=1763361472854&width=420','완결'),
('이야기군과 편집양','마사토끼·도현',array['스릴러']::text[],'한 천재가 스스로의 손으로 죽음을 선택했다. 그의 죽음에 얽힌 비밀을 떠안게 된 이야기꾼은 학창 시절부터의 악우 편집양과 함께 위험하고도 비극적인 진실 찾기에 나서게 되는데...!','https://www.lezhin.com/ko/comic/editory','https://ccdn.lezhin.com/v2/comics/257/images/tall.webp?updated=1556858527768&width=420','완결'),
('그렇게까지 말한다면 할 수 없잖아!','마사토끼·느루',array['스릴러']::text[],'그 녀석을 어떻게 해버렸으면 좋겠어! 헤어진 남친을 향한 은근한 복수. 마사토끼와 느루 콤비의 코믹 단편.','https://www.lezhin.com/ko/comic/better_than_revenge','https://ccdn.lezhin.com/v2/comics/220/images/tall.webp?updated=1550124332750&width=420','완결'),
('솔로가 하는 연애','신매',array['로맨스']::text[],'지금 솔로인,혹은 솔로였던, 다른 사람이 아닌 바로 당신의 이야기. 달콤쌉싸름한 연애공감툰.','https://www.lezhin.com/ko/comic/solo','https://ccdn.lezhin.com/v2/comics/111/images/tall.webp?updated=1550051944826&width=420','완결'),
('악역으로 환생한 내가 살아남는 방법','Kuaikan Comics·Wang Yi·Yiyiyiyi·씨엔씨레볼루션㈜',array['로맨스']::text[],'불치병에 걸린 서안, 그가 자신이 읽던 소설 속 캐릭터의 몸에 환생하게 된다.   하지만 원래 몸의 주인은 적국의 황자로, 원작 속 주인공을 괴롭히다 주인공 손에 죽게 될 운명이다. 현실에선 불치병에 걸려 죽을 운명, 소설 속에선 악역이라 죽어야 하는 운명.   운이 지지리도 없는 서안이 살아남기 위해 원작 속 주인공의 환심을 사로잡기로 결심한다.  이러한','https://www.lezhin.com/ko/comic/reincarnation','https://ccdn.lezhin.com/v2/comics/5028518221381632/images/tall.webp?updated=1667381141645&width=420','완결'),
('뱀파이어 도서관','이선영',array['판타지']::text[],'“어서 오세요, 낮과 밤이 다른 수상한 도서관에―!” 

뱀파이어 콘셉트로 운영되는 동네 도서관에서 사서 아르바이트를 시작한 대학생 ‘유마노’. 알비노인 까닭에 사람들의 시선을 받지 않고 조용히 살아가고 싶어 하지만 최근 일을 하게 된 이 도서관이 범상치가 않다. 아무리 뱀파이어 콘셉트라지만 자신들이 뱀파이어라고 하는 직원, 거기다 마노를 자신들의 동족이라','https://www.lezhin.com/ko/comic/vampirelibrary','https://ccdn.lezhin.com/v2/comics/5245613627670528/images/tall.webp?updated=1731906110219&width=420','완결'),
('BAD DESIGN (나쁜 설계)','레고 이경하·앤드비',array['로맨스']::text[],'‘내가 왜 이러는지, 너는 이해할 수 있을까?’ 
조금씩 엇나간 그대로, 
자신만의 방식으로 사랑하는 이들의 이야기가 펼쳐집니다. 
사람과 사랑을 섬세하게 담아내는 작가! 
「Coy」, 「BLUE, BLACK, SKY」의 LEGO 이경하 작가의 새 연재작!!','https://www.lezhin.com/ko/comic/baddesign','https://ccdn.lezhin.com/v2/comics/5602250116825088/images/tall.webp?updated=1636020358507&width=420','완결'),
('카사네','마쓰우라 다루마',array['드라마']::text[],'비록 네가 잠을 자는 동안만이라도 나도 네가 되어보고 싶어. 차마 눈뜨고 볼 수 없을 흉측한 외모를 가진 소녀 카사네. 그 얼굴 때문에 가혹한 길을 걷는 카사네에게 엄마가 남겨준 한 개의 립스틱.
그 립스틱의 힘이 학대받으며 살아온 카사네의 모든 것을 바꾸어 간다-.','https://www.lezhin.com/ko/comic/kasane','https://ccdn.lezhin.com/v2/comics/6449374706532352/images/tall.webp?updated=1764238191704&width=420','완결'),
('만지고 싶어!','China Literature·Gu Nanxi·Vigor Comic·스토리숲',array['로맨스']::text[],'걸크러쉬 인기 락밴드 리더 강세아가 결벽증을 가지고 있는 외과 의사 유도혁을 만나 그 사람의 손과 사랑에 빠졌다?! 

‘저 손…가지고 싶어…! 나만 만지고 싶어!’
도혁을 만날 때 마다 “만져봐도 돼요?”라고 묻는 세아!
“예쁜 손은 다 만져봐요?”
“아니요, 선생님한테만 그래요. 그러니까...한 번 더 만져봐도 돼요?”

조금씩 강세아의 일상으로 스며드','https://www.lezhin.com/ko/comic/i_want_to_touch','https://ccdn.lezhin.com/v2/comics/4701529878888448/images/tall.webp?updated=1655862190326&width=420','완결'),
('다녀왔어, 어서 와','이치카와 이치·넥스큐브·볼레로',array['로맨스']::text[],'훈남 남편과 깜찍하고 귀여운 아기에게 둘러싸인
평화로운 주부 라이프♥

스스로에게 자신감이 없는 전업주부, 후지요시 마사키.
엘리트 샐러리맨인 남편 히로무와 곧 2살이 되는 아들 히카리와 함께
평범하지만 소중한 일상 속에서 조금씩 자기 자신을 받아들여 간다.
기쁨과 슬픔을 딛고 어제보다 더 “가족”이 되어가는 세 사람.
당신에게 따뜻함을 안겨줄 후지요시 가','https://www.lezhin.com/ko/comic/home_sweet_home','https://ccdn.lezhin.com/v2/comics/6509080767889408/images/tall.webp?updated=1785458100398&width=420','완결'),
('여친만(여자친구만들고파)','류병민·박형준',array['액션']::text[],'야호!!,용기백배 등 알콩달콩한 연애물로 만화팬들의 인기를 한몸에 받았던 류병민(글)과 프라이팬,에서 감각 있는 그림체와 감성적인 멜로라인을 살리는 스토리로 소년들뿐만 아니라 소녀 팬들까지 아우르는 독자들의 지지를 받았던 박형준(그림)이 팀을 이뤄 2007년 새롭게 시작한 찬스의 연재작!! 두 기성작가의 장기가 잘 살아난 본격 청춘 학원러브코믹물로 누구나 ','https://www.lezhin.com/ko/comic/iwannagirlfriend','https://ccdn.lezhin.com/v2/comics/4646149695209472/images/tall.webp?updated=1655183107163&width=420','연재'),
('볼콤성의 유령','마레',array['드라마']::text[],'별 볼 일 없이 살아가는 무명작가 해리는 어느 날 친구로부터 자신의 시신을 수습해 주면 재산을 상속하겠다는 편지를 받게 된다. 갑자기 찾아온 행운에 들떠 찾아간 볼콤성에서 장례를 치른 밤, 해리는 친구 타일러의 유령과 마주치게 되는데…','https://www.lezhin.com/ko/comic/bolcom','https://ccdn.lezhin.com/v2/comics/5196968141258752/images/tall.webp?updated=1520223484768&width=420','완결'),
('별의 아이, 센츄리온!','JK·박지',array['판타지']::text[],'2016년 서울, 혜성처럼 등장한 히어로가 있다. 이름도 얼굴도 공개되지 않은채 SNS로 소문만 무성해진 이 히어로의 정체는 근육질, 가슴털, 넓은 어깨를 가진 것도 아닌... 갓 성인이 된 20살의 예쁜 남학생?! 베일에 쌓인 히어로는 없다, 청년보다 소년이 어울리는 외계소년 성아의 히어로 각성기!','https://www.lezhin.com/ko/comic/centurion','https://ccdn.lezhin.com/v2/comics/5901351032979456/images/tall.webp?updated=1657526035790&width=420','완결'),
('한복이 너무해','김아영·CHARA·학산',array['로맨스']::text[],'가정부를 불렀는데 민속촌 아가씨가 튀어나왔다?! 2012년 트위터리안들을 뜨겁게 달궜던 대검찰청과 한국민속촌 커플링의 소셜 페스티벌이 마침내 웹툰화! 대검이와 소촌이의 달콤쌉쌀 두근두근 러브액시던트!!
매월 1, 11, 21일 업데이트','https://www.lezhin.com/ko/comic/hanbok_lady','https://ccdn.lezhin.com/v2/comics/6650203671232512/images/tall.webp?updated=1548983005423&width=420','완결'),
('물고기의 밤','정은수',array['드라마']::text[],'‘여자애’라고 하기엔 너무 나이가 많지만 스스로 ‘어른’이라고 하기에도 어색한 나이.  
서른을 앞둔 예은은 어릴 적부터 꿈꿔오던 조명 회사에서 근무하고 있다.  
하고 싶던 일을 직업으로 갖게 되었지만 여전히 뭔가 손에 넣지는 못한 듯하고,  
남자친구가 있지만 왠지 허전한 느낌이다.  
그래도 자신은 일과 사랑 모두에 문제없다고, 이 정도면 괜찮다고 생','https://www.lezhin.com/ko/comic/fishnight','https://ccdn.lezhin.com/v2/comics/5939837511663616/images/tall.webp?updated=1541646002872&width=420','완결'),
('내 사랑을 부탁해','야마구치 메구미·넥스큐브·미즈',array['로맨스']::text[],'대학 입학을 계기로 자취를 하게 된 사쿠라코는 동생이 신세를 지고 있는
어린이집 교사, 카오루의 집에서 가사 도우미 아르바이트를 하게 되었다.
사실 카오루를 짝사랑하고 있던 사쿠라코는 아르바이트 첫날,
설레는 마음을 안고 갔지만 정작 그녀를 맞이한 것은 인상 사나운 정체불명의 남자였는데……?!','https://www.lezhin.com/ko/comic/takemylove','https://ccdn.lezhin.com/v2/comics/4723397472288768/images/tall.webp?updated=1573436605541&width=420','연재'),
('난 있잖아 넌 없잖아','PJS·유종표·1535',array['드라마']::text[],'어느 날 부ㄹ친구가 부ㄹ 떼고 나타났다면?! 가능?','https://www.lezhin.com/ko/comic/there_is_or_isnt','https://ccdn.lezhin.com/v2/comics/5103025959534592/images/tall.webp?updated=1626420262334&width=420','완결'),
('비 마이 게스트[개정판]','티오비·영모',array['로맨스']::text[],'[개정판]
해당 작품은 &lt;비 마이 게스트&gt; 성인 버전의 일부 장면을 수정한 개정판입니다. 뜨거운 여름, 오키나와에 배낭여행을 간 연우가 바다에 빠진 것을 계기로 머물게 된 게스트 하우스 ''유루리''. 연우를 구해준 일본인 훈남과 더불어, 자유로운 삶을 즐기는 다른 숙박객들. 모래와 땀이 섞이는 이곳으로 오세요! -&lt;래빗홀&gt;의 영모 작가와','https://www.lezhin.com/ko/comic/bemyguest_15','https://ccdn.lezhin.com/v2/comics/4636603184644096/images/tall.webp?updated=1785483418637&width=420','완결'),
('나를 찾아주세요','오계',array['일상']::text[],'「인간으로 돌아가기 위해선 짝짓기(?)를 해야한다고...?!」
실종된 줄 만 알았던 인규가 햄스터가 되어 민채 앞에 나타났다.
햄스터를 좋아하지 않는 민채와 햄스터가 되어버린 인규의 동거가 시작된다.
&lt;순결한 죄&gt; 오계 작가님의 &lt;햄스터와 독신녀&gt;의 후속작!','https://www.lezhin.com/ko/comic/finding_me','https://ccdn.lezhin.com/v2/comics/6283106660515840/images/tall.webp?updated=1786008752978&width=420','완결'),
('원웨이티켓','사유',array['로맨스']::text[],'7년 간의 지겨운 동거를 룩셈부르크에서 장렬하게 끝내고 평생 비혼을 맹세하게 된 희영에게 세 명의 남자가 들이댄다. 희영의 꿈을 응원하는 맨스플레인 팀장 지훈, 희영을 위해 많은 것을 준만큼 모든 것을 원하는 ex 진석, 그리고 일러천재이자 세젤귀 연하남 설우. 비혼주의자 희영에게 날벼락처럼 들이닥친 로맨스의 결말은? 그리고 ''여행의 발견''은 그녀의 손에서','https://www.lezhin.com/ko/comic/onewayticket','https://ccdn.lezhin.com/v2/comics/5568848289202176/images/tall.webp?updated=1599210216170&width=420','완결'),
('너와 헤어진 세 번의 가을','광염·도서출판황매·황매북스',array['로맨스']::text[],'한 사람을 만나면서 자신이 조금은 특별해지는 이야기.
사랑하는 두 사람이 서로를 알아가는 이야기를 섬세하게 표현한 예쁜 글과 그림이 있는 클래식컬한 순정만화!10년의 세월을 건너뛰어 다시 만난 첫사랑!
이젠 기억도 희미한 첫사랑을 다시 만났다! 그것도 직장 상사로!
혼자서는 평범한 이름이 함께하면 특별해지는 그들!
 
중학교 시절 이름으로 인해 놀림 당한 ','https://www.lezhin.com/ko/comic/three_autumn','https://ccdn.lezhin.com/v2/comics/5908661120139264/images/tall.webp?updated=1583373761822&width=420','완결'),
('몸으로 느끼는 거짓 사랑','이부키 카에데',array['로맨스']::text[],'“이 질긴 인연이 주박 때문이었다니?!”

옆집에 살아, 교실 옆자리에 앉아, 
심지어는 C.A.마저 함께하지만 
어쩌다보니 그렇게 되었을 뿐인 
시즈루와 소타.

서로 지겹다며 투닥거리는 두 사람의 질긴 연이 
사실은 전생과 관계가 있는 것으로 밝혀진다!
이 악연을 해소하려면 두 사람이 S를 해야만 한다지만
“어떻게 이딴 애랑?! 난 절대 못해!!”

소','https://www.lezhin.com/ko/comic/feelbodylove','https://ccdn.lezhin.com/v2/comics/6561169421107200/images/tall.webp?updated=1721379227641&width=420','완결'),
('언밸런스X2','임달영·이수현',array['드라마']::text[],'한국 러브 코메디의 신기원을 이룬 히트작.  
두근반 세근반~ 신세대 사제지간의 언밸런스 한 사랑공식!','https://www.lezhin.com/ko/comic/unbalancex2','https://ccdn.lezhin.com/v2/comics/125/images/tall.webp?updated=1554871001135&width=420','완결'),
('꼴데툰 2015','샤다라빠',array['코미디']::text[],'10개 구단 체제의 첫 해인 2015년, 롯데는 가을에 야구할 수 있을까?! 딥빡과 감동이 묻어 있는 샤다라빠의 롯데 만화, 개막!! 시즌 중엔 무료 연재!!','https://www.lezhin.com/ko/comic/ggtoon2015','https://ccdn.lezhin.com/v2/comics/444/images/tall.webp?updated=1661762009919&width=420','완결'),
('호환마마','김턱·파공',array['액션']::text[],'조선 팔도에는 산마다 호랑이가 살며,
밤에는 호랑이가 내려와 사람을 먹는 시대.

홀몸으로 두 남매를 키우던 안설화는
눈앞에서 호랑이에게 두 아이가 죽는걸 보게 된다.
그후 복수심에 호랑이를 죽이는 것만을 생각하며 여행을 떠나는데....','https://www.lezhin.com/ko/comic/tiger_mama','https://ccdn.lezhin.com/v2/comics/6628890106462208/images/tall.webp?updated=1771299079602&width=420','완결'),
('우주인(Would you in?)','피티',array['로맨스']::text[],'광활한 우주 속에서 언제나 혼자였던 우주인 노랑. 어느 날 그녀의 별에 신기한 것이 가득한 우주선 하나가 찾아온다. 그 안에서 지구인 파랑의 마지막 기록을 발견하고... 놀라서 허둥거리는 노랑 앞에 다정한 목소리로 인사를 건네는 파랑이 나타난다. 외톨이 우주인 노랑, 시한부 지구인 파랑의 우당탕탕 로맨스! Would you in?','https://www.lezhin.com/ko/comic/space','https://ccdn.lezhin.com/v2/comics/6461632918126592/images/tall.webp?updated=1729503504758&width=420','완결'),
('이윽고 네가 된다','나카타니 니오·레진코믹스',array['로맨스']::text[],'사람을 좋아하는 마음을 알 수 없어 고민에 빠진 신입생 코이토 유우는 학생회 선배 나나미 토우코가 고백받는 모습을 우연히 보게 된다.
누구의 고백에도 마음이 움직인 적 없다는 토우코에게 공감을 느낀 유우였지만 이윽고, 토우코에게서 생각지도 못한 말을 듣게 된다.

*84화는 심의상 원작 일부가 삭제되어 있음을 알려 드립니다','https://www.lezhin.com/ko/comic/bloom_into_you','https://ccdn.lezhin.com/v2/comics/5249977139068928/images/tall.webp?updated=1617864330537&width=420','완결'),
('문화의 바다로 (모 웹툰 불법복제 사이트 운영자 검거 기념)','럽피',array['드라마']::text[],'문화의 바다로 (모 웹툰 불법복제 사이트 운영자 검거 기념) 건전문화 소비 캠페인 웹툰','https://www.lezhin.com/ko/comic/cam_copyright','https://ccdn.lezhin.com/v2/comics/5964716475285504/images/tall.webp?updated=1527155357983&width=420','완결'),
('내일은 말할 수 있을까','사쿠라 시이네·넥스큐브·페어리',array['로맨스']::text[],'단순하고 바보 같은 면도 내게는 눈이 부신걸.
그러니까…그런 아픈 표정은 짓지 마!''
우연한 계기로 동급생인 오오타니의 연애 상담을 맡게 된 타카츠키.
아무리 봐도 서로 사랑하는 것 같지만 극심한 심술쟁이인 탓에
속마음과는 달리 상대에게 얄미운 말만 하는 오오타니가 답답한 한편,
그 순수함이 부럽기도 하다.
하지만 시간이 지날수록 잘 되면 좋겠다고 생각하면','https://www.lezhin.com/ko/comic/please_talk_to_me','https://ccdn.lezhin.com/v2/comics/6052022176710656/images/tall.webp?updated=1519873202783&width=420','완결'),
('그레이스 길들이기','서림·목마·키다리스튜디오',array['로맨스']::text[],'시종 헤르타는 자신의 어머니를 매몰차게 쫓아낸 그레이스 가문과 제 아버지를 증오한다. 
그러던 어느 날, 자신의 주인 앤드류가 유전병에 걸렸다는 사실을 알게 되고, 
죽음을 눈앞에 둔 앤드류는 헤르타를 위해 무엇이든 해주겠다 말하는데…. 
헤르타는 앤드류를 이용해 복수에 성공할 수 있을까?','https://www.lezhin.com/ko/comic/grace_taming','https://ccdn.lezhin.com/v2/comics/6332119003299840/images/tall.webp?updated=1677509437796&width=420','완결'),
('안녕, 나의 폐하','W. Y·디앤씨미디어·비랩코믹스',array['로맨스']::text[],'*15세 이상 이용가능
*본 작품은 픽션이며 등장하는 인물, 사건, 지명 등은 실존하는 것과 일체 관계가 없습니다.

고대 이집트에 관심이 많은 의대생 장이현.
그는 유적을 보기 위해 이집트로 답사를 떠났다가
넓은 유적에서 길을 잃고 도굴꾼들과 맞닥뜨리게 된다.
이현은 그들에게 붙잡혀 석관 안에 갇히게 되었지만
숨 막히는 위기 속에서 가까스로 탈출에 성공한','https://www.lezhin.com/ko/comic/hello_majesty','https://ccdn.lezhin.com/v2/comics/4804072098824192/images/tall.webp?updated=1782805840900&width=420','연재'),
('우리 아빠가 대표님이래요','에코스튜디오·엠스토리허브',array['로맨스']::text[],'"아빠라고… 불러도 돼요?"

아빠 없이 엄마의 손에 홀로 키워진 은호에게
갑자기 나타난 남신 아빠!

그런데… 아빠가 생긴 건 좋지만,
은호의 눈엔 둘의 사이가 조금 미묘해 보인다.

엄마, 아빠와 행복하게 살고싶은
은호의 바람은 이루어질 수 있을까?','https://www.lezhin.com/ko/comic/my_dads_the_boss','https://ccdn.lezhin.com/v2/comics/5203110975045632/images/tall.webp?updated=1704688904231&width=420','완결'),
('독재자와 강제 결혼','우로코·하루노 슌·넥스큐브·미즈',array['로맨스']::text[],'정말로 1억 엔에 낙찰되어 버리다니!
목욕도, 침대도 함께 하는 신혼생활. 그 상대는 무려 동급생이었다!
아버지가 정리 해고되어 버린 바람에 생활할 돈도 없는 데다가 부자 학교에서 퇴학할 위기까지 처해 버렸다. 고민 끝에 치아키는 옥션 사이트에 자신과 ''결혼'' 할 사람을 모집한다는 글을 올리는데… 무려 1억 엔에 낙찰되버렸다!
"부부가 되었으니, 맹세의 키','https://www.lezhin.com/ko/comic/marriage_with_the_dictator','https://ccdn.lezhin.com/v2/comics/5648823670276096/images/tall.webp?updated=1677510882577&width=420','완결'),
('유아so러블리','에니카',array['로맨스']::text[],'주변에 관심없는 무뚝뚝한 여고생 소유아. 우등생이지만 숨어서 담배피는 한서온. 날나리 같지만 유아를 끔찍히도 좋아하는 유아의 친구 신나림. 이들의 사랑과 성장의 이야기.','https://www.lezhin.com/ko/comic/ua_so_lovely','https://ccdn.lezhin.com/v2/comics/71/images/tall.webp?updated=1551927604739&width=420','완결'),
('다니엘의 인어 [연재]','Yasheng+Houby/YoudbG Studio·스토리숲',array['로맨스']::text[],'인어 연구에 진심인 다니엘은 첫 답사에서 포획한 인어가 자신을 유혹하는 듯한 느낌을 받는다. 순수한 호기심에 인어에게 다가가지만, 다니엘을 기다리고 있는 건 위험천만한 소유욕과 달콤 쌉싸름한 집착뿐이었다.','https://www.lezhin.com/ko/comic/daniels_mermaid','https://ccdn.lezhin.com/v2/comics/5018707434864640/images/tall.webp?updated=1762142241663&width=420','연재'),
('다피만화','다피',array['코미디']::text[],'남녀노소 누구나 편하게 즐길 수 있는 다피만화 입니다 그러니까 피디님 제발
고1추 좀 반려 좀 시키지 말아주세요','https://www.lezhin.com/ko/comic/dapeemanhwa','https://ccdn.lezhin.com/v2/comics/6514387950305280/images/tall.webp?updated=1737439413464&width=420','완결'),
('피아노 마주보기','한지원',array['로맨스']::text[],'남자친구 석이와 동거를 하고 있던 지일은 최근에 군대에서 영장이 나오자 석이가 가출을 하고 모든 게 엉망이다. 하지만 지일에게 닥친 진정한 위기는 따로 있는데.. 화제의 애니메이션 &lt;생각보다 맑은&gt; 한지원 감독 작품','https://www.lezhin.com/ko/comic/facing_piano','https://ccdn.lezhin.com/v2/comics/83/images/tall.webp?updated=1550136044540&width=420','완결'),
('끊을 수 없는 나쁜 짓 [개정판]','쿠키문·플랜비·안테·스토리숲',array['로맨스']::text[],'“나랑 세 번만 만나.”
“하고 싶은 게 세 번 만나는 거야, 아니면 세 번 자고 싶은 거야?”

그의 입매가 희미한 곡선을 그렸다.

“당연히 뒤에 거.”

직설적이고 농밀한 두 남녀의, 타협 없는 고자극 로맨스.','https://www.lezhin.com/ko/comic/bad_habit_15','https://ccdn.lezhin.com/v2/comics/7011762394684455/images/tall.webp?updated=1764225273310&width=420','완결'),
('카스텔라 레시피','MASA·PNH·학산문화사',array['판타지']::text[],'메마른 대지에 마력을 가져다 주었다고 전해지는 대운석이 낙하하고, 그로부터 많은 시간이 지나 대운석 낙하를 역사의 기원으로 삼는 ‘프랄리네 교’가 운석낙하지점에 인류 최대 지식의 보고인 마법대학을 세운다! 그리고 어느 날, 병으로 대학을 떠나야 했던 천재소녀 나이프의 자리를 메우기라도 하듯 정체불명의 소년 스푼 카스텔이 마법대학에 편입해 오는데...?! ⓒ','https://www.lezhin.com/ko/comic/castela_recipe','https://ccdn.lezhin.com/v2/comics/6627896082956288/images/tall.webp?updated=1662444994378&width=420','완결'),
('블루 러스트','히나코·블러',array['로맨스']::text[],'무더운 여름날, 하야토는 한 남학생과 만난다. 과묵하고 주위와 거리를 두는 전학생, 소마. 옥상에 서 있는 그와 자신의 어두운 과거를 겹쳐보게 된 하야토는 그가 신경 쓰여 먼저 다가간다. 둘의 사이가 가까워져 소마에게 점차 웃음이 돌아오던 때,  소마가 하야토에게 키스하려던 것을 들키면서 더 이상 평범한 친구 사이가 아니게 되는데…….   [12화까지 페이','https://www.lezhin.com/ko/comic/bluelust','https://ccdn.lezhin.com/v2/comics/6190034949636096/images/tall.webp?updated=1712925013690&width=420','완결'),
('루시드 드림','마사토끼·Kirty',array['스릴러']::text[],'꿈속에서 항상 자각몽 상태를 유지할 수 있는 체질의 소년 이래음. 꿈속의 광경... 꿈속의 거리... 꿈속의 존재들에 대한 비밀들과 어린 시절부터 이어진 인연이 엮어내는 삶과 죽음의 드라마.','https://www.lezhin.com/ko/comic/lucid_dream','https://ccdn.lezhin.com/v2/comics/368/images/tall.webp?updated=1777350687450&width=420','완결'),
('식샤를 합시다 2','첨지',array['일상']::text[],'국내 1인 가구 비율이 가장 많다는 세종시. 그곳에서 삼포세대 미혼남, 결혼하고 싶은 미혼녀, 살림바보 엄친아 등 다양한 사연을 가진 1인 가구들의 시끌벅적한 삼시세끼가 차려진다! 레진코믹스 대표 음식만화 &lt;보글보글 챱챱&gt;의 첨지 작가와 tvN 인기 드라마 &lt;식샤를 합시다 2&gt;의 찰떡 같은 콜라보레이션!','https://www.lezhin.com/ko/comic/eat2','https://ccdn.lezhin.com/v2/comics/1022/images/tall.webp?updated=1550042308495&width=420','완결'),
('지수에 관하여','지호',array['로맨스']::text[],'장난기 많은 친구의 주선으로 나간 소개팅에서 자신과 이름이 같은 ''남자'' 선배를 만나게 된 공지수. 이를 계기로 친해진 선배가 자신에게 잘해줄수록 지수는 선배의 휴대폰 잠금화면 속 남자가 신경 쓰이게 되는데... 이름은 같지만 외모부터 성격까지 전혀 다른 두 지수의 달콤유쾌한 사랑이야기.','https://www.lezhin.com/ko/comic/jisoo','https://ccdn.lezhin.com/v2/comics/4976582240894976/images/tall.webp?updated=1707961372444&width=420','완결'),
('연애는 사치!','듀',array['로맨스']::text[],'성적 우수, 용모 단정, 인기 만점인 심윤은 자신의 꿈에 무탈히 도달하기 위해서는 연애는 사치라고 생각하고 있다. 그러나 누구에게나 다정하고 자신과는 달리 화목한 가족을 가진 친구의 짝남, 권민하가 신경쓰이기 시작하는데...','https://www.lezhin.com/ko/comic/love_luxury','https://ccdn.lezhin.com/v2/comics/5705413614698496/images/tall.webp?updated=1771299061754&width=420','완결'),
('단 하나의 여름','먼지·앤드비',array['로맨스']::text[],'유명한 칼럼니스트인 이하진에게는 그 누구에게도 말할 수 없는 첫사랑이 있다. 서른 조금 넘는 인생의 모든 순간을 함께 한, 하진의 가장 친한 친구이자 일반 여자와 결혼까지 한 기상준이 바로 첫사랑이자 짝사랑 상대인 것이다. 하진은 상준이만 보면 뜨거운 열병에 휩싸이지만, 절대 상준에게 자신의 마음을 털어놓을 생각도 친구 이상으로 다가설 생각이 없다. 그러던','https://www.lezhin.com/ko/comic/a_single_summer','https://ccdn.lezhin.com/v2/comics/6726754956279808/images/tall.webp?updated=1686273927773&width=420','완결'),
('순결 상실까지 일주일?!','히나타 미무·우로코·넥스큐브·미즈',array['로맨스']::text[],'“너는... 일주일 안에 처녀를 상실할거야!”
남자 친구 없음, 연애 경험 제로, 제대로 된 키스도 아직 해 본 적이 없는 모치카.
어느 날 친구를 따라 간 점집에서 바로 오늘, 하트 모양의 반점이 있는
운명의 상대를 만나 일주일 안에 첫경험을 하게 될 거라는 충격적인 이야기를 듣게 된다!
반신 반의 하는 사이 예전부터 동경의 대상이었던 선배와 마주치자 설','https://www.lezhin.com/ko/comic/lost_virgin_in_this_week','https://ccdn.lezhin.com/v2/comics/5329650653331456/images/tall.webp?updated=1612240106657&width=420','완결'),
('나는 네가 -라고 생각해','옹방',array['로맨스']::text[],'대한민국을 휩쓸었던 좀비 사태가 끝난 지 1년이 지난 시점, 좀비로 인해 동생을 잃은 ‘도영’은 어느 날 우연히 동생을 문 좀비와 매우 닮은 여학생 ''지온''을 만나게 된다.
아슬아슬하게 이어지는 두 사람의 의심 가득한 우정. 과연 이 관계는 유지될 수 있을까?','https://www.lezhin.com/ko/comic/i_think_you_are','https://ccdn.lezhin.com/v2/comics/5123961411272704/images/tall.webp?updated=1776995368430&width=420','완결'),
('눈 떠보니 네가 왜','리사·마도카·MZ FAMILY',array['로맨스']::text[],'본격 막장 재벌 로맨스! 눈떠보니 네가 왜?
재벌 기업의 첫째딸이 약혼남을 놔두고 클럽에서 원나잇을?!!

알고 보니 질투심 많은 동생의 계략임을 깨달았을 때는 이미 늦었다. 
집안은 발칵 뒤집어지고, 정략결혼 상대였던 약혼남은 친동생과
결혼을 하게 되고 재벌가의 명예를 위해선 그 원나잇 남자를 찾아 결혼을 해야만 하는데.

어쩔 수 없이 찾아간 그 남자.','https://www.lezhin.com/ko/comic/the_rich_and_the_host','https://ccdn.lezhin.com/v2/comics/6083816323153920/images/tall.webp?updated=1595576839327&width=420','완결'),
('나만 보면 살랑살랑 [연재]','백두몽·yuedong culture·판다파워애니메이션',array['로맨스']::text[],'발을 헛디뎌 넘어졌을 뿐인데
순식간에 수인 세계로 넘어오게 된 여주인공, 하은.

늑대 무리에게 쫓기던 중 표범 한 마리가 나타나 구해준다.
표범은 미소년으로 변신하더니 자신을 파커라고
소개하는데...

"내가 주웠으니, 앞으로 내 암컷이에요!"

하은은 파커와 함께 표범족 마을로 가게 되고
미남 수인들은 그녀를 차지하기 위해 경쟁을 시작하는데...','https://www.lezhin.com/ko/comic/look_salrang','https://ccdn.lezhin.com/v2/comics/6025028834230272/images/tall.webp?updated=1692169338437&width=420','연재'),
('까칠한 룸메이트','이흥필·탈곡기·투유드림',array['로맨스']::text[],'[301호] 흙수저 이기현(17세) vs 다이아수저 고승조(17세)!
 집이 쫄딱 망해서 기숙사에 들어오게 된 기현. 조신히 공부하여 집안을 일으켜 세우겠다는 기현의 야망은 기자떼를 몰고 다니는 고승조로 인해 와장창! 박살난다. 이사장 아들래미에다 톱스타 남동생인 고승조. 승조의 남다른 까칠함과 지배욕(?)으로 인해 기현은 온갖 수난&수치&능욕&곤욕을 치르','https://www.lezhin.com/ko/comic/sapo_roommate','https://ccdn.lezhin.com/v2/comics/4670065725800448/images/tall.webp?updated=1594342480552&width=420','완결'),
('은밀하게 레디 액션!','Kuaikan Comics·키다리스튜디오',array['로맨스']::text[],'아이돌이지만 배우의 꿈을 가진 민율에게 들어온 영화 캐스팅!
상대방은 남자요, 심지어 자신이 동경하던 배우 이윤재라고?!
덥석! 기회를 잡긴 했으나, 그와의 촬영은 시작부터 진땀 빼기의 연속.
그에게 빠진 건지, 극중 역할에 빠진건지... 둘만의 묘하고 짜릿한 연기가 시작된다.','https://www.lezhin.com/ko/comic/readyaction','https://ccdn.lezhin.com/v2/comics/4682784482590720/images/tall.webp?updated=1701155921964&width=420','완결'),
('바리데기 별자국','김보통·에이전시 WG',array['판타지']::text[],'도깨비들이 훔쳐간 북두칠성을 찾기 위해 바리데기는 요괴 조마구와 여행을 떠난다. 바리데기는 전국 곳곳의 문화 유적지에서 마주친 요괴와 사람들을 도우며 별들과 소중한 삶의 가치를 되찾는다.','https://www.lezhin.com/ko/comic/baridegi','https://ccdn.lezhin.com/v2/comics/4520271553298432/images/tall.webp?updated=1719975815299&width=420','완결'),
('원령도사','Team05',array['일상']::text[],'계룡산 깊은 산 속에는 신묘한 도사가 살고 있습니다.

사람들의 고민을 해결하는 도사님의 얘기를 들어보실래요?','https://www.lezhin.com/ko/comic/thehermitmononoke','https://ccdn.lezhin.com/v2/comics/5190122239950848/images/tall.webp?updated=1737602091259&width=420','완결'),
('약혼자는 동거중','임달영·이수현·디투컴퍼니',array['드라마']::text[],'아버지와 단 둘이 사는 중학생인 현상원에게는 아버지가 멋대로 정한 자신도 모르는 
약혼녀가 있었다. 같은 중학생이라 생각했던 약혼녀는 24살의 어른이었다!? 
연상의 약혼녀와의 두근두근 동거 라이프 시작!','https://www.lezhin.com/ko/comic/engagement','https://ccdn.lezhin.com/v2/comics/6471369140338688/images/tall.webp?updated=1577408940674&width=420','완결'),
('역살 [개정판][연재]','킨고·당밀·킹덤컴퍼니',array['로맨스']::text[],'명망 높은 최씨 가문의 삼대독자인 지한에게 김서온은 늘 눈엣가시였다.
양자로 들어와 더부살이를 하는 고아 주제에 집안의 장남 행세를 하고, 아비의 총애를 빼앗고, 이제는 지한의 혼처마저 앗아가려 한다.

결국 지한은 용한 무당을 찾아가 서온에게 살을 날려 달라 청하기에 이르고,\ 무당은 한 가지 묘안을 일러준다.
그자는 욕(慾)이 과한 명이니 색사를 이용하','https://www.lezhin.com/ko/comic/yeoksal_15','https://ccdn.lezhin.com/v2/comics/7011758600588694/images/tall.webp?updated=1761122295280&width=420','연재'),
('좋아한다는 말은 절대 하지 않을 거야','치바 타유리·넥스큐브·페어리',array['로맨스']::text[],'"난 더 이상 너를 좋아하지 않아!"

초등학교 졸업을 앞둔 12살이 끝나가는 겨울,
마모루는 형제나 마찬가지인 소꿉친구 카나에게 고백받았다.
"남자끼리? 기분 나쁜 소리 하지 마!!"라는 말과 함께 거절한 그날의 기억.
그리고 그대로 사이가 멀어져 버렸다.
사과하고 싶어서, 그리고 예전처럼 돌아가고 싶어서…
마모루가 카나를 쫓아 상경한 15살의 봄.
같은','https://www.lezhin.com/ko/comic/confession_for_you','https://ccdn.lezhin.com/v2/comics/6501720438079488/images/tall.webp?updated=1520408518813&width=420','완결'),
('아빠 시집가?','정이루·김수진·앤드비',array['로맨스']::text[],'여아용 인형완구 회사 버블돌의 열혈 영업맨 공우진! 우연히 만난 애 딸린 유부남에게 반했다? 우연이 겹치면서 자꾸만 인연이 생기는 공우진과 이도현. ①유부남 ②애 아빠 ③한참 연상 ④아마도 노말? 넘어야 할 첩첩산중이 눈앞에 보이는데도 우진은 자꾸만 이도현에게 끌리는 자신을 주체할 수 없는데… 불륜도 이런 불륜이 없는 이 커플의 운명은?!','https://www.lezhin.com/ko/comic/gaypapa','https://ccdn.lezhin.com/v2/comics/631/images/tall.webp?updated=1636020312106&width=420','완결'),
('달이 속삭이는 이야기','김달',array['판타지']::text[],'자그마한 속삭임으로 인간의 내면을 깊숙이 꿰뚫는 김달의 세계관이 시작된 초기작. 따뜻하고 신비스럽고 감동 있는 단편선이 여기 있습니다.','https://www.lezhin.com/ko/comic/moontalk','https://ccdn.lezhin.com/v2/comics/5608600675352576/images/tall.webp?updated=1786694601911&width=420','완결'),
('세 가지 소원','시엔·서호',array['로맨스']::text[],'[매월 8, 18, 28일 연재]  로윈왕국 해군 서기관 ''아인''은 다친 용을 치료해주고 ''세 가지 소원''을 이룰 기회를 얻는다. 며칠 후 후임의 집에 찾아갔다가 연쇄살인범의 습격을 받은 아인은 죽어가면서 "첫사랑이었던 ''레이 쾨닝턴''을 다시 보게 해 달라"고 빈다. 그리고 다시 눈을 뜬 아인이 본 것은….','https://www.lezhin.com/ko/comic/les_trois_souhaits','https://ccdn.lezhin.com/v2/comics/6256154527924224/images/tall.webp?updated=1683521849900&width=420','완결'),
('캐스트 온 스테이지','돌돔·양갱',array['로맨스']::text[],'"다음 남친한테는 절대 주사 부리지 마라." 스물아홉 살 풋내기 배우 여름은 중요한 오디션 날 연하 남자친구로부터 이별을 통보받는다. 그것도 전화로! 하지만 이건 앞으로 다가올 시련들의 예고편에 불과했는데... 절반의 불안함과 절반의 희망을 안은 스물아홉 살 그들의 Cast On Stage! 지금 시작합니다.','https://www.lezhin.com/ko/comic/cast_on_stage','https://ccdn.lezhin.com/v2/comics/6505645686259712/images/tall.webp?updated=1719970795680&width=420','완결'),
('도깨비도 수풀이 있어야 모인다[개정판]','신',array['로맨스']::text[],'해당 작품은 &lt;도깨비도 수풀이 있어야 모인다&gt; 성인 버전의 일부 장면을 수정한 개정판입니다. 
매일 밤 귀신이 오는 것도 모자라 죽을 운명에 처하게 된 ''주은재''. 교통사고 직전의 그를 실수로 구한 도깨비 ''산''은 저승 명부를 어지럽힌 대가로 은재의 목숨을 책임지게 되는데... 떨어질 수 없는 두 사람 사이에서 싹트는 감정은?','https://www.lezhin.com/ko/comic/bush_15','https://ccdn.lezhin.com/v2/comics/5612748599263232/images/tall.webp?updated=1769160038601&width=420','연재'),
('도라의 저택','녹음·키다리스튜디오',array['로맨스']::text[],'고아소녀 도라는 친척집을 전전하며 지내다 마침내 사려깊은 그레이스 부인를 만나게 된다. 하지만 그녀의 친아들 잭이 돌아오면서 시작되는 도라의 애정결핍, 그리고 애증의 트라이앵글!','https://www.lezhin.com/ko/comic/doras_mansion','https://ccdn.lezhin.com/v2/comics/6389363402932224/images/tall.webp?updated=1705904603410&width=420','완결'),
('검은 깃털의 흉터 [제1회 레진만화왕전 수상작]','우하·4U',array['로맨스']::text[],'천사들이 사는 곳 천계. 과거 루시펠의 배반으로 검은색은 배반의 상징이 되어버린다. 검은 머리를 가지고 태어난 첼은  그 이유로 자라면서 갖은 괴롭힘을 당하며 원치 않게 마계로 떨어지고 만다. 거기서 첼을 돌봐주는 이는 다름 아닌 루시펠...?','https://www.lezhin.com/ko/comic/hurtofblackfeather','https://ccdn.lezhin.com/v2/comics/5710179148759040/images/tall.webp?updated=1560142301552&width=420','연재'),
('사수생도 연애를 한다','스카프·씨엔씨레볼루션㈜',array['로맨스']::text[],'"대학은 가고 싶지만 연애도 하고 싶어!"

재수, 삼수 때까지 합격의 문턱 앞에서 꼬꾸라졌다. 지긋지긋한 입시를 1년을 더해야 한다니! 오마이갓!! 하지만 괜찮다.
내가 다니는 학원엔 여신이 있으니까. 6개월째 몰래 좋아하고 있는 그녀….  그런데 여신이 다가오기는커녕 시커먼… 아니, 샤방한 꽃돌이가 
들이댄다. 으아아~ 나 어떡해!
사수생''도'' 연애하는','https://www.lezhin.com/ko/comic/the_4th_challenge','https://ccdn.lezhin.com/v2/comics/5699403541905408/images/tall.webp?updated=1560504389340&width=420','완결'),
('술 한잔 인생 한입','라즈웰 호소키',array['일상']::text[],'평범한 영업맨 이와마 소다츠,그는 일 끝나고 마시는 가벼운 술 한잔, 기분 좋은 안주, 술자리의 정겨운 분위기 그리고 술맛을 돋아주는 사계절 풍취 등을 좋아하는, 일상의 작은 행복을 소중히 여기는 소박한 애주가이다.
소소하고, 담백하고, 따뜻하고 때론 가슴 뭉클하게~ 하루하루 지쳐가는 우리네들의 마음을 녹여줄 소다츠의 즐거운 술 사랑 이야기들이 펼쳐진다!!','https://www.lezhin.com/ko/comic/oneshot','https://ccdn.lezhin.com/v2/comics/182/images/tall.webp?updated=1621255078920&width=420','연재'),
('사장님의 고뇌','무나무·대원씨아이',array['로맨스']::text[],'[사장님의 고뇌 외전(19화) 깜짝 공개!!]

게이인 사실을 철저히 숨기고 회사생활을 해오던 이 대리는 퀴어 축제에 참가했다가 우연히 사장님과 마주쳐 자신이 게이라는 것을 들키게 된다.

짤릴 줄 알았던 자신의 예상과 달리 쿨 하게 남자와의 소개팅을 주선하는 사장님.

소개팅은 무산 되지만 자신의 게이 아들 도원우와 이 대리를 이어주려는 사장님의 계략으로','https://www.lezhin.com/ko/comic/boss_in_trouble','https://ccdn.lezhin.com/v2/comics/4826285331316736/images/tall.webp?updated=1557735528181&width=420','완결'),
('일곱 개의 대죄','스즈키 나카바',array['판타지']::text[],'일찍이 왕국에 반역을 꾀했다고 여겨지는 7명의 전설의 역적 [일곱 개의 대죄].
그들은 지금도 집요하게 왕국의 핵심인 성기사들에게 쫓기고 있다.
한편 성기사들의 반란을 눈치채고 왕국을 구하기 위해 [일곱 개의 대죄]를 찾아나선 엘리자베스 공주. 공주의 진실된 마음에 [일곱 개의 대죄] 단장인 분노의 죄 멜리오다스는 함께 [일곱 개의 대죄]를 찾는 여행을 떠','https://www.lezhin.com/ko/comic/7deadlysins','https://ccdn.lezhin.com/v2/comics/5263708116221952/images/tall.webp?updated=1764313366110&width=420','완결'),
('베이비가 생겼어요','WenRenNiaoShiDuo·재담미디어',array['로맨스']::text[],'무명 배우 윤일우는 최첨단 기술을 통해 입양한 아이, 윤이겸과 단 둘이서 살아왔다.
그리고 몇 년 뒤, 아기의 생물학적 아버지라 말하는 남자 하도진이 나타나
일우의 삶을 뒤집어 놓는다. 
자신의 아들을 지키고자 하는 일우와 진짜 아들을 되찾고자 하는 도진이,
그리고 하 씨 가문의 특별한 능력으로 인하여 예언을 할 수 있게 된 겸이의 이야기.','https://www.lezhin.com/ko/comic/i_got_baby','https://ccdn.lezhin.com/v2/comics/6680670859755520/images/tall.webp?updated=1765246050170&width=420','완결'),
('언젠가 교복을 벗고','아메야 유에·우로코·넥스큐브·미즈',array['로맨스']::text[],'부모님을 사고로 여의고, 과거 엄마가 신세 졌던 하숙집으로 이사 온 레이.
그곳에서 기다리고 있던 것은 수많은 캔버스와 물감, 그리고 낯선 알몸의 남자 나루카미였다.
하숙집 주인의 대리인이자 학교의 미술 교사인 남자와 둘이서 생활을 하게 되다니…….
걱정이 앞서지만, 레이는 차가우면서도 내심 걱정해주는 듯한 그가 신경 쓰이는데…….','https://www.lezhin.com/ko/comic/takeoff_schooluniform','https://ccdn.lezhin.com/v2/comics/4702091607539712/images/tall.webp?updated=1612240259414&width=420','완결'),
('우리 사이 30cm','YUJU·재담미디어',array['로맨스']::text[],'소꿉 친구에서 연인까지의 거리는 얼마나 남았을까.
세 남녀의 로맨스.','https://www.lezhin.com/ko/comic/between_30cm','https://ccdn.lezhin.com/v2/comics/5912387426516992/images/tall.webp?updated=1630391955180&width=420','완결'),
('NATURALS','인디고',array['액션']::text[],'초능력 소년 소녀들의 모임 ''내츄럴스'' 그 시작과 풋풋한 청춘에 대한 이야기.','https://www.lezhin.com/ko/comic/naturals','https://ccdn.lezhin.com/v2/comics/67/images/tall.webp?updated=1528191791638&width=420','완결'),
('찬! 평범한 그녀석','마파밥·재담미디어',array['액션']::text[],'평범 빼면 시체! 열아홉 남고생 이찬에겐 말못할 비밀이 하나 있다. 성룡마니아인 아빠때문에 익힌 취권의 달인이라는 비밀! 비밀을 파헤치려는 자! 비밀을 지키려는 찬!','https://www.lezhin.com/ko/comic/chan','https://ccdn.lezhin.com/v2/comics/5654984961687552/images/tall.webp?updated=1554343203890&width=420','완결'),
('애신록','으자·북극여우',array['로맨스']::text[],'"그럼, 공자. 시험 잘 보십시오."

과거 시험을 보기 전 우연히 만난 미남자가 전하일 줄은 꿈에도 몰랐다,
전하에게 제대로 콕 찍혀버린 서안의 파란만장한 궁중 일상!

궁궐엔 전하만 있나, 세자 저하와 대군 마마,
그 호위는 물론이요 사령관 나리에 이웃 나라 왕자님까지.
다양한 조합의 유쾌한 이야기, &lt;애신록&gt;에서 지금 확인하세요!♥','https://www.lezhin.com/ko/comic/aesillok','https://ccdn.lezhin.com/v2/comics/6482377777020928/images/tall.webp?updated=1719280318200&width=420','완결'),
('운명의 접촉 [웹툰]','JI.JING.JUN·SHOU·학산문화사',array['로맨스']::text[],'자는 게 취미인 고등학교 신입생 오준영은, 갑작스런 선도부의 생활 지도에 걸려 벌점을 받게 된다.
준영에게 벌점을 준 건 깐깐하기로 소문난 선도부장 이휘윤.
학생회장이자 선도부장을 겸하고 있는 휘윤은, 뛰어난 성적과 잘생긴 외모로 이름 높은 학교의 유명인이다. 
첫 만남 이후로도 계속 삐걱대는 두 사람.
준영이 학생회에 들어가게 되면서 둘 사이는 더 악화되','https://www.lezhin.com/ko/comic/contact_of_fate','https://ccdn.lezhin.com/v2/comics/5762958585298944/images/tall.webp?updated=1764230982112&width=420','완결'),
('사랑이라 하기엔 기분 나빠','모구스·레진코믹스',array['로맨스']::text[],'묘한 사건으로 여동생의 친구인 여고생 아리마 이치카와 만난,
바람둥이에 고스펙인 아마쿠사 료는 그녀에게 광적으로 (짝)사랑을 하게된다.
한편, 그의 전력투구로 퍼붓는 대시를 일관되게 기분 나빠하는 이치카는
료에게 비난을 날리지만, 료는 꿈쩍도 하지 않는데….','https://www.lezhin.com/ko/comic/hard_to_say_love','https://ccdn.lezhin.com/v2/comics/4511761836933120/images/tall.webp?updated=1683878320975&width=420','완결'),
('네가 없었으면 좋겠어','까르보나라·키다리스튜디오',array['로맨스']::text[],'남자친구의 바람 현장을 목격하고 충격에 빠진 ''한국화'', 
그런 국화에게 당당하게 먼저 연락을 해 온 그 여자 ''장 미''. 
"차라리 걔 말고 나랑 사귀어!" 
최악의 상황에서 꿈에 그린 이상형을 만난다면...?!','https://www.lezhin.com/ko/comic/chrysanthemum_rose','https://ccdn.lezhin.com/v2/comics/4671694945189888/images/tall.webp?updated=1654859399572&width=420','완결'),
('인사의 눈','도국',array['드라마']::text[],'"내 몸에 닿으면 다 죽어. 이런 나를 좋아할 수 있어?"
한여름에도 꽁꽁 싸매고 다니는 ''금조''. 누가 봐도 수상한 자신을 좋아한다고 나타난 ''남우''가 걸리적거리기만 하는데…  ㅡ &lt;나나의 영상&gt;,&lt;피자와 꽃&gt; 도국 작가의 신작!','https://www.lezhin.com/ko/comic/insaeyes','https://ccdn.lezhin.com/v2/comics/4749772755894272/images/tall.webp?updated=1768539399920&width=420','완결'),
('나의 여름에게','해민',array['로맨스']::text[],'가정학대 아동으로 자란 인하는 대학에 들어가자마자 집을 나온다. 혼자 힘으로 살아남기 위해 안간힘으로 발버둥치지만 세상은 그런 인하를 비웃듯이 고통만을 안겨준다. 끊어질래야 끊어질 것 같지 않는 이 구질구질한 굴레 속에서 가장 먼저 놓고자 했던 것은, 왜 하필 너였을까.','https://www.lezhin.com/ko/comic/dear_you','https://ccdn.lezhin.com/v2/comics/4885685845950464/images/tall.webp?updated=1776995028174&width=420','완결'),
('디파인 더 릴레이션십 [개정판]','차다·플로나·키다리스튜디오',array['로맨스']::text[],'[해당 작품은 &lt;디파인 더 릴레이션십&gt; 성인 버전의 일부 장면을 수정한 개정판입니다.]

 귀족 가문의 알파로 태어났지만 우성은 아닌 ''칼라일''은 의무적으로 정해진 오메가들과의 관계를 맺어야 하는 것에 극치감 장애를 느껴 상담을 받게 된다.
상담사는 칼라일에게 극치감 장애를 극복하기 위해 같은 알파와의 만남을 권장한다. 그렇게 내키지 않은 만남에','https://www.lezhin.com/ko/comic/define_the_relationship_15','https://ccdn.lezhin.com/v2/comics/4611405008666624/images/tall.webp?updated=1770279972442&width=420','완결'),
('어른을 위한 BIG 4 만화 공모전','편집부',array['일상']::text[],'[어른을 위한 BIG 4 만화 공모전] 스페셜 프로젝트. 릴레이 응원 웹툰 특별 공개! [어느 날 잠에서 깨어보니 베이글녀가 되어 있었다],[캠퍼스 밀크푸딩], [현자타임] 의 작가 "탱크가이"님의 BL 도전? [오타쿠를 짝사랑하는 법] 차우민 작가의 수상한 남성만화, [모멘텀] 박지연 작가의 BL 아닌 백합 외전!','https://www.lezhin.com/ko/comic/big4award','https://ccdn.lezhin.com/v2/comics/6444280871124992/images/tall.webp?updated=1520223542130&width=420','완결'),
('페로몬 샤워','Wking comic·당고흔감·슈농왕·스토리숲',array['로맨스']::text[],'네가 오메가가 된다면, 우리 사이는 더욱 완벽해질거야.

알파 이수호, 
사랑하는 사람에게 강제로 오메가로 변하는 주사를 맞게 된다. 
아무런 변화가 없어 실패한 줄 알았는데… 
설마 이거 지금 히트사이클이야?','https://www.lezhin.com/ko/comic/pheromoneshower','https://ccdn.lezhin.com/v2/comics/5833497235881984/images/tall.webp?updated=1755124267813&width=420','완결'),
('먹짱!','츠치야마 시게루',array['드라마']::text[],'(음식, 드라마) 먹고 먹고 또 먹자!
음식만화의 거장 츠치야마 시게루의 궁극의 식감 극화!
프로 푸드파이터들의 자존심을 건 한 판 대결!
페이지를 넘길때 마다 당신의 식욕을 자극한다!
본격적인 식욕 증진 만화! 자~뜨거울때 어서!!','https://www.lezhin.com/ko/comic/mukzzang','https://ccdn.lezhin.com/v2/comics/1032/images/tall.webp?updated=1516330801627&width=420','완결'),
('테디베어','killer',array['드라마']::text[],'양아치 간호사 ''백승기''와 어린이 환자 ''박소현''의 우당탕탕 시끄럽지만, 따뜻한 병원 생활 이야기 

안녕하십니까! 이곳은 곰돌이 상담소 테디베어! 부끄러워 말하지 못했던 솔직한 마음들을 대신 전해드립니다!','https://www.lezhin.com/ko/comic/teddybear_for_you','https://ccdn.lezhin.com/v2/comics/6419563368218624/images/tall.webp?updated=1780274685141&width=420','완결'),
('밀회 [웹툰]','Kx000·학산문화사',array['드라마']::text[],'당신의 불륜을 도와드립니다! 불륜에 필요한 알리바이 완벽 제공! 
&lt;밀회 클럽&gt;에 가입하시겠습니까?

잘나가는 커리어우먼이었으나, 결혼과 함께 전업주부가 된 주아. 
그러나 결혼의 달콤함도 잠시, 
알뜰한 살림꾼이 되어가는 주아에 대한 남편의 사랑은 빠르게 식기 시작한다. 
자존감을 잃고 우울해 하던 그때, 임신 소식을 듣게 되는 주아. 
하지만','https://www.lezhin.com/ko/comic/secret_meeting','https://ccdn.lezhin.com/v2/comics/6043118597373952/images/tall.webp?updated=1764301207248&width=420','완결'),
('욕망 첫사랑','츠키시마 아야',array['로맨스']::text[],'떳떳하지 못한 만큼 자극적─
사랑은 욕망으로 점철되어 있다. 점점 갖고 싶어지는 것이 사랑이다.

사랑해서는 안 되는 사람인데, 자꾸만 생각난다…….
나를 괴롭히는 같은 반 그놈, 친구의 남자친구, 선생님, 역무원 아저씨…….
평범한 여고생들이 사랑한 남자와의,
평범하지 못한 러브 스토리─','https://www.lezhin.com/ko/comic/desirefirstlove','https://ccdn.lezhin.com/v2/comics/4681452279562240/images/tall.webp?updated=1438233873277&width=420','완결'),
('전이현상','이지원·이윤균',array['스릴러']::text[],'계속 다른 사람의 삶을 살아가는 남자. 그가 다른 사람으로 깨어나면 깨어날수록 그 사람들의 삶은 혼란스러워지기 시작한다. 이제 그는 다른 사람들의 삶이 더 혼란스러워지기 전에 빨리 원래의 자신으로 돌아가야 한다.','https://www.lezhin.com/ko/comic/transference','https://ccdn.lezhin.com/v2/comics/6371695017852928/images/tall.webp?updated=1574661186392&width=420','완결'),
('덕후의 여자','허윤화·다가비',array['드라마']::text[],'"내 이름은 고난희. 삼십 년 인생 처음으로 몸서리치게 더러운 오덕을 만났다.    
그런데 문제는 바로 그 오덕의 천만원 짜리 피규어가 없어졌다는 것!    
""이보시오, 개발이사 양반! 대체 뭔놈의 인형이 천만원 씩이나 한단 말이오오오!""    
…그리고 정신을 차려보니 나는 그 오덕의 집을 청소하고 있었다.    
    
여자라곤 게임 캐릭터밖에','https://www.lezhin.com/ko/comic/otaku','https://ccdn.lezhin.com/v2/comics/4932650884661248/images/tall.webp?updated=1548989371286&width=420','완결'),
('강의실 201호','단추',array['로맨스']::text[],'첫눈에 반해버린 내 이상형. 평탄할 것만 같던 내 로맨스에 자꾸 걸리적거리고 신경쓰이는 녀석이 나타났다. 강의실 201호의 전설은 정말 통하는걸까?','https://www.lezhin.com/ko/comic/lectureroom201','https://ccdn.lezhin.com/v2/comics/219/images/tall.webp?updated=1529549457910&width=420','완결'),
('쿠로사키 말 따위 안 들을 거야','마키노·학산문화사',array['로맨스']::text[],'고등학생이 되어 열심히 이미지 변신 중인 유우는 동경하는 [화이트 프린스], 시라카와가 있는 학교 기숙사에서 살게 된다♪ 하지만 그곳에는 [블랙 데빌]이라 불리는 공포의 대상, 쿠로사키도 있었다! 쿠로사키에게 대항한 유우는 그 [벌]로 갑작스럽게…?!! 
악마급 사디스트남과 24시간 두근두근 가슴 설레게 되는 러브!!','https://www.lezhin.com/ko/comic/black_and_white_prince','https://ccdn.lezhin.com/v2/comics/5922279598981120/images/tall.webp?updated=1764236154516&width=420','완결'),
('여동생은 로봇','안전모',array['코미디']::text[],'어느날 정체불명의 택배가 도착, 그것은 여동생이었다?? 어딘가 맹하고 식탐이 어마무시한 수상한 미소녀와의 동거가 시작된다! 과연 그녀의 정체는 무엇이며 목적은 무엇이냐?!','https://www.lezhin.com/ko/comic/sister_robot','https://ccdn.lezhin.com/v2/comics/197/images/tall.webp?updated=1520223408585&width=420','완결'),
('안아줄게 (Burn It)','HYEYA·west dog alcohol',array['드라마']::text[],'“네가 좀비가 돼도, 내가 너를 안아줄게”
와이와 보민은 좀비에게 쫓기면서도 서윤을 구하기 위해 백방으로 노력한다. 하지만 그 끝에서 서윤은 안타까운 모습으로 변하는데..
골든차일드 신곡 뮤비 기념 웹툰화 프로젝트!','https://www.lezhin.com/ko/comic/burnit','https://ccdn.lezhin.com/v2/comics/5783553740963840/images/tall.webp?updated=1646902739946&width=420','완결'),
('마스크 남자는 사랑하고 싶지 않은데','산고 미츠루·㈜에이블웍스 씨앤씨·시트러스 코믹스',array['로맨스']::text[],'입은 제2의 성기라고….
항상 마스크로 얼굴을 가리고 있는 아웃사이더인 사야마는 같은 반의 인싸 사이카와가 강제로 마스크를 벗기자 폭발한다. 그날 이후 왜인지 사이카와의 눈에 들어 공부를 배우는 대신, ‘마스크 안쪽을 맘대로 할 수 있게’하는데?!','https://www.lezhin.com/ko/comic/mask_denshi','https://ccdn.lezhin.com/v2/comics/4711838962221056/images/tall.webp?updated=1670217469867&width=420','연재'),
('키스중독증','김윤이',array['로맨스']::text[],'여고생 수영에게는 고민이 있는데, 사귀는 남학생들에게 계속 차인다는 것. 그러던 어느날 아침 잠에서 깬 수영은 집에 들어온 낯선 남자를 보고 놀라는데 그는 다름 아닌 정혼자(?) 안소민! 졸지에 기묘한 동거를 하게 된 두사람은?!','https://www.lezhin.com/ko/comic/kissholic','https://ccdn.lezhin.com/v2/comics/6435060158300160/images/tall.webp?updated=1472200666807&width=420','완결'),
('월간 백합','레드피치스튜디오·레드피치',array['로맨스']::text[],'[본 작품은 여러 에피소드로 구성되어 있는 단편집입니다.]
꽃이 아니라, 불꽃 같은 우리들의 이야기

매월 10일,
여러분이 애타게 찾던 사랑이 찾아갑니다.','https://www.lezhin.com/ko/comic/monthly_gl','https://ccdn.lezhin.com/v2/comics/5197379572924416/images/tall.webp?updated=1779060955891&width=420','완결'),
('비뚤어진 체이서','판코',array['로맨스']::text[],'궁극의 츤데레 강림!
나만의 히어로인데
왜 그딴 녀석이 옆에 붙어 있는 거야?!

히로카와 호즈미는 예전에 자신을 구해준 적이 있는 
오다지마 야마토를 쫓아 전학까지 감행한다. 
그런데 홀딱 반한 오다지마 옆에는 
항상 소꿉친구라는 미사키가 딱 붙어 있었으니!
짜증이 난 호즈미는 미사키에게 시비를 걸기 일쑤, 
그 뒤 야마토에게 혼이 나는 나날을 보내게 된','https://www.lezhin.com/ko/comic/oddchaser','https://ccdn.lezhin.com/v2/comics/5257044582465536/images/tall.webp?updated=1548912785735&width=420','연재'),
('죽여주는 복수선언','약국·키다리스튜디오',array['로맨스']::text[],'흥신소를 운영하는 한기태 앞에 홀연히 나타난 남자, 이정율 
그는  다짜고짜 한기태를 협박하며 자신의 계획에 협력할 것을 요구하는데…!
둘 사이에 얽힌 거대한 음모와 사건은 무엇일까? 둘의 운명은 어떻게 될 것인가!
약국 작가의 신작, "죽여주는 복수선언"','https://www.lezhin.com/ko/comic/declare_revenge','https://ccdn.lezhin.com/v2/comics/4853285570084864/images/tall.webp?updated=1720593984850&width=420','완결'),
('폭군의 아이를 가졌습니다','SF_JD·류란·키다리스튜디오',array['로맨스']::text[],'1년에 한 번 열리는 가장 축제의 밤.
일란은 눈을 뜨자 잔혹하기로 소문난 황제, ‘카일라트’가 곁에서 자고 있는 걸 발견하고 급하게 도망친다.
하지만… 
  
“임신입니다.”
  
하룻밤의 실수로 폭군의 아이를 가져 버렸다.
  
황제는 자신에게 다가오는 여인들을 혐오한다는 이야기를 들은 일란은 이 사실을 숨기기로 결심한다. 그녀의 결심이 무색하게 자꾸만','https://www.lezhin.com/ko/comic/tyrantbaby','https://ccdn.lezhin.com/v2/comics/5727419869495296/images/tall.webp?updated=1681463827780&width=420','완결'),
('미명의 추적자','매사·EMO·칵스·콘텐츠랩블루·키다리스튜디오',array['로맨스']::text[],'실수로 세 남자와 하룻밤을 보냈다. 한 놈은 오랜만에 만난 소꿉친구,
한 놈은 오래 전부터 사이 안 좋은 놈, 한 놈은 평소 데면한 동료 연구원!

심지어 그날 일로 중요한 의뢰까지 실패한 크리세루아는
그들의 기억을 지우고 의뢰 수습에 집중하고자 했는데,
임신 사실까지 들키고 말았다.
이 말도 안 되는 일을 어떻게 해야 하지?','https://www.lezhin.com/ko/comic/tracker_of_dawn','https://ccdn.lezhin.com/v2/comics/6738868293664768/images/tall.webp?updated=1694647355610&width=420','완결'),
('세워요 기사님!','올소·재담미디어',array['로맨스']::text[],'천계의 공주님이 마왕의 손에 납치당했다!

유일한 희망은 성기사 뿐이라는데, 성이 성씨인 택시기사가 걸려들었다?!

천계의 또라이 천사 가브리엘에게 코 꿰어 지하세계로 떨어져버린 성기사님,

마왕에게서 공주를 구해내야 인간계로 돌아갈 수 있다는데… 

또라이 천사 가브리엘과 성스러운 기사 성대한의 우당탕탕 지하세계 모험기!','https://www.lezhin.com/ko/comic/stop_driver','https://ccdn.lezhin.com/v2/comics/6502347187748864/images/tall.webp?updated=1649384225430&width=420','완결'),
('버츄얼 패밀리','안나래',array['코미디']::text[],'바람 잘 날이 없는 사랑과 정의의 도시 고남시. 이 고남시에서 살아가는 불안불안한 가족을 소개해 드립니다. 유치원 교사 섹시 중년 아빠. 불운의 십자성 아래에서 태어난 엄마, 우울함의 끝을 달리는 삼촌, 태권도복의 등짝이 넓어 보이는 초딩 훈희. 평범하지만 평범하지 않은 가족 시트콤!','https://www.lezhin.com/ko/comic/virtualfamily','https://ccdn.lezhin.com/v2/comics/17/images/tall.webp?updated=1737357277207&width=420','완결'),
('건반 위의 파쇨','진미',array['로맨스']::text[],'오른팔을 잃어버린 비운의 천재 피아니스트 포우는 떠오르는 천재 무용수 시릴에게 독무곡을 써주기로 한다. 이제 막 피어오르는 꽃과 이미 져버린 꽃의 운명과 만남.. 동경과 질투로 흠뻑 젖어버린 독무곡은 완전해질 수 있을까?','https://www.lezhin.com/ko/comic/pas_seul_on_clavier','https://ccdn.lezhin.com/v2/comics/6005401057361920/images/tall.webp?updated=1753253214330&width=420','완결'),
('투 마이 위시','론빵',array['로맨스']::text[],'전교 1등, 교우 관계 원만, 교사들의 신임을 받는 권현서.
그에게는 폭력을 일삼는 아버지와 속 썩이는 남동생이 있다.
집을 벗어나겠다는 생각 하나로 버티던 어느 날, 동생이 학교 폭력을 당했다는 소식을 듣는다.
가해자는 동생의 같은 반 친구 이시현. 가해자면서 반성의 기미 없이 돈으로 해결하려는 태도에 분노하지만 결국 힘없이 넘어가게 된다.
이후 우연히 ','https://www.lezhin.com/ko/comic/to_my_wish','https://ccdn.lezhin.com/v2/comics/6477028835262464/images/tall.webp?updated=1752112322270&width=420','완결'),
('보름달 식당','김보통',array['드라마']::text[],'오늘도 지친 당신에게 필요한 건?
맛있는 밥 한 그릇을 들고 오늘도 보름달식당이 찾아갑니다.','https://www.lezhin.com/ko/comic/kimbotong_fullmoon','https://ccdn.lezhin.com/v2/comics/5873525665628160/images/tall.webp?updated=1719975722845&width=420','완결'),
('펀칭머신','늴릴',array['액션']::text[],'장인이 만든 세 대의 펀칭머신 테네, 루미나, 게헨나. 이 기계들은 펀칭한 대상에게 신비로운 힘을 불어넣어 주는 문명을 초월한 이기였다. 하지만 그 중 테네가 도난당하자 의구심을 품은 장인의 손녀딸 김선선은 직접 그것을 찾아 나서기로 결심하는데…','https://www.lezhin.com/ko/comic/boxing_machine','https://ccdn.lezhin.com/v2/comics/4664659247431680/images/tall.webp?updated=1663741868379&width=420','연재'),
('한 번 더! 비뚤어진 체이서','판코',array['로맨스']::text[],'계속 동경해왔던 그 사람이 드디어
나만의 히어로가 되어준 줄 알았더니!

드디어 서로의 마음을 확인하고 
사귀기로 한 야마토와 호즈미.
여름방학 동안, 호즈미는 야마토네 집에 신세를 지기로 한다. 
하지만 아무것도 모르는 순진한 호즈미 때문에 
두 사람의 관계에 진전이랄 게 생길 수 없는 상황!
게다가 호즈미의 아버지에게 관계를 들켜 호즈미는 집으로 끌려가','https://www.lezhin.com/ko/comic/crookedchaser','https://ccdn.lezhin.com/v2/comics/5925967448506368/images/tall.webp?updated=1620734990739&width=420','연재'),
('마법 수프','Tropicalarmpit·김공작·앤드비',array['로맨스']::text[],'“우리 성의 노예… 아니, 요리사가 되어주게!”
 ‘조아라’ 인기 웹소설 [마법수프]의 환상적인 세계를 완벽 재현!! 
 
 기사 지망생 로미어드는 어머니의 유언에 따라 아름답고 잔인하기로 소문난 얼음 마법사가 사는 얼음 성으로 떠나게 된다. 눈처럼 흰 털을 가진 곰에 이끌려(납치?!) 라르마닐라의 얼음 성에 도착하긴 했지만…. 잔인한 마법사는 다짜고짜 수','https://www.lezhin.com/ko/comic/magic_soup','https://ccdn.lezhin.com/v2/comics/4937382495911936/images/tall.webp?updated=1636020253717&width=420','완결'),
('Core Scramble (코어스크램블)','전유호·이코믹스·BL비엘',array['로맨스']::text[],'이차원 통로인 ''홀''을 통해 유입되는 몬스터 ''버그''.
이를 말살하는 단체 ''C.O''에 소속된 채언은 과중한 업무로 매일 파김치 상태다. 
능력은 출중하지만 성격이 가혹한 채언의 상사 가윤은 
채언에게 있어 제 1의 스트레스 유발자이자 가장 동경하는 대상. 

한편 C.O와 대립하는 ''검은 올빼미'' 소속인 문후는
전투중인 채언의 모습에 흥미를 느끼고 그에게','https://www.lezhin.com/ko/comic/corescramble','https://ccdn.lezhin.com/v2/comics/5281905957666816/images/tall.webp?updated=1526439608210&width=420','완결'),
('숨을 죽이고, 사랑을','카무',array['로맨스']::text[],'이 마음은, 비밀로 해야만 해….

카즈시와 케이시는 피가 이어지지 않은 형제. 
어렸을 때부터 사이가 좋았지만
형 카즈시가 중학교 수험에 실패하면서부터
두 사람의 관계는 변하고 말았다. 
경멸하듯이 시선을 던진 케이시에게 충격을 받아
그 때부터 카즈시는 케이시를 피하게 된 것이다.
그 이후로 서로 마주치기만 하면 시비를 거는 케이시. 
하지만 어느 날 카','https://www.lezhin.com/ko/comic/soundlesslove','https://ccdn.lezhin.com/v2/comics/5709667711320064/images/tall.webp?updated=1583837134154&width=420','완결'),
('1미터 사이','이은정·김병관',array['로맨스']::text[],'어느 날 공부밖에 모르는 전교 1등 모범생 단우가 말한다. “호수와 짝을 하고 싶습니다.” 강렬한 그 말. 외모, 성적 모든 게 완벽한 남자애가 자신에게 다가온다. 모든 상황이 영 어색한 호수. 인생승리라며 친구들은 축하해주는데, 아무리 생각해도 이 남자애가 수상하다. “넌 부족한 것도 아닌데, 왜 내 옆에 있으려고 해? 날 좋아하는 것도 아니잖아?” 의문','https://www.lezhin.com/ko/comic/1m','https://ccdn.lezhin.com/v2/comics/5950656923107328/images/tall.webp?updated=1708924956216&width=420','완결'),
('기도(祈り)  [제1회 세계만화공모전 수상작]','은송',array['드라마']::text[],'눈을 의심케하는 그림과 가슴을 누르는 이야기. 심사위원 전부가 이 작품에서 눈을 떼지 못했다. 제1회 세계만화공모전 대상 수상작품. 레진코믹스의 첫 번째 선택. &lt;기도&gt;. 이번 공모전에는 일본어 원고로 지원하였으나 한국의 독자들을 위해 한국어로 번역한 버전을 함께 공개합니다.','https://www.lezhin.com/ko/comic/1st_manhwaking_wish','https://ccdn.lezhin.com/v2/comics/1005/images/tall.webp?updated=1520223455801&width=420','완결'),
('아기 사슴 카운터','유쿠라 아키·넥스큐브·볼레로',array['로맨스']::text[],'몸도 마음도 다 바쳐 정상을 향해 가는 것,
그것이 그 남자의 처세술!?

질 나쁘기로 유명한 고등학교에 전학 온 바보 같은 소년, 세토구치 호토리.
호토리는 불량배로 가득한 학교에서 살아남기 위해
남색가로 소문난 일진, 쿠제를 이용하려는 계획을 세우는데…?
울트라 얼간이의 학원 BL 하극상이 지금 시작된다!','https://www.lezhin.com/ko/comic/baby_deer_counter','https://ccdn.lezhin.com/v2/comics/5473823270240256/images/tall.webp?updated=1552878005852&width=420','완결'),
('어린 늑대에겐 ''기다려''가 통하지 않는다','칸나 마치·우로코',array['로맨스']::text[],'소꿉친구와의 10년 만의 재회……, 그리고 알몸 허그?!
미국에서 돌아온 한 살 어린 소꿉친구와의 두근두근 동거생활!!

아르바이트를 마치고 집으로 돌아온 마리는 곧장 욕실로 향한다.
그리고 10년 전 해외로 갔었던 소꿉친구 요시키가 알몸으로 씻는 광경을 마주하는데…….
몰라보게 멋있어진 요시키는 귀국자녀 포스로 학교 인기남에 등극한다!!

그리고 해외파다','https://www.lezhin.com/ko/comic/youngwolf','https://ccdn.lezhin.com/v2/comics/5082844975595520/images/tall.webp?updated=1487260862450&width=420','연재'),
('선생님, xx라는 게 진짜예요?','와타세 하나·넥스큐브·미즈',array['로맨스']::text[],'방과 후, 두 사람만 남은 교실….
수업에선 볼 수 없던 표정의 선생님이 나에게 다가온다…!!

교실에서 AV 하나를 발견한 미코.
하필 그 장면을 동경하는 미스미 선생님에게 들켜 AV의 주인이라고 오해를 받는다.
그날 밤, AV를 본 적이 없는 미코는 언니의 영상을 몰래 빌려 재생을 하는데….
그러자 그곳에 출연한 남자 배우는… 설마 미스미 선생님?!
선','https://www.lezhin.com/ko/comic/xx_teacher','https://ccdn.lezhin.com/v2/comics/6066872002936832/images/tall.webp?updated=1614143327298&width=420','완결'),
('이 회사에 좋아하는 사람이 있습니다','에노모토 아카마루·대원씨아이',array['로맨스']::text[],'"절대 들키면 안 돼!"
비밀스럽고 귀여운 두근두근 사내 연애 로맨스!

제과 기업 경리부에서 일하는
타테이시에겐 아무에게도
말할 수 없는 비밀이 있다.
그것은 불과 어제 생긴
귀여운 연인의 존재.
왜냐하면 상대는 같은 회사
기획부에서 일하는
기센 여자 동기
미츠야이기 때문─!

Kono Kaisha Ni Suki Na Hito Ga Imasu
ⓒAkama','https://www.lezhin.com/ko/comic/office_romance','https://ccdn.lezhin.com/v2/comics/5023315744063488/images/tall.webp?updated=1703208227108&width=420','완결'),
('설령 닿지 않을 실이라 해도','tMnR·레진코믹스',array['로맨스']::text[],'‘내가 사랑한 사람은 오빠의 아내입니다.’
지극히 평범한 고교생 나루세 우타에게는 남들에게 말할 수 없는 비밀이 있다.
그것은 친오빠의 아내 카오루를 사랑한다는 것.
결코 결실을 맺지 못할 사랑이지만, 그저 하루하루 함께 할 수 있어서 기쁘고, 
한편으로는 오빠와의 신혼 생활을 보고 있자면 가슴이 찢어질 것 같은데......','https://www.lezhin.com/ko/comic/secret_crush_on_sister','https://ccdn.lezhin.com/v2/comics/5514139381661696/images/tall.webp?updated=1686216323296&width=420','완결'),
('마법에 기운 달','폴빠·쿠카부라',array['판타지']::text[],'마법이 만연한 세상, 추락하는 달을 누구도 막을 수 없다! 망가진 달 궤도를 고치기 위해 여정 길에 오른 공주 ''오로라''와 사제 ''퀼리번''. 둘은 서서히 달의 비밀을 파헤쳐가며 세상의 진실을 깨달아간다. 진실을 숨기려는 자들을 헤치고 나가 끝에 도달하고, 그걸 감당할 자는 누구일까? 뒤늦게 깨달은 진실이 감당할 수 있는 것이 아니라면 어떻게 해야할까? 폴빠','https://www.lezhin.com/ko/comic/magicmoon','https://ccdn.lezhin.com/v2/comics/4923728486793216/images/tall.webp?updated=1761913542870&width=420','완결'),
('색 있는 날들','김코인',array['로맨스']::text[],'어머니의 기대에 부흥하기 위해 남자로 살아온 공인주는 성별을 숨긴 채  
전쟁터에 나가기로 결심한다.  
그리고 훈련소에서 세 남자와 엮이게 된다.  
그녀에게 원한을 품고 있는 같은 마을 출신의 한소.  
느닷없이 뒤에서 칼로 공격해 오는 불한당 김시은.  
수수께끼의 남자 군의관 민초승까지  
신분과 관계 속에서 공인주는 무사히 집으로 돌아갈 수 있을까','https://www.lezhin.com/ko/comic/colourful','https://ccdn.lezhin.com/v2/comics/5534031072657408/images/tall.webp?updated=1762350042927&width=420','완결'),
('영원에 가까이','아루',array['드라마']::text[],'경원은 자신이 짝사랑하는 수지와 수지가 짝사랑하는 쌍둥이 누나 영원의 부탁에 못 이겨 동아리 활동을 시작한다. 세 사람이 함께하는 시간이 길어질수록 경원의 마음은 심란해져 가는데… 더없이 소중하지만 지긋지긋한 우리의 관계, 바뀔 수 있을까?','https://www.lezhin.com/ko/comic/eternity','https://ccdn.lezhin.com/v2/comics/6451796956479488/images/tall.webp?updated=1679481932828&width=420','완결'),
('키스로 시작하는 위험한 방과 후','소우다스이·우로코·넥스큐브·미즈',array['로맨스']::text[],'"‘눈앞에 있는 모르는 음악과 모르는 세계가… 내 감각 전부를 지배했다-.’
클래식 음악가 집안에서 태어났지만, 부모님의 재능을 물려받지 못한 카즈네.
어느 날, 어린 시절 친구였던 이웃집의 카나타가 그 재능을 주시하던
부모님에 의해 양자가 되기로 했다는 이야기를 듣고 카즈네는 충격을 받는다.
우울한 기분을 달랠 겸, 학교 음악실에서 연주와 노래를 하는 중','https://www.lezhin.com/ko/comic/kissstart','https://ccdn.lezhin.com/v2/comics/5151298293334016/images/tall.webp?updated=1464939045982&width=420','연재'),
('그렇게 내가 싫다면[개정판]','파고',array['로맨스']::text[],'[개정판]
해당 작품은 &lt;그렇게 내가 싫다면&gt; 성인 버전의 일부 장면을 수정한 개정판입니다. 
아웃사이더 복학생 민재는 우연히 과방에서 자고 있는 조교 진한을 몰래 훔쳐보는 후배 형조를 목격한다. 그날 이후 민재는 형조에게 정신적 육체적으로 시달리게 되는데... 서로 싫어하지만 왠지 모르게 끌리는 두 사람. 이들의 관계는 과연 어떻게 될 것인지?','https://www.lezhin.com/ko/comic/hate_me_15','https://ccdn.lezhin.com/v2/comics/6004151141072896/images/tall.webp?updated=1769160182491&width=420','연재'),
('용의주도 대표님의 연애 게임','Xiangwang·Ailu Cat·Yunqimoli·스토리숲',array['로맨스']::text[],'"이름도, 나이도 모르는 남자와 홧김에 혼인신고까지 해버렸다?!"

하룻밤 호텔에서 함께 지낸 것 가지고 다짜고짜 결혼하자는 이 남자! 
잘생긴 외모에, 다정한 성격까지… 너무도 완벽한 사람이지만 소정은 이 남자가 자신에게 접근한 의도를 도무지 알 수가 없다. 

이별이 예정된 계약 결혼 생활 가운데 드러나는 남자의 정체는…?!','https://www.lezhin.com/ko/comic/ceos_love_game','https://ccdn.lezhin.com/v2/comics/5098498250047488/images/tall.webp?updated=1637629396276&width=420','완결'),
('서하','약국·지티이엔티',array['로맨스']::text[],'가족을 잃고 친척들도 양육을 포기한, 버려진 아이 서하,아내와 미처 태어나지 못한 아기를 잊지 못하고 있는 삼촌.눈이 내리는 겨울에서 방황하는 둘의 성장기','https://www.lezhin.com/ko/comic/seoha','https://ccdn.lezhin.com/v2/comics/5781351834058752/images/tall.webp?updated=1763358947840&width=420','완결'),
('아르슬란 전기','아라카와 히로무·다나카 요시키',array['판타지']::text[],'"강철의 연금술사", "은수저" 아라카와 히로무 최신간 발행!!
다나카 요시키의 "아르슬란 전기", 전격 만화화!!
‘못미덥다’, ‘나약하다’, ‘기량이 부족하다’는 말만을 듣던 아르슬란이 열네 살이 되었을 때, 먼 나라의 이교도들이 파르스를 침공. 왕자 아르슬란은 첫 출전을 맞는다. 파르스 군은 고금무쌍. 이 전투도 파르스의 압승으로 끝나리라 그 누구도 ','https://www.lezhin.com/ko/comic/theheroiclegendofarslan','https://ccdn.lezhin.com/v2/comics/4756798567874560/images/tall.webp?updated=1764235627302&width=420','연재'),
('배덕의 밤 [개정판]','kk·팽유정·도서출판 가하·가하 웹툰',array['로맨스']::text[],'[해당 작품은 &lt;배덕의 밤&gt; 성인 버전의 일부 장면을 수정한 15세 개정판입니다. 이용에 참고 부탁드립니다.] 

“이 밤을 오롯이 감당하는 것은 제 몫입니다. 그러니 그대는 내어주시기만 하면 됩니다.”


소년병으로 꾸민 채 전장을 전전해왔던 은설은, 백황국 금문장군 기해운의 며느리라며 그 집안에 발을 디딘다.
해운의 장자인 백운은 이미 사위어','https://www.lezhin.com/ko/comic/immoral_night_15','https://ccdn.lezhin.com/v2/comics/4989547772706816/images/tall.webp?updated=1779324915670&width=420','완결'),
('귀여운 그녀','yoolook media·비브로스팀',array['로맨스']::text[],'출세에 눈이 멀어 버린 남자친구는 자신을 버리고 다른 여자와 결혼을 해 버리곤 버젓히 여주인공의 회사 대표로 취임을 하게 된다. 
옛남친의 괴롭힘에도 불구하고 꿋꿋이 회사 생활을 이어오던 여주인공 나하은! 
어느 날 술에 취해 남자와 잠자리를 가지게 되는데, 이 남자 알고 보니 오로지 그녀만 바라보는 해바라기가 따로 없다. 
얼떨결에 해바라기 윤지훈과 결혼','https://www.lezhin.com/ko/comic/cute_girl','https://ccdn.lezhin.com/v2/comics/6715755718836224/images/tall.webp?updated=1697761000503&width=420','완결'),
('최강! 중2병 그녀','영식',array['드라마']::text[],'멸망한 세상에서 살아남는 세 가지 방법이 있다.
그 중 하나는 눈에서 레이저를 내뿜는 중2 소녀에게 빌붙는 것이고, 나머지는...','https://www.lezhin.com/ko/comic/sophomoricillness','https://ccdn.lezhin.com/v2/comics/5057602952429568/images/tall.webp?updated=1679481056239&width=420','완결'),
('음탕한 사부와 미친 제자의 사정','호경·토포곡·적화문화·스토리숲',array['로맨스']::text[],'[휴재중] 미친 개를 다루는 방법 알아요? 바로, 만족할 때까지 하는 거야.

같은 시대, 같은 날, 같은 시간에 도플갱어처럼 닮은 두 사람이 각자의 제자에게 죽임을 당한다. 
그와 동시에 서로의 몸이 바뀐 채 환생을 하게 된다. 
다시금 자신을 죽이려는 제자들의 야릇한 접근에 따끔하게 혼을 내줘야겠다는 다짐을 하는데…','https://www.lezhin.com/ko/comic/lewdmaster_maddisciple','https://ccdn.lezhin.com/v2/comics/4719909074173952/images/tall.webp?updated=1728883053669&width=420','연재'),
('내 몸이 백합?!','사토루·넥스큐브·미즈',array['로맨스']::text[],'‘여자로서, 여자인 채로, 여자를 유혹해야 한다!’
신성한 여우상에 낙서를 한 죄로 저주를 받아, 하루 아침에 여자가 되어버린 유우키.
저주를 풀 수 있는 유일한 방법은 ‘여자와의 연애 성취하기?!’.
그리하여 전교생 기숙사제인 명문 시라호시 여학원에 들어가게 되지만,
여기를 봐도, 저기를 봐도 여자투성이인 그곳은 유우키에게 자극만 강할 뿐이다.
게다가… ','https://www.lezhin.com/ko/comic/lily_girls','https://ccdn.lezhin.com/v2/comics/6158951406370816/images/tall.webp?updated=1612240032558&width=420','완결'),
('튀어나왔어요, BL만화!','마롭-믹',array['드라마']::text[],'슬럼프로 인해 휴재에 들어간 BL 작가 육번(필명) 앞에 그의 만화 &lt;네버엔딩 튜토리얼&gt;의 주인공인 권세도가 나타난다. 같은 시각, 자격증 시험공부는 뒤로한 채 만화를 보며 놀고 있는 휴학생 박세영 앞엔 같은 만화의 또 다른 주인공 이장원이 나타나게 되고, 갑작스럽게 만화 속 두 주인공과 얽히게 된 두 사람의 일상은 조금씩 달라지는데…','https://www.lezhin.com/ko/comic/bl','https://ccdn.lezhin.com/v2/comics/5988270749908992/images/tall.webp?updated=1755652717755&width=420','완결'),
('네버마인드','이규환',array['드라마']::text[],'공황장애에 걸린 음악 천재 여고생 지우. 뮤지션 형을 잃은 상실감을 지우를 통해 위로받던 담임 민식. 둘은 돌파구를 찾기 위해 오디션 프로그램 참가를 결심한다. 그러나 오디션 예선 첫날, 지우에게 의외의 사건이 닥치는데...! 유세윤과 함께 웹툰 [유턴]을 그려낸 이규환 작가의 스피릿 충만한 신작!','https://www.lezhin.com/ko/comic/nevermind','https://ccdn.lezhin.com/v2/comics/5628161674444800/images/tall.webp?updated=1735611520176&width=420','완결'),
('구최애로부터 비밀을 사수하라!','선마·네치',array['로맨스']::text[],'과거 아이돌 팬픽 작가로 꽤 유명했던 ''민아''는 자신의 글 쓰는 능력을 갈고 닦아 비엘 소설 작가로 데뷔하여 성공한다.
 그러던 어느 날 자신이 덕질했던 아이돌 ''류우빈''이 일반인이 되어 본인의 담당 편집자로 나타난다.
졸지에 덕밍하게 생긴 민아는 그 사실을 감추려 노력하지만,  누군가의 폭로로 인해 자신이 우빈의 극성팬이였던 걸 들키게 되는데...?! 염','https://www.lezhin.com/ko/comic/exonepick','https://ccdn.lezhin.com/v2/comics/6430096279011328/images/tall.webp?updated=1705471945257&width=420','완결'),
('귀여워서 좋아한 게 아니거든!','시모조 미츠키·루트미디어·블랙스완',array['로맨스']::text[],'눈매가 사납고, 다가가기 어려운 겉모습과는 달리, 귀여운 것을 좋아하는 소녀취향의 나자 이치카와. 
그런 비밀을 유일하게 알고 있는 친구, 신고의 집에 초대되어, 소개 된 사람은 학교에서 [프린스] 라고 불리는 미남, 에이지 였다. 
엄청난 브라콤인 에이지는 이치카와가 신고를 좋아한다고 착각 하는데... 
과연 이치카와의 운명은!?','https://www.lezhin.com/ko/comic/cute_doll_boy','https://ccdn.lezhin.com/v2/comics/5695808191594496/images/tall.webp?updated=1677412125810&width=420','완결'),
('걔네들 분명 했을걸?','모토·넥스큐브·미즈',array['일상']::text[],'그 두 사람 사귀는 거 아냐? 분명 했을걸?''
원치 않게 소문의 주인공이 되어 외로웠던 그녀.
그런데 그 소문이 진짜가 되는 날이 온다…?!

중학교 시절 사소한 사고 때문에 엉뚱한 소문이 퍼져
고등학생이 된 지금도 변변한 친구 하나 사귀지 못하고 있는 카와이.
소문의 또 다른 당사자인 쿠로키와도 여전히 어색한 채
같은 학교로 진학하게 되었는데….
또다시 ','https://www.lezhin.com/ko/comic/they_clearly_did_something','https://ccdn.lezhin.com/v2/comics/5078555547795456/images/tall.webp?updated=1749103738476&width=420','완결'),
('아내의 복수를 대신하다','밀헨·매타·디투컴퍼니',array['드라마']::text[],'최악의 부인을 원하는 남자 김재혁. 남자를 그 무엇보다 싫어하는 여자 이서연. 맞선을 통해 결혼하게 된 두 사람은 각자 다른 꿈을 꾼다. 
한쪽은 결혼생활이 쭉 이어지길. 한쪽은 어서 이혼하길. 하지만 시간이 흐르며 둘 사이에 묘한 감정이 싹트기 시작하는데….','https://www.lezhin.com/ko/comic/revenge_of_wife','https://ccdn.lezhin.com/v2/comics/5123868419817472/images/tall.webp?updated=1554870845452&width=420','완결'),
('파파 투 파파','YEMMINE·키다리스튜디오',array['로맨스']::text[],'[매주 월요일 연재]
직업, 집안, 외모까지 어디 하나 모자란 곳 없는 남자 시안. 그 흠 없어 보이는 인생에, 갑자기 애가 등장했다? 
갑자기 나타난 전여친이 시안의 애라며 건네준 갓난아이. 엉겁결에 애아빠가 된 시안은 급하게 베이비시터를 알아보지만, 도착한 베이비시터 건혁은 어쩐지 엄청난 체구와 인상적인(?) 얼굴의 아저씨였다!
부득이하게 시작된 시커먼','https://www.lezhin.com/ko/comic/papa_to_papa','https://ccdn.lezhin.com/v2/comics/6709497438142464/images/tall.webp?updated=1720594064508&width=420','완결'),
('베드 파트너','기뉴·소금·이로이·스튜디오 바이드',array['로맨스']::text[],'"고백 한 번 못하고 끝나버린 짝사랑 선배와 ‘베드 파트너’ 가 되버렸다"

고등학교 교사로 평범한 일상을 살아가던 세진은 대학 시절 짝사랑했던 주환이 이사장권한대행으로 오게 되면서 그와 재회하게 된다.

주환의 등장으로 일상에는 균열이 생긴 세진과 달리 주환은 그녀를 전혀 알아보지 못한다. 며칠 후, 동창회에서 다시 마주한 두 사람은 충동적으로 하룻밤을 ','https://www.lezhin.com/ko/comic/bed_partner','https://ccdn.lezhin.com/v2/comics/7011765515869333/images/tall.webp?updated=1767664593383&width=420','완결'),
('용애담','채채·요요·엠젯패밀리',array['로맨스']::text[],'동해 용왕의 아들, 오구. 날때부터 용이었음에도 이렇다 할 재능 없이 약해빠지고 쓸모없는 존재로 자랐다. 이를 극복하기 위해 아주 강했던 용이 남기고 간 ''여의주''를 찾으러 인간 세상, 현세로 올라오게 되는데… 처음 보는 이상한 요괴가 오구와 오랜 친구, 어쩌면 애틋한 사이라도 되었다는 양 행동하는 것이 아닌가. 와중에도 머릿속에 없던 기억들이 불쑥불쑥 떠','https://www.lezhin.com/ko/comic/yongaedam','https://ccdn.lezhin.com/v2/comics/6635899332132864/images/tall.webp?updated=1709025894954&width=420','완결'),
('복서들','이해민',array['로맨스']::text[],'담대한 선 안에 섬세한 표현. 우아함과 격렬함이 공존하는 연출. 복서들의 공간인 링 안에서 폭력이 아닌 아름다움을 경험한다. 레진코믹스의 주목할 만한 신작 No.1!','https://www.lezhin.com/ko/comic/boxers','https://ccdn.lezhin.com/v2/comics/299/images/tall.webp?updated=1769152224900&width=420','완결'),
('너, 왜 이렇게 커? [개정판]','1010·유라떼·마루 더 레드',array['로맨스']::text[],'25년 지기 소꿉친구 한정우와 최이서.
정우는 오래전부터 이서를 짝사랑해 왔으나,
이서는 정우를 전혀 이성적으로 보지 않는다.

그러던 어느 날, 모종의 사건으로 두 사람의 동거가 시작되는데…

"너, 왜 이렇게 커?"

"내가 말했잖아, 네 그 장난감들보다 훨씬 클 거라고."

친구끼리 넘어서는 안 되는 선을 넘어버린다?!

"넣, 넣는 거야? 안 들어갈','https://www.lezhin.com/ko/comic/why_big_15','https://ccdn.lezhin.com/v2/comics/7011727411644131/images/tall.webp?updated=1728365718160&width=420','완결'),
('[웹툰판] 늑대는 꽃의 향기','리유마 카나·이코믹스·BL비엘',array['로맨스']::text[],'늑대와 흰 사슴은 사랑을 한다. 그것은 저주와도 닮은 숙명―

어느 산속 깊은 곳에 늑대와 함께 사는 민족이 있었다. 그들은 드물게 태어나는 하얀 머리의 아이를 「흰 사슴」 이라고 부른다.
왕족에게 시집가는 숙명을 지닌 「흰 사슴」으로 태어난 사라는 어렸을 때부터 사랑하던 왕의 막내아들 아라쿠시와 짝이 된다.
그러나 겉으로는 밝게 행동해지만, 아라쿠시가 좋','https://www.lezhin.com/ko/comic/white_deer_and_black_wolf_scr','https://ccdn.lezhin.com/v2/comics/6437386915151872/images/tall.webp?updated=1558587435270&width=420','연재'),
('OX유정남','도국',array['드라마']::text[],'X알 없는 남자 유정남.
잘생기고 몸도 좋고 심지어 머리도 좋지만,
그에게는 알이 없었다.
남자답지 못하다는 소리는 이제 지긋지긋하다.
진정한 남자란 무엇인가?
연애를 해보면 알 수 있을까?
유정남의 처절한 염병이 시작된다.','https://www.lezhin.com/ko/comic/noegg','https://ccdn.lezhin.com/v2/comics/6558093126467584/images/tall.webp?updated=1770011304351&width=420','완결'),
('아인','가몬 사쿠라이',array['판타지']::text[],'17년 전, 아프리카의 전장에 죽지 않는 인간이 나타났다. 그 후, 드물게 인류에 나타나는 결코 죽지 않는 미지의 신생물을 인간은 아인(亞人)이라 불렀다.
여름방학 직전, 한 일본인 고교생이 하교길에 교통사고를 당해 즉사. 되살아난 소년에게는 거액의 상금이 걸렸다. 그리고 전 인류를 상대로 한 소년의 도피행이 시작되었다.','https://www.lezhin.com/ko/comic/ain','https://ccdn.lezhin.com/v2/comics/969/images/tall.webp?updated=1764313701905&width=420','완결'),
('방구석 외톨이','피망',array['코미디']::text[],'5년차 백수 김어영의 방구석에서 벌어지는 소소하고 유쾌한 일상','https://www.lezhin.com/ko/comic/bangkok','https://ccdn.lezhin.com/v2/comics/6731384128077824/images/tall.webp?updated=1786003031660&width=420','완결'),
('염라의 법칙','묵비·대원씨아이',array['스릴러']::text[],'수능을 앞둔 평범한 고등학생 주희재.
엄마에게 조금이라도 도움이 되고 싶었던 희재는 엄마 몰래 아르바이트를 하다가 들킨다.
이 일로 엄마와 크게 싸운 희재는 폭우 속을 달리다 갑자기 미지의 세계로 빠지게 된다.
그곳에는 자신을 염라라고 말하는 괴물체(?)가 게임에서 이겨야 현실 세계로 돌아갈 수 있다 하고,
어쩔 수 없는 게임이 시작된다. 게임 시작과 동시','https://www.lezhin.com/ko/comic/yamas_law','https://ccdn.lezhin.com/v2/comics/5535058809454592/images/tall.webp?updated=1594367195215&width=420','연재'),
('귀신을 보는 남자','A4·엠젯패밀리',array['로맨스']::text[],'귀신보는 두 남자의 투닥투닥 퇴마기.
디지털 앱으로 귀신잡는 남자 vs 고전적인 방법으로 귀신잡는 남자

심령현상 해결사 ‘더 크리처’에 근무하는 심예훈. 
출장업무를 나가 뺀질뺀질한 퇴마사를 만나고, 
심령현상을 해결하던 도중 빙의되어 버렸다! 

그런데 이 사기꾼같은 퇴마사 박결과 함께 있으면 특이체질인 예훈이
어릴적부터 겪어 온 이상현상을 막아줄 수 ','https://www.lezhin.com/ko/comic/ghostwatching_man','https://ccdn.lezhin.com/v2/comics/4630186128965632/images/tall.webp?updated=1553676934454&width=420','연재'),
('복수교실','야마자키 카라스',array['스릴러']::text[],'“죽기 전에 너희들한테도 지옥을 보여줄게.” 반에서 지독한 왕따를 당하던 중학교 3학년 후지사와 아야나는 어떤 결심을 한다.
그것은 바로 ‘반 아이들 전원에게 자신이 겪은 것과 같은 지옥의 고통을 맛보게 해주는 것’ 사냥이 시작되고, 왕따의 주모자가 눈에 보일 듯 말 듯한다. 흑막은 과연 누구인가. 진정 나의 가까운 친구인가? 시라사키 중학교 3학년 3반.','https://www.lezhin.com/ko/comic/fukushuu','https://ccdn.lezhin.com/v2/comics/565/images/tall.webp?updated=1545966000847&width=420','완결'),
('시작이야 어떻든 [개정판]','가명·씨엔씨레볼루션㈜',array['로맨스']::text[],'[해당 작품은 &lt;시작이야 어떻든&gt; 성인 버전의 일부 장면을 수정한 15세 개정판입니다. 이용에 참고 부탁드립니다.]
효자손으로 눈 떠버린, 청년들의 SM 로맨스!

어느 날, 친구가 사온 ''효자손''.
이걸로 몸을 두들기면 액운을 쫓을 수 있다… 는 건 모르겠고! 어째 맞으면 맞을수록 흥분된다…?!','https://www.lezhin.com/ko/comic/any_way_start_rd','https://ccdn.lezhin.com/v2/comics/5208999709442048/images/tall.webp?updated=1607489962971&width=420','완결'),
('사장님과 금비서','라임정원·KIRTY·키다리스튜디오',array['로맨스']::text[],'대학 졸업 후 온갖 알바를 뛰며 기울어가는 가세를 일으킨 아지는 어느 날 큰아버지의 제안으로 대기업 선구그룹 사장의 비서로 들어가게 된다. 그것도 낙하산으로!! 대기업이 별거냐 싶어 별 신경 안 쓰고 나간 출근 첫날, 우왕~ 사장이 너무 잘생겼잖아!!! 하지만 역시나 왕싸가지네!! 사사건건 트집을 잡고 말도 안 되는 업무들을 시키더니 고작 점심 한끼 사주고','https://www.lezhin.com/ko/comic/geum_secretary','https://ccdn.lezhin.com/v2/comics/5219040868564992/images/tall.webp?updated=1610943291256&width=420','완결'),
('괴기목욕탕','김경일·재담미디어',array['스릴러']::text[],'인간세계와 지옥세계의 접합점인 괴기목욕탕. 이곳에서 마물들의 피 튀기는 향연과 마물보다 더욱 사악한 인간들의 욕망이 꿈틀댄다!','https://www.lezhin.com/ko/comic/ghost_bathhouse','https://ccdn.lezhin.com/v2/comics/5121789307518976/images/tall.webp?updated=1535079605786&width=420','완결'),
('미스타임 (Miss time)','봉구씨·경섭·지티이엔티',array['로맨스']::text[],'퍼스널 트레이너로 성공한 골드미스 이가온,
독설로 유명한 로맨스 작가, 지호와 원수관계에 놓이다?

가온은 웬수덩어리 친구 세라의 결혼식에 갔다가 얼떨결에 세라의 도주(?)를 돕게 되고
그 과정에서 신랑이었던 지호와 서로를 맹렬하게 비난하는 사이가 된다.
알고 보니 고교 동창이었던 두 사람, 지호는 가온을 다시 만나려하고
그러던 중, 가온과 세라는 12년 ','https://www.lezhin.com/ko/comic/miss_time','https://ccdn.lezhin.com/v2/comics/4978865662394368/images/tall.webp?updated=1646701271933&width=420','완결'),
('어린이 스타','아오미야 카라',array['로맨스']::text[],'"그런 얼굴, 나만 볼 수는 없을까…?"

반에서 인기가 많은 혼다는 
히어로쇼 회장에서 같은 반 깡패 카이도와 만나게 된다.
그런데 학교에서는 누구나 벌벌 떨게 만드는 카이도가
무엇 때문인지 히어로 슈트를 입고 있는 것이 아닌가!
카이도의 또 다른 얼굴을 알게 되어
혼다는 ''두 사람만의 비밀''이 생겼다는 것에 우월감을 느끼지만
혼다와 한번 친해지니 같은 ','https://www.lezhin.com/ko/comic/childrenstar','https://ccdn.lezhin.com/v2/comics/4821578318086144/images/tall.webp?updated=1569557775983&width=420','완결'),
('시집 안 갈 거야!','스나코·넥스큐브·볼레로',array['로맨스']::text[],'''텐메이 재벌의 후계자인 텐메이 진의 ''신부 오디션''에 참가하게 된 아마미야 이츠키. 진은 완전히 마이페이스 도련님에, 틈만 나면 일일이 놀려대는 짜증 나는 녀석이었다. 그런 남자와 결혼하는 것은 싫지만, 텐메이 가문과 이어진다면 자신의 집안도 안정될 것을 생각한 이츠키. 탈 가난을 목표로 신부 수행을 시작하는 이츠키였지만, 그 앞에는 상상하지 못한 난관이','https://www.lezhin.com/ko/comic/notmarry','https://ccdn.lezhin.com/v2/comics/5792131146448896/images/tall.webp?updated=1548039600954&width=420','완결'),
('정부는 도망친다','리치·백설은·tt studio',array['로맨스']::text[],'오만하고 남을 믿지 않는 공작 킬리언과 소심하고 자존감 낮은 정부 로위나. 
오해와 불신으로 로위나를 내친 킬리언이 다시 그녀를 찾게 되어 과거의 일을 후회하고, 헌신하여 다시 그녀의 마음을 얻는 이야기.','https://www.lezhin.com/ko/comic/run_away_lover','https://ccdn.lezhin.com/v2/comics/4862268267102208/images/tall.webp?updated=1723442896399&width=420','완결'),
('네가 정말 좋아서 미치겠어','이케모리 아유·지티이엔티·허니B',array['로맨스']::text[],'강아지를 너무나 좋아하는 시바모토의 최근 즐거움은 아르바이트 편의점에 매일 찾아오는 큰 쉐퍼드를 바라 보는 것. 그렇지만 그 주인 이누카이는 무뚝뚝하고 무섭기만 한데..! 
셰퍼드 계 꽃미남 남자와 시바 계 귀여운 남자! 두 사람의 사랑의 행방은?! 
ⓒAyu Ikemori/JULIAN PUBLISHING Co.,Ltd.','https://www.lezhin.com/ko/comic/mr_shepherd','https://ccdn.lezhin.com/v2/comics/6142378545774592/images/tall.webp?updated=1613540648944&width=420','완결'),
('연애편지 대신 써드릴까요?','닉업·유테',array['로맨스']::text[],'“……엘리엇 브라운. 그자를 내 잠자리 시종으로 들이겠다.”

온갖 서비스직을 섭렵한 ‘이달의 사원’ 임성식 씨, 그러던 그가 피폐물 BL소설의 악역 조연이자 작가 엘리엇으로 빙의했다.

원래대로라면 모든 인물이 원작공 아르젠의 손에 죽는 결말이지만,  엘리엇은 그 비극의 시작인 연애편지 대필을 피하기 위해 작가였던 과거를 숨기고 조용히 살기로 한다. 하지','https://www.lezhin.com/ko/comic/write_loveletter_instead','https://ccdn.lezhin.com/v2/comics/7011748599270451/images/tall.webp?updated=1749965101650&width=420','연재'),
('빛과 그림자','희원·류향·키다리스튜디오',array['로맨스']::text[],'주인의 명령에 신분을 속이고 피의 전사 ''일라이''와 결혼하게 된 하녀 ''에드나‘. 
결혼 후 자신이 하녀라는 사실이 금방 들통나지만 ‘일라이’는 크게 문제 삼지 않는다. 
그러나 ‘일라이’가 미처 모르고 있던 진실이 숨겨져 있는데… 바로 ‘에드나’가 자신이 몰락시킨 왕가의 후계자였다는 것... 이는 ‘에드나’가 왕자로 18년간 자신의 정체성을 숨기고 살아왔','https://www.lezhin.com/ko/comic/light_n_shadow','https://ccdn.lezhin.com/v2/comics/5774371166420992/images/tall.webp?updated=1759295823583&width=420','완결'),
('늑대들의 사정','미츠루기·넥스큐브·미즈',array['로맨스']::text[],'집안이 몰락해 갑자기 부랑아가 돼버린 미즈키 아야. 동급생의 야마토에게 "우리 집으로 와!"라는 말을 듣는데, 학생회장에 부잣집 아들인 니카이도 선배에게도 "우리 집으로 와도 돼."라고 제안 받는다!? 결국 두 명의 집에 1주간 교대로 동거하게 되는데! 목욕하던 중 들어온 선배가 등을 꼼꼼히 씻겨 주기도 하고, 이불 속에서 야마토가 몸을 만지작거리기도…! ','https://www.lezhin.com/ko/comic/living_in_wolves_house','https://ccdn.lezhin.com/v2/comics/5979736702713856/images/tall.webp?updated=1464928644229&width=420','완결'),
('사장님은 이웃사촌','임달영·심원용·디투컴퍼니',array['드라마']::text[],'대기업 의류 회사의 카리스마 대표인 오성화는 남몰래 동경하던 작품이 있다.
젊은 시절 자신을 절망에서 구원해 주었던 멘토 같은 작품. 성공한 지금 그 작품의 원작자 남궁철이 비인기 작가로 힘겹게 살아가고 있다는 것을 알게된 성화는 신분을 숨기고 3류로 떨어진 만화가의 문하생으로 들어가게 되는데..!','https://www.lezhin.com/ko/comic/boss_neighbor','https://ccdn.lezhin.com/v2/comics/5744074253533184/images/tall.webp?updated=1560489820830&width=420','완결'),
('프리징 컬러 에디션','임달영·김광현·디투컴퍼니',array['판타지']::text[],'인류를 위협하는 적 이차원체. 그에 맞서 젊음과 생명을 바치며 성흔을 몸에 담는 소녀들 ''판도라''. 
 지금 접촉금지의 여왕 사테라이자 엘 브리짓이 당신의 시선을 사로잡는다. 풀컬러로 다시 돌아온 그녀를 만나보자!
[프리징 컬러 에디션은 프리징 완전판의 컬러채색+스크롤 버전으로 내용은 동일합니다. 이용에 참고해주시기 바랍니다.]','https://www.lezhin.com/ko/comic/freezing_color_edition','https://ccdn.lezhin.com/v2/comics/5764685329727488/images/tall.webp?updated=1646379714183&width=420','연재'),
('똥퍼였던 내가 아이돌에 빙의했습니다?!','9도',array['로맨스']::text[],'"부모님, 친척, 형제 없이 홀로 온갖 잡일을 하며 건실하게 살아온 현수. 심지어는 똥퍼 일까지 마다하지 않았다!
그러던 어느 날, 죽을 뻔한 고비를 겪고 눈을 뜨니... 웬 아이돌에 빙의했다?!
아이돌? 멤버? 인터넷? 현수가 살던 시간에 비해 적어도 50년은 지나버려 온통 모르는 것 투성이다.
게다가 곧 해체할 위기라고...! 순식간에 살 길을 잃어버린','https://www.lezhin.com/ko/comic/ddongbing','https://ccdn.lezhin.com/v2/comics/4747180254625792/images/tall.webp?updated=1738720735400&width=420','완결'),
('거북이는 잠자는 토끼를 지나칠 수 없어!','MOSEI',array['판타지']::text[],'거북이는 토끼와의 달리기 시합에서 승리하고,
10년을 숨겼던 마음을 고백하기로 결심한다!

거북이는 최선을 다해 달리지만
다가올 미래는 참혹 그 자체?!','https://www.lezhin.com/ko/comic/cantskiprabbit','https://ccdn.lezhin.com/v2/comics/7011777435659027/images/tall.webp?updated=1786607865952&width=420','연재'),
('화면 속 그대','나길',array['로맨스']::text[],'"내가 TV를 켜놨었나?" 아침에 눈을 떠 착각에 빠진 유진. 그 이유는 바로 여동생 유나가 집에 버리듯이 두고 간 녀석, 세련 때문이다. 눈 앞에 곤히 잠든 세련은 TV를 켜기만 하면 나오는 인기배우이다. 유진과 세련, 두사람 사이엔 무슨 일이 있었던 걸까?','https://www.lezhin.com/ko/comic/you_on_the_screen','https://ccdn.lezhin.com/v2/comics/6563935452266496/images/tall.webp?updated=1661762293318&width=420','완결'),
('면사포를 쓰고픈 남자','스트',array['로맨스']::text[],'2m 10cm의 키, 곰과 같은 덩치지만 마음만은 저 들판의 코스모스보다도 여린 남자, 주인공 ''홍사랑''.
과거 받았던 상처로 인해 자신을 부정하게 된 사랑은 어느 날 자신을 바꿔줄 인연들과 만나게 되는데.. 

자기도 몰랐던 고정관념들을 깨는 이야기. 
그리고
혐오를 혐오하는 이야기.','https://www.lezhin.com/ko/comic/man_in_a_veil','https://ccdn.lezhin.com/v2/comics/6277832487534592/images/tall.webp?updated=1655282991624&width=420','완결'),
('게임덕후 친구 만들기','혜룡',array['일상']::text[],'"그녀와 친구가 되면 한 달 치 집세가 감면된다고?!?!"
휴학 후 은둔형 외톨이처럼 집에 틀어박혀서 게임만 하고 지내는 가온. 오랫동안 세상과 단절되어 있다 보니 게임과 현실 구분이 안되고, 레벨업과 PK 승리만이 삶의 유일한 낙이다. 결국 그녀를 밖으로 내보내기 위한 아버지의 특단의 조치가 내려지는데..','https://www.lezhin.com/ko/comic/ilovegame','https://ccdn.lezhin.com/v2/comics/4538773373059072/images/tall.webp?updated=1737601333662&width=420','완결'),
('세상에서 가장 아찔한 프로포즈','이시카와 토미·넥스큐브·미즈',array['로맨스']::text[],'쌍둥이 언니 마리노의 맞선대역을 부탁 받은 유키노. 
상대는 1년 전, 같은 회사에서 일하던 마리노에서 반했다는 외국 법률 사무소의 후계자 히카리였다.
갑작스런 프로포즈, 제멋대로인 태도를 혐오하던 유키노였지만 헤이즐색의 아름다운 눈빛으로 한결
같은 마음을 전해오는 그에게 점점 끌리게 되는데…','https://www.lezhin.com/ko/comic/bestpropose','https://ccdn.lezhin.com/v2/comics/4990222830403584/images/tall.webp?updated=1555315494620&width=420','완결'),
('꿈에서 만나요','김동글',array['로맨스']::text[],'이유도 모른 채 지옥같은 학교생활을 보내온 새벽. 중학교 졸업식, 자살을 꿈꾸며 버려진 약을 모아오던 버릇도 이제 끝낼 수 있다. 하지만 병대는 마지막까지 새벽을 가만 두지 않고... 힘든 일은 없냐며 걱정하는 엄마 몰래 홀로 눈물 흘리며 잠든 새벽. 꿈 속에서 만난 새로운 친구는 누구일까?','https://www.lezhin.com/ko/comic/only_in_dreams','https://ccdn.lezhin.com/v2/comics/5442724454858752/images/tall.webp?updated=1646708263354&width=420','완결'),
('첫사랑에게','리세·유송주·대원씨아이',array['로맨스']::text[],'유일한 가족이었던 할머니가 돌아가신 후 
하진의 집에 객식구로 얹혀 살게 된 지수. 
어린 나이에 가족을 전부 잃고도,
힘든 내색조차 하지 않는 그녀에게 하진은 자꾸만 시선이 향하는데...!

한 지붕 아래서 펼쳐지는 지수와 하진의 풋풋한 첫사랑 이야기.
 
“그런데 참 신기해.”
“뭐가.”
“절대 좋아할 일 없을 거라고 확신했던 녀석을 좋아하게 됐다는 게','https://www.lezhin.com/ko/comic/dear_first_love','https://ccdn.lezhin.com/v2/comics/5112338975096832/images/tall.webp?updated=1709620819479&width=420','완결'),
('내가 네 운명의 가이드는 아니지만 [개정판]','.Dd.·누룽지파티초대장',array['로맨스']::text[],'해당 작품은 웹툰 &lt;내가 네 운명의 가이드는 아니지만&gt; 성인 버전의 일부 장면들을 수정한 [개정판] 입니다. 이용에 참고 부탁드리겠습니다. 

92%, 센터 역사상 가장 높은 매칭률을 기록한 에스퍼인 계준민과 가이드인 나는 첫 만남부터 미친듯이 싸웠다. 얼굴이 멀쩡한 날이 없을 정도로 주먹질과 발길질을 하며 난잡하게 싸워댔는데,

…분명 그랬었는','https://www.lezhin.com/ko/comic/not_your_fate_all','https://ccdn.lezhin.com/v2/comics/7011750840240248/images/tall.webp?updated=1785903574373&width=420','완결'),
('베이비 페이스 몬스터 [개정판]','지타·넥스큐브·볼레로',array['로맨스']::text[],'현직 불량배×전직 불량배의 엎치락뒤치락 핑크빛 힘겨루기! 

한때는 이름을 날리던 불량배였지만 
지금은 평범하게 살고 있는 이카리 에이지. 
후배의 부탁에 불량배들끼리 시비가 붙은 현장에 가게 된 그는 
지금 일대를 주름잡고 있다는 루이의 시선을 
본의 아니게(?) 빼앗고 마는데…!?','https://www.lezhin.com/ko/comic/baby_face_monster','https://ccdn.lezhin.com/v2/comics/5627979796905984/images/tall.webp?updated=1603946219990&width=420','완결'),
('다시 그대와 함께 [웹툰]','L.Mo·학산문화사',array['로맨스']::text[],'모교인 한빛사대부고에서 체육교사로 근무 중인 서지안은 등교 지도 중에 수상한 남자를 만나게 된다.
실랑이 끝에 알게 된 그 남자의 정체는 새로 부임한 수학 교사 지선율.
게다가 그는 7년 만에 만난 지안의 고교 시절 첫사랑이었는데…?
하지만 선율은 선머슴 같던 모습에서 많이 달라진 지안을 알아보지 못한다.
서로 호감이 있었지만 작은 오해로 인해 작별 인사도','https://www.lezhin.com/ko/comic/with_you_again','https://ccdn.lezhin.com/v2/comics/4523593292906496/images/tall.webp?updated=1764301315498&width=420','완결'),
('흑룡연인','주이원·키다리스튜디오',array['로맨스']::text[],'상하이 최고의 미술관의 직원으로 자부심을 갖고 살아가던 의지의 한국인 아가씨 한평안. 악착같은 알바 생활로 상하이 음악원 최고의 첼리스트를 꿈꾸는 대학생 김여래.
창창했던 태권도 유망주의 꿈을 접고 상하이로 흘러 들어온 청년 도진환.
세 사람의 청춘은 상하이 최고의 권력을 쥐고 있는 조직, ‘흑룡’과 얽히며 180도 변한다.

하루 살기도 힘든 김여래의 앞','https://www.lezhin.com/ko/comic/black_dragon_love','https://ccdn.lezhin.com/v2/comics/4786035588202496/images/tall.webp?updated=1764224442780&width=420','완결'),
('문정후 초한지','류기운·문정후·재담미디어',array['액션']::text[],'&lt;용비불패&gt;, &lt;고수&gt;의 만화가 문정후 작가의 &lt;초한쟁패&gt;. 중국 대륙을 통일한 진시황이 죽고 난 후, 항우 진영의 초나라와 유방 진영의 한나라가 벌인 치열한 승부를 그렸다. 전국시대에 진나라 왕으로 즉위한 진시황은 통일 진제국 건설을 위해 공포정치 펼치고 백성들의 고통은 심각했다. 진시황 사후, 진나라는 혼란에 빠지고 또다','https://www.lezhin.com/ko/comic/mjh_chohanji','https://ccdn.lezhin.com/v2/comics/6688919670882304/images/tall.webp?updated=1549594808788&width=420','완결'),
('BL의 정석','푸카·북큐브네트웍스·북큐브',array['로맨스']::text[],'#우등생공 #양아치공 #픽미픽미픽미공 #얼굴이다했수 #다공일수 #얼굴맛집

＂그때... 기억나?＂
따뜻한 봄날 전학 온 이시현.
절대 마주치고 싶지 않은 ’그 녀석’과 마주치게 되는데...!

과연 누가 진짜 주인공일까?','https://www.lezhin.com/ko/comic/standard_of_bl','https://ccdn.lezhin.com/v2/comics/6039840199344128/images/tall.webp?updated=1630983863386&width=420','완결'),
('술에 잠기다','2396스튜디오·키다리스튜디오',array['로맨스']::text[],'미모의 오메가 신지호, 교통사고로 인해 베타 사회로 워프하게 된다. 설상가상 발정기에 접어든 그는 자신이 방출한 술 향 페로몬에 취해 길거리에서 쓰러지고 마는데...

오메가의 ''오''자도 모르는 베타 세상에서 신지호는 자신을 구원해 줄 알파를 만날 수 있을까?','https://www.lezhin.com/ko/comic/get_drunk','https://ccdn.lezhin.com/v2/comics/6177065248030720/images/tall.webp?updated=1720673874757&width=420','완결'),
('장난스런 키스','타다 카오루·루트미디어·클로버즈',array['로맨스']::text[],'고교 3년생인 코토코는 입학식에서 한눈에 반해버린 이리에 나오키에게 고백할 결심을 하고 용기를 쥐어짜내 그에게 러브레터를 건네어 보는데… 
하지만 이리에는 ''필요없어. 머리 나쁜 여자는 질색이야.''라며 냉정하게 퇴짜를 놓는다. 
IQ 200인 엄청난 천재에다 운동까지 만능인 그는 코토코에게 그림의 떡이나 다름없는데!! 
실연의 아픔에 이어 엎친데 덮친격으로','https://www.lezhin.com/ko/comic/playfulkiss','https://ccdn.lezhin.com/v2/comics/5947589140152320/images/tall.webp?updated=1465891875164&width=420','완결'),
('암행 전학생','임달영·김광현·디투컴퍼니',array['드라마']::text[],'학생인권조례를 악용하여 약육강식이 되어버린 학교라는 
지옥에 정의를 실행하는 전학생이 나타난다!

 *본 작품의 적정 열람 연령은 15세 이상입니다.','https://www.lezhin.com/ko/comic/darkstudent','https://ccdn.lezhin.com/v2/comics/6154869242200064/images/tall.webp?updated=1662451213268&width=420','완결'),
('맨발의 니나','첨지',array['로맨스']::text[],'"소심하고 내성적인 성격의 은서는 자신을 병적으로 명문 대학에 보내고자 하는 엄마의 등쌀에 못 이겨 전교생이 기숙사에서 생활하고, 한 달에 한 번 사유서를 통해 외박이 허용되는 스텔라 예술학교에 기부금을 내고 편입한다. 학기 중간에 편입한 은서를 보며 같은 반 친구들은 수군거리고, 은서는 기숙사로 돌아와 눈물을 훔치며 잠이 든다. 한편, 기숙사 옥상에서 누','https://www.lezhin.com/ko/comic/nina_on_the_rooftop','https://ccdn.lezhin.com/v2/comics/5665536353239040/images/tall.webp?updated=1579487349847&width=420','완결'),
('그에게 닿기 100일 전','Wang Jie·KS·키다리스튜디오',array['로맨스']::text[],'"꼴도 보기 싫은데, 자꾸 신경쓰이는 건 뭐지?"

톱배우 양지현은 갑작스러운 암 투병으로 1년간 요양을 떠나게 되면서, 자신과 꼭 닮은 지애의 빚을 갚아주는 대신, ''양지현''의 대역 연기를 요구하고…

대리결혼까지 하게 된 지애는, 사사건건 꼬투리를 잡는 남편 여훈 곁에서 무사히 대역 연기를 마무리 지을 수 있을지… 얽히고 설킨 여훈과의 인연은, 누가 먼','https://www.lezhin.com/ko/comic/100days_before','https://ccdn.lezhin.com/v2/comics/6000828457025536/images/tall.webp?updated=1623822737220&width=420','완결'),
('코시엔甲子園으로 GO!','샤다라빠',array['코미디']::text[],'&lt;꼴데툰&gt; 샤다라빠의 일본고교야구 정복기! 야구를 몰라도 즐길수 있는 신감각 여행만화.','https://www.lezhin.com/ko/comic/koushien','https://ccdn.lezhin.com/v2/comics/103/images/tall.webp?updated=1626417993126&width=420','완결'),
('남동생인 척하고 웃는 건 이제 관둘래','카미데라 치즈',array['로맨스']::text[],'"좋은 아침~ 빨리 죽어버리세요, 공주님" 
오늘도 스팸 메일로 미우의 아침은 시작된다. 
아마도 남자친구인 사이죠 선배의 팬으로부터 온 것이겠지. 

사이죠 선배는 고교생 인기 소설가로 미우의 남동생 소스케의 소개로 미우와 사귀게 되었다. 
하지만 소스케는 사이죠 선배에게 미우를 소개한 것을 후회하고 있고…. 
사랑인지 집착인지 잘은 모르겠지만 한결같은 ','https://www.lezhin.com/ko/comic/brothernotlike','https://ccdn.lezhin.com/v2/comics/5707383617093632/images/tall.webp?updated=1785474158750&width=420','완결'),
('나만의 짝사랑','MINDZAP·엠젯패밀리',array['로맨스']::text[],'거칠은 남자와 부드러운 남자의 과격과 서정.
직장상사와 대학동창의 경계를 위험하게 넘나드는 격정오피스 BL 

회사에선 어리버리 순진하기만 한 이준희는
아무도 모르는 은밀한 투잡을 하고 있었으니
그건 바로 Live Bar에서 너무나 잘 나가는 재즈 가수! 지오!
특별 이벤트로 관객 중에서 지오와 저녁식사 데이트를 경매로 걸었더니
하필 최고액 불러 낙찰된 놈','https://www.lezhin.com/ko/comic/my_unrequited_love','https://ccdn.lezhin.com/v2/comics/6370437607325696/images/tall.webp?updated=1554779290910&width=420','완결'),
('금단의 사제관계 따윈 개나 줘버려','이치노미야 시한·루트미디어·블랙스완',array['로맨스']::text[],'공립 고등학교의 교사로 부임하게 된 아사히 스나오는 부임하는 학교가 남녀공학이라 상큼한 나날을 기대하고 있었다.
하지만 남녀공학이라는 타이틀만 있을뿐 남학교나 다를바가 없었는데…. 예전부터 남자들에게 인기가 많았던 스나오는 어느 일로 인해 담임을 맡게된 반의 츠키지의 호위를 받게 된다. 
치정 관계에 얽히지 않아도 된다고 안심하고 있던 스나오지만 어느 날,','https://www.lezhin.com/ko/comic/love_you_teacher','https://ccdn.lezhin.com/v2/comics/4567390170120192/images/tall.webp?updated=1582967184700&width=420','완결'),
('없다 있으니까','NAN·앤드비',array['로맨스']::text[],'“선배의 취향이 그렇다면 제가 변하겠어요!!”

평소 동경하던 도원 선배에게 용기를 내 고백을 한 홍은 그 자리에서 거절당한다. 모든 희망이 사라졌다며 좌절하는 홍에게 수상한 여자가 접근한다.

속는 셈치고 수상한 여자가 권하는 약을 먹은 홍은 도원 선배의 이상형인 ‘현’이 되어 도원 선배에게 더 강력한 러브 어택을 시작하는데?!

일편단심 오직 선배만을 ','https://www.lezhin.com/ko/comic/absence_being','https://ccdn.lezhin.com/v2/comics/5837881263390720/images/tall.webp?updated=1636020268208&width=420','완결'),
('기억 캡슐 - 오빠와 함께','타츠모토 미오',array['로맨스']::text[],'여동생을 사랑한 남자, 오빠를 사랑한 여자.
해서는 안 되는 사랑은 이미 시작돼 있었다.

어떤 사건으로 최근 2년간의 기억을 잃은 마유.
병원에서 눈을 뜬 마유는 그 2년 사이에 아버지가 재혼하여 어머니와 오빠가 생겼음을 알게 된다.
친절한 새어머니와 마유에게 은밀하게 다가오는 다정한 새 오빠 소우.
그림으로 그린 듯이 이상적인 가족이지만, 마유는 자신이','https://www.lezhin.com/ko/comic/memorycapsule','https://ccdn.lezhin.com/v2/comics/4742362358611968/images/tall.webp?updated=1544756405996&width=420','완결'),
('장미성의 엘레지','모레',array['판타지']::text[],'꿈을 통해 다른 세계로 이끌려 와
어느 왕국 귀족 영애, 티네케의 몸에 빙의하게 된 주인공, 이루리.
현실 세계로 돌아가기 위한 단서를 얻고자 저택에서 떠나려 한다.

하지만 티네케를 따르던 소녀, 엘마가 자꾸 눈에 밟히고
믿을 사람 하나 없는 낯선 세계에서 루리는 무력하기만 한데…

루리는 여정을 무사히 마치고 다시 집으로 돌아갈 수 있을까?','https://www.lezhin.com/ko/comic/elegy','https://ccdn.lezhin.com/v2/comics/5903641816137728/images/tall.webp?updated=1718350316216&width=420','완결'),
('나 좀 바라봐 줘 [연재]','Whale·대원씨아이',array['로맨스']::text[],'사생활이 문란하다고 소문난 현우.
이런 현우와의 하룻밤으로 결혼까지 하게 된 하영.

실수인 듯하지만
사실 하영은 주 씨 집안의 비밀을 파헤치려는 계획이 있고…

이런 계획을 알고 있는 현우지만 속으로는 하영을 좋아해 비밀을 지켜주는데,
그러니까...

"나 좀 바라봐 줘."','https://www.lezhin.com/ko/comic/plz_look_at_me','https://ccdn.lezhin.com/v2/comics/5301385473228800/images/tall.webp?updated=1723429164442&width=420','연재'),
('네오 마그넷','HOOPA',array['판타지']::text[],'3차 대전 이후의 세계. 대립하는 세력 사이에 존재하며 평화를 약속한 도시 티에구 타운에는 다양한 사람들이 모여든다. 그 중에 죽음의 위기에서 탈출하며 복수를 다짐하는 한 남자가 스며드는데.. 경쾌한 SF 활극.','https://www.lezhin.com/ko/comic/neo_magnet','https://ccdn.lezhin.com/v2/comics/287/images/tall.webp?updated=1550131179625&width=420','완결'),
('접촉 불량','소의·대원씨아이',array['로맨스']::text[],'소꿉친구 이현을 오랫동안 짝사랑해온 설재하.
의도는 알 수 없으나, 전학 온 날부터 재하와 이현 사이를 사사건건 방해하는 김도영. 하나부터 열까지 맞지 않는 재하와 도영!

그럼에도 이현이 도영을 싸고도는 바람에 세 사람은 삐걱대지만 계속해서 함께 지내게 된다. 그러던 중, 이현이 방학 동안 시골에 가서 보충수업을 듣지 않게 되고, 재하는 이현이 없으니 드','https://www.lezhin.com/ko/comic/npole_npole','https://ccdn.lezhin.com/v2/comics/6239791195947008/images/tall.webp?updated=1691412272845&width=420','완결'),
('그들만의 수업 [베리즈]','타카노 카노·미스터블루·베리즈',array['로맨스']::text[],'"방과 후 아무도 없는 교실에서, 나와 그녀의 비밀의 레슨이 시작된다― 
나는 어색하게 손을 잡고, 작게 떨리는 그녀의 몸을 상냥하게 만진다. 
하지만 우리는 연인관계가 아니다. 
이것은 그녀의 남성공포증을 극복하기 위한 가짜 연인 놀이. 
알고는 있지만… 왜 이렇게 가슴이 뛰는 걸까…"','https://www.lezhin.com/ko/comic/their_own_class','https://ccdn.lezhin.com/v2/comics/6579188307329024/images/tall.webp?updated=1619603298911&width=420','완결'),
('TV를 꺼드립니다','Lunar Phase·sage·디투컴퍼니',array['로맨스']::text[],'천애 고아로 남동생 인권과 둘이서 힘겨운 서울 생활을 하고 있는 강소희. 고등학생인 동생 인권은 사건 사고가 끊이지 않고,그 동안 힘들게 모은 등록금과 월세의 절반을 동생의 합의금으로 물어주게 되어 크게 절망하게 된다. 그러던 중 보게 된 특이한 알바. 지푸라기라도 잡고 싶은 심정인 강소희의 고군분투 아르바이트 생존기!','https://www.lezhin.com/ko/comic/turnoff_tv','https://ccdn.lezhin.com/v2/comics/6552050783092736/images/tall.webp?updated=1714126358986&width=420','완결'),
('영구지명 부탁해요','카나에 사토·지티이엔티',array['드라마']::text[],'[휴재 중] 히키코모리 토와코의 좁고 아늑한 세계에 호스트들이 난입한다! 
생활비를 벌기 위해 호스트가 된 오빠의 동료들이 자꾸만 자꾸만 집으로 찾아와 묵고 가는 것! 
하지만 아름다운 반짝반짝 남자들이 토와코는 불편하기만 한데! 
토와코의 예측할 수 없는 앞날은 과연~?!','https://www.lezhin.com/ko/comic/youngujimyoung','https://ccdn.lezhin.com/v2/comics/923/images/tall.webp?updated=1787115573494&width=420','연재'),
('그들의 방주','이요·여름바람',array['로맨스']::text[],'체크무늬, 빵 굽는 냄새, 고양이, 토끼, 햇살, 비오는 오후, 책장을 넘기는 소리, 오래된 서점 등의 따뜻한 키워드를 지닌 학원순정만화. 동물로 변하는 남매와 알게 된 배구 선수 지나의 사랑 이야기에 이어, 동물로 변하는 가족의 옴니버스식 이야기 구성으로 짧게 이어지는 가족관계를 보여주는 형식. 가벼운 시트콤, 또는 가벼운 웹드라마 형식으로 어울리는 다정','https://www.lezhin.com/ko/comic/their_ark','https://ccdn.lezhin.com/v2/comics/6251940268605440/images/tall.webp?updated=1722555232116&width=420','완결'),
('다카스기가의 도시락','야나하라 노조미',array['드라마']::text[],'어느 날 갑자기 시작된 서른 살 오빠와 중1 사촌 여동생의 동거생활♥ 두 사람이 엮어가는 상큼하고 가슴 뭉클한 도시락 이야기! 사고로 부모님을 잃고 혼자 생활하고 있는 다카스기 하루미는 박사 학위는 받았지만 취직도 못한 채 대학 연구실에서 앞이 보이지 않는 나날을 보낸다. 그러던 중 어린 시절 남매처럼 지내던 고모 미야가 세상을 떠나면서 얼굴 한 번 보지 ','https://www.lezhin.com/ko/comic/takasugi','https://ccdn.lezhin.com/v2/comics/133/images/tall.webp?updated=1464325297319&width=420','연재'),
('짐승남과 동거','세리자와 유키코·지티이엔티',array['드라마']::text[],'이제 막 고등학교에 입학을 앞 둔 아미는 급작스럽게 아빠를 잃었다. 달리 갈 곳이 없어 두려워 하고 있는 그 때 태어나서 처음 보는 삼촌이라는 사람이 함께 살자고 말했다. 돌연 나타난 삼촌은 바로 스캔들 배우 NO.1의 토쿠마루 키요라?','https://www.lezhin.com/ko/comic/beastman','https://ccdn.lezhin.com/v2/comics/5817327793209344/images/tall.webp?updated=1787122814922&width=420','완결'),
('부딪치다','지완·이코믹스',array['로맨스']::text[],'[15세 이상 열람 권장합니다.]

*외전 (19세 이용가)은 레진 플러스에서 &lt;부딪치다 외전&gt;으로 감상하실 수 있습니다. 

특별한 유전자를 지닌 조이와 그녀를 지키는 톱클래스 초능력자 무원의 운명적인 사랑 이야기

보이지 않는 배후에서 세계 정세를 조종하는 초능력자들의 은밀한 전쟁이 계속되고, 소녀 조이는 자신도 몰랐던 유전적 형질 때문에 초','https://www.lezhin.com/ko/comic/collision','https://ccdn.lezhin.com/v2/comics/4705966514503680/images/tall.webp?updated=1615541601544&width=420','완결'),
('내 마음의 위험한 녀석','사쿠라이 노리오·소미미디어·S코믹스',array['드라마']::text[],'2020 차세대 만화 대상 1위!!! (웹만화 부문)
교내 계급에서 정점에 위치한 미소녀, 야마다 안나를 괴롭히는 망상에 빠져 음흉한 미소를 짓고 있는 중2병 아웃사이더, 이치카와 쿄타로. 하지만 미소녀답지 않은 야마다의 의외의 모습을 알게 된 뒤, 본의 아니게 쿄타로의 마음은 혼란스러워져 가는데?!','https://www.lezhin.com/ko/comic/dangerous_fellow','https://ccdn.lezhin.com/v2/comics/4805507536191488/images/tall.webp?updated=1615776034467&width=420','연재'),
('왕게임','카나자와 노부아키·렌다 히토리',array['스릴러']::text[],'시리즈 누계 530만부를 돌파한 최고의 화제작! 초인기 호러 서바이벌 「왕 게임」을 만화로 읽는다!! ‘왕’에게서 온 수수께끼 같은 명령 1학년 B반 32명의 목숨을 건 ''게임''이 시작된다!! 어느 날 노부아키와 반 친구들은 스스로가 ''왕''이라는 자로부터 알 수 없는 명령이 적힌 문자를 받는다. 처음에는 단순한 명령이었으나 이내 점차 무리한 요구가 이어지고','https://www.lezhin.com/ko/comic/kingsgame','https://ccdn.lezhin.com/v2/comics/132/images/tall.webp?updated=1626066540154&width=420','완결'),
('저 아이에게 키스와 흰 백합꽃을','칸노·넥스큐브',array['로맨스']::text[],'품행 방정, 성적 우수. 누구나 알아주는 모범 수재 소녀 시라미네 아야카는
중등부에서 고등부에 진학하며 ''지금까지와 같은'' 우수한 자신의 모습을
유지할 수 있을 것이라 생각했다.
그러나 천재적인 재능으로 모든 일에 1등을 거두는
쿠로사와 유리네와의 만남으로 아야카의 세계는 일변하기 시작하는데?!
사촌과 선배, 동급생과 후배, 그리고 교사까지….
소녀들의 달','https://www.lezhin.com/ko/comic/kisstolily','https://ccdn.lezhin.com/v2/comics/6552357032165376/images/tall.webp?updated=1603342260973&width=420','완결'),
('흑집사','토보소 야나·학산',array['판타지']::text[],'영국의 명문 귀족 팬텀하이브 가(家)의 집사 세바스찬. 그는 지식, 교양, 품위, 요리, 무술… 모든 면에서 완벽하다. 자기밖에 모르는 12세 주인을 상대로 칠흑 같은 연미복을 하늘하늘 나부낀다. 세계에서 가장 홍차와 어울리는 집사만화를 당신에게….','https://www.lezhin.com/ko/comic/black_butler','https://ccdn.lezhin.com/v2/comics/6649704469364736/images/tall.webp?updated=1764238972117&width=420','연재'),
('34세 무직씨','이케다 타카시',array['일상']::text[],'“여러모로 생각하는 바가 있어서, 1년간 아무것도 하지 않기로 정했습니다.” 서른네 살. 보통이라면 한창 일할 나이인 30대 중반입니다. 그런데 여기, 그 인생의 전성기라 할 수 있는 시기에 여러모로 생각하는 바가 있어서 “1년 동안 아무것도 하지 않기”로 한 여성이 있습니다. 그렇게 시작된 서른네 살의 무직생활. 새 청소기에 일희일비도 하고, 밤거리에 귀','https://www.lezhin.com/ko/comic/34mujik','https://ccdn.lezhin.com/v2/comics/804/images/tall.webp?updated=1624417626865&width=420','완결'),
('언니의 취향','장진·콤·키다리스튜디오',array['로맨스']::text[],'짝사랑 전문 방하정! 매일 하정을 심쿵하게 만드는 그녀는 누구? 아리송한 언니의 취향에 어른의 취향 한스푼까지. 꽁냥꽁냥 치명(?) 백합 로맨스!','https://www.lezhin.com/ko/comic/sisters_taste','https://ccdn.lezhin.com/v2/comics/6241627023933440/images/tall.webp?updated=1627355864370&width=420','완결'),
('이번 생은 악녀로 살겠습니다','AKE Culture·엠스토리허브',array['로맨스']::text[],'[휴재 중]계모와 새언니의 계략으로 어머니를 잃고 처절하게 고통받다 죽은 그녀, 차수현.  그녀에게 주어진 두 번째 삶.  "이번 생은 악녀로 살겠어!"  차수현의 통쾌한 복수가 시작된다.','https://www.lezhin.com/ko/comic/antagonist_this_life','https://ccdn.lezhin.com/v2/comics/5250859200217088/images/tall.webp?updated=1725960362856&width=420','연재'),
('새디스틱 뷰티 [개정판]','우연희·이금산·키다리스튜디오',array['로맨스']::text[],'[해당 작품은 &lt;새디스틱 뷰티&gt; 성인 버전의 일부 장면을 수정한 개정판입니다.]
 
대학생 우해솔은 어느 날 갑자기 집으로 쳐들어온 룸메이트의 섹시한 누나 천두나와 함께 살게 된 이후 두근거림이 멈출 날이 없다. 우연한 실수로 누나에게 무서운 벌을 받게 되지만, 오히려 야릇한 기분에 빠진 해솔은 더욱 그녀의 괴롭힘을 바라게 되는데... 한편, 대','https://www.lezhin.com/ko/comic/sadi_bt','https://ccdn.lezhin.com/v2/comics/4623042229370880/images/tall.webp?updated=1700479844672&width=420','완결'),
('생존률 극악 엑스트라에 빙의했다','HUAI SHI·SFACG·키다리스튜디오',array['판타지']::text[],'17살에 이세계 귀족 도련님에게 빙의해버렸다. 다른 빙의자들처럼 인생 대역전이 될 거라 생각했지만 내가 빙의한 몸, 가진 게 아무것도 없다. 암살자를 보내는 큰 형님과 작위를 줄 생각이 추호도 없는 공작 아버지뿐. 이렇게 된 거 망한 영지나 하나 받아서 몸이라도 편하게 사는 게 낫겠어!','https://www.lezhin.com/ko/comic/extra_possession','https://ccdn.lezhin.com/v2/comics/6572233128738816/images/tall.webp?updated=1680082100481&width=420','완결'),
('하빈저','밸리언트 (Valiant)',array['액션']::text[],'초능력을 보유한 십대 소년 피터 스탄첵은 위험한 길을 걷고 있다. 피터는 관리당국의 눈을 피해 전국을 헤매며 필사적인 도주의 나날을 보내고 있다. 그러던 어느 날, 자신이 인류의 역사를 송두리째 바꿀 만큼 강력한 싸이어닉 힘을 보유한 “하빈저”임을 깨닫게 된다. 하지만 피터의 위험한 도주를 주시하는 자들이 있었으니...','https://www.lezhin.com/ko/comic/harbinger','https://ccdn.lezhin.com/v2/comics/6307532625412096/images/tall.webp?updated=1520223537532&width=420','완결'),
('호리미야','하기와라 다이스케·HERO·OOZ',array['드라마']::text[],'인터넷 화제작, 만화의 만화화로 등장!!
겉으로는 화려해 보이지만 사실은 수수하고 가정적인 여고생 호리 양과, 학교에서는 음침 안경 오덕 같지만 사실은 현란한 피어스의 미형 소년 미야무라 군. 정반대 같으면서도 닮은 듯한 두 사람이 우연히 만나면…?! 달콤하면서 가슴이 뭉클해지는, 아련하고도 짜릿한 스쿨라이프!
ⓒHERO・OOZ
ⓒDaisuke Hagiwa','https://www.lezhin.com/ko/comic/hori_miya','https://ccdn.lezhin.com/v2/comics/5612189345644544/images/tall.webp?updated=1764235204218&width=420','완결'),
('쇼트 서킷','이운',array['스릴러']::text[],'남친과 다툰 날의 지친 퇴근길. 어릴적 날 많이 좋아했던 동창 동수를 우연히 마주쳤다. 새록새록 떠오르는 추억, 오랜만이어도 살가운 대화. 여전히 날 기억해주는 것은 고마웠지만... 이상하다. 이 남자, 나에 대해 너무 많은 것을 알고 있어.','https://www.lezhin.com/ko/comic/short_circuit','https://ccdn.lezhin.com/v2/comics/5137269393981440/images/tall.webp?updated=1737440083654&width=420','완결'),
('언밸런스X2 AS','임달영·이혜성·디투컴퍼니',array['드라마']::text[],'싸움만 잘하고 철없는 영화감독 지망생 명진호, 냉정하고 차가운 성격이지만 남몰래 마음 여린 수학교사 나혜영. 두 사람의 얽히고 설키는 두근두근 사제지간 러브 코미디의 결정판.
미국에서 서로의 마음을 확인한 혜영과 진호는, 연상의 여교사와 연하의 제자사이의 위험한 사랑의 길을 걷기로 결심하고 한국으로 돌아온다. 여름이 지나가고 2학기가 되어 서로의 마음을 숨','https://www.lezhin.com/ko/comic/unbalance_as','https://ccdn.lezhin.com/v2/comics/5054309770330112/images/tall.webp?updated=1573551253836&width=420','완결'),
('미완의 계절 [개정판]','임수영·미스터블루',array['로맨스']::text[],'[해당 작품은 &lt;미완의 계절&gt; 성인 버전의 일부 장면을 수정한 15세 개정판입니다. 이용에 참고 부탁드립니다.]
갑작스레 사라졌던 소꿉친구 임희락과 대학에서 재회한 김동하. 게이인 희락은 오랫동안 동하를 짝사랑하면서도 그 마음을 감춰왔다. 두 사람의 거리가 좀처럼 좁혀지지 않는 가운데, 동하는 희락에 대한 자신의 감정이 단순한 우정이 아니게 되었','https://www.lezhin.com/ko/comic/unfinished_season_re','https://ccdn.lezhin.com/v2/comics/4786239830556672/images/tall.webp?updated=1697605926888&width=420','완결'),
('선생님은 그런 걸 가르친 적 없다','네리마 짐·루트미디어·블랙스완',array['로맨스']::text[],'서른살의 이혼한 고교 교사 츠지 마사키. 그는 요즘 곤란한 일을 겪고 있다. 그건 바로 전철에서 치한에게 당하기 시작한 것!
뭔가 잘못된 것이라고 생각했는데 앞을 만져오는 그 손은 점점 대담해지고! 그리고 들려오는...''당신, 귀엽네요.'' 라는 말...
치한이 대체 누구인지 궁금하다.테스트 채점 중, 츠지는 언제나 우수했던 학생이 백지 답안을 낸 것에 대해','https://www.lezhin.com/ko/comic/dont_wanna_lie','https://ccdn.lezhin.com/v2/comics/5711450529595392/images/tall.webp?updated=1639458688917&width=420','연재'),
('살리에르 앤 모차르트','김수오·기밥·키다리스튜디오',array['로맨스']::text[],'&lt;천재가 되고 싶었던 소녀, 천재를 만나다&gt;

…한 소녀가 있다.
인생의 꿈이라
생각한 수영,
죽을만큼 노력해도 재능을 이길 수 없었다.
 
또다른 소녀가 있다.
인생이 너무 재미가
없어서 시작한 수영.
천재적인 재능을
보이지만,
수영은 한때의 장난질
그 이상 이하도 아니었다.
 
이렇듯 서로 다른
그녀들이 만났다.
그것도 최악의 인연으로, 물과','https://www.lezhin.com/ko/comic/salieri_and_mozart','https://ccdn.lezhin.com/v2/comics/6531306575429632/images/tall.webp?updated=1692576085174&width=420','완결'),
('위험한 BL퀘스트~DistopiA~','이치노미야 시한·루트미디어·블랙스완',array['로맨스']::text[],'나를 바꾼것은 만들어진 이 미완성인 세계였다. 
풍족한 가정에서 자라 원하는 것은 무엇이든 자신의 것으로 가질 수 있는 훈남 대학생인 하루에게는 한 가지 일에 3시간 이상 흥미를 가질 수 없는 결점이 있었다.
 어느 날, 게임회사에 다니는 형의 부탁으로 체험형 연애 시뮬레이션 게임에 로그인하는데 평범한 남자와의 연애 퀘스트가 생겨 버리고!?','https://www.lezhin.com/ko/comic/blquest','https://ccdn.lezhin.com/v2/comics/6567639983325184/images/tall.webp?updated=1465884458887&width=420','완결'),
('도시괴담','레알스튜디오·레알코믹스',array['스릴러']::text[],'B시 K읍에서 기괴하고 엽기적인 살인 사건이 발생한다. 일명 &lt;마네킹인간&gt;, 부셔진 마네킹의 팔다리를 이어 붙여 놓은 외형에 눈을 비롯한 내부 장기를 모두 도려내고 종이로 가득 채운 엽기살인. 비슷한 시기에 중학생들 사이에 &lt;마네킹인간&gt;에 관한 도시괴담이 퍼져 간다.','https://www.lezhin.com/ko/comic/urban_legend','https://ccdn.lezhin.com/v2/comics/5214695818657792/images/tall.webp?updated=1545966000847&width=420','완결'),
('이론과 실제','김모래·개창·두팔·위즈덤하우스',array['로맨스']::text[],'“지금 좀, 키스 타이밍 같죠?”
“처음 만난 사람이랑은 안 해요.”

장난스러운 스물네 살, 성현.
서른 살, 연애 칼럼리스트 태경.

“저는 처음 만난 사람이랑 더한 것도 하는데. 그럼 서로 절충해서 뽀뽀까지만?”

이론만 빠삭한 남자들의 ‘진짜’ 연애가 시작된다.','https://www.lezhin.com/ko/comic/theory_and_practice','https://ccdn.lezhin.com/v2/comics/6060922939703296/images/tall.webp?updated=1681894918493&width=420','완결'),
('왕녀님은 파혼하고 싶어','Mii·키다리스튜디오',array['로맨스']::text[],'북부의 지배자 에녹 호크. 그의 생일 연회를 맞아 수많은 귀족 영애들이 그와 약혼할 꿈을 품고 북부 에클라 성으로 향한다. 그러나 그를 찾은 첫 번째 손님은 정반대의 목적을 가지고 있었다. "나, 제니스의 왕녀 릴리에 드 제니스! 내가 여기 온 건 당신과 파혼하기 위해서예요!"','https://www.lezhin.com/ko/comic/princess_break_marriage','https://ccdn.lezhin.com/v2/comics/6494986018816000/images/tall.webp?updated=1668693016250&width=420','완결'),
('하는 중전 [개정판]','초야·산홍',array['로맨스']::text[],'[해당 작품은 &lt;하는 중전&gt; 성인 버전의 일부 장면을 수정한 15세 개정판입니다. 이용에 참고 부탁드립니다.]
단정한 용모, 뛰어난 학문. 그야말로 ''야하''는 으뜸가는 중전감이었다. 딱 한 가지, 잠자리를 빼곤.
첫날밤 이후 그녀를 멀리하는 왕. 게다가 미모의 궁녀 서경이 회임했다는 소식까지 들려온다.
결국 야하는 이 위기를 극복하기 위해  소문','https://www.lezhin.com/ko/comic/ha_is_the_queen_15','https://ccdn.lezhin.com/v2/comics/7011732964492487/images/tall.webp?updated=1761295208319&width=420','연재'),
('고양이보다 사랑스러워','히로토 쿠지라다·지티이엔티·허니B',array['로맨스']::text[],'오- 나의 신데렐라! 오늘도 매우 귀엽네!! 

무서운 외모 때문에 오해를 받고 있는 타치바나. 
하지만 사실은 매주 고양이 카페에 다니는 귀여운 취미가 있다. 

그걸 알고 있는 건 2명의 친구 뿐이지만, 그래도 괜찮은 학교 생활을 하는 중에 
2년 연속 학생회장을 하는 인기만점 타카죠에게 고백을 받았다?! 
ⓒHiroto Kujirada/JULIAN P','https://www.lezhin.com/ko/comic/lovely_than_kitty','https://ccdn.lezhin.com/v2/comics/6305805977255936/images/tall.webp?updated=1547541641284&width=420','연재'),
('아재미소녀 춘사미!','나루모',array['드라마']::text[],'작고 부드러우며 귀여운 천사표 미소녀 춘사미.
하지만 그녀는 학교에선 낯을 가려 조용히 있느라 티가 안 나지만...
사실 내용물은 가정환경 탓에 뇌속이 완전히 40대 아재와 동기화된 ''아재미''소녀인 것이다!    

그녀의 본질을 아는 유일한 소꿉친구 장네모는 춘사미를 평범한 여자아이로 만들고자 하나,
상식적인 평범남 장네모에게 있어 아재개그와 성희롱이 섞','https://www.lezhin.com/ko/comic/sami','https://ccdn.lezhin.com/v2/comics/5309175195435008/images/tall.webp?updated=1761618810873&width=420','완결'),
('유레카','손희준·김윤경',array['액션']::text[],'열쇠쟁탈전과는 별개로 이루어지는 슬레이안과의 싸움!
NPC를 지키며 머더러와 싸우기에도 벅찬 로토 일행에 대한 위협이 점점 더 커지는데…','https://www.lezhin.com/ko/comic/yureka','https://ccdn.lezhin.com/v2/comics/6572593787699200/images/tall.webp?updated=1548927745672&width=420','완결'),
('도사님이 오셨습니다','야오야오·비브로스팀',array['로맨스']::text[],'집돌이 만화가 VS 섹시 차도남으로 변신하는 귀염둥이 꼬마 퇴마사!
두 사람 사이에서 벌어지는 재미있고 달달한 이야기!
거절이라고는 모르는 우유부단 집돌이 만화가와
꼬마에서 차도남으로 시도 때도 없이 변신하는 신비한 퇴마사!
만화가 집에 붙어사는 요괴를 물리치러 온 것 일까?
어쩌면 그렇게 단순한 것이 아닐지도…','https://www.lezhin.com/ko/comic/dosanim_come','https://ccdn.lezhin.com/v2/comics/6621586567331840/images/tall.webp?updated=1537408953888&width=420','완결'),
('그녀의 히어로 [제1회 레진만화왕전 수상작]','환상백수·이글이',array['판타지']::text[],'과거를 바꾸기 위해 미래에서 온 괴인 강태구. 과거를 바꾸기 위해 한 여자를 제거해야 한다. 제거 대상의 이름은 정은지. 히어로 지망생인 은지에게 접근하기 위해 태구 자신도 히어로 지망생 행세를 하게 되는데. 과연 태구는 은지를 제거하고 미래를 바꿀 수 있을 것인가?','https://www.lezhin.com/ko/comic/ahertofhers','https://ccdn.lezhin.com/v2/comics/5693002903453696/images/tall.webp?updated=1512022705583&width=420','연재'),
('오모와 위르시스 [제1회 레진만화왕전 수상작]','미테디',array['판타지']::text[],'늑대의 이름을 가진 소년과, 인간의 이름을 가진 늑대의 여행기.','https://www.lezhin.com/ko/comic/homoandursus','https://ccdn.lezhin.com/v2/comics/6490440153169920/images/tall.webp?updated=1485007700231&width=420','연재'),
('원룸 조교님 [개정판]','지붕·키다리스튜디오',array['로맨스']::text[],'2학년으로 복학한 우윤은 묘한 매력의 행정실 조교님 진형을 만나고, 냅다 고백한 결과 원룸에서 동거를 시작한다! 동거 일주일이 되던 날, 우윤의 농도 깊은 키스에 스킨십에 대한 남다른 환상이 있다며 기다려 달라는 진형. 대체 그 환상이 뭔데!? 그들은 모든 환상과 망상을 딛고 무사히 첫날밤을 보낼 수 있을까? “전 그냥 형을 더 알고 싶어요”','https://www.lezhin.com/ko/comic/jogyonim_all','https://ccdn.lezhin.com/v2/comics/7011781499120795/images/tall.webp?updated=1782804264502&width=420','연재'),
('남자 화장실에서 썸탄 이야기','미즈 아사토',array['일상']::text[],'후미진 학교 화장실에서, 그것도 남자 화장실에서
예기치 않은 썸이?!
「전자상가의 서점 아가씨」 미즈 아사토의 기발한 단편집!!

교사에서 떨어진 곳에 있는 비밀 화장실.
거기서 모르는 남자애에게 볼일 보는 걸 들킨다면 당신은……?
표제작 ‘남자 화장실에서 썸탄 이야기’를 비롯하여
미즈 아사토 특유의 테이스트가 담긴 일상 코미디 여섯 편을 담은 포복절도 단','https://www.lezhin.com/ko/comic/mantoiletsome','https://ccdn.lezhin.com/v2/comics/4979771950235648/images/tall.webp?updated=1438233832445&width=420','연재'),
('내 나이 서른','s-monkey·재담미디어',array['로맨스']::text[],'준수한 외모에 커리어는 승승장구, 그러나 서른에 접어들며 날이 갈수록 심해지는 어머니의 선자리 요구에 지칠 대로 지친 추민우. 그가 마지 못해 나간 약속 장소에는 맞선 상대가 아닌 그녀의 남동생이 와 있었다. 추민우는 비록 남자를 좋아하지만 그의 거침없는 애정 표현에 몹시 당황하는데. "이거 완전 스토커 아니야?!" 부모님의 결혼 압박 속에서, 추민우는 과','https://www.lezhin.com/ko/comic/30_years_old','https://ccdn.lezhin.com/v2/comics/4890161187192832/images/tall.webp?updated=1656507837791&width=420','완결'),
('너는 아니라고 했지만','만조경·PP·위즈덤하우스',array['로맨스']::text[],'대학시절 짝사랑했던 주은과 우연히 마주친 연서. "선배, 그때 내 부케 왜 안 받았어요?" 당시엔 전혀 마음을 모르는 것 같던 주은이 다 알고 있던 것처럼 굴자 연서는 혼란스럽다. 그리고 자신이 여전히 주은을 사랑한다는 사실을 깨닫는데..... "팀장님이 오주은씨랑 뭘 할 수 있는데요?" 도발하는 직장 동료 상아와 충동적으로 밤을 보내게 되는 연서. 셋의 ','https://www.lezhin.com/ko/comic/you_said_no','https://ccdn.lezhin.com/v2/comics/5424474569900032/images/tall.webp?updated=1681893733978&width=420','완결'),
('남성복 매장의 공주님','용태·도서출판황매·황매북스',array['로맨스']::text[],'“널 조금 좋아해....” 이 세상의 모든 커플들처럼 그들의 첫사랑도 그렇게 시작된다. 여장을 좋아하는 장준, 여장을 하면 그 누구보다 아름답다. 하지만 그의 이런 취향은 타인들에게 비웃음이나 뒷담화의 대상이 된다. 그를 잘 애해해준다고 생각한 여자친구 가혜 마저 그에게서 떠나간다. 여자친구에게 이별을 통보 받은 그 날, 장준에게 마네킹이 말을 걸어온다. ','https://www.lezhin.com/ko/comic/manshop_princess','https://ccdn.lezhin.com/v2/comics/6080880274178048/images/tall.webp?updated=1643344297471&width=420','완결'),
('속삭임','이케다 타카시·넥스큐브·미즈',array['로맨스']::text[],'[일본 TV 도쿄 애니메이션 방영작-사사메키코토] 
"왜..여고생끼리는 사랑하면 안 되는 거지?"
우등생으로 유명한 여고생 스미카에게는 남에게 말할 수 없는 ''은밀한'' 비밀이 있다
그것은 동급생 우시오를 진심으로 ''사랑''한다는 것 
우시오도 ''여자를 좋아하는'' 아이지만 스미카의 마음을 전혀 눈치채지 못하는데...
살짝 특이한 연애관을 가진 여고생들의 달콤쌉','https://www.lezhin.com/ko/comic/sasameki','https://ccdn.lezhin.com/v2/comics/521/images/tall.webp?updated=1478844144398&width=420','연재'),
('빨간 입술 하얀 입김 핑크색 꽃잎','모리나가 밀크',array['로맨스']::text[],'모리나가 미루쿠 백합만화의 원점! 백합만화 입문작으로도 더할 나위 없는 소녀들의 첫사랑! 「빨간 입술 하얀 입김 핑크색 꽃잎」!! 고등학교에 진학하면서 서로의 마음을 알게 되고, 더 나아가 둘도 없는 사이가 된 소꿉친구 나나와 히토미. 이 둘을 중심으로, 소녀와 소녀 사이의 아련한 연모를 그린 걸즈 러브 코믹 옴니버스──','https://www.lezhin.com/ko/comic/redlip','https://ccdn.lezhin.com/v2/comics/888/images/tall.webp?updated=1677414527400&width=420','연재'),
('그대 마음 한 스푼','JB·STEM·서경·이코믹스',array['로맨스']::text[],'사랑엔 직진밖에 모르는 재벌 2세와 귀여운 거짓말쟁이(?) 신입 비서의 비밀 사내연애  사랑 때문에 명문대도 포기했지만 상처만 남은 이별 후 늦깎이 취준생이 된 연주. 어렵게 대기업 비서직에 합격했지만 직속 상사가 재벌 2세 전무이사이자 고교 동창인 재현이다. 조각 같은 외모, 까칠한 성격 탓에 사내에서 ‘존잘씨’로 알려진 재현.  이런저런 사건 사고로 민','https://www.lezhin.com/ko/comic/spoonful_of_your_heart','https://ccdn.lezhin.com/v2/comics/6245541874302976/images/tall.webp?updated=1722911754500&width=420','완결'),
('30살까지 동정이면 마법사가 될 수 있대 [웹툰판]','토요타 유우·학산문화사',array['로맨스']::text[],'[본 작품은 &lt;30살까지 동정이면 마법사가 될 수 있대&gt; 작품을 스크롤 웹툰으로 재편집한 상품입니다. 이용에 참고 부탁드립니다.]
서른 살 동정, 꽃미남 동기의 연심이 마법 때문에 훤히 보여서 난감합니다―.
서른 살이 되도록 동정인 탓에, 
''접촉한 사람의 마음을 읽을 수 있는'' 마법을 쓸 수 있게 된 아다치. 
하지만 그는 이 쓸데없는 마법의 ','https://www.lezhin.com/ko/comic/i_can_hear_you_15','https://ccdn.lezhin.com/v2/comics/6699227135934464/images/tall.webp?updated=1764233933880&width=420','연재'),
('봄을 기다리는 우리들','아나신·학산',array['일상']::text[],'「진정한 친구를 바랐을뿐인데….」 
고등학교에서야말로 아웃사이더를 탈출하겠다는 결의에 차 있던 미츠키. 
하지만 갑자기 만나게 된 농구부 꽃미남 사천왕에게 휘둘리는 바람에, 새로운 생활은 생각지도 못한 방향으로…?! 
꽃미남 네 명과의 엉망진창 청춘 DAYS가 시작된다?!!','https://www.lezhin.com/ko/comic/us_waiting_for_spring','https://ccdn.lezhin.com/v2/comics/4653266277367808/images/tall.webp?updated=1764235145996&width=420','완결'),
('굿바이 악마','백화(百花)·자목·키다리스튜디오',array['로맨스']::text[],'살아남기 위해서 악마와 계약 결혼을 결심한 여자!

문다미는 희귀 혈액형을 가진 고아로, 다정한 양부모와 동생과 함께 행복하게 살고 있었다. 하지만 다미의 혈액과 장기를 노리는 외할아버지 손 회장의 음모에 의해 아버지를 잃었고 자신의 생명도 위기에 처한다. 순전히 살아남기 위해 악마 같은 남자 강태성의 손을 잡고 그와 위장결혼을 한 다미는 손 회장이 숨을 ','https://www.lezhin.com/ko/comic/goodbye_devil','https://ccdn.lezhin.com/v2/comics/5000486878511104/images/tall.webp?updated=1691991136427&width=420','완결'),
('다녀왔어, 어서 와 -빛나는 나날-','이치카와 이치·넥스큐브·볼레로',array['로맨스']::text[],'전업주부인 마사키, 샐러리맨 남편 히로무, 그리고 두 명의 사랑스러운 아이들과 함께 하는 빛나는 나날의 이야기.
히카리의 동생 히나타가 태어나면서 한층 더 시끌벅적해진 후지요시네 집안. 이따금씩 불안하고 슬플 때도 있지만, 마사키와 히로무는 서로에 대한 사랑과 두 사람을 지지해주는 많은 사람들의 마음으로 행복한 일상을 채워나간다.
보기만 해도 따뜻해지는 후','https://www.lezhin.com/ko/comic/shiny_days','https://ccdn.lezhin.com/v2/comics/5104393664462848/images/tall.webp?updated=1768799381374&width=420','완결'),
('사립갱생고교','최해웅',array['액션']::text[],'다양한 배경을 가진 열혈청춘들의 집합소사립 갱생고교! 
주먹이 친해지면 그들만의 공감대가 눈뜨기 시작한다!!','https://www.lezhin.com/ko/comic/independent_highschool','https://ccdn.lezhin.com/v2/comics/5074989975339008/images/tall.webp?updated=1474618552663&width=420','완결'),
('키스보다 맛있어','아라이 미호코',array['로맨스']::text[],'흐트러진 교복, 그리고 그 옆에는 쓰고 버린 ㅋㄷ이!! Noooooooooo!! 나 설마, 누구하고 해버린 거야?! 아무도 없는 강의실에서 눈을 뜬 평범한 여고생 아미.
흐릿해진 기억을 더듬으니, 달아오른 내 몸을 바라보던 남자의 모습이 떠오른다.그리고 그의 허리 부근에 있던 낯익은 흉터.그것은 다름아닌, 아미의 소꿉친구 세쌍둥이 중 누군가에게 있었던 것!','https://www.lezhin.com/ko/comic/kiss_yori','https://ccdn.lezhin.com/v2/comics/130/images/tall.webp?updated=1677469259335&width=420','완결'),
('아무런 말도 없이','아니영·투니드엔터테인먼트·투니드',array['로맨스']::text[],'평범한 고등학생 지수에게 어느 날 마음씨가 찾아왔다.','https://www.lezhin.com/ko/comic/without_a_word','https://ccdn.lezhin.com/v2/comics/6598289101225984/images/tall.webp?updated=1571308042922&width=420','완결'),
('절대 BL이 되는 세계 VS 절대 BL이 되고 싶지 않은 남자','콘키치·학산문화사',array['로맨스']::text[],'자신이 BL 만화 속 등장인물이라는 사실을 눈치챈 주인공. 
그는 속속 접근해오는 미남들과의 만남을 회피하기 위해,  
대량의 BL 만화를 탐독,  
연애로 발전할 법한 시추에이션 등의 지식을 습득한다. 
그가 몸에 익힌 회피능력은 지금 무적에 가깝지만,  
이곳은 ''BL 세계''….속속 등장하는 새로운 시추에이션으로 
''BL 세계''의 연애 플래그가 주인공을','https://www.lezhin.com/ko/comic/no_more_bl','https://ccdn.lezhin.com/v2/comics/6194146671132672/images/tall.webp?updated=1764294515442&width=420','연재'),
('파운-바다를 삼키다','회상·묵묵·대원씨아이',array['로맨스']::text[],'미적지근하고 무기력한 성격을 가진 신입 경찰 오현우.
엄격한 상관인 차민재의 괴롭힘에도 눈 하나 깜짝하지 않고, 
제때 월급이나 타면 그만인 인생을 살고 있다.

사실 현우는 과거에 경찰 신분을 숨기고 마약 밀매 조직에 오랜 세월 잠복하며 
두목들과 어깨를 나란히 하던 사이였고,
현우의 신분을 알게 된 밀매 조직은 한동안 잠잠하다가 
복수를 위해 움직이기 ','https://www.lezhin.com/ko/comic/swallow_the_sea','https://ccdn.lezhin.com/v2/comics/6280779530567680/images/tall.webp?updated=1714014172734&width=420','완결'),
('ACCA 13구 감찰과','오노 나츠메·넥스큐브',array['드라마']::text[],'오노 나츠메의 신작 드디어 한국 서비스 시작!
13구역으로 나누어진 세계에 존재하는 거대 통일 조직 ACCA(아카). ACCA 본부의 감찰과 부과장 진•오터스는 ''담배 동냥꾼 진''이라는 별명을 가진, 조직에서 가장 가난한 남자이다. 그런 진에게 일어나는 이상 현상, 수수께끼의 그림자…. 세계의 음모가 진을 끌어들이기 위해 움직이기 시작한다!! 형식에 구애 ','https://www.lezhin.com/ko/comic/acca','https://ccdn.lezhin.com/v2/comics/799/images/tall.webp?updated=1556080257101&width=420','완결'),
('바르도의 궁(일반판)','바밀씨·zaru·대원씨아이',array['로맨스']::text[],'[해당 작품은 &lt;바르도의 궁&gt; 성인 버전의 일부 장면을 수정한 15세 개정판입니다. 이용에 참고 부탁드립니다.] 
죽어서도, 다시 태어나도… 
너는 결코 나를 떠나지 못한다. 

집착과 광기에 휩싸인 황제를 받아들일 수 없어, 스스로 목숨을 끊었다.
그런데 백여 년의 시간이 흐르고… 
운명인 듯, 운명의 장난인 듯 다시 태어나 버렸다. 
그것도 ','https://www.lezhin.com/ko/comic/palace_of_bardo_rd','https://ccdn.lezhin.com/v2/comics/4910139452751872/images/tall.webp?updated=1607915270545&width=420','완결'),
('샤라쿠 스캔들','안전모',array['스릴러']::text[],'일본 야쿠자 두목의 별장에서 그림 하나가 도난 당한다. 도둑은 결국 꼬리를 밟혀 죽임을 당하지만 그림은 이미 다른 곳으로 빼돌려진 후였다. 그리고 그 그림은 이후 벌어지는 사건의 발단이 되는데… 그림을 쫓는 자와 그림의 진실을 파헤치려는 자, 대체 무슨 그림이기에?!','https://www.lezhin.com/ko/comic/sharaku','https://ccdn.lezhin.com/v2/comics/6639841667448832/images/tall.webp?updated=1737601953251&width=420','완결'),
('후지야마는 사춘기','오지로 마코토',array['로맨스']::text[],'키 181cm의 여자 배구부 에이스 후지야마 마키오(중학교 2학년). 여자아이들이 옷 갈아입는 것을 훔쳐보다 걸린 것을 계기(?)로 소꿉친구이자 동급생인 칸바 유이치와 사귀게 되는데......?!싱그러운 감성이 가득! 남성 독자와 여성 독자를 위한 귀여운 사랑 이야기!!','https://www.lezhin.com/ko/comic/fujiyama','https://ccdn.lezhin.com/v2/comics/568/images/tall.webp?updated=1680599234765&width=420','완결'),
('전남편의 삼촌과 해피엔딩','크라운·키다리스튜디오',array['로맨스']::text[],'세상에서 가장 사랑했던 남자와 친자매처럼 끔찍하게 여겼던 동생에게 배신을 당하고
소중한 가족들을 하나씩 잃어가면서 생의 끈을 놓기 직전이었던 유진.

죽음의 문턱에 다다른 순간, 기적적으로 눈을 뜨게 되는데...
모든 비극의 시작이었던 과거 그 장소, 그 대화로 돌아왔다...?!

바보같았던 과거를 반복하지 않기 위한 유진의 새로운 삶이 시작된다.','https://www.lezhin.com/ko/comic/happyending_uncle','https://ccdn.lezhin.com/v2/comics/7011739949371269/images/tall.webp?updated=1775194445561&width=420','완결'),
('던전밥','쿠이 료코',array['드라마']::text[],'쿠이 료코 만화 『던전밥』제1권. 모험을 하면 배가 고프게 마련. 몬스터를 먹으며 대 미궁 ‘황금성’을 답파하라, 용사들이여! 먹방 던전 판타지 개막!! 슬라임, 미믹, 바실리스크, 그리고 드래곤!! 짓쳐드는 몬스터들을 먹고, 나아가라!!','https://www.lezhin.com/ko/comic/gourmet_at_the_dungeon','https://ccdn.lezhin.com/v2/comics/5741104081272832/images/tall.webp?updated=1722487902488&width=420','완결'),
('해온의 임자','운하임리히·호수',array['로맨스']::text[],'"빨아 봐."
"...뭐?"
학교의 찐따 임자경은 어느날 옥상에서 담배를 피우던 문제아 기해온을 만나게 된다.
느닷없이 담배를 들이밀며 빨아보라고 말하는 기해온.
그리고 그날의 사소한 접촉은 나비의 날갯짓이 되어 커다란 후폭풍을 불러오게 되는데...!

학교의 화려한 문제아 기해온. 찐따 중의 찐따 임자경.
정반대인 두 사람의 영혼이 뒤바뀌면서 생기는 발랄','https://www.lezhin.com/ko/comic/haeon_imja','https://ccdn.lezhin.com/v2/comics/6676914430476288/images/tall.webp?updated=1769063780477&width=420','완결'),
('이토록 완벽한 짝사랑','싹·북큐브네트웍스·북큐브',array['로맨스']::text[],'호연을 오랫동안 짝사랑해 온 선재는 같은 대학교에 편입하면서 같이 자취하게 된다. 완벽할 것 같았던 첫날은 다른 하우스메이트인 우진에게 호연을 좋아한단걸 들키면서 악몽처럼 시작하게 되는데…','https://www.lezhin.com/ko/comic/perfect_unrequited_love','https://ccdn.lezhin.com/v2/comics/5085634618851328/images/tall.webp?updated=1549935723126&width=420','완결'),
('내 친구는 잘생겼다','찬덕·NHN',array['로맨스']::text[],'세상 사람들은 외모가 빼어난 사람을 보며 이렇게 말한다.
''얼굴에서 빛이 난다''
물론 정말로 빛이 난다는 말은 아니지만… 나는 실제로 그런 놈을 하나 알고 있다.
그래. 내 친구는 너무 잘생겨서 얼굴에서 빛이 난다.','https://www.lezhin.com/ko/comic/handsome_friend','https://ccdn.lezhin.com/v2/comics/6104563487408128/images/tall.webp?updated=1683112601240&width=420','완결'),
('짱구아빠 노하라 히로시의 점심','우스이 요시토·츠카하라 요이치·AK커뮤니케이션즈·AK코믹',array['코미디']::text[],'명언제조기 짱구 아빠는 밥도 그냥 먹지 않는다?!
직장인의 점심 식사, 그것은 가족도 모르는 남자들만의 세계.
후타바 상사 영업 제2부 계장, 노하라 히로시는
오늘도 치열한 영업 끝에 꿀맛 같은 점심을 맛보기 위해 분투한다.
점심식사의 프로라 자칭하는 멋진 남자 노하라 히로시만의 점심식사법이란?','https://www.lezhin.com/ko/comic/lunch_for_daddy','https://ccdn.lezhin.com/v2/comics/6361630285496320/images/tall.webp?updated=1626068595726&width=420','연재'),
('반하다','왕기대·도선·키다리스튜디오',array['로맨스']::text[],'#왕기대_소설_웹툰화! 
기억하지 못하는 과거의 사랑 VS 현재의 가슴 뛰는 사랑. 
똘끼 충만 고교생 현한정과 츤데레 지어린, 
일편단심 난동경의 유쾌 달콤 짠내 나는 청춘 로맨스.','https://www.lezhin.com/ko/comic/fall_for','https://ccdn.lezhin.com/v2/comics/6717854587944960/images/tall.webp?updated=1720593426715&width=420','완결'),
('군도: 민란의 시대 외전','이영곤·고진호',array['액션']::text[],'뭉치면 백성, 흩어지면 도적! 지리산 추설의 신 거성 도치와 백성의 적 조윤의 잊을 수 없는 한판 승부. 한국영화의 흥행기록을 다시 쓴 영화 &lt;군도 : 민란의 시대&gt; 의 스페셜 웹툰.','https://www.lezhin.com/ko/comic/gundo','https://ccdn.lezhin.com/v2/comics/281/images/tall.webp?updated=1520223423871&width=420','완결'),
('망자카페','베르디',array['판타지']::text[],'영혼을 보는 소녀. 우연히 발견한 카페 레퀴엠에서 아르바이트를 시작한다. 죽은 자들만이 찾아오는 카페 레퀴엠에서 보는 죽은 자들의 사연.','https://www.lezhin.com/ko/comic/cafe_requiem','https://ccdn.lezhin.com/v2/comics/194/images/tall.webp?updated=1520223408559&width=420','완결'),
('너의 페로몬이 좋아 [연재]','JBG·memes·Yinluxing·재담미디어',array['로맨스']::text[],'외모, 집안, 어느 것 하나 빠지지 않던 베타 윤가람!
갑자기 오메가가 되었다...?!
계속되는 이상증세에 꼬여 드는 알파까지 빠르게 지쳐가는데...
이상하게 오윤 앞에서는 아무렇지 않다.
같은 알파인데, 오윤은 뭐가 다른 거지?
윤가람은 오메가의 삶에 적응할 수 있을까?','https://www.lezhin.com/ko/comic/i_like_your_pheromone','https://ccdn.lezhin.com/v2/comics/5425144005328896/images/tall.webp?updated=1774855598997&width=420','연재'),
('신입사원입니다','피비·대원씨아이',array['로맨스']::text[],'봄맞이 체육대회를 맞아 각 부서에서 인원들이 모여 장기자랑 준비를 하는 분주한 회사 분위기 속에서 신입인 열혈남아(?) 유진은 자신의 모든 열정을 쏟아 멋지게 행사를 준비하고자 하나 심드렁한 선배 둘의 눈치에 말 한마디 제대로 건네지 못한다. 그런 모습을 지켜보던 김도훈 과장은 체육대회에 휴가가 걸려있는 걸 알고 유진을 위해 나서주기 시작한다! 그렇게 둘 ','https://www.lezhin.com/ko/comic/kiss_combi','https://ccdn.lezhin.com/v2/comics/5895184174940160/images/tall.webp?updated=1528729206637&width=420','완결'),
('지독하게 끌어안고 지독하게 키스하고','이기하·대원씨아이',array['로맨스']::text[],'연애는 하지만 마음을 나누지 못하는 영언.
얼마 지나지 않아 시들해져 헤어져버리기를 반복하는 영언 앞에 한 학년 아래 문제아 연호가 나타난다.
어머니를 잃은 상처와 아버지에 대한 반항으로 엇나가있는 연호와의 만남은 소매치기에게 지갑을 빼앗기면서부터.
악연으로 시작된 만남은 운명처럼 둘을 엮어주지만 연호의 시끄러운 주변이 영언에게도 영향을 미치는데….','https://www.lezhin.com/ko/comic/hug_bitterly_kiss_bitterly','https://ccdn.lezhin.com/v2/comics/6009151540297728/images/tall.webp?updated=1571118498000&width=420','완결'),
('약사의 혼잣말','네코쿠라게·휴우가 나츠·학산문화사',array['드라마']::text[],'중세의 궁에서 허드렛일을 하던 소녀 마오마오.
유곽에서 약사 노릇을 하던 이 소녀가
황제의 후사들이 모두 단명했다는
소문을 듣는 것에서 이야기는 시작된다.
타고난 호기심과 지식욕에 휩쓸려,
그저 흥미로 그 사건의 원인을
조사하게 된 마오마오의 운명은…?

 

ⓒNatsu Hyuuga, Nekokurage, Itsuki Nanao/SQUARE ENIX CO','https://www.lezhin.com/ko/comic/pharmacists_monolog','https://ccdn.lezhin.com/v2/comics/5126241295335424/images/tall.webp?updated=1764313731925&width=420','연재'),
('황태자의 용으로 태어났다 [연재]','CO2·G-sand·재담미디어',array['로맨스']::text[],'장래 유망한 대학생인 나, 강찬영은 누군가에게 의문의 죽임을 당한 뒤 
&lt;황태자와 드래곤&gt;이라는 게임 속 인물로 환생했다. 
정확히 말하면 황태자에게 처치당할 운명인 보스, 
검은 드래곤 ''인페르노’로!
이제부터 내 목표는 운명을 바꾸는 거다. 그런데-

“황태자님, 이거 스토리랑 뭔가 다르지 않아요?”','https://www.lezhin.com/ko/comic/dragon_of_prince','https://ccdn.lezhin.com/v2/comics/5519470412627968/images/tall.webp?updated=1736214924899&width=420','연재'),
('그녀와 카메라와 그녀의 계절','츠키코',array['로맨스']::text[],'그녀에게, 그녀는 사랑을 느낀다.
고교 3학년이 된 봄, 미야마 아카리는 이렇다 할 것 없는 일상, 따분한 친구들과의 관계 속에서 마음 둘 곳을 찾지 못하고 있었다.
그러던 어느 날, 2안 반사 카메라를 든 쿨한 미소녀 센도 유키와 만나 칙칙하던 하루하루가 갑자기 반짝이기 시작한다.
멋진 친구 유키에게 휘둘리면서 아카리의 「좋아」하는 감정이 점점 커져 가는','https://www.lezhin.com/ko/comic/lover_in_my_lens','https://ccdn.lezhin.com/v2/comics/4955213509427200/images/tall.webp?updated=1775533664220&width=420','완결'),
('엉덩이가 잘못했네','자몽사이다(유툰)·줄라이키스·비브로스팀',array['로맨스']::text[],'잘나가는 경호 회사 팀장인 성아. 어느 날 술에 취해 처음 본 남자와 잤다.
L&P 코어 대표인 재헌. 부자에다 능력도 좋고 잘 생기고 몸매도 좋은 완벽남.
술에 취한 성아가 자신의 차 보닛에 올라가 술 주정을 하는 성아의 모습에 반해버렸다. 
재헌과의 하룻밤을 그냥 하루로 흘려보내고 싶은 성아와 달리 재헌은 성아에게 매달린다.
수없이 많은 두드림 끝에 마','https://www.lezhin.com/ko/comic/bad_hip','https://ccdn.lezhin.com/v2/comics/5452694002401280/images/tall.webp?updated=1732088787706&width=420','완결'),
('마네킹','urnason',array['드라마']::text[],'왜 나에게 3류 드라마 같은 일이.... 넌 도대체 정체가 뭐야?
연인이기도 한 두 사람은 사람들 눈을 피해 정사에 빠지기도 하고….
하지만 언뜻 행복해 보이는 두 사람에게도 말 못할 비밀이 있는 모양인데…?','https://www.lezhin.com/ko/comic/mannequin_','https://ccdn.lezhin.com/v2/comics/4741621030846464/images/tall.webp?updated=1576652891733&width=420','완결'),
('고양이식 과격한 사랑법','타츠키치 가우라·루트미디어·블랙스완',array['로맨스']::text[],'35살에 독신으로 혼자 살고 있는 아키토의 집에 얹혀사는 레이지, 20세.
레이지는 누구에게도 마음을 열지않고, 혼자 방에 틀혀박혀 종일 검은 마술 도구를 긁어모으는 수상한 취미의 소유자였다.
그런 가운데, 평소에는 가까지 않지 않는 수상한 방에 무심코 발을 들여놓고 마는 아키토.
레이지의 마술도구 때문에 아키토는 살결이 탱글탱글한 반묘인 소년으로 변신하고','https://www.lezhin.com/ko/comic/catstronglove','https://ccdn.lezhin.com/v2/comics/4574821012209664/images/tall.webp?updated=1465879210828&width=420','완결'),
('마우리와 용','모토 하루히라·조은세상·라르고',array['로맨스']::text[],'전지전능한 능력을 갖고 있는 신령이 각지를 돌며,
토지를 윤택하게 해주던 시절.
의외로(?!) 솔직하고 연애가 체질인 신령들과 인간,
그리고 신비로운 생명체들이 엮어내는 달달♡러브코미디 BL!','https://www.lezhin.com/ko/comic/mauri_and_dregon','https://ccdn.lezhin.com/v2/comics/4922552596824064/images/tall.webp?updated=1550199613576&width=420','연재'),
('환생한 여자 아이돌, 프로레슬링을 시작했습니다','9타로·지티이엔티',array['판타지']::text[],'프로레슬링도 아이돌도 벗으면 지는 건데!  차에 치여 이세계로 환생하고 만 아이돌 리오.
노예로 팔려가는 줄 알았는데, 투기장을 운영하는 남자에게 레슬러로 팔려가고 만다?! 
링 위에 서게 된 리오는 각종 마법으로 옷이 찢기게 되는데!  본격 이세계 에로 프로레슬링 스타트!
© 9taro ／ wwwave comics','https://www.lezhin.com/ko/comic/wrestling_idol','https://ccdn.lezhin.com/v2/comics/5010078345003008/images/tall.webp?updated=1669116225486&width=420','완결'),
('감춰진 심장','미후·도서출판황매·황매북스',array['로맨스']::text[],'좋아하는 것이 있으면 자신만의 비밀 공간에 숨기는 버릇이 있는 미범 옆집에 사는 파란 눈의 한 아이를 너무나 좋아하게 되어 그 아이를 자신이 좋아하는 다른 보물들처럼 비밀 공간에 숨기게 된다. 이 일로 인해 그는 많은 것을 잃게 된다. 오랜 세월이 지난 후 영국에서 학교를 다니던 미범이 귀국해 새로 전학 간 학교에서 어린 시절 ‘그 사건’을 연상시키는 자신','https://www.lezhin.com/ko/comic/hidden_heart','https://ccdn.lezhin.com/v2/comics/5114565639143424/images/tall.webp?updated=1554363926314&width=420','완결'),
('내 양호실에 잘 왔어','시로바 코토코',array['로맨스']::text[],'언니 같은 꽃미남 선생님과 울보 여고생의
금단의 양호실 사라아아아아아아앙!!

아름다운 하늘. 
이 사소한 사실에도 눈물이 나오는, 감수성이 예민한 여고생 미우.
어느 날 교사 한구석에서 울던 미우를 양호 선생님 유게가 발견하고 위로해준다.
잘생기고 친절해 학생들에게 인기만점인 유게 선생님.
하지만 말투와 행동거지가 어째 심상치 않은데!
그래도 점점 선생님','https://www.lezhin.com/ko/comic/mynurseroom','https://ccdn.lezhin.com/v2/comics/6517142613131264/images/tall.webp?updated=1554783484586&width=420','완결'),
('어크로서','박찬호·성우현·스푼코믹스',array['판타지']::text[],'2025년 ‘혼수병’이 발생하고, 혼수병에 걸린 자는 전생에 갇혀 잠든 채 죽어간다. 이에 인류는 환자의 정신으로 접속할 수 있는 다이버를 양성한다. 인류를 혼수병으로부터 벗어나게 하기 위해 고군분투하는 다이버들의 이야기가 시작된다.','https://www.lezhin.com/ko/comic/acrosser','https://ccdn.lezhin.com/v2/comics/5397456488890368/images/tall.webp?updated=1552036363889&width=420','완결'),
('우리가 망가진 여름방학','미카도 유야',array['로맨스']::text[],'그 날, 우리의 관계는 순식간에 무너져내렸다. 

어릴 때부터 농구를 좋아했던 히로무와 그런 그를 줄곧 지켜봐온 류지. 
드디어 염원의 인터하이에 출전하기 직전,
연습 중에 류지와 부딪힌 히로무는 팔에 골절상을 입는다. 
시합에 나가지 못하게 된 울분을 부딪히는 히로무에게 류지는 순순히 응하기만 하는데…?','https://www.lezhin.com/ko/comic/brokensummervacation','https://ccdn.lezhin.com/v2/comics/6311452054388736/images/tall.webp?updated=1487260862110&width=420','연재'),
('맞은편 방의 고양이','아이노 코코·넥스큐브·페어리',array['로맨스']::text[],'항상 잔소리를 하고, 솔직하지 못하고, 친구가 적고, 
매사에 진지한 안경 쓴 청년 "미츠하라 유키". 
그가 짝사랑하는 상대는, 대학 기숙사의 맞은편 방에 살고 있는 인기남 "시마 코우키"다.
한 여자와는 오래 사귀는 법이 없고, 지독한 골초이기도 한 시마에게 항상 
독설을 쏘아붙이는 유키. 
하지만 그런 그의 마음속은 시마에 대한 생각으로 가득 차 있었','https://www.lezhin.com/ko/comic/cat_opposite','https://ccdn.lezhin.com/v2/comics/5146054281527296/images/tall.webp?updated=1583409003271&width=420','완결'),
('몸캠 BJ의 이중생활 [연재]','Lasso·스튜디오계동·스토리숲',array['로맨스']::text[],'본부장님, 아니 Daylightx씨, 
전 당신의 비밀을 전부 알고 있어요-

밤에는 백만 팔로워를 가진 벗방 스트리머 Daylightx로, 
낮에는 평범한 회사원 임성현으로 이중생활을 하던 도중, 
누군가 내 정체를 알아챘다.','https://www.lezhin.com/ko/comic/momcam_bj','https://ccdn.lezhin.com/v2/comics/7011776929129080/images/tall.webp?updated=1778237268630&width=420','연재'),
('그대로 좋아!','보배',array['드라마']::text[],'털털하고 멋진 1학년 하미니 & 예쁘지만 까칠한 복학생 허니!
피하고 싶어도 자꾸만 엮이는 
아옹다옹? 알콩달콩! 캠퍼스 연애기♥


대학교 1학년 2학기를 앞둔 날, 편의점 알바를 하던 미니는 가게에서 멋진 언니(?)인 허니를 만나게 된다. 취객과 허니 사이의 시비를 중재하고 해프닝으로 넘어갈 뻔했던 두 사람의 인연은 다음 날 개강 첫 수업에서 이어진다.','https://www.lezhin.com/ko/comic/let_well_alone','https://ccdn.lezhin.com/v2/comics/6562201909592064/images/tall.webp?updated=1677666281760&width=420','완결'),
('속도위반 로맨스','은랑호·애고·송보배·이코믹스',array['로맨스']::text[],'비혼주의자는 임신하면 안 된다는 법 있어?!

명문대 출신, 수려한 외모, 최연소 팀장 은수는 모든 면에서 선망의 대상. 
사내 비밀 커플이었던 마케팅 2팀장과는 최근 헤어졌다.
은수가 비혼주의자라는 걸 진지하게 받아들이지 않았는지… 청혼을 해왔으니 어쩔 수 없는 결말이지만 속이 쓰리다.
회식에서 술이 떡이 된 은수. 바래다준 팀 막내 현재를 유혹해 하룻밤','https://www.lezhin.com/ko/comic/speeding_romance','https://ccdn.lezhin.com/v2/comics/4906851463659520/images/tall.webp?updated=1700547251922&width=420','완결'),
('너를 기다리는 터미널','아오미야 카라',array['로맨스']::text[],'뜨거운 시선은 진실? 혹은 착각?!

버스 운전기사인 미야마 카즈키에게 최근 생긴 고민은 바로
버스와 함께 나란히 자전거로 달리는 손님(?) 야마다 쇼헤이였다.
매일 등교길을 버스와 함께 달리는
야마다의 시선이 뜨끈뜨끈한 나머지
운전에 집중을 할 수가 없기 때문이다!

하지만 휴일에 막상 마주치고 보면
시선을 돌리며 모르는 사람 행세를 하는 야마다.
성가시','https://www.lezhin.com/ko/comic/terminalwaityou','https://ccdn.lezhin.com/v2/comics/5656194640773120/images/tall.webp?updated=1526370397693&width=420','완결'),
('0부터 시작해 볼까요?','쿠즈노키 모코·재미스튜디오·로맨스홀릭',array['로맨스']::text[],'일 잘하고 키172cm 미인에다 스타일도 좋은 웨딩 플래너인 아카리에게는 중대한 비밀이 두 가지 있다. 그중 하나는 처녀라는 사실과 다른 하나는 귀여운 것을 아주 좋아한다는 것이다. 그런 비밀을 숨기며, 지내던 나날 직장에 미남인 부장·시노미야가 부임된다. 호감을 느끼는 것도 잠시 "오늘부터는 내 명령에 따라 줘야겠어."라며, 첫날부터 대충돌이 일어난다. ','https://www.lezhin.com/ko/comic/0start','https://ccdn.lezhin.com/v2/comics/5693032340193280/images/tall.webp?updated=1683508143472&width=420','완결'),
('악역 영애의 페로몬 [연재]','이루카노츠노·타니무라니쥬엔·미즈노사이코로·지티이엔티',array['로맨스']::text[],'여성향 게임 &lt;프린스 오브 프린스&gt;의 악역 영애로 환생한 주인공. 
원래라면 정식 히로인과 왕자가 이어져 특수한 페로몬의 영향으로 맺어져야 하는데, 
어째서인지 악역 영애와 왕자가 서로에게 반응하게 된다! 
좋아한다는 감정보다 본능으로 먼저 맺어지고 만 둘의 운명은 과연…?!
© tanimura nijuen／Irukano Tuno / Mizuno','https://www.lezhin.com/ko/comic/villainous_pheromones','https://ccdn.lezhin.com/v2/comics/6389980461203456/images/tall.webp?updated=1779258023300&width=420','연재'),
('채무관계','W타오·대원씨아이',array['로맨스']::text[],'피 한 방울도 섞이지 않은 삼촌과 조카 사이인, 하진과 제이.

제이의 부모는 하진의 재산을 모두 가져가기 위해
하진을 죽이려고까지 하는데...

이런 하진을 위해 제이는 부모님의 빚을 갚겠다는 생각으로,
모든 것을 포기하고 삼촌의 인생을 보상하려고 한다.

"그런데 삼촌, 난 우리가 그저 채무관계이기만을 바라지 않아요."','https://www.lezhin.com/ko/comic/debt_relationship','https://ccdn.lezhin.com/v2/comics/4939985911480320/images/tall.webp?updated=1763413530691&width=420','완결'),
('복종, 하라','GIRLS STUDIO·Ande·키다리스튜디오',array['로맨스']::text[],'어디서부터 잘못된 걸까? 이젠 기억조차 흐릿하다.''

대학교에 가면 뭐든 달라질 줄 알았다. 
하지만 현실은 똑같았다. 반복되는 괴롭힘, 끝이 보이지 않는 불행.

강하라가 간신히 버틸수 있는 이유는 단 하나, 자작 소설 &lt;미스터 사이코&gt;.
비록 허구의 세계일지라도, 그곳에서만큼은 그녀가 원하는 대로 모든 것을 쓸 수 있었다.

그런데 어느날, ','https://www.lezhin.com/ko/comic/obey_','https://ccdn.lezhin.com/v2/comics/7011738574817603/images/tall.webp?updated=1747284804537&width=420','완결'),
('BL동화','Anthology·지티이엔티·허니B',array['로맨스']::text[],'모에 키워드! 빨간 망토,백설 공주,라푼젤, 
모두가 아는 동화의 주인공들이 남자라면?','https://www.lezhin.com/ko/comic/bl_fairy_tale','https://ccdn.lezhin.com/v2/comics/5248266824581120/images/tall.webp?updated=1566787876718&width=420','연재'),
('아름다운 초저녁달','야마모리 미카·학산문화사',array['로맨스']::text[],'히로인이 어울리지 않는다는 건 내가 제일 잘 알아.

타키구치 요이는 단정한 외모에 스마트한 매너로 「왕자님」이라 불리는 여자아이.
순정만화의 히어로 같다며 동경의 대상이 되지만, 정작 본인의 심정은 복잡해져만 간다.
그러던 중 우연히 만난 사람은 역시「왕자님」이라 불리는 한 살 연상의 남자, 이치무라 선배.
그의 조금은 무례한 행동에 요이는 전혀 왕자답지','https://www.lezhin.com/ko/comic/clear_moonlit_dusk','https://ccdn.lezhin.com/v2/comics/5942943809863680/images/tall.webp?updated=1782963699297&width=420','연재'),
('국제연애 절대로 하지 마라 [제1회 레진만화왕전 제출작]','쑤',array['일상']::text[],'국제연애의 로맨틱한 이야기들은 그만! 국제커플 롯과 쑤가 보수적이고 인종차별이 심한 한국에서 연애하며 당한 차별, 역경과 국제연애의 힘든 현실을 낱낱히 파헤쳐 말해준다! 또 롯과 쑤가 헬조선, 헬미국을 떠나 제3의 나라(북유럽, 호주)로 이민 가려고 하는 이야기.','https://www.lezhin.com/ko/comic/neverdateaforeigner','https://ccdn.lezhin.com/v2/comics/6095755811225600/images/tall.webp?updated=1490238568652&width=420','연재'),
('토르소 멜트','나츠키 지포·넥스큐브·페어리',array['로맨스']::text[],'미대의 조소과에 다니는 카즈키는
어느 날 건축과 야부키가 말을 걸어 온 것을 계기로,
붙임성 있는 그의 성격 덕분에 기묘한 인연을 맺게 되었다.
허물없이 본능에 충실한 그의 솔직한 칭찬에,
동생의 재능에 대한 콤플렉스와 자신의 길에 대한 위화감으로
흔들리던 카즈키는 조금씩 용기를 얻게 되지만,
‘LOVE의 의미로 너를 좋아해’라는 갑작스러운 야부키의 고백으','https://www.lezhin.com/ko/comic/torsomelt','https://ccdn.lezhin.com/v2/comics/5951818256875520/images/tall.webp?updated=1489071662704&width=420','완결'),
('노 모어 프린스','만물상·밀밭·위즈덤하우스',array['로맨스']::text[],'"왕자들은 죄다 똑같은 말뿐이네. 다들 제노를 엄청 좋아하나봐. 다들 제노만 열심히 찾잖아."

숲 속에 갇힌 공주님과 불을 뿜는 드래건.
세간에 알려진 것과 달리 공주 미카엘라와 드래건 제노는 단순한 납치범과 인질의 관계가 아니다.
집사? 호위병? 돌아가신 어머니 힐디안의 늙지 않는 친구?
어느 쪽이든 미카엘라의 아침잠을 깨우는 왕자들보다야 백배 낫다.
','https://www.lezhin.com/ko/comic/no_more_prince','https://ccdn.lezhin.com/v2/comics/4775331117727744/images/tall.webp?updated=1677473025802&width=420','완결'),
('HAPPY ENDING','레고 이경하·앤드비',array['로맨스']::text[],'‘안녕하세요? 해피엔딩입니다―’ 정직으로 회사를 쉬는 동안 ‘막 살아보겠다’고 결심한 원우는 결혼정보회사의 
동거 프로그램인 &lt;해피엔딩&gt;을 신청한다. 하지만 외환과 국제금융에 박식하고 고전호러를 좋아하는 섹시 청순한 
타입과는 달리 원우 앞에 등장한 사람은 어린 청년 ‘호경’인데… 레고 이경하 작가의 BL 드라마 "HAPPY ENDING", 
당','https://www.lezhin.com/ko/comic/happyendingyap','https://ccdn.lezhin.com/v2/comics/4850100578287616/images/tall.webp?updated=1636020392502&width=420','완결'),
('디어 (dire)','에니카·싱난다',array['스릴러']::text[],'어느 날 한통의 문자가 도착했다. 30일간 계속되는 괴담들...과연 그 끝은?','https://www.lezhin.com/ko/comic/dire','https://ccdn.lezhin.com/v2/comics/141/images/tall.webp?updated=1550046932102&width=420','완결'),
('술탄의 꽃 [개정판]','꽁·춈춈·도서출판 가하·가하 웹툰',array['로맨스']::text[],'[해당 작품은 &lt;술탄의 꽃&gt;의 일부 장면을 편집한 15세 개정판입니다. 이용에 참고 부탁드립니다.]

“모두가 내 말을 믿지 않아도 그대는 믿어야 합니다, 사예 님. 나는 그대가 술탄의 여자라 술탄이 되기로 한 사내입니다.”

술탄의 하렘, 그곳에서도 미처 꺾이지 않은 어린 꽃이었던 사예는 전대 술탄의 아들인 제9황자 카이네르가 반역을 일으켜 세','https://www.lezhin.com/ko/comic/sultans_flower_re','https://ccdn.lezhin.com/v2/comics/5483951990046720/images/tall.webp?updated=1631598913248&width=420','완결'),
('장미의 성흔','모리사키 레이코·루트미디어·클로버즈',array['판타지']::text[],'일본 누적 다운로드 수 3,000만건을 넘어선 방대한 스케일의 장편 미스터리 로맨스 작품!!! 

가슴 위로 떠오르는 장미 문양에 키스를 하면!? 

고등학생인 히이로는 자신이 다니는 학원의 이사장으로 있는 라울로 체레스티노와 우연히 마주치게 된다. 
이사장은 전 세계의 1%들에게까지 경의를 받는 그리치네 공화국의 전 수상 이기도 한데. 

히이로의 가족과','https://www.lezhin.com/ko/comic/rosestigmata','https://ccdn.lezhin.com/v2/comics/5377596782542848/images/tall.webp?updated=1465891938302&width=420','연재'),
('완벽한 교실','오구·위즈덤하우스',array['드라마']::text[],'비밀을 잔뜩 갖고 전학온 두 남매. 교실은 남매를 중심으로 서서히 변해가기 시작한다.','https://www.lezhin.com/ko/comic/perfect_classroom','https://ccdn.lezhin.com/v2/comics/5019974415482880/images/tall.webp?updated=1681894825882&width=420','완결'),
('Caramel Honey','타쿠헤이·루트미디어·블랙스완',array['로맨스']::text[],'불량아가 많이 다니는 고등학교에 전학 온 ''괴롭힌 당하는 체질'' 아야토. 평소보다 심하게 괴롭힘을 당하던 중 이름 모를 불량배 유세이가 등장…? 게다가 아여토의 ''괴롭힘 당하는 체질''에는 비밀이 있는데…. 유세이의 형, 마사토의 고등학교 시절을 그린 맞는 쪽X때리는 쪽 번외편도 수록!','https://www.lezhin.com/ko/comic/caramel_honey','https://ccdn.lezhin.com/v2/comics/5989565400743936/images/tall.webp?updated=1532660451909&width=420','완결'),
('그녀의 이중생활','진지한척',array['로맨스']::text[],'요즘은 그야말로 외모도 실력인 세상. 우리의 주인공 한소이도 그 맛을 일찍 알게 되었다. 출근할 땐, 머리부터 발끝까지 잔뜩 힘을 주어 회사에선 연예인 뺨치는 외모에 실력 있는 패션 에디터지만, 퇴근 후 집에선 너덜너덜하고 지저분한 홈웨어에 배달 아저씨도 무시하는 추녀로 변신한다. … 아니 돌아온다(변신은 아침에 하는 걸로). 
그녀의 취미는 온갖 패스트푸','https://www.lezhin.com/ko/comic/moon_crystal_power','https://ccdn.lezhin.com/v2/comics/5926582951870464/images/tall.webp?updated=1598597791104&width=420','완결'),
('내세에는 남남이 좋겠어','코니시 아스카·소미미디어',array['드라마']::text[],'조폭 집안에서 나고 자란 여고생 소메이 요시노. 가정환경은 특수해도 얌전하게 평온한 세월을 지내 왔다. 그러나 약혼자인 미야마 키리시마를 만나게 되면서 요시노의 인생은 크게 변한다. 용모가 수려하고 자상한 남자로 보였던 키리시마의 정체는 야쿠자보다 무서운 남자였던 것이었는데….','https://www.lezhin.com/ko/comic/each_other','https://ccdn.lezhin.com/v2/comics/5185174595764224/images/tall.webp?updated=1768451314954&width=420','연재'),
('첫사랑, 그 3cm의 거리','카네사다 유키오·넥스큐브·미즈',array['드라마']::text[],'‘사랑을 하기 위해서는 조건이 있다.’
방과 후, 선생님의 심부름으로 자료실에 들렀던 사토는 우연히 그곳에서 두 남녀의 키스 장면을 목격하게 되고, 그 주인공 중 한 명이 학교에서 꽃미남으로 여자애들의 인기를 독차지하고 있는 같은 반의 카나메라는 사실을 알게 된다. 눈이 마주친 순간, 당황해 전력질주로 도망갔지만 학교에 다니는 이상 어차피 얼굴을 마주치게 ','https://www.lezhin.com/ko/comic/firstlove3cm','https://ccdn.lezhin.com/v2/comics/5377873398988800/images/tall.webp?updated=1464938881469&width=420','완결'),
('골판지 상자 안 고양이씨 시즌1','개적·키다리스튜디오',array['로맨스']::text[],'22년간 함께 했던 반려견 겨울이의 죽음 이후 우울함을 떨치지 못하던 지승우.
승우는 집 앞에 버려진 고양이 한 마리를 발견하고는 외면하지 못하고 그만 집으로 데려와 버린다.
하룻밤 새에 부쩍 커버리기라도 한 것인지 작고 귀여운 고양이는 어디가고 잘생긴 중저음의 남자만 덩그라니?!
&lt;저는 이분, 주인 되는 사람입니다!&gt; 승우와 고양이씨의 동거 생','https://www.lezhin.com/ko/comic/mr_cat1','https://ccdn.lezhin.com/v2/comics/6456189317873664/images/tall.webp?updated=1689146435696&width=420','완결'),
('백퍼센트 클린업 [개정판]','호벤·키다리스튜디오',array['로맨스']::text[],'[해당 작품은 &lt;백퍼센트 클린업&gt; 성인 버전의 일부 장면을 수정한 개정판입니다.]

향수를 뿌리는 시간까지 정해져있을 정도로 철저한 ''우인''의 남자친구 ''강석연''!
그런 그를 사랑했지만 언제나 자신보다 일정을 먼저 생각한 석연에게 결국 실망해 둘은 헤어지고..
새로운 마음으로 취직한 클리닝 업체에서 받은 첫 일은..헤어진 석연의 엉망진창 집 치우','https://www.lezhin.com/ko/comic/100_cleanup','https://ccdn.lezhin.com/v2/comics/5711417437913088/images/tall.webp?updated=1772182172590&width=420','완결'),
('선배가 짜증나는 후배이야기 [웹툰]','시로만타·학산문화사',array['로맨스']::text[],'조금 거칠긴 해도 다정하게 챙겨주는 선배 타케다와
그런 그에게 솔직하지 못하고 투덜대기만 하는 후배 이가라시.

오늘도 이가라시는 타게다의 과보호가 귀찮지만
사실 그다지 싫지는 않다. 물론 진짜 짜증날 때도 있지만,
어느 새 가까워진 두 사람의 미묘한 거리감에 고민하는 때가 많은데!

타케다와 이가라시에 비하면 조금은 어른스러운(?)
사쿠라이와 카자마의 이','https://www.lezhin.com/ko/comic/senpai_ga_uzai','https://ccdn.lezhin.com/v2/comics/4996391948845056/images/tall.webp?updated=1764295811411&width=420','연재'),
('복수는 달콤해','D.JuanEr·LiuXiaoLiu·MZ FAMILY',array['로맨스']::text[],'추호도 의심한 적 없는 언제나 내 사람일거라 
생각했던 절친과 사랑하는 사람이 나를 배신했다! 
둘의 배신으로 억울한 죽음을 맞이한 성유리. 
 
다시 태어난다면 한번만 다시 태어난다면 이렇게 억울하게 당하지 않을거라 다짐하며 눈물로 죽음을 받아들였는데... 어라?! 눈을 떠보니 15살 과거로 타임슬립을 해있다. 이거 레알?! 실화?! 그리고 나를 배신한 ','https://www.lezhin.com/ko/comic/revenge_s','https://ccdn.lezhin.com/v2/comics/6701850842759168/images/tall.webp?updated=1594287316253&width=420','완결'),
('그 비스크 돌은 사랑을 한다','후쿠다 신이치·소미미디어',array['드라마']::text[],'늘 친구들 사이에서 중심에 있는 인기 많은 미소녀 키타가와 마린. 반 친구인 고죠 와카나는 그녀를 ‘다른 세상에서 사는 인간’이라 생각했다. 장래에 히나 인형을 만드는 장인이 되고 싶은 와카나. 그런 그가 방과 후 피복실습실에서 작업을 하고 있는데,
갑자기 그곳에 나타난 사람은… 바로…?!','https://www.lezhin.com/ko/comic/bisque_doll','https://ccdn.lezhin.com/v2/comics/5491321637240832/images/tall.webp?updated=1770871341310&width=420','완결'),
('백 스트리트 걸스','재스민 규·학산문화사',array['코미디']::text[],'[15세 이상 관람 권장합니다.]
인간이길 포기하겠습니까, 아니면 아이돌을 하겠습니까?
실수를 저지른 조폭 3인방은 보스의 생뚱맞은 발상 한 방에 아이돌 그룹 BSG (Back Street Girls)로 데뷔하게 된다. 심지어, 아이돌이 됐더니 대박이~! 젠장~! 
조폭하다가 아이돌이 됐는데, 이거 왜 이리 잘 나가는 거야~! 
언제나 마음은 옛날 그대로!','https://www.lezhin.com/ko/comic/backstreetgirls','https://ccdn.lezhin.com/v2/comics/5515862393618432/images/tall.webp?updated=1764314454896&width=420','완결'),
('밀명','카토 엘레나·토츠키 에코·조은세상·라르고',array['로맨스']::text[],'마피아가 된 남자와 그를 쫒는 육군소령. 두 사람은 사관학교 시절에 장래를 약속한 친구였는데!! ⓒ2014 ERENA KATOH&EKO TOHTSUKI/TOKUMA SHOTEN','https://www.lezhin.com/ko/comic/secret_order_about_oldfriend','https://ccdn.lezhin.com/v2/comics/6027583637684224/images/tall.webp?updated=1507258861650&width=420','완결'),
('밍글라바 버마기행','유진정',array['일상']::text[],'들썩거리는 마음이 그대로 전해지는 그림과 작가가 직접 찍은 풋내 가득한 버마의 사진이 듬뿍!
작가의 흥겨운 어깨를 빌려 우리도 미지의 여행지 ‘버마’로 GOGO!!','https://www.lezhin.com/ko/comic/mingalaba','https://ccdn.lezhin.com/v2/comics/307/images/tall.webp?updated=1550132687539&width=420','완결'),
('인어의 추락','LibertyHome·Changpei Tech·Lin Qian·재담미디어',array['로맨스']::text[],'제멋대로 사는 알파 백사자 재진과 백치미 넘치는 오메가 인어 시온.
실험체가 되어 같은 우리에 갇힌 그들은
연구원의 감시 속에서 서로를 이용하고 의지하며 성장했다.
하지만 모종의 오해로 인해 시온은 재진을 공격하고, 재진은 복수를 다짐한다.
몇 년후 시온과 재회한 재진은 자신이 여전히 시온에게 끌리고 있음을 깨닫고,
자신만의 인어, 시온을 지키기 위해 모든','https://www.lezhin.com/ko/comic/fall_mermaid','https://ccdn.lezhin.com/v2/comics/5223436403933184/images/tall.webp?updated=1787299373877&width=420','완결'),
('길티 이노센스','윤한·대원씨아이',array['드라마']::text[],'거침없이 대범하고 가슴울림 가득한 메디컬 브로맨스!!  

갑자기 전원오게 된 한때는 의사였으나 지금은 환자이면서 동시에 살인자인 한주원. 가장 따르고 존경했던 의사 한주원이었기에 우진한은 그와의 만남이 잔인하다고 여긴다. 너무 많이 변해버린 둘 사이는 되돌아갈 수 없다. 하지만 한주원이 우진한을 잊지 못하는 것처럼, 우진한도 한주원을 잊을 수가 없는데… ','https://www.lezhin.com/ko/comic/guilty_innocence','https://ccdn.lezhin.com/v2/comics/5215342426980352/images/tall.webp?updated=1785460690618&width=420','완결'),
('햇빛이 들린다','후미노 유키',array['로맨스']::text[],'“안 들리는 건 네 탓이 아니잖아.”
친구 이상, 연인 미만― 그와의 만남이 모든 것을 바꿔간다.

난청 때문에 여러모로 오해를 받아 주변 사람과 잘 어울리지 못하는 
대학생 코헤이는 어느새부턴가 타인과 거리를 두게 되었다.
그런 때에 만난 동급생 타이치. 바보같이 밝은 성격으로, 
뭐든 생각한 걸 바로 입 밖에 내는 그에게 “안 들리는 건 
네 탓이 아니','https://www.lezhin.com/ko/comic/sound_of_sun','https://ccdn.lezhin.com/v2/comics/6510433162231808/images/tall.webp?updated=1594260986541&width=420','연재'),
('상냥한 도깨비의 새 [개정판]','에이비·8 cat·블루픽',array['로맨스']::text[],'[해당 작품은 &lt;상냥한 도깨비의 새&gt; 성인 버전의 일부 장면을 수정한 15세 개정판입니다. 이용에 참고 부탁드립니다.] 
"도깨비의 신부가 되지 않겠습니까?“  

순나라의 황도 양안. 어느 약방에 찾아가면 신녀가 꿈속에서 소원을 이뤄 주는 노래를 불러 준다는 소문이 파다하다. 이를 검증하기 위해 신분을 속인 채 다른 이들 틈에 섞여 신녀를 찾아','https://www.lezhin.com/ko/comic/dokkaebis_bird_re','https://ccdn.lezhin.com/v2/comics/4811166890655744/images/tall.webp?updated=1682473314111&width=420','완결'),
('이중인격녀의 위험한 계약 [베리즈]','사토 토모코·세라 크레이븐·미스터블루·베리즈',array['로맨스']::text[],'내숭'' 으로 자기 자신을 감추기에 자신이 있는 에리카는, 드디어 학교 최고의 인기남인 히지리와 급속도로 가까워지게 된다.
하지만, 에리카의 진짜 모습을 알고 있는 소꿉친구인 미츠루의 입학으로 사태는 급변하는데?!

그녀의 비밀을 손에 넣은 그에게, 에리카는 노예 계약을 강요 당한다…!
심술궂은 장난 앞에 에리카의 가면이 조금씩 벗겨지고…?!

오만한 폭군과','https://www.lezhin.com/ko/comic/split_personality_girl','https://ccdn.lezhin.com/v2/comics/4527326503370752/images/tall.webp?updated=1619487943861&width=420','완결'),
('과묵한 친구는 사실 욕정 중입니다 [개정판]','고모우리키·넥스큐브·볼레로',array['로맨스']::text[],'사람의 성욕이 눈에 보이게 된 나는
과묵한 친구의 불끈불끈한 욕정 상태 때문에 너무 곤란해!

어느 날 갑자기 사람의 성욕 수준이 눈에 보이게 되어버린 시부타니.
침착하려 애쓰던 그의 눈 앞에 절친인 마키가 나타나자
싫어도 보이는 것은 꽉 차올라 폭발 직전인 마키의 성욕 게이지?!
하루종일 불끈불끈한 절친의 성욕 때문에
괜히 나까지 신경쓰이고 있잖아!','https://www.lezhin.com/ko/comic/lust_max','https://ccdn.lezhin.com/v2/comics/6452801110081536/images/tall.webp?updated=1609221580413&width=420','완결'),
('붉은 꽃','이오하라 미아·에비스 하나코',array['드라마']::text[],'"어떻게 하지, 나… 멈출 수가 없어.

유우의 남자친구 유스케는 절친한 친구 하즈키와 룸메이트이다.
유우가 두 사람의 집에 드나들게 되면서 싹튼 기묘한 삼각관계.
그러던 중, 유스케가 바람을 피우고 있다는 사실이 발각되고, 하즈키를 뿌리치지 못하는 유우의 입술.

잃고 싶지 않은 마음과 더 가지고 싶은 욕심.
흔들리는 유우의 복잡한 마음과 세 사람의 사랑','https://www.lezhin.com/ko/comic/redflower','https://ccdn.lezhin.com/v2/comics/4774026411507712/images/tall.webp?updated=1548913269717&width=420','완결'),
('오란고교 호스트부','하토리 비스코·학산문화사',array['로맨스']::text[],'학교 최상층 제3음악실. 그곳에는 호스트부가 있었다―.
조용히 공부할 곳을 찾아 제3음악실을 찾아간 하루히는 그곳에서 호스트부를 만나게 된다. 호스트부는 집안도 외모도 성적도 모두 최고인 여섯 명이 재미로 만든 클럽. 첫째는 집안, 둘째는 재력인 사립 오란고교의 유일한 성적 특대생 하루히는 공부 외에는 절대 관심이 없지만, 실수로 8만 엔짜리 꽃병을 깨게 ','https://www.lezhin.com/ko/comic/ouran_host_club','https://ccdn.lezhin.com/v2/comics/4904857069813760/images/tall.webp?updated=1764238901900&width=420','완결'),
('흐트러진 사랑의 함락직전-야쿠자 그녀의 위장남친-','키사키 케이·넥스큐브·미즈',array['로맨스']::text[],'야쿠자 집안의 외동딸인 린은 아버지가 혼약을 밀어 붙이는 것에 질려 있었다. 그러던 어느 날, 미남 날라리남인 토마의 유혹을 받은 린은 아빠를 포기하게 만들기 위해 토마의 연인인 척하게 되는데. 그런데 집에 들어온 순간 토마가 돌변! ''연인이니까 괜찮겠지''라며 욕실에서 억지로 키스를 하고 …. 게다가 계속 린을 노리고 있던 다른 조직의 나자들도 습격하고…짐','https://www.lezhin.com/ko/comic/fake_boyfriend','https://ccdn.lezhin.com/v2/comics/5589927595343872/images/tall.webp?updated=1677997973701&width=420','완결'),
('A군과 B군','미갑·재담미디어',array['로맨스']::text[],'얌전한 순둥이 직장인 A군과 활발한 푼수 대학생 B군. 공통점이라고는 없는 두 사람의 몽글몽글한 이야기. 과연 둘은 무사히 연애할 수 있을까?','https://www.lezhin.com/ko/comic/a_and_b','https://ccdn.lezhin.com/v2/comics/5383650000371712/images/tall.webp?updated=1566957777319&width=420','완결'),
('새디스틱 뷰티:외전A [개정판]','우연희·이금산·키다리스튜디오',array['로맨스']::text[],'나주연 X 양계린 : 안타까운 첫사랑 두나를 뒤로하고 새로운 곳에서 시작하는 첫 만남! 그곳에서 계린은 머리부터 발끝까지 완벽한 자신의 취향을 만나게 되는데... 어마어마한 반전 매력이 가득한 나주연은 계린의 운명의 상대일까?','https://www.lezhin.com/ko/comic/sadi_bt_a','https://ccdn.lezhin.com/v2/comics/4933135115681792/images/tall.webp?updated=1770279919152&width=420','완결')
), ins as (
  insert into public.works (title_ko, author, genres, blurb_ko, cover_url, status, is_curated, sort)
  select i.title, i.author, i.genres, nullif(i.blurb,''), nullif(i.cover,''), i.st, false,
         11320 + row_number() over (order by i.title)
    from imp i
   where not exists (select 1 from public.works w where w.title_ko = i.title)
  returning id, title_ko
)
insert into public.work_legal_links (work_id, platform_key, url, sort)
select ins.id, 'lezhin', imp.url, 0
  from imp join ins on ins.title_ko = imp.title;

-- 확인용
select status, count(*) from public.works group by status order by status;
