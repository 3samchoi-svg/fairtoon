-- 레진코믹스 수집 11/16 — scripts/collect_lezhin.py 생성
-- 320편. 청소년 이용불가 제외 · 제목이 이미 있으면 넣지 않는다.
-- 실행: SQL Editor 에서 Run. 여러 번 실행해도 안전하다.

with imp(title, author, genres, blurb, url, cover, st) as (values
('복수의 왕자님','쿠로오토메·토리우메 마루·타누키야 폰·넥스큐브',array['드라마']::text[],'추한 외모 때문에 동급생들에게 끔찍한 괴롭힘을 당하던 쿄코.
절망적인 나날 속에서 유일한 편이었던 어머니가 사고로 의식불명 상태가 되고,
자포자기한 쿄코는 자살을 시도한다.
하지만 눈을 뜨자 낯선 미남이 되어 있었는데―!
절망의 나락에서 다시 태어난 쿄코가 취한 행동은…
자신을 괴롭혔던 동급생들에 대한 복수였다.','https://www.lezhin.com/ko/comic/prince_revenge','https://ccdn.lezhin.com/v2/comics/7011773024686996/images/tall.webp?updated=1773381846659&width=420','연재'),
('마법진 구루구루 애장판','에토 히로유키·대원씨아이',array['코미디']::text[],'용자 니케, 마법사 쿠쿠리, 북북 노인을 다시 만나 YEOP~!! 
작은 마을에 전해져오는 기묘한 환수 ‘구루구루’의 전설. 그것은 부활한 마왕을 봉인했던 유일한 단서….
용자 마니아 아버지 밑에서 자란 소년 니케, 그리고 마법 할머니의 손에 길러진 미구미구족 소녀 쿠쿠리.
두 사람이 만난 순간 신비한 마법의 힘이 발동하면서, 웃음과 감동의 모험이 시작된다','https://www.lezhin.com/ko/comic/guruguru','https://ccdn.lezhin.com/v2/comics/5749481984032768/images/tall.webp?updated=1681222094156&width=420','완결'),
('청순가련 그녀는 쉽게 꺾이지 않아','하테나·디엔데 마나부·마나부',array['로맨스']::text[],'얼굴만은 귀여운 헨미 나데코는 중학교 때 엄청나게 인기가 많았지만, 
언젠가 고등학교에서 만날 멋진 남자친구를 위해 모든 고백을 거절해 왔다. 

그 결과 사랑스럽지 않다고 할 정도로… 

그래서 고등학교에서는 안경으로 미모를 봉인하고, 
자신의 운명을 찾기로 하는데!? 

성격 꼬인 여자와 인상 험악한 남자의 청춘 로맨틱 코미디!','https://www.lezhin.com/ko/comic/never_break','https://ccdn.lezhin.com/v2/comics/7011782873851061/images/tall.webp?updated=1783321066800&width=420','완결'),
('마음속엔 언제나','타우미 마유·학산문화사',array['로맨스']::text[],'상점가 구석에 위치한 중고 레코드점 ‘키츠네 레코드’. 
그곳에는 점장 쇼지와 그가 주워온 청년 타이가 살고 있었다. 
쇼지와 만나기 전의 기억이 전혀 없는 타이는 
한 번 들은 선율은 전부 기억하는 능력을 가지고 있다. 
쇼지는 생활력이 없고 어딘가 아슬아슬한 타이를 열심히 돌봐주지만 
두 사람의 관계는 점장과 점원, 그 이상도 이하도 아니다. 
그러나 ','https://www.lezhin.com/ko/comic/in_ones_heart_always','https://ccdn.lezhin.com/v2/comics/5877524191379456/images/tall.webp?updated=1764236004525&width=420','완결'),
('방주','모로즈미 스미모토·조은세상·라르고',array['로맨스']::text[],'고등학교 교사인 시마는 어머니가 돌아가신 봄 방학, 소년을 산다.
신학기에 맡은 반에는 그때의 소년, 이시다가 있었다.
아는 체 하는 이시다에게 사람을 잘못 봤다며 모른 척하는데…
사랑과 인생에 서투른 그들의 러브스토리.','https://www.lezhin.com/ko/comic/an_ark','https://ccdn.lezhin.com/v2/comics/4680673636646912/images/tall.webp?updated=1506049266625&width=420','완결'),
('허릉몽','otb·안도·리디',array['드라마']::text[],'몰락해가는 대부호 가문의 장남인 표걸,
가문을 일으키기 위해서는 대를 이을 아이가 필요 하나
어째서인지 몇 해 째 그와 아내 사이에 아이가 생기질 않는다.

표결은 아내를 생각해서라도 양자를 데려오려 하지만
어째서인지 아버지는 반드시 표걸의
핏줄이어야만 한다고 으름장을 놓으신다.

보다 못한 아버지는 표걸에게
오랫동안 내려온 가문에서 내려온 비책을 제안하기','https://www.lezhin.com/ko/comic/heoreung_mong','https://ccdn.lezhin.com/v2/comics/7011771568703437/images/tall.webp?updated=1773730221357&width=420','완결'),
('복수를 꿈꾸는 신데렐라','요츠하라 후리코·지티이엔티',array['로맨스']::text[],'회사에서 자신의 이름과 같은 미인 때문에 비굴한 나날을 보내고 있는 OL 린. 그러던 어느 날, 복권에 당첨이 되는데… 추녀의 인생은 끝났지만, 나는 여기에서 시작합니다. ⓒYotsuhara Furiko/Solmare Publishing','https://www.lezhin.com/ko/comic/avenging_cinderella','https://ccdn.lezhin.com/v2/comics/5598149083004928/images/tall.webp?updated=1787303054964&width=420','완결'),
('역도요정 김복주','이다이·만오·김수진·양희승·IMXTOON',array['로맨스']::text[],'굳은 살 박힌 제 손이 처음으로 부끄럽다고 느껴진다…  
사랑 옆에 처음으로 ''여자''이고 싶다…

바벨만 들던 스물한 살 역도선수 김복주에게 닥친 폭풍 같은 첫사랑.
꿈과 목표를 향해서 달려가는 대학생들의 치열한 인생 성장기, 서툰 사랑을 그린 청춘 로맨틱 코미디.','https://www.lezhin.com/ko/comic/kimbokju','https://ccdn.lezhin.com/v2/comics/5506971280932864/images/tall.webp?updated=1720079544771&width=420','완결'),
('먼데이 블루스','쿠우·공감미디어',array['드라마']::text[],'퇴사 후 프리랜서 일러스트레이터로 나섰지만, 현실은 2년째 방구석 백수인 윤다슬.
통장은 비고, 자존감은 바닥. 친구의 출근길을 배웅하다가 내 인생만 제자리에 멈춘 것 같아 서럽다.

그때 여행지에서 만난 건 공장 비정규직 사원 해준.
각자 다른 무게를 짊어진 채 버티던 우리, 짧은 대화 속에서 잊고 있던 ‘나’를 발견한다.

“꿈은 사치”라 말하는 그와,','https://www.lezhin.com/ko/comic/monday_blues_love','https://ccdn.lezhin.com/v2/comics/7011767855423046/images/tall.webp?updated=1769413529209&width=420','완결'),
('나루사와는 맛있게 먹는 얼굴을 사랑한다','야마다 레이·AK커뮤니케이션즈',array['일상']::text[],'음식을 맛있게 먹는 표정은 사람을 행복하게 한다.
이마에 난 흉터와 기분 나쁜 눈매 탓에 나루사와는 늘 외톨이지만
사실은 “밥을 맛있게 먹는 여자의 얼굴”을 무척 좋아한다☆
그런 나루사와의 앞에 차례로 맛있게 먹는 얼굴을 하는 여자가 나타나는데…?!
“기분 나쁜 남자” × “배부른 여자”가 만들어나 가는 행복 요리 러브 코미디가 시작됩니다☆','https://www.lezhin.com/ko/comic/narusawa','https://ccdn.lezhin.com/v2/comics/4661768914862080/images/tall.webp?updated=1594189013395&width=420','완결'),
('이웃집 참견쟁이 누나','카파타로·디엔데 마나부·마나부',array['로맨스']::text[],'대학에 입학하며 자취를 시작한 이가라시 아키히토!

옆집으로 이사 온 사람은 챙겨주기 좋아하는 귀여운 누님! 

하지만 매우 심하게 덜렁거린다!? 

덜렁거리는 모습마저 사랑스러운 누님과 이웃사촌 러브 코미디!','https://www.lezhin.com/ko/comic/nosy_noona','https://ccdn.lezhin.com/v2/comics/7011785381853851/images/tall.webp?updated=1785716805194&width=420','연재'),
('피치 : 마운드의 여왕','황지성·씨엔씨레볼루션㈜',array['드라마']::text[],'만년 2군 여자 야구 선수, 진선미!
위기에 놓인 한울고 야구부의 선발 투수가 되다!

고교 야구의 유일무이한 여자 야구 선수, 진선미.
언론과 학교는 그녀의 특별함을 이용하여 마케팅에 이용하고,
선미는 여자 야구 생활에 회의감을 갖기 시작한다.

지쳐버린 선미는 야구를 처음 알려준 소꿉친구 ''차원''을 만나러
고향에 있는 한울고로 가게 되고,
인사할 틈도 ','https://www.lezhin.com/ko/comic/pitch_queen_of_mound','https://ccdn.lezhin.com/v2/comics/6198847786516480/images/tall.webp?updated=1628837100305&width=420','완결'),
('액막이 왕비','모소모·Vigor Comic·로크미디어·연후',array['드라마']::text[],'포악한 왕야와 영리한 규수의 만남. 첫 만남에 그의 상처를 치료해준 그녀는 치료비 3냥을 받았고, 두 번째 만남에 그는 그녀와 평생을 떨어지지 않겠다며 그녀를 비로 맞이했다. “왕야, 세자가 아직 옆에 있습니다…” “잘됐네. 어떻게 지어미를 아껴야 하는지 보여줘야겠군.”','https://www.lezhin.com/ko/comic/queen_keep','https://ccdn.lezhin.com/v2/comics/7011747631762645/images/tall.webp?updated=1751431904330&width=420','완결'),
('쌈 마이웨이','초코라떼·쥬니·스튜디오 재미·피플앤스토리',array['드라마']::text[],'"그냥 없는 거로 치자.
꿈 없는 척 사는게 낫지,
있으면 괜히 사람 마음 찌질해져요.
뭐 다 꿈이 있어야 되나?"

어린 시절부터 친한 친구였던 고동만과 최애라는 오랜시간동안 서로를 지켜봐왔다.
태권도 국가대표를 꿈꾸던 고동만과 아나운서를 꿈꿔왔던 최애라는 현실에 치여 자신들의 꿈과는 전혀 다른 일을 하며 살아가고 있다.

백화점 인포데스크의 직원인 최애','https://www.lezhin.com/ko/comic/ssam_myway','https://ccdn.lezhin.com/v2/comics/6486639097741312/images/tall.webp?updated=1653440474550&width=420','완결'),
('순백의 소리','라가와 마리모·학산문화사',array['드라마']::text[],'홀로 츠가루샤미센을 등에 지고
아오모리에서 도쿄로 찾아온 사와무라 세츠.
스승이기도 했던 할아버지를 잃고
자신이 켜야 할 소리를 잃어버린 세츠였으나,
여러 사람을 만나며 자신의 소리를 찾는 여행이 시작된다.

ⓒMarimo Ragawa/Kodansha Ltd.','https://www.lezhin.com/ko/comic/mashirono_oto','https://ccdn.lezhin.com/v2/comics/5906925708705792/images/tall.webp?updated=1764297356622&width=420','완결'),
('미열공간','아오키 우메·대원씨아이',array['로맨스']::text[],'"오늘부터, 남매."

갑작스레 시작된, 동갑내기 아마네&나오야의 한 지붕 생활.
고달프고도 샘나는, 둘만의 이야기가 시작됩니다!
[BINETSU KUKAN]ⓒUME AOKI/HAKUSENSHA, INC., Tokyo','https://www.lezhin.com/ko/comic/binetsu_kukan','https://ccdn.lezhin.com/v2/comics/4828382526504960/images/tall.webp?updated=1637224234413&width=420','연재'),
('그곳에서 만난 전 남친','카이다 히로·피앤피프라임',array['로맨스']::text[],'현 남친이 바람 피는 현장에서 전 남친을 만났다!! 잘나가는 사진작가와의 러블리하고 달콤한 생활을 두고 상상 밖의 수렁에 빠진 마히루는…!? 진실과 거짓으로 뒤엉킨 복잡한 사각관계가 시작된다!','https://www.lezhin.com/ko/comic/exboyfriend_there','https://ccdn.lezhin.com/v2/comics/5601998734491648/images/tall.webp?updated=1539336184354&width=420','연재'),
('카페 드림','하나가타 레이·히라마츠 오사무·조은세상',array['일상']::text[],'당신의 커피 스타일은 무엇입니까?
부드럽고 달콤한 카페오레? 아니면 쌉싸름한 에스프레소?

대대로 전통 찻집을 경영하고 있는 시라카바 집안의 외아들인 사스케는 집안의 반대에도 불구하고 커피의 매력에 빠져버린 별난 남자. 일상생활에 지친 사람들의 마음을 위로하는 행복한 커피를 만들기 위한 도전은 멈추지 않는다! 여기 구수한 커피향 만큼이나 따뜻한 사람들의 이','https://www.lezhin.com/ko/comic/cafe_dream','https://ccdn.lezhin.com/v2/comics/4514809023954944/images/tall.webp?updated=1538631304861&width=420','완결'),
('가족사진','정병식·키다리스튜디오',array['드라마']::text[],'어느 초겨울, 결혼준비가 한창이던 어느날...

죽었던 아버지가 되살아왔다.','https://www.lezhin.com/ko/comic/familyphoto','https://ccdn.lezhin.com/v2/comics/5070814141808640/images/tall.webp?updated=1617875546121&width=420','완결'),
('뜨거운 불꽃처럼 [개정판]','권열희·하서린·지티이엔티',array['로맨스']::text[],'[해당 작품은 &lt;뜨거운 불꽃처럼&gt; 성인 버전의 일부 장면을 수정한 15세 개정판입니다. 이용에 참고 부탁드립니다.]

유리구두를 되찾은 신데렐라는 과연 그 후로 오랫동안 행복하게 살았을까? 
돈 삼천만 원에 자존심을 팔고, 돈 삼천만 원에 순결을 팔고, 돈 삼천만 원에 인생을 팔았다. 
이제 내게 남은 것은 오기와 절망뿐! 돈만 벌 수 있다면 그','https://www.lezhin.com/ko/comic/like_fire_15','https://ccdn.lezhin.com/v2/comics/5892778104782848/images/tall.webp?updated=1688118019115&width=420','완결'),
('여섯자의 소년 [개정판]','김보현',array['로맨스']::text[],'안락사가 보편화된 근미래. 스물넷의 주인공 다루는 스스로의 선택 아래 죽기 위해 안락사를 신청한다. 생전의 기억을 거슬러보는 최종 수면 단계까지 거치면 원하는 끝을 맺게 되는 안락사. 하지만 다루가 꿈 속에서 마주친 것은 꺼내기 힘든 기억, 친구 ''이탄''과의 추억이었다.','https://www.lezhin.com/ko/comic/the_boy_of_the_chamber','https://ccdn.lezhin.com/v2/comics/7011782897127992/images/tall.webp?updated=1783557317812&width=420','연재'),
('하야치네!','후쿠모리타 아이코·넥스큐브',array['일상']::text[],'도호쿠 지방, 이와테 현의 오하사마.
대도시에서 한적한 산속 마을로 이사한 삼남매는
돌아가신 어머니의 동생, 외삼촌과 동거생활을 시작한다.
그곳에서 좀 특이한 외국인 여자애를 만나게 되는데…,
다정하고 여유롭고 향토적인 가슴 따스한 이야기!!','https://www.lezhin.com/ko/comic/hayachis_house','https://ccdn.lezhin.com/v2/comics/6161444408393728/images/tall.webp?updated=1466500749208&width=420','연재'),
('풀 인더 풀(Fool in the Pool) [개정판]','가현·LetB',array['로맨스']::text[],'※ 해당 도서는 제공사가 변경되어 재서비스되는 작품입니다. 이용에 참고 부탁드립니다.

“너 때문에 못 죽었으니까 니가 책임져야지.”

강진과 정권은 학창 시절 서로에게 특별한 존재로 각인되지만,
정권 아버지의 장례식을 계기로 멀어지게 된다.

그로부터 9년 후.
두 사람은 우연한 계기로 마주치고, 다시 서로의 삶에 깊게 들어가게 되는데…

하지만 시간이 ','https://www.lezhin.com/ko/comic/fool_in_the_pool_15','https://ccdn.lezhin.com/v2/comics/7011778229706080/images/tall.webp?updated=1780911466987&width=420','완결'),
('책벌레의 하극상 제3부','나미노 료·카즈키 미야·대원씨아이',array['판타지']::text[],'귀족이 자신의 마력을 노리자 마인은
평민인 가족, 친구와 헤어지기로 결단한다.
이름도 ‘로제마인’으로 개명하고
‘영주의 양녀’로서 새로운 생활을 시작한다.
귀족 사회에서 생활하는 나날은 가혹했지만,
신관장의 보상이 ‘신전 도서실’이어서 심기일전!
이름이 바뀌어도 변치 않는 책을 향한 열정으로
로제마인은 새로운 세계를 헤쳐 나간다!
책을 사랑하는 모든 사람에','https://www.lezhin.com/ko/comic/bookworm3','https://ccdn.lezhin.com/v2/comics/5641087891603456/images/tall.webp?updated=1695603411976&width=420','연재'),
('전생했더니 15살의 왕비였습니다','카타기리 아타리·오노나타 마니마니·하치피스☆왕·시프트코믹스',array['판타지']::text[],'사에키 에미 향년 28세. 과로사한 뒤 깨어나 보니 15살의 왕비로 전생했습니다.
왕비라고 한다면, 남편국왕 폐하이 있다는 것인데… 폐하는 무려 17살!
전생을 하면 인생이 쉬워질 거라고 생각했으나 
폐하에게 「전생자는 목숨이 노려질 가능성도 있다」
라는 말을 들어버린데다(게다가 들켜버림)
전생한 몸의 원래 주인인 에밀리아가 악령이 되어 나타나버리기도.
이','https://www.lezhin.com/ko/comic/15_sai_no_ouhi_deshita','https://ccdn.lezhin.com/v2/comics/5980203926224896/images/tall.webp?updated=1652334441255&width=420','연재'),
('신에게 맹세코','하나다 유미·아이온스타',array['로맨스']::text[],'처음 만난 다음 날 프러포즈를 받았다!!
그리고 갑자기 시작된 사랑….
이하에게 좀처럼 솔직해질 수 없는 메구미의 선택은?!

"운명적인 커플"의 순수한 사랑을 그린 러브 스토리.','https://www.lezhin.com/ko/comic/swear_before_god','https://ccdn.lezhin.com/v2/comics/4986573022298112/images/tall.webp?updated=1471506669997&width=420','완결'),
('편지창조','조유락',array['판타지']::text[],'「실존 인간」과 「창조된 인간」의 생존경쟁!!
진실한 사랑은 없고 외모지상주의가 심해지는 사람들 때문에 사회문제로까지 확대된다. 이를 보다 못한 옥황상제는 인간이 인간을 창조할 수 있는 능력을 인간에게 부여하게 되는데···.','https://www.lezhin.com/ko/comic/made_love','https://ccdn.lezhin.com/v2/comics/6020630749904896/images/tall.webp?updated=1498555820760&width=420','완결'),
('오타쿠가 연애하는 만화','카이린·키다리스튜디오',array['로맨스']::text[],'생일에 꽃을 준 산오에게 첫눈에 반한 수하는 만날 수록 다정한 산오의 모습에 급고백을 하고, 둘은 사귀게 된다. 
오타쿠 산오와 평범한 수하의 평범하지 않은 연애 이야기!','https://www.lezhin.com/ko/comic/otaku_love_comic','https://ccdn.lezhin.com/v2/comics/5156912374284288/images/tall.webp?updated=1680513250683&width=420','완결'),
('살애','Fe·영상출판미디어·노엔코믹스',array['액션']::text[],'너의 모든 것을 알고 있다–.

신출귀몰, 고고한 살인 청부 업자 겸 현상 수배범 송량하.
조직에 소속되어 있는 냉철하고 과묵한 현상금 헌터 샤토 댄크워스.
두 사람은 어느 처참한 현장에서 만난다.
그날부터 샤토 주위에는 항상 량하가 나타난다.
대담하게, 뻔뻔스럽게, 섬뜩하게.
샤토를 따라다니는 그의 목적은……?

일본 pixiv에서 조회수 800만을 돌파','https://www.lezhin.com/ko/comic/love_of_kill','https://ccdn.lezhin.com/v2/comics/4560904974958592/images/tall.webp?updated=1737503473466&width=420','완결'),
('여장했더니 일이 꼬여버린 음침남과 양아치의 짝사랑','토오루·디엔데 마나부·마나부',array['로맨스']::text[],'일본식 메이드 카페에서 일하는 귀엽고 명랑한 여자아이 ''하나''와
검은 머리가 예쁜 늠름한 미인 ''메이''.
두 사람은 서로가 서로를 좋아하는 것을 깨닫지 못하고 
각자의 짝사랑만 키워나간다.
하지만 두 사람에게는 상대에게 들키지 말아야 할 비밀이….','https://www.lezhin.com/ko/comic/crossdressed_gloomy_boy','https://ccdn.lezhin.com/v2/comics/7011779566464293/images/tall.webp?updated=1779856113180&width=420','연재'),
('모든 것을 빼앗긴 왕녀는 기사님을 기다린다','Yuki Otsuka·nobita·honcomi·Studio reBorn',array['로맨스']::text[],'평화로운 왕국의 공주 아이린은 호기심에 성을 몰래 빠져나왔다가, 자신과 똑같은 얼굴을 가진 빈민 소녀 아이비를 만난다.
잠시 신분을 바꾼 두 사람, 하지만 아이비의 야망은 공주 아이린의 모든 것을 빼앗아버린다.
그런 아이비에게 위화감을 느낀 궁전 기사 레오나르드는 진짜 왕녀를 찾기 위해 나서게 되는데...','https://www.lezhin.com/ko/comic/waiting_knight','https://ccdn.lezhin.com/v2/comics/7011748315791207/images/tall.webp?updated=1750319092153&width=420','완결'),
('2회차 인생은 최애의 식량입니다?!','쿠라쿠라·넥스큐브',array['로맨스']::text[],'최애의 ''식량''이 될 수 있다면 기꺼이 이 몸을 바치겠습니다!
계약으로 시작되는, 조금은 엇갈리는 두 사람의 러브 판타지♪

블랙 기업에서 일하는 저질 체력 토라오 루리(25세)는
야근하다가 그만 과로사하고 만다. 그렇게 죽은 줄 알았는데…
눈을 떠보니 최애 캐릭터인 ''길버트 알렉산더 공작''이 있는 게임 속이었고
루리는 그의 약혼녀인 피오나로 환생한 것!
','https://www.lezhin.com/ko/comic/2nd_life_food','https://ccdn.lezhin.com/v2/comics/6515660304875520/images/tall.webp?updated=1721970152950&width=420','연재'),
('안녕하세요, 정원사입니다','한시우럭·헤이륜·위즈덤하우스',array['로맨스']::text[],'수능이 끝난 기념비적인 날에 갑작스럽게 죽음을 맞이한 평범한 고등학생 이지현. 
그런데, 초목과 대화할 수 있는 능력으로 ‘정원사’가 됐다?
사후, 판타지 세계인 ‘에레브’에서 ‘시라비에’라는 새로운 이름과 함께 특별한 ‘능력’을 가지고 태어난 그녀.
시라비에는 자신의 능력을 갈고닦아 제도에서 알아주는 정원사가 되고, 평범한(?) 일상을 보내고 있었는데……','https://www.lezhin.com/ko/comic/im_gardener','https://ccdn.lezhin.com/v2/comics/6003991713087488/images/tall.webp?updated=1726123874857&width=420','완결'),
('사정 있는 꼬마 아가씨, 환생한 걸 눈치챘을 땐 이미 엉망진창이었다','마니시 마리·후지이·하루가노 카오루·지티이엔티',array['로맨스']::text[],'가난한 시골에 사는 4살 토리에게 어느 날 아름다운 귀부인이 찾아온다.
백작가의 자식이었다는 이유로 토리는 백작가에 가게 되어 냉혹한 백작과 오빠들에게 괴롭힘을 당한다.
그러나 귀엽고 천진난만한 토리의 정체는 바로 환생자였고, 이제부터 순진무구한 연기로 귀여움을 어필하며 그들의 마음을 사로잡기 시작한다!
ⓒMari Manishi/Fujii/Kaoru Har','https://www.lezhin.com/ko/comic/little_lady_mess','https://ccdn.lezhin.com/v2/comics/5860721643683840/images/tall.webp?updated=1785282056122&width=420','완결'),
('나와 스승과 그림자 풀이 여행','시바타 이스즈·조은세상',array['로맨스']::text[],'멋진 마법을 걸어줄게.
가슴이 두근거릴만큼 멋진 여행을 떠날 수 있는 마법을…
마법사 카일의 제자 아리시아는 스승에게 휘둘리면서도 매일 수행중이다.
그런 어느 날, 마녀의 저주로 카일이 아리시아의 그림자가 되어 버리는데!
얼떨결에 같이 저주를 받은 왕궁의 사자 진노도 제자인 슈우의 그림자가 되어 버리고!
그림자의 저주를 풀 방법이란?','https://www.lezhin.com/ko/comic/strange_journey','https://ccdn.lezhin.com/v2/comics/6377986101149696/images/tall.webp?updated=1597818164186&width=420','완결'),
('블랙 쉽','가호우 먀토·대원씨아이',array['드라마']::text[],'검은 양들이여, 운명에 저항하라.
야쿠자 조직 회장의 아들이면서 일반인으로 살고 있는 고등학생 시즈나가 레이. 어느 날, 회장인 아버지가 적대 세력에게 피습을 당해 갑자기 ‘회장 대행’으로 임명되어버린다. 레이의 주위에서 일어나는 이해하기 힘든 사건, 그리고 비서인 오우가 마스미와 함께 레이가 본 조직 사회의 모습은―?!

ⓒMyato Gahou 2022/','https://www.lezhin.com/ko/comic/black_sheep','https://ccdn.lezhin.com/v2/comics/4735338284253184/images/tall.webp?updated=1715327703410&width=420','연재'),
('안녕, 꼬리 달린 녀석','사하라 미즈·학산문화사',array['로맨스']::text[],'이것은「돼지처럼 생긴 꼬리」에 의해
저와 그 사람과 그 주변 세계에 생겨난
기적 같은 날들을 돌아보는 이야기입니다.

히야마 나치, 소프트볼에 땀을 흘리고 까맣게 탄 피부를 동경하는 평범한 중학생.
그녀는 동급생인 우츠미가 안고 있는 중대한 비밀을 알게 된다.
그것은 그에게 「꼬리가 나 있다」는 것.
「다른 사람들과 다르다」는 것에 망설이고 상처받으면서도,','https://www.lezhin.com/ko/comic/boy_with_pig_tail','https://ccdn.lezhin.com/v2/comics/5216281862406144/images/tall.webp?updated=1764234740943&width=420','완결'),
('마지막 맞선 [개정판][연재]','댕크·황한영·비러브드',array['로맨스']::text[],'“나, 기억 안 납니까?”
모친에게 결혼을 강요받는 남자, 강지혁.

“우리가 본 적이 있던가요?”
고모에게 결혼을 강요받는 여자, 지승연.  

엇갈린 첫 만남 이후 두 사람은
강요된 맞선 자리에서 한 번
직장에서 또 한 번
세 번의 우연한 만남을 갖게 되는데…….

“연애합시다, 나랑.”
“농담이 지나치시네요.”
“더는 맞선 보기 싫잖아요. 서로 돕고 ','https://www.lezhin.com/ko/comic/lastmatch_15','https://ccdn.lezhin.com/v2/comics/7011771985797899/images/tall.webp?updated=1772787992829&width=420','연재'),
('젠틀맨 리그','라노브·찰쓰·J STUDIO',array['로맨스']::text[],'기밀 정보를 얻기 위해 데이트를 갈구하는 스파이들과 이를 중재하는 바텐더 사이의 동상이몽 첩보 로맨스! 

바 ''콜래트럴''의 7년 차 바텐더 ''헤스터''는 100일 동안 가게를 맡아달라며 갑자기 사라진 ''마스터'' 탓에 당황스럽다. 시장통처럼 북적이는 가게 앞. 헤스터는 그 이유를 곧 알게 된다. 
올리브 한 개 올라간 마티니, 라임 두 개 넣은 진 피즈, 논','https://www.lezhin.com/ko/comic/gentlemen_league','https://ccdn.lezhin.com/v2/comics/7011753402317901/images/tall.webp?updated=1762496097272&width=420','완결'),
('별도 잠든 밤에 [개정판][연재]','미주·임은성·학산문화사',array['로맨스']::text[],'[5회 연재 후 1회 휴재]
스포츠 재활학과, 전직 축구 선수 신승원과
경영학과 모범생 권재윤의 캠퍼스 로맨스―

경영학과 권재윤은 왼쪽 귀의 이명으로 인해 수술을 하고
1년 뒤 복학한 캠퍼스에서 5년 전 짝사랑했던 신승원과 마주친다.
당혹스러운 마음을 추스르기도 전에 같은 수업을 들으며
자신에게 거침없이 다가오는 승원으로 인해 재윤의 마음은 한없이 흔들린','https://www.lezhin.com/ko/comic/when_stars_sleep_15','https://ccdn.lezhin.com/v2/comics/7011747718855387/images/tall.webp?updated=1750213775462&width=420','연재'),
('VP.히스','김윤정·락킨코리아',array['판타지']::text[],'지란이네 집안 대대로 사내아이는 뱀파이어 히스를 모셔야만 한다. 그러나 불행히도 이번에 사내아이가 없어 여자인 지란이가 히스를 모셔야(?) 하는데.. 지란이의 지랄 때문에 착한 뱀파이어 히스는 항상 당하기만 한다. 자신이 진화된 뱀파이어라 주장하는 히스의 앞날은 어떻게 될까??','https://www.lezhin.com/ko/comic/vp_heath','https://ccdn.lezhin.com/v2/comics/4837959777124352/images/tall.webp?updated=1488434207691&width=420','완결'),
('오데뜨','히아테 하루·소미미디어',array['로맨스']::text[],'고양이, 남자 친구──?

어리바리하지만 명랑하고 솔직한 여자 친구와 여자 친구를 많이 위하는 다정한 (고양이) 남자 친구.
포근포근 힐링 커플의 느긋한 ''데이트'' 이야기.','https://www.lezhin.com/ko/comic/odette','https://ccdn.lezhin.com/v2/comics/5003985827201024/images/tall.webp?updated=1615775871301&width=420','연재'),
('NIGHT LIFE (나이트 라이프)','나예리·락킨코리아',array['드라마']::text[],'나예리의 두 번째 단편집. "사막의 달", "Night Life", "내 친구는 예비 탐정", "메피스토", "Celebration"등의 단편이 실려 있다. 이 중"내 친구는 예비 탐정"은 작가의 첫 번째 단편집 프레일에 실렸던 "탐정이 될래요!"와 비슷한 형식으로 그려진 아동만화. 전반적으로 에 비해서 약간은 어둡고 무거운 분위기의 단편들이 실려 있다. ','https://www.lezhin.com/ko/comic/night_life','https://ccdn.lezhin.com/v2/comics/4758327496278016/images/tall.webp?updated=1470211187453&width=420','완결'),
('살롱H','박소희·재담미디어',array['드라마']::text[],'평범한 미용사가 최고의 디자이너로 성장하기까지의 험난한 여정을 그린 스토리! 그가 찾는 ''어사교도''의 정체는?!','https://www.lezhin.com/ko/comic/salon_h','https://ccdn.lezhin.com/v2/comics/5182863499198464/images/tall.webp?updated=1541732408645&width=420','완결'),
('파파 베이비 트라이얼','호시노 유즈키·조은세상·라르고',array['로맨스']::text[],'서로를 짝사랑하는 대학생의 기간 한정 두근두근 육아 라이프♡

대학생 소라는 쿨하고 잘생긴 후배 미나미를 중학생 때부터 짝사랑하는 중.
어느 날 미나미로부터 세 살 난 조카딸 하루를 같이 돌봐달라는 부탁을 받는다.
한 지붕 아래서 기간 한정의 육아 트라이얼 생활이 스타트!
종잡을 수 없는 미나미 때문에 두근두근 & 자유분방한 하루 때문에 우왕좌왕하다…
소라','https://www.lezhin.com/ko/comic/papa_baby_trial','https://ccdn.lezhin.com/v2/comics/6189632459046912/images/tall.webp?updated=1703213225492&width=420','완결'),
('십미견의 주인','j써니·엠스토리허브',array['판타지']::text[],'죽음의 저주를 지닌 소년 “그린비”
너무나도 강한 저주로 인해 그의 주변에는 아무도 남지 않게 된다.
그런 그의 비명에 답한 건 열 개의 꼬리가 달린 요괴 “십미견 이리”였다.

그러나 인연이란 “그린비”에게는 너무 벅찬 행복이었을까?
그의 저주를 풀어준다던 “이리”는 어느 날 자취를 감추게 되고, 또 다시 혼자가 된다.

그렇게 어느덧 고등학생이 된 “그','https://www.lezhin.com/ko/comic/master_of_tentail','https://ccdn.lezhin.com/v2/comics/6430911749226496/images/tall.webp?updated=1693904949948&width=420','완결'),
('폭식의 베르세르크 (코믹스)','타키노 다이스케·잇시키 이치카·소미미디어·S코믹스',array['판타지']::text[],'[스킬]의 우열이 절대적인 세계에서
《폭식》이라는 배가 고파지기만 하는 스킬을 가지고 태어난 페이트.
무능하다고 천대받으며 위험하고 급료도 적은 성의 문지기
일을 하면서 먹고 사는 밑바닥 생활을 하던 어느 날,
성에 침입한 도적을 해치움으로써 《폭식》의 진정한 능력,
‘죽인 상대의 스킬과 능력을 빼앗는’ 힘이 발동된다.

그날부터 운명이 주위를 휩쓸며
크게','https://www.lezhin.com/ko/comic/binge_eating_berserk','https://ccdn.lezhin.com/v2/comics/4914989053050880/images/tall.webp?updated=1626067123354&width=420','연재'),
('이세계로 전이했으니 치트를 살려 마법검사가 되기로 했다','나노라·신코 쇼토·대원씨아이',array['판타지']::text[],'눈을 떠보니 이세계로 전이한,
게이머 스즈미야 카에데.

이세계를 만끽하려고 했는데, 반칙적인 마력 및 스킬과
게임 지식으로 최강의 모험가가 되어있었다?!
《실격문장의 최강 현자》, 《전생 현자의 이세계 라이프》, 《이세계 현자의 전생 무쌍》의
신코 쇼토가 선사하는, 새로운 모험담 개막!

원작자가 쓴 단편 스토리도 수록!!

구성 : Itsuki Wata','https://www.lezhin.com/ko/comic/isekai_mahougeomsa','https://ccdn.lezhin.com/v2/comics/7011752813384444/images/tall.webp?updated=1753337207462&width=420','연재'),
('정반대인 우리들','나츠나 호노·대원씨아이',array['로맨스']::text[],'험상궂은 외모의 대형견과 함께 생활하는 카구라 치하루, 
사랑스러운 반려견과의 산책이 매일의 힐링이다. 
그런 그녀는 평소의 산책 코스를 돌던 중 
복슬복슬한 소형견을 데리고 나온 
덩치 큰 남자와 만난다──.

멈추지 않는 반전 매력에 분명 힐링될 거예요♪

Seihantai na Watashitachi
ⒸHono Natsuna
All rights res','https://www.lezhin.com/ko/comic/we_opposite','https://ccdn.lezhin.com/v2/comics/7011734655983715/images/tall.webp?updated=1735183096193&width=420','연재'),
('마법사의 여명기','타츠오·코바시리 카케루·시프트코믹스',array['판타지']::text[],'웨니어스 마법학교에 다니는 세빌은
학교 입학 이전의 기억을 잃어버렸다.
그런 그에게 교장은 반마녀파 세력이 강한
왕국 남부에 특별실습을 나가라고 명령한다.
동행은 여명의 마녀 로 크리스타스, 학년수석 홀트, 타락짐승 쿠드.
그들이 실습을 하며 알게 된 진실이란 ---?!

코바시리가 보내는 본격 판타지
『제로에서 시작하는 마법의 서』 
대망의 신 시리즈, ','https://www.lezhin.com/ko/comic/wizards_dawn','https://ccdn.lezhin.com/v2/comics/5531712705855488/images/tall.webp?updated=1705628846481&width=420','완결'),
('요시노즈이카라','요시노 사츠키·대원씨아이',array['일상']::text[],'그리고 싶다.
하지만,
히트 치고 싶다.

간신히 생활할 수 있을 만큼의 원고료를 받으며
만화가 생활 10년째를 맞이한 토오노 나루히코(32).
벌써 몇 편째의 연재작품이 끝내 종결되고,
더 이상 미래가 없는 나루히코에게
편집자가 제안해온 것은 그가 나고 자란 섬의
일상을 그리는 것이었다.
고집스럽게 그려온 판타지와는 정반대 장르에
나루히코는 반발하면서도 ','https://www.lezhin.com/ko/comic/yoshino','https://ccdn.lezhin.com/v2/comics/4994218482794496/images/tall.webp?updated=1602668275332&width=420','완결'),
('우울한 아침 노블 컬러즈 (NOBLE COLORS) (팬북)','히다카 쇼코·학산문화사',array['로맨스']::text[],'격동의 사회 속에서 엇갈렸던 서로의 마음이 이루어져 대단원의 완결을 맞이했던 인기 시리즈 「우울한 아침」.
히다카 쇼코의 섬세한 감정 묘사로 큰 인기를 얻은 시리즈의 스페셜 북이 발행된다.
국내에 두터운 마니아층을 지닌 히다카 쇼코의 「우울한 아침」 연재 당시 수록되었던 컬러 일러스트가 모두 실리고
노블 컬러즈만을 위한 쇼트 스토리 및 드라마CD에만 실렸던','https://www.lezhin.com/ko/comic/gloomy_morning_fan','https://ccdn.lezhin.com/v2/comics/5653828184375296/images/tall.webp?updated=1764235996602&width=420','완결'),
('나쁜 연애는 없다','문흥미·씨엔씨레볼루션㈜',array['로맨스']::text[],'사랑은 달콤하고 아름다울 수 있지만 서로를 파멸시키는 것일 수도 있다?

모든 사랑에 각각의 의미가 있습니다.

어떤 사랑이든 그 사랑으로 인해 우리는 성장해가죠.

&lt;나쁜 연애는 없다&gt;는 연애로서의 사랑이 아닌 지극히 현실적인 등장인물을 통해 사랑이 가지는 진짜 의미를 그립니다.

어른 냄새 물씬 풍기는 &lt;나쁜 연애는 없다&gt;','https://www.lezhin.com/ko/comic/no_bad_love','https://ccdn.lezhin.com/v2/comics/5226088717680640/images/tall.webp?updated=1627009513279&width=420','완결'),
('내 남편은 스트레스가 쌓이면 쇼타가 된다','지키 마사야·디앤씨미디어·HUSH(허쉬)',array['로맨스']::text[],'연애에 서툰 남편과(때때로 쇼타)
남편을 세상에서 제일 사랑하는 아내의
힐링 러브 코미디♡♡','https://www.lezhin.com/ko/comic/syota_otto','https://ccdn.lezhin.com/v2/comics/5753254795083776/images/tall.webp?updated=1698049914691&width=420','연재'),
('폭군 사장님의 달콤한 덫','FRAN·rageAbe·Nanami Tuzuki·라이트박스',array['로맨스']::text[],'"차기 사장님을 위한 체스말이 되어라."

악랄한 후배의 계략으로 더러운 소문에 휘말리고, 차기 사장님의 스폰까지 받으려 했다는 오해를 받게 된 아소 리호. 그런 상황에서 차기 사장은 오히려 그녀를 자신의 보좌로 스카웃한다. 

차가운 외모만큼 냉정한 성격의 사장, 쿠온 토마. 그는 회사의 비리, 부정을 척결하기 위해 아소 리호를 이용하기 시작한다. 강압적','https://www.lezhin.com/ko/comic/boss_sweet_trap','https://ccdn.lezhin.com/v2/comics/7011739952501712/images/tall.webp?updated=1752480286248&width=420','완결'),
('만질 수 없는 상대를 사랑할 때','마마카리·재미스튜디오·로맨스홀릭',array['로맨스']::text[],'만질 수 없는 상대를 사랑했어요. 만화가인 리카의 고민은 어린 시절에 생긴 남성 공포증 때문에 ''매력적인 남성을 그릴 수 없다는 점''이다. 만화가로서 위기에 처한 리카는 남자에게 겁먹지 않는 생활을 되찾기 위해 킥복싱을 배우게 된다. 그리고 체육관에서 만난 코치 고로마루에게 격투기를 배우는 가운데 그의 서투른 상냥함에 두근거리게 되는데… ⓒmamakari/','https://www.lezhin.com/ko/comic/cant_touch_you','https://ccdn.lezhin.com/v2/comics/6351013631033344/images/tall.webp?updated=1596610410897&width=420','완결'),
('콩깍지 컴퍼니','최은경·학산문화사',array['로맨스']::text[],'“어디에 있는 걸까? 내 반쪽은…”

실적이 좋지 않아 해고 직전인 커플 매니저 봉선희. 이 위기를 벗어날 방법은 단 하나! 바로 두두컴퍼니의 계승자이자 두두렌즈의 실장인 두진의 커플 매칭을 성공시키는 것이다. 사실 두진에게는 두두컴퍼니의 계승자에게만 내려오는 특별한 능력이 있어, 그동안 오백 번도 넘게 맞선을 봐오며 어떤 ‘한 사람’을 찾고 있었다. 하지','https://www.lezhin.com/ko/comic/kongkkagji_company','https://ccdn.lezhin.com/v2/comics/5596686527299584/images/tall.webp?updated=1615179952939&width=420','완결'),
('CHERISH FILM','도트리·키다리스튜디오',array['로맨스']::text[],'알바 중 쓰레기를 버리러 갔다가 스카우트당했다?! 근데 이 사장님 너무 신경쓰여요!','https://www.lezhin.com/ko/comic/cherish_film','https://ccdn.lezhin.com/v2/comics/5682600565080064/images/tall.webp?updated=1622002935535&width=420','완결'),
('마왕과 용사의 전쟁 뒤에서','아시오 란페이·도룡뇽·스즈키 유키·시프트코믹스',array['판타지']::text[],'이윽고 세계는 용사 마젤과 마왕의 싸움에 의해 운명이 결정된다―.
그런 RPG 게임 세계에 귀족 자제로 전생한 베르너.
스킬은 『창술』인 범부로, 틀림없는 엑스트라 캐릭터였다.

이대로라면 엑스트라로서 죽음을 기다릴 뿐…. 그렇게 판단한 베르너는 
비극을 피하기 위해 살아남을 방법을 모색하기 시작한다.

믿을 건 용사와 쌓은 우정과 전생의 지식과 지혜뿐.
','https://www.lezhin.com/ko/comic/bts_heroic_tale','https://ccdn.lezhin.com/v2/comics/4755091815596032/images/tall.webp?updated=1724131232394&width=420','연재'),
('별 눈동자의 실루엣','히이라기 아오이·루트미디어·클로버즈',array['로맨스']::text[],'카스미는 절친인 마리코와 같은 사람을 좋아하게 되어 버리고 만다. 하지만 마리코와의 우정을 생각해 마음이 더 깊어지기 전에 자신이 단념하려 하지만….
결심과는 다르게 시간이 갈수록 자연스레 눈에 들어오는 쿠즈미를 보며 자신의 첫사랑이었던 어린 시절의 남자아이를 떠올리게 되고! 순수했던 인연, 첫사랑, 우정 그리고 실연의 달콤 쌉싸름한 추억이 되살아 난다! ','https://www.lezhin.com/ko/comic/star_in_your_eyes','https://ccdn.lezhin.com/v2/comics/6299623738310656/images/tall.webp?updated=1471487149720&width=420','완결'),
('장군님의 남자','남이·호박마차·엠젯패밀리',array['로맨스']::text[],'총명한 여장군 이청연.
전쟁 중 인질로 잡힌 어머니를 제 손으로 죽이고, 승리를 거두고 돌아온다.
중상을 입어 의원에게 치료를 받던 도중, 적군의 첩자에게 감시당한다는 사실을 알게 되자 
자신을 치료해준 의원 유운과 연인 행세를 하기로 한다.
자신을 끌어내려는 배다른 동생과 그녀의 어머니의 계략,
또한 자신을 노리는 태자에게서 벗어나
행복해질 수 있을까?','https://www.lezhin.com/ko/comic/generals_man','https://ccdn.lezhin.com/v2/comics/5134559157747712/images/tall.webp?updated=1686807102544&width=420','완결'),
('운명 극장 : 놀부 박타령','SH·비욘드',array['로맨스']::text[],'#조선비엘 #선택형_웹툰

전래동화 흥부 놀부를 각색한 이야기로, 놀부네가 박을 타면서 벌어지는 BL웹툰!
그 안에서 다수의 선택은 어떤 결과로 이어질까?','https://www.lezhin.com/ko/comic/nolbu_baktaryeong','https://ccdn.lezhin.com/v2/comics/7011732683983951/images/tall.webp?updated=1734430530700&width=420','완결'),
('사랑의 조연','코지 사치코·지티이엔티',array['로맨스']::text[],'학창 시절부터 친하게 지내던 남녀 4명 모임 중 한 명인 키나. 키나는 츠카사에게 마음이 있었지만, 
츠카사는 키나의 친구 루이와 사귄 끝에 결혼까지 하게 된다.
결혼 준비를 돕기 위해 모인 키나와 유우타로는 서로의 고민을 말한 끝에 ''가짜''로 사귀기로 한다. 
어차피 우리는 행복한 주인공이 되지 못할 거니까….
©Koji Sachico/CLLENN','https://www.lezhin.com/ko/comic/love_supporting_role','https://ccdn.lezhin.com/v2/comics/5626251954028544/images/tall.webp?updated=1764042521510&width=420','완결'),
('[비애] 민들레에 내리는 비','이마 이치코·대원씨아이',array['로맨스']::text[],'&lt;백귀야행&gt; 이마 이치코 주옥같은 단편집.
| 민들레에 내리는 비 | 가능성의 문제 | 각봉투보다 무거운 | 천 개의 바늘이 노래한다 | 어느 맑은 날에 | 


무르익은 중년남 모리모토의 직업은 보험조사원.
하청업자가 대부분 그렇듯이 극심한 스트레스 속에 매일을 보낸다.
그러던 어느 날 밤, 기분전환 삼아 들른 술집에서 거나하게 취한 모리모토는','https://www.lezhin.com/ko/comic/dandelion_rain','https://ccdn.lezhin.com/v2/comics/5510484808302592/images/tall.webp?updated=1532679319970&width=420','완결'),
('용사님의 신부가 되고 싶어서(￣∇￣)ゞ','야마 토모히로·카네모리 치카이·시프트코믹스',array['판타지']::text[],'판타지 세계에서 전세의 기억을 가진 채 전생한 소녀 벨리나.
전세의 지식과 특수 스킬로 도시 생활을 즐기고 있던
그녀의 매일은, 용사 클라이스를 만난 순간
모든 것이 달라져 버렸다.

…용사님의 「극성팬」 생활로!

설령 불 속, 물 속 위험한
던전 속이라 할지라도
용사님의 모습을 10m 뒤에 숨어
마음껏 지켜보기 위해
쫓아가고 있습니다♡

모든 건 당신의','https://www.lezhin.com/ko/comic/yusha_no_yome_ni_naritakute','https://ccdn.lezhin.com/v2/comics/5765095096647680/images/tall.webp?updated=1646016458622&width=420','완결'),
('늑대 주인님에게 사랑받는 신부님 [연재]','cat-creativegroup·백두몽·라이트박스',array['로맨스']::text[],'병원에서 도망친 루나가 눈을 뜬 곳은 수인(獣人)들이 지배하는 세계.
이곳에서 인간은 번식을 위해 존재하고 있었다.

병약했던 루나는 위기 속에서 늑대 수인 카이르의 선택을 받고
살아남기 위해 펫이 되기로 결심한다.
하지만 카이르의 진짜 목적은 따로 있었는데?

이세계의 늑대 주인님과 인간 펫의 동상이몽 로맨스!','https://www.lezhin.com/ko/comic/wolf_master_bride','https://ccdn.lezhin.com/v2/comics/7011781254969792/images/tall.webp?updated=1781488838644&width=420','연재'),
('누나가 죽었다','오두영·로크미디어',array['드라마']::text[],'누나와의 추억이 떠오르고 난 뒤,
그제야 내가 무엇을 해야 하는지 알게 되었다.
놈을 잡을 것이다....','https://www.lezhin.com/ko/comic/sis_is_dead','https://ccdn.lezhin.com/v2/comics/7011771907793155/images/tall.webp?updated=1773043734290&width=420','완결'),
('천공의 옥좌','아오키 토모·아이온스타',array['로맨스']::text[],'절대권력의 황태후에게 맞서라!
근세 시대의 어느 왕조. 황태후가 절대적인 권력을 휘두르는 자금성에, 한 명의 소녀가 날아드는데…?!
시대를 관통하는 남매의 복수와 모험 활극!

Tenkuu no gyokuza
ⓒ Tomo Aoki 2013
Originally published in Japan in 2013 by Akita Publishing Co., Ltd','https://www.lezhin.com/ko/comic/cheongong','https://ccdn.lezhin.com/v2/comics/6702081682505728/images/tall.webp?updated=1591865174413&width=420','완결'),
('남주와 파혼하겠습니다','Studio 37.5·락킨코리아',array['로맨스']::text[],'인기 없는 로맨스 소설 작가인 내가 어느 날 갑자기 내가 쓴 로맨스 소설로 들어와 버렸다. 

그것도 하필, 온갖 악행을 저지르고 비참한 결말을 맞이하며 죽는 악녀로 말이다! 

이 결말을 피하려면 남자 주인공과 파혼해야만 한다!','https://www.lezhin.com/ko/comic/male_main_broken_marriage','https://ccdn.lezhin.com/v2/comics/7011739327639940/images/tall.webp?updated=1751868771143&width=420','완결'),
('작전타임','양여진·락킨코리아',array['로맨스']::text[],'맺힌 거 많은 다혈질 소녀 이채영! 하나뿐인 오라버니를 갈고 다듬어 세상을 향한 복수혈전을 시작했다. 못생긴 오빠를 4년동안 갈고 닦아 꽃미남을 만들어낸 채영. 오빠를 앞세워 자신을 괄시한 세상에 칼을 뽑지만 시작부터 팍팍 꼬이는 것이 영 심상치가 않다. 15년 평생의 원수 고소미에 대한 복수심을 불태우지만 어째 잘 안풀린다.','https://www.lezhin.com/ko/comic/time_out','https://ccdn.lezhin.com/v2/comics/5377039216672768/images/tall.webp?updated=1484733630949&width=420','완결'),
('대나무숲','고도슴·재담미디어',array['스릴러']::text[],'익명으로 진심을 주고받기 위해 만든 영예디 대나무 숲. 이 대나무 숲은 학생들의 소문의 근거지이며 3년간 아무 탈없이 잘 운영되었다. 그러나 MT를 다녀온 후, 대나무숲엔 저격폭탄과 함께 학교내에 이상한 소문이 돌기 시작한다.','https://www.lezhin.com/ko/comic/bamboo_grove','https://ccdn.lezhin.com/v2/comics/4558762444652544/images/tall.webp?updated=1596173520365&width=420','완결'),
('이대로 계속되는 닮지 않는 우리','아마사와 카니·㈜에이블웍스 씨앤씨·시트러스 코믹스',array['로맨스']::text[],'처음 참석한 중학교 동창회. 역으로 돌아가는 도중, 학생 때 거의 접점이 없던 요시무라에게 아다치가 말을 걸어온다. 
동창회에서 연애에 대해 요시무라가 친구들에게 자신의 의견을 단호하게 말하는 모습이 멋있었다는 아다치의 말에 당황한 요시무라.
어느 날 막차를 놓친 요시무라는 역에서 친구들과 있는 아다치를 만나 그의 집에서 묵게 된다.
연인과 살았다던 넓은 ','https://www.lezhin.com/ko/comic/dont_look_alike','https://ccdn.lezhin.com/v2/comics/6135251129925632/images/tall.webp?updated=1647423044744&width=420','완결'),
('쟈히 님은 기죽지 않아!','콘부 와카메·대원씨아이',array['판타지']::text[],'마계 NO.2인 쟈히 님은 마계에서는 누구나 두려워하는 존재였다. 
그러나 마력을 관장하는 마석이 붕괴되면서 인간계로 떨어진 쟈히님은 초라하기 그지없다. 
마력을 쓸 수 없는 쟈히 님은 집안일, 아르바이트에 치이는 존재가 되고 마는데…. 
돈이 없어 저녁밥도 먹기 힘들고 카페에서는 물 밖에 부탁할 수 없지만 기죽지 않으려 애쓰는 쟈히 님! 
안쓰럽지만 귀여','https://www.lezhin.com/ko/comic/the_great_jahy','https://ccdn.lezhin.com/v2/comics/4700643521658880/images/tall.webp?updated=1716171056948&width=420','연재'),
('붉은 꽃 푸른 열매','꼬·학산문화사',array['로맨스']::text[],'1929년 경성으로 떨어져, 하루아침에 ‘신원 불명자’가 된 나은과 주원, 그리고 친구들.

그들은 ‘신원 불명자’를 쫓는 일본군에게 정체를 들킬 뻔했지만
금산상회의 장남, 도빈의 도움으로 무사히 넘어간다.
도빈은 첫눈에 반한 나은의 주변을 맴돌지만
그녀 옆엔 오랫동안 나은을 짝사랑한 주원이 찰싹 붙어있어 친해지기가 쉽지 않다.

한편, 나은은 조용히 지내','https://www.lezhin.com/ko/comic/red_flower_green_fruit','https://ccdn.lezhin.com/v2/comics/5639543758979072/images/tall.webp?updated=1721193202675&width=420','완결'),
('신의 정원이 딸린 쿠스노키 저택','안자이 아키라·엔쥬·AK 커뮤니케이션즈·AK COMICS',array['일상']::text[],'시골 외딴집의 관리인을
맡게 된 쿠스노키 미나토.
그곳은 악령이 들끓는
터무니없는 사고 물건…
이었지만, 범상치 않은 힘으로
모르는 사이에 악령을 일소해 버렸다!
정화된 쿠스노키 저택의
아늑함에 이끌려
개성 넘치는 신들이 모이게 되는데!

이웃집 산신들과
힐링 시골 라이프,
시작합니다.','https://www.lezhin.com/ko/comic/kusunoki','https://ccdn.lezhin.com/v2/comics/7011762493117829/images/tall.webp?updated=1762825258890&width=420','연재'),
('파멸의 연인','GOUMOTO·대원씨아이',array['로맨스']::text[],'사랑이란 어떤 것일까.

그 여자는 유령일까, 마녀일까.
비밀기지 같은 귀신의 집에 사는, 유령 아닌 유려한 미녀와 소녀의 해후.
미스터리한 미녀와 그녀에게 점점 끌리는 소녀의 이야기.

HAMETSU NO KOIBITO by Goumoto
Ⓒ Goumoto 2023
All rights reserved.
First published in Japan in 2','https://www.lezhin.com/ko/comic/lover_doom','https://ccdn.lezhin.com/v2/comics/7011742356785164/images/tall.webp?updated=1743053926279&width=420','연재'),
('그는 여왕님','노비노비·넥스큐브·볼레로',array['로맨스']::text[],'‘아사히, 3번 돌고 짖어.’
학교에서 ‘여왕’이라 불리는 쿨 뷰티 유키토와 아사히는 사귀는 사이.
아사히가 축제 때 유키토에게 첫눈에 반해 맹렬히
들이댄 끝에 한 달 전부터 사귀기 시작했다.
드디어 사귀게 되었나 싶었는데
유키토는 아사히에게 ‘저거 해줘, 이거 해줘’ 명령한 하고….
결국엔 같은 반 애들에게 여왕과 하인이라는 소리까지 듣고 만다.
‘사귄다','https://www.lezhin.com/ko/comic/he_is_queen','https://ccdn.lezhin.com/v2/comics/7011758690039779/images/tall.webp?updated=1759310451355&width=420','연재'),
('원룸 멍멍이','쇼타 시로쿠마·소미미디어·포미포미',array['일상']::text[],'세상에서 개가 제일 좋은 샐러리우먼과 세상에서 자기가 제일 작은 줄 아는 사모예드, 둘만의 원룸 원더풀 라이프 시작♪ 새하얗고 폭신폭신한 대형견 사모예드, 포테마루는 원룸에서 주인인 히토미와 함께 동거중! 작아도 산책할 수 있는 정원이 있어 OK! 비오는 날이라도 산책이 제일 좋아♥ 빗질은 좋지만 샴푸는 조금 싫어♥ 읽는 것만으로도 힐링 가득♪ 우리집 대형','https://www.lezhin.com/ko/comic/oneroom_daengdaeng','https://ccdn.lezhin.com/v2/comics/6120620977618944/images/tall.webp?updated=1737079656395&width=420','완결'),
('블루 록 -EPISODE 나기-','산노미야코타·카네시로무네유키·노무라유스케·학산문화사',array['드라마']::text[],'『천재』란 찾아주는 사람이 있어야 비로소 그 윤곽을 드러낸다―.
나기 세이시로, 고등학교 2학년. "귀찮아"가 입버릇인 소년은 매일을 무기력하게 지내고 있었다.
일본 축구 월드컵 우승을 목표를 위해 설립된 육성 기숙사 "블루 록"과 파트너 미카게 레오가 그 재능을 발견하기 전까지는―.
『블루 록』 원작자, 카네시로 무네유키가 전하는 천재 나기 세이시로의 이','https://www.lezhin.com/ko/comic/bluerock_nagi','https://ccdn.lezhin.com/v2/comics/7011738296114889/images/tall.webp?updated=1778486741284&width=420','완결'),
('왼손을 위한 이중주','마츠오카 켄타·시프트코믹스',array['드라마']::text[],'「불량아의 오른손」과 「천재의 왼손」으로 피아니스트의 길을 달려간다!!
 암울한 나날을 보내는 불량 중학생 슈우는 천재 피아니스트 아카리와의 만남으로 변하기 시작한다.
 하지만 이내 아카리를 사고로 잃고 절망에 빠진 슈우는 그녀를 뒤따르려고 한다.
 그것을 저지한 건 슈우의 왼손에 깃든 아카리…?!','https://www.lezhin.com/ko/comic/for_left_hand','https://ccdn.lezhin.com/v2/comics/6015014436929536/images/tall.webp?updated=1744005528631&width=420','완결'),
('암흑여자','아키요시 리카코·아니사키 유나·AK커뮤니케이션즈·AK코믹',array['스릴러']::text[],'선택 받은 영애들만이 다닐 수 있다는
세이보 여자고등학교. 그곳에서
학교 제일의 미녀이자 모든 학생들의 동경을
한 몸에 받던 ‘시라이시 이츠미’가 사망하는 사건이 발생했다.
그로부터 딱 일주일 뒤의 방과 후.
이츠미가 회장을 맡고 있던 문학 동아리의 멤버들이
이츠미의 죽음에 관련하여 각자 직접 쓴 소설을 갖고
한자리에 모이게 되는데…!
이곳에서 그녀들 마음','https://www.lezhin.com/ko/comic/something_in_the_pot','https://ccdn.lezhin.com/v2/comics/6754201692274688/images/tall.webp?updated=1504836912583&width=420','완결'),
('사신의 연인','이동희·소희·더간지',array['로맨스']::text[],'혜국 최고의 상단 &lt;오월&gt;의 단주 채예영. 

분명히 명이 다해 죽었는데....눈을 떠 보니 젊은 여인의 몸이다?!  

단서를 찾기 위해 고군분투하는 예영과 그녀 곁에 맴도는 치명적인 매력의 사신단! 

미스터리한 그들의 달콤 살벌 무학관 로맨스♡','https://www.lezhin.com/ko/comic/envoy_lover','https://ccdn.lezhin.com/v2/comics/5719139511762944/images/tall.webp?updated=1611034319368&width=420','완결'),
('오컬트 짱은 말할 수 없어','혼다 하지메·하시모토 카에·대원씨아이',array['코미디']::text[],'이 세상은 온통 불가사의한 것들뿐!
심령, 요괴, 초과학, 도시전설,
모든 ''오컬트''의 뒤에는
아무래도 ''아인(亞人)''의 존재가─?!
이야기하고 싶어도 이야기할 수 없는
오컬트 짱들의 목소리가
요코와 자시코에게 닿을 때,
미지의 세계의 문이 열립니다!!

*감수 : Petos

Occult Chan Wa Katarenai
ⓒPetos 2019
ⓒKae Ha','https://www.lezhin.com/ko/comic/occult_chan','https://ccdn.lezhin.com/v2/comics/6203425097842688/images/tall.webp?updated=1689765019408&width=420','완결'),
('캔디','스즈키 유후코·데이즈엔터',array['로맨스']::text[],'사랑의 달콤함도 아픔도, 그 사람이 있으니까 현실인 게 아닐까――
궁도부의 미야모토 카난은 소위 ‘여학교의 아이돌’로, 여학생에게 고백받는 일도 흔하다.
“나 널 좋아하는 것 같아.”
재색 겸비 선배 벳쇼 치아키에게 갑자기 고백받고 어째서인지 몹시 동요해 버리는데….
달콤하고 애틋한 걸즈 러브 스토리.','https://www.lezhin.com/ko/comic/candy','https://ccdn.lezhin.com/v2/comics/7011747813145508/images/tall.webp?updated=1747892584974&width=420','완결'),
('열등 용자의 이세계 바이블 [연재]','나카야마 미치루·레진코믹스',array['코미디']::text[],'[휴재 중] 
어느 날, 연재중단(해고)을 당해, 자신을 필요로 하는 곳이 생기기를 바라던 인기없는 에로만화가 스즈키는 이세계로 전이당한다.
스즈키가 가지고 있던 에로 만화로 인해 나라의 재정파탄을 막은 다우징국의 왕은 스즈키에게 신작 작성을 의뢰한다.
한편 복제마법을 쓸 수 있는 탓에 에로만화를 복제하는 일이 업무가 되어버린 현자 유리의 불만은 쌓여만 가','https://www.lezhin.com/ko/comic/isekai_bible','https://ccdn.lezhin.com/v2/comics/6098215278804992/images/tall.webp?updated=1681458086660&width=420','연재'),
('이세계 전이, 지뢰 주의','레루시·시프트코믹스',array['판타지']::text[],'치트는 없지만 지뢰 스킬이 있는
이세계로 보내진 학생들.
그 속에서 나오, 하루카, 토야, 소꿉친구 3인조는
안주할 땅을 만들기 위해 행동을 개시한다.
현실적이고 집단이기에 강해질 수 있는,
현실 슬로우 라이프가 개막!','https://www.lezhin.com/ko/comic/landmine_warning','https://ccdn.lezhin.com/v2/comics/6105330368184320/images/tall.webp?updated=1647846693785&width=420','연재'),
('Not so bad(낫 소 배드)','이해·락킨코리아',array['로맨스']::text[],'일이 잘 풀리는데도 은근히 염증을 느끼던 은희는 집 앞에 버려진(?) 고양이 같은 남자, 가인을 보호하게 된다. 그다지 나쁘지 않은 두 남자의 동거 생활. 하지만 뭔가 허전하고 불안한 감정의 이끌림이 계속되던 어느 날, 은희는 고열로 쓰러지게 되고, 가인은 그런 은희를 돌봐준다. ''뭐, 이건 이대로 나쁘지 않아!'' 그들만의 의외인 시간의 마법.','https://www.lezhin.com/ko/comic/not_so_bad','https://ccdn.lezhin.com/v2/comics/6385114486734848/images/tall.webp?updated=1641191614255&width=420','완결'),
('좋아한다고 외칠래','토와·학산문화사',array['로맨스']::text[],'한 학년 위의 궁도부 선배 토모치카를 좋아하는 유키나가. 
하지만 유키나가는 소심한 성격이 소심한 탓에, 동경하는 선배를 바라보는 것만으로도 만족했다.
그러던 어느 날, 길에서 다친 고양이 한 마리를 구해주게 된 유키나가.
놀랍게도 그 고양이는 토모치카네 고양이였고
그 일을 계기로 유키나가의 사랑이 들썩이기 시작하는데─?!','https://www.lezhin.com/ko/comic/shout_like','https://ccdn.lezhin.com/v2/comics/4900903368065024/images/tall.webp?updated=1764300975635&width=420','완결'),
('오만상과 편견','유현숙·재담미디어',array['로맨스']::text[],'매 순간마다 오해와 편견으로 부딪히는 남녀의 로맨스!','https://www.lezhin.com/ko/comic/omansang_prejudice','https://ccdn.lezhin.com/v2/comics/5313239714037760/images/tall.webp?updated=1708071606885&width=420','완결'),
('그 오타쿠, 전직 암살자','Ko-dai·시프트코믹스',array['드라마']::text[],'어느 날, 이탈리아에서 전설적인 암살자가 모습을 감췄다―.

냉혹하고 무자비한 암살자 마르코가 임무처에서 만난 건, 하나의 피규어였다.
「귀여워…!」
일본의 오타쿠 문화에 매료된 마르코는 모든 걸 버리고 일본행을 결의.
그런 그를 그냥 내버려 둘 리 없는 어둠의 사회에서 보낸 자객이 차례차례 등장한다.
마르코는 수많은 추적자에게서 도망쳐 일본에서 무사히 오','https://www.lezhin.com/ko/comic/moto_koroshiya','https://ccdn.lezhin.com/v2/comics/6184068692901888/images/tall.webp?updated=1653543423152&width=420','연재'),
('교화한 몬스터로 영지 디펜스 [연재]','망치단장·덕3·이바다·아트닷',array['판타지']::text[],'쌀먹하던 게임 속에 빙의된 청년 가장 방호영. 여왕의 심기를 건드려 ''변방백''으로 부임되고 만다.
봉토로 받은 영지는 황무지의 폐허 그 자체. 게다가 마물이 계속 쳐들어온다.
믿을 거라곤 스킬로 받은 [교화]뿐. 마물을 아군으로 만들어 영지를 발전시키고 지켜나간다!

(웹소설 원작)','https://www.lezhin.com/ko/comic/monster_defense','https://ccdn.lezhin.com/v2/comics/7011766126153867/images/tall.webp?updated=1779858734180&width=420','연재'),
('그녀는 로쿠로쿠비','니에키 즈이·대원씨아이',array['로맨스']::text[],'나츠키, 고등학교 1학년생.
활발하지만 목이 살짝 잘 늘어나는 체질 옆집에 사는 소꿉친구 이츠키가 조금 신경 쓰인다.
사상 최초?! 로쿠로쿠비 청춘 코미디!
She is ROKURO-KUBIⓒZui Nieki 2015
All rights reserved.
First published in Japan in 2015 by Kodansha Ltd., Tokyo
','https://www.lezhin.com/ko/comic/rokurokubi','https://ccdn.lezhin.com/v2/comics/4690906647429120/images/tall.webp?updated=1617876050721&width=420','완결'),
('최강 검성의 마법수행','사츠키 야미·넨쥬 무기챠타로·B-긴가·시프트코믹스',array['판타지']::text[],'신비한 던전 『천추의 탑』에 단독으로 도전하는 모험가, 라그나.
오로지 검 한 자루를 들고 탑의 상층부로 돌진해가는 그를 사람들은 “최강 검성”이라고 불렀다-.
하지만, 라그나는 아무도 다다른 적이 없는 제7층에서 성장 한계인 레벨 99를 맞이하고 말았다.
검 이외의 전투는 할 줄 모르고, 등 뒤를 맡길 동료도 없는 와중에,탑의 완전 공략을 목표로, 라그나','https://www.lezhin.com/ko/comic/saikyo_kenesi','https://ccdn.lezhin.com/v2/comics/4920421100355584/images/tall.webp?updated=1723442926943&width=420','완결'),
('첫 마음 [개정판]','톳기·메타툰·라옌·송민선',array['로맨스']::text[],'[휴재 중] “넌 내 피부 같거든. 조금도 떨어지는 게 싫어.”

19년 전.
뿌연 안개 속에서 주워 온 말라깽이 여자아이, 여혜준.

“내쫓지 말아 주세요. 저 밥 조금만 먹어요. 한 끼만 주셔도 돼요.”

처음엔 그저 충동적인 연민이었다.
제 울타리 안에서 보듬어 주면 그만이었던 알량한 마음.

“선을 보고 있어요.”
“엄청, 흥분되네. 네가 지금 여기','https://www.lezhin.com/ko/comic/ones_first_heart_15','https://ccdn.lezhin.com/v2/comics/7011733964133106/images/tall.webp?updated=1743054640332&width=420','연재'),
('전학생은 복실맨','아이야 큐·넥스큐브·미즈',array['코미디']::text[],'우루시마 니코게는 우수한 성적에 만능 스포츠맨으로 선생님은 물론 학생들에게도 
신뢰가 두터워서 학생회장까지 역임하고 있는 완벽한 고등학생이다.
하지만 그에게는 남에게 절대 말할 수 없는 비밀이 있는데, 
그것은 바로‘폭신폭신/복슬복슬’한 것을 아주 좋아한다는 것.
들키면 분명히 바보취급을 당할 것 같기에 니코게는 무슨 일이 있어도 비밀을 지키려고 필사적이다','https://www.lezhin.com/ko/comic/pompom_transfer','https://ccdn.lezhin.com/v2/comics/4952028322463744/images/tall.webp?updated=1626414172560&width=420','완결'),
('연예인의 남자친구','키쿠노 안·아사다 토모·지티이엔티',array['로맨스']::text[],'스타가 된 키라 하야토를 밑바닥 시절부터 응원해 온 아이자와 츠무기.
키라가 유명해지는 것을 순수하게 기뻐하고 있던 그때, 그가 적극적으로 다가오고─
츠무기는 자신이 방해되지 않을까 싶은 생각이 들면서도 거부하지 못하는데…ⓒAn Kikuno 2018/Tomo Asada 2018','https://www.lezhin.com/ko/comic/celebritys_lover','https://ccdn.lezhin.com/v2/comics/6413603229466624/images/tall.webp?updated=1606199645636&width=420','완결'),
('파사','함형숙·락킨코리아',array['드라마']::text[],'난 널....널 죽여서... 영원히 내것으로 만들 수도 있어! 그렇게 해서라도 널 내것으로 들고 싶어! 하지만...','https://www.lezhin.com/ko/comic/pasa','https://ccdn.lezhin.com/v2/comics/4675193394167808/images/tall.webp?updated=1465437263913&width=420','완결'),
('고기건달','모리오 마사히로·사사키 요시아키·미디어팜',array['드라마']::text[],'할아버지가 운영하던 고기요리 전문식당 「아사쿠라」를 물려받은 손녀 마나비.
의욕은 있으나 요리 실력은 꽝이라 가게는 파리만 날릴 뿐.
그런 「아사쿠라」에 어느 날 초대받지 않은 손님이 찾아오는데….','https://www.lezhin.com/ko/comic/gogi_gundal','https://ccdn.lezhin.com/v2/comics/5968975235448832/images/tall.webp?updated=1623638005100&width=420','연재'),
('러브 미 퐁포코!','아카가와라 모도무·학산문화사',array['로맨스']::text[],'종족의 생존을 걸고, 인간 남자와 결혼하기 위해 산에서 내려온 너구리 요괴 퐁코(♀).
수컷을 물색하기 위해 부자 학교에 입학했으나,
너구리 모습으로 어떤 쌍둥이의 집에 머물게 된다!
그 쌍둥이는 부자 학교 안에서도 정점에 군림하는 니노미야 형제!
너구리 요괴라는 사실을 금방 들키고 말았지만,
어떤 조건을 전제로 퐁코의 결혼 활동을 도와준다고 하는데…?!
','https://www.lezhin.com/ko/comic/love_me_ponpoko','https://ccdn.lezhin.com/v2/comics/6378260903821312/images/tall.webp?updated=1764234643153&width=420','완결'),
('마물들은 정돈이 안돼','타카노 유야·대원씨아이',array['판타지']::text[],'용 이도르에게 산제물로 바쳐진 수녀가
용이 모르는 마법 ‘청소’를 이용해
세계를 조금이나마 바꿔간다.

닦고 쓸고 광내는 ‘청소’는 마법입니다.
수녀&드래곤의 훈훈 이세계 청소 코미디!
신작 6.5화 &lt;비밀의 크리엘라&gt; 수록.

ⓒYuya Takano/SQUARE ENIX CO., LTD.','https://www.lezhin.com/ko/comic/monsters_cant_clean','https://ccdn.lezhin.com/v2/comics/6203184440999936/images/tall.webp?updated=1623136155533&width=420','완결'),
('재회의 카르마','요시다 노리코·텐료지 세나·TOHOKUSHINSHA FILM CORPORATION',array['드라마']::text[],'죽음 후 과거로 돌아온 잠입 경찰 반.
복수를 위해 조직 ''키리하파'' 에 다시 잠입한다!

"나를 죽인 자를 찾아라!"

반은 조직의 부두목 료와 위험한 동거를 시작하고
두 사람이 죽음의 그림자에 가까워지는 순간
시간은 뒤틀리고 복수의 칼날은 끝없이 흔들린다.

타임 루프 서스펜스 드라마
''재회의 카르마''','https://www.lezhin.com/ko/comic/karma_of_reunion','https://ccdn.lezhin.com/v2/comics/4748139855806464/images/tall.webp?updated=1722335075262&width=420','연재'),
('도쿄 리벤저스 ~바지 케이스케로부터의 편지~','나츠카와구치 유키노리·와쿠이 켄·학산문화사',array['드라마']::text[],'마츠노 치후유와 바지 케이스케, 두 사람의 만남에서 이별까지의 이야기.
바르바라와의 항쟁에서 1번대 대장 바지 케이스케를 잃은 부대장 마츠노 치후유는 그 죽음을 아직 받아들이지 못하고 있었다.
그러던 때, 그의 손에 생전의 바지가 보낸 편지가 도착한다―.','https://www.lezhin.com/ko/comic/tokyo_revengers_letter','https://ccdn.lezhin.com/v2/comics/5487515704950784/images/tall.webp?updated=1764304895946&width=420','연재'),
('콘트라스트','itz·학산문화사',array['로맨스']::text[],'언제나 사람들의 중심에 서 있는 인기인이지만 어딘가 차가운 면이 있는 미남 아오야마 카나타와, 성적이 우수한 특진반의 외로운 늑대 센카와 아키라.
반도 이름도 모르지만 서로의 얼굴만은 알고 있었다.
그런 대조적인 동급생이 어느 날 옥상으로 이어지는 인기척 없는 계단참에서 만난다.
그날부터 옥상은 두 사람만의 비밀의 장소가 된다―.
침묵조차 마음 편한, 온화','https://www.lezhin.com/ko/comic/contrast','https://ccdn.lezhin.com/v2/comics/4596650881122304/images/tall.webp?updated=1764235837503&width=420','완결'),
('여성향 게임의 엑스트라조차 아니지만','교쿠로·히메노 메노·데이즈엔터·루체코믹스',array['로맨스']::text[],'불의의 사고를 당한 결과,
여성향 게임 속 세계에 수습 정원사 이자크로 환생한 타이치. 

하지만 원래 게임에 그런 캐릭터는 존재하지 않는데….

공작 영애 류디아와
엑스트라조차 아닌 소년이 만들어내는 교류와 성장 스토리.','https://www.lezhin.com/ko/comic/extra_game','https://ccdn.lezhin.com/v2/comics/7011743141194140/images/tall.webp?updated=1745457303265&width=420','연재'),
('록은 숙녀의 소양이기에','히로시 후쿠다·대원씨아이',array['코미디']::text[],'부잣집 아가씨 학교에서 답답한 생활을 보내고 있는 서민 출신인 스즈노미야 리리사.
리리사는 재혼한 어머니의 소망을 위해서
필사적으로 ''아가씨답게’ 행동하려고 매일 노력하고 있다.
그러던 어느 날, 지금은 사용하지 않는
옛날 학교 건물에서 들려오는 소리에 이끌리게되는데···?!
화려하고 정숙한 소녀들의 음악 청춘 스토리!!

ROCK WA LADY NO TA','https://www.lezhin.com/ko/comic/rock_for_ladies','https://ccdn.lezhin.com/v2/comics/7011750808302995/images/tall.webp?updated=1751866318387&width=420','연재'),
('해바라기 -켄이치 전설-','히가시무라 아키코·학산문화사',array['드라마']::text[],'미술 대학을 졸업했지만, 슈퍼 취직 빙하기 때문에 아버지와 같은 회사에 취직하게 된 아키코.
그녀의 아버지(하야시 켄이치, 50세)는 회사에서 크림 빵을 먹고,
타인(주로 아키코)의 이야기를 듣지 않고, 알 수 없는 역린을 가진, 
한 치 앞도 예상할 수 없는 사람!
그의 전설과 아키코의 고뇌의 날들은 아직 초기 단계─.
전대미문의 아버지에게 휘둘리는 딸의','https://www.lezhin.com/ko/comic/sunflower','https://ccdn.lezhin.com/v2/comics/5895741405986816/images/tall.webp?updated=1764313194831&width=420','완결'),
('인생은 장밋빛?','야마모토 코테츠코·조은세상·라르고',array['로맨스']::text[],'사랑의 저주로 인형이 되어버렸다?!?!?!

사장의 아들인 사이온지 마코토에게는 몰래 짝사랑 중인 상대가 있다.
입사 2년 차지만 유능한 능력 덕에 사장 비서로 일하는 중인 아즈마 코헤이다.
첫눈에 반했어♥ 그런 아즈마가 마코토의 지도 담당이 됐다!
들뜬 마코토는 쌍둥이 여동생인 마미에게 그 사실을 알려준다.
그게 모든 일의 시작이었다――
마미의 주문 때문','https://www.lezhin.com/ko/comic/roselife','https://ccdn.lezhin.com/v2/comics/6584138836672512/images/tall.webp?updated=1766454634677&width=420','연재'),
('나를 봐 줘, 선생님 [개정판]','아즈미 츠나·넥스큐브·페어리',array['로맨스']::text[],'[본 작품은 여러 단편으로 구성된 단편집이며, &lt;나를 봐 줘, 선생님&gt; 성인 버전의 일부 장면을 수정한 15세 개정판입니다. 이용에 참고 부탁드립니다.]

순수한 연심이야말로 위험하다.

카와시마는 생물학 교수. 안경을 쓴 흑발에 쿨한 외모를 지녔지만
의외로 느껴질 정도로 배려심이 좋아 여학생들에게도 인기가 많다.
늘 고백을 받는 카와시마였지만 ','https://www.lezhin.com/ko/comic/teacher_look_at_me','https://ccdn.lezhin.com/v2/comics/5114726714507264/images/tall.webp?updated=1590479799767&width=420','완결'),
('악녀는 흑화한 공작님만 공략할 수 있다 [연재]','프리즘스튜디오·쿠로사와·츠카사·아사히마사',array['로맨스']::text[],'사망 엔딩 피하려다 흑화한 공작이 달라붙었다!

미움받지 않기 위해 늘 눈치를 보며 살아온 나사랑.
불의의 사고 후, 좋아하던 연애 시뮬레이션 게임 속 악녀 ''안네리제''로 환생한다.

모두에게 미움받고 죽는 운명을 바꾸고,
이번 생엔 단 한 사람에게라도 사랑받고자 원작의 전개를 거스르려 한다.

하지만 아무리 애써도 원작의 전개는 좀처럼 바뀌지 않고...
','https://www.lezhin.com/ko/comic/villainess_target_duke','https://ccdn.lezhin.com/v2/comics/7011774417398074/images/tall.webp?updated=1775205034760&width=420','연재'),
('변경 도시의 육성자','히다카·나나노 리쿠·시프트코믹스',array['판타지']::text[],'슬럼프에 빠진 중견 모험가 레베카가 만난 것은, 변경 도시의 외곽 폐교회에서 사는 온화한 청년 하루. 그녀 자신도 포기한 재능을 하루가 육성한다─?! 레베카의 성장과 하루의 실력은 과연 어떻게─.','https://www.lezhin.com/ko/comic/bordertowns_breeder','https://ccdn.lezhin.com/v2/comics/6537095610171392/images/tall.webp?updated=1669774319133&width=420','연재'),
('안녕, 내 똥강아지','너불이·아이럽설·J STUDIO',array['로맨스']::text[],'특별관리보좌 8급 공무원. 제이.
영혼이 부서질 정도로 큰 상처를 받은 아이를 사랑으로 치유해 주는 것이 바로 그녀의 임무.

표정 없는 인형 같던 아이 비히는 제이에게서 조금씩 감정을 배워 나가고,
제이의 사랑스러운 똥강아지가 된다.

하지만 행복도 잠시,
보좌 종료 통보를 받고 이별의 기로에 놓인 제이는 비히를 따라 차원을 건너기로 결심하는데.','https://www.lezhin.com/ko/comic/dear_my_doggy','https://ccdn.lezhin.com/v2/comics/7011744105672313/images/tall.webp?updated=1753924766280&width=420','완결'),
('아리스와 아마릴리스','오자와 마리·시프트코믹스',array['드라마']::text[],'키나리 아리스, 초등학교 5학년.
미인 엄마, 노력파 아빠와 함께 사는 
그림으로 그린 듯 행복한 가족.
그러나 예기치 않은 방문자가 나타나면서 
가족은 커다란 변화를 맞이하게 된다―.
힘든 상황 속에서 손을 맞잡은 엄마와 아리스는…?

모녀 관계를 섬세한 터치로 그려내는 오자와 마리의 
조금 어른스러운 엄마와 딸의 사랑 이야기!','https://www.lezhin.com/ko/comic/allice_and_amaryllis','https://ccdn.lezhin.com/v2/comics/5110693790547968/images/tall.webp?updated=1600056580150&width=420','완결'),
('병아리와 밤과 유원지','ymz·소미미디어·BB허니밀크',array['로맨스']::text[],'이 사람과 함께라면
슬플 겨를이 없을 거야.

외국계 금융회사에 근무하는 키요시는
못하는 게 없는 인기남이자 슈퍼 달링 남친.
그리고 토우야는 탐정사무소 조사원이자
마음씨 착한 상식인이다.

항상 자신만만한 키요시는
토우야 입장에서 성가실 때도 있고
위안이 될 때도 있다!
그리고 연애에 관해선
유독 겁이 많아지는 키요시 앞에서
토우야의 역대급 멋짐과 사랑이','https://www.lezhin.com/ko/comic/hiyoko_to_yoru_to_yuenchi','https://ccdn.lezhin.com/v2/comics/4921816737710080/images/tall.webp?updated=1677837413335&width=420','완결'),
('조연인데 과보호 공작에게 익애받고 있습니다','미카즈키 미야·AK 커뮤니케이션즈·AK 코믹스',array['로맨스']::text[],'여성향 게임… 조연으로 환생?! 거기다 약혼자는 잘생긴 공작님이라고?!
조연에 불과한 나에게 쏟아지는 이세계표 사랑 폭탄!!

여성향 게임의 엑스트라 캐릭터 『레티시아』로 환생한 ‘나’는, 
성격이 나쁜 쌍둥이 언니로부터 약혼자 리오넬을 떠맡게 된다.
처음 만난 리오넬은 소문대로 살짝 통통한 모습… 이었지만, 
레티시아는 갈고 닦으면 빛날 게 분명한 원석이','https://www.lezhin.com/ko/comic/supporting_loved','https://ccdn.lezhin.com/v2/comics/7011749362264827/images/tall.webp?updated=1749545783410&width=420','연재'),
('달이 뜨는 강','Katoya Daigo·jyouhune·한지훈·IMXTOON',array['로맨스']::text[],'6세기 중반 고구려 왕의 딸 평강은 총명하고 강한 정의감
으로 장차 아버지의 뒤를 이어 군주가 되어 나라를 지키겠
다는 꿈을 가졌다. 반면 국경을 지키는 순노부족 온협 장
군의 아들 온달은 아버지를 동경하는 호기심 많은 소년이
었다.
그 무렵 조정에서는 막강한 힘을 가진 계루부족 고원표가
다른 두 부족과 손잡고 왕좌를 빼앗으려 하고 있었다. 용
왕비는 평강','https://www.lezhin.com/ko/comic/moonrising_river','https://ccdn.lezhin.com/v2/comics/4926890481352704/images/tall.webp?updated=1702026939929&width=420','연재'),
('재벌 후계자에게 한결같은 사랑을 받고 있습니다','이와하타 타키요·케이코·제이박스엔터테인먼트',array['로맨스']::text[],'“나와 결혼해 줄래?”
그레이스 호텔 도쿄의 컨시어지인 마츠시타 이치카는
모두가 존경하는 총지배인 미즈키 아야토를 남몰래 동경하고 있었다.
그러던 어느 날, 갑자기 아야토에게 프러포즈를 받는데…?!

사실은 몸이 아픈 어머니를 안심시키기 위해서 약혼자인 척을 해달라는 것이었다.
처음에는 당황하던 이치카였지만, 진지한 그의 눈빛에 마음이 흔들려 그 청을 받아','https://www.lezhin.com/ko/comic/chaebol_love','https://ccdn.lezhin.com/v2/comics/7011777273325553/images/tall.webp?updated=1777857653783&width=420','연재'),
('낙오자였던 형이 사실은 최강','무라카미 요시유키·이바라키노·AK 커뮤니케이션즈·AK 코믹스',array['판타지']::text[],'용사 유진은 마왕과의 사투를 끝낸 뒤 강제로 아득히 먼 미래에 전생을 하게 된다.
그렇게 ‘율리우스’가 된 유진은 쌍둥이 동생 가이어스를 포함해 주변에서 낙오자 취급을 받는 상황.
하지만 이전 세계의 자아와 강대한 힘을 지니고 전생을 한 율리우스는 무자각하게 무쌍을 해나가기 시작하는데…!

여유로운 형님의 무쌍극, 개막!!','https://www.lezhin.com/ko/comic/actually_best_bro','https://ccdn.lezhin.com/v2/comics/7011744358209327/images/tall.webp?updated=1744783047831&width=420','연재'),
('남편이 용사로 각성했다','양념갈비·소은·no5·위즈덤하우스',array['로맨스']::text[],'철없는 남편이 용사가 되겠다며 뛰쳐나간지 삼년, 진짜 용사가 되어 돌아왔다.
그런데 뭔가 이상하다? 내가 아는 용사랑 좀 다른 것 같은데?
남편을 따라 수도로 올라간 셜리는 온통 낯선 상황에, 전에는 몰랐던 남편의 이면까지 알게되는데...

#남편 남주 아님
#현실주의여주 #평민여주 #이혼여주 #무심여주 #귀족남주 #다정남주

한달 전 이웃집 린다 아주머니','https://www.lezhin.com/ko/comic/husband_awaken_warrior','https://ccdn.lezhin.com/v2/comics/5387940543004672/images/tall.webp?updated=1708242511690&width=420','완결'),
('심장을 녹여줘','Hutao·Kuaikan Comics·스토리숲',array['로맨스']::text[],'어느날 하늘에서 떨어져 집을 박살내버린 눈뭉치에서... 
사람이 튀어나왔다?!
​
갑자기 내 인생에 나타난 사고뭉치라고만 생각했는데 
말도 안 되게 신비한 능력을 가지고 있는 남자라니!
게다가 그 능력으로 돈도 벌게 해준다고? 이게 웬 횡재람?
​
돈만 받으면 된다고 생각해 옆에 두었는데...
차갑게 얼어붙은 네가 자꾸 눈에 밟혀!
​
내가 네 심장을 녹이','https://www.lezhin.com/ko/comic/melting_heart','https://ccdn.lezhin.com/v2/comics/6648099184640000/images/tall.webp?updated=1649034087672&width=420','완결'),
('엘리의 호텔','스튜디오원픽·Bora Song·MU·펭귄박사·오름미디어',array['판타지']::text[],'눈을 떠보니 금수저 백작 영애 엘레나 벨몬테가 되어 있었다!

어리둥절한 것도 잠시, ‘엘리’로서 풍요로운 귀족 영애의 삶을 누리며 호텔리어였던 전생의 경험을 살려 가문의 신사업으로써 호텔 경영을 제안한다. 그러자 아버지 벨몬테 백작은 이 호텔 경영관리를 ‘셰인 이그니츠’에게 맡기겠다고 하는데….

그 이름을 들은 엘리는 불현듯 깨닫는다. 이곳이 바로 자신','https://www.lezhin.com/ko/comic/ellys_hotel','https://ccdn.lezhin.com/v2/comics/5236285493149696/images/tall.webp?updated=1707209536171&width=420','완결'),
('Let''美人(렛미인)','DAZUI·엠스토리허브',array['로맨스']::text[],'현실에선 추녀, 게임 속에선 둘도 없는 여신.
‘하지만 영원히 게임 속에서 살수 있는 것도 아니잖아…’
아니, 돼!!
현실에서 또 한번 남자한테 버림 받은 김다영. 
그런 그녀가 게임 속으로 들어가 버렸다. 
미션은 “여신이 되어 남자들을 정복하기!” 
게임으로 일가견이 있는 김다영에게 불가능한 미션은 없다!','https://www.lezhin.com/ko/comic/let_beauty','https://ccdn.lezhin.com/v2/comics/5265692755296256/images/tall.webp?updated=1730794540932&width=420','완결'),
('don''t like this','쓰루타니 가오리·AK 커뮤니케이션즈',array['일상']::text[],'현대 여성 한 사람의 이야기, 최종화를 포함한 24 페이지의 보너스 에피소드 수록!
내가 좋아하는 것, 싫어하는 것.
겉보기엔 남 부럽지 않은 환경에 놓인 아가씨지만, 스스로는 그 환경이 썩 맘에 들지 않습니다.
집에서 꼼짝도 안 하는 집순이, 메구미는 그런 생활에 질려가던 무렵,
퇴사한 직장 동료 ‘동굴 선배’ 로부터 낚시를 권유 받게 됩니다.
타의로 인','https://www.lezhin.com/ko/comic/dont_like_this','https://ccdn.lezhin.com/v2/comics/4838826509926400/images/tall.webp?updated=1575365048663&width=420','완결'),
('2살 차이 소꿉친구','이노토코·대원씨아이',array['로맨스']::text[],'그저 소꿉친구라고 생각했는데 어느새···?
달콤한 연상연하 소꿉친구 스토리!

그저 귀여운 동생 같은 소꿉친구라고 생각했는데,
6년이 지난 지금은···.
사귀기 전에도 사귄 후에도,
생각해보면 계속 두근두근하고 있어요!

2SAI SA NO OSANANAJIMI
ⒸItonoko 2023
First published in Japan in 2023 by KAD','https://www.lezhin.com/ko/comic/2years_apart_age_friends','https://ccdn.lezhin.com/v2/comics/7011728607454552/images/tall.webp?updated=1728893473547&width=420','완결'),
('당신이 원하신다면','고을원·도도·키다리스튜디오',array['로맨스']::text[],'''종족을 초월한 신과 여고생의 러브스토리!
몇 세기가 지나도록 자신이 필요할 때만 신을 찾는 인간들에 지친 신! 
어느날 대한민국 평범한 한 여고생이 신에게 어떤 기대도 하지 않는 다는 것을 알고 지상에 내려오게 된다. 
신은 진정 자신에게 아무것도 바라지 않는다면 자신의 모든 것을 주겠다고 제안하고, 여고생은 잘생긴 신의 얼굴에 홀려 얼결에 내기를 받아들','https://www.lezhin.com/ko/comic/if_you_want','https://ccdn.lezhin.com/v2/comics/5180855525113856/images/tall.webp?updated=1677465904776&width=420','완결'),
('스위트 페인 테라피 [개정판]','토우지 후유·넥스큐브·볼레로',array['로맨스']::text[],'[해당 작품은 &lt;스위트 페인 테라피&gt; 성인 버전의 일부 장면을 수정한 15세 개정판입니다. 이용에 참고 부탁드립니다.]

"나를… 지배해 줘."
직장에서 Dom이라고 소문이 날 정도로 항상 침착한 태도인 사쿠.
하지만 사실은 Sub 충동을 억제제로 속이고 있을 뿐이었다.
그러던 중 재회한 마오는 아픔으로 사키의 서브를 각성시킨, 강렬하고 빈틈없는','https://www.lezhin.com/ko/comic/sweet_pain_therapy_15','https://ccdn.lezhin.com/v2/comics/6653008116252672/images/tall.webp?updated=1661154853485&width=420','완결'),
('술과 사랑은 취해야 제맛','하루코·AK 커뮤니케이션즈·AK 코믹스',array['로맨스']::text[],'32살, 술을 즐기던 나를 찾아 온 새로운 두근거림. 그.런.데…?

32살 회사원 마츠코는
사케가 너무 좋아 매일 집에서 ‘원컵’을 홀짝인다.
남자가 없는 생활은 3년째.
혼자는 즐겁지만, 사랑도 하고 싶다.
그런 그녀의 관심이 향하는 건 회사의 쿨한 연하남.
단둘이 술을 마셔보니
사실 그는 최고로 「귀여운 주정뱅이」였는데…?!

사케를 너무 좋아하는 회','https://www.lezhin.com/ko/comic/alcohol_love_drunk','https://ccdn.lezhin.com/v2/comics/5428552478687232/images/tall.webp?updated=1710831585770&width=420','연재'),
('우리는 초밥왕을 꿈꾼다','노마인·정우·소이미디어',array['일상']::text[],'초밥장인이 되고 싶어 합격한 대학을 버리고 
유명 초밥집에 찾아간 고3 소년.
하지만 그곳엔 참치인간이 있었다!!!','https://www.lezhin.com/ko/comic/chobabwang','https://ccdn.lezhin.com/v2/comics/5288451688955904/images/tall.webp?updated=1761792226764&width=420','완결'),
('19-NINETEEN','강도하·재담미디어',array['액션']::text[],'부모님과 할아버지와 함께 지극히 평범한 가정에서 지극히 평범한 생활을 하는 유리.
어느 날 지구를 뒤덮은 한 줄기 빛이 세상을 바꿔놓았다.
모든 것이 "리셋"되어, 전 인류의 육체가 19세가 된 것이다.
그리고…할아버지가 사라졌다.

그날부터 세상은 완전히 바뀌었다.
일상생활은 마비되고 질서가 사라진 세상.
어차피 죽을 수 없는 몸이 됐으니 짜증나는 놈은 ','https://www.lezhin.com/ko/comic/19_nineteen','https://ccdn.lezhin.com/v2/comics/7011745283987094/images/tall.webp?updated=1761107598753&width=420','완결'),
('몰래 사랑하는 방법','하루타 하나·재미스튜디오·로맨스홀릭',array['로맨스']::text[],'작은 동물같이 귀여운 외모와는 반대로 파워풀하고 남자에게 의지하지 않고 살아가는 스즈. 하지만, 결혼하라는 부모님의 말씀에 ''나보다 강한 사람이 좋아'' 라고 흘린 듯이 말했더니 중매 상대로 나온 상대는… 닌자~!!? 혼란스러운 스즈와 다정하게 미소짓는 닌자 아키츠키. 이런 상대는 있을 수 없다며 부정하지만 상냥하고 다정한 그에게 닫혀있던 마음이 점점 열리게','https://www.lezhin.com/ko/comic/love_secretly','https://ccdn.lezhin.com/v2/comics/5144848894328832/images/tall.webp?updated=1623925370888&width=420','완결'),
('달과 전제군주','미나미노 마시로·학산문화사',array['로맨스']::text[],'나나미와 마사요시는 소꿉친구. 
마사요시는 나나미를 좋아하지만, 
17년간 고백하지 못하고 있다. 
마사요시는 그런 상황을 놀리는 사촌형의 도발에  
마침내 나나미 앞에서 
"나의 나나미에게 손대지 마!!"라고 외치는데?!

ⓒ 2001 MASHIRO MINAMINO, GENTOSHA COMICS INC.','https://www.lezhin.com/ko/comic/moon_and_monarch','https://ccdn.lezhin.com/v2/comics/4700476304392192/images/tall.webp?updated=1764235226447&width=420','완결'),
('홍차 정원의 귀한 아가씨입니다','얼레·말꽃·엠스토리허브',array['로맨스']::text[],'[휴재 중] 세 번의 파양을 겪은 고아 소녀 ''카멜리아 거터''. 파양 끝에 유명한 홍차 정원 ''블룸베리 티 가든''에 취직한다.
그러나 일개 종업원이라기엔 부담스러울 정도로 호화로운 대접. 출신도, 배경도 베일에 싸인 티 가든의 주인 ''브랜든 워더링''은 이 모든 게 당연하다고 말하지만….

''대가 없는 행운이 얼마나 연약한지 난 알아.''
''이번에는 절대로 뺏','https://www.lezhin.com/ko/comic/tea_garden_lady','https://ccdn.lezhin.com/v2/comics/5881479906394112/images/tall.webp?updated=1724218166900&width=420','연재'),
('클래식×러버','엑스원·코우즈키 리토·아이온스타',array['로맨스']::text[],'가난하지만 언젠가는 메이저가 되겠다는 꿈을 꾸며 고엔지의 싸구려 펜션에서 날마다 연습에 몰두하는 록밴드 [마이스터 싱거즈]의 멤버들.
돈의 힘으로 그들을 매수하려 하는 악덕 프로듀서의 방해 공작에도 개의치 않고 다들 사이좋게 한지붕 아래에서 아르바이트, 연습, 그리고 사랑(?!)에 여념이 없다!!
우리의 클래식!!','https://www.lezhin.com/ko/comic/classic_lover','https://ccdn.lezhin.com/v2/comics/6349069368950784/images/tall.webp?updated=1472191263205&width=420','완결'),
('와이파이 로맨스 시리즈','로맨스 단편작가·재담미디어',array['로맨스']::text[],'[본 작품은 여러 에피소드로 구성되어 있는 단편집입니다.]
1)모퉁이에서 사랑을-수공예가 취미인 아빈, 그녀가 만든 곰인형보다 더 귀엽고 어설픈 사랑이야기! 과연 어른이 되어서도 우린 함께 할 수 있을까?
2)기원화- 하인즈 가문의 노예 몬티... 온갖 시련과 오해를 극복하고 리헬 도련님과의 사랑이 이루어지길...
3)딸기괴물- 핑크빛 미소 뒤에 숨겨진 오','https://www.lezhin.com/ko/comic/wifi_romance','https://ccdn.lezhin.com/v2/comics/4596288034242560/images/tall.webp?updated=1582786036545&width=420','완결'),
('이방의 오즈월드','오카자키 사토노·AK 커뮤니케이션즈·AK 코믹스',array['판타지']::text[],'외계 지적 생명체와의 조우를
꿈꾸는 청년은 신의 힘을 넘보는
“마녀”와 만난다.

198X년 푸에르토리코.
외계 지적 생명체와의 만남을 꿈꾸는
청년 마미야 무사시는
천문학계의 이단아이자 천재인
이사키 아이라의 심부름꾼이 되어,
그녀의 집으로 향한다.
그리고 “오즈월드의 마녀”라 불리는
그녀의 집에서 10년간 잠들어 있는
잠자는 공주와도 만나는데….
이 만남','https://www.lezhin.com/ko/comic/ozworld','https://ccdn.lezhin.com/v2/comics/4835241744465920/images/tall.webp?updated=1624854701500&width=420','완결'),
('내가 싫어하는 그','다다·이암·디앤씨미디어·HUSH(허쉬)',array['로맨스']::text[],'유즈키는 자신을 항상 냉정하고 엄격하게 대하는 세무사 요시카와를 싫어한다. 
한 달에 한 번 요시카와와 일 때문에 만나야하는 유즈키.
그녀는 언제나 실수를 지적받아 그와 만날 때면 우울해졌다.
그러던 어느 날 유즈키는 요시카와에게 ‘저와 사귀어주시면 좋겠습니다’라는 
갑작스러운 고백을 받게 되고, 대체 그 이유를 알 수 없어 혼란스럽기만 한데……!
사디스트','https://www.lezhin.com/ko/comic/hate_him','https://ccdn.lezhin.com/v2/comics/5982462431526912/images/tall.webp?updated=1737348586490&width=420','완결'),
('[비애] 종달새가 울면 잡아줘','엔도 에누·대원씨아이',array['로맨스']::text[],'평범한 대학생 X 박복한 소꿉친구의 드라마틱 러브. 

“너와 다시 만나기 위해서 난···.” 

대학생인 에노모토는 때때로 떠올리는 사람이 있다.

 6년 전까지 언제나 자신의 곁에 있었던 소꿉친구 시무라. 

갑작스러운 전학으로 헤어져버렸지만···. 

그러던 어느 날, 대학교에서 시무라와 재회하게 된 에노모토. 

재회가 그저 기쁘기만 한 에노모토와는','https://www.lezhin.com/ko/comic/plz_catch_me','https://ccdn.lezhin.com/v2/comics/4615173653725184/images/tall.webp?updated=1648691739629&width=420','완결'),
('나는 약혼 파기 따위 하지 않을 거예요','오오토리·주피터 스튜디오·Nardack·시프트코믹스',array['로맨스']::text[],'「꺄…… 꺄아아악―――!」
제1왕자인 저의 약혼녀인
공작 영애 셀레아.
10살, 첫 만남 자리에서
비명을 지르면서 쓰러졌습니다!
전생의 기억이 떠올랐다고? 네가 악역 영애?
내가 바람을 피워서 네가 파멸한다고?
그 설정의 나도 참 너무하네. 하지만 말이야,
그런 『이벤트』나 『설정』은 상관없어.
함께 지내면서 차분하고 다정한 네가
점점 좋아지고 있으니까!
','https://www.lezhin.com/ko/comic/konyakuhakinante_shimasen','https://ccdn.lezhin.com/v2/comics/5723095167205376/images/tall.webp?updated=1674782446316&width=420','완결'),
('오늘 이혼하는데 뭐?','요코 타큐·지티이엔티',array['로맨스']::text[],'결혼을 하고 드디어 목표를 달성했다고 생각했는데 착각이었다... 행복한 가정은 너무나 먼 이상이었다. 가치관의 차이는 두근거렸던 심장도 잠잠하게 만들고. 결국 그런 두 사람이 함께 내린 결론은….. ''이혼하자.'' 이혼식을 치뤄 헤어지기로 했다. 각자 다른 방식으로.','https://www.lezhin.com/ko/comic/divorce_today','https://ccdn.lezhin.com/v2/comics/6065130385965056/images/tall.webp?updated=1787277991502&width=420','완결'),
('루베리아 왕국 이야기 ~사촌 동생의 뒷수습을 하는 신세가 되었다~','케이코·시온·시프트코믹스',array['로맨스']::text[],'왕족의 피를 이었음에도 근위대에 소속된 알비스와
왕태자의 약혼자로 자란 공작 영애 에리나.

절대로 만날 일 없었던 두 사람의 인생은
왕태자가 에리나에게 약혼 파기를 선언한 날부터 돌변했다.

“알비스, 너는 에리나 아가씨와 약혼해줘야겠다.”

사태를 심각하게 여긴 국왕은 왕태자를 유폐하고
알비스의 왕족 복귀와 에리나의 약혼을 선고.
갑작스러운 변화에 당황','https://www.lezhin.com/ko/comic/ruvelia_kingdom_story','https://ccdn.lezhin.com/v2/comics/5282840878317568/images/tall.webp?updated=1669202210706&width=420','연재'),
('꼬리 있는 연애','진하·헤폰·대원씨아이',array['로맨스']::text[],'"나무꾼의 환생과 결혼하지 않으면 여우가 된다고?!!"

평범한 직장인 윤하는 29세 생일을 앞둔 어느 날, 엉덩이에 생긴 꼬리에 멘붕이 온다.
알고 보니 윤하는 나무꾼을 짝사랑해 인간이 된 여우의 마지막 환생이었던 것. 
하필 마지막 환생자가 30번째 생일을 맞이하기까지 나무꾼의 환생과 
부부의 연을 맺지 못하면 진짜 여우가 되어버린단다.
"이 세상 수많','https://www.lezhin.com/ko/comic/ggori_it','https://ccdn.lezhin.com/v2/comics/7011745455570991/images/tall.webp?updated=1745825962580&width=420','완결'),
('그와 만나다','유엘·테이크원스튜디오',array['로맨스']::text[],'[평행 세계에서 온 ''준''과 평범한 회사원 ''시우''의 동거 이야기]
평행 세계에서 현대로 넘어온 어린 황제 준과 평범한 회사원 시우. 
그들의 특별하고 아름다운 동거 이야기','https://www.lezhin.com/ko/comic/meet_with_him','https://ccdn.lezhin.com/v2/comics/6112627838484480/images/tall.webp?updated=1666319144240&width=420','완결'),
('마왕비 납시오','Su Xiao Yu·엠스토리허브',array['로맨스']::text[],'정유나, 월드 스타에 어마 무시한 인기를 얻고 있는 그녀가 응원 봉에 맞고 기절해버렸다? 그리고 눈 뜬 곳엔 장발의 절세미남이 자신을 쳐다 보고 있는데..."저기…잘생긴 건 인정합니다만 당신은 누구?""저런…첫 날밤에 그리 섭한 얘기를 하다니, 이리 오시오!""엥?! 잠깐만!!"낯선 곳인 것도 모자라, 알지도 못하는 자가 자신의 남편이 되어버렸다?게다가, ','https://www.lezhin.com/ko/comic/go_devilqueen','https://ccdn.lezhin.com/v2/comics/5462779914682368/images/tall.webp?updated=1678263223647&width=420','완결'),
('사랑에 빠지고 싶은 엘리트에겐 비밀이 있다','스즈쿠라 하루·넥스큐브',array['로맨스']::text[],'“오늘 가장 귀여운 모습을 저한테 보여주세요.”
지금까지 느껴본 적 없는 것들로 머리가 새하얘져―!

고지식한 성격으로 사람 사귀는 게 서투른 회사원 아이다 유노.
사랑과는 거리가 먼 생활을 하고 있었을 텐데
직장 선배 쿠제는 그녀를 만날 때마다 다정하게 챙겨준다.
그러다 어떤 일을 계기로 그와 함께 호텔에 가게 되고
약해진 그녀의 모습에 쿠제는 자신의 마','https://www.lezhin.com/ko/comic/elite_secret_15','https://ccdn.lezhin.com/v2/comics/7011757896486826/images/tall.webp?updated=1761196777667&width=420','연재'),
('천년이 흘러도','아커·천수설·엠스토리허브',array['로맨스']::text[],'이미 두 번을 환생한 것도 모자라, 한 번 더 새로운 삶을 살게 되는 미실! 첫 번째 삶에선 전하의 사랑을 받지 못해 우울하기 짝이 없는 날들을 보내고, 두 번째 삶에선 전하의 총애를 얻기 위해 각종 수를 써보지만 모두 실패로 돌아간다. 마지막으로 주어진 세 번째 삶, 그녀는 예전과는 완전히 다른 삶을 살기로 결심하는데……','https://www.lezhin.com/ko/comic/1000years','https://ccdn.lezhin.com/v2/comics/5231299353444352/images/tall.webp?updated=1720400729954&width=420','완결'),
('악으로','한여름·신건우·엠스토리허브',array['스릴러']::text[],'연쇄살인범에게 살해당한 김태진이 죽음에서 부활한 후 자신을 죽인 연쇄살인범을 추격한다.','https://www.lezhin.com/ko/comic/by_evil','https://ccdn.lezhin.com/v2/comics/4726195634896896/images/tall.webp?updated=1667961457530&width=420','완결'),
('흑룡재림','투캣츠·엠젯패밀리',array['액션']::text[],'태어나자마자 벼락을 맞아 육씨 가문에서 쫓겨나 가문에 하인들에게 양아들로 입양된 이목향. 이러한 이유로 몸이 허약하여 친구들과 어울리지 못하고 잠만 자던 어느 날, 자신의 몸 안에 무언가가 잠들어 있다는 사실을 알게 된다. 그의 몸 안에 잠들어 있던 것은 바로 흑룡! 조금씩 깨어나는 용의 힘과 함께 허약했던 그의 몸은 조금씩 회복되었고 점차 각성하기 시작한','https://www.lezhin.com/ko/comic/black_dragon_return','https://ccdn.lezhin.com/v2/comics/5079448155389952/images/tall.webp?updated=1676888744631&width=420','완결'),
('피터판다 (PETER PANDA)','나예리·락킨코리아',array['로맨스']::text[],'고아원에서 자라 아르바이트를 하며 힘겹게 학교에 다니고 있지만, 항상 씩씩하고 밝은 17세 소녀 ‘루이’. 마음의 상처를 받은 어느 날, 낙담한 가운데 누군가 버린 판다 인형을 주워온다. 그날 밤 그 인형은 괴상한 모습의 남자로 변하여 자신을 ‘피터’라고 소개하는데… ‘루이’에게 운명의 상대를 찾아주겠다고 말한다. 때마침 그들의 앞에 나타난 매력적인 세 미','https://www.lezhin.com/ko/comic/peter_panda','https://ccdn.lezhin.com/v2/comics/4976617330114560/images/tall.webp?updated=1687940504524&width=420','완결'),
('HAPPY TOGETHER (해피 투게더)','김윤이',array['로맨스']::text[],'“누구나 불같은 사랑을 하는 건 아니야. 난 그냥 편한 사랑, 내가 기댈 사람이 필요해.”
이젠 쉴 곳을 찾아 오랜 연인이었던 사람과 결혼을 결심하는 죠. 죠를 걱정하는 사촌 데이빗은 죠에게 필요한 건 결혼이 아니라 쉴 시간이라면서 함께 여행을 떠난다. 여행지에서 만난 유쾌한 남자 지노 세베리니. 첫 만남부터 친한 척 다가와 어느새 죠의 마음을 흔들어 놓기','https://www.lezhin.com/ko/comic/happy_together_love','https://ccdn.lezhin.com/v2/comics/5466827849465856/images/tall.webp?updated=1465978101944&width=420','완결'),
('빌런제자양성록 [연재]','월천·엠젯패밀리',array['액션']::text[],'현대 세계 속 지극히 평범한 회사원이었던 한무영. 
어느 날 잠에서 깨어난 그는 자신이 무협 세계관 속 악명으로 둘째 가라면 서러울 인물, 풍월령의 몸으로 깨어났다는 사실을 깨닫는다. 
그러나 풍월령은 악명과는 별개로 이미 노쇠하여 죽음을 앞둔 상태였고, 그의 제자들은 이미 그러한 그에게서 등을 돌려 그저 자신들의 이득을 취하기 위해 그의 목을 호시탐탐 노','https://www.lezhin.com/ko/comic/villain_edubook','https://ccdn.lezhin.com/v2/comics/6618607119958016/images/tall.webp?updated=1726196755810&width=420','연재'),
('란희씨는 BL만화가','승아·쪼코두유·키다리스튜디오',array['로맨스']::text[],'인기 BL 만화 작가, 고란희. 
그러나 현실에서는 남자를 만나기만 하면 한없이 작아지는데.. 
그런 그녀에게 나타난 귀여운 남자 어시스트 권. 
앞으로 이들의 나날은?!','https://www.lezhin.com/ko/comic/ranhi_ssi','https://ccdn.lezhin.com/v2/comics/5653249366753280/images/tall.webp?updated=1680513123616&width=420','완결'),
('그의 향기와 나의 냄새 [개정판]','히로타 나츠미·넥스큐브·미즈',array['로맨스']::text[],'"맡게 해 줘, 네 냄새를…!"
조금 이상한 세 사람의 아주 이상한 삼각관계!

입사 동기인 미도리와 사토루는 만날 때마다 티격태격하는 사이.
미도리가 좋아하는 쿠로키 선배, 그리고 사토루가 좋아하는 것은… 미도리의 냄새?!
남들과는 살짝 다른 세 사람의 조금 부끄러운 삼각관계가 시작되고 말았다!','https://www.lezhin.com/ko/comic/his_scent','https://ccdn.lezhin.com/v2/comics/5314641498013696/images/tall.webp?updated=1603946100520&width=420','연재'),
('홍각의 판도라','시로 마사무네·리쿠도 코시·길찾기',array['판타지']::text[],'모든 사람이 무의식적으로 면죄부를 찾아 헤메는, 
출구가 보이지 않는 과도기… 와는 전혀 관계없는 
‘소녀가 소녀를 만나는 이야기’ 

세계 각지에서 대규모 자연재해가 빈발하는 시대. 기술 선진국에서는 사이보그나 자율 로봇이 일부이긴 하지만 일반 사람들과 함께 돌아다니는 시대. 대국은 기술과 자원 리소스를 서로 빼앗고, 빈부격차는 심화되고, 빈곤층의 미래가','https://www.lezhin.com/ko/comic/cenancle_island','https://ccdn.lezhin.com/v2/comics/6667651773104128/images/tall.webp?updated=1602069285788&width=420','연재'),
('내가 사랑하는 외계인에게','걍아·키다리스튜디오',array['로맨스']::text[],'쿨하고 멋진 여자친구! 그런 그녀가 갑자기 자기를 외계인이라고 하는데?!
외계인 여자친구 ''케이''의 창조주 첫사랑 찾기! 연우는 이 넓은 한국땅에서 찾아줄 수 있을까?','https://www.lezhin.com/ko/comic/my_beloved_alien','https://ccdn.lezhin.com/v2/comics/5130018236989440/images/tall.webp?updated=1652929910456&width=420','완결'),
('그 영애가 남주의 베일을 벗기면','서법·키다리스튜디오',array['로맨스']::text[],'기울어가는 집안을 위해 모니라는 가명으로
금기된 로맨스 소설을 쓰고 있는 귀족 영애 모니카 우드하우스. 

우드하우스가에서 퇴역 군인들을 위한 자선 파티가 열리고, 
그곳에서 한 남작이 칼에 찔리는 사고가 벌어지는데... 

칼에 찔린 남작은 베르테르 노턴.

오랜 전쟁을 겪은 뒤, 완전히 다른 사람이 되어서 돌아온 베르테르는
모니의 비밀과 약점을 들추며 ','https://www.lezhin.com/ko/comic/take_off_the_veil','https://ccdn.lezhin.com/v2/comics/4864945398022144/images/tall.webp?updated=1748253340764&width=420','완결'),
('화려한 위장결혼','이시마루 히로코·나루세 나나코·지티이엔티',array['로맨스']::text[],'젊은 나이에 대기업 사장인 레이는 복잡한 여자관계를 갖고 있지만 누구나 인정하는 실력자다. 사장 비서인 아미코는 독특한 분위기를 지닌 레이에게 끌리는 만큼 선을 긋고 있었다. 그러던 어느날, 레이에게서 회사를 지키기 위한 위장 결혼을 부탁받는데─ ⓒHiroko Ishimaru/Nanako Naruse/STARTS PUBLISHING CORPORATION','https://www.lezhin.com/ko/comic/fake_marriage','https://ccdn.lezhin.com/v2/comics/6230850334687232/images/tall.webp?updated=1612338814294&width=420','완결'),
('TRUMP','하마구리·데이즈엔터·노엔코믹스',array['판타지']::text[],'‘TRUMP’. 
흡혈종의 시조이자 영원한 생명을 가졌고 영원한 생명을 부여하는 자.

인간종과 흡혈종의 혼혈인 ‘담피르’ 소피 앤더슨.
그는 혼혈이라는 이유로 살던 고아원에서 괴롭힘을 당하다 ‘클랜’이라는 고치기-인간종의 사춘기-에 해당하는 나이대 흡혈종이 모이는 시설에 입소하게 된다.
하지만 그곳에서도 마찬가지로 다른 이에게 멸시를 받으며 괴로운 생활을','https://www.lezhin.com/ko/comic/trump','https://ccdn.lezhin.com/v2/comics/5191727904915456/images/tall.webp?updated=1754531110943&width=420','연재'),
('정조 역전 세계의 동정 변경 영주 기사','미치조·야나세 코타츠·somymedia·S코믹스',array['판타지']::text[],'부당하고 맛이 간 세계에서 이단 기사는
자신의 길을 걷는다.

여자가 인구의 9할을 차지, 여자가 싸우고
남자가 보호받는 이세계에 환생한 파우스트는
보기 드문 ‘남기사’로 성장한다.

전장에서의 많은 승리로 영웅으로 불리지만
전생의 가치관 때문에 거의 전라인 여왕, 거유 공작의
과잉 스킨십에 고간이 욱신거리는 나날―.

“동정이었던 나에게는 자극이 너무 강','https://www.lezhin.com/ko/comic/knight_reversal_world','https://ccdn.lezhin.com/v2/comics/7011747288937313/images/tall.webp?updated=1748248671694&width=420','연재'),
('두 사람의 마이 하우스','에이타츠·지티이엔티·허니B',array['로맨스']::text[],'사회인 코우이치의 평생 꿈은 ‘평온한 나날’. 
더블워크를 하는 가난한 살림이지만 나름대로 알찬 삶을 살고 있었다. 
그러던 어느 날, 아르바이트하는 편의점에 꽃미남 단골손님이 빗속에서 새끼 고양이를 주운 장면을 보게 되고, 
이 일을 계기로 둘이서 새끼 고양이를 키우게 된다?!  
꽃미남 단골손님의 이름은 레이지, 입이 거칠고 철부지여서 코우이치와 매번 ','https://www.lezhin.com/ko/comic/house_two','https://ccdn.lezhin.com/v2/comics/5751701338390528/images/tall.webp?updated=1577162851265&width=420','완결'),
('과거로 되돌아온 악역 영애는 왕자님으로부터 도망치려 합니다','소라오·헤노 나츠코·디앤씨미디어·HUSH(허쉬)',array['로맨스']::text[],'‘악역 영애’라 불리는 르루피나는 
왕자에게 약혼을 파기당하는 무도회 기간을 ‘몇 번이나 루프’하고 있었다.
하지만 어느 날, 신비한 목소리에 이끌려 4살 때로 회귀하게 되는데……
그것은 그녀의 인생이 틀어지기 시작한 운명의 날이었다!

악역 영애라 불린 소녀는 행복한 인생을 손에 넣기 위해 고군분투한다!!','https://www.lezhin.com/ko/comic/returning_villain','https://ccdn.lezhin.com/v2/comics/4699778112618496/images/tall.webp?updated=1693292728416&width=420','연재'),
('신들에게 키워진 자, 최강이 된다','쿠노 토야·하타 료스케·fame·시프트코믹스',array['판타지']::text[],'검의 신, 치유의 신, 마술의 신에게 주워져 키워진 소년 윌. 그는 키워준 신들조차 경악할 수준으로 초스킬을 습득해 나간다.
그리고 윌은 어느 날, 맹인 무녀 루나마리아와 만나 세계를 구하기 위한 여행을 떠나기로 결심한다―!!
대인기소설 “신”시리즈가 드디어 만화화!!','https://www.lezhin.com/ko/comic/raised_by_gods','https://ccdn.lezhin.com/v2/comics/5441021040459776/images/tall.webp?updated=1635227439916&width=420','연재'),
('난쿠루','사다 우오지·넥스큐브',array['코미디']::text[],'그곳은 일본의 외딴 남쪽 섬-.
섬에서 하나밖에 없는 중학교의 전교생은 겨우 4명.
심지어 전원 남자!
도시에서 전학 온 미야코는 무사태평한
남쪽 사람들의 태도에 속 터지는 나날을 보낸다.
여기는 어떤 의미로는 이상향… 이려나?!
반짝거리는 바다에서 빛나는 슬로우 라이프
청춘 코미디 개막!

Nankuru©Uoji Sada 2014 Allrights res','https://www.lezhin.com/ko/comic/nankuru','https://ccdn.lezhin.com/v2/comics/5236311768956928/images/tall.webp?updated=1502871464174&width=420','연재'),
('내 동거인은 요괴?!','아마나츠 텐·지티이엔티',array['로맨스']::text[],'26살 패션 잡지 모델로 일하는 아야의 정체는
수수하게 생긴 17살 고등학생이다.

어느 날 모델인 모습으로  
같은 반 친구인 슈야와 만나 그를 집에 데려오는데,
슈야의 정체가 알고 보니 요괴였다니?!

서로의 정체를 숨기는 기묘한 이중 동거 로맨스!
©Ten Amanatsu／ⓒFUNGUILD','https://www.lezhin.com/ko/comic/my_housemate_moster','https://ccdn.lezhin.com/v2/comics/5794766987264000/images/tall.webp?updated=1671499279259&width=420','완결'),
('뼈 아픈 연애','한여름·고일고일·엠스토리허브',array['로맨스']::text[],'과거에는 자신을 지켜주는 든든한 방패였지만, 지금은 무섭기만 한 슬이를 피해, 입대라는 뻥을 친 지우. 하지만 하필 시작한 편의점 알바의 교대자, 봄이의 룸메가 슬이라니!','https://www.lezhin.com/ko/comic/painful_love','https://ccdn.lezhin.com/v2/comics/5942233357680640/images/tall.webp?updated=1656506225956&width=420','완결'),
('타카미야가와 가짜 약혼자','나츠노 나에·프라이데이·조이툰',array['로맨스']::text[],'자산가 일족, 타카미야가 당주인 세이에게
『가짜』 애인 역할을 부탁받은 여고생 코토리.
과거의 트라우마로 인해 사람을 멀리하던 코토리지만 
세이에게 약점을 잡혀 매일 저택으로 출근하게 된다.
실은 세이에게는 말 못 할 비밀이 있는데….
세이의 자손을 남기려 하는 타카미야가 일족의 속셈에 코토리도 점차 휘말리게 되고…
특별한 사연을 가진 도련님과 고독한 소녀','https://www.lezhin.com/ko/comic/takamiya_fake_lover','https://ccdn.lezhin.com/v2/comics/6443007391105024/images/tall.webp?updated=1643088158485&width=420','완결'),
('시녀인데… 성검을 뽑아 버렸다!','제넨·아키노 미도리·학산문화사',array['판타지']::text[],'왕궁에서 일하는 시녀 엘리노아는 1000년 동안 아무도 뽑지 못했다는,
마왕으로부터 나라를 지킬 용사에게 여신이 내린 전설의 성검을 뽑아 버린다.
하지만 지금은 용사의 활약이 필요 없는 평화로운 시대.
용사 같은 것이 되어 버리면 실업자가 될지도?!
살그머니 성검을 다시 꽂아 놓고 없었던 일로 하려 했다가, 무뚝뚝하지만 잘생긴 왕자에게 들키고 마는데….

','https://www.lezhin.com/ko/comic/maid_of_holy_sword','https://ccdn.lezhin.com/v2/comics/5953332895350784/images/tall.webp?updated=1764234426100&width=420','완결'),
('진짜 싫은 운명의 사람','카호오이바·지티이엔티',array['로맨스']::text[],'IT 기업 프로그래머로 일하는 키도 나노하에게는 천적이 있다. 
언제나 무리한 요구를 던지는 냉철한 상사 하바! 그런 하바에게 받은 일 때문에 야근하게 된 밤, 
나노하는 우연히 학창 시절 갔던 라이브 하우스에 가게 되고, 
그곳에서 자기가 무척 좋아했던 멤버의 정체를 알고 놀라는데!
©Kaho Oiba／©FUNGUILD','https://www.lezhin.com/ko/comic/kirai_unmei_hito','https://ccdn.lezhin.com/v2/comics/6495050434674688/images/tall.webp?updated=1701298679460&width=420','완결'),
('Magic Hour (매직아워)','이시현·락킨코리아',array['드라마']::text[],'해가 진 후 어느 정도 남아있는 빛의 시간.
촬영할 때 믿을 수 없을 만큼 아름다운 영상이 나오지만 너무 짧아 그 시간을 
맞추기가 힘들다한다 그래서 사진작가들은 이 기적 같은 시간을 매직아워라 부른다.
여기서는 죽음으로 인해 떠나는 자의 영혼이 아주 잠시 이 세상에 머물면서 들려주는 
기적 같은 이야기, 혹은 무섭거나 슬픈 이야기를 담고자한다.','https://www.lezhin.com/ko/comic/magic_hour','https://ccdn.lezhin.com/v2/comics/4714033236410368/images/tall.webp?updated=1464592762996&width=420','완결'),
('Real 백의의 천사','시마즈 쿄코·지티이엔티·앤티크',array['드라마']::text[],'전국에서 간호사의 수가 부족한 현실.
새로 간호사가 태어나도 그만큼 가는 간호사도 많다…!!
간호사들의 리얼함을 그린 작품.','https://www.lezhin.com/ko/comic/white_robed_angel','https://ccdn.lezhin.com/v2/comics/4703870465081344/images/tall.webp?updated=1514881960328&width=420','완결'),
('흡혈귀라고 불리고 싶어!','퍄아·시프트코믹스',array['드라마']::text[],'블라드 학원― 그곳은 흡혈귀 소녀들이 지내는 비밀의 학원.

소꿉친구 유우나를 따라 같은 학교로 전학하게 된 아오이.
하지만 입학하자마자 아오이의 눈에 들어온 건…
피의 축배를 맛있게 마시는 소녀들!!
인간인 아오이가 흡혈귀 학교에 있는 걸 들키면 소동이 벌어질 거야!!

가련한 흡혈귀들과 인간 소녀가 만들어가는
귀엽고 조금 신비한 말랑말랑 일상 학원 라이','https://www.lezhin.com/ko/comic/call_me_vampire','https://ccdn.lezhin.com/v2/comics/5614490877231104/images/tall.webp?updated=1645592218601&width=420','완결'),
('거친 계절의 소녀들이여.','에모토 나오·오카다 마리·학산문화사',array['드라마']::text[],'당신의 ''처음''을 저에게 주세요─.

카즈사 일행은 문예부에 소속된 5명의 여학생.
부 전체가「죽기 전에 하고 싶은 일」이라는 화제로 이야기꽃을 피우던 어느 날,
부원 한 명이 던진 「섹스」라는 한 마디….
그 순간부터 그녀들은 ''성''에 휘둘리기 시작한다.

ⓒMari Okada, Nao Emoto/Kodansha Ltd.','https://www.lezhin.com/ko/comic/rough_season','https://ccdn.lezhin.com/v2/comics/6022339409281024/images/tall.webp?updated=1764233093972&width=420','완결'),
('마이 브로큰 마리코','히라코 와카·소미미디어·S코믹스',array['드라마']::text[],'“나는 유골이 된 마리코와 처음이자 마지막으로 여행에 나섰다.” 이야기는 26세 여성이 추락사했다는 흔한 소식으로 시작된다. 죽은 여성 마리코의 친구였던 시이노는 업무상 외근 중 그 소식을 접하고 망연자실한다. 지금이라도 마리코를 위해 할 수 있는 일이 없는지 자문하던 시이노는 어떤 행동을 하기로 결심하는데….','https://www.lezhin.com/ko/comic/my_broken_mariko','https://ccdn.lezhin.com/v2/comics/6581999428108288/images/tall.webp?updated=1716344487241&width=420','완결'),
('남장여자가 구혼을 시작했습니다','토야마 토나리·AK 커뮤니케이션즈·코이',array['로맨스']::text[],'남장카페 No.1 이쥬인 슌! (하나자와 모에)
학창시절부터 키가 크고 보이시한 스타일 덕분에 예쁘다 보다
멋지단 이야기를 많이 들었던 그녀는 주변 지인들 마저
하나 둘 결혼을 하는 상황에 마음이 급해지기 시작합니다.
스물 아홉 모태 솔로인 모에, 이제 와서 구혼활동을 시작하는데요.
모에의 구혼활동은 그녀를 매섭게 비판하는 새로 온 점장님과
연애 경험 없는','https://www.lezhin.com/ko/comic/someone_to_marrie','https://ccdn.lezhin.com/v2/comics/5119891574423552/images/tall.webp?updated=1625739168718&width=420','연재'),
('청춘이라는 건 어디서 오는 걸까?','무라카미 사치·미디어팜·B-가든',array['로맨스']::text[],'깊은 산속 전원 기숙사제 남고에 다니는 하루는
어떤 트라우마 때문에 고등학생다운
“아름다운 교제”에 동경을 갖고 있다.
어느 날, 기숙사 방 교체로 룸메이트가 된 
짝사랑 상대인 클래스메이트 아사히에게 
무심코 마음을 전하게 된다. 
기대하지 않았는데고백은 대성공!! 그에 들뜬 하루였지만
천천히 “교제”를 진행하기로 한 순간,갑자기 아사히에게 키스를 받고?','https://www.lezhin.com/ko/comic/where_youth_come_from','https://ccdn.lezhin.com/v2/comics/5684809521823744/images/tall.webp?updated=1534922979426&width=420','완결'),
('나의 이탈리아 요리','노자키 후미코·AK 커뮤니케이션즈·AK 코믹스',array['드라마']::text[],'이쿠시마 타카라(41세)는  생 파스타교실 「미 데소로」를 시작했다.  이전에 이탈리아 레스토랑이었으나, 남편이 실종되어 지금의 요리 교실이 되었다. 생 파스타 요리 교실은 학생이 생 파스타 요리를 배우고, 파스타와 어울리는 와인과 함께 식사를 한다. 또한,  희망하는 사람에 한해서 옵션으로,  고민 상담을 받을 수 있는 곳이다. 옵션으로 받을 수 있는  ','https://www.lezhin.com/ko/comic/my_italia_food','https://ccdn.lezhin.com/v2/comics/5908665776799744/images/tall.webp?updated=1606376769286&width=420','연재'),
('연, 분홍 [연재]','이로모·학산문화사',array['로맨스']::text[],'“―그때 제가 본 건…
굉장히 아름답고, 눈을 뗄 수가 없는.
그건, 평소 생각하던 아름다움과는 조금 달랐습니다.
……아마도 그건…”

좋아하는 발레를 전공으로 할지 
취미로만 즐길지를 고민하는 15세 소녀, 나노하.
어느 날, 노하는 두고 온 발레 가방을 찾으러 돌아간 빈 학원에서
말로 설명할 수 없는 아름다움을 마주한다…!

아름다운 춤의 주인공은 바로','https://www.lezhin.com/ko/comic/walts_of_the_flowers','https://ccdn.lezhin.com/v2/comics/5137701139513344/images/tall.webp?updated=1781496978802&width=420','연재'),
('이세계 결혼 서바이버','모토오 미유키·지티이엔티',array['판타지']::text[],'이세계에서도 결혼 활동을 할 수 있다고?!
내 이름은 쿠라키 린코, 28살. 
결혼을 위해 단체로 모이는 결혼 활동을 하던 중 갑자기 트럭에 치여 이세계에 가게 되는데, 같이 있던 결혼 활동 참가자들과 함께 떨어진 걸 알게 된다. 
이런 어처구니없는 상황에서도 참가자들은 당황하지 않고 그대로 결혼 활동을 계속한다고 하는데?! 
하지만 이세계에서는 내가 아는','https://www.lezhin.com/ko/comic/isekai_gekkon_survival','https://ccdn.lezhin.com/v2/comics/6744480048021504/images/tall.webp?updated=1680054708945&width=420','완결'),
('흔들리는 씨앗','나카오카 나카·루트미디어·블랙스완',array['로맨스']::text[],'"다른 사람의 세계에 들어가는 건 무섭다…."

똑 부러지지 못한 생물 선생 코바의 팬인 하즈미는 일부러 낙제점을 받아 둘만의 보충 수업 시간을 만끽하고 있었다. 하지만 어느 날, 처음 보는 학생 네이도 보충을 받게 되는데. 충격을 감추지 못하는 하즈미의 곁에서 남의 마음을 읽는 것이 특기라고 말하는 네이는 하즈미의 짝사랑도 금세 간파해버린다. 게다가 ''나','https://www.lezhin.com/ko/comic/shake_seed','https://ccdn.lezhin.com/v2/comics/6162938082754560/images/tall.webp?updated=1582980417565&width=420','완결'),
('오! 나의 어시님 [개정판]','밀라·앵몬·씨엔씨레볼루션(주)',array['로맨스']::text[],'안 팔리는 성인 만화가, 신선호. 
매일같이 섹○를 그리다 보니 아뿔싸 
주니어가 작동하지 않은 지도 벌써 2번째.
그런데 왠일인지, 새롭게 구한 어시스턴트(※남자)만 보면 
고장난 주니어가 활동하기 시작하는데...?!

19금 만화 화실의 아슬아슬한 러브 줄다리기, 
지금부터 시작합니다♡','https://www.lezhin.com/ko/comic/oh_my_assi_15','https://ccdn.lezhin.com/v2/comics/7011773374121570/images/tall.webp?updated=1775717588883&width=420','완결'),
('뇌쇄 보이 프렌드','사사키 유키에·넥스큐브·미즈',array['로맨스']::text[],'아빠의 재혼으로 인해 떨어져 살던 엄마와 함께 살게 된 고등학생 이치고.
엄마에 대한 기억은 거의 없지만 고지식한 공무원이라고 한다.
두근거리며 아파트 엘리베이터에 타려는데, 무려 학교에서 꽃미남이라고 소문난 타케시가!
예상치 못한 만남에 두근거리던 이치고는 그만 들고 있던 짐을 쏟고 만다.
창피함에 얼굴이 새빨개진 이치고의 눈앞에 타케시는 키득거리며 A컵','https://www.lezhin.com/ko/comic/boy_bf','https://ccdn.lezhin.com/v2/comics/6381568030539776/images/tall.webp?updated=1521190642820&width=420','완결'),
('나는 시원시원하니까','에구치 신·토라후구·아이온스타',array['드라마']::text[],'「다들 나처럼 시원시원하게 살면 될 텐데!」
여성지 편집부에서 일하는 아미하마 나미(28).
그녀는 "나는 시원시원하니까"라는 핑계로 편견 섞인 주장을 거침없이 반복해서 동료들이 싫어한다.
제멋대로 행동하던 어느 날, 나미한테 천적 혼다 마이(26)가 나타난다.
예쁘고 여자다운 진짜 시원시원한 여자, 마이한테 짜증을 감추지 못하는 나미.
폭주하는 자칭 시원','https://www.lezhin.com/ko/comic/coolcool','https://ccdn.lezhin.com/v2/comics/5451569890525184/images/tall.webp?updated=1730081001724&width=420','연재'),
('아카메가 벤다!','타카히로·타시로 테츠야·대원씨아이',array['판타지']::text[],'가차없이 베어지는 희망과 기대, 고혹적인 참극의 시나리오 개막!!

어린 황제를 허수아비로 내세운 대신의 공포정치에 신음하는 제도(帝都)!
이를 해결하기 위해 조직된 암살자들의 모임 ''나이트 레이드''!
이제 벨 것이냐 베어지느냐, 그것이 문제!!
ⓒTakahiro·Tetsuya Tashiro/SQUARE ENIX CO., LTD.','https://www.lezhin.com/ko/comic/akamega_kiru','https://ccdn.lezhin.com/v2/comics/5842102582575104/images/tall.webp?updated=1683716979298&width=420','완결'),
('지나가는 길에 원포인트 어드바이스를 하는 양아치','오츠지·소미미디어·S코믹스',array['드라마']::text[],'지나가는 길에 원포인트 어드바이스를 하는, 외양이 양아치스러운 사쿠라이 씨. 그 험상궂음에 처음 만난 사람은 위축되기도 하지만, 어드바이스를 통해 닿게 되는 사쿠라이 씨의 따뜻한 마음에 사람의 고리는 넓어져 간다. 외양과의 갭이 심한 완전 하이스펙 양아치 사쿠라이는 오늘도 역시 원포인트 어드바이스로 누군가의 평범한 행복을 만들어 준다.','https://www.lezhin.com/ko/comic/one_point_advice','https://ccdn.lezhin.com/v2/comics/4785766323781632/images/tall.webp?updated=1653377106900&width=420','연재'),
('나의 신님','유메노 츠쿠시·시프트코믹스',array['드라마']::text[],'죄를 지어 영원히 소년의 모습으로 
살아가는 「선생님」과
어릴 적부터 「선생님」에게 애정을 품은 
대학생 카즈사.
하지만 카즈사 또한
어떠한 죄를 짊어지고 있었다―.
무정한 시간의 흐름 속에
언젠가 다가올 이별을
몸소 느끼면서도
오로지 「선생님」만을 생각하는 카즈사.
속삭이는듯한 그들의 이야기.','https://www.lezhin.com/ko/comic/my_god','https://ccdn.lezhin.com/v2/comics/4563832963137536/images/tall.webp?updated=1624261481262&width=420','완결'),
('심장 없는 엑소시스트','자강·엠젯패밀리',array['판타지']::text[],'악마의 존재가 잊힌 시대. 악마들과 함께 잊혀가던 엑소시스트 ''비첼''과 ''제오''가 세상을 떠돈다. 제오는 악마와 싸울수록 특별하고도 위험한 힘을 쓰게 되고, 비첼은 그런 그를 자신이 도울 수 없단 사실에 안타깝기만 하다. 그들이 여정 끝에 보고자 하는 것은 무엇일까?','https://www.lezhin.com/ko/comic/heartless_exorcist','https://ccdn.lezhin.com/v2/comics/5624874285203456/images/tall.webp?updated=1688036548317&width=420','완결'),
('향기','연시완·키다리스튜디오',array['로맨스']::text[],'#BL #학원물 #비성인 #친구사이? #짝사랑? #너에게서_좋은_향기가_나','https://www.lezhin.com/ko/comic/aroma','https://ccdn.lezhin.com/v2/comics/6098175648923648/images/tall.webp?updated=1635834580134&width=420','완결'),
('타마요미','마운틴 푸쿠이치·소미미디어·S코믹스',array['드라마']::text[],'야구 is CUTE!!

중학생 시절, 1차전 패배 야구부의 투수였던 다케다 요미.
포수를 만나지 못해 던지지 못했던 「마구」에 대한 후회를 품은 채, 야구부가 활동 자숙 중인 신코시가야 고등학교에 진학한다.
그곳에서 요미가 재회한 것은 소꿉친구인 야마자키 타마키.
포수로서 노력해 온 타마키는 요미의 전력 투구를 받아 낼 수 있었다.
어렸을 적 맹세한 약속','https://www.lezhin.com/ko/comic/tamayomi','https://ccdn.lezhin.com/v2/comics/6416617631449088/images/tall.webp?updated=1625648849907&width=420','연재'),
('결혼을 못 하는 데는 이유가 있다','무라사키·지티이엔티',array['로맨스']::text[],'서른 전에 결혼을 꼭 하기를 원하는 마리코는 좋아하는 토미자와에게 고백을 받았다. 이제 행복한 웨딩라이프만 기다리는 줄 알았는데… 이 남자, 취향이 남다르다?! 과연, 마리코는 결혼을 할 수 있을까?

ⓒmurasaki/Solmare Publishing','https://www.lezhin.com/ko/comic/mariko_vs_michuko','https://ccdn.lezhin.com/v2/comics/4523123063783424/images/tall.webp?updated=1787302199271&width=420','완결'),
('그대와 캄비아레!','미야우치 사야·아이온스타',array['로맨스']::text[],'나카무라 코하나는 친구들의 심부름꾼 노릇이나 하는 칙칙한 여고생.
오늘도 코하나가 친구들 몫의 점심 메뉴를 사서 교실로 돌아오자
어찌된 일인지 거기엔 금발의 푸른 눈을 한 꽃미남 왕자님이!!
놀라는 코하나에게 자신의 시녀가 되라고 명령하는 왕자.

게다가 왕자는 지금까지 칙칙하고 눈에 띄지 않게 살아온 코하나를
잘 나가는 요즘 스타일의 여고생으로 변신시키는','https://www.lezhin.com/ko/comic/cambiare_with_you','https://ccdn.lezhin.com/v2/comics/6308956824403968/images/tall.webp?updated=1536295478180&width=420','완결'),
('인간 더비~돈의 욕망에 사로잡힌 엄마들~','나치엠·메모리얼북스',array['드라마']::text[],'전업주부 사에는 아들의 교육 문제로 매일 고민이 크다. 
의사집안 남편의 압박과 학부모들의 사이의 눈치로 인해 매일매일 지쳐가던 무렵, 
같은 학부모 이코마씨에게 권유 받아 장미반 점심 모임에 참석하게 된다. 
하지만 그곳에 있던 건 자식들의 시험 성적으로 내기를 하고 있는 광기의 현장이었다...','https://www.lezhin.com/ko/comic/human_derby','https://ccdn.lezhin.com/v2/comics/6125791626723328/images/tall.webp?updated=1579600686918&width=420','연재'),
('누가 무림맹주를 죽였나','주간15·곤조·툰스',array['액션']::text[],'어릴 적 부모를 여읜 허신우. 11살 때부터 의뢰를 받아 사람을 죽이는 낭인 생활을 해왔는데, 어느 날 무림맹의 맹주이자 천외문의 문주인 외할아버지가 누군가에게 살해당한다.
그 일로 인해 허신우는 무림맹주 살해용의자가 되었을 뿐만 아니라, 천외문의 절대무공 패천겁을 노리는 무림인들에게 목숨을 위협받는 상황이 된다.
하지만 비운은 그것으로 끝나지 않고, 도피','https://www.lezhin.com/ko/comic/who_killed_master','https://ccdn.lezhin.com/v2/comics/4740260289642496/images/tall.webp?updated=1693785461795&width=420','완결'),
('프리티 보이','모리오 마사미·학산문화사',array['로맨스']::text[],'귀여운 전학생 코바야시 야마토는 A반의 아이돌.
그가 반대항 대회의 상품 
「요이코의 메달」을 갖고 싶다고 선언한다!!
야마토의 미소에 끌려
반 천제가 하나가 되어 대회에 임한다.
그러나 한창 시함 중에 야마토는 E반에게 유괴당하고….
메달의 행방은? 야마토의 상태는?
파란은 계속된다?!

OMAKE NO KOBAYASHI-KUNⓒMASAMI MORIO 1','https://www.lezhin.com/ko/comic/prettyboy','https://ccdn.lezhin.com/v2/comics/6087013877481472/images/tall.webp?updated=1764293620115&width=420','완결'),
('가챠를 돌려 동료를 늘리고 최강의 미소녀 군단을 만들자 (코믹스)','하루노 슈·칭쿠루리·소미미디어·S코믹스',array['판타지']::text[],'초강력 미소녀들과 함께하는
이세계 가챠 판타지 라이프--!!

극히 평범한 소셜 게임 폐인, 오쿠라 헤이하치는
가챠로 얻은 아이템으로 인해
이세계로 전이해버리고 말았다.
헤메던 도중 몬스터한테 습격을 당해
완전히 궁지에 몰린 듯했지만--
스마트폰의 가챠에서
미소녀 유닛이 실체화돼서 나타났다?!

터무니없는 성능의 미소녀 캐릭터들과 함께
이세계를 대모험하는
','https://www.lezhin.com/ko/comic/gacha_around','https://ccdn.lezhin.com/v2/comics/5475647842746368/images/tall.webp?updated=1624261456628&width=420','연재'),
('달콤하게 푹 반하다 [개정판]','공문숙·권열희·지티이엔티',array['로맨스']::text[],'*이 작품은 개정판으로 일부 페이지가 수정되었습니다. 

복수를 맹세하며 악마가 되어 버린 그 남자, 진욱. 
그리고 복수의 화신(化身)이 된 진욱 앞에 나타난 그 여자 영애. 
천진한 눈망울 속에 담겨진 관능의 불빛 앞에 서서히 진욱은 깨어나고……. 
탐하면 안 되는 줄 알면서도, 오직 복수의 대상인 줄 알면서도 달콤한 그녀의 유혹에 속절없이 빠져 드는데','https://www.lezhin.com/ko/comic/dalcom_fallinlove_15','https://ccdn.lezhin.com/v2/comics/6143889252352000/images/tall.webp?updated=1688721272542&width=420','완결'),
('hang','신대홍·로크미디어',array['드라마']::text[],'반에서 왕따를 당하는 선우. 극악의 폭력성을 지닌 지훈의 괴롭힘을 견디지 못하고 자살을 단행한다.
하지만 목을 메단 그는 죽지 않고, 고치의 과정을 거쳐 다시 태어난다.
정체불명의 힘까지 손에 넣은 선우는 자신을 괴롭힌 동급생 호준을 죽이게 되는데...

그사이 같은 학교 여학생 수영은 선우의 자살과 살인 장면을 몰래 목격하게 된다.
사이코패스 수영은 선우','https://www.lezhin.com/ko/comic/hang','https://ccdn.lezhin.com/v2/comics/7011771907316092/images/tall.webp?updated=1773041458966&width=420','완결'),
('신기일전','세양·삥·학산문화사',array['판타지']::text[],'세계를 혼란에 빠뜨리는 존재, 신기 x 그 존재를 봉인하는 봉인사.
그들의 이야기, 신기일전!

아픈 할아버지와 함께 살고 있는 준범은 우연히 진아의 일에 말려들어 ''신기''가 되어버린다. 
신기는 세계를 혼란에 빠뜨리는 존재로, 진아는 이를 봉인하는 봉인사였던 것.
인간으로 되돌아가기 위해 준범은 진아에 협력해 신기 및 퇴마사들과 마주하게 되는데...!','https://www.lezhin.com/ko/comic/singiiljeon','https://ccdn.lezhin.com/v2/comics/5246078665687040/images/tall.webp?updated=1736845205595&width=420','완결'),
('버려진 성녀가 사랑받을 때','ShiroAomi·chocolat·다온크리에이티브·제이코믹스',array['로맨스']::text[],'태어날 적부터 미움받고 [저주받은 왕녀]로서 유폐당하며 자라온 이리스는,
저주 봉인의 마스크를 착용하면서 삶의 희망이 없는 나날을 보내고 있었다.
그리고 우수한 치유의 능력을 지닌 여동생 디안느의 결혼에 동행하지만, 위험한 숲에 홀로 남겨져 버린다!
마물에게 습격당하여 죽음을 각오하고 있던 그때, 그녀를 구해준 건 결혼상대인 레온 왕자였다.
여동생의 대역으','https://www.lezhin.com/ko/comic/abandoned_saint','https://ccdn.lezhin.com/v2/comics/7011748416424502/images/tall.webp?updated=1785109534954&width=420','완결'),
('아랫집 웬수 [개정판]','안은진·스토리숲',array['로맨스']::text[],'#옆집최애 스핀오프! 대학 시절 선후배로 첫눈에 반했고, 윤성의 달콤한 목소리와 고백으로 오랫동안 사귀였다. 이젠 설렘따위는 없지만 이 익숙함도 나쁘지 않았는데.. 뭐? 바람을 펴!!! 단박에 이별을 통보하고 홧김에 멀리 이사까지 갔다. 그런데, “이게 뭐야?” 새로 이사간 집 아래 층에서 또 만났다?!','https://www.lezhin.com/ko/comic/downstairs_enemy_15','https://ccdn.lezhin.com/v2/comics/5547106680242176/images/tall.webp?updated=1651629819755&width=420','완결'),
('자는 여자','토리카와 소라·미디어팜',array['드라마']::text[],'청초한 미인에 성적 우수,
모두의 주목을 한 몸에 받는
완벽한 여고생 루네.
그런 그녀의 비밀스러운 취미…
그건 유일한 약점인 빈유를
탈출하기 위한 "양질의 수면"을
추구하는 것!

"숙면 팁"잔뜩!
본격 숙면 코미디 개막입니다!','https://www.lezhin.com/ko/comic/sleeping_women','https://ccdn.lezhin.com/v2/comics/4558098607177728/images/tall.webp?updated=1638842652889&width=420','연재'),
('백합 게임 주인공으로 환생한 나, 여전히 그것이 달려있습니다','에노시바·넥스큐브',array['드라마']::text[],'험악한 외모와는 다르게 마음만은 소녀인 사와타리 히카루.
백합 게임 오타쿠였던 그는 어느 날, 그 게임 속 주인공으로 전생하게 된다…?!
동경하는 공략 캐릭터 미소노의 친구가 되어 가슴이 두근두근♥
하지만 어째선지 위화감이 들어 옷을 벗어보니
아래에는 씩씩한 「그것(거시기!)」이 붙어있었다?!
미소노와의 해피 엔드를 목표로 학원에서 그것을 숨겨라!
꿈꾸던 ','https://www.lezhin.com/ko/comic/no_baekhab','https://ccdn.lezhin.com/v2/comics/7011761799119685/images/tall.webp?updated=1761898501413&width=420','완결'),
('이세계 소환으로 블랙 기업을 탈출한 나, 성녀지만 절대 일하지 않겠습니다!','Mangado·Fumi Chihara·honcomi·Studio reBorn',array['로맨스']::text[],'이세계에서 기다리고 있는 건 꿈의 합법적 백수 생활! …일 줄 알았는데..

소위 ‘블랙 기업’에서 일하는 쿠로키 에마는 이세계로 소환되었지만, 갑자기 ‘악랄한 마녀’라 불리며 감옥에 갇혀버렸다…?!
하지만 감옥 생활은 마음껏 잘 수 있고, 밥도 나오고, 무엇보다 일할 필요가 없어서 완전 쾌적!! 이제부터 꿈의 합법적 백수 생활이 시작된다!
…고 생각했는데','https://www.lezhin.com/ko/comic/lazy_saint','https://ccdn.lezhin.com/v2/comics/7011748315159054/images/tall.webp?updated=1749102620901&width=420','완결'),
('꿈을 먹는 맥과 악몽의 아이','쿠사카 미키유키·대원씨아이',array['판타지']::text[],'"널 소중히 키우고 지켜서···, 맛있게 먹어 줄게."

이것은 먹는 자와 먹히는 자의, 조금은 특별한 육아 이야기.

악몽을 먹는 시구레는 요괴들이 사는 세계, 환계에서 어린 인간 형태의 마물을 줍는다.
시구레는 어린 마물이 식량으로서 다 클 때까지 그를 키우기로 하는데···.
마물과 요괴의 환상 양육담 개막─.

ⓒMikiyuki Kusaka/SQUAR','https://www.lezhin.com/ko/comic/baku_to_nightmare','https://ccdn.lezhin.com/v2/comics/5216872980348928/images/tall.webp?updated=1642987857782&width=420','완결'),
('엘프와 헌터의 아이템 공방','아오이 우메타로·대원씨아이',array['판타지']::text[],'연상 소녀 X 순박 헌터
둘만의 공방 생활

숲 속의 작은 공방을 운영하는
엘프 장인 마그릿과
그녀를 흠모하는 인간, 전속 헌터 유라.

종족도, 수명도 다른 두 사람은
그럼에도 서로를 의지하며 의뢰를 받아
신비한 아이템들을 속속 만들어낸다.

작은 공방에서
단둘이 엮어나가는 아무것도 없는 일상
살며시 들여다보시지 않으시겠어요?

ⓒAoi Umetaro/S','https://www.lezhin.com/ko/comic/item_atelier','https://ccdn.lezhin.com/v2/comics/4534586467221504/images/tall.webp?updated=1633056812200&width=420','완결'),
('저, 용사가 아니니까요.','코코네 유루리·이사키 우타·쥬시헤븐',array['판타지']::text[],'"VR MMO 게임 ''템페스트''의 톱 플레이어인 주인공(닉네임:SR)
이 세계 최초로 솔로 플레이로 던전 클리어를 달성함과 동시에
환생한 곳은 방금 전까지 플레이하고 있었던 게임 속.
큰 병에 걸린 공주님을 지금 당장 구할 수 있는
용자로 소환된 것 같은데
저, 아무래도 ''레벨 1의 무직''에서 리스타트인 것
같습니다. "','https://www.lezhin.com/ko/comic/ore_herojanai','https://ccdn.lezhin.com/v2/comics/6122549571026944/images/tall.webp?updated=1677817385794&width=420','연재'),
('스쿨워터','비어있음·크릭앤리버엔터테인먼트',array['드라마']::text[],'같은 학교의 다른 주인공들, 서로 각자의 이야기를 만들어가고 있다.','https://www.lezhin.com/ko/comic/school_water','https://ccdn.lezhin.com/v2/comics/4798966767222784/images/tall.webp?updated=1720776256728&width=420','완결'),
('마도사는 평범을 바란다 (코믹스)','타이헤이 히로미·히로세 렌·소미미디어·루나코믹스',array['판타지']::text[],'이왕 하기로 한 거, 
내가 하고 싶은 대로 하고 말 거야!”
게임 오타쿠(?) 미즈키,
이세계에서 시작한 마도사 라이프!!

게임 오타쿠로서의 착실한 삶을 살고 있던 코우사카 미즈키.
돌연 이세계로 떨어지지만 높은 적응력을 보이는데……?

게임 속 판타지와는 달라도 너무 다른 이세계 라이프!
미즈키는 온갖 현실세계의 스킬을 총망라하여
차근차근 이세계 마도','https://www.lezhin.com/ko/comic/madouosiwa_henhon_nozomu','https://ccdn.lezhin.com/v2/comics/5336374569140224/images/tall.webp?updated=1628556428788&width=420','연재'),
('연애자괴인형 사랑하는 서틴','카기소라 토미야키·학산문화사',array['로맨스']::text[],'모든 사랑은 파멸을 낳는다.  고도의 AI를 탑재한 애완인형 ‘돌’. 
그들은 「사랑하는 것」이 금지되어 있다. 
그럼에도 돌은 누군가를 좋아하게 된다. 
사랑은 그들을 행복으로 이끌어줄 것인가, 아니면….?','https://www.lezhin.com/ko/comic/13_ark','https://ccdn.lezhin.com/v2/comics/5640320811073536/images/tall.webp?updated=1764225949516&width=420','완결'),
('The Golfer','모토미야 히로시·노다 시게루·지티이엔티',array['드라마']::text[],'청각 장애 소년 히오카 닷페이. 그는 초인적인 거리 감각을 지니고 있었다.
자산가의 아들 사와 쇼이치. 그는 천재 소년 골퍼에게 명성을 지니고 싶어했다.

골프를 싫어하는 소년과 단순한 놀이라고 생각하는 소년.
운명의 실에 이끌려 전혀 처지가 다른 두 소년이 골프의 길을 걷기 시작한다.

본격 골프 이야기.','https://www.lezhin.com/ko/comic/the_golfer','https://ccdn.lezhin.com/v2/comics/5872769430716416/images/tall.webp?updated=1514881981190&width=420','연재'),
('고릴라 신의 가호를 받은 영애는 왕립기사단의 사랑을 받는다','카미스 미카·시로히·시프트코믹스',array['로맨스']::text[],'16살이 되면, 다양한 동물신에게 가호를 받는 세계―.
소심한 소녀 소피아는 전투계 중 최강이라 불리는
『고릴라 신』의 가호를 뽑아버리고 만다.
전투는 싫다며 고뇌하던 중, 고릴라의 힘을 원하는
왕립기사단에서 스카우트 제의가 들어온다.
압도적인 고릴라의 힘에 경의를 표하며
전도유망한 젊은 기사들은 소피아를 상냥히 지켜봐 주는데―.','https://www.lezhin.com/ko/comic/god_bless_the_gorilla_lady','https://ccdn.lezhin.com/v2/comics/7011733706859111/images/tall.webp?updated=1734336202808&width=420','연재'),
('러브 시그널','A.J·윤·학산문화사',array['로맨스']::text[],'최정상 스타의 공개 구혼에 도전한 평범녀의 사랑 찾기!

국내 최정상 스타 ‘유림’. 얼굴도 몸도 성격도 완벽 그 자체인 슈퍼스타지만 연애만은 어째 마음먹은 대로 풀리지 않는다. 오랜 기간 비밀 연애를 해 온 여자 친구는 젊은 신인 배우와 바람이 나고, 가족이 진 빚 때문에 경제적으로도 위험하다. 예능 따위 쳐다보지도 않던 그였지만 연이어 터지는 스캔들에 ','https://www.lezhin.com/ko/comic/love_signal','https://ccdn.lezhin.com/v2/comics/5893925850382336/images/tall.webp?updated=1677502336330&width=420','완결'),
('선생님, 저희 같은 호적 되어볼래요?','이야마 유·타케다 아이코·지티이엔티',array['로맨스']::text[],'학원 강사를 하는 서른살 모모코는 도쿄대 출신의 동료 강사이자 한때 자기가 가르쳤던 제자 아키토에게 갑자기 프로포즈를 받는다. 
한때 예쁘장하고 천사 같은 얼굴이라 여자라고 착각했던 아키토는 짓궃은 미남이 되어 있었고, 아키토의 적극적인 프로포즈에 당황한다. 
그러자 아키토는 자기는 이제 학생이 아니라 같은 어른이라며 점점 더 모모코에게 집착하기 시작하는데','https://www.lezhin.com/ko/comic/same_hojeok','https://ccdn.lezhin.com/v2/comics/5108751126036480/images/tall.webp?updated=1724983641173&width=420','완결'),
('용사 서포트센터 마왕성지부','쟈코·시프트코믹스',array['판타지']::text[],'어느 「왕국」을 위협하는 「마왕군」에 맞서기 위해
용사·츠무기는 여행을 떠난다.
그 여행에 필요한 자금과 장비는 물론, 
「몬스터」를 쓰러뜨리면 얻을 수 있는 금과 아이템.
그것이 너무나도 「당연」해 아무도 알아채지 못했다.

─몬스터는 왜 용사에게 「도움이 되는 것」을 갖고 있는 것인가?
그 대답은 바로 「왕국」과 「마왕군」의 밀약에 있는데……?!','https://www.lezhin.com/ko/comic/yusha_support_center','https://ccdn.lezhin.com/v2/comics/5912284051603456/images/tall.webp?updated=1667438593159&width=420','완결'),
('소녀가 죽는 이야기','야나모토 미츠하루',array['로맨스']::text[],'고교입학식 날,순정만화같은 청춘을 꿈에 그리는 치호에게
굉장히 멋진 남자애 카즈야와 인형처럼 귀여운 여자애 하루카
두 명의 친구가 생겼다.
카즈야에게 아련한 연심을 품고 셋이 함께 만끽하는 고교생활…
하지만 어느 날,하루카가 둘의 앞에서 갑자기 모습을 감추고…
시한부 인생을 살게 된 소녀와 그 주변 사람들을 그린
눈물의 감동 스토리…','https://www.lezhin.com/ko/comic/girldie','https://ccdn.lezhin.com/v2/comics/821/images/tall.webp?updated=1427179736322&width=420','완결'),
('비검문도','토마토냠·A-SOUL•아예·다온크리에이티브',array['액션']::text[],'이세계엔 요괴가 있고, 요괴를 죽일 수 있는 ''요마사(妖魔師)''가 있다. 
요마사 진휘는 10년 간의 수련을 마치고 고향에 돌아왔다.
하지만 그를 기다리고 있는 건, 요괴에 쓰인 그의 친형이었다. 
술법을 통해 형을 구한 진휘는 본격적으로 ‘비검(飛劍)’을 수행하려 하지만…
그가 부재했던 10년 동안 많은 것이 바뀌었음을 알게 되고,
이를 바로잡는 와중에 ','https://www.lezhin.com/ko/comic/daggerdisciple','https://ccdn.lezhin.com/v2/comics/7011740646072956/images/tall.webp?updated=1753331176668&width=420','완결'),
('도깨비 낭군님','미르·위즈덤하우스',array['로맨스']::text[],'[자신을 짝사랑하는 연리를 지키고자 하는 무진의 고군분투]

어린 시절 우연히 잠들어 있던 도깨비왕 무진의 봉인을 풀어준 허연리.
무진은 그에 대한 보답으로 연리와 그녀의 가족들을 보호해주며 귀계로 돌아갈 방법을 찾지만, 연리는 줄곧 무진과의 사랑을 꿈꾼다.
그러던 어느 날, 자신이 그림을 실체화할 수 있는 능력이 있는 반인반요란 사실을 알게 되는 연리. ','https://www.lezhin.com/ko/comic/dokkaebi_nanggun','https://ccdn.lezhin.com/v2/comics/7011750739482789/images/tall.webp?updated=1752553522731&width=420','완결'),
('히메노 양에게 사랑은 아직 일러','유즈치리·대원씨아이',array['로맨스']::text[],'아이카와 히메노, 초등학교 4학년생.
동급생 오우지에게 연애감정을 품고 있으나,
그 마음을 제대로 전달하지 못하고―?!
살짝 조숙한, 헛다리 러브코미디 개막♪

HIMENOCHAN NI KOI WA MADA HAYAI　
ⓒ YUZUCHIRI 2019
All Rights Reserved
Korean translation rights arranged with ','https://www.lezhin.com/ko/comic/himeno_chan','https://ccdn.lezhin.com/v2/comics/5156665931137024/images/tall.webp?updated=1672127051434&width=420','완결'),
('붕대 공작의 결혼 사정','토키노 미츠루·카나데 마이네·디앤씨미디어·HUSH(허쉬)',array['로맨스']::text[],'온몸이 붕대로 감겨 있다는 이유로
‘붕대 공작’이라는 별명을 가진
베스큐레 공작가 당주 알프레드는
모두의 두려움을 사고 있었다.
하지만 갑작스러운 국왕의 명령으로 결혼을 하게 된다.
그리고 신부 시에라는 어째선지 알프레드에게 푹 빠져 있는데……!
비밀을 가진 고독한 공작과
여신의 가호를 받은 가희가 자아내는 결혼 이야기의 막이 오른다!','https://www.lezhin.com/ko/comic/bandage_duke','https://ccdn.lezhin.com/v2/comics/5513120204390400/images/tall.webp?updated=1714445500229&width=420','연재'),
('흡혈귀 전남친의 집착','Hangman Culture·엠스토리허브',array['로맨스']::text[],'직장 동료가 회식자리에 데려온 애인이 7년 전, 자신의 첫 사랑일 확률은?!

사립 초등학교 교사로 일하고 있는 한미아는
우연히 자신의 첫 사랑이자 첫 연인이었던 준혁을 마주치게 된다.
시간이 흘러 이미 서로 다른 사람의 연인이 된 둘,
미아는 준혁을 피하려 하지만, 어째서인지 자꾸 준혁과 얽히게 되고...

그런데, 이 남자 어딘가 수상하다...!','https://www.lezhin.com/ko/comic/ex_bf_obsession','https://ccdn.lezhin.com/v2/comics/5857324894584832/images/tall.webp?updated=1688120433982&width=420','완결'),
('키스해도 될까요?','우타카타·디앤씨미디어·HUSH(허쉬)',array['로맨스']::text[],'사랑의 형태는 한 가지가 아니다.
친구 같은 날도 있는가 하면, 달콤하게 키스하는 밤도 있다.

여러 커플들이 나누는 사랑의 형태를 가득 담은 옴니버스 단편집 등장!
특별 만화도 듬뿍 담았습니다♪','https://www.lezhin.com/ko/comic/can_i_kiss','https://ccdn.lezhin.com/v2/comics/5636801514242048/images/tall.webp?updated=1695621162589&width=420','완결'),
('Paradox Live Stage Battle “COMIC”(파라독스 라이브)','나루·파라독스 라이브·HUSH(허쉬)',array['드라마']::text[],'가까운 미래, 포화 상태가 된 HIPHOP 장르에서 
새로운 무브먼트 ‘환영 라이브’가 탄생했다.
래퍼들은 ‘팬트메탈’이라 불리는 금속을 포함한 액세서리와 
자신의 DNA를 화학 반응시켜 감정과 링크된 환영을 만들어 
화려한 스테이지로 젊은이들을 열광시켰다.

갑자기 부활한 전설의 클럽 ‘CLUB paradox’! 
그곳에서 개최된 ‘Paradox Live','https://www.lezhin.com/ko/comic/paradoxlive','https://ccdn.lezhin.com/v2/comics/6148039251918848/images/tall.webp?updated=1690872252137&width=420','연재'),
('이세계에서 언니에게 이름을 빼앗겼습니다','NiKrome·코토코·대원씨아이',array['로맨스']::text[],'대학생인 이치카는 창고에서 발견한 손거울을 통해 이세계에 사는 세실이라는 소년과 교류하고 있었다. 
그런 어느 날, 언니인 카렌이 갑자기 사라지고, 그와 동시에 손거울도 사라지고 만다. 
1년 후, 이치카는 우연히 찾은 손거울을 손에 쥔 순간, 이세계로 넘어가게 된다. 
그곳에서 연상으로 성장한 세실과 무슨 이유에서인지 자신을 이치카라 자칭하며 성녀가 되어','https://www.lezhin.com/ko/comic/i_lost_name_to_sister_in_isekai','https://ccdn.lezhin.com/v2/comics/7011730701544861/images/tall.webp?updated=1730961852500&width=420','연재'),
('죽이고 싶을 만큼 사랑해','이시카와 토미·아이미 루이·지티이엔티',array['로맨스']::text[],'부모님의 원수를 갚기 위해 복수하고 싶은 남자가 있다. 
어느날 클럽에서 그 남자를 발견해 복수 계획을 시도하지만, 곧바로 들키는 데다 부모님이 남긴 유품까지 뺏긴다. 
돌려받고 싶다면 따라오라는 남자의 말에 따라갔지만, 그곳에서 남자는 ''겨울이 되면 죽어줄 테니 그동안 자기 여자인 척해달라''는 터무니 없는 부탁을 한다. 
그래, 당신만 죽어준다면 언제든지','https://www.lezhin.com/ko/comic/love_you_murderous_intent','https://ccdn.lezhin.com/v2/comics/4568768536444928/images/tall.webp?updated=1725599095698&width=420','완결'),
('환생 여제, 악녀가 되다','moleng·dingdang·스튜디오원더',array['로맨스']::text[],'사람 목숨은 파리 목숨 정도로 여기면서 오직 먹는 것에 목숨 거는 여자 주인공 명주! 

어느 날 타임슬립 시스템을 통해 여러 세계를 갈 수 있게 되었다. 
꼬여버린 세계관 속에서 악역 캐릭터가 된 명주는 비상식적 방식으로 교활한 “타깃”을 공격한다. 
세계를 정상화시키고 임무를 완수하는 한편, 남자 주인공과도 쫓고 쫓기는 로맨스를 하게 된다.','https://www.lezhin.com/ko/comic/rebirth_bad_girl','https://ccdn.lezhin.com/v2/comics/5239993849937920/images/tall.webp?updated=1751012301707&width=420','완결'),
('SOUL SAVER (소울 세이버)','지미·락킨코리아',array['판타지']::text[],'무녀마을의 한 무녀, 그리고 그녀의 일란성 쌍생아 난하와 유기. 순탄하던 그들의 삶에, 갑자기 주위의 수많은 사람들이 죽어가기 시작한다..','https://www.lezhin.com/ko/comic/soul_saver','https://ccdn.lezhin.com/v2/comics/5828765125181440/images/tall.webp?updated=1467354459636&width=420','완결'),
('버려진 성녀는 이번 생엔 사랑을 거부하기로 맹세합니다 [연재]','아베rage·하카엔·곤니치와와·마리파라·라이트박스',array['로맨스']::text[],'「사랑의 나라」 조안카의 성녀는 「사랑의 힘」을 원천으로 성스러운 힘을 사용한다.
성녀 멜디아나는 왕자 아빈과 사랑하는 사이였고 그와 결혼하여
막강한 힘을 얻게 될 예정이었다—. 

그러나 결혼식 다음날, 아빈은 딴 사람이 된 것처럼 정체불명의 여자와
키스를 나누며 멜디아나에게 파혼을 선언했다. 
사랑하는 사람과 성녀의 힘, 모든 걸 잃은 멜디아나는 나라에','https://www.lezhin.com/ko/comic/rejects_love','https://ccdn.lezhin.com/v2/comics/7011781761863111/images/tall.webp?updated=1781849174128&width=420','연재'),
('재벌 아가씨와 소꿉친구 집사!','시도 코하루·오하나·히이라기 아마루·지티이엔티',array['로맨스']::text[],'갑갑한 본가를 탈출해 혼자 살고 있던 재벌 아가씨 치세. 
자유로운 생활을 만끽하던 중, 소꿉친구이자 첫사랑인 레이가 나타났다. 
자기를 본가에 끌고 갈 줄 알았는데, 갑자기 치세를 돌보겠다는 레이. 
자기는 나중에 가문에 어울리는 정략결혼을 해야 하지만, 어쩌다 같이 살게 된 레이가 자꾸만 신경 쓰여 참을 수가 없는데! 
꿍꿍이가 있는 집사 X 고집 센 ','https://www.lezhin.com/ko/comic/lady_butler_friend','https://ccdn.lezhin.com/v2/comics/6350057495527424/images/tall.webp?updated=1732609620448&width=420','완결'),
('크로스 로드~그날의 약속~','이즈미 타다시·하루카 요코·후지오미 미야코·아이온스타',array['로맨스']::text[],'대학생 나미, 그리고 배우를 꿈꾸는 카이토.
조용하게 시작된 운명의 사랑은 점점 가속화되고….
오해와 엇갈림을 극복하고 두 사람의 마음은 하나가 된다!!

사랑에 힘을 실어주는 소설 원작이 마침내 코믹화!!','https://www.lezhin.com/ko/comic/cross_road','https://ccdn.lezhin.com/v2/comics/5300581136859136/images/tall.webp?updated=1468807657613&width=420','완결'),
('가르쳐줘!! 코스 누나','코바시코·소미미디어·S코믹스',array['드라마']::text[],'코스프레에 흥미가 있긴 하지만 
손을 못 대고 있던 고등학생 산카쿠. 
오늘도 코스프레 회장에 가서는, 
코스어가 아니라 사진사로 참가하고 만다…. 
그런 와중, 수수께끼의 코스플레이어 ‘코스 누나’를 만나는데…?! 

너무나 독특한 
미인 코스어가 자아내는, 
신감각 코스프레 코미디!!','https://www.lezhin.com/ko/comic/oshiete_cos_neesan','https://ccdn.lezhin.com/v2/comics/5834452816429056/images/tall.webp?updated=1629362871900&width=420','연재'),
('암흑기사인 내가 최강의 성기사를 목표로 합니다','니시지마 후미카루·시프트코믹스',array['판타지']::text[],'암흑계열직 엘리트 일가 출신 카이는 최강이 되기 위해 노력 중. 
그러던 어느 날, 몬스터에게 습격당하는 제4왕녀 시엘을 구해준 것을 계기로 
신성계 직업을 육성하는 학교에 입학하게 된다. 
기절할 만큼 체질에 맞지 않는 신성 마법 훈련을 견디면서까지 그가 목표로 삼는 것은 
최강의 암흑기사를 넘어― 왕국 최강의 왕궁 성기사!! 

타고난 암흑기사의 난관돌','https://www.lezhin.com/ko/comic/seikishi_wo_mezashimasu','https://ccdn.lezhin.com/v2/comics/6547682124693504/images/tall.webp?updated=1615279913113&width=420','연재'),
('사촌오빠의 이삿짐 정리가 끝나지 않아','요시베 아쿠로·대원씨아이',array['코미디']::text[],'오랜만에 만난 사촌오빠가 꽃미남.
대학에 다니기 위해 함께 산다고 한다…. 하지만 사촌 오빠의 본성은….
펼쳐지는 마니악한 지식과 성적 취향. 연이어 날아오는 엉뚱한 소리에 지적하는 것만으로 기진맥진!
달콤한 무드는 언감생심, 안타까운 마음만 늘어 가고….
‘오빠, 좋아해!’
그 말을 전하고 싶을 뿐인데…. 웃기고 귀여운 러브 코미디

ⓒAkuro Yosh','https://www.lezhin.com/ko/comic/hikkosino_sitaku','https://ccdn.lezhin.com/v2/comics/6057617743740928/images/tall.webp?updated=1682060017604&width=420','완결'),
('"만지고 싶어"는 사랑의 시작','쿠모코·조은세상·릴리',array['로맨스']::text[],'“저는 ”사랑“을 알고싶어요.”

타고난 외모와 시크한 분위기로
학생들에게 인기가 많은 문학소녀 미나토 카에데.
인형같은 사랑스러움으로 입학하자마자
학교의 아이돌이 된 미소녀 핫토리 모모코.

거의 접점이 없던 두 사람이이지만
모모코가 카에데의 “그 현장”을 목격하면서
급격하게 가까워지는데―――','https://www.lezhin.com/ko/comic/touch_is_start_of_love','https://ccdn.lezhin.com/v2/comics/7011777672896563/images/tall.webp?updated=1778670905710&width=420','연재'),
('낙명 마녀와 시간을 거스르는 서방님의 죽지 않는 혼약인','아즈야 치토세·시프트코믹스',array['로맨스']::text[],'미셀라는 ''마법사''를 육성하는
마법마술 학원을 다니는 13살의 소녀.
그러나 마력 컨트롤에 미숙한 탓에 
종종 폭발을 일으킨다.

그러던 어느 날, 미셀라는 
주변에 피해를 입힐 정도로 커다란 폭발을 일으킬 위기에 처하고
죽음을 예감하던 그때-!
미셀라 앞에 한 청년이 서 있었다.
청년의 이름은 유시어스. 그는 자신이 미래에서 왔다고 한다.

''18살에 죽','https://www.lezhin.com/ko/comic/rakumeimajo','https://ccdn.lezhin.com/v2/comics/6494278018990080/images/tall.webp?updated=1670202960125&width=420','완결'),
('Have a Great Sunday','오노 나츠메·학산문화사',array['드라마']::text[],'소설가 사사이 린지.
오랫동안 뉴욕에 살던 그는
어떤 사정으로 혼자 도쿄에 돌아왔다.
마음 편히 혼자만의 생활을 즐기고 있었지만,
일본에 사는 아들 맥스와 사위 야스가
린지를 따르며 매주 일요일마다 찾아오는데─?!','https://www.lezhin.com/ko/comic/have_a_great_sunday','https://ccdn.lezhin.com/v2/comics/4661147195473920/images/tall.webp?updated=1764231376744&width=420','완결'),
('서라벌 로맨스','지나C·밤빵·케나즈',array['로맨스']::text[],'불평등한 세상은 노력해도 바뀌는 건 없다며 매일 놀고 마시던 새내기 여대생 소영은 성년식을 앞두고 과거로 가 신라의 공주인 소룡의 몸에 빙의하게 되고, 
성골의 치명적 약점인 금발머리를 숨겨가며 하루하루 살기 위해 죽기 살기로 노력한다.','https://www.lezhin.com/ko/comic/sorabol_romance','https://ccdn.lezhin.com/v2/comics/5832210805620736/images/tall.webp?updated=1715826998232&width=420','완결'),
('서투른 선배','쿠도 마코토·대원씨아이',array['로맨스']::text[],'‘서툴다’는 것은 마음을 울리는 재능이다.

‘예쁘지만 무섭고 엄격하다….’ 라며
회사 안의 평가가 여러모로 아쉬운 27세 회사원 칸나와.
서투른 그녀가 신입사원 카메가와의 사수를 맡게되어,
처음으로 후배를 지도하게 되는데···?!

ⓒMakoto Kudo/SQUARE ENIX CO., LTD.','https://www.lezhin.com/ko/comic/hetakuso_senppai','https://ccdn.lezhin.com/v2/comics/4709569260224512/images/tall.webp?updated=1782190733770&width=420','완결'),
('이 쓰레기를 뭐라고 부를까','테츠카즈·대원씨아이',array['로맨스']::text[],'- 형의 스토커한테 반했어요.
내가 좋아하는 사람은 형의 전 여자친구. 그녀는 부담스럽고, 형을 포기하지 못해 내 약점을 이용하는 쓰레기인데, 아무래도 이 관계를 그만둘 수 없을 것 같다. 두 남자와 스토커 사이의 멘헤라 블랙 러브 코미디!!

ⓒtetsukazu 2023 / KADOKAWA CORPORATION','https://www.lezhin.com/ko/comic/call_this_trash','https://ccdn.lezhin.com/v2/comics/7011744263932233/images/tall.webp?updated=1744678928944&width=420','완결'),
('환상의 에덴','후지토비·㈜에이블웍스 씨앤씨·시트러스 코믹스',array['로맨스']::text[],'어떠한 이유로 방랑하고 있는 사형 잇테츠를
데리러 온 승려 야마토.

너무나도 불량한 잇테츠의 태도에 휘둘리며
야마토는 짜증만 치솟는다.

그러나 함께 여행하는 동안 잇테츠 나름의 다정함과
배려를 겪으며 점점 그에게 마음이 쏠리고···
어느 덧 짝사랑으로 발전하는데?!

불량 X 성실이라는 정반대인 두 사람이 펼치는
두근두근 짝사랑 러브스토리!

대인기 시','https://www.lezhin.com/ko/comic/mahoroba_eden','https://ccdn.lezhin.com/v2/comics/4753476671045632/images/tall.webp?updated=1688453225700&width=420','완결'),
('루미너스 = 블루','이와미 키요코·AK 커뮤니케이션즈·AK 코믹스',array['로맨스']::text[],'지금, 두 사람의 사진을 찍고 싶어!
사진을 좋아하는 고등학생 코우는,
‘좋아하는 것’을 찍을 땐 주변을 살피지 않는 것이 고민이다.
그런 코우가 전학을 간 학교에서 만난 친구는
갸루 느낌의 아마네와 모델을 하고 있는 네네
두 사람의 모습을 보고 사진대회에서의 입상을 원하는 코우는
‘두 사람의 사진을 찍고 싶어!’ 라고 말을 하지만…
두 사람의 관계엔 코우','https://www.lezhin.com/ko/comic/luminous_blue','https://ccdn.lezhin.com/v2/comics/4708524164186112/images/tall.webp?updated=1606199456173&width=420','완결'),
('꽃 이야기','schwinn·학산문화사',array['로맨스']::text[],'오랜 세월을 함께한 남편을 떠나보낸 하나요.
홀로 화장품 전문점을 경영하는 요시코.
전혀 다른 인생을 살아온 둘은 할머니가 되어서야 만나, 이끌려, 서로를 알아간다….','https://www.lezhin.com/ko/comic/the_flower_story','https://ccdn.lezhin.com/v2/comics/7011731996463535/images/tall.webp?updated=1764305399742&width=420','완결'),
('입히고 싶은 상사와 익숙지 않은 부하','나츠나 호노·시프트코믹스',array['로맨스']::text[],'의류 회사에서 일하는 회사원 코사카 유즈는
귀여운 아이템을 좋아하지만 어울리지 않는 것이 콤플렉스.
예쁜 옷을 보는 것도 좋아하고 입어보고 싶은 마음도 있지만…
「나한텐 안 어울려」라는 생각에 도무지 손이 가지 않는다.
어느 날, 친구의 선물을 사러 여성 의류매장에 들렀다가
피팅룸에서 무섭기로 유명한 상사를 만나는데?!

「나를 위해서 입어주지 않겠어?」
','https://www.lezhin.com/ko/comic/given_by_my_boss','https://ccdn.lezhin.com/v2/comics/5379790025850880/images/tall.webp?updated=1661751387858&width=420','연재'),
('매주 만나요','오유담·키다리스튜디오',array['로맨스']::text[],'조카를 돌봐주다 마주친 학습지 선생님 윤수에게 반해버린 도혁!
그대로 윤수와 헤어질 수 없었던 도혁은 무턱대고 그에게 학습지를 신청하고 마는데......이 귀여운 거짓말은 과연 얼마나 들키지 않을 수 있을까?!','https://www.lezhin.com/ko/comic/see_you_everyweek','https://ccdn.lezhin.com/v2/comics/5385578559635456/images/tall.webp?updated=1666247525958&width=420','완결'),
('네가 나에게 들려주는 이야기','나치 미사코·AK커뮤니케이션즈·AK코믹',array['일상']::text[],'우리 고양이도 이런 생각을 하고 있을까?’','https://www.lezhin.com/ko/comic/in_cats_head','https://ccdn.lezhin.com/v2/comics/6537901025001472/images/tall.webp?updated=1497503172707&width=420','연재'),
('모처럼 영애로 빙의를 했는데 이미 저질러 버린 뒤였습니다!','사와노 이즈미·AK 커뮤니케이션즈·AK 코믹스',array['로맨스']::text[],'회사의 노예처럼 매일같이 일하던 주인공.
어느 날, 눈을 떠보니 이세계의 영애 크리스티나에게 빙의되어 있었다.
하지만 이는 내심 원하고 있었던 인생 다시 시작하기, 가 아니었고.

기억에 따르면 이 신체의 소유자는 터무니없는 악녀로, 이미 여러 일을 『저지른 뒤』였던 거다!
왕태자로부터는 「다음은 없다」라며 위협받고, 억제 수단이라는 이유로 붙은 감시역 공','https://www.lezhin.com/ko/comic/pretending_princess','https://ccdn.lezhin.com/v2/comics/7011748858889901/images/tall.webp?updated=1749092500540&width=420','연재'),
('쪽빛에 물들다 [개정판]','찬·북극여우',array['로맨스']::text[],'[해당 작품은 &lt;쪽빛에 물들다&gt; 성인 버전의 일부 장면을 수정한 15세 개정판입니다. 이용에 참고 부탁드립니다.]
한대감댁 머슴 ''석''은 심부름으로 저잣거리에 나왔다가 우연히 남사당패의 놀이판을 구경하게 되고, 자신을 바라보던 삐리 ''희주''를 잊지 못한다.','https://www.lezhin.com/ko/comic/stained_with_indigo_15','https://ccdn.lezhin.com/v2/comics/6748977683562496/images/tall.webp?updated=1710117089677&width=420','완결'),
('천추','김성재·김병진·대원씨아이',array['판타지']::text[],'두 명의 형제, 뒤바뀐 운명!
어둠 속을 걷는 전사들의 이야기!!

황국을 멸하고 부모를 죽일 ‘악령의 자식’이란 낙인을 안고 변방의 전장을 헤매는 천추. 
죽어야 할 그가 살아남아 쌍둥이 형 을파소가 황위를 물려받은 고국으로 돌아간다. 하지만 그를 반기는 이는 아무도 없다. 
오직 귀환길에 만난 파사만이 그를 안타까워할 뿐… 하지만 그녀는 형의 아내가 될','https://www.lezhin.com/ko/comic/cheonchu','https://ccdn.lezhin.com/v2/comics/6513625742508032/images/tall.webp?updated=1652144926800&width=420','완결'),
('보석성의 신입','마리무·시프트코믹스',array['판타지']::text[],'시골 출신 소녀 마나.

취직하기 위해 고향을 떠나서 온 곳은 
신비로운 에너지가 깃든 
보석을 다루는 동경하던 직장 보석성!! 
기합과 의욕 충만! 
그러나 결과는 따라와주질 않고….

어엿한 한 사람의 ‘시커’가 될 날은 멀기만 한데….','https://www.lezhin.com/ko/comic/hosekisho_no_shinjin','https://ccdn.lezhin.com/v2/comics/4789232487170048/images/tall.webp?updated=1628057164582&width=420','완결'),
('그 남자의 하이힐','김지미·연담',array['드라마']::text[],'평범하다 못해 존재감마저 희미한 남자 만석,
그에겐 은밀한 취미가 하나 있는데...
그건 바로 하·이·힐을 신는 것!

그의 발은 슬럼프에 빠졌던 천재 구두 디자이너
체이스오의 영감을 자극하기 시작하고...

하이힐을 신는 남자 만석과 하이힐을 만드는 남자 체이스 오
두 남자의 운명적 이야기, &lt;그남자의  하이힐&gt;','https://www.lezhin.com/ko/comic/his_high_heels','https://ccdn.lezhin.com/v2/comics/7011770137607696/images/tall.webp?updated=1771479293713&width=420','완결'),
('아름다운 그녀','유우 요시다마루·이코믹스·코랄',array['로맨스']::text[],'아이돌 멤버로 「청순파」를 지향하는 마린에게 있어서
어떤 작은 것에도 감동을 찾아내고 기뻐하는 반 친구 타니모토는 롤모델이다.
그런 그녀가 전학 갈 거란 얘기를 들은 마린은 타니모토에게 상처 주는 말을 하게 되는데…
[본 작품은 여러 에피소드로 구성되어 있는 단편집입니다.]','https://www.lezhin.com/ko/comic/beautiful_girl','https://ccdn.lezhin.com/v2/comics/4935551247515648/images/tall.webp?updated=1580362806677&width=420','완결'),
('릴리 릴리 라라 랜드','모리키 타케시·대원씨아이',array['로맨스']::text[],'유서 깊은 기숙사제 사립학교 릿카몬 여학원에는 기숙사 개인실의 스페어 키를 누군가와 교환하는 것으로 성립되는, 서로를 도와주는 파트너 제도인 ‘단짝 제도’가 있다. 학생들의 화제의 중심은 이 제도와 ‘5명의 아가씨가 주최하는 초대제 차모임’으로, 5명의 아가씨는 전교생의 동경의 대상이자 질서였다. 하지만 고교 1학년 케와키 에미에게 도착한 ‘어떤 열쇠’의 ','https://www.lezhin.com/ko/comic/lilly_lilly_lalaland','https://ccdn.lezhin.com/v2/comics/5805969469407232/images/tall.webp?updated=1681728287269&width=420','연재'),
('매리지 퍼플','하야시 미카세·학산문화사',array['로맨스']::text[],'동경하던 고등학교에 입학한 린은 불합리한 폭군 유키치와 3년 만에 재회한다.  옛날부터 사사건건 시비를 걸덨던 유키치에게서 벗어나기 위해, 그가 내민 종이에 대충 이름을 적었으나…. 그것은 혼인 신고서였다!  돌려받는 조건은 ''3년 동안 내 곁에서 도망치지 말 것''. 폭군에게 붙잡힌 린의 운명은─?!','https://www.lezhin.com/ko/comic/marriage_purple','https://ccdn.lezhin.com/v2/comics/5452086577004544/images/tall.webp?updated=1764234120424&width=420','완결'),
('절대 연애 운명 : 전생한 여전사가 사랑받는 세계','카놀라 유우·라이트박스',array['로맨스']::text[],'신들의 전쟁에 인간이 참전해야 하는 세계.
전장의 최전선에서 활약하던 여전사 루이즈는 치명상을 입고,
라이벌이었던 에리히의 품에서 숨을 거둔다.
그때, 신에게 무언가를 빌던 에리히의 말을 루이즈는 듣지 못했다.

―그리고 루이즈가 다시 눈을 뜬 곳은 놀랍게도 이전 생과 정반대인
평화롭고 로맨스 소설 같은 세계! 
사람들은 모두 ‘사랑’에 미쳐있고, ‘뻔한 ','https://www.lezhin.com/ko/comic/absolute_love_destiny','https://ccdn.lezhin.com/v2/comics/7011781761217688/images/tall.webp?updated=1785733336801&width=420','완결'),
('서랍 속 테라리움','쿠이 료코·소미미디어·S코믹스',array['드라마']::text[],'《던전밥》저자 쿠이 료코의 단편집!
새롭게 단장한 신장판, 전격 발매!!

어서오세요, 쇼트쇼트 원더랜드에.
웃음과 눈물, 놀라움과 공감. 개그, 옛날이야기, 판타지, SF……
만화경처럼 반짝이는 엽편 33편.

‘호수 밑바닥의 봄’, ‘연인 카탈로그’, ‘가엾은 동물원’, ‘용의 역린’, ‘기호를 먹다’, ‘대리재판’, ‘머나먼 이상향’, ‘엄청난 부자’','https://www.lezhin.com/ko/comic/terrarium_in_drawer','https://ccdn.lezhin.com/v2/comics/6634253806010368/images/tall.webp?updated=1662536488155&width=420','완결'),
('첫사랑 카운터 어택 [개정판]','오하나·학산문화사',array['로맨스']::text[],'[해당 작품은 일부 장면을 편집한 개정판입니다.]

''학생회 부회장 미사키는 쿨하고 인기 많은 후배 후지카와에게 얕보이고 있다.
오직 미사키에게만 보이는 건방진 태도에 화는 나지만,
성적이 좋고 운동도 잘하는 데다 키까지 큰 후지카와에게
무엇 하나 이기지 못하고 열등감만 쌓여갈 뿐.
그러던 어느 날, 울보였던 ‘첫사랑 소녀’의 정체가 후지카와였다는 사실을 ','https://www.lezhin.com/ko/comic/firstlove_counter_attack','https://ccdn.lezhin.com/v2/comics/4525613477330944/images/tall.webp?updated=1764234023124&width=420','완결'),
('쿠즈미 군 분위기 파악하나요?','모스코·대원씨아이',array['로맨스']::text[],'스쳐 지나도 엇갈려도 짝사랑은 재미있다!

교내 인기 짱 여고생 사쿠라 에리카. 
반에서는 ''벼랑 위의 꽃''과 같은 존재로서 선망어린 시선을 받는 에리카이지만 최근에는 분위기 파악 못 하는평범남 쿠즈미가 신경 쓰이는 듯하다. 
자꾸 엇갈리는 두 사람이 사랑에 빠졌을 때, 짝사랑은 개그가 된다! 
심쿵 유발의 신감각 비접촉 쇼트 러브 코미디! 
ⓒMosco/','https://www.lezhin.com/ko/comic/kuzemikun','https://ccdn.lezhin.com/v2/comics/4555099948253184/images/tall.webp?updated=1632808295632&width=420','완결'),
('어쩐지 기분 좋은 날 [개정판]','아오우메 아오·넥스큐브·페어리',array['로맨스']::text[],'과거에 좋아했었던 상대와 다른 사람의 결혼식에 참가하게 된 카이. 도저히 잊을 수 없는 과거를 잊기 위해 카이는 케이스케에게 자신의 몸을 여는데….','https://www.lezhin.com/ko/comic/pleasant_day','https://ccdn.lezhin.com/v2/comics/5144274225659904/images/tall.webp?updated=1605503361699&width=420','완결'),
('아이돌과 몸이 바뀌어 버렸다','우리·주식회사 코코미디어',array['로맨스']::text[],'"인기 아이돌 그룹 TREE의 리더인 내가 안티팬과 몸이 바뀌었다?!"

내 몸을 이용해 당당히 TREE의 숙소에 들어가고,
코앞에서 최애 멤버를 덕질하더니만, 내 흑역사까지 파헤치려 하다니...
하아, 그녀를 공략하는 것 말고 다른 방법이 없겠어!','https://www.lezhin.com/ko/comic/changed_body_idol','https://ccdn.lezhin.com/v2/comics/4800196354703360/images/tall.webp?updated=1717057293858&width=420','완결'),
('정령환상기','미나즈키 후타고·키타야마 유리·소미미디어·S코믹스',array['판타지']::text[],'수년 전에 어머니가 살해당한 사건으로 지저분한 슬럼으로 몸을 피해, 복수만을 꿈꾸며 살아가던 7살 소년, ''리오''. 
그런 리오에게 갑자기, 일본 대학생 ''하루토''로 지냈던 시절의 기억이 되살아나는데…','https://www.lezhin.com/ko/comic/seireigensouki','https://ccdn.lezhin.com/v2/comics/6026538243129344/images/tall.webp?updated=1741765016900&width=420','연재'),
('넥타이와 사마귀','아유 야마네·프라이데이·크림툰',array['로맨스']::text[],'회사의 선후배 관계인 나츠키와 토키타.
밝은 모습으로 직장에서 인기를 독차지하고 있는 멋진 토키타를 나츠키는 항상 눈부신 마음으로 바라보고 있다.
벌레를 극도로 무서워하는 나츠키의 집에 사마귀가 들어오게 되고, 어쩔 수 없이 토키타에게 도움을 청하게 된다.
고마움과 미안함을 이야기하는 나츠키에게 토키타는 상상도 할 수없는 말을 돌려주는데...?!
행복하기도','https://www.lezhin.com/ko/comic/mantis','https://ccdn.lezhin.com/v2/comics/5287746238283776/images/tall.webp?updated=1525229424654&width=420','완결'),
('이 거리에서 너에게','히이라기 아오이·루트미디어·클로버즈',array['로맨스']::text[],'26세의 평범한 우체국 직원인 히로아키는 정말로 자신을 좋아해 주는 여자친구를 만들고 싶지만 좀처럼 이성을 접할 기회가 없어 솔로인 나날을 보내고 있다. 
평소처럼 우편 배달을 하던 도중 여고생인 것 같은 소녀에게 우편물을 전달하고 학교는 재밌냐는인사말을 건네지만 어째선가 그 말을 듣고 무척 화가난 듯 집으로 들어가 버린다. 

이후 몇 일이 지난 어느날,','https://www.lezhin.com/ko/comic/in_this_way','https://ccdn.lezhin.com/v2/comics/5262058392387584/images/tall.webp?updated=1467166032938&width=420','완결'),
('구원자의 요리법','이아영·송아삐·여왕·스토리작',array['로맨스']::text[],'"저와 함께 가서 세계를 구해 주십시오."

연휴를 보내고 있던 요리사 유정의 평온한 삶에 낯선 남자가 들이닥쳤다.
자칭 이계인이라는 남자, ''니모''는 자신과 함께
신발장 너머의 세계로 넘어가 세상을 구원해 줄 것을 요청한다.

몇 번을 거절해 보았지만, 이 남자… 보통 끈질긴 게 아니다.
게다가 웬 돌멩이만 한평생 먹고 살았다니?

안쓰러운 마음에 각종 ','https://www.lezhin.com/ko/comic/recipe_of_savior','https://ccdn.lezhin.com/v2/comics/5126457859964928/images/tall.webp?updated=1738286318301&width=420','완결'),
('슬라임을 잡으면서 300년, 모르는 사이에 레벨MAX가 되었습니다','시바 유스케·데이즈엔터·노엔코믹스',array['판타지']::text[],'원래 세계에서 과로사한 것을 반성하고 여신님의 도움으로
불로불사의 마녀가 되어 느긋하게 300년을 살았더니――

레벨99 = 세계 최강이 되어 있었습니다.

생활비를 벌려고 틈틈이 잡았던 슬라임의 경험치가 너무 많이 쌓였나?
소문은 금방 퍼지고, 호기심에 몰려드는 모험가, 결투를 요청하는 드래곤,
급기야 나를 엄마라고 부르는 딸까지 찾아오는데요――.

슬라','https://www.lezhin.com/ko/comic/slime300','https://ccdn.lezhin.com/v2/comics/7011745994791200/images/tall.webp?updated=1747203676900&width=420','연재'),
('Day Off(데이 오프) 시즌2','dailygreens·AK 커뮤니케이션즈',array['로맨스']::text[],'훤칠한 키에 잘생긴 얼굴, 업무면 업무, 육아면 육아,
혼자서도 무엇이든 완벽하게 처리하는 슈퍼 싱글대디 석재하.
그런 그 앞에 청천벽력이 떨어졌으니!
연말 장기자랑에서 노래를 부르라고?!
사람들 앞에서 노래하는 데에 엄청난 트라우마를 가진 재하 앞에
웬 이상한, 아직 한참 어린 녀석이 나타났다.
인턴 임시우.
시크한 인상에 재하로서는 종잡을 수 없는 행동','https://www.lezhin.com/ko/comic/day_off_s2','https://ccdn.lezhin.com/v2/comics/7011773713353973/images/tall.webp?updated=1774595237657&width=420','완결'),
('얼어붙은 달이 내려앉은 곳','아오레·아쿠람·마야·제퓨어·소미미디어',array['로맨스']::text[],'[휴재 중] 밤마다 귀신이 들리는 신병에 걸린
제국 유일의 소드마스터.
''라비루스 펜하크''

변방에서 용병단을 운영 중인 어느 날,
그는 천재 소년 ''셀''을 스카웃한다.

어떤 여자에게도 반응 없던 그가
셀에게만 반응하기 시작하는데…

''미친, 이거 어떻게 된 거야!
그럴 리 없어. 내가 남자를 좋아할 리가.''

성별을 속이고 용병단에 입단한 셀은
자신에게','https://www.lezhin.com/ko/comic/frozen_moon','https://ccdn.lezhin.com/v2/comics/6044137492250624/images/tall.webp?updated=1736844671716&width=420','연재'),
('DORIS (도리스)','지미·락킨코리아',array['드라마']::text[],'성당 가득히 울리는 웨딩마치가 우리가 앞으로 얼마나 행복할 지를 알려 주려는 것 같았다. 이제 더 이상 우리 앞에 불행 따위는 없으리라....','https://www.lezhin.com/ko/comic/doris','https://ccdn.lezhin.com/v2/comics/5885750612852736/images/tall.webp?updated=1465437240687&width=420','완결'),
('오니마루씨에게 스카우트를 당했습니다.','유미츠키 라무네·지티이엔티',array['로맨스']::text[],'어릴 때부터 요괴가 잘 들러붙는 특이 체질을 가진 나카모토 레이.
고등학교에 가서도 친구가 생기지 않을까 걱정하던 중
요괴 상담소라는 수상한 건물을 발견한다.

그리고 그곳에서 엄청난 미남을 만나고,
심지어 그 미남에게 ''내 것이 되어 달라''는 충격 고백까지 받는데?!
ⓒRamune Umitsuki／ⓒFUNGUILD','https://www.lezhin.com/ko/comic/onimaru','https://ccdn.lezhin.com/v2/comics/4858286840283136/images/tall.webp?updated=1639375305462&width=420','완결'),
('보이지 않는 사람','교선·재담미디어',array['드라마']::text[],'한 순간 아무것도 볼 수 없게 된 여자 앞에 아무도 봐 줄 수 없는 남자가 나타났다.','https://www.lezhin.com/ko/comic/blind_and_invisible','https://ccdn.lezhin.com/v2/comics/4779691868225536/images/tall.webp?updated=1592555444240&width=420','완결'),
('누더기를 입어도 마음은 비단','하치 후지코·히오 네리·매니지먼트 감각',array['로맨스']::text[],'과거 가난했지만, 지금은 유복하게 살고있는 하루미.
밤마다 친구들과 놀러다니며 방탕한 생활을 이어간다.
우연히 술집에서 마주친 피아노 연주자가 물을 먹이는데?!
두 번은 만날 일이 없을 줄 알았던 그 남자는 바로 같은 학교 특진반 히나토였다.
장학생에 알바까지 하고 있는 히나토,
서로 다른 환경에서도 앞만 바라보며 나아가는 히나토를 보며 옅은 감정이 움직이','https://www.lezhin.com/ko/comic/silk_mind','https://ccdn.lezhin.com/v2/comics/4534859373150208/images/tall.webp?updated=1726039037760&width=420','완결'),
('저주받은 아이의 시종','시바미야 유키·학산문화사',array['로맨스']::text[],'「너만이 나의 시종이다」

특수한 능력 「저주」를 기피하는 세계.
불사의 저주에 걸린 소녀·레네는 꺼림칙하다는 이유로 일터에서 해고되어 구직 중이다.
그러던 어느 날, 왕자의 시종으로 스카우트 되지만
그는 만지는 모든 것을 죽이는 「독의 저주」로 인해 유폐되어 있는데…?!

이것은 상반된 저주에 걸린 고독한 두 사람의 운명의 만남.','https://www.lezhin.com/ko/comic/servant_of_cursedchild','https://ccdn.lezhin.com/v2/comics/5231088778936320/images/tall.webp?updated=1764234115324&width=420','완결'),
('특명! 10대에 하지 않으면 안될 50가지','나예리·락킨코리아',array['드라마']::text[],'이란성 쌍둥이인 미루와 쌍둥이 오빠 마루 그리고막내 다로가 겪는 10대의 실생활을 너무나 리얼하게 표현한 작품. 가정과 학교 에서 일어나는 상황들을 통해 작가가 찾아낸 기지 넘치는 50가지 에피소드!10대에게 50가지 해야할 특명이 내려진다.','https://www.lezhin.com/ko/comic/before_20s','https://ccdn.lezhin.com/v2/comics/5966811512438784/images/tall.webp?updated=1470884323101&width=420','완결'),
('커피전문점 고양이','스기사키 유키루·소미미디어·S코믹스',array['드라마']::text[],'대학 수험에 실패한 충격으로, 
기르던 고양이와 하코다테 산으로 도피한 니시코리 콘. 
막무가내로 뛰쳐나온 콘은 지갑도 뱃속도 텅텅. 

망연자실한 콘이 어떤 청년에게 이끌려 찾아간 곳은 
잘생긴 세 명의 남자들이 운영하는 
‘커피전문점 고양이’인데…?!','https://www.lezhin.com/ko/comic/cafe_cat','https://ccdn.lezhin.com/v2/comics/6686647497588736/images/tall.webp?updated=1640059593650&width=420','연재'),
('노하라 노하라노','카리 스마코·조은세상·라르고',array['로맨스']::text[],'뜨겁고 뜨거운 여름날 몸 상태가 안 좋아 움직일 수 없게 된 사이토자키를 같은 학교의 선배 이토시마는 친절하게 대해준다. 허리를 다쳐 야구를 그만두게 된 이토시마. 사이토자키는 이토시마가 신경쓰여 어찌할지 모르겠다. 욱신욱신 어질어질… 이 마음은 무엇일까?','https://www.lezhin.com/ko/comic/nohara','https://ccdn.lezhin.com/v2/comics/6197081746833408/images/tall.webp?updated=1537498806876&width=420','완결'),
('골목길 꽃노래','아소우 미코토·학산문화사',array['로맨스']::text[],'오더 메이드 구두 공방을 운영하는 니시야마 츠바키는
모두의 믿음직한 존재로 일에 힘써 왔지만,
정신을 차려보니 서른이 넘은 데다 덤으로 실연.
그래, 지금이 갈림길이구나….
장인 츠바키, 교토 골목길에서
일도 사랑도 분발하겠습니다!

ⓒMikoto Asou/Kodansha.Ltd.','https://www.lezhin.com/ko/comic/alley_flower_song','https://ccdn.lezhin.com/v2/comics/6190732299272192/images/tall.webp?updated=1764294020188&width=420','완결'),
('백야드 정크 유니버스','카토 타쿠지·somymedia·S코믹스',array['코미디']::text[],'&lt;메카니컬 버디 유니버스&gt; &lt;나이츠&매직&gt;(만화판)
카토 타쿠지의 기발한 아이디어를 가득 모은 단편집!

그것은, 카토 타쿠지(@isiyumi)의
SNS 대화제(?!) 장난감 상자를 뒤집은 것.
X(구 트위터)에서 대화제-&gt;연재화된 인기 작품
&lt;메카니컬 버디 유니버스 1.0&gt;을 탄생시킨 카토 타쿠지가
모으고 모은 작품집','https://www.lezhin.com/ko/comic/backyard_junk_universe','https://ccdn.lezhin.com/v2/comics/7011750037237084/images/tall.webp?updated=1750669597880&width=420','완결'),
('츠바키 이야기','이시노 아야·AK 커뮤니케이션즈·인디고',array['로맨스']::text[],'여자보다 예쁜 남자 츠바키 군의 따끈따끈 두근두근한 일상!!
행복♥바이러스에 즐겁게 감염되세요♪

‘찻줄기가 섰네. 뭔가 좋은 일이 있을 건가 봐.’
도시에서 혼자 생활 중인 초식남 츠바키 타로와, 그 학창시절 친구인 돌싱남 히라이와는 우연한 기회에 재회하고, 그로부터 일상에 자그마한 변화를 맞게 된다.
히라이와와 그의 딸 후미오. 이 부녀 가정에 츠바키가','https://www.lezhin.com/ko/comic/tsubaki_story','https://ccdn.lezhin.com/v2/comics/5575819132993536/images/tall.webp?updated=1575952554441&width=420','완결'),
('전하는 말','마치다 토시코·시프트코믹스',array['스릴러']::text[],'청춘은 아찔하도록 잔혹하다. 한 소년의 ‘죽음’을 계기로 ‘보이지 않던 마음’이 움직이기 시작한다―. 
드라마틱한 청춘 미스터리!! 
어느 날 남고생 사하라는 교통사고를 당해 사망한다. 그런데 그 죽음은 우연한 사고가 아니었다!! 
그 사건을 계기로 급우들의 진심, 그리고 새로운 사실이 보이기 시작하는데―!!','https://www.lezhin.com/ko/comic/pass_remark','https://ccdn.lezhin.com/v2/comics/6528267318263808/images/tall.webp?updated=1573456349164&width=420','완결'),
('연애를 만화로 배웠어요','과일나무·레이노아·위즈덤하우스',array['로맨스']::text[],'CC커플 현도와 세은,
그리고 강미와 황은!

그들의 일상 연애 이야기.
초보 연애 생활의 지침서!
연애를 만화로 배워보자!','https://www.lezhin.com/ko/comic/learn_by_cartoon','https://ccdn.lezhin.com/v2/comics/5703235746988032/images/tall.webp?updated=1615777264826&width=420','완결'),
('행운의 서','시희진·제이지비퍼블릭',array['판타지']::text[],'행운이라는 힘을 가진 글자를 모으면 신이 될 수 있다. 눈에 보이지 않는 행운을 찾아 신이 되기 위한 여행을 떠나는 이야기.','https://www.lezhin.com/ko/comic/book_of_fortune','https://ccdn.lezhin.com/v2/comics/4993879406608384/images/tall.webp?updated=1621838417454&width=420','완결'),
('좋아해요, 태자 오라버니!','손선귤,백몽사·아아두,백몽사·대원씨아이',array['로맨스']::text[],'안녕! 내 이름은 심요.
경성의 모든 사람들이 날 부러워해.
난 예쁘고 깜찍하고 발랄하고
황궁 사람들도 날 좋아해.
그리고 또... 또...
부끄럽지만 지덕체가 완벽한 소정 오라버니랑 결혼할 거거든!

그런데 태자비가 된다고 모든 게 좋지만은 않더라고...
휴... 이런 내 이야기 한번 들어볼래?','https://www.lezhin.com/ko/comic/i_like_you_prince','https://ccdn.lezhin.com/v2/comics/4893675554144256/images/tall.webp?updated=1715062767569&width=420','완결'),
('내 귀여운 인형님','카시와야 콧코·넥스큐브·미즈',array['로맨스']::text[],'안 팔리는 예술가 아오키가 자료조사로 방문한 폐허에는 아가씨 유령이 있었다. 그녀의 요구는 단 한 가지, ''성불시켜주세요''. 그걸 위해 필요한 것은 ''인형 만들기''. 미소녀 유령을 모델로 삼아 해본 적도 없는 인형 만들기를 하는 동안 점점 포로가 되는 아오키. 빙의된 미소녀 유령과의 생활은 마음을 훈훈하게 하고 몸을 쇠약해지게 하는데.','https://www.lezhin.com/ko/comic/my_cute_doll','https://ccdn.lezhin.com/v2/comics/5831269531385856/images/tall.webp?updated=1581655058799&width=420','완결'),
('풀어 줘요, 유이 씨.','미나미토·데이즈엔터·코믹 레인',array['로맨스']::text[],'악덕 구인 잡지 제작 회사에서 나날이 심신을 좀먹히고 있는 입사 반년 차 카린.
어느 날 직속 선배이자 건강 덕후인 유이 씨에게 몸을 풀어 주는 마사지를 받게 되고….
그 대신 유이 씨의 냉체질을 개선하기 위한 포옹을 부탁받는데…?!','https://www.lezhin.com/ko/comic/relax_yuisang','https://ccdn.lezhin.com/v2/comics/7011762396403505/images/tall.webp?updated=1763013749936&width=420','연재'),
('짓궂은 그이','유나·에무 카에루·아이온스타',array['로맨스']::text[],'미유키는 전교에서 가장 인기가 많은 류지 군에게 고백을 받는다.
좋아하는 사람과의 달콤한 나날을 기대하고 있었던 것도 잠시…
류지는 생각했던 이미지와 달리 짓궂은 남자친구였다!!

친구인 미도리에게도 이 사실은 비밀☆
소꿉친구인 쿄헤이, 그리고 라이벌인 시즈쿠도 등장하면서 이 사랑은 갈수록 태산인데?!','https://www.lezhin.com/ko/comic/my_mean_boyfriend','https://ccdn.lezhin.com/v2/comics/6371102748311552/images/tall.webp?updated=1520408879677&width=420','완결'),
('오렌지 블로섬','오마토·김윤지·학산문화사',array['로맨스']::text[],'천재 유전자를 두고 벌어지는 사랑과 전쟁!

어느 날 갑자기 규진 앞에 찾아와 결혼을 하자고 말하는 여대생 정가인. 하지만 규진은 예의바르고, 착하고, 학벌까지 우수한. 부족한 거 하나 없는 그녀에게 영문도 모른 채 대시 받는 상황이 부담스럽기만 하다. 여느 때와 같이 가인의 프러포즈를 거절한 채 집으로 돌아가던 규진은 갑작스런 괴한의 공격을 받지만, 항상','https://www.lezhin.com/ko/comic/orange_blossom','https://ccdn.lezhin.com/v2/comics/5171756861554688/images/tall.webp?updated=1641287034433&width=420','완결'),
('AI남친과 연애실습','아마에비 리코·락킨코리아',array['로맨스']::text[],'천재 박사 스미코가 의뢰를 받고 개발한 ''AI남친'' 개발에 성공한 기쁨도 잠시,
AI남친이 스미코를 ''애인''으로 인식해버렸다─?! 처음엔 그런 AI남친을 거부하던 스미코. 그러나 그의 변함없는 애정에 AI라고 인식하면서도 조금씩 마음을 열게 되는데─','https://www.lezhin.com/ko/comic/ai_kareshi','https://ccdn.lezhin.com/v2/comics/5434090799824896/images/tall.webp?updated=1683183829506&width=420','완결'),
('우리 아들이 이세계 전생을 한 것 같아','카네모토·AK커뮤니케이션즈·AK코믹스',array['드라마']::text[],'죽은 아들이 사실은 이세계에 전생을 했다고
주장하는 엄마와 그녀의 전 동급생(오타쿠)이 그려내는
슬픔을 향해 맞서는 사람들의 이야기.
누군가가 죽었을 때, 남겨진 사람들은
어떻게 슬픔을 극복하고 앞으로 나아가는가.
삶과 죽음을 다시 생각하게 만드는 화제의 만화,
드디어 한국 상륙!!','https://www.lezhin.com/ko/comic/isekai_son','https://ccdn.lezhin.com/v2/comics/6236134968197120/images/tall.webp?updated=1675303053206&width=420','완결'),
('너에게 격렬한 키스를','무라사키·지티이엔티',array['로맨스']::text[],'33년을 살면서 그처럼 자유롭고 반짝반짝 빛나는 사람을 본 건 처음이었다. 나는 세간 사람들의 평가 속에, 인생의 길을 선택할 때든, 친구나 애인과 함께 있을 때든. ''솔직하다'', ''모범생답다''… 그리고 어른이 된 나는 ''솔직한 모범생''에서 ''재미 없는 여자''가 되었다. , 언젠간 아버지가 소개한 남자와 결혼해 자식을 낳아 평범한 가정을 꾸리고, 생을 마칠','https://www.lezhin.com/ko/comic/soul_kiss_time','https://ccdn.lezhin.com/v2/comics/4525810214764544/images/tall.webp?updated=1787101821778&width=420','완결'),
('그대를 훔치는 법','백귀수행·로크미디어·연후',array['로맨스']::text[],'귀여운 부잣집 도련님은 비참하게 얻어 맞아서 다리가 부러지고 깊은 산골에 버려졌는데, 그를 구한게 이런 강도라니?!','https://www.lezhin.com/ko/comic/steal_you','https://ccdn.lezhin.com/v2/comics/7011747878933380/images/tall.webp?updated=1752036111525&width=420','연재'),
('언니와 거인 ~아가씨가 이세계 전생~','Be-con·시프트코믹스',array['판타지']::text[],'"이세계 전생자 히나코는
거인 에이리스와 자매의 연을 맺고
『가장 작은 거인』이라 불리고 있었다.
같이 전생했을 터인 히나코의 『언니』와
에이리스의 형제를 찾기 위해
두 사람의 이세계 여행이 시작된다.
그런 와중, 어떠한 의뢰를 정산하던 중에
교회 기사라 불리는 남자의 주목을 받아 버리고 마는데――.

「능력(치트)… 아아, 그것 말씀이라면 정중하게 거절했','https://www.lezhin.com/ko/comic/oneto_kyojin','https://ccdn.lezhin.com/v2/comics/5974861525352448/images/tall.webp?updated=1681872748220&width=420','연재'),
('사랑 이야기를 들려주세요','시마카게 루이아·지티이엔티',array['로맨스']::text[],'연애 소설 매니아인 나카사토 쇼코는 도시에 있는 대학을 다니기 위해 셰어 하우스에 살기로 했다. 
그리고 새로 살 곳에 가기 전에 영화관에 들른 그녀는 우연히, 쿠로카와 미츠루라는 청년과 만난다. 
같은 취미를 가진 그에게 친근감을 느끼는 쇼코였지만, 그는 쇼코의 의견을 모두 부정하는데! 
게다가 셰어하우스에 가보니 그곳에 쿠로카와가 있었고... 

신경쓰','https://www.lezhin.com/ko/comic/tell_me_a_love_story','https://ccdn.lezhin.com/v2/comics/6623403452203008/images/tall.webp?updated=1608107190341&width=420','완결'),
('The RUAH (루아)','이시현·락킨코리아',array['로맨스']::text[],'영적 능력을 지닌 넬은 우연히 FBI 실종수사대 듀크 레이너를 도와 여아 실종사건을 해결하게 된다. 
마몬을 추종하는 세력으로부터 넬의 부모가 살해당하고 넬은 듀크가 구해준다. 넬은 의식을 차렸으나 이상행동을 하게 되고...
새뮤얼은 어린 동생과 살다 지옥에서 나온 마몬을 만나게 되고 어린 동생이 마몬을 추종하는 세력으로부터 죽임을 당하고 동생의 영혼이 넬','https://www.lezhin.com/ko/comic/the_ruah','https://ccdn.lezhin.com/v2/comics/5761839430631424/images/tall.webp?updated=1464592806100&width=420','연재'),
('서른 즈음이지만, 첫사랑입니다.','사토·대원씨아이',array['로맨스']::text[],'“전 이노우에 씨가 첫 남친…이에요.”
이제 막 사귀기 시작한 여친 야마모토(28세)에게 그런 고백을 들은 이노우에(32세).
“나도 연애 경험은 많지 않으니까 같이 노력해 봐요.”
환한 미소로 그렇게 대답한 이노우에였지만, 내심은…
‘나도 연애는 한 번도 안 해 봤는데…. 하지만 이상하게 생각할까 봐 말 못 해!!’
서른 즈음이지만 세상 풋풋한 청순남녀의','https://www.lezhin.com/ko/comic/thirty_first_love','https://ccdn.lezhin.com/v2/comics/5740724722401280/images/tall.webp?updated=1710983162453&width=420','완결'),
('전생 흡혈귀 씨는 낮잠을 자고 싶어','사쿠라·초킨교·소미미디어·S코믹스',array['판타지']::text[],'이세계에서 전설의 흡혈귀로 전생! 너무나도 무기력한 소년이 이세계에서 전생한 것은 흡혈귀 미소녀였다. 검도 마법도 있는 이세계에서 치트 능력을 잔뜩 가지고 전생한 그녀가 바라는 것, 그것은!','https://www.lezhin.com/ko/comic/vampire_san','https://ccdn.lezhin.com/v2/comics/6653908265795584/images/tall.webp?updated=1675233587984&width=420','연재'),
('제 약혼자는 어둡고 음침하다고 일컬어지는 흑마술사입니다. 좋아해.','츠즈키·데이즈엔터·루체코믹스',array['로맨스']::text[],'백작 영애 류디아는 아버지가 왕녀를 폭행했다는 누명을 쓰면서
일가 몰락의 위기에 직면해 있었다.
하지만 어느 날 갑자기 아버지의 무고가 증명됐다는 연락을 받는다.
흑마술사인 레제스라는 남자가 공적을 올린 포상으로
백작 가문의 오명을 씻어달라고 요구했다는 것이다.

레제스는 어둡고 음침하다고 일컬어지는 흑마술사지만
자상하고 성실한 일면과 수줍음이 많고 자꾸 ','https://www.lezhin.com/ko/comic/fiance_blackmagician','https://ccdn.lezhin.com/v2/comics/7011737011377886/images/tall.webp?updated=1740373054788&width=420','연재'),
('매리는 외박중','원수연·락킨코리아',array['로맨스']::text[],'사랑과 조건…. 행복한 결혼이란 무엇일까??
평범한 일상의 숙녀 위매리, 고집쟁이 철벽녀 위매리….
그녀가 매력남 강무결과 완소남 변정인, 멋진 두 남자와 특이한 결혼생활을 시작했다! 어느 쪽도 놓치기 아까운 완벽한 두 개의 사랑! 과연 매리는 누구를 선택할 것인가…?','https://www.lezhin.com/ko/comic/marry_staying_out','https://ccdn.lezhin.com/v2/comics/5595799179558912/images/tall.webp?updated=1698283034337&width=420','완결'),
('표범왕 이야기','방소영·락킨코리아',array['판타지']::text[],'깊은 사원에서 아무도 몰래 키워진 왕녀가 장로들에 의해 왕좌에 올라 새로운 여왕이 되었지만
강한 왕이 필요할 때라고 생각하는 태양 부족의 부족장 마라는 이 어리고 아무것도 모르는 여왕이 마음에 들지 않는다.

허울뿐인 여왕으로 만들고 자신이 실질적 왕이 되길 원하는 마라.
그러나 여왕은 쉽게 물러서지 않는데…','https://www.lezhin.com/ko/comic/leopard_king','https://ccdn.lezhin.com/v2/comics/5708382949605376/images/tall.webp?updated=1501577804356&width=420','완결'),
('문호 스트레이독스 BEAST','호시카와 시와스·아사기리 카프카·영상출판미디어·노엔코믹스',array['판타지']::text[],'이것은, 있었을지 모를 「만약」의 이야기--. 

납치당한 여동생을 찾기 위해 아쿠타가와 류노스케는 검은 옷의 남자 에게 복수를 맹세했다. 
하지만 길바닥에서 쓰러져 아사 직전이던 그의 앞에 자신을 무장 탐정사 의 사원이라 칭하는 남자, 오다 사쿠노스케가 나타나는데…….','https://www.lezhin.com/ko/comic/bungostraydogs_beast','https://ccdn.lezhin.com/v2/comics/6683924602486784/images/tall.webp?updated=1710749432612&width=420','완결'),
('사축 씨는 꼬마 유령에게 치유 받고 싶어','아리타 이마리·소미미디어·S코믹스',array['드라마']::text[],'사축 후시하라 씨가 새벽까지 일을 하고 있으면 걱정이 되어 집으로 돌려 보내려는 유령짱. ''물러가라~'' 하면서 도와주고, 간식거리를 주고, 너무나 고운 마음씨에 거칠어진 마음은 한껏 치유된다. 귀여운 유령과 사축 후시하라 씨의 따뜻한 일상에 치유되어 보는 것은 어떨까?','https://www.lezhin.com/ko/comic/chibi_yuurei','https://ccdn.lezhin.com/v2/comics/5546709426700288/images/tall.webp?updated=1672828296176&width=420','연재'),
('가능하면 알몸으로 살고 싶어','아이카와 모모코·프라이데이·조이툰',array['드라마']::text[],'대기업 출판사에서 화려한 ‘셀럽 패션’ 편집자로서 활약하고 있던 마리에. 
그런데 어느 날,  취재처에서 돌아오자마자 다른 부서로의 이동을 통보받고 만다.
패션잡지를 만들 수 있다면 어디라도 좋아!
SNS의 구인에 의지해 온 곳은, 녹음이 풍성한 시골의 오래된 민가 카페?!
무려 그곳은 패션지는 이름뿐인 마을 부응을 위한 ‘무료 책자 편집부’였다.
꽃미남 ','https://www.lezhin.com/ko/comic/want_to_live_naked','https://ccdn.lezhin.com/v2/comics/5916986206126080/images/tall.webp?updated=1671755381145&width=420','완결'),
('하나조노 씨네 쌍둥이','키타지마 네나·학산문화사',array['로맨스']::text[],'운동도, 공부도 전부 평균인 고등학교 1학년·타니 타타라.
타타라가 다니는 학교에는 소꿉친구인 쌍둥이 자매가 있다.
언니 란코는 화려한 날라리, 동생 유리코는 대인기 아이돌.
교내 서열은 차이 나지만, 타타라는 지금도 유리코를 짝사랑하는 중.
그러던 어느 날, 갑자기 유리코가 데이트 신청을!
이 데이트를 계기로 타타라는 쌍둥이들과 비밀스러운 관계를 맺게 되','https://www.lezhin.com/ko/comic/hanazono_twins','https://ccdn.lezhin.com/v2/comics/4655891307757568/images/tall.webp?updated=1764231411820&width=420','완결'),
('이세계 마법은 뒤떨어졌다! (코믹스)','COMTA·히츠지 가메이·소미미디어·S코믹스',array['판타지']::text[],'‘―마술사, 야카기 스이메이.
모든 이치에 도달하기 위해서
신비를 뜻에 둔 현대의 신비학자다.’

현대를 살아가는 마술사 야카기 스이메이는
갑자기 나타난 마법진에 의해 친구들과 함께 이세계로 전이되어 버린다. 
하지만 용사로 소환된 건 친구 하나로, 어쩌다 거기에 휘말렸을 뿐?!
스이메이는 마왕 토벌 여행에 동행할 것을 거절하고는 온갖 현대 마술을 동원해
','https://www.lezhin.com/ko/comic/magic_behind','https://ccdn.lezhin.com/v2/comics/6740724688420864/images/tall.webp?updated=1624511487310&width=420','연재'),
('우주 최강 대스타','젤리피쉬·도힌이·지티이엔티',array['로맨스']::text[],'평범 오브 평범, 현실 흔녀 ‘수지’!
하!지!만 스타그램에서는 팔로워 10만 명을 거느리는 인기 스타! 
거짓 세컨드 계정으로 비밀스러운 이중생활을 보내고 있던 어느 날....
대한민국 최고의 아이돌 그룹 ‘루시퍼’로부터 다이렉트 메시지가 도착한다!
“우리 만날래?”
반전(?) 셀기꾼 수지와 아이돌 ‘루시퍼’가 SNS로 엮이면서 벌어지는
속고 속이는 위험','https://www.lezhin.com/ko/comic/greatest_star','https://ccdn.lezhin.com/v2/comics/5398869388886016/images/tall.webp?updated=1695727412974&width=420','완결'),
('세계 최속의 레벨업','스즈미 아츠시·야마타 나가토·fame·시프트코믹스',array['판타지']::text[],'전 세계에 던전이 출현한 지 수십 년. 인류는 레벨과 스테이터스 그리고 스킬이라는 초현실적인 힘을 손에 넣었다. 일확천금을 꿈꾸며 던전 공략에 도전하는 모험가인 아마네 린은 「던전 내 전이」라는 희소한 유니크 스킬을 지녔지만 사용방법이 너무 까다로워서 무능하다며 멸시받아왔다. 린이 던전 공략을 시작한 지 딱 1년―. 레벨업을 계기로 「던전 내 전이」가 진화','https://www.lezhin.com/ko/comic/fastest_level_up','https://ccdn.lezhin.com/v2/comics/6372121694240768/images/tall.webp?updated=1671002707359&width=420','연재'),
('처녀귀신과 동거중입니다.','아네코·락킨코리아',array['로맨스']::text[],'처녀 귀신이 나온다는 문제의 집에 이사하게 된 레이칸 유우키. 거기에 들러붙어 있던 귀신은 겁을 줘서 쫓아내려고 그의 앞에 나타나지만 귀신을 본 그는 무서워하기는커녕 오히려 엄청나게 기뻐하면서 귀신을 만나고 싶어 이 집으로 이사 왔다는 얘기를 꺼내기 시작한다. 처음으로 쫓아내는 걸 실패한 것도 모자라이상적인 귀신(사람)을 찾았다고 말하는 그에게 당혹감을 감','https://www.lezhin.com/ko/comic/living_with_ghostgirl','https://ccdn.lezhin.com/v2/comics/5624110018002944/images/tall.webp?updated=1682591603687&width=420','완결'),
('소녀와 삽과 마안왕','카야타마루·쵸쵸핫시·학산문화사',array['판타지']::text[],'이것은, 소년이 이세계의 어린 소녀와 함께 형언할 수 없는 부조리에 저항하는 이야기

버스 사고를 당해, 대량 출혈로 의식이 희미해지는 스미하라 츠구토.
죽어가는 상황에서 한 승객은 그 모습을 영상으로 찍고만 있다.
증오와 분노에 휩싸인 츠구토가 정신을 차린 곳은 본 적 없는 동굴 안.
저 멀리 치솟은 산의 형태는 신화에 나오는 「바벨탑」을 방불케 하여,
','https://www.lezhin.com/ko/comic/girl_shovel_evileyeking','https://ccdn.lezhin.com/v2/comics/4878140832022528/images/tall.webp?updated=1764234673874&width=420','연재'),
('한자와 나오키','츠하 케이이치·후지모토 시게키·이케이도 준·대원씨아이',array['드라마']::text[],'“당한 만큼 갚아준다! 100배로 돌려주지!”
드라마 일본 시청률 1위 ≪한자와 나오키≫ 대망의 코미컬라이징!

버블 붕괴 후, 산업중앙은행과 도쿄제일은행이 합병.
그 결과 세계 제3위의 메가 뱅크 ‘도쿄중앙은행’이 탄생하게 된다.
간사이 지역 4대 지점 중 하나인 오사카 서부 지점.
그 오사카 서부 지점 융자과장으로 한자와 나오키가 부임한 지 2년,
지금','https://www.lezhin.com/ko/comic/hanzawa_naoki','https://ccdn.lezhin.com/v2/comics/5899344423485440/images/tall.webp?updated=1641537459579&width=420','완결'),
('악역 영애 후궁 이야기','세이쥬 나츠메구·료후·아이온스타',array['로맨스']::text[],'활발함이 장점인 여고생 아마미야 마츠리.
어느 날 마츠리가 너무나도 좋아하는 인기 절정의 세쌍둥이 아이돌 "테르체토"가 그녀의 오빠가 되었다!
갑자기 생긴 오빠들 때문에 두근거림이 멈추지 않는 마츠리.
그런 마츠리에게 테르체토에서 시크를 맡고 있는 아즈사가 매일 열렬한 러브콜을 보내오는데…!
과연 마츠리의 운명은…?!

탑 아이돌이 의붓오빠?! 완벽한 왕자','https://www.lezhin.com/ko/comic/akuyakureijou_hanashi','https://ccdn.lezhin.com/v2/comics/6594872902221824/images/tall.webp?updated=1687255602930&width=420','연재'),
('그래도 야구','모토미야 히로시·에가와 수구루·지티이엔티',array['드라마']::text[],'프로 야구 앤젤레스. 기대의 루키, 시즈나이 마사루는 개막전을 맡게된다. 그러나 그 결과는... 모토미야 히로시와 에가와 타카시가 이룬 감동의 야구 이야기.','https://www.lezhin.com/ko/comic/anyway_baseball','https://ccdn.lezhin.com/v2/comics/5923010324463616/images/tall.webp?updated=1514882021419&width=420','완결'),
('사랑의 여신이 끊이지않아','아키바 지로·미디어팜',array['로맨스']::text[],'자유로운 교풍으로 이름을 널리 알리고 있는 세이료 고등학교
남자 기숙사에 관리인으로서 하타노 하루카와
그의 아들이자 신입생인 카즈호가 들어온다.
예쁜 사람에게 반감을 갖게 된 기숙사장 나카야마 소우타와
극히 평범한 인생을 걷길 원하는 부기숙사장 닛타 케이치로,
그 둘은 망설이면서도 하타노 부자에게 점점 끌리게 되고…
세이료 고교 남자 기숙사에선
오늘도 사랑','https://www.lezhin.com/ko/comic/seiryo_high_school','https://ccdn.lezhin.com/v2/comics/6100598481223680/images/tall.webp?updated=1472620847210&width=420','완결'),
('LV2부터 치트였던 전직 용사후보의 유유자적 이세계 라이프 (코믹스)','이토마치 아키네·키노조 미야·소미미디어·S코믹스',array['판타지']::text[],'명예로운 용사 후보로서 이세계로 소환된 청년 버나저는, 능력치가 낮았기에 용사 실격의 낙인이 찍히고 국외 추방 처분을 당한다. 어떻게든 살아남으려고 몬스터를 쓰러뜨리자 레벨이 2로 오르고 그의 스테이터스가 익숙지 않은 ‘∞’ 기호로 바뀌어 있었는데…','https://www.lezhin.com/ko/comic/cheat_from_lv2','https://ccdn.lezhin.com/v2/comics/5448928819740672/images/tall.webp?updated=1652636976200&width=420','연재'),
('버드 스트라이크','레야·구병모·NHN',array['로맨스']::text[],'황제의 혼외딸로 태어나 황궁 별관에서 숨겨진 채 살아가는 루.
사교성 넘치는 성격과 비상한 머리를 숨기며 탈출만을 꿈꾸는 갑갑한 나날이 이어지던 어느 날, 
황궁에서 고문 당하는 날개 달린 남자, 비오를 도와주고 그와 함께 익인 세계로 넘어가게 된다.

답답한 생활에서 벗어나 드디어 ‘본격 해피 독립 라이프 시작!’ 인 줄 알았는데 인생 첫 로맨스가 끼어들','https://www.lezhin.com/ko/comic/bird_strike','https://ccdn.lezhin.com/v2/comics/7011776059591103/images/tall.webp?updated=1777459067340&width=420','완결'),
('나「」만「」의「」비「」밀「 (나만의 비밀)','스미노 요루·니에키 즈이·소미미디어·s코믹스',array['드라마']::text[],'스미노 요루 원작의 남녀 청춘 군상극 소설 &lt;나「」만「」의「」비「」밀「&gt; 
원작자도 극찬한 만화판 발매!! 
반 친구들 사이에서 자신과는 대조적인 미키에게 마음을 품고 있는 소년, 쿄는 조금 특별한 힘을 가지고 있다. 그건 남의 감정이 마크로 머리 위에 보인다는 것인데…….','https://www.lezhin.com/ko/comic/my_own_secret','https://ccdn.lezhin.com/v2/comics/7011731032937846/images/tall.webp?updated=1731314611961&width=420','연재'),
('행운소년소녀','S위밍·재담미디어',array['로맨스']::text[],'내가 사랑하는 사람이 불행해져야 내가 행복해질 수 있다면...? 
쌍둥이, 비량과 비별의 수장이 되기 위한 행운 매치.','https://www.lezhin.com/ko/comic/lucky_boy_girl','https://ccdn.lezhin.com/v2/comics/6461852844490752/images/tall.webp?updated=1711873134739&width=420','완결'),
('버림 받은 하프 엘프지만, 토끼 수인에게 구원받았습니다','무기·지티이엔티',array['로맨스']::text[],'둥근귀 하프 엘프인 피오나는 부모님을 잃고 순혈 엘프족 친척에게 맡겨지지만, 
인간과의 혼혈이라는 이유로 차별을 받으며 자라왔다. 
사촌 동생 아네트의 약혼 파티날, 사고로 아네트를 다치게 한 탓에 사람들 앞에 처형당할 뻔한 피오나. 
위기에 닥친 피오나의 숨겨진 마력이 폭주한 순간, 
고귀한 신분의 토끼 수인인 라그러스가 나타나 피오나를 구하는데.
©Mu','https://www.lezhin.com/ko/comic/abandoned_halfelf','https://ccdn.lezhin.com/v2/comics/6140007120961536/images/tall.webp?updated=1698993328474&width=420','완결'),
('헤이안 미니 사랑두루마리','우사키 히토미·아이온스타',array['로맨스']::text[],'때는 헤이안 시대.
기울어 가는 지방 영주의 딸 스즈는 만난 적도 없는 귀족과 정략결혼을 하게 된다.
긴장감을 안고 시집을 온 스즈를 맞이한 건 츄나곤인 요리나리.
그의 신장은 무려 손바닥 사이즈?!

조그만 몸에 넘치는 사랑☆ 미니 도련님x 순정녀의 큐트 러브 코미디♪','https://www.lezhin.com/ko/comic/mini_husband','https://ccdn.lezhin.com/v2/comics/6329636952473600/images/tall.webp?updated=1504079003640&width=420','완결'),
('뽀글 사랑! ~밋밋남의 삼각관계~','스즈키 아유나·아이온스타',array['로맨스']::text[],'천연 파마머리가 콤플렉스인 평범한 소년 츠치야 켄. 애칭은 「뽀글이」.
학교의 아이돌이자 여장이 잘 어울리는 루이스 토모야와 친한 사이지만,
최근 루이스가 여자로 보이기 시작하면서 설레게 되었다.
하지만 그런 두 사람 앞에 똑똑하고 잘생긴 외모의 왕자님, 미카미 사토루가 나타났다.
두 사람이 함께 있는 걸 방해하는 미카미를 보며 ''이 녀석도 루이스를 좋아하','https://www.lezhin.com/ko/comic/mitmit','https://ccdn.lezhin.com/v2/comics/5186894913732608/images/tall.webp?updated=1652862284455&width=420','연재'),
('여름과 레몬과 오버레이','미야하라 미야코·Ru·대원씨아이',array['로맨스']::text[],'본업으로 하는 일도 없고, 영상 업로드 등으로 생기는 약간의 수입, 아르바이트로 생계를 이어가는 성우 ‘유니마루’는 대기업 회사원인 콘노 사야카로부터 ‘내 장례식 유서를 소리 내 읽어달라’라는 뜻하지 않은 의뢰를 받는다. 의아해하면서도 제시한 의뢰비에 눈이 멀어, 의뢰를 받아들이게 된 유니마루. 그러나 정작 사야카는 유서 내용을 정하기 위한 회의라면서 놀기','https://www.lezhin.com/ko/comic/summer_lemon_overlay','https://ccdn.lezhin.com/v2/comics/5676206536196096/images/tall.webp?updated=1705906817539&width=420','완결'),
('여자의 집','토리카이 아카네·시프트코믹스',array['드라마']::text[],'동거하던 연인에게 차인 스물아홉 살의 오오마에 아리카. 
25살인 동생, 스미카와 어머니가 있는 지방인 오사카로 돌아갔지만 
힐링은커녕 타박을 듣고, 마침내 ‘어머니의 명령’으로 도쿄에서 동생과 함께 살게 된다. 
“새로운 생활을 시작하겠어!”라고 마음먹은 자매와 어머니, 
‘여자만으로’이루어진 가족의 이야기, 지금 시작합니다!','https://www.lezhin.com/ko/comic/womans_house','https://ccdn.lezhin.com/v2/comics/4824034957656064/images/tall.webp?updated=1604036515800&width=420','완결'),
('고마워! 코로','후지준·지티플래닝',array['로맨스']::text[],'다리 부상 때문에 농구에서도, 사랑에서도 도망 치듯 고모네 집으로 온 시호. 옆집에는 다리를 다친 겁쟁이 개, 코로가 있었다. 시호는 코로와 닮은 점을 느끼고... 순진한 코로와 지냄으로써 현실을 외면하던 시호였지만 작은 자신감과 희망을 느끼기 시작한다.','https://www.lezhin.com/ko/comic/thanks_koro','https://ccdn.lezhin.com/v2/comics/6228920269799424/images/tall.webp?updated=1492417514411&width=420','완결'),
('묘귀','BIGMO·BID·비그모',array['스릴러']::text[],'[휴재 중] 나는 지금 가장 나은 길을 알려주는 게 아니야…
유일한 길을 알려주는 게지...

산 속 암자에 기거하는 무당 황선영은 그렇게 말했다.
약혼자를 구해내려면 많은 요괴를 봉인하여,
고독의 주술을 풀어야 한다고…

내가 해낼 수 있을까?','https://www.lezhin.com/ko/comic/monster_sorcery','https://ccdn.lezhin.com/v2/comics/7011740705830210/images/tall.webp?updated=1777446918500&width=420','연재'),
('작은 꽃, 사랑을 잇다 [개정판]','타니 아니타·솔트',array['로맨스']::text[],'밝은 성격의 인기인 미노리는 어느 날 특진반의 타츠야에게
인기 캐릭터의 장난감을 받는다.
편의점 점원으로 일하는 그는, 미노리가 동생 와카나를 위해
과자에 들어 있는 장난감을 찾고 있는 모습을 계속 보고 있었다고 한다.
동생에게 직접 전달해 달라면서 방과 후에 타츠야를 끌고 나온 이후로 친구가 된 두 사람.

쿨하고 말수는 적지만,
낯을 가리는 동생이 잘 ','https://www.lezhin.com/ko/comic/chiisana_hana_koi_tsunagu','https://ccdn.lezhin.com/v2/comics/5544760534958080/images/tall.webp?updated=1669808754565&width=420','완결'),
('구두 수선인','오네 타다시·오오토리 아키라·아이온스타',array['드라마']::text[],'구두를 "스캔"하는 것으로 그 구도의 문제점을 간파하는 것이 가능한 대단한 실력의 구두 수선인 나오키 쇼스케.
그가 운영하는 수선점 「호진칸」에 가지고 오는 구두에는 그 구두 주인의 인생이 드러나는데….','https://www.lezhin.com/ko/comic/a_cobbler','https://ccdn.lezhin.com/v2/comics/5292033336147968/images/tall.webp?updated=1470812357683&width=420','연재'),
('사이비 종교 믿었습니다','타모상·디엔데 마나부·마나부',array['드라마']::text[],'어렸을 때 어머니가 여호와의 증인으로 입신. 4남매 중 거절할 수 없을 것 같다는 이유로 함께 집회에 끌려가게 된 타모씨.
여호와의 증인의 활동을 실시하기 위해서, 동아리 활동을 제외하고, 복장이나 연애, 진학마저도 자신이 원하는 대로 되지 않는 나날이었지만, 언젠가 방문한다고 여겨지는 낙원을 위해서 견뎌 왔습니다.
그러나 결혼해서 겨우 태어난 외아들은 여','https://www.lezhin.com/ko/comic/believed_in_a_cult','https://ccdn.lezhin.com/v2/comics/7011781058821995/images/tall.webp?updated=1781067711912&width=420','완결')
), ins as (
  insert into public.works (title_ko, author, genres, blurb_ko, cover_url, status, is_curated, sort)
  select i.title, i.author, i.genres, nullif(i.blurb,''), nullif(i.cover,''), i.st, false,
         14200 + row_number() over (order by i.title)
    from imp i
   where not exists (select 1 from public.works w where w.title_ko = i.title)
  returning id, title_ko
)
insert into public.work_legal_links (work_id, platform_key, url, sort)
select ins.id, 'lezhin', imp.url, 0
  from imp join ins on ins.title_ko = imp.title;

-- 확인용
select status, count(*) from public.works group by status order by status;
