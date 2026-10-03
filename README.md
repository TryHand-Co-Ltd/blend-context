# BLEND Context

**`blend-context` là điểm bắt đầu cho AI và các thành viên làm việc với BLEND.** Repository này quản lý context, định nghĩa, rules, tài liệu và quyết định. Mã nguồn ứng dụng được làm việc trong repository **`blend`**; không sao chép code ứng dụng vào đây.

## Bắt đầu

1. AI đọc `AGENTS.md`; thành viên mới đọc [rules và cách tổ chức](rules/) cùng [quy tắc soạn nội dung](rules/content-authoring.md).
2. Tìm chức năng theo ID ở bảng bên dưới, đọc README của thư mục đó rồi context và tài liệu liên quan.
3. Khi cần nghiên cứu hoặc sửa ứng dụng, chuyển sang repository `blend`, áp dụng [rules phát triển](rules/development/) theo phạm vi công việc.

## Cấu trúc

```text
AGENTS.md                          Hướng dẫn bắt đầu và phân luồng cho AI
rules/                             Định nghĩa, nguồn ID và quy ước tổ chức
  content-authoring.md             Quy tắc soạn nội dung BLEND dùng chung
  development/                     Rules phát triển BLEND và nguồn Wiki
  evidence/                        Bằng chứng đối chiếu theo ngày, không phải rules hiện hành
features/
  <Feature-ID>-<slug>/              Một chức năng, một nơi quản lý
    README.md                      Nguồn ID, ticket liên quan và thứ tự đọc
    CONTEXT.md                     Context chuẩn của feature
    sources/                       Q&A và nguồn xác nhận, tạo khi cần
    research/                      Topic reports <topic>.ja.md/.vi.md; query draft khi được yêu cầu
    plans/                         <scope>-implementation-plan.ja.md/.vi.md dùng chung
    docs/                          Tài liệu dùng chung của chức năng
    tasks/                         Tài liệu riêng từng task, tạo khi cần
    decisions/                     Quyết định riêng, tạo khi cần
.github/                           CONTRIBUTING.md và mẫu PR
```

Tên thư mục dùng `<ID>-<slug>`, không thêm tiền tố nguồn. Ghi nguồn Redmine/Sheet trong README của feature hoặc tài liệu task. Giữ nguyên ID của nguồn, kể cả chữ hoa và số 0; chỉ phần mô tả `slug` dùng tiếng Anh chữ thường, nối bằng dấu `-`. Không tạo thư mục rỗng để đủ bộ. Research được tổ chức theo vấn đề/luồng có kết luận dùng lại được, không mặc định một file cho toàn feature. `research/` và `plans/` ở gốc feature kể cả khi chỉ phục vụ task đã xác minh; ghi scope/Task ID/parent và link từ tài liệu task, không nhân bản. Chỉ tạo report/plan có nội dung được yêu cầu; giữ nguyên Research lịch sử và SQL/DDL hiện có nếu chưa có yêu cầu migration.

`CONTEXT.md` cùng xác nhận mới nhất được phép áp dụng là nguồn yêu cầu. Topic research là bằng chứng theo revision và dependencies; shared implementation plan ghi đầu vào đã duyệt cùng công việc đề xuất, dùng đường dẫn/commands portable. Kế hoạch vận hành/debugging và cấu hình workstation riêng không thuộc tài liệu dùng chung; duyệt đầu vào hoặc plan không tự cho phép thực thi.

## Tài liệu chức năng hiện có

Bảng này chỉ liệt kê tài liệu đã có trong repo, không phải danh sách task đang thực hiện hoặc toàn bộ công việc của dự án.

| Feature ID | Chức năng | Thư mục |
| --- | --- | --- |
| Sheet `RC-001` | Điểm đỏ（赤点） — context, đặc tả, thiết kế DB và chia việc hiện có | [RC-001-red-score](features/RC-001-red-score/) |

### Ví dụ tổ chức task Redmine

[225454-student-career-registration](features/225454-student-career-registration/) chỉ là **ví dụ minh họa** cách đặt tên thư mục và liên kết Epic → Backlogitem → SubTask. Việc đưa ticket này vào repo không có nghĩa đây là task đang được thực hiện, task mặc định cho AI hoặc toàn bộ các task Redmine của dự án.

ID từ Sheet lấy tại [BLEND — Project Management](https://docs.google.com/spreadsheets/d/1lK9kXTC5pjuucCCpZThCImZFDBBbQdn9At6Nl8y0LGc/edit?gid=277536463#gid=277536463). `Feature ID` dùng Work Item ID/Parent Item ID; `Task ID` phải lấy đúng cột Task ID trong tab Internal Tasks. Không dùng số dòng làm ID.

## Cập nhật và review

Repo phục vụ đọc và tra cứu là chính. Mọi thay đổi được đề xuất qua PR vào `main`, phải **request reviewer đại diện cho từng team đang sử dụng chung repo** và hoàn tất review trước khi merge; người tạo PR không tự duyệt. Đọc `CONTRIBUTING.md` trong [hướng dẫn đóng góp](.github/).

AI để thay đổi chưa stage/commit/push để người phụ trách review; chỉ thực hiện các bước Git hoặc tạo PR khi được yêu cầu riêng. Có checkout sẵn thì đọc trực tiếp, không tự fetch/pull để lấy context. Phê duyệt tài liệu không đồng nghĩa phê duyệt triển khai, chạy SQL hoặc phát hành ứng dụng.

README này chỉ liên kết đến thư mục trong repo. Các hướng dẫn chi tiết và nguồn kiểm chứng nằm trong thư mục tương ứng; không đưa đường dẫn máy cá nhân, cấu hình riêng hoặc thông tin xác thực vào tài liệu dùng chung.
