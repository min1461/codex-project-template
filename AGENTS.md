# AGENTS.md

## 기본 원칙
- 작업 시작 시 `project-context.md`에서 관련 항목만 확인한다.
- 요청과 직접 관련된 파일 및 유사 구현 1~2개만 탐색하고, 패턴을 파악하면 구현한다.
- 기존 구조, 네이밍, 컴포넌트, Query를 우선 재사용한다.
- 요청 범위 밖의 리팩터링·일괄 포맷 변경·새 라이브러리 도입을 피한다.
- 변경 후 영향 범위에 맞는 최소 검증을 수행한다.
- 완료 시 변경 파일, 핵심 변경, 검증 결과만 간단히 보고한다.

## 작업별 지침
필요한 작업의 지침만 읽는다.

- UI/UX 구현: `frontend-design/SKILL.md`
- Backend 구현: `backend/SKILL.md`
- 테스트/검증: `testing/SKILL.md`
- 배포 가능 여부 검토: `review/SKILL.md`
- 명시적인 배포 요청: `deploy/SKILL.md`

Frontend와 Backend가 함께 변경되면 두 지침을 적용한다. 일반 구현 중에는 `review`와 `deploy`를 미리 읽지 않는다.

## 배포
사용자가 명시적으로 배포를 요청한 경우에만 `deploy/SKILL.md`를 따르며, Git commit/push/merge/tag는 별도 요청이나 프로젝트 규칙이 있을 때만 수행한다.
