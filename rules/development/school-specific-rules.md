# School-specific branches

Sources: `学校IDで条件分岐` and `参考情報や気を付けたいこと`. See [source audit](../evidence/2026-09-09-wiki-source-audit.md).

- In shared code, keep the school-ID condition separate from additional conditions such as year or feature settings. Set the normal behavior first, then nest the school-specific subconditions within the school branch.
- Compare the logged-in `school_id` with the existing configured school-ID key (for example `test_school_id`). Prefer this to a `school_code` comparison so school customization remains discoverable. Resolve the actual config key from the project; do not invent a new ID or copy the Wiki's `scool_id` typo.
- The Wiki asks developers to consult the team where possible before adding a school branch to an existing shared file. Check whether the agreed design/task already covers the customization. If the business scope or impact is unresolved, prepare a concrete proposal for the responsible owner; this recommendation is not an automatic requirement to stop every authorized local edit.
- Keep school authorization separate from customization: entering the correct school-specific branch does not replace the permissions/ownership checks.

Preferred shape (illustrative; adapt the normal/special behavior to the actual task):

```php
$data = $normal;
if ($this->login_data['school_id'] == $this->config->item('test_school_id')) {
	if ($this->login_data['year'] >= 2024) {
		$data = $special;
	}
}
```

The Wiki rejects combining the school and year into a single long `if` condition in shared customization code. Review both the target school and non-target-school behavior when changing it.
