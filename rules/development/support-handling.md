# Support inquiry handling

Source: [問い合わせ対応](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E5%95%8F%E3%81%84%E5%90%88%E3%82%8F%E3%81%9B%E5%AF%BE%E5%BF%9C?version=1), version 1. Compared live on 2026-09-09; source updated 2025-12-26T03:48:59Z. See [source audit](../evidence/2026-09-09-wiki-source-audit.md) for interpretation and coverage limits.

Use this flow for specification questions arriving from CS through `#cs_support`.

## Rules

- Answer within five business days after the request is registered.
- Record one specification question per spreadsheet row, even when a school asks multiple questions at once.
- If a later question is unrelated to the original, mark the original completion state as required and register a separate item.

## Flow

1. Register the specification inquiry in the shared `Blend共通改修(調査)` sheet and notify `#cs_support`.
2. Change column P to `対応中` when investigation starts.
3. Create one investigation item under the designated Backlogitem and set the due date to five business days after registration.
4. Investigate in child tasks. Store evidence and results; create another child task for additional questions.
5. Change column P to `対応完了`, write the result in column Q, and notify the requester in `#cs_support`.
6. After the school is contacted, change column S to `完了報告済み`.
7. Set the JIRA item to complete and close it.

Verify the current spreadsheet, parent ticket, columns, and channel in the live Wiki before acting because operational identifiers may change.
