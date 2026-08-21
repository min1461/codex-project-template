---
name: backend
description: 기존 프로젝트 구조와 계약을 유지하며 API, 서비스, 데이터 접근, DB 변경을 최소 범위로 구현한다. Backend 또는 DB 작업에 사용한다.
---

# Backend

## 탐색
`project-context.md → 대상 API → Service → Repository/Mapper → Model → 유사 구현 1~2개` 순서로 필요한 파일만 확인한다.

## 구현
- 현재 계층 구조, 공통 응답, HTTP status, 예외 처리, transaction 방식을 유지한다.
- 입력의 required/null/empty, 길이·범위·형식, code, 존재 여부, 관계·중복을 검증한다.
- 로그인, 역할, 소유·조직 관계를 서버에서 검증하고 클라이언트의 권한 값을 신뢰하지 않는다.
- nullable 조회/집계/외부 응답과 빈 문자열·Collection의 의미를 기존 계약에 맞춘다.
- 여러 변경이 한 업무 단위이면 필요한 범위에 transaction을 적용한다.
- DB 변경은 `기존 column/query 활용 → 최소 query 수정 → schema 변경` 순으로 선택한다.
- Query의 JOIN/NULL/중복 row/order/pagination/N+1과 대량 데이터 위험을 변경 범위에서 확인한다.
- parameter binding을 사용하고 secret 하드코딩, 민감정보 로그/응답, injection, path traversal, 위험한 upload와 mass assignment를 막는다.

Schema 변경 시 NOT NULL, DEFAULT, INDEX, FK, migration, 기존 데이터 및 하위 호환성을 확인한다.

## 테이블 명명
새 테이블은 프로젝트 규칙을 우선한다. 별도 규칙이 없으면 논리명 `TB_{업무}_{대상}`을 사용한다. PostgreSQL 물리명은 따옴표 없는 소문자를 사용한다. 기존 테이블은 명명 통일만을 위해 변경하지 않는다.

## 검증
변경된 Service/API/Repository와 핵심 흐름 `입력 → 검증 → 업무 로직 → DB → 응답`을 검증한다. 세부 선택과 결과 형식은 `testing/SKILL.md`를 따른다.
