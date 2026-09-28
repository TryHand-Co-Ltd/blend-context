# Coding conventions

Source: [コーディング規約](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E3%82%B3%E3%83%BC%E3%83%87%E3%82%A3%E3%83%B3%E3%82%B0%E8%A6%8F%E7%B4%84?version=1), version 1. Compared live on 2026-09-09; source updated 2025-12-26T03:49:56Z. See [source audit](../evidence/2026-09-09-wiki-source-audit.md) for interpretation and coverage limits.

## Naming

| Element | Convention | Example |
|---|---|---|
| Class | PascalCase | `StudentReport` |
| Variable | snake_case | `$student_data` |
| Method | camelCase | `getStudentData()` |
| Table | snake_case, normally plural | `students` |
| Model | Singular plus `_m` | `Student_m` |

- Prefix related tables with the feature name so they remain grouped, for example `admissions`, `admission_applicants`, and `admission_exams`.
- Distinguish master and transaction data with meaningful prefixes.
- Suffix administrator configuration tables with `_conf` where appropriate.
- Apply judgment only where the domain makes the standard form misleading; explain the exception.

## PHP format

- Base formatting on PSR-12, with the BLEND-specific rules below taking precedence.
- Indent with hard tabs (`\t`), not spaces.
- Use single quotes for strings and array keys unless interpolation or escape semantics require double quotes.
- Initialize arrays with `[]`, never `array()` in new or touched code.
- Put one space between control keywords and `(`, and place braces consistently.
- Leave a blank line before a method and add a short purpose comment, as the Wiki requests; this is not conditional on surrounding legacy code already having comments.

```php
class StudentReport
{
	// Retrieve report data
	public function getStudentData(array $student_ids): array
	{
		$student_data = [];
		return $student_data;
	}
}
```

## Review all touched lines

Do not dismiss these rules as cosmetic. Correct naming and formatting on every touched line while avoiding unrelated repository-wide reformatting.
