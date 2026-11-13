# DEC-005 — Apply-condition cleanup (drop HR/class filters, add grade-group combination, place aggregate conditions)

Date: **10 Nov 2026**. Scope: RC-001 "適用条件設定" screen. Basis: direction of Shite (SE) after the operation check by Kurashima-san; internal. Japanese canonical: [DEC-005 (ja)](DEC-005-apply-condition-v2.ja.md)

| Item | Content |
| --- | --- |
| Decision | (1) Remove HR and class (授業) from the individual apply filters (they stay as the population for average references). (2) Add a "成績グループ組合わせ" (grade-group combination) filter. (3) 成績の情報 stays choice-type only for the first release. (4) Subject/sub-subject use a multi-select modal like auto-calc. (5) Aggregate conditions (average / group score rate, upper & lower bound) exist only under "narrow by specific conditions"; average-only is savable and re-editable. (6) Multiple values inside one condition field = OR, between fields = AND, with duplicate-selection control like auto-calc. |
| Storage | `red_score_settings.apply_condition` carries `version: 2`; the same type with different key_id is a separate field. No `version` = legacy form (same type OR) and is still judged as before. |
| Legacy data | Existing HR/class conditions are kept, judged and saved, shown as "(legacy condition)"; cannot be newly added (also rejected server-side). Legacy "all + average" shows as filter + average only. |
| Year carryover | Red-score settings are not handled by any carryover/copy/export/import path today. ID mappings needed are listed in specification §12.4 and DB design §4.5 (separate report item). |
| Supersedes | Screen definition v2 §02 HR/class filters; AC-G05 "OR within the same type" (combination rule now per condition field). |
| Status | Implemented and verified locally. Internally confirmed by Shite (his direction and his PR review of 2026-11-11); no customer (MW) confirmation is recorded, and a production check is pending. |

## Handling of saved settings (addendum)

- Legacy form (no `version`): a save that does not change the condition fields (including name/threshold-only edits) keeps the stored JSON and judging as is; it is not converted to `version: 2`.
- Changing and saving a legacy condition with several keys of the same type (previously OR) requires an explicit confirmation checkbox that OR becomes AND, enforced on the server.
- If the stored condition is unreadable (invalid JSON, unknown type), saving from this screen is rejected and the condition is never erased.
- A save that leaves a legacy condition unchanged skips condition validation (new duplicate rules must not make old data unsavable); the name is still validated.
- Legacy HR/class conditions may only keep their stored values; replacing or adding values is rejected on the server.
- Legacy HR course (`hr_course`), and average/group-rate conditions placed inside `filters` or using a `type` key, are treated as readable. Subject rows with different class-curriculum scopes are separate condition fields, not duplicates. The curriculum field is labeled "master curriculum" (it holds master curriculum data). A stored curriculum that is no longer in the list stays selected as "(not selectable now) (no ID is shown to users; several entries are told apart by numbers 1, 2; the ID is kept only in the title attribute; a short explanation is shown on the screen)" and is kept on save; a new unlisted value cannot be chosen.
- When a stored value is missing from the current choices (retired grade, HR course, calc-group item, choice, or an aggregate period/ranking setting), the screen does not drop it on load: it shows "(not selectable now) (no ID is shown to users; several entries are told apart by numbers 1, 2; the ID is kept only in the title attribute; a short explanation is shown on the screen)" already checked and submits it. An unchanged save of a legacy condition keeps the stored JSON as is. For version 2 or other changed saves, stored values of any type are kept by validation (same as the master curriculum). A new unlisted value that is not already stored is rejected with a visible reason. A value is removed only when the user unchecks it. A condition field holding only unlisted values matches nobody in the judge (judging is the same before and after the save). For an aggregate period / ranking setting / population that is no longer selectable, the message says "no longer selectable, please choose again".
- The save button is hidden when the stored condition is unreadable.
- The subject modal follows auto-calc: choose either "filter by subject" or "filter by sub-subject". One condition field stores only one of them and a request with both is rejected. Stored conditions holding both are shown as a subject field and a sub-subject field so that judging (any match) does not change.
