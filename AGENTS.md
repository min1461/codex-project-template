# AGENTS.md

## Goal
Codex 토큰 사용량과 불필요한 탐색을 최소화하면서 요청 범위만 정확하게 구현한다.

## Context
- 작업 시작 시 `project-context.md`를 우선 확인한다.
- 프로젝트 전체를 다시 분석하지 않는다.
- 요청된 기능과 직접 관련된 파일만 확인한다.
- 기존 코드, 컴포넌트, Query, 패턴을 우선 재사용한다.
- 충분한 정보를 얻으면 탐색을 중단하고 구현한다.

## Work Rules
- 요청받은 범위만 수정한다.
- 불필요한 리팩터링을 하지 않는다.
- 기존 프로젝트 구조와 네이밍을 유지한다.
- 새로운 라이브러리/패턴은 꼭 필요한 경우에만 추가한다.
- 설명보다 구현을 우선한다.
- 작업 완료 보고는 변경 파일과 핵심 변경사항만 짧게 작성한다.

## Skill Routing
- Frontend 디자인/UI 작업 → `frontend-design/SKILL.md`
- Backend 작업 → `backend/SKILL.md`
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
