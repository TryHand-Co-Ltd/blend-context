# Implementation rules

Source: [実装ルール](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E5%AE%9F%E8%A3%85%E3%83%AB%E3%83%BC%E3%83%AB?version=2), version 2. Compared live on 2026-09-09; source updated 2026-01-07T05:40:45Z. See [source audit](../evidence/2026-09-09-wiki-source-audit.md) for interpretation and coverage limits.

## Mandatory boundaries

- Prevent teachers from reading, updating, or deleting another school's data. Compare the record's `school_id` with `$this->login_data['school_id']`.
- Prevent students and guardians from reading, updating, or deleting another person's data. Compare the record's `student_id` with `$this->login_data['student_id']`.
- Apply these checks before protected data is exposed or mutated, including indirect lookups and batch operations. The Wiki explicitly permits fetching one record by its primary ID and then checking school/year/owner in the controller. Do not flag an ID-only lookup without tracing those checks. Do not remove an existing sound SQL scope just to follow this example.
- Produce no PHP warning or notice. Keep error reporting enabled during development so violations remain visible.
- Avoid N+1 queries.

## Required companion references

Read `implementation-notes.md`, `coding-conventions.md`, `security.md`, and `shared-development.md` for implementation and review; add `database-rules.md` and `model-rules.md` for data access, `view-rules.md` for views, and `school-specific-rules.md` for school customization. Ignore legacy rules explicitly marked as obsolete in the source Wiki.

## Review questions

1. Can changing a request ID cross a school, year, student, guardian, or permission boundary?
2. Do controller/service checks or query constraints protect the data before display and before UPDATE/DELETE, including every relevant caller?
3. Can any input or missing data generate a warning or notice?
4. Does any loop issue a query per item?
