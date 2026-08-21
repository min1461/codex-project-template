# Project Context

> Codex는 이 문서를 프로젝트 구조 파악의 우선 기준으로 사용한다.
> 특별한 이유가 없으면 프로젝트 전체를 다시 탐색하지 않는다.

## Project
- 목적: `<프로젝트 목적>`
- 주요 기능: `<핵심 기능 요약>`
- 서비스 URL: `<URL>`

## Frontend
- Framework: `<React / Vue / Next.js / ...>`
- Language: `<TypeScript / JavaScript>`
- UI: `<Tailwind / MUI / Bootstrap / ...>`
- State: `<Zustand / Redux / Pinia / ...>`
- Package Manager: `<npm / pnpm / yarn>`

## Backend
- Framework: `<Spring Boot / NestJS / Express / ...>`
- Language: `<Java / Kotlin / TypeScript / ...>`
- Runtime: `<Java 17 / Node 22 / ...>`
- Build Tool: `<Gradle / Maven / ...>`

## Database
- DBMS: `<PostgreSQL / MySQL / Oracle / ...>`
- ORM / Mapper: `<JPA / MyBatis / Prisma / ...>`
- Migration: `<Flyway / Liquibase / ...>`

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
- 방식: `<Session / JWT / OAuth2 / ...>`
- 인증 처리 위치: `<경로>`
- 권한 처리: `<설명>`

## API Rules
- Base URL: `<예: /api>`
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
<ENV_NAME>=<description>
<ENV_NAME>=<description>
```

- 로컬 설정 파일: `<.env.local 등>`
- Production 설정 위치: `<설명>`

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
- Branch: `<main / master / production / ...>`
- 배포 방식: `<Docker / Jenkins / GitHub Actions / SSH / ...>`

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
