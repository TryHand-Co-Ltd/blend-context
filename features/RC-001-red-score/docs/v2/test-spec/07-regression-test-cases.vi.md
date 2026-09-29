# 07 — Test case hồi quy (REG)

Vai trò mặc định, nơi xem kết quả xét, bằng chứng mặc định và tra nhanh mã dữ liệu (TD-…): [01 §9](01-test-strategy.vi.md#conventions) «Quy ước thực thi chung».

Quy ước như [03](03-test-cases.vi.md) «Test case chức năng, quy tắc nghiệp vụ, validation và dữ…». Mục 補足（Bổ sung） của mỗi case có thêm ba dòng **Phần chịu ảnh hưởng**（Affected Area）, **Điều có thể hỏng**（Risk） và **Lý do cần kiểm**（Reason）. Tài liệu nguồn không xếp mức độ rủi ro, nên dòng Điều có thể hỏng chỉ mô tả điều có thể hỏng, không gắn mức Cao/Thấp.

**Baseline**（kết quả gốc）: mọi case so sánh với kết quả chụp trên cùng dữ liệu **trước khi tạo quy tắc đỏ** (hoặc trên bản build chưa có tính năng). Baseline phải được lưu theo [09](09-evidence-guideline.vi.md) «Hướng dẫn thu thập bằng chứng» trước khi chạy case. Mọi case đang **NOT RUN**.

<a id="tc-rs-reg-001"></a>

### TC-RS-REG-001 — Điểm do tính tự động（自動計算） tạo ra không đổi khi có quy tắc đỏ

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 7.1 “Trình tự cho một ô”, mục 12.2 “Điểm tích hợp chính”

<!-- Mã truy vết: TD-ITEM-10, TD-RULE-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên có thêm tính tự động có quy tắc tính tự động; baseline điểm tự động của khối 1. Thêm quy tắc “Cố định 30” (dưới 30).
- Dữ liệu test: mục số nguyên có thêm tính tự động, quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

1. Chạy nút cam cho khối 1.
2. So điểm của mục số nguyên có thêm tính tự động với baseline.

**期待結果（Kết quả mong đợi）**

Mọi điểm tự động bằng baseline; chỉ có thêm kết quả đỏ.

**補足（Bổ sung）**

- Phần chịu ảnh hưởng: AutoRating: tính điểm theo quy tắc tính tự động（自動計算設定）; batch nút cam
- Điều có thể hỏng: Gắn phần xét đỏ vào vòng tính AutoRating làm đổi điểm được tính, thứ tự tính hoặc cách làm tròn điểm
- Lý do cần kiểm: Xét đỏ được thêm vào cùng đường đăng ký/batch với AutoRating
- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 7.1 “Trình tự cho một ô” (đoạn cuối: "Quy tắc đỏ không ghi lại điểm học sinh"), mục 12.2 “Điểm tích hợp chính” (AutoRating và tính hàng loạt)
- Bằng chứng cần chụp: Bảng so sánh baseline/sau (SELECT hoặc Excel).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-002"></a>

### TC-RS-REG-002 — Quy tắc đỏ không kế thừa hành vi "không khớp thì ghi NULL" của AutoRating

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 12.2 “Điểm tích hợp chính”

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-12, TC-RS-BR-002, TD-STU-07, SI-11 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) chỉ có quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao); S07=20 không khớp (như case “Không quy tắc nào khớp khi đủ dữ liệu → Không áp dụng”). Mục không có quy tắc tính tự động.
- Dữ liệu test: mục số nguyên (M=100); quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao), học sinh S07 (điểm 35, cờ Chưa dự thi（未受験）)

**操作（Thao tác）**

1. Đăng ký S07=20; chạy nút cam.
2. Xem điểm S07 trên màn nhập điểm và DB.

**期待結果（Kết quả mong đợi）**

Điểm S07 vẫn 20 (không bị xóa/NULL); kết quả là Không áp dụng.

**補足（Bổ sung）**

- Phần chịu ảnh hưởng: Chọn quy tắc đỏ; bảng điểm học sinh
- Điều có thể hỏng: Dùng lại code chọn thiết lập của AutoRating làm điểm của ô không khớp quy tắc đỏ bị ghi `NULL`
- Lý do cần kiểm: Code AutoRating hiện ghi `NULL` khi không có thiết lập khớp (AutoRating chọn thiết lập khớp đầu tiên theo `sort_no` trước khi tính)
- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 12.2 “Điểm tích hợp chính” (dòng AutoRating: điều phải tránh "Kế thừa hành vi ghi `NULL` khi không khớp"); code hiện tại “AutoRating chọn thiết lập khớp đầu tiên theo `sort_no` trước khi tính”; khác biệt đặc tả–code về “Không có quy tắc khớp” (SI-11)
- Bằng chứng cần chụp: Ảnh màn nhập điểm; SELECT điểm.
- Ghi chú: Hành vi ghi `NULL` của AutoRating cho điểm **tự động** vẫn giữ như cũ (không thuộc thay đổi này).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-003"></a>

### TC-RS-REG-003 — Ô nhập tay được AutoRating bỏ qua vẫn giữ giá trị tay và vẫn được xét đỏ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Dùng điểm cuối cùng” (AC-G19)

<!-- Mã truy vết: TD-ITEM-10, TD-RULE-01, TD-STU-08 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên có thêm tính tự động + quy tắc “Cố định 30” (dưới 30); S08 nhập tay 28.
- Dữ liệu test: mục số nguyên có thêm tính tự động, quy tắc “Cố định 30” (dưới 30); học sinh S08 (sửa tay 28 thành 35)

**操作（Thao tác）**

1. Lưu S08=28 bằng nhập tay; chạy nút cam.
2. Xem điểm và kết quả đỏ.

**期待結果（Kết quả mong đợi）**

Điểm S08 vẫn 28 (không bị AutoRating ghi đè); S08 Đỏ.

**補足（Bổ sung）**

- Phần chịu ảnh hưởng: Đăng ký điểm (đường ghi điểm “Màn lớp NB 成績登録 (đăng ký điểm)”), liên kết điểm thi (đường ghi điểm “Liên kết điểm thi”); ô nhập tay（手動入力）
- Điều có thể hỏng: Chỉ gắn xét đỏ trong nhánh AutoRating nên bỏ sót ô nhập tay, hoặc làm AutoRating ghi đè giá trị tay
- Lý do cần kiểm: AutoRating hiện bỏ qua ô được POST và học sinh nhập tay
- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 7.2 “Bảng sự kiện” (Liên kết kết quả chấm bài thi), mục 12.2 “Điểm tích hợp chính” (Đăng ký điểm trực tiếp và CSV); code hiện tại: AutoRating bỏ qua ô POST/nhập tay; [context điểm đỏ](../../../CONTEXT.md) (CTX) khoảng trống tích hợp “Không có công thức / điểm sửa tay” (I02)
- Bằng chứng cần chụp: Ảnh màn nhập điểm; ảnh đầu ra.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-004"></a>

### TC-RS-REG-004 — Nút cam/nút xanh của trường đang dùng AutoRating hoạt động như trước

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 1.3 “Quyền sử dụng”, mục 7.4 “Quy trình vận hành khi dùng trung bình/tỷ lệ nhóm”

<!-- Mã truy vết: TD-ROLE-03, TD-ITEM-10, TC-RS-FUNC-021 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Trường có AutoRating active; tài khoản có quyền chạy hàng loạt. Baseline: phạm vi chọn được và danh sách lớp được xếp hàng.
- Dữ liệu test: mục số nguyên có thêm tính tự động

**操作（Thao tác）**

1. Mở màn, chọn cùng phạm vi như baseline.
2. Chạy nút cam rồi nút xanh.

**期待結果（Kết quả mong đợi）**

Nút hiện, phạm vi chọn và danh sách lớp xếp hàng như baseline; AutoRating tính như baseline (REG-001).

**補足（Bổ sung）**

- Phần chịu ảnh hưởng: Màn Tổng hợp thành tích（成績集計）: nút Thực hiện tổng hợp（集計実行） và Thực hiện tính toán tự động（自動算出実行）
- Điều có thể hỏng: Sửa điều kiện hiện nút cam (để chạy cho mục chỉ có rule đỏ) làm đổi phạm vi chạy hoặc quyền của trường đang dùng AutoRating
- Lý do cần kiểm: Nút cam hiện chỉ hiện khi có AutoRating active và phải mở rộng cho rule đỏ
- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 1.3 “Quyền sử dụng” (Chạy tính toán hàng loạt: "Giữ quyền thực thi hiện hành và phạm vi được phép"), mục 7.4 “Quy trình vận hành khi dùng trung bình/tỷ lệ nhóm”; Figma MW “màn Tổng hợp thành tích（成績集計） – nút xanh/cam, lần chạy trước” (58:7232)
- Bằng chứng cần chụp: Ảnh màn; log/danh sách job.
- Ghi chú: Trường không có AutoRating: case “Trường chỉ có quy tắc đỏ (không có tính tự động) vẫn có đường chạy hàng loạt”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-005"></a>

### TC-RS-REG-005 — Kết quả tổng hợp thứ hạng（順位集計） không đổi khi có quy tắc đỏ đọc nguồn

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 5.5 “Chọn bản nguồn”, mục 7.4 “Quy trình vận hành khi dùng trung bình/tỷ lệ nhóm”, mục 12.2 “Điểm tích hợp chính”

<!-- Mã truy vết: TD-RULE-07, TD-RULE-09, TC-RS-BR-023 -->

**前提条件（Điều kiện trước）**

- Điều kiện: cặp quy tắc phân nhánh theo trung bình 60 và quy tắc theo tỷ lệ điểm của nhóm từ 65% đang dùng nguồn của khối 1. Baseline: kết quả tổng hợp (trung bình, thứ hạng, số người) chạy trên build cũ với cùng dữ liệu.
- Dữ liệu test: cặp quy tắc phân nhánh theo trung bình 60, quy tắc theo tỷ lệ điểm của nhóm từ 65%

**操作（Thao tác）**

1. Chạy nút xanh rồi nút cam cho khối 1.
2. So trung bình, thứ hạng, số người với baseline.

**期待結果（Kết quả mong đợi）**

Trung bình, thứ hạng, số người bằng baseline; nút cam không ghi lại kết quả tổng hợp.

**補足（Bổ sung）**

- Phần chịu ảnh hưởng: Tổng hợp thứ hạng（順位集計）; bảng kết quả tổng hợp; màn Tổng hợp thành tích（成績集計）
- Điều có thể hỏng: Phần đọc nguồn trung bình/tỷ lệ nhóm ghi vào hoặc làm đổi kết quả tổng hợp, trung bình, thứ hạng
- Lý do cần kiểm: Tính năng đọc trung bình/tỷ lệ nhóm từ kết quả tổng hợp hiện có
- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 5.5 “Chọn bản nguồn”, mục 7.4 “Quy trình vận hành khi dùng trung bình/tỷ lệ nhóm” bước 3–5, mục 12.2 “Điểm tích hợp chính” (`GradeCalcResultService` và nguồn chốt)
- Bằng chứng cần chụp: Bảng so sánh tổng hợp baseline/sau.
- Ghi chú: Nút xanh không xét điểm đỏ: case “Nút xanh Thực hiện tổng hợp（集計実行） không xét điểm đỏ”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-006"></a>

### TC-RS-REG-006 — Trích xuất: mẫu hiện có không cấu hình đỏ cho kết quả như trước

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 9.1 “Thiết lập”, mục 9.2 “Kết quả và ví dụ”, mục 9.3 “Xuất file”

<!-- Mã truy vết: TD-RULE-01, TD-STU-01, TD-STU-02, TD-STU-03, TD-STU-04, TD-STU-05, TD-STU-06, TD-STU-07, TD-STU-08, TD-STU-09, TD-STU-10 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Ba mẫu trích xuất hiện có (có Khoảng điểm（点数範囲） tô màu, có lọc, có ký hiệu). Baseline màn và Excel. Mục có quy tắc “Cố định 30” (dưới 30).
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30); học sinh S01–S10

**操作（Thao tác）**

1. Chạy lại ba mẫu, xuất Excel, so với baseline.
2. Mở màn tạo mẫu trích xuất mới, Thiết lập công khai thành tích（成績公開設定） chưa từng lưu hiệu ứng đỏ, và dòng Thiết lập điểm đỏ（赤点設定） của một bảng phiếu điểm mới.

**期待結果（Kết quả mong đợi）**

1. Danh sách học sinh, giá trị, ký hiệu, màu và định dạng Excel bằng baseline (mẫu chưa bật tùy chọn đỏ).
2. (PROPOSED) Trích xuất: lọc đỏ và các hiệu ứng đỏ mặc định TẮT; công khai: chưa chọn hiệu ứng đỏ nào, và khi chưa cấu hình thì màn học sinh vẫn hiển thị như hiện có dù mục có ô Đỏ; phiếu điểm: Nguyên trạng（そのまま表示）.

**補足（Bổ sung）**

- Phần chịu ảnh hưởng: Trích xuất thành tích（成績抽出）: bộ lọc, trang trí ô, Excel
- Điều có thể hỏng: Thêm điều kiện đỏ làm đổi kết quả lọc, màu hoặc định dạng Excel của mẫu đang dùng
- Lý do cần kiểm: Điều kiện đỏ dùng chung cơ chế lọc/trang trí ô (`addFilterResultProperty`)
- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 9.1 “Thiết lập” (đề xuất mặc định không bật), mục 9.2 “Kết quả và ví dụ” (đoạn cuối: "không thay ý nghĩa các điều kiện khác… đi qua cơ chế trang trí ô hiện có"), mục 9.3 “Xuất file”
- Bằng chứng cần chụp: Excel baseline và sau; ảnh màn; ảnh mặc định của ba màn ở bước 2.
- Ghi chú: Mặc định không bật tùy chọn đỏ là PROPOSED (đặc tả v2 mục 9.1 “Thiết lập” Đề xuất mặc định; tiêu chí nghiệm thu v2 Chi tiết thiết kế; tài liệu chia công việc v2 công việc “Hiển thị điểm đỏ trên công khai, không lặp hiệu ứng”: "chưa cấu hình thì giữ hiển thị hiện có"); phần "điều kiện khác không đổi nghĩa" là CONFIRMED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-007"></a>

### TC-RS-REG-007 — Công khai: hiệu ứng Điểm dự kiến（見込点） và thiết lập khác được giữ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kết hợp hiệu ứng công khai” (AC-G33)

<!-- Mã truy vết: TD-OUT-03, TD-STU-06, TC-RS-BR-010 -->

**前提条件（Điều kiện trước）**

- Điều kiện: cấu hình công khai: “*” phía trước. S06 (dự kiến, Đỏ). Một học sinh khác có điểm dự kiến, Không đỏ. Baseline màn học sinh.
- Dữ liệu test: cấu hình công khai: “*” phía trước; học sinh S06 (điểm dự kiến 24)

**操作（Thao tác）**

1. Xem màn học sinh.
2. Làm S06 chuyển Chưa xét được (như case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”), xem lại.
3. Xóa quy tắc cuối, mở Thiết lập công khai thành tích（成績公開設定）.

**期待結果（Kết quả mong đợi）**

1. Học sinh Không đỏ hiển thị như baseline (ngoặc dự kiến).
2. S06 bỏ `*` đỏ nhưng giữ ngoặc dự kiến: `(24)`.
3. Cấu hình hiển thị đã lưu không bị xóa. Nền và định dạng khác như baseline.

**補足（Bổ sung）**

- Phần chịu ảnh hưởng: Thiết lập công khai thành tích（成績公開設定）; màn học sinh Xác nhận thành tích（成績確認）, API, PDF
- Điều có thể hỏng: Sửa hàm trang trí điểm làm mất hiệu ứng dự kiến, nền tiêu đề/bảng; hoặc xóa quy tắc cuối làm mất cấu hình trình bày đã lưu
- Lý do cần kiểm: Hiệu ứng đỏ dùng chung hàm trang trí với Điểm dự kiến（見込点）
- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 10.1 “Phạm vi và tùy chọn” (đoạn cuối), mục 10.3 “Quyền, thời điểm và đầu ra liên quan” (đoạn 2); code hiện tại “公開 (công khai) hiệu ứng” (`GradePublishService.php:1020-1217`)
- Bằng chứng cần chụp: Ảnh màn học sinh; ảnh cấu hình.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-008"></a>

### TC-RS-REG-008 — Công khai: điểm ẩn, lịch và đối tượng công khai được giữ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Cấu hình công khai và ẩn điểm” (AC-G32)

<!-- Mã truy vết: TD-STU-06, TD-ROLE-05, SI-13, TC-RS-BR-025 -->

**前提条件（Điều kiện trước）**

- Điều kiện: S06 Đỏ, mục đặt Không hiển thị（表示しない） cho điểm dự kiến; lịch công khai đang mở cho HR2; một lịch đã đóng.
- Dữ liệu test: học sinh S06 (điểm dự kiến 24), tài khoản học sinh S01

**操作（Thao tác）**

1. Xem màn học sinh, API, PDF của S06.
2. Xem khi lịch đóng.

**期待結果（Kết quả mong đợi）**

1. Điểm vẫn ẩn; không có dấu đỏ riêng lẻ.
2. Không xem được như baseline.

**補足（Bổ sung）**

- Phần chịu ảnh hưởng: Màn học sinh, API, PDF công khai
- Điều có thể hỏng: Hiệu ứng đỏ làm hiện lại số bị ẩn hoặc để lại dấu `*`/ngoặc làm lộ trạng thái; đường đọc mới bỏ qua lịch công khai
- Lý do cần kiểm: Code công khai xử lý Không hiển thị（表示しない） trong cùng vòng lặp trang trí (khác biệt đặc tả–code về “Công khai với Không hiển thị（表示しない）”)
- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 10.2 “Kết hợp điểm dự kiến và điểm đỏ” (dòng "Đã bị ẩn…"), mục 10.3 “Quyền, thời điểm và đầu ra liên quan” (đoạn 1), mục 8.4 “Lỗi kỹ thuật và thông báo” (đoạn cuối); [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?” (Q16); khác biệt đặc tả–code về “Công khai với Không hiển thị（表示しない）” (SI-13)
- Bằng chứng cần chụp: Ảnh màn, phản hồi API (che token), PDF.
- Ghi chú: Cách hiện thực ẩn khi dự kiến = Không hiển thị chưa chốt. Không chặn công khai khi thiếu kết quả đỏ: case “Đầu ra không bị chặn vì chưa có hoặc chưa xét được kết quả đỏ”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-009"></a>

### TC-RS-REG-009 — Phiếu điểm: các điều kiện hiển thị hiện có giữ hành vi

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Phiếu dừng ở điều kiện khớp đầu tiên” (AC-G36)

<!-- Mã truy vết: TD-RULE-01, TD-STU-05, TD-STU-07 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Hai bảng điểm hiện có: (a) dùng điều kiện môn cụ thể và ô trống; (b) dùng checkbox Chưa dự thi（未受験） với ẩn. Baseline PDF. Mục có quy tắc “Cố định 30” (dưới 30); hai bảng chưa bật dòng đỏ.
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30); học sinh S05 (ô trống), học sinh S07 (điểm 35, cờ Chưa dự thi（未受験）)

**操作（Thao tác）**

Xuất PDF hai bảng, so với baseline.

**期待結果（Kết quả mong đợi）**

PDF bằng baseline (cùng ký hiệu, ô ẩn, ô trống).

**補足（Bổ sung）**

- Phần chịu ảnh hưởng: Công cụ phiếu điểm（通知表ツール）: bộ chuyển đổi điều kiện hiển thị; PDF
- Điều có thể hỏng: Chèn điều kiện đỏ vào chuỗi first-match làm đổi kết quả của các điều kiện môn cụ thể, checkbox, ô trống
- Lý do cần kiểm: Điều kiện đỏ được chèn vào giữa chuỗi điều kiện hiện có
- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 11.1 “Tùy chọn hiển thị đỏ” (không thêm ẩn/gạch chéo riêng; điều kiện có sẵn giữ), mục 11.2 “Thứ tự và điều kiện khớp đầu tiên”; code hiện tại “通知表 (phiếu điểm) first match”
- Bằng chứng cần chụp: PDF baseline và sau.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-010"></a>

### TC-RS-REG-010 — PDF phiếu: bố cục template không đổi khi có dấu đỏ

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu, sao chép và PDF phiếu” (AC-G37)

<!-- Mã truy vết: TD-OUT-04, TD-STU-01, TD-STU-09 -->

**前提条件（Điều kiện trước）**

- Điều kiện: cấu hình phiếu điểm: ký tự “※” phía trước với ký tự `※`; ô hẹp nhất của template chứa điểm 3 chữ số (ví dụ 100 nếu có quy tắc `≤100`, hoặc 29.5 cho mục thập phân).
- Dữ liệu test: cấu hình phiếu điểm: ký tự “※” phía trước; học sinh S01 (điểm 29), học sinh S09 (mục số thập phân 29.5)

**操作（Thao tác）**

Xuất PDF; so với baseline.

**期待結果（Kết quả mong đợi）**

Dấu hiển thị đủ trong ô; không mất ký tự, không nền đỏ; các phần khác bằng baseline.

**補足（Bổ sung）**

- Phần chịu ảnh hưởng: PDF phiếu điểm
- Điều có thể hỏng: Ký tự thêm vào làm tràn ô, mất ký tự, xuống dòng hoặc đổi cấu trúc template
- Lý do cần kiểm: Ô điểm có độ rộng cố định theo template
- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 11.1 “Tùy chọn hiển thị đỏ” (không nền đỏ, không ép template), mục 11.3 “Lưu và xuất” (đoạn 2)
- Bằng chứng cần chụp: PDF thực (ảnh HTML không thay được).
- Ghi chú: Chiều dài tối đa của ký tự tùy ý: chưa có nguồn.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-011"></a>

### TC-RS-REG-011 — Dữ liệu điểm đỏ cũ（`red_score`, `changed_red_score`） giữ nguyên và không làm fallback

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Bảo toàn điểm đỏ cũ” (AC-G38)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-12, TD-STU-07 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có `red_score`=40 (dữ liệu cũ). Thêm quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao). Baseline báo cáo tùy biến đọc `red_score` (nếu môi trường có — hỏi dev).
- Dữ liệu test: mục số nguyên (M=100); học sinh S07 (điểm 35, cờ Chưa dự thi（未受験）) (35, không khớp quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao))

**操作（Thao tác）**

1. Lưu, sửa, xóa quy tắc mới; SELECT `red_score`, `changed_red_score`.
2. Chạy xét; xem ba đầu ra của S07.
3. Chạy báo cáo tùy biến.

**期待結果（Kết quả mong đợi）**

1. Giá trị cột cũ không đổi.
2. S07 Không áp dụng; không có dấu đỏ dù 35<40.
3. Báo cáo tùy biến bằng baseline.

**補足（Bổ sung）**

- Phần chịu ảnh hưởng: Cột legacy; báo cáo/tùy biến riêng của trường đọc cột này
- Điều có thể hỏng: Lưu cấu hình mới reset/đổi nghĩa cột cũ; renderer dùng ngưỡng cũ khi quy tắc mới không khớp hoặc thiếu dữ liệu
- Lý do cần kiểm: Cột cũ vẫn tồn tại và được đọc bởi tùy biến trường
- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 12.3 “Không chuyển đổi dữ liệu đỏ cũ”; code hiện tại “`red_score`, `changed_red_score`”
- Bằng chứng cần chụp: SELECT trước/sau; ảnh đầu ra; báo cáo.
- Ghi chú: Bước 3 SKIPPED nếu môi trường không có tùy biến.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-012"></a>

### TC-RS-REG-012 — Sao chép, kế thừa năm, xuất/nhập vẫn mang dữ liệu đỏ cũ như trước

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Bảo toàn điểm đỏ cũ” (AC-G38); tiêu chí nghiệm thu “Không dùng lại kết quả cho đối tượng mới” (AC-G39)

<!-- Mã truy vết: TD-ITEM-01, TC-RS-DATA-009, AC-G38, AC-G39 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mục có `red_score`=40 và quy tắc mới; nguồn đã có kết quả xét (S01 Đỏ).
- Dữ liệu test: mục số nguyên (M=100)

**操作（Thao tác）**

1. Chạy lần lượt các luồng mà môi trường hỗ trợ (gồm đồng bộ cấu hình); SELECT `red_score` ở bản đích.
2. Chưa chạy xét ở đích: xem đầu ra và SELECT kết quả của đích.

**期待結果（Kết quả mong đợi）**

1. `red_score` ở bản đích như baseline của luồng.
2. Đích không có kết quả xét cho tới khi được xét; không mang kết quả của nguồn sang.

Hành vi với cấu hình mới: case “Sao chép, kế thừa năm, nhập/xuất cấu hình” (PROPOSED, đường hỗ trợ chưa chốt — đặc tả v2 mục 13.1).

**補足（Bổ sung）**

- Phần chịu ảnh hưởng: Duplicate, kế thừa năm, xuất/nhập cấu hình, đồng bộ cấu hình, failback
- Điều có thể hỏng: Thêm cấu hình mới vào các luồng này làm mất `red_score` khi sao chép; đồng bộ cấu hình mang theo kết quả xét
- Lý do cần kiểm: Các luồng này hiện mang `red_score`
- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 12.3 “Không chuyển đổi dữ liệu đỏ cũ” (đoạn cuối: "không… bỏ qua các đường sao chép/xuất nhập đang mang dữ liệu cũ"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Bảo toàn điểm đỏ cũ” (AC-G38) ("Giữ cách dùng giá trị cũ trong… sao chép, kế thừa năm, xuất/nhập, khôi phục và đồng bộ"), tiêu chí nghiệm thu “Không dùng lại kết quả cho đối tượng mới” (AC-G39) ("Đồng bộ cấu hình không đồng nghĩa đã xét"); code hiện tại: duplicate/takeover/export/import/failback mang theo `red_score`
- Bằng chứng cần chụp: SELECT nguồn/đích; ảnh đầu ra của đích trước khi chạy xét.
- Sau khi chạy: Xóa dữ liệu sao chép.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-013"></a>

### TC-RS-REG-013 — Các màn điểm tối đa lưu và xếp hàng như trước

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị” (AC-G24)

<!-- Mã truy vết: TD-ITEM-03, TD-RULE-03, TC-RS-BR-022, TC-RS-FUNC-020 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Baseline trên build cũ: giá trị lưu, thông báo và danh sách job khi thực hiện ba bước dưới với cùng dữ liệu. mục điểm đơn vị (đơn vị U1 có M riêng 40) có quy tắc tỷ lệ 30%.
- Dữ liệu test: quy tắc tỷ lệ 30%; mục điểm đơn vị (đơn vị U1 có M riêng 40)

**操作（Thao tác）**

1. Đổi định nghĩa M ở Thiết lập điểm tối đa（満点設定）, lưu, mở lại.
2. Đổi Giá trị tối đa（最大値）, lưu, mở lại.
3. Lưu ở Thiết lập điểm tối đa hàng loạt（満点一括設定） lựa chọn M=50 cho G-B; xem danh sách job.

**期待結果（Kết quả mong đợi）**

Giá trị lưu, thông báo và danh sách job (lớp/kỳ được xếp hàng) bằng baseline.

**補足（Bổ sung）**

- Phần chịu ảnh hưởng: Thiết lập điểm tối đa（満点設定）, Giá trị tối đa（最大値） trong Thiết lập ô nhập（入力欄設定）, Thiết lập điểm tối đa hàng loạt（満点一括設定）
- Điều có thể hỏng: Gắn xét đỏ vào các màn này làm đổi giá trị được lưu, thông báo hoặc cách xếp hàng batch của lưu hàng loạt
- Lý do cần kiểm: Loại tỷ lệ phụ thuộc M hiện hành nên dễ bị gắn thêm trigger vào các màn này
- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 7.3 “Thay đổi điểm tối đa”; code hiện tại: đường ghi điểm “満点一括設定 (thiết lập điểm tối đa hàng loạt)”, “入力欄設定 (thiết lập ô nhập) `itemStore` :990 / `optionStore` :2472…”
- Bằng chứng cần chụp: Ảnh trước/sau; log job.
- Sau khi chạy: Khôi phục M ban đầu.
- Ghi chú: Thời điểm kết quả đỏ thay đổi sau các thao tác này: case “Đổi M ở Thiết lập điểm tối đa（満点設定） hoặc Giá trị tối đa（最大値） không tự xét lại”, case “Lưu Thiết lập điểm tối đa hàng loạt（満点一括設定） xếp hàng tính toán rồi mới có kết quả mới”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-014"></a>

### TC-RS-REG-014 — Batch không phát sinh truy vấn theo từng ô（N+1）

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 12.2 “Điểm tích hợp chính”

<!-- Mã truy vết: TD-ENV-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Khối có ít nhất 2 cỡ dữ liệu khác nhau (ví dụ 10 và 100 học sinh) trên môi trường local; bật log truy vấn.
- Dữ liệu test: môi trường test (trường A, năm học 2026)

**操作（Thao tác）**

Chạy batch với từng cỡ dữ liệu; đếm truy vấn liên quan đến quy tắc/nguồn/kết quả đỏ.

**期待結果（Kết quả mong đợi）**

Số truy vấn đọc quy tắc/nguồn/M không tăng tuyến tính theo số ô. Thời gian chạy chỉ ghi lại để so, không có ngưỡng pass/fail (tài liệu chưa đặt ngưỡng).

**補足（Bổ sung）**

- Phần chịu ảnh hưởng: Batch nút cam; đăng ký điểm lớp nhiều học sinh
- Điều có thể hỏng: Tải quy tắc/nguồn/M theo từng ô làm số truy vấn tăng theo số ô
- Lý do cần kiểm: Xét đỏ chạy trên mọi ô bị tác động của lượt
- Nguồn: Quy tắc phát triển BLEND (không N+1); [đặc tả v2](../specification.vi.md) (R18) mục 12.2 “Điểm tích hợp chính”
- Bằng chứng cần chụp: Log/số truy vấn hai cỡ dữ liệu.
- Sau khi chạy: Tắt log truy vấn.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-015"></a>

### TC-RS-REG-015 — Quyền học sinh/phụ huynh giữ nguyên

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đúng người, lịch và đầu ra công khai” (AC-G34)

<!-- Mã truy vết: TD-ROLE-05, TD-ROLE-08, AC-G34 -->

**前提条件（Điều kiện trước）**

- Điều kiện: tài khoản học sinh S01 (S01), tài khoản phụ huynh của học sinh S01 (phụ huynh của S01). Tài khoản học sinh/phụ huynh test lấy theo kênh được phép.
- Dữ liệu test: tài khoản học sinh S01, tài khoản phụ huynh của học sinh S01

**操作（Thao tác）**

1. Đăng nhập S01, xem màn.
2. Đổi ID học sinh trong URL/request API sang S02.
3. Mở URL màn cấu hình đỏ.
4. Đăng nhập phụ huynh của S01, xem màn và PDF công khai.
5. Đổi ID học sinh trong URL/request API sang S02.

**期待結果（Kết quả mong đợi）**

1. Chỉ thấy dữ liệu S01.
2. Bị từ chối.
3. Bị từ chối.
4. Chỉ thấy dữ liệu S01; dấu đỏ và điểm ẩn giống màn học sinh.
5. Bị từ chối.

**補足（Bổ sung）**

- Phần chịu ảnh hưởng: Màn học sinh Xác nhận thành tích（成績確認）, API công khai
- Điều có thể hỏng: Đường đọc kết quả đỏ mới trả dữ liệu học sinh khác hoặc cho truy cập cấu hình đỏ
- Lý do cần kiểm: Kết quả đỏ là dữ liệu mới được đưa vào đầu ra học sinh
- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 1.3 “Quyền sử dụng” (Học sinh/phụ huynh xem kết quả), mục 10.3 “Quyền, thời điểm và đầu ra liên quan” (đoạn 1); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Đúng người, lịch và đầu ra công khai” (AC-G34)
- Bằng chứng cần chụp: Ảnh màn; phản hồi (che token).
- Ghi chú: Màn hồ sơ phía giáo viên không thay được bằng chứng màn học sinh (đặc tả v2 mục 10.3 “Quyền, thời điểm và đầu ra liên quan”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-016"></a>

### TC-RS-REG-016 — Đăng ký điểm: xử lý điểm liên quan và giao dịch giữ như trước

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất”, mục 8.4 “Lỗi kỹ thuật và thông báo”

<!-- Mã truy vết: TD-ITEM-10, TD-RULE-01, TD-ITEM-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mục có môn chính/môn con và quan điểm, có quy tắc tính tự động（自動計算設定） (mục số nguyên có thêm tính tự động) để các bước sau tính tự động chạy; baseline điểm môn chính, điểm quan điểm được sao chép và tín chỉ（単位） sau khi lưu điểm môn con. quy tắc “Cố định 30” (dưới 30) ở mục môn chính và ở mục nhận điểm sao chép theo quan điểm.
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30); mục số nguyên (M=100); mục số nguyên có thêm tính tự động

**操作（Thao tác）**

1. Lưu điểm môn con qua đường ghi điểm “Màn lớp NB 成績登録 (đăng ký điểm)”, đường ghi điểm “CSV lớp NB”, đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)”.
2. So điểm môn chính, điểm quan điểm được sao chép và tín chỉ với baseline.
3. Xem kết quả đỏ của ô môn chính và ô nhận điểm sao chép; chọn dữ liệu sao cho giá trị trung gian (trước bước môn chính/phụ hoặc sao chép) và giá trị cuối nằm khác phía ngưỡng 30.

**期待結果（Kết quả mong đợi）**

1–2. Điểm môn chính, điểm quan điểm được sao chép và tín chỉ bằng baseline; thông báo và hành vi lỗi của từng đường như baseline.

3. Ô môn chính và ô nhận điểm sao chép được xét theo giá trị cuối sau các bước sau tính tự động, không theo giá trị trung gian (đặc tả v2 mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất”).

**補足（Bổ sung）**

- Phần chịu ảnh hưởng: Đăng ký điểm trực tiếp (đường ghi điểm “Màn lớp NB 成績登録 (đăng ký điểm)”), CSV lớp (đường ghi điểm “CSV lớp NB”), CSV HR (đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)”)
- Điều có thể hỏng: Chèn xét đỏ làm đổi thứ tự xử lý điểm môn chính/quan điểm, hoặc làm hỏng transaction
- Lý do cần kiểm: Xét đỏ phải chạy sau mọi ghi của lượt (context điểm đỏ khoảng trống tích hợp “Điểm cuối và môn liên quan”)
- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất” (đoạn 1), mục 8.4 “Lỗi kỹ thuật và thông báo” (gạch đầu dòng 1); code hiện tại: `saveGradeToParentSubSubject`, `copyKantenGrade`, transaction của đường “Màn lớp NB 成績登録 (đăng ký điểm)”/“CSV lớp NB”/“HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)”; [context điểm đỏ](../../../CONTEXT.md) (CTX) khoảng trống tích hợp “Điểm cuối và môn liên quan” (I03), khoảng trống tích hợp “Thành công/skip/lỗi” (I05); [tài liệu chia công việc v2](../split-tasks.vi.md) (RSD-TASK) công việc “Cập nhật kết quả khi đăng ký và chạy hàng loạt” (Task 4) (Hướng kỹ thuật, gạch đầu dòng 3: "Xác định tập ô cuối gồm cả cập nhật liên quan, không xét trung gian"); code hiện tại “Các bước sau `calcAutoRating`: môn chính/phụ, sao chép theo tiêu chí…” (`calcAutoRating` → `saveGradeToParentSubSubject` môn chính/phụ → `copyKantenGrade` sao chép điểm theo quan điểm → `registStudentUnitFix` ghi tín chỉ（単位）)
- Bằng chứng cần chụp: SELECT điểm và tín chỉ trước/sau; ảnh kết quả.
- Ghi chú: Cấu trúc môn chính/con cụ thể: hỏi dev khi chuẩn bị dữ liệu.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-017"></a>

### TC-RS-REG-017 — Thiết lập ô nhập（入力欄設定）: các hàng hiện có không bị ảnh hưởng

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”, mục 12.2 “Điểm tích hợp chính”

<!-- Mã truy vết: TD-ITEM-01, TD-ITEM-10 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Baseline màn với nhiều mục; có mục có tính tự động và mục bị ẩn.
- Dữ liệu test: mục số nguyên (M=100), mục số nguyên có thêm tính tự động

**操作（Thao tác）**

1. Mở màn, so bố cục với baseline.
2. Bấm link ở hàng Tính tự động（自動計算） và Thiết lập ẩn mục nhập（入力項目の非表示設定）.
3. Sửa một giá trị ở hàng khác, lưu.

**期待結果（Kết quả mong đợi）**

Cột thẳng hàng, link mở đúng màn của đúng mục, lưu các hàng khác như baseline.

**補足（Bổ sung）**

- Phần chịu ảnh hưởng: Màn Thiết lập ô nhập（入力欄設定）
- Điều có thể hỏng: Chèn hàng mới giữa Tính tự động（自動計算） và Thiết lập ẩn mục nhập（入力項目の非表示設定） làm lệch cột, hỏng link hoặc lưu sai các hàng khác
- Lý do cần kiểm: Hàng mới được thêm vào bảng cột theo mục
- Nguồn: code hiện tại “Hàng 自動計算 (tính tự động) / 入力項目の非表示設定 (thiết lập ẩn mục nhập)” (`manage/index.php:612-778`); [đặc tả v2](../specification.vi.md) (R18) mục 4.1 “Điểm vào và trạng thái trống”, mục 12.2 “Điểm tích hợp chính”
- Bằng chứng cần chụp: Ảnh màn trước/sau.

**結果（Kết quả）**

**証跡（Bằng chứng）**
