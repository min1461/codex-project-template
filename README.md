# Codex Project Template

홈페이지 개발 프로젝트에서 Codex가 매 작업마다 프로젝트 전체를 다시 분석하지 않고,
필요한 범위와 필요한 Skill만 확인하도록 구성한 템플릿입니다.

## Structure

```text
/
├─ .codex/
│  └─ config.toml          # 기본 모델·하위 에이전트 설정
├─ AGENTS.md               # 작업·모델·검증 운영 원칙
├─ project-context.md
├─ frontend-design/
│  └─ SKILL.md
├─ backend/
│  └─ SKILL.md
├─ testing/
│  └─ SKILL.md
├─ review/
│  └─ SKILL.md
└─ deploy/
   └─ SKILL.md
```

## Usage

새 프로젝트를 시작할 때 이 저장소를 복사한 뒤 `project-context.md`의 실제 값만 채웁니다.

반드시 프로젝트별로 확인할 항목:

- Frontend / Backend 기술 스택
- Database
- 주요 디렉터리
- 인증 방식
- API 규칙
- 환경변수
- 개발/테스트/build 명령
- production branch
- 배포 방식/명령
- health check URL
- 프로젝트 고유 아키텍처 규칙

`AGENTS.md`는 가능한 한 짧게 유지하고,
세부 규칙은 각 `SKILL.md`에 둡니다.

## Token-Efficient Workflow

- 긴 대화는 PM·결정 기록 용도로만 사용하고, 실제 구현은 기능 또는 화면 단위의 새 작업으로 분리합니다.
- 일반 작업은 `GPT-5.6 Terra`, 단순·반복 수정은 `GPT-5.6 Luna`를 사용합니다.
- `GPT-5.6 Sol`은 복잡한 설계나 해결하기 어려운 오류에만 사용합니다.
- 병렬 에이전트는 독립 작업일 때만 1~2개로 제한합니다.
- 개발 중에는 관련 테스트만 실행하고, 전체 테스트와 production build는 마무리 단계에 한 번 실행합니다.
- 사용하지 않는 MCP·플러그인·외부 연결은 Codex 설정에서 비활성화합니다.

`.codex/config.toml`은 새 작업과 하위 에이전트의 기본값을 `GPT-5.6 Terra · Medium · 일반 속도`로 설정합니다.
단순 작업에서 Luna를 쓰려면 작업 생성 또는 에이전트 호출 시 모델을 명시적으로 지정합니다.

## Skill Routing

- Frontend/UI → `frontend-design/SKILL.md`
- Backend → `backend/SKILL.md`
- Test → `testing/SKILL.md`
- Pre-deploy Review → `review/SKILL.md`
- Deploy → `deploy/SKILL.md`

## Deployment Gate

배포 순서:

`review → test → production build → deploy → verification`

- Review `BLOCK` → 중단
- Test `FAIL` → 중단
- Build 실패 → 중단
- Deploy 실패 → 중단
