# Rules và cách tổ chức BLEND

`blend-context` là nơi bắt đầu cho người và AI. Các quy ước dưới đây áp dụng cho tài liệu dùng chung; [quy tắc soạn nội dung](content-authoring.md) áp dụng cho mọi nội dung BLEND và [rules phát triển](development/) áp dụng khi làm việc với ứng dụng `blend`.

## 1. Vai trò và định nghĩa

| Khái niệm | Cách dùng |
| --- | --- |
| `blend-context` | Quản lý hướng dẫn AI, rules, nguồn yêu cầu, context, docs và quyết định |
| `blend` | Repository mã nguồn ứng dụng; là tên tham chiếu của team, không phải đường dẫn máy hay URL GitHub được suy đoán |
| Epic | Nhóm công việc lớn; một Epic có thể chứa nhiều chức năng độc lập |
| Feature | Phạm vi nghiệp vụ trong một thư mục; mặc định tương ứng một Backlogitem, hoặc một Work Item của Sheet khi chưa có Redmine |
| Task | Công việc con có ID nguồn riêng; có thể là Redmine SubTask hoặc dòng Internal Tasks của Sheet |
| Context | Yêu cầu hiện hành, xác nhận, nguồn gốc và điểm còn mở của feature |
| Docs | Đặc tả, thiết kế, tiêu chí nghiệm thu và báo cáo dùng chung |
| Research | Topic reports tại gốc feature; câu hỏi, kết luận và bằng chứng theo revision/dependencies, không là nguồn yêu cầu cạnh tranh |
| Plans | Implementation plans dùng chung, portable tại gốc feature; kế hoạch vận hành/debugging riêng không thuộc repo này |
| Decision | Quyết định có vấn đề, phương án chọn, lý do, tác động, ngày/trạng thái và căn cứ xác nhận |

Không tự đặt URL cho `blend`. Các PR đã liên kết trong Redmine hiện dẫn tới `ednity/school-web`; đó là nguồn code được ticket tham chiếu, không phải bằng chứng tồn tại repository `TryHand-Co-Ltd/blend`. Khi ghi bằng chứng code, dùng permalink đã kiểm hoặc `blend:<đường-dẫn-từ-gốc-repo>` cùng revision đã đọc.

## 2. Nguồn ID

| Nguồn | Feature ID | Task ID |
| --- | --- | --- |
| Redmine | ID số của Backlogitem chứa yêu cầu nghiệp vụ đã kiểm | ID số của SubTask đã kiểm cùng parent thực tế |
| [BLEND — Project Management](https://docs.google.com/spreadsheets/d/1lK9kXTC5pjuucCCpZThCImZFDBBbQdn9At6Nl8y0LGc/edit?gid=277536463#gid=277536463) | `Parent Item ID` ở Internal Tasks, đối chiếu `Work Item ID` tại Client Deliverables | Giá trị nguyên văn trong cột `Task ID` của Internal Tasks |

Khi tra Sheet, xác minh tab, tên cột và tìm đúng ID; vị trí hàng/cột có thể đổi. `Task ID` và `Parent Item ID` thuộc tab `Internal Tasks`; đối chiếu `Work Item ID` tại `Client Deliverables`. Xem [bản đối chiếu nguồn ID](evidence/2026-09-28-task-id-sources.md) để biết thông tin đã kiểm theo ngày.

- Giữ nguyên chữ hoa, dấu nối và số 0: `RC-001-A` không được đổi thành `rc-1-a`, `RC-001-01` hoặc số thứ tự task trong tài liệu.
- Không dùng số dòng Sheet, nhãn `No6`, tiêu đề, số task của bản chia việc hay tên người làm làm ID nguồn.
- Không có Redmine thì dùng đúng Task ID trong Sheet; không tự cấp mã mới, không tạo Redmine thay người phụ trách. Thiếu ID, trùng ID hoặc parent mâu thuẫn thì ghi nhận và yêu cầu xác minh trước khi tạo thư mục mang ID đó.
- Task có `Parent Item ID` trống là task độc lập theo cấu trúc Sheet: dùng chính Task ID làm Feature ID của phạm vi đó, ghi rõ `Parent Item ID: trống`; không bịa parent hoặc áp dụng ngược cho task đã có parent.
- Một feature có thể có cả task Redmine và task Sheet. Ghi hai nguồn riêng; chỉ kết luận chúng là cùng một task khi có liên kết chính xác tới SubTask hoặc xác nhận có căn cứ. Link chỉ tới Backlogitem/PR không chứng minh quan hệ một-một.
- Khi task/feature đã dùng ID Sheet rồi mới có Redmine, giữ tên thư mục hiện hành để không làm hỏng liên kết; thêm ID Redmine và nguồn xác nhận vào bảng đối chiếu. Chỉ đổi tên trong một PR migration có cập nhật toàn bộ link. Không tạo bản context cạnh tranh.

## 3. Naming và nơi lưu

```text
features/<Feature-ID>-<slug>/
  README.md
  CONTEXT.md
  sources/
  research/<topic>.ja.md, <topic>.vi.md, <topic>.sql khi được yêu cầu
  plans/<scope>-implementation-plan.ja.md, <scope>-implementation-plan.vi.md
  docs/
  tasks/<Task-ID>-<slug>/
  decisions/
```

Không thêm tiền tố `sheet-` hoặc `redmine-` vào tên thư mục. Nguồn `Sheet`/`Redmine`, ID nguyên gốc và link nguồn được ghi trong README feature hoặc tài liệu task. Không suy nguồn chỉ từ dạng ID. Phần `<...>` là ký hiệu mô tả, không phải tên thư mục thật. `slug` ngắn gọn bằng tiếng Anh, chữ thường, nối bằng `-`; tránh tên người, ngày cập nhật, trạng thái và tên sprint vì dễ thay đổi. ID phải giữ nguyên như nguồn. Nếu ID chứa ký tự không dùng được trong tên thư mục, ghi nguyên ID trong README và thống nhất cách mã hóa trong PR; không âm thầm xóa ký tự.

| Trường hợp | Ví dụ đã đối chiếu |
| --- | --- |
| Feature có Redmine | `features/225454-student-career-registration/` |
| Feature chưa có Redmine | `features/RC-001-red-score/` |
| Tài liệu riêng task Redmine, khi phát sinh | `features/225454-student-career-registration/tasks/226188-implementation/` |
| Tài liệu riêng task Sheet, khi phát sinh | `features/RC-001-red-score/tasks/RC-001-B-specification/` |
| Task Sheet thuộc feature Redmine, khi phát sinh | `features/225454-student-career-registration/tasks/225454-S01-analysis/` |

Các đường dẫn dùng `225454` và task liên quan chỉ minh họa cách tổ chức Redmine. Chúng không xác định công việc đang thực hiện hoặc toàn bộ backlog dự án; luôn thay bằng ID đã xác minh của task thực sự được giao.

Chỉ tạo `tasks/` khi có tài liệu riêng cho task. Tài liệu dùng cho cả feature giữ một bản ở `docs/`, tài liệu task chỉ tới bản đó. Giữ cây thư mục task phẳng trong feature; tài liệu task ghi parent thật, kể cả khi Redmine có nhiều tầng. Không tạo chuỗi thư mục theo toàn bộ tổ tiên, không nhân bản đặc tả theo mỗi task.

Trước khi ghi file, phân loại nội dung theo owner thay vì theo tên template:

- yêu cầu hiện hành của feature → `CONTEXT.md`;
- phản hồi/Q&A đã xác nhận hoặc nguồn gốc → `sources/`;
- topic research theo vấn đề/luồng → `research/` tại gốc feature; không mặc định một file cho toàn feature, không tách một file cho mỗi field/tool call;
- implementation plan dùng chung → `plans/` tại gốc feature, dùng đường dẫn và commands portable; không chứa workstation/private configuration;
- đặc tả, thiết kế, test design, acceptance criteria hoặc báo cáo dùng chung toàn feature → `docs/`;
- nội dung chỉ thuộc một Task ID đã xác minh, gồm task bundle, review, PR/QA draft → `tasks/<Task-ID>-<slug>/`;
- quyết định đã chuẩn hóa → `decisions/`;
- rule/evidence dùng chung toàn dự án → `rules/` hoặc `rules/evidence/`.

`research/` và `plans/` là hai ngoại lệ của routing task-only: kể cả slice của một task, giữ report/plan tại gốc feature, ghi exact Task ID/parent/scope và link từ task folder, không copy lại. Chỉ tạo folder khi có output hữu ích được giao; không tạo report rỗng hoặc scaffolds. Query draft chỉ cho câu hỏi dữ liệu cụ thể được phép, không execute; không chuyển Database Design SQL, migrations, confirmed Q&A hoặc historical flat Research.

Tái sử dụng folder/slug hiện có. Chỉ tạo revision subfolder khi nguồn có revision thực hoặc feature đã dùng convention đó; không mặc định tạo `r1`. Khi chưa xác minh được Feature ID hoặc Task ID, không tự đặt ID/folder canonical: trả nội dung trong chat hoặc dùng đúng nơi tạm do người dùng chỉ định, rồi chuyển vào repo sau khi có identity.

README của feature ghi Feature ID/nguồn, Epic hoặc Work Item cha nếu có, phạm vi, thứ tự đọc và link nguồn chung. Không liệt kê từng task hoặc link từng hàng Google Sheet trong README; mở nguồn khi cần tra task và trạng thái hiện hành. Khi có tài liệu riêng cho task, ghi ID nguyên gốc, nguồn/link và parent trực tiếp tại tài liệu đó.

Nếu cùng một ID xuất hiện ở hai nguồn, đối chiếu cặp nguồn + ID trước khi chọn thư mục; không tự gộp task. Hai công việc khác nhau dùng slug mô tả khác nhau và ghi rõ nguồn. Nếu vẫn không phân biệt được thì yêu cầu xác minh, không ghi đè thư mục hoặc tự đổi ID.

Một quyết định nhỏ có thể ghi ngay trong context. Khi cần tách, dùng `decisions/DEC-001-<slug>.md`, ghi trạng thái đề xuất/đã xác nhận/đã thay thế và link quyết định thay thế. `DEC-001` chỉ là số tài liệu nội bộ, không phải Task ID hay Redmine ID.

## 4. Căn cứ thực tế và thứ tự đọc

[Cây ticket Epic 222142](evidence/2026-09-28-redmine-hierarchy.md) ghi kết quả đọc 7 Backlogitem và 34 SubTask. Nguồn thực tế có cả task phát triển chứa task con và QA chứa QA con; không ép mọi feature phải có cùng một cây SE/Development/QA. Các rules Wiki mô tả luồng chuẩn vẫn được giữ ở [development](development/), có phạm vi và ngày đối chiếu riêng.

Người và AI cùng đi theo: README repo → rules liên quan → README feature → `CONTEXT.md` → nguồn xác nhận nếu cần → docs/task cụ thể → code trong `blend` khi công việc cần. Chỉ đọc sâu phần liên quan, không tải toàn bộ tài liệu của mọi feature.

Context chuẩn cùng xác nhận mới được phép áp dụng xác định yêu cầu. Spec, quyết định, task và bản dịch phải đồng bộ với context; code mô tả hiện trạng, không tự thay yêu cầu. Research là bằng chứng/advice theo source/code/dependency identities và currentness; chỉ chọn topics cần cho consumer, không coi toàn folder là một snapshot hoặc để topic không liên quan tự invalidate toàn feature. Plan phải pin approved source/review/approval revisions và scope; review PASS không tự là approval và plan không tự cấp quyền execute. Khi nguồn xung đột, nêu cụ thể và yêu cầu chốt phần ảnh hưởng, không âm thầm chọn nguồn thuận tiện hoặc mở lại câu đã được xác nhận.

## 5. Tài liệu và quyền cập nhật

- Feature-wide docs: `features/<feature>/docs/`; context chuẩn: `features/<feature>/CONTEXT.md`; Q&A đã xác nhận và nguồn gốc đặt trong `features/<feature>/sources/`. Các đường này thay cho mặc định output của skill/template.
- `sources/` giữ dữ liệu nguồn như Q&A confirmed và phản hồi gốc. `decisions/` chỉ giữ quyết định đã chuẩn hóa với vấn đề, lựa chọn, lý do, tác động và trạng thái; không chuyển nguyên file Q&A vào `decisions/`.
- Quy tắc AI và định nghĩa chung nằm tại đây, [content-authoring.md](content-authoring.md) và `AGENTS.md`; phần đặc thù feature nằm trong feature đó. Không tạo bản instructions riêng cho từng công cụ nếu nội dung giống nhau.
- Giữ hậu tố `.vi.md`, `.ja.md`, `.en.md` khi có nhiều ngôn ngữ. Không đổi tên/mất bản dịch ngoài phạm vi migration được yêu cầu. Trong bản Việt, mỗi nhãn UI/từ nghiệp vụ tiếng Nhật phải có nghĩa tiếng Việt cạnh bên.
- Root README chỉ link thư mục; README feature và tài liệu chi tiết được link file tương đối trong repo. Nguồn ngoài dùng URL dùng chung, không có credential/query token. Không reference workstation, cấu hình cá nhân, helper riêng hoặc file nằm ngoài repo.
- Di chuyển tài liệu phải sửa link, kiểm đủ nội dung và giữ giới hạn chứng cứ cũ. Ngày import không phải ngày tái xác minh nghiệp vụ/Wiki/code.
- Mọi cập nhật vào `main` cần PR, request reviewer đại diện cho từng team sử dụng chung repo và hoàn tất review theo [quy trình review](../.github/CONTRIBUTING.md). Agent mặc định để thay đổi chưa stage; không tự xuất bản. Đọc Redmine/Sheet không cho phép sửa nguồn.

## 6. Bằng chứng và thông tin tài liệu

[Bằng chứng đối chiếu](evidence/) lưu kết quả kiểm nguồn theo ngày, tách khỏi rules hiện hành. Mỗi bản ghi nêu nguồn, ngày, phạm vi và giới hạn; không coi bản đối chiếu là trạng thái mới nhất của ticket hay một quy tắc mới. Topic research riêng feature nằm trong `research/`; shared implementation plans nằm trong `plans/`. Bằng chứng khác giữ routing `docs/` hoặc task tương ứng. Giữ Research lịch sử tại chỗ nếu chưa có migration riêng; ngày sửa/import không tự xác nhận currentness.

Thông tin tối thiểu dùng bảng Markdown hoặc đoạn ngắn, không cần file cấu hình riêng:

| Thông tin | Nơi ghi |
| --- | --- |
| ID nguyên gốc, nguồn và link | README feature; tài liệu task khi phát sinh |
| Parent trực tiếp | Theo nguồn; ghi rõ trống/chưa xác minh khi phù hợp |
| Phạm vi và thứ tự đọc | README feature |
| Ngày/phiên bản đối chiếu | Tài liệu đưa ra nhận định từ nguồn; không lấy ngày sửa file làm ngày kiểm chứng |
| Trạng thái tài liệu | Đề xuất, đã xác nhận hoặc đã thay thế; phân biệt với trạng thái triển khai/test |

Giữ cấu trúc theo feature, không thêm tầng theo team, Epic, sprint hay công cụ AI. `AGENTS.md` hướng dẫn cách bắt đầu và phân luồng, không sao chép toàn bộ rules vào từng feature. Khi mở phiên trực tiếp ở `blend`, cung cấp entry point chung một cách rõ ràng; không mặc định công cụ tự đọc instructions từ repo khác.
