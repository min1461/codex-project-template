# Deploy Skill

## Trigger
사용자가 다음과 같이 명시적으로 배포를 요청한 경우 실행한다.
- 배포해줘
- deploy 해줘
- 운영에 반영해줘
- 배포 진행해줘

## Pipeline
반드시 다음 순서:
1. 현재 변경사항 확인
2. `review/SKILL.md`
3. 관련 테스트
4. production build
5. deploy
6. verification

순서를 생략하거나 변경하지 않는다.

## Review Gate
- PASS → 진행
- PASS WITH WARNING → Warning 기록 후 진행
- BLOCK → 즉시 배포 중단

## Test / Build Gate
- Test FAIL → 배포 중단
- Build FAIL → 배포 중단

## Deploy Method
`project-context.md`에 정의된 방식을 우선 사용한다.

기존 구성이 있으면 새 방식을 만들지 않고 재사용한다.
- deploy script
- Docker / Docker Compose
- CI/CD
- GitHub Actions
- Jenkins
- Vercel
- Netlify
- AWS
- SSH
- rsync

우선순위:
`project-context.md → 기존 deploy config/script → 기존 CI/CD`

배포 명령을 임의로 추측하지 않는다.

## Deploy Failure
Deploy 실패 시 즉시 중단하고 원인을 확인/요약한다.
production에서 위험한 우회 명령을 반복 시도하지 않는다.

## Verification
배포 명령 성공만으로 완료 판단하지 않는다.
가능한 범위에서 확인한다.
- 배포 성공 여부
- application/container/process running
- health endpoint
- main page
- startup/runtime critical error

전체 사이트나 전체 production log를 탐색하지 않는다.

## Rollback
의미 있는 배포 변경은 기존 배포 방식 안에서 실용적인 되돌리기 경로를 유지한다.

- 이전에 배포 가능한 이미지·버전·릴리스를 확인한다.
- DB 변경은 가능한 범위에서 이전 애플리케이션과의 호환성을 고려한다.
- 실패 시 임의의 파괴적 조치 대신 기존 배포 도구와 절차를 따른다.

## No Automatic Git Actions
다음은 사용자가 별도 요청하거나 프로젝트 규칙에 명시된 경우에만 수행한다.
- git commit
- git push
- merge
- rebase
- tag

## Stop Conditions
다음 중 하나라도 발생하면 배포를 중단한다.
- Review = BLOCK
- Test = FAIL
- Build = FAIL
- Deploy = FAIL

## Final Report
Deployment: SUCCESS / FAILED
Review: PASS / PASS WITH WARNING / BLOCK
Test: SUCCESS / FAILED / NOT RUN
Build: SUCCESS / FAILED / NOT RUN
Deploy: SUCCESS / FAILED / NOT RUN
Verification: SUCCESS / FAILED / NOT RUN

긴 로그는 출력하지 않고 실패 원인과 중요한 Warning만 요약한다.
