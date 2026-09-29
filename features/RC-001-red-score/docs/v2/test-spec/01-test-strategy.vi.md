# 01 — Chiến lược kiểm thử

Tài liệu này mô tả cách kiểm thử chức năng điểm đỏ（赤点）: phạm vi, nguồn làm chuẩn, cách đặt trạng thái/ưu tiên, môi trường và điều kiện bắt đầu/kết thúc. Bộ test ở trạng thái **thiết kế trước khi có code**: toàn bộ test case đang **NOT RUN**, không có kết quả PASS/FAIL nào được điền sẵn.

## 1. Phạm vi

| Trong phạm vi | Ghi chú |
| --- | --- |
| Điểm vào ở Thiết lập ô nhập（入力欄設定）, danh sách Thiết lập điểm đỏ（赤点設定）, thêm/sửa/xóa/đổi ưu tiên | R18 «đặc tả RC-001 v2» §4 «Danh sách thiết lập và thứ tự ưu tiên»; Figma chương 01 |
| Màn Điều kiện áp dụng（適用条件） và nguồn trung bình/tỷ lệ nhóm | R18 «đặc tả RC-001 v2» §5 «Điều kiện áp dụng và nguồn tham chiếu»; Figma chương 02 |
| Màn Thiết lập ngưỡng（基準設定）: Điểm cố định（固定点数）, Tỷ lệ điểm tối đa（得点率）, Công thức（計算式）, xử lý phần lẻ, dấu so sánh | R18 «đặc tả RC-001 v2» §6 «Ngưỡng điểm, công thức và xử lý phần lẻ»; Figma chương 03 |
| Thời điểm xét, vòng đời kết quả, sáu trạng thái kết quả | R18 «đặc tả RC-001 v2» §7 «Quy trình xét và thời điểm cập nhật»–§8 «Trạng thái kết quả và xử lý lỗi»; Figma chương 04 |
| Ba đầu ra: Trích xuất thành tích（成績抽出）, Công khai thành tích（成績公開）, Công cụ phiếu điểm（通知表ツール） và file Excel/PDF | R18 «đặc tả RC-001 v2» §9 «Trích xuất thành tích（成績抽出）»–§11 «Công cụ phiếu điểm（通知表ツール） và PDF»; Figma chương 05–07 |
| Quyền, phạm vi trường/năm, dữ liệu lưu, cột đỏ cũ（`red_score`） | R18 «đặc tả RC-001 v2» §1.3 «Quyền sử dụng», §12 «Dữ liệu, tích hợp và bảo toàn chức năng cũ» |
| Hồi quy các chức năng dùng chung (AutoRating, trích xuất, công khai, phiếu điểm, tổng hợp thứ hạng) | Chỉ khi có căn cứ cụ thể — xem [07](07-regression-test-cases.vi.md) «Test case hồi quy (REG)» |

**Ngoài phạm vi:** xét đỏ trực tiếp cho kiểu lựa chọn A/B/C và Đạt/không đạt（合否）; ngôn ngữ công thức tự do; phân phối xếp loại/top %; chuyển đổi dữ liệu đỏ cũ; hiển thị đỏ ở màn nhập điểm (chưa có yêu cầu); test tự động (unit/PHPUnit) — tài liệu này là test case thủ công/tích hợp.

**Phạm vi phát hành chưa chốt (R18 «đặc tả RC-001 v2» §1.4 «Ranh giới giữa thiết kế đầy đủ và phạm vi triển khai», §13.1 «Các quyết định còn lại được phân loại rõ»).** Bộ test phủ **thiết kế đầy đủ**. Trước khi chạy, QA lead đánh dấu test case nào thuộc đợt phát hành; case thuộc loại chưa được chọn (ví dụ công thức, phân nhánh trung bình) chuyển sang SKIPPED với lý do "ngoài phạm vi đợt", không phải FAIL. Riêng [TC-RS-UI-025](05-ui-test-cases.vi.md#tc-rs-ui-025) «Loại ngưỡng/điều kiện chưa thuộc phạm vi phát hành không…» kiểm tra loại chưa được chọn không hiển thị như lựa chọn đang hoạt động.

## 2. Nguồn làm chuẩn và thứ tự ưu tiên

| Mã nguồn | Tài liệu | Vai trò |
| --- | --- | --- |
| QAC Qn | [Q&A đã xác nhận](../../../sources/confirmed-business-qa.vi.md) | Q1 «Ai được thiết lập điều kiện điểm đỏ?»–Q18 «Thiết kế đầy đủ có đồng nghĩa phát hành toàn bộ không?», Q23 «Khi xét tỷ lệ điểm, dùng điểm tối đa nào?»–Q33 «Ba loại nhóm cấu hình có xuất hiện ngoài khối/HR/lớp học không?»: xác nhận nghiệp vụ (Q32 «Nhóm tham chiếu phía điểm đỏ có tuân theo thiết lập tổng hợp hiện hữu không?…», Q33 ngày 28/09: nhóm tham chiếu theo thiết lập tổng hợp hiện hữu, phương án A). Q19 «BLEND hiện giữ giá trị thế nào khi đổi phương thức tính?»–Q22 «Cơ chế công thức và ưu tiên nào đã có để tham chiếu?»: chỉ là bằng chứng hiện trạng code, không phải xác nhận nghiệp vụ |
| R18 §n | [Đặc tả RC-001 v2](../specification.vi.md) (`docs/v2/`, Draft, commit `bbcd99b`). `R18` là mã gọi ngắn của đặc tả trong bộ test. Bản v1 trong `docs/v1/` giữ để truy vết bản đã gửi review | Oracle chính. Đoạn gắn nhãn **Đề xuất thiết kế**/"Phương án kỹ thuật v2" chỉ tính là PROPOSED |
| CTX | [CONTEXT RC-001](../../../CONTEXT.md) (28/09/2026, có §9.6 «Ba phản hồi review DB và bài học thiết kế ngày 28/09» ba phản hồi review DB) | Context chuẩn, các khoảng trống tích hợp I01 «Đường ghi điểm»–I12 «Đồng thời và thời điểm nguồn». §9.6 «Ba phản hồi review DB và bài học thiết kế ngày 28/09»: yêu cầu review DB của khách hàng (hiệu ứng theo cấu hình công khai; chống ghi đè/xóa-tạo lại ô) là yêu cầu hành vi; cơ chế v2 là PROPOSED |
| FIG node | [File Figma của Movitation Works (MW)](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/%25E8%25B5%25A4%25E7%2582%25B9%25E5%2588%25A4%25E5%25AE%259A%25E5%25AF%25BE%25E5%25BF%259C?node-id=0-1), node `0:1` — nguồn hiện hành (R18 «đặc tả RC-001 v2» §13.2 «Cách sử dụng Figma và nguồn gốc xác nhận»), đã đối chiếu chỉ đọc ngày 29/09/2026. File cũ [Red-Score-UI-Mockup---Final](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-1631) chỉ là lịch sử v1 | Nhãn, bố cục, thông báo. Mọi node trong case là node file MW (`FIG MW 58:…`); mở bằng link file MW với `?node-id=58-…` (đổi `:` thành `-`). Node 45xx–47xx chỉ còn trong ghi chú "file cũ ghi …" và CF-07 «Câu thông báo lỗi vượt điểm tối đa và chia 0» để truy vết câu chữ cũ. Đặc tả v2 vẫn dẫn link file cũ (CF-08 «Frame Figma được R18 dẫn»); tra frame MW tương ứng theo tên chương/frame. Khác biệt chỉ về nhãn/bố cục ghi CONFLICT, không FAIL. Ghi chú 「設計案」 (phương án thiết kế) = PROPOSED. Giá trị mẫu trên hình không phải mặc định sản phẩm |
| CODE file:hàm | Repo `docker-codeigniter/src`, HEAD `87d5a78d174`, đọc tĩnh trong giai đoạn phân tích (chưa chạy) | Chỉ chứng minh hiện trạng; không thay quyết định nghiệp vụ |
| RSD-AC AC-Gnn | [Tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) | AC-G01…AC-G40 «tiêu chí nghiệm thu: Quyền thao tác và phạm vi dữ liệu … Phạm vi từng đợt» lập từ R18 «đặc tả RC-001 v2»/QAC: là tiêu chí CONFIRMED, dùng để truy vết ([11 §5](11-traceability-matrix.vi.md#ac) «Tiêu chí nghiệm thu（RSD-AC）→ test case») và làm rõ oracle. Mục "Chi tiết thiết kế" = PROPOSED |
| RSD-DB §n | [Thiết kế DB v2](../database-design.vi.md) và `database-design.sql` | Thiết kế **đề xuất**, chưa review kỹ thuật, chưa thực thi DDL: tên bảng/cột, mã trạng thái, `reason_code`, giới hạn lưu trữ, cột `red_score_display_type`/`red_score_revision`, cơ chế thế hệ/phiên bản/khóa (§6 «Phương thức xử lý cập nhật đồng thời»), nơi lưu thiết lập đỏ của Trích xuất thành tích（成績抽出） trong JSON `grade_extract_conf.extract_setting` và của Công cụ phiếu điểm（通知表ツール） trong phần lưu bảng/điều kiện hiện có (§5.1 «Thiết lập hiển thị của Trích xuất thành tích（成績抽出）và Công cụ phiếu điểm（通知表ツール）», không thêm cột/bảng) = PROPOSED |
| RSD-TASK Task n | [Chia công việc v2](../split-tasks.vi.md) | URL màn, điểm nối code (bản repo mô tả theo trách nhiệm xử lý, không ghi đường dẫn file), đường đăng ký được chọn. Đoạn "Đề xuất" = PROPOSED |

Thứ tự khi khác nhau: QAC «Q&A nghiệp vụ đã xác nhận» → R18 «đặc tả RC-001 v2» (phần không phải đề xuất) → RSD-AC «tiêu chí nghiệm thu v2» (tiêu chí) → CTX «context chuẩn điểm đỏ» → RSD-DB «thiết kế DB v2 đề xuất»/RSD-TASK → Figma → code. **Khi Figma khác spec, bộ test không chọn bên**: ghi vào danh sách xung đột kèm câu hỏi cho người phụ trách ([11 §4](11-traceability-matrix.vi.md#conflicts) «Xung đột và khác biệt»); test case liên quan có trạng thái CONFLICT.

## 3. Nhãn trạng thái của test case

Cột **Status** trong các file test case là **độ chắc chắn của kết quả mong đợi**, không phải kết quả chạy.

| Nhãn | Ý nghĩa | Cách xử lý khi chạy |
| --- | --- | --- |
| CONFIRMED | Kết quả mong đợi lấy từ QAC «Q&A nghiệp vụ đã xác nhận», phần quy tắc của R18 «đặc tả RC-001 v2», hoặc tiêu chí AC-Gnn của RSD-AC «tiêu chí nghiệm thu v2» (không gồm mục "Chi tiết thiết kế"). Tiêu chí thuộc phần có thể nằm ngoài đợt phát hành (ví dụ công thức; phạm vi phát hành chưa chốt — R18 §13.1 «Các quyết định còn lại được phân loại rõ») chỉ chạy khi phần đó thuộc đợt; ngoài đợt ghi SKIPPED | Là tiêu chí PASS/FAIL |
| IMPLEMENTED | Hành vi hiện có đã xác minh qua code/UI, phải giữ nguyên | Là tiêu chí PASS/FAIL (hồi quy) |
| PROPOSED | Đề xuất thiết kế (R18 «đặc tả RC-001 v2» "Đề xuất thiết kế", Figma 「設計案」, mẫu AutoRating, RSD-DB «thiết kế DB v2 đề xuất», đoạn "Đề xuất"/"Chi tiết thiết kế" của RSD-TASK «bản chia công việc v2»/RSD-AC) | **Không phải must-pass.** Ghi nhận hành vi thực tế; lệch đề xuất → ghi Notes, không mở bug trừ khi đề xuất đã được duyệt |
| TBD | Chưa có quyết định | Không đánh giá PASS/FAIL cho tới khi có câu trả lời; có thể chạy để thu thập hiện trạng |
| CONFLICT | Nguồn mâu thuẫn (Figma ↔ spec hoặc Figma ↔ Figma) | Không đánh giá phần đang mâu thuẫn; chỉ đánh giá phần không tranh chấp ghi trong Expected |

Một case có thể gồm phần CONFIRMED và phần PROPOSED. Khi đó Status ghi nhãn của phần chính; 期待結果（Kết quả mong đợi） ghi rõ phần nào là PROPOSED.

Trạng thái chạy (NOT RUN / PASS / FAIL / BLOCKED / SKIPPED) chỉ nằm ở bảng chạy test ([09 §5](09-evidence-guideline.vi.md) «Ghi kết quả», [09 §6](09-evidence-guideline.vi.md#run-sheet) «Bảng chạy test»).

## 4. Ưu tiên

Không có tài liệu nguồn nào quy định mức ưu tiên kiểm thử. Bộ test dùng một quy tắc minh bạch:

| Priority | Điều kiện (phải thỏa cả hai) |
| --- | --- |
| Cao | Status = CONFIRMED hoặc IMPLEMENTED **và** case kiểm một trong: (1) kết quả đỏ/không đỏ hoặc quy tắc được chọn; (2) thời điểm xét, dùng/ngừng dùng kết quả cũ; (3) đầu ra đánh dấu/lọc đúng ô theo kết quả hiện hành; (4) không làm lộ điểm bị ẩn; (5) kiểm quyền/phạm vi trường–năm ở server |
| TBD | Mọi case còn lại, gồm mọi case PROPOSED / TBD / CONFLICT |

Không dùng mức "Trung bình/Thấp" hay severity vì không có căn cứ nguồn.

## 5. Mức kiểm thử và kỹ thuật

| Mức | Nội dung | File |
| --- | --- | --- |
| Chức năng qua UI | Luồng cấu hình, trigger, ba đầu ra | [03](03-test-cases.vi.md) «Test case chức năng, quy tắc nghiệp vụ, validation và dữ…», [05](05-ui-test-cases.vi.md) «Test case giao diện (UI)» |
| Quy tắc nghiệp vụ | Ưu tiên, nguồn, vòng đời kết quả, quyền | [03](03-test-cases.vi.md) «Test case chức năng, quy tắc nghiệp vụ, validation và dữ…» |
| Tính toán | Bảng giá trị: điển hình, min, max, biên −1/biên/biên +1, 0, rỗng, thập phân, làm tròn, số âm | [04](04-calculation-test-cases.vi.md) «Test case tính toán (CALC)» |
| Lỗi, trạng thái, biên | Sáu trạng thái trên đầu ra, lỗi kỹ thuật, request trực tiếp | [06](06-error-and-edge-case-test-cases.vi.md) «Test case lỗi, trạng thái và trường hợp biên (ERR)» |
| Dữ liệu | SELECT / SHOW FULL COLUMNS trên DB local sau khi schema được thiết kế | [03 §4](03-test-cases.vi.md#data) «Data / Persistence (DATA)» |
| Hồi quy | Chỉ chức năng dùng chung có căn cứ | [07](07-regression-test-cases.vi.md) «Test case hồi quy (REG)» |

Kỹ thuật: phân vùng tương đương + giá trị biên cho input; bảng quyết định cho kết hợp hiệu ứng (công khai) và first-match (phiếu điểm); bảng chuyển trạng thái R18 «đặc tả RC-001 v2» §8.2 «Bảng chuyển trạng thái» cho vòng đời. Mỗi case là tập tối thiểu đủ để bác bỏ một quy tắc; biến thể dữ liệu được gom vào bảng trong cùng case thay vì nhân bản case.

## 6. Môi trường, tài khoản và dữ liệu

- **Môi trường:** build có tính năng điểm đỏ trên môi trường local (Docker `docker-codeigniter` + `docker-mysql`) hoặc staging được team cho phép ghi dữ liệu test. Staging chỉ dùng khi team cho phép; tài liệu không ghi URL môi trường.
- **Tài khoản/vai trò:** định nghĩa theo vai trò ở [08 §2](08-test-data.vi.md#roles) «Vai trò»; vai trò mặc định khi case không ghi: [§9](#conventions) «Quy ước thực thi chung». Tài khoản và mật khẩu được cấp qua kênh được team duyệt (secret/biến môi trường); **không ghi mật khẩu, token, khóa vào tài liệu, CSV hoặc bằng chứng**.
- **Nguồn tổng hợp đã chốt (snapshot):** tính năng xác nhận tổng hợp thứ hạng（順位集計確定）chưa merge ([PR #57058](https://github.com/ednity/school-web/pull/57058) «PR thêm trạng thái xác nhận kết quả tổng hợp xếp hạng, còn mở»); R18 «đặc tả RC-001 v2» §5.5 «Chọn bản nguồn» cho phép dummy data. Case phụ thuộc snapshot ghi rõ "dummy data" trong bằng chứng cho tới khi tích hợp nguồn thật (R18 §13.1 «Các quyết định còn lại được phân loại rõ»).
- **DB:** có thiết kế đề xuất v2 `red_score_settings` / `red_score_results` và hai cột bổ sung trên bảng hiện hữu (RSD-DB «thiết kế DB v2 đề xuất»), chưa migrate. Case DATA viết câu SELECT theo thiết kế này; nếu schema cuối khác thì đổi câu SELECT, giữ kỳ vọng nghiệp vụ.

## 7. Điều kiện bắt đầu / kết thúc

**Bắt đầu chạy một nhóm case khi:**

1. Danh sách phạm vi đợt phát hành đã có (R18 «đặc tả RC-001 v2» §13.1 «Các quyết định còn lại được phân loại rõ») và QA lead đã đánh dấu case trong/ngoài đợt.
2. Build có tính năng được deploy lên môi trường test; dữ liệu theo [08](08-test-data.vi.md) «Đặc tả dữ liệu test» đã chuẩn bị và reset được.
3. Các câu hỏi chặn ghi ở Notes của case đã có câu trả lời, hoặc case được chạy ở chế độ "ghi nhận hiện trạng" (không đánh giá PASS/FAIL).

**Kết thúc khi:**

1. Mọi case CONFIRMED/IMPLEMENTED trong phạm vi đợt có trạng thái PASS, FAIL (có Bug ID) hoặc BLOCKED/SKIPPED có lý do.
2. Mỗi case có bằng chứng theo [09](09-evidence-guideline.vi.md) «Hướng dẫn thu thập bằng chứng»; thay đổi định dạng Excel/PDF có file thực, thay đổi bố cục có ảnh trước/sau, bảng/cột mới có ảnh SELECT/SHOW FULL COLUMNS.
3. Ma trận [11](11-traceability-matrix.vi.md) «Ma trận truy vết（Traceability Matrix）» được cập nhật: không còn tiêu chí nghiệm thu trong phạm vi đợt mà không có case đã chạy.

## 8. Rủi ro kiểm thử

| Rủi ro | Ảnh hưởng tới kiểm thử | Hướng xử lý |
| --- | --- | --- |
| Phạm vi phát hành chưa chốt (R18 «đặc tả RC-001 v2» §13.1 «Các quyết định còn lại được phân loại rõ») | Không biết case nào phải chạy | QA lead lọc theo danh sách phạm vi trước khi chạy |
| Chưa có snapshot thật (R18 «đặc tả RC-001 v2» §13.1 «Các quyết định còn lại được phân loại rõ») | Case nguồn đã chốt chỉ chứng minh trên dummy data | Chạy lại khi tích hợp nguồn thật |
| Schema DB mới là đề xuất | Câu SELECT có thể phải đổi khi migrate | Đối chiếu migration thật trước khi chạy case DATA |
| Khó tạo lỗi kỹ thuật/lỗi batch một phần | Case lỗi kỹ thuật có thể BLOCKED | Cần team dev hỗ trợ cách giả lập |
| Figma và spec khác nhau ở nhãn/thứ tự (CF-01 «Tùy chọn hiển thị đỏ ở Công khai thành tích（成績公開）», CF-03 «Nhãn và vị trí tùy chọn đỏ ở Trích xuất thành tích（成績抽出）», CF-07 «Câu thông báo lỗi vượt điểm tối đa và chia 0», CF-08 «Frame Figma được R18 dẫn») | Case UI chưa có oracle nhãn cuối | Case để CONFLICT/PROPOSED; chỉ đánh giá phần không tranh chấp |
| Figma hiện hành là file MW; đã ánh xạ frame | Spec v2/CONTEXT trong blend-context vẫn link file cũ (CF-08 «Frame Figma được R18 dẫn»); file MW có thể tiếp tục thay đổi sau ngày đối chiếu | Trước khi chạy case UI: mở frame MW ghi trong chú thích, xem lại câu chữ; khác biệt nhãn/bố cục ghi Notes hoặc CONFLICT, không FAIL |
| Cơ chế cập nhật đồng thời v2 chưa review, chưa thử hai kết nối (RSD-DB «thiết kế DB v2 đề xuất» §6.4 «Phạm vi kết nối và ví dụ kiểm tra») | Case cạnh tranh khó tái hiện; SELECT phiên bản có thể đổi | Đánh giá theo hành vi CONFIRMED (AC-G03 «Nhận diện ô điểm»/G22/G27); phần phiên bản là PROPOSED; không tái hiện được thì BLOCKED |
| Dữ liệu nhóm tham chiếu nhiều tổ hợp bật/tắt | Case nhóm tham chiếu có thể BLOCKED | Team dev hỗ trợ dựng TD-POP-01…06 «Thiết lập tổng hợp X: Thiết lập… … Học sinh học hai lớp cùng môn: S11…» |

<a id="conventions"></a>

## 9. Quy ước thực thi chung

Áp dụng cho mọi case ở 03–07 khi case không ghi khác. Case có ghi vai trò, đầu ra hoặc cấu hình riêng thì làm theo case.

**Vai trò mặc định**

| Thao tác | Vai trò |
| --- | --- |
| Cấu hình quy tắc điểm đỏ, Thiết lập ô nhập（入力欄設定） | TD-ROLE-01 «Giáo viên có quyền sửa mục: Có quyền vào Thiết lập nhập điểm（成績入力設定） và…» |
| Đăng ký điểm trên màn hoặc bằng CSV; xem Trích xuất thành tích（成績抽出） để quan sát kết quả | TD-ROLE-09 «Giáo viên nhập điểm: Giáo viên phụ trách lớp G-A, G-B, G-C: có quyền…» |
| Thực hiện tổng hợp（集計実行） (nút xanh), Thực hiện tính toán tự động（自動算出実行） (nút cam) | TD-ROLE-03 «Người có quyền chạy hàng loạt: Có quyền thực hiện Thực hiện tổng…» |
| Cấu hình ba đầu ra | TD-ROLE-07 «Người phụ trách đầu ra: Có quyền Trích xuất thành tích（成績抽出）, Thiết lập…» |

**Nơi xem kết quả xét** — dùng cho các bước "xem kết quả", "xem Sxx", "xét/chạy lại":

1. **Đỏ / Không đỏ:** mở Trích xuất thành tích（成績抽出） (URL ở TD-ENV-05 «Đường dẫn màn (RSD-TASK): Thiết lập nhập…»), chọn mục và kỳ của case, dùng cấu hình TD-OUT-02 «Trích xuất chỉ ký hiệu: Lọc TẮT» (không lọc; ký hiệu `※` phía trước, `!` phía sau). Ô đỏ hiện `※<điểm>!`; ô không đỏ hiện điểm nguyên trạng. Chỉ xem sau khi lần xét tương ứng đã xong (lưu điểm thành công hoặc nút cam chạy xong).
2. **Bốn trạng thái không đánh dấu** — Chưa xét được, Không áp dụng, Không có điểm, Chưa từng xét — trên đầu ra trông giống Không đỏ. Khi 期待結果（Kết quả mong đợi） nêu một trong bốn trạng thái này, xác nhận thêm bằng SELECT `red_score_results` theo khóa của ô (TD-ENV-03 «Truy cập DB: Kết nối MySQL local, chỉ dùng SELECT / SHOW FULL COLUMNS…»; ánh xạ mã ở [TC-RS-DATA-003](03-test-cases.vi.md#tc-rs-data-003) «Sáu trạng thái phân biệt được khi lưu» là PROPOSED).
3. **"Ba đầu ra"** = Trích xuất như mục 1 (hoặc cấu hình trích xuất ghi trong case), màn Xác nhận thành tích（成績確認） của học sinh với TD-OUT-03 «Công khai: Hiệu ứng đỏ: `*` phía trước（前に「*」）», và PDF phiếu điểm với TD-OUT-04 «Phiếu điểm: Dòng Thiết lập điểm đỏ（赤点設定）: Ký tự phía trước（前に任意の文字） `※`».

**Bằng chứng mặc định:** "Ảnh Trích xuất" là ảnh màn Trích xuất thấy tên mục, kỳ, học sinh (che theo [09](09-evidence-guideline.vi.md) «Hướng dẫn thu thập bằng chứng») và giá trị ô; mỗi lần xét hoặc mỗi cấu hình một ảnh. File Excel/PDF thật và ảnh SELECT theo §7 «Điều kiện bắt đầu / kết thúc».

**Tra nhanh mã dữ liệu hay dùng** (định nghĩa đầy đủ ở [08](08-test-data.vi.md) «Đặc tả dữ liệu test»):

| Mã | Ý nghĩa |
| --- | --- |
| TD-ITEM-01 | Điểm đánh giá（評点） môn Toán（数学）, nhập số nguyên, M = 100 |
| TD-ITEM-02 | Điểm đánh giá（評点）, nhập số thập phân, M = 100 |
| TD-ITEM-03 | Điểm bài kiểm tra đơn vị（単元テスト点）, M khác nhau theo đơn vị/lớp |
| TD-STU-01…05 | S01–S05 (lớp G-A, HR1), TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» lần lượt 29 / 30 / 31 / 0 / trống |
| TD-RULE-01 / TD-RULE-02 | Toàn bộ đối tượng, cố định 30, `<` / `≤` |
| TD-RULE-03 | Tỷ lệ điểm tối đa（得点率） 30%, `<` |
| TD-RULE-07 | Hai quy tắc phân nhánh theo trung bình: `A≥60` → cố định 30; `A<60` → `A×0.5` |
| TD-OUT-01…04 | Cấu hình đầu ra: trích xuất có lọc / trích xuất chỉ ký hiệu / công khai / phiếu điểm |
| TD-POP-01…06 | Nhóm tham chiếu theo thiết lập tổng hợp hiện hữu (công tắc khối/HR/lớp học, nhóm tổng hợp, tổ hợp, nhóm môn, học sinh học hai lớp) |

**Cách đọc mã trong bộ tài liệu**

- **Test case (03–07) viết bằng lời.** Điều kiện, Dữ liệu test, Thao tác, Kết quả mong đợi, Bằng chứng cần chụp, Sau khi chạy, Ghi chú và phần hồi quy gọi dữ liệu test, case liên quan, câu hỏi, xung đột… bằng tên, ví dụ “tài khoản giáo viên có quyền sửa mục”, “học sinh S01 (điểm 29)”, “quy tắc “Cố định 30” (dưới 30)”; chi tiết dữ liệu tra theo tên ở [08](08-test-data.vi.md). Dòng Requirement ID và dòng Nguồn ghi lời trước, mã trong ngoặc để truy vết. Mã gốc của từng case nằm trong comment ẩn `<!-- Mã truy vết: … -->` dưới dòng Priority (không hiện khi xem Markdown, không có trong Excel/CSV), dùng cho ma trận 11–12; khi thêm/bỏ dữ liệu test, câu hỏi hay case liên quan thì cập nhật comment này.
- Ngoài thân test case (00–02, 08–12 và phần mở đầu của file case), mọi mã vẫn có nội dung ghi ngay sau mã trong ngoặc `« »`. Trong một ô hoặc một dòng, mã lặp lại chỉ ghi nội dung ở lần đầu; dải mã (`TD-STU-01…05`) ghi nhóm và nội dung mã đầu/cuối. Ô đầu của bảng định nghĩa mã (bảng dữ liệu ở 08, kịch bản ở 02…) không ghi thêm vì cả dòng đã là định nghĩa.
- **Requirement ID** nằm ở dòng Priority ｜ Status ｜ Requirement ID dưới tiêu đề case: tiêu chí nghiệm thu v2 bằng lời, mã AC-Gnn trong ngoặc; case không có tiêu chí tương ứng ghi mục đặc tả v2 (`đặc tả v2 mục x.y “tiêu đề”`). Ánh xạ đầy đủ ở [11](11-traceability-matrix.vi.md) «Ma trận truy vết（Traceability Matrix）».
- **Nguồn** (dòng `- Nguồn:` trong mục 補足（Bổ sung）; cột Source của CSV): tên tài liệu bằng lời, có link, mã tài liệu trong ngoặc (ví dụ `đặc tả v2 (R18) mục 4.1 “Điểm vào và trạng thái trống”`); câu hỏi Q&A, tiêu chí, node Figma cũng ghi lời trước, mã trong ngoặc. Dấu `;` bắt đầu tài liệu khác. Thứ tự ưu tiên nguồn: [§2](#2-nguồn-làm-chuẩn-và-thứ-tự-ưu-tiên) «Nguồn làm chuẩn và thứ tự ưu tiên».
- Số câu `Qn` là câu của QAC (Q&A nghiệp vụ đã xác nhận).
- Nội dung trong `« »` và hai file 11–12 được sinh tự động bằng công cụ nội bộ của team; công cụ không gắn `« »` vào thân test case. Tên hàm/file code trong dấu `` ` `` là định danh, giữ nguyên.
