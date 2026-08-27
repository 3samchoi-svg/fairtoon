-- ============================================================
-- Fairtoon · work_rankings 테이블 정리 (유물 제거)
-- 2026-08-16
--
--   왜 지우는가
--     인기 순위는 DB가 아니라 리포 파일에서 읽는다. 매일 07:00 GitHub Actions가
--     data/rankings.json 을 갱신하고, index.html 은 그 파일만 읽는다.
--     14번 SQL로 만든 이 테이블은 그 결정 이전의 것으로, 지금은 아무도 읽지 않는다.
--
--   확인한 것
--     · index.html 에 work_rankings 참조 없음 (리포 전체에서 14번 SQL 파일에만 등장)
--     · 남아 있는 데이터는 2026-08-12 기준 스냅샷 — 이미 나흘 지난 값이다
--
--   ※ 되돌릴 수 없다. 테이블과 그 안의 데이터가 사라진다.
--     다시 필요해지면 supabase/14_rankings.sql 의 create 문으로 되살릴 수 있다.
--     대표님 승인 없이는 실행하지 않는다.
-- ============================================================


-- 실행 전 확인 — 무엇이 지워지는지 먼저 본다
select platform_key, count(*) as rows, min(fetched_on) as oldest, max(fetched_on) as newest
  from public.work_rankings
 group by platform_key
 order by platform_key;


-- 2026-08-27 · 대표님이 08-21에 이 파일을 실행하셨으나, 아래 한 줄이 주석 처리돼 있어
-- 위의 select 만 돌고 테이블은 그대로 남았다(90행, 2026-08-12 스냅샷). 이제 주석을 풀어 둔다.
-- 이 파일을 Run 하면 work_rankings 테이블이 실제로 사라진다.
-- 리포 전체(index.html · Edge Function · 수집 스크립트 · 워크플로)에 참조가 없음을 재확인했다.
drop table if exists public.work_rankings;
