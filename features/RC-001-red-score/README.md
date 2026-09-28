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

1. [Context](context/): đọc `CONTEXT.md`, sau đó `01-business-qa-confirmed.vi.md`. Đây là đầu vào chuẩn về nghiệp vụ và trạng thái xác nhận.
2. [Tài liệu](docs/): đọc đặc tả, tiêu chí nghiệm thu, thiết kế DB và phương án chia việc theo mục tiêu công việc. Giữ các bản Việt/Nhật/Anh hiện có.

## Quy ước task

Task chưa có Redmine dùng đúng cột `Task ID` trong `Internal Tasks`, đối chiếu `Parent Item ID` với feature này. Khi cần tài liệu riêng, tạo `tasks/<Task-ID>-<slug>/` và ghi nguồn/link trong tài liệu task theo [quy ước chung](../../rules/README.md). README không sao chép danh sách task từ Sheet.

Số Task 1–8 trong `split-tasks.*.md` chỉ là số mục chia việc, không phải Task ID nguồn; không tự ghép một-một. Tài liệu dùng chung tiếp tục nằm ở `docs/`, không sao chép vào từng task.

## Di chuyển tài liệu

Ngày 28/09/2026, 13 tài liệu từ `context/red-score/` và `docs/red-score/` của repo này được gom vào feature có ID nguồn. Phần restructure chỉ sửa liên kết context → spec cho đúng vị trí mới; các cập nhật nội dung thực hiện song song được giữ lại. Các đường cũ là lịch sử migration, không phải nơi tiếp tục viết tài liệu.
