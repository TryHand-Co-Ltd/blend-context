# Security rules

Source: [脆弱性対策](https://mw-dev.cloud.redmine.jp/projects/dev_conflu/wiki/%E8%84%86%E5%BC%B1%E6%80%A7%E5%AF%BE%E7%AD%96?version=2), version 2. Compared live on 2026-09-09; source updated 2026-01-07T05:34:25Z. See [source audit](../evidence/2026-09-09-wiki-source-audit.md) for interpretation and coverage limits.

## Validation

- Validate every external value on the server. Client-side JavaScript validation is supplemental only.
- Centralize repeated validation to prevent inconsistent checks.

## XSS

- Escape user-entered values with `html_escape()` whenever rendering them, including values read back from the database.
- Quote every HTML attribute value.

```php
<input type="text" name="name" value="<?= html_escape($form_data['name']) ?>">
```

## CSRF

- Protect every form that POSTs, including forms not currently perceived as mutations.
- Include the CSRF token as a hidden field:

```php
<input type="hidden" name="<?= $this->csrf['name'] ?>" value="<?= $this->csrf['hash'] ?>">
```

- Add the route to `system/core/Security.php::$csrf_include_uris` when it is not already covered by an existing expression.

## SQL injection

- Use CodeIgniter Active Record/Query Builder by default.
- Use bind variables whenever raw SQL through `query()` is unavoidable. Never concatenate request data into SQL.

## Directory traversal

- Avoid accepting server filenames directly from external parameters.
- When unavoidable, sanitize with `sanitize_filename()` and constrain the resolved path to the intended directory.

## Sensitive information

- Use POST for requests containing information that should not appear in URLs. Use GET only when all request information is safe to expose.
- Prevent browser caching of sensitive pages as appropriate to the requirements and usability. The Wiki shows `Cache-Control: no cache`, but that spelling is a source-example issue, not a literal implementation contract; use a valid response-header policy for the required behavior.
- Do not reveal secrets, internal implementation details, stack traces, raw SQL, or whether a login ID versus password was incorrect.
- Do not leave unnecessary internal or developer information in HTML comments.

The shared-processing Tips page loosely groups `html_escape()` with CSV XSS/SQL-injection advice. Keep the defenses distinct: output-context escaping for XSS, Query Builder/bind parameters for SQL injection. For error messages containing intentional link markup, the Wiki allows escaping dynamic text in the controller; reuse the existing helper, preserve trusted markup, and avoid double escaping. Do not interpret that exception as permission to output unescaped input.
