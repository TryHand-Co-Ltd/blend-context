# Phạm vi và phương pháp kiểm thử RC-001 v2



## Chiến lược và nguồn

# Chiến lược kiểm thử

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
| Hồi quy các chức năng dùng chung (AutoRating, trích xuất, công khai, phiếu điểm, tổng hợp thứ hạng) | Chỉ khi có căn cứ cụ thể — xem [test-cases.vi.md](test-cases.vi.md) «Test case hồi quy (REG)» |

**Ngoài phạm vi:** xét đỏ trực tiếp cho kiểu lựa chọn A/B/C và Đạt/không đạt（合否）; ngôn ngữ công thức tự do; phân phối xếp loại/top %; chuyển đổi dữ liệu đỏ cũ; hiển thị đỏ ở màn nhập điểm (chưa có yêu cầu); test tự động (unit/PHPUnit) — tài liệu này là test case thủ công/tích hợp.

**Phạm vi phát hành chưa chốt (R18 «đặc tả RC-001 v2» §1.4 «Ranh giới giữa thiết kế đầy đủ và phạm vi triển khai», §13.1 «Điều kiện triển khai và kiểm chứng»).** Bộ test phủ **thiết kế đầy đủ**. Trước khi chạy, QA lead đánh dấu test case nào thuộc đợt phát hành; case thuộc loại chưa được chọn (ví dụ công thức, phân nhánh trung bình) chuyển sang SKIPPED với lý do "ngoài phạm vi đợt", không phải FAIL. Riêng [TC-RS-UI-025](test-cases.vi.md#tc-rs-ui-025) kiểm tra loại chưa được chọn không hiển thị như lựa chọn đang hoạt động.

## 2. Nguồn làm chuẩn và thứ tự ưu tiên

| Mã nguồn | Tài liệu | Vai trò |
| --- | --- | --- |
| QAC Qn | [Q&A đã xác nhận](../../../sources/confirmed-business-qa.vi.md) | Q1 «Ai được thiết lập điều kiện điểm đỏ?»–Q18 «Thiết kế đầy đủ có đồng nghĩa phát hành toàn bộ không?», Q23 «Khi xét tỷ lệ điểm, dùng điểm tối đa nào?»–Q33 «Ba loại nhóm cấu hình có xuất hiện ngoài khối/HR/lớp học không?»: xác nhận nghiệp vụ (Q32 «Nhóm tham chiếu phía điểm đỏ có tuân theo thiết lập tổng hợp hiện hữu không?…», Q33 ngày 28/09: nhóm tham chiếu theo thiết lập tổng hợp hiện hữu, phương án A). Q19 «BLEND hiện giữ giá trị thế nào khi đổi phương thức tính?»–Q22 «Cơ chế công thức và ưu tiên nào đã có để tham chiếu?»: chỉ là bằng chứng hiện trạng code, không phải xác nhận nghiệp vụ |
| R18 §n | [Đặc tả RC-001 v2](../specification.vi.md) (`docs/v2/`, Draft, commit `bbcd99b`). `R18` là mã gọi ngắn của đặc tả trong bộ test. Bản v1 trong `docs/v1/` giữ để truy vết bản đã gửi review | Oracle chính. Đoạn gắn nhãn **Đề xuất thiết kế**/"Phương án kỹ thuật v2" chỉ tính là PROPOSED |
| CTX | [CONTEXT RC-001](../../../CONTEXT.md) (28/09/2026, có §9.6 «Ba phản hồi review DB và bài học thiết kế ngày 28/09» ba phản hồi review DB) | Context chuẩn, các khoảng trống tích hợp I01 «Đường ghi điểm»–I12 «Đồng thời và thời điểm nguồn». §9.6 «Ba phản hồi review DB và bài học thiết kế ngày 28/09»: yêu cầu review DB của khách hàng (hiệu ứng theo cấu hình công khai; chống ghi đè/xóa-tạo lại ô) là yêu cầu hành vi; cơ chế v2 là PROPOSED |
| FIG node | [File Figma của Movitation Works (MW)](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/%25E8%25B5%25A4%25E7%2582%25B9%25E5%2588%25A4%25E5%25AE%259A%25E5%25AF%25BE%25E5%25BF%259C?node-id=0-1), node `0:1` — nguồn hiện hành (R18 «đặc tả RC-001 v2» §13.2 «Tài liệu liên quan»), đã đối chiếu chỉ đọc ngày 29/09/2026. File cũ [Red-Score-UI-Mockup---Final](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-1631) chỉ là lịch sử v1 | Nhãn, bố cục, thông báo. Mọi node trong case là node file MW (`FIG MW 58:…`); mở bằng link file MW với `?node-id=58-…` (đổi `:` thành `-`). Node 45xx–47xx chỉ còn trong ghi chú "file cũ ghi …" để đối chiếu câu chữ cũ. Đặc tả v2 vẫn dẫn link file cũ; tra frame MW tương ứng theo tên chương/frame. Khác biệt chỉ về nhãn/bố cục ghi Notes, không FAIL. Ghi chú 「設計案」 (phương án thiết kế) = PROPOSED. Giá trị mẫu trên hình không phải mặc định sản phẩm |
| CODE file:hàm | Repo `docker-codeigniter/src`, HEAD `87d5a78d174`, đọc tĩnh trong giai đoạn phân tích (chưa chạy) | Chỉ chứng minh hiện trạng; không thay quyết định nghiệp vụ |
| RSD-AC AC-Gnn | [Tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) | AC-G01…AC-G40 «tiêu chí nghiệm thu: Quyền thao tác và phạm vi dữ liệu … Phạm vi từng đợt» lập từ R18 «đặc tả RC-001 v2»/QAC: là tiêu chí CONFIRMED, dùng để truy vết ([scope-and-approach.vi.md — AC mapping](scope-and-approach.vi.md#ac) «Tiêu chí nghiệm thu（RSD-AC）→ test case») và làm rõ oracle. Mục "Chi tiết thiết kế" = PROPOSED |
| RSD-DB §n | [Thiết kế DB v2](../database-design.vi.md) và `database-design.sql` | Thiết kế **đề xuất**, chưa review kỹ thuật, chưa thực thi DDL: tên bảng/cột, mã trạng thái, `reason_code`, giới hạn lưu trữ, cột `red_score_display_type`/`red_score_revision`, cơ chế thế hệ/phiên bản/khóa (§6 «Phương thức xử lý cập nhật đồng thời»), nơi lưu thiết lập đỏ của Trích xuất thành tích（成績抽出） trong JSON `grade_extract_conf.extract_setting` và của Công cụ phiếu điểm（通知表ツール） trong phần lưu bảng/điều kiện hiện có (§5.1 «Thiết lập hiển thị của Trích xuất thành tích（成績抽出）và Công cụ phiếu điểm（通知表ツール）», không thêm cột/bảng) = PROPOSED |
| RSD-TASK Task n | [Chia công việc v2](../split-tasks.vi.md) | URL màn, điểm nối code (bản repo mô tả theo trách nhiệm xử lý, không ghi đường dẫn file), đường đăng ký được chọn. Đoạn "Đề xuất" = PROPOSED |

Thứ tự khi khác nhau: QAC «Q&A nghiệp vụ đã xác nhận» → R18 «đặc tả RC-001 v2» (phần không phải đề xuất) → RSD-AC «tiêu chí nghiệm thu v2» (tiêu chí) → CTX «context chuẩn điểm đỏ» → RSD-DB «thiết kế DB v2 đề xuất»/RSD-TASK → Figma → code. **Khi Figma khác spec, bộ test không chọn bên**: ghi vào danh sách xung đột kèm câu hỏi cho người phụ trách ([scope-and-approach.vi.md — Xung đột](scope-and-approach.vi.md#conflicts) «Xung đột và khác biệt»); test case liên quan có trạng thái CONFLICT.

## 3. Nhãn trạng thái của test case

Cột **Status** trong các file test case là **độ chắc chắn của kết quả mong đợi**, không phải kết quả chạy.

| Nhãn | Ý nghĩa | Cách xử lý khi chạy |
| --- | --- | --- |
| CONFIRMED | Kết quả mong đợi lấy từ QAC «Q&A nghiệp vụ đã xác nhận», phần quy tắc của R18 «đặc tả RC-001 v2», hoặc tiêu chí AC-Gnn của RSD-AC «tiêu chí nghiệm thu v2» (không gồm mục "Chi tiết thiết kế"). Tiêu chí thuộc phần có thể nằm ngoài đợt phát hành (ví dụ công thức; phạm vi phát hành chưa chốt — R18 §13.1 «Điều kiện triển khai và kiểm chứng») chỉ chạy khi phần đó thuộc đợt; ngoài đợt ghi SKIPPED | Là tiêu chí PASS/FAIL |
| IMPLEMENTED | Hành vi hiện có đã xác minh qua code/UI, phải giữ nguyên | Là tiêu chí PASS/FAIL (hồi quy) |
| PROPOSED | Đề xuất thiết kế (R18 «đặc tả RC-001 v2» "Đề xuất thiết kế", Figma 「設計案」, mẫu AutoRating, RSD-DB «thiết kế DB v2 đề xuất», đoạn "Đề xuất"/"Chi tiết thiết kế" của RSD-TASK «bản chia công việc v2»/RSD-AC) | **Không phải must-pass.** Ghi nhận hành vi thực tế; lệch đề xuất → ghi Notes, không mở bug trừ khi đề xuất đã được duyệt |
| TBD | Chưa có quyết định | Không đánh giá PASS/FAIL cho tới khi có câu trả lời; có thể chạy để thu thập hiện trạng |
| CONFLICT | Nguồn mâu thuẫn (Figma ↔ spec hoặc Figma ↔ Figma) | Không đánh giá phần đang mâu thuẫn; chỉ đánh giá phần không tranh chấp ghi trong Expected |

Một case có thể gồm phần CONFIRMED và phần PROPOSED. Khi đó Status ghi nhãn của phần chính; 期待結果（Kết quả mong đợi） ghi rõ phần nào là PROPOSED.

Trạng thái chạy (NOT RUN / PASS / FAIL / BLOCKED / SKIPPED) chỉ nằm ở bảng chạy test ([scope-and-approach.vi.md — Run Log](scope-and-approach.vi.md) «Ghi kết quả», [scope-and-approach.vi.md — Run Log](scope-and-approach.vi.md#run-sheet) «Bảng chạy test»).

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
| Chức năng qua UI | Luồng cấu hình, trigger, ba đầu ra | [test-cases.vi.md](test-cases.vi.md) «Test case chức năng, quy tắc nghiệp vụ, validation và dữ…», [test-cases.vi.md](test-cases.vi.md) «Test case giao diện (UI)» |
| Quy tắc nghiệp vụ | Ưu tiên, nguồn, vòng đời kết quả, quyền | [test-cases.vi.md](test-cases.vi.md) «Test case chức năng, quy tắc nghiệp vụ, validation và dữ…» |
| Tính toán | Bảng giá trị: điển hình, min, max, biên −1/biên/biên +1, 0, rỗng, thập phân, làm tròn, số âm | [test-cases.vi.md](test-cases.vi.md) «Test case tính toán (CALC)» |
| Lỗi, trạng thái, biên | Sáu trạng thái trên đầu ra, lỗi kỹ thuật, request trực tiếp | [test-cases.vi.md](test-cases.vi.md) «Test case lỗi, trạng thái và trường hợp biên (ERR)» |
| Dữ liệu | SELECT / SHOW FULL COLUMNS trên DB local sau khi schema được thiết kế | [test-cases.vi.md — Data / Persistence](test-cases.vi.md#data) «Data / Persistence (DATA)» |
| Hồi quy | Chỉ chức năng dùng chung có căn cứ | [test-cases.vi.md](test-cases.vi.md) «Test case hồi quy (REG)» |

Kỹ thuật: phân vùng tương đương + giá trị biên cho input; bảng quyết định cho kết hợp hiệu ứng (công khai) và first-match (phiếu điểm); bảng chuyển trạng thái R18 «đặc tả RC-001 v2» §8.2 «Bảng chuyển trạng thái» cho vòng đời. Mỗi case là tập tối thiểu đủ để bác bỏ một quy tắc; biến thể dữ liệu được gom vào bảng trong cùng case thay vì nhân bản case.

## 6. Môi trường, tài khoản và dữ liệu

- **Môi trường:** build có tính năng điểm đỏ trên môi trường local (Docker `docker-codeigniter` + `docker-mysql`) hoặc staging được team cho phép ghi dữ liệu test. Staging chỉ dùng khi team cho phép; tài liệu không ghi URL môi trường.
- **Tài khoản/vai trò:** định nghĩa theo vai trò ở [test-data.vi.md — Vai trò](test-data.vi.md#roles) «Vai trò»; vai trò mặc định khi case không ghi: [§9](#conventions). Tài khoản và mật khẩu được cấp qua kênh được team duyệt (secret/biến môi trường); **không ghi mật khẩu, token, khóa vào tài liệu, CSV hoặc bằng chứng**.
- **Nguồn tổng hợp đã chốt (snapshot):** tính năng xác nhận tổng hợp thứ hạng（順位集計確定）chưa merge ([PR #57058](https://github.com/ednity/school-web/pull/57058) «PR thêm trạng thái xác nhận kết quả tổng hợp xếp hạng, còn mở»); R18 «đặc tả RC-001 v2» §5.5 «Chọn bản nguồn» cho phép dummy data. Case phụ thuộc snapshot ghi rõ "dummy data" trong bằng chứng cho tới khi tích hợp nguồn thật (R18 §13.1 «Điều kiện triển khai và kiểm chứng»).
- **DB:** có thiết kế đề xuất v2 `red_score_settings` / `red_score_results` và hai cột bổ sung trên bảng hiện hữu (RSD-DB «thiết kế DB v2 đề xuất»), chưa migrate. Case DATA viết câu SELECT theo thiết kế này; nếu schema cuối khác thì đổi câu SELECT, giữ kỳ vọng nghiệp vụ.

## 7. Điều kiện bắt đầu / kết thúc

**Bắt đầu chạy một nhóm case khi:**

1. Danh sách phạm vi đợt phát hành đã có (R18 «đặc tả RC-001 v2» §13.1 «Điều kiện triển khai và kiểm chứng») và QA lead đã đánh dấu case trong/ngoài đợt.
2. Build có tính năng được deploy lên môi trường test; dữ liệu theo [test-data.vi.md](test-data.vi.md) «Đặc tả dữ liệu test» đã chuẩn bị và reset được.
3. Các câu hỏi chặn ghi ở Notes của case đã có câu trả lời, hoặc case được chạy ở chế độ "ghi nhận hiện trạng" (không đánh giá PASS/FAIL).

**Kết thúc khi:**

1. Mọi case CONFIRMED/IMPLEMENTED trong phạm vi đợt có trạng thái PASS, FAIL (có Bug ID) hoặc BLOCKED/SKIPPED có lý do.
2. Mỗi case có bằng chứng theo [scope-and-approach.vi.md](scope-and-approach.vi.md) «Hướng dẫn thu thập bằng chứng»; thay đổi định dạng Excel/PDF có file thực, thay đổi bố cục có ảnh trước/sau, bảng/cột mới có ảnh SELECT/SHOW FULL COLUMNS.
3. Ma trận [scope-and-approach.vi.md — Traceability](scope-and-approach.vi.md) «Ma trận truy vết（Traceability Matrix）» được cập nhật: không còn tiêu chí nghiệm thu trong phạm vi đợt mà không có case đã chạy.

## 8. Rủi ro kiểm thử

| Rủi ro | Ảnh hưởng tới kiểm thử | Hướng xử lý |
| --- | --- | --- |
| Phạm vi phát hành chưa chốt (R18 «đặc tả RC-001 v2» §13.1 «Điều kiện triển khai và kiểm chứng») | Không biết case nào phải chạy | QA lead lọc theo danh sách phạm vi trước khi chạy |
| Chưa có snapshot thật (R18 «đặc tả RC-001 v2» §13.1 «Điều kiện triển khai và kiểm chứng») | Case nguồn đã chốt chỉ chứng minh trên dummy data | Chạy lại khi tích hợp nguồn thật |
| Schema DB mới là đề xuất | Câu SELECT có thể phải đổi khi migrate | Đối chiếu migration thật trước khi chạy case DATA |
| Khó tạo lỗi kỹ thuật/lỗi batch một phần | Case lỗi kỹ thuật có thể BLOCKED | Cần team dev hỗ trợ cách giả lập |
| Các khác biệt nhãn/bố cục Figma | Specification/Q&A là oracle; Figma chỉ tham khảo nhãn và bố cục |
| Figma hiện hành là file MW | File MW có thể tiếp tục thay đổi sau ngày đối chiếu | Trước khi chạy case UI: mở frame MW ghi trong chú thích, xem lại câu chữ; khác biệt mới ghi Notes, không FAIL |
| Cơ chế cập nhật đồng thời v2 chưa review, chưa thử hai kết nối (RSD-DB «thiết kế DB v2 đề xuất» §6.4 «Phạm vi kết nối và ví dụ kiểm tra») | Case cạnh tranh khó tái hiện; SELECT phiên bản có thể đổi | Đánh giá theo hành vi CONFIRMED (AC-G03 «Nhận diện ô điểm»/G22/G27); phần phiên bản là PROPOSED; không tái hiện được thì BLOCKED |
| Dữ liệu nhóm tham chiếu nhiều tổ hợp bật/tắt | Case nhóm tham chiếu có thể BLOCKED | Team dev hỗ trợ dựng TD-POP-01…06 «Thiết lập tổng hợp X: Thiết lập… … Học sinh học hai lớp cùng môn: S11…» |

<a id="conventions"></a>

## 9. Quy ước thực thi chung

Áp dụng cho mọi case khi case không ghi khác. Case có ghi vai trò, đầu ra hoặc cấu hình riêng thì làm theo case.

**Vai trò mặc định**

| Thao tác | Vai trò |
| --- | --- |
| Cấu hình quy tắc điểm đỏ, Thiết lập ô nhập（入力欄設定） | TD-ROLE-01 «Giáo viên có quyền sửa mục: Có quyền vào Thiết lập nhập điểm（成績入力設定） và…» |
| Đăng ký điểm trên màn hoặc bằng CSV; xem Trích xuất thành tích（成績抽出） để quan sát kết quả | TD-ROLE-09 «Giáo viên nhập điểm: Giáo viên phụ trách lớp G-A, G-B, G-C: có quyền…» |
| Thực hiện tổng hợp（集計実行） (nút xanh), Thực hiện tính toán tự động（自動算出実行） (nút cam) | TD-ROLE-03 «Người có quyền chạy hàng loạt: Có quyền thực hiện Thực hiện tổng…» |
| Cấu hình ba đầu ra | TD-ROLE-07 «Người phụ trách đầu ra: Có quyền Trích xuất thành tích（成績抽出）, Thiết lập…» |

**Nơi xem kết quả xét** — dùng cho các bước "xem kết quả", "xem Sxx", "xét/chạy lại":

1. **Đỏ / Không đỏ:** mở Trích xuất thành tích（成績抽出） (URL ở TD-ENV-05 «Đường dẫn màn (RSD-TASK): Thiết lập nhập…»), chọn mục và kỳ của case, dùng cấu hình TD-OUT-02 «Trích xuất chỉ ký hiệu: Lọc TẮT» (không lọc; ký hiệu `※` phía trước, `!` phía sau). Ô đỏ hiện `※<điểm>!`; ô không đỏ hiện điểm nguyên trạng. Chỉ xem sau khi lần xét tương ứng đã xong (lưu điểm thành công hoặc nút cam chạy xong).
2. **Bốn trạng thái không đánh dấu** — Chưa xét được, Không áp dụng, Không có điểm, Chưa từng xét — trên đầu ra trông giống Không đỏ. Khi 期待結果（Kết quả mong đợi） nêu một trong bốn trạng thái này, xác nhận thêm bằng SELECT `red_score_results` theo khóa của ô (TD-ENV-03 «Truy cập DB: Kết nối MySQL local, chỉ dùng SELECT / SHOW FULL COLUMNS…»; ánh xạ mã ở [TC-RS-DATA-003](test-cases.vi.md#tc-rs-data-003) là PROPOSED).
3. **"Ba đầu ra"** = Trích xuất như mục 1 (hoặc cấu hình trích xuất ghi trong case), màn Xác nhận thành tích（成績確認） của học sinh với TD-OUT-03 «Công khai: Hiệu ứng đỏ: `*` phía trước（前に「*」）», và PDF phiếu điểm với TD-OUT-04 «Phiếu điểm: Dòng Thiết lập điểm đỏ（赤点設定）: Ký tự phía trước（前に任意の文字） `※`».

**Bằng chứng mặc định:** "Ảnh Trích xuất" là ảnh màn Trích xuất thấy tên mục, kỳ, học sinh (che theo [scope-and-approach.vi.md](scope-and-approach.vi.md) «Hướng dẫn thu thập bằng chứng») và giá trị ô; mỗi lần xét hoặc mỗi cấu hình một ảnh. File Excel/PDF thật và ảnh SELECT theo §7.

**Tra nhanh mã dữ liệu hay dùng** (định nghĩa đầy đủ ở [test-data.vi.md](test-data.vi.md) «Đặc tả dữ liệu test»):

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

- **Test case viết bằng lời.** Điều kiện, Dữ liệu test, Thao tác, Kết quả mong đợi, Bằng chứng cần chụp, Sau khi chạy, Ghi chú và phần hồi quy gọi dữ liệu test, case liên quan, câu hỏi, xung đột… bằng tên, ví dụ “tài khoản giáo viên có quyền sửa mục”, “học sinh S01 (điểm 29)”, “quy tắc “Cố định 30” (dưới 30)”; chi tiết dữ liệu tra theo tên ở [test-data.vi.md](test-data.vi.md). Dòng Requirement ID và dòng Nguồn ghi lời trước, mã trong ngoặc để truy vết. Mã gốc của từng case nằm trong comment ẩn `<!-- Mã truy vết: … -->` dưới dòng Priority (không hiện khi xem Markdown, không có trong Excel/CSV), dùng cho ma trận traceability và coverage; khi thêm/bỏ dữ liệu test, câu hỏi hay case liên quan thì cập nhật comment này.
- Ngoài thân test case và phần mở đầu của tài liệu, mọi mã vẫn có nội dung ghi ngay sau mã trong ngoặc `« »`. Trong một ô hoặc một dòng, mã lặp lại chỉ ghi nội dung ở lần đầu; dải mã (`TD-STU-01…05`) ghi nhóm và nội dung mã đầu/cuối. Ô đầu của bảng định nghĩa mã không ghi thêm vì cả dòng đã là định nghĩa.
- **Requirement ID** nằm ở dòng Priority ｜ Status ｜ Requirement ID dưới tiêu đề case: tiêu chí nghiệm thu v2 bằng lời, mã AC-Gnn trong ngoặc; case không có tiêu chí tương ứng ghi mục đặc tả v2 (`đặc tả v2 mục x.y “tiêu đề”`). Ánh xạ đầy đủ ở [scope-and-approach.vi.md — Traceability](scope-and-approach.vi.md) «Ma trận truy vết（Traceability Matrix）».
- **Nguồn** (dòng `- Nguồn:` trong mục 補足（Bổ sung）; cột Source của CSV): tên tài liệu bằng lời, có link, mã tài liệu trong ngoặc (ví dụ `đặc tả v2 (R18) mục 4.1 “Điểm vào và trạng thái trống”`); câu hỏi Q&A, tiêu chí, node Figma cũng ghi lời trước, mã trong ngoặc. Dấu `;` bắt đầu tài liệu khác. Thứ tự ưu tiên nguồn: [§2](#2-nguồn-làm-chuẩn-và-thứ-tự-ưu-tiên).
- Số câu `Qn` là câu của QAC (Q&A nghiệp vụ đã xác nhận).
- Nội dung trong `« »` và hai file 11–12 được sinh tự động bằng công cụ nội bộ của team; công cụ không gắn `« »` vào thân test case. Tên hàm/file code trong dấu `` ` `` là định danh, giữ nguyên.




## Evidence và Run Log

# Hướng dẫn thu thập bằng chứng

Áp dụng cho mọi lần chạy test case trong bộ này. Mục tiêu: người review xác nhận được PASS/FAIL chỉ từ bằng chứng, mà bằng chứng không chứa bí mật hay dữ liệu cá nhân thật.

## 1. Quy tắc bắt buộc

1. **Không ghi bí mật:** không chụp hoặc dán mật khẩu, token, cookie phiên, header `Authorization`, khóa SSH, chuỗi kết nối DB. Tài khoản test được cấp riêng qua kênh team cho phép; trong bằng chứng chỉ ghi vai trò (ví dụ `TD-ROLE-03`), không ghi mật khẩu.
2. **Che dữ liệu cá nhân:** chỉ dùng dữ liệu test ([test-data.vi.md](test-data.vi.md) «Đặc tả dữ liệu test»). Nếu buộc phải chạy trên dữ liệu có tên học sinh thật, che tên, mã học sinh, email trước khi lưu. Không đưa dữ liệu staging ra ngoài phạm vi team.
3. **Không sửa bằng chứng:** chỉ được che (mask); không cắt bỏ phần cho thấy lỗi.
4. **Đúng loại bằng chứng:** case yêu cầu file Excel/PDF thực thì phải đính kèm file, ảnh HTML không thay được (R18 «đặc tả RC-001 v2» §9.3 «Xuất file», §11.3 «Lưu và xuất»). Case học sinh phải lấy từ màn học sinh, không dùng màn hồ sơ giáo viên (R18 §10.3 «Quyền, thời điểm và đầu ra liên quan»).
5. **Không ghi PASS/FAIL trước khi chạy.** Trạng thái ban đầu của mọi case là NOT RUN.

## 2. Loại bằng chứng

| Loại | Khi nào | Cách lấy | Lưu ý |
| --- | --- | --- | --- |
| Ảnh màn hình | Case UI, kết quả đầu ra trên màn | Chụp cả thanh URL (che tham số nhạy cảm nếu có) và vùng liên quan | Tên file theo mục 3 |
| File Excel | Trích xuất thành tích（成績抽出） | Tải file thực từ nút xuất | Mở kiểm ký hiệu, màu nền, ô rỗng, số liệu |
| File PDF | Phiếu điểm, PDF công khai | Tải file thực | Kiểm tràn ô, mất ký tự |
| Phản hồi API/request | Case quyền, giả mạo, dữ liệu client | Copy request/response từ DevTools | Xóa cookie, token, header xác thực trước khi lưu |
| Kết quả SELECT | Case DATA, xác nhận điểm/kết quả lưu | Chạy SELECT/SHOW trên DB local (TD-ENV-03 «Truy cập DB: Kết nối MySQL local, chỉ dùng SELECT / SHOW FULL COLUMNS…») | Chỉ đọc; ghi câu SELECT và kết quả; không ghi thông tin kết nối |
| Log job/truy vấn | Batch, xếp hàng, N+1 | Log ứng dụng hoặc log truy vấn của môi trường local | Chỉ trích đoạn liên quan |
| Baseline | Case REG và case so sánh trước/sau | Lấy trước khi tạo quy tắc đỏ hoặc trên build cũ | Ghi rõ build/commit và thời điểm |

## 3. Bằng chứng theo loại test

Chỉ lấy những gì case yêu cầu ở dòng Bằng chứng cần chụp (mục 補足（Bổ sung） của case; cột Evidence Required của bảng chạy); danh sách dưới là mức tối thiểu cho từng loại.

| Loại test | Cần lấy |
| --- | --- |
| UI（E） | Ảnh toàn màn; ảnh vùng/trạng thái liên quan; trước và sau thao tác nếu case so sánh |
| Tính toán（D） | Giá trị đầu vào (S, M, A/R, N, dấu, cách làm tròn); nguồn đầu vào (bản chốt/mới nhất, dummy hay thật); ngưỡng kỳ vọng và cách tính; kết quả thực tế; ảnh hoặc file xuất |
| API/request（F quyền, giả mạo） | Request (method, URL, payload) đã che bí mật; response; HTTP status; phần payload liên quan |
| Lỗi/trạng thái（F） | Điều kiện gây lỗi; thông báo hiển thị; trạng thái sau lỗi (điểm, kết quả); cách khôi phục và kết quả sau khi chạy lại |
| Dữ liệu（G） | Câu SELECT và kết quả trước/sau (khi có schema) |
| Hồi quy（H） | Baseline và kết quả sau cùng dữ liệu; chỉ ra điểm khác nếu có |
| Đầu ra（A, C） | File Excel/PDF thực hoặc ảnh màn học sinh, tùy đầu ra case yêu cầu |

## 4. Đặt tên và lưu trữ

- Tên file: `<Test Case ID>_<Run ID>_<bước>_<mô tả ngắn>.<ext>`, ví dụ `TC-RS-FUNC-025_R01_s3_excel.xlsx`.
- Run ID: `R01`, `R02`… theo từng vòng chạy; ghi ở bảng chạy (mục 6).
- Nơi lưu: **TBD** — dùng kho lưu trữ team cho phép (chưa có nguồn quy định). Không commit bằng chứng vào repository ứng dụng.
- Cột Evidence Link chỉ chứa đường dẫn tới kho đó; không nhúng ảnh có dữ liệu thật vào tài liệu này.

## 5. Ghi kết quả

| Status | Dùng khi |
| --- | --- |
| NOT RUN | Chưa chạy (mặc định) |
| PASS | Kết quả thực tế khớp toàn bộ 期待結果（Kết quả mong đợi） phần CONFIRMED/IMPLEMENTED |
| FAIL | Có ít nhất một điểm lệch với phần CONFIRMED/IMPLEMENTED; phải có Bug ID |
| BLOCKED | Không chạy được vì thiếu môi trường, dữ liệu hoặc cách giả lập |
| SKIPPED | Case ngoài phạm vi đợt phát hành (R18 «đặc tả RC-001 v2» §13.1 «Điều kiện triển khai và kiểm chứng») hoặc môi trường không có tính năng liên quan; ghi lý do |

Phần PROPOSED/TBD/CONFLICT trong 期待結果（Kết quả mong đợi）: ghi hành vi thực tế vào Actual Result và Notes, **không** làm case FAIL. Nếu phát hiện lệch ở phần này, ghi vào Notes thay vì mở bug.

Actual Result phải mô tả điều quan sát được (giá trị, dấu, thông báo), không chỉ ghi "OK".

<a id="run-sheet"></a>

## 6. Bảng chạy test

- Bảng chạy gồm Excel theo bố cục báo cáo test（テスト報告） ([test-case-report.xlsx](test-case-report.xlsx), lưu cùng thư mục này), CSV (để nhập Google Sheets) và Excel dạng bảng (hai loại sau không lưu trong repository). Tất cả được team sinh tự động từ các block case trong test-cases.vi.md; nếu thiết kế sai, sửa file case gốc rồi sinh lại, không sửa tay file Excel trong repository.
- Cột: Test Case ID, Title, Category, Priority, Status, Requirement ID, Source, Preconditions, Test Data, Steps, Expected Result, Evidence Required, Actual Result, Evidence Link, Bug ID, Tester, Executed At, Notes.
- Status mặc định NOT RUN. Mức chắc chắn (CONFIRMED/PROPOSED/…) nằm ở đầu Notes dạng `[Certainty: X]`. Với case REG, Notes có thêm Affected Area/Risk/Reason.
- Khi chạy: điền Status, Actual Result, Evidence Link, Bug ID, Tester, Executed At (định dạng `YYYY-MM-DD HH:MM` kèm múi giờ, ví dụ `+09:00`). Không sửa các cột thiết kế.
- Tester ghi tên hoặc mã người chạy, không ghi thông tin đăng nhập.
- Bản Excel theo bố cục báo cáo test: mỗi nhóm A–H một sheet; mỗi case gồm tiêu đề, dòng Priority ｜ Status ｜ Requirement ID, 前提条件（Điều kiện trước）, 操作（Thao tác）, 期待結果（Kết quả mong đợi）, 補足（Bổ sung）, 結果（Kết quả）, 証跡（Bằng chứng）. 結果 và 証跡 để trống; khi chạy, sao file ra bản của vòng chạy (không ghi kết quả vào bản trong repository), ghi Status (mục 5) và kết quả quan sát được vào 結果, dán ảnh đã che theo mục 1 vào 証跡. Bản có kết quả lưu ở nơi lưu bằng chứng (mục 4, **TBD**).




## Traceability

# Ma trận truy vết（Traceability Matrix）

File này được sinh tự động từ các block case trong [test-cases.vi.md](test-cases.vi.md) «Kịch bản kiểm thử (Test Scenario)». Nguồn yêu cầu: [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (AC-G01…AC-G40 «tiêu chí nghiệm thu: Quyền thao tác và phạm vi dữ liệu … Phạm vi từng đợt») và các mục của [đặc tả v2](../specification.vi.md). Trạng thái là mức chắc chắn của kết quả mong đợi, không phải kết quả test.

Cột Coverage: `Có (n; k chắc chắn)` = có n test case, trong đó k case có Status CONFIRMED/IMPLEMENTED; `Chưa có` = không có case (xem mục 2).

<a id="spec"></a>

## 1. Mục đặc tả v2 → test case

Case được tính cho một mục khi mục đó có trong Requirement ID hoặc trong phần đặc tả v2 của dòng Nguồn. Chương 13 (quyết định còn lại, cách dùng Figma) không tính độ phủ.

| Mục | Tiêu đề | Test Case IDs | Coverage |
| --- | --- | --- | --- |
| 1.1 | Mục tiêu | — | Chưa có |
| 1.2 | Phạm vi thiết kế | [TC-RS-FUNC-002](test-cases.vi.md#tc-rs-func-002), [TC-RS-BR-029](test-cases.vi.md#tc-rs-br-029) | Có (2; 2 chắc chắn) |
| 1.3 | Quyền sử dụng | [TC-RS-BR-031](test-cases.vi.md#tc-rs-br-031), [TC-RS-BR-032](test-cases.vi.md#tc-rs-br-032), [TC-RS-BR-033](test-cases.vi.md#tc-rs-br-033), [TC-RS-ERR-006](test-cases.vi.md#tc-rs-err-006), [TC-RS-ERR-007](test-cases.vi.md#tc-rs-err-007), [TC-RS-ERR-008](test-cases.vi.md#tc-rs-err-008), [TC-RS-REG-004](test-cases.vi.md#tc-rs-reg-004), [TC-RS-REG-015](test-cases.vi.md#tc-rs-reg-015) | Có (8; 7 chắc chắn) |
| 1.4 | Ranh giới giữa thiết kế đầy đủ và phạm vi triển khai | [TC-RS-UI-025](test-cases.vi.md#tc-rs-ui-025) | Có (1; 1 chắc chắn) |
| 2.1 | Các đại lượng | — | Chưa có |
| 2.2 | Một ô điểm được nhận diện như thế nào? | [TC-RS-BR-030](test-cases.vi.md#tc-rs-br-030), [TC-RS-BR-037](test-cases.vi.md#tc-rs-br-037), [TC-RS-DATA-002](test-cases.vi.md#tc-rs-data-002), [TC-RS-ERR-015](test-cases.vi.md#tc-rs-err-015) | Có (4; 4 chắc chắn) |
| 2.3 | Điểm được đưa vào xét | [TC-RS-BR-012](test-cases.vi.md#tc-rs-br-012), [TC-RS-BR-013](test-cases.vi.md#tc-rs-br-013), [TC-RS-BR-014](test-cases.vi.md#tc-rs-br-014), [TC-RS-CALC-002](test-cases.vi.md#tc-rs-calc-002), [TC-RS-CALC-030](test-cases.vi.md#tc-rs-calc-030) | Có (5; 5 chắc chắn) |
| 2.4 | Phân giải điểm tối đa | [TC-RS-CALC-011](test-cases.vi.md#tc-rs-calc-011), [TC-RS-CALC-012](test-cases.vi.md#tc-rs-calc-012) | Có (2; 2 chắc chắn) |
| 3 | Bản đồ màn hình và luồng thao tác | [TC-RS-FUNC-004](test-cases.vi.md#tc-rs-func-004), [TC-RS-UI-009](test-cases.vi.md#tc-rs-ui-009) | Có (2; 2 chắc chắn) |
| 4.1 | Điểm vào và trạng thái trống | [TC-RS-FUNC-001](test-cases.vi.md#tc-rs-func-001), [TC-RS-FUNC-002](test-cases.vi.md#tc-rs-func-002), [TC-RS-BR-019](test-cases.vi.md#tc-rs-br-019), [TC-RS-DATA-004](test-cases.vi.md#tc-rs-data-004), [TC-RS-UI-001](test-cases.vi.md#tc-rs-ui-001), [TC-RS-UI-002](test-cases.vi.md#tc-rs-ui-002), [TC-RS-UI-005](test-cases.vi.md#tc-rs-ui-005), [TC-RS-REG-017](test-cases.vi.md#tc-rs-reg-017) | Có (8; 5 chắc chắn) |
| 4.2 | Nội dung một dòng | [TC-RS-FUNC-004](test-cases.vi.md#tc-rs-func-004), [TC-RS-FUNC-005](test-cases.vi.md#tc-rs-func-005), [TC-RS-FUNC-033](test-cases.vi.md#tc-rs-func-033), [TC-RS-VAL-014](test-cases.vi.md#tc-rs-val-014), [TC-RS-UI-002](test-cases.vi.md#tc-rs-ui-002), [TC-RS-UI-004](test-cases.vi.md#tc-rs-ui-004) | Có (6; 3 chắc chắn) |
| 4.3 | Chọn quy tắc | [TC-RS-BR-001](test-cases.vi.md#tc-rs-br-001), [TC-RS-BR-002](test-cases.vi.md#tc-rs-br-002), [TC-RS-BR-003](test-cases.vi.md#tc-rs-br-003), [TC-RS-BR-036](test-cases.vi.md#tc-rs-br-036) | Có (4; 4 chắc chắn) |
| 4.4 | Lưu, đổi thứ tự và xóa | [TC-RS-FUNC-004](test-cases.vi.md#tc-rs-func-004), [TC-RS-FUNC-005](test-cases.vi.md#tc-rs-func-005), [TC-RS-FUNC-006](test-cases.vi.md#tc-rs-func-006), [TC-RS-FUNC-007](test-cases.vi.md#tc-rs-func-007), [TC-RS-FUNC-014](test-cases.vi.md#tc-rs-func-014), [TC-RS-BR-015](test-cases.vi.md#tc-rs-br-015), [TC-RS-BR-019](test-cases.vi.md#tc-rs-br-019), [TC-RS-VAL-016](test-cases.vi.md#tc-rs-val-016), [TC-RS-UI-006](test-cases.vi.md#tc-rs-ui-006) | Có (9; 7 chắc chắn) |
| 5.1 | Đối tượng áp dụng | [TC-RS-FUNC-008](test-cases.vi.md#tc-rs-func-008), [TC-RS-BR-004](test-cases.vi.md#tc-rs-br-004), [TC-RS-BR-041](test-cases.vi.md#tc-rs-br-041), [TC-RS-BR-005](test-cases.vi.md#tc-rs-br-005), [TC-RS-BR-035](test-cases.vi.md#tc-rs-br-035), [TC-RS-VAL-014](test-cases.vi.md#tc-rs-val-014), [TC-RS-UI-008](test-cases.vi.md#tc-rs-ui-008) | Có (7; 5 chắc chắn) |
| 5.2 | Điều kiện dựa trên trung bình | [TC-RS-FUNC-009](test-cases.vi.md#tc-rs-func-009), [TC-RS-BR-041](test-cases.vi.md#tc-rs-br-041), [TC-RS-VAL-022](test-cases.vi.md#tc-rs-val-022), [TC-RS-CALC-022](test-cases.vi.md#tc-rs-calc-022), [TC-RS-CALC-023](test-cases.vi.md#tc-rs-calc-023) | Có (5; 4 chắc chắn) |
| 5.3 | Tỷ lệ nhóm — kế thừa kết quả tổng hợp thứ hạng hiện có | [TC-RS-FUNC-010](test-cases.vi.md#tc-rs-func-010), [TC-RS-BR-028](test-cases.vi.md#tc-rs-br-028), [TC-RS-CALC-024](test-cases.vi.md#tc-rs-calc-024), [TC-RS-CALC-025](test-cases.vi.md#tc-rs-calc-025), [TC-RS-CALC-031](test-cases.vi.md#tc-rs-calc-031), [TC-RS-CALC-032](test-cases.vi.md#tc-rs-calc-032), [TC-RS-UI-010](test-cases.vi.md#tc-rs-ui-010) | Có (7; 5 chắc chắn) |
| 5.4 | Bộ thông tin nguồn | [TC-RS-FUNC-009](test-cases.vi.md#tc-rs-func-009), [TC-RS-FUNC-034](test-cases.vi.md#tc-rs-func-034), [TC-RS-FUNC-036](test-cases.vi.md#tc-rs-func-036), [TC-RS-BR-006](test-cases.vi.md#tc-rs-br-006), [TC-RS-BR-040](test-cases.vi.md#tc-rs-br-040), [TC-RS-VAL-024](test-cases.vi.md#tc-rs-val-024), [TC-RS-UI-009](test-cases.vi.md#tc-rs-ui-009) | Có (7; 7 chắc chắn) |
| 5.5 | Chọn bản nguồn | [TC-RS-BR-007](test-cases.vi.md#tc-rs-br-007), [TC-RS-BR-008](test-cases.vi.md#tc-rs-br-008), [TC-RS-BR-009](test-cases.vi.md#tc-rs-br-009), [TC-RS-BR-010](test-cases.vi.md#tc-rs-br-010), [TC-RS-BR-036](test-cases.vi.md#tc-rs-br-036), [TC-RS-BR-040](test-cases.vi.md#tc-rs-br-040), [TC-RS-CALC-026](test-cases.vi.md#tc-rs-calc-026), [TC-RS-CALC-027](test-cases.vi.md#tc-rs-calc-027), [TC-RS-CALC-031](test-cases.vi.md#tc-rs-calc-031), [TC-RS-CALC-032](test-cases.vi.md#tc-rs-calc-032), [TC-RS-UI-009](test-cases.vi.md#tc-rs-ui-009), [TC-RS-REG-005](test-cases.vi.md#tc-rs-reg-005) | Có (12; 11 chắc chắn) |
| 5.6 | Khi nào không cần nguồn? | [TC-RS-FUNC-011](test-cases.vi.md#tc-rs-func-011), [TC-RS-BR-011](test-cases.vi.md#tc-rs-br-011), [TC-RS-VAL-024](test-cases.vi.md#tc-rs-val-024), [TC-RS-UI-013](test-cases.vi.md#tc-rs-ui-013), [TC-RS-UI-014](test-cases.vi.md#tc-rs-ui-014), [TC-RS-UI-015](test-cases.vi.md#tc-rs-ui-015) | Có (6; 4 chắc chắn) |
| 6.1 | Thành phần chung của màn ngưỡng | [TC-RS-FUNC-011](test-cases.vi.md#tc-rs-func-011), [TC-RS-FUNC-013](test-cases.vi.md#tc-rs-func-013), [TC-RS-VAL-004](test-cases.vi.md#tc-rs-val-004), [TC-RS-VAL-005](test-cases.vi.md#tc-rs-val-005), [TC-RS-CALC-001](test-cases.vi.md#tc-rs-calc-001), [TC-RS-CALC-002](test-cases.vi.md#tc-rs-calc-002), [TC-RS-CALC-003](test-cases.vi.md#tc-rs-calc-003), [TC-RS-UI-011](test-cases.vi.md#tc-rs-ui-011), [TC-RS-UI-012](test-cases.vi.md#tc-rs-ui-012) | Có (9; 6 chắc chắn) |
| 6.2 | Ngưỡng cố định | [TC-RS-VAL-001](test-cases.vi.md#tc-rs-val-001), [TC-RS-VAL-002](test-cases.vi.md#tc-rs-val-002), [TC-RS-VAL-003](test-cases.vi.md#tc-rs-val-003), [TC-RS-VAL-004](test-cases.vi.md#tc-rs-val-004), [TC-RS-VAL-006](test-cases.vi.md#tc-rs-val-006), [TC-RS-CALC-001](test-cases.vi.md#tc-rs-calc-001), [TC-RS-CALC-004](test-cases.vi.md#tc-rs-calc-004), [TC-RS-CALC-010](test-cases.vi.md#tc-rs-calc-010), [TC-RS-ERR-009](test-cases.vi.md#tc-rs-err-009) | Có (9; 9 chắc chắn) |
| 6.3 | Tỷ lệ điểm tối đa | [TC-RS-CALC-005](test-cases.vi.md#tc-rs-calc-005), [TC-RS-CALC-006](test-cases.vi.md#tc-rs-calc-006), [TC-RS-CALC-007](test-cases.vi.md#tc-rs-calc-007), [TC-RS-CALC-008](test-cases.vi.md#tc-rs-calc-008), [TC-RS-CALC-009](test-cases.vi.md#tc-rs-calc-009), [TC-RS-CALC-010](test-cases.vi.md#tc-rs-calc-010), [TC-RS-CALC-012](test-cases.vi.md#tc-rs-calc-012), [TC-RS-UI-014](test-cases.vi.md#tc-rs-ui-014), [TC-RS-ERR-009](test-cases.vi.md#tc-rs-err-009) | Có (9; 8 chắc chắn) |
| 6.4 | Công thức dùng trung bình | [TC-RS-FUNC-012](test-cases.vi.md#tc-rs-func-012), [TC-RS-VAL-008](test-cases.vi.md#tc-rs-val-008), [TC-RS-VAL-009](test-cases.vi.md#tc-rs-val-009), [TC-RS-VAL-010](test-cases.vi.md#tc-rs-val-010), [TC-RS-VAL-011](test-cases.vi.md#tc-rs-val-011), [TC-RS-VAL-012](test-cases.vi.md#tc-rs-val-012), [TC-RS-VAL-013](test-cases.vi.md#tc-rs-val-013), [TC-RS-VAL-020](test-cases.vi.md#tc-rs-val-020), [TC-RS-DATA-005](test-cases.vi.md#tc-rs-data-005), [TC-RS-CALC-013](test-cases.vi.md#tc-rs-calc-013), [TC-RS-CALC-015](test-cases.vi.md#tc-rs-calc-015), [TC-RS-CALC-021](test-cases.vi.md#tc-rs-calc-021), [TC-RS-UI-015](test-cases.vi.md#tc-rs-ui-015), [TC-RS-UI-016](test-cases.vi.md#tc-rs-ui-016), [TC-RS-ERR-009](test-cases.vi.md#tc-rs-err-009) | Có (15; 12 chắc chắn) |
| 6.5 | Xử lý phần lẻ | [TC-RS-VAL-007](test-cases.vi.md#tc-rs-val-007), [TC-RS-CALC-007](test-cases.vi.md#tc-rs-calc-007), [TC-RS-CALC-014](test-cases.vi.md#tc-rs-calc-014), [TC-RS-CALC-019](test-cases.vi.md#tc-rs-calc-019), [TC-RS-CALC-020](test-cases.vi.md#tc-rs-calc-020), [TC-RS-UI-014](test-cases.vi.md#tc-rs-ui-014) | Có (6; 3 chắc chắn) |
| 6.6 | Ngưỡng âm và cảnh báo biên | [TC-RS-VAL-019](test-cases.vi.md#tc-rs-val-019), [TC-RS-CALC-002](test-cases.vi.md#tc-rs-calc-002), [TC-RS-CALC-009](test-cases.vi.md#tc-rs-calc-009), [TC-RS-CALC-016](test-cases.vi.md#tc-rs-calc-016), [TC-RS-CALC-017](test-cases.vi.md#tc-rs-calc-017), [TC-RS-CALC-018](test-cases.vi.md#tc-rs-calc-018), [TC-RS-CALC-030](test-cases.vi.md#tc-rs-calc-030) | Có (7; 7 chắc chắn) |
| 6.7 | Đổi loại ngưỡng và đổi toán hạng | [TC-RS-VAL-020](test-cases.vi.md#tc-rs-val-020), [TC-RS-VAL-021](test-cases.vi.md#tc-rs-val-021) | Có (2; 1 chắc chắn) |
| 6.8 | Yêu cầu độ chính xác | [TC-RS-VAL-006](test-cases.vi.md#tc-rs-val-006), [TC-RS-VAL-007](test-cases.vi.md#tc-rs-val-007), [TC-RS-VAL-013](test-cases.vi.md#tc-rs-val-013), [TC-RS-VAL-023](test-cases.vi.md#tc-rs-val-023), [TC-RS-DATA-001](test-cases.vi.md#tc-rs-data-001), [TC-RS-CALC-003](test-cases.vi.md#tc-rs-calc-003), [TC-RS-CALC-028](test-cases.vi.md#tc-rs-calc-028), [TC-RS-CALC-029](test-cases.vi.md#tc-rs-calc-029), [TC-RS-ERR-009](test-cases.vi.md#tc-rs-err-009) | Có (9; 6 chắc chắn) |
| 7.1 | Trình tự cho một ô | [TC-RS-FUNC-032](test-cases.vi.md#tc-rs-func-032), [TC-RS-BR-020](test-cases.vi.md#tc-rs-br-020), [TC-RS-BR-027](test-cases.vi.md#tc-rs-br-027), [TC-RS-DATA-002](test-cases.vi.md#tc-rs-data-002), [TC-RS-DATA-005](test-cases.vi.md#tc-rs-data-005), [TC-RS-REG-001](test-cases.vi.md#tc-rs-reg-001) | Có (6; 6 chắc chắn) |
| 7.2 | Bảng sự kiện | [TC-RS-FUNC-016](test-cases.vi.md#tc-rs-func-016), [TC-RS-FUNC-017](test-cases.vi.md#tc-rs-func-017), [TC-RS-FUNC-018](test-cases.vi.md#tc-rs-func-018), [TC-RS-FUNC-021](test-cases.vi.md#tc-rs-func-021), [TC-RS-FUNC-035](test-cases.vi.md#tc-rs-func-035), [TC-RS-BR-015](test-cases.vi.md#tc-rs-br-015), [TC-RS-BR-020](test-cases.vi.md#tc-rs-br-020), [TC-RS-BR-021](test-cases.vi.md#tc-rs-br-021), [TC-RS-BR-024](test-cases.vi.md#tc-rs-br-024), [TC-RS-BR-037](test-cases.vi.md#tc-rs-br-037), [TC-RS-UI-018](test-cases.vi.md#tc-rs-ui-018), [TC-RS-ERR-016](test-cases.vi.md#tc-rs-err-016), [TC-RS-REG-003](test-cases.vi.md#tc-rs-reg-003) | Có (13; 12 chắc chắn) |
| 7.3 | Thay đổi điểm tối đa | [TC-RS-FUNC-019](test-cases.vi.md#tc-rs-func-019), [TC-RS-FUNC-020](test-cases.vi.md#tc-rs-func-020), [TC-RS-BR-022](test-cases.vi.md#tc-rs-br-022), [TC-RS-BR-037](test-cases.vi.md#tc-rs-br-037), [TC-RS-ERR-004](test-cases.vi.md#tc-rs-err-004), [TC-RS-ERR-015](test-cases.vi.md#tc-rs-err-015), [TC-RS-REG-013](test-cases.vi.md#tc-rs-reg-013) | Có (7; 7 chắc chắn) |
| 7.4 | Quy trình vận hành khi dùng trung bình/tỷ lệ nhóm | [TC-RS-FUNC-015](test-cases.vi.md#tc-rs-func-015), [TC-RS-BR-007](test-cases.vi.md#tc-rs-br-007), [TC-RS-BR-034](test-cases.vi.md#tc-rs-br-034), [TC-RS-REG-004](test-cases.vi.md#tc-rs-reg-004), [TC-RS-REG-005](test-cases.vi.md#tc-rs-reg-005) | Có (5; 5 chắc chắn) |
| 7.5 | Phạm vi một lượt và thứ tự hoàn tất | [TC-RS-DATA-013](test-cases.vi.md#tc-rs-data-013), [TC-RS-ERR-011](test-cases.vi.md#tc-rs-err-011), [TC-RS-ERR-018](test-cases.vi.md#tc-rs-err-018), [TC-RS-ERR-019](test-cases.vi.md#tc-rs-err-019), [TC-RS-REG-016](test-cases.vi.md#tc-rs-reg-016) | Có (5; 4 chắc chắn) |
| 8.1 | Các trạng thái phải phân biệt | [TC-RS-BR-002](test-cases.vi.md#tc-rs-br-002), [TC-RS-BR-014](test-cases.vi.md#tc-rs-br-014), [TC-RS-DATA-003](test-cases.vi.md#tc-rs-data-003), [TC-RS-ERR-001](test-cases.vi.md#tc-rs-err-001) | Có (4; 4 chắc chắn) |
| 8.2 | Bảng chuyển trạng thái | [TC-RS-BR-015](test-cases.vi.md#tc-rs-br-015), [TC-RS-BR-016](test-cases.vi.md#tc-rs-br-016), [TC-RS-BR-017](test-cases.vi.md#tc-rs-br-017), [TC-RS-BR-018](test-cases.vi.md#tc-rs-br-018), [TC-RS-BR-019](test-cases.vi.md#tc-rs-br-019), [TC-RS-BR-020](test-cases.vi.md#tc-rs-br-020), [TC-RS-DATA-003](test-cases.vi.md#tc-rs-data-003), [TC-RS-ERR-016](test-cases.vi.md#tc-rs-err-016) | Có (8; 8 chắc chắn) |
| 8.3 | Không tạo được ngưỡng hợp lệ | [TC-RS-BR-009](test-cases.vi.md#tc-rs-br-009), [TC-RS-BR-017](test-cases.vi.md#tc-rs-br-017), [TC-RS-CALC-010](test-cases.vi.md#tc-rs-calc-010), [TC-RS-CALC-021](test-cases.vi.md#tc-rs-calc-021), [TC-RS-CALC-031](test-cases.vi.md#tc-rs-calc-031) | Có (5; 5 chắc chắn) |
| 8.4 | Lỗi kỹ thuật và thông báo | [TC-RS-BR-025](test-cases.vi.md#tc-rs-br-025), [TC-RS-VAL-016](test-cases.vi.md#tc-rs-val-016), [TC-RS-UI-017](test-cases.vi.md#tc-rs-ui-017), [TC-RS-UI-019](test-cases.vi.md#tc-rs-ui-019), [TC-RS-ERR-002](test-cases.vi.md#tc-rs-err-002), [TC-RS-ERR-003](test-cases.vi.md#tc-rs-err-003), [TC-RS-ERR-004](test-cases.vi.md#tc-rs-err-004), [TC-RS-ERR-005](test-cases.vi.md#tc-rs-err-005), [TC-RS-REG-008](test-cases.vi.md#tc-rs-reg-008), [TC-RS-REG-016](test-cases.vi.md#tc-rs-reg-016) | Có (10; 8 chắc chắn) |
| 9.1 | Thiết lập | [TC-RS-FUNC-022](test-cases.vi.md#tc-rs-func-022), [TC-RS-FUNC-023](test-cases.vi.md#tc-rs-func-023), [TC-RS-FUNC-024](test-cases.vi.md#tc-rs-func-024), [TC-RS-VAL-017](test-cases.vi.md#tc-rs-val-017), [TC-RS-DATA-007](test-cases.vi.md#tc-rs-data-007), [TC-RS-UI-020](test-cases.vi.md#tc-rs-ui-020), [TC-RS-REG-006](test-cases.vi.md#tc-rs-reg-006) | Có (7; 6 chắc chắn) |
| 9.2 | Kết quả và ví dụ | [TC-RS-FUNC-023](test-cases.vi.md#tc-rs-func-023), [TC-RS-FUNC-024](test-cases.vi.md#tc-rs-func-024), [TC-RS-ERR-001](test-cases.vi.md#tc-rs-err-001), [TC-RS-ERR-013](test-cases.vi.md#tc-rs-err-013), [TC-RS-REG-006](test-cases.vi.md#tc-rs-reg-006) | Có (5; 4 chắc chắn) |
| 9.3 | Xuất file | [TC-RS-FUNC-025](test-cases.vi.md#tc-rs-func-025), [TC-RS-BR-024](test-cases.vi.md#tc-rs-br-024), [TC-RS-ERR-010](test-cases.vi.md#tc-rs-err-010), [TC-RS-REG-006](test-cases.vi.md#tc-rs-reg-006) | Có (4; 4 chắc chắn) |
| 10.1 | Phạm vi và tùy chọn | [TC-RS-FUNC-026](test-cases.vi.md#tc-rs-func-026), [TC-RS-FUNC-037](test-cases.vi.md#tc-rs-func-037), [TC-RS-BR-019](test-cases.vi.md#tc-rs-br-019), [TC-RS-DATA-007](test-cases.vi.md#tc-rs-data-007), [TC-RS-DATA-012](test-cases.vi.md#tc-rs-data-012), [TC-RS-UI-022](test-cases.vi.md#tc-rs-ui-022), [TC-RS-UI-023](test-cases.vi.md#tc-rs-ui-023), [TC-RS-UI-026](test-cases.vi.md#tc-rs-ui-026), [TC-RS-REG-007](test-cases.vi.md#tc-rs-reg-007) | Có (9; 7 chắc chắn) |
| 10.2 | Kết hợp điểm dự kiến và điểm đỏ | [TC-RS-FUNC-027](test-cases.vi.md#tc-rs-func-027), [TC-RS-REG-008](test-cases.vi.md#tc-rs-reg-008) | Có (2; 2 chắc chắn) |
| 10.3 | Quyền, thời điểm và đầu ra liên quan | [TC-RS-FUNC-028](test-cases.vi.md#tc-rs-func-028), [TC-RS-BR-024](test-cases.vi.md#tc-rs-br-024), [TC-RS-ERR-001](test-cases.vi.md#tc-rs-err-001), [TC-RS-REG-007](test-cases.vi.md#tc-rs-reg-007), [TC-RS-REG-008](test-cases.vi.md#tc-rs-reg-008), [TC-RS-REG-015](test-cases.vi.md#tc-rs-reg-015) | Có (6; 6 chắc chắn) |
| 11.1 | Tùy chọn hiển thị đỏ | [TC-RS-FUNC-029](test-cases.vi.md#tc-rs-func-029), [TC-RS-FUNC-031](test-cases.vi.md#tc-rs-func-031), [TC-RS-VAL-018](test-cases.vi.md#tc-rs-val-018), [TC-RS-DATA-007](test-cases.vi.md#tc-rs-data-007), [TC-RS-REG-009](test-cases.vi.md#tc-rs-reg-009), [TC-RS-REG-010](test-cases.vi.md#tc-rs-reg-010) | Có (6; 6 chắc chắn) |
| 11.2 | Thứ tự và điều kiện khớp đầu tiên | [TC-RS-FUNC-030](test-cases.vi.md#tc-rs-func-030), [TC-RS-ERR-001](test-cases.vi.md#tc-rs-err-001) | Có (2; 2 chắc chắn) |
| 11.3 | Lưu và xuất | [TC-RS-FUNC-031](test-cases.vi.md#tc-rs-func-031), [TC-RS-DATA-010](test-cases.vi.md#tc-rs-data-010), [TC-RS-REG-010](test-cases.vi.md#tc-rs-reg-010) | Có (3; 3 chắc chắn) |
| 12.1 | Dữ liệu cấu hình và kết quả cần quản lý | [TC-RS-DATA-008](test-cases.vi.md#tc-rs-data-008), [TC-RS-DATA-011](test-cases.vi.md#tc-rs-data-011), [TC-RS-DATA-013](test-cases.vi.md#tc-rs-data-013), [TC-RS-ERR-017](test-cases.vi.md#tc-rs-err-017) | Có (4; 2 chắc chắn) |
| 12.2 | Điểm tích hợp chính | [TC-RS-FUNC-018](test-cases.vi.md#tc-rs-func-018), [TC-RS-FUNC-021](test-cases.vi.md#tc-rs-func-021), [TC-RS-DATA-004](test-cases.vi.md#tc-rs-data-004), [TC-RS-ERR-010](test-cases.vi.md#tc-rs-err-010), [TC-RS-REG-001](test-cases.vi.md#tc-rs-reg-001), [TC-RS-REG-002](test-cases.vi.md#tc-rs-reg-002), [TC-RS-REG-003](test-cases.vi.md#tc-rs-reg-003), [TC-RS-REG-005](test-cases.vi.md#tc-rs-reg-005), [TC-RS-REG-014](test-cases.vi.md#tc-rs-reg-014), [TC-RS-REG-017](test-cases.vi.md#tc-rs-reg-017) | Có (10; 10 chắc chắn) |
| 12.3 | Không chuyển đổi dữ liệu đỏ cũ | [TC-RS-DATA-011](test-cases.vi.md#tc-rs-data-011) | Có (1; 1 chắc chắn) |
| 12.4 | Sao chép, năm mới, nhập/xuất và khôi phục | [TC-RS-ERR-015](test-cases.vi.md#tc-rs-err-015) | Có (1; 1 chắc chắn) |

<a id="uncovered"></a>

## 2. Tiêu chí và mục đặc tả chưa có test case

| Nguồn | Tiêu đề |
| --- | --- |
| AC-G38 | Bảo toàn điểm đỏ cũ |
| Đặc tả v2 mục 1.1 | Mục tiêu |
| Đặc tả v2 mục 2.1 | Các đại lượng |

## 3. Test case → tiêu chí, mục đặc tả và kịch bản

| Test case | Category | Status | Priority | Tiêu chí nghiệm thu | Mục đặc tả v2 | Scenario |
| --- | --- | --- | --- | --- | --- | --- |
| [TC-RS-FUNC-001](test-cases.vi.md#tc-rs-func-001) | A. Functional | CONFIRMED | TBD | AC-G02 «Kiểu điểm được hỗ trợ» | 4.1 | TS-RS-001 «Quản lý danh sách quy tắc đỏ của một mục» |
| [TC-RS-FUNC-002](test-cases.vi.md#tc-rs-func-002) | A. Functional | CONFIRMED | TBD | AC-G02 «Kiểu điểm được hỗ trợ», AC-G40 «Phạm vi từng đợt» | 1.2, 4.1 | TS-RS-001 «Quản lý danh sách quy tắc đỏ của một mục», TS-RS-017 «Phạm vi phát hành» |
| [TC-RS-FUNC-004](test-cases.vi.md#tc-rs-func-004) | A. Functional | CONFIRMED | TBD | AC-G04 «Lưu và mở lại nhiều thiết lập» | 3, 4.2, 4.4 | TS-RS-001 «Quản lý danh sách quy tắc đỏ của một mục», TS-RS-019 «Luồng đầu–cuối（end-to-end）» |
| [TC-RS-FUNC-005](test-cases.vi.md#tc-rs-func-005) | A. Functional | CONFIRMED | TBD | AC-G04 «Lưu và mở lại nhiều thiết lập» | 4.2, 4.4 | TS-RS-001 «Quản lý danh sách quy tắc đỏ của một mục» |
| [TC-RS-FUNC-006](test-cases.vi.md#tc-rs-func-006) | A. Functional | CONFIRMED | TBD | AC-G04 «Lưu và mở lại nhiều thiết lập» | 4.4 | TS-RS-001 «Quản lý danh sách quy tắc đỏ của một mục» |
| [TC-RS-FUNC-007](test-cases.vi.md#tc-rs-func-007) | A. Functional | CONFIRMED | TBD | AC-G04 «Lưu và mở lại nhiều thiết lập» | 4.4 | TS-RS-001 «Quản lý danh sách quy tắc đỏ của một mục» |
| [TC-RS-FUNC-008](test-cases.vi.md#tc-rs-func-008) | A. Functional | CONFIRMED | TBD | AC-G05 «Đối tượng áp dụng và nhu cầu nguồn» | 5.1 | TS-RS-002 «Điều kiện áp dụng» |
| [TC-RS-FUNC-009](test-cases.vi.md#tc-rs-func-009) | A. Functional | CONFIRMED | TBD | AC-G12 «Đúng phạm vi tham chiếu» | 5.2, 5.4 | TS-RS-002 «Điều kiện áp dụng» |
| [TC-RS-FUNC-010](test-cases.vi.md#tc-rs-func-010) | A. Functional | CONFIRMED | TBD | AC-G12 «Đúng phạm vi tham chiếu» | 5.3 | TS-RS-002 «Điều kiện áp dụng» |
| [TC-RS-FUNC-011](test-cases.vi.md#tc-rs-func-011) | A. Functional | CONFIRMED | TBD | — | 5.6, 6.1 | TS-RS-003 «Ngưỡng điểm cố định» |
| [TC-RS-FUNC-012](test-cases.vi.md#tc-rs-func-012) | A. Functional | CONFIRMED | TBD | AC-G16 «Công thức theo dòng và phần lẻ» | 6.4 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-FUNC-013](test-cases.vi.md#tc-rs-func-013) | A. Functional | CONFIRMED | TBD | — | 6.1 | TS-RS-003 «Ngưỡng điểm cố định» |
| [TC-RS-FUNC-014](test-cases.vi.md#tc-rs-func-014) | A. Functional | PROPOSED | TBD | — | 4.4 | TS-RS-001 «Quản lý danh sách quy tắc đỏ của một mục» |
| [TC-RS-FUNC-015](test-cases.vi.md#tc-rs-func-015) | A. Functional | CONFIRMED | Cao | AC-G25 «Thứ tự đánh giá tương đối» | 7.4 | TS-RS-007 «Nguồn trung bình và tỷ lệ nhóm» |
| [TC-RS-FUNC-016](test-cases.vi.md#tc-rs-func-016) | A. Functional | CONFIRMED | Cao | AC-G23 «Bao phủ đường đăng ký và chạy lại» | 7.2 | TS-RS-009 «Thời điểm xét và vòng đời kết quả», TS-RS-019 «Luồng đầu–cuối（end-to-end）» |
| [TC-RS-FUNC-017](test-cases.vi.md#tc-rs-func-017) | A. Functional | CONFIRMED | Cao | AC-G23 «Bao phủ đường đăng ký và chạy lại» | 7.2 | TS-RS-009 «Thời điểm xét và vòng đời kết quả» |
| [TC-RS-FUNC-018](test-cases.vi.md#tc-rs-func-018) | A. Functional | CONFIRMED | Cao | AC-G23 «Bao phủ đường đăng ký và chạy lại» | 7.2, 12.2 | TS-RS-009 «Thời điểm xét và vòng đời kết quả» |
| [TC-RS-FUNC-019](test-cases.vi.md#tc-rs-func-019) | A. Functional | CONFIRMED | Cao | AC-G24 «Trigger khi đổi điểm tối đa/đơn vị» | 7.3 | TS-RS-009 «Thời điểm xét và vòng đời kết quả» |
| [TC-RS-FUNC-020](test-cases.vi.md#tc-rs-func-020) | A. Functional | CONFIRMED | Cao | AC-G24 «Trigger khi đổi điểm tối đa/đơn vị» | 7.3 | TS-RS-009 «Thời điểm xét và vòng đời kết quả» |
| [TC-RS-FUNC-021](test-cases.vi.md#tc-rs-func-021) | A. Functional | CONFIRMED | Cao | AC-G23 «Bao phủ đường đăng ký và chạy lại» | 7.2, 12.2 | TS-RS-009 «Thời điểm xét và vòng đời kết quả» |
| [TC-RS-FUNC-022](test-cases.vi.md#tc-rs-func-022) | A. Functional | CONFIRMED | TBD | AC-G30 «Hiển thị ô trích xuất» | 9.1 | TS-RS-012 «Trích xuất thành tích（成績抽出）» |
| [TC-RS-FUNC-023](test-cases.vi.md#tc-rs-func-023) | A. Functional | CONFIRMED | Cao | AC-G29 «Lọc khi trích xuất» | 9.1, 9.2 | TS-RS-012 «Trích xuất thành tích（成績抽出）», TS-RS-019 «Luồng đầu–cuối（end-to-end）» |
| [TC-RS-FUNC-024](test-cases.vi.md#tc-rs-func-024) | A. Functional | CONFIRMED | Cao | AC-G30 «Hiển thị ô trích xuất» | 9.1, 9.2 | TS-RS-012 «Trích xuất thành tích（成績抽出）» |
| [TC-RS-FUNC-025](test-cases.vi.md#tc-rs-func-025) | A. Functional | CONFIRMED | Cao | AC-G31 «Excel khớp và dùng kết luận server» | 9.3 | TS-RS-012 «Trích xuất thành tích（成績抽出）» |
| [TC-RS-FUNC-026](test-cases.vi.md#tc-rs-func-026) | A. Functional | CONFIRMED | Cao | AC-G32 «Cấu hình công khai và ẩn điểm» | 10.1 | TS-RS-013 «Công khai thành tích（成績公開）», TS-RS-019 «Luồng đầu–cuối（end-to-end）» |
| [TC-RS-FUNC-027](test-cases.vi.md#tc-rs-func-027) | A. Functional | CONFIRMED | Cao | AC-G33 «Kết hợp hiệu ứng công khai» | 10.2 | TS-RS-013 «Công khai thành tích（成績公開）» |
| [TC-RS-FUNC-028](test-cases.vi.md#tc-rs-func-028) | A. Functional | CONFIRMED | Cao | AC-G34 «Đúng người, lịch và đầu ra công khai» | 10.3 | TS-RS-013 «Công khai thành tích（成績公開）» |
| [TC-RS-FUNC-029](test-cases.vi.md#tc-rs-func-029) | A. Functional | CONFIRMED | Cao | AC-G35 «Tùy chọn trên phiếu» | 11.1 | TS-RS-014 «Công cụ phiếu điểm（通知表ツール） và PDF», TS-RS-019 «Luồng đầu–cuối（end-to-end）» |
| [TC-RS-FUNC-030](test-cases.vi.md#tc-rs-func-030) | A. Functional | CONFIRMED | Cao | AC-G36 «Phiếu dừng ở điều kiện khớp đầu tiên» | 11.2 | TS-RS-014 «Công cụ phiếu điểm（通知表ツール） và PDF» |
| [TC-RS-FUNC-031](test-cases.vi.md#tc-rs-func-031) | A. Functional | CONFIRMED | TBD | AC-G37 «Lưu, sao chép và PDF phiếu» | 11.1, 11.3 | TS-RS-014 «Công cụ phiếu điểm（通知表ツール） và PDF» |
| [TC-RS-FUNC-032](test-cases.vi.md#tc-rs-func-032) | A. Functional | CONFIRMED | Cao | AC-G22 «Kết quả chung và thứ tự cập nhật» | 7.1 | TS-RS-015 «Ba đầu ra dùng chung một kết quả», TS-RS-019 «Luồng đầu–cuối（end-to-end）» |
| [TC-RS-FUNC-033](test-cases.vi.md#tc-rs-func-033) | A. Functional | CONFIRMED | Cao | AC-G04 «Lưu và mở lại nhiều thiết lập» | 4.2 | TS-RS-001 «Quản lý danh sách quy tắc đỏ của một mục» |
| [TC-RS-FUNC-034](test-cases.vi.md#tc-rs-func-034) | A. Functional | CONFIRMED | Cao | AC-G12 «Đúng phạm vi tham chiếu» | 5.4 | TS-RS-007 «Nguồn trung bình và tỷ lệ nhóm» |
| [TC-RS-FUNC-035](test-cases.vi.md#tc-rs-func-035) | A. Functional | TBD | TBD | AC-G23 «Bao phủ đường đăng ký và chạy lại» | 7.2 | TS-RS-009 «Thời điểm xét và vòng đời kết quả» |
| [TC-RS-FUNC-036](test-cases.vi.md#tc-rs-func-036) | A. Functional | CONFIRMED | Cao | AC-G12 «Đúng phạm vi tham chiếu» | 5.4 | TS-RS-007 «Nguồn trung bình và tỷ lệ nhóm» |
| [TC-RS-FUNC-037](test-cases.vi.md#tc-rs-func-037) | A. Functional | CONFIRMED | Cao | AC-G32 «Cấu hình công khai và ẩn điểm» | 10.1 | TS-RS-013 «Công khai thành tích（成績公開）» |
| [TC-RS-BR-001](test-cases.vi.md#tc-rs-br-001) | C. Business Rules | CONFIRMED | Cao | AC-G06 «Chọn quy tắc khớp đầu tiên» | 4.3 | TS-RS-006 «Chọn quy tắc và phân nhánh» |
| [TC-RS-BR-002](test-cases.vi.md#tc-rs-br-002) | C. Business Rules | CONFIRMED | Cao | AC-G06 «Chọn quy tắc khớp đầu tiên», AC-G20 «Trạng thái sau lần chạy» | 4.3, 8.1 | TS-RS-006 «Chọn quy tắc và phân nhánh» |
| [TC-RS-BR-003](test-cases.vi.md#tc-rs-br-003) | C. Business Rules | CONFIRMED | Cao | AC-G06 «Chọn quy tắc khớp đầu tiên» | 4.3 | TS-RS-006 «Chọn quy tắc và phân nhánh» |
| [TC-RS-BR-004](test-cases.vi.md#tc-rs-br-004) | C. Business Rules | CONFIRMED | Cao | AC-G05 «Đối tượng áp dụng và nhu cầu nguồn» | 5.1 | TS-RS-002 «Điều kiện áp dụng» |
| [TC-RS-BR-041](test-cases.vi.md#tc-rs-br-041) | C. Business Rules | CONFIRMED | Cao | AC-G05 «Đối tượng áp dụng và nhu cầu nguồn» | 5.1, 5.2 | TS-RS-002 «Điều kiện áp dụng» |
| [TC-RS-BR-005](test-cases.vi.md#tc-rs-br-005) | C. Business Rules | CONFIRMED | Cao | AC-G05 «Đối tượng áp dụng và nhu cầu nguồn» | 5.1 | TS-RS-002 «Điều kiện áp dụng» |
| [TC-RS-BR-006](test-cases.vi.md#tc-rs-br-006) | C. Business Rules | CONFIRMED | Cao | AC-G12 «Đúng phạm vi tham chiếu» | 5.4 | TS-RS-007 «Nguồn trung bình và tỷ lệ nhóm» |
| [TC-RS-BR-007](test-cases.vi.md#tc-rs-br-007) | C. Business Rules | CONFIRMED | Cao | AC-G13 «Ưu tiên bản chốt và xử lý thiếu nguồn», AC-G40 «Phạm vi từng đợt» | 5.5, 7.4 | TS-RS-007 «Nguồn trung bình và tỷ lệ nhóm» |
| [TC-RS-BR-008](test-cases.vi.md#tc-rs-br-008) | C. Business Rules | CONFIRMED | Cao | AC-G13 «Ưu tiên bản chốt và xử lý thiếu nguồn» | 5.5 | TS-RS-007 «Nguồn trung bình và tỷ lệ nhóm» |
| [TC-RS-BR-009](test-cases.vi.md#tc-rs-br-009) | C. Business Rules | CONFIRMED | Cao | AC-G13 «Ưu tiên bản chốt và xử lý thiếu nguồn», AC-G40 «Phạm vi từng đợt» | 5.5, 8.3 | TS-RS-007 «Nguồn trung bình và tỷ lệ nhóm» |
| [TC-RS-BR-010](test-cases.vi.md#tc-rs-br-010) | C. Business Rules | CONFIRMED | Cao | AC-G13 «Ưu tiên bản chốt và xử lý thiếu nguồn» | 5.5 | TS-RS-007 «Nguồn trung bình và tỷ lệ nhóm» |
| [TC-RS-BR-011](test-cases.vi.md#tc-rs-br-011) | C. Business Rules | CONFIRMED | Cao | AC-G05 «Đối tượng áp dụng và nhu cầu nguồn» | 5.6 | TS-RS-007 «Nguồn trung bình và tỷ lệ nhóm» |
| [TC-RS-BR-012](test-cases.vi.md#tc-rs-br-012) | C. Business Rules | CONFIRMED | Cao | AC-G19 «Dùng điểm cuối cùng» | 2.3 | TS-RS-008 «Điểm được xét» |
| [TC-RS-BR-013](test-cases.vi.md#tc-rs-br-013) | C. Business Rules | CONFIRMED | Cao | AC-G19 «Dùng điểm cuối cùng» | 2.3 | TS-RS-008 «Điểm được xét» |
| [TC-RS-BR-014](test-cases.vi.md#tc-rs-br-014) | C. Business Rules | CONFIRMED | Cao | AC-G19 «Dùng điểm cuối cùng» | 2.3, 8.1 | TS-RS-008 «Điểm được xét» |
| [TC-RS-BR-015](test-cases.vi.md#tc-rs-br-015) | C. Business Rules | CONFIRMED | Cao | AC-G21 «Giữ kết quả trước khi chạy lại và xóa rule cuối» | 4.4, 7.2, 8.2 | TS-RS-009 «Thời điểm xét và vòng đời kết quả», TS-RS-019 «Luồng đầu–cuối（end-to-end）» |
| [TC-RS-BR-016](test-cases.vi.md#tc-rs-br-016) | C. Business Rules | CONFIRMED | Cao | AC-G26 «Lưu thành công và thông báo an toàn» | 8.2 | TS-RS-009 «Thời điểm xét và vòng đời kết quả» |
| [TC-RS-BR-017](test-cases.vi.md#tc-rs-br-017) | C. Business Rules | CONFIRMED | Cao | AC-G20 «Trạng thái sau lần chạy» | 8.2, 8.3 | TS-RS-009 «Thời điểm xét và vòng đời kết quả» |
| [TC-RS-BR-018](test-cases.vi.md#tc-rs-br-018) | C. Business Rules | CONFIRMED | Cao | AC-G21 «Giữ kết quả trước khi chạy lại và xóa rule cuối» | 8.2 | TS-RS-009 «Thời điểm xét và vòng đời kết quả» |
| [TC-RS-BR-019](test-cases.vi.md#tc-rs-br-019) | C. Business Rules | CONFIRMED | Cao | AC-G21 «Giữ kết quả trước khi chạy lại và xóa rule cuối» | 4.1, 4.4, 8.2, 10.1 | TS-RS-009 «Thời điểm xét và vòng đời kết quả», TS-RS-019 «Luồng đầu–cuối（end-to-end）» |
| [TC-RS-BR-020](test-cases.vi.md#tc-rs-br-020) | C. Business Rules | CONFIRMED | Cao | AC-G19 «Dùng điểm cuối cùng» | 7.1, 7.2, 8.2 | TS-RS-009 «Thời điểm xét và vòng đời kết quả» |
| [TC-RS-BR-021](test-cases.vi.md#tc-rs-br-021) | C. Business Rules | CONFIRMED | Cao | AC-G25 «Thứ tự đánh giá tương đối» | 7.2 | TS-RS-009 «Thời điểm xét và vòng đời kết quả» |
| [TC-RS-BR-022](test-cases.vi.md#tc-rs-br-022) | C. Business Rules | CONFIRMED | Cao | AC-G24 «Trigger khi đổi điểm tối đa/đơn vị» | 7.3 | TS-RS-009 «Thời điểm xét và vòng đời kết quả» |
| [TC-RS-BR-023](test-cases.vi.md#tc-rs-br-023) | C. Business Rules | CONFIRMED | Cao | AC-G25 «Thứ tự đánh giá tương đối» | — | TS-RS-009 «Thời điểm xét và vòng đời kết quả» |
| [TC-RS-BR-024](test-cases.vi.md#tc-rs-br-024) | C. Business Rules | CONFIRMED | Cao | AC-G28 «Xem/xuất không tự xét» | 7.2, 9.3, 10.3 | TS-RS-009 «Thời điểm xét và vòng đời kết quả», TS-RS-015 «Ba đầu ra dùng chung một kết quả» |
| [TC-RS-BR-025](test-cases.vi.md#tc-rs-br-025) | C. Business Rules | CONFIRMED | Cao | AC-G28 «Xem/xuất không tự xét» | 8.4 | TS-RS-013 «Công khai thành tích（成績公開）» |
| [TC-RS-BR-027](test-cases.vi.md#tc-rs-br-027) | C. Business Rules | CONFIRMED | Cao | AC-G22 «Kết quả chung và thứ tự cập nhật» | 7.1 | TS-RS-009 «Thời điểm xét và vòng đời kết quả» |
| [TC-RS-BR-028](test-cases.vi.md#tc-rs-br-028) | C. Business Rules | CONFIRMED | TBD | AC-G15 «Kế thừa tỷ lệ nhóm» | 5.3 | TS-RS-007 «Nguồn trung bình và tỷ lệ nhóm» |
| [TC-RS-BR-029](test-cases.vi.md#tc-rs-br-029) | C. Business Rules | CONFIRMED | Cao | AC-G02 «Kiểu điểm được hỗ trợ» | 1.2 | TS-RS-002 «Điều kiện áp dụng» |
| [TC-RS-BR-030](test-cases.vi.md#tc-rs-br-030) | C. Business Rules | CONFIRMED | Cao | AC-G02 «Kiểu điểm được hỗ trợ», AC-G03 «Nhận diện ô điểm» | 2.2 | TS-RS-008 «Điểm được xét» |
| [TC-RS-BR-031](test-cases.vi.md#tc-rs-br-031) | C. Business Rules | CONFIRMED | Cao | AC-G01 «Quyền thao tác và phạm vi dữ liệu» | 1.3 | TS-RS-011 «Quyền và kiểm tra phía server» |
| [TC-RS-BR-032](test-cases.vi.md#tc-rs-br-032) | C. Business Rules | CONFIRMED | Cao | AC-G01 «Quyền thao tác và phạm vi dữ liệu» | 1.3 | TS-RS-011 «Quyền và kiểm tra phía server» |
| [TC-RS-BR-033](test-cases.vi.md#tc-rs-br-033) | C. Business Rules | CONFIRMED | Cao | AC-G01 «Quyền thao tác và phạm vi dữ liệu» | 1.3 | TS-RS-011 «Quyền và kiểm tra phía server» |
| [TC-RS-BR-034](test-cases.vi.md#tc-rs-br-034) | C. Business Rules | CONFIRMED | Cao | AC-G23 «Bao phủ đường đăng ký và chạy lại» | 7.4 | TS-RS-007 «Nguồn trung bình và tỷ lệ nhóm» |
| [TC-RS-BR-035](test-cases.vi.md#tc-rs-br-035) | C. Business Rules | CONFIRMED | Cao | AC-G05 «Đối tượng áp dụng và nhu cầu nguồn» | 5.1 | TS-RS-002 «Điều kiện áp dụng» |
| [TC-RS-BR-036](test-cases.vi.md#tc-rs-br-036) | C. Business Rules | CONFIRMED | TBD | AC-G23 «Bao phủ đường đăng ký và chạy lại» | 4.3, 5.5 | TS-RS-006 «Chọn quy tắc và phân nhánh» |
| [TC-RS-BR-037](test-cases.vi.md#tc-rs-br-037) | C. Business Rules | CONFIRMED | TBD | AC-G24 «Trigger khi đổi điểm tối đa/đơn vị» | 7.3, 7.2, 2.2 | TS-RS-009 «Thời điểm xét và vòng đời kết quả» |
| [TC-RS-BR-038](test-cases.vi.md#tc-rs-br-038) | C. Business Rules | CONFIRMED | Cao | AC-G12 «Đúng phạm vi tham chiếu» | — | TS-RS-007 «Nguồn trung bình và tỷ lệ nhóm» |
| [TC-RS-BR-039](test-cases.vi.md#tc-rs-br-039) | C. Business Rules | CONFIRMED | Cao | AC-G12 «Đúng phạm vi tham chiếu», AC-G13 «Ưu tiên bản chốt và xử lý thiếu nguồn» | — | TS-RS-007 «Nguồn trung bình và tỷ lệ nhóm» |
| [TC-RS-BR-040](test-cases.vi.md#tc-rs-br-040) | C. Business Rules | CONFIRMED | Cao | AC-G13 «Ưu tiên bản chốt và xử lý thiếu nguồn», AC-G21 «Giữ kết quả trước khi chạy lại và xóa rule cuối» | 5.4, 5.5 | TS-RS-007 «Nguồn trung bình và tỷ lệ nhóm» |
| [TC-RS-VAL-001](test-cases.vi.md#tc-rs-val-001) | B. Validation | CONFIRMED | TBD | AC-G08 «Điểm cố định» | 6.2 | TS-RS-003 «Ngưỡng điểm cố định» |
| [TC-RS-VAL-002](test-cases.vi.md#tc-rs-val-002) | B. Validation | CONFIRMED | TBD | AC-G08 «Điểm cố định» | 6.2 | TS-RS-003 «Ngưỡng điểm cố định» |
| [TC-RS-VAL-003](test-cases.vi.md#tc-rs-val-003) | B. Validation | CONFIRMED | TBD | AC-G08 «Điểm cố định» | 6.2 | TS-RS-003 «Ngưỡng điểm cố định» |
| [TC-RS-VAL-004](test-cases.vi.md#tc-rs-val-004) | B. Validation | CONFIRMED | TBD | AC-G11 «Giữ chính xác giá trị» | 6.1, 6.2 | TS-RS-003 «Ngưỡng điểm cố định» |
| [TC-RS-VAL-005](test-cases.vi.md#tc-rs-val-005) | B. Validation | PROPOSED | TBD | AC-G11 «Giữ chính xác giá trị» | 6.1 | TS-RS-003 «Ngưỡng điểm cố định» |
| [TC-RS-VAL-006](test-cases.vi.md#tc-rs-val-006) | B. Validation | CONFIRMED | Cao | AC-G10 «Tỷ lệ điểm tối đa» | 6.2, 6.8 | TS-RS-004 «Ngưỡng tỷ lệ điểm tối đa» |
| [TC-RS-VAL-007](test-cases.vi.md#tc-rs-val-007) | B. Validation | PROPOSED | TBD | — | 6.5, 6.8 | TS-RS-004 «Ngưỡng tỷ lệ điểm tối đa» |
| [TC-RS-VAL-008](test-cases.vi.md#tc-rs-val-008) | B. Validation | CONFIRMED | TBD | AC-G17 «Kiểm công thức khi lưu» | 6.4 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-VAL-009](test-cases.vi.md#tc-rs-val-009) | B. Validation | CONFIRMED | TBD | AC-G17 «Kiểm công thức khi lưu» | 6.4 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-VAL-010](test-cases.vi.md#tc-rs-val-010) | B. Validation | CONFIRMED | TBD | AC-G17 «Kiểm công thức khi lưu» | 6.4 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-VAL-011](test-cases.vi.md#tc-rs-val-011) | B. Validation | CONFIRMED | TBD | AC-G17 «Kiểm công thức khi lưu» | 6.4 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-VAL-012](test-cases.vi.md#tc-rs-val-012) | B. Validation | CONFIRMED | TBD | AC-G17 «Kiểm công thức khi lưu» | 6.4 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-VAL-013](test-cases.vi.md#tc-rs-val-013) | B. Validation | PROPOSED | TBD | — | 6.4, 6.8 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-VAL-014](test-cases.vi.md#tc-rs-val-014) | B. Validation | PROPOSED | TBD | — | 4.2, 5.1 | TS-RS-001 «Quản lý danh sách quy tắc đỏ của một mục» |
| [TC-RS-VAL-015](test-cases.vi.md#tc-rs-val-015) | B. Validation | PROPOSED | TBD | AC-G05 «Đối tượng áp dụng và nhu cầu nguồn» | — | TS-RS-002 «Điều kiện áp dụng» |
| [TC-RS-VAL-016](test-cases.vi.md#tc-rs-val-016) | B. Validation | CONFIRMED | Cao | AC-G04 «Lưu và mở lại nhiều thiết lập» | 4.4, 8.4 | TS-RS-001 «Quản lý danh sách quy tắc đỏ của một mục», TS-RS-010 «Trạng thái kết quả và lỗi» |
| [TC-RS-VAL-017](test-cases.vi.md#tc-rs-val-017) | B. Validation | IMPLEMENTED | TBD | AC-G30 «Hiển thị ô trích xuất» | 9.1 | TS-RS-012 «Trích xuất thành tích（成績抽出）» |
| [TC-RS-VAL-018](test-cases.vi.md#tc-rs-val-018) | B. Validation | IMPLEMENTED | TBD | AC-G35 «Tùy chọn trên phiếu» | 11.1 | TS-RS-014 «Công cụ phiếu điểm（通知表ツール） và PDF» |
| [TC-RS-VAL-019](test-cases.vi.md#tc-rs-val-019) | B. Validation | CONFIRMED | TBD | AC-G07 «Biên so sánh và cảnh báo» | 6.6 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-VAL-020](test-cases.vi.md#tc-rs-val-020) | B. Validation | CONFIRMED | TBD | AC-G18 «Ngưỡng âm» | 6.4, 6.7 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-VAL-021](test-cases.vi.md#tc-rs-val-021) | B. Validation | PROPOSED | TBD | — | 6.7 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-VAL-022](test-cases.vi.md#tc-rs-val-022) | B. Validation | PROPOSED | TBD | — | 5.2 | TS-RS-002 «Điều kiện áp dụng» |
| [TC-RS-VAL-023](test-cases.vi.md#tc-rs-val-023) | B. Validation | PROPOSED | TBD | AC-G11 «Giữ chính xác giá trị» | 6.8 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-VAL-024](test-cases.vi.md#tc-rs-val-024) | B. Validation | CONFIRMED | TBD | AC-G05 «Đối tượng áp dụng và nhu cầu nguồn» | 5.4, 5.6 | TS-RS-007 «Nguồn trung bình và tỷ lệ nhóm» |
| [TC-RS-VAL-025](test-cases.vi.md#tc-rs-val-025) | B. Validation | CONFIRMED | Cao | AC-G12 «Đúng phạm vi tham chiếu» | — | TS-RS-007 «Nguồn trung bình và tỷ lệ nhóm» |
| [TC-RS-DATA-001](test-cases.vi.md#tc-rs-data-001) | G. Data/Persistence | CONFIRMED | TBD | AC-G04 «Lưu và mở lại nhiều thiết lập», AC-G11 «Giữ chính xác giá trị» | 6.8 | TS-RS-001 «Quản lý danh sách quy tắc đỏ của một mục» |
| [TC-RS-DATA-002](test-cases.vi.md#tc-rs-data-002) | G. Data/Persistence | CONFIRMED | TBD | AC-G03 «Nhận diện ô điểm» | 2.2, 7.1 | TS-RS-016 «Dữ liệu và dữ liệu đỏ cũ» |
| [TC-RS-DATA-003](test-cases.vi.md#tc-rs-data-003) | G. Data/Persistence | CONFIRMED | TBD | AC-G20 «Trạng thái sau lần chạy» | 8.1, 8.2 | TS-RS-016 «Dữ liệu và dữ liệu đỏ cũ» |
| [TC-RS-DATA-004](test-cases.vi.md#tc-rs-data-004) | G. Data/Persistence | CONFIRMED | Cao | — | 4.1, 12.2 | TS-RS-001 «Quản lý danh sách quy tắc đỏ của một mục» |
| [TC-RS-DATA-005](test-cases.vi.md#tc-rs-data-005) | G. Data/Persistence | CONFIRMED | TBD | — | 6.4, 7.1 | TS-RS-016 «Dữ liệu và dữ liệu đỏ cũ» |
| [TC-RS-DATA-007](test-cases.vi.md#tc-rs-data-007) | G. Data/Persistence | CONFIRMED | TBD | — | 9.1, 10.1, 11.1 | TS-RS-016 «Dữ liệu và dữ liệu đỏ cũ» |
| [TC-RS-DATA-008](test-cases.vi.md#tc-rs-data-008) | G. Data/Persistence | PROPOSED | TBD | — | 12.1 | TS-RS-016 «Dữ liệu và dữ liệu đỏ cũ» |
| [TC-RS-DATA-010](test-cases.vi.md#tc-rs-data-010) | G. Data/Persistence | CONFIRMED | Cao | AC-G37 «Lưu, sao chép và PDF phiếu» | 11.3 | TS-RS-014 «Công cụ phiếu điểm（通知表ツール） và PDF» |
| [TC-RS-DATA-011](test-cases.vi.md#tc-rs-data-011) | G. Data/Persistence | CONFIRMED | TBD | — | 12.1, 12.3 | TS-RS-016 «Dữ liệu và dữ liệu đỏ cũ» |
| [TC-RS-DATA-012](test-cases.vi.md#tc-rs-data-012) | G. Data/Persistence | PROPOSED | TBD | — | 10.1 | TS-RS-016 «Dữ liệu và dữ liệu đỏ cũ» |
| [TC-RS-DATA-013](test-cases.vi.md#tc-rs-data-013) | G. Data/Persistence | PROPOSED | TBD | — | 7.5, 12.1 | TS-RS-016 «Dữ liệu và dữ liệu đỏ cũ» |
| [TC-RS-CALC-001](test-cases.vi.md#tc-rs-calc-001) | D. Calculation | CONFIRMED | Cao | AC-G07 «Biên so sánh và cảnh báo» | 6.1, 6.2 | TS-RS-003 «Ngưỡng điểm cố định» |
| [TC-RS-CALC-002](test-cases.vi.md#tc-rs-calc-002) | D. Calculation | CONFIRMED | Cao | AC-G07 «Biên so sánh và cảnh báo» | 2.3, 6.1, 6.6 | TS-RS-003 «Ngưỡng điểm cố định» |
| [TC-RS-CALC-003](test-cases.vi.md#tc-rs-calc-003) | D. Calculation | CONFIRMED | Cao | AC-G11 «Giữ chính xác giá trị» | 6.1, 6.8 | TS-RS-003 «Ngưỡng điểm cố định» |
| [TC-RS-CALC-004](test-cases.vi.md#tc-rs-calc-004) | D. Calculation | CONFIRMED | Cao | AC-G08 «Điểm cố định» | 6.2 | TS-RS-003 «Ngưỡng điểm cố định» |
| [TC-RS-CALC-005](test-cases.vi.md#tc-rs-calc-005) | D. Calculation | CONFIRMED | Cao | AC-G10 «Tỷ lệ điểm tối đa» | 6.3 | TS-RS-004 «Ngưỡng tỷ lệ điểm tối đa» |
| [TC-RS-CALC-006](test-cases.vi.md#tc-rs-calc-006) | D. Calculation | CONFIRMED | Cao | AC-G10 «Tỷ lệ điểm tối đa» | 6.3 | TS-RS-004 «Ngưỡng tỷ lệ điểm tối đa» |
| [TC-RS-CALC-007](test-cases.vi.md#tc-rs-calc-007) | D. Calculation | CONFIRMED | Cao | AC-G10 «Tỷ lệ điểm tối đa» | 6.3, 6.5 | TS-RS-004 «Ngưỡng tỷ lệ điểm tối đa» |
| [TC-RS-CALC-008](test-cases.vi.md#tc-rs-calc-008) | D. Calculation | CONFIRMED | Cao | AC-G10 «Tỷ lệ điểm tối đa» | 6.3 | TS-RS-004 «Ngưỡng tỷ lệ điểm tối đa» |
| [TC-RS-CALC-009](test-cases.vi.md#tc-rs-calc-009) | D. Calculation | CONFIRMED | Cao | AC-G10 «Tỷ lệ điểm tối đa» | 6.3, 6.6 | TS-RS-004 «Ngưỡng tỷ lệ điểm tối đa» |
| [TC-RS-CALC-010](test-cases.vi.md#tc-rs-calc-010) | D. Calculation | CONFIRMED | Cao | AC-G10 «Tỷ lệ điểm tối đa» | 6.2, 6.3, 8.3 | TS-RS-004 «Ngưỡng tỷ lệ điểm tối đa» |
| [TC-RS-CALC-011](test-cases.vi.md#tc-rs-calc-011) | D. Calculation | CONFIRMED | Cao | AC-G09 «Điểm tối đa hiện hành» | 2.4 | TS-RS-004 «Ngưỡng tỷ lệ điểm tối đa» |
| [TC-RS-CALC-012](test-cases.vi.md#tc-rs-calc-012) | D. Calculation | CONFIRMED | Cao | AC-G09 «Điểm tối đa hiện hành» | 2.4, 6.3 | TS-RS-004 «Ngưỡng tỷ lệ điểm tối đa» |
| [TC-RS-CALC-013](test-cases.vi.md#tc-rs-calc-013) | D. Calculation | CONFIRMED | Cao | AC-G16 «Công thức theo dòng và phần lẻ» | 6.4 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-CALC-014](test-cases.vi.md#tc-rs-calc-014) | D. Calculation | CONFIRMED | TBD | AC-G16 «Công thức theo dòng và phần lẻ» | 6.5 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-CALC-015](test-cases.vi.md#tc-rs-calc-015) | D. Calculation | CONFIRMED | TBD | AC-G16 «Công thức theo dòng và phần lẻ» | 6.4 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-CALC-016](test-cases.vi.md#tc-rs-calc-016) | D. Calculation | CONFIRMED | Cao | AC-G18 «Ngưỡng âm» | 6.6 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-CALC-017](test-cases.vi.md#tc-rs-calc-017) | D. Calculation | CONFIRMED | Cao | AC-G16 «Công thức theo dòng và phần lẻ» | 6.6 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-CALC-018](test-cases.vi.md#tc-rs-calc-018) | D. Calculation | CONFIRMED | Cao | AC-G07 «Biên so sánh và cảnh báo» | 6.6 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-CALC-019](test-cases.vi.md#tc-rs-calc-019) | D. Calculation | PROPOSED | TBD | AC-G16 «Công thức theo dòng và phần lẻ» | 6.5 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-CALC-020](test-cases.vi.md#tc-rs-calc-020) | D. Calculation | CONFIRMED | Cao | AC-G16 «Công thức theo dòng và phần lẻ» | 6.5 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-CALC-021](test-cases.vi.md#tc-rs-calc-021) | D. Calculation | CONFIRMED | Cao | — | 6.4, 8.3 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-CALC-022](test-cases.vi.md#tc-rs-calc-022) | D. Calculation | CONFIRMED | Cao | AC-G14 «Giá trị thô từ cùng tập dữ liệu» | 5.2 | TS-RS-006 «Chọn quy tắc và phân nhánh» |
| [TC-RS-CALC-023](test-cases.vi.md#tc-rs-calc-023) | D. Calculation | CONFIRMED | Cao | AC-G14 «Giá trị thô từ cùng tập dữ liệu» | 5.2 | TS-RS-006 «Chọn quy tắc và phân nhánh» |
| [TC-RS-CALC-024](test-cases.vi.md#tc-rs-calc-024) | D. Calculation | CONFIRMED | Cao | AC-G15 «Kế thừa tỷ lệ nhóm» | 5.3 | TS-RS-006 «Chọn quy tắc và phân nhánh» |
| [TC-RS-CALC-025](test-cases.vi.md#tc-rs-calc-025) | D. Calculation | TBD | TBD | AC-G14 «Giá trị thô từ cùng tập dữ liệu» | 5.3 | TS-RS-006 «Chọn quy tắc và phân nhánh» |
| [TC-RS-CALC-026](test-cases.vi.md#tc-rs-calc-026) | D. Calculation | CONFIRMED | TBD | AC-G14 «Giá trị thô từ cùng tập dữ liệu» | 5.5 | TS-RS-007 «Nguồn trung bình và tỷ lệ nhóm» |
| [TC-RS-CALC-027](test-cases.vi.md#tc-rs-calc-027) | D. Calculation | TBD | TBD | — | 5.5 | TS-RS-007 «Nguồn trung bình và tỷ lệ nhóm» |
| [TC-RS-CALC-028](test-cases.vi.md#tc-rs-calc-028) | D. Calculation | CONFIRMED | Cao | AC-G11 «Giữ chính xác giá trị» | 6.8 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-CALC-029](test-cases.vi.md#tc-rs-calc-029) | D. Calculation | CONFIRMED | Cao | AC-G11 «Giữ chính xác giá trị» | 6.8 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-CALC-030](test-cases.vi.md#tc-rs-calc-030) | D. Calculation | CONFIRMED | Cao | — | 2.3, 6.6 | TS-RS-005 «Ngưỡng công thức», TS-RS-008 «Điểm được xét» |
| [TC-RS-CALC-031](test-cases.vi.md#tc-rs-calc-031) | D. Calculation | CONFIRMED | Cao | AC-G14 «Giá trị thô từ cùng tập dữ liệu» | 5.3, 5.5, 8.3 | TS-RS-007 «Nguồn trung bình và tỷ lệ nhóm» |
| [TC-RS-CALC-032](test-cases.vi.md#tc-rs-calc-032) | D. Calculation | CONFIRMED | TBD | AC-G14 «Giá trị thô từ cùng tập dữ liệu» | 5.3, 5.5 | TS-RS-007 «Nguồn trung bình và tỷ lệ nhóm» |
| [TC-RS-UI-001](test-cases.vi.md#tc-rs-ui-001) | E. UI/Visual | PROPOSED | TBD | — | 4.1 | TS-RS-001 «Quản lý danh sách quy tắc đỏ của một mục» |
| [TC-RS-UI-002](test-cases.vi.md#tc-rs-ui-002) | E. UI/Visual | PROPOSED | TBD | — | 4.1, 4.2 | TS-RS-001 «Quản lý danh sách quy tắc đỏ của một mục» |
| [TC-RS-UI-003](test-cases.vi.md#tc-rs-ui-003) | E. UI/Visual | CONFIRMED | TBD | AC-G04 «Lưu và mở lại nhiều thiết lập» | — | TS-RS-001 «Quản lý danh sách quy tắc đỏ của một mục» |
| [TC-RS-UI-004](test-cases.vi.md#tc-rs-ui-004) | E. UI/Visual | PROPOSED | TBD | — | 4.2 | TS-RS-001 «Quản lý danh sách quy tắc đỏ của một mục» |
| [TC-RS-UI-005](test-cases.vi.md#tc-rs-ui-005) | E. UI/Visual | PROPOSED | TBD | — | 4.1 | TS-RS-001 «Quản lý danh sách quy tắc đỏ của một mục» |
| [TC-RS-UI-006](test-cases.vi.md#tc-rs-ui-006) | E. UI/Visual | PROPOSED | TBD | — | 4.4 | TS-RS-001 «Quản lý danh sách quy tắc đỏ của một mục» |
| [TC-RS-UI-007](test-cases.vi.md#tc-rs-ui-007) | E. UI/Visual | PROPOSED | TBD | — | 13.1 | TS-RS-001 «Quản lý danh sách quy tắc đỏ của một mục» |
| [TC-RS-UI-008](test-cases.vi.md#tc-rs-ui-008) | E. UI/Visual | PROPOSED | TBD | — | 5.1 | TS-RS-002 «Điều kiện áp dụng» |
| [TC-RS-UI-009](test-cases.vi.md#tc-rs-ui-009) | E. UI/Visual | CONFIRMED | TBD | — | 3, 5.4, 5.5 | TS-RS-002 «Điều kiện áp dụng» |
| [TC-RS-UI-010](test-cases.vi.md#tc-rs-ui-010) | E. UI/Visual | PROPOSED | TBD | — | 5.3 | TS-RS-002 «Điều kiện áp dụng» |
| [TC-RS-UI-011](test-cases.vi.md#tc-rs-ui-011) | E. UI/Visual | PROPOSED | TBD | — | 6.1 | TS-RS-003 «Ngưỡng điểm cố định» |
| [TC-RS-UI-012](test-cases.vi.md#tc-rs-ui-012) | E. UI/Visual | PROPOSED | TBD | — | 6.1 | TS-RS-003 «Ngưỡng điểm cố định» |
| [TC-RS-UI-013](test-cases.vi.md#tc-rs-ui-013) | E. UI/Visual | CONFIRMED | TBD | — | 5.6 | TS-RS-003 «Ngưỡng điểm cố định» |
| [TC-RS-UI-014](test-cases.vi.md#tc-rs-ui-014) | E. UI/Visual | PROPOSED | TBD | — | 5.6, 6.3, 6.5 | TS-RS-004 «Ngưỡng tỷ lệ điểm tối đa» |
| [TC-RS-UI-015](test-cases.vi.md#tc-rs-ui-015) | E. UI/Visual | PROPOSED | TBD | — | 5.6, 6.4 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-UI-016](test-cases.vi.md#tc-rs-ui-016) | E. UI/Visual | PROPOSED | TBD | — | 6.4 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-UI-017](test-cases.vi.md#tc-rs-ui-017) | E. UI/Visual | PROPOSED | TBD | — | 8.4 | TS-RS-005 «Ngưỡng công thức» |
| [TC-RS-UI-018](test-cases.vi.md#tc-rs-ui-018) | E. UI/Visual | IMPLEMENTED | TBD | — | 7.2 | TS-RS-010 «Trạng thái kết quả và lỗi» |
| [TC-RS-UI-019](test-cases.vi.md#tc-rs-ui-019) | E. UI/Visual | PROPOSED | TBD | AC-G26 «Lưu thành công và thông báo an toàn» | 8.4 | TS-RS-010 «Trạng thái kết quả và lỗi» |
| [TC-RS-UI-020](test-cases.vi.md#tc-rs-ui-020) | E. UI/Visual | CONFIRMED | TBD | — | 9.1 | TS-RS-012 «Trích xuất thành tích（成績抽出）» |
| [TC-RS-UI-021](test-cases.vi.md#tc-rs-ui-021) | E. UI/Visual | PROPOSED | TBD | AC-G29 «Lọc khi trích xuất» | — | TS-RS-012 «Trích xuất thành tích（成績抽出）» |
| [TC-RS-UI-022](test-cases.vi.md#tc-rs-ui-022) | E. UI/Visual | CONFIRMED | TBD | AC-G32 «Cấu hình công khai và ẩn điểm» | 10.1 | TS-RS-013 «Công khai thành tích（成績公開）» |
| [TC-RS-UI-023](test-cases.vi.md#tc-rs-ui-023) | E. UI/Visual | CONFIRMED | TBD | — | 10.1 | TS-RS-013 «Công khai thành tích（成績公開）» |
| [TC-RS-UI-024](test-cases.vi.md#tc-rs-ui-024) | E. UI/Visual | CONFIRMED | TBD | AC-G35 «Tùy chọn trên phiếu» | — | TS-RS-014 «Công cụ phiếu điểm（通知表ツール） và PDF» |
| [TC-RS-UI-026](test-cases.vi.md#tc-rs-ui-026) | E. UI/Visual | CONFIRMED | Cao | AC-G32 «Cấu hình công khai và ẩn điểm» | 10.1 | TS-RS-013 «Công khai thành tích（成績公開）» |
| [TC-RS-UI-025](test-cases.vi.md#tc-rs-ui-025) | E. UI/Visual | CONFIRMED | TBD | AC-G40 «Phạm vi từng đợt» | 1.4 | TS-RS-017 «Phạm vi phát hành» |
| [TC-RS-ERR-001](test-cases.vi.md#tc-rs-err-001) | F. State/Error | CONFIRMED | Cao | AC-G20 «Trạng thái sau lần chạy» | 8.1, 9.2, 10.3, 11.2 | TS-RS-010 «Trạng thái kết quả và lỗi», TS-RS-015 «Ba đầu ra dùng chung một kết quả» |
| [TC-RS-ERR-002](test-cases.vi.md#tc-rs-err-002) | F. State/Error | CONFIRMED | Cao | AC-G26 «Lưu thành công và thông báo an toàn» | 8.4 | TS-RS-010 «Trạng thái kết quả và lỗi» |
| [TC-RS-ERR-003](test-cases.vi.md#tc-rs-err-003) | F. State/Error | CONFIRMED | Cao | AC-G27 «Batch hoàn tất một phần» | 8.4 | TS-RS-010 «Trạng thái kết quả và lỗi» |
| [TC-RS-ERR-004](test-cases.vi.md#tc-rs-err-004) | F. State/Error | CONFIRMED | Cao | AC-G27 «Batch hoàn tất một phần» | 8.4, 7.3 | TS-RS-010 «Trạng thái kết quả và lỗi» |
| [TC-RS-ERR-005](test-cases.vi.md#tc-rs-err-005) | F. State/Error | CONFIRMED | TBD | AC-G26 «Lưu thành công và thông báo an toàn» | 8.4 | TS-RS-010 «Trạng thái kết quả và lỗi» |
| [TC-RS-ERR-006](test-cases.vi.md#tc-rs-err-006) | F. State/Error | CONFIRMED | Cao | AC-G01 «Quyền thao tác và phạm vi dữ liệu» | 1.3 | TS-RS-011 «Quyền và kiểm tra phía server» |
| [TC-RS-ERR-007](test-cases.vi.md#tc-rs-err-007) | F. State/Error | CONFIRMED | Cao | AC-G01 «Quyền thao tác và phạm vi dữ liệu» | 1.3 | TS-RS-011 «Quyền và kiểm tra phía server» |
| [TC-RS-ERR-008](test-cases.vi.md#tc-rs-err-008) | F. State/Error | TBD | TBD | AC-G01 «Quyền thao tác và phạm vi dữ liệu» | 1.3 | TS-RS-011 «Quyền và kiểm tra phía server» |
| [TC-RS-ERR-009](test-cases.vi.md#tc-rs-err-009) | F. State/Error | CONFIRMED | TBD | AC-G11 «Giữ chính xác giá trị», AC-G16 «Công thức theo dòng và phần lẻ» | 6.2, 6.3, 6.4, 6.8 | TS-RS-011 «Quyền và kiểm tra phía server» |
| [TC-RS-ERR-010](test-cases.vi.md#tc-rs-err-010) | F. State/Error | CONFIRMED | Cao | AC-G31 «Excel khớp và dùng kết luận server» | 9.3, 12.2 | TS-RS-011 «Quyền và kiểm tra phía server» |
| [TC-RS-ERR-011](test-cases.vi.md#tc-rs-err-011) | F. State/Error | CONFIRMED | Cao | AC-G03 «Nhận diện ô điểm», AC-G12 «Đúng phạm vi tham chiếu», AC-G21 «Giữ kết quả trước khi chạy lại và xóa rule cuối», AC-G22 «Kết quả chung và thứ tự cập nhật» | 7.5 | TS-RS-010 «Trạng thái kết quả và lỗi» |
| [TC-RS-ERR-012](test-cases.vi.md#tc-rs-err-012) | F. State/Error | TBD | TBD | AC-G24 «Trigger khi đổi điểm tối đa/đơn vị» | — | TS-RS-009 «Thời điểm xét và vòng đời kết quả» |
| [TC-RS-ERR-013](test-cases.vi.md#tc-rs-err-013) | F. State/Error | TBD | TBD | AC-G30 «Hiển thị ô trích xuất» | 9.2 | TS-RS-012 «Trích xuất thành tích（成績抽出）» |
| [TC-RS-ERR-014](test-cases.vi.md#tc-rs-err-014) | F. State/Error | TBD | TBD | AC-G32 «Cấu hình công khai và ẩn điểm» | — | TS-RS-015 «Ba đầu ra dùng chung một kết quả» |
| [TC-RS-ERR-015](test-cases.vi.md#tc-rs-err-015) | F. State/Error | CONFIRMED | Cao | AC-G03 «Nhận diện ô điểm», AC-G39 «Không dùng lại kết quả cho đối tượng mới» | 2.2, 7.3, 12.4 | TS-RS-009 «Thời điểm xét và vòng đời kết quả» |
| [TC-RS-ERR-016](test-cases.vi.md#tc-rs-err-016) | F. State/Error | CONFIRMED | Cao | AC-G20 «Trạng thái sau lần chạy» | 8.2, 7.2 | TS-RS-007 «Nguồn trung bình và tỷ lệ nhóm» |
| [TC-RS-ERR-017](test-cases.vi.md#tc-rs-err-017) | F. State/Error | CONFIRMED | TBD | AC-G26 «Lưu thành công và thông báo an toàn» | 12.1 | TS-RS-011 «Quyền và kiểm tra phía server» |
| [TC-RS-ERR-018](test-cases.vi.md#tc-rs-err-018) | F. State/Error | CONFIRMED | Cao | AC-G22 «Kết quả chung và thứ tự cập nhật» | 7.5 | TS-RS-010 «Trạng thái kết quả và lỗi» |
| [TC-RS-ERR-019](test-cases.vi.md#tc-rs-err-019) | F. State/Error | CONFIRMED | Cao | AC-G22 «Kết quả chung và thứ tự cập nhật» | 7.5 | TS-RS-010 «Trạng thái kết quả và lỗi» |
| [TC-RS-REG-001](test-cases.vi.md#tc-rs-reg-001) | H. Regression | CONFIRMED | TBD | — | 7.1, 12.2 | TS-RS-018 «Hồi quy AutoRating và các luồng hiện có» |
| [TC-RS-REG-002](test-cases.vi.md#tc-rs-reg-002) | H. Regression | CONFIRMED | Cao | — | 12.2 | TS-RS-018 «Hồi quy AutoRating và các luồng hiện có» |
| [TC-RS-REG-003](test-cases.vi.md#tc-rs-reg-003) | H. Regression | CONFIRMED | Cao | AC-G19 «Dùng điểm cuối cùng» | 7.2, 12.2 | TS-RS-008 «Điểm được xét», TS-RS-018 «Hồi quy AutoRating và các luồng hiện có» |
| [TC-RS-REG-004](test-cases.vi.md#tc-rs-reg-004) | H. Regression | CONFIRMED | TBD | — | 1.3, 7.4 | TS-RS-018 «Hồi quy AutoRating và các luồng hiện có» |
| [TC-RS-REG-005](test-cases.vi.md#tc-rs-reg-005) | H. Regression | CONFIRMED | TBD | — | 5.5, 7.4, 12.2 | TS-RS-018 «Hồi quy AutoRating và các luồng hiện có» |
| [TC-RS-REG-006](test-cases.vi.md#tc-rs-reg-006) | H. Regression | CONFIRMED | TBD | — | 9.1, 9.2, 9.3 | TS-RS-012 «Trích xuất thành tích（成績抽出）» |
| [TC-RS-REG-007](test-cases.vi.md#tc-rs-reg-007) | H. Regression | CONFIRMED | Cao | AC-G33 «Kết hợp hiệu ứng công khai» | 10.1, 10.3 | TS-RS-013 «Công khai thành tích（成績公開）» |
| [TC-RS-REG-008](test-cases.vi.md#tc-rs-reg-008) | H. Regression | CONFIRMED | Cao | AC-G32 «Cấu hình công khai và ẩn điểm» | 10.2, 10.3, 8.4 | TS-RS-013 «Công khai thành tích（成績公開）» |
| [TC-RS-REG-009](test-cases.vi.md#tc-rs-reg-009) | H. Regression | CONFIRMED | TBD | AC-G36 «Phiếu dừng ở điều kiện khớp đầu tiên» | 11.1 | TS-RS-014 «Công cụ phiếu điểm（通知表ツール） và PDF» |
| [TC-RS-REG-010](test-cases.vi.md#tc-rs-reg-010) | H. Regression | CONFIRMED | TBD | AC-G37 «Lưu, sao chép và PDF phiếu» | 11.1, 11.3 | TS-RS-014 «Công cụ phiếu điểm（通知表ツール） và PDF» |
| [TC-RS-REG-013](test-cases.vi.md#tc-rs-reg-013) | H. Regression | CONFIRMED | TBD | AC-G24 «Trigger khi đổi điểm tối đa/đơn vị» | 7.3 | TS-RS-018 «Hồi quy AutoRating và các luồng hiện có» |
| [TC-RS-REG-014](test-cases.vi.md#tc-rs-reg-014) | H. Regression | CONFIRMED | TBD | — | 12.2 | TS-RS-018 «Hồi quy AutoRating và các luồng hiện có» |
| [TC-RS-REG-015](test-cases.vi.md#tc-rs-reg-015) | H. Regression | CONFIRMED | Cao | AC-G34 «Đúng người, lịch và đầu ra công khai» | 1.3, 10.3 | TS-RS-011 «Quyền và kiểm tra phía server» |
| [TC-RS-REG-016](test-cases.vi.md#tc-rs-reg-016) | H. Regression | CONFIRMED | TBD | — | 7.5, 8.4 | TS-RS-018 «Hồi quy AutoRating và các luồng hiện có» |
| [TC-RS-REG-017](test-cases.vi.md#tc-rs-reg-017) | H. Regression | CONFIRMED | TBD | — | 4.1, 12.2 | TS-RS-018 «Hồi quy AutoRating và các luồng hiện có» |

<a id="conflicts"></a>

## 4. Xung đột và khác biệt

Specification/Q&A là oracle chính; Figma chỉ tham khảo nhãn và bố cục. Khác biệt spec–code dựa trên đọc code tĩnh, chưa chạy.

### 4.1. Các điểm UI đã xử lý theo specification

Các khác biệt UI trước đây được xử lý theo specification/Q&A; Figma chỉ dùng để tham khảo nhãn và bố cục.

| ID | Loại | Chủ đề | Hiện trạng code | Oracle specification v2/Q&A | Cách xử lý theo test | Case liên quan |
| --- | --- | --- | --- | --- | --- | --- |

### 4.2. Chênh lệch code so với oracle specification v2

Các mục `SI-*` bên dưới là chênh lệch giữa code hiện tại và oracle specification v2/Q&A đã chốt. Specification/Q&A là chuẩn để viết Expected và đánh giá PASS/FAIL; code hiện tại chỉ là hiện trạng cần xác minh hoặc sửa, không phải một oracle thay thế. Các quyết định chưa được chốt vẫn giữ TBD/PROPOSED theo từng case.

| ID | Loại | Chủ đề | Code hiện tại | Yêu cầu/spec | Câu hỏi hoặc cần xác minh | Case liên quan |
| --- | --- | --- | --- | --- | --- | --- |
| SI-01 | Spec ↔ code | CSV lựa chọn điểm tối đa của lớp | Code: đường CSV lựa chọn lớp (`option_regist`) không gọi AutoRating | R18 «đặc tả RC-001 v2» §7.3 «Thay đổi điểm tối đa» không nêu đường này | Có cần xét lại đỏ khi điểm tối đa đổi qua CSV lựa chọn lớp không? (người trả lời: Team dev / Người phụ trách) | [TC-RS-ERR-012](test-cases.vi.md#tc-rs-err-012) |
| SI-02 | Spec ↔ code | Phân giải M | Code: các đường phân giải M không thống nhất, thiếu tầng đơn vị ở `GradeScoreRangeService` | R18 «đặc tả RC-001 v2» §2.4 «Phân giải điểm tối đa»: mặc định → đơn vị → lựa chọn lớp | — | [TC-RS-VAL-002](test-cases.vi.md#tc-rs-val-002), [TC-RS-CALC-011](test-cases.vi.md#tc-rs-calc-011) |
| SI-03 | Spec ↔ code | Kết hợp hiệu ứng ở công khai | Code: hiệu ứng trùng bị chồng (`**24`) | QAC «Q&A nghiệp vụ đã xác nhận» Q30 «Công khai thành tích kết hợp điểm dự kiến và điểm đỏ thế nào?» / R18 «đặc tả RC-001 v2» §10.2 «Kết hợp điểm dự kiến và điểm đỏ»: hiệu ứng trùng chỉ một lần (`*24`) | — | [TC-RS-FUNC-027](test-cases.vi.md#tc-rs-func-027) |
| SI-04 | Spec ↔ code | Sao chép mẫu phiếu điểm | Code: sao chép làm mất `display_option` | R18 «đặc tả RC-001 v2» §11.3 «Lưu và xuất», §12.4 «Sao chép, năm mới, nhập/xuất và khôi phục»: giữ cấu hình trình bày phù hợp | Chấp nhận sửa việc sao chép mẫu phiếu điểm cùng tính năng? (người trả lời: Team dev) | [TC-RS-DATA-010](test-cases.vi.md#tc-rs-data-010) |
| SI-05 | Spec ↔ code | Quyền chạy hàng loạt | Code: `autoRatingRun` không kiểm lại quyền ở server | R18 «đặc tả RC-001 v2» §1.3 «Quyền sử dụng»: giữ quyền thực thi; không mở quyền qua request | — | [TC-RS-ERR-008](test-cases.vi.md#tc-rs-err-008) |
| SI-06 | Spec ↔ code | Giới hạn giá trị ở server | Code AutoRating: không giới hạn `decimal_place`/số dòng ở server | R18 «đặc tả RC-001 v2» §6.8 «Yêu cầu độ chính xác»: kiểm miền giá trị trước khi hiện thực | Chấp nhận đề xuất xử lý phần lẻ R18 «đặc tả RC-001 v2» §6.5 «Xử lý phần lẻ» và giới hạn giá trị ở server? (người trả lời: Team dev / Người phụ trách) | [TC-RS-VAL-023](test-cases.vi.md#tc-rs-val-023), [TC-RS-ERR-009](test-cases.vi.md#tc-rs-err-009) |
| SI-07 | Spec ↔ code | Mẫu số trung bình | Code: tổng hợp thứ hạng dùng `examinees`; AutoRating dùng `student_count` | R18 «đặc tả RC-001 v2» §5.5 «Chọn bản nguồn»: tổng điểm ÷ số người có điểm | Cột nào đúng “số người có điểm”? (người trả lời: Team dev / QA) | [TC-RS-CALC-026](test-cases.vi.md#tc-rs-calc-026) |
| SI-08 | Spec ↔ code | Trung bình cho điểm đơn vị | Code: bộ đọc trung bình theo môn, không có chiều đơn vị (CTX «context chuẩn điểm đỏ» I07 «Trung bình theo đơn vị») | R18 «đặc tả RC-001 v2» §5.5 «Chọn bản nguồn»: không được bỏ chiều đơn vị | Trung bình theo 単元 (đơn vị bài học) lấy từ đâu? (người trả lời: Team dev) | [TC-RS-CALC-027](test-cases.vi.md#tc-rs-calc-027) |
| SI-09 | Spec ↔ code | Đường chạy cho mục chỉ có quy tắc đỏ | Code: nút cam chỉ hiện khi có AutoRating active | R18 «đặc tả RC-001 v2» §7.2 «Bảng sự kiện»: mục không có công thức và mục hết quy tắc vẫn cần đường chạy | Chấp nhận chạy lại qua thao tác hàng loạt hiện có? (người trả lời: Team dev) | [TC-RS-FUNC-021](test-cases.vi.md#tc-rs-func-021) |
| SI-10 | Spec ↔ code | Nhập CSV HR ở trường không có AutoRating | Code: nhập CSV HR chỉ xếp hàng khi `autoRatingUse` (CTX «context chuẩn điểm đỏ» I02 «Không có công thức / điểm sửa tay») | R18 «đặc tả RC-001 v2» §7.2 «Bảng sự kiện»: nhập CSV cùng quy tắc xét | Xác nhận nhập CSV lớp và CSV HR là đường xét đỏ? (người trả lời: Người phụ trách / Team dev) | [TC-RS-FUNC-035](test-cases.vi.md#tc-rs-func-035) |
| SI-11 | Spec ↔ code | Không có quy tắc khớp | Code AutoRating: không khớp → ghi `NULL` | R18 «đặc tả RC-001 v2» §12.2 «Điểm tích hợp chính»: không kế thừa hành vi ghi `NULL`; kết quả là Không áp dụng | — | [TC-RS-REG-002](test-cases.vi.md#tc-rs-reg-002) |
| SI-12 | Spec ↔ code | Trùng màu ở trích xuất | Code: điều kiện sau ghi đè (`addFilterResultProperty`) | R18 «đặc tả RC-001 v2» §9.2 «Kết quả và ví dụ» không chốt thứ tự; chỉ yêu cầu không đổi nghĩa điều kiện khác | Điều kiện đỏ đứng ở đâu trong thứ tự điều kiện? (người trả lời: Team dev / Người phụ trách) | [TC-RS-ERR-013](test-cases.vi.md#tc-rs-err-013) |
| SI-13 | Spec ↔ code | Công khai với Không hiển thị（表示しない） | Code: Không hiển thị dừng vòng lặp trang trí | QAC «Q&A nghiệp vụ đã xác nhận» Q16 «Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?» / R18 «đặc tả RC-001 v2» §10.2 «Kết hợp điểm dự kiến và điểm đỏ»: điểm ẩn không bị làm lộ | Cần kiểm dấu đỏ không làm hiện lại điểm ẩn (người kiểm: QA) | [TC-RS-REG-008](test-cases.vi.md#tc-rs-reg-008) |
| SI-14 | Spec ↔ code | Phân giải M ở CSV HR | Code: đọc khóa `changed_min_value` (cột là `changed_min_score`); `!empty` bỏ override M=0 | R18 «đặc tả RC-001 v2» §2.4 «Phân giải điểm tối đa»: M hiện hành phân giải đầy đủ | — | [TC-RS-CALC-011](test-cases.vi.md#tc-rs-calc-011) |

<a id="ac"></a>

## 5. Tiêu chí nghiệm thu（RSD-AC）→ test case

Ánh xạ AC-G01…AC-G40 «tiêu chí nghiệm thu: Quyền thao tác và phạm vi dữ liệu … Phạm vi từng đợt» của [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) sang case; dòng Requirement ID của case ghi cùng ánh xạ. Công cụ sinh báo lỗi nếu có tiêu chí chưa ánh xạ hoặc Requirement ID lệch ánh xạ.

| AC | Tiêu chí | Test Case IDs | Coverage |
| --- | --- | --- | --- |
| AC-G01 | Quyền thao tác và phạm vi dữ liệu | [TC-RS-BR-031](test-cases.vi.md#tc-rs-br-031), [TC-RS-BR-032](test-cases.vi.md#tc-rs-br-032), [TC-RS-BR-033](test-cases.vi.md#tc-rs-br-033), [TC-RS-ERR-006](test-cases.vi.md#tc-rs-err-006), [TC-RS-ERR-007](test-cases.vi.md#tc-rs-err-007), [TC-RS-ERR-008](test-cases.vi.md#tc-rs-err-008) | Có (6; 5 chắc chắn) |
| AC-G02 | Kiểu điểm được hỗ trợ | [TC-RS-FUNC-001](test-cases.vi.md#tc-rs-func-001), [TC-RS-FUNC-002](test-cases.vi.md#tc-rs-func-002), [TC-RS-BR-029](test-cases.vi.md#tc-rs-br-029), [TC-RS-BR-030](test-cases.vi.md#tc-rs-br-030) | Có (4; 4 chắc chắn) |
| AC-G03 | Nhận diện ô điểm | [TC-RS-DATA-002](test-cases.vi.md#tc-rs-data-002), [TC-RS-BR-030](test-cases.vi.md#tc-rs-br-030), [TC-RS-ERR-015](test-cases.vi.md#tc-rs-err-015), [TC-RS-ERR-011](test-cases.vi.md#tc-rs-err-011) | Có (4; 4 chắc chắn) |
| AC-G04 | Lưu và mở lại nhiều thiết lập | [TC-RS-FUNC-004](test-cases.vi.md#tc-rs-func-004), [TC-RS-FUNC-005](test-cases.vi.md#tc-rs-func-005), [TC-RS-FUNC-006](test-cases.vi.md#tc-rs-func-006), [TC-RS-FUNC-007](test-cases.vi.md#tc-rs-func-007), [TC-RS-FUNC-014](test-cases.vi.md#tc-rs-func-014), [TC-RS-FUNC-033](test-cases.vi.md#tc-rs-func-033), [TC-RS-DATA-001](test-cases.vi.md#tc-rs-data-001), [TC-RS-VAL-016](test-cases.vi.md#tc-rs-val-016), [TC-RS-UI-003](test-cases.vi.md#tc-rs-ui-003) | Có (9; 8 chắc chắn) |
| AC-G05 | Đối tượng áp dụng và nhu cầu nguồn | [TC-RS-FUNC-008](test-cases.vi.md#tc-rs-func-008), [TC-RS-BR-004](test-cases.vi.md#tc-rs-br-004), [TC-RS-BR-005](test-cases.vi.md#tc-rs-br-005), [TC-RS-BR-011](test-cases.vi.md#tc-rs-br-011), [TC-RS-BR-035](test-cases.vi.md#tc-rs-br-035), [TC-RS-BR-041](test-cases.vi.md#tc-rs-br-041), [TC-RS-VAL-015](test-cases.vi.md#tc-rs-val-015), [TC-RS-VAL-024](test-cases.vi.md#tc-rs-val-024) | Có (8; 7 chắc chắn) |
| AC-G06 | Chọn quy tắc khớp đầu tiên | [TC-RS-BR-001](test-cases.vi.md#tc-rs-br-001), [TC-RS-BR-002](test-cases.vi.md#tc-rs-br-002), [TC-RS-BR-003](test-cases.vi.md#tc-rs-br-003) | Có (3; 3 chắc chắn) |
| AC-G07 | Biên so sánh và cảnh báo | [TC-RS-CALC-001](test-cases.vi.md#tc-rs-calc-001), [TC-RS-CALC-002](test-cases.vi.md#tc-rs-calc-002), [TC-RS-CALC-018](test-cases.vi.md#tc-rs-calc-018), [TC-RS-VAL-019](test-cases.vi.md#tc-rs-val-019) | Có (4; 4 chắc chắn) |
| AC-G08 | Điểm cố định | [TC-RS-VAL-001](test-cases.vi.md#tc-rs-val-001), [TC-RS-VAL-002](test-cases.vi.md#tc-rs-val-002), [TC-RS-VAL-003](test-cases.vi.md#tc-rs-val-003), [TC-RS-CALC-004](test-cases.vi.md#tc-rs-calc-004) | Có (4; 4 chắc chắn) |
| AC-G09 | Điểm tối đa hiện hành | [TC-RS-CALC-011](test-cases.vi.md#tc-rs-calc-011), [TC-RS-CALC-012](test-cases.vi.md#tc-rs-calc-012) | Có (2; 2 chắc chắn) |
| AC-G10 | Tỷ lệ điểm tối đa | [TC-RS-VAL-006](test-cases.vi.md#tc-rs-val-006), [TC-RS-CALC-005](test-cases.vi.md#tc-rs-calc-005), [TC-RS-CALC-006](test-cases.vi.md#tc-rs-calc-006), [TC-RS-CALC-007](test-cases.vi.md#tc-rs-calc-007), [TC-RS-CALC-008](test-cases.vi.md#tc-rs-calc-008), [TC-RS-CALC-009](test-cases.vi.md#tc-rs-calc-009), [TC-RS-CALC-010](test-cases.vi.md#tc-rs-calc-010) | Có (7; 7 chắc chắn) |
| AC-G11 | Giữ chính xác giá trị | [TC-RS-DATA-001](test-cases.vi.md#tc-rs-data-001), [TC-RS-VAL-004](test-cases.vi.md#tc-rs-val-004), [TC-RS-VAL-005](test-cases.vi.md#tc-rs-val-005), [TC-RS-CALC-003](test-cases.vi.md#tc-rs-calc-003), [TC-RS-CALC-028](test-cases.vi.md#tc-rs-calc-028), [TC-RS-CALC-029](test-cases.vi.md#tc-rs-calc-029), [TC-RS-ERR-009](test-cases.vi.md#tc-rs-err-009), [TC-RS-VAL-023](test-cases.vi.md#tc-rs-val-023) | Có (8; 6 chắc chắn) |
| AC-G12 | Đúng phạm vi tham chiếu | [TC-RS-BR-006](test-cases.vi.md#tc-rs-br-006), [TC-RS-FUNC-009](test-cases.vi.md#tc-rs-func-009), [TC-RS-FUNC-010](test-cases.vi.md#tc-rs-func-010), [TC-RS-FUNC-034](test-cases.vi.md#tc-rs-func-034), [TC-RS-ERR-011](test-cases.vi.md#tc-rs-err-011), [TC-RS-FUNC-036](test-cases.vi.md#tc-rs-func-036), [TC-RS-BR-038](test-cases.vi.md#tc-rs-br-038), [TC-RS-BR-039](test-cases.vi.md#tc-rs-br-039), [TC-RS-VAL-025](test-cases.vi.md#tc-rs-val-025) | Có (9; 9 chắc chắn) |
| AC-G13 | Ưu tiên bản chốt và xử lý thiếu nguồn | [TC-RS-BR-007](test-cases.vi.md#tc-rs-br-007), [TC-RS-BR-008](test-cases.vi.md#tc-rs-br-008), [TC-RS-BR-009](test-cases.vi.md#tc-rs-br-009), [TC-RS-BR-010](test-cases.vi.md#tc-rs-br-010), [TC-RS-BR-039](test-cases.vi.md#tc-rs-br-039), [TC-RS-BR-040](test-cases.vi.md#tc-rs-br-040) | Có (6; 6 chắc chắn) |
| AC-G14 | Giá trị thô từ cùng tập dữ liệu | [TC-RS-CALC-022](test-cases.vi.md#tc-rs-calc-022), [TC-RS-CALC-023](test-cases.vi.md#tc-rs-calc-023), [TC-RS-CALC-025](test-cases.vi.md#tc-rs-calc-025), [TC-RS-CALC-026](test-cases.vi.md#tc-rs-calc-026), [TC-RS-CALC-031](test-cases.vi.md#tc-rs-calc-031), [TC-RS-CALC-032](test-cases.vi.md#tc-rs-calc-032) | Có (6; 5 chắc chắn) |
| AC-G15 | Kế thừa tỷ lệ nhóm | [TC-RS-CALC-024](test-cases.vi.md#tc-rs-calc-024), [TC-RS-BR-028](test-cases.vi.md#tc-rs-br-028) | Có (2; 2 chắc chắn) |
| AC-G16 | Công thức theo dòng và phần lẻ | [TC-RS-FUNC-012](test-cases.vi.md#tc-rs-func-012), [TC-RS-CALC-013](test-cases.vi.md#tc-rs-calc-013), [TC-RS-CALC-014](test-cases.vi.md#tc-rs-calc-014), [TC-RS-CALC-015](test-cases.vi.md#tc-rs-calc-015), [TC-RS-CALC-017](test-cases.vi.md#tc-rs-calc-017), [TC-RS-CALC-019](test-cases.vi.md#tc-rs-calc-019), [TC-RS-CALC-020](test-cases.vi.md#tc-rs-calc-020), [TC-RS-ERR-009](test-cases.vi.md#tc-rs-err-009) | Có (8; 7 chắc chắn) |
| AC-G17 | Kiểm công thức khi lưu | [TC-RS-VAL-008](test-cases.vi.md#tc-rs-val-008), [TC-RS-VAL-009](test-cases.vi.md#tc-rs-val-009), [TC-RS-VAL-010](test-cases.vi.md#tc-rs-val-010), [TC-RS-VAL-011](test-cases.vi.md#tc-rs-val-011), [TC-RS-VAL-012](test-cases.vi.md#tc-rs-val-012) | Có (5; 5 chắc chắn) |
| AC-G18 | Ngưỡng âm | [TC-RS-CALC-016](test-cases.vi.md#tc-rs-calc-016), [TC-RS-VAL-020](test-cases.vi.md#tc-rs-val-020) | Có (2; 2 chắc chắn) |
| AC-G19 | Dùng điểm cuối cùng | [TC-RS-BR-012](test-cases.vi.md#tc-rs-br-012), [TC-RS-BR-013](test-cases.vi.md#tc-rs-br-013), [TC-RS-BR-014](test-cases.vi.md#tc-rs-br-014), [TC-RS-BR-020](test-cases.vi.md#tc-rs-br-020), [TC-RS-REG-003](test-cases.vi.md#tc-rs-reg-003) | Có (5; 5 chắc chắn) |
| AC-G20 | Trạng thái sau lần chạy | [TC-RS-DATA-003](test-cases.vi.md#tc-rs-data-003), [TC-RS-BR-002](test-cases.vi.md#tc-rs-br-002), [TC-RS-BR-017](test-cases.vi.md#tc-rs-br-017), [TC-RS-ERR-001](test-cases.vi.md#tc-rs-err-001), [TC-RS-ERR-016](test-cases.vi.md#tc-rs-err-016) | Có (5; 5 chắc chắn) |
| AC-G21 | Giữ kết quả trước khi chạy lại và xóa rule cuối | [TC-RS-BR-015](test-cases.vi.md#tc-rs-br-015), [TC-RS-BR-018](test-cases.vi.md#tc-rs-br-018), [TC-RS-BR-019](test-cases.vi.md#tc-rs-br-019), [TC-RS-BR-040](test-cases.vi.md#tc-rs-br-040), [TC-RS-ERR-011](test-cases.vi.md#tc-rs-err-011) | Có (5; 5 chắc chắn) |
| AC-G22 | Kết quả chung và thứ tự cập nhật | [TC-RS-FUNC-032](test-cases.vi.md#tc-rs-func-032), [TC-RS-BR-027](test-cases.vi.md#tc-rs-br-027), [TC-RS-ERR-011](test-cases.vi.md#tc-rs-err-011), [TC-RS-ERR-018](test-cases.vi.md#tc-rs-err-018), [TC-RS-ERR-019](test-cases.vi.md#tc-rs-err-019) | Có (5; 5 chắc chắn) |
| AC-G23 | Bao phủ đường đăng ký và chạy lại | [TC-RS-FUNC-016](test-cases.vi.md#tc-rs-func-016), [TC-RS-FUNC-017](test-cases.vi.md#tc-rs-func-017), [TC-RS-FUNC-018](test-cases.vi.md#tc-rs-func-018), [TC-RS-FUNC-021](test-cases.vi.md#tc-rs-func-021), [TC-RS-FUNC-035](test-cases.vi.md#tc-rs-func-035), [TC-RS-BR-034](test-cases.vi.md#tc-rs-br-034), [TC-RS-BR-036](test-cases.vi.md#tc-rs-br-036) | Có (7; 6 chắc chắn) |
| AC-G24 | Trigger khi đổi điểm tối đa/đơn vị | [TC-RS-FUNC-019](test-cases.vi.md#tc-rs-func-019), [TC-RS-FUNC-020](test-cases.vi.md#tc-rs-func-020), [TC-RS-BR-022](test-cases.vi.md#tc-rs-br-022), [TC-RS-REG-013](test-cases.vi.md#tc-rs-reg-013), [TC-RS-ERR-012](test-cases.vi.md#tc-rs-err-012), [TC-RS-BR-037](test-cases.vi.md#tc-rs-br-037) | Có (6; 5 chắc chắn) |
| AC-G25 | Thứ tự đánh giá tương đối | [TC-RS-FUNC-015](test-cases.vi.md#tc-rs-func-015), [TC-RS-BR-021](test-cases.vi.md#tc-rs-br-021), [TC-RS-BR-023](test-cases.vi.md#tc-rs-br-023) | Có (3; 3 chắc chắn) |
| AC-G26 | Lưu thành công và thông báo an toàn | [TC-RS-BR-016](test-cases.vi.md#tc-rs-br-016), [TC-RS-ERR-002](test-cases.vi.md#tc-rs-err-002), [TC-RS-ERR-005](test-cases.vi.md#tc-rs-err-005), [TC-RS-ERR-017](test-cases.vi.md#tc-rs-err-017), [TC-RS-UI-019](test-cases.vi.md#tc-rs-ui-019) | Có (5; 4 chắc chắn) |
| AC-G27 | Batch hoàn tất một phần | [TC-RS-ERR-003](test-cases.vi.md#tc-rs-err-003), [TC-RS-ERR-004](test-cases.vi.md#tc-rs-err-004) | Có (2; 2 chắc chắn) |
| AC-G28 | Xem/xuất không tự xét | [TC-RS-BR-024](test-cases.vi.md#tc-rs-br-024), [TC-RS-BR-025](test-cases.vi.md#tc-rs-br-025) | Có (2; 2 chắc chắn) |
| AC-G29 | Lọc khi trích xuất | [TC-RS-FUNC-023](test-cases.vi.md#tc-rs-func-023), [TC-RS-UI-021](test-cases.vi.md#tc-rs-ui-021) | Có (2; 1 chắc chắn) |
| AC-G30 | Hiển thị ô trích xuất | [TC-RS-FUNC-022](test-cases.vi.md#tc-rs-func-022), [TC-RS-FUNC-024](test-cases.vi.md#tc-rs-func-024), [TC-RS-VAL-017](test-cases.vi.md#tc-rs-val-017), [TC-RS-ERR-013](test-cases.vi.md#tc-rs-err-013) | Có (4; 3 chắc chắn) |
| AC-G31 | Excel khớp và dùng kết luận server | [TC-RS-FUNC-025](test-cases.vi.md#tc-rs-func-025), [TC-RS-ERR-010](test-cases.vi.md#tc-rs-err-010) | Có (2; 2 chắc chắn) |
| AC-G32 | Cấu hình công khai và ẩn điểm | [TC-RS-FUNC-026](test-cases.vi.md#tc-rs-func-026), [TC-RS-UI-022](test-cases.vi.md#tc-rs-ui-022), [TC-RS-UI-026](test-cases.vi.md#tc-rs-ui-026), [TC-RS-REG-008](test-cases.vi.md#tc-rs-reg-008), [TC-RS-ERR-014](test-cases.vi.md#tc-rs-err-014), [TC-RS-FUNC-037](test-cases.vi.md#tc-rs-func-037) | Có (6; 5 chắc chắn) |
| AC-G33 | Kết hợp hiệu ứng công khai | [TC-RS-FUNC-027](test-cases.vi.md#tc-rs-func-027), [TC-RS-REG-007](test-cases.vi.md#tc-rs-reg-007) | Có (2; 2 chắc chắn) |
| AC-G34 | Đúng người, lịch và đầu ra công khai | [TC-RS-FUNC-028](test-cases.vi.md#tc-rs-func-028), [TC-RS-REG-015](test-cases.vi.md#tc-rs-reg-015) | Có (2; 2 chắc chắn) |
| AC-G35 | Tùy chọn trên phiếu | [TC-RS-FUNC-029](test-cases.vi.md#tc-rs-func-029), [TC-RS-VAL-018](test-cases.vi.md#tc-rs-val-018), [TC-RS-UI-024](test-cases.vi.md#tc-rs-ui-024) | Có (3; 3 chắc chắn) |
| AC-G36 | Phiếu dừng ở điều kiện khớp đầu tiên | [TC-RS-FUNC-030](test-cases.vi.md#tc-rs-func-030), [TC-RS-REG-009](test-cases.vi.md#tc-rs-reg-009) | Có (2; 2 chắc chắn) |
| AC-G37 | Lưu, sao chép và PDF phiếu | [TC-RS-FUNC-031](test-cases.vi.md#tc-rs-func-031), [TC-RS-DATA-010](test-cases.vi.md#tc-rs-data-010), [TC-RS-REG-010](test-cases.vi.md#tc-rs-reg-010) | Có (3; 3 chắc chắn) |
| AC-G38 | Bảo toàn điểm đỏ cũ | Ngoài phạm vi bộ test red_score mới; không tạo case active để tránh kiểm thử legacy như chức năng mới | N/A — kiểm riêng ở bộ regression legacy khi phạm vi release yêu cầu |
| AC-G39 | Không dùng lại kết quả cho đối tượng mới | [TC-RS-ERR-015](test-cases.vi.md#tc-rs-err-015) | Có (1; 1 chắc chắn) |
| AC-G40 | Phạm vi từng đợt | [TC-RS-FUNC-002](test-cases.vi.md#tc-rs-func-002), [TC-RS-UI-025](test-cases.vi.md#tc-rs-ui-025), [TC-RS-BR-007](test-cases.vi.md#tc-rs-br-007), [TC-RS-BR-009](test-cases.vi.md#tc-rs-br-009) | Có (4; 4 chắc chắn) |




## Coverage

# Ma trận độ phủ（Coverage Matrix）

Sinh bằng script. Mọi tỷ lệ đều ghi công thức. Đây là độ phủ **thiết kế** (có case), không phải kết quả chạy.

Tổng số test case: **204**.

## 1. Theo category và trạng thái chắc chắn

| Category | CONFIRMED | IMPLEMENTED | PROPOSED | TBD | CONFLICT | Tổng | Priority Cao | Priority TBD |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| A. Functional | 34 | 0 | 1 | 1 | 0 | 36 | 20 | 16 |
| B. Validation | 15 | 2 | 8 | 0 | 0 | 25 | 3 | 22 |
| C. Business Rules | 40 | 0 | 0 | 0 | 0 | 40 | 37 | 3 |
| D. Calculation | 29 | 0 | 1 | 2 | 0 | 32 | 25 | 7 |
| E. UI/Visual | 7 | 1 | 16 | 0 | 2 | 26 | 1 | 25 |
| F. State/Error | 15 | 0 | 0 | 4 | 0 | 19 | 12 | 7 |
| G. Data/Persistence | 8 | 0 | 3 | 0 | 0 | 11 | 2 | 9 |
| H. Regression | 15 | 0 | 0 | 0 | 0 | 15 | 5 | 10 |
| **Tổng** | 163 | 3 | 29 | 7 | 2 | 204 | 105 | 99 |

Case có kỳ vọng chắc chắn (CONFIRMED + IMPLEMENTED): 166/204. Công thức: số case có Status CONFIRMED hoặc IMPLEMENTED ÷ tổng số case.

## 2. Độ phủ yêu cầu

Công thức: **số tiêu chí (hoặc mục đặc tả) có ít nhất 1 test case ÷ tổng số tiêu chí (hoặc mục) của nhóm**. Một tiêu chí có case không có nghĩa mọi khía cạnh đã được kiểm; xem nội dung case.

| Nhóm yêu cầu | Có case | Tổng | Tỷ lệ |
| --- | --- | --- | --- |
| Tiêu chí nghiệm thu AC-G01…AC-G40 «tiêu chí nghiệm thu: Quyền thao tác và phạm vi dữ liệu … Phạm vi từng đợt» ([scope-and-approach.vi.md — AC mapping](scope-and-approach.vi.md#ac) «Tiêu chí nghiệm thu（RSD-AC）→ test case») | 39 | 40 | 39/40 = 97.5% |
| Tiêu chí nghiệm thu có ≥1 case CONFIRMED/IMPLEMENTED | 39 | 40 | 39/40 = 97.5% |
| Mục đặc tả v2, chương 1–12 ([scope-and-approach.vi.md — Coverage](scope-and-approach.vi.md#spec) «Mục đặc tả v2 → test case») | 47 | 49 | 47/49 = 95.9% |
| Mục đặc tả v2 có ≥1 case CONFIRMED/IMPLEMENTED | 47 | 49 | 47/49 = 95.9% |

### 2.1. Theo chương của đặc tả v2

Mục = số mục (N.M) của chương. Test Cases = số case khác nhau trích các mục đó. Covered = số mục có ≥1 case. Missing = Mục − Covered.

| Chương | Mục | Test Cases | Covered | Missing | Mục chưa có case |
| --- | ---: | ---: | ---: | ---: | --- |
| 1. Mục tiêu, phạm vi và quyền sử dụng | 4 | 11 | 3 | 1 | 1.1 |
| 2. Khái niệm và dữ liệu dùng để xét | 4 | 11 | 3 | 1 | 2.1 |
| 3. Bản đồ màn hình và luồng thao tác | 1 | 2 | 1 | 0 | — |
| 4. Danh sách thiết lập và thứ tự ưu tiên | 4 | 23 | 4 | 0 | — |
| 5. Điều kiện áp dụng và nguồn tham chiếu | 6 | 37 | 6 | 0 | — |
| 6. Ngưỡng điểm, công thức và xử lý phần lẻ | 8 | 51 | 8 | 0 | — |
| 7. Quy trình xét và thời điểm cập nhật | 5 | 34 | 5 | 0 | — |
| 8. Trạng thái kết quả và xử lý lỗi | 4 | 25 | 4 | 0 | — |
| 9. Trích xuất thành tích（成績抽出） | 3 | 12 | 3 | 0 | — |
| 10. Công khai thành tích（成績公開） | 3 | 15 | 3 | 0 | — |
| 11. Công cụ phiếu điểm（通知表ツール） và PDF | 3 | 9 | 3 | 0 | — |
| 12. Dữ liệu, tích hợp và bảo toàn chức năng cũ | 4 | 15 | 4 | 0 | — |

### 2.2. Theo nhóm test case

Tiêu chí = số tiêu chí nghiệm thu khác nhau được case của nhóm trích. Test Cases = số case của nhóm. Covered = số tiêu chí trong đó có ≥1 case của nhóm có Status CONFIRMED/IMPLEMENTED (có oracle chắc chắn để chạy). Missing = Tiêu chí − Covered.

| Area | Tiêu chí | Test Cases | Covered | Missing | Notes |
| --- | ---: | ---: | ---: | ---: | --- |
| Functional | 19 | 36 | 19 | 0 | — |
| Validation | 11 | 25 | 11 | 0 | — |
| Business Rules | 18 | 40 | 18 | 0 | — |
| Calculation | 9 | 32 | 9 | 0 | — |
| UI | 6 | 26 | 4 | 2 | Chưa chắc chắn: AC-G26 «Lưu thành công và thông báo an toàn», AC-G29 «Lọc khi trích xuất» |
| Error Handling | 15 | 19 | 12 | 3 | Chưa chắc chắn: AC-G24 «Trigger khi đổi điểm tối đa/đơn vị», AC-G30 «Hiển thị ô trích xuất», AC-G32 «Cấu hình công khai và ẩn điểm» |
| Data | 5 | 11 | 5 | 0 | — |
| Regression | 7 | 15 | 7 | 0 | — |

Tiêu chí và mục chưa có case: [scope-and-approach.vi.md — Coverage](scope-and-approach.vi.md#uncovered) «Tiêu chí và mục đặc tả chưa có test case».

## 3. Độ phủ kịch bản

| Scenario | Kịch bản | Số case |
| --- | --- | --- |
| TS-RS-001 | Quản lý danh sách quy tắc đỏ của một mục | 19 |
| TS-RS-002 | Điều kiện áp dụng | 13 |
| TS-RS-003 | Ngưỡng điểm cố định | 14 |
| TS-RS-004 | Ngưỡng tỷ lệ điểm tối đa | 11 |
| TS-RS-005 | Ngưỡng công thức | 26 |
| TS-RS-006 | Chọn quy tắc và phân nhánh | 8 |
| TS-RS-007 | Nguồn trung bình và tỷ lệ nhóm | 21 |
| TS-RS-008 | Điểm được xét | 6 |
| TS-RS-009 | Thời điểm xét và vòng đời kết quả | 21 |
| TS-RS-010 | Trạng thái kết quả và lỗi | 11 |
| TS-RS-011 | Quyền và kiểm tra phía server | 10 |
| TS-RS-012 | Trích xuất thành tích（成績抽出） | 9 |
| TS-RS-013 | Công khai thành tích（成績公開） | 10 |
| TS-RS-014 | Công cụ phiếu điểm（通知表ツール） và PDF | 8 |
| TS-RS-015 | Ba đầu ra dùng chung một kết quả | 4 |
| TS-RS-016 | Dữ liệu và dữ liệu đỏ cũ | 8 |
| TS-RS-017 | Phạm vi phát hành | 2 |
| TS-RS-018 | Hồi quy AutoRating và các luồng hiện có | 9 |
| TS-RS-019 | Luồng đầu–cuối（end-to-end） | 8 |

Case thuộc ít nhất một kịch bản: 204/204 (số case có trong cột Test case của [test-cases.vi.md](test-cases.vi.md) «Kịch bản kiểm thử (Test Scenario)» ÷ tổng số case).

## 4. Lớp giá trị trong tính toán

| Lớp giá trị | Test case | Status các case |
| --- | --- | --- |
| Giá trị điển hình | [TC-RS-CALC-001](test-cases.vi.md#tc-rs-calc-001), [TC-RS-CALC-005](test-cases.vi.md#tc-rs-calc-005), [TC-RS-CALC-013](test-cases.vi.md#tc-rs-calc-013) | CONFIRMED |
| Nhỏ nhất (S=0, N=0) | [TC-RS-CALC-002](test-cases.vi.md#tc-rs-calc-002), [TC-RS-CALC-009](test-cases.vi.md#tc-rs-calc-009), [TC-RS-VAL-001](test-cases.vi.md#tc-rs-val-001), [TC-RS-VAL-006](test-cases.vi.md#tc-rs-val-006) | CONFIRMED |
| Lớn nhất (N=M, N=100%) | [TC-RS-CALC-009](test-cases.vi.md#tc-rs-calc-009), [TC-RS-VAL-001](test-cases.vi.md#tc-rs-val-001), [TC-RS-VAL-006](test-cases.vi.md#tc-rs-val-006) | CONFIRMED |
| Biên ±1 (29/30/31, −1/101) | [TC-RS-CALC-001](test-cases.vi.md#tc-rs-calc-001), [TC-RS-VAL-001](test-cases.vi.md#tc-rs-val-001), [TC-RS-VAL-006](test-cases.vi.md#tc-rs-val-006) | CONFIRMED |
| Bằng 0 (T=0, A=0, trừ 0) | [TC-RS-CALC-002](test-cases.vi.md#tc-rs-calc-002), [TC-RS-CALC-018](test-cases.vi.md#tc-rs-calc-018), [TC-RS-CALC-021](test-cases.vi.md#tc-rs-calc-021), [TC-RS-CALC-030](test-cases.vi.md#tc-rs-calc-030) | CONFIRMED |
| Trống / null | [TC-RS-BR-014](test-cases.vi.md#tc-rs-br-014), [TC-RS-CALC-030](test-cases.vi.md#tc-rs-calc-030), [TC-RS-VAL-004](test-cases.vi.md#tc-rs-val-004), [TC-RS-VAL-010](test-cases.vi.md#tc-rs-val-010) | CONFIRMED |
| Số thập phân | [TC-RS-CALC-003](test-cases.vi.md#tc-rs-calc-003), [TC-RS-CALC-006](test-cases.vi.md#tc-rs-calc-006), [TC-RS-CALC-008](test-cases.vi.md#tc-rs-calc-008), [TC-RS-VAL-005](test-cases.vi.md#tc-rs-val-005) | CONFIRMED, PROPOSED |
| Làm tròn | [TC-RS-CALC-007](test-cases.vi.md#tc-rs-calc-007), [TC-RS-CALC-014](test-cases.vi.md#tc-rs-calc-014), [TC-RS-CALC-019](test-cases.vi.md#tc-rs-calc-019), [TC-RS-CALC-020](test-cases.vi.md#tc-rs-calc-020) | CONFIRMED, PROPOSED |
| Số âm | [TC-RS-CALC-016](test-cases.vi.md#tc-rs-calc-016), [TC-RS-CALC-019](test-cases.vi.md#tc-rs-calc-019), [TC-RS-VAL-001](test-cases.vi.md#tc-rs-val-001), [TC-RS-VAL-006](test-cases.vi.md#tc-rs-val-006) | CONFIRMED, PROPOSED |
| M không hợp lệ | [TC-RS-CALC-010](test-cases.vi.md#tc-rs-calc-010) | CONFIRMED |
| Chia 0 | [TC-RS-CALC-021](test-cases.vi.md#tc-rs-calc-021), [TC-RS-VAL-009](test-cases.vi.md#tc-rs-val-009) | CONFIRMED |
| Sai số dấu phẩy động | [TC-RS-CALC-028](test-cases.vi.md#tc-rs-calc-028) | CONFIRMED |
| Tràn số | [TC-RS-CALC-029](test-cases.vi.md#tc-rs-calc-029) | CONFIRMED |
| Giá trị trước/sau làm tròn ở biên nhánh | [TC-RS-CALC-022](test-cases.vi.md#tc-rs-calc-022), [TC-RS-CALC-023](test-cases.vi.md#tc-rs-calc-023), [TC-RS-CALC-025](test-cases.vi.md#tc-rs-calc-025) | CONFIRMED, TBD |

## 5. Theo file

| File | Số case |
| --- | --- |
| [test-cases.vi.md](test-cases.vi.md) | 112 |
| [test-cases.vi.md](test-cases.vi.md) | 32 |
| [test-cases.vi.md](test-cases.vi.md) | 26 |
| [test-cases.vi.md](test-cases.vi.md) | 19 |
| [test-cases.vi.md](test-cases.vi.md) | 15 |
