-- ------------------------------------------------------------
-- 14) 페어툰 인기 순위 — 테이블 신설 + 랭킹작 43편 편입 + 오늘자 랭킹 90건
--     작성 2026-08-12 · 근거: docs/인기순위_기획.md
--
--     홈 "지금 인기"는 페어툰이 정한 순위다. 산정 규칙은 5칸 주기 정원 배분:
--       1~3위 네이버웹툰 / 4위 카카오웹툰 / 5위 카카오페이지 (이후 주기 반복)
--     각 플랫폼 안에서의 순서는 그 플랫폼 공식 랭킹을 그대로 따른다.
--     성인물은 3사 등급·플래그로 전량 제외했다.
--
--     ※ 카카오웹툰과 카카오페이지는 같은 작품을 함께 서비스하는 경우가 있다(오늘 12편).
--       작품 행은 하나만 만들고, 랭킹 행은 두 플랫폼 각각 만들어 같은 작품을 가리킨다.
--       화면에서는 중복 노출을 프론트가 걸러낸다(popularList의 used 검사).
--     ※ 단일 문장 CTE. Supabase SQL Editor에서 임시테이블은 쓰지 않는다.
-- ------------------------------------------------------------


-- 1) 랭킹 테이블
create table if not exists public.work_rankings (
  platform_key text   not null,
  rank         int    not null,
  work_id      bigint not null references public.works(id) on delete cascade,
  fetched_on   date   not null default current_date,
  primary key (platform_key, rank)
);
alter table public.work_rankings enable row level security;
grant select on public.work_rankings to anon, authenticated;
do $$ begin
  create policy rankings_read on public.work_rankings for select using (true);
exception when duplicate_object then null; end $$;
do $$ begin
  create policy rankings_admin_write on public.work_rankings for all
    using (public.is_admin()) with check (public.is_admin());
exception when duplicate_object then null; end $$;


-- 2) 랭킹에 올랐으나 카탈로그에 없던 작품 편입 (sort 3000번대)
with imp(title, author, genres, blurb, pk, url, cover) as (values
('악마의 주인님이 되어버렸다','에리카·초뽀·나라',array['드라마']::text[],'피폐소설 속 남주를 흑화하게 만든 악녀로 빙의했다. 이미 N번의 빙의를 말아먹었던 나는 결심했다. 지하실에 갇힌 남주를 구하고 탈출하겠다고.  “내가 지켜줄게."  드디어 남주의 정체가 밝혀지고 해','kakaowebtoon','https://webtoon.kakao.com/content/%EC%95%85%EB%A7%88%EC%9D%98-%EC%A3%BC%EC%9D%B8%EB%8B%98%EC%9D%B4-%EB%90%98%EC%96%B4%EB%B2%84%EB%A0%B8%EB%8B%A4/3902','https://kr-a.kakaopagecdn.com/P/C/3902/sharing/2x/da405067-4339-442c-99aa-36ee3a358f59.jpg'),
('검술명가 막내아들','AZI·COBY(Contentslabblue)·조고미·도파민·이제원',array['드라마']::text[],'진 룬칸델 대륙 최고의 검술명가, 룬칸델의 막내아들 룬칸델 역사상 최악의 둔재  비참하게 쫓겨나 허무한 최후를 맞이한 그에게 다시 한 번 기회가 주어졌다.  “너는 이 힘을 어떻게 사용하고 싶더냐?','kakaowebtoon','https://webtoon.kakao.com/content/%EA%B2%80%EC%88%A0%EB%AA%85%EA%B0%80-%EB%A7%89%EB%82%B4%EC%95%84%EB%93%A4/2852','https://kr-a.kakaopagecdn.com/P/C/2852/sharing/2x/f6cdb5a1-a428-4692-a1a6-1fb078905202.jpg'),
('재앙급 영웅님이 귀환하셨다','OMinute(REDICE STUDIO)·이범근 ',array['드라마']::text[],'지상에 최강의 영웅이 있었다.  “하지만 죽었잖아. 우리가 죽인 놈이 어떻게 돌아와?” “그러게. 돌아올 수 있으면 한번 돌아와 보라지.”  그런데 20년 만에 진짜 돌아와 버렸다?  “뭘 그리 놀','kakaowebtoon','https://webtoon.kakao.com/content/%EC%9E%AC%EC%95%99%EA%B8%89-%EC%98%81%EC%9B%85%EB%8B%98%EC%9D%B4-%EA%B7%80%ED%99%98%ED%95%98%EC%85%A8%EB%8B%A4/2701','https://kr-a.kakaopagecdn.com/P/C/2701/sharing/2x/bb6e2809-b5f4-49d1-8813-e5196a5c21f6.jpg'),
('해골병사는 던전을 지키지 못했다','앤트스튜디오',array['드라마']::text[],'나는 ‘해골병사’. 주인인 서큐버스님을 용사로부터 지키지 못하고 그저 하찮게 부서져 버린 일개 몬스터.  그렇게 죽음을 맞이하는 줄 알았다.  그러나  정신을 차려보니, 20년 전 사령술사에 의해 ','kakaowebtoon','https://webtoon.kakao.com/content/%ED%95%B4%EA%B3%A8%EB%B3%91%EC%82%AC%EB%8A%94-%EB%8D%98%EC%A0%84%EC%9D%84-%EC%A7%80%ED%82%A4%EC%A7%80-%EB%AA%BB%ED%96%88%EB%8B%A4/2358','https://kr-a.kakaopagecdn.com/P/C/2358/sharing/2x/1f8b3b3a-df0c-4dcb-ad14-ce484fcb3902.jpg'),
('무한의 마법사','kiraz(REDICE STUDIO)·아디티',array['드라마']::text[],'마굿간에 버려져 평민으로 키워진 아이, 시로네.     타고난 통찰력으로 글까지 깨우친 아이는  도시로 나간 어느 날 그토록 궁금해하던 마법을 경험한다.     그 길로 마법사를 꿈꾸게 된 시로네.','kakaowebtoon','https://webtoon.kakao.com/content/%EB%AC%B4%ED%95%9C%EC%9D%98-%EB%A7%88%EB%B2%95%EC%82%AC/3211','https://kr-a.kakaopagecdn.com/P/C/3211/sharing/2x/078905ef-926a-4ef8-bc57-7d0cfd786eec.jpg'),
('여보, 왜 이혼은 안 되나요?','스튜디오 이너스',array['드라마']::text[],'막장 치정 로맨스 소설 속 악녀 ''오필리아 리젠'' 으로 빙의한 나. 주인공들의 계략에 놀아나 비참한 최후를 맞이하기 전에 하루빨리 오필리아의 남편 ''실베스터 리젠'' 과 이혼하고 광명을 찾고 싶은데,','kakaowebtoon','https://webtoon.kakao.com/content/%EC%97%AC%EB%B3%B4-%EC%99%9C-%EC%9D%B4%ED%98%BC%EC%9D%80-%EC%95%88-%EB%90%98%EB%82%98%EC%9A%94/4247','https://kr-a.kakaopagecdn.com/P/C/4247/sharing/2x/b13603a0-37b5-40be-9096-ed353061cbb8.jpg'),
('쉬고 싶은 레이디','솜땀·스튜디오 이너스·최엠제',array['드라마']::text[],'왕, 마법사, 악사, 검사, 부호, 거지, 성녀, 마녀... 수없이 전생을 거듭하며 그녀는 천년을 살았다.   때론 세상에서 가장 존귀한 자로, 때론 가장 비천한 자로. 그중에서도 53번째 삶은 손','kakaowebtoon','https://webtoon.kakao.com/content/%EC%89%AC%EA%B3%A0-%EC%8B%B6%EC%9D%80-%EB%A0%88%EC%9D%B4%EB%94%94/2482','https://kr-a.kakaopagecdn.com/P/C/2482/sharing/2x/6a9e389d-ae6a-41fa-a629-2adf34a8de1b.jpg'),
('로그인 무림','장철벽',array['드라마']::text[],'세상의 경계인 게이트에서 몬스터 사냥을 하는 헌터들이 잘 먹고 잘 사는 시대. 주인공 진태경은 최하위 헌터라 벌이가 시원찮다. 어느 날, 낡은 VR 게임기를 줍게 되고 접속하니 무림의 세계가 펼쳐진','kakaowebtoon','https://webtoon.kakao.com/content/%EB%A1%9C%EA%B7%B8%EC%9D%B8-%EB%AC%B4%EB%A6%BC/2384','https://kr-a.kakaopagecdn.com/P/C/2384/sharing/2x/a5877809-94f5-4b1f-be33-760d1d7cd435.jpg'),
('무신귀환록','러프',array['드라마']::text[],'그 누구도 맞설 수 없는 최흉의 인재(人災),  무극신마, 단우현.  악행으로 인해 봉인되고 천 년 후. 천 년이라는 시간은 단우현에게서 살심을 없애기에 충분했다. 변해버린 세상, 아는 사람이라고는','kakaowebtoon','https://webtoon.kakao.com/content/%EB%AC%B4%EC%8B%A0%EA%B7%80%ED%99%98%EB%A1%9D/2891','https://kr-a.kakaopagecdn.com/P/C/2891/sharing/2x/c5ac3bbe-a464-4518-b774-2b69033ce628.jpg'),
('사생아 공주로 살아남기','서결',array['드라마']::text[],'"어리다고 무시하지 마! 나, 이래 봬도 인생 10회차야!”  나는 적국의 핏줄로 오해받아 아홉 번의 죽음과 회귀를 겪은 비운의 사생아 공주다. 그런데 뭐? 내 친부가 마왕을 물리친 전쟁 영웅이자 ','kakaowebtoon','https://webtoon.kakao.com/content/%EC%82%AC%EC%83%9D%EC%95%84-%EA%B3%B5%EC%A3%BC%EB%A1%9C-%EC%82%B4%EC%95%84%EB%82%A8%EA%B8%B0/2966','https://kr-a.kakaopagecdn.com/P/C/2966/sharing/2x/1e662513-39f9-4762-bdfe-7b398334d06d.jpg'),
('상냥한 남자주인공의 가면을 벗기면','해삼·안토',array['드라마']::text[],'눈을 뜨니 소설 속 남주를 지독히도 사랑하는 스토커이자 악역, 요이델이 되어버렸다.  남주 율리시스는 자애롭고 상냥하니, 내가 진짜 요이델이 아니란 걸 믿어주지 않을까...?  사형대에 오르기 직전','kakaowebtoon','https://webtoon.kakao.com/content/%EC%83%81%EB%83%A5%ED%95%9C-%EB%82%A8%EC%9E%90%EC%A3%BC%EC%9D%B8%EA%B3%B5%EC%9D%98-%EA%B0%80%EB%A9%B4%EC%9D%84-%EB%B2%97%EA%B8%B0%EB%A9%B4/2977','https://kr-a.kakaopagecdn.com/P/C/2977/sharing/2x/134b3e98-3456-41a3-ad7e-a1d0dcce16b4.jpg'),
('철혈검가 사냥개의 회귀','모피 프로그(REDICE STUDIO)·설아랑',array['드라마']::text[],'바스커빌 가문의 사냥개 ''비키르''.  사냥개로서 가문에 충성한 보답은  모함과 누명으로 얼룩진 단두대의 칼날이었다.  "다시는 토끼를 잡고 나면  삶아지는 사냥개처럼 살지 않겠노라."  그런 그에게','kakaowebtoon','https://webtoon.kakao.com/content/%EC%B2%A0%ED%98%88%EA%B2%80%EA%B0%80-%EC%82%AC%EB%83%A5%EA%B0%9C%EC%9D%98-%ED%9A%8C%EA%B7%80/3455','https://kr-a.kakaopagecdn.com/P/C/3455/sharing/2x/ee9294bc-6a3c-420d-a607-865a0f854404.jpg'),
('악녀의 맞선남이 너무 완벽하다','넥스트레벨스튜디오',array['드라마']::text[],'소문난 악녀 ''이본 아젠트호즈''에 빙의 했다!  원작에서는 남주와 맺어진 여주를 질투하다가 비극적 최후를 맞은 악녀였지만, 빙의 후 이본은 평화롭게 다이아 수저의 삶을 즐기기로 다짐한다.  하지만 ','kakaowebtoon','https://webtoon.kakao.com/content/%EC%95%85%EB%85%80%EC%9D%98-%EB%A7%9E%EC%84%A0%EB%82%A8%EC%9D%B4-%EB%84%88%EB%AC%B4-%EC%99%84%EB%B2%BD%ED%95%98%EB%8B%A4/3652','https://kr-a.kakaopagecdn.com/P/C/3652/sharing/2x/9d8ad1e1-db51-483d-b19a-5c60ce14a2cd.jpg'),
('나는 한 편의 극을 보았다','탄지·송이',array['드라마']::text[],'''심장은 여전히 그를 사랑한다고 말했지만, 머리는 그 사랑을 거부했다. 그것은 꽤나 묘한 기분이었다. 나지만 내가 아닌 느낌이었다.''  햇빛을 받아 금발처럼 보이는 금갈색 머리카락이 허리까지 내려와','kakaowebtoon','https://webtoon.kakao.com/content/%EB%82%98%EB%8A%94-%ED%95%9C-%ED%8E%B8%EC%9D%98-%EA%B7%B9%EC%9D%84-%EB%B3%B4%EC%95%98%EB%8B%A4/4449','https://kr-a.kakaopagecdn.com/P/C/4449/sharing/2x/5be61da9-fe3f-4646-a6b9-c6bd0b9dc112.jpg'),
('낭선기환담','김순태',array['드라마']::text[],'호랑이로 환생하여, 영물이 되어 살아가던 산의 주인 산군. 평화롭게 살아가던 산군의 앞에 한 소녀가 찾아오게 된다.  대뜸 지아비로 모시겠다고 하는 소녀. 귀찮은 산군은 그녀를 내쫓으려고 하지만, ','kakaowebtoon','https://webtoon.kakao.com/content/%EB%82%AD%EC%84%A0%EA%B8%B0%ED%99%98%EB%8B%B4/2496','https://kr-a.kakaopagecdn.com/P/C/2496/sharing/2x/f18156d9-4232-4b1e-9810-5f263efef993.jpg'),
('잊혀진 들판','스푼',array['드라마']::text[],'- 난 매일 기도해 이 사랑이 죽기를 오늘까지만 너를 사랑하고 내일은 이 사랑이 죽어 있기를 -  불륜으로 태어난 비운의 황녀, 탈리아 로엠 귀르타.  그녀는 무관심한 부모와 적대적인 이복형제들, ','kakaowebtoon','https://webtoon.kakao.com/content/%EC%9E%8A%ED%98%80%EC%A7%84-%EB%93%A4%ED%8C%90/4845','https://kr-a.kakaopagecdn.com/P/C/4845/sharing/2x/6a9b7cc8-4944-441b-ab27-e1dff1a44a2d.jpg'),
('점괘보는 공녀님','슈퍼코믹스스튜디오',array['드라마']::text[],'귀신 보는 능력을 가진 탑배우 이시아. 사고 후 ''카밀라 소르펠''의 몸에서 눈을 뜬다.  문제는 말이지.  "아, 아버지! 살려 주세요!"  이 여자의 끝이 매번 죽음이라는 것!  목숨줄 늘리는 게','kakaowebtoon','https://webtoon.kakao.com/content/%EC%A0%90%EA%B4%98%EB%B3%B4%EB%8A%94-%EA%B3%B5%EB%85%80%EB%8B%98/3722','https://kr-a.kakaopagecdn.com/P/C/3722/sharing/2x/6ecc62a1-71ec-4369-942d-3088cdaf5cb1.jpg'),
('권왕전생','나푼달(REDICE STUDIO)·양경일',array['드라마']::text[],'인간들이 이종족을 노예로 부리는 세상. 대마도사 ''레펜하르트''는 이종족들을 돕는다는 이유로 인간들에게 마왕 취급을 받는다.  마왕을 토벌하기 위해 온 용사 일행! ''레펜하르트''는 그에 맞서 용사 일','kakaowebtoon','https://webtoon.kakao.com/content/%EA%B6%8C%EC%99%95%EC%A0%84%EC%83%9D/4013','https://kr-a.kakaopagecdn.com/P/C/4013/sharing/2x/6fbe3081-b5eb-4f08-8931-9aee987d7d11.jpg'),
('픽 미 업!','조우네·와삭바삭',array['드라마']::text[],'그 누구도 던전의 끝까지 오르지 못한  극악의 난이도를 자랑하는 모바일 가챠 게임 <픽 미 업!(Pick me up!)>  마스터 오브 마스터라 불리는 세계 랭킹 5위의 마스터 ''로키''는 던전을 깨','kakaowebtoon','https://webtoon.kakao.com/content/%ED%94%BD-%EB%AF%B8-%EC%97%85/3205','https://kr-a.kakaopagecdn.com/P/C/3205/sharing/2x/39e0333b-49da-487e-9d46-70a876092fd8.jpg'),
('도굴왕','윤쓰(Redice Studio)·3B2S',array['드라마']::text[],'현대에 출몰한 신의 무덤. 유물로 영웅의 능력을 쓰게 된 사람들, 부를 얻게 된 사람들.   그리고 그 유물을 털어가는 의문의 도굴꾼이 나타났다.   도굴왕.   "아이씨, 미치겠네. 여기도 또 그','kakaowebtoon','https://webtoon.kakao.com/content/%EB%8F%84%EA%B5%B4%EC%99%95/2340','https://kr-a.kakaopagecdn.com/P/C/2340/sharing/2x/f3568b36-8128-46b4-ae39-521c51ac472a.jpg'),
('로드 오브 머니','손주환',array['드라마']::text[],'재계 서열 5위 <지경그룹>의 망나니 셋째 아들 천중명. 그의 밑에서 비서로 일하는 성창욱. 그런 성창욱을 사고사로 위장해 죽이려는 천중명은 성창욱과 함께 전기에 감전되어 버리고 둘은 하루아침에 몸','kakaowebtoon','https://webtoon.kakao.com/content/%EB%A1%9C%EB%93%9C-%EC%98%A4%EB%B8%8C-%EB%A8%B8%EB%8B%88/2453','https://kr-a.kakaopagecdn.com/P/C/2453/sharing/2x/ef8f8a3a-ec03-4575-87d2-aabe318ee9f2.jpg'),
('인소의 법칙','아현',array['드라마']::text[],'인터넷 소설 읽기가 취미였던 평범한 학생 함단이. 어느 날 자고 일어나니 옆집에는 아주 예쁜 여학생 반여령이, 학교에는 그 이름도 무시무시한 사대천왕이 나타났다!  하루아침에 소설처럼 뒤바뀐 세계,','kakaowebtoon','https://webtoon.kakao.com/content/%EC%9D%B8%EC%86%8C%EC%9D%98-%EB%B2%95%EC%B9%99/2334','https://kr-a.kakaopagecdn.com/P/C/2334/sharing/2x/2c85f079-4a42-492c-8e07-05faa9705348.jpg'),
('리셋팅 레이디','백우·태공',array['드라마']::text[],'어느 날 갑자기 책 속으로 들어왔다.  진정한 사랑에 빠지면 현실로 돌아올 수 있을 줄 알았지만, 그 끝은 죽음이었다.   추락사, 교살, 독살, 익사, 화마…  100번을 죽고 회귀해도 소설은 끝','kakaowebtoon','https://webtoon.kakao.com/content/%EB%A6%AC%EC%85%8B%ED%8C%85-%EB%A0%88%EC%9D%B4%EB%94%94/3447','https://kr-a.kakaopagecdn.com/P/C/3447/sharing/2x/347df8f6-c6be-4190-8b43-7d07f26ccd7b.jpg'),
('타람 타람 타람','비송·반디',array['드라마']::text[],'나긋나긋한 움직임으로 들어온 다온이 연회장 중앙에서 멈춰 섰다.  인형만큼이나 무미하고 감정 없는 얼굴이었다.  그럼에도 도도하고 우아해서 얼음 여왕처럼 강렬한 인상을 주었다.  엑서는 다리를 꼬며','kakaowebtoon','https://webtoon.kakao.com/content/%ED%83%80%EB%9E%8C-%ED%83%80%EB%9E%8C-%ED%83%80%EB%9E%8C/4074','https://kr-a.kakaopagecdn.com/P/C/4074/sharing/2x/2f74a0a1-0f7d-4096-86f1-3223a9b3fd40.jpg'),
('무당기협','화람',array['드라마']::text[],'무림 사파의 수장인 혁련무강은 죽기 직전 불로초를 삼킨 후 눈을 떠보니 무당파 도동의 몸에 빙의되었다. 예전에 본인이 붕괴 직전까지 몰고 갔던 무당파에서 ''진무''라는 이름의 도사로 다시 살게 된 그','kakaowebtoon','https://webtoon.kakao.com/content/%EB%AC%B4%EB%8B%B9%EA%B8%B0%ED%98%91/2499','https://kr-a.kakaopagecdn.com/P/C/2499/sharing/2x/733e0166-0264-4583-8ea8-bed1c39ddadf.jpg'),
('힘을 숨기고 즐기는 평화로운 하녀 생활','초바·마떼·박귀리',array['드라마']::text[],'','kakaopage','https://page.kakao.com/content/68910610','https://dn-img-page.kakao.com/download/resource?kid=BqzEk/dJMcac5biaH/Wb8U5TOZgSnpBrlx38aOQk&filename=th3'),
('이번 생은 가주가 되겠습니다','앤트스튜디오·몬·김로아',array['드라마']::text[],'','kakaopage','https://page.kakao.com/content/56566288','https://dn-img-page.kakao.com/download/resource?kid=bUpyjK/dJMcagYIkvS/2JkDCGHTnspcqHCRMWFGR1&filename=th3'),
('백작가의 망나니가 되었다','별나래·PAN4·유려한',array['드라마']::text[],'','kakaopage','https://page.kakao.com/content/55553244','https://dn-img-page.kakao.com/download/resource?kid=ooxqn/dJMcag6ypQJ/ZtCKlS9BZj4eGpr43OwXJ1&filename=th3'),
('악녀라서 편하고 좋은데요?','수달·요테·망고킴',array['드라마']::text[],'','kakaopage','https://page.kakao.com/content/60728286','https://dn-img-page.kakao.com/download/resource?kid=l0XA3/dJMcafGm4Gv/bTK9hRj7Wf6VYZWBqL7df0&filename=th3'),
('시카리오','승민·서현진',array['액션']::text[],'','kakaopage','https://page.kakao.com/content/69969236','https://dn-img-page.kakao.com/download/resource?kid=bC4QKf/dJMcacRo6E8/fsnUFMFGXqUyH8YQ2JNCdK&filename=th3'),
('괴담에 떨어져도 출근을 해야 하는구나','캐롯스튜디오·쓩늉·백덕수',array['드라마']::text[],'','kakaopage','https://page.kakao.com/content/69229506','https://dn-img-page.kakao.com/download/resource?kid=d9GNt/dJMcabcZZYp/Swh2KQrzqu4PMbBTbDHL41&filename=th3'),
('회귀검가의 서자가 사는 법','넥스트레벨스튜디오·빵먹는다람쥐·사도연',array['판타지']::text[],'','kakaopage','https://page.kakao.com/content/65125886','https://dn-img-page.kakao.com/download/resource?kid=bsKFNR/dJMcafsCwpw/1WGV7jgN5cllOEfaf2lYwK&filename=th3'),
('2레벨로 회귀한 무신','디앤씨웹툰·이윤구·염비',array['판타지']::text[],'','kakaopage','https://page.kakao.com/content/62302584','https://dn-img-page.kakao.com/download/resource?kid=bRjDru/dJMcagDUr3u/ZfvPqR9jQXQddBdEqxptKK&filename=th3'),
('힘숨찐 어린이가 아빠를 찾습니다','글리·김구슬',array['드라마']::text[],'','kakaopage','https://page.kakao.com/content/68288343','https://dn-img-page.kakao.com/download/resource?kid=5fkHU/dJMcadBuIWi/g0D5FDb9KKlKAXhC8YJ9S0&filename=th3'),
('삼류무가 천하제일인','기성욱·남사랑·규현·유리손',array['액션']::text[],'','kakaopage','https://page.kakao.com/content/69800992','https://dn-img-page.kakao.com/download/resource?kid=r79xA/dJMcacKDX1g/A5KXOlwQ0KHHp1eyL06JZK&filename=th3'),
('남주가 제 건강에 집착합니다','슈퍼코믹스스튜디오·윤슬',array['드라마']::text[],'','kakaopage','https://page.kakao.com/content/66974798','https://dn-img-page.kakao.com/download/resource?kid=MyHT4/dJMcadJgrlm/hQxejKxkQxO1xZMYmkcTg0&filename=th3'),
('전 그냥 내 집 마련이 꿈인데요?','HNM·오로라 스튜디오·여로은',array['드라마']::text[],'','kakaopage','https://page.kakao.com/content/66539896','https://dn-img-page.kakao.com/download/resource?kid=boK4St/dJMcagYCtil/5EGEug376eH1l4WITEGkm1&filename=th3'),
('망나니 1왕자가 되었다','맹송·구샤·챠아(MSTORYHUB)·글럼프',array['판타지']::text[],'','kakaopage','https://page.kakao.com/content/68486653','https://dn-img-page.kakao.com/download/resource?kid=Vo8oc/dJMcadn1nV1/hn0FYwtNAC8Q8kP1kkxcok&filename=th3'),
('멸망급 데스나이트가 회귀함','최승·오렌지망고',array['판타지']::text[],'','kakaopage','https://page.kakao.com/content/66921235','https://dn-img-page.kakao.com/download/resource?kid=LMUz6/dJMcaflVHnk/qKvapkXDoowxKGjRqDgxzK&filename=th3'),
('그 아빠에 그 딸','스튜디오 이너스·주월림',array['드라마']::text[],'','kakaopage','https://page.kakao.com/content/66232401','https://dn-img-page.kakao.com/download/resource?kid=eaXF3/dJMcagkPOi3/KPtQc2dq6rRkUw0c7yBUY1&filename=th3'),
('귀족 유치원의 교사는 오늘도 고달프다','심상·다노아·딸기송떡',array['드라마']::text[],'','kakaopage','https://page.kakao.com/content/67307507','https://dn-img-page.kakao.com/download/resource?kid=mcYj1/dJMcagMOCtv/Xdl8P4ejVCFdifmcMZVnr0&filename=th3'),
('임신한 척했는데 남편이 돌아왔다','나래·별별토',array['드라마']::text[],'','kakaopage','https://page.kakao.com/content/68858742','https://dn-img-page.kakao.com/download/resource?kid=bcKBxd/dJMcaduoR4n/LeKlRO45xPkv7aiRqxD1v0&filename=th3'),
('이상한데 효과적인 악녀 생활','에디·유나진',array['드라마']::text[],'','kakaopage','https://page.kakao.com/content/65752694','https://dn-img-page.kakao.com/download/resource?kid=A0KxJ/dJMcadVyrM1/nUwNGJJzf7EmuGAqqkohR1&filename=th3')
),
ins as (
  insert into public.works (title_ko, author, genres, blurb_ko, cover_url, status, is_curated, sort)
  select i.title, i.author, i.genres, i.blurb, nullif(i.cover,''), '연재', false,
         3000 + row_number() over (order by i.title)
    from imp i
   where not exists (select 1 from public.works w where w.title_ko = i.title)
  returning id, title_ko
)
insert into public.work_legal_links (work_id, platform_key, url, sort)
select ins.id, imp.pk, imp.url, 0
  from imp join ins on ins.title_ko = imp.title;


-- 3) 오늘자 랭킹 반영 (매일 이 블록만 갈아끼운다)
delete from public.work_rankings;

with rk(pk, rnk, title) as (values
('naver',1,'화산귀환'),
('naver',2,'별을 품은 소드마스터'),
('naver',3,'종말이 찾아왔다'),
('naver',4,'쪽팔려게임'),
('naver',5,'운명을 보는 회사원'),
('naver',6,'천마는 조용히 살고싶다'),
('naver',7,'일렉시드'),
('naver',8,'백XX'),
('naver',9,'66666년 만에 환생한 흑마법사'),
('naver',10,'1등급 싸움과외'),
('naver',11,'미래의 골동품 가게'),
('naver',12,'중간에서 만나'),
('naver',13,'어느 마법사의 식당'),
('naver',14,'방구석 재민이'),
('naver',15,'왕따가 격투기를 너무 잘함'),
('naver',16,'나쁜사람'),
('naver',17,'건곤불이기'),
('naver',18,'천재는 평범하게 살기로 했더'),
('naver',19,'공작님의 아이만 필요합니다'),
('naver',20,'마교전선 비룡십삼대'),
('naver',21,'첩자의 마교생활'),
('naver',22,'좋아하면 멍청해진다'),
('naver',23,'밥먹고가라'),
('naver',24,'중대장은 실망했다'),
('naver',25,'멸귀수도전'),
('naver',26,'내 분신이 거물이 되어간다'),
('naver',27,'어린이집 다니는 구나'),
('naver',28,'강철을 먹는 플레이어'),
('naver',29,'싸움배달'),
('naver',30,'다 때려치고 콜라 팝니다'),
('kakaowebtoon',1,'유부녀 킬러'),
('kakaowebtoon',2,'악마의 주인님이 되어버렸다'),
('kakaowebtoon',3,'검술명가 막내아들'),
('kakaowebtoon',4,'재앙급 영웅님이 귀환하셨다'),
('kakaowebtoon',5,'해골병사는 던전을 지키지 못했다'),
('kakaowebtoon',6,'무한의 마법사'),
('kakaowebtoon',7,'나를 죽인 황제의 딸로 살아남는 방법'),
('kakaowebtoon',8,'여보, 왜 이혼은 안 되나요?'),
('kakaowebtoon',9,'수린당 성군전'),
('kakaowebtoon',10,'쉬고 싶은 레이디'),
('kakaowebtoon',11,'로그인 무림'),
('kakaowebtoon',12,'천광명월'),
('kakaowebtoon',13,'무신귀환록'),
('kakaowebtoon',14,'사생아 공주로 살아남기'),
('kakaowebtoon',15,'상냥한 남자주인공의 가면을 벗기면'),
('kakaowebtoon',16,'철혈검가 사냥개의 회귀'),
('kakaowebtoon',17,'악녀의 맞선남이 너무 완벽하다'),
('kakaowebtoon',18,'나는 한 편의 극을 보았다'),
('kakaowebtoon',19,'낭선기환담'),
('kakaowebtoon',20,'잊혀진 들판'),
('kakaowebtoon',21,'점괘보는 공녀님'),
('kakaowebtoon',22,'나 혼자만 레벨업'),
('kakaowebtoon',23,'권왕전생'),
('kakaowebtoon',24,'픽 미 업!'),
('kakaowebtoon',25,'도굴왕'),
('kakaowebtoon',26,'로드 오브 머니'),
('kakaowebtoon',27,'인소의 법칙'),
('kakaowebtoon',28,'리셋팅 레이디'),
('kakaowebtoon',29,'타람 타람 타람'),
('kakaowebtoon',30,'무당기협'),
('kakaopage',1,'타람 타람 타람'),
('kakaopage',2,'나는 한 편의 극을 보았다'),
('kakaopage',3,'무한의 마법사'),
('kakaopage',4,'힘을 숨기고 즐기는 평화로운 하녀 생활'),
('kakaopage',5,'유부녀 킬러'),
('kakaopage',6,'이번 생은 가주가 되겠습니다'),
('kakaopage',7,'도굴왕'),
('kakaopage',8,'백작가의 망나니가 되었다'),
('kakaopage',9,'악녀라서 편하고 좋은데요?'),
('kakaopage',10,'시카리오'),
('kakaopage',11,'철혈검가 사냥개의 회귀'),
('kakaopage',12,'괴담에 떨어져도 출근을 해야 하는구나'),
('kakaopage',13,'픽 미 업!'),
('kakaopage',14,'회귀검가의 서자가 사는 법'),
('kakaopage',15,'잊혀진 들판'),
('kakaopage',16,'인소의 법칙'),
('kakaopage',17,'2레벨로 회귀한 무신'),
('kakaopage',18,'힘숨찐 어린이가 아빠를 찾습니다'),
('kakaopage',19,'악마의 주인님이 되어버렸다'),
('kakaopage',20,'나 혼자만 레벨업'),
('kakaopage',21,'점괘보는 공녀님'),
('kakaopage',22,'삼류무가 천하제일인'),
('kakaopage',23,'남주가 제 건강에 집착합니다'),
('kakaopage',24,'전 그냥 내 집 마련이 꿈인데요?'),
('kakaopage',25,'망나니 1왕자가 되었다'),
('kakaopage',26,'멸망급 데스나이트가 회귀함'),
('kakaopage',27,'그 아빠에 그 딸'),
('kakaopage',28,'귀족 유치원의 교사는 오늘도 고달프다'),
('kakaopage',29,'임신한 척했는데 남편이 돌아왔다'),
('kakaopage',30,'이상한데 효과적인 악녀 생활')
)
insert into public.work_rankings (platform_key, rank, work_id, fetched_on)
select distinct on (rk.pk, rk.rnk) rk.pk, rk.rnk, w.id, date '2026-08-12'
  from rk join public.works w on w.title_ko = rk.title
 order by rk.pk, rk.rnk, w.id;   -- 제목이 여러 행에 걸려도 한 건만 넣는다


-- 확인용
-- select platform_key, count(*), min(rank), max(rank) from public.work_rankings group by platform_key;


-- ------------------------------------------------------------
-- 【철회】
-- delete from public.work_rankings;
-- delete from public.works where is_curated = false and sort >= 3000;
-- ------------------------------------------------------------
