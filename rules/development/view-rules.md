# View and shared-modal rules

Sources: `Viewファイル`, `共通モーダルの実装方針`, `処理・参照の共通利用情報`, and `UI-スペース-メモ`. See [source audit](../evidence/2026-09-09-wiki-source-audit.md) for versions and access limits.

## Required view conventions

- Write internal/developer/school-specific comments as PHP comments, not HTML comments that reach every school's browser.
- Do not use JavaScript template literals in Blend view code. Use string concatenation. The Wiki reports an environment-dependent interpolation problem; preserve the project rule without presenting its unconfirmed explanation as general PHP behavior.
- Add `no-nice` to every select's class list to disable Nice Select. Preserve other required classes.
- Extract repeated common DOM into a partial and reuse it. Do not create a generic component framework for one occurrence.
- Escape user-controlled output, quote attributes, and include/register CSRF protection as specified in [security.md](security.md).
- Use existing student/number labels, error-link helpers, and shared error-table styling described in [shared-development.md](shared-development.md).

## Common modals

Apply these conventions when implementing or changing the shared selection modals; they are not a mandate to redesign unrelated dialogs.

- Reuse the existing modal partials, including `_modal_hr_student_link_select.php`, `_modal_hr_student_checkbox_select.php`, `_modal_s_group_student_checkbox_select.php`, `_modal_s_group_link_select.php`, `_modal_teacher_select.php`, and `_modal_t_com_group_select.php`, after locating their current definitions.
- Put modal data retrieval in `Teacher_modal_data.php` or `Student_modal_data.php`. The controller should call the appropriate library and return the result. Shared modal JavaScript belongs in its partial; screen-specific behavior stays with that screen.
- The documented student-modal response contract is body `status` 200 for success, 301 for no members, and 300 for missing ID or mismatched school. These are response-body values, not an instruction to use those HTTP statuses. For 300, close the modal and reload the parent; for 301, show the relevant empty-state wording.
- The teacher-modal 200/301/300 unification is explicitly marked **not implemented** in the source because other Ajax callers still exist. Inspect current callers and behavior before changing it; do not report all legacy teacher responses as mandatory-rule failures.
- The guide puts the ID in the URL and uses POST for additional parameters. Keep server permissions and the sensitive-request rule in force.
- Use the documented loading wording for the modal kind (`リスト表示中…`, `グループ所属のメンバーを表示中…`, or the student-membership wording). Do not infer complete teacher support from the design examples.
- Backdrop click closes the modal. Match shared modal sizing: the guide gives `width: 650px`, `min-height: 200px`, `max-height: 80%`, with minimum responsive behavior so the modal remains visible and operable.
- Use `delete_char` from `select_modal.css` for delete wording, including validation-error states.
- `append_target` (and `append_msg_target` when used) identifies a parent element by ID. Preserve the specific modal's options such as `with_picture`, `only_belong_hr`, `type_name`, `call_screen_name`, `check_access_setting`, and `has_admin_exclusion` when applicable; verify current signatures instead of copying incomplete Wiki examples.

## Visual source limit

`UI-スペース-メモ` contains screenshots rather than explicit numeric spacing rules. Its text and attachment metadata were read, but the three images could not be viewed through the configured connector (missing attachment MIME type; download disabled). Do not invent spacing values or claim screenshot parity. For a task requiring those exact layouts, obtain the images through an authorized supported path and compare them before claiming compliance.
