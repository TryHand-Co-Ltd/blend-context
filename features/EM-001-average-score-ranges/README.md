# EM-001 — Ánh xạ đánh giá theo khoảng điểm trung bình

Configure an Evaluation Mapping Table Based on Average Score Ranges

| Định danh | Nguồn |
| --- | --- |
| Feature ID | `EM-001`, được người phụ trách xác nhận ngày 14/10/2026; chưa đối chiếu Work Item trên Sheet hoặc Redmine |
| Nguồn yêu cầu | [Chuỗi Slack](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1791290107759389) |
| Xác nhận | [Q1–Q4](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1791883926294639) |
| Codebase | Repository `blend` |
| Ngày tổng hợp | 14/10/2026 |

**Trạng thái:** yêu cầu cốt lõi đã được làm rõ; thiết kế còn là đề xuất, chưa sẵn sàng coi toàn bộ bộ tài liệu là đặc tả triển khai đã duyệt. Chưa có kết quả thử phân bố trên staging.

## Thứ tự đọc

1. [CONTEXT.md](CONTEXT.md): đọc cả cách sử dụng nguồn, yêu cầu hiện hành, phụ thuộc và các cách hiểu phải tránh. Đây là đầu vào chính cho AI.
2. [Q&A và nguồn xác nhận](sources/confirmed-business-qa.vi.md): phân biệt xác nhận của khách với phản hồi của nhóm.
3. [Tài liệu](docs/README.md): quy tắc chức năng và đề xuất màn hình, gồm ví dụ mục số 1–5 chỉ dùng 1, 3, 5.
4. [Hiện trạng ánh xạ](research/current-mapping-behavior.vi.md): bằng chứng mã nguồn, không phải phê duyệt thiết kế.

## Nguồn gốc và cập nhật

Bộ này được tổng hợp theo yêu cầu người phụ trách từ toàn bộ chuỗi Slack đã đọc ngày 14/10 và bộ tài liệu local Average-Score-Ranges. Từ lần tổ chức này, cập nhật nội dung dùng chung tại đây; bản local cũ giữ làm lịch sử. Không đưa phương án cũ hoặc ước lượng cũ thành yêu cầu hiện hành.

Chưa tạo tasks, plans, decisions hoặc thiết kế DB vì chưa có đầu vào tương ứng được xác minh. Mã EM-001 do người phụ trách cung cấp; không suy mã từ RA-001/RC-001. Khi có liên kết Work Item/Redmine, bổ sung nguồn quản lý mà không thay đổi nội dung nghiệp vụ.

## Ngôn ngữ

Context và research hiện bằng tiếng Việt. Có bản Nhật tương ứng cho [Q&A](sources/confirmed-business-qa.ja.md), [đặc tả dự thảo](docs/specification.ja.md) và [nội dung màn hình](docs/screen-definition.ja.md). Cập nhật hai bản cùng nhau; bản dịch không tạo thêm yêu cầu hoặc phê duyệt.
