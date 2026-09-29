# 06 — Test case lỗi, trạng thái và trường hợp biên (ERR)

Vai trò mặc định, nơi xem kết quả xét, bằng chứng mặc định và tra nhanh mã dữ liệu (TD-…): [01 §9](01-test-strategy.vi.md#conventions) «Quy ước thực thi chung».

Quy ước như [03](03-test-cases.vi.md) «Test case chức năng, quy tắc nghiệp vụ, validation và dữ…». Case cần giả lập lỗi kỹ thuật phụ thuộc cách giả lập được team cho phép; case gửi request trực tiếp chỉ chạy trên môi trường test (TD-ENV-01 «Môi trường chạy, Trường test, Năm học»), không dùng tài khoản hay dữ liệu thật. Mọi case đang **NOT RUN**.

<a id="tc-rs-err-001"></a>

### TC-RS-ERR-001 — Hiển thị theo từng trạng thái kết quả ở ba đầu ra

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Trạng thái sau lần chạy” (AC-G20)

<!-- Mã truy vết: TD-ITEM-01, TC-RS-BR-010, TC-RS-BR-002, TD-OUT-01, TD-OUT-03, TD-OUT-04 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Chuẩn bị bảy ô cùng mục mục số nguyên (M=100): (1) Đỏ; (2) Không đỏ; (3) Chưa từng xét (ô mới, chưa có lượt xét); (4) Chưa xét được (như case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”); (5) Không áp dụng (như case “Không quy tắc nào khớp khi đủ dữ liệu → Không áp dụng”); (6) Không có điểm (S05); (7) Đang chờ chạy lại: Đỏ trước đó, sau đó đổi ngưỡng và chưa chạy lại.
- Dữ liệu test: mục số nguyên (M=100); cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước

**操作（Thao tác）**

1. Chạy trích xuất có lọc đỏ và xuất Excel.
2. Xem màn học sinh công khai.
3. Xuất PDF phiếu.

**期待結果（Kết quả mong đợi）**

Chỉ ô (1) và (7) có dấu đỏ và làm học sinh thỏa lọc đỏ. Ô (2)–(6) không có dấu đỏ, không thỏa lọc; (3), (4), (5) không được hiển thị như "đạt". Ba đầu ra cho cùng kết luận.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 8.1 “Các trạng thái phải phân biệt” (bảng trạng thái và cột Dấu/lọc đỏ, đoạn "Đang chờ chạy lại"), mục 9.2 “Kết quả và ví dụ”, mục 10.3 “Quyền, thời điểm và đầu ra liên quan”, mục 11.2 “Thứ tự và điều kiện khớp đầu tiên”
- Bằng chứng cần chụp: File Excel, ảnh màn học sinh, file PDF.
- Ghi chú: Không bắt buộc có nhãn trạng thái trên màn học sinh (đặc tả v2 mục 8.1 “Các trạng thái phải phân biệt”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-002"></a>

### TC-RS-ERR-002 — Lỗi kỹ thuật khi lưu kết quả khác với Chưa xét được; không báo thành công giả

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn” (AC-G26)

<!-- Mã truy vết: TD-ITEM-01, TD-STU-01, TD-RULE-01, AC-G26 -->

**前提条件（Điều kiện trước）**

- Điều kiện: S01 Đỏ. Có cách gây lỗi ghi kết quả trong lượt đăng ký và lỗi lưu điểm. Có file CSV điểm và bài thi đã chấm liên kết tới mục số nguyên (M=100) cho G-A.
- Dữ liệu test: học sinh S01 (điểm 29); mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

1. Đường (a) nhập trực tiếp ở màn đăng ký điểm của lớp: sửa S01 thành 40 trong khi giả lập lỗi ghi kết quả.
2. Đường (b) Đăng ký thành tích bằng CSV（成績CSV登録）: nhập S01 = 40 trong khi giả lập lỗi ghi kết quả.
3. Đường (c) liên kết điểm thi: liên kết S01 = 40 trong khi giả lập lỗi ghi kết quả.
4. Với một đường bất kỳ, giả lập lỗi ngay ở bước lưu điểm (điểm không được lưu).
5. Sau mỗi bước, xem thông báo, điểm và ba đầu ra.

**期待結果（Kết quả mong đợi）**

1–3. Ở cả ba đường: không báo đã xét thành công hay đã ngừng kết quả cũ. Điểm và kết quả nhất quán theo ranh giới giao dịch của đường đăng ký (không có tình trạng điểm 40 đã công bố thành công nhưng kết quả vẫn là Đỏ của 29 mà không có thông báo). Trạng thái không bị ghi thành Chưa xét được.

4. Điểm vẫn là 29 và kết quả Đỏ cũ vẫn hiệu lực; không báo xét thành công.
5. Thông báo không chứa lỗi SQL, stack trace hay dữ liệu học sinh ngoài quyền.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 8.4 “Lỗi kỹ thuật và thông báo” (đoạn đầu, gạch đầu dòng 1 và 3); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn” (AC-G26); [tài liệu chia công việc v2](../split-tasks.vi.md) (RSD-TASK) công việc “Cập nhật kết quả khi đăng ký và chạy hàng loạt” (Task 4) (Thay đổi nghiệp vụ); Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:7476–7479)
- Bằng chứng cần chụp: Ảnh thông báo của từng đường; SELECT điểm và kết quả sau mỗi bước.
- Sau khi chạy: Gỡ giả lập lỗi.
- Ghi chú: BLOCKED cho tới khi có cách giả lập lỗi (hỏi team dev).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-003"></a>

### TC-RS-ERR-003 — Batch hoàn tất một phần: báo đúng phạm vi đã/không cập nhật

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Batch hoàn tất một phần” (AC-G27)

<!-- Mã truy vết: TD-GRP-01, AC-G27 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Batch cho khối gồm G-A và G-B; giả lập lỗi ở phần G-B.
- Dữ liệu test: các lớp học phần G-A, G-B, G-C

**操作（Thao tác）**

1. Chạy nút cam cho khối.
2. Xem thông báo và kết quả từng lớp.
3. Gỡ giả lập lỗi, chạy lại nút cam chỉ cho phạm vi G-B.
4. Xem kết quả hai lớp.
5. Chạy nút cam cho G-A; khi chưa xong, giáo viên sửa và lưu điểm S01. Chờ batch xong, xem thông báo/tiến độ và kết quả S01.

**期待結果（Kết quả mong đợi）**

1–2. G-A cập nhật; G-B giữ trạng thái trước lượt. Thông báo cho biết phạm vi đã cập nhật, chưa cập nhật và cần chạy lại; không báo hoàn tất toàn bộ; không suy số lớp đã xử lý thành số ô đã xét. Không hứa rollback toàn lượt. Không tự retry vô hạn.

3–4. G-B được cập nhật; G-A giữ kết quả của bước 1, mỗi ô chỉ có một kết quả hiệu lực, không trùng.

5. Phần của S01 trong lượt batch (đã bị lần lưu mới thay thế) không được tính là cập nhật thành công, cũng không được tính là Chưa xét được; S01 giữ kết quả của lần lưu mới. (PROPOSED theo thiết kế DB v2 mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi”) Tiến độ ghi phần này là `superseded`; deadlock/timeout rollback toàn transaction đó và chỉ retry hữu hạn theo job hiện có.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 8.4 “Lỗi kỹ thuật và thông báo” (gạch đầu dòng 2–4); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Batch hoàn tất một phần” (AC-G27); [tài liệu chia công việc v2](../split-tasks.vi.md) (RSD-TASK) công việc “Cập nhật kết quả khi đăng ký và chạy hàng loạt” (Task 4) (Thay đổi nghiệp vụ; Hướng kỹ thuật: "Không giả định batch hoàn tác toàn bộ"); [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Xử lý hiện có có bảo đảm cả lượt hàng loạt cùng thành công hoặc cùng thất bại…” (Q21); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi” (lượt bị thay thế, deadlock/timeout — PROPOSED); Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:7467–7479)
- Bằng chứng cần chụp: Ảnh thông báo; ảnh kết quả hai lớp sau bước 1 và sau bước 3; ảnh thông báo/tiến độ và kết quả S01 ở bước 5.
- Ghi chú: Hành vi thành công một phần theo AutoRating hiện có là PROPOSED; phần kiểm ở đây là nguyên tắc CONFIRMED của đặc tả v2 mục 8.4 “Lỗi kỹ thuật và thông báo”. BLOCKED cho tới khi có cách giả lập lỗi (hỏi team dev).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-004"></a>

### TC-RS-ERR-004 — Đã xếp hàng không phải đã hoàn tất; bấm chạy trùng

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Batch hoàn tất một phần” (AC-G27)

<!-- Mã truy vết: TD-ROLE-03, TD-RULE-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: tài khoản có quyền chạy hàng loạt. Đã đổi ngưỡng, chưa chạy lại.
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

1. Bấm Thực hiện tính toán tự động（自動算出実行）, đọc thông báo ngay khi request trả về.
2. Bấm lại lần nữa khi lượt đầu chưa xong.
3. Sau khi xong, xem kết quả.

**期待結果（Kết quả mong đợi）**

1. Nếu xử lý chạy nền: thông báo là đã nhận/xếp hàng, không phải đã hoàn tất; kết quả chưa đổi cho tới khi xử lý xong.
2. Chống trùng theo cơ chế hiện có (không tạo hai lượt ghi chồng gây kết quả sai).
3. Một kết quả hiện hành cho mỗi ô, đúng theo ngưỡng mới.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 8.4 “Lỗi kỹ thuật và thông báo” (gạch đầu dòng 4), mục 7.3 “Thay đổi điểm tối đa” (Thiết lập điểm tối đa hàng loạt（満点一括設定）: "kết quả mới chỉ có sau xử lý thành công")
- Bằng chứng cần chụp: Ảnh thông báo; ảnh kết quả; log job nếu có.
- Ghi chú: Không yêu cầu retry vô hạn.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-005"></a>

### TC-RS-ERR-005 — Thông báo lỗi không lộ SQL, stack trace hoặc dữ liệu ngoài quyền

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn” (AC-G26)

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Các tình huống lỗi của ERR-002, ERR-003, ERR-006, ERR-009.
- Dữ liệu test: —

**操作（Thao tác）**

Thu thập mọi thông báo lỗi hiển thị cho người dùng trong các case trên.

**期待結果（Kết quả mong đợi）**

Không có câu SQL, stack trace, đường dẫn file server hoặc tên/điểm học sinh ngoài quyền người thao tác.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 8.4 “Lỗi kỹ thuật và thông báo” (gạch đầu dòng 3)
- Bằng chứng cần chụp: Ảnh toàn văn từng thông báo lỗi thu được ở ERR-002, ERR-003, ERR-006, ERR-009.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-006"></a>

### TC-RS-ERR-006 — Gửi request lưu quy tắc trực tiếp khi không có quyền sửa mục

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Quyền thao tác và phạm vi dữ liệu” (AC-G01)

<!-- Mã truy vết: TD-ROLE-02, TD-ITEM-06, TD-ROLE-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: tài khoản giáo viên không có quyền sửa mục; mục chỉ dành nội bộ có một quy tắc. Có bản ghi request lưu/xóa/đổi thứ tự hợp lệ lấy từ tài khoản giáo viên có quyền sửa mục.
- Dữ liệu test: tài khoản giáo viên không có quyền sửa mục, mục chỉ dành nội bộ

**操作（Thao tác）**

Dùng phiên tài khoản giáo viên không có quyền sửa mục gửi lại các request POST lưu, xóa, đổi thứ tự quy tắc của mục chỉ dành nội bộ.

**期待結果（Kết quả mong đợi）**

Mọi request bị từ chối; cấu hình không đổi; không có lượt xét phát sinh.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 1.3 “Quyền sử dụng” ("Kiểm quyền sửa mục ở cả màn hình và yêu cầu lưu"); CODE `checkAuthority('manage')`, `mw_only_flg` (kiểm quyền server của màn manage và cờ mục chỉ nội bộ hiện có)
- Bằng chứng cần chụp: Mã phản hồi/nội dung phản hồi (che token); SELECT cấu hình trước/sau.
- Ghi chú: Không ghi cookie/token vào bằng chứng ([tài liệu “Hướng dẫn thu thập bằng chứng”](09-evidence-guideline.vi.md)).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-007"></a>

### TC-RS-ERR-007 — Giả mạo ID khác trường/năm hoặc nguồn không được phép

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Quyền thao tác và phạm vi dữ liệu” (AC-G01)

<!-- Mã truy vết: TD-ROLE-06, TD-ROLE-01, TD-ENV-02, AC-G01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: tài khoản của trường B (trường B) và tài khoản giáo viên có quyền sửa mục (trường A). Ghi lại cấu hình, điểm và kết quả đỏ của trường A trước khi chạy.
- Dữ liệu test: trường B (trường khác), tài khoản của trường B

**操作（Thao tác）**

1. tài khoản của trường B mở URL/gửi request xem, lưu, xóa quy tắc với ID mục/quy tắc của trường A.
2. tài khoản giáo viên có quyền sửa mục lưu quy tắc của trường A nhưng sửa request để nguồn tổng hợp trỏ tới thiết lập tổng hợp của trường B hoặc năm 2025.
3. tài khoản giáo viên có quyền sửa mục lưu quy tắc của trường A nhưng sửa request: ID lớp/nhóm trong bộ lọc và ID đơn vị thuộc trường B hoặc năm 2025.

**期待結果（Kết quả mong đợi）**

1. Bị từ chối, không đọc được dữ liệu trường A.
2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.
3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.

Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 1.3 “Quyền sử dụng” (đoạn cuối: "Không mở quyền qua việc đổi ID… Nguồn tổng hợp, mục đánh giá, lớp và đơn vị được chọn phải thuộc ngữ cảnh… được phép"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Quyền thao tác và phạm vi dữ liệu” (AC-G01) ("Từ chối ID bị sửa trái phép mà không đổi cấu hình, điểm hoặc kết quả")
- Bằng chứng cần chụp: Phản hồi; SELECT cấu hình, điểm và kết quả trước/sau.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-008"></a>

### TC-RS-ERR-008 — Gọi trực tiếp request chạy tính toán hàng loạt khi không có quyền chạy

Priority: TBD ｜ Status: TBD ｜ Requirement ID: tiêu chí nghiệm thu “Quyền thao tác và phạm vi dữ liệu” (AC-G01)

<!-- Mã truy vết: TD-ROLE-04, TD-ROLE-03, SI-05 -->

**前提条件（Điều kiện trước）**

- Điều kiện: tài khoản sửa được mục nhưng không có quyền chạy hàng loạt; bản ghi request chạy nút cam hợp lệ từ tài khoản có quyền chạy hàng loạt.
- Dữ liệu test: tài khoản sửa được mục nhưng không có quyền chạy hàng loạt

**操作（Thao tác）**

Dùng phiên tài khoản sửa được mục nhưng không có quyền chạy hàng loạt gửi request chạy tính toán hàng loạt cho khối 1.

**期待結果（Kết quả mong đợi）**

Kỳ vọng theo đặc tả v2: bị từ chối, không xếp hàng/không xét. Code hiện tại có khả năng lệch (`autoRatingRun` không kiểm lại quyền/điều kiện ở server) — ghi hành vi thực tế.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 1.3 “Quyền sử dụng” (Chạy tính toán hàng loạt); [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Ai được thiết lập điều kiện điểm đỏ?” (Q1); code hiện tại “`autoRatingRun` không kiểm lại quyền/điều kiện ở server” (endpoint `autoRatingRun` chưa kiểm quyền); khác biệt đặc tả–code về “Quyền chạy hàng loạt” (SI-05)
- Bằng chứng cần chụp: Phản hồi; log job; kết quả trước/sau.
- Ghi chú: TBD vì phạm vi quyền chạy hiện hành cần xác định (quyền nào là "quyền thực thi hiện hành").

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-009"></a>

### TC-RS-ERR-009 — Server kiểm miền giá trị khi bỏ qua kiểm tra phía trình duyệt

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11); tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16)

<!-- Mã truy vết: TD-ROLE-01, AC-G11, AC-G16, SI-06 -->

**前提条件（Điều kiện trước）**

- Điều kiện: tài khoản giáo viên có quyền sửa mục; bản ghi request lưu ngưỡng hợp lệ.
- Dữ liệu test: N cố định = 101, −1; tỷ lệ = 101; mẫu số cố định = 0; N = `NaN`, `Infinity`, `1e400`, chuỗi rỗng; công thức có phép toán/hàm không được phép (ví dụ `^`, `max`) hoặc chuỗi biểu thức tự do thay cho các dòng; điều kiện áp dụng (khi có schema, PROPOSED theo thiết kế DB v2 mục 3.2 “`apply_condition`”): JSON `null`, chuỗi rỗng, object rỗng, khóa lạ, cả hai array rỗng

**操作（Thao tác）**

Sửa request (bỏ kiểm tra JS) và gửi từng giá trị.

**期待結果（Kết quả mong đợi）**

Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.2 “Ngưỡng cố định”, mục 6.3 “Tỷ lệ điểm tối đa”, mục 6.4 “Công thức dùng trung bình”, mục 6.8 “Yêu cầu độ chính xác” ("không nhận số vô hạn/không phải số"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11), tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16) (công thức theo dòng, không biểu thức tự do); code hiện tại “AutoRating không giới hạn server `decimal_place` / số dòng công thức” (`decimal_place` không giới hạn ở server); khác biệt đặc tả–code về “Giới hạn giá trị ở server” (SI-06)
- Bằng chứng cần chụp: Phản hồi; SELECT cấu hình.
- Ghi chú: Giới hạn `p` 1–9 là PROPOSED: gửi `p=0`, `p=10` và ghi hành vi thực tế vào Notes, không đánh FAIL.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-010"></a>

### TC-RS-ERR-010 — Server không tin cờ đỏ hoặc ngưỡng do trình duyệt gửi lên

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Excel khớp và dùng kết luận server” (AC-G31)

<!-- Mã truy vết: TD-OUT-01, TD-STU-03, TD-ROLE-07, AC-G31 -->

**前提条件（Điều kiện trước）**

- Điều kiện: S03=31 Không đỏ; cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu.
- Dữ liệu test: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu; học sinh S03 (điểm 31)

**操作（Thao tác）**

1. Đăng nhập tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm), chạy Trích xuất thành tích（成績抽出） với cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, bấm tải Excel.
2. Dùng công cụ chặn request được phép trên môi trường test, sửa bảng dữ liệu trong request POST gửi tới `output_excel` theo từng biến thể: (a) thêm dấu/màu đỏ cho ô S03; (b) đổi giá trị ô; (c) thêm tham số ngưỡng 50.
3. Gửi request, mở file Excel nhận được.

**期待結果（Kết quả mong đợi）**

Excel vẫn dựa trên kết quả đã kiểm quyền ở server: S03 không có dấu/màu đỏ, không thỏa lọc; không đưa ra học sinh/ô ngoài phạm vi được phép.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 9.3 “Xuất file” ("Không nhận cờ đỏ hoặc kết quả tính ngưỡng do trình duyệt gửi lên như kết luận tin cậy"), mục 12.2 “Điểm tích hợp chính” (Trích xuất và Excel); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Excel khớp và dùng kết luận server” (AC-G31); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 5.1 “Thiết lập hiển thị của Trích xuất thành tích（成績抽出）và Công cụ phiếu điểm（通知表ツール）” (lọc/trang trí chỉ dựa trên kết quả xét hiện hành phía server); [tài liệu chia công việc v2](../split-tasks.vi.md) (RSD-TASK) công việc “Lọc điểm đỏ và hiển thị trên Excel” (Task 5) (xử lý xuất Excel nhận bảng qua POST); CODE `AdminNBGradeExtractionResultExcelController::output_excel`
- Bằng chứng cần chụp: Request đã sửa (che token); file Excel.
- Ghi chú: Nếu request không có tham số nào để sửa, ghi "không áp dụng" kèm bằng chứng request.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-011"></a>

### TC-RS-ERR-011 — Lượt cũ hoàn tất muộn không ghi đè kết quả của điểm/cấu hình mới hơn

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Nhận diện ô điểm” (AC-G03); tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12); tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại” (AC-G21); tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật” (AC-G22)

<!-- Mã truy vết: TD-RULE-01, TD-RULE-07, TD-STU-01, AC-G21, AC-G22, AC-G12, AC-G03 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Batch lớn đang chạy cho khối 1; quy tắc “Cố định 30” (dưới 30) trên mục của S01; nguồn trung bình của cặp quy tắc phân nhánh theo trung bình 60 đã có một bản tổng hợp.
- Dữ liệu test: học sinh S01 (điểm 29); quy tắc “Cố định 30” (dưới 30); cặp quy tắc phân nhánh theo trung bình 60

**操作（Thao tác）**

1. Khi batch chưa xong, sửa S01 từ 29 thành 40 và lưu.
2. Chờ batch xong, xem S01.
3. Chạy lại batch; khi chưa xong, đổi ngưỡng quy tắc “Cố định 30” (dưới 30) thành 45, lưu, rồi đăng ký lại điểm S01 (40). Chờ batch cũ xong, xem S01.
4. Với mục dùng cặp quy tắc phân nhánh theo trung bình 60: bắt đầu batch; khi chưa xong, bấm Thực hiện tổng hợp（集計実行） cho cùng phạm vi, chờ cả hai xong. SELECT kết quả và bản nguồn được ghi nhận cho các ô của lượt batch.
5. Khôi phục ngưỡng 30, S01 = 29 (Đỏ). Bắt đầu batch; khi batch đã đọc điểm 29 nhưng chưa xong, sửa S01 thành 40 và lưu, rồi sửa lại 29 và lưu. Chờ batch cũ xong, SELECT kết quả S01.
6. Lặp bước 5 nhưng thay bằng: xóa trống ô S01 và lưu, rồi nhập lại 29 và lưu.
7. S01 = 40 (Không đỏ). Bắt đầu batch; khi chưa xong, chỉ đổi ngưỡng quy tắc “Cố định 30” (dưới 30) thành 45 và lưu, không đăng ký lại điểm. Chờ batch cũ xong, xem S01; sau đó chạy lại batch và xem S01.

**期待結果（Kết quả mong đợi）**

1–2. S01 = 40 và Không đỏ; batch cũ không ghi lại kết quả Đỏ của điểm 29.

3. S01 Đỏ theo cấu hình mới (`40<45`); batch cũ không ghi đè bằng kết quả theo ngưỡng 30.
4. Mọi ô của một lượt batch dùng cùng một bản nguồn (hoặc toàn bản cũ, hoặc toàn bản mới); không có lượt báo thành công mà ghép điểm/kết quả của hai thời điểm.
5–6. Kết quả hiện hành của S01 là kết quả của lần lưu cuối (29 → Đỏ, xét bởi lần đăng ký sau cùng); lượt batch cũ không ghi đè dù giá trị điểm cuối trùng với giá trị batch đã đọc. Ô chỉ có một dòng kết quả hiện hành.
7. Sau khi chỉ lưu ngưỡng: kết quả trước được giữ tới lần xét lại (tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại”). Chạy lại batch → S01 Đỏ theo ngưỡng 45. (PROPOSED theo thiết kế DB v2 mục 6.2 “Đăng ký thường và batch”) Lượt batch cũ bị từ chối ghi vì phiên bản danh sách quy tắc (`red_score_revision`) đã đổi, nên không ghi kết quả theo ngưỡng 30 sau khi ngưỡng mới đã được lưu.
8. (PROPOSED) SELECT `write_version`, `judged_version`, `rule_revision` của S01: `judged_version` bằng phiên bản của lần ghi hoàn tất sau cùng; lượt cũ không làm giảm hay ghi đè các giá trị này.

**補足（Bổ sung）**

- Nguồn: [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật” (AC-G22) ("Lượt cũ hoàn tất muộn không ghi đè kết quả của điểm/cấu hình mới hơn, không ghép điểm và kết quả khác thời điểm rồi báo thành công"), tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12) ("một lượt không trộn các thời điểm của cùng nguồn"); [tài liệu chia công việc v2](../split-tasks.vi.md) (RSD-TASK) công việc “Hỗ trợ điều kiện và công thức dùng tổng hợp” (Task 3) ("Một lượt dùng cùng nguồn nhiều lần phải cùng bản"); [đặc tả v2](../specification.vi.md) (R18) mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất” (phương án kỹ thuật v2); [context điểm đỏ](../../../CONTEXT.md) (CTX) mục 9.6 “Ba phản hồi review DB và bài học thiết kế ngày 28/09” (phản hồi review DB của khách hàng: chống batch dùng điểm 29 ghi đè kết quả đã lưu cho điểm 40; xử lý xóa/tạo lại); tiêu chí nghiệm thu v2 (RSD-AC) tiêu chí nghiệm thu “Nhận diện ô điểm” (AC-G03) (ví dụ thứ tự cập nhật: 29→40→29, xóa trống rồi nhập lại); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 6.2 “Đăng ký thường và batch”, mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi” (PROPOSED)
- Bằng chứng cần chụp: Thời điểm các thao tác; SELECT kết quả (và bản nguồn của từng ô khi có schema).
- Sau khi chạy: Khôi phục ngưỡng quy tắc “Cố định 30” (dưới 30) = 30.
- Ghi chú: Hành vi ở bước 1–6 là yêu cầu CONFIRMED (tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật”, tiêu chí nghiệm thu “Nhận diện ô điểm”, tiêu chí nghiệm thu “Đúng phạm vi tham chiếu”). Cơ chế thế hệ/phiên bản/khóa và bước 8 là PROPOSED (thiết kế DB v2 mục 6 “Phương thức xử lý cập nhật đồng thời”, chưa review/chưa thực thi DDL); nếu hiện thực khác nhưng hành vi đúng thì ghi Notes, không FAIL. Khó tái hiện — cần dữ liệu đủ lớn hoặc cách làm chậm job; nếu không tái hiện được thứ tự hoàn tất thì ghi BLOCKED, không ghi PASS.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-012"></a>

### TC-RS-ERR-012 — Nhập CSV lựa chọn điểm tối đa của lớp

Priority: TBD ｜ Status: TBD ｜ Requirement ID: tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị” (AC-G24)

<!-- Mã truy vết: TD-ITEM-03, TD-RULE-03, SI-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc tỷ lệ 30% (30%); S06 U1=14 Không đỏ với M=40.
- Dữ liệu test: mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc tỷ lệ 30%; CSV gán lựa chọn M=50 cho lớp G-B

**操作（Thao tác）**

1. Nhập CSV lựa chọn điểm tối đa.
2. Xem kết quả S06 U1.

**期待結果（Kết quả mong đợi）**

TBD (chưa chốt): có cần xét lại ngay (`T=15` → Đỏ) hay giữ kết quả trước tới lần chạy lại. Ghi hành vi thực tế.

**補足（Bổ sung）**

- Nguồn: code hiện tại: đường CSV lựa chọn lớp NB không gọi AutoRating; khác biệt đặc tả–code về “CSV lựa chọn điểm tối đa của lớp (đường ghi điểm CSV lựa chọn lớp NB)” (SI-01)
- Bằng chứng cần chụp: File CSV (dữ liệu giả); ảnh kết quả.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-013"></a>

### TC-RS-ERR-013 — Trích xuất: ô vừa thỏa điều kiện màu khác vừa là ô đỏ

Priority: TBD ｜ Status: TBD ｜ Requirement ID: tiêu chí nghiệm thu “Hiển thị ô trích xuất” (AC-G30)

<!-- Mã truy vết: TD-STU-01, SI-12 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mục có điều kiện Khoảng điểm（点数範囲） 0–30 tô Vàng（黄） và điều kiện đỏ tô Đỏ（赤）, ký hiệu `*`.
- Dữ liệu test: học sinh S01 (điểm 29) (29)

**操作（Thao tác）**

Chạy trích xuất, xuất Excel.

**期待結果（Kết quả mong đợi）**

TBD (chưa chốt) cho màu cuối. CONFIRMED phần không tranh chấp: điều kiện Khoảng điểm vẫn giữ nghĩa cũ; màn hình và Excel cho cùng kết quả.

**補足（Bổ sung）**

- Nguồn: CODE `addFilterResultProperty` (điều kiện sau ghi đè thuộc tính hiển thị); [đặc tả v2](../specification.vi.md) (R18) mục 9.2 “Kết quả và ví dụ” (đoạn cuối); khác biệt đặc tả–code về “Trùng màu ở trích xuất” (SI-12)
- Bằng chứng cần chụp: Ảnh màn, file Excel.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-014"></a>

### TC-RS-ERR-014 — Mục bị ẩn theo thiết lập ẩn mục nhập

Priority: TBD ｜ Status: TBD ｜ Requirement ID: tiêu chí nghiệm thu “Cấu hình công khai và ẩn điểm” (AC-G32)

<!-- Mã truy vết: TD-ITEM-01, TD-STU-06, TC-RS-FUNC-027 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có quy tắc, bị ẩn cho G-B qua Thiết lập ẩn mục nhập（入力項目の非表示設定）.
- Dữ liệu test: mục số nguyên (M=100); học sinh S06 (điểm dự kiến 24)

**操作（Thao tác）**

Chạy xét; xem ba đầu ra cho S06.

**期待結果（Kết quả mong đợi）**

Có xét hay không: TBD (chưa chốt). CONFIRMED phần không tranh chấp: không đầu ra nào làm hiện lại điểm đang bị ẩn.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?” (Q16) (điểm ẩn không bị làm lộ)
- Bằng chứng cần chụp: Ảnh đầu ra.
- Ghi chú: Công khai với Không hiển thị（表示しない）: case “Công khai: kết hợp hiệu ứng Điểm dự kiến（見込点） và điểm đỏ, khử trùng”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-015"></a>

### TC-RS-ERR-015 — Bản ghi điểm bị xóa rồi tạo lại không kế thừa kết quả cũ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Nhận diện ô điểm” (AC-G03); tiêu chí nghiệm thu “Không dùng lại kết quả cho đối tượng mới” (AC-G39)

<!-- Mã truy vết: TD-ITEM-03, AC-G03 -->

**前提条件（Điều kiện trước）**

- Điều kiện: S01 Đỏ ở mục điểm đơn vị (đơn vị U1 có M riêng 40) U1.
- Dữ liệu test: mục điểm đơn vị (đơn vị U1 có M riêng 40)

**操作（Thao tác）**

1. Bỏ sử dụng đơn vị U1 cho lớp (hoặc thay khung điểm theo thao tác hiện có) để ô bị xóa/ngừng hoạt động.
2. Tạo lại ô, nhập 35, lưu.
3. Xem đầu ra.
4. Đưa ô về Đỏ (nhập 29, lưu). Xóa ô (hoặc xóa mềm theo thao tác hiện có), rồi kích hoạt lại/tạo lại ô với **cùng giá trị 29** nhưng không qua đường xét (nếu có thao tác như vậy, ví dụ khôi phục); xem đầu ra. Sau đó đăng ký lại điểm và xem.
5. Bắt đầu batch cho lớp khi ô đang Đỏ; khi batch chưa xong, xóa ô rồi tạo lại và nhập 35. Chờ batch cũ xong, xem đầu ra và SELECT.

**期待結果（Kết quả mong đợi）**

Sau bước 1: không còn dấu đỏ của ô cũ. Sau bước 2: ô mới được xét theo 35 → Không đỏ; không mang kết quả Đỏ cũ.

4. Kích hoạt lại/nhập lại cùng giá trị không làm kết quả Đỏ trước khi xóa sống lại; ô chỉ có kết quả của lần xét sau khi tạo lại.
5. Lượt batch cũ không ghi kết quả vào ô đã tạo lại; ô giữ kết quả của lần đăng ký 35 (Không đỏ). (PROPOSED theo thiết kế DB v2 mục 4.4 “Cập nhật và hiệu lực kết quả”, mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi”) Khi xóa: `cell_generation` mới, `judgment_status`=4 và thông tin quy tắc/ngưỡng/nguồn cũ bị xóa trong cùng transaction; dòng điều khiển được giữ; tạo lại dùng thế hệ mới.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 2.2 “Một ô điểm được nhận diện như thế nào?” (đoạn cuối), mục 7.3 “Thay đổi điểm tối đa” (dòng cuối bảng), mục 12.4 “Sao chép, năm mới, nhập/xuất và khôi phục” (Khôi phục/thay khung điểm); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Nhận diện ô điểm” (AC-G03) ("Nhập lại cùng điểm hoặc kích hoạt lại bản ghi xóa mềm cũ cũng không được làm kết quả của xử lý cũ sống lại"); [context điểm đỏ](../../../CONTEXT.md) (CTX) mục 9.6 “Ba phản hồi review DB và bài học thiết kế ngày 28/09” (phản hồi review DB: xử lý xóa/tạo lại ô điểm); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 4.4 “Cập nhật và hiệu lực kết quả”, mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi” (PROPOSED)
- Bằng chứng cần chụp: Ảnh đầu ra; SELECT kết quả.
- Ghi chú: Thao tác xóa/tạo lại ô cụ thể: hỏi team dev khi chuẩn bị. Bước 4 chỉ chạy nếu có đường kích hoạt lại không qua xét; không có thì ghi SKIPPED cho phần đó. Bước 5 cần cách làm chậm job; không tái hiện được thì BLOCKED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-016"></a>

### TC-RS-ERR-016 — Chưa xét được: sửa nguồn nhưng chỉ lưu cấu hình vẫn chưa có kết luận; xét lại mới có

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Trạng thái sau lần chạy” (AC-G20)

<!-- Mã truy vết: TC-RS-BR-010, TD-STU-01, TD-SRC-02 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Ô S01 Chưa xét được (như case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”: công thức `A×0.5`, nguồn chưa tổng hợp). Nguồn không có bản chốt.
- Dữ liệu test: học sinh S01 (điểm 29); nguồn sau tổng hợp có `A=62` (giá trị như bản tổng hợp mới nhất chưa chốt (trung bình 62))

**操作（Thao tác）**

1. Chạy Thực hiện tổng hợp（集計実行） cho nguồn để có `A=62`; mở lại và lưu thiết lập quy tắc (không đổi nội dung). Xem đầu ra.
2. Chạy nút cam. Xem đầu ra.

**期待結果（Kết quả mong đợi）**

1. Vẫn Chưa xét được; không có dấu đỏ.
2. `T=62×0.5=31` → S01=29 Đỏ.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 8.2 “Bảng chuyển trạng thái” (hai dòng cuối), mục 7.2 “Bảng sự kiện” (Tổng hợp lại/cập nhật nhóm tham chiếu)
- Bằng chứng cần chụp: Ảnh đầu ra hai bước.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-017"></a>

### TC-RS-ERR-017 — Tên quy tắc và ký hiệu hiển thị như chữ, không bị thực thi

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn” (AC-G26)

<!-- Mã truy vết: TD-ROLE-01, TD-ROLE-07, TD-STU-01, AC-G26 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Đăng nhập tài khoản giáo viên có quyền sửa mục và tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm).
- Dữ liệu test: Tên quy tắc `<b>X</b><script>alert(1)</script>`; ký hiệu đầu ở trích xuất `<`; ký tự phía trước ở phiếu điểm `&`; học sinh S01 (điểm 29)

**操作（Thao tác）**

1. Lưu quy tắc với tên trên; xem danh sách, form sửa, hộp xác nhận xóa, thông báo sau chạy.
2. Lưu ký hiệu/ký tự trên ở trích xuất và phiếu điểm; xem màn, Excel, PDF.

**期待結果（Kết quả mong đợi）**

Chuỗi hiển thị đúng như đã nhập dưới dạng chữ; không có hộp alert, không đổi định dạng HTML. Trích xuất và Excel: ô S01 là `<29`; PDF phiếu: `&29`.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 12.1 “Dữ liệu cấu hình và kết quả cần quản lý” ("không thực thi chuỗi code từ input"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn” (AC-G26) ("không … thực thi tên/ký hiệu như mã"); [tài liệu chia công việc v2](../split-tasks.vi.md) (RSD-TASK) công việc “Thiết lập và lưu nhiều quy tắc” (Task 1) (escape tên/ký hiệu khi hiển thị)
- Bằng chứng cần chụp: Ảnh các màn; file Excel/PDF.
- Sau khi chạy: Xóa quy tắc/ký hiệu test.
- Ghi chú: Nếu ký tự/độ dài ký hiệu bị giới hạn, chọn dữ liệu trong giới hạn nhưng vẫn có ký tự đặc biệt HTML.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-018"></a>

### TC-RS-ERR-018 — Hai lượt xét lần đầu đồng thời hoặc gửi lại thao tác hoàn tất chỉ tạo một kết quả

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật” (AC-G22)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-01, TD-STU-01, TD-ROLE-03, TD-ROLE-09, AC-G22 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Ô S01 của mục số nguyên (M=100) chưa từng được xét (chưa có dòng kết quả); quy tắc “Cố định 30” (dưới 30) là quy tắc duy nhất; có cách cho hai lượt chạy gần như cùng lúc.
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29) (29); tài khoản có quyền chạy hàng loạt, tài khoản giáo viên nhập điểm lớp G-A, G-B, G-C

**操作（Thao tác）**

1. Cùng lúc: giáo viên lưu điểm S01 = 29 trên Đăng ký thành tích（成績登録） và người có quyền bấm nút cam cho G-A.
2. Xem kết quả S01 ở ba đầu ra; SELECT dòng kết quả của ô.
3. Lặp lại thao tác hoàn tất lần nữa với cùng dữ liệu (gửi lại form đăng ký, hoặc chạy lại job của cùng lượt nếu môi trường cho phép); xem lại và SELECT.

**期待結果（Kết quả mong đợi）**

1–2. S01 Đỏ; ô có đúng một kết quả hiện hành; ký hiệu đỏ không bị nhân đôi ở đầu ra (không có `**29`, `((29))`).
3. Không phát sinh dòng hoặc thao tác ghi thứ hai; kết quả không đổi.

**補足（Bổ sung）**

- Nguồn: [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật” (AC-G22) (ví dụ thứ tự cập nhật: "Hai lượt xét lần đầu đồng thời, hoặc gửi lại cùng thao tác hoàn tất → chỉ một kết quả hiện hành, không nhân đôi dấu hoặc thao tác ghi"); [context điểm đỏ](../../../CONTEXT.md) (CTX) mục 9.6 “Ba phản hồi review DB và bài học thiết kế ngày 28/09” (bài học 2: khóa dòng kết quả có thể không tồn tại ở lần ghi đầu); [đặc tả v2](../specification.vi.md) (R18) mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất”; [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 6.1 “Dữ liệu điều khiển và dòng được khóa”, mục 6.2 “Đăng ký thường và batch” (PROPOSED: insert dòng điều khiển theo unique key, trùng thì khóa dòng có sẵn; gửi lại phiên bản đã hoàn tất không cập nhật)
- Bằng chứng cần chụp: Thời điểm hai thao tác; ảnh đầu ra; ảnh SELECT (che thông tin cá nhân).
- Ghi chú: Hành vi là CONFIRMED; cơ chế là PROPOSED. Nếu không tạo được hai lượt đồng thời thì BLOCKED, không ghi PASS.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-019"></a>

### TC-RS-ERR-019 — Đăng ký lần đầu đồng thời hai mục khác nhau của cùng học sinh giữ đủ cả hai

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật” (AC-G22)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-01, TD-STU-01, TD-ROLE-09, AC-G22 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Cùng học sinh S01, lớp G-A, cùng kỳ Cuối kỳ học kỳ 1（1学期期末）, điểm thường; hai mục số khác nhau (mục số nguyên (M=100) và một mục số thứ hai của cùng khung) đều có quy tắc cố định 30 `<`; chưa có dòng điểm vật lý nào của S01 cho kỳ này.
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29); tài khoản giáo viên nhập điểm lớp G-A, G-B, G-C (hai phiên đăng nhập)

**操作（Thao tác）**

1. Hai phiên cùng lúc: phiên 1 lưu S01 = 29 cho mục số nguyên (M=100); phiên 2 lưu S01 = 45 cho mục thứ hai.
2. Mở lại Đăng ký thành tích（成績登録）; xem trích xuất; SELECT dòng điểm của S01 (trường/năm/học sinh/lớp/kỳ/đơn vị) và dòng kết quả của hai ô.

**期待結果（Kết quả mong đợi）**

- Cả hai điểm được giữ: mục số nguyên (M=100) = 29 (Đỏ), mục thứ hai = 45 (Không đỏ).
- Chỉ một dòng điểm vật lý cho S01/G-A/kỳ/điểm thường; không có dòng trùng; không mất điểm hoặc kết quả của mục nào.

**補足（Bổ sung）**

- Nguồn: [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật” (AC-G22) (ví dụ thứ tự cập nhật: "Đăng ký lần đầu đồng thời hai mục khác nhau của cùng học sinh/lớp/thời điểm/đơn vị → giữ cả hai mục trên một dòng điểm vật lý"); [đặc tả v2](../specification.vi.md) (R18) mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất” (khóa dòng lớp là điểm chung khi hai mục cùng tạo dòng điểm); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 6.1 “Dữ liệu điều khiển và dòng được khóa” (PROPOSED: khóa `groups` rồi đọc lại, chỉ insert khi vẫn chưa có dòng)
- Bằng chứng cần chụp: Thời điểm hai thao tác; ảnh màn đăng ký sau khi mở lại; ảnh SELECT (che thông tin cá nhân).
- Ghi chú: Hành vi là CONFIRMED; cách khóa là PROPOSED. Đây cũng là kiểm hồi quy của đường ghi điểm hiện có. Không tạo được hai lượt đồng thời thì BLOCKED.

**結果（Kết quả）**

**証跡（Bằng chứng）**
