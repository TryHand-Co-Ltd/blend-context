# BLEND development rules

These references govern work on the application repository `blend`. They are shared rule summaries with versioned Wiki sources, not application code or credentials. The documentation repository's own naming and PR workflow are defined in [repository rules](../README.md) and [review policy](../../.github/CONTRIBUTING.md).

Imported into `blend-context` on **2026-09-28**. Source summaries record comparisons on 2026-09-09, with the unit-testing reference updated on 2026-09-14. This import did not re-audit the live Wiki. Preserve mandatory rules, recommendations, historical exceptions and evidence limits as distinct statements.

## Read by task

| Work | Required references |
| --- | --- |
| Implement, fix, refactor, review, or propose application changes | [Implementation rules](implementation-rules.md), [implementation notes](implementation-notes.md), [coding conventions](coding-conventions.md), [security](security.md), [shared development](shared-development.md) |
| Database access, models or transactions | Add [database rules](database-rules.md) and [model/replica rules](model-rules.md) |
| Schema changes | Add [ALTER TABLE](alter-table.md); read [production SQL](production-sql.md) when preparing release instructions |
| Views, frontend or common modals | Add [view rules](view-rules.md) |
| School-specific behavior | Add [school-specific rules](school-specific-rules.md) |
| Application workflow and ticket planning | [Development flow](development-flow.md), [Redmine tickets](redmine-tickets.md) |
| Test cases and evidence | [Unit testing](unit-testing.md) |
| Application PRs | [GitHub PRs](github-pr.md) |
| QA handoff | [QA request](qa-request.md) |
| Production SQL request | [Production SQL](production-sql.md) |
| Support investigation | [Support handling](support-handling.md) |
| Source versions, interpretation and coverage limits | [Wiki source audit](../evidence/2026-09-09-wiki-source-audit.md) |

## Scope and provenance

- Application paths are relative to the root of `blend`, unless stated otherwise. Resolve them in the relevant application checkout and record the inspected revision when citing code.
- The application branch/release workflow (`master`, `staging-new`, Epic keys) does not prescribe the branch workflow for `blend-context`.
- A rule describing ticket creation, notification, SQL or release operations is not authorization to execute those operations. Apply only rules relevant to the requested task; keep research read-only unless writes were requested.
- Historical code observations and environment notes must be checked again before relying on them as current runtime facts. Recommendations identified as supplemental implementation guidance are not literal Wiki mandates.
- The historical audit was adapted to remove personal filesystem locations, backup details and references to private instruction files. The 17 topic references retain their source content; no workstation setup, secret or application source has been imported.
- Keep this directory as the shared reference set. Update it through a reviewed PR with the source page/version, comparison date and affected rule; do not maintain competing current copies in feature folders.
