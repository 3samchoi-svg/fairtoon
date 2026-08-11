-- ============================================================
-- Fairtoon · Storage(이미지 저장소) 설정 (P0)
-- 버킷: media (표지·기사 이미지). 공개 읽기 / 관리자만 업로드
-- 실행: SQL Editor 에서 Run (또는 대시보드 Storage에서 버킷 생성 후 정책만 실행)
-- ============================================================

-- 'media' 버킷 생성 (공개)
insert into storage.buckets (id, name, public)
values ('media', 'media', true)
on conflict (id) do nothing;

-- 공개 읽기
create policy "media public read"
  on storage.objects for select
  using (bucket_id = 'media');

-- 관리자만 업로드/수정/삭제
create policy "media admin insert"
  on storage.objects for insert
  with check (bucket_id = 'media' and public.is_admin());

create policy "media admin update"
  on storage.objects for update
  using (bucket_id = 'media' and public.is_admin());

create policy "media admin delete"
  on storage.objects for delete
  using (bucket_id = 'media' and public.is_admin());
