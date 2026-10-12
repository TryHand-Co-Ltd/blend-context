# DEC-003 — Sau khi lưu điều kiện: nếu chưa có ngưỡng thì sang màn ngưỡng

Ngày: **2026-10-07**. Feature: RC-001. Căn cứ: xác nhận nội bộ — «nếu chỉ mới submit ở filter (còn màn ngưỡng chưa submit) thì logic mới sẽ chuyển sang màn nhập ngưỡng».

| Mục | Nội dung |
| --- | --- |
| Quyết định | Khi lưu Điều kiện áp dụng（適用条件）: nếu ngưỡng chưa nhập（chưa hoàn chỉnh / đang thêm mới） thì chuyển sang Ngưỡng（基準設定）; nếu quy tắc đã hoàn chỉnh và sửa từ danh sách thì quay về danh sách |
| Thay thế | Câu cũ ở [định nghĩa màn v2 §03 mục 15](../docs/v2/screen-definition.vi.md): «Lưu đúng điều kiện; quay lại danh sách» |
| Ảnh hưởng | Cập nhật kỳ vọng TC-RS-FUNC-004; khớp code `RedScoreSettingController::conditionStore` |
| Trạng thái | Đã xác nhận trong chat; chưa coi là phê duyệt khách hàng trên toàn bộ tài liệu gửi ngoài |

## Lý do

Luồng thêm quy tắc là hai bước điều kiện → ngưỡng. Nếu lưu điều kiện xong quay danh sách ngay thì dễ đứt bước nhập ngưỡng cho dòng chưa hoàn chỉnh.
