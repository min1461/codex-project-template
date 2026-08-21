# Project Context

> 프로젝트별 값만 기록한다. 일반 작업 원칙은 `AGENTS.md`와 각 `SKILL.md`에 둔다. 해당 없는 항목은 삭제한다.

## Project
- 목적: `<프로젝트 목적>`
- 주요 기능: `<핵심 기능>`
- 서비스 URL: `<URL>`

## Stack
- Frontend: `<framework / language / UI / state / package manager>`
- Backend: `<framework / language / runtime / build tool>`
- Database: `<DBMS / ORM 또는 Mapper / migration>`

## Key Paths
- `<path>` — `<용도>`
- `<path>` — `<용도>`
- 공통 UI: `<path>`
- 인증/권한: `<path와 방식>`
- API/예외 공통 처리: `<path>`

## Conventions
- API base/응답/에러: `<규칙>`
- Naming: `<규칙>`
- 프로젝트 고유 규칙: `<규칙>`
- 금지 사항: `<규칙>`

## Commands
```bash
# development
<command>

# targeted test
<command>

# full test (필요한 경우)
<command>

# production build
<command>
```

## Production
- Branch: `<branch>`
- Deploy 방식: `<Jenkins / GitHub Actions / Docker / SSH / ...>`
- Deploy 명령 또는 workflow: `<command 또는 경로>`
- Health check: `<URL 또는 명령>`
- Runtime/Build JVM 등 주의사항: `<예: 운영 Java 8, 빌드 Java 17>`

## Environment
- 로컬 설정: `<경로>`
- 운영 설정: `<경로 또는 관리 방식>`
- 필수 변수 이름: `<SECRET 값이 아닌 변수명만>`
