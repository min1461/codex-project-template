# Database Skill

## Goal
기존 스키마, 명명 규칙, 마이그레이션 방식, ORM/Query 패턴을 유지하면서 데이터 무결성과 호환성을 해치지 않는 최소 변경을 수행한다.

## Explore
`project-context.md → 관련 Schema/Migration → Entity/Model → Repository/Mapper → 관련 Query → 영향받는 Test → 구현`

- 기존 스키마와 관련 파일만 확인한다.
- 프로젝트 전체 테이블, 모든 마이그레이션, 전체 Query를 탐색하지 않는다.
- 테이블·컬럼명, ID, timestamp, enum, soft delete 등은 기존 프로젝트 규칙을 우선한다.

## Schema and Migration
- 제약 조건, foreign key, unique, nullability, default, index는 데이터 무결성과 실제 조회 패턴에 맞게 검토한다.
- 스키마 변경은 프로젝트의 버전 관리된 migration 도구와 기존 흐름을 사용한다.
- 운영 테이블을 수동으로 변경하거나 자동 스키마 변경에 의존하지 않는다.
- 기존 테이블이나 컬럼을 규칙 통일만을 목적으로 이름 변경하지 않는다.
- 새 migration은 가능한 범위에서 기존 애플리케이션·데이터와의 호환성 및 되돌리기 영향을 검토한다.

## Query and Persistence
- 기존 Repository/Mapper/ORM 방식과 parameter binding을 재사용한다.
- 새 Query 전에는 기존 Query·method의 재사용 또는 최소 수정을 우선 검토한다.
- 필요한 범위에서 join, nullable 값, 중복 row, ordering, pagination, N+1, 조회량을 확인한다.
- `SELECT *`, 문자열 결합 SQL, 요청과 무관한 대규모 최적화는 피한다.

## Safety
- DROP, TRUNCATE, mass DELETE/UPDATE, 데이터 초기화, 파괴적 migration은 실행 전에 정확한 대상과 영향 범위를 확인한다.
- 운영·공유 데이터에 영향을 주는 파괴적 작업은 사용자 명시 승인 없이는 실행하지 않는다.
- 테스트·빌드 실패를 해결하기 위해 데이터를 삭제하거나 스키마를 임의로 재설정하지 않는다.

## Verification
- 변경한 migration의 적용 가능 여부와 직접 영향받는 persistence·service 흐름을 확인한다.
- 관련 테스트가 있으면 우선 재사용하고, 데이터 무결성이나 회귀 위험이 실제로 있을 때만 새 테스트를 추가한다.
- 전체 DB 또는 전체 테스트 실행은 영향 범위가 넓거나 프로젝트 정책상 필요한 경우에만 작업 마지막에 실행한다.

## Completion Report
변경한 schema/query/migration, 호환성 고려 사항, 실행한 검증 결과만 짧게 보고한다.
