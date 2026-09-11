# Project Context

> Codex는 이 문서를 프로젝트 구조 파악의 우선 기준으로 사용한다.
> 특별한 이유가 없으면 프로젝트 전체를 다시 탐색하지 않는다.

## Project
- 유형: `<platform / customer-site / general>`
- 목적: `<프로젝트 목적>`
- 주요 기능: `<핵심 기능 요약>`
- 서비스 URL: `<URL>`

> `profiles/`의 해당 유형 문서를 복사해 시작할 수 있다. 이 파일의 실제 기술 스택과 명령이 공통 Skill의 예시보다 우선한다.

## Start Checklist
- 프로젝트 유형: `<platform / customer-site / general>`
- Frontend / Backend / Database 사용 여부와 실제 기술: `<확정 전에는 미확정>`
- 패키지 관리자·빌드 도구·실행 환경: `<확정 전에는 미확정>`
- 개발·테스트·production build 명령: `<확정 전에는 미확정>`
- 배포 대상·production branch·health check: `<확정 전에는 미확정>`

위 항목을 실제 값으로 확정하기 전에는 코드 구현이나 환경설정을 시작하지 않는다. 사용하지 않는 영역은 `없음`으로 명시한다.

## Codex Skills
- 전역 동기화: `<미확인 / 하지 않음 / 선택 동기화>`
- 이 프로젝트에서 사용할 스킬: `<frontend, testing 등 / 없음>`
- 선택 근거: `<기술 스택 및 작업 범위>`

새 프로젝트·템플릿 적용 시에는 다른 설정 전에 이 항목을 먼저 사용자와 확인한다. 전역으로 설치되어 있더라도 여기에 없는 스킬 규칙을 이 프로젝트에 자동 적용하지 않는다.

## Frontend
- Framework: `<예: Next.js / React / 없음>`
- Language: `<예: TypeScript / JavaScript / 없음>`
- UI: `<라이브러리 또는 없음>`
- State: `<상태 관리 방식 또는 없음>`
- Package Manager: `<예: npm / pnpm / yarn / 없음>`

## Backend
- Framework: `<예: Spring Boot / Node.js / 없음>`
- Language: `<예: Java / TypeScript / 없음>`
- Runtime: `<예: JVM / Node.js / 없음>`
- Build Tool: `<예: Gradle / Maven / npm / 없음>`

## Database
- DBMS: `<예: PostgreSQL / MySQL / 없음>`
- ORM / Mapper: `<사용 도구 또는 없음>`
- Migration: `<사용 도구 또는 없음>`

## Directory Structure
```text
/
├─ <frontend>/      # <설명>
├─ <backend>/       # <설명>
├─ <components>/    # <설명>
├─ <api>/           # <설명>
├─ <config>/        # <설명>
└─ <deploy>/        # <설명>
```

## Authentication
- 방식: `<예: 세션 / JWT / OAuth / 없음>`
- 인증 처리 위치: `<구현 위치 또는 없음>`
- 권한 처리: `<권한 정책 또는 없음>`

## Static File Exposure
- 기본 정책: `<기본 차단 / 공개 허용 목록 방식>`
- 공개 경로: `<예: /assets/**, /favicon.ico, /robots.txt>`
- 차단 경로 및 파일: `<예: .env, .git/**, application-*.yml, 백업·로그·업로드 원본>`
- 적용 위치: `<Nginx / CDN / Spring Security / 정적 파일 서버>`
- 검증: `차단 대상은 403 또는 404를 반환하고, 공개 허용 경로만 정상 응답한다.`

정적 파일·디렉터리는 공개 필요성이 명확한 경로만 허용한다. 소스, 설정, 비밀정보, 백업, 로그, 내부 업로드 원본은 웹 경로로 노출하지 않는다.

## API Rules
- Base URL: `/api`
- 응답 형식: `<공통 응답 구조>`
- 에러 형식: `<에러 응답 구조>`
- Naming: `<camelCase / snake_case>`
- 기타 규칙: `<필요한 규칙>`

## Shared Components
- `<컴포넌트명>` — `<경로>` — `<용도>`
- `<컴포넌트명>` — `<경로>` — `<용도>`

새 구현 전에 기존 공통 컴포넌트를 우선 확인하고 재사용한다.

## Environment Variables
```text
<PUBLIC_VALUE>=브라우저에 노출되어도 되는 값
<SECRET_VALUE>=서버 또는 CI/CD secret에만 저장하는 값
```

- 로컬 설정 파일: `<.env.local 등>`
- Production 설정 위치: `<설명>`
- 실제 비밀값은 커밋하지 않고 `.env.example`에는 변수 이름과 설명만 남긴다.
- 브라우저 공개 환경변수의 접두사는 사용 프레임워크 규칙을 따른다. 예: Next.js는 `NEXT_PUBLIC_`, Vite는 `VITE_`이며 어느 경우에도 비밀값을 사용하지 않는다.

## Commands

### Development
```bash
<개발 실행 명령>
```

### Test
```bash
<테스트 명령>
```

### Production Build
```bash
<production build 명령>
```

## Production
- Branch: `<예: main>`
- 배포 방식: `<예: Docker / 정적 호스팅 / 서버리스 / 없음>`

### Deploy
```bash
<배포 명령>
```

### Health Check
```text
<https://example.com/health>
```

## Architecture Rules
- 기존 코드/컴포넌트를 우선 재사용한다.
- 요청 범위 밖의 코드는 수정하지 않는다.
- 필요 없는 리팩터링을 하지 않는다.
- 기존 디렉터리 구조와 네이밍 규칙을 유지한다.
- API/DB 변경 시 기존 호환성을 우선한다.
- 새로운 라이브러리는 필요한 경우에만 추가한다.
- `<프로젝트 고유 아키텍처 규칙>`
- `<프로젝트 고유 금지 사항>`
- 기본 스택을 대체하는 프레임워크, DB, 빌드 도구, 클라우드 공급자는 명확한 이유와 사용자 승인 없이 도입하지 않는다.
- 정적 파일 공개는 `Static File Exposure`의 공개 경로만 허용하며, 민감 파일 또는 내부 디렉터리를 정적 경로에 매핑하지 않는다.
