---
name: security
description: Implement and review Spring Security, JWT authentication, authorization, secrets, input validation, CORS, CSRF, and application security risks.
---

# Security Skill

## Goal
현재 인증·권한·입력 검증·비밀정보 관리 방식을 유지하면서 현실적인 보안 위험을 필요한 범위에서 예방하고 검증한다.

## Confirmed Technology Baseline

Use Spring Security with verified JWT access and refresh tokens. Hash passwords with BCrypt or an approved Spring Security encoder, keep refresh tokens revocable, and avoid long-lived sensitive token storage in localStorage.


## Scope
다음 작업에 적용한다.

- 로그인, 로그아웃, 세션, token, password, OAuth 등 인증 변경
- role, permission, ownership, 조직 범위 등 권한 변경
- CORS, CSRF, 보안 header, 민감 API, 파일 업로드, 외부 입력 처리
- secret, 환경변수, 로그, 개인정보, 보안 취약점 검토

`project-context.md → 관련 인증/권한 설정 → 대상 API/화면 → 유사 구현 → 관련 Test → 구현` 순서로 필요한 범위만 확인한다.

## Authentication and Authorization
- 인증과 권한 판단은 서버 또는 프로젝트의 신뢰 경계에서 수행한다. 클라이언트의 user ID, role, hidden field, URL parameter를 그대로 신뢰하지 않는다.
- 보호된 리소스는 인증된 주체, 필요한 role/permission, 소유권 또는 조직 범위를 확인한다.
- 기존 token/session 검증, password hashing, refresh/revocation, Route guard 방식을 우선 재사용한다.
- 클라이언트의 화면 숨김이나 Route 보호는 UX 보조 수단일 뿐 권한 검증을 대체하지 않는다.

## Input, Output, and Configuration
- 모든 외부 입력은 기존 validation 방식으로 형식, 범위, 허용값, 접근 권한을 검증한다.
- SQL/command/path/HTML 등 실행·표현 경계에는 기존 안전한 binding·encoding 방식을 사용한다.
- CORS, CSRF, cookie, security header 설정은 기존 배포 환경과 인증 방식에 맞춰 최소 범위로 변경한다.
- 비밀정보는 환경변수 또는 기존 secret 관리 방식으로만 다루며, 코드·문서·로그·테스트 fixture에 실제 값을 넣지 않는다.

## Logging and Data Protection
- password, token, authorization header, API key, private key, 불필요한 개인정보를 로그나 오류 응답에 남기지 않는다.
- 민감 응답은 필요한 필드만 노출하고 기존 응답·예외 형식을 유지한다.
- 보안 문제를 UI 숨김이나 클라이언트 검증만으로 우회하지 않는다.

## Verification
- 인증·권한 변경은 허용 경로와 거부 경로를 모두 확인한다.
- 필요한 범위에서 IDOR/BOLA, privilege escalation, missing authorization, injection, secret leakage, unsafe CORS/CSRF를 점검한다.
- 기존 관련 테스트를 우선 재사용하고, 실제 위험이 있는 경우에만 최소 테스트를 추가한다.

## Completion Report
확인한 보안 경계, 변경한 보호 방식, 실행한 검증 결과와 남은 위험만 짧게 보고한다.
