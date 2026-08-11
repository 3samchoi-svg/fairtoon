# Fairtoon 백엔드(Supabase) 셋업 가이드 — P0


이 문서는 지호님(또는 계정 소유자)이 **한 번만** 따라 하면 되는 절차입니다. 클상무(PM)가 준비한 SQL을 실행하고, 키를 전달하면 이후 단계(P1~)는 PM이 이어받습니다.


## 0. 준비물

- 이메일 계정 (Supabase 가입용) — 지호님 계정 권장
- 관리자로 초대할 팀원들의 이메일


## 1. Supabase 프로젝트 생성

1. https://supabase.com 접속 → **Start your project** → 로그인/가입.
2. **New project** 클릭.
   - Name: `fairtoon`
   - Database Password: 강한 비밀번호 생성 후 **안전한 곳에 보관**(분실 시 재설정).
   - Region: `Northeast Asia (Seoul)` 또는 `(Tokyo)` 권장(한국 사용자 지연 최소).
   - Plan: **Free**.
3. 생성까지 1~2분 대기.


## 2. 스키마·보안·저장소 SQL 실행 (순서 중요)

좌측 메뉴 **SQL Editor** → **New query** 에 아래 파일 내용을 차례로 붙여넣고 각각 **Run**.

1. `supabase/01_schema.sql`  (테이블 생성)
2. `supabase/02_rls.sql`     (보안 정책)
3. `supabase/03_storage.sql` (이미지 버킷)

> 오류 없이 "Success"가 뜨면 정상. 순서를 지켜 실행하세요(01 → 02 → 03).


## 3. 관리자 로그인 방식 설정 (팀원 여러 명)

1. 좌측 **Authentication** → **Providers** → **Email** 활성화 확인.
2. (권장) **Authentication → Sign In / Providers**에서 신규 가입(Sign-ups)을 막고, 관리자만 **초대**로 추가:
   - **Authentication → Users → Invite user** 로 팀원 이메일 초대(각자 이메일에서 비밀번호 설정).
3. 초대·가입한 각 관리자를 `admins` 테이블에 등록해야 쓰기 권한이 생깁니다.
   - **Authentication → Users**에서 각 사용자의 **User UID** 복사.
   - **SQL Editor**에서 실행(사람마다 1줄):
     ```sql
     insert into public.admins (user_id, email, role)
     values ('여기에-User-UID', '이메일', 'owner');
     ```
   - 첫 사람은 `owner`, 나머지는 `editor`로 넣으면 됩니다.


## 4. 연결 키 확인 후 PM에게 전달

좌측 **Project Settings → API** 에서 아래 2가지를 복사해 클상무에게 전달해 주세요:

- **Project URL** (예: `https://xxxx.supabase.co`)
- **anon public** key (공개 키 — 프론트에 넣어도 되는 키. 쓰기는 RLS가 막습니다.)

> ⚠️ **service_role** 키는 절대 공유·프론트 노출 금지(전체 권한). 대시보드에서만 사용.


## 5. (선택) 휴면 방지

무료 프로젝트는 장기 미사용 시 일시정지될 수 있습니다. 출시 후 트래픽이 적은 초기에는 무료 크론(예: cron-job.org)으로 하루 1회 프로젝트에 가벼운 요청을 보내 깨어 있게 할 수 있습니다. 필요 시 PM이 설정 안내드립니다.


---

## 이후 단계 (PM 담당)

- **P1:** 현재 사이트의 콘텐츠(작품 12편·아티클 6편·플랫폼·안전카드)를 이 DB로 이관(seed).
- **P2:** 프론트 화면이 이 DB에서 읽어 표시하도록 재구성.
- **P3:** 관리자(/admin) 화면 구축.
- **P4:** 작품 150~300편·아티클 채우고 출시.

Project URL + anon key를 전달해 주시면 P1로 넘어갑니다.
