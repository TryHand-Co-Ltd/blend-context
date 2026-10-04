# RC-001 — Test Spec và báo cáo kiểm thử

Bộ hiện hành dùng test-report@2.0.0: đúng hai sheet Tổng quan/Testcases. Mỗi TC có title, trạng thái ở dòng riêng, màn hình/chức năng cạnh URL tương đối và bốn phần ngắn: Điều kiện kiểm thử, Thao tác, Kết quả mong đợi, Kết quả thực tế. Nhãn kỹ thuật in đậm; steps/assertions dùng danh sách. Một bộ status/actual/ảnh riêng mỗi biến thể, actual/ảnh ban đầu trống. Giữ 216 TC, 569 biến thể và 100 fixture IDs.

Template Blend Kit có một block placeholder để member xem layout khi mở trực tiếp. Generator xóa block đó trước khi ghi TC thật; report hiện hành không chứa placeholder. Title/section/labels/step number được nhấn rõ, action text giữ font thường; title căn giữa theo chiều dọc và các dòng tiếng Việt bắt đầu bằng chữ hoa.
Toàn bộ text của block căn giữa theo chiều dọc. Reset hiển thị bằng label chữ; vùng status/actual/ảnh dùng nền xám rất nhạt và viền, không dùng nền vàng.
Text trong Testcases căn trái. Action labels dùng Step 1/Step 2 ở VI và ステップ 1/ステップ 2 ở JA.
Mỗi dòng danh sách chỉ có một bullet; dấu list của Markdown nguồn được normalize trước khi hiển thị. Identifier kỹ thuật hiển thị dạng `[incomplete-excluded]`; ký tự bên trong code vẫn giữ nguyên, ví dụ `[**24]`. XLSX không hiển thị backtick hoặc marker bold ở ngoài technical token. Dropdown trạng thái nằm trong ô compact không merge cạnh nhãn để popup mở đúng vị trí trong Excel/Google Sheets.

- [Phạm vi và gaps](scope-and-approach.vi.md).
- [Testcase và screen_relative_path](test-cases.vi.md): family 1.1.0; route chưa xác minh giữ unknown.
- [Dữ liệu](test-data.vi.md).
- [Report hiện hành](test-report.vi.xlsx).
- [Bản dạng bảng 1.0.1](archive/table-5c3efd3/ARCHIVE.md).
- [Bản legacy bba351f](archive/legacy-bba351f/README.md).

Report chưa thực thi; chưa có route được xác minh trong đợt migration này. Template đẹp hoặc checker in-progress đạt không là QA hoàn tất. Chưa có bằng chứng chuyển đổi native Google Sheets.

## Sinh và kiểm

Python dùng [dependency hiện có](tools/blend-kit-report/requirements.txt), không tự cài.

```powershell
python tools/blend-kit-report/scripts/export_report.py --source-dir . --output NEW-REPORT.xlsx --language vi
python tools/blend-kit-report/scripts/check_report.py --source-dir . --report NEW-REPORT.xlsx --language vi --phase in-progress
```

Generator từ chối output đã có; QA nhập cùng report. Checker chỉ đọc; complete cần actual và xác nhận đóng lượt/review ảnh thật khi có. Không đổi expected theo actual. Với Không đạt/Bị chặn/Không thực hiện, ghi quan sát, lý do và bước tiếp theo trong Kết quả thực tế.

Ảnh đặt trong slot biến thể; không có dòng link/chú thích ảnh riêng. Tăng chiều cao slot nếu cần; saved alt text và review metadata vẫn được kiểm khi complete. XLSX checker không hỗ trợ tùy ý chèn/sort hàng hay thay vị trí nhập. Native Sheets cần kiểm riêng sau import; không coi việc mở XLSX trong giao diện Sheets là đã convert native.
