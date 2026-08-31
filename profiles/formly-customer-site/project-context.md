# Formly Customer Site Context

## Project
- 유형: `customer-site`
- 목적: 고객의 고유 도메인에서 직접 열리는 공개 홈페이지를 제공한다.
- 서비스 URL: `<customer domain>`

## Technology
- Frontend: `Next.js + TypeScript`
- Rendering: 정적 빌드를 기본으로 하며, 동적 기능은 필요한 경우에만 Formly API를 사용한다.

## Environment Boundary
- 사이트 ID, 사이트 원본 URL, 공개 API URL, 공개 기능 설정만 빌드 환경에 둔다.
- OpenAI, 결제, DB, Storage 관리자 키, 배포 토큰을 포함하지 않는다.
- 고객별 콘텐츠, 템플릿, 도메인, 기능 설정은 운영 플랫폼 데이터에서 관리한다.

## Deployment
- 고객별로 독립된 배포 결과물과 고객 도메인/SSL을 가진다.
- 운영 플랫폼 화면으로 리다이렉트하지 않는다.
- 배포된 기본 콘텐츠는 운영 플랫폼 API 장애와 무관하게 표시되어야 한다.
