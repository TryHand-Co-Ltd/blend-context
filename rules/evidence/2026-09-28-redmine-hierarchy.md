# Cấu trúc Redmine đã đối chiếu

**Ngày đọc: 28/09/2026. Chỉ đọc, không thay đổi Redmine.** Bắt đầu từ [#225454](https://mw-dev.cloud.redmine.jp/issues/225454), đối chiếu Epic [#222142](https://mw-dev.cloud.redmine.jp/issues/222142) — Cải thiện chức năng hướng nghiệp năm 2026（進路機能の改善対応2026） và các Backlogitem bên dưới. Tên vai trò trong bảng là diễn giải tiếng Việt; link dẫn tới tiêu đề gốc.

Đây là ví dụ kiểm chứng cho quy ước tổ chức, không phải đặc tả được sao chép hay bảng tiến độ đồng bộ tự động. Ticket `225454` được chọn để minh họa, không để xác định task đang thực hiện. Cây dưới đây chỉ thuộc Epic mẫu, không phải toàn bộ các task Redmine của dự án. Đã đọc quan hệ cha–con hiển thị của **7 Backlogitem và 34 SubTask**, gồm cả các nhánh phát triển/QA lồng nhau. Không kiểm nội dung triển khai hoặc kết quả test của từng SubTask.

## Backlogitem dưới Epic 222142

| Backlogitem | Phạm vi | Tổng SubTask gồm các tầng con |
| --- | --- | ---: |
| [#222144](https://mw-dev.cloud.redmine.jp/issues/222144) | No1 — Cố định header và thống nhất ảnh học sinh trong danh sách hướng nghiệp | 5 |
| [#222146](https://mw-dev.cloud.redmine.jp/issues/222146) | No2 — Cải thiện danh sách khảo sát nguyện vọng hướng nghiệp | 5 |
| [#222159](https://mw-dev.cloud.redmine.jp/issues/222159) | No3 — Lập danh sách màn hình và sơ đồ chuyển màn | 0 |
| [#224360](https://mw-dev.cloud.redmine.jp/issues/224360) | No4 — Điều khiển hiển thị màn hình hướng nghiệp phía học sinh bằng cấu hình | 6 |
| [#225145](https://mw-dev.cloud.redmine.jp/issues/225145) | No5 — Cho giáo viên đăng ký/sửa khảo sát nguyện vọng hướng nghiệp | 7 |
| [#225454](https://mw-dev.cloud.redmine.jp/issues/225454) | No6 — Cấu hình quyền học sinh đăng ký thông tin thi và việc làm | 6 |
| [#226377](https://mw-dev.cloud.redmine.jp/issues/226377) | No7 — Cải thiện loại trường trong danh mục trường học tiếp | 5 |

## SubTask và parent trực tiếp

| Backlogitem gốc | SubTask | Parent trực tiếp | Vai trò |
| --- | --- | --- | --- |
| [#222144](https://mw-dev.cloud.redmine.jp/issues/222144) | [#222247](https://mw-dev.cloud.redmine.jp/issues/222247) | [#222144](https://mw-dev.cloud.redmine.jp/issues/222144) | Phân tích/SE |
| [#222144](https://mw-dev.cloud.redmine.jp/issues/222144) | [#222248](https://mw-dev.cloud.redmine.jp/issues/222248) | [#222144](https://mw-dev.cloud.redmine.jp/issues/222144) | Triển khai |
| [#222144](https://mw-dev.cloud.redmine.jp/issues/222144) | [#222249](https://mw-dev.cloud.redmine.jp/issues/222249) | [#222144](https://mw-dev.cloud.redmine.jp/issues/222144) | Kiểm thử đơn vị |
| [#222144](https://mw-dev.cloud.redmine.jp/issues/222144) | [#222250](https://mw-dev.cloud.redmine.jp/issues/222250) | [#222144](https://mw-dev.cloud.redmine.jp/issues/222144) | QA |
| [#222144](https://mw-dev.cloud.redmine.jp/issues/222144) | [#224179](https://mw-dev.cloud.redmine.jp/issues/224179) | [#222250](https://mw-dev.cloud.redmine.jp/issues/222250) | QA con |
| [#222146](https://mw-dev.cloud.redmine.jp/issues/222146) | [#222404](https://mw-dev.cloud.redmine.jp/issues/222404) | [#222146](https://mw-dev.cloud.redmine.jp/issues/222146) | Phân tích/SE |
| [#222146](https://mw-dev.cloud.redmine.jp/issues/222146) | [#222405](https://mw-dev.cloud.redmine.jp/issues/222405) | [#222146](https://mw-dev.cloud.redmine.jp/issues/222146) | Triển khai |
| [#222146](https://mw-dev.cloud.redmine.jp/issues/222146) | [#222406](https://mw-dev.cloud.redmine.jp/issues/222406) | [#222146](https://mw-dev.cloud.redmine.jp/issues/222146) | Kiểm thử đơn vị |
| [#222146](https://mw-dev.cloud.redmine.jp/issues/222146) | [#222407](https://mw-dev.cloud.redmine.jp/issues/222407) | [#222146](https://mw-dev.cloud.redmine.jp/issues/222146) | QA |
| [#222146](https://mw-dev.cloud.redmine.jp/issues/222146) | [#224871](https://mw-dev.cloud.redmine.jp/issues/224871) | [#222407](https://mw-dev.cloud.redmine.jp/issues/222407) | QA con |
| [#224360](https://mw-dev.cloud.redmine.jp/issues/224360) | [#225214](https://mw-dev.cloud.redmine.jp/issues/225214) | [#224360](https://mw-dev.cloud.redmine.jp/issues/224360) | QA |
| [#224360](https://mw-dev.cloud.redmine.jp/issues/224360) | [#225217](https://mw-dev.cloud.redmine.jp/issues/225217) | [#224360](https://mw-dev.cloud.redmine.jp/issues/224360) | Nhóm phát triển |
| [#224360](https://mw-dev.cloud.redmine.jp/issues/224360) | [#225215](https://mw-dev.cloud.redmine.jp/issues/225215) | [#225217](https://mw-dev.cloud.redmine.jp/issues/225217) | Triển khai |
| [#224360](https://mw-dev.cloud.redmine.jp/issues/224360) | [#225216](https://mw-dev.cloud.redmine.jp/issues/225216) | [#225217](https://mw-dev.cloud.redmine.jp/issues/225217) | Kiểm thử đơn vị |
| [#224360](https://mw-dev.cloud.redmine.jp/issues/224360) | [#226104](https://mw-dev.cloud.redmine.jp/issues/226104) | [#225217](https://mw-dev.cloud.redmine.jp/issues/225217) | Kiểm thử đơn vị bổ sung — pa_menu_use_neo_career |
| [#224360](https://mw-dev.cloud.redmine.jp/issues/224360) | [#226283](https://mw-dev.cloud.redmine.jp/issues/226283) | [#224360](https://mw-dev.cloud.redmine.jp/issues/224360) | Vấn đề cần xử lý |
| [#225145](https://mw-dev.cloud.redmine.jp/issues/225145) | [#225262](https://mw-dev.cloud.redmine.jp/issues/225262) | [#225145](https://mw-dev.cloud.redmine.jp/issues/225145) | Điều tra và hiểu đặc tả |
| [#225145](https://mw-dev.cloud.redmine.jp/issues/225145) | [#225263](https://mw-dev.cloud.redmine.jp/issues/225263) | [#225145](https://mw-dev.cloud.redmine.jp/issues/225145) | QA |
| [#225145](https://mw-dev.cloud.redmine.jp/issues/225145) | [#225396](https://mw-dev.cloud.redmine.jp/issues/225396) | [#225145](https://mw-dev.cloud.redmine.jp/issues/225145) | Nhóm phát triển |
| [#225145](https://mw-dev.cloud.redmine.jp/issues/225145) | [#225338](https://mw-dev.cloud.redmine.jp/issues/225338) | [#225396](https://mw-dev.cloud.redmine.jp/issues/225396) | Kiểm thử đơn vị |
| [#225145](https://mw-dev.cloud.redmine.jp/issues/225145) | [#225342](https://mw-dev.cloud.redmine.jp/issues/225342) | [#225396](https://mw-dev.cloud.redmine.jp/issues/225396) | Triển khai UI/form |
| [#225145](https://mw-dev.cloud.redmine.jp/issues/225145) | [#225343](https://mw-dev.cloud.redmine.jp/issues/225343) | [#225396](https://mw-dev.cloud.redmine.jp/issues/225396) | Triển khai lưu dữ liệu, DB và phân quyền |
| [#225145](https://mw-dev.cloud.redmine.jp/issues/225145) | [#226294](https://mw-dev.cloud.redmine.jp/issues/226294) | [#225145](https://mw-dev.cloud.redmine.jp/issues/225145) | Vấn đề cần xử lý |
| [#225454](https://mw-dev.cloud.redmine.jp/issues/225454) | [#225526](https://mw-dev.cloud.redmine.jp/issues/225526) | [#225454](https://mw-dev.cloud.redmine.jp/issues/225454) | Điều tra và hiểu đặc tả |
| [#225454](https://mw-dev.cloud.redmine.jp/issues/225454) | [#225527](https://mw-dev.cloud.redmine.jp/issues/225527) | [#225454](https://mw-dev.cloud.redmine.jp/issues/225454) | QA |
| [#225454](https://mw-dev.cloud.redmine.jp/issues/225454) | [#226187](https://mw-dev.cloud.redmine.jp/issues/226187) | [#225454](https://mw-dev.cloud.redmine.jp/issues/225454) | Nhóm phát triển |
| [#225454](https://mw-dev.cloud.redmine.jp/issues/225454) | [#226188](https://mw-dev.cloud.redmine.jp/issues/226188) | [#226187](https://mw-dev.cloud.redmine.jp/issues/226187) | Triển khai |
| [#225454](https://mw-dev.cloud.redmine.jp/issues/225454) | [#226189](https://mw-dev.cloud.redmine.jp/issues/226189) | [#226187](https://mw-dev.cloud.redmine.jp/issues/226187) | Kiểm thử đơn vị |
| [#225454](https://mw-dev.cloud.redmine.jp/issues/225454) | [#226311](https://mw-dev.cloud.redmine.jp/issues/226311) | [#225454](https://mw-dev.cloud.redmine.jp/issues/225454) | Vấn đề cần xử lý |
| [#226377](https://mw-dev.cloud.redmine.jp/issues/226377) | [#226597](https://mw-dev.cloud.redmine.jp/issues/226597) | [#226377](https://mw-dev.cloud.redmine.jp/issues/226377) | Điều tra và hiểu đặc tả |
| [#226377](https://mw-dev.cloud.redmine.jp/issues/226377) | [#226599](https://mw-dev.cloud.redmine.jp/issues/226599) | [#226377](https://mw-dev.cloud.redmine.jp/issues/226377) | QA |
| [#226377](https://mw-dev.cloud.redmine.jp/issues/226377) | [#226600](https://mw-dev.cloud.redmine.jp/issues/226600) | [#226377](https://mw-dev.cloud.redmine.jp/issues/226377) | Nhóm phát triển |
| [#226377](https://mw-dev.cloud.redmine.jp/issues/226377) | [#226811](https://mw-dev.cloud.redmine.jp/issues/226811) | [#226600](https://mw-dev.cloud.redmine.jp/issues/226600) | Kiểm thử đơn vị |
| [#226377](https://mw-dev.cloud.redmine.jp/issues/226377) | [#226601](https://mw-dev.cloud.redmine.jp/issues/226601) | [#226377](https://mw-dev.cloud.redmine.jp/issues/226377) | Vấn đề cần xử lý |

Backlogitem [#222159](https://mw-dev.cloud.redmine.jp/issues/222159) không hiển thị SubTask tại thời điểm đọc; không tự tạo hoặc suy luận task để lấp chỗ trống.

## Quy tắc rút ra

- Một Epic bao gồm nhiều hạng mục nghiệp vụ, nên thư mục feature mặc định bám Backlogitem. Ví dụ [#225454](https://mw-dev.cloud.redmine.jp/issues/225454) có tracker **Backlogitem**, không phải Epic và không phải chức năng điểm đỏ.
- [#226187](https://mw-dev.cloud.redmine.jp/issues/226187) có tracker **SubTask** dù tiêu đề mang nghĩa nhóm phát triển; hai task triển khai/kiểm thử nằm dưới nó. Không đổi tracker theo cách hiểu tên.
- QA có thể có QA con: [#224179](https://mw-dev.cloud.redmine.jp/issues/224179) dưới [#222250](https://mw-dev.cloud.redmine.jp/issues/222250), [#224871](https://mw-dev.cloud.redmine.jp/issues/224871) dưới [#222407](https://mw-dev.cloud.redmine.jp/issues/222407). Đọc đủ parent trước khi gom task.
- Lưu parent thật trong bảng metadata, giữ thư mục task phẳng để dễ tìm theo ID. Không ép source vào một cây mẫu hoặc tạo folder rỗng cho mọi ticket được nhìn thấy.
- Wiki là quy tắc quy trình; cây trên là hiện trạng các ticket được đọc. Hiện trạng không tự thay thế quy tắc tạo ticket mới hoặc cho phép sửa cây Redmine.
