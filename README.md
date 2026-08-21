# Codex Project Template

홈페이지 개발 프로젝트에서 Codex가 매 작업마다 프로젝트 전체를 다시 분석하지 않고,
필요한 범위와 필요한 Skill만 확인하도록 구성한 템플릿입니다.

## Structure

```text
/
├─ AGENTS.md
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
