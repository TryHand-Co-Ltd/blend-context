# Red scores — Changes and work breakdown

**Updated:** September 28, 2026.

Allow multiple red-score rules (赤点設定) for numeric evaluation items and evaluate the final saved score. Grade Extraction (成績抽出), Grade Publication (成績公開) and Report Card Tool (通知表ツール) use the same saved result with their own presentation settings. Eligible items are integer and decimal numeric inputs, including numeric lesson-unit items. Ordinary teachers may configure rules when they have both feature access and permission to edit the item.

This is a **breakdown of the full feature design**, not approval to implement or release every capability. Fixed points are the minimum discussed candidate; each implementation increment must separately select maximum-score percentages, average formulas and average/group-percentage conditions. Every selected increment must work consistently from configuration through evaluation and storage to all three outputs. Do not expose unselected types as operational choices.

Q3 is settled: group score percentage uses existing rank-aggregation results. Do not add a special calculation or configuration prohibition for mixed maximum scores, and do not stop processing solely because maxima differ. Source precision, lesson-unit identity and finalized aggregation integration remain engineering checks.

Use [Japanese Design](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-1631) for screen composition. New red-score screen URLs are undecided; the entries below identify verified entry points. Technical sections describe processing responsibilities and integration.

## Work overview

| Task | Main Screen | Change summary | Actual prerequisite |
| --- | --- | --- | --- |
| 1. Enable configuration and saving of multiple rules | [成績入力設定] Grade Entry Settings - `/admin/grade_report_setting/manage` | List, priority, applicability, fixed points and selected percentage inputs and persistence | Selected implementation types; Task 2 storage contract and maximum resolution |
| 2. Evaluate final scores and retain a shared result | No direct screen | Rule selection, fixed/percentage evaluation, state storage, shared reads and DB design | Cell, configuration and result data design; averages are not a prerequisite for independent rules |
| 3. Enable conditions and formulas that reference aggregation | [成績入力設定] Grade Entry Settings - `/admin/grade_report_setting/manage` | Source selection, average/group-percentage branching, formulas and per-row rounding | Selected conditions/formulas; Task 1 form foundation and Task 2 evaluation contract |
| 4. Update results through registration and batch calculation | [成績集計] Grade Aggregation - `/admin/grade/grade_setting_system/grade_calc` | Direct entry, CSV, exam linking, batch execution, reruns after deletion and failure reporting | Task 2 evaluation/storage; Task 3 sources for dependent rules |
| 5. Enable red-score extraction and Excel presentation | [成績抽出] Grade Extraction - `/admin/nb/grade/grade_setting_system/grade_extraction` | Filter students by red cells within scope; cell symbols and colors | Task 2 shared results and Task 4 state updates |
| 6. Add nonduplicated red-score effects to published grades | [成績公開設定] Grade Publication Settings - `/admin/grade_report_setting/grade_publish` | Combine estimated-score effects; student web/API/PDF | Task 2 shared results and Task 4 state updates |
| 7. Add a red-score condition to report cards | [通知表ツール] Report Card Tool - `/admin/grade_report_setting/report_card` | Condition order, save/reopen/template copy and PDF | Task 2 shared results and Task 4 state updates |
| 8. Preserve configuration-transfer operations and legacy behavior | [成績入力設定] Grade Entry Settings - `/admin/grade_report_setting/manage` | Selected copy, year inheritance, import/export, restore and synchronization paths | Decisions on supported paths and failure behavior; Task 1/2/3 data contracts |

## 1. Enable configuration and saving of multiple rules

**Main Screen:** [成績入力設定] Grade Entry Settings - `/admin/grade_report_setting/manage`

**Affected Screens:**

- [成績集計] Grade Aggregation - `/admin/grade/grade_setting_system/grade_calc`
- [成績公開設定] Grade Publication Settings - `/admin/grade_report_setting/grade_publish`

**Change scope:** Add screens and persistence from Input Field Settings (入力欄設定) to the red-score rule list, Applicability Conditions (適用条件) and Threshold Settings (基準設定), for teachers with feature access and item-edit permission. This task owns shared forms, filters independent of aggregation, fixed-point settings and selected maximum-percentage settings. Task 3 owns aggregation-dependent additions, Task 4 reruns and Task 6 publication settings; do not duplicate their output implementation here.

### Business changes

- Show the item, input type and term/timing, with names, priority, summaries of saved conditions/thresholds, add, delete and reorder actions. Names help recognition and are not relational keys. Do not create active rules for nonnumeric items.
- Apply to the item's full authorized scope or restrict through supported subject/subject-area, grade, class/group and selection filters. Use OR within a filter type and AND across types. A/B/C items are not evaluated directly, but their selection conditions may filter eligible students.
- At save time, fixed points must satisfy `0≤N≤M` for every applicable target; revalidate when expanding eligibility. Percentages require `0≤N≤100`; final comparison is Less than (未満) or Less than or equal to (以下). Do not require unused aggregation sources.
- Save, reorder and delete change configuration only and must not claim completed evaluation. Retain existing results after deleting the last rule until a rerun and explain the need to rerun. Cancellation and save failures preserve saved configuration and results.
- **Design proposals for review:** Append new rules, initially select fixed points and Less than, and leave the value empty. Incomplete additions remain inactive; restricted scope with no valid filter is an error. Switching types within an edit temporarily retains input; reopening restores the saved type. A source change clears only invalid dependent selections.

### Technical work

- The existing automatic-calculation settings controller methods `edit`, `editCondition`, `registCondition`, `editFormula`, `registFormula`, `sort` and `delete` provide existing list, condition, formula and persistence patterns. Reuse suitable form parts and validation without repurposing existing AutoRating settings as red-score rules. Do not copy a school-specific restriction as a universal feature requirement.
- Connect to the existing input-field entry in application screen routing; define new URLs, HTTP methods and save contracts during implementation design. Both display and save must verify school, academic year, item-edit permission and ownership of selected references, retaining CSRF protection, server validation and output escaping for names and symbols.
- Persist order, applicability, the selected threshold type, comparison and rounding through the storage contract owned by Task 2. Prevent partial configuration updates on failure and avoid stale replica reads reverting the displayed saved value. Do not update or reset existing `red_score`/`changed_red_score` values.
- Reuse Task 2 effective-maximum resolution for validation. Fixed-value validity is checked when saving; do not automatically adjust a stored fixed threshold when the maximum later decreases.

### Dependencies and pending decisions

Field, navigation and validation design can start. Persistence implementation needs Task 2's data contract. Review the proposed initial state, incomplete additions and type-switch behavior above. Task 3 owns average/group-percentage fields; coordinate edit order in shared forms.

### Done when

An authorized teacher can configure multiple rules for eligible numeric items, reopen their content and order, and distinguish saving configuration from updating evaluation results.

## 2. Evaluate final scores and retain a shared result

**Main Screen:** No direct screen; shared evaluation, storage and reading.

**Affected Screens:**

- [成績入力設定] Grade Entry Settings - `/admin/grade_report_setting/manage`
- [成績集計] Grade Aggregation - `/admin/grade/grade_setting_system/grade_calc`
- [成績抽出] Grade Extraction - `/admin/nb/grade/grade_setting_system/grade_extraction`
- [成績確認] Grade Confirmation - `/student/grade/grade_publish`
- [通知表ツール] Report Card Tool - `/admin/grade_report_setting/report_card`

**Change scope:** Own configuration/result DB design, effective-maximum resolution, rule selection, fixed/selected percentage evaluation, state persistence and shared reads for authorized processing targets. Screens are dependent consumers; Tasks 5–7 own their presentation changes. School-specific reports reading legacy red-score thresholds are regression-only surfaces.

### Business changes

- Associate one current result with a cell retaining student, school, year, class/subject, item, term/timing and lesson unit. Use the final saved score `S`, including manual scores, estimated scores (見込点), numeric Not taken (未受験) scores and valid zero. Do not replace blanks or inactive scores with zero.
- Check applicability in priority order, select the first matching rule, then calculate its threshold. Do not proceed to a lower rule when a potentially applicable higher rule has an indeterminate condition or the selected rule cannot produce a threshold. If independent filters already establish ineligibility, skip that rule without loading its aggregation source.
- Fixed points use `T=N`. Percentages use current effective maximum `M` in `M×N/100`, followed by selected rounding. Resolve maximum in order: item default, valid lesson-unit override, then the class selection that actually applies. Percentage evaluation requires a positive finite maximum; fixed calculation does not depend on later maximum changes.
- Distinguish red, non-red, never evaluated, unable to evaluate, not applicable and no score. Retain the previous result while only configuration/source has changed; a rerun that cannot form a threshold stores unable to evaluate, while all rules being ineligible stores not applicable and stops the old result. Deleting or deactivating a score must remove the old numeric score's display/filter effect.
- Evaluation never changes scores, and all three outputs read the same current result. Reruns do not duplicate results or marks; an older run finishing late must not overwrite newer scores/results.

### Technical work

- The shared grade reader by evaluation frame reads scores with item, class, student, term/timing and lesson unit. Attach the shared result to this data flow or connect a read using equivalent identity. Do not key by visible column number or item name, and distinguish deleted/recreated score records.
- `calcPerStudent` in the existing automatic grade-calculation process resolves maxima from default, unit and selected effects before constraining the calculated score to min/max. Reuse maximum-resolution knowledge only; do not apply score clamping or `createRegistData` writes to threshold `T`. the existing score-range reader alone does not cover the lesson-unit layer and cannot be treated as complete resolution.
- **Proposed design:** Separate new rules/results from legacy scalars and store cell identity, current state, used rule/run, time and necessary evaluation context. Design relationships so a deleted rule's result remains readable until rerun; do not rely on cascading deletion. This task submits physical tables, precision, indexes and update ordering for design review. Do not add full rule versioning or a history screen.
- Guarantee `S=T` comparison, finite arithmetic, overflow handling and save/reopen precision centrally. Do not execute arbitrary code; use existing models/repositories and bulk reads, avoiding query-in-loop behavior. Specify writer/consumer consistency, duplicate handling and rejection of stale writes using existing transaction/job mechanisms.
- Receive reference values and formula results/unable-to-evaluate reasons from Task 3; keep current-result storage and invalidation here. Task 4 connects triggers, target sets and transaction boundaries; outputs never recalculate evaluation.

### Dependencies and pending decisions

Cell identity, states and independent fixed/percentage design can start without live aggregation integration. Complete storage after DB design and numeric precision are settled. Pending Task 3 source/formula integration does not block unrelated independent rules. DB design completion is separate from implementation or migration execution.

### Done when

The correct cell state is uniquely saved without changing its score, and all outputs interpret before/after states consistently for rule deletion, inability to evaluate and inapplicability.

## 3. Enable conditions and formulas that reference aggregation

**Main Screen:** [成績入力設定] Grade Entry Settings - `/admin/grade_report_setting/manage`

**Affected Screens:**

- [成績集計] Grade Aggregation - `/admin/grade/grade_setting_system/grade_calc`

**Change scope:** For selected average/group-percentage conditions and formulas, own Task 1 form extensions, their input persistence/validation, source resolution and formula evaluation. Retain item-edit permission and source school/year boundaries. Existing aggregation operations are necessary dependencies; do not create a new ranking-aggregation method.

### Business changes

- Select Aggregation Timing (集計対象時期), Rank Aggregation Settings (順位集計設定), Aggregation Population (集計対象（母集団）) and the correct subject, item and unit. Separate applicability from reference population; extraction filters do not change averages. A fixed threshold whose condition uses an average/percentage is still source-dependent.
- Automatically prioritize a matching finalized aggregation; only if absent use the latest completed aggregation in the same scope. Do not fill missing finalized data from another aggregation or rebuild averages from unaggregated scores.
- Branch on unrounded average `A`/group percentage `R`: `A=49.99` belongs to `<50`. `R` inherits total score/total maximum for the same contributing set in existing aggregation, not the arithmetic mean of individual percentages or the evaluated student's `A/M`.
- Build formulas from left/right operands, four arithmetic operators and per-row rounding. A prior-row reference uses that row's post-rounding result; the final row supplies `T`. A finite negative threshold is valid and is not clamped to zero or maximum. Reject fixed zero divisors, missing operands and forward/self/deleted-row references when saving; runtime zero divisors, missing data and nonfinite values return unable to evaluate to Task 2.
- **Design proposals for review:** Branch operators are `<`/`≤`/`≥`/`>`; operands are average, fixed value/coefficient and a previous row's result. Average operands within a formula share one source; applicability has its own source selection. Rounding position is `p=1..9` (process the p-th decimal digit), with nearest, ceiling and floor. For negative values, nearest sends ties away from zero; up/down mean ceil/floor.

### Technical work

- The existing aggregation-result reader is an existing connection for aggregation settings, population, subjects and timing. Do not assume its current read already supports finalized and unit-specific sources; preserve required unit identity and finalized-source selection throughout.
- Verify totals, scored-student count and total maximum against the same aggregation and contribution scope. Do not replace scored-student count with ranked-student count. Obtain sufficient-precision percentages or constituent values instead of comparing a rounded display value. Zero count, invalid denominators and missing data are not real zero results.
- Refer to condition/formula editing in the automatic-calculation settings controller and `calcResult`, `getCalcValue`, `calcDecimalPlace` in the existing automatic grade-calculation process. Do not expose every existing operand; separate threshold formulas from score writes, NULL writes and min/max clamping. Validate reference meaning after row deletion/reordering.
- Connect settings through Task 1 persistence and formula results through Task 2 evaluation/storage. Repeated use of one source in a run must use the same source instance; changing a condition's source must not silently change the formula's source. Define numeric digits, coefficient range and row limits during engineering design; do not silently round accepted values on save.

### Dependencies and pending decisions

The implementation increment must explicitly select the conditions/formulas. Selected work may start with dummy data; waiting for the integration associated with [source PR #57058](https://github.com/ednity/school-web/pull/57058) does not block all development. This document does not determine that PR's current merge status. This portion is not integration-complete until real sources, finalized priority, lesson units and precision have been verified.

### Done when

Selected conditions/formulas produce thresholds from the correct aggregation source and distinguish missing data from valid negative values when passing results to shared evaluation.

## 4. Update results through registration and batch calculation

**Main Screen:** [成績集計] Grade Aggregation - `/admin/grade/grade_setting_system/grade_calc`

**Affected Screens:**

- [成績登録] Grade Registration - `/admin/nb/grade/grade_setting_system/lesson_group/regist/(:num)`
- [成績CSV登録] Grade CSV Registration - `/admin/nb/grade/grade_setting_system/lesson_group_csv/regist/(:num)`
- [満点一括設定] Bulk Maximum-Score Settings - `/admin/grade/lesson_group/setting?setting_type=change_max_score`
- [成績入力設定] Grade Entry Settings - `/admin/grade_report_setting/manage`
- [試験・採点管理の成績連携] Exam/Marking Grade Linking - detailed screen URL unverified; the linking process is identified below.

**Change scope:** Invoke Task 2 from direct entry, CSV, supported exam linking and batch calculation within grade-registration and existing batch-execution permissions. Bulk maximum settings depend on their existing job path. Maximum definitions and input-field maximum saves are regression-only configuration operations; do not add a school-wide reevaluation trigger.

### Business changes

- Evaluate final values after score limits and related-cell/main-subject updates finish. Include items without AutoRating, manually entered items skipped by recalculation, and exam-linked cells already saved when AutoRating is not called.
- Allow existing batch operations to include schools with only red-score rules. Include old results for items whose last rule was deleted. Do not expand existing school, year, class, student, timing or execution permissions.
- For relative evaluation, set automatic rank aggregation to Do not execute (実行しない), complete inputs, finish green Execute aggregation (集計実行), then finish orange Execute automatic calculation (自動算出実行). Disabling automatic aggregation does not disable registration-time red-score evaluation. Matching finalized aggregation remains preferred; do not add automatic convergence loops or completion tracking for every subject.
- Direct entry, CSV and linking retain their transaction boundaries and keep scores/results consistent. Batch processing distinguishes partial completion and makes updated, unable-to-evaluate and failed scopes identifiable. Queue submission or processed-class counts must not claim every cell has completed evaluation.
- Distinguish not yet rerun after a setting change, an executed evaluation without a valid threshold, and technical failure to save. Provide rerun guidance without infinite retries, exposed internal errors or new publication blocks.

### Technical work

- Direct class-grade registration and CSV grade registration connect score writes, AutoRating, transaction completion and rank aggregation. Use existing authorized timings and affected cell sets; align result persistence before announcing successful score registration.
- Exam-result linking saves scores, then skips AutoRating if `createArgument` does not return the class. Do not place evaluation only inside `AutoRating::calc`; cover these already-written cells too.
- The automatic-calculation execution flow performs main/sub-subject, viewpoint-copy and unit updates after automatic calculation. Determine final affected cells, including downstream updates, rather than evaluating intermediate scores. Do not reuse no-formula returns, manual-input skips or out-of-scope NULL writes as evaluation exclusions or score deletion.
- Align eligibility, target construction and progress in batch-calculation target construction, batch-progress persistence, grade-aggregation control and the grade-aggregation screen. Eligibility must not depend solely on formula presence, and must allow clearing current results after the last rule is removed.
- Do not assume atomic rollback of an entire batch. Connect Task 2 duplicate/order controls with existing job recovery, distinguishing success, business inability to evaluate and storage failure. A new queue platform or school-wide lock is not required.

### Dependencies and pending decisions

Target-cell and transaction integration design can start. Execution requires Task 2; source-dependent integration requires Task 3. Do not assume coverage of the old grade system or school-specific registration paths; identify, investigate and verify paths selected for the increment.

### Done when

All selected registration paths and batch operations keep final scores/current results consistent within authorized scope, including cleanup through reruns after an item loses its last rule.

## 5. Enable red-score extraction and Excel presentation

**Main Screen:** [成績抽出] Grade Extraction - `/admin/nb/grade/grade_setting_system/grade_extraction`

**Affected Screens:** None. Includes this feature's settings/results screens and Excel.

**Change scope:** Own red-student filtering, cell-presentation configuration, saving, reopening and Excel integration for teachers authorized to extract grades. Task 2 shared reads are a dependency; other extraction conditions, the existing palette and hidden values are regression-only concerns.

### Business changes

- Only when the red-score filter is ON, retain students with at least one current red cell within the selected subjects, items, term/timing and units. Out-of-scope red cells do not qualify; zero rows is a valid result.
- Prefix, suffix and cell color are independent options, and prefix/suffix can coexist. Enabled symbols require input. Enabling presentation alone does not filter students; decorate only red cells, not the whole row.
- Use the existing palette and never reveal hidden scores. For red score 24, prefix `※` and suffix `!` produce `※24!`. Invalidated old results affect neither filtering nor decoration.
- Use the same state in the on-screen table and Excel for one output operation without reevaluation. **Proposed defaults:** New filters/effects remain OFF, preserving existing extraction configurations' appearance.

### Technical work

- Connect Task 2 cell states to existing eligibility and result assembly in shared grade-extraction processing and extraction-result assembly. Include the new presentation settings in persistence and readback.
- Excel generation for extraction results accepts posted table data. Derive red status, student eligibility and decoration targets from authorized server-side results, not submitted red flags or thresholds. Reuse existing Excel generation and color support.
- Align subject/timing/unit filter scope with decorated-cell identity. Read results for the same cell set and do not add Excel-only calculations or mix red-score states from a different moment. Additional unrelated report formats are excluded.

### Dependencies and completion

Prepare settings UI once the shared-result shape is agreed. After Task 2/4 integration, verify matching symbols, colors, blanks and values in the screen and an **actual Excel file**, including filter ON/OFF, no matches, old-result invalidation and hidden scores.

## 6. Add nonduplicated red-score effects to published grades

**Main Screen:** [成績公開設定] Grade Publication Settings - `/admin/grade_report_setting/grade_publish`

**Affected Screens:**

- [成績確認] Grade Confirmation - `/student/grade/grade_publish`

**Change scope:** Own configuration for teachers with publication-edit permission and presentation in authorized student/guardian web, related APIs and publication PDF. Depend on Task 2 shared results and Task 4 state updates. Preserve publication schedules, school/year, student/guardian ownership and existing hiding.

### Business changes

- For eligible red-score items, configure and save parentheses or fixed `*` before/after within ordinary/unit-score publication scope. Do not add arbitrary characters, red-student filtering or a red-score-specific background. **Proposed default:** Preserve existing presentation when no effect is configured.
- Combine different estimated-score and red-score effects, applying identical effects once. Parentheses plus prefix `*` give `(*24)`; two prefix `*` effects give `*24`; two parentheses effects give `(24)`; prefix/suffix `*` give `*24*`.
- Honor effective hiding first, exposing neither the score nor a standalone revealing mark. When red status expires, retain estimated-score and other effects that remain valid.
- Do not delete presentation settings with the last rule; apply existing effects to still-valid results before rerun. The renderer must not remove marks immediately based on current rule count. Viewing/re-exporting does not trigger evaluation.

### Technical work

- publication-grade data assembly organizes `GradeService` results for ordinary/unit output and applies existing checkbox effects. Attach Task 2 results to the same cells, then combine/deduplicate effects while preserving hiding. Do not infer estimated/red states from the number of marks.
- Follow publication PDF generation, publication-settings persistence and web/API consumers so they receive identical state/presentation rules. Retain existing bulk reads for batch PDF output.
- Do not reuse report-card first-match logic in a way that conflates presentation rules. Separate eligibility to edit publication settings from the period during which existing results and presentation settings remain usable.

### Dependencies and completion

Prepare against the shared-result contract. After Task 2/4 integration, verify composition, deduplication, hiding and state updates through actual student/guardian viewing paths, APIs and publication PDF. The teacher's student-information screen alone is insufficient.

## 7. Add a red-score condition to report cards

**Main Screen:** [通知表ツール] Report Card Tool - `/admin/grade_report_setting/report_card`

**Affected Screens:** None. Includes cell settings, table update, template copy and PDF within the tool.

**Change scope:** Own the red-score presentation condition, persistence, reopening and output for teachers with report-design permission. Depend on Task 2 cell results and preserve existing specific-subject, checkbox and blank conditions, hiding/diagonals and school-specific template structures.

### Business changes

- Red-score choices are Display as is (そのまま表示), Parentheses (カッコ付き), prepend text or append text. Text is mandatory only for prepend/append. Do not add red-score-specific hiding, diagonals or background colors. **Proposed default:** Display as is.
- After existing hiding/valid-timing controls, evaluate specific subject, checkboxes in existing order, red score, blank, then normal display. Stop at the first match, including Display as is.
- If the estimated-score condition selects parentheses, red score 24 remains `(24)`; if it selects Display as is, it remains `24`, without the red `※`. Do not restore values hidden/crossed out by an earlier condition. Do not change processing into a global search for hiding conditions at any position.
- After completing the dialog, save through Update (更新する) on the table screen. Red-only conditions remain active after reopening, and template copies preserve presentation settings. Do not copy individual evaluation results.

### Technical work

- Add the current-red condition after checkboxes and before blanks in the `evaluate_item` branch of report-card cell formatting. Preserve the returning behavior of Display as is in `formatValueByDisplayValueType`; never apply a stale red mark to an empty cell.
- Report-card table-settings persistence adjusts `use_condition` from existing display choices. Align save, readback and copy so red-only configuration is not disabled. Changing only the dialog is insufficient.
- Attach Task 2 states with the correct unit, timing and subject to the converter's grade input. Use existing PDF generation and verify marks do not overflow cells, disappear or change the template structure. Do not add freezing or file versioning for entire report cards.

### Dependencies and completion

Prepare settings persistence against the shared-result contract. After Task 2/4 integration, verify first-match behavior, red-only settings and state transitions through save/reopen/copy and an **actual PDF**.

## 8. Preserve configuration-transfer operations and legacy behavior

**Main Screen:** [成績入力設定] Grade Entry Settings - `/admin/grade_report_setting/manage`

**Affected Screens:**

- [成績登録] Grade Registration - `/admin/nb/grade/grade_setting_system/lesson_group/regist/(:num)`
- [年度継承・設定の入出力／復元] Year Inheritance and Configuration Import/Export/Restore - detailed operation URLs unverified; existing use cases are identified below.

**Change scope:** Implement selected configuration-copy, year-inheritance, export/import, restore and class-synchronization paths for teachers with existing operation permissions. Legacy red-score data and school-specific consumers are regression-preservation scope. Task 7 owns report-template copying; do not duplicate it here.

### Business changes

- Do not automatically migrate legacy thresholds into active new rules. Preserve legacy meanings and school-specific report comparisons, and do not reset old values when saving new rules. Missing rules, inability to evaluate or ineligibility must not trigger legacy fallback.
- **Proposed behavior for supported paths:** Transfer new rules only within the selected configuration scope, remapping school/year/item/timing/subject/population/unit and preserving order/formula references. Do not copy evaluation results or attach an old year's finalized source directly to the new year.
- **Proposed failure behavior:** Do not substitute same-name data for unmappable references or activate incomplete rules. Report the failed portion and settle handling according to the existing operation's transaction behavior.
- When an old-format file lacks the new red-score section, do not create it from legacy data or silently delete existing rules. Define behavior for each selected import mode. Restore/frame replacement must not reconnect old results to deleted/recreated cells; configuration synchronization alone is not completed reevaluation.

### Technical work

- Configuration copying, academic-year inheritance, configuration export, configuration import and configuration restore handle existing thresholds and item mappings. Use Task 1–3 contracts and existing ID maps for paths receiving new configuration, while preserving legacy-value persistence and import/export.
- copy-data remapping and year-inheritance data remapping handle new item IDs and legacy thresholds. Do not duplicate result IDs; add formula-row, unit and source remapping, and read the saved configuration under destination permissions/context.
- Before implementation, define supported scope, application order and retained data on failure for missing import sections, failback replacement and class synchronization. Do not describe unverified paths as supported; disclose unsupported paths. Do not expand into replacing all school-specific reports with new rules.

### Dependencies and pending decisions

Legacy regression and mapping investigation can start. New configuration-transfer implementation depends on selected paths, decisions for old-format/missing-reference behavior and Task 1–3 contracts. Undecided paths cannot be accepted as complete.

### Done when

Supported configuration transfers preserve relationships and permissions without reusing personal results or breaking existing legacy red-score behavior.

## Starting work and completing integration

- **Scope/design review:** This breakdown is reviewable. The sent Q&A, including Q3, is answered; do not reopen the same questions.
- **Work that can proceed:** Cell/state/DB design, configuration/output contracts, independent fixed/percentage work and dummy-data preparation for selected source-dependent capabilities. Implementation starts according to each increment's selected types/paths and required design confirmation.
- **Required before complete integration:** The increment list, UI proposal decisions, persistence precision and DB design, real aggregation checks for finalized/unit/precision behavior, supported configuration-transfer paths, and executed verification of each input and all three outputs. Documents and source inspection do not establish implementation, QA or release completion.

Excluded: free-form formulas, arbitrary scripts/variable systems, direct evaluation of selection-type scores, new ranking methods, automatic legacy migration, school-wide dependency tracking, endless aggregation reruns, publication blocks due to missing red-score results, and version management for entire report cards.
