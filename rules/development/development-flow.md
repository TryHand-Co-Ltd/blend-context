# Development flow

Source: [開発フロー](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E9%96%8B%E7%99%BA%E3%83%95%E3%83%AD%E3%83%BC?version=23), version 23. Compared live on 2026-09-09; source updated 2026-05-20T01:22:46Z. See [source audit](../evidence/2026-09-09-wiki-source-audit.md) for interpretation and coverage limits.

## Start and design

1. Update `master` and create `feature/ALREADY-XXXX`, using the Epic number for `XXXX`.
2. Set the Epic to in progress, assign it to yourself, confirm delivery/release timing with the leader, and set detailed status `01_PG中`.
3. Read the Epic and specifications. Record investigation, detailed design, and implementation policy in the Development Backlogitem/Epic or a shared spreadsheet/Excel file.
4. Ask the SE to confirm detailed design before implementation. Escalate unclear behavior and existing-system impact.

## Implement and review

1. Create `調査`, `実装`, and `単体テスト` subtasks under the Development Backlogitem. Fill start date, due date, SP, and actual time.
2. Implement on the feature branch and perform unit tests. Use the AD environment when the latest database behavior matters.
3. Create both PRs:
   - `staging-new <- feature`;
   - `master <- feature`.
4. Differences caused by commits unique to `master` or `staging-new` are expected; resolve conflicts on the master PR.
   If the staging PR conflicts, do not merge `staging-new` into the feature branch. The Wiki suggests bringing in `master` or rebasing onto `master`; choose the authorized method without discarding work or rewriting shared history unexpectedly.
5. Post both PRs to the current review channel and mention the responsible SE and requesting PM.
6. Change detailed status to `02_PGOK（SE確認中）` after requesting review.

Creating a PR earlier for design or implementation-policy discussion is allowed after team consultation; do not wait for implementation completion when early review reduces risk.

## QA

1. Put reproducible validation content in the QA Backlogitem.
2. If development writes it, obtain SE confirmation.
3. After SE approval, merge the `staging-new` PR and complete the Development Backlogitem fields/status.
4. Notify QA in the current QA channel and mention the release decision maker.
   Set detailed status to `03_QA中` when QA begins. If DDL affects other features, the Wiki calls for applying it to both QA1 and QA2; coordinate isolation/alternate environments with the team when parallel work may be affected. Do not execute those database or server operations without task authorization.
5. QA verifies the Epic in the QA environment.
6. On success, set detailed status `04_QAOK（リリース待ち）`.
7. On failure, notify QA, create correction/test subtasks, repeat implementation review, create a new QA subtask, and send the retry using the same visible request format as the initial request.

## Release and closeout

1. Continue the QA-completion thread and notify the release decision maker.
2. The decision maker submits the release request, adds `QA完了` and `release` to the master PR, and records the item in the current monthly release-management sheet.
3. The release operator merges the PR, runs the production pipeline, and mentions the decision maker.
4. The decision maker reports the production release through the current school-specific or all-school channel.
5. Set the Epic to `最終確認待ち` and detailed status `05_リリース済み`.

People, channels, and monthly sheet URLs are mutable operational data. Verify them in the live Wiki/team workspace; do not rely on the historical names captured in this reference.
