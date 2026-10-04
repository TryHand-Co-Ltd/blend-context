# BLEND Kit — test-report runtime snapshot

Snapshot công cụ/asset VI của family `test-report@1.0.1`, lấy ngày 04/10/2026 để dùng trực tiếp trong RC-001. Không cần cấu hình workstation hoặc checkout riêng của tác giả.

`export_report.py` kiểm schema nguồn và tạo output mới; `check_report.py` đọc cùng report. `report_model.py` giữ identity, privacy, eligibility và công thức; `render_report.py` dựng đúng asset VI. Dependencies khai báo ở `requirements.txt`; không tự cài đặt.

Mô tả gap được giữ trong điều kiện/Chi tiết của testcase tương ứng để Tổng quan không vượt dung lượng đọc được. Gap chưa gắn case vẫn giữ ở Tổng quan. Giữ nguyên bảy cột, cách tính kết quả và điều kiện được tính Đạt/Không đạt; template 1.0.1 bổ sung phần trích có liên kết và mức chuẩn bị theo testcase.

Chạy `python scripts/test_projection.py --source-dir ../../` từ thư mục này để kiểm số lượng, identity và bảo toàn gap; đây là kiểm report projection, không thực thi ứng dụng.

Phần trích trong Kiểm thử giúp đọc lướt; mở liên kết để đọc đầy đủ thao tác/kỳ vọng trước khi chạy. Tổng quan phân biệt số testcase với số biến thể và mức chuẩn bị với trạng thái đã chạy.
