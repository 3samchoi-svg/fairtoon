-- ============================================================
-- Fairtoon · Supabase 스키마 (P0)
-- plan.md v3 §7 데이터 스키마 기준
-- 실행: Supabase 대시보드 > SQL Editor 에 붙여넣고 Run
-- ============================================================

-- 공통: updated_at 자동 갱신 트리거 함수
create or replace function public.set_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end $$;

-- 공통: 관리자 여부 헬퍼 (RLS 쓰기 정책에서 사용)
-- admins 테이블에 등록된 auth 사용자만 관리자
create table if not exists public.admins (
  user_id uuid primary key references auth.users(id) on delete cascade,
  email   text,
  role    text not null default 'editor',   -- editor | owner
  created_at timestamptz not null default now()
);

create or replace function public.is_admin()
returns boolean language sql stable as $$
  select exists (select 1 from public.admins a where a.user_id = auth.uid());
$$;


-- ------------------------------------------------------------
-- 1) platforms · 합법 플랫폼 + 검색 URL 패턴 (검색 폴백)
-- ------------------------------------------------------------
create table if not exists public.platforms (
  id            bigint generated always as identity primary key,
  key           text unique not null,          -- naver, kakaopage ...
  name          text not null,
  logo_url      text,
  color         text,
  search_url_pattern text not null,            -- ".../search?keyword={q}"
  price_note_ko text,
  price_note_en text,
  sort          int not null default 0,
  updated_at    timestamptz not null default now()
);
create trigger trg_platforms_updated before update on public.platforms
  for each row execute function public.set_updated_at();


-- ------------------------------------------------------------
-- 2) works · 작품 DB (검색 결과 + 큐레이션 공용)
-- ------------------------------------------------------------
create table if not exists public.works (
  id          bigint generated always as identity primary key,
  title_ko    text not null,
  title_en    text,
  aliases     text[] not null default '{}',
  author      text,
  art_author  text,
  cover_url   text,
  genres      text[] not null default '{}',
  blurb_ko    text,
  blurb_en    text,
  status      text default '완결',            -- 완결 | 연재
  is_curated  boolean not null default false,  -- 명작 큐레이션 노출 여부
  curated_note text,
  sort        int not null default 0,
  created_by  uuid references auth.users(id),
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);
create trigger trg_works_updated before update on public.works
  for each row execute function public.set_updated_at();
-- 검색 보조 인덱스(제목/작가 부분일치는 앱에서 처리, 여기선 필터용)
create index if not exists idx_works_curated on public.works(is_curated);


-- ------------------------------------------------------------
-- 3) work_legal_links · 작품별 합법 플랫폼 링크
-- ------------------------------------------------------------
create table if not exists public.work_legal_links (
  id           bigint generated always as identity primary key,
  work_id      bigint not null references public.works(id) on delete cascade,
  platform_key text not null,                  -- platforms.key 참조(느슨)
  url          text not null,                  -- 딥링크 우선, 없으면 검색 URL
  price_tag    text,                           -- 무료 / 기다무 / 유료 등 라이트 태그
  sort         int not null default 0
);
create index if not exists idx_wll_work on public.work_legal_links(work_id);


-- ------------------------------------------------------------
-- 4) articles · 아티클 (경제학 렌즈, SEO 핵심)
-- ------------------------------------------------------------
create table if not exists public.articles (
  id           bigint generated always as identity primary key,
  slug         text unique not null,
  category     text,
  concept      text,
  title_ko     text not null,
  title_en     text,
  excerpt_ko   text,
  excerpt_en   text,
  body_ko      text,                           -- 마크다운/리치 텍스트
  body_en      text,
  cover_url    text,
  read_time    text,
  is_published boolean not null default false,
  published_at timestamptz,
  created_by   uuid references auth.users(id),
  created_at   timestamptz not null default now(),
  updated_at   timestamptz not null default now()
);
create trigger trg_articles_updated before update on public.articles
  for each row execute function public.set_updated_at();
create index if not exists idx_articles_pub on public.articles(is_published, published_at desc);


-- ------------------------------------------------------------
-- 5) creator_voices · 작가의 목소리 (인터뷰 영상/숏츠)
-- ------------------------------------------------------------
create table if not exists public.creator_voices (
  id            bigint generated always as identity primary key,
  creator_name  text not null,
  work          text,
  quote_ko      text,
  quote_en      text,
  interview_youtube_url text,                   -- 유튜브 링크(임베드)
  shorts        jsonb not null default '[]',    -- [{youtube_url, caption}]
  summary_ko    text,
  summary_en    text,
  thumb_url     text,
  is_published  boolean not null default false,
  sort          int not null default 0,
  created_by    uuid references auth.users(id),
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now()
);
create trigger trg_voices_updated before update on public.creator_voices
  for each row execute function public.set_updated_at();


-- ------------------------------------------------------------
-- 6) safety_cards · Stay Safe 카드
-- ------------------------------------------------------------
create table if not exists public.safety_cards (
  id         bigint generated always as identity primary key,
  device     text not null default '공통',      -- 공통 | iphone | android | mac | windows
  icon       text,
  title_ko   text not null,
  title_en   text,
  body_ko    text,
  body_en    text,
  sort       int not null default 0,
  updated_at timestamptz not null default now()
);
create trigger trg_safety_updated before update on public.safety_cards
  for each row execute function public.set_updated_at();


-- ------------------------------------------------------------
-- 7) home_banners · 홈 추천/후크 배너
-- ------------------------------------------------------------
create table if not exists public.home_banners (
  id         bigint generated always as identity primary key,
  type       text not null default 'featured',  -- featured | hook
  title      text,
  subtitle   text,
  image_url  text,
  link       text,
  starts_at  timestamptz,
  ends_at    timestamptz,
  is_active  boolean not null default true,
  sort       int not null default 0,
  updated_at timestamptz not null default now()
);
create trigger trg_banners_updated before update on public.home_banners
  for each row execute function public.set_updated_at();
