---
name: frontend-design
description: Design and improve React user interfaces, including Tailwind and shadcn/ui styling, responsive layouts, accessibility, and visual QA.
---

# Frontend Design Skill

## Goal
기능만 동작하는 개발자 화면이 아니라 실제 서비스에 배포 가능한 수준의 UI/UX를 구현한다.
획일적인 SaaS Dashboard 스타일을 강제하지 않고 서비스 목적, 업종, 사용자, 기존 디자인 언어를 따른다.

## Confirmed Technology Baseline

Use Tailwind CSS and shadcn/ui for the default component system. Do not add MUI, Ant Design, Bootstrap, or another UI framework unless the user explicitly requests it.


## Explore
1. `project-context.md`
2. 수정 대상 화면
3. 유사 화면 1~2개
4. 필요한 공통 컴포넌트

충분한 정보를 얻으면 탐색을 중단한다.

### 금지
- 프로젝트 전체 UI 구조 분석
- 전체 CSS 분석
- 모든 페이지/컴포넌트 검사
- 디자인 시스템 전체 재정의

## Existing Design First
- 기존 색상, typography, spacing, radius, border, layout을 우선한다.
- 기존 Button, Input, Select, Modal, Table, Card, Form을 우선 재사용한다.
- 새 패턴은 기존 컴포넌트로 해결하기 어려운 경우에만 추가한다.

## Information Hierarchy
`Page Title → 설명/상태 → Primary CTA → 핵심 콘텐츠 → Secondary Action → 부가 정보`

size, weight, spacing, alignment, contrast로 중요도를 구분한다.

## Spacing / Typography
- 프로젝트 기존 규칙 우선
- 규칙이 없으면 spacing: `4 / 8 / 12 / 16 / 24 / 32 / 48`
- 임의 margin 및 정렬 hack 남발 금지
- Page title / Section title / Body / Label / Helper / Caption을 구분

## CTA
- Primary CTA는 가능하면 화면당 하나
- Secondary Action은 시각적으로 약하게
- 삭제/탈퇴/초기화 등 파괴적 작업은 구분하고 필요 시 확인 단계 제공

## Visual Style
과도하게 사용하지 않는다:
- gradient
- shadow
- card
- border radius
- animation
- icon
- background decoration

모든 콘텐츠를 Card로 감싸지 않는다.
Shadow보다 spacing / border / background contrast를 우선한다.

## Layout
- Flexbox / CSS Grid 우선
- absolute/fixed positioning, pixel 기반 정렬, margin hack은 필요한 경우에만 사용

## Form UX
- 명확한 label / 필수값 표시
- placeholder를 label 대용으로 사용하지 않음
- 적절한 input type
- field 근처 validation
- 오류 시 입력값 유지
- 제출 중 중복 클릭 방지
- 긴 Form은 의미 단위로 분리

## Table UX
- 중요한 컬럼 우선
- action 영역 일관성
- 긴 텍스트 / sorting / filtering / pagination 고려
- Empty State 제공
- 모바일에서 모든 컬럼을 억지로 표시하지 않음
- 필요 시 중요 컬럼만 노출 / horizontal scroll / detail view 사용

## UI States
수정 화면에서 필요한 상태를 처리한다.
- Loading
- Empty
- Error
- Success

## Responsive
최소 viewport:
- Mobile: 375px
- Tablet: 768px
- Desktop: 1440px

기존 breakpoint가 있으면 재사용한다.
모바일 overflow와 touch target을 확인하고 Desktop에서는 의미 없이 전체 폭을 채우지 않는다.

## Accessibility
- semantic HTML
- 실제 `button`
- Form label 연결
- keyboard navigation
- focus 표시
- 충분한 contrast
- image alt
- icon-only button accessible label
- 색상만으로 상태 표현 금지
- Modal focus / ESC / dialog semantics 고려

## Visual QA
구현 후 수정한 화면만 375 / 768 / 1440에서 확인한다.
- layout / overflow
- spacing / alignment / typography
- Button / Input
- Form validation
- Table / Modal
- loading / empty / error / success

전체 프로젝트 Visual QA는 하지 않는다.

## Completion
- 기존 디자인 언어 유지
- 공통 컴포넌트 재사용
- 정보 계층 명확
- spacing/typography 일관
- 필요한 상태 처리
- 반응형/접근성 확인
- 수정 화면 Visual QA 완료

완료 보고는 변경 파일과 핵심 변경만 짧게 작성한다.
