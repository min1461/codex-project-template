---
name: backend
description: Implement and review Java Spring Boot backend work, including REST APIs, services, persistence, validation, and backend tests.
---

# Backend Skill

## Goal
기존 프로젝트 구조와 구현 방식을 유지하면서 안전하고 최소 범위로 백엔드 기능을 구현한다.

## Confirmed Technology Baseline

Use Java 25, Spring Boot 4, Gradle, Spring MVC, Spring Security, Spring Data JPA, Hibernate, PostgreSQL, JWT, and Swagger/OpenAPI. Do not replace this stack without explicit user approval.


## Explore
`project-context.md → 대상 API → Service → Repository/Mapper → 관련 Model → 유사 구현 1~2개 → 구현`

- 요청 기능과 직접 관련된 파일만 확인한다.
- 관련 없는 Controller/Service/Repository/DB 전체 탐색을 하지 않는다.
- 충분한 패턴을 확인하면 탐색을 중단한다.

## Architecture
- Controller / Service / Repository 또는 현재 프로젝트 계층 구조를 유지한다.
- 새 Layer, 패키지 재구성, 새로운 Architecture를 임의로 도입하지 않는다.

## API Response
- 기존 공통 응답 구조를 재사용한다.
- 새로운 response wrapper를 임의로 만들지 않는다.
- 기존 HTTP status / error 규칙을 유지한다.

## Exception
- 기존 Exception / Global Handler / Error Code 방식을 유지한다.
- 공통 예외 처리를 우회하는 반복 try/catch를 만들지 않는다.
- 기존 타입으로 표현 가능한 경우 새 Exception을 만들지 않는다.

## Validation
외부 입력을 신뢰하지 않는다.
- required / null / empty
- length / range / format
- enum / code
- ID 존재 여부
- 데이터 관계 / 중복

DTO validation과 business validation을 구분하고 기존 방식을 우선한다.

## Authentication / Authorization
필요한 범위에서 확인한다.
- 로그인 여부
- 역할
- 리소스 접근 권한
- 수정/삭제 권한
- 조직/소유 관계

클라이언트의 userId / role / ownerId / permission을 그대로 신뢰하지 않는다.

## Null
조회 결과, nullable column, Optional, 빈 Collection, 외부 API 응답, aggregate 결과를 명확히 처리한다.
null / 빈 문자열 / 빈 List 의미는 기존 API 규칙을 따른다.

## Transaction
여러 DB 변경이 하나의 업무 단위이면 transaction을 확인한다.
중간 실패 시 일부 데이터만 저장되지 않도록 하고 기존 transaction 방식을 사용한다.
범위를 필요 이상 넓히지 않는다.

## Database
DB 변경 최소화 우선순위:
`기존 Column → 기존 Query 최소 수정 → 기존 Table → 필요한 경우에만 Schema 변경`

테이블 명명 규칙:
- 논리 테이블명은 대문자 스네이크 케이스 `TB_{업무영역}_{대상}` 형식을 사용한다.
- `TB`는 테이블 고정 접두어이며, 업무영역과 대상 약어는 프로젝트에서 정한 의미를 일관되게 재사용한다.
- 공통 약어 예시: `COM`(공통), `USER`(유저·회원·관리자), `CD`(코드), `INFO`(정보), `ROLE`(권한).
- 예시: `TB_COM_CD`, `TB_USER_INFO`, `TB_USER_ROLE`.
- PostgreSQL에서는 따옴표 없는 식별자가 소문자로 저장되므로 물리명과 SQL에는 `tb_com_cd`, `tb_user_info`, `tb_user_role`처럼 소문자를 사용하고, 대문자 보존을 위한 quoted identifier는 사용하지 않는다.
- 같은 의미의 약어를 우선 재사용하고, 필요한 의미를 표현할 수 없을 때만 새 약어를 추가한다.
- 기존 테이블은 이 규칙을 맞추기 위한 목적으로만 이름을 변경하지 않는다.

Schema 변경 시 NOT NULL / DEFAULT / INDEX / FK / migration / backward compatibility를 확인한다.

## Query / Repository
우선순위:
`기존 Query 재사용 → 기존 Query 최소 수정 → 기존 Repository method 활용 → 새 Query`

JOIN, NULL, 중복 row, pagination, ordering, N+1, 대량 데이터 위험을 필요한 범위에서 확인한다.
요청과 무관한 최적화는 하지 않는다.

## Duplicate Implementation
Service / Utility / Validator / Repository / Mapper / Response / Exception에 기존 로직이 있는지 대상 범위에서 확인하고 재사용한다.
재사용을 위한 대규모 공통화는 하지 않는다.

## Security
명백한 문제를 방지한다.
- SQL Injection
- 인증/권한 우회
- 민감정보 응답/로그
- secret 하드코딩
- path traversal
- 위험한 파일 업로드
- mass assignment

Parameter binding을 사용한다.

## Refactoring
요청 기능 구현에 필요한 최소 변경만 수행한다.
관련 없는 Controller/Service/DTO/Repository/패키지 리팩터링 및 스타일 일괄 변경 금지.

## Completion Report
변경 파일과 주요 변경사항만 짧게 보고한다.
