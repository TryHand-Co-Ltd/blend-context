# RA-001 — Trung bình tổng hợp thứ hạng（順位集計の平均点）

Implement Ranking Average in Automatic Grade Calculation and Apply It to Conditions, Formulas, and Grade Registration

| Định danh | Nguồn |
| --- | --- |
| Feature ID | `RA-001`. `RC` là Điểm đỏ（赤点）. `RA` là trung bình tổng hợp thứ hạng（順位集計の平均点）. Chưa đối chiếu được Work Item ID trên Sheet |
| Nguồn quản lý | [BLEND — Project Management](https://docs.google.com/spreadsheets/d/1lK9kXTC5pjuucCCpZThCImZFDBBbQdn9At6Nl8y0LGc/edit?gid=277536463#gid=277536463); khi Sheet đọc được, đối chiếu Work Item tại Client Deliverables |
| Codebase | Repository `blend` |
| Thiết kế giao diện | [Figma RA-001](https://www.figma.com/design/OkFTBuOyoF2hNnxCFy4Uds/) |
| Ngày đặt mã | 09/10/2026 |
| Redmine | Chưa có ID được xác minh cho feature này |

Phạm vi: dùng điểm trung bình do tổng hợp thứ hạng（順位集計）tính ra trong tính điểm tự động（自動計算）.

Trạng thái: **đang xác nhận với khách hàng**. Q1–Q7 chưa có câu trả lời, chưa có mục nào được khách chốt. Tiêu chí nghiệm thu, chia việc và đặc tả kiểm thử làm sau khi khách trả lời.

## Thứ tự đọc

1. Đọc [CONTEXT.md](CONTEXT.md) để lấy yêu cầu khách, phạm vi thiết kế đang dùng và các đề xuất đang chờ.
2. Đọc [đặc tả](docs/specification.vi.md) và [đặc tả màn hình](docs/screen-definition.vi.md). Bản Nhật của màn hình là [screen-definition.ja.md](docs/screen-definition.ja.md).
3. Khi cần đúng câu đang hỏi khách, đọc [bản tiếng Việt](sources/2026-10-09-business-questions.vi.md) hoặc [bản tiếng Nhật](sources/2026-10-09-business-questions.ja.md). Hai bản này chưa phải Q&A đã xác nhận.
4. Khi cần căn cứ, đọc [ghi nhận nội bộ 10/10](sources/2026-10-10-internal-design-review.vi.md) và [hiện trạng code](research/current-auto-rating-behavior.vi.md).
