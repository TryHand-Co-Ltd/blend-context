# BLEND Kit — runtime TC block

Snapshot family test-report@2.0.0 lấy ngày 04/10/2026. Có đúng hai sheet, một block/TC và một bộ actual/status/ảnh mỗi biến thể. Block hiển thị nhãn kỹ thuật đậm, conditions/actions/expected dạng bullets; không hiển thị link/caption/footer/generic proof. block_report.py dựng layout, tính và check; report_model.py giữ projection/identity/privacy; exporter đọc schema; checker đọc cùng report không sửa. Source testcase hiện hành là 1.1.0; 1.0.0 lịch sử còn đọc với route unknown.

Asset source có placeholder preview để mở trực tiếp vẫn hiểu layout. build() xóa preview trước projection nên report sinh ra không mang sample data. Title và section được căn giữa theo chiều dọc; câu action dùng font thường với step number đậm; tiếng Việt hiển thị theo sentence case. Renderer bỏ dấu list ở đầu dòng nguồn trước khi thêm đúng một bullet; inline code hiển thị dạng `[identifier]`, giữ nguyên ký tự bên trong như `[**24]`, và chỉ bỏ `**` khi đó là Markdown bold ở ngoài code. Dropdown trạng thái nằm trong một ô B compact, không merge theo chiều rộng nội dung.

Nguồn business/gaps và giá trị được giữ; route chưa xác minh hiển thị rõ. Input thực thi/ảnh trống. Dependency Python có sẵn theo requirements; không tự cài. Không cần cấu hình workstation hoặc dataset ẩn.

python scripts/test_projection.py --source-dir ../../ kiểm identity và gap, không chạy ứng dụng. XLSX checker không chứng nhận native Google Sheets; conversion/ảnh/quyền người nhận phải có kiểm chứng riêng.
