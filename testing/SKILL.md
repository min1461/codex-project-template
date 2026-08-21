---
name: testing
description: 변경 범위와 위험에 맞는 최소 테스트, 빌드, lint, type check 또는 화면 검증을 선택하고 실행한다. 검증 요청이나 배포 파이프라인에서 사용한다.
---

# Testing

## 범위 선택
`변경 파일 → 직접 연결된 기능 → 기존 관련 테스트 → 필요한 최소 검증` 순서로 선택한다.

- UI: 관련 component test와 수정 화면 Visual QA
- Frontend logic: 관련 unit/component test, 필요한 type check/lint
- Backend: 관련 Service/Controller/API/Repository test
- DB/Query: 관련 Repository/Mapper test, Query 실행 가능 여부, Service 흐름
- 공통 모듈·인프라·dependency/build 설정·대규모 변경·영향 불명확: 필요 시 전체 suite

단순 getter, framework 동작 등 가치가 낮은 테스트는 추가하지 않는다. 전체 suite는 정책상 필요하거나 영향 범위를 좁힐 수 없을 때만 실행한다.

## 원칙
- 기존 관련 테스트를 우선 재사용한다.
- 업무 규칙, 회귀 버그, 인증/권한, 데이터 변경, 복잡한 분기와 핵심 사용자 흐름을 우선한다.
- 실패 원인은 메시지와 직접 연결된 변경부터 추적한다.
- 통과를 위해 테스트/assertion을 삭제·완화하거나 skip하지 않는다.
- 외부 서비스와 시간 의존성 등 필요한 경계만 mock한다.

## 결과
- `PASS`: 선택한 검증이 통과하고 변경 범위에 명백한 문제가 없음
- `FAIL`: 관련 test/compile/type check/핵심 흐름 실패 또는 회귀 확인

실행한 명령·검증과 결과만 간단히 보고한다. `FAIL`이면 배포하지 않는다.
