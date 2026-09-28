# Unit-testing subtasks

Source: [単体のサブタスク作成](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E5%8D%98%E4%BD%93%E3%81%AE%E3%82%B5%E3%83%96%E3%82%BF%E3%82%B9%E3%82%AF%E4%BD%9C%E6%88%90?version=9), version 9. Compared live on 2026-09-14; source updated 2026-02-09T02:22:18Z. See [source audit](../evidence/2026-09-09-wiki-source-audit.md) for the earlier package-wide comparison and coverage limits.

Use unit testing to prove implementation intent, scope, and behavior before PR review and QA.

## Required structure

1. **Prerequisites** — Record target school, configuration, permissions, academic year, and any condition affecting the whole test.
2. **Preparation** — Record the UI steps required to create accounts or data and satisfy prerequisites.
3. **Check items** — For each case, separate conditions,操作 steps, and expected behavior so another person can reproduce it.

Prepare accounts and data through the UI whenever possible. Direct database setup can hide related-table updates and makes it harder to decide whether QA can reproduce the case.

Break broad prose into atomic checks. Use a table when the case count is large.

## Minimum evidence

| Change | Required evidence |
|---|---|
| Email process or wording | Screenshot of the received email |
| CSV header/sample or PDF format | The generated CSV/PDF file itself |
| Screen layout | Before and after screenshots |
| New table or column | Screenshot of `SELECT` or `SHOW FULL COLUMNS` output |
| Notification behavior | Screenshot of the relevant `notification` query result |

Before/after evidence is recommended for complex conditional behavior beyond the mandatory cases above; the Wiki leaves other screenshots to the implementer's judgment.

## Store evidence

Choose according to the change and evidence needs; these are recommendations, not fixed size thresholds.

- For small changes, consider pasting evidence into the Redmine description directly below its check item.
- For large development, or rigorous evidence collection regardless of development size, consider one Excel or similar file; explicitly map every artifact to its check item.
- For large development, or rigorous evidence collection regardless of development size, consider a ZIP; use clear filenames/folders to preserve traceability from each file to a check item. ZIPs also make large evidence volumes easier to share.

Do not call unit testing complete when another reviewer cannot reproduce the conditions and match evidence to expected behavior.
