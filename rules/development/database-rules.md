# Database rules

Source: [データベースルール](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9%E3%83%AB%E3%83%BC%E3%83%AB?version=2), version 2. Compared live on 2026-09-09; source updated 2026-01-09T03:31:53Z. See [source audit](../evidence/2026-09-09-wiki-source-audit.md) for interpretation and coverage limits.

Use MySQL 8/Aurora 3 behavior as the baseline.

## DDL contract

- Define primary-key `id` columns as `BIGINT`. The Wiki's sample uses `BIGINT UNSIGNED`; use that for compatible new tables while matching related IDs. The prose mandates BIGINT, not a blanket signedness conversion of existing tables. Do not specify integer display widths such as `INT(11)`. The Wiki also predicts a MySQL 9 error; that future-version statement was not independently verified and is not needed to enforce the no-width rule.
- Set new tables to `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci`.
- Configure character set and collation at table level in migration files. Discuss genuine feature-specific exceptions separately.
- Keep database/PHP connection character-set configuration aligned with `utf8mb4` when changing those settings.
- Do not specify `ROW_FORMAT` per table. The database default is `DYNAMIC`; do not add `COMPRESSED` without a separately approved need.
- Do not add foreign-key constraints in BLEND. Maintain relationships in the application and documentation.
- Add comments to every table and every column, including obvious identifiers such as `teacher_id`.

## Indexes and keys

- Add only indexes justified by real query patterns and execution plans.
- Avoid unnecessary single-column indexes.
- Name new non-unique indexes `idx_<table>_<sequence>`, for example `idx_students_01`.
- Name unique keys `uk_<table>_<sequence>`. Maintain independent sequences for `idx` and `uk`.
- Confirm the actual generated query uses the intended index.

## Schema consistency

- Do not use SQL reserved words as identifiers. Check with:

```sql
SELECT WORD
FROM INFORMATION_SCHEMA.KEYWORDS
WHERE RESERVED = 1;
```

- Use the same type for the same concept across tables. If a field changes meaning—such as storing multiple comma-separated values—rename it rather than silently changing its type.
- Preserve conceptual, logical, and physical ER documentation for development work.
- Consider performance degradation over time, not only current staging volume.
- Prefer CodeIgniter Query Builder/Active Record for safe, portable database access; still inspect generated SQL and execution plans.

## Complete example

```sql
CREATE TABLE `admission_applicants` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Applicant ID',
	`school_id` BIGINT UNSIGNED NOT NULL COMMENT 'School ID',
	`status` VARCHAR(32) NOT NULL COMMENT 'Application status',
	PRIMARY KEY (`id`),
	KEY `idx_admission_applicants_01` (`school_id`, `status`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_general_ci
  COMMENT='Admission applicants';
```

This example intentionally contains no foreign key.

## Read-replica and authorization

Read [model-rules.md](model-rules.md) for replica switching, transactions, cleanup, and read-after-write behavior. An ID-only query is allowed when the required authorization checks occur before protected use; see [implementation-rules.md](implementation-rules.md). Do not confuse query construction with authorization correctness.
