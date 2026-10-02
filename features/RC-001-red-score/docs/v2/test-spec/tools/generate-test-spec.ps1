<##
.SYNOPSIS
  Validate and publish the RC-001 test-spec workbook with a reproducible manifest.

.DESCRIPTION
  Markdown is authoritative. The checked-in workbook is the rendered workbook
  template/output. This entrypoint validates the Markdown-to-workbook ID and
  coverage contract, copies the workbook to the requested output, and writes a
  manifest containing source hashes and generator version.
#>
[CmdletBinding()]
param(
    [ValidateSet('Generate','Check')]
    [string]$Mode = 'Generate',
    [string]$SourceRoot = (Join-Path $PSScriptRoot '..'),
    [string]$Output = '',
    [string]$Manifest = ''
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$GeneratorVersion = 'rc001-test-spec-generator@1.0.0'

$SourceRoot = (Resolve-Path $SourceRoot).Path
$cases = Join-Path $SourceRoot 'test-cases.vi.md'
$data = Join-Path $SourceRoot 'test-data.vi.md'
$scope = Join-Path $SourceRoot 'scope-and-approach.vi.md'
$defaultWorkbook = Join-Path $SourceRoot 'test-case-report.xlsx'
if ([string]::IsNullOrWhiteSpace($Output)) { $Output = $defaultWorkbook }
if ([string]::IsNullOrWhiteSpace($Manifest)) { $Manifest = Join-Path $SourceRoot 'generation-manifest.json' }

foreach ($path in @($cases,$data,$scope,$defaultWorkbook)) {
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { throw "Missing required source: $path" }
}

function Get-UniqueCaseIds([string]$Path) {
    $text = Get-Content -LiteralPath $Path -Raw
    $ids = [regex]::Matches($text, '(?m)^###\s+(TC-RS-[A-Z]+-\d{3})\b') |
        ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique
    return @($ids)
}

function Get-UniqueAcIds([string]$Path) {
    $text = Get-Content -LiteralPath $Path -Raw
    $ids = [regex]::Matches($text, '\bAC-G(?:0[1-9]|[1-3]\d|40)\b') |
        ForEach-Object { $_.Value } | Sort-Object -Unique
    return @($ids)
}

function Get-WorkbookXml([string]$Path) {
    $temp = Join-Path ([IO.Path]::GetTempPath()) ('rc001-generator-' + [guid]::NewGuid().ToString('N'))
    New-Item -ItemType Directory -Path $temp | Out-Null
    try {
        Expand-Archive -LiteralPath $Path -DestinationPath $temp
        $files = Get-ChildItem -LiteralPath (Join-Path $temp 'xl') -Recurse -File -Filter *.xml
        return [pscustomobject]@{
            Text = (($files | ForEach-Object { Get-Content -LiteralPath $_.FullName -Raw }) -join "`n")
            Temp = $temp
        }
    } catch {
        if (Test-Path $temp) { Remove-Item -LiteralPath $temp -Recurse -Force }
        throw
    }
}

$caseIds = Get-UniqueCaseIds $cases
if ($caseIds.Count -ne 216) { throw "Expected 216 unique Markdown case IDs, found $($caseIds.Count)." }
$acIds = Get-UniqueAcIds $scope
$expectedAc = 1..40 | ForEach-Object { 'AC-G{0:D2}' -f $_ }
$missingAc = @($expectedAc | Where-Object { $_ -notin $acIds })
if ($missingAc.Count -gt 0) { throw "Missing AC mappings: $($missingAc -join ', ')" }

$xmlInfo = Get-WorkbookXml $defaultWorkbook
try {
    $xml = $xmlInfo.Text
    $workbookIds = [regex]::Matches($xml, '\bTC-RS-[A-Z]+-\d{3}\b') |
        ForEach-Object { $_.Value } | Sort-Object -Unique
    $missingInWorkbook = @($caseIds | Where-Object { $_ -notin $workbookIds })
    $extraInWorkbook = @($workbookIds | Where-Object { $_ -notin $caseIds })
    if ($missingInWorkbook.Count -gt 0) { throw "Workbook is missing case IDs: $($missingInWorkbook -join ', ')" }
    if ($extraInWorkbook.Count -gt 0) { throw "Workbook contains unknown case IDs: $($extraInWorkbook -join ', ')" }
    if ($xml -match '08-test-data\.vi\.md|204 case|204/204') { throw 'Workbook contains stale source/count text.' }
} finally {
    if (Test-Path $xmlInfo.Temp) { Remove-Item -LiteralPath $xmlInfo.Temp -Recurse -Force }
}

if ($Mode -eq 'Generate') {
    $outputFull = [IO.Path]::GetFullPath($Output)
    $manifestFull = [IO.Path]::GetFullPath($Manifest)
    $outputDir = Split-Path -Parent $outputFull
    $manifestDir = Split-Path -Parent $manifestFull
    New-Item -ItemType Directory -Force -Path $outputDir,$manifestDir | Out-Null
    if ($outputFull -ne ([IO.Path]::GetFullPath($defaultWorkbook))) {
        Copy-Item -LiteralPath $defaultWorkbook -Destination $outputFull -Force
    }
    $manifestObject = [ordered]@{
        generator = $GeneratorVersion
        command = "pwsh -File tools/generate-test-spec.ps1 -Mode Generate -SourceRoot ."
        generatedAt = (Get-Date).ToUniversalTime().ToString('o')
        sourceRoot = $SourceRoot
        sources = [ordered]@{
            cases = [ordered]@{ path = 'test-cases.vi.md'; sha256 = (Get-FileHash $cases -Algorithm SHA256).Hash }
            data = [ordered]@{ path = 'test-data.vi.md'; sha256 = (Get-FileHash $data -Algorithm SHA256).Hash }
            scope = [ordered]@{ path = 'scope-and-approach.vi.md'; sha256 = (Get-FileHash $scope -Algorithm SHA256).Hash }
        }
        workbook = [ordered]@{ path = [IO.Path]::GetFileName($outputFull); sha256 = (Get-FileHash $outputFull -Algorithm SHA256).Hash }
        counts = [ordered]@{ cases = $caseIds.Count; acceptanceCriteria = 40; variants = 13 }
    }
    $manifestObject | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $manifestFull -Encoding UTF8
    Write-Output "Generated/validated $outputFull"
    Write-Output "Manifest: $manifestFull"
} else {
    Write-Output "CHECK PASS: $($caseIds.Count) case IDs, 40 AC IDs, workbook aligned."
}
