# DEC-004 — Điểm đỏ chỉ dùng kết quả tổng hợp đã chốt, đọc qua getTotalResults()

Ngày: **2026-10-28**. Feature: RC-001 (cùng áp dụng cho RA-001 và EM-001). Căn cứ: thống nhất với shite (10/2026) — ①②③ chỉ dùng kết quả tổng hợp thứ hạng đã chốt; PR [#57058](https://github.com/ednity/school-web/pull/57058).

| Mục | Nội dung |
| --- | --- |
| Quyết định | Điểm đỏ chỉ đọc kết quả tổng hợp **đã chốt（確定）** đang hiệu lực của khối × kỳ/thời điểm, qua `GradeCalcResultService::getTotalResults(..., $use_fix_table = true)`. Chưa chốt hoặc đã bỏ chốt → chưa xét được (không có dữ liệu). Không dùng kết quả tổng hợp chưa chốt mới nhất. Trung bình = `total_score ÷ student_count` (không làm tròn); tỷ lệ nhóm = `total_score × 100 ÷ max_score`. ID nguồn được ghi là ID bản chốt đang hiệu lực. |
| Thay thế | Quy tắc cũ «ưu tiên bản chốt; chưa chốt thì dùng kết quả hoàn tất mới nhất» (spec §5.5, AC-G13, Q&A, TC-RS-BR-008) |
| Ảnh hưởng | Cập nhật spec, định nghĩa màn, tiêu chí nghiệm thu, thiết kế DB (`kind` chỉ còn `confirmed`), chia việc, test case (BR-007/008/021, FUNC-015, ERR-016…) và dữ liệu test. Quy trình vận hành thêm bước **Chốt（確定）** giữa nút xanh và nút cam |
| Trạng thái | Đã thống nhất với shite; chưa phải phê duyệt khách hàng trên tài liệu gửi ngoài |

## Phần còn mở (chưa đổi tài liệu)

- ~~Yêu cầu 1 của shite~~ — **Đã chốt (28/10/2026, shite):** bỏ ràng buộc «nguồn và ô xét phải cùng mục đánh giá»; trung bình chỉ lấy từ kết quả đã chốt của thiết lập đã chọn; nguồn/lịch sử ghi ID mục thực tế từ phương thức chung của PR #57058; đổi mục đích của thiết lập mà chưa tổng hợp lại/chốt lại thì vẫn dùng bản chốt cũ với mục thực tế của nó; ID không lấy được = không xác định (vẫn xét, lưu `null`). Chỉ bỏ ràng buộc mục đánh giá, môn/đơn vị không đổi. Đã phản ánh trong spec §5.4–5.5, AC-G13, DB design, TC-RS-BR-041.
- Cảnh báo khi thiết lập tổng hợp đổi sau lúc chốt (Kurashima-san, PR #57058): chưa push; cập nhật tài liệu khi có.
- Các dòng tổng hợp theo lớp học phần đã có trước khi thêm cột `evaluate_item_id` có thể có giá trị rỗng; coi rỗng là «không xác định».

## Lý do

Kết quả đỏ phải dựa trên số liệu đã được người phụ trách chốt, cùng một đường đọc với tính năng xếp hạng trung bình và ánh xạ khoảng điểm. Dùng kết quả chưa chốt làm số liệu thay đổi sau mỗi lần tổng hợp.
