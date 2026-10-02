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
$GeneratorVersion = 'rc001-test-spec-generator@1.1.0'

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

function Get-NormalizedSha256([string]$Path) {
    $text = Get-Content -LiteralPath $Path -Raw
    $normalized = $text -replace "`r`n", "`n" -replace "`r", "`n"
    $bytes = [Text.Encoding]::UTF8.GetBytes($normalized)
    $sha = [Security.Cryptography.SHA256]::Create()
    return ([BitConverter]::ToString($sha.ComputeHash($bytes))).Replace('-', '')
}

function Get-TableCaseIds([string]$Path, [string]$Column) {
    $doc = New-Object System.Xml.XmlDocument
    $doc.Load($Path)
    @($doc.SelectNodes("//*[local-name()='row']/*[local-name()='c' and starts-with(@r,'$Column')]") |
        ForEach-Object { $_.InnerText } |
        Where-Object { $_ -match '^TC-RS-[A-Z]+-\d{3}$' } | Sort-Object -Unique)
}

function Test-WorkbookTables([string]$WorkbookPath, [string[]]$ExpectedIds) {
    $temp = Join-Path ([IO.Path]::GetTempPath()) ('rc001-tables-' + [guid]::NewGuid().ToString('N'))
    New-Item -ItemType Directory -Path $temp | Out-Null
    try {
        Expand-Archive -LiteralPath $WorkbookPath -DestinationPath $temp
        $caseSheet = Join-Path $temp 'xl/worksheets/sheet4.xml'
        $runSheet = Join-Path $temp 'xl/worksheets/sheet6.xml'
        $caseTableIds = @(Get-TableCaseIds $caseSheet 'A')
        $runTableIds = @(Get-TableCaseIds $runSheet 'B')
        $badCaseIds = @(Get-TableCaseIds $caseSheet 'B') + @(Get-TableCaseIds $caseSheet 'C')
        $badRunIds = @(Get-TableCaseIds $runSheet 'A')
        $missingCases = @($ExpectedIds | Where-Object { $_ -notin $caseTableIds })
        $missingRuns = @($ExpectedIds | Where-Object { $_ -notin $runTableIds })
        if ($missingCases.Count -gt 0) { throw "Cases table missing IDs: $($missingCases -join ', ')" }
        if ($missingRuns.Count -gt 0) { throw "Run Log table missing IDs in column B: $($missingRuns -join ', ')" }
        if ($badCaseIds.Count -gt 0) { throw "Cases table has case IDs outside column A: $($badCaseIds -join ', ')" }
        if ($badRunIds.Count -gt 0) { throw "Run Log has case IDs outside column B: $($badRunIds -join ', ')" }
        [xml]$runDoc = Get-Content -LiteralPath $runSheet -Raw
        $runRowsText = @($runDoc.SelectNodes("//*[local-name()='row']") | ForEach-Object { $_.InnerText })
        $requiredVariants = @(
            'TC-RS-CALC-015.*lt','TC-RS-CALC-015.*le','TC-RS-CALC-015.*reopen',
            'TC-RS-BR-041.*AA','TC-RS-BR-041.*RR','TC-RS-BR-041.*AR',
            'TC-RS-BR-041.*FILTER-POS','TC-RS-BR-041.*FILTER-NEG',
            'TC-RS-ERR-011.*update-A','TC-RS-ERR-011.*update-B',
            'TC-RS-VAL-004.*base','TC-RS-VAL-004.*boundary','TC-RS-VAL-004.*invalid')
        foreach ($variant in $requiredVariants) {
            $parts = $variant -split '\.\*'
            if (-not (@($runRowsText | Where-Object { $_ -match [regex]::Escape($parts[0]) -and $_ -match [regex]::Escape($parts[1]) }).Count -gt 0)) { throw "Run Log is missing required variant: $variant" }
        }
        $caseText = ([xml](Get-Content -LiteralPath $caseSheet -Raw)).OuterXml
        if ($caseText -match 'T=24\.4|chọn cách xử lý phần lẻ') { throw 'Workbook contains the obsolete CALC-015 oracle.' }
        foreach ($sheet in @($caseSheet,$runSheet)) {
            [xml]$doc = Get-Content -LiteralPath $sheet -Raw
            $dimension = $doc.SelectSingleNode("//*[local-name()='dimension']")
            if ($dimension.ref -match '20001|20006|9999') { throw "Workbook table has an out-of-table/sentinel row in $([IO.Path]::GetFileName($sheet))." }
            $filter = $doc.SelectSingleNode("//*[local-name()='autoFilter']")
            if (-not $filter -or $filter.ref -notmatch ':[A-Z]+\d+$') { throw "Workbook table filter does not cover data in $([IO.Path]::GetFileName($sheet))." }
        }
    } finally {
        if (Test-Path $temp) { Remove-Item $temp -Recurse -Force }
    }
}

function Get-SourceRevision([string]$Path) {
    try {
        $rev = (& git -c safe.directory=* -C $Path rev-parse HEAD 2>$null).Trim()
        if ($LASTEXITCODE -eq 0 -and $rev) { return $rev }
    } catch { }
    return 'working-tree-unresolved'
}

function Test-NegativeVariantCheck([string]$WorkbookPath, [string[]]$ExpectedIds) {
    $temp = Join-Path ([IO.Path]::GetTempPath()) ('rc001-negative-' + [guid]::NewGuid().ToString('N'))
    New-Item -ItemType Directory -Path $temp | Out-Null
    try {
        $zip = Join-Path $temp 'copy.xlsx'; Copy-Item $WorkbookPath $zip
        $unpack = Join-Path $temp 'xlsx'; Expand-Archive $zip $unpack
        $run = Join-Path $unpack 'xl/worksheets/sheet6.xml'
        [xml]$doc = Get-Content -LiteralPath $run -Raw
        $rows = @($doc.SelectNodes("//*[local-name()='row']") | Where-Object { $_.InnerText -match 'TC-RS-CALC-015' -and $_.InnerText -match 'lt' })
        if ($rows.Count -eq 0) { throw 'Negative check setup could not find CALC-015/lt.' }
        foreach ($row in $rows) { $row.ParentNode.RemoveChild($row) | Out-Null }
        $doc.Save($run)
        $mutated = Join-Path $temp 'mutated.xlsx'; Compress-Archive -Path (Join-Path $unpack '*') -DestinationPath $mutated
        try { Test-WorkbookTables $mutated $ExpectedIds; throw 'Negative check failed: missing variant was not detected.' } catch { if ($_.Exception.Message -notmatch 'required variant|Run Log') { throw } }
    } finally { if (Test-Path $temp) { Remove-Item $temp -Recurse -Force } }
}

function Get-MarkdownCaseMetadata([string]$Path) {
    $text = Get-Content -LiteralPath $Path -Raw
    $matches = [regex]::Matches($text, '(?ms)^###\s+(TC-RS-[A-Z]+-\d{3})\s+—\s+([^\r\n]+).*?(?=^###\s+TC-RS-|\z)')
    @($matches | ForEach-Object {
        $block = $_.Value
        $id = $_.Groups[1].Value
        $title = $_.Groups[2].Value.Trim()
        $priority = ([regex]::Match($block, '(?m)^Priority:\s*([^｜|\r\n]+)')).Groups[1].Value.Trim()
        $status = ([regex]::Match($block, '(?m)^Priority:[^\r\n]*?Status:\s*([A-Z_]+)')).Groups[1].Value.Trim()
        $req = ([regex]::Match($block, '(?m)^Priority:[^\r\n]*?Requirement ID:\s*(.+)$')).Groups[1].Value.Trim()
        $category = switch -Regex ($id) { 'FUNC' {'A. Functional'} 'VAL' {'B. Validation'} 'BR' {'C. Business Rules'} 'CALC' {'D. Calculation'} 'UI' {'E. UI • Visual'} 'ERR' {'F. State • Error'} 'DATA' {'G. Data • Persistence'} 'REG' {'H. Regression'} }
        function Section([string]$name) {
            $pattern = "(?ms)^\*\*[^\r\n]*$([regex]::Escape($name))[^\r\n]*\*\*.*?\r?\n(.*?)(?=^\*\*|\z)"
            $m = [regex]::Match($block, $pattern)
            if ($m.Success) {
                $value = $m.Groups[1].Value
                $value = [regex]::Replace($value, '(?is)<a\b[^>]*>.*?</a>', '')
                $value = [regex]::Replace($value, '(?i)<br\s*/?>', "`n")
                return $value.Trim()
            }
            return ''
        }
        $context = Section 'Điều kiện trước'
        $action = Section 'Thao tác'
        $expected = Section 'Kết quả mong đợi'
        $evidence = Section 'Bằng chứng'
        $reset = Section 'Đặt lại'
        [pscustomobject]@{ Id=$id; Title=$title; Category=$category; Priority=$priority; Status=$status; Requirement=$req; Context=$context; Action=$action; Expected=$expected; Evidence=$evidence; Reset=$reset }
    })
}

function Rebuild-WorkbookTables([string]$WorkbookPath, [string]$CasesPath) {
    $meta = @(Get-MarkdownCaseMetadata $CasesPath)
    if ($meta.Count -ne 216) { throw "Source-driven rebuild found $($meta.Count) cases, expected 216." }
    $temp = Join-Path ([IO.Path]::GetTempPath()) ('rc001-rebuild-' + [guid]::NewGuid().ToString('N'))
    New-Item -ItemType Directory -Path $temp | Out-Null
    try {
        Expand-Archive -LiteralPath $WorkbookPath -DestinationPath $temp
        $uri='http://schemas.openxmlformats.org/spreadsheetml/2006/main'
        function New-Cell($doc,$ref,$value,[int]$style=9){$c=$doc.CreateElement('c',$uri);$c.SetAttribute('r',$ref);$c.SetAttribute('s',[string]$style);$c.SetAttribute('t','inlineStr');$is=$doc.CreateElement('is',$uri);$t=$doc.CreateElement('t',$uri);$t.InnerText=[string]$value;$is.AppendChild($t)|Out-Null;$c.AppendChild($is)|Out-Null;return $c}
        function New-Row($doc,$n,$values){$r=$doc.CreateElement('row',$uri);$r.SetAttribute('r',[string]$n);foreach($k in $values.Keys){$r.AppendChild((New-Cell $doc "$k$n" $values[$k] 9))|Out-Null};return $r}
        $caseFile=Join-Path $temp 'xl/worksheets/sheet4.xml';[xml]$caseDoc=Get-Content -LiteralPath $caseFile -Raw;$sd=$caseDoc.SelectSingleNode("//*[local-name()='sheetData']")
        $header=$sd.SelectSingleNode("*[local-name()='row' and @r='1']");foreach($ref in @('K1','L1','M1','N1')){$oldCells=@($header.SelectNodes("*[local-name()='c' and @r='$ref']"));foreach($old in $oldCells){$header.RemoveChild($old)|Out-Null}};$header.AppendChild((New-Cell $caseDoc 'K1' 'Action' 8))|Out-Null;$header.AppendChild((New-Cell $caseDoc 'L1' 'Expected' 8))|Out-Null;$header.AppendChild((New-Cell $caseDoc 'M1' 'Evidence' 8))|Out-Null;$header.AppendChild((New-Cell $caseDoc 'N1' 'Reset' 8))|Out-Null
        @($sd.SelectNodes("//*[local-name()='row']")|Where-Object{[int]$_.r -ge 2 -and [int]$_.r -lt 10000})|ForEach-Object{$_.ParentNode.RemoveChild($_)|Out-Null}
        $n=2;foreach($c in $meta){$row=[ordered]@{A=$c.Id;B=$c.Title;C=$c.Category;D=$c.Context;E=$c.Priority;F=$c.Status;G='READY';H=$c.Requirement;I=$c.Category;J='test-cases.vi.md';K=$c.Action;L=$c.Expected;M=$c.Evidence;N=$c.Reset};$sd.AppendChild((New-Row $caseDoc $n $row))|Out-Null;$n++}
        $caseDoc.SelectSingleNode("//*[local-name()='dimension']").SetAttribute('ref',"A1:N$($n-1)");$af=$caseDoc.SelectSingleNode("//*[local-name()='autoFilter']");if($af){$af.SetAttribute('ref',"A1:N$($n-1)")};$caseDoc.Save($caseFile)
        $runFile=Join-Path $temp 'xl/worksheets/sheet6.xml';[xml]$runDoc=Get-Content -LiteralPath $runFile -Raw;$rsd=$runDoc.SelectSingleNode("//*[local-name()='sheetData']")
        @($rsd.SelectNodes("//*[local-name()='row']")|Where-Object{[int]$_.r -ge 2 -and [int]$_.r -lt 10000})|ForEach-Object{$_.ParentNode.RemoveChild($_)|Out-Null}
        $n=2;foreach($c in $meta){$rsd.AppendChild((New-Row $runDoc $n ([ordered]@{A="RUN-$($c.Id)-Base";B=$c.Id;C='Base';D='NOT RUN';E='';F='';G='';H='';I='';J='';K='';L='';M=''})))|Out-Null;$n++}
        $g=@(@('TC-RS-CALC-015','lt'),@('TC-RS-CALC-015','le'),@('TC-RS-CALC-015','reopen'),@('TC-RS-BR-041','AA'),@('TC-RS-BR-041','RR'),@('TC-RS-BR-041','AR'),@('TC-RS-BR-041','FILTER-POS'),@('TC-RS-BR-041','FILTER-NEG'),@('TC-RS-ERR-011','update-A'),@('TC-RS-ERR-011','update-B'),@('TC-RS-VAL-004','base'),@('TC-RS-VAL-004','boundary'),@('TC-RS-VAL-004','invalid'))
        foreach($v in $g){$rsd.AppendChild((New-Row $runDoc $n ([ordered]@{A="RUN-$($v[0])-$($v[1])";B=$v[0];C=$v[1];D='NOT RUN';E='';F='';G='';H='';I='';J='';K='';L='';M=''})))|Out-Null;$n++}
        $runDoc.SelectSingleNode("//*[local-name()='dimension']").SetAttribute('ref',"A1:M$($n-1)");$af=$runDoc.SelectSingleNode("//*[local-name()='autoFilter']");if($af){$af.SetAttribute('ref',"A1:M$($n-1)")};$runDoc.Save($runFile)
        # Keep the layout sheets visually consistent with the established blue header style.
        $caseCols=$caseDoc.SelectSingleNode("//*[local-name()='cols']");foreach($spec in @(@(11,11,70),@(12,12,70),@(13,13,48),@(14,14,36))){foreach($old in @($caseCols.SelectNodes("*[local-name()='col' and @min='$($spec[0])' and @max='$($spec[1])']"))){$caseCols.RemoveChild($old)|Out-Null};$col=$caseDoc.CreateElement('col',$uri);$col.SetAttribute('min',[string]$spec[0]);$col.SetAttribute('max',[string]$spec[1]);$col.SetAttribute('width',[string]$spec[2]);$col.SetAttribute('customWidth','1');$caseCols.AppendChild($col)|Out-Null};$caseDoc.Save($caseFile)
        foreach($sheetNo in 11,12,13){$f=Join-Path $temp "xl/worksheets/sheet$sheetNo.xml";[xml]$doc=Get-Content -LiteralPath $f -Raw;$cell=$doc.SelectSingleNode("//*[local-name()='c' and @r='C2']");if($cell){$cell.SetAttribute('s','11')};$doc.Save($f)}
        $dataFile=Join-Path $temp 'xl/worksheets/sheet5.xml';[xml]$dataDoc=Get-Content -LiteralPath $dataFile -Raw;foreach($ref in 'A1','B1','A4','B4'){$cell=$dataDoc.SelectSingleNode("//*[local-name()='c' and @r='$ref']");if($cell){$cell.SetAttribute('s','11')}};$dataDoc.Save($dataFile)
        $out="$temp/rebuilt.xlsx";Compress-Archive -Path (Join-Path $temp '*') -DestinationPath $out -Force;Move-Item $out $WorkbookPath -Force
    } finally { if(Test-Path $temp){Remove-Item $temp -Recurse -Force} }
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
    if ($xml -match '補足（Bổ sung）') { throw 'Workbook contains redundant supplement sections.' }
    $ns = New-Object System.Xml.XmlNamespaceManager((New-Object System.Xml.NameTable))
    $ns.AddNamespace('m', 'http://schemas.openxmlformats.org/spreadsheetml/2006/main')
    foreach ($sheetPath in (Get-ChildItem -LiteralPath (Join-Path $xmlInfo.Temp 'xl/worksheets') -Filter 'sheet*.xml')) {
        [xml]$sheet = Get-Content -LiteralPath $sheetPath.FullName -Raw
        $supplementLabels = @($sheet.SelectNodes('//m:t', $ns) | Where-Object { $_.InnerText -eq '補足（Bổ sung）' })
        if ($supplementLabels.Count -gt 0) {
            throw "Workbook contains redundant 補足（Bổ sung） sections in $($sheetPath.Name)."
        }
    }
    Test-WorkbookTables $defaultWorkbook $caseIds
    Test-NegativeVariantCheck $defaultWorkbook $caseIds
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
    Rebuild-WorkbookTables $outputFull $cases
    $manifestObject = [ordered]@{
        generator = $GeneratorVersion
        command = "pwsh -File tools/generate-test-spec.ps1 -Mode Generate -SourceRoot ."
        generatedAt = (Get-Date).ToUniversalTime().ToString('o')
        sourceRoot = '.'
        sourceRevision = (Get-SourceRevision $SourceRoot)
        sources = [ordered]@{
            cases = [ordered]@{ path = 'test-cases.vi.md'; sha256 = (Get-NormalizedSha256 $cases) }
            data = [ordered]@{ path = 'test-data.vi.md'; sha256 = (Get-NormalizedSha256 $data) }
            scope = [ordered]@{ path = 'scope-and-approach.vi.md'; sha256 = (Get-NormalizedSha256 $scope) }
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
