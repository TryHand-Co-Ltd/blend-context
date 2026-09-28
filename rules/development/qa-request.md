# QA requests

Source: [QA依頼にあたって押さえるべき事柄](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/QA%E4%BE%9D%E9%A0%BC%E3%81%AB%E3%81%82%E3%81%9F%E3%81%A3%E3%81%A6%E6%8A%BC%E3%81%95%E3%81%88%E3%82%8B%E3%81%B9%E3%81%8D%E4%BA%8B%E6%9F%84?version=9), version 9. Compared live on 2026-09-09; source updated 2026-02-10T05:18:48Z. See [source audit](../evidence/2026-09-09-wiki-source-audit.md) for interpretation and coverage limits.

Request QA after PR review approval. Give QA enough information to test as someone encountering the feature for the first time.

## Ground rules

- For layout changes, attach images and describe the visible movement/removal at a useful level.
- Do not make direct log inspection or database-record inspection the default QA procedure.
- Discuss checks that cannot be performed from the BLEND UI with QA before handoff; consider excluding them from QA scope when appropriate.

## Required content

1. **Case overview** — Explain in bullets what BLEND behavior the Epic changes.
2. **Prerequisite knowledge** — Explain feature concepts a first-time tester must understand.
3. **Case history**, when the Epic alone is insufficient:
   - current behavior;
   - why it is a problem;
   - high-level response;
   - affected screen or field.
4. **Implemented behavior** — State concretely which screen/field changed and how its behavior changed.
5. **Supplemental information**, when needed:
   - a school where the case is immediately reproducible;
   - setup/navigation steps;
   - special conditions such as grade retention;
   - effects on parallel QA work, especially changing the current academic year.

Keep the handoff concise but reproducible. The required detail depends on the Epic; do not copy a prior ticket blindly.
