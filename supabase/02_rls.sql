-- ============================================================
-- Fairtoon · RLS(행 수준 보안) 정책 (P0)
-- 원칙: 공개 콘텐츠는 누구나 읽기(발행분) / 쓰기는 관리자(admins)만
-- 실행: 01_schema.sql 실행 후 SQL Editor 에서 Run
-- ============================================================

-- 모든 대상 테이블 RLS 활성화
alter table public.platforms        enable row level security;
alter table public.works            enable row level security;
alter table public.work_legal_links enable row level security;
alter table public.articles         enable row level security;
alter table public.creator_voices   enable row level security;
alter table public.safety_cards     enable row level security;
alter table public.home_banners     enable row level security;
alter table public.admins           enable row level security;

-- ------------------------------------------------------------
-- admins: 본인 행만 조회 / 쓰기는 owner 또는 서버(서비스 키)만
-- 최초 관리자 등록은 대시보드(서비스 롤)에서 직접 insert
-- ------------------------------------------------------------
create policy admins_self_read on public.admins
  for select using (user_id = auth.uid());

-- ------------------------------------------------------------
-- 공개 읽기 (published/active 필터)
-- ------------------------------------------------------------
create policy platforms_read on public.platforms
  for select using (true);

create policy works_read on public.works
  for select using (true);

create policy wll_read on public.work_legal_links
  for select using (true);

create policy articles_read on public.articles
  for select using (is_published = true or public.is_admin());

create policy voices_read on public.creator_voices
  for select using (is_published = true or public.is_admin());

create policy safety_read on public.safety_cards
  for select using (true);

create policy banners_read on public.home_banners
  for select using (is_active = true or public.is_admin());

-- ------------------------------------------------------------
-- 관리자 쓰기 (insert/update/delete) — is_admin() 통과 시만
-- ------------------------------------------------------------
do $$
declare t text;
begin
  foreach t in array array[
    'platforms','works','work_legal_links','articles',
    'creator_voices','safety_cards','home_banners'
  ]
  loop
    execute format('create policy %I_admin_write on public.%I for all using (public.is_admin()) with check (public.is_admin());', t, t);
  end loop;
end $$;
