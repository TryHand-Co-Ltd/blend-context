"""Verify identities and gap preservation without executing application tests."""
import argparse
import re
from pathlib import Path
from report_model import concise_lines, markdown_leak, prepare_report, public_text, working
from block_report import layout

parser = argparse.ArgumentParser()
parser.add_argument('--source-dir', type=Path, required=True)
args = parser.parse_args()
design = working.parse_sources(args.source_dir, 'vi')
report, _ = prepare_report(args.source_dir, 'vi')
expected = [(case['id'], variant[0]) for case in design['cases'] for variant in case['variants']]
assert [(row.case_id, row.variant) for row in report.rows] == expected
assert sum(sum(case['readiness'] == state for case in design['cases']) for state in ('Ready', 'Draft', 'Blocked')) == len(design['cases'])
assert 'Tính theo TC' in report.summary['preparation']
cards, inputs = layout(report)
assert set(inputs) == {row.identity for row in report.rows}
assert all(card['status_row'] == card['start'] + 1 for card in cards)
assert all(all(label not in ('Chuẩn bị', 'Kỳ vọng') for label, _ in case['preparation_items']) for case in report.cases)
visible = '\n'.join(str(value or '') for card in cards for _, value, _, right, _, label in card['rows'] for value in (label, value, right))
assert all(value not in visible for value in ('Link bằng chứng / lỗi', 'Chú thích ảnh / bước được chứng minh', 'Sau kiểm thử', 'Về Tổng quan', 'Đạt đủ điều kiện', 'Không đạt đủ điều kiện'))
assert not markdown_leak(visible)
assert not re.search(r'(?m)^•\s*[-+*•]\s+', visible)
assert all(fields['status'].startswith('B') for fields in inputs.values())
assert all(identifier in visible for identifier in ('[incomplete-excluded]', '[complete-deleted-stale]', '[incomplete-deleted-stale]'))
assert '[**24]' in visible and '[**29]' in visible
for gap in design['gaps']:
    owners = {case['id'] for case in design['cases'] if gap[0] in case['gap'].split(', ')}
    text = public_text(gap[3] + '\n' + gap[4], 'gap')
    if owners:
        for case in report.cases:
            if case['id'] in owners:
                rendered = '\n'.join(value for _, value in case['preparation_items'])
                normalize = lambda value: ' '.join(concise_lines(value).replace('• ', '').split()).casefold()
                assert normalize(gap[3]) in normalize(rendered)
    else:
        assert text in report.summary['limitations']
assert len(report.summary['limitations'].splitlines()) <= 23
print(f'PASS: {len(design["cases"])} cases, {len(report.rows)} variants; all gaps preserved.')
