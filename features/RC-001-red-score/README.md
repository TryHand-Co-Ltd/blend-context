# RC-001 — Điểm đỏ（赤点）

| Định danh | Nguồn |
| --- | --- |
| Feature ID | `RC-001`, nguồn Sheet |
| Nguồn quản lý | [BLEND — Project Management](https://docs.google.com/spreadsheets/d/1lK9kXTC5pjuucCCpZThCImZFDBBbQdn9At6Nl8y0LGc/edit?gid=277536463#gid=277536463); tra Work Item tại Client Deliverables và Task ID tại Internal Tasks |
| Codebase | Repository `blend` |
| Ngày đối chiếu ID | 28/09/2026 |
| Redmine | Chưa có ID được xác minh cho feature này; ô Redmine / Client Link của Work Item đang trống khi đọc |

Phạm vi: cấu hình điều kiện điểm đỏ và dùng chung kết quả tại Trích xuất thành tích（成績抽出）, Công khai thành tích（成績公開） và Công cụ phiếu điểm（通知表ツール）. Việc gắn ID không thay đổi yêu cầu, tình trạng approval hoặc phạm vi triển khai trong tài liệu hiện có.

## Thứ tự đọc

1. Đọc [CONTEXT.md](CONTEXT.md) để lấy yêu cầu hiện hành và trạng thái xác nhận.
2. Khi cần đối chiếu theo câu hỏi, đọc [Q&A nghiệp vụ đã xác nhận](sources/confirmed-business-qa.vi.md). Đây là nguồn hỗ trợ, không tạo source of truth cạnh tranh với context.
3. [Chỉ mục phiên bản tài liệu](docs/README.md): `docs/v1/` giữ nguyên bộ đã gửi khách hàng; `docs/v2/` là bản làm việc cho các sửa đổi tiếp theo. Khi tách phiên bản, v2 mới là bản sao nguyên nội dung v1, chưa hoàn thiện feedback. Giữ các bản Việt/Nhật/Anh hiện có và đối chiếu context/Q&A mới nhất.

## Quy ước task

Task chưa có Redmine dùng đúng cột `Task ID` trong `Internal Tasks`, đối chiếu `Parent Item ID` với feature này. Khi cần tài liệu riêng, tạo `tasks/<Task-ID>-<slug>/` và ghi nguồn/link trong tài liệu task theo [quy ước chung](../../rules/README.md). README không sao chép danh sách task từ Sheet.

Số Task 1–8 trong `split-tasks.*.md` chỉ là số mục chia việc, không phải Task ID nguồn; không tự ghép một-một. Tài liệu dùng chung tiếp tục nằm ở `docs/`, không sao chép vào từng task.

## Di chuyển tài liệu

Ngày 28/09/2026, 13 tài liệu từ `context/red-score/` và `docs/red-score/` của repo này được gom vào feature có ID nguồn. Context chuẩn hiện nằm trực tiếp tại `CONTEXT.md`; Q&A confirmed nằm trong `sources/`. Các đường cũ là lịch sử migration, không phải nơi tiếp tục viết tài liệu.

Sau đó, cùng ngày, theo xác nhận của người phụ trách, 11 file trong `docs/` được chuyển nguyên nội dung vào `docs/v1/` và sao chép sang `docs/v2/`. Các chỉnh sửa thiết kế tiếp theo chỉ thực hiện trên v2; context và nguồn xác nhận giữ nguyên vị trí.
