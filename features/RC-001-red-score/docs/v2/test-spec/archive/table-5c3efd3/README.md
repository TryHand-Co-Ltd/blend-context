# RC-001 — Test Spec và báo cáo kiểm thử

Bộ hiện hành dùng schema `scope-and-approach`, `test-cases`, `test-data` và `test-report@1.0.1` của BLEND Kit. Chỉ bản Việt trong phạm vi cập nhật này; giữ 216 Case IDs và 569 Variant IDs đã review.

- [Phạm vi, coverage và gaps](scope-and-approach.vi.md).
- [Testcase theo luồng nghiệp vụ](test-cases.vi.md).
- [Dữ liệu dùng chung](test-data.vi.md).
- [Report để QA nhập kết quả](test-report.vi.xlsx): Tổng quan, Kiểm thử bảy cột, Chi tiết có điều kiện; một vị trí nhập actual/status/evidence cho mỗi case/variant.

Report hiện chưa thực thi. Không đổi kỳ vọng theo kết quả chạy; các gap chuẩn bị/quyết định vẫn giữ trong nguồn và chi tiết từng testcase. Summary không lặp mọi gap vào một ô dài; gap chưa gắn testcase vẫn giữ ở phần giới hạn.

## Sinh và kiểm cùng report

Python cần các dependency đã có trong [requirements](tools/blend-kit-report/requirements.txt); không tự cài khi thiếu. Công cụ/asset VI được chụp từ BLEND Kit để các thành viên có thể chạy từ repository này.

```powershell
python tools/blend-kit-report/scripts/export_report.py --source-dir . --output test-report.vi.xlsx --language vi
python tools/blend-kit-report/scripts/check_report.py --source-dir . --report test-report.vi.xlsx --language vi --phase in-progress
```

Generator từ chối output đã tồn tại. QA nhập kết quả trong chính workbook đó rồi check chỉ đọc; không sinh report thứ hai sau kiểm thử. Lượt mới hoặc expected mới cần đường dẫn mới được giao rõ. `--phase complete` chỉ dùng khi có observations, evidence và attestations đóng lượt/quyền xem bằng chứng thật qua stdin; không tự tạo attestation để đạt check.

Wrapper PowerShell `tools/generate-test-spec.ps1` giữ hai mode Generate/Check và cho chọn Python hiện có bằng `-Python`; mode mặc định Check, report mặc định `test-report.vi.xlsx`.

## Bản cũ

[Archive bba351f](archive/legacy-bba351f/README.md) giữ nguyên byte của ba Markdown, workbook, manifest và generator cũ. Đây là lịch sử; không là nguồn đang dùng cho report mới và không có kết quả chạy nào được chuyển sang report mới.

Phần trích trong Kiểm thử giúp đọc lướt; mở liên kết để đọc đầy đủ thao tác/kỳ vọng trước khi chạy. Tổng quan phân biệt số testcase với số biến thể và mức chuẩn bị với trạng thái đã chạy.
