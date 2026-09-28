# Ví dụ tổ chức task Redmine — 225454

**Mục đích: minh họa cách tổ chức tài liệu và quan hệ task Redmine.** Ticket này không được đưa vào đây để xác định công việc đang thực hiện; ví dụ và các task liên quan không đại diện cho toàn bộ công việc của dự án. AI không tự chọn ticket này làm đầu vào triển khai khi chưa có yêu cầu cụ thể.

| Định danh | Nguồn |
| --- | --- |
| Feature ID | Redmine Backlogitem [225454](https://mw-dev.cloud.redmine.jp/issues/225454) |
| Epic cha | [222142](https://mw-dev.cloud.redmine.jp/issues/222142) — Cải thiện chức năng hướng nghiệp năm 2026 |
| Codebase | Repository `blend`; [PR được ticket tham chiếu](https://github.com/ednity/school-web/pull/57237) |
| Ngày đối chiếu | 28/09/2026, chỉ đọc Redmine và Sheet |
| Nội dung minh họa | Định danh, nguồn và quan hệ task; không phải hồ sơ triển khai đang được giao |

Phạm vi theo ticket: trường thiết lập có cho học sinh đăng ký thông tin dự thi và việc làm hay không, kết hợp với điều kiện khối lớp được sử dụng hiện có. Phần mô tả ngắn này giúp nhận diện feature, không thay thế đặc tả tại ticket.

## Nguồn task

Dùng Backlogitem ở trên để xem ví dụ quan hệ task; khi áp dụng cho công việc thật, tra đúng ticket được giao và giữ parent trực tiếp kể cả khi SubTask nằm dưới một SubTask khác. [Bằng chứng đối chiếu cây ticket](../../rules/evidence/2026-09-28-redmine-hierarchy.md) lưu quan hệ đã đọc theo ngày, không phải bảng tiến độ hiện hành hay danh sách đầy đủ của dự án.

Chỉ tạo `tasks/<Task-ID>-<slug>/` khi có tài liệu riêng; không tạo thư mục cho tất cả ticket hoặc sao chép danh sách task vào README.

## Quy ước task chưa có Redmine

Tra đúng `Task ID` và `Parent Item ID` tại [Internal Tasks](https://docs.google.com/spreadsheets/d/1lK9kXTC5pjuucCCpZThCImZFDBBbQdn9At6Nl8y0LGc/edit?gid=277536463#gid=277536463). Task thuộc feature này phải có parent tương ứng; khi lưu tài liệu riêng, dùng `tasks/<Task-ID>-<slug>/` và ghi nguồn Sheet trong tài liệu task.

Không sao chép danh sách task Sheet vào README. Link tới Backlogitem không chứng minh task Sheet tương ứng một SubTask Redmine; chỉ ghi mapping khi đã xác minh, không ghép theo tên công việc.

## Cách sử dụng

Tham khảo cách ghi ID, nguồn và parent trong ví dụ này, rồi áp dụng cho đúng feature/task được giao. Đọc [rules chung](../../rules/) và [rules phát triển](../../rules/development/) trước khi chuyển sang code `blend`. Chỉ tạo `CONTEXT.md`, `sources/`, `docs/` hoặc `tasks/` khi có nội dung thật. Cây Backlogitem đã đối chiếu trong Epic mẫu được ghi tại [ví dụ cấu trúc Redmine](../../rules/evidence/2026-09-28-redmine-hierarchy.md).
