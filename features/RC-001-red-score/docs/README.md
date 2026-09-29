# RC-001 — Các phiên bản tài liệu

Ngày tách phiên bản: **28/09/2026**, theo xác nhận của người phụ trách về bộ tài liệu hiện tại đã gửi khách hàng.

| Phiên bản | Vai trò | Trạng thái |
| --- | --- | --- |
| [v1](v1/) | Mốc tài liệu đã gửi khách hàng review | Giữ nguyên nội dung để đối chiếu; không sửa tiếp |
| [v2](v2/) | Bản làm việc cho lần bổ sung sau feedback DB-R1–DB-R3 | **Draft — đã bổ sung và kiểm tra nhất quán tài liệu về lưu hiển thị, đồng thời và nhóm tham chiếu; sẵn sàng review thiết kế** |

Các thay đổi tiếp theo thực hiện trong **v2**. Việc tạo thư mục không đồng nghĩa các thiếu sót đã được xử lý hoặc thiết kế đã được phê duyệt.

**Ngôn ngữ của bộ cập nhật:** Nhật và Việt, theo yêu cầu người phụ trách ngày 28/09. Lượt thực hiện này ưu tiên nội dung theo yêu cầu tiếp theo: cập nhật các bản Nhật/Việt đã có, hoãn tạo/chuyển đổi bản ngôn ngữ mới. V2 hiện có 9 file (chưa tính thư mục `test-spec/`), không có bản English; bản English lưu ở v1 để đối chiếu mốc cũ. V1 không đổi. Đặc tả Nhật chưa được tạo trong lượt này.

## Danh mục

| Nhóm tài liệu | v1 — bản lưu | v2 — bản cập nhật tiếp theo |
| --- | --- | --- |
| Đặc tả | [Việt](v1/specification.vi.md) | [Việt](v2/specification.vi.md) |
| Thiết kế DB | [Nhật](v1/database-design.ja.md) · [Việt](v1/database-design.vi.md) | [Nhật](v2/database-design.ja.md) · [Việt](v2/database-design.vi.md) |
| DDL thiết kế | [SQL chú thích Nhật](v1/database-design.ja.sql) · [SQL chú thích Việt](v1/database-design.sql) | [SQL chú thích Nhật](v2/database-design.ja.sql) · [SQL chú thích Việt](v2/database-design.sql) |
| Chia việc | [Nhật](v1/split-tasks.ja.md) · [English](v1/split-tasks.en.md) · [Việt](v1/split-tasks.vi.md) | [Nhật](v2/split-tasks.ja.md) · [Việt](v2/split-tasks.vi.md) |
| Tiêu chí nghiệm thu | [Nhật](v1/acceptance-criteria.ja.md) · [English](v1/acceptance-criteria.en.md) · [Việt](v1/acceptance-criteria.vi.md) | [Nhật](v2/acceptance-criteria.ja.md) · [Việt](v2/acceptance-criteria.vi.md) |
| Đặc tả kiểm thử | — | [Việt](v2/test-spec/00-overview.vi.md) (thư mục `v2/test-spec/`) |

**Đặc tả kiểm thử v2** (`v2/test-spec/`, chỉ bản Việt): 208 test case theo đặc tả v2 và tiêu chí nghiệm thu v2, kèm kịch bản, dữ liệu test, hướng dẫn bằng chứng, ma trận truy vết và độ phủ. 11, 12 và `test-case-report.xlsx` (bố cục báo cáo test) được sinh bằng công cụ nội bộ từ 02–08; CSV và Excel dạng bảng không lưu trong repo. Chưa có test nào được chạy. Bắt đầu từ [00-overview.vi.md](v2/test-spec/00-overview.vi.md).

Bản English lịch sử, không cập nhật cùng bộ v2: [chia việc](v1/split-tasks.en.md) và [tiêu chí nghiệm thu](v1/acceptance-criteria.en.md).

## Nội dung bổ sung trong v2

- DB-R1: mở rộng bảng mục công khai để lưu hiệu ứng theo cấu hình/năm/mục/thường-đơn vị, cùng lưu/đọc lại/copy và consumer.
- DB-R2: thế hệ ô, phiên bản đặt chỗ/hoàn tất và phiên bản rule; thứ tự khóa, điều kiện từ chối ghi cũ, xóa/tạo lại và ranh giới transaction.
- DB-R3: ánh xạ sáu loại lưu theo Q32/Q33; ba nhóm cấu hình độc lập với công tắc khối/HR/lớp học, luồng cấu hình tổng hợp → đối tượng tổng hợp theo màn công khai; phân giải lớp/nhóm môn, validation và copy.

Đây là bản thiết kế để review, chưa chạy SQL, triển khai hoặc nghiệm thu runtime. Mockup MW đã được người phụ trách cập nhật; việc đối chiếu canvas và báo phần cần sửa thêm vẫn là bước riêng.

[CONTEXT](../CONTEXT.md) và [Q&A đã xác nhận](../sources/confirmed-business-qa.vi.md) tiếp tục là nguồn yêu cầu hiện hành, không sao chép vào từng phiên bản. Plan thực thi nội bộ không nằm trong repository này.

Tại thời điểm tách, mỗi phiên bản có 11 file và toàn bộ nội dung được kiểm bằng SHA-256 là giống bản gốc. Ngày/trạng thái ghi bên trong v1 và bản sao v2 được giữ nguyên; trạng thái bộ v2 hiện tại theo bảng trên. Các lần cập nhật nội dung v2 sẽ đồng bộ lại thông tin trong từng file và chỉ mục này.
