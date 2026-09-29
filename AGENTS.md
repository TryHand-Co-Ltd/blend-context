# BLEND — AI entry point

Start every BLEND task here. `blend-context` owns shared instructions, definitions, feature context, documentation and decisions. `blend` is the application repository; application changes and executable migrations belong there.

## Read and route

1. Read `README.md`, [repository rules](rules/README.md), and [content-authoring rules](rules/content-authoring.md) for any created or edited BLEND content.
2. Resolve the feature by its verified Redmine Backlogitem ID or Sheet Work Item ID. Read `features/<Feature-ID>-<slug>/README.md`; use its recorded ID/source and consult the source for the requested task, not title similarity alone. Do not infer the source from the ID format.
3. Read that feature's `CONTEXT.md` and confirmed sources when present; if not yet documented, follow the verified source from its README. Then read documents relevant to the task. Never substitute an old research note or another feature's requirements.
4. For application code work, read [development rule routing](rules/development/README.md) and its required references, then inspect the relevant code in `blend`. These rules also apply to implementation proposals and code reviews.
5. When a session starts directly in `blend`, explicitly provide this shared entry point; do not assume instructions from another repository are automatically loaded. Confirm which checkout/revision is the application repository before relying on source evidence. `blend` is the team's repository name, not an assumed host URL or required sibling path. If the application checkout is unavailable, ask for access/location; do not invent source paths or clone silently.

For red scores, start in [RC-001-red-score](features/RC-001-red-score/): `CONTEXT.md` is the current source of truth and `sources/confirmed-business-qa.vi.md` preserves the confirmed Q&A. Read task IDs from the registered Sheet when needed. Ticket `225454` and its related hierarchy are organizational examples only, not an active assignment or the project's complete backlog. Do not select an example as implementation scope unless explicitly requested. The README indexes available documentation, not all project work or current assignments.

## ID and evidence boundaries

- Preserve source IDs exactly. For a task without a verified Redmine SubTask, use its exact `Internal Tasks` → `Task ID` from the registered Sheet. Record source, exact ID, parent and source link in task-specific documentation when created. Keep READMEs focused on conventions and navigation; do not reproduce the Sheet task list or individual task-row links. A Sheet link to a Backlogitem is not a SubTask mapping.
- Keep actual parent IDs, including SubTask-under-SubTask relationships. Do not impose one universal SE/Development/QA tree on existing tickets.
- Use Redmine/Sheet as read-only sources unless the user explicitly requests an external write. Do not edit tickets, comments, time entries, cells or workflow status while investigating.
- Distinguish confirmed requirements, proposals, historical decisions and verification gaps. Reconcile newly authorized requirements with context and affected documents; source code only proves behavior inspected at its recorded revision.

## Write boundaries

- Put feature-wide context in `CONTEXT.md`, confirmed Q&A and source material in `sources/`, shared documents in `docs/`, task-specific material in `tasks/<Task-ID>-<slug>/`, and standalone normalized decisions in `decisions/`, all under the feature folder. Create only folders needed. These paths override generic skill/template output paths.
- Resolve the owning feature by its verified source and exact ID before choosing an output path. Reuse its existing folder and slug. If no verified Feature ID or Task ID exists, do not invent one or create a canonical folder; keep the result in chat or a user-assigned location until the identity is verified.
- Use a revision subfolder only when the source or existing feature organization genuinely has revisions. Do not create `r1` by default. For a new feature, add its folder to the root `README.md`; do not list every task there or in the feature README.
- Treat confirmed Q&A as source evidence, not as a decision record. Put a file in `decisions/` only when it states a normalized decision, rationale, impact, status, and replacement relationship when applicable.
- Keep dated rule/source verification records in `rules/evidence/`, separate from active rules. Feature-specific investigation belongs with that feature. Historical evidence is not a live task/status index.
- Keep one canonical copy. Task documents link to shared specifications and results instead of duplicating them. Preserve unrelated content, language variants and the user's existing changes.
- Keep Japanese UI labels exact. In Vietnamese prose, put the Vietnamese meaning immediately beside each Japanese UI name or business term. Follow an explicitly requested output language.
- Use repository-relative links and shared source URLs. For code evidence, use a verified permalink or a clearly attributed identifier such as `blend:application/models/common/Base_m.php`, with the inspected revision. Do not use personal paths, localhost, private helpers, links escaping this repository, secrets or personal configuration.
- Do not run SQL merely because a SQL document exists. Documentation, design review and PR approval do not prove implementation, testing, DB execution or release readiness.

## Review and delivery

- Default to reading. When edits are requested, leave them unstaged for review. Do not stage, commit, push, create a PR or publish without a separate user request.
- Updates to `main` follow the [PR review policy](.github/CONTRIBUTING.md): request a representative reviewer from each team using the repository, obtain valid approval and resolve review feedback before merge; no self-approval. A publishing request does not grant permission to bypass review or push directly to `main`.
- Before handoff, verify changed internal links, exact IDs and parent mappings, absence of private references, and preservation of documents moved without business changes. Summarize changes and any unverified points. Do not claim GitHub protection is active merely because a policy file exists.
