# Testing Skill

## Goal
전체 테스트를 습관적으로 실행하지 않고 변경 범위와 실제 위험에 맞는 최소 검증을 수행한다.

배포 전 최종 결과는 반드시:
- `PASS`
- `FAIL`

`FAIL`이면 배포하지 않는다.

## Scope
`변경 파일 → 직접 연결된 기능 → 기존 관련 테스트 → 필요한 최소 검증`

현재 변경과 관계없는 테스트는 실행하지 않는다.

## Existing Tests First
- 기존 관련 테스트를 우선 재사용한다.
- 새 테스트는 실제 가치가 있을 때만 추가한다.
- 중요 business logic, 회귀 버그, 인증/권한, 데이터 변경, 복잡한 분기, 핵심 사용자 흐름에 우선한다.
- 단순 getter/mapping/framework 동작을 위한 의미 없는 테스트는 추가하지 않는다.

## Test Selection
Frontend UI:
- 관련 component test
- 필요한 경우 lint
- 수정 화면 Visual QA

Frontend Logic:
- 관련 unit/component test
- 필요한 경우 type check / lint

Backend:
- 관련 Service / Controller/API / Repository test

DB/Query:
- 관련 Repository/Mapper test
- Query 실행 가능 여부
- 관련 Service 흐름

Shared/Common:
- 영향 범위가 넓으면 필요한 만큼 테스트 범위를 확대

## Core User Flow
핵심 사용자 흐름을 우선 검증한다.

`입력 → Validation → API → Business Logic → DB → Response`

## Full Suite
다음 경우에만 고려한다.
- 공통 모듈
- infrastructure
- dependency/build config
- 대규모 refactor
- 영향 범위를 특정하기 어려움
- 프로젝트 정책상 필수

'혹시 모르니까' 전체 suite를 실행하지 않는다.

## Failure
`실패 테스트 → 실패 메시지 → 관련 변경 파일 → 직접 연결된 코드`

원인을 확인하고 관련 부분만 수정한다.
실패와 무관한 코드는 건드리지 않는다.

## Never Weaken Tests
테스트 통과를 위해:
- 테스트 삭제
- assertion 삭제/완화
- skip/주석 처리
- expected 임의 변경
을 하지 않는다.

## Mock
외부 API/메일/결제/클라우드/시간 의존성 등 필요한 곳에만 사용한다.
내부 계층 전체를 mock하여 실제 동작을 전혀 검증하지 않는 테스트를 피한다.

## Token Rules
현재 변경 파일, 직접 관련 테스트, 실행 명령, 필요한 설정만 확인한다.
전체 test 디렉터리/build script/dependency를 탐색하지 않는다.

## Result
PASS:
- 관련 테스트 통과
- 필요한 lint/type check 통과
- 핵심 흐름에 명백한 문제 없음
- 테스트를 약화하지 않음

FAIL:
- 관련 테스트/compile/type check/핵심 흐름 실패
- 변경으로 회귀 발생
- 배포 위험 확인

## Completion Report
실행한 테스트와 결과만 간단히 보고한다.
