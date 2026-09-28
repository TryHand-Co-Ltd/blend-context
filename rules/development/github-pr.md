# GitHub pull requests

Source: [Github-PRの作成](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/Github-PR%E3%81%AE%E4%BD%9C%E6%88%90?version=22), version 22. Compared live on 2026-09-09; source updated 2026-05-21T06:41:54Z. See [source audit](../evidence/2026-09-09-wiki-source-audit.md) for interpretation and coverage limits.

## Title

- Write the PR title concisely in Japanese.
- Reuse the Epic title by default. If not, name the feature and the concrete change so the title stands alone.
- Include the school name for school-specific work.
- Include `staging-new` when that is the destination.
- End with the Epic key, such as `ALREADY-41083` or `NWF-...`.

Preferred shape:

```text
【<destination>】<school when applicable> <Epic title> [<Epic key>]
```

## Description

- Link the Epic. Link a Backlogitem only when it is genuinely the relevant work item; create the required ticket if none exists.
- Summarize what the PR changes.
- Screenshots are recommended in the PR when appearance changes. Separately, before/after screenshots are required unit-test evidence for layout changes by [unit-testing.md](unit-testing.md).
- State every release-time action: manual SQL, DDL migration filename, batch command, CRON configuration, or other operation.

## SQL and migration classification

### Migration

Place SQL that everyone must apply under:

```text
application/migration/YYYY/YYYYmmdd_<table>.sql
```

Use one file by default. Include DDL and shared master-data changes. Add the `SQL` label and list the migration filename in the PR.

### Manual SQL

Put release-time DML in the description and add the `手動SQL` label.

## Labels

| Label | Apply when |
|---|---|
| `手動SQL` | Release requires configuration/DML executed manually |
| `SQL` | Schema/migration file must be run by release staff |
| `成績保守` | Grade-related customization maintenance |
| `運用保守` | Non-custom feature addition or maintenance |
| `release` | The release decision maker has approved release |
| `QA完了` | QA is complete; release decision maker applies it |
| `CRON設定` | `application/config/cron_blend.conf` requires a command/schedule change |
| `バッチ実行` | Release requires a batch command |

Set reviewer and assignee as the task/team requires. Confirm the reviewer rather than guessing.

For release-note entries, mark the corresponding `手動SQL`, `SQL`, and `バッチ実行` columns with `◯` when required. Reviewer/assignee selection is optional in the Wiki unless the task/team requires it. The release operator handles the SQL-channel notification; do not assume that role automatically.
