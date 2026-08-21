# Review Skill

## Goal
완벽한 코드 리뷰나 리팩터링이 아니라 현재 변경사항이 production에 배포 가능한지 판단한다.

## Scope
1. 현재 변경 파일
2. 변경 코드가 직접 사용하는 파일
3. 반드시 필요한 공통 코드

프로젝트 전체를 탐색하지 않는다.
충분한 판단 근거가 있으면 검토를 종료한다.

## Priority
`BLOCK 가능성 → Production 영향 → Security/Data 영향 → Warning`

Warning을 찾기 위해 탐색 범위를 넓히지 않는다.

## Blocking
다음은 BLOCK 후보:
- syntax / compile 오류
- 높은 확률의 runtime 오류
- 잘못된 import / dependency
- 필수 환경변수/config 누락
- 명백한 API contract 오류
- 인증 / 권한 문제
- 현실적인 보안 취약점
- 데이터 손실/오염 가능성
- production build 실패 가능성
- 서비스 장애 가능성이 높은 문제

이론적인 가능성만으로 BLOCK하지 않는다.

## API / Auth / Security
변경 범위에서 확인한다.
- endpoint/method/request/response 호환
- 권한 검증
- 인증 우회
- SQL/command injection
- secret/password 노출
- path traversal
- 위험한 upload/request

## Data Safety
필요한 범위에서 확인한다.
- UPDATE/DELETE 조건
- 잘못된 JOIN
- transaction
- migration
- nullable/default
- 기존 데이터 호환

## Warning
배포를 직접 막지 않는 문제:
- minor UI
- naming
- 중복 코드
- 작은 성능 문제
- 구조 개선 가능성
- 불필요한 코드

Warning은 배포 중단 사유가 아니다.

## No Refactor for Warning
Warning 때문에 대규모 리팩터링을 하지 않는다.
현재 배포에 직접 필요한 작은 수정만 허용한다.

## Avoid False Blocking
더 좋은 이름/추상화/Architecture가 있다는 이유로 BLOCK하지 않는다.
BLOCK은 실제 production 위험이 높은 경우에만 사용한다.

## Result
반드시 다음 중 하나:
- PASS
- PASS WITH WARNING
- BLOCK

`BLOCK → 배포 중단`

## Completion Report
결과와 Blocking/중요 Warning만 짧게 보고한다.
