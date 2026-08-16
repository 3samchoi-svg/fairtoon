# Edge Functions — 배포·운영 안내


## sync-serial · 연재작 동기화


### 무엇을 하는가

매일 3사 요일연재 목록을 읽어 ⓐ DB에 없는 신작을 추가하고 ⓑ 완결로 바뀐 작품의 상태를 고친다. `scripts/sync_serial.py` 와 같은 로직이며, 사람이 클릭하지 않아도 도는 형태다.


### 왜 함수인가 — 키를 GitHub에 두지 않기 위해

DB 전권 키(`service_role`)는 Supabase 안에만 둔다. GitHub Actions는 이 함수 하나를 부를 수 있는 토큰(`SYNC_TOKEN`)만 갖는다. 토큰이 새더라도 피해는 '작품 추가·상태 변경'을 넘지 못한다.

전권 키를 GitHub Secrets에 넣는 방식(C안)은 배제했다 — 결정 배경은 `docs/progress.md` 2026-08-13~15 6절.


### 자동화하지 않는 것 — 카카오웹툰 완결 전환

카카오웹툰은 연재/완결 상태를 API로 주지 않는다. 회차 목록 최신 항목의 `(완결)` 표기를 봐야 하고, 그건 브라우저 렌더가 필요해 Edge Function 런타임에서 할 수 없다.

그래서 함수는 **후보 제목만 응답에 담고 건드리지 않는다**(`kakaowebtoon_needs_manual_check`). 실제 전환은 사람이 아래를 돌린다.

```
python3 scripts/sync_serial.py --out supabase/NN_serial_sync.sql --sort-base 7300
```

확인할 수 없는 것을 추측으로 바꾸지 않는다. 카탈로그에 조용히 쌓이는 오류가 가장 비싸다.


### 배포 (대표님 · 최초 1회)

Supabase CLI가 필요하다. 프로젝트 참조는 `wrvllrxwgautewttvffe`.

```bash
# 1) CLI 설치·로그인 (브라우저가 열린다)
brew install supabase/tap/supabase
supabase login

# 2) 프로젝트 연결
cd <프로젝트 루트>
supabase link --project-ref wrvllrxwgautewttvffe

# 3) 호출 토큰 만들기 — 아무 긴 임의 문자열이면 된다. 이 값을 GitHub에도 넣는다.
openssl rand -hex 32          # 출력값을 복사해 둔다

# 4) 함수에 토큰 심기
supabase secrets set SYNC_TOKEN=<복사한 값>

# 5) 배포
supabase functions deploy sync-serial --no-verify-jwt
```

`--no-verify-jwt` 는 Supabase 로그인 토큰 대신 우리가 만든 `SYNC_TOKEN` 으로 인증하기 때문에 붙인다. 인증이 없는 것이 아니다 — 함수 첫 줄에서 토큰을 검사한다.

`SUPABASE_URL` 과 `SUPABASE_SERVICE_ROLE_KEY` 는 Supabase가 함수 환경에 자동으로 넣어 주므로 따로 설정하지 않는다.


### GitHub 쪽 설정 (대표님 · 최초 1회)

리포 Settings → Secrets and variables → Actions → New repository secret

| 이름 | 값 |
|------|-----|
| `SUPABASE_SYNC_TOKEN` | 위 3)에서 만든 값 |

이걸 넣지 않으면 워크플로가 "토큰 없음"으로 즉시 실패한다. **전권 키는 넣지 않는다.**


### 먼저 확인만 해 보기 (쓰기 없음)

`dry=1` 을 붙이면 무엇이 추가·변경될지만 돌려주고 DB는 건드리지 않는다. 배포 직후 한 번 이렇게 확인하는 것을 권한다.

```bash
curl -s "https://wrvllrxwgautewttvffe.supabase.co/functions/v1/sync-serial?dry=1" \
  -H "x-sync-token: <토큰>" | head -40
```

정상이면 이런 모양이 나온다. 검증 통과 상태(2026-08-16)에서는 `new_works` 가 0, `finished_applied` 가 0이다.

```json
{
 "dry_run": true,
 "db_before": { "works": 4504, "serial": 2074 },
 "live": { "naver": 746, "kakaowebtoon": 181, "kakaopage": 1494 },
 "new_works": 0,
 "adult_skipped": 191,
 "finished_candidates": 30,
 "finished_applied": 0,
 "kakaowebtoon_needs_manual_check": ["검술명가 막내아들", "..."]
}
```


### 실행 주기

`.github/workflows/sync-serial.yml` 이 매일 07:20(KST)에 부른다. 인기 순위 갱신(07:00)보다 20분 뒤다 — 순위에 새로 오른 작품이 그날 안에 카탈로그에 들어오게 하려는 순서다.

Actions 탭의 "Run workflow"로 손수 돌릴 수도 있다. 워크플로 로그에 함수 응답이 그대로 찍히므로 무엇이 추가됐는지 확인할 수 있다.


### 문제가 생기면

| 증상 | 원인 |
|------|------|
| `401 unauthorized` | GitHub Secret과 `supabase secrets` 의 토큰이 다르다 |
| `new_works` 가 비정상으로 큼 | 플랫폼 API 응답 형식이 바뀌었을 수 있다. `dry=1` 로 목록을 먼저 본다 |
| 함수 시간 초과 | 카카오페이지 목록이 크게 늘어난 경우. 요일 탭을 나눠 도는 방식으로 바꾼다 |
| 완결이 잘못 바뀜 | 되돌리기: `update public.works set status='연재' where id in (...)` |
