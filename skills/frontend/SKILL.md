---
name: frontend
description: Implement and review React frontend behavior, including components, routing, state, API integration, forms, and frontend tests.
---

# Frontend Engineering Skill

## Goal
기존 프론트엔드 구조와 사용자 흐름을 유지하면서 화면 동작, 상태, 라우팅, API 연동을 최소 범위로 구현한다.

## Confirmed Technology Baseline

Use React, JavaScript, Vite, React Router, Zustand, Axios, Tailwind CSS, shadcn/ui, Vitest, and Playwright. Do not convert the project to TypeScript without explicit user approval.


## Explore
`project-context.md → 대상 화면/Route → 관련 Component → API Client → State/Store → 관련 Test → 유사 구현 1~2개 → 구현`

- 요청 기능과 직접 관련된 파일만 확인한다.
- 화면별로 같은 탐색을 반복하지 않고 이미 확인한 구조와 패턴을 재사용한다.
- 프레임워크, 라우터, 상태 관리, 스타일링, 테스트 도구는 현재 프로젝트 구성을 우선한다.

## Component and State
- Component는 한 가지 역할에 집중하고, 기존 공통 Component·Hook·Utility를 우선 사용한다.
- 화면 안에서만 쓰는 UI state는 local state로 유지한다.
- 여러 화면이나 기능에서 실제로 공유되는 state만 기존 전역 state 방식으로 관리한다.
- 단순한 UI 변경은 관련 항목을 묶어 일관되게 처리한다.
- 요청과 무관한 Component 분리, 구조 재편, 상태 관리 전환은 하지 않는다.

## API Integration
- 기존 API Client, interceptor, error 처리, 환경변수 구성을 재사용한다.
- Component 안에 raw API URL이나 환경별 값을 흩어 놓지 않는다.
- 기존 응답 타입·에러 형식·인증 처리 규칙을 유지한다.
- 데이터 기반 UI에서는 필요한 범위에서 loading, empty, validation error, server error, authorization error 상태를 처리한다.

## Routing and Forms
- 기존 Route 정의, Layout, Guard, 권한 처리 패턴을 유지한다.
- 클라이언트 Route 보호만으로 권한을 보장한다고 가정하지 않는다.
- Form은 필수값과 형식을 기존 방식으로 검증하고, 오류를 필드 근처에 표시한다.
- 요청 중 중복 제출을 막고 실패 시 사용자가 입력한 값을 불필요하게 잃지 않게 한다.

## Verification
- 기존 관련 Component·Unit·E2E 테스트를 우선 재사용한다.
- 인증, 보호 Route, 핵심 CRUD 흐름처럼 위험이 큰 변경은 성공과 주요 실패 경로를 확인한다.
- UI 표현 변경은 `frontend-design/SKILL.md`의 화면별 Visual QA 범위에 따라 확인한다.
- 필요한 lint, type check, production build는 작업 마지막에 한 번만 실행한다.

## Completion Report
변경 파일, 재사용한 기존 패턴, 실행한 검증 결과만 짧게 보고한다.
