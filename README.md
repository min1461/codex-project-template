# Codex Project Template

홈페이지 개발 프로젝트에서 Codex가 매 작업마다 프로젝트 전체를 다시 분석하지 않고,
필요한 범위와 필요한 Skill만 확인하도록 구성한 템플릿입니다.

## Structure

```text
/
├─ .codex/
│  └─ config.toml          # 기본 모델·하위 에이전트 설정
├─ .githooks/
│  └─ post-merge           # git pull 후 전역 스킬 자동 동기화
├─ AGENTS.md               # 작업·모델·검증 운영 원칙
├─ project-context.md
├─ profiles/
│  ├─ formly-platform/      # 주문·AI·CMS·배포 관리 플랫폼 예시
│  └─ formly-customer-site/ # 고객 도메인에 독립 배포하는 사이트 예시
├─ sync-skills.ps1
├─ enable-auto-sync.ps1
└─ skills/
   ├─ frontend/
   │  └─ SKILL.md
   ├─ frontend-design/
   │  └─ SKILL.md
   ├─ backend/
   │  └─ SKILL.md
   ├─ database/
   │  └─ SKILL.md
   ├─ security/
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

Formly처럼 운영 플랫폼과 고객 사이트의 배포 경계가 다른 경우에는 `profiles/`에서 맞는 유형을 골라 해당 `project-context.md`와 `.env.example`를 프로젝트에 복사한 뒤 실제 값으로 채웁니다. 프로필의 값은 출발점이며, 실제 프로젝트의 기존 설정이 우선입니다.

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

환경변수에는 실제 키나 비밀번호를 넣지 않습니다. `.env.example`에는 변수 이름과 용도만 기록하고, 비밀값은 로컬 환경 또는 CI/CD Secret에 저장합니다.
- 프로젝트 고유 아키텍처 규칙

`AGENTS.md`는 가능한 한 짧게 유지하고,
세부 규칙은 각 `SKILL.md`에 둡니다.

## Sync Global Codex Skills

CPT의 skills/를 각 PC의 전역 Codex 스킬 폴더에 반영하려면, git pull 후 저장소 루트에서 실행합니다.

    .\sync-skills.ps1

기본 대상은 현재 Windows 사용자의 C:\Users\<사용자>\.codex\skills입니다. 따라서 데스크톱과 노트북에서 같은 명령을 실행해도 각자의 Codex 홈으로 동기화됩니다.

대상을 명시하거나 변경 예정만 확인하려면 다음을 사용합니다.

    .\sync-skills.ps1 -CodexHome 'C:\Users\kai\.codex'
    .\sync-skills.ps1 -WhatIf

템플릿에 있는 스킬 파일은 갱신하지만, 템플릿에 없는 전역 스킬은 삭제하지 않습니다.

## Automatically Sync Skills After Git Pull

자동 동기화는 PC별로 한 번만 설정합니다. 저장소 루트에서 다음을 실행하면 현재 클론에만 `post-merge` Git hook을 연결하고, 즉시 스킬도 한 번 동기화합니다.

    .\enable-auto-sync.ps1

그 뒤부터는 아래 명령만으로 CPT와 전역 Codex 스킬이 함께 최신화됩니다.

    git pull

Git 보안 정책상 새 PC에서 `git pull`만으로 hook을 자동 활성화할 수는 없습니다. 따라서 데스크톱과 노트북에서 각각 한 번씩 `.\enable-auto-sync.ps1`를 실행해야 합니다.

변경 예정만 확인하려면 다음을 사용합니다.

    .\enable-auto-sync.ps1 -WhatIf

## Rule Ownership

- `AGENTS.md`: 모든 작업에 적용하는 최소 범위, 안전, 검증, 스킬 라우팅 규칙
- `project-context.md`: 프로젝트별 실제 기술 스택, 명령, 구조, 배포 정보, 고유 규칙
- 각 `SKILL.md`: Frontend, UI, Backend, Database, Security, Test, Review, Deploy의 작업별 세부 규칙
- `.codex/config.toml`: 새 작업과 하위 에이전트의 기본 모델·추론 수준

프로젝트가 특정 기술 스택으로 고정되어 있다면 해당 사실은 범용 `AGENTS.md`가 아니라
`project-context.md`와 관련 `SKILL.md`에 기록합니다.

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

- Frontend 기능·상태·라우팅·API 연동 → `skills/frontend/SKILL.md`
- Frontend/UI → `skills/frontend-design/SKILL.md`
- Backend → `skills/backend/SKILL.md`
- Database·Migration·Query → `skills/database/SKILL.md`
- Security·인증·권한 → `skills/security/SKILL.md`
- Test → `skills/testing/SKILL.md`
- Pre-deploy Review → `skills/review/SKILL.md`
- Deploy → `skills/deploy/SKILL.md`

## Deployment Gate

배포 순서:

`review → test → production build → deploy → verification`

- Review `BLOCK` → 중단
- Test `FAIL` → 중단
- Build 실패 → 중단
- Deploy 실패 → 중단
