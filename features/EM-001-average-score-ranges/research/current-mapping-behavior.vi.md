# Hiện trạng ánh xạ trong AutoRating

Ngày tổng hợp: 14/10/2026. Nguồn: điều tra mã nguồn đã thực hiện trong phiên làm việc, repository `blend`, revision `fa9d210d5ed0d4f5f8b9562071aaddeb3599688f`. Đây là bằng chứng đọc source, chưa chạy ghi điểm trên trường cụ thể; không chứng minh chức năng hai bước mới đã triển khai.

| Nội dung | Bằng chứng `blend:` |
| --- | --- |
| Mục số có min/max; mục lựa chọn có tên/giá trị riêng | `application/controllers/grade_report_setting/manage/GradeSettingSystemManageController.php:1029–1045` |
| Lựa chọn đầu ra lấy từ mục đích; phương thức của mục lựa chọn là mapping hoặc cố định | `application/controllers/grade_report_setting/auto_rating/AutoRatingConfController.php:1158–1176` |
| Mapping có ô số/dropdown cho giá trị ghi, thêm/xóa điều kiện độc lập số mức | `application/views/grade_report_setting/auto_rating/edit_formula.php:551–574,938–957` |
| Lấy giá trị của điều kiện khớp đầu tiên, không khớp trả null | `application/domain/tmp/AutoRating.php:2797–2888` |
| Giới hạn kết quả số theo min/max có hiệu lực trước tạo dữ liệu ghi | `application/domain/tmp/AutoRating.php:2428–2474` |
| Cột rating_late_age_text đổi giá trị lựa chọn sang tên trước ghi | `application/domain/tmp/AutoRating.php:2509–2517` |

Mục đích số min=1/max=5 có thể dùng mapping chỉ trả 1, 3, 5. Nếu max có hiệu lực bị cấu hình khác đổi thành 4 thì kết quả số 5 có thể bị giới hạn thành 4; tên mục không đủ xác định giá trị cuối cùng.

## Khác biệt so với tài liệu local cũ

Tài liệu local dùng `total_score / examinees` và nhãn số người dự thi trong log. [RA-001 hiện hành](../../RA-001-ranking-average/CONTEXT.md) và [đặc tả mục nguồn](../../RA-001-ranking-average/docs/specification.vi.md) đã cập nhật mẫu số là số học sinh có điểm của cùng bản nguồn, không dùng `examinees`. Bộ context này theo nguồn chung mới; không gắn thay đổi đó vào xác nhận riêng của khách trong thread này.

Không chuyển báo cáo baseline ngày 12/10 thành hướng triển khai: báo cáo đó chứa đề xuất cũ chỉ đầu ra số, cột mức cố định, tự gán mức thấp nhất và ước lượng đã hết hiệu lực. Trạng thái tích hợp PR, bộ đọc nguồn và hành vi runtime vẫn cần xác minh khi lập kế hoạch triển khai.
