# Implementation notes

Source: [実装上の注意](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E5%AE%9F%E8%A3%85%E4%B8%8A%E3%81%AE%E6%B3%A8%E6%84%8F?version=6), version 6. Compared live on 2026-09-09; source updated 2026-01-07T05:38:03Z. See [source audit](../evidence/2026-09-09-wiki-source-audit.md) for interpretation and coverage limits.

## Data access

- Check the applicable `school_id` before protected data is exposed or mutated. A single-record lookup by ID followed by controller checks is allowed; checks need not all be SQL predicates.
- For year-bearing data, check both `school_id` and the logged-in academic year.
- Enforce feature-specific permissions: homeroom/sub-homeroom teacher, course teacher, feature owner, administrator, admissions permissions, QR-only users, and other configured scopes.
- Inspect the feature's administrator settings and consult a knowledgeable owner when permission behavior is unclear.

## Routes

- Declare the HTTP method for every new route.
- Add a purpose comment to the route. POST also applies when request information should not appear in a URL; do not mechanically turn a sensitive read into GET.
- Use GET to display/read and POST for registration, update, deletion, or any side effect.
- PUT and DELETE are not required by the current framework convention.
- Route identical paths to different controller methods when GET and POST share a URL. Extract shared logic instead of merging side-effect and display behavior.

```php
$route['admin/example']['GET'] = 'example/AdminExampleController/example'; // Display example
$route['admin/example']['POST'] = 'example/AdminExampleController/postExample'; // Save example
```

## Queries

- Fetch sets in one query instead of querying inside `foreach` loops.
- Keep database access out of global login/menu initialization paths where possible. Consider caching such as Redis before adding repeated table access to `initSchool()` or shared constructors.

## UI and wording

- Render dates as `Y年n月j日` unless a school explicitly requires another form; do not zero-pad month/day.
- Keep button text and colors consistent across the system. Use `更新する` for edit-page save/update actions where applicable. The Wiki's historical note says office, admissions, and career-management functions had not yet been migrated; verify touched behavior rather than treating that rollout note as a permanent exemption.
- Put a full-width space between family and given name in reports.
- Prefer `教員`; use `教職員` when administrative staff are included.
- Prefer explicit destructive wording such as `生徒データを削除` rather than ambiguous `生徒を削除`.
- Use the existing `$this->student_label_name` for school-dependent pupil/student wording and `$this->use_student_number` for the configured number label; see [shared-development.md](shared-development.md).
- Read [view-rules.md](view-rules.md) for PHP comments, template literals, selects, partials, and common modals; read [school-specific-rules.md](school-specific-rules.md) before adding school-specific branches.

## Shared core and API impact

When changing any file below, test the related application API with Postman as well as the web flow:

| File | Required impact check |
|---|---|
| `Login.php` | Login API `/api/login` |
| `AdminController.php` | An API inheriting the controller, such as `/api/attendance/mygroup` |
| `StudentController.php` | Student/guardian API such as `/api/student/attendance/weekly` |
| `common_helper.php` | Every API using the changed or added function |

For changes to any of these four shared files, the Wiki requires the implementer to test the affected API with Postman and the release-label owner to verify on a real device after release. Browser-only or static proof does not satisfy that requirement. For the procedure and shared web/API logic, see [shared-development.md](shared-development.md).

## Models

- Load every model used by a controller in its constructor.
- Move existing mid-flow model loads into the constructor when touching that logic.
- Do not load a model again when an ancestor already loads it.
- Read [model-rules.md](model-rules.md) before adding model methods or changing query/replica behavior.

```php
public function __construct()
{
	parent::__construct();
	$this->load->model('Student_m', '', true);
}
```
