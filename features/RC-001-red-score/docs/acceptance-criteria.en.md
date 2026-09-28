# Red scores — Acceptance criteria

**Updated:** September 28, 2026.

Acceptance criteria for red-score configuration, evaluation and result presentation.

`S` = final saved score; `M` = current effective maximum; `A` = source aggregation's unrounded average; `R` = its unrounded group percentage; `T` = threshold after selected rounding. Aggregation conditions/formulas apply to increments that select those types.

## Permissions, eligible items and settings

- [ ] **AC-G01 — Permissions and data scope:** Ordinary teachers may configure items with feature access and item-edit permission, which does not itself grant batch execution. Enforce school/year/item/class/unit authorization for display, save, delete, reorder and source selection; retain each registration/extraction/publication/report permission. Rejected ID tampering preserves settings, scores and results.
- [ ] **AC-G02 — Eligible input types:** Evaluate integer, decimal and lesson-unit numeric items, not A/B/C or Pass/Fail (合否) selection items directly. Existing selection filters may still restrict applicability for numeric items.
- [ ] **AC-G03 — Cell identity:** Associate results with student, school, year, class/subject, item, term/timing and unit, without mixing same-name items or different units. Do not attach old results to cells recreated after deletion.
- [ ] **AC-G04 — Save and reopen multiple rules:** The list identifies item/type/timing; when empty, show an unconfigured state and an add action without creating rules from legacy values or a “below 30” default. Edit multiple rules through Applicability Conditions (適用条件) and Threshold Settings (基準設定), faithfully reopening saved names, order, conditions, thresholds, comparisons, rounding and summaries. Renaming preserves relationships; cancellation/save failure preserves saved settings/results.
- [ ] **AC-G05 — Applicability and source requirements:** “All” remains within authorized scope; supported subject/subject-area, grade, class/group and selection filters use OR within types and AND across types. Require sources if conditions or thresholds use averages/percentages, never dropping conditions when data is missing; otherwise omit unused source fields and requirements.
- [ ] **AC-G06 — First match in priority order:** Select the first matching rule before calculating, without choosing a stricter threshold instead. An indeterminate potentially applicable higher condition or an uncomputable selected rule means unable to evaluate, not trying lower rules. Independently established ineligibility needs no aggregation source for that rule.

## Thresholds, maximum and precision

- [ ] **AC-G07 — Comparison boundaries and warnings:** Less than (未満) excludes `S=T`; Less than or equal to (以下) includes it, without rounding `S`. When information is sufficient, zero/full-mark warnings follow final `T` and comparison without changing values or misreporting `A−0` as threshold zero.
- [ ] **AC-G08 — Fixed points:** Validate `0≤N≤M` for every target when saving or expanding scope, rejecting invalid settings without substitution or automatic correction. A valid saved fixed value remains `T=N` after maximum changes; independent applicability requires neither an average nor a positive maximum for calculation.
- [ ] **AC-G09 — Current effective maximum:** Resolve default, valid unit override, then the class selection actually applied; absent unit exceptions use the applicable default. Do not substitute a choice definition/code, highest observed score, group total maximum, unconditional 100 or the finalized aggregation's historical maximum.
- [ ] **AC-G10 — Maximum percentage:** Accept 0–100 and calculate `M×N/100` with only selected rounding, defaulting to none. Zero, negative, nonfinite or unresolved runtime `M` means unable to evaluate, not a conclusion based on a substitute value.
- [ ] **AC-G11 — Numeric preservation:** Save/reopen values within published input limits without truncation and compare `S=T` correctly. Reject nonnumeric, infinite and out-of-range inputs; do not convert runtime overflow into red/non-red.

These boundary examples belong to the rules above rather than separate ACs.

| Rule | Condition → result |
| --- | --- |
| Priority | Both rules apply: priority 1 `<20`, priority 2 `<30`, `S=25` → non-red |
| Maximum overrides | Default 100, unit 40, class selection 50 → 50; without class selection → 40 |
| Percentage rounding | `M=75`, 30%, `S=22.2`, Less than → red at unrounded 22.5, non-red at explicitly floored integer 22 |
| Current maximum | Current 50, aggregation-time 100, 30%, `S=20`, Less than → `T=15`, non-red |
| Zero/full-mark boundary | For nonnegative scores, `T=0` with Less than includes nobody; Less than or equal to includes zero. At `T=M`, Less than excludes full marks; Less than or equal to includes them |

## Aggregation sources and formulas

- [ ] **AC-G12 — Reference scope:** Match Aggregation Timing (集計対象時期), Rank Aggregation Settings (順位集計設定), Aggregation Population (集計対象（母集団）), subject/item/unit; extraction filters must not change the population. Conditions/formulas use their respective saved sources without one edit changing the other or one run mixing different moments of the same source.
- [ ] **AC-G13 — Finalized priority and missing data:** Prefer a valid finalized aggregation in the matching scope; only if absent use the latest completed aggregation. Missing selected data or no suitable aggregation means unable to evaluate: no other timing/population/ordinary aggregation, unaggregated scores or zero substitution, and no option to bypass finalized data.
- [ ] **AC-G14 — Consistent unrounded values:** Branch on unrounded averages/percentages; averages use the same aggregation's scored-student count, not ranked-student count, and percentage numerator/denominator use the same contributing set. Average 49.99 belongs to `<50` despite display 50; subsequent rounding cannot change the branch, and zero count, invalid total maximum or uncertain correspondence means unable to evaluate.
- [ ] **AC-G15 — Existing group percentage:** Use existing rank aggregation's total score/total maximum, not average individual rates or recalculation using the evaluated student's maximum. Mixed maxima require no special calculation or configuration ban and must not alone stop processing, but invalid data remains invalid.
- [ ] **AC-G16 — Formula rows and rounding:** Build selected formulas from rows of four arithmetic operations, without free-form expressions, scripts or arbitrary functions. Prior-row references use post-rounding values and the final row supplies `T`; do not use shortened display values or perform score writes, NULL writes or score min/max clamping.
- [ ] **AC-G17 — Formula save validation:** Require at least one complete row; reject missing operands, fixed zero divisors and self/forward/deleted-row references. Deleting/reordering rows must not silently redirect references to a different formula now occupying the same number.
- [ ] **AC-G18 — Negative thresholds:** A finite, correctly calculated negative `T` is valid and compared normally without clamping to zero. At `T=−5`, nonnegative scores are non-red; where negatives are allowed, −6 is red with Less than and −5 only with Less than or equal to.

A group with 60/100 and 80/100 yields 70%, matching at least 65%. For formula `A÷2` then multiply by 0.8 with `A=49.7`, flooring the first row to an integer gives 19.2; no rounding gives 19.88.

## Scores and result updates

Apply red marks/filtering only to effective red results; absence of a result means neither red nor an evaluated pass.

- [ ] **AC-G19 — Final score to evaluate:** Use saved values after calculation, limits and related updates, including manual, estimated (見込点), numeric Not taken (未受験) and valid zero, regardless of AutoRating or ranking eligibility. Keep estimated/red states independent; blank/NULL/deleted/unused scores are not zero and lose old red marks/filter effects while retaining normal blank presentation.
- [ ] **AC-G20 — States after execution:** Distinguish red, non-red, never evaluated, unable to evaluate, not applicable and no score; never evaluated/unable to evaluate is not a pass. Preserve scores and stop old results according to the table once the execution outcome is successfully saved.

| Execution outcome | Current result and subsequent behavior |
| --- | --- |
| Sufficient information establishes every rule is ineligible | Not applicable; stop old marks/filter effects without treating this as passing a threshold |
| Required source/operand missing, division by zero, nonfinite value or another inability to form a threshold | Unable to evaluate; stop using the old result as current, without substituting lower rules, another source, zero or legacy red scores |
| Cause repaired but only settings/source saved | No new evaluation yet; a successful rerun updates to red/non-red |

- [ ] **AC-G21 — Retention before rerun and last-rule deletion:** Threshold/comparison/formula/priority/eligibility/source/aggregation changes or deleting the last rule alone retain prior results and saved presentation settings/effects. Distinguish saving from evaluation completion and guide reruns; subsequent registration/batch execution confirming no rules changes the state to not applicable. Publication must not immediately remove marks based only on rule count.
- [ ] **AC-G22 — Shared result and update order:** All three outputs read the same cell's effective result; identical reruns produce the same result without duplicating results/marks. An older run finishing late cannot overwrite results based on newer scores/settings or present mixed score/evaluation moments as success.

Examples: intermediate 120 saved as 100 evaluates 100; manual 28→35 evaluates 35. Score 32 stays non-red when `<30` changes to `<35` only in settings, becoming red after successful reevaluation.

## Registration, batch execution and failures

- [ ] **AC-G23 — Registration and rerun coverage:** Supported direct entry, CSV, exam linking and batches evaluate authorized classes/timings/students and related cells actually updated. Cover absent AutoRating, manual skips, post-link calculation skips, red-rule-only configurations and deletion of the last rule, without expanding into unrelated school-wide reevaluation.

| Execution condition within AC-G23 | Required outcome |
| --- | --- |
| Execution method | No separate red-score manual/automatic mode; follow registration and existing batch calculation |
| Source-dependent and independent cells in one run | A cell missing its source is unable to evaluate, while other independently evaluable cells, such as fixed-threshold cells, are still processed. This does not mean trying lower rules for the same cell |

- [ ] **AC-G24 — Maximum/unit change triggers:** Saving definitions or input-field maxima alone does not immediately reevaluate every score; class registration and available, authorized bulk maximum settings update results after successful existing calculation. Unit-score deletion/disabling stops old results; calculation support for units does not establish unit selection on every configuration screen.
- [ ] **AC-G25 — Relative-evaluation order:** Set automatic rank aggregation to Do not execute (実行しない), complete inputs, finish Execute aggregation (集計実行), then finish Execute automatic calculation (自動算出実行). Retain registration-time evaluation and finalized-source priority; do not add convergence loops even if calculation changes reference scores.
- [ ] **AC-G26 — Save success and safe notifications:** Keep scores/results consistent within existing direct-entry/CSV/linking transaction boundaries; storage failure must not be reported as successful evaluation or completed invalidation. Distinguish saved, not updated, unable-to-evaluate and failed work with actionable guidance, without internal errors/unauthorized data or execution of entered names/symbols as code.
- [ ] **AC-G27 — Partial batch completion:** Distinguish updated, unable-to-evaluate and technically failed scopes; queue submission/class counters do not prove all cells succeeded. Do not claim full rollback of partially completed work; allow repair and rerun of failed scope.
- [ ] **AC-G28 — Viewing/output does not reevaluate:** Never evaluated, unable to evaluate or awaiting rerun alone must not block extraction/publication/report cards; retain each feature's permissions, schedules and hiding. Viewing, Excel, publication and reprinting do not trigger evaluation or aggregation.

## Three outputs

- [ ] **AC-G29 — Extraction filtering:** Only when enabled, retain students with at least one effective red cell in selected subjects/items/timings/units. Out-of-scope red cells do not qualify; zero results is valid and other filters retain their meaning.
- [ ] **AC-G30 — Extraction cell presentation:** Apply prefix/suffix and existing-palette colors only to red cells; enabled symbols require input and can coexist. Decoration alone does not filter students, reveal hidden scores, retain stale effects on invalid/blank cells or force example colors on every template (24 with prefix `※`, suffix `!` → `※24!`).
- [ ] **AC-G31 — Excel parity and authority:** The screen and actual Excel for one output agree on targets, symbols, colors, blanks and values. Tampered submitted red flags/thresholds cannot alter server conclusions or authorized scope.
- [ ] **AC-G32 — Publication settings and hiding:** Save/reopen parentheses and fixed `*` before/after for eligible ordinary/unit items, without arbitrary text, red-student filters or dedicated backgrounds. Marks must not expose hidden scores/states; after red status expires, retain estimated-score and other valid effects, backgrounds and formatting.
- [ ] **AC-G33 — Publication effect composition:** Combine different estimated/red effects and apply identical effects once. Parentheses plus prefix `*` give `(*24)`; two prefix effects give `*24`; two parentheses effects give `(24)`; prefix/suffix `*` give `*24*`.
- [ ] **AC-G34 — Publication ownership, period and outputs:** Students/guardians see only authorized ownership, school, year and publication-schedule scope. Student web, related APIs and publication PDFs agree on each cell's state, presentation and hiding.
- [ ] **AC-G35 — Report-card presentation choices:** Red choices are Display as is (そのまま表示), Parentheses (カッコ付き), prepend text and append text; only prepend/append require text. Do not add red-specific hiding, diagonals or backgrounds, while retaining them in existing conditions.
- [ ] **AC-G36 — Report-card first match:** After existing hiding/timing controls, evaluate specific subject, checkboxes in existing order, red, blank, then normal display, stopping at the first match. Display as is also stops, with no later search for hiding. A higher estimated condition gives `(24)` or `24` as configured, without adding red `※` or undoing hiding/diagonals.
- [ ] **AC-G37 — Report-card save, copy and PDF:** After the dialog, Update (更新する) on the table saves choices/text for reopening/template copy even with only a red condition; personal results are not copied. Actual PDFs after save/reopen and state updates use correct subjects/timings/units and condition order without stale marks on blanks, lost/overflowing marks or changed structure; do not add whole-report freezing/versioning.

## Legacy behavior, configuration transfer and implementation scope

- [ ] **AC-G38 — Preserve legacy red scores:** Do not migrate, reinterpret or reset legacy thresholds as new rules or use them as fallback for absent/unmatched/incomplete rules. Preserve their existing behavior in school-specific reports, copying, year inheritance, import/export, restore and synchronization.
- [ ] **AC-G39 — No old results for new destinations:** Configuration synchronization is not completed evaluation, and restore/frame replacement must not attach removed cells' results to new cells. Supported transfers must not reuse an old year's finalized aggregation or personal results as results for new targets.
- [ ] **AC-G40 — Increment scope:** Identify types, conditions/formulas, schools/permissions, registration paths and configuration-transfer paths; unsupported capabilities must not appear active. Complete selected scope from configuration through evaluation/storage to all three outputs, verifying aggregation-dependent processing with actual aggregation data.

## Design details

The following design proposals supplement the acceptance criteria and apply within each increment's implemented feature scope.

| Area | Design approach |
| --- | --- |
| Add/switch | Append new rules with fixed points, Less than and an empty value. Incomplete rules stay inactive; empty restricted filters are errors. Temporarily retain type-specific input during an edit, reopen only the saved type, and add no history for all types |
| Conditions/formulas | Branch with `<`/`≤`/`≥`/`>`; operands are average, fixed value/coefficient and prior-row result, with one average source per formula. Formulas and operands follow each increment's implementation scope |
| Rounding UI | Propose no rounding by default for formulas too; position `p=1..9`, initially 1 when enabled, retaining `p−1` digits. Require a method. Nearest sends ties away from zero; up/down mean ceil/floor (−5.2→up −5/down −6; −5.5→nearest −6) |
| Defaults/wording | New extraction filters/effects OFF, publication effects unset, report cards Display as is. Messages identify the need to rerun, missing-data reasons and the scope left unupdated after errors |
| Input limits | Engineering design defines precision, digits, name length, coefficient range and row limits, retaining AC-G11 boundary comparison, finite values and no silent truncation |
| Configuration transfer | Remap items/timings/subjects/populations/units/formula rows within implementation scope. Propose keeping unmappable rules inactive and notifying users; handle missing new sections in old-format files and update/rollback scope according to each supported path. Never create from legacy or silently delete current rules |
