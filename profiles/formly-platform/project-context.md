# Formly Platform Context

## Project
- 유형: `platform`
- 목적: 주문, 견적, 결제, AI 콘텐츠 생성, CMS, 고객 사이트 배포를 관리한다.
- 서비스 URL: `<platform domain>`

## Technology
- Frontend: `Next.js + TypeScript`
- Backend: `Spring Boot + Java`
- Database: `PostgreSQL + Flyway`
- Cache: `Redis` (필요한 시점부터 사용)
- Storage: `S3 compatible object storage`

## Environment Boundary
- 공개 웹 설정은 `NEXT_PUBLIC_` 접두사를 사용하며 비밀값을 포함하지 않는다.
- OpenAI, 결제, DB, Redis, Storage 자격 증명은 서버 또는 CI/CD Secret에만 저장한다.
- 고객 사이트의 빌드 환경으로 운영 플랫폼 비밀값을 전달하지 않는다.

## Deployment
- 개발: 로컬 Docker Compose로 PostgreSQL과 필요한 의존 서비스를 실행한다.
- 운영: 개인 PC가 아닌 클라우드 환경에서 API와 데이터 서비스를 실행한다.
- 고객 사이트: 고객 도메인에 별도 배포한다.

## Required Decisions
- 결제 공급자와 웹훅 검증 방식
- 사이트 배포 공급자와 도메인/SSL 연결 방식
- 고객 데이터 백업·보존 정책
