# AGENTS.md

## Goal
Codex 토큰 사용량과 불필요한 탐색을 최소화하면서 요청 범위만 정확하게 구현한다.

## Rule Scope
- 사용자 요청과 명시적인 승인을 최우선으로 한다.
- 프로젝트별 기술 스택, 명령, 배포 방식, 고유 규칙은 `project-context.md`를 기준으로 한다.
- 작업 유형별 세부 구현·검증 규칙은 해당 `SKILL.md`를 적용한다.
- 지시가 충돌하거나 제품 동작·데이터·비용·아키텍처에 영향을 주는 선택이 불명확하면 작업 전에 확인한다.

## Work Context
- 긴 대화는 제품 결정, 우선순위, 작업 이력(PM) 관리에 사용한다.
- 실제 구현은 기능·화면·오류 단위의 새 작업으로 분리한다.
- 작업 시작 시 `project-context.md`를 우선 확인한다.
- 프로젝트 전체를 다시 분석하지 않는다.
- 요청된 기능과 직접 관련된 파일만 확인한다.
- 기존 코드, 컴포넌트, Query, 패턴을 우선 재사용한다.
- 충분한 정보를 얻으면 탐색을 중단하고 구현한다.

## Execution Efficiency
- 화면별 작업마다 새로운 탐색을 반복하지 않고, 이미 확보한 맥락을 재사용한다. 추가 탐색과 전체 빌드는 작업 마지막에 필요한 경우 한 번만 실행한다.
- 기존 컴포넌트, API, 테스트를 최대한 재사용한다.
- UI의 단순 변경은 관련 항목을 묶어 한 번에 처리한다.

## Agent and Model Policy
- 일반 구현 작업은 `GPT-5.6 Terra`를 기본으로 사용한다.
- 단순·반복 수정, 문구·스타일·작은 파일 변경은 `GPT-5.6 Luna`를 우선 검토한다.
- `GPT-5.6 Sol`은 복잡한 설계, 해결이 어려운 오류, 높은 위험의 검토에만 사용한다.
- 병렬 에이전트는 독립적으로 진행 가능한 작업에 한해 필요할 때만 사용하며, 동시에 1~2개를 넘기지 않는다.
- 명시적으로 다른 모델·추론 수준이 필요한 근거가 없으면 프로젝트 기본값을 유지한다.

## Work Rules
- 요청받은 범위만 수정한다.
- 불필요한 리팩터링을 하지 않는다.
- 기존 프로젝트 구조와 네이밍을 유지한다.
- 새로운 라이브러리/패턴은 꼭 필요한 경우에만 추가한다.
- 현재 작업 트리의 관련 없는 사용자 변경을 보존한다.
- 공개 API, DB 스키마, 인증 동작, 배포 설정을 요청과 무관하게 변경하지 않는다.
- 설명보다 구현을 우선한다.
- 작업 완료 보고는 변경 파일과 핵심 변경사항만 짧게 작성한다.

## Security and Data Safety
- 환경별 값과 민감정보는 기존 환경변수·비밀 관리 방식을 사용하며 코드나 문서에 하드코딩하지 않는다.
- 실제 자격 증명, 토큰, 비밀키, 인증서, 개인정보를 커밋하거나 불필요하게 로그에 남기지 않는다.
- 데이터 삭제, 초기화, 파괴적 마이그레이션, 강제 재설정은 대상과 영향 범위를 확인하고 사용자 승인 후에만 수행한다.
- 테스트·빌드·배포 실패를 해결하기 위해 데이터를 삭제하거나 운영 설정을 임의로 약화하지 않는다.

## Test and Tool Policy
- 개발 중에는 변경 범위와 직접 관련된 테스트만 실행한다.
- 전체 테스트와 production build는 작업 마무리 단계에서 한 번 실행한다.
- 작업에 사용하지 않는 MCP·플러그인·외부 연결은 비활성화 상태로 유지한다.
- 외부 시스템 쓰기, 자격 증명, 유료 작업처럼 승인 경계가 있는 작업은 사용자 확인 후 진행한다.

## Skill Routing
- Frontend 기능·상태·라우팅·API 연동 → `frontend/SKILL.md`
- Frontend 디자인/UI 작업 → `frontend-design/SKILL.md`
- Backend 작업 → `backend/SKILL.md`
- Database·마이그레이션·Query 작업 → `database/SKILL.md`
- 인증·권한·비밀정보·보안 검토 → `security/SKILL.md`
- 테스트/검증 작업 → `testing/SKILL.md`
- 배포 전 검토 → `review/SKILL.md`
- 사용자가 `배포해줘`, `deploy 해줘`, `운영에 반영해줘`, `배포 진행해줘`라고 요청 → `deploy/SKILL.md`

## Deploy Pipeline
배포는 반드시 다음 순서로 수행한다.

`review → test/build → deploy → verification`

- Review가 `BLOCK`이면 배포 중단
- Test가 `FAIL`이면 배포 중단
- Build가 실패하면 배포 중단
- Deploy가 실패하면 즉시 중단하고 원인을 보고한다.

## Default Web Application Stack
새 웹 프로젝트에는 사용자가 명시적으로 변경을 승인하지 않는 한 다음 구성을 적용한다.

- Frontend: React, JavaScript, Vite, Tailwind CSS, shadcn/ui, Zustand, Axios, React Router
- Backend: Java 25, Spring Boot 4, Gradle, Spring MVC, Spring Security, JWT, Spring Data JPA, Hibernate
- Database: PostgreSQL and Flyway
- API: REST API and Swagger / OpenAPI
- Infrastructure: Docker, Docker Compose, Nginx, AWS EC2, AWS RDS PostgreSQL, Cloudflare
- CI/CD: GitHub and GitHub Actions
- Tests: JUnit 5, Mockito, Spring Boot Test, Vitest, Playwright

## Default Architecture
- 프론트엔드와 백엔드는 분리한다.
- 백엔드는 도메인 중심 패키지 구조를 사용하며 Controller는 HTTP 처리, Service는 비즈니스 로직, Repository는 영속성만 담당한다.
- 프론트엔드는 기능 중심 구조를 사용하고, Axios 설정/API 모듈을 중앙화한다.
- 환경별 설정은 환경변수로 관리하고, DB 스키마 변경은 Flyway migration으로 버전 관리한다.
- 인증·권한·소유권 검증은 반드시 백엔드에서 강제한다. 프론트엔드의 보호 라우트는 UX 목적일 뿐 보안 경계가 아니다.

## Default Verification
- Backend 변경은 관련 테스트와 Gradle build를 실행한다.
- Frontend 변경은 관련 테스트, 설정된 lint, Vite production build를 실행한다.
- 인증·권한·DB·컨테이너 변경은 각각 허용/거부 경로, migration, Docker build와 환경변수를 검증한다.
- 완료 전 변경 파일을 검토하고, 실행하지 못한 검증은 명확히 보고한다.
