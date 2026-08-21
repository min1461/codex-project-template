---
name: frontend-design
description: 기존 디자인 언어를 유지하며 실제 서비스 수준의 UI/UX를 구현한다. 화면, 컴포넌트, 스타일, 반응형, 접근성 변경에 사용한다.
---

# Frontend Design

## 탐색
`project-context.md → 수정 화면 → 유사 화면 1~2개 → 필요한 공통 컴포넌트` 순서로 확인한다. 전체 UI/CSS나 모든 페이지를 분석하지 않는다.

## 구현
- 기존 색상, typography, spacing, breakpoint와 Button/Input/Select/Modal/Table/Form을 우선 재사용한다.
- 정보 계층을 `제목·상태 → 주요 행동 → 핵심 콘텐츠 → 보조 정보` 순으로 명확히 한다.
- Primary CTA는 가능한 한 화면당 하나로 두고 파괴적 행동을 구분한다.
- Flex/Grid를 우선하고 absolute/fixed, 임의 margin, pixel 정렬 hack은 필요한 경우에만 사용한다.
- 과도한 card, shadow, gradient, radius, animation, 장식용 icon을 피한다.
- Form은 label, 필수값, 인접 validation, 입력값 유지, 중복 제출 방지를 처리한다.
- Table은 핵심 컬럼, 긴 텍스트, 정렬/검색/페이지 처리와 모바일 표현 방식을 고려한다.
- 변경 기능에 필요한 loading/empty/error/success 상태를 처리한다.
- semantic HTML, keyboard/focus, contrast, label/alt/accessibile name을 지킨다.

프로젝트 기준이 없을 때만 spacing `4/8/12/16/24/32/48`, viewport `375/768/1440`을 기준으로 삼는다.

## 검증
수정한 화면만 기존 breakpoint 또는 375/768/1440에서 확인한다. layout/overflow, 주요 상태, Form/Table/Modal, keyboard/focus를 점검하고 결과는 `testing/SKILL.md` 형식으로 보고한다.
