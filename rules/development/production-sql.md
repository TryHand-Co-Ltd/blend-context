# Production SQL releases

Source: [SQLの本番リリース](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/SQL%E3%81%AE%E6%9C%AC%E7%95%AA%E3%83%AA%E3%83%AA%E3%83%BC%E3%82%B9?version=8), version 8. Compared live on 2026-09-09; source updated 2026-05-24T01:42:20Z. See [source audit](../evidence/2026-09-09-wiki-source-audit.md) for interpretation and coverage limits.

## Request channel

Use one of two paths:

1. Scheduled release through the release note.
2. Emergency request through Slack `@release`.

Even for emergencies, add the item to the release note and request execution by release-note number.

Put either the Pull Request URL or the Redmine URL in the release note.

## Direct SQL

Prefix the instruction with:

```text
<本番リリース時のSQL>
```

Add the `手動SQL` label to the PR. Keep an `UPDATE` statement—including its `WHERE` clause—on one line so copying or line truncation cannot separate the safety condition from the mutation.

## Attached migration/file

Prefix the instruction with:

```text
<本番リリース依頼SQLファイル>
```

List each exact filename/path, for example:

```text
application/migration/2026/20260101_school.sql
```

When using Redmine attachments, state in the attachment comment which file is the release target.

Separate instructions from PG to SE from instructions from SE to the release operator. The operator must be able to execute the release without inferring intent.
