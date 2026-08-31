-- 31. 작가명 정정 + 글/그림 분리 — 2026-08-31 대표님 승인분
--
-- 승인 내용: "1~6 승인, 7번 A(네스티캣), 원작/작화 A(두 칸 분리)"
-- 근거: 각 연재 플랫폼 공식 페이지. 네이버는 역할 코드(ARTIST_WRITER/ARTIST_PAINTER),
--       카카오웹툰은 작품정보 탭의 '글'·'그림' 표기를 그대로 옮겼다.
--
-- 실행: SQL Editor 에서 Run. 전부 update 이고 멱등이라 여러 번 돌려도 같은 값이 된다.
-- 맨 아래 확인 select 두 개가 결과를 찍는다.
--
-- 주의: 텍스트를 드래그해서 선택한 상태로 Run 하면 선택한 부분만 실행된다.
--       전체를 돌리려면 아무것도 선택하지 말고 Run.


-- ── A. 작가명 정정 6건 (플랫폼 표기가 맞고 DB가 틀렸다) ──────────────

update public.works set author = '오세형'                where id = 29;  -- 신도림 (기존 전선욱)
update public.works set author = '박은혁'                where id = 30;  -- 랜덤채팅의 그녀! (기존 마사토끼·레노)
update public.works set author = '미애'                  where id = 44;  -- 어글리후드 (기존 나야)
update public.works set author = '미역의효능'            where id = 26;  -- 아 지갑놓고 나왔다 (기존 치즈)
update public.works set author = '정인·망글이·한이림'    where id = 50;  -- 악녀는 마리오네트 (기존 한이레·만보)
update public.works set author = 'Hun'                   where id = 34;  -- 은밀하게 위대하게 (표기 정규화: HUN → Hun)


-- ── B. 7번 트레이스 — 필명으로 표시하고 본명은 검색용 별칭으로 ────────
-- 카카오웹툰 작품정보: 글 네스티캣 / 그림 네스티캣 (동일인)
-- '고영훈'으로 검색해도 찾히도록 aliases 에 넣는다. 화면 표시는 '네스티캣'.

update public.works
set author  = '네스티캣',
    aliases = case
                when '고영훈' = any(coalesce(aliases, array[]::text[])) then aliases
                else coalesce(aliases, array[]::text[]) || '고영훈'
              end
where id = 11;


-- ── C. 원작(글) / 작화(그림) 분리 ─────────────────────────────────────
-- art_author 열을 처음으로 쓰기 시작한다. 역할이 플랫폼에 공개된 작품만 나눈다.

-- 네이버 (역할 코드로 확인)
update public.works set author = '손제호', art_author = '이광수' where id = 7;   -- 노블레스
update public.works set author = '김칸비', art_author = '황영찬' where id = 14;  -- 스위트홈
update public.works set author = '연상호', art_author = '최규석' where id = 15;  -- 지옥
update public.works set author = '시니',   art_author = '혀노'   where id = 23;  -- 죽음에 관하여
update public.works set author = '신태훈', art_author = '나승훈' where id = 27;  -- 놓지마 정신줄
update public.works set author = '윤인완', art_author = '김선희' where id = 28;  -- 심연의 하늘

-- 카카오웹툰 (작품정보 탭의 글·그림 표기)
update public.works set author = 'Hun',    art_author = '지민'   where id = 43;  -- 나빌레라

-- 카카오페이지 (웹소설 원작 / 웹툰 작화)
update public.works set author = '정경윤', art_author = '김명미' where id = 47;  -- 김비서가 왜 그럴까


-- ── 확인 1. 이번에 손댄 15편 ──────────────────────────────────────────

select id, title_ko, author, art_author, aliases
from public.works
where id in (7,11,14,15,23,26,27,28,29,30,34,43,44,47,50)
order by id;

-- 기대값
--   7  노블레스          손제호        이광수
--   11 트레이스          네스티캣      (null)      aliases 에 고영훈 포함
--   14 스위트홈          김칸비        황영찬
--   15 지옥              연상호        최규석
--   23 죽음에 관하여     시니          혀노
--   26 아 지갑놓고 나왔다 미역의효능   (null)
--   27 놓지마 정신줄     신태훈        나승훈
--   28 심연의 하늘       윤인완        김선희
--   29 신도림            오세형        (null)
--   30 랜덤채팅의 그녀!  박은혁        (null)
--   34 은밀하게 위대하게 Hun           (null)
--   43 나빌레라          Hun           지민
--   44 어글리후드        미애          (null)
--   47 김비서가 왜 그럴까 정경윤       김명미
--   50 악녀는 마리오네트 정인·망글이·한이림  (null)


-- ── 확인 2. art_author 를 쓰기 시작한 편수 ────────────────────────────

select count(*) as 글그림_분리된_편수
from public.works
where art_author is not null and art_author <> '';

-- 기대값: 8


-- 무엇을 왜 이렇게 했는지
--
--
-- 큐레이션 49편 전수 대조 결과
--
-- 승인받은 7건만 고치지 않고, 49편 전부를 플랫폼 공식 표기와 대조했습니다.
--
-- | 플랫폼 | 편수 | 일치 | 불일치 |
-- |---|---|---|---|
-- | 네이버 | 28 | 25 | 3 (신도림 · 랜덤채팅 · 어글리후드 — 전부 승인분) |
-- | 카카오웹툰 | 14 | 11 | 3 (트레이스 · 은밀하게 위대하게 · 나빌레라) |
-- | 카카오페이지 | 7 | 0 | 7 (승인분 3건 + 신규 4건 → 32번) |
--
-- 네이버·카카오웹툰은 이 SQL로 전부 정리됩니다. 카카오페이지에서 새로 발견된 4건은 승인 목록 밖이라 32_author_fix_kakaopage.md로 따로 뺐습니다.
--
--
-- 글/그림을 나눈 편과 나누지 않은 편
--
-- - 나눈 8편 — 플랫폼이 역할을 공개하는 경우입니다. 네이버는 작가마다 ARTIST_WRITER/ARTIST_PAINTER 코드를 주고, 카카오웹툰은 작품정보 탭에 '글'·'그림'을 따로 적습니다.
-- - 나누지 않은 편 — 카카오페이지는 이름만 나열하고 역할을 밝히지 않습니다(예: 정인,망글이,한이림). 모르는 것을 추측해서 넣지 않는다는 원칙대로 author 한 칸에 두었습니다. 김비서만 예외로 나눴는데, 정경윤은 같은 플랫폼에서 웹소설 원작자로 별도 등재돼 있어 역할이 확인되기 때문입니다.
