[CmdletBinding()]
param(
    [ValidateSet('Generate','Check')][string]$Mode = 'Check',
    [string]$SourceRoot = (Join-Path $PSScriptRoot '..'),
    [string]$Output = '',
    [string]$Python = 'python',
    [ValidateSet('in-progress','complete')][string]$Phase = 'in-progress'
)
$ErrorActionPreference = 'Stop'
$SourceRoot = (Resolve-Path -LiteralPath $SourceRoot).Path
if ([string]::IsNullOrWhiteSpace($Output)) { $Output = Join-Path $SourceRoot 'test-report.vi.xlsx' }
$scripts = Join-Path $PSScriptRoot 'blend-kit-report/scripts'
if ($Mode -eq 'Generate') {
    & $Python (Join-Path $scripts 'export_report.py') --source-dir $SourceRoot --output $Output --language vi
} else {
    & $Python (Join-Path $scripts 'check_report.py') --source-dir $SourceRoot --report $Output --language vi --phase $Phase
}
if ($LASTEXITCODE -ne 0) { throw "Test report $Mode failed; existing report/source remain preserved." }
