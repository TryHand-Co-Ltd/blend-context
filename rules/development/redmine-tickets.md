# Redmine ticket rules

Source: [Redmineのチケット作成ルールについて](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/Redmine%E3%81%AE%E3%83%81%E3%82%B1%E3%83%83%E3%83%88%E4%BD%9C%E6%88%90%E3%83%AB%E3%83%BC%E3%83%AB%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6?version=21), version 21. Compared live on 2026-09-09; source updated 2026-01-28T04:27:17Z. See [source audit](../evidence/2026-09-09-wiki-source-audit.md) for interpretation and coverage limits.

## Hierarchy

```text
Epic
└── Backlogitem (SE / Development / QA)
    └── Subtask (investigation / implementation / unit test / PR review)
```

## Epic

Use the Epic for project scope, response policy, target school, schedule, and the current consolidated implementation direction.

Required fields include assignee SE, JIRA project, responsible department, school (`【BLEND全体】` for all schools), detailed status, start date, due/release date, initial estimate, and actual Story Points. Use `4 hours = 1 SP`.

Keep the description current. Link specifications stored in shared spreadsheets or documents.

## Backlogitems

- **SE** — Record SE work and place SE subtasks beneath it. Fill SP, start date, initial estimate, and due date.
- **Development** — Create it under the Epic if missing when PG work begins. Record assignee, SP, start date, initial estimate, and due date. Put PG subtasks beneath it.
- **QA** — Put QA viewpoints in its description before sharing with QA.

## Development subtasks

Create separate subtasks as applicable:

- `調査・仕様把握` for investigation and specification understanding;
- `実装` for programming work;
- `単体` for unit-test cases and evidence;
- `PRレビュー` for review discussion and review-driven corrections.

Set tracker=`サブタスク`, title, parent Backlogitem, estimated hours, start date, and due date. Record daily time through `時間を記録`; comments are optional but useful for traceability.

The implementation subtask description may be empty. Investigation notes/attachments are optional in the ticket rules, whereas the development-flow page separately requires the consolidated investigation/design/implementation direction in the Development Backlogitem/Epic or a linked shared file. Do not force duplicate evidence into every subtask. These workflow rules do not authorize creating or updating tickets without the user's task authorization.
