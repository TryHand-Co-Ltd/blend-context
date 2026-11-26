# EM-001 — Ánh xạ đánh giá theo khoảng điểm trung bình

Configure an Evaluation Mapping Table Based on Average Score Ranges

| Định danh | Nguồn |
| --- | --- |
| Feature ID | `EM-001`, được người phụ trách xác nhận ngày 14/10/2026; chưa đối chiếu Work Item trên Sheet hoặc Redmine |
| Nguồn yêu cầu | [Chuỗi Slack](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1791290107759389) |
| Xác nhận | [Q1–Q4](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1791883926294639) |
| Codebase | Repository `blend` |
| Ngày tổng hợp | 14/10/2026 |

**Trạng thái:** yêu cầu cốt lõi đã được làm rõ; thiết kế còn là đề xuất, chưa sẵn sàng coi toàn bộ bộ tài liệu là đặc tả triển khai đã duyệt. Đã kiểm tra local ngày 16/10/2026: bảng phân bố và biểu đồ hỗ trợ mục số và A/B/C, số lượng khớp nhau; xem CONTEXT.md mục 10. Chưa có kết quả trên staging hoặc kiểm chứng luồng tự tính EM-001 → trích xuất.

## Thứ tự đọc

1. [CONTEXT.md](CONTEXT.md): đọc cả cách sử dụng nguồn, yêu cầu hiện hành, phụ thuộc và các cách hiểu phải tránh. Đây là đầu vào chính cho AI.
2. [Q&A và nguồn xác nhận](sources/confirmed-business-qa.vi.md): phân biệt xác nhận của khách với phản hồi của nhóm.
3. [Tài liệu](docs/README.md): quy tắc chức năng và đề xuất màn hình, gồm ví dụ mục số 1–5 chỉ dùng 1, 3, 5.
4. [Hiện trạng ánh xạ](research/current-mapping-behavior.vi.md): bằng chứng mã nguồn, không phải phê duyệt thiết kế.
5. [Kế hoạch triển khai](plans/average-range-mapping-implementation-plan.vi.md): đề xuất kỹ thuật dự thảo để review, không phải phê duyệt triển khai.

## Nguồn gốc và cập nhật

Bộ này được tổng hợp theo yêu cầu người phụ trách từ toàn bộ chuỗi Slack đã đọc ngày 14/10 và bộ tài liệu local Average-Score-Ranges. Từ lần tổ chức này, cập nhật nội dung dùng chung tại đây; bản local cũ giữ làm lịch sử. Không đưa phương án cũ hoặc ước lượng cũ thành yêu cầu hiện hành.

Chưa tạo tasks, decisions hoặc thiết kế DB vì chưa có đầu vào tương ứng được xác minh; kế hoạch triển khai ở mục 5 chỉ là đề xuất. Mã EM-001 do người phụ trách cung cấp; không suy mã từ RA-001/RC-001. Khi có liên kết Work Item/Redmine, bổ sung nguồn quản lý mà không thay đổi nội dung nghiệp vụ.

Cập nhật 16/11/2026: thêm [context mục 13](CONTEXT.md) (phản hồi của Shite ngày 03/11 và 13/11: đổi tên 「平均点連動評価」, đổi chữ 「丸め前」, câu hỏi về giới hạn 10 × 20 / 20 × 10 và dung lượng; số đo dung lượng 28/10). Mục 13.1 và 13.2 đã sửa và đã commit (xem 13.10); các mục còn lại chưa triển khai. Cập nhật 19/11/2026: giới hạn đã đổi sang 20 khoảng × 10 điều kiện, xem [context mục 13.8](CONTEXT.md). Cập nhật 23/11/2026: code đã commit và push; ô điều kiện trống giữ nguyên vị trí (Shite chọn phương án C ngày 19/11); kiểm tra dữ liệu dạng cũ; phần chờ #57058; xem [context mục 13.10](CONTEXT.md).

## Ngôn ngữ

Context và research hiện bằng tiếng Việt. Có bản Nhật tương ứng cho [Q&A](sources/confirmed-business-qa.ja.md), [đặc tả dự thảo](docs/specification.ja.md) và [nội dung màn hình](docs/screen-definition.ja.md). Cập nhật hai bản cùng nhau; bản dịch không tạo thêm yêu cầu hoặc phê duyệt.

Cập nhật 26/11/2026: thêm [context mục 14](CONTEXT.md) (gộp nhánh của Kurashima, chặn 単元 × 授業 khi lưu, đổi đích PR #57688 sang `feature/225156_grade_calc_fix`, kiểm lại từ đầu đến cuối) và [kế hoạch mục 17](plans/average-range-mapping-implementation-plan.vi.md).
