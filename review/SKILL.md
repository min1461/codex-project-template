---
name: review
description: 현재 변경사항의 production 배포 가능 여부를 실제 위험 중심으로 판정한다. 배포 전 검토 또는 명시적인 코드 리뷰 요청에 사용한다.
---

# Review

## 범위와 우선순위
현재 변경 파일, 직접 호출되는 코드, 판단에 필요한 공통 코드만 검토한다.

`BLOCK 가능성 → 운영 영향 → 보안·데이터 영향 → Warning` 순으로 확인하고 충분한 근거가 생기면 종료한다.

## 판정
다음과 같이 실제 발생 가능성과 영향이 높은 문제는 `BLOCK`한다.

- syntax/compile/runtime 오류
- import/dependency/config 누락
- API contract 또는 인증·권한 오류
- 현실적인 injection, secret 노출, path traversal 등 보안 취약점
- 잘못된 UPDATE/DELETE/JOIN/transaction/migration으로 인한 데이터 손실·오염
- production build 실패나 서비스 장애 가능성

명명, 작은 중복·성능·UI 문제, 구조 개선 가능성은 `WARNING`으로 분류한다. 더 좋은 추상화가 있다는 이유나 이론적 가능성만으로 BLOCK하지 않으며 Warning 때문에 범위를 넓히거나 대규모 리팩터링하지 않는다.

## 결과
- `PASS`
- `PASS WITH WARNING`
- `BLOCK`

결과와 실제 blocking 항목, 중요한 warning만 간단히 보고한다. `BLOCK`이면 배포하지 않는다.
