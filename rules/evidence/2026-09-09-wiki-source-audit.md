# Live Wiki comparison — 2026-09-09

Status: text/source comparison completed for the pages listed below; visual and external-link limits remain explicit.

## Scope and method

Requested roots:
- [開発時のルール](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E9%96%8B%E7%99%BA%E6%99%82%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%AB)
- [開発部共通](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E9%96%8B%E7%99%BA%E9%83%A8%E5%85%B1%E9%80%9A)

Both are index pages (child_pages macros), not complete rule documents. The comparison used authenticated read-only Redmine GET requests, the project Wiki index/parent relationships, all 17 pages in the development-rules subtree, and relevant common-development pages. In total 35 page bodies were read. All 13 original reference summaries were compared with their named live sources; four missing task references were added.

The larger common subtree also contains hundreds of feature specifications, release-item records, environment procedures, and external links. Its other 226 descendant entries were inventoried, not audited as universal development rules. Do not claim every product specification or environment procedure was compared. Read the relevant live feature page when a task needs it.

The earlier rule package said captured 2026-08-18. Checked page timestamps do not establish a post-capture rule change; the mismatches below are omissions or interpretation errors in that earlier summary, not proof that Redmine changed after August 18.

## Mismatches corrected

| ID | Previous summary behavior | Live-source evidence / correction | Updated reference |
|---|---|---|---|
| R01 | Required school/year predicates in every query and treated ID-only access as a stop condition | Tips explicitly allows primary-ID lookup followed by controller checks; enforce authorization before protected use/mutation and trace all callers | implementation-rules, implementation-notes, shared-development |
| R02 | Missing View child-page requirements | PHP comments instead of exposed HTML comments; no JS template literals; selects use no-nice; reuse repeated DOM partials | view-rules |
| R03 | Missing Model child-page behavior | Reuse model methods; persistence responsibility; Base_m replica scope, transaction behavior, paired end, no early return | model-rules |
| R04 | Missing read-after-write replica warning from common pages | Reuse write data where sufficient; asynchronous replica SELECT may be stale; sleep is not a synchronization guarantee | model-rules |
| R05 | Missing school-specific branch shape | Separate school-ID condition from nested conditions; use configured school-ID key | school-specific-rules |
| R06 | Missing shared helpers, dynamic student labels, viewed/current year distinction, common modal contracts | Route to the existing helpers/partials; preserve the teacher-modal not-implemented marker | shared-development, view-rules, implementation-notes |
| R07 | Short method comments depended on surrounding code | Coding Wiki requests the comment as well as blank line | coding-conventions |
| R08 | Treated BIGINT UNSIGNED example as universal mandate; asserted future MySQL behavior | Distinguish mandatory BIGINT from sample signedness; retain no-display-width rule without independently asserting MySQL 9 behavior | database-rules |
| R09 | PR screenshots and extra complex-case screenshots were always mandatory | PR captures and extra conditional-case captures are recommendations; layout before/after evidence remains mandatory under unit-test rules | github-pr, unit-testing |
| R10 | Missing staging conflict and QA operational details | Do not merge staging-new into feature; include QA1/QA2 DDL coordination and 03_QA中 stage | development-flow |
| R11 | Missing release-note column markers and ticket optionality | Mark applicable SQL/manual SQL/batch columns; preserve optional reviewer/assignee, investigation notes, and implementation-subtask description | github-pr, redmine-tickets |
| R12 | Compliance gate could turn every task into implementation/release work | Explicit read-only review mode, task-relevant requirements, recommendations vs violations, and external-action authorization boundaries | Historical interpretation; no separate shared reference |
| R13 | Shared API/device obligation was phrased vaguely | Preserve Postman checks for affected APIs on the four named core files and post-release device check by release-label owner | implementation-notes |
| R14 | Missing HUB scope distinction | Organization/role access can span schools; do not label all such access as missing school isolation | shared-development |

## Source inconsistencies preserved explicitly

- Directory Tips prose says application/migrations, while its tree, current PR/SQL rules, and the inspected checkout use application/migration. Use the singular path.
- Model Wiki warns about residual query state; inspected Base_m.php restores the DB connection and does not itself reset Query Builder. Do not invent that API guarantee.
- Shared-processing Tips loosely describes html_escape as XSS/SQL-injection protection. The security page separately requires Query Builder/binding; retain the distinction.
- Security page's sample Cache-Control spelling is not copied as a literal header contract; preserve the required sensitive-page caching behavior.
- HUB guide has route examples without HTTP methods; the explicit new-route requirement takes precedence. Its three login fields are not proof of three independent authentication factors.
- Generic GET-for-read wording must be combined with the security requirement to use POST for sensitive request information.
- WIP notes explicitly are not all mandatory. Teacher-modal status unification is explicitly unfinished. Preserve both qualifications.
- Single quotes are the default; implementation allowance for required interpolation/escape semantics is practical implementation guidance, not a quoted Wiki exception.
- Additional path-confinement, exceptional-exit cleanup, consistency selection, and production-DDL operational checks are identified as supplemental implementation/safety guidance, not invented literal Wiki mandates.

## Source inventory

Links pin the version inspected. Read the current page before relying on mutable release roles, channels, environments, monthly sheets, or feature behavior.

| Page | Version | Updated at (UTC) | Reference document |
|---|---:|---|---|
| [ALTER_TABLE時の注意](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/ALTER_TABLE%E6%99%82%E3%81%AE%E6%B3%A8%E6%84%8F?version=1) | 1 | 2026-08-18T01:31:16Z | [alter-table.md](../development/alter-table.md) |
| [APIの動作確認-Postmanを使う方法](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/API%E3%81%AE%E5%8B%95%E4%BD%9C%E7%A2%BA%E8%AA%8D-Postman%E3%82%92%E4%BD%BF%E3%81%86%E6%96%B9%E6%B3%95?version=1) | 1 | 2025-12-26T03:48:49Z | [shared-development.md](../development/shared-development.md) |
| [BLEND全体](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/BLEND%E5%85%A8%E4%BD%93?version=1) | 1 | 2025-12-26T03:48:37Z | Index / context; not a standalone mandatory rule |
| [DB関連(MySQL)](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/DB%E9%96%A2%E9%80%A3(MySQL)?version=1) | 1 | 2025-12-26T03:49:03Z | Index / context; not a standalone mandatory rule |
| [Github-PRの作成](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/Github-PR%E3%81%AE%E4%BD%9C%E6%88%90?version=22) | 22 | 2026-05-21T06:41:54Z | [github-pr.md](../development/github-pr.md) |
| [HUB（ポータル）開発について](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/HUB%EF%BC%88%E3%83%9D%E3%83%BC%E3%82%BF%E3%83%AB%EF%BC%89%E9%96%8B%E7%99%BA%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6?version=1) | 1 | 2025-12-26T03:49:01Z | [shared-development.md](../development/shared-development.md) |
| [Modelクラス](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/Model%E3%82%AF%E3%83%A9%E3%82%B9?version=1) | 1 | 2025-12-26T03:51:04Z | [model-rules.md](../development/model-rules.md) |
| [PHP-ループ処理Tips](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/PHP-%E3%83%AB%E3%83%BC%E3%83%97%E5%87%A6%E7%90%86Tips?version=9) | 9 | 2026-01-15T08:39:47Z | [shared-development.md](../development/shared-development.md) |
| [PRレビュー指摘まとめ](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/PR%E3%83%AC%E3%83%93%E3%83%A5%E3%83%BC%E6%8C%87%E6%91%98%E3%81%BE%E3%81%A8%E3%82%81?version=2) | 2 | 2026-02-02T07:12:42Z | Index / context; not a standalone mandatory rule |
| [QA依頼にあたって押さえるべき事柄](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/QA%E4%BE%9D%E9%A0%BC%E3%81%AB%E3%81%82%E3%81%9F%E3%81%A3%E3%81%A6%E6%8A%BC%E3%81%95%E3%81%88%E3%82%8B%E3%81%B9%E3%81%8D%E4%BA%8B%E6%9F%84?version=9) | 9 | 2026-02-10T05:18:48Z | [qa-request.md](../development/qa-request.md) |
| [Redmineのチケット作成ルールについて](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/Redmine%E3%81%AE%E3%83%81%E3%82%B1%E3%83%83%E3%83%88%E4%BD%9C%E6%88%90%E3%83%AB%E3%83%BC%E3%83%AB%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6?version=21) | 21 | 2026-01-28T04:27:17Z | [redmine-tickets.md](../development/redmine-tickets.md) |
| [SQLの本番リリース](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/SQL%E3%81%AE%E6%9C%AC%E7%95%AA%E3%83%AA%E3%83%AA%E3%83%BC%E3%82%B9?version=8) | 8 | 2026-05-24T01:42:20Z | [production-sql.md](../development/production-sql.md) |
| [Tips](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/Tips?version=3) | 3 | 2026-01-15T08:17:41Z | Index / context; not a standalone mandatory rule |
| [UI-スペース-メモ](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/UI-%E3%82%B9%E3%83%9A%E3%83%BC%E3%82%B9-%E3%83%A1%E3%83%A2?version=1) | 1 | 2025-12-26T03:48:54Z | [view-rules.md](../development/view-rules.md) |
| [Viewファイル](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/View%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB?version=1) | 1 | 2025-12-26T03:51:04Z | [view-rules.md](../development/view-rules.md) |
| [WIP-実装時に気をつけたいこと](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/WIP-%E5%AE%9F%E8%A3%85%E6%99%82%E3%81%AB%E6%B0%97%E3%82%92%E3%81%A4%E3%81%91%E3%81%9F%E3%81%84%E3%81%93%E3%81%A8?version=1) | 1 | 2025-12-26T03:48:53Z | [shared-development.md](../development/shared-development.md) |
| [「生徒」の表記](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E3%80%8C%E7%94%9F%E5%BE%92%E3%80%8D%E3%81%AE%E8%A1%A8%E8%A8%98?version=1) | 1 | 2025-12-26T03:49:54Z | [shared-development.md](../development/shared-development.md) |
| [アプリ関連開発](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E3%82%A2%E3%83%97%E3%83%AA%E9%96%A2%E9%80%A3%E9%96%8B%E7%99%BA?version=1) | 1 | 2025-12-26T03:48:50Z | [shared-development.md](../development/shared-development.md) |
| [コーディング規約](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E3%82%B3%E3%83%BC%E3%83%87%E3%82%A3%E3%83%B3%E3%82%B0%E8%A6%8F%E7%B4%84?version=1) | 1 | 2025-12-26T03:49:56Z | [coding-conventions.md](../development/coding-conventions.md) |
| [ディレクトリ構成](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E3%83%87%E3%82%A3%E3%83%AC%E3%82%AF%E3%83%88%E3%83%AA%E6%A7%8B%E6%88%90?version=1) | 1 | 2025-12-26T03:48:56Z | [shared-development.md](../development/shared-development.md) |
| [データベースルール](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9%E3%83%AB%E3%83%BC%E3%83%AB?version=2) | 2 | 2026-01-09T03:31:53Z | [database-rules.md](../development/database-rules.md) |
| [リードレプリカ用DBとの同期注意](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E3%83%AA%E3%83%BC%E3%83%89%E3%83%AC%E3%83%97%E3%83%AA%E3%82%AB%E7%94%A8DB%E3%81%A8%E3%81%AE%E5%90%8C%E6%9C%9F%E6%B3%A8%E6%84%8F?version=3) | 3 | 2026-08-03T04:55:02Z | [model-rules.md](../development/model-rules.md) |
| [共通モーダルの実装方針](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E5%85%B1%E9%80%9A%E3%83%A2%E3%83%BC%E3%83%80%E3%83%AB%E3%81%AE%E5%AE%9F%E8%A3%85%E6%96%B9%E9%87%9D?version=1) | 1 | 2025-12-26T03:48:58Z | [view-rules.md](../development/view-rules.md) |
| [処理・参照の共通利用情報](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E5%87%A6%E7%90%86%E3%83%BB%E5%8F%82%E7%85%A7%E3%81%AE%E5%85%B1%E9%80%9A%E5%88%A9%E7%94%A8%E6%83%85%E5%A0%B1?version=4) | 4 | 2026-01-20T01:12:54Z | [shared-development.md](../development/shared-development.md) |
| [単体のサブタスク作成](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E5%8D%98%E4%BD%93%E3%81%AE%E3%82%B5%E3%83%96%E3%82%BF%E3%82%B9%E3%82%AF%E4%BD%9C%E6%88%90?version=9) | 9 | 2026-02-09T02:22:18Z | [unit-testing.md](../development/unit-testing.md) |
| [参考情報や気を付けたいこと](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E5%8F%82%E8%80%83%E6%83%85%E5%A0%B1%E3%82%84%E6%B0%97%E3%82%92%E4%BB%98%E3%81%91%E3%81%9F%E3%81%84%E3%81%93%E3%81%A8?version=3) | 3 | 2026-01-15T08:14:53Z | [shared-development.md](../development/shared-development.md) |
| [問い合わせ対応](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E5%95%8F%E3%81%84%E5%90%88%E3%82%8F%E3%81%9B%E5%AF%BE%E5%BF%9C?version=1) | 1 | 2025-12-26T03:48:59Z | [support-handling.md](../development/support-handling.md) |
| [学校IDで条件分岐](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E5%AD%A6%E6%A0%A1ID%E3%81%A7%E6%9D%A1%E4%BB%B6%E5%88%86%E5%B2%90?version=1) | 1 | 2025-12-26T03:51:05Z | [school-specific-rules.md](../development/school-specific-rules.md) |
| [実装ルール](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E5%AE%9F%E8%A3%85%E3%83%AB%E3%83%BC%E3%83%AB?version=2) | 2 | 2026-01-07T05:40:45Z | [implementation-rules.md](../development/implementation-rules.md) |
| [実装上の注意](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E5%AE%9F%E8%A3%85%E4%B8%8A%E3%81%AE%E6%B3%A8%E6%84%8F?version=6) | 6 | 2026-01-07T05:38:03Z | [implementation-notes.md](../development/implementation-notes.md) |
| [新規参入者（SE・PG）向け情報](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E6%96%B0%E8%A6%8F%E5%8F%82%E5%85%A5%E8%80%85%EF%BC%88SE%E3%83%BBPG%EF%BC%89%E5%90%91%E3%81%91%E6%83%85%E5%A0%B1?version=2) | 2 | 2026-02-09T02:31:50Z | Index / context; not a standalone mandatory rule |
| [脆弱性対策](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E8%84%86%E5%BC%B1%E6%80%A7%E5%AF%BE%E7%AD%96?version=2) | 2 | 2026-01-07T05:34:25Z | [security.md](../development/security.md) |
| [開発フロー](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E9%96%8B%E7%99%BA%E3%83%95%E3%83%AD%E3%83%BC?version=23) | 23 | 2026-05-20T01:22:46Z | [development-flow.md](../development/development-flow.md) |
| [開発時のルール](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E9%96%8B%E7%99%BA%E6%99%82%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%AB?version=2) | 2 | 2026-01-15T07:56:24Z | Index / context; not a standalone mandatory rule |
| [開発部共通](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E9%96%8B%E7%99%BA%E9%83%A8%E5%85%B1%E9%80%9A?version=3) | 3 | 2026-01-15T08:16:14Z | Index / context; not a standalone mandatory rule |

## Access and evidence limits

- UI-スペース-メモ text and attachment metadata were read. Images 87015, 87016, 87017 were not viewed: attachment-image calls rejected missing content_type; the download tool reported REDMINE_ALLOWED_DIRECTORIES not configured. No spacing dimensions were invented from these images.
- Linked Google spreadsheets, legacy Atlassian databases, example PR discussions, and images illustrating the other text rules were not independently audited. The text requirements were compared; this is not visual parity or a full audit of their linked evidence.
- PRレビュー指摘まとめ points to an external Atlassian database; its underlying review entries were not available in the fetched page. Its page body does not supply a new mandatory coding checklist.
- Example login credentials from the Postman page were not copied into rule files or used.
- Source excerpts for Base_m.php and the migration path were inspected in the application checkout; no application/runtime, DB, API, browser, or device test was executed for this documentation task.

## Shared publication note — 2026-09-28

This historical audit accompanies the development references in blend-context. Workstation-specific storage, backup and private instruction details have been omitted. References to the former private skill and instruction files have been removed; the source comparisons and their limits remain historical evidence. Importing these references does not re-verify the live Wiki or the current application. The comparison dates above remain unchanged.
