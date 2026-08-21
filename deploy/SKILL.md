---
name: deploy
description: 사용자가 배포, deploy, 운영 반영을 명시적으로 요청했을 때 기존 배포 방식을 이용해 검토부터 운영 확인까지 안전하게 수행한다.
---

# Deploy

명시적인 배포 요청에만 실행한다.

## Pipeline
1. 현재 변경사항 확인
2. `review/SKILL.md` 적용
3. `testing/SKILL.md`로 관련 테스트
4. `project-context.md`의 production build
5. 기존 방식으로 deploy
6. health/main page와 startup/runtime 치명 오류 확인

Gate:
- Review `BLOCK` → 중단
- Test `FAIL` → 중단
- Build 또는 Deploy 실패 → 중단

`project-context.md → 기존 deploy script/config → 기존 CI/CD` 순서로 실제 방식을 찾는다. 명령을 추측하거나 새 배포 방식을 만들지 않는다. 실패 시 위험한 우회나 반복 시도 없이 중단하고 원인을 요약한다.

배포 명령 성공만으로 완료하지 않는다. 가능한 범위에서 application/container/process, health endpoint, main page를 확인하되 전체 사이트나 전체 운영 로그는 탐색하지 않는다.

Git commit/push/merge/rebase/tag는 별도 요청이나 프로젝트 규칙이 있을 때만 수행한다.

## 보고
- Deployment: SUCCESS / FAILED
- Review: PASS / PASS WITH WARNING / BLOCK
- Test, Build, Deploy, Verification: SUCCESS / FAILED / NOT RUN

긴 로그 없이 실패 원인과 중요한 warning만 덧붙인다.
