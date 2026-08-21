# Codex Project Template

홈페이지 개발에서 Codex가 공통 규칙을 반복해서 읽거나 프로젝트 전체를 재탐색하지 않도록 구성한 템플릿입니다.

## 구성
- `AGENTS.md`: 모든 작업에 적용할 짧은 공통 원칙과 작업별 라우팅
- `project-context.md`: 기술 스택, 핵심 경로, 명령, 운영 환경 등 프로젝트별 사실
- `frontend-design/SKILL.md`: UI/UX 구현 기준
- `backend/SKILL.md`: API·Service·DB 구현 기준
- `testing/SKILL.md`: 변경 위험에 맞는 최소 검증
- `review/SKILL.md`: production 배포 가능 여부 판정
- `deploy/SKILL.md`: 명시적인 배포 요청에만 실행되는 배포 게이트

## 사용법
새 프로젝트에 복사한 뒤 `project-context.md`의 실제 값만 채웁니다. 해당 없는 항목은 삭제하고 secret 값은 기록하지 않습니다.

`AGENTS.md`에는 공통 작업 원칙만 유지하고, 프로젝트별 정보는 `project-context.md`, 작업별 세부 판단은 해당 `SKILL.md` 한곳에 둡니다. 동일한 규칙을 여러 파일에 반복하지 않습니다.

일반 구현에서는 관련 스킬만 읽습니다. `review`와 `deploy`는 코드 작성 때마다 불러오지 않고, 검토나 배포 요청이 있을 때만 적용합니다.

## 배포 게이트
명시적인 배포 요청 시 다음 순서로 진행합니다.

`review → targeted test → production build → deploy → verification`

Review가 `BLOCK`이거나 Test가 `FAIL`이면 배포하지 않습니다. Build 또는 Deploy 실패 시 즉시 중단합니다. Git commit/push/merge/tag는 별도 요청이나 프로젝트 규칙이 있을 때만 수행합니다.
