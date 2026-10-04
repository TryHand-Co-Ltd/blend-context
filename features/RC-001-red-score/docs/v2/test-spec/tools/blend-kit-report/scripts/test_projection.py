"""Verify identities and gap preservation without executing application tests."""
import argparse
from pathlib import Path
from report_model import prepare_report, public_text, working

parser = argparse.ArgumentParser()
parser.add_argument('--source-dir', type=Path, required=True)
args = parser.parse_args()
design = working.parse_sources(args.source_dir, 'vi')
report, _ = prepare_report(args.source_dir, 'vi')
expected = [(case['id'], variant[0]) for case in design['cases'] for variant in case['variants']]
assert [(row.case_id, row.variant) for row in report.rows] == expected
assert sum(sum(case['readiness'] == state for case in design['cases']) for state in ('Ready', 'Draft', 'Blocked')) == len(design['cases'])
assert 'Tính theo testcase' in report.summary['preparation']
assert all('Chuẩn bị:' in row.conditions_preview and 'Kỳ vọng:' in row.conditions_preview
           and row.screen_preview and row.expected_preview for row in report.rows)
for gap in design['gaps']:
    owners = {case['id'] for case in design['cases'] if gap[0] in case['gap'].split(', ')}
    text = public_text(gap[3] + '\n' + gap[4], 'gap')
    if owners:
        assert all(text in row.conditions for row in report.rows if row.case_id in owners)
    else:
        assert text in report.summary['limitations']
assert len(report.summary['limitations'].splitlines()) <= 23
print(f'PASS: {len(design["cases"])} cases, {len(report.rows)} variants; all gaps preserved.')
