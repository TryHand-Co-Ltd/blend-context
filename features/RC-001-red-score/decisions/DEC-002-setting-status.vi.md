# DEC-002 — Một cột trạng thái cho rule điểm đỏ

Ngày: **30/09/2026**. Phạm vi: RC-001. Căn cứ: [phản hồi mới](../sources/2026-09-30-design-review-confirmation.vi.md), chỉ dẫn cập nhật của người phụ trách. Thay thế phương án active + deleted_at ở mục ① của [DEC-001](DEC-001-review-state-and-ui-consistency.vi.md).

## Quyết định và giới hạn xác nhận

Chọn `setting_status TINYINT UNSIGNED NOT NULL DEFAULT 0` cho bảng rule mới, không giữ active hoặc thêm deleted_at/deleted_flg trong thiết kế hiện hành.

| Mã kỹ thuật | Ý nghĩa | Hiện trong danh sách | Tham gia xét |
| --- | --- | --- | --- |
| 0 | Đang thiết lập/vô hiệu | Có; nội dung thiếu trường bắt buộc hiện là chưa hoàn chỉnh để sửa tiếp | Không |
| 1 | Hoàn chỉnh, có hiệu lực | Có | Có, theo ưu tiên |
| 2 | Đã xóa | Không; form cũ không được phục hồi | Không |

Khách hàng yêu cầu ưu tiên một cột trạng thái; các mã 0/1/2 và kiểu TINYINT là lựa chọn kỹ thuật của team, không phải quy định DB của project hoặc mã đã được khách hàng chỉ định. Giá trị 0 làm mặc định để bản lưu dở không tự tham gia xét. Khi triển khai dùng hằng có tên và so sánh tường minh, không kiểm truthy hoặc khác 0 vì trạng thái 2 cũng khác 0. Trạng thái chưa hoàn chỉnh/vô hiệu cùng nhóm 0 theo cách nhóm trong phản hồi; mức đầy đủ của dữ liệu quyết định nhãn lưu dở, không bổ sung nút vô hiệu hóa mới.

## Căn cứ kiểm tương thích

Kiểm tĩnh tại application baseline `7652109b4542ecc9fb392bde6f2afb755a244316`: tìm tên `red_score_settings` trong `application` không có kết quả; `blend:application/models/common/Base_m.php` chỉ xử lý chuyển kết nối đọc/ghi, không tự buộc cột active hoặc tự lọc/xóa theo active. Đây là bằng chứng có giới hạn tại các nguồn đã đọc, không chứng minh toàn bộ module hoặc DB đã triển khai không có ràng buộc khác.

Trong phạm vi này chưa có lý do phải giữ active cho bảng rule mới, nên chọn hướng ưu tiên của khách hàng. Chỉ khi tích hợp phát hiện ràng buộc chung cụ thể mới ghi rõ đường phụ thuộc và đề xuất active + deleted_flg. Không tự duy trì hai phương án trong DDL hoặc thêm ngày xóa khi chưa có nhu cầu.

Rules DB tại `rules/development/database-rules.md` yêu cầu kiểu dữ liệu nhất quán, comments và quy ước index; không bắt status phải dùng 0/1/2. Ví dụ status dạng chuỗi trong rules không phải lệnh bắt mọi trạng thái dùng chuỗi. Không thay enum nghiệp vụ đã tồn tại ở bảng khác.

## Tác động

- DB/DDL: đổi cột và index sang setting_status; domain chỉ 0/1/2. Danh sách đọc IN (0,1), bộ xét chỉ =1.
- Lưu dở giữ 0 và các giá trị chưa nhập; chuyển 1 chỉ sau validation. Xóa chuyển 2 cùng transaction tăng phiên bản rule. Không dùng lại ID/khôi phục rule từ form cũ hoặc copy.
- Kết quả cá nhân đã hoàn tất vẫn giữ theo vòng đời sau sửa/xóa rule. Xóa điểm khác: ngừng dấu/lọc ngay khi lưu xóa thành công.
- AC và UI mô tả hành vi, không cần đưa mã trạng thái hoặc tên cột lên canvas.
- Q35–Q38 nay có xác nhận trực tiếp. AND chỉ trong một rule; giữa nhiều rule vẫn chọn khớp đầu tiên. Không thay những xác nhận này bằng lời chờ trả lời cũ.

## Lessons và việc còn lại

Ưu tiên biểu diễn đủ vòng đời bằng một trạng thái trước khi thêm cột. Không nhầm “kiểu số nhỏ” với boolean hoặc coi lựa chọn mã lưu là quy định của project. Khi có phản hồi mới phải cập nhật cả nguồn chuẩn, truy vấn/index, task và hướng dẫn UI; giữ lịch sử thiết kế bị thay thế ở decision thay vì phát tán vào bộ gửi review.

Chưa triển khai hoặc chạy DDL. Figma chưa được kiểm lại, xem [checklist](../docs/v2/figma-update-checklist.vi.md); xác nhận yêu cầu không phải xác nhận đã sửa xong.
