# Shared development guidance

Sources under `開発部共通`: `参考情報や気を付けたいこと`, `処理・参照の共通利用情報`, `PHP-ループ処理Tips`, `アプリ関連開発`, `APIの動作確認-Postmanを使う方法`, `ディレクトリ構成`, `WIP-実装時に気をつけたいこと`, `HUB（ポータル）開発について`, and `「生徒」の表記`. Source versions and scope are in [source audit](../evidence/2026-09-09-wiki-source-audit.md).

## Authorization placement

The Wiki prefers a simple model lookup by primary ID, followed by controller checks of the returned school/year/owner against the authenticated context. An ID-only SELECT is not by itself a BLEND rule violation. Verify the check happens before data disclosure or a mutation, and trace other callers of shared methods. Keep effective existing SQL scoping; do not remove it merely to imitate the example.

## Existing shared values and helpers

Locate and inspect these before duplicating their behavior:

| Concern | Existing source named by the Wiki |
|---|---|
| Configured student-number wording | `$this->use_student_number`, `application/controllers/AdminController.php` |
| School-dependent pupil/student wording | `$this->student_label_name`, `AdminController` / `StudentController` |
| Error-message links | `a_inner_text_link` and `addLinkMessage()` |
| CSV error table headings | `.error_table th` in `assets/css/app.css`; avoid duplicate view-specific overrides |
| Boolean permission checks | `checkUserPermission()` in `application/controllers/school/AdminController.php`; unlike `checkAuthority`, it returns a boolean rather than redirecting |
| Japanese/Gregorian date conversion | `changeSeireki` / `changeWareki` in `change_year_jp_helper.php` |

The student-label guide maps kindergarten to `園児`, elementary to `児童`, junior/high school to `生徒`, and university/vocational to `学生`. Reuse the configured variable rather than hardcoding that mapping again; the source notes rollout is incomplete.

For date logic, distinguish the viewed year (`$this->login_data['year']`) from the school's current year (`$this->school['year']`). For era-format academic-year labels, the Wiki uses the relevant homeroom year with `-05-01`, not today's date; admissions examples use the next year. Apply the feature's actual year semantics rather than replacing all dates mechanically.

For intentional link markup in error messages, see the escaping exception and defense boundaries in [security.md](security.md).

## Performance and structure recommendations

- Replace repeated nested lookups with a map indexed by the lookup key when suitable (the Wiki shows `array_column`). Handle absent keys and duplicate-key semantics for the actual data; examples are not an excuse to introduce warnings.
- Reduce deep nesting with `continue` or a guard where behavior is preserved. Do not introduce an early return inside a read-replica start/end scope.
- Use a temporary variable instead of repeating a long expression or multiple expensive conversions.
- The WIP page recommends meaningful names, one responsibility per method, passing only needed model arguments rather than the whole login context, and verifying how feature-specific login-context fields are populated. It explicitly says these notes are **not all mandatory**. Do not turn subjective WIP preferences into blocking review findings.
- Optional editor extensions/settings in the Tips page are not project dependencies or mandatory installs.

## Shared web and app behavior

- Preserve common business processing in the parent/shared controller layer; web and API controllers should reuse it rather than diverging. Verify routing, authentication, request/response differences, and the affected callers.
- For shared core changes, follow the Postman/API and post-release device checks in [implementation-notes.md](implementation-notes.md).
- The Wiki's API procedure is POST `/api/login` with authorized test credentials, then use the returned token as a Bearer token for the target API. Obtain method/body details from the current API specification. Do not copy example credentials from the Wiki into guidance, code, or reports.
- The app guide describes iOS/Android API clients and an iPad webview using web screens. Treat this as source-described context, not proof of current installed-client behavior; verify the relevant client for the task.

## HUB-specific work

HUB has separate authentication/session handling and organization/role permissions, potentially covering multiple schools. Inspect `HubController`, `HubPermission`, and the affected `hub` read/write model boundaries before applying BLEND school checks. Organization code, login ID, and password are three input fields; the Wiki's wording does not prove three independent authentication factors.

The HUB guide's example routes omit HTTP methods in some places. The explicit implementation rule still requires a method on new routes; examples are not exceptions. Its branch/push/DDL examples are reference workflows, not permission to change remotes or databases.

## Directory and environment guidance

- Application code includes controllers/models/views plus `application/blend`, `domain`, `repository`, and `usecase`; inspect the affected module rather than forcing all logic into one MVC layer.
- Migration SQL belongs under `application/migration/YYYY/`. The directory Tips page says `migrations` in one prose line but its tree, PR/SQL rules, and the inspected checkout use singular `migration`.
- Local debugging examples (`last_query()`, `echo`, `exit`, extended Xdebug output) are for development inspection. Remove temporary probes before delivery and never expose sensitive data in user responses.
- Environment setup, mail testing, DB dumps/year switching, external spreadsheets, and detailed feature pages remain task-specific live references. Read the relevant page when that task is requested; a generic coding task does not authorize running their operational commands.
