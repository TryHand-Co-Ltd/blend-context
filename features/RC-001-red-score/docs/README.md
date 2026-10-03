# RC-001 — Các phiên bản tài liệu

Ngày tách phiên bản: **28/09/2026**, theo xác nhận của người phụ trách về bộ tài liệu hiện tại đã gửi khách hàng.

| Phiên bản | Vai trò | Trạng thái |
| --- | --- | --- |
| [v1](v1/) | Mốc tài liệu đã gửi khách hàng review | Giữ nguyên nội dung để đối chiếu; không sửa tiếp |
| [v2](v2/) | Bản làm việc cho lần bổ sung sau feedback DB-R1–DB-R3 | **Thiết kế đã cập nhật xác nhận 30/09: setting_status; AND trong từng rule và ưu tiên giữa các rule. Figma còn cần kiểm/sửa theo checklist** |

Các thay đổi tiếp theo thực hiện trong **v2**. Việc tạo thư mục không đồng nghĩa các thiếu sót đã được xử lý hoặc thiết kế đã được phê duyệt.

**Bộ gửi review:** các file Database Design/DDL, AC, Split Tasks và đặc tả trình bày phương án độc lập; không kèm nguồn phản hồi, context/Q&A, decisions/lessons hoặc checklist thực hiện nội bộ. Những hồ sơ này phục vụ theo dõi nội bộ. Không cần đưa trạng thái chờ phản hồi vào từng tài liệu gửi; trạng thái duyệt vẫn theo context, không suy từ hình thức bản hoàn chỉnh.

**Ngôn ngữ của bộ cập nhật:** Nhật và Việt, theo yêu cầu người phụ trách ngày 28/09. Lượt thực hiện này ưu tiên nội dung theo yêu cầu tiếp theo: cập nhật các bản Nhật/Việt đã có, hoãn tạo/chuyển đổi bản ngôn ngữ mới. V2 có 9 tài liệu/SQL và 2 checklist Figma (chưa tính thư mục `test-spec/`), không có bản English; bản English lưu ở v1 để đối chiếu mốc cũ. V1 không đổi. Đặc tả Nhật chưa được tạo trong lượt này.

## Danh mục

| Nhóm tài liệu | v1 — bản lưu | v2 — bản cập nhật tiếp theo |
| --- | --- | --- |
| Checklist sửa Figma | — | [Nhật](v2/figma-update-checklist.ja.md) · [Việt](v2/figma-update-checklist.vi.md) |
| Đặc tả | [Việt](v1/specification.vi.md) | [Việt](v2/specification.vi.md) |
| Thiết kế DB | [Nhật](v1/database-design.ja.md) · [Việt](v1/database-design.vi.md) | [Nhật](v2/database-design.ja.md) · [Việt](v2/database-design.vi.md) |
| DDL thiết kế | [SQL chú thích Nhật](v1/database-design.ja.sql) · [SQL chú thích Việt](v1/database-design.sql) | [SQL chú thích Nhật](v2/database-design.ja.sql) · [SQL chú thích Việt](v2/database-design.sql) |
| Chia việc | [Nhật](v1/split-tasks.ja.md) · [English](v1/split-tasks.en.md) · [Việt](v1/split-tasks.vi.md) | [Nhật](v2/split-tasks.ja.md) · [Việt](v2/split-tasks.vi.md) |
| Tiêu chí nghiệm thu | [Nhật](v1/acceptance-criteria.ja.md) · [English](v1/acceptance-criteria.en.md) · [Việt](v1/acceptance-criteria.vi.md) | [Nhật](v2/acceptance-criteria.ja.md) · [Việt](v2/acceptance-criteria.vi.md) |
| Đặc tả kiểm thử | — | [Việt](v2/test-spec/scope-and-approach.vi.md) (thư mục `v2/test-spec/`) |

**Đặc tả kiểm thử v2** (`v2/test-spec/`, chỉ bản Việt): 216 test case theo cấu trúc bốn tài liệu [scope-and-approach.vi.md](v2/test-spec/scope-and-approach.vi.md), [test-cases.vi.md](v2/test-spec/test-cases.vi.md), [test-data.vi.md](v2/test-spec/test-data.vi.md) và [test-case-report.xlsx](v2/test-spec/test-case-report.xlsx). Các file chi tiết cũ không còn là nguồn của active suite; generator đọc Markdown v2, dùng workbook làm vỏ style/layout và dựng lại `Data`, `Cases`, `Run Log`, trạng thái hoàn tất theo đủ biến thể bắt buộc và toàn bộ nội dung case ở các sheet A–H. `Run variants` cũng được định nghĩa trong Markdown; không có biến thể nào tự thêm từ script. Checker đối chiếu nội dung nguồn, category statistics, manifest và trạng thái từng variant. Chưa có test nào được chạy.

Bản English lịch sử, không cập nhật cùng bộ v2: [chia việc](v1/split-tasks.en.md) và [tiêu chí nghiệm thu](v1/acceptance-criteria.en.md).

## Nội dung bổ sung trong v2

- DB-R1: mở rộng bảng mục công khai để lưu hiệu ứng theo cấu hình/năm/mục/thường-đơn vị, cùng lưu/đọc lại/copy và consumer.
- DB-R2: thế hệ ô, phiên bản đặt chỗ/hoàn tất và phiên bản rule; thứ tự khóa, điều kiện từ chối ghi cũ, xóa/tạo lại và ranh giới transaction.
- DB-R3: ánh xạ sáu loại lưu theo Q32/Q33; ba nhóm cấu hình độc lập với công tắc khối/HR/lớp học, luồng cấu hình tổng hợp → đối tượng tổng hợp theo màn công khai; phân giải lớp/nhóm môn, validation và copy.

Đây là bản thiết kế để review, chưa chạy SQL, triển khai hoặc nghiệm thu runtime. Mockup MW đã được người phụ trách cập nhật; việc đối chiếu canvas và báo phần cần sửa thêm vẫn là bước riêng.

[CONTEXT](../CONTEXT.md) và [Q&A đã xác nhận](../sources/confirmed-business-qa.vi.md) tiếp tục là nguồn yêu cầu hiện hành, không sao chép vào từng phiên bản. Plan thực thi nội bộ không nằm trong repository này.

Tại thời điểm tách, mỗi phiên bản có 11 file và toàn bộ nội dung được kiểm bằng SHA-256 là giống bản gốc. Ngày/trạng thái ghi bên trong v1 và bản sao v2 được giữ nguyên; trạng thái bộ v2 hiện tại theo bảng trên. Các lần cập nhật nội dung v2 sẽ đồng bộ lại thông tin trong từng file và chỉ mục này.

## Lịch sử bổ sung theo năm phản hồi ngày 29/09

Phương án và trạng thái dưới đây thuộc mốc 29/09, đã được cập nhật bởi xác nhận 30/09 ở mục tiếp theo.

Rule lưu dở/xóa được tách bằng deleted_at; làm rõ điểm xóa có hiệu lực ngay sau lưu thành công; đồng bộ ví dụ làm tròn 19.2 và yêu cầu bộ chọn thường/đơn vị nhìn thấy độc lập. AND giữa điều kiện trung bình là đề xuất chờ xác nhận, không phải tất cả Q&A đã đóng. Xem [nguồn](../sources/2026-09-29-design-review-feedback.vi.md) và [decision/lessons](../decisions/DEC-001-review-state-and-ui-consistency.vi.md). Checklist Figma là việc cần làm, chưa phải bằng chứng đã sửa.

## Cập nhật ngày 30/09

Dùng một cột setting_status thay active + deleted_at; 0 đang thiết lập/vô hiệu, 1 có hiệu lực, 2 đã xóa. Khách hàng đã xác nhận AND trong từng rule, chọn rule khớp đầu tiên theo ưu tiên, thời điểm xóa điểm, ngưỡng ví dụ 19.2 và lựa chọn thường/đơn vị độc lập. [Nguồn](../sources/2026-09-30-design-review-confirmation.vi.md) và [DEC-002](../decisions/DEC-002-setting-status.vi.md) là hồ sơ nội bộ. Checklist Figma đã bổ sung giới hạn AND trong một rule và kiểm ưu tiên ở 01-B/02-A/02-B; chưa có bằng chứng canvas hoàn tất.
