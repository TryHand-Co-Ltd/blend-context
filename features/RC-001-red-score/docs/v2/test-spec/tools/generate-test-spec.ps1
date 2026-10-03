<##
.SYNOPSIS
  Validate and publish the RC-001 test-spec workbook with a reproducible manifest.

.DESCRIPTION
  Markdown is authoritative. The checked-in workbook is the rendered workbook
  style template/output. Generate rebuilds tables and details from Markdown,
  synchronizes scope statistics, validates the execution contract, and writes
  a manifest containing source hashes and generator version. Check is read-only.
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
$GeneratorVersion = 'rc001-test-spec-generator@1.4.1'

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

function Test-WorksheetStructure([string]$WorkbookPath) {
    $temp = Join-Path ([IO.Path]::GetTempPath()) ('rc001-structure-' + [guid]::NewGuid().ToString('N'))
    New-Item -ItemType Directory -Path $temp | Out-Null
    try {
        Expand-Archive -LiteralPath $WorkbookPath -DestinationPath $temp
        foreach ($file in Get-ChildItem -LiteralPath (Join-Path $temp 'xl/worksheets') -Filter 'sheet*.xml') {
            [xml]$doc = Get-Content -LiteralPath $file.FullName -Raw
            $previous = 0
            $seenCells = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
            foreach ($row in @($doc.SelectNodes("//*[local-name()='sheetData']/*[local-name()='row']"))) {
                $number = [int]$row.r
                if ($number -le $previous) { throw "Worksheet structure has duplicate/out-of-order row $number in $($file.Name)." }
                $previous = $number
                foreach ($cell in @($row.SelectNodes("*[local-name()='c']"))) {
                    if (-not $seenCells.Add([string]$cell.r)) { throw "Worksheet structure has duplicate cell $($cell.r) in $($file.Name)." }
                }
            }
        }
    } finally { if (Test-Path -LiteralPath $temp) { Remove-Item -LiteralPath $temp -Recurse -Force } }
}

function Test-NegativeStructureCheck([string]$WorkbookPath) {
    $temp = Join-Path ([IO.Path]::GetTempPath()) ('rc001-negative-structure-' + [guid]::NewGuid().ToString('N'))
    New-Item -ItemType Directory -Path $temp | Out-Null
    try {
        $unpack = Join-Path $temp 'xlsx'
        Expand-Archive -LiteralPath $WorkbookPath -DestinationPath $unpack
        $file = Join-Path $unpack 'xl/worksheets/sheet3.xml'
        [xml]$doc = Get-Content -LiteralPath $file -Raw
        $data = $doc.SelectSingleNode("//*[local-name()='sheetData']")
        $row = $data.SelectSingleNode("*[local-name()='row' and @r='19']")
        if (-not $row) { throw 'Negative structure check setup could not find Run row 19.' }
        $data.AppendChild($row.CloneNode($true)) | Out-Null
        $doc.Save($file)
        $mutated = Join-Path $temp 'mutated.xlsx'
        Compress-Archive -Path (Join-Path $unpack '*') -DestinationPath $mutated
        try { Test-WorksheetStructure $mutated; throw 'Negative structure check failed: duplicate Run row was accepted.' }
        catch { if ($_.Exception.Message -notmatch 'Worksheet structure has duplicate/out-of-order row') { throw } }
    } finally { if (Test-Path -LiteralPath $temp) { Remove-Item -LiteralPath $temp -Recurse -Force } }
}

function Get-NormalizedSha256([string]$Path) {
    $text = Get-Content -LiteralPath $Path -Raw
    $normalized = $text -replace "`r`n", "`n" -replace "`r", "`n"
    $bytes = [Text.Encoding]::UTF8.GetBytes($normalized)
    $sha = [Security.Cryptography.SHA256]::Create()
    return ([BitConverter]::ToString($sha.ComputeHash($bytes))).Replace('-', '')
}

function Get-SourceState([string]$Path) {
    try {
        $dirty = (& git -c safe.directory=* -C $Path status --porcelain -- test-cases.vi.md test-data.vi.md scope-and-approach.vi.md tools/generate-test-spec.ps1 2>$null)
        if ($LASTEXITCODE -eq 0) { if ($dirty) { return 'working-tree' }; return 'clean' }
    } catch { }
    return 'working-tree-unresolved'
}

function Get-MarkdownDataRows([string]$Path) {
    $rows = @()
    foreach ($line in Get-Content -LiteralPath $Path) {
        if ($line -match '^\|\s*(TD-[A-Z]+-\d+)\s*\|') {
            $id = $Matches[1]
            $first = $line.IndexOf('|')
            $last = $line.LastIndexOf('|')
            $rest = $line.Substring($line.IndexOf('|',$first + 1) + 1, $last - $line.IndexOf('|',$first + 1) - 1).Trim()
            if ($rest -notmatch '^[-:| ]+$') { $rows += [pscustomobject]@{ Id=$id; Description=$rest } }
        }
    }
    $duplicates = @($rows | Group-Object Id | Where-Object Count -gt 1)
    if ($duplicates.Count) { throw "Duplicate Markdown data IDs: $(($duplicates.Name) -join ', ')" }
    return @($rows)
}

function Get-TableCaseIds([string]$Path, [string]$Column) {
    $doc = New-Object System.Xml.XmlDocument
    $doc.Load($Path)
    @($doc.SelectNodes("//*[local-name()='row']/*[local-name()='c' and translate(@r,'0123456789','')='$Column']") |
        ForEach-Object { $_.InnerText } |
        Where-Object { $_ -match '^TC-RS-[A-Z]+-\d{3}$' } | Sort-Object -Unique)
}

function Normalize-CellText([string]$Value) { return (($Value -replace "`r`n", "`n" -replace "`r", "`n") -replace '\s+', ' ').Trim() }

function Format-DetailAction([string]$Value) {
    # Presentation only: keep source metadata and Run Log identities unchanged.
    $text = $Value -replace "`r`n", "`n"
    $text = [regex]::Replace($text, '(?m)^\| Lượt chạy \| Phạm vi thực hiện và đối chiếu \|\s*\n\| --- \| --- \|', 'Phạm vi từng lượt chạy:')
    return [regex]::Replace($text, '(?m)^\| Run: ([^|\r\n]+?) \| (.*?) \|\s*$', '- $1: $2')
}

function Get-CaseStatusFormula($Case, [int]$RowNumber) {
    $checks = @('COUNTIF(''Run Log''!$B:$B,A{0})<>O{0}' -f $RowNumber)
    foreach ($variant in $Case.Variants) {
        $runId = "RUN-$($Case.Id)-$variant"
        $checks += 'COUNTIF(''Run Log''!$A:$A,"{0}")<>1' -f $runId
        $checks += 'COUNTIFS(''Run Log''!$A:$A,"{0}",''Run Log''!$B:$B,A{1},''Run Log''!$C:$C,"{2}")<>1' -f $runId,$RowNumber,$variant
    }
    $formula = 'IF(OR({0}),"INCOMPLETE",IF(COUNTIFS(''Run Log''!$B:$B,A{1},''Run Log''!$D:$D,"PASS")=O{1},"PASS",IF(COUNTIFS(''Run Log''!$B:$B,A{1},''Run Log''!$D:$D,"FAIL")>0,"FAIL",IF(COUNTIFS(''Run Log''!$B:$B,A{1},''Run Log''!$D:$D,"BLOCKED")>0,"BLOCKED",IF(COUNTIFS(''Run Log''!$B:$B,A{1},''Run Log''!$D:$D,"SKIPPED")>0,"SKIPPED","NOT RUN")))))' -f ($checks -join ','),$RowNumber
    if ($formula.Length -gt 8192) { throw "Case status formula exceeds Excel limit: $($Case.Id)" }
    return $formula
}

function Test-WorkbookTables([string]$WorkbookPath, [string[]]$ExpectedIds, [object[]]$ExpectedMetadata = @()) {
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
        if ($ExpectedMetadata.Count -gt 0) {
            [xml]$caseDoc = Get-Content -LiteralPath $caseSheet -Raw
            $caseHeader=$caseDoc.SelectSingleNode("//*[local-name()='row' and @r='1']")
            foreach($headerSpec in @(@('O1','Required Variant Count'),@('P1','Case Status'))){$hc=$caseHeader.SelectSingleNode("*[local-name()='c' and @r='$($headerSpec[0])']");if(-not $hc -or $hc.InnerText -ne $headerSpec[1]){throw "Cases header mismatch at $($headerSpec[0])."}}
            $rowsById=@{}
            foreach($row in @($caseDoc.SelectNodes("//*[local-name()='row']"))){
                $id=($row.c|Where-Object{$_.r -match '^A\d+$'}).InnerText
                if($id -match '^TC-RS-'){
                    if($rowsById.ContainsKey($id) -or $id -notin $ExpectedIds){throw "Cases duplicate/unknown ID: $id"}
                    $countCell=$row.SelectSingleNode("*[local-name()='c' and @r='O$($row.r)']")
                    if(-not $countCell -or $countCell.GetAttribute('t') -notin @('','n') -or -not $countCell.SelectSingleNode("*[local-name()='v']")){throw "Required Variant Count must be numeric: $id"}
                    $rowsById[$id]=$row
                }
            }
            foreach($expected in $ExpectedMetadata){$row=$rowsById[$expected.Id];$map=@{B=$expected.Title;C=$expected.Category;D=$expected.Context;E=$expected.Priority;F=$expected.Status;G=$expected.Readiness;H=$expected.Requirement;K=$expected.Action;L=$expected.Expected;M=$expected.Evidence;N=$expected.Reset;O=[string][Math]::Max(1,$expected.Variants.Count)};foreach($col in $map.Keys){$cell=$row.c|Where-Object{$_.r -match "^$col\d+$"};if((Normalize-CellText $cell.InnerText) -ne (Normalize-CellText $map[$col])){throw "Cases field mismatch: $($expected.Id) column $col"}};$statusFormula=$row.SelectSingleNode("*[local-name()='c' and translate(@r,'0123456789','')='P']/*[local-name()='f']");if(-not $statusFormula -or $statusFormula.InnerText -ne (Get-CaseStatusFormula $expected ([int]$row.r))){throw "Case completion formula mismatch: $($expected.Id)."};$variants=$expected.Variants;foreach($variant in $variants){if($statusFormula.InnerText -notmatch [regex]::Escape("RUN-$($expected.Id)-$variant")){throw "Case completion formula omits required variant $variant for $($expected.Id)."}}}
        }
        [xml]$runDoc = Get-Content -LiteralPath $runSheet -Raw
        $runRows = @($runDoc.SelectNodes("//*[local-name()='row']"))
        foreach ($expected in $ExpectedMetadata) {
            $variants=$expected.Variants
            foreach($variant in $variants) {
                $expectedRunId="RUN-$($expected.Id)-$variant"
                $found=@($runRows | Where-Object { (($_.SelectSingleNode("*[local-name()='c' and translate(@r,'0123456789','')='A']")).InnerText -eq $expectedRunId) })
                if($found.Count -ne 1){throw "Run Log variant row missing/duplicated: $expectedRunId"}
                $rowNumber=$found[0].r
                $caseCell=$found[0].SelectSingleNode("*[local-name()='c' and @r='B$rowNumber']")
                $variantCell=$found[0].SelectSingleNode("*[local-name()='c' and @r='C$rowNumber']")
                $statusCell=$found[0].SelectSingleNode("*[local-name()='c' and @r='D$rowNumber']")
                if(-not $caseCell -or $caseCell.InnerText -ne $expected.Id){throw "Run Log case ID mismatch for $expectedRunId."}
                if($variantCell.InnerText -ne $variant){throw "Run Log variant mismatch for $expectedRunId."}
                if($statusCell.InnerText -ne 'NOT RUN'){throw "Generated Run Log status must be NOT RUN for $expectedRunId."}
            }
        }
        $expectedRunCount=0;foreach($expected in $ExpectedMetadata){$expectedRunCount += [Math]::Max(1,$expected.Variants.Count)}
        $actualRunCount=@($runRows | Where-Object {($_.SelectSingleNode("*[local-name()='c' and translate(@r,'0123456789','')='A']")).InnerText -like 'RUN-TC-RS-*'}).Count
        if($actualRunCount -ne $expectedRunCount){throw "Run Log has $actualRunCount run rows; Markdown defines $expectedRunCount."}
        $validations = @($runDoc.SelectNodes("//*[local-name()='dataValidations']/*[local-name()='dataValidation']"))
        if ($validations.Count -ne 1) { throw 'Run Log status validation missing or duplicated.' }
        $validation = $validations[0]
        $statusList = $validation.SelectSingleNode("*[local-name()='formula1']")
        if ($validation.GetAttribute('sqref') -ne "D2:D$($expectedRunCount + 1)" -or
            $validation.GetAttribute('type') -ne 'list' -or
            -not $statusList -or $statusList.InnerText -ne '"NOT RUN,PASS,FAIL,BLOCKED,SKIPPED"' -or
            $validation.GetAttribute('showDropDown') -notin @('0','false') -or
            $validation.GetAttribute('showErrorMessage') -notin @('1','true') -or
            $validation.GetAttribute('errorStyle') -ne 'stop' -or
            $validation.GetAttribute('allowBlank') -notin @('0','false')) {
            throw 'Run Log status validation range/list/enforcement mismatch.'
        }
        foreach($row in @($runRows|Where-Object{[int]$_.r -ge 2})){
            foreach($cell in @($row.SelectNodes("*[local-name()='c']"))){
                if($cell.r -match '^[E-M]\d+$' -and $cell.InnerText -match '^\s+$'){throw "Run Log contains whitespace instead of a blank at $($cell.r)."}
            }
        }
        $indexFile=Join-Path (Split-Path -Parent $caseSheet) 'sheet2.xml'
        [xml]$indexDoc=Get-Content -LiteralPath $indexFile -Raw
        $indexRows=@($indexDoc.SelectNodes("//*[local-name()='sheetData']/*[local-name()='row']")|Where-Object{[int]$_.r -ge 2})
        $indexIds=@();$metaById=@{};foreach($m in $ExpectedMetadata){$metaById[$m.Id]=$m}
        foreach($row in $indexRows){$idCell=$row.SelectSingleNode("*[local-name()='c' and translate(@r,'0123456789','')='B']");if(-not $idCell -or $idCell.InnerText -notmatch '^TC-RS-'){continue};$id=$idCell.InnerText;$indexIds+=$id;if(-not $metaById.ContainsKey($id)){throw "Business Index has unknown ID $id."};$title=$row.SelectSingleNode("*[local-name()='c' and starts-with(@r,'C')]");$category=$row.SelectSingleNode("*[local-name()='c' and starts-with(@r,'D')]");if(-not $title -or $title.InnerText -ne $metaById[$id].Title -or -not $category -or $category.InnerText -ne $metaById[$id].Category){throw "Business Index metadata differs from Markdown for $id."}}
        $indexMissing=@($ExpectedIds|Where-Object{$_ -notin $indexIds});if($indexMissing.Count){throw "Business Index missing IDs: $($indexMissing -join ', ')."}
        $indexFilter=$indexDoc.SelectSingleNode("//*[local-name()='autoFilter']");if($indexFilter -and $indexFilter.ref -ne "A1:E$((@($indexRows|ForEach-Object{[int]$_.r}|Measure-Object -Maximum).Maximum))"){throw 'Business Index filter does not cover all rows.'}
        $summaryFile=Join-Path (Split-Path -Parent (Split-Path -Parent $caseSheet)) 'worksheets/sheet3.xml'
        if(Test-Path $summaryFile){[xml]$summary=Get-Content -LiteralPath $summaryFile -Raw;$completed=$summary.SelectSingleNode("//*[local-name()='c' and @r='B22']/*[local-name()='f']");if(-not $completed -or $completed.InnerText -ne 'COUNTIF(Cases!P:P,"PASS")'){throw 'Run summary completed-case metric is missing or incorrect.'};$revisionCell=$summary.SelectSingleNode("//*[local-name()='c' and @r='B4']");if(-not $revisionCell -or (-not $revisionCell.SelectSingleNode("*[local-name()='f']") -and ($revisionCell.t -ne 'inlineStr' -or -not $revisionCell.SelectSingleNode("*[local-name()='is']/*[local-name()='t']")))){throw 'Run summary B4 source revision is not readable.'}}
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

function Test-Manifest([string]$ManifestPath,[string]$WorkbookPath,[string]$SourcePath,[string]$CasesPath,[string]$DataPath,[string]$ScopePath) {
    if(-not (Test-Path -LiteralPath $ManifestPath -PathType Leaf)){throw "Missing generation manifest: $ManifestPath"}
    $m=Get-Content -LiteralPath $ManifestPath -Raw | ConvertFrom-Json
    if($m.generator -ne $GeneratorVersion){throw "Manifest generator mismatch: $($m.generator)."}
    if($m.command -ne 'pwsh -File tools/generate-test-spec.ps1 -Mode Generate -SourceRoot .'){throw 'Manifest generation command is missing or stale.'}
    if($m.sourceRevision -ne (Get-SourceRevision $SourcePath)){throw 'Manifest source revision does not match current HEAD.'}
    if($m.sourceState -ne (Get-SourceState $SourcePath)){throw 'Manifest source state is stale.'}
    foreach($spec in @(@('cases',$CasesPath),@('data',$DataPath),@('scope',$ScopePath))) {
        $entry=$m.sources.($spec[0])
        if(-not $entry -or $entry.sha256 -ne (Get-NormalizedSha256 $spec[1])){throw "Manifest source hash mismatch: $($spec[0])."}
    }
    $scriptHash=(Get-FileHash $PSCommandPath -Algorithm SHA256).Hash
    if(-not $m.generatorSource -or $m.generatorSource.sha256 -ne $scriptHash){throw 'Manifest generator source hash is missing or stale.'}
    if($m.workbook.sha256 -ne (Get-FileHash $WorkbookPath -Algorithm SHA256).Hash){throw 'Manifest workbook hash does not match workbook.'}
}

function Test-NegativeVariantCheck([string]$WorkbookPath, [string[]]$ExpectedIds,[object[]]$ExpectedMetadata) {
    $temp = Join-Path ([IO.Path]::GetTempPath()) ('rc001-negative-' + [guid]::NewGuid().ToString('N'))
    New-Item -ItemType Directory -Path $temp | Out-Null
    try {
        $zip = Join-Path $temp 'copy.xlsx'; Copy-Item $WorkbookPath $zip
        $unpack = Join-Path $temp 'xlsx'; Expand-Archive $zip $unpack
        $run = Join-Path $unpack 'xl/worksheets/sheet6.xml'
        [xml]$doc = Get-Content -LiteralPath $run -Raw
        $rows = @($doc.SelectNodes("//*[local-name()='row']") | Where-Object { $_.InnerText -match 'TC-RS-CALC-015' -and $_.InnerText -match 'less-than' })
        if ($rows.Count -eq 0) { throw 'Negative check setup could not find CALC-015/less-than.' }
        foreach ($row in $rows) { $row.ParentNode.RemoveChild($row) | Out-Null }
        $doc.Save($run)
        $mutated = Join-Path $temp 'mutated.xlsx'; Compress-Archive -Path (Join-Path $unpack '*') -DestinationPath $mutated
        $detected=$false
        try { Test-WorkbookTables $mutated $ExpectedIds $ExpectedMetadata } catch { if ($_.Exception.Message -notmatch '^Run Log variant row missing/duplicated:') { throw }; $detected=$true }
        if(-not $detected){throw 'Negative check failed: missing variant was accepted.'}
        # Restore the original run sheet, then swap Case IDs while preserving the ID set.
        $original=Join-Path $temp 'original';Expand-Archive $zip $original
        [xml]$doc=Get-Content -LiteralPath (Join-Path $original 'xl/worksheets/sheet6.xml') -Raw
        $cells=@($doc.SelectNodes("//*[local-name()='c' and translate(@r,'0123456789','')='B']/*[local-name()='is']/*[local-name()='t']")|Where-Object{$_.InnerText -match '^TC-RS-'})
        $first=$cells[0];$second=$cells|Where-Object{$_.InnerText -ne $first.InnerText}|Select-Object -First 1
        $value=$first.InnerText;$first.InnerText=$second.InnerText;$second.InnerText=$value;$doc.Save($run)
        $swapped=Join-Path $temp 'swapped.xlsx';Compress-Archive -Path (Join-Path $unpack '*') -DestinationPath $swapped
        $detected=$false
        try { Test-WorkbookTables $swapped $ExpectedIds $ExpectedMetadata } catch {if($_.Exception.Message -notmatch '^Run Log case ID mismatch'){throw};$detected=$true}
        if(-not $detected){throw 'Negative check failed: swapped Case IDs were accepted.'}
        Copy-Item -LiteralPath (Join-Path $original 'xl/worksheets/sheet6.xml') -Destination $run -Force
        foreach ($mutation in @('short-range','wrong-list','hidden-dropdown','no-error','warning-only','blank-allowed','missing','duplicate')) {
            [xml]$validationDoc = Get-Content -LiteralPath (Join-Path $original 'xl/worksheets/sheet6.xml') -Raw
            $validation = $validationDoc.SelectSingleNode("//*[local-name()='dataValidation']")
            switch ($mutation) {
                'short-range' { $validation.SetAttribute('sqref','D2:D238') }
                'wrong-list' { $validation.SelectSingleNode("*[local-name()='formula1']").InnerText='"NOT RUN,PASS"' }
                'hidden-dropdown' { $validation.SetAttribute('showDropDown','1') }
                'no-error' { $validation.SetAttribute('showErrorMessage','0') }
                'warning-only' { $validation.SetAttribute('errorStyle','warning') }
                'blank-allowed' { $validation.SetAttribute('allowBlank','1') }
                'missing' { $validation.ParentNode.RemoveChild($validation) | Out-Null }
                'duplicate' { $validation.ParentNode.AppendChild($validation.CloneNode($true)) | Out-Null }
            }
            $validationDoc.Save($run)
            $badValidation = Join-Path $temp ("validation-$mutation.xlsx")
            Compress-Archive -Path (Join-Path $unpack '*') -DestinationPath $badValidation
            $detected = $false
            try { Test-WorkbookTables $badValidation $ExpectedIds $ExpectedMetadata }
            catch { if ($_.Exception.Message -notmatch '^Run Log status validation') { throw }; $detected=$true }
            if (-not $detected) { throw "Negative check failed: status validation $mutation was accepted." }
        }
        Copy-Item -LiteralPath (Join-Path $original 'xl/worksheets/sheet6.xml') -Destination $run -Force
        foreach($spec in @(@('L2','Cases field mismatch'),@('P2','Case completion formula mismatch'),@('O2','Required Variant Count must be numeric'))){
            $caseFile=Join-Path $unpack 'xl/worksheets/sheet4.xml'
            [xml]$caseDoc=Get-Content -LiteralPath (Join-Path $original 'xl/worksheets/sheet4.xml') -Raw
            $cell=$caseDoc.SelectSingleNode("//*[local-name()='c' and @r='$($spec[0])']")
            if($spec[0] -eq 'P2'){$cell.SelectSingleNode("*[local-name()='f']").InnerText='"PASS"'}
            elseif($spec[0] -eq 'L2'){$cell.SelectSingleNode(".//*[local-name()='t']").InnerText='tampered expected'}
            else{$value=$cell.InnerText;$cell.RemoveAll();$cell.SetAttribute('r','O2');$cell.SetAttribute('t','inlineStr');$is=$caseDoc.CreateElement('is',$caseDoc.DocumentElement.NamespaceURI);$t=$caseDoc.CreateElement('t',$caseDoc.DocumentElement.NamespaceURI);$t.InnerText=$value;$is.AppendChild($t)|Out-Null;$cell.AppendChild($is)|Out-Null}
            $caseDoc.Save($caseFile)
            $bad=Join-Path $temp ($spec[0]+'.xlsx');Compress-Archive -Path (Join-Path $unpack '*') -DestinationPath $bad
            $detected=$false
            try {Test-WorkbookTables $bad $ExpectedIds $ExpectedMetadata} catch {if($_.Exception.Message -notmatch ('^'+[regex]::Escape($spec[1]))){throw};$detected=$true}
            if(-not $detected){throw "Negative check failed: $($spec[0]) mutation accepted."}
        }
    } finally { if (Test-Path $temp) { Remove-Item $temp -Recurse -Force } }
}

function Test-DetailSync([string]$WorkbookPath,[object[]]$ExpectedMetadata) {
    $temp = Join-Path ([IO.Path]::GetTempPath()) ('rc001-detail-' + [guid]::NewGuid().ToString('N'))
    New-Item -ItemType Directory -Path $temp | Out-Null
    try {
        Expand-Archive -LiteralPath $WorkbookPath -DestinationPath $temp
        $sheetByCategory=@{'A. Functional'=7;'B. Validation'=8;'C. Business Rules'=9;'D. Calculation'=10;'E. UI • Visual'=11;'F. State • Error'=12;'G. Data • Persistence'=13;'H. Regression'=14}
        foreach($category in $sheetByCategory.Keys) {
            $file=Join-Path $temp "xl/worksheets/sheet$($sheetByCategory[$category]).xml";[xml]$doc=Get-Content -LiteralPath $file -Raw
            $expected=@($ExpectedMetadata | Where-Object Category -eq $category)
            $rows=@($doc.SelectNodes("//*[local-name()='sheetData']/*[local-name()='row']"))
            $actualIds=@($doc.SelectNodes("//*[local-name()='row']/*[local-name()='c' and starts-with(@r,'C')]") | ForEach-Object { [regex]::Match($_.InnerText,'TC-RS-[A-Z]+-\d{3}').Value } | Where-Object {$_})
            foreach($c in $expected) {
                if(@($actualIds | Where-Object {$_ -eq $c.Id}).Count -ne 1){throw "Detail case ID missing or duplicated: $($c.Id)"}
                $start=-1
                for($i=0;$i -lt $rows.Count;$i++){ $heading=$rows[$i].SelectSingleNode("*[local-name()='c' and starts-with(@r,'C')]");if($heading -and $heading.InnerText -match [regex]::Escape($c.Id)){$start=$i;break} }
                if($start -lt 0){throw "Detail block missing for $($c.Id)"}
                $end=$rows.Count
                for($i=$start+1;$i -lt $rows.Count;$i++){ $heading=$rows[$i].SelectSingleNode("*[local-name()='c' and starts-with(@r,'C')]");if($heading -and $heading.InnerText -match '^TC-RS-[A-Z]+-\d{3}\b'){$end=$i;break} }
                $blockText=($rows[$start..($end-1)] | ForEach-Object {$_.InnerText}) -join "`n"
                $detailMeta="Priority: $($c.Priority) ｜ Status: $($c.Status) ｜ Readiness: $($c.Readiness) ｜ Requirement ID: $($c.Requirement)"
                if((Normalize-CellText $blockText).IndexOf((Normalize-CellText $detailMeta),[StringComparison]::Ordinal) -lt 0){throw "Detail metadata mismatch for $($c.Id)."}
                if($blockText -match 'Run variants:|(?m)^\| Run:|\| Lượt chạy \|'){throw "Detail contains raw/redundant variant markup: $($c.Id)."}
                foreach($variant in $c.Variants){if($blockText -notmatch ('(?m)^- '+[regex]::Escape($variant)+': ')){throw "Detail variant mismatch for $($c.Id)."}}
                foreach($value in @($c.Title,$c.Context,(Format-DetailAction $c.Action),$c.Expected,$c.Evidence,$c.Reset) | Where-Object {$_}) {
                    if((Normalize-CellText $blockText).IndexOf((Normalize-CellText $value),[StringComparison]::Ordinal) -lt 0){throw "Detail content mismatch for $($c.Id): source section is absent or changed."}
                }
            }
            if(@($actualIds | Sort-Object -Unique).Count -ne $expected.Count){throw "Detail sheet has missing or unexpected IDs: $category"}
        }
    } finally { if (Test-Path $temp) { Remove-Item $temp -Recurse -Force } }
}

function Test-DataSheetSync([string]$WorkbookPath,[object[]]$ExpectedData) {
    $temp=Join-Path ([IO.Path]::GetTempPath()) ('rc001-data-sync-'+[guid]::NewGuid().ToString('N'));New-Item -ItemType Directory -Path $temp|Out-Null
    try {
        Expand-Archive -LiteralPath $WorkbookPath -DestinationPath $temp
        $file=Join-Path $temp 'xl/worksheets/sheet5.xml';[xml]$doc=Get-Content -LiteralPath $file -Raw
        $rows=@($doc.SelectNodes("//*[local-name()='sheetData']/*[local-name()='row']") | Where-Object {[int]$_.r -ge 5})
        $actual=@{}
        foreach($row in $rows) {
            $idCell=$row.SelectSingleNode("*[local-name()='c' and translate(@r,'0123456789','')='A']")
            $descCell=$row.SelectSingleNode("*[local-name()='c' and translate(@r,'0123456789','')='B']")
            if($idCell -and $idCell.InnerText -match '^TD-') {
                if($actual.ContainsKey($idCell.InnerText)){throw "Data sheet has duplicate ID $($idCell.InnerText)."}
                $actual[$idCell.InnerText]=[pscustomobject]@{Description=(Normalize-CellText $descCell.InnerText);Row=[int]$row.r}
            }
        }
        foreach($expected in $ExpectedData) {
            if(-not $actual.ContainsKey($expected.Id)){throw "Data sheet is missing Markdown row $($expected.Id)."}
            if($actual[$expected.Id].Description -ne (Normalize-CellText $expected.Description)){throw "Data sheet description mismatch: $($expected.Id)."}
        }
        $extra=@($actual.Keys | Where-Object {$_ -notin @($ExpectedData.Id)})
        if($extra.Count){throw "Data sheet has IDs absent from Markdown: $($extra -join ', ')."}
        if($actual.Count -ne $ExpectedData.Count){throw "Data sheet has $($actual.Count) data IDs; Markdown defines $($ExpectedData.Count)."}
    } finally {if(Test-Path $temp){Remove-Item -LiteralPath $temp -Recurse -Force}}
}

function Sync-ScopeMetadata([object[]]$Metadata,[string]$ScopePath) {
    $text=Get-Content -LiteralPath $ScopePath -Raw
    foreach($case in $Metadata){
        $pattern='(?m)^(\| \['+[regex]::Escape($case.Id)+'\][^\r\n]+?\| )(?:CONFIRMED|IMPLEMENTED|PROPOSED|TBD|CONFLICT) \| (?:Cao|TBD)( \|)'
        $text=[regex]::Replace($text,$pattern,('${1}'+$case.Status+' | '+$case.Priority+'${2}'))
    }
    foreach($category in @('A. Functional','B. Validation','C. Business Rules','D. Calculation','E. UI/Visual','F. State/Error','G. Data/Persistence','H. Regression','**Tổng**')){
        $items=if($category -eq '**Tổng**'){@($Metadata)}else{@($Metadata|Where-Object Category -eq ($category -replace 'UI/Visual','UI • Visual' -replace 'State/Error','State • Error' -replace 'Data/Persistence','Data • Persistence'))}
        $counts=@(foreach($status in 'CONFIRMED','IMPLEMENTED','PROPOSED','TBD','CONFLICT'){@($items|Where-Object Status -eq $status).Count})
        $counts+=@($items.Count,@($items|Where-Object Priority -eq 'Cao').Count,@($items|Where-Object Priority -eq 'TBD').Count)
        $text=[regex]::Replace($text,'(?m)^\| '+[regex]::Escape($category)+' \|[^\r\n]+',('| '+$category+' | '+($counts -join ' | ')+' |'))
    }
    [IO.File]::WriteAllText($ScopePath,($text -replace "`r`n","`n"),[Text.UTF8Encoding]::new($false))
}

function Test-ScopeStats([object[]]$Metadata,[string]$ScopePath) {
    $text=Get-Content -LiteralPath $ScopePath -Raw
    foreach($case in $Metadata){
        $line=[regex]::Match($text,'(?m)^\| \['+[regex]::Escape($case.Id)+'\][^\r\n]+')
        if(-not $line.Success -or $line.Value -notmatch ('\| '+$case.Status+' \| '+$case.Priority+' \|')){throw "Scope case status/priority mismatch: $($case.Id)"}
    }
    $categories=@('A. Functional','B. Validation','C. Business Rules','D. Calculation','E. UI/Visual','F. State/Error','G. Data/Persistence','H. Regression')
    foreach($category in $categories) {
        $items=@($Metadata | Where-Object Category -eq ($category -replace 'UI/Visual','UI • Visual' -replace 'State/Error','State • Error' -replace 'Data/Persistence','Data • Persistence'))
        $line=[regex]::Match($text,'(?m)^\|\s*'+[regex]::Escape($category)+'\s*\|([^\r\n]+)')
        if(-not $line.Success){throw "Scope statistics row missing: $category"}
        $cells=@($line.Groups[1].Value.Trim().TrimEnd('|').Split('|') | ForEach-Object {$_.Trim()})
        $expected=@(
            @($items | Where-Object Status -eq 'CONFIRMED').Count,
            @($items | Where-Object Status -eq 'IMPLEMENTED').Count,
            @($items | Where-Object Status -eq 'PROPOSED').Count,
            @($items | Where-Object Status -eq 'TBD').Count,
            @($items | Where-Object Status -eq 'CONFLICT').Count,
            $items.Count,
            @($items | Where-Object Priority -eq 'Cao').Count,
            @($items | Where-Object Priority -eq 'TBD').Count
        ) | ForEach-Object {[string]$_}
        if(($cells -join '|') -ne ($expected -join '|')){throw "Scope statistics mismatch for $category. Expected $($expected -join '|'); found $($cells -join '|')."}
    }
    $totalLine=[regex]::Match($text,'(?m)^\|\s*\*\*Tổng\*\*\s*\|([^\r\n]+)')
    if(-not $totalLine.Success){throw 'Scope total statistics row is missing.'}
    $all=@(@($Metadata|Where-Object Status -eq 'CONFIRMED').Count,@($Metadata|Where-Object Status -eq 'IMPLEMENTED').Count,@($Metadata|Where-Object Status -eq 'PROPOSED').Count,@($Metadata|Where-Object Status -eq 'TBD').Count,@($Metadata|Where-Object Status -eq 'CONFLICT').Count,$Metadata.Count,@($Metadata|Where-Object Priority -eq 'Cao').Count,@($Metadata|Where-Object Priority -eq 'TBD').Count)|ForEach-Object{[string]$_}
    $totalCells=@($totalLine.Groups[1].Value.Trim().TrimEnd('|').Split('|')|ForEach-Object{$_.Trim()})
    if(($totalCells -join '|') -ne ($all -join '|')){throw "Scope grand totals mismatch. Expected $($all -join '|'); found $($totalCells -join '|')."}
    $certain=@($Metadata|Where-Object Status -in @('CONFIRMED','IMPLEMENTED')).Count
    if($text -notmatch "Case có kỳ vọng chắc chắn \(CONFIRMED \+ IMPLEMENTED\):\s*$certain/$($Metadata.Count)\b"){throw 'Scope confirmed/implemented ratio is stale.'}
}

function Test-NegativeDataCheck([string]$WorkbookPath,[object[]]$ExpectedData) {
    $temp=Join-Path ([IO.Path]::GetTempPath()) ('rc001-negative-data-'+[guid]::NewGuid().ToString('N'));New-Item -ItemType Directory -Path $temp|Out-Null
    try {
        $copy=Join-Path $temp 'copy.xlsx';Copy-Item $WorkbookPath $copy;$unpack=Join-Path $temp 'xlsx';Expand-Archive $copy $unpack
        $file=Join-Path $unpack 'xl/worksheets/sheet5.xml';[xml]$doc=Get-Content -LiteralPath $file -Raw
        $cell=$doc.SelectSingleNode("//*[local-name()='c' and @r='B5']//*[local-name()='t']")
        if(-not $cell){throw 'Negative Data check setup could not find first Markdown data cell.'}
        $cell.InnerText='tampered Data description';$doc.Save($file)
        $mutated=Join-Path $temp 'mutated.xlsx';Compress-Archive -Path (Join-Path $unpack '*') -DestinationPath $mutated
        try {Test-DataSheetSync $mutated $ExpectedData;throw 'Negative Data check failed: changed Data content was accepted.'} catch {if($_.Exception.Message -notmatch 'Data sheet description mismatch'){throw}}
    } finally {if(Test-Path $temp){Remove-Item -LiteralPath $temp -Recurse -Force}}
}

function Test-NegativeDetailCheck([string]$WorkbookPath,[object[]]$ExpectedMetadata) {
    $temp=Join-Path ([IO.Path]::GetTempPath()) ('rc001-negative-detail-'+[guid]::NewGuid().ToString('N'));New-Item -ItemType Directory -Path $temp|Out-Null
    try {
        $copy=Join-Path $temp 'copy.xlsx';Copy-Item $WorkbookPath $copy;$unpack=Join-Path $temp 'xlsx';Expand-Archive $copy $unpack
        $file=Join-Path $unpack 'xl/worksheets/sheet7.xml';[xml]$doc=Get-Content -LiteralPath $file -Raw
        $cell=$doc.SelectSingleNode("//*[local-name()='c' and @r='E7']")
        if(-not $cell){throw 'Negative detail check setup could not find the first context cell.'}
        $text=$cell.SelectSingleNode(".//*[local-name()='t']");if(-not $text){throw 'Negative detail check setup found an empty context cell.'}
        $text.InnerText='tampered detail content';$doc.Save($file)
        $mutated=Join-Path $temp 'mutated.xlsx';Compress-Archive -Path (Join-Path $unpack '*') -DestinationPath $mutated
        try {Test-DetailSync $mutated $ExpectedMetadata;throw 'Negative detail check failed: altered content was accepted.'} catch {if($_.Exception.Message -notmatch 'Detail content mismatch'){throw}}
    } finally {if(Test-Path $temp){Remove-Item $temp -Recurse -Force}}
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
        $readinessText = ([regex]::Match($block, '(?mi)^Readiness:\s*([^\r\n]+)')).Groups[1].Value.Trim()
        if ($readinessText -match '(?i)^BLOCKED') { $readiness = 'BLOCKED' } elseif ($readinessText -match '(?i)^READY') { $readiness = 'READY' } else { $readiness = 'UNASSESSED' }
        $variantLine = ([regex]::Match($block, '(?mi)^Run variants:\s*([^\r\n]+)')).Groups[1].Value.Trim()
        $variants = @($variantLine -split ';' | ForEach-Object { $_.Trim() } | Where-Object { $_ })
        if (-not $variantLine -or $variants.Count -eq 0) { throw "Run variants declaration missing: $id" }
        if (@($variants | Sort-Object -Unique).Count -ne $variants.Count -or @($variants | Where-Object { $_ -notmatch '^[A-Za-z0-9][A-Za-z0-9.-]*$' }).Count -or ($variants.Count -gt 1 -and 'Base' -in $variants)) { throw "Invalid/duplicate Run variants: $id" }
        $basis = ([regex]::Match($block, '(?m)^Priority basis: (result|lifecycle|output|visibility|authorization|other)\s*$')).Groups[1].Value
        if (-not $basis) { throw "Priority basis missing/invalid: $id" }
        $requiredPriority = if ($status -in @('CONFIRMED','IMPLEMENTED') -and $basis -ne 'other') { 'Cao' } else { 'TBD' }
        if ($priority -ne $requiredPriority) { throw "Priority inconsistent with basis/status: $id" }
        $coverage = @([regex]::Matches($block, '(?m)^\| Run: ([A-Za-z0-9.-]+) \| ([^\r\n]+) \|\s*$'))
        if ($coverage.Count -ne $variants.Count -or @($coverage | ForEach-Object {$_.Groups[1].Value} | Sort-Object -Unique).Count -ne $variants.Count -or @($coverage | Where-Object {$_.Groups[1].Value -notin $variants}).Count) { throw "Run coverage mapping differs from variants: $id" }
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
        foreach($mapping in $coverage){if(-not $action.Contains($mapping.Value.Trim())){throw "Run coverage mapping must be in Action: $id"}}
        $expected = Section 'Kết quả mong đợi'
        $evidence = Section 'Bằng chứng'
        $reset = Section 'Đặt lại'
        [pscustomobject]@{ Id=$id; Title=$title; Category=$category; Priority=$priority; Status=$status; Readiness=$readiness; Requirement=$req; Variants=$variants; Context=$context; Action=$action; Expected=$expected; Evidence=$evidence; Reset=$reset }
    })
}

function Test-NegativeSourceContract([string]$Path) {
    $original=Get-Content -LiteralPath $Path -Raw
    $temp=Join-Path ([IO.Path]::GetTempPath()) ('rc001-source-'+[guid]::NewGuid().ToString('N')+'.md')
    try {
        $mutations=@(
            @(([regex]'(?m)^Run variants:[^\r\n]+\r?\n').Replace($original,'',1),'Run variants declaration missing'),
            @(([regex]'(?m)^\| Run: [^|]+ \|').Replace($original,'| Run: orphan |',1),'Run coverage mapping differs'),
            @(([regex]'(?m)^Priority: TBD').Replace($original,'Priority: Cao',1),'Priority inconsistent')
        )
        foreach($mutation in $mutations){
            [IO.File]::WriteAllText($temp,$mutation[0],[Text.UTF8Encoding]::new($false))
            $detected=$false
            try { $null=Get-MarkdownCaseMetadata $temp } catch {if($_.Exception.Message -notmatch [regex]::Escape($mutation[1])){throw};$detected=$true}
            if(-not $detected){throw "Negative source contract check failed: $($mutation[1])"}
        }
    } finally {if(Test-Path -LiteralPath $temp){Remove-Item -LiteralPath $temp -Force}}
}

function Rebuild-WorkbookTables([string]$WorkbookPath, [string]$CasesPath, [string]$DataPath, [string]$SourcePath) {
    $meta = @(Get-MarkdownCaseMetadata $CasesPath)
    $dataRows = @(Get-MarkdownDataRows $DataPath)
    if ($meta.Count -ne 216) { throw "Source-driven rebuild found $($meta.Count) cases, expected 216." }
    $temp = Join-Path ([IO.Path]::GetTempPath()) ('rc001-rebuild-' + [guid]::NewGuid().ToString('N'))
    New-Item -ItemType Directory -Path $temp | Out-Null
    try {
        Expand-Archive -LiteralPath $WorkbookPath -DestinationPath $temp
        $uri='http://schemas.openxmlformats.org/spreadsheetml/2006/main'
        function New-Cell($doc,$ref,$value,[int]$style=9){
            $c=$doc.CreateElement('c',$uri);$c.SetAttribute('r',$ref);$c.SetAttribute('s',[string]$style)
            if($value -is [int] -or $value -is [long]){
                $v=$doc.CreateElement('v',$uri);$v.InnerText=[string]$value;$c.AppendChild($v)|Out-Null
            }elseif(-not [string]::IsNullOrEmpty([string]$value)){
                $c.SetAttribute('t','inlineStr');$is=$doc.CreateElement('is',$uri);$t=$doc.CreateElement('t',$uri);$t.InnerText=[string]$value;$is.AppendChild($t)|Out-Null;$c.AppendChild($is)|Out-Null
            }
            return $c
        }
        function New-FormulaCell($doc,$ref,$formula,[int]$style=9){$c=$doc.CreateElement('c',$uri);$c.SetAttribute('r',$ref);$c.SetAttribute('s',[string]$style);$f=$doc.CreateElement('f',$uri);$f.InnerText=[string]$formula;$c.AppendChild($f)|Out-Null;return $c}
        function New-Row($doc,$n,$values){$r=$doc.CreateElement('row',$uri);$r.SetAttribute('r',[string]$n);foreach($k in $values.Keys){$r.AppendChild((New-Cell $doc "$k$n" $values[$k] 9))|Out-Null};return $r}
        $caseFile=Join-Path $temp 'xl/worksheets/sheet4.xml';[xml]$caseDoc=Get-Content -LiteralPath $caseFile -Raw;$sd=$caseDoc.SelectSingleNode("//*[local-name()='sheetData']")
        $header=$sd.SelectSingleNode("*[local-name()='row' and @r='1']");foreach($ref in @('K1','L1','M1','N1','O1','P1')){$oldCells=@($header.SelectNodes("*[local-name()='c' and @r='$ref']"));foreach($old in $oldCells){$header.RemoveChild($old)|Out-Null}};$header.AppendChild((New-Cell $caseDoc 'K1' 'Action' 8))|Out-Null;$header.AppendChild((New-Cell $caseDoc 'L1' 'Expected' 8))|Out-Null;$header.AppendChild((New-Cell $caseDoc 'M1' 'Evidence' 8))|Out-Null;$header.AppendChild((New-Cell $caseDoc 'N1' 'Reset' 8))|Out-Null;$header.AppendChild((New-Cell $caseDoc 'O1' 'Required Variant Count' 8))|Out-Null;$header.AppendChild((New-Cell $caseDoc 'P1' 'Case Status' 8))|Out-Null
        @($sd.SelectNodes("//*[local-name()='row']")|Where-Object{[int]$_.r -ge 2 -and [int]$_.r -lt 10000})|ForEach-Object{$_.ParentNode.RemoveChild($_)|Out-Null}
        $n=2;foreach($c in $meta){$row=[ordered]@{A=$c.Id;B=$c.Title;C=$c.Category;D=$c.Context;E=$c.Priority;F=$c.Status;G=$c.Readiness;H=$c.Requirement;I=$c.Category;J='test-cases.vi.md';K=$c.Action;L=$c.Expected;M=$c.Evidence;N=$c.Reset;O=[Math]::Max(1,$c.Variants.Count)};$newRow=New-Row $caseDoc $n $row;$runVariants=$c.Variants;$formula=Get-CaseStatusFormula $c $n;$newRow.AppendChild((New-FormulaCell $caseDoc "P$n" $formula 9))|Out-Null;$sd.AppendChild($newRow)|Out-Null;$n++}
        $caseDoc.SelectSingleNode("//*[local-name()='dimension']").SetAttribute('ref',"A1:P$($n-1)");$af=$caseDoc.SelectSingleNode("//*[local-name()='autoFilter']");if($af){$af.SetAttribute('ref',"A1:P$($n-1)")};$caseDoc.Save($caseFile)
        $runFile=Join-Path $temp 'xl/worksheets/sheet6.xml';[xml]$runDoc=Get-Content -LiteralPath $runFile -Raw;$rsd=$runDoc.SelectSingleNode("//*[local-name()='sheetData']")
        @($rsd.SelectNodes("//*[local-name()='row']")|Where-Object{[int]$_.r -ge 2 -and [int]$_.r -lt 10000})|ForEach-Object{$_.ParentNode.RemoveChild($_)|Out-Null}
        $n=2
        foreach($c in $meta) {
            $runVariants=$c.Variants
            foreach($variant in $runVariants) {$rsd.AppendChild((New-Row $runDoc $n ([ordered]@{A="RUN-$($c.Id)-$variant";B=$c.Id;C=$variant;D='NOT RUN';E='';F='';G='';H='';I='';J='';K='';L='';M=''})))|Out-Null;$n++}
        }
        $runDoc.SelectSingleNode("//*[local-name()='dimension']").SetAttribute('ref',"A1:M$($n-1)");$af=$runDoc.SelectSingleNode("//*[local-name()='autoFilter']");if($af){$af.SetAttribute('ref',"A1:M$($n-1)")}
        # Run Log owns one status validation. Rebuild it from the actual run count,
        # including when the template's validation is missing or stale.
        $validations=$runDoc.SelectSingleNode("//*[local-name()='dataValidations']")
        if (-not $validations) {
            $validations=$runDoc.CreateElement('dataValidations',$uri)
            $predecessor=$runDoc.SelectSingleNode("//*[local-name()='sheetData' or local-name()='sheetCalcPr' or local-name()='sheetProtection' or local-name()='protectedRanges' or local-name()='scenarios' or local-name()='autoFilter' or local-name()='sortState' or local-name()='dataConsolidate' or local-name()='customSheetViews' or local-name()='mergeCells' or local-name()='phoneticPr' or local-name()='conditionalFormatting'][last()]")
            $runDoc.DocumentElement.InsertAfter($validations,$predecessor)|Out-Null
        }
        $validations.RemoveAll();$validations.SetAttribute('count','1')
        $validation=$runDoc.CreateElement('dataValidation',$uri)
        foreach($attribute in @{type='list';sqref="D2:D$($n-1)";allowBlank='0';showDropDown='0';showErrorMessage='1';errorStyle='stop'}.GetEnumerator()) {
            $validation.SetAttribute($attribute.Key,$attribute.Value)
        }
        $statusList=$runDoc.CreateElement('formula1',$uri);$statusList.InnerText='"NOT RUN,PASS,FAIL,BLOCKED,SKIPPED"'
        $validation.AppendChild($statusList)|Out-Null;$validations.AppendChild($validation)|Out-Null
        $runDoc.Save($runFile)
        $summaryFile=Join-Path $temp 'xl/worksheets/sheet3.xml';[xml]$summaryDoc=Get-Content -LiteralPath $summaryFile -Raw;$summaryData=$summaryDoc.SelectSingleNode("//*[local-name()='sheetData']")
        # Replace the generated summary block; appending to an existing workbook
        # would otherwise duplicate rows 19-23 on every Generate run.
        foreach($old in @($summaryData.SelectNodes("*[local-name()='row']")|Where-Object{[int]$_.r -ge 19})){$summaryData.RemoveChild($old)|Out-Null}
        function Add-SummaryMetric($doc,[int]$rowNumber,[string]$label,[string]$formula){$row=$doc.CreateElement('row',$uri);$row.SetAttribute('r',[string]$rowNumber);$row.AppendChild((New-Cell $doc "A$rowNumber" $label 9))|Out-Null;$cell=$doc.CreateElement('c',$uri);$cell.SetAttribute('r',"B$rowNumber");$f=$doc.CreateElement('f',$uri);$f.InnerText=$formula;$cell.AppendChild($f)|Out-Null;$row.AppendChild($cell)|Out-Null;$summaryData.AppendChild($row)|Out-Null}
        Add-SummaryMetric $summaryDoc 19 'SKIPPED variants' 'COUNTIF(''Run Log''!D:D,"SKIPPED")'
        Add-SummaryMetric $summaryDoc 20 'Total run rows' 'COUNTA(''Run Log''!A:A)-1'
        Add-SummaryMetric $summaryDoc 21 'Attempted variants' 'COUNTIF(''Run Log''!D:D,"PASS")+COUNTIF(''Run Log''!D:D,"FAIL")+COUNTIF(''Run Log''!D:D,"BLOCKED")+COUNTIF(''Run Log''!D:D,"SKIPPED")'
        Add-SummaryMetric $summaryDoc 22 'Completed cases (all required variants PASS)' 'COUNTIF(Cases!P:P,"PASS")'
        Add-SummaryMetric $summaryDoc 23 'Cases with incomplete variant coverage' 'COUNTIF(Cases!P:P,"INCOMPLETE")'
        $summaryDoc.SelectSingleNode("//*[local-name()='dimension']").SetAttribute('ref','A1:B23');$summaryDoc.Save($summaryFile)
        # Keep the layout sheets visually consistent with the established blue header style.
        $caseCols=$caseDoc.SelectSingleNode("//*[local-name()='cols']");foreach($spec in @(@(11,11,70),@(12,12,70),@(13,13,48),@(14,14,36),@(15,15,20),@(16,16,20))){foreach($old in @($caseCols.SelectNodes("*[local-name()='col' and @min='$($spec[0])' and @max='$($spec[1])']"))){$caseCols.RemoveChild($old)|Out-Null};$col=$caseDoc.CreateElement('col',$uri);$col.SetAttribute('min',[string]$spec[0]);$col.SetAttribute('max',[string]$spec[1]);$col.SetAttribute('width',[string]$spec[2]);$col.SetAttribute('customWidth','1');$caseCols.AppendChild($col)|Out-Null};$caseDoc.Save($caseFile)
        foreach($sheetNo in 11,12,13){$f=Join-Path $temp "xl/worksheets/sheet$sheetNo.xml";[xml]$doc=Get-Content -LiteralPath $f -Raw;$cell=$doc.SelectSingleNode("//*[local-name()='c' and @r='C2']");if($cell){$cell.SetAttribute('s','11')};$doc.Save($f)}
        $dataFile=Join-Path $temp 'xl/worksheets/sheet5.xml';[xml]$dataDoc=Get-Content -LiteralPath $dataFile -Raw;$dataSheet=$dataDoc.SelectSingleNode("//*[local-name()='sheetData']")
        foreach($old in @($dataSheet.SelectNodes("*[local-name()='row']")|Where-Object{[int]$_.r -ge 5})){ $dataSheet.RemoveChild($old)|Out-Null }
        foreach($ref in 'A1','B1','A4','B4'){$cell=$dataDoc.SelectSingleNode("//*[local-name()='c' and @r='$ref']");if($cell){$cell.SetAttribute('s','11')}}
        $rowNo=5;foreach($d in $dataRows){$row=$dataDoc.CreateElement('row',$uri);$row.SetAttribute('r',[string]$rowNo);$row.AppendChild((New-Cell $dataDoc "A$rowNo" $d.Id 9))|Out-Null;$row.AppendChild((New-Cell $dataDoc "B$rowNo" $d.Description 9))|Out-Null;$dataSheet.AppendChild($row)|Out-Null;$rowNo++}
        $dataDoc.SelectSingleNode("//*[local-name()='dimension']").SetAttribute('ref',"A1:B$($rowNo-1)")
        $dataFilter=$dataDoc.SelectSingleNode("//*[local-name()='autoFilter']");if($dataFilter){$dataFilter.SetAttribute('ref',"A4:B$($rowNo-1)")}
        $dataDoc.Save($dataFile)
        $runSummaryCell=$summaryDoc.SelectSingleNode("//*[local-name()='c' and @r='B4']")
        if($runSummaryCell){$sourceState=Get-SourceState $SourcePath;$revision=Get-SourceRevision $SourcePath;if($sourceState -eq 'clean'){$replacement=New-FormulaCell $summaryDoc 'B4' ('HYPERLINK("https://github.com/TryHand-Co-Ltd/blend-context/tree/{0}/features/RC-001-red-score/docs/v2/test-spec","v2 source · revision {0}")' -f $revision) 9}else{$replacement=New-Cell $summaryDoc 'B4' "v2 working tree based on $revision; exact source hashes in manifest; pinned link pending commit" 9};$runSummaryCell.ParentNode.ReplaceChild($replacement,$runSummaryCell)|Out-Null}
        $summaryDoc.Save($summaryFile)
        # Rebuild every A-H detail sheet from Markdown. Existing detail rows are discarded,
        # so stale and appended duplicate case blocks cannot survive a Generate run.
        $detailSheetByCategory=@{'A. Functional'=7;'B. Validation'=8;'C. Business Rules'=9;'D. Calculation'=10;'E. UI • Visual'=11;'F. State • Error'=12;'G. Data • Persistence'=13;'H. Regression'=14}
        foreach($sheetNo in 7..14) {
            $f=Join-Path $temp "xl/worksheets/sheet$sheetNo.xml"; [xml]$d=Get-Content -LiteralPath $f -Raw; $sd2=$d.SelectSingleNode("//*[local-name()='sheetData']")
            foreach($old in @($sd2.SelectNodes("*[local-name()='row']") | Where-Object { [int]$_.r -ge 4 })) { $sd2.RemoveChild($old)|Out-Null }
            $sheetCategory=($detailSheetByCategory.GetEnumerator() | Where-Object Value -eq $sheetNo | Select-Object -First 1).Key
            $next=4
            foreach($c in @($meta | Where-Object Category -eq $sheetCategory)) {
                $pairs=@(
                    @('C',"$($c.Id) — $($c.Title)",9),
                    @('D',"Priority: $($c.Priority) ｜ Status: $($c.Status) ｜ Readiness: $($c.Readiness) ｜ Requirement ID: $($c.Requirement)",10),
                    @('D','前提条件（Điều kiện trước）',8),@('E',$c.Context,9),
                    @('D','操作（Thao tác）',8),@('E',(Format-DetailAction $c.Action),9),
                    @('D','期待結果（Kết quả mong đợi）',8),@('E',$c.Expected,9),
                    @('D','証跡（Bằng chứng）',8),@('E',$c.Evidence,9),
                    @('D','リセット（Đặt lại）',8),@('E',$c.Reset,9)
                )
                # Retain a spacer row so existing case positions remain stable.
                $pairs += ,@('D','',9)
                foreach($pair in $pairs) {
                    $r=$d.CreateElement('row',$uri);$r.SetAttribute('r',[string]$next)
                    $cell=$d.CreateElement('c',$uri);$cell.SetAttribute('r',"$($pair[0])$next");$cell.SetAttribute('s',[string]$pair[2]);$cell.SetAttribute('t','inlineStr')
                    $is=$d.CreateElement('is',$uri);$t=$d.CreateElement('t',$uri);$t.InnerText=[string]$pair[1];$is.AppendChild($t)|Out-Null;$cell.AppendChild($is)|Out-Null;$r.AppendChild($cell)|Out-Null;$sd2.AppendChild($r)|Out-Null;$next++
                }
            }
            $d.SelectSingleNode("//*[local-name()='dimension']").SetAttribute('ref',"A1:F$($next-1)");$d.Save($f)
        }
        $indexFile=Join-Path $temp 'xl/worksheets/sheet2.xml';[xml]$indexDoc=Get-Content -LiteralPath $indexFile -Raw;$indexData=$indexDoc.SelectSingleNode("//*[local-name()='sheetData']")
        $indexRecords=@();foreach($row in @($indexData.SelectNodes("*[local-name()='row']")|Where-Object{[int]$_.r -ge 2})){$fields=@{};foreach($cell in @($row.SelectNodes("*[local-name()='c']"))){$col=([regex]::Match($cell.r,'^[A-E]')).Value;if($col){$fields[$col]=$cell.InnerText}};if($fields['B'] -match '^TC-RS-'){$indexRecords+=,[pscustomobject]@{Scenario=$fields['A'];Id=$fields['B']}}}
        $scopeText=Get-Content -LiteralPath (Join-Path $SourcePath 'scope-and-approach.vi.md') -Raw
        foreach($c in $meta){if($c.Id -notin @($indexRecords.Id)){$scopeLine=@($scopeText -split "`n" | Where-Object {$_ -match "^\| \[$([regex]::Escape($c.Id))\]"} | Select-Object -First 1);if(-not $scopeLine){throw "Business Index has no scenario mapping for $($c.Id)."};$scenario=([regex]::Match($scopeLine[0],'TS-RS-\d{3}')).Value;if(-not $scenario){throw "Business Index scenario missing for $($c.Id)."};$indexRecords+=,[pscustomobject]@{Scenario=$scenario;Id=$c.Id}}}
        foreach($row in @($indexData.SelectNodes("*[local-name()='row']")|Where-Object{[int]$_.r -ge 2})){$indexData.RemoveChild($row)|Out-Null}
        $metaById=@{};foreach($c in $meta){$metaById[$c.Id]=$c}
        $indexRow=2;foreach($record in @($indexRecords|Sort-Object Scenario,Id)){$c=$metaById[$record.Id];if(-not $c){throw "Unknown Business Index ID $($record.Id)."};$indexData.AppendChild((New-Row $indexDoc $indexRow ([ordered]@{A=$record.Scenario;B=$c.Id;C=$c.Title;D=$c.Category;E='test-cases.vi.md'})))|Out-Null;$indexRow++}
        $indexDoc.SelectSingleNode("//*[local-name()='dimension']").SetAttribute('ref',"A1:E$($indexRow-1)");$indexFilter=$indexDoc.SelectSingleNode("//*[local-name()='autoFilter']");if($indexFilter){$indexFilter.SetAttribute('ref',"A1:E$($indexRow-1)")};$indexDoc.Save($indexFile)
        $dataFile=Join-Path $temp 'xl/worksheets/sheet5.xml';[xml]$dataDoc=Get-Content -LiteralPath $dataFile -Raw;$dataData=$dataDoc.SelectSingleNode("//*[local-name()='sheetData']");foreach($row in @($dataData.SelectNodes("*[local-name()='row']")|Where-Object{[int]$_.r -ge 9999})){$dataData.RemoveChild($row)|Out-Null};$maxRow=(@($dataData.SelectNodes("*[local-name()='row']")|ForEach-Object{[int]$_.r}|Measure-Object -Maximum).Maximum);$dataDoc.SelectSingleNode("//*[local-name()='dimension']").SetAttribute('ref',"A1:B$maxRow");$dataDoc.Save($dataFile)
        $out="$temp/rebuilt.xlsx";Compress-Archive -Path (Join-Path $temp '*') -DestinationPath $out -Force;Move-Item $out $WorkbookPath -Force
    } finally { if(Test-Path $temp){Remove-Item $temp -Recurse -Force} }
}

$caseIds = Get-UniqueCaseIds $cases
$caseMetadata = @(Get-MarkdownCaseMetadata $cases)
Test-NegativeSourceContract $cases
if ($caseIds.Count -ne 216) { throw "Expected 216 unique Markdown case IDs, found $($caseIds.Count)." }
$acIds = Get-UniqueAcIds $scope
$expectedAc = 1..40 | ForEach-Object { 'AC-G{0:D2}' -f $_ }
$missingAc = @($expectedAc | Where-Object { $_ -notin $acIds })
if ($missingAc.Count -gt 0) { throw "Missing AC mappings: $($missingAc -join ', ')" }

if ($Mode -eq 'Check') {
Test-ScopeStats $caseMetadata $scope
Test-Manifest $Manifest $defaultWorkbook $SourceRoot $cases $data $scope
Test-WorksheetStructure $defaultWorkbook
Test-NegativeStructureCheck $defaultWorkbook
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
        $sentinelRows = @($sheet.SelectNodes("//*[local-name()='row']") | Where-Object { [int]$_.r -ge 9999 })
        if ($sentinelRows.Count -gt 0) { throw "Workbook contains sentinel rows in $($sheetPath.Name)." }
    }
    Test-WorkbookTables $defaultWorkbook $caseIds $caseMetadata
    Test-DataSheetSync $defaultWorkbook (Get-MarkdownDataRows $data)
    Test-NegativeDataCheck $defaultWorkbook (Get-MarkdownDataRows $data)
    Test-NegativeVariantCheck $defaultWorkbook $caseIds $caseMetadata
    Test-DetailSync $defaultWorkbook $caseMetadata
    Test-NegativeDetailCheck $defaultWorkbook $caseMetadata
} finally {
    if (Test-Path $xmlInfo.Temp) { Remove-Item -LiteralPath $xmlInfo.Temp -Recurse -Force }
}
}

if ($Mode -eq 'Generate') {
    Sync-ScopeMetadata $caseMetadata $scope
    $outputFull = [IO.Path]::GetFullPath($Output)
    $manifestFull = [IO.Path]::GetFullPath($Manifest)
    $outputDir = Split-Path -Parent $outputFull
    $manifestDir = Split-Path -Parent $manifestFull
    New-Item -ItemType Directory -Force -Path $outputDir,$manifestDir | Out-Null
    if ($outputFull -ne ([IO.Path]::GetFullPath($defaultWorkbook))) {
        Copy-Item -LiteralPath $defaultWorkbook -Destination $outputFull -Force
    }
    Rebuild-WorkbookTables $outputFull $cases $data $SourceRoot
    Test-WorksheetStructure $outputFull
    Test-NegativeStructureCheck $outputFull
    Test-ScopeStats $caseMetadata $scope
    Test-WorkbookTables $outputFull $caseIds $caseMetadata
    Test-DataSheetSync $outputFull (Get-MarkdownDataRows $data)
    Test-NegativeDataCheck $outputFull (Get-MarkdownDataRows $data)
    Test-DetailSync $outputFull $caseMetadata
    Test-NegativeVariantCheck $outputFull $caseIds $caseMetadata
    Test-NegativeDetailCheck $outputFull $caseMetadata
    $runRowCount=0;foreach($case in $caseMetadata){$runRowCount += [Math]::Max(1,$case.Variants.Count)}
    $sourceState=Get-SourceState $SourceRoot
    $manifestObject = [ordered]@{
        generator = $GeneratorVersion
        command = "pwsh -File tools/generate-test-spec.ps1 -Mode Generate -SourceRoot ."
        generatedAt = (Get-Date).ToUniversalTime().ToString('o')
        sourceRoot = '.'
        sourceRevision = (Get-SourceRevision $SourceRoot)
        sourceState = $sourceState
        sources = [ordered]@{
            cases = [ordered]@{ path = 'test-cases.vi.md'; sha256 = (Get-NormalizedSha256 $cases) }
            data = [ordered]@{ path = 'test-data.vi.md'; sha256 = (Get-NormalizedSha256 $data) }
            scope = [ordered]@{ path = 'scope-and-approach.vi.md'; sha256 = (Get-NormalizedSha256 $scope) }
        }
        generatorSource = [ordered]@{ path = 'tools/generate-test-spec.ps1'; sha256 = (Get-FileHash $PSCommandPath -Algorithm SHA256).Hash }
        workbook = [ordered]@{ path = [IO.Path]::GetFileName($outputFull); sha256 = (Get-FileHash $outputFull -Algorithm SHA256).Hash }
        counts = [ordered]@{ cases = $caseIds.Count; acceptanceCriteria = 40; runRows = $runRowCount }
    }
    $manifestObject | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $manifestFull -Encoding UTF8
    Test-Manifest $manifestFull $outputFull $SourceRoot $cases $data $scope
    Write-Output "Generated/validated $outputFull"
    Write-Output "Manifest: $manifestFull"
} else {
    Write-Output "CHECK PASS: $($caseIds.Count) case IDs, 40 AC IDs, workbook aligned."
}
