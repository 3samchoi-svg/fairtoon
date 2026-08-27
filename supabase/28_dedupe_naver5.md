-- 네이버 중복 5쌍 정리 — 표기만 다른 같은 작품이 두 번 들어가 있던 것을 한 편으로 합친다.
-- 남기는 쪽: 명작 큐레이션에 들어 있는 정식 제목. 지우는 쪽: 시즌 표기가 붙은 중복 행.
-- 지우기 전에 중복 제목을 별칭(aliases)에 넣어, '마음의소리'처럼 붙여 쓴 검색어로도 계속 찾히게 한다.
-- 링크는 works 삭제 시 자동으로 함께 지워진다(on delete cascade).
-- 실행: SQL Editor 에서 Run. 여러 번 실행해도 안전하다.

-- 1) 남기는 쪽에 별칭 추가
update public.works w
   set aliases = (
     select array_agg(distinct a)
       from unnest(coalesce(w.aliases,'{}'::text[]) || array[v.alias]) a
   )
  from (values
    ('마음의 소리',   '마음의소리'),
    ('데드데이즈',    '데드데이즈(DEAD DAYS)'),
    ('송곳',         '송곳 1~3부'),
    ('하이브',       '하이브 1~2'),
    ('심연의 하늘',   '심연의 하늘 시즌 1~3')
  ) as v(keep, alias)
 where w.title_ko = v.keep;

-- 2) 중복 행 삭제 (링크는 cascade 로 함께 삭제된다)
delete from public.works
 where title_ko in (
   '마음의소리',
   '데드데이즈(DEAD DAYS)',
   '송곳 1~3부',
   '하이브 1~2',
   '심연의 하늘 시즌 1~3'
 );

-- 확인용 — 작품 수가 12,859 이면 정상
select count(*) as works from public.works;
select title_ko, aliases from public.works
 where title_ko in ('마음의 소리','데드데이즈','송곳','하이브','심연의 하늘')
 order by title_ko;
