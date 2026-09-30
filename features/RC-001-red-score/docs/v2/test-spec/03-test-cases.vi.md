# 03 — Test case chức năng, quy tắc nghiệp vụ, validation và dữ liệu

Vai trò mặc định, nơi xem kết quả xét, bằng chứng mặc định và tra nhanh mã dữ liệu (TD-…): [01 §9](01-test-strategy.vi.md#conventions) «Quy ước thực thi chung».

Nhóm: [§1 Functional (FUNC)](#func) · [§2 Business Rules (BR)](#br) · [§3 Validation (VAL)](#val) · [§4 Data/Persistence (DATA)](#data).

Bố cục mỗi case (03–07) theo template báo cáo test（テスト報告） của team:

- Tiêu đề, rồi dòng Priority ｜ Status ｜ Requirement ID.
- 前提条件（Điều kiện trước）: điều kiện và dữ liệu test.
- 操作（Thao tác） và 期待結果（Kết quả mong đợi）.
- 補足（Bổ sung）: nguồn, bằng chứng cần chụp, trạng thái sau khi chạy, ghi chú.
- 結果（Kết quả） và 証跡（Bằng chứng）: để trống, điền khi chạy. Bản Excel cùng bố cục: [test-case-report.xlsx](test-case-report.xlsx) ([09 §6](09-evidence-guideline.vi.md#run-sheet) «Bảng chạy test»).

Quy ước: Status = độ chắc chắn của kết quả mong đợi ([01 §3](01-test-strategy.vi.md) «Nhãn trạng thái của test case»); Priority theo [01 §4](01-test-strategy.vi.md) «Ưu tiên»; Data ID theo [08](08-test-data.vi.md) «Đặc tả dữ liệu test». Mọi case đang **NOT RUN**. `S` điểm cuối đã lưu, `M` điểm tối đa hiện hành, `A` trung bình trước làm tròn, `T` ngưỡng cuối, `N` giá trị người dùng nhập. "Lưu" trong các bước ở màn Điều kiện áp dụng（適用条件設定）/Ngưỡng nghĩa là bấm Cập nhật（更新する） (FIG MW 58:9163 «Figma MW: màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình», 58:9397 «Figma MW: màn Điều kiện áp dụng – điều kiện tỷ lệ điểm của nhóm»).

<a id="func"></a>

## 1. Functional (FUNC)

<a id="tc-rs-func-001"></a>

### TC-RS-FUNC-001 — Hàng Thiết lập điểm đỏ（赤点設定） xuất hiện trong Thiết lập ô nhập（入力欄設定） cho mục điểm số

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kiểu điểm được hỗ trợ” (AC-G02)

<!-- Mã truy vết: TD-ROLE-01, TD-ITEM-01, TD-ITEM-02, TD-ENV-01, TD-ITEM-03, TC-RS-UI-001 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Đăng nhập tài khoản giáo viên có quyền sửa mục. Chưa có quy tắc đỏ cho mục số nguyên (M=100); mục số thập phân (M=100) có ít nhất một quy tắc.
- Dữ liệu test: môi trường test (trường A, năm học 2026), tài khoản giáo viên có quyền sửa mục, mục số nguyên (M=100), mục số thập phân (M=100), mục điểm đơn vị (đơn vị U1 có M riêng 40)

**操作（Thao tác）**

1. Mở Thiết lập nhập điểm（成績入力設定）→ Thiết lập ô nhập（入力欄設定） của kỳ 1学期期末 (cuối kỳ học kỳ 1).
2. Tìm hàng Thiết lập điểm đỏ（赤点設定） ở bảng mục nhập.
3. Bấm link của hàng này ở cột mục số nguyên (M=100), mục số thập phân (M=100), mục điểm đơn vị (đơn vị U1 có M riêng 40).

**期待結果（Kết quả mong đợi）**

1. Hàng Thiết lập điểm đỏ（赤点設定） nằm giữa hàng Tính tự động（自動計算） và hàng Thiết lập ẩn mục nhập（入力項目の非表示設定）.
2. Có thao tác mở thiết lập cho mục số nguyên, số thập phân và điểm đơn vị.
3. Bấm link chuyển sang màn danh sách Thiết lập điểm đỏ（赤点設定） của đúng mục.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 4.1 “Điểm vào và trạng thái trống”; [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Những loại điểm nào thuộc đối tượng?” (Q2); Figma MW “màn Thiết lập ô nhập（入力欄設定）, lối vào điểm đỏ” (58:9629) (UI｜01 入力欄設定), (58:9848–9870), ghi chú (58:9902) 「ここが新規：赤点設定」 (chỗ này là mới: thiết lập điểm đỏ)
- Bằng chứng cần chụp: Ảnh màn Thiết lập ô nhập（入力欄設定） thấy vị trí hàng; ảnh màn danh sách sau khi bấm link cho từng mục.
- Sau khi chạy: Không thay đổi dữ liệu.
- Ghi chú: Nhãn trạng thái trên hàng (chưa thiết lập/đã thiết lập) kiểm ở case “Nhãn trạng thái ở hàng Thiết lập điểm đỏ（赤点設定） trong Thiết lập ô nhập（入力欄設定）”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-002"></a>

### TC-RS-FUNC-002 — Mục kiểu lựa chọn và Đạt/không đạt（合否） không có thao tác tạo quy tắc đỏ có hiệu lực

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kiểu điểm được hỗ trợ” (AC-G02); tiêu chí nghiệm thu “Phạm vi từng đợt” (AC-G40)

<!-- Mã truy vết: TD-ROLE-01, TD-ITEM-04, TD-ITEM-05, TC-RS-UI-001 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Đăng nhập tài khoản giáo viên có quyền sửa mục.
- Dữ liệu test: mục kiểu lựa chọn A/B/C, mục Đạt/không đạt（合否）

**操作（Thao tác）**

1. Mở Thiết lập ô nhập（入力欄設定）.
2. Xem hàng Thiết lập điểm đỏ（赤点設定） ở cột mục kiểu lựa chọn A/B/C, mục Đạt/không đạt（合否）.
3. Thử mở URL màn danh sách điểm đỏ của mục kiểu lựa chọn A/B/C bằng ID mục (nếu biết URL).

**期待結果（Kết quả mong đợi）**

1. Không có thao tác tạo quy tắc đỏ có hiệu lực cho hai mục này.
2. Truy cập trực tiếp không cho tạo/lưu quy tắc cho mục không thuộc loại số.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Những loại điểm nào thuộc đối tượng?” (Q2); [đặc tả v2](../specification.vi.md) (R18) mục 1.2 “Phạm vi thiết kế”, mục 4.1 “Điểm vào và trạng thái trống”; Figma MW “màn Thiết lập ô nhập（入力欄設定）, lối vào điểm đỏ” (58:9861–9867) (ô 「—」 trên hàng 赤点設定 (thiết lập điểm đỏ)), ghi chú “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9455) 「A/B/C・合否は初版対象外」 (A/B/C và đạt/không đạt ngoài bản đầu)
- Bằng chứng cần chụp: Ảnh hàng Thiết lập điểm đỏ（赤点設定） ở hai cột; ảnh/phản hồi khi truy cập trực tiếp.
- Sau khi chạy: Không có quy tắc nào được tạo cho mục kiểu lựa chọn A/B/C/05.
- Ghi chú: Cách hiển thị ô (Figma dùng 「—」) là thiết kế, kiểm ở case “Nhãn trạng thái ở hàng Thiết lập điểm đỏ（赤点設定） trong Thiết lập ô nhập（入力欄設定）”. URL màn mới chưa định nghĩa.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-003"></a>

### TC-RS-FUNC-003 — Danh sách trống không tự tạo quy tắc mặc định hoặc chuyển từ ngưỡng đỏ cũ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04)

<!-- Mã truy vết: TD-ITEM-01, TD-ENV-03 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có giá trị cột đỏ cũ（`red_score`）= 30 ở DB (nếu dữ liệu cho phép), chưa có quy tắc mới.
- Dữ liệu test: mục số nguyên (M=100), quyền đọc DB local (chỉ SELECT/SHOW)

**操作（Thao tác）**

1. SELECT giá trị `red_score` của mục số nguyên (M=100) (lưu ảnh).
2. Mở danh sách Thiết lập điểm đỏ（赤点設定） của mục số nguyên (M=100).
3. Đăng ký điểm S01=29 cho mục số nguyên (M=100).

**期待結果（Kết quả mong đợi）**

1. Danh sách hiển thị trạng thái chưa thiết lập và thao tác Thêm thiết lập chi tiết（詳細設定の追加）.
2. Không có quy tắc tự tạo từ `red_score`, không có quy tắc mặc định "dưới 30".
3. Sau khi đăng ký điểm, S01 không bị đánh dấu đỏ (không có quy tắc nào).

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 4.1 “Điểm vào và trạng thái trống”, mục 12.3 “Không chuyển đổi dữ liệu đỏ cũ”; [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Có chuyển thiết lập điểm đỏ cũ sang chức năng mới không?” (Q17); Figma MW “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9462) (“chương 01, khung B – danh sách thứ tự ưu tiên thiết lập điểm đỏ” (01-B) → 未設定 (chưa thiết lập)), (58:9539) 「赤点設定はありません。」 (không có thiết lập điểm đỏ)
- Bằng chứng cần chụp: Ảnh SELECT `red_score`; ảnh danh sách trống; ảnh đầu ra (trích xuất) không có dấu đỏ cho S01.
- Sau khi chạy: `red_score` giữ nguyên giá trị ban đầu.
- Ghi chú: Nếu môi trường không có mục có `red_score` khác NULL, ghi rõ trong Notes khi chạy.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-004"></a>

### TC-RS-FUNC-004 — Thêm quy tắc qua Điều kiện áp dụng（適用条件） và Ngưỡng（基準設定） rồi quay lại danh sách

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-08, TD-ROLE-01, TD-RULE-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) đã có cặp quy tắc cùng áp dụng (dưới 20 và dưới 30) (2 quy tắc). Đăng nhập tài khoản giáo viên có quyền sửa mục.
- Dữ liệu test: mục số nguyên (M=100), cặp quy tắc cùng áp dụng (dưới 20 và dưới 30); quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

1. Ở danh sách, bấm Thêm thiết lập chi tiết（詳細設定の追加）.
2. Nhập Tên thiết lập（設定名称） "Cố định 30", chọn Toàn bộ đối tượng（全員が対象）, bấm Cập nhật（更新する）.
3. Mở Ngưỡng, chọn Điểm cố định（固定点数）, nhập 30, chọn Nhỏ hơn（未満）, bấm Cập nhật（更新する）.
4. Xem danh sách.

**期待結果（Kết quả mong đợi）**

1. Sau mỗi lần cập nhật, màn quay về danh sách.
2. Dòng mới hiện tên, tóm tắt điều kiện "toàn bộ" và ngưỡng "Điểm cố định: 30 điểm, Nhỏ hơn" đúng với dữ liệu đã lưu.
3. **PROPOSED (đặc tả v2 mục 4.4 “Lưu, đổi thứ tự và xóa”):** dòng mới nằm sau các quy tắc đã có.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 3 “Bản đồ màn hình và luồng thao tác” (luồng chuẩn), mục 4.2 “Nội dung một dòng”, mục 4.4 “Lưu, đổi thứ tự và xóa”; Figma MW “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9459) 「追加後に適用条件と基準を入力。各詳細の更新後は01-Bへ戻る。」 (sau khi thêm thì nhập điều kiện và ngưỡng; cập nhật xong quay về “chương 01, khung B – danh sách thứ tự ưu tiên thiết lập điểm đỏ” (01-B))
- Bằng chứng cần chụp: Ảnh danh sách trước/sau; ảnh từng màn sau khi bấm Cập nhật（更新する）.
- Sau khi chạy: mục số nguyên (M=100) có 3 quy tắc.
- Ghi chú: Vị trí dòng mới là đề xuất, không phải must-pass.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-005"></a>

### TC-RS-FUNC-005 — Nhiều quy tắc hiển thị theo ưu tiên; đổi thứ tự bằng ▲▼ được lưu

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-01, TD-RULE-08, TC-RS-BR-015 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có 3 quy tắc tên quy tắc 1, quy tắc 2, quy tắc 3 (tên tạm trong case) theo thứ tự.
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), cặp quy tắc cùng áp dụng (dưới 20 và dưới 30)

**操作（Thao tác）**

1. Bấm ▼ ở quy tắc 1.
2. Tải lại trang.
3. Bấm ▲ ở quy tắc 3.
4. Đăng xuất, đăng nhập lại, mở danh sách.

**期待結果（Kết quả mong đợi）**

1. Sau bước 1 thứ tự là quy tắc 2, quy tắc 1, quy tắc 3 và giữ nguyên sau khi tải lại.
2. Sau bước 3 thứ tự là quy tắc 2, quy tắc 3, quy tắc 1 và giữ nguyên khi mở lại.
3. Đổi thứ tự không làm thay kết quả đỏ hiện có (kiểm ở case “Lưu cấu hình không xét; kết quả trước giữ tới lần chạy lại”).

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Một mục đánh giá có một hay nhiều thiết lập điểm đỏ?” (Q5); [đặc tả v2](../specification.vi.md) (R18) mục 4.2 “Nội dung một dòng”, mục 4.4 “Lưu, đổi thứ tự và xóa”; Figma MW “màn danh sách thiết lập điểm đỏ” (58:10053–10155) (cột 優先順位 (thứ tự ưu tiên) ▲▼), “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9461) 「▲▼で順序を保存。」 (lưu thứ tự bằng ▲▼)
- Bằng chứng cần chụp: Ảnh danh sách sau mỗi bước.
- Sau khi chạy: Thứ tự mới đã lưu.
- Ghi chú: Nút ▲ ở dòng đầu/▼ ở dòng cuối: hành vi chưa quy định (AutoRating hiện không kiểm biên); ghi nhận hiện trạng.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-006"></a>

### TC-RS-FUNC-006 — Xóa một quy tắc có xác nhận; Hủy（キャンセル） giữ nguyên

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-08, TC-RS-BR-019, TC-RS-UI-006 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có 2 quy tắc.
- Dữ liệu test: mục số nguyên (M=100); cặp quy tắc cùng áp dụng (dưới 20 và dưới 30)

**操作（Thao tác）**

1. Bấm Xóa（削除） ở quy tắc thứ 2, chọn Hủy（キャンセル）.
2. Bấm Xóa（削除） lại, chọn Xóa（削除する）.

**期待結果（Kết quả mong đợi）**

1. Hộp xác nhận nêu thiết lập sẽ bị xóa và kết quả học sinh chỉ cập nhật ở lần xét tiếp theo.
2. Hủy: danh sách giữ 2 quy tắc.
3. Xóa: danh sách còn 1 quy tắc; kết quả đỏ hiện có không đổi cho tới lần xét tiếp theo (case “Xóa quy tắc cuối: giữ kết quả tới lần chạy lại; chạy lại → Không áp dụng”).

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 4.4 “Lưu, đổi thứ tự và xóa”; Figma MW “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9540–9625) (hộp xác nhận xóa)
- Bằng chứng cần chụp: Ảnh hộp xác nhận; ảnh danh sách sau Hủy và sau Xóa.
- Sau khi chạy: Còn 1 quy tắc.
- Ghi chú: Nội dung hộp xác nhận khi xóa quy tắc cuối cùng: case “Hộp xác nhận khi xóa quy tắc cuối”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-007"></a>

### TC-RS-FUNC-007 — Quay lại（戻る）/hủy chỉnh sửa không lưu dữ liệu đang nhập

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30).
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

1. Mở Ngưỡng của quy tắc “Cố định 30” (dưới 30), đổi 30 thành 35 và đổi sang Nhỏ hơn hoặc bằng（以下）.
2. Bấm Quay lại（戻る）.
3. Mở Điều kiện áp dụng, đổi tên, bấm Quay lại（戻る）.
4. Mở lại hai màn.

**期待結果（Kết quả mong đợi）**

Danh sách và hai màn vẫn hiện giá trị đã lưu trước đó (30, Nhỏ hơn, tên cũ).

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 4.4 “Lưu, đổi thứ tự và xóa”; Figma MW “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9461) 「戻る操作は未保存の入力を保存しない。」 (thao tác quay lại không lưu input chưa lưu), “chương 03 – ngưỡng, công thức, trạng thái nhập” (58:8712)
- Bằng chứng cần chụp: Ảnh danh sách trước/sau; ảnh màn mở lại.
- Sau khi chạy: Cấu hình không đổi.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-008"></a>

### TC-RS-FUNC-008 — Điều kiện áp dụng: Toàn bộ đối tượng hoặc giới hạn bằng bộ lọc kế thừa từ tính tự động

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05)

<!-- Mã truy vết: TD-ROLE-01, TD-GRP-01, TD-RULE-12 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Đăng nhập tài khoản giáo viên có quyền sửa mục.
- Dữ liệu test: các lớp học phần G-A, G-B, G-C, quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao)

**操作（Thao tác）**

1. Mở Điều kiện áp dụng của một quy tắc mới.
2. Chọn Toàn bộ đối tượng（全員が対象）, lưu, mở lại.
3. Chọn Giới hạn bằng bộ lọc（特定条件で絞り込む）, bấm Thêm điều kiện lọc（絞り込み条件を追加）, liệt kê các loại lọc có trong danh sách.
4. Cấu hình như quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao), lưu, mở lại.

**期待結果（Kết quả mong đợi）**

1. Hai lựa chọn đối tượng lưu và mở lại đúng.
2. Có các bộ lọc Môn/phân môn（教科・科目）, Khối（学年）, lớp/nhóm và các điều kiện lựa chọn đang được hỗ trợ (đặc tả v2 mục 5.1 “Đối tượng áp dụng”). Danh sách đề xuất (PROPOSED, thiết kế DB v2 mục 3.2 “`apply_condition`”): khối (`hr_grade`), môn (`subject`), phân môn (`sub_subject`), lớp học phần (`group`), lớp chủ nhiệm (`homeroom`), nhóm tổng hợp (`calc_group`), mã lựa chọn của mục (`choice`).
3. Không có trình soạn AND/OR lồng nhau.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 5.1 “Đối tượng áp dụng”; Figma MW “màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình” (58:8930) (UI｜03A), (58:9067–9103); CODE `AutoRatingConfController::registCondition`, `getFirstFilterList`; [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 3.2 “`apply_condition`” (`filters[].type`, PROPOSED)
- Bằng chứng cần chụp: Ảnh danh sách loại lọc; ảnh màn sau khi mở lại.
- Sau khi chạy: Quy tắc có bộ lọc quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao).
- Ghi chú: Danh sách loại lọc chưa chốt: đặc tả v2 ghi "các bộ lọc phù hợp"; thiết kế DB v2 mục 3.2 “`apply_condition`” đề xuất 7 loại (PROPOSED). Phần danh sách không đánh PASS/FAIL.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-009"></a>

### TC-RS-FUNC-009 — Điều kiện phân nhánh theo Trung bình（平均点） được lưu cùng bộ nguồn

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12)

<!-- Mã truy vết: TD-ROLE-01, TD-RULE-07, TD-SRC-02 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Đăng nhập tài khoản giáo viên có quyền sửa mục. Có nguồn tổng hợp mặc định.
- Dữ liệu test: cặp quy tắc phân nhánh theo trung bình 60, bản tổng hợp mới nhất chưa chốt (trung bình 62)

**操作（Thao tác）**

1. Tạo quy tắc "Trung bình dưới 60": thêm bộ lọc Môn（教科・科目）= Toán（数学） và điều kiện Trung bình（平均点）.
2. Chọn Thời kỳ tổng hợp（集計対象時期）= 1学期期末 (cuối kỳ học kỳ 1), Thiết lập tổng hợp thứ hạng（順位集計設定）= 評点集計 (tổng hợp điểm đánh giá), Nhóm học sinh được tổng hợp — 集計対象（母集団）= ホームルーム (lớp chủ nhiệm; file Figma cũ ghi HR毎).
3. Nhập mốc 60, dấu Nhỏ hơn（未満）, lưu.
4. Tạo quy tắc thứ hai với mốc 60, dấu Từ mức này trở lên（以上）.
5. Mở lại cả hai.

**期待結果（Kết quả mong đợi）**

1. Cả hai quy tắc lưu được, là hai dòng riêng trong danh sách (không phải một form hai nhánh).
2. Mở lại giữ đủ bộ nguồn, mốc, dấu.
3. Không có lựa chọn Kết quả tổng hợp dùng để tham chiếu（参照する集計結果） (đặc tả v2 mục 3 “Bản đồ màn hình và luồng thao tác”, mục 5.5 “Chọn bản nguồn”).

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Một mục đánh giá có một hay nhiều thiết lập điểm đỏ?” (Q5), câu “Lấy trung bình của nhóm nào và kết quả tổng hợp nào?” (Q9); [đặc tả v2](../specification.vi.md) (R18) mục 5.2 “Điều kiện dựa trên trung bình”, mục 5.4 “Bộ thông tin nguồn”; Figma MW “màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình” (58:9052–9156) (UI｜03A: 平均点が 60 点 未満 (trung bình dưới 60 điểm))
- Bằng chứng cần chụp: Ảnh form sau khi mở lại; ảnh danh sách có hai dòng.
- Sau khi chạy: Có cặp quy tắc phân nhánh theo trung bình 60.
- Ghi chú: Tập dấu của điều kiện phân nhánh (`<`, `≤`, `≥`, `>`) là PROPOSED (đề xuất thiết kế chờ review — đặc tả v2 mục 13.1). Phạm vi phát hành phân nhánh trung bình: TBD (phạm vi phát hành chưa chốt — đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-010"></a>

### TC-RS-FUNC-010 — Điều kiện Tỷ lệ điểm của nhóm（集団の得点率） được lưu cùng bộ nguồn

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12)

<!-- Mã truy vết: TD-ROLE-01, TD-RULE-09, TC-RS-CALC-025 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Đăng nhập tài khoản giáo viên có quyền sửa mục.
- Dữ liệu test: quy tắc theo tỷ lệ điểm của nhóm từ 65%

**操作（Thao tác）**

1. Tạo quy tắc với điều kiện Tỷ lệ điểm của nhóm（集団の得点率）, nguồn mặc định, mốc 65, dấu Từ mức này trở lên（以上）.
2. Lưu, mở lại.

**期待結果（Kết quả mong đợi）**

Lưu và mở lại đúng loại điều kiện, nguồn, mốc 65 và dấu. Không có tùy chọn chọn cách tính A/B.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Tỷ lệ nhóm có cần xử lý riêng khi các lớp khác điểm tối đa không?” (Q31); [đặc tả v2](../specification.vi.md) (R18) mục 5.3 “Tỷ lệ nhóm”; Figma MW “màn Điều kiện áp dụng – điều kiện tỷ lệ điểm của nhóm” (58:9164–9397) (UI｜03B: 得点率が 65 % 以上 (tỷ lệ từ 65% trở lên))
- Bằng chứng cần chụp: Ảnh form sau khi mở lại.
- Sau khi chạy: Có quy tắc theo tỷ lệ điểm của nhóm từ 65%.
- Ghi chú: Phạm vi phát hành: TBD (phạm vi phát hành chưa chốt — đặc tả v2 mục 13.1). Tính đúng `R`: case “Tỷ lệ nhóm 64.99% (hiển thị 65.0) không khớp ≥ 65%”…027.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-011"></a>

### TC-RS-FUNC-011 — Chọn loại ngưỡng làm thay đổi vùng nhập

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”, mục 6.1 “Thành phần chung của màn ngưỡng”

<!-- Mã truy vết: TC-RS-UI-015 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mở Ngưỡng của một quy tắc.
- Dữ liệu test: —

**操作（Thao tác）**

1. Chọn Điểm cố định（固定点数）.
2. Chọn Tỷ lệ điểm tối đa（得点率）.
3. Chọn Công thức（計算式）.

**期待結果（Kết quả mong đợi）**

1. Cố định: có ô ngưỡng và dấu so sánh; không có vùng nguồn trung bình, không có xử lý phần lẻ.
2. Tỷ lệ: có ô %, xử lý phần lẻ, dấu so sánh; không có vùng nguồn trung bình.
3. Công thức: có vùng nguồn trung bình, bảng dòng công thức, dấu so sánh.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Điều kiện nào không cần nguồn trung bình?” (Q10); [đặc tả v2](../specification.vi.md) (R18) mục 5.6 “Khi nào không cần nguồn?”, mục 6.1 “Thành phần chung của màn ngưỡng”; Figma MW “màn Ngưỡng – điểm cố định” (58:8022) (UI｜04A), “màn Ngưỡng – tỷ lệ điểm tối đa” (58:8194) (UI｜04B), “màn Ngưỡng – công thức” (58:8389) (UI｜04C)
- Bằng chứng cần chụp: Ảnh màn ở ba loại.
- Ghi chú: Thứ tự khối trên màn công thức kiểm ở case “Màn Công thức: thứ tự khối nguồn trung bình và dòng công thức”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-012"></a>

### TC-RS-FUNC-012 — Công thức: thêm/xóa dòng, kết quả dòng cuối là ngưỡng

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16)

<!-- Mã truy vết: TD-RULE-06, TC-RS-CALC-015 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mở Ngưỡng loại Công thức（計算式）.
- Dữ liệu test: quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8)

**操作（Thao tác）**

1. Cấu hình dòng 1 và dòng 2 như quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8), lưu.
2. Mở lại; bấm Thêm công thức（計算式を追加） để có dòng 3, rồi xóa dòng 3, lưu.
3. Xem tóm tắt ở danh sách.

**期待結果（Kết quả mong đợi）**

1. Lưu được 2 dòng; mở lại giữ vế trái, phép toán, vế phải, xử lý phần lẻ từng dòng.
2. Danh sách tóm tắt đủ các dòng và dấu so sánh.
3. Khi xét, `T` = kết quả dòng cuối (tính đúng ở case “Công thức hai dòng theo Figma: (A÷2)×0.8, dòng 1 làm tròn xuống”).

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Ngưỡng dùng trung bình có chỉ gồm hai công thức cố định không?” (Q6); [đặc tả v2](../specification.vi.md) (R18) mục 6.4 “Công thức dùng trung bình”; Figma MW “màn Ngưỡng – công thức” (58:8594), (58:8563) (bảng 式1/式2, nút 計算式を追加 (thêm công thức)), (58:8581) 「最後の式の結果を基準点として使用します。」 (dùng kết quả của công thức cuối làm điểm ngưỡng)
- Bằng chứng cần chụp: Ảnh form sau khi mở lại; ảnh tóm tắt trên danh sách.
- Sau khi chạy: Có quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8).
- Ghi chú: Tập toán hạng Trung bình（平均点）/Số cố định（固定値）/Kết quả dòng trước（式の結果） là PROPOSED (đề xuất thiết kế chờ review — đặc tả v2 mục 13.1). Giới hạn số dòng: TBD (đặc tả v2 mục 6.8 “Yêu cầu độ chính xác”). Phạm vi phát hành công thức: TBD (phạm vi phát hành chưa chốt — đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-013"></a>

### TC-RS-FUNC-013 — Dấu so sánh Nhỏ hơn（未満）/Nhỏ hơn hoặc bằng（以下） được lưu và hiển thị

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 6.1 “Thành phần chung của màn ngưỡng”

<!-- Mã truy vết: TD-RULE-01, TD-RULE-02, TC-RS-CALC-001, TC-RS-UI-012 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Có quy tắc “Cố định 30” (dưới 30).
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30), quy tắc cố định 30 với Nhỏ hơn hoặc bằng（以下）

**操作（Thao tác）**

1. Đổi dấu của quy tắc “Cố định 30” (dưới 30) sang Nhỏ hơn hoặc bằng（以下）, lưu, mở lại.
2. Đổi lại Nhỏ hơn（未満）, lưu, mở lại.

**期待結果（Kết quả mong đợi）**

Dấu đã chọn được lưu, hiển thị đúng ở form và tóm tắt danh sách. Tác động lên kết quả: case “Ngưỡng cố định 30: S = 29 / 30 / 31 với `<` và `≤`”.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Điểm bằng ngưỡng có bị xét đỏ không?” (Q4); [đặc tả v2](../specification.vi.md) (R18) mục 6.1 “Thành phần chung của màn ngưỡng”; Figma MW “màn Ngưỡng – điểm cố định” (58:8176), “màn Ngưỡng – công thức” (58:8572) (比較条件 (điều kiện so sánh))
- Bằng chứng cần chụp: Ảnh form và danh sách sau mỗi lần lưu.
- Sau khi chạy: quy tắc “Cố định 30” (dưới 30) dùng Nhỏ hơn.
- Ghi chú: Mặc định khi tạo mới là `<` (PROPOSED, đề xuất thiết kế chờ review — đặc tả v2 mục 13.1) — case “Mặc định khi tạo quy tắc mới”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-014"></a>

### TC-RS-FUNC-014 — Quy tắc mới chỉ có điều kiện, chưa có ngưỡng, không tham gia xét

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 4.4 “Lưu, đổi thứ tự và xóa”

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-13, TD-RULE-01, TD-STU-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có quy tắc mới chỉ có điều kiện, chưa có ngưỡng ở ưu tiên 1 (Toàn bộ, chưa có ngưỡng) và quy tắc “Cố định 30” (dưới 30) ở ưu tiên 2.
- Dữ liệu test: mục số nguyên (M=100); quy tắc mới chỉ có điều kiện, chưa có ngưỡng, quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29)

**操作（Thao tác）**

1. Xem danh sách.
2. Đăng ký điểm S01=29.
3. Xem kết quả ở trích xuất.

**期待結果（Kết quả mong đợi）**

1. Dòng quy tắc mới chỉ có điều kiện, chưa có ngưỡng hiện ngưỡng "chưa thiết lập" và thao tác mở màn ngưỡng.
2. Khi xét, quy tắc mới chỉ có điều kiện, chưa có ngưỡng không được chọn như quy tắc hoàn chỉnh; S01 được xét theo quy tắc “Cố định 30” (dưới 30) → Đỏ.
3. Không tạo ngưỡng 0 ngầm.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 4.4 “Lưu, đổi thứ tự và xóa” (Đề xuất thiết kế cho thao tác thêm); Figma MW “chương 01 – lối vào, danh sách, xóa thiết lập” (58:10165–10179) 「基準が未設定のため、この設定は判定に使用しません。」 (vì chưa thiết lập ngưỡng, thiết lập này không dùng để xét), “chương 02 – điều kiện áp dụng và nguồn trung bình” (58:8925) 「基準未設定の行は判定に使わない。」 (dòng chưa có ngưỡng không dùng để xét)
- Bằng chứng cần chụp: Ảnh danh sách; ảnh kết quả trích xuất; SELECT `setting_status` của quy tắc mới chỉ có điều kiện, chưa có ngưỡng (khi có schema; kỳ vọng `setting_status=0` — thiết kế DB v2 mục 4.1: trạng thái 0 là đang thiết lập/vô hiệu và không tham gia xét).
- Ghi chú: Toàn bộ case là đề xuất: không phải must-pass. Nếu thiết kế cuối không lưu trung gian, chuyển SKIPPED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-015"></a>

### TC-RS-FUNC-015 — Quy trình vận hành dùng trung bình: tắt tự tổng hợp → nút xanh → nút cam

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Thứ tự đánh giá tương đối” (AC-G25)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-07, TD-ROLE-03, TD-GRP-02, TD-STU-01, TD-STU-02, TD-STU-03, TD-STU-04, TD-STU-05, AC-G25, TC-RS-BR-034 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có cặp quy tắc phân nhánh theo trung bình 60. Điểm của nhóm HR1 đã đầy đủ. Không có bản chốt cho nguồn mặc định. Đăng nhập tài khoản có quyền chạy hàng loạt.
- Dữ liệu test: mục số nguyên (M=100); cặp quy tắc phân nhánh theo trung bình 60, các lớp chủ nhiệm HR1, HR2, học sinh S01–S05

**操作（Thao tác）**

1. Thiết lập tổng hợp thứ hạng（順位集計設定）→ Thiết lập chi tiết（詳細設定）: đặt tự tổng hợp khi đăng ký điểm là Không thực hiện（実行しない）.
2. Ở Tổng hợp thành tích（成績集計）, chọn Khối 1, kỳ 1学期期末 (cuối kỳ học kỳ 1), bấm Thực hiện tổng hợp（集計実行）, chờ hoàn tất.
3. Bấm Thực hiện tính toán tự động（自動算出実行）, chờ hoàn tất.
4. Xem kết quả ở ba đầu ra.
5. Sau bước 3, xem lần chạy tổng hợp gần nhất hiển thị ở Tổng hợp thành tích（成績集計）.

**期待結果（Kết quả mong đợi）**

1. Sau bước 2 (chỉ nút xanh), kết quả đỏ chưa thay đổi.
2. Sau bước 3, mỗi ô của S01–S05 có kết quả theo nhánh đúng với `A` của tổng hợp vừa chạy.
3. Ba đầu ra hiển thị cùng kết quả mới.
4. (Theo tiêu chí nghiệm thu “Thứ tự đánh giá tương đối”) Bước 3 không tự chạy lại Thực hiện tổng hợp（集計実行） hay thêm lượt xét thứ hai, kể cả khi tính tự động làm đổi điểm dùng cho trung bình: lần chạy tổng hợp gần nhất vẫn là lần ở bước 2. Muốn dùng trung bình mới thì người dùng chạy lại quy trình.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Quy trình vận hành khi có đánh giá tương đối là gì?” (Q12); [đặc tả v2](../specification.vi.md) (R18) mục 7.4 “Quy trình vận hành khi dùng trung bình/tỷ lệ nhóm”; Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:6933) (04), (58:6944) 「平均を使う場合は、成績登録時の自動集計を「実行しない」に設定」 (khi dùng trung bình, đặt tự tổng hợp khi đăng ký điểm là không thực hiện), (58:7022–7045); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Thứ tự đánh giá tương đối” (AC-G25) (không thêm vòng lặp tới hội tụ); [tài liệu chia công việc v2](../split-tasks.vi.md) (RSD-TASK) công việc “Cập nhật kết quả khi đăng ký và chạy hàng loạt” (Task 4) (Thay đổi nghiệp vụ, gạch đầu dòng 3)
- Bằng chứng cần chụp: Ảnh cấu hình 実行しない (không thực hiện); ảnh màn tổng hợp sau mỗi nút (thấy lần chạy gần nhất); ảnh/file ba đầu ra.
- Sau khi chạy: Kết quả hiện hành cập nhật.
- Ghi chú: Hệ thống không bắt buộc tắt tự tổng hợp (case “Bật tự tổng hợp khi đăng ký: hệ thống không chặn; quy tắc độc lập với trung bình vẫn xét”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-016"></a>

### TC-RS-FUNC-016 — Đăng ký/sửa điểm trực tiếp ở màn lớp kích hoạt xét

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-01, TD-STU-01, TD-STU-03 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30); mục số nguyên (M=100) không có quy tắc tính tự động.
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29), học sinh S03 (điểm 31)

**操作（Thao tác）**

1. Ở màn đăng ký điểm của lớp G-A, nhập S01=29, S03=31, lưu.
2. Xem trích xuất.

**期待結果（Kết quả mong đợi）**

Sau khi lưu thành công: S01 Đỏ, S03 Không đỏ. Không cần chạy nút cam; không cần mục có quy tắc tính tự động.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Khi nào xét điểm đỏ và có cần chế độ thủ công/tự động riêng không?” (Q11); [đặc tả v2](../specification.vi.md) (R18) mục 7.2 “Bảng sự kiện” (Đăng ký/sửa điểm trực tiếp); CODE `AdminNBGradeSettingSystemLessonController::store` (đường ghi điểm “Màn lớp NB 成績登録 (đăng ký điểm)”)
- Bằng chứng cần chụp: Ảnh màn đăng ký điểm sau lưu; ảnh kết quả trích xuất.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-017"></a>

### TC-RS-FUNC-017 — Nhập CSV điểm lớp học phần (NB) kích hoạt xét

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-01, TD-STU-01, AC-G26, AC-G23, TC-RS-FUNC-035 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30). Chạy hai lần: (a) trường có tính tự động, (b) trường không có tính tự động.
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29)

**操作（Thao tác）**

1. Mở Đăng ký thành tích bằng CSV（成績CSV登録） của lớp G-A, nhập CSV với S01=29.
2. Xem kết quả ở trích xuất.
3. Nhập lại CSV với S01=31, xem kết quả.

**期待結果（Kết quả mong đợi）**

1–2. Nhập thành công → S01 được xét: Đỏ, ở cả (a) và (b) (không phụ thuộc việc trường có tính tự động).

3. S01 Không đỏ; không còn dấu đỏ cũ.

Điểm và kết quả nhất quán theo ranh giới giao dịch hiện có (tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn”).

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 7.2 “Bảng sự kiện” (Nhập CSV điểm); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23); [tài liệu chia công việc v2](../split-tasks.vi.md) (RSD-TASK) công việc “Cập nhật kết quả khi đăng ký và chạy hàng loạt” (Task 4) (Đăng ký thành tích bằng CSV（成績CSV登録） `/admin/nb/grade/grade_setting_system/lesson_group_csv/regist/(:num)`); CODE đường ghi điểm “CSV lớp NB” `AdminNBGradeSettingSystemLessonCsvController::import`
- Bằng chứng cần chụp: File CSV đã dùng (không có dữ liệu thật); ảnh kết quả sau từng lần.
- Ghi chú: CSV đăng ký điểm lớp chủ nhiệm hàng loạt（HR成績CSV一括登録）: case “Nhập CSV đăng ký điểm lớp chủ nhiệm hàng loạt（HR成績CSV一括登録） kích hoạt xét” (TBD).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-018"></a>

### TC-RS-FUNC-018 — Liên kết kết quả chấm bài thi kích hoạt xét

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-01, TD-GRP-01, TD-STU-01, AC-G23 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Có bài thi đã chấm liên kết tới mục số nguyên (M=100) cho lớp G-A và lớp G-C; quy tắc “Cố định 30” (dưới 30) trên mục số nguyên (M=100). G-A đủ thiết lập để AutoRating chạy. G-C được chuẩn bị để `createArgument` không trả lớp này (ví dụ chưa đăng ký thiết lập lớp học bắt buộc（入力必須の授業設定）), nên AutoRating bị bỏ qua.
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), các lớp học phần G-A, G-B, G-C, học sinh S01 (điểm 29)

**操作（Thao tác）**

1. Liên kết kết quả chấm của G-A với S01=29 (quy tắc cố định quy tắc “Cố định 30” (dưới 30)), gồm trường hợp lớp không có quy tắc tính tự động.
2. Liên kết kết quả chấm của G-C với một học sinh của G-C = 28.
3. Xem điểm đã ghi và kết quả đỏ của hai lớp.
4. (Tùy chọn) Lặp lại với quy tắc cần trung bình.

**期待結果（Kết quả mong đợi）**

1. S01 Đỏ.

2–3. Điểm 28 của G-C đã được ghi và ô đó được xét → Đỏ, dù AutoRating bị bỏ qua. Không có ô đã ghi nào ở G-C bị để lại không có kết quả.

4. Quy tắc cần trung bình: liên kết không chạy tổng hợp thứ hạng nên trung bình có thể cũ — việc chấp nhận trung bình cũ chưa chốt, phần này TBD, không đánh PASS/FAIL.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 7.2 “Bảng sự kiện” (Liên kết kết quả chấm bài thi: "kể cả nhánh tính tự động bị bỏ qua"), mục 12.2 “Điểm tích hợp chính” (Liên kết điểm thi); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23); [tài liệu chia công việc v2](../split-tasks.vi.md) (RSD-TASK) công việc “Cập nhật kết quả khi đăng ký và chạy hàng loạt” (Task 4) (xử lý liên kết điểm thi ghi điểm trước rồi bỏ AutoRating nếu `createArgument` không trả lớp; phải bao phủ ô đã ghi ở đường này); code hiện tại “Liên kết điểm thi: transaction, bỏ AutoRating khi thiếu lớp” `ScoringResultService::linkStudentScoringResults` (bỏ qua ở `:671–677`, ví dụ trong code: chưa đăng ký thiết lập lớp học bắt buộc（入力必須の授業設定）); code hiện tại “Liên kết điểm thi ghi điểm rồi bỏ qua AutoRating khi lớp không có trong…”; code hiện tại “Liên kết điểm thi không chạy 順位集計 (tổng hợp xếp hạng)”
- Bằng chứng cần chụp: Ảnh thao tác liên kết; ảnh thiết lập lớp học của G-C cho thấy điều kiện bỏ qua; ảnh điểm đã ghi và kết quả của hai lớp.
- Sau khi chạy: Khôi phục thiết lập lớp học của G-C.
- Ghi chú: Bước 4 TBD vì chưa chốt việc chấp nhận trung bình cũ. Cách đưa G-C vào điều kiện bỏ qua lấy từ chú thích code; hỏi team dev khi chuẩn bị. URL màn liên kết chưa xác minh (tài liệu chia công việc v2 công việc “Cập nhật kết quả khi đăng ký và chạy hàng loạt”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-019"></a>

### TC-RS-FUNC-019 — Lưu lựa chọn điểm tối đa của lớp khi đăng ký điểm kích hoạt xét

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị” (AC-G24)

<!-- Mã truy vết: TD-ITEM-03, TD-RULE-03, TC-RS-ERR-012 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục điểm đơn vị (đơn vị U1 có M riêng 40) có quy tắc tỷ lệ 30% (30%). Lớp G-B chưa dùng lựa chọn lớp; S06 có điểm U1 = 14 (M=40 → T=12 → Không đỏ).
- Dữ liệu test: mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc tỷ lệ 30%

**操作（Thao tác）**

1. Ở màn đăng ký điểm lớp G-B, chọn lựa chọn lớp M=50 cho U1, lưu.
2. Xem kết quả S06.

**期待結果（Kết quả mong đợi）**

Sau khi lưu thành công: M=50 → T=15 → S06=14 Đỏ.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Thay điểm tối đa thì xử lý thế nào?” (Q14), câu “Những đường đổi điểm tối đa nào hiện chạy tính tự động?” (Q20); [đặc tả v2](../specification.vi.md) (R18) mục 7.3 “Thay đổi điểm tối đa”
- Bằng chứng cần chụp: Ảnh chọn lựa chọn lớp; ảnh kết quả trước/sau.
- Sau khi chạy: G-B dùng lựa chọn lớp M=50.
- Ghi chú: Đường CSV lựa chọn lớp không gọi tính tự động (khác biệt đặc tả–code về “CSV lựa chọn điểm tối đa của lớp”); việc có xét đỏ khi điểm tối đa đổi qua CSV chưa chốt — xem case “Nhập CSV lựa chọn điểm tối đa của lớp”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-020"></a>

### TC-RS-FUNC-020 — Lưu Thiết lập điểm tối đa hàng loạt（満点一括設定） xếp hàng tính toán rồi mới có kết quả mới

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị” (AC-G24)

<!-- Mã truy vết: TD-ROLE-03, TD-RULE-03, TD-ITEM-03 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Trường có chức năng Thiết lập điểm tối đa hàng loạt（満点一括設定） (`/admin/grade/lesson_group/setting?setting_type=change_max_score`); tài khoản có quyền chạy hàng loạt; quy tắc tỷ lệ 30% trên mục điểm đơn vị (đơn vị U1 có M riêng 40).
- Dữ liệu test: mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc tỷ lệ 30%

**操作（Thao tác）**

1. Lưu M=50 cho các lớp/kỳ được phép.
2. Ngay sau khi lưu (trước khi batch xong), xem kết quả.
3. Chờ batch hoàn tất, xem lại.

**期待結果（Kết quả mong đợi）**

1. Ngay sau khi lưu: kết quả cũ vẫn hiện; không báo "hoàn tất" khi mới xếp hàng.
2. Sau batch thành công: kết quả theo M=50.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 7.3 “Thay đổi điểm tối đa”; CODE `GroupOptionUseCase::save` (đường ghi điểm “満点一括設定 (thiết lập điểm tối đa hàng loạt)”)
- Bằng chứng cần chụp: Ảnh sau lưu; ảnh trạng thái batch; ảnh kết quả sau batch.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-021"></a>

### TC-RS-FUNC-021 — Trường chỉ có quy tắc đỏ (không có tính tự động) vẫn có đường chạy hàng loạt

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-01, TD-ROLE-03, AC-G23, SI-09 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Trường không có quy tắc tính tự động nào đang hoạt động; mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30).
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), tài khoản có quyền chạy hàng loạt

**操作（Thao tác）**

1. Mở Tổng hợp thành tích（成績集計） (`/admin/grade/grade_setting_system/grade_calc`).
2. Tìm thao tác Thực hiện tính toán tự động（自動算出実行） cho Khối 1, kỳ 1学期期末 (cuối kỳ học kỳ 1).
3. Chạy, chờ hoàn tất, xem kết quả.

**期待結果（Kết quả mong đợi）**

Chạy được bằng thao tác hàng loạt hiện có (không có chế độ xét đỏ riêng); sau khi chạy, các ô được xét theo quy tắc “Cố định 30” (dưới 30). Nhãn/cách hiện nút cho trường không có tính tự động chưa chốt — không đánh giá phần này.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 7.2 “Bảng sự kiện” (đoạn cuối), mục 12.2 “Điểm tích hợp chính”; [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Xóa thiết lập cuối cùng thì dấu đỏ mất ngay hay chờ chạy lại?” (Q28); code hiện tại “Nút cam chỉ hiện khi có AutoRating active” (`grade_calc/index.php:124-126` chỉ hiện nút cam khi có tính tự động); Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:6949) 「赤点ルールのみ・最後のルール削除後も既存操作で再実行できる設計。」 (thiết kế chạy lại được bằng thao tác hiện có cả khi chỉ có quy tắc đỏ hoặc đã xóa quy tắc cuối); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23) (bảng: chạy theo đăng ký điểm và tính hàng loạt hiện có); [tài liệu chia công việc v2](../split-tasks.vi.md) (RSD-TASK) công việc “Cập nhật kết quả khi đăng ký và chạy hàng loạt” (Task 4)
- Bằng chứng cần chụp: Ảnh màn Tổng hợp thành tích（成績集計）; ảnh kết quả sau chạy.
- Ghi chú: Code hiện tại ẩn nút cam khi không có tính tự động (khác biệt đặc tả–code về “Đường chạy cho mục chỉ có quy tắc đỏ”) → dự kiến FAIL cho tới khi sửa. Cách hiển thị nút chưa chốt.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-022"></a>

### TC-RS-FUNC-022 — Trích xuất thành tích（成績抽出）: các tùy chọn đỏ được lưu và mở lại đúng

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Hiển thị ô trích xuất” (AC-G30)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-01, TD-ROLE-07, TD-OUT-01, TD-OUT-02, CF-03, TC-RS-UI-020 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30). Đăng nhập tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm).
- Dữ liệu test: mục số nguyên (M=100), quy tắc “Cố định 30” (dưới 30); cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau)

**操作（Thao tác）**

1. Mở thiết lập hiển thị của trích xuất, khung Thiết lập chi tiết thông tin lớp học（授業情報の詳細設定）, phần điều kiện đỏ.
2. Cấu hình cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, lưu, mở lại.
3. Cấu hình cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) (hai ký hiệu cùng bật), lưu, mở lại.
4. (PROPOSED) Chạy SELECT cột `extract_setting` của dòng `grade_extract_conf` tương ứng mẫu vừa lưu, lọc theo trường/năm test.
5. (PROPOSED) Nếu màn có chức năng sao chép thiết lập trích xuất hiện có: sao chép mẫu cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, mở bản sao.

**期待結果（Kết quả mong đợi）**

1. Có bốn tùy chọn độc lập: lọc học sinh có điểm đỏ, ký hiệu phía trước, ký hiệu phía sau, tô màu ô.
2. Ký hiệu trước và sau cùng bật được.
3. Màu chỉ chọn từ bảng màu hiện có (không có bộ chọn màu tự do).
4. Mở lại giữ đúng giá trị.
5. (PROPOSED) JSON `extract_setting` chứa phần điều kiện đỏ với các khóa `use_target_extract`, `use_prefix_mark`, `prefix_mark`, `use_suffix_mark`, `suffix_mark`, `use_cell_coloring`, `cell_color` khớp giá trị trên màn; không có cột/bảng mới cho thiết lập này.
6. (PROPOSED) Bản sao giữ nguyên bốn tùy chọn, ký hiệu và màu.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?” (Q16); [đặc tả v2](../specification.vi.md) (R18) mục 9.1 “Thiết lập”; [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 5.1 “Thiết lập hiển thị của Trích xuất thành tích（成績抽出）và Công cụ phiếu điểm（通知表ツール）” (lưu trong `grade_extract_conf.extract_setting`, sao chép theo đường thiết lập trích xuất hiện có — PROPOSED); Figma MW “tùy chọn đỏ ở Trích xuất thành tích (đặc tả v2: 05-A)” (58:6517–6529) (UI 07A), “chương 05 – trích xuất thành tích và kết quả Excel” (58:6241–6242)
- Bằng chứng cần chụp: Ảnh cấu hình sau mở lại cho cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau); kết quả SELECT (bước 4); ảnh bản sao (bước 5).
- Sau khi chạy: Mẫu trích xuất có cấu hình đỏ.
- Ghi chú: Nhãn và vị trí màn khác nhau giữa hai khung Figma — xung đột giữa các frame Figma về “Nhãn và vị trí tùy chọn đỏ ở Trích xuất thành tích（成績抽出）”, kiểm ở case “Trích xuất: vị trí và nhãn tùy chọn đỏ”. Bước 4–5 theo thiết kế DB đề xuất: nếu build lưu/sao chép theo cách khác nhưng bước 1–3 vẫn đạt thì ghi Notes, không FAIL; nếu màn không có chức năng sao chép thì ghi "không áp dụng" cho bước 5.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-023"></a>

### TC-RS-FUNC-023 — Trích xuất: lọc giữ học sinh có ít nhất một ô đỏ trong phạm vi đang xét

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lọc khi trích xuất” (AC-G29)

<!-- Mã truy vết: TD-ITEM-03, TD-STU-10, TD-STU-03, TD-STU-06, TD-RULE-01, TD-OUT-01, TD-OUT-02, AC-G29, TC-RS-ERR-013 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Kết quả đã xét: S10 Toán 24 Đỏ, Ngữ văn 70 Không đỏ; S03 Không đỏ ở mọi môn. S10 có thêm ô Toán ở một thời điểm khác, Không đỏ. S06 có mục điểm đơn vị (đơn vị U1 có M riêng 40) U1 = 25 Đỏ, U2 = 35 Không đỏ.
- Dữ liệu test: học sinh S10 (học lớp G-B và G-C), học sinh S03 (điểm 31), học sinh S06 (điểm dự kiến 24), mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc “Cố định 30” (dưới 30), cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau)

**操作（Thao tác）**

1. Chạy trích xuất với cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, phạm vi gồm Toán và Ngữ văn.
2. Chạy lại với phạm vi chỉ Ngữ văn.
3. Chạy với cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) (lọc tắt).
4. Với cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, chọn thời điểm khác thời điểm có ô Toán Đỏ của S10 (ô Toán của thời điểm đó Không đỏ).
5. Với cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu và mục điểm đơn vị (đơn vị U1 có M riêng 40): S06 có U1 Đỏ, U2 Không đỏ; chọn phạm vi chỉ U2.

**期待結果（Kết quả mong đợi）**

1. Bước 1: S10 có trong danh sách, S03 không.
2. Bước 2: S10 không thỏa điều kiện đỏ (ô Toán ngoài phạm vi); danh sách rỗng là kết quả hợp lệ.
3. Bước 3: danh sách không bị lọc theo đỏ (chỉ bật ký hiệu không giới hạn học sinh).
4. Bước 4: S10 không có trong danh sách; ô đỏ ở thời điểm khác không giúp thỏa điều kiện.
5. Bước 5: S06 không có trong danh sách; ô đỏ của U1 ngoài phạm vi đơn vị.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 9.1 “Thiết lập”, mục 9.2 “Kết quả và ví dụ”; Figma MW “chương 05 – trích xuất thành tích và kết quả Excel” (58:6243) 「抽出ONだけが生徒を絞る。対象範囲に赤点セルが1つ以上ある生徒が対象。」 (chỉ bật trích xuất mới lọc học sinh; học sinh có ≥1 ô đỏ trong phạm vi); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Lọc khi trích xuất” (AC-G29) ("trong môn/mục/thời điểm/đơn vị được chọn")
- Bằng chứng cần chụp: Ảnh kết quả năm lần chạy.
- Ghi chú: Kết hợp màu với bộ lọc khác: case “Trích xuất: ô vừa thỏa điều kiện màu khác vừa là ô đỏ” (thứ tự bộ lọc đỏ chưa chốt).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-024"></a>

### TC-RS-FUNC-024 — Trích xuất: chỉ ô đỏ được thêm ký hiệu/tô màu

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Hiển thị ô trích xuất” (AC-G30)

<!-- Mã truy vết: TC-RS-FUNC-023, TD-STU-10, TD-OUT-01, TD-OUT-02 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Như case “Trích xuất: lọc giữ học sinh có ít nhất một ô đỏ trong phạm vi đang xét”.
- Dữ liệu test: học sinh S10 (học lớp G-B và G-C), cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau)

**操作（Thao tác）**

1. Chạy trích xuất cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, xem dòng S10.
2. Chạy cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau), xem dòng S10.

**期待結果（Kết quả mong đợi）**

1. cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu: ô Toán hiện `*24` với nền màu Đỏ（赤） của bảng màu; ô Ngữ văn `70` không ký hiệu, không màu; không tô cả dòng.
2. cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau): ô Toán `※24!`; ô Ngữ văn `70`.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 9.1 “Thiết lập”, mục 9.2 “Kết quả và ví dụ” (ví dụ `※24!`); Figma MW “chương 05 – trích xuất thành tích và kết quả Excel” (58:6246) 「赤点のセルだけ装飾。生徒の全セルを赤くしない。」 (chỉ trang trí ô đỏ; không tô đỏ mọi ô của học sinh)
- Bằng chứng cần chụp: Ảnh kết quả; mã màu ô (inspect) so với bảng màu hiện có.
- Ghi chú: Màu nền quan sát được `#E38487`, chữ `#222222` chỉ là minh họa (đặc tả v2 mục 9.1 “Thiết lập”); đối chiếu palette thực tế. Màu lấy từ bảng màu hiện có; không ép mã `#E38487` (đặc tả v2 mục 9.1 “Thiết lập”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-025"></a>

### TC-RS-FUNC-025 — Trích xuất: file Excel khớp màn hình

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Excel khớp và dùng kết luận server” (AC-G31)

<!-- Mã truy vết: TC-RS-FUNC-024, TD-OUT-01, TD-OUT-02, TD-STU-05, TD-STU-10, TC-RS-BR-010, TC-RS-ERR-014, AC-G31 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Như case “Trích xuất: chỉ ô đỏ được thêm ký hiệu/tô màu”; S05 có ô trống.
- Dữ liệu test: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau), học sinh S05 (ô trống), học sinh S10 (học lớp G-B và G-C)

**操作（Thao tác）**

1. Chạy trích xuất, chụp màn kết quả.
2. Xuất Excel, mở file.
3. Lặp bước 1–2 với: (a) cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) (lọc đỏ TẮT); (b) phạm vi không có ô đỏ nào (0 kết quả); (c) sau khi một ô Đỏ bị ngừng kết quả cũ (như case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”, Chưa xét được); (d) mục có điểm bị ẩn theo thiết lập ẩn mục nhập (như case “Mục bị ẩn theo thiết lập ẩn mục nhập”).

**期待結果（Kết quả mong đợi）**

1–2. Danh sách học sinh trong Excel giống màn hình (lọc đỏ đang bật). Cùng ô: ký hiệu, màu nền, số liệu, ô trống trong Excel giống màn hình. Ô trống không hiện số 0. Tải Excel không kích hoạt xét.

3. Mỗi biến thể: file Excel khớp màn hình cùng lần — (a) đủ học sinh, chỉ ô đỏ có ký hiệu/màu; (b) Excel không có học sinh giống màn hình; (c) ô bị ngừng kết quả cũ không còn ký hiệu/màu; (d) điểm ẩn không hiện lại trong Excel.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 9.3 “Xuất file”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Excel khớp và dùng kết luận server” (AC-G31) ("màn hình và Excel thật phải khớp đối tượng, ký hiệu, màu, ô trống và giá trị"); [tài liệu chia công việc v2](../split-tasks.vi.md) (RSD-TASK) công việc “Lọc điểm đỏ và hiển thị trên Excel” (Task 5) (kiểm màn hình và file Excel thật với lọc ON/OFF, 0 kết quả, ngừng dùng kết quả cũ và ẩn điểm); Figma MW “chương 05 – trích xuất thành tích và kết quả Excel” (58:6358) 「Excelも赤点セルだけに記号・選択色を反映。空欄や非表示の点数を表示し直さない。」 (Excel cũng chỉ phản ánh ký hiệu/màu ở ô đỏ; không hiện lại ô trống hoặc điểm ẩn)
- Bằng chứng cần chụp: **File Excel thực** đính kèm cho mỗi lần chạy; ảnh màn hình cùng lần.
- Ghi chú: Định dạng xuất khác (PDF…) chỉ kiểm nếu trích xuất thực sự hỗ trợ.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-026"></a>

### TC-RS-FUNC-026 — Công khai thành tích（成績公開）: ba hiệu ứng đỏ hiển thị đúng ở màn học sinh

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Cấu hình công khai và ẩn điểm” (AC-G32)

<!-- Mã truy vết: TD-ITEM-01, TD-ITEM-03, TD-STU-01, TD-STU-06, TD-ROLE-05, TD-ROLE-07, AC-G32, CF-01, TC-RS-UI-023 -->

**前提条件（Điều kiện trước）**

- Điều kiện: S01 Đỏ (29), không phải điểm dự kiến. Lịch công khai đang mở.
- Dữ liệu test: mục số nguyên (M=100); mục điểm đơn vị (đơn vị U1 có M riêng 40); học sinh S01 (điểm 29), học sinh S06 (điểm dự kiến 24), tài khoản học sinh S01, tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm)

**操作（Thao tác）**

1. Ở Thiết lập công khai thành tích（成績公開設定）, mục mục số nguyên (M=100), chọn hiệu ứng đỏ Ngoặc（括弧）, lưu. Đăng nhập S01 xem Xác nhận thành tích（成績確認）.
2. Lặp với `*` phía trước.
3. Lặp với `*` phía sau.
4. Mở lại Thiết lập công khai thành tích.
5. Với mục điểm đơn vị mục điểm đơn vị (đơn vị U1 có M riêng 40) (S06 U1 = 25 Đỏ), chọn `*` phía trước, lưu; đăng nhập S06 xem.

**期待結果（Kết quả mong đợi）**

1–3. Lần lượt `(29)`, `*29`, `29*`. Không có nền màu riêng cho ô đỏ.

4. Hiệu ứng đã lưu gần nhất (`*` phía sau) được chọn sẵn.
5. Ô U1 hiện `*25`; ô U2 không ký hiệu.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?” (Q16); [đặc tả v2](../specification.vi.md) (R18) mục 10.1 “Phạm vi và tùy chọn”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Cấu hình công khai và ẩn điểm” (AC-G32) ("Lưu/mở lại … cho mục được thiết lập trong phạm vi điểm thường/đơn vị"); Figma “tùy chọn đỏ ở Công khai thành tích (đặc tả v2: 06-A)” (07B)/“màn học sinh xem thành tích công khai (đặc tả v2: 06-B)” (08B) 4595-2269, 4595-2453; Figma MW “chương 06 – dòng Cách hiển thị điểm đỏ（赤点の表示方法）có/không hiện” (58:5602–5610)
- Bằng chứng cần chụp: Ảnh cấu hình (cả khi mở lại) và ảnh màn học sinh cho mỗi hiệu ứng.
- Ghi chú: Tùy chọn "nguyên trạng" trên Figma: xung đột Figma–đặc tả về “Tùy chọn hiển thị đỏ ở Công khai thành tích（成績公開）” (case “Công khai: danh sách tùy chọn hiển thị đỏ”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-027"></a>

### TC-RS-FUNC-027 — Công khai: kết hợp hiệu ứng Điểm dự kiến（見込点） và điểm đỏ, khử trùng

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kết hợp hiệu ứng công khai” (AC-G33)

<!-- Mã truy vết: TD-STU-06, TD-ROLE-05, SI-03 -->

**前提条件（Điều kiện trước）**

- Điều kiện: S06 = 24, vừa là Điểm dự kiến（見込点） vừa Đỏ.
- Dữ liệu test: học sinh S06 (điểm dự kiến 24), tài khoản học sinh S01

**操作（Thao tác）**

Với mỗi dòng của bảng dưới, cấu hình hiệu ứng dự kiến và hiệu ứng đỏ, lưu, xem màn học sinh của S06.

(a) Ngoặc + `*` trước; (b) `*` trước + `*` trước; (c) Ngoặc + Ngoặc; (d) `*` trước + `*` sau; (e) không trang trí + Ngoặc; (f) điểm bị ẩn theo thiết lập hiện có（表示しない） + `*` trước.

**期待結果（Kết quả mong đợi）**

(a) `(*24)`; (b) `*24`, không phải `**24`; (c) `(24)`, không phải `((24))`; (d) `*24*`; (e) `(24)`; (f) vẫn ẩn, không hiện số, không để lại riêng dấu `*`.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Công khai thành tích kết hợp điểm dự kiến và điểm đỏ thế nào?” (Q30); [đặc tả v2](../specification.vi.md) (R18) mục 10.2 “Kết hợp điểm dự kiến và điểm đỏ”; Figma MW “chương 06 – công khai thành tích và màn học sinh” (58:5596–5597); CODE `GradePublishService.php:1113-1166` (chuẩn hóa `*(`→`(*`; hiệu ứng trùng hiện đang chồng)
- Bằng chứng cần chụp: Ảnh màn học sinh cho từng dòng (a)–(f).
- Ghi chú: (a), (b) xác nhận trực tiếp (Q&A nghiệp vụ đã xác nhận câu “Công khai thành tích kết hợp điểm dự kiến và điểm đỏ thế nào?”); (c)–(f) cụ thể hóa cùng quy tắc (đặc tả v2 mục 10.2 “Kết hợp điểm dự kiến và điểm đỏ”). Code hiện chồng hiệu ứng trùng → `**24` (khác biệt đặc tả–code về “Kết hợp hiệu ứng ở công khai”). (f): cách hiện thực chưa chốt.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-028"></a>

### TC-RS-FUNC-028 — Công khai: web, API và PDF học sinh dùng cùng kết quả và cùng hiệu ứng

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đúng người, lịch và đầu ra công khai” (AC-G34)

<!-- Mã truy vết: TC-RS-FUNC-026, TD-STU-01, TD-ROLE-05 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Như case “Công khai thành tích（成績公開）: ba hiệu ứng đỏ hiển thị đúng ở màn học sinh” với hiệu ứng `*` trước.
- Dữ liệu test: học sinh S01 (điểm 29), tài khoản học sinh S01

**操作（Thao tác）**

1. Xem màn web Xác nhận thành tích（成績確認） của S01.
2. Gọi API công khai thành tích của S01 bằng phiên học sinh.
3. Tải PDF công khai của S01.

**期待結果（Kết quả mong đợi）**

Cả ba hiển thị `*29` cho cùng ô; không nền màu.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 10.3 “Quyền, thời điểm và đầu ra liên quan”; CODE `WebGradePublishController`, `ApiGradePublishController`, `GradePublishPdfService` → `GradePublishService::getGradeData`
- Bằng chứng cần chụp: Ảnh web; response API (đã che thông tin cá nhân); **file PDF thực**.
- Ghi chú: Cần tài khoản học sinh test. Không dùng màn giáo viên thay màn học sinh.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-029"></a>

### TC-RS-FUNC-029 — Công cụ phiếu điểm（通知表ツール）: bốn cách hiển thị đỏ trên PDF

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Tùy chọn trên phiếu” (AC-G35)

<!-- Mã truy vết: TD-STU-01, TD-OUT-04, TD-ROLE-07 -->

**前提条件（Điều kiện trước）**

- Điều kiện: S01 Đỏ (29), không điểm dự kiến, không cờ nào. Các dòng khác của hộp tùy chọn chọn Nguyên trạng（そのまま表示）.
- Dữ liệu test: học sinh S01 (điểm 29), cấu hình phiếu điểm: ký tự “※” phía trước, tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm)

**操作（Thao tác）**

Với từng cách hiển thị: chọn ở dòng Thiết lập điểm đỏ（赤点設定）, đóng hộp, bấm Cập nhật（更新する）, xuất PDF phiếu của S01.

(a) Nguyên trạng（そのまま表示）; (b) Kèm ngoặc（カッコ付き）; (c) Ký tự phía trước（前に任意の文字） `※`; (d) Ký tự phía sau（後ろに任意の文字） `※`.

**期待結果（Kết quả mong đợi）**

(a) `29`; (b) `(29)`; (c) `※29`; (d) `29※`. Không nền màu; ký tự không tràn ô, không mất ký tự, không đổi cấu trúc template.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?” (Q16); [đặc tả v2](../specification.vi.md) (R18) mục 11.1 “Tùy chọn hiển thị đỏ”; Figma MW “chương 07 – phiếu điểm PDF” (58:5111) (07), “tùy chọn đỏ ở Công cụ phiếu điểm (đặc tả v2: 07-A)” (58:5176) (UI 07C), (58:5128) 「29点は赤点の前記号で※29。25点は通常表示。赤点の背景色は追加しない。」 (29 điểm là đỏ → ※29; 25 điểm hiển thị thường; không thêm nền đỏ)
- Bằng chứng cần chụp: **File PDF thực** cho (a)–(d).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-030"></a>

### TC-RS-FUNC-030 — Phiếu điểm: thứ tự điều kiện và dừng ở điều kiện khớp đầu tiên

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Phiếu dừng ở điều kiện khớp đầu tiên” (AC-G36)

<!-- Mã truy vết: TD-STU-06, TD-STU-01, TD-STU-05, TD-OUT-04, AC-G36 -->

**前提条件（Điều kiện trước）**

- Điều kiện: S06 = 24 vừa dự kiến vừa Đỏ; S01 = 29 Đỏ, không cờ; S05 ô trống, trước đó từng Đỏ.
- Dữ liệu test: học sinh S06 (điểm dự kiến 24), học sinh S01 (điểm 29), học sinh S05 (ô trống), cấu hình phiếu điểm: ký tự “※” phía trước

**操作（Thao tác）**

Cấu hình hộp tùy chọn theo từng dòng, bấm Cập nhật（更新する）, xuất PDF.

(a) Dự kiến = Kèm ngoặc; đỏ = `※` trước → xem S06.

(b) Dự kiến = Nguyên trạng; đỏ = `※` trước → xem S06.

(c) Dự kiến = Ẩn（表示しない） hoặc Gạch chéo（斜線）; đỏ = `※` trước → xem S06.

(d) Không điều kiện phía trên khớp; đỏ = `※` trước → xem S01.

(e) Ô trống（空欄の場合）= Kèm ngoặc; đỏ = `※` trước → xem S05.

(f) Trường hợp môn cụ thể（特定の科目の場合） = Toán, Kèm ngoặc; đỏ = `※` trước → xem S01 (Toán, Đỏ).

(g) Tạm gắn thêm cờ Chưa dự thi（未受験） cho S06; Dự kiến = Nguyên trạng, Chưa dự thi = Ẩn（表示しない）; đỏ = `※` trước → xem S06.

**期待結果（Kết quả mong đợi）**

(a) `(24)`, không thêm `※`; (b) `24`, không chuyển xuống điều kiện đỏ; (c) giữ ẩn/gạch chéo, đỏ không làm hiện lại điểm; (d) `※29`; (e) không áp dấu đỏ của kết quả cũ; ô trống hiển thị theo cấu hình ô trống; (f) `(29)`, điều kiện môn cụ thể thắng, không thêm `※`; (g) `24`: Nguyên trạng ở dòng dự kiến dừng xét, không áp lệnh Ẩn của dòng chưa dự thi phía sau.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Điều kiện điểm đỏ nằm ở đâu trên phiếu điểm?” (Q29); [đặc tả v2](../specification.vi.md) (R18) mục 11.2 “Thứ tự và điều kiện khớp đầu tiên”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Phiếu dừng ở điều kiện khớp đầu tiên” (AC-G36) ("xét môn cụ thể → ô chọn theo thứ tự → đỏ → ô trống → bình thường"; "Nguyên trạng cũng dừng, không tìm tiếp lệnh ẩn phía sau"); Figma MW “tùy chọn đỏ ở Công cụ phiếu điểm (đặc tả v2: 07-A)” (58:5176) (thứ tự hiển thị 特定の科目の場合 (trường hợp môn cụ thể) → [見込点]チェック (checkbox điểm dự kiến) → [未受験]チェック (checkbox chưa dự thi) → 赤点設定 (thiết lập điểm đỏ) → 空欄の場合 (trường hợp ô trống)); CODE `ReportWidgetGradesNormalData.php:734-798`
- Bằng chứng cần chụp: **File PDF thực** cho (a)–(g); ảnh hộp tùy chọn.
- Ghi chú: (e): Q&A nghiệp vụ đã xác nhận câu “Điều kiện điểm đỏ nằm ở đâu trên phiếu điểm?” đặt đỏ trước ô trống; ô trống ở trạng thái Không có điểm nên không có kết quả đỏ hiện hành (đặc tả v2 mục 11.2 “Thứ tự và điều kiện khớp đầu tiên”) — cách hiện thực TBD. Không kết hợp hiệu ứng như màn công khai. (g): gỡ cờ Chưa dự thi của S06 sau khi chạy.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-031"></a>

### TC-RS-FUNC-031 — Phiếu điểm: lưu qua Cập nhật（更新する）, mở lại giữ lựa chọn; chỉ dùng điều kiện đỏ vẫn được ghi nhận

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu, sao chép và PDF phiếu” (AC-G37)

<!-- Mã truy vết: TD-OUT-04, AC-G37, TC-RS-DATA-011 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Bảng điểm（成績表） chưa dùng điều kiện nào (Thiết lập điều kiện hiển thị（表示条件を設定）= Không thiết lập（設定しない）).
- Dữ liệu test: cấu hình phiếu điểm: ký tự “※” phía trước

**操作（Thao tác）**

1. Mở hộp tùy chọn, chọn Thiết lập（設定する）, chỉ chọn dòng đỏ = `※` trước, các dòng khác Nguyên trạng. Đóng hộp, **không** bấm Cập nhật; tải lại trang.
2. Lặp lại, lần này bấm Cập nhật（更新する）; tải lại, mở hộp.
3. Xuất PDF.

**期待結果（Kết quả mong đợi）**

1. Không bấm Cập nhật: thay đổi không được lưu (hành vi hiện có).
2. Có bấm Cập nhật: mở lại thấy dòng đỏ = `※` trước; bảng được ghi nhận là có dùng điều kiện dù chỉ điều kiện đỏ được chọn.
3. PDF áp dụng điều kiện đỏ.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 11.1 “Tùy chọn hiển thị đỏ”, mục 11.3 “Lưu và xuất”; Figma MW “chương 07 – phiếu điểm PDF” (58:5111) ghi chú đóng hộp chưa lưu, “tùy chọn đỏ ở Công cụ phiếu điểm (đặc tả v2: 07-A)” (07C) 「※変更後はビューエリアの下の「更新する」ボタンを押してください。」 (sau khi đổi, bấm nút 「Cập nhật」 bên dưới vùng xem); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Lưu, sao chép và PDF phiếu” (AC-G37); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 5.1 “Thiết lập hiển thị của Trích xuất thành tích（成績抽出）và Công cụ phiếu điểm（通知表ツール）” (lưu vào phần lưu bảng/điều kiện hiện có, không thêm cột riêng — PROPOSED)
- Bằng chứng cần chụp: Ảnh hộp sau tải lại (hai lần); **file PDF thực**.
- Sau khi chạy: Bảng dùng điều kiện đỏ.
- Ghi chú: Mặc định Nguyên trạng cho dòng đỏ là PROPOSED (đặc tả v2 mục 11.1 “Tùy chọn hiển thị đỏ” Đề xuất mặc định). Nơi lưu vật lý không phải điều kiện PASS/FAIL; kiểm cột/bảng mới ở case “Bảng/cột mới theo quy tắc schema của BLEND”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-032"></a>

### TC-RS-FUNC-032 — Ba đầu ra dùng cùng kết quả cho cùng ô

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật” (AC-G22)

<!-- Mã truy vết: TD-STU-01, TD-STU-03, TD-STU-05, TD-OUT-01, TD-OUT-03, TD-OUT-04 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Kết quả đã xét: S01 Đỏ, S03 Không đỏ, S05 Không có điểm.
- Dữ liệu test: học sinh S01 (điểm 29), học sinh S03 (điểm 31), học sinh S05 (ô trống), cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước

**操作（Thao tác）**

1. Xem trích xuất + Excel.
2. Xem màn học sinh công khai.
3. Xuất PDF phiếu.

**期待結果（Kết quả mong đợi）**

Cả ba đầu ra: S01 có dấu đỏ theo cấu hình của đầu ra đó; S03 và S05 không có dấu đỏ. Không đầu ra nào tự chọn lại quy tắc hay tính lại ngưỡng.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?” (Q16); [đặc tả v2](../specification.vi.md) (R18) mục 7.1 “Trình tự cho một ô” bước 7; Figma MW “chương 00 – hướng dẫn đọc và luồng tổng thể” (58:10203) 「3出力は同じ有効な判定結果を参照。」 (ba đầu ra tham chiếu cùng kết quả có hiệu lực)
- Bằng chứng cần chụp: Ảnh/file của ba đầu ra trong cùng thời điểm.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-033"></a>

### TC-RS-FUNC-033 — Đổi tên quy tắc: giữ liên kết, thứ tự và kết quả

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04)

<!-- Mã truy vết: TD-RULE-01, TD-STU-01, AC-G04 -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc “Cố định 30” (dưới 30) đã xét: S01 Đỏ.
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29)

**操作（Thao tác）**

1. Đổi tên quy tắc “Cố định 30” (dưới 30) từ "Cố định 30" thành "Ngưỡng học kỳ 1", Lưu.
2. Xem danh sách và ba đầu ra.
3. Chạy lại bằng đăng ký điểm S01=29.

**期待結果（Kết quả mong đợi）**

1–2. Danh sách hiện tên mới ở cùng vị trí ưu tiên, tóm tắt không đổi; S01 vẫn Đỏ ở ba đầu ra.

3. S01 Đỏ; quy tắc được chọn vẫn là quy tắc đã đổi tên (không tạo quy tắc mới, không mất liên kết).

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 4.2 “Nội dung một dòng” ("Tên chỉ để nhận biết, không dùng làm khóa liên kết dữ liệu"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04) ("Đổi tên giữ liên kết"); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 2.1 “`red_score_settings`” (`setting_name` không dùng làm khóa)
- Bằng chứng cần chụp: Ảnh danh sách trước/sau; ảnh đầu ra; SELECT `red_score_setting_id` (khi có schema).
- Sau khi chạy: Đổi lại tên "Cố định 30".

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-034"></a>

### TC-RS-FUNC-034 — Nguồn của điều kiện áp dụng và nguồn của công thức lưu độc lập

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12)

<!-- Mã truy vết: AC-G12 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Ba nguồn cùng Thiết lập tổng hợp thứ hạng（順位集計設定） và nhóm ホームルーム (lớp chủ nhiệm), khác Thời kỳ tổng hợp（集計対象時期）: P `A=60`; P2 `A=70`; Q `A=40`.
- Dữ liệu test: Quy tắc: điều kiện Trung bình（平均点） `≥50` dùng nguồn P; ngưỡng Công thức（計算式） `A×0.5` dùng nguồn Q; `<`. S = 25

**操作（Thao tác）**

1. Lưu quy tắc, mở lại.
2. Chỉ đổi nguồn của điều kiện từ P sang P2, Lưu, mở lại.
3. Chạy nút cam.
4. Trên form, đổi Thời kỳ tổng hợp（集計対象時期） của nguồn điều kiện sang kỳ mà Thiết lập tổng hợp thứ hạng（順位集計設定） đang chọn vẫn hợp lệ; rồi đổi sang kỳ mà thiết lập đó không còn hợp lệ. Xem các ô chọn phụ thuộc sau mỗi lần đổi.

**期待結果（Kết quả mong đợi）**

1. Mỗi phần hiện đúng nguồn của mình (điều kiện: P; công thức: Q).
2. Điều kiện dùng P2; công thức vẫn dùng Q.
3. `70≥50` khớp; `T=40×0.5=20` → S=25 Không đỏ. Nếu công thức bị đổi theo P2 (`T=35`) hoặc dùng P (`T=30`) thì S=25 thành Đỏ — sai.
4. (PROPOSED) Chỉ lựa chọn phụ thuộc không còn hợp lệ bị xóa; lựa chọn còn hợp lệ được giữ; nguồn của công thức không đổi.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 5.4 “Bộ thông tin nguồn” ("Mỗi nơi sử dụng nguồn phải lưu đủ lựa chọn của chính nó"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12) ("sửa phần này không đổi phần kia"); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 3.1 “Bộ thông tin nguồn” (nguồn công thức ở cột quy tắc, nguồn điều kiện trong `apply_condition` — PROPOSED)
- Bằng chứng cần chụp: Ảnh form sau mỗi lần mở lại và sau mỗi lần đổi ở bước 4; ảnh kết quả.
- Ghi chú: Một bộ nguồn cho mọi toán hạng `A` trong công thức là PROPOSED (đặc tả v2 mục 5.4 “Bộ thông tin nguồn” Đề xuất thiết kế). Bước 4 theo đề xuất của tài liệu chia công việc v2 công việc “Thiết lập và lưu nhiều quy tắc” ("Đổi nguồn chỉ xóa lựa chọn phụ thuộc không còn hợp lệ") và tài liệu chia công việc v2 công việc “Hỗ trợ điều kiện và công thức dùng tổng hợp” ("đổi nguồn điều kiện không ngầm đổi nguồn công thức"). Phụ thuộc phạm vi đợt có công thức và điều kiện trung bình (phạm vi phát hành chưa chốt — đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-035"></a>

### TC-RS-FUNC-035 — Nhập CSV đăng ký điểm lớp chủ nhiệm hàng loạt（HR成績CSV一括登録） kích hoạt xét

Priority: TBD ｜ Status: TBD ｜ Requirement ID: tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-01, TD-STU-01, SI-10 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30). Chạy hai lần: (a) trường có tính tự động, (b) trường không có tính tự động.
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29)

**操作（Thao tác）**

1. Nhập CSV đăng ký điểm lớp chủ nhiệm hàng loạt（HR成績CSV一括登録） với S01=28.
2. Xem kết quả.

**期待結果（Kết quả mong đợi）**

Theo đặc tả v2 mục 7.2 “Bảng sự kiện”: nhập thành công → S01 Đỏ. tài liệu chia công việc v2 chưa đưa đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)” vào đường được hỗ trợ; code đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)” chỉ xếp hàng khi trường dùng tính tự động (context điểm đỏ khoảng trống tích hợp “Không có công thức / điểm sửa tay”) — cần xác nhận đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)” có thuộc đợt không.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 7.2 “Bảng sự kiện” (Nhập CSV điểm); khác biệt đặc tả–code về “Nhập CSV HR (đường ghi điểm HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)) ở trường không có AutoRating” (SI-10); CODE đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)” `AdminGradeBulkInputCsvController::itemImport`; [tài liệu chia công việc v2](../split-tasks.vi.md) (RSD-TASK) công việc “Cập nhật kết quả khi đăng ký và chạy hàng loạt” (Task 4) (không liệt kê đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)”; đường riêng/hệ thống cũ "chưa tự được coi là hỗ trợ")
- Bằng chứng cần chụp: File CSV đã dùng (không có dữ liệu thật); ảnh kết quả sau từng lần.
- Ghi chú: Đặc tả v2 yêu cầu xét; việc đường HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV) thuộc đợt nào chưa chốt (đặc tả v2 mục 13.1). Nếu ngoài đợt: SKIPPED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-036"></a>

### TC-RS-FUNC-036 — Danh sách nhóm tham chiếu theo thiết lập tổng hợp hiện hữu

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12)

<!-- Mã truy vết: TD-POP-01, TD-POP-03, TD-POP-04, TD-POP-05, TD-ITEM-01, TD-POP-02, TD-ROLE-01, TD-ROLE-03, AC-G12 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Trường A/2026 có thiết lập tổng hợp X（評点集計） (khối, lớp chủ nhiệm bật; lớp học tắt), nhóm tổng hợp thứ hạng “Toán I khối 1+2”, nhóm tổ hợp “Tổ hợp Toán”, nhóm môn học “Nhóm môn Toán”. Mở form thêm quy tắc của mục số nguyên (M=100) với điều kiện Trung bình（平均点） và ngưỡng Công thức（計算式） dùng trung bình.
- Dữ liệu test: thiết lập tổng hợp X（評点集計）, thiết lập tổng hợp X đã bật thêm Lớp học（授業）, nhóm tổng hợp thứ hạng “Toán I khối 1+2”, nhóm tổ hợp “Tổ hợp Toán”, nhóm môn học “Nhóm môn Toán”; mục số nguyên (M=100); tài khoản giáo viên có quyền sửa mục, tài khoản có quyền chạy hàng loạt

**操作（Thao tác）**

1. Ở nguồn của điều kiện: chọn Thời kỳ tổng hợp（集計対象時期）, chọn Thiết lập tổng hợp thứ hạng（順位集計設定） X, rồi mở danh sách Đối tượng tổng hợp（集計対象）. Ghi lại các lựa chọn.
2. Bật thêm Lớp học（授業） trong công tắc tổng hợp hiện hữu (thành thiết lập tổng hợp X đã bật thêm Lớp học（授業）), chạy lại tổng hợp X; mở lại danh sách ở bước 1.
3. Tắt cả ba công tắc khối/lớp chủ nhiệm/lớp học; mở lại danh sách. Chọn nhóm tổng hợp thứ hạng “Toán I khối 1+2”, lưu, mở lại form.
4. Ở trường/năm không có nhóm tổng hợp/tổ hợp/nhóm môn nào được cấu hình và chỉ bật khối: mở danh sách.
5. Ở nguồn của công thức: lặp thứ tự chọn Thiết lập tổng hợp thứ hạng → Đối tượng tổng hợp, chọn nhóm khác với nguồn điều kiện; lưu, mở lại.

**期待結果（Kết quả mong đợi）**

1. Trong ba loại cơ bản chỉ có Khối（学年） và Lớp chủ nhiệm（ホームルーム）; không có Lớp học（授業）. Có nhóm tổng hợp thứ hạng “Toán I khối 1+2”, nhóm tổ hợp “Tổ hợp Toán”, nhóm môn học “Nhóm môn Toán”, hiển thị bằng tên đã đặt.
2. Có thêm lựa chọn Lớp học（授業） trong cùng X; không phải tạo cấu hình tổng hợp mới để có loại này.
3. Không còn khối/lớp chủ nhiệm/lớp học; nhóm tổng hợp, tổ hợp, nhóm môn vẫn chọn được. Mở lại hiện đúng tên nhóm tổng hợp thứ hạng “Toán I khối 1+2” (đã lưu theo ID).
4. Chỉ có Khối（学年）; không hiện cố định đủ sáu loại, không có lựa chọn rỗng mang tên loại chưa cấu hình.
5. Nguồn điều kiện và nguồn công thức mở lại đúng lựa chọn riêng của từng phần. Form không có công tắc bật/tắt tổng hợp riêng của điểm đỏ, không có trường thứ hạng, tên hiển thị hay biểu đồ lấy từ màn công khai.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Nhóm tham chiếu phía điểm đỏ có tuân theo thiết lập tổng hợp hiện hữu không?…” (Q32), câu “Ba loại nhóm cấu hình có xuất hiện ngoài khối/HR/lớp học không?” (Q33) (phương án A); [context điểm đỏ](../../../CONTEXT.md) (CTX) mục 9.6 “Ba phản hồi review DB và bài học thiết kế ngày 28/09” (quyết định DB-R3 mục 1–6); [đặc tả v2](../specification.vi.md) (R18) mục 5.4 “Bộ thông tin nguồn” (đoạn "Đã xác nhận về lựa chọn nhóm"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12) (bảng quy tắc chọn/đọc nhóm); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 3.1 “Bộ thông tin nguồn” (mã `population_type` 1–6 và cờ `use_calc_hr_grade`/`use_calc_homeroom`/`use_calc_group` — PROPOSED); Figma MW “chương 02 – điều kiện áp dụng và nguồn trung bình” (58:8731) (quy tắc danh sách Đối tượng tổng hợp), “chương 02 – tái hiện công tắc tổng hợp theo khối/HR/lớp học hiện có（学年毎・HR毎・授業毎の集計）” (58:9405) (tái hiện công tắc 学年毎・HR毎・授業毎の集計 hiện có), “chương 02 – ví dụ mở danh sách Đối tượng tổng hợp（集計対象（母集団））” (58:9431) (ví dụ danh sách: 学年, ホームルーム, 文系選択, 国数英, 科目別母集団 — tên giả)
- Bằng chứng cần chụp: Ảnh danh sách Đối tượng tổng hợp sau mỗi bước; ảnh công tắc tổng hợp đang dùng; ảnh form sau khi mở lại.
- Sau khi chạy: Khôi phục công tắc tổng hợp của trường/năm test như trước khi chạy.
- Ghi chú: Hành vi CONFIRMED qua Q32/Q33; tên/mã kỹ thuật là PROPOSED. Bố cục và nhãn của bộ chọn phải đối chiếu file Figma MW; khác biệt chỉ về nhãn/bố cục ghi CONFLICT, không FAIL. Dữ liệu nhóm tham chiếu: hỏi team dev khi chuẩn bị. Phụ thuộc phạm vi đợt có điều kiện trung bình/công thức (phạm vi phát hành chưa chốt — đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-037"></a>

### TC-RS-FUNC-037 — Công khai: cùng mục dùng hiệu ứng đỏ khác nhau ở hai cấu hình công khai

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Cấu hình công khai và ẩn điểm” (AC-G32)

<!-- Mã truy vết: TD-ITEM-01, TD-OUT-05, TD-OUT-06, TD-ITEM-03, TD-STU-01, TD-ROLE-05, TD-ROLE-07, AC-G32, TC-RS-DATA-012 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Hai cấu hình Thiết lập công khai thành tích（成績公開設定） X và Y cùng chứa mục số nguyên (M=100); S01 Đỏ (29), không phải điểm dự kiến; lịch công khai của cả hai đang mở cho S01.
- Dữ liệu test: hai cấu hình công khai cùng một mục, cấu hình công khai có mục điểm thường và mục điểm đơn vị; mục số nguyên (M=100), mục điểm đơn vị (đơn vị U1 có M riêng 40); học sinh S01 (điểm 29); tài khoản học sinh S01, tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm)

**操作（Thao tác）**

1. Ở X chọn hiệu ứng đỏ Ngoặc（括弧） cho mục số nguyên (M=100), lưu; ở Y chọn `*` phía trước（前に「*」） cho cùng mục, lưu.
2. Mở lại X và Y.
3. Đăng nhập S01, xem Xác nhận thành tích（成績確認） theo từng cấu hình; gọi API và xuất PDF tương ứng nếu có.
4. Sao chép X thành X' (theo chức năng sao chép cấu hình hiện có); mở X'.
5. Ở X, mục số nguyên (M=100) (điểm thường（通常）) chọn Ngoặc; mục điểm đơn vị (đơn vị U1 có M riêng 40) (điểm đơn vị（単元）) chọn `*` phía sau; lưu, mở lại.
6. Ở Y, đổi sang `*` phía sau và giả lập lỗi lưu; mở lại Y.

**期待結果（Kết quả mong đợi）**

1–2. X giữ Ngoặc, Y giữ `*` phía trước; lưu cấu hình này không đổi cấu hình kia.
3. Theo X: `(29)`; theo Y: `*29`. Web, API và PDF của cùng cấu hình cho cùng cách hiển thị.
4. X' giữ Ngoặc cho mục số nguyên (M=100); không sao chép kết quả xét của học sinh.
5. Mỗi phân loại thường/đơn vị mở lại đúng lựa chọn của mình; không trộn.
6. Có thông báo lỗi; Y vẫn là `*` phía trước (cấu hình cũ được giữ).

**補足（Bổ sung）**

- Nguồn: [context điểm đỏ](../../../CONTEXT.md) (CTX) mục 9.6 “Ba phản hồi review DB và bài học thiết kế ngày 28/09” (phản hồi review DB của khách hàng: lưu riêng hiệu ứng theo cấu hình công khai, mục và phân loại thường/đơn vị; cùng mục có thể dùng ngoặc ở X và `*` phía trước ở Y); [đặc tả v2](../specification.vi.md) (R18) mục 10.1 “Phạm vi và tùy chọn”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Cấu hình công khai và ẩn điểm” (AC-G32) ("Cùng mục có thể lưu/mở lại/copy độc lập cấu hình X dùng ngoặc, Y dùng `*` trước, không trộn thường/đơn vị và không copy kết quả cá nhân. Lỗi lưu giữ cấu hình cũ"); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 5 “Hiệu ứng theo cấu hình công khai” (PROPOSED); Figma MW “chương 06 – công khai thành tích và màn học sinh” (58:5593) (lưu theo từng cấu hình công khai và từng mục, thường/đơn vị chọn riêng; X `(24)`, Y `*24`), “chương 06 – cách hiển thị đỏ riêng cho Thành tích（通常）và Thành tích theo đơn vị（単元別成績）” (58:6206) (khung Thành tích（通常）`*24` và Thành tích theo đơn vị（単元別成績）`(24)`; cột đơn vị chỉ hiện ở trường dùng chức năng bài kiểm tra đơn vị)
- Bằng chứng cần chụp: Ảnh X, Y, X' khi mở lại; ảnh màn học sinh theo từng cấu hình; phản hồi API/PDF nếu có; ảnh thông báo lỗi ở bước 6.
- Sau khi chạy: Xóa X' và khôi phục hiệu ứng của X, Y.
- Ghi chú: Yêu cầu hành vi đến từ phản hồi review của khách hàng (CONFIRMED); cách lưu `red_score_display_type` là PROPOSED (case “Lưu, đọc lại và sao chép hiệu ứng đỏ theo dòng mục của cấu hình công khai”). Bước 6 cần cách giả lập lỗi lưu; không có thì BLOCKED cho bước đó. Cách chọn cấu hình khi học sinh có nhiều lịch công khai theo hành vi hiện có.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="br"></a>

## 2. Business Rules (BR)

<a id="tc-rs-br-001"></a>

### TC-RS-BR-001 — Chọn quy tắc khớp đầu tiên theo ưu tiên, không lấy ngưỡng nghiêm hơn

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Chọn quy tắc khớp đầu tiên” (AC-G06)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-08 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có cặp quy tắc cùng áp dụng (dưới 20 và dưới 30) (ưu tiên 1: `<20`, ưu tiên 2: `<30`).
- Dữ liệu test: mục số nguyên (M=100); cặp quy tắc cùng áp dụng (dưới 20 và dưới 30); S02 được sửa thành 25

**操作（Thao tác）**

1. Đăng ký S02=25.
2. Đổi thứ tự (ưu tiên 1 là `<30`), bấm chạy lại (đăng ký lại điểm hoặc nút cam).
3. Xem kết quả sau mỗi lần xét.

**期待結果（Kết quả mong đợi）**

1. Lần 1: chọn quy tắc `<20` → Không đỏ.
2. Lần 2 (sau chạy lại): chọn quy tắc `<30` → Đỏ.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Một mục đánh giá có một hay nhiều thiết lập điểm đỏ?” (Q5), câu “Cơ chế công thức và ưu tiên nào đã có để tham chiếu?” (Q22); [đặc tả v2](../specification.vi.md) (R18) mục 4.3 “Chọn quy tắc” (ví dụ ngưỡng 20/30, `S=25`); Figma MW “màn danh sách thiết lập điểm đỏ” (58:10035) 「上から順に適用条件を確認し、最初に一致した設定を使用します。」 (kiểm điều kiện từ trên xuống, dùng thiết lập khớp đầu tiên); code hiện tại “AutoRating chọn thiết lập khớp đầu tiên theo `sort_no` trước khi tính” `AutoRating.php:960-1014`
- Bằng chứng cần chụp: Ảnh danh sách thứ tự; ảnh kết quả sau mỗi lần xét.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-002"></a>

### TC-RS-BR-002 — Không quy tắc nào khớp khi đủ dữ liệu → Không áp dụng

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Chọn quy tắc khớp đầu tiên” (AC-G06); tiêu chí nghiệm thu “Trạng thái sau lần chạy” (AC-G20)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-12, TD-STU-07 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) chỉ có quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao) (khối 1/2 và nhóm Nâng cao). S07 thuộc khối 2 nhưng không thuộc nhóm Nâng cao.
- Dữ liệu test: mục số nguyên (M=100); quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao), học sinh S07 (điểm 35, cờ Chưa dự thi（未受験）)

**操作（Thao tác）**

1. Đăng ký S07=20.
2. Xem kết quả ở ba đầu ra.

**期待結果（Kết quả mong đợi）**

S07 ở trạng thái Không áp dụng: không có dấu/lọc đỏ; không được coi là "đạt một ngưỡng".

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 4.3 “Chọn quy tắc” bước 5, mục 8.1 “Các trạng thái phải phân biệt”; [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Xét lại xong mà không còn thiết lập áp dụng thì làm gì?” (Q27)
- Bằng chứng cần chụp: Ảnh ba đầu ra; bằng chứng trạng thái lưu (khi có schema).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-003"></a>

### TC-RS-BR-003 — Ưu tiên 1 khớp nhưng thiếu dữ liệu → Chưa xét được, không chuyển xuống ưu tiên 2

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Chọn quy tắc khớp đầu tiên” (AC-G06)

<!-- Mã truy vết: TD-RULE-11, TD-SRC-08, TD-RULE-01, TD-SRC-03, TD-STU-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Hai cấu hình thử: (A) ưu tiên 1 = quy tắc công thức 100 ÷ trung bình (100 ÷ A, Toàn bộ) với nguồn nhóm có trung bình 0 (`A=0`); ưu tiên 2 = quy tắc “Cố định 30” (dưới 30). (B) ưu tiên 1 = quy tắc có điều kiện `A≥60` với nguồn nguồn chưa có kết quả tổng hợp (không có tổng hợp); ưu tiên 2 = quy tắc “Cố định 30” (dưới 30). (C) ưu tiên 1 = quy tắc có bộ lọc Môn（教科・科目）= Ngữ văn và điều kiện `A≥60` (nguồn nguồn chưa có kết quả tổng hợp); ưu tiên 2 = quy tắc “Cố định 30” (dưới 30); ô đang xét là Toán.
- Dữ liệu test: quy tắc công thức 100 ÷ trung bình, quy tắc “Cố định 30” (dưới 30), nhóm có trung bình 0, nguồn chưa có kết quả tổng hợp, học sinh S01 (điểm 29)

**操作（Thao tác）**

Với từng cấu hình (A), (B), (C): đăng ký S01=29, xem kết quả.

**期待結果（Kết quả mong đợi）**

(A) Quy tắc 1 được chọn, chia 0 → Chưa xét được; không dùng ưu tiên 2.

(B) Không xác định được điều kiện trung bình → Chưa xét được; không coi thiếu dữ liệu là "không khớp" để xuống ưu tiên 2.

(C) Bộ lọc môn đã đủ chứng minh quy tắc 1 không áp dụng → được bỏ qua mà không cần nguồn; ưu tiên 2 áp dụng → Đỏ.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Đã xét lại nhưng không tạo được ngưỡng hợp lệ thì dùng kết quả cũ không?” (Q26), câu “Cơ chế công thức và ưu tiên nào đã có để tham chiếu?” (Q22); [đặc tả v2](../specification.vi.md) (R18) mục 4.3 “Chọn quy tắc” bước 4 và đoạn cuối; Figma MW “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9460) 「計算不能でも下位へ移らない。」 (dù không tính được cũng không chuyển xuống thấp hơn)
- Bằng chứng cần chụp: Ảnh kết quả ba cấu hình; thông tin nguyên nhân chưa xét được (nếu có hiển thị/log).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-004"></a>

### TC-RS-BR-004 — Kết hợp bộ lọc: HOẶC trong cùng loại, VÀ giữa các loại

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-12 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) chỉ có quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao). Bốn học sinh: P1 khối 1 + Nâng cao; P2 khối 2 + Nâng cao; P3 khối 3 + Nâng cao; P4 khối 1, không Nâng cao. Mỗi người điểm 20.
- Dữ liệu test: mục số nguyên (M=100); quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao)

**操作（Thao tác）**

1. Đăng ký điểm 20 cho P1–P4.
2. Xem kết quả.

**期待結果（Kết quả mong đợi）**

P1, P2: Đỏ. P3, P4: Không áp dụng.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 5.1 “Đối tượng áp dụng” (ví dụ khối 1 hoặc 2 và nhóm nâng cao); Figma MW “chương 02 – điều kiện áp dụng và nguồn trung bình” (58:8729) 「同じ種類の複数選択はOR、種類間はAND。」 (cùng loại chọn nhiều là HOẶC, giữa các loại là VÀ), MW “màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình” (58:9156) 「※同じ種類の条件はいずれか1つ、種類が違う条件はすべて満たす生徒が対象となります。」 (cùng loại chỉ cần thỏa một điều kiện, khác loại phải thỏa tất cả; file cũ 4595:485 ghi "thỏa tất cả điều kiện lọc")
- Bằng chứng cần chụp: Ảnh kết quả bốn học sinh.
- Ghi chú: P1–P4 là học sinh bổ sung ngoài TD-STU; tạo trong trường test.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-041"></a>

### TC-RS-BR-041 — Điều kiện trung bình cùng nguồn kết hợp AND

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05)

<!-- Mã truy vết: TD-RULE-15, AC-G05 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Một rule có hai điều kiện trung bình cùng nguồn `A`: `A≥50` và `A<70`, cùng dấu/ngưỡng theo thiết kế; các học sinh có A lần lượt là 40, 50, 60 và 70. Các học sinh đều thỏa bộ lọc đối tượng khác của rule.
- Dữ liệu test: nguồn tổng hợp cùng phạm vi; P9 `A=40`, P10 `A=50`, P11 `A=60`, P12 `A=70`; cùng điểm đầu vào để khi rule khớp tạo cùng ngưỡng đỏ.

**操作（Thao tác）**

1. Lưu một rule chứa đồng thời `A≥50` và `A<70`.
2. Chạy xét cho P9–P12.
3. Mở lại rule và kiểm tra hai điều kiện vẫn thuộc cùng một rule/nguồn.

**期待結果（Kết quả mong đợi）**

1. P9 (`A=40`) và P12 (`A=70`) không thỏa điều kiện → Không áp dụng.
2. P10 (`A=50`) và P11 (`A=60`) thỏa cả hai điều kiện → được xét theo ngưỡng của rule.
3. Không diễn giải hai điều kiện cùng nguồn thành OR; không ghép hai rule riêng biệt bằng AND.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 5.1 và 5.2; [xác nhận thiết kế ngày 30/09](../../../sources/2026-09-30-design-review-confirmation.vi.md) (Q35: `A≥50` và `A<70` nghĩa là `50≤A<70`; 40/70 không thỏa, 50/60 thỏa).
- Bằng chứng cần chụp: Ảnh form mở lại; ảnh kết quả bốn học sinh; log hoặc SELECT kết quả nếu có schema.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-005"></a>

### TC-RS-BR-005 — Toàn bộ đối tượng（全員が対象） không vượt phạm vi mục, trường, năm

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-01, TD-ENV-02, TD-ITEM-02, TD-STU-09 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30) (Toàn bộ). Trường B (trường B (trường khác)) có học sinh điểm 10 ở mục tương tự. Mục mục số thập phân (M=100) (không có quy tắc) có S09=29.5.
- Dữ liệu test: mục số nguyên (M=100), mục số thập phân (M=100); quy tắc “Cố định 30” (dưới 30), trường B (trường khác), học sinh S09 (mục số thập phân 29.5)

**操作（Thao tác）**

1. Chạy xét hàng loạt cho trường A.
2. Xem kết quả S09 ở mục số thập phân (M=100) và dữ liệu trường B.

**期待結果（Kết quả mong đợi）**

Chỉ ô của mục số nguyên (M=100) trong trường A năm 2026 được xét. S09 ở mục số thập phân (M=100) và học sinh trường B không bị ảnh hưởng.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 5.1 “Đối tượng áp dụng”; Figma MW “chương 02 – điều kiện áp dụng và nguồn trung bình” (58:8728) 「全員は、この評価項目の対象者全員。全校指定や全員赤点の意味ではない。」 (toàn bộ = mọi đối tượng của mục này, không phải toàn trường hay mọi người đều đỏ)
- Bằng chứng cần chụp: Ảnh kết quả; SELECT kết quả theo trường/năm (khi có schema).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-006"></a>

### TC-RS-BR-006 — Nhóm tham chiếu tách khỏi đối tượng áp dụng và danh sách đang lọc ở đầu ra

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12)

<!-- Mã truy vết: TD-GRP-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Quy tắc chỉ áp dụng cho lớp G-A (bộ lọc lớp), công thức `A×0.5`, nguồn có nhóm tham chiếu là một nhóm tổng hợp chứa cả G-A và G-B, `A=50` (G-A riêng có trung bình 40). Đã xét: `T=25`.
- Dữ liệu test: Nguồn theo nhóm tổng hợp chứa G-A và G-B (không dùng nhóm theo khối vì G-A thuộc khối 1, G-B thuộc khối 2); các lớp học phần G-A, G-B, G-C

**操作（Thao tác）**

1. Xem kết quả của học sinh G-A điểm 24 (Đỏ) và 26 (Không đỏ).
2. Chạy trích xuất chỉ lọc lớp G-A.
3. Chạy lại xét.

**期待結果（Kết quả mong đợi）**

Kết quả vẫn dùng `T=25` (từ `A=50` của cả nhóm). Lọc lớp ở đầu ra hoặc đối tượng chỉ G-A không làm trung bình thành 40 (`T=20`).

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Lấy trung bình của nhóm nào và kết quả tổng hợp nào?” (Q9); [đặc tả v2](../specification.vi.md) (R18) mục 5.4 “Bộ thông tin nguồn”; Figma MW “chương 05 – trích xuất thành tích và kết quả Excel” (58:6233) 「抽出結果の絞り込みは平均の母集団を変更しません。」 (lọc kết quả trích xuất không đổi tập tham chiếu trung bình)
- Bằng chứng cần chụp: Ảnh cấu hình nguồn; ảnh kết quả trước/sau lọc.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-007"></a>

### TC-RS-BR-007 — Nguồn: bản đã chốt được ưu tiên hơn tổng hợp mới hơn

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn” (AC-G13); tiêu chí nghiệm thu “Phạm vi từng đợt” (AC-G40)

<!-- Mã truy vết: TD-SRC-01, TD-SRC-02, TD-ITEM-01, TD-RULE-07, TD-ENV-04, AC-G13, AC-G40 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Có bản tổng hợp đã chốt (trung bình 49.99) (chốt, `A=49.99`) và bản tổng hợp mới nhất chưa chốt (trung bình 62) (mới hơn, `A=62`) cùng phạm vi. mục số nguyên (M=100) có cặp quy tắc phân nhánh theo trung bình 60. Dummy data (dữ liệu giả cho bản tổng hợp đã chốt).
- Dữ liệu test: mục số nguyên (M=100); bản tổng hợp đã chốt (trung bình 49.99), bản tổng hợp mới nhất chưa chốt (trung bình 62), cặp quy tắc phân nhánh theo trung bình 60; học sinh điểm 24 và 26

**操作（Thao tác）**

1. Chạy nút cam.
2. Xem kết quả.

**期待結果（Kết quả mong đợi）**

Dùng `A=49.99` → nhánh ưu tiên 2 (`A<60`), `T=24.995` → điểm 24 Đỏ, điểm 26 Không đỏ. Không dùng `A=62` (sẽ vào nhánh `A≥60`, `T=30`, điểm 26 Đỏ).

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Lấy trung bình của nhóm nào và kết quả tổng hợp nào?” (Q9), câu “Quy trình vận hành khi có đánh giá tương đối là gì?” (Q12); [đặc tả v2](../specification.vi.md) (R18) mục 5.5 “Chọn bản nguồn” bước 1, mục 7.4 “Quy trình vận hành khi dùng trung bình/tỷ lệ nhóm” bước 4; Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:6946) 「確定平均を優先するため、常に直前の青ボタンの結果とは限らない。」 (vì ưu tiên trung bình đã chốt, không phải lúc nào cũng là kết quả nút xanh vừa bấm)
- Bằng chứng cần chụp: Ảnh/SELECT hai nguồn (ghi dummy data); ảnh kết quả.
- Ghi chú: Không có radio bỏ qua bản chốt. Thời điểm tích hợp nguồn thật chưa chốt (đặc tả v2 mục 13.1). PASS trên dummy data chưa đủ cho tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn”/tiêu chí nghiệm thu “Phạm vi từng đợt”: phải chạy lại case với bản chốt thật (sau PR thêm trạng thái xác nhận kết quả tổng hợp xếp hạng, còn mở) trước khi đánh dấu đạt hai tiêu chí này.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-008"></a>

### TC-RS-BR-008 — Nguồn: chưa có bản chốt → dùng tổng hợp hoàn tất mới nhất cùng phạm vi

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn” (AC-G13)

<!-- Mã truy vết: TD-SRC-02, TD-RULE-07, AC-G13 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Chỉ có bản tổng hợp mới nhất chưa chốt (trung bình 62) (`A=62`), không có bản chốt; có thêm một tổng hợp cũ hơn `A=55` và một tổng hợp khác kỳ mới hơn `A=40`.
- Dữ liệu test: bản tổng hợp mới nhất chưa chốt (trung bình 62), cặp quy tắc phân nhánh theo trung bình 60

**操作（Thao tác）**

1. Chạy nút cam.
2. Xem kết quả học sinh điểm 26 và 29.
3. Bắt đầu một lượt tổng hợp mới cùng phạm vi sau bản tổng hợp mới nhất chưa chốt (trung bình 62) nhưng chưa hoàn tất (đang chạy hoặc thất bại); chạy lại nút cam.

**期待結果（Kết quả mong đợi）**

1–2. Dùng `A=62` (mới nhất, cùng kỳ) → nhánh `A≥60`, `T=30` → 26 và 29 Đỏ. Không dùng bản cũ hơn hoặc bản khác kỳ.

3. Vẫn dùng `A=62` của bản hoàn tất mới nhất; không đọc lượt tổng hợp chưa hoàn tất.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Lấy trung bình của nhóm nào và kết quả tổng hợp nào?” (Q9); [đặc tả v2](../specification.vi.md) (R18) mục 5.5 “Chọn bản nguồn” bước 2 ("kết quả tổng hợp hoàn tất mới nhất"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn” (AC-G13)
- Bằng chứng cần chụp: Ảnh danh sách tổng hợp; ảnh kết quả.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-009"></a>

### TC-RS-BR-009 — Nguồn: bản đã chốt thiếu dữ liệu → Chưa xét được, không chuyển sang bản thường

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn” (AC-G13); tiêu chí nghiệm thu “Phạm vi từng đợt” (AC-G40)

<!-- Mã truy vết: TD-SRC-04, TD-SRC-02, TD-RULE-07, TD-ENV-04, AC-G13, AC-G40 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Có bản đã chốt thiếu dữ liệu của ô (chốt, thiếu dòng cho môn/mục) và bản tổng hợp mới nhất chưa chốt (trung bình 62) (thường, đầy đủ). cặp quy tắc phân nhánh theo trung bình 60. Ô trước đó Đỏ.
- Dữ liệu test: bản đã chốt thiếu dữ liệu của ô, bản tổng hợp mới nhất chưa chốt (trung bình 62), cặp quy tắc phân nhánh theo trung bình 60

**操作（Thao tác）**

1. Chạy nút cam.
2. Xem kết quả và ba đầu ra.

**期待結果（Kết quả mong đợi）**

Chưa xét được; ngừng dùng dấu/lọc đỏ cũ; điểm giữ nguyên. Không dùng bản tổng hợp mới nhất chưa chốt (trung bình 62) hay bản khác kỳ.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 5.5 “Chọn bản nguồn” bước 3, mục 8.3 “Không tạo được ngưỡng hợp lệ”; [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Lấy trung bình của nhóm nào và kết quả tổng hợp nào?” (Q9), câu “Đã xét lại nhưng không tạo được ngưỡng hợp lệ thì dùng kết quả cũ không?” (Q26)
- Bằng chứng cần chụp: Ảnh/SELECT nguồn; ảnh kết quả và thông báo nguyên nhân. SELECT `reason_code` (khi có schema; đề xuất `source_missing` — thiết kế DB v2 mục 4.3 “Trạng thái kết quả”, PROPOSED).
- Ghi chú: Dummy data (dữ liệu giả cho bản tổng hợp đã chốt). PASS trên dummy data chưa đủ cho tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn”/tiêu chí nghiệm thu “Phạm vi từng đợt”: phải chạy lại với bản chốt thật (sau PR thêm trạng thái xác nhận kết quả tổng hợp xếp hạng, còn mở).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-010"></a>

### TC-RS-BR-010 — Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn” (AC-G13)

<!-- Mã truy vết: TD-SRC-03 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Công thức `A×0.5` với nguồn nguồn chưa có kết quả tổng hợp (chưa tổng hợp). Ô trước đó Đỏ.
- Dữ liệu test: nguồn chưa có kết quả tổng hợp

**操作（Thao tác）**

1. Chạy nút cam.
2. Xem kết quả.

**期待結果（Kết quả mong đợi）**

Chưa xét được; `A` không bị coi là 0 (nếu coi 0 thì `T=0`, mọi điểm dương Không đỏ); không dùng nhóm khác; ngừng dấu đỏ cũ.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Thiếu dữ liệu xét có chặn công khai hoặc phát hành không?” (Q15), câu “Đã xét lại nhưng không tạo được ngưỡng hợp lệ thì dùng kết quả cũ không?” (Q26); [đặc tả v2](../specification.vi.md) (R18) mục 5.5 “Chọn bản nguồn” bước 4; Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:7053) 「参照する平均点がありません。」 (không có trung bình tham chiếu), (58:7058) 「前回の判定結果は使用しません。」 (không dùng kết quả xét lần trước)
- Bằng chứng cần chụp: Ảnh kết quả, thông báo. SELECT `reason_code` (khi có schema; đề xuất `source_missing` — thiết kế DB v2 mục 4.3 “Trạng thái kết quả”, PROPOSED).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-011"></a>

### TC-RS-BR-011 — Nguồn chỉ cần khi quy tắc đọc trung bình/tỷ lệ nhóm

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05)

<!-- Mã truy vết: TD-SRC-03, TD-RULE-01, TD-RULE-03, TD-STU-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Không có kết quả tổng hợp nào (nguồn chưa có kết quả tổng hợp).
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30), quy tắc tỷ lệ 30%, nguồn chưa có kết quả tổng hợp, học sinh S01 (điểm 29)

**操作（Thao tác）**

1. Chỉ có quy tắc “Cố định 30” (dưới 30) (Toàn bộ, không điều kiện trung bình): đăng ký S01=29.
2. Chỉ có quy tắc tỷ lệ 30%: đăng ký S01=29.
3. Chỉ có quy tắc "cố định 30 `<`, điều kiện `A≥60`": đăng ký S01=29.

**期待結果（Kết quả mong đợi）**

1. Đỏ (không cần nguồn).
2. Đỏ (`M=100`, `T=30`; không cần nguồn).
3. Chưa xét được; không bỏ điều kiện để áp 30 cho mọi học sinh.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Điều kiện nào không cần nguồn trung bình?” (Q10); [đặc tả v2](../specification.vi.md) (R18) mục 5.6 “Khi nào không cần nguồn?” (ví dụ cố định 30 khi `A≥60`); Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:6945) 「平均に依存しない設定は成績登録で判定。平均を使う適用条件があれば参照元が必要。」 (thiết lập không phụ thuộc trung bình xét khi đăng ký điểm; có điều kiện dùng trung bình thì cần nguồn)
- Bằng chứng cần chụp: Ảnh kết quả ba lần.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-012"></a>

### TC-RS-BR-012 — Điểm được xét là điểm cuối đã lưu (dự kiến, sửa tay, sau giới hạn miền điểm)

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Dùng điểm cuối cùng” (AC-G19)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-01, TD-ITEM-10, TD-STU-06, TD-STU-08 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30) và (cho biến thể c) mục số nguyên có thêm tính tự động có quy tắc tính tự động cho kết quả vượt 100.
- Dữ liệu test: mục số nguyên (M=100), mục số nguyên có thêm tính tự động; học sinh S06 (điểm dự kiến 24), học sinh S08 (sửa tay 28 thành 35), quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

(a) S06 = 24 là Điểm dự kiến（見込点）: đăng ký.

(b) S08: nhập 28, lưu; sửa tay thành 35, lưu.

(c) Tạo dữ liệu mà phép tính cho 120 nhưng điểm lưu hợp lệ là 100; áp quy tắc cố định 100 `<` và 100 `≤`.

**期待結果（Kết quả mong đợi）**

(a) Đỏ.

(b) Sau lần lưu thứ hai: xét 35 → Không đỏ.

(c) Xét `S=100`: `<100` Không đỏ; `≤100` Đỏ.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Dùng điểm nào để xét, và phân biệt điểm 0 với ô trống thế nào?” (Q3); [đặc tả v2](../specification.vi.md) (R18) mục 2.3 “Điểm được đưa vào xét” (ví dụ 28→35, 120→100)
- Bằng chứng cần chụp: Ảnh điểm đã lưu và kết quả mỗi biến thể.
- Ghi chú: (c) cần cách tạo dữ liệu giới hạn miền điểm — hỏi team dev khi chuẩn bị.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-013"></a>

### TC-RS-BR-013 — Cờ Chưa dự thi（未受験） không loại điểm số khỏi xét

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Dùng điểm cuối cùng” (AC-G19)

<!-- Mã truy vết: TD-RULE-01, TD-STU-07, TD-STU-09, TD-ITEM-02, AC-G19, TC-RS-CALC-026 -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc “Cố định 30” (dưới 30) (`<30`).
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30); học sinh S07 (điểm 35, cờ Chưa dự thi（未受験）) (35, cờ Chưa dự thi) và biến thể S07 = 25 cùng cờ; học sinh S09 (mục số thập phân 29.5) (mục số thập phân (M=100) = 29.5) được thiết lập loại khỏi xếp hạng; mục số thập phân (M=100) có quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

1. Đăng ký S07=35 kèm cờ Chưa dự thi（未受験）.
2. Sửa S07=25, giữ cờ.
3. Đăng ký điểm 29.5 cho S09 (học sinh bị loại khỏi xếp hạng); chạy nút xanh rồi nút cam.

**期待結果（Kết quả mong đợi）**

1. Được xét → Không đỏ.
2. Được xét → Đỏ.
3. S09 được xét → Đỏ (29.5 `<30`); việc bị loại khỏi xếp hạng không loại ô khỏi xét đỏ.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Dùng điểm nào để xét, và phân biệt điểm 0 với ô trống thế nào?” (Q3); [đặc tả v2](../specification.vi.md) (R18) mục 2.3 “Điểm được đưa vào xét”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Dùng điểm cuối cùng” (AC-G19) ("không phụ thuộc AutoRating hay đối tượng xếp hạng")
- Bằng chứng cần chụp: Ảnh kết quả ba lần; ảnh thiết lập loại khỏi xếp hạng của S09.
- Sau khi chạy: Gỡ thiết lập loại khỏi xếp hạng của S09.
- Ghi chú: Loại khỏi xếp hạng chỉ ảnh hưởng tổng hợp thứ hạng (mẫu số trung bình: case “Mẫu số trung bình khi có học sinh bị loại khỏi xếp hạng”), không ảnh hưởng việc xét ô.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-014"></a>

### TC-RS-BR-014 — Ô trống không bị coi là 0 (trạng thái Không có điểm)

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Dùng điểm cuối cùng” (AC-G19)

<!-- Mã truy vết: TD-RULE-01, TD-RULE-02, TD-STU-05, TD-STU-04 -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc “Cố định 30” (dưới 30) (`<30`) và quy tắc cố định 30 với Nhỏ hơn hoặc bằng（以下） biến thể cố định 0 `≤`.
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30), quy tắc cố định 30 với Nhỏ hơn hoặc bằng（以下）; học sinh S05 (ô trống) (trống), học sinh S04 (điểm 0) (0)

**操作（Thao tác）**

1. Với quy tắc “Cố định 30” (dưới 30): đăng ký S04=0, để S05 trống.
2. Đổi thành quy tắc cố định 0 `≤`, chạy lại.

**期待結果（Kết quả mong đợi）**

1. S04 Đỏ (0 hợp lệ là số); S05 Không có điểm, không dấu đỏ.
2. S04 Đỏ (`0≤0`); S05 vẫn Không có điểm (không thành Đỏ như thể là 0).

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Dùng điểm nào để xét, và phân biệt điểm 0 với ô trống thế nào?” (Q3); [đặc tả v2](../specification.vi.md) (R18) mục 2.3 “Điểm được đưa vào xét”, mục 8.1 “Các trạng thái phải phân biệt”
- Bằng chứng cần chụp: Ảnh kết quả; bằng chứng trạng thái lưu (khi có schema).
- Ghi chú: Cách lưu trạng thái Không có điểm (`judgment_status=4`, `reason_code=no_score`) theo thiết kế DB v2 là PROPOSED, chờ review (đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-015"></a>

### TC-RS-BR-015 — Lưu cấu hình không xét; kết quả trước giữ tới lần chạy lại

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại” (AC-G21)

<!-- Mã truy vết: TD-RULE-01, AC-G21 -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc “Cố định 30” (dưới 30); S03 sửa thành 32 và đã xét → Không đỏ.
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

1. Đổi ngưỡng thành 35 `<`, lưu.
2. Xem ba đầu ra.
3. Đổi thứ tự quy tắc/đổi nguồn (nếu có), lưu, xem lại.
4. Chỉ đổi dấu (`<35` → `≤35`), lưu, xem lại. Nếu công thức thuộc đợt phát hành: chỉ đổi công thức của một quy tắc công thức, lưu, xem lại.
5. Chạy lại (đăng ký lại điểm S03 hoặc nút cam), xem ba đầu ra.

**期待結果（Kết quả mong đợi）**

1. Sau lưu: không báo "đã cập nhật điểm đỏ học sinh"; có hướng dẫn chạy lại.

2–4. S03 vẫn Không đỏ theo kết quả trước; hiệu ứng hiển thị trước đó giữ nguyên.

5. Sau chạy lại thành công: S03 Đỏ.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Lưu điều kiện hoặc thay nguồn có cập nhật ngay kết quả không?” (Q13) (ví dụ 32, `<30`→`<35`); [đặc tả v2](../specification.vi.md) (R18) mục 4.4 “Lưu, đổi thứ tự và xóa”, mục 7.2 “Bảng sự kiện”, mục 8.2 “Bảng chuyển trạng thái” dòng 1–2; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại” (AC-G21) ("Chỉ đổi ngưỡng/dấu/công thức/ưu tiên/đối tượng/nguồn… thì vẫn giữ kết quả"); Figma MW “màn danh sách thiết lập điểm đỏ” (58:10158) 「設定を変更した場合は、成績登録または成績集計の自動算出を再実行してください。」 (đổi thiết lập thì chạy lại đăng ký điểm hoặc tính tự động), “chương 01 – lối vào, danh sách, xóa thiết lập” (58:10179)
- Bằng chứng cần chụp: Ảnh thông báo sau lưu; ảnh đầu ra trước/sau chạy lại.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-016"></a>

### TC-RS-BR-016 — Sửa điểm 29 → 40 được lưu và xét trong cùng lượt

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn” (AC-G26)

<!-- Mã truy vết: TD-RULE-01, TD-STU-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc “Cố định 30” (dưới 30); S01=29 Đỏ.
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29)

**操作（Thao tác）**

1. Sửa S01 thành 40, lưu thành công.
2. Xem ba đầu ra ngay sau đó.

**期待結果（Kết quả mong đợi）**

S01 Không đỏ; không cần bật một chế độ thủ công/tự động riêng.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Khi nào xét điểm đỏ và có cần chế độ thủ công/tự động riêng không?” (Q11) (ví dụ 29→40); [đặc tả v2](../specification.vi.md) (R18) mục 8.2 “Bảng chuyển trạng thái” dòng 3
- Bằng chứng cần chụp: Ảnh trước/sau.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-017"></a>

### TC-RS-BR-017 — Chạy lại không tạo được ngưỡng hợp lệ → Chưa xét được, ngừng kết quả cũ, giữ điểm

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Trạng thái sau lần chạy” (AC-G20)

<!-- Mã truy vết: TD-SRC-02, TD-ITEM-08, TD-RULE-11, TD-STU-01, TD-SRC-03 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Ô S01=29 Đỏ theo công thức `A×0.5` (nguồn bản tổng hợp mới nhất chưa chốt (trung bình 62)).
- Dữ liệu test: mục có M không hợp lệ, quy tắc công thức 100 ÷ trung bình, bản tổng hợp mới nhất chưa chốt (trung bình 62); học sinh S01 (điểm 29), nguồn chưa có kết quả tổng hợp

**操作（Thao tác）**

1. Biến thể (a): đổi nguồn sang nguồn chưa có kết quả tổng hợp (không có tổng hợp), lưu, chạy lại.
2. Biến thể (b): quy tắc tỷ lệ với M không hợp lệ (mục có M không hợp lệ), chạy lại.
3. Biến thể (c): quy tắc công thức 100 ÷ trung bình với `A=0`, chạy lại.
4. Sau mỗi biến thể: xem ba đầu ra và điểm S01.

**期待結果（Kết quả mong đợi）**

Mỗi biến thể: trạng thái Chưa xét được; dấu/lọc đỏ cũ ngừng ở cả ba đầu ra; điểm S01 vẫn 29; không đi xuống quy tắc thấp hơn; không bật lại ngưỡng cũ `red_score`.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Đã xét lại nhưng không tạo được ngưỡng hợp lệ thì dùng kết quả cũ không?” (Q26); [đặc tả v2](../specification.vi.md) (R18) mục 8.2 “Bảng chuyển trạng thái” dòng 4, mục 8.3 “Không tạo được ngưỡng hợp lệ”; Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:7047) 「処理が完了しました。判定できない項目は判定不能とし、旧結果を停止しました。」 (xử lý xong; mục không xét được chuyển thành Không xét được（判定不能） và ngừng kết quả cũ), (58:7066) (file cũ 4592:2537, 4592:2554 ghi 未判定 (chưa xét))
- Bằng chứng cần chụp: Ảnh đầu ra trước/sau; ảnh thông báo; ảnh điểm. SELECT `judgment_status`/`reason_code` (khi có schema; thiết kế DB v2 mục 4.3 “Trạng thái kết quả”, PROPOSED).
- Ghi chú: (b) phụ thuộc cách tạo M không hợp lệ.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-018"></a>

### TC-RS-BR-018 — Đổi phạm vi làm ô không còn quy tắc áp dụng: giữ khi chưa chạy; chạy lại → Không áp dụng

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại” (AC-G21)

<!-- Mã truy vết: TD-STU-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Quy tắc lọc lớp G-A; S01 (G-A) = 29 Đỏ.
- Dữ liệu test: học sinh S01 (điểm 29)

**操作（Thao tác）**

1. Đổi bộ lọc sang lớp G-B, lưu. Xem đầu ra.
2. Chạy lại. Xem đầu ra.

**期待結果（Kết quả mong đợi）**

1. S01 vẫn Đỏ (kết quả trước).
2. S01 Không áp dụng; ngừng dấu/lọc đỏ cũ; điểm giữ nguyên.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Xét lại xong mà không còn thiết lập áp dụng thì làm gì?” (Q27); [đặc tả v2](../specification.vi.md) (R18) mục 8.2 “Bảng chuyển trạng thái” dòng 5–6; Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:7067) 「再実行で適用条件なし：旧結果を停止し対象外。点数は残す。」 (chạy lại mà không có điều kiện áp dụng: ngừng kết quả cũ, ngoài đối tượng, giữ điểm)
- Bằng chứng cần chụp: Ảnh đầu ra hai lần.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-019"></a>

### TC-RS-BR-019 — Xóa quy tắc cuối: giữ kết quả tới lần chạy lại; chạy lại → Không áp dụng

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại” (AC-G21)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-01, TD-OUT-01, TD-OUT-04, TD-STU-01, TD-OUT-03, TC-RS-FUNC-021 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) chỉ có quy tắc “Cố định 30” (dưới 30); S01=29 Đỏ. Trích xuất cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, công khai `*` trước, phiếu cấu hình phiếu điểm: ký tự “※” phía trước đã cấu hình.
- Dữ liệu test: mục số nguyên (M=100), quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29), cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước

**操作（Thao tác）**

1. Xóa quy tắc “Cố định 30” (dưới 30) (quy tắc cuối).
2. Xem ba đầu ra.
3. Chạy lại bằng đăng ký điểm lớp G-A hoặc chạy hàng loạt.
4. Xem ba đầu ra và cấu hình trình bày đầu ra.

**期待結果（Kết quả mong đợi）**

1–2. Danh sách rỗng nhưng S01 vẫn hiện dấu đỏ/thỏa lọc ở ba đầu ra.

3–4. Lần chạy xét cả mục đã hết quy tắc: S01 Không áp dụng, ngừng dấu/lọc; điểm giữ nguyên. Cấu hình trình bày đỏ đã lưu ở đầu ra không bị xóa như tác dụng phụ.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Xóa thiết lập cuối cùng thì dấu đỏ mất ngay hay chờ chạy lại?” (Q28); [đặc tả v2](../specification.vi.md) (R18) mục 4.1 “Điểm vào và trạng thái trống”, mục 4.4 “Lưu, đổi thứ tự và xóa”, mục 8.2 “Bảng chuyển trạng thái” dòng 7–8, mục 10.1 “Phạm vi và tùy chọn”; Figma MW “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9618) 「削除後も再実行まで前回結果を使用します。」 (sau khi xóa vẫn dùng kết quả trước tới khi chạy lại), “chương 05 – trích xuất thành tích và kết quả Excel” (58:6248), “chương 06 – công khai thành tích và màn học sinh” (58:5598)
- Bằng chứng cần chụp: Ảnh/file ba đầu ra ở bước 2 và 4; ảnh cấu hình đầu ra sau bước 4.
- Ghi chú: Trường không có tính tự động: chạy lại bằng thao tác hàng loạt hiện có (case “Trường chỉ có quy tắc đỏ (không có tính tự động) vẫn có đường chạy hàng loạt”). Xóa chuyển `setting_status=2` trong cùng transaction; kết quả giữ đến lần xét tiếp theo (thiết kế DB v2 mục 4.1 và 4.4 — PROPOSED); có thể SELECT làm bằng chứng. Không dùng kiểm tra truthy/khác 0 để xác định rule có hiệu lực. Kiểm thêm (PROPOSED, khi có schema): sau bước 1, tạo một quy tắc mới → quy tắc mới có ID mới, không dùng lại ID đã xóa; kết quả cũ vẫn trỏ ID cũ.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-020"></a>

### TC-RS-BR-020 — Xóa điểm thành trống → Không có điểm, bỏ dấu đỏ cũ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Dùng điểm cuối cùng” (AC-G19)

<!-- Mã truy vết: TD-STU-01, TD-OUT-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: S01=29 Đỏ.
- Dữ liệu test: học sinh S01 (điểm 29), cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu

**操作（Thao tác）**

1. Xóa điểm S01 thành trống, lưu.
2. Xem ba đầu ra, chạy trích xuất có lọc đỏ.

**期待結果（Kết quả mong đợi）**

S01 Không có điểm; không còn dấu đỏ; không thỏa lọc đỏ nhờ ô này. Không cần chờ chạy lại.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 7.1 “Trình tự cho một ô” bước 2, mục 7.2 “Bảng sự kiện” (Xóa điểm số thành trống), mục 8.2 “Bảng chuyển trạng thái” dòng 9; [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Dùng điểm nào để xét, và phân biệt điểm 0 với ô trống thế nào?” (Q3)
- Bằng chứng cần chụp: Ảnh/file đầu ra.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-021"></a>

### TC-RS-BR-021 — Tổng hợp lại hoặc đổi nhóm tham chiếu không tự xét lại

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Thứ tự đánh giá tương đối” (AC-G25)

<!-- Mã truy vết: TD-SRC-02, TC-RS-BR-007 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Công thức `A×0.5`, `A=50` → `T=25`; học sinh điểm 24 Đỏ.
- Dữ liệu test: bản tổng hợp mới nhất chưa chốt (trung bình 62)

**操作（Thao tác）**

1. Sửa điểm nhóm để trung bình mới là 40, bấm Thực hiện tổng hợp（集計実行）.
2. Xem kết quả học sinh 24.
3. Bấm Thực hiện tính toán tự động（自動算出実行）, xem lại.

**期待結果（Kết quả mong đợi）**

1–2. Vẫn Đỏ theo kết quả trước (không tự xét lại).

3. `A=40` → `T=20` → 24 Không đỏ.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Lưu điều kiện hoặc thay nguồn có cập nhật ngay kết quả không?” (Q13); [đặc tả v2](../specification.vi.md) (R18) mục 7.2 “Bảng sự kiện” (Tổng hợp lại/cập nhật nhóm tham chiếu)
- Bằng chứng cần chụp: Ảnh kết quả sau mỗi bước.
- Ghi chú: Nếu có bản chốt cùng phạm vi, bước 3 vẫn dùng bản chốt (case “Nguồn: bản đã chốt được ưu tiên hơn tổng hợp mới hơn”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-022"></a>

### TC-RS-BR-022 — Đổi M ở Thiết lập điểm tối đa（満点設定） hoặc Giá trị tối đa（最大値） không tự xét lại

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị” (AC-G24)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-03 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có quy tắc tỷ lệ 30% (30%); S03 = 31, `M=100` → `T=30` → Không đỏ.
- Dữ liệu test: mục số nguyên (M=100); quy tắc tỷ lệ 30%

**操作（Thao tác）**

1. Sửa Giá trị tối đa（最大値） của mục số nguyên (M=100) ở Thiết lập ô nhập（入力欄設定） thành 200, lưu. Xem kết quả.
2. Lưu một định nghĩa lựa chọn ở Thiết lập điểm tối đa（満点設定） (`/admin/grade_report_setting/manage/detail/option/register/change_max_score`) (chưa gán cho lớp). Xem kết quả.
3. Đăng ký lại điểm S03. Xem kết quả.

**期待結果（Kết quả mong đợi）**

1–2. S03 vẫn Không đỏ (kết quả trước).

3. `M=200` → `T=60` → S03=31 Đỏ.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Thay điểm tối đa thì xử lý thế nào?” (Q14), câu “Những đường đổi điểm tối đa nào hiện chạy tính tự động?” (Q20); [đặc tả v2](../specification.vi.md) (R18) mục 7.3 “Thay đổi điểm tối đa”; Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:7069) 「定義としての満点設定保存と、授業の選択肢保存・成績登録は別の操作。」 (lưu định nghĩa điểm tối đa khác với lưu lựa chọn lớp/đăng ký điểm); CODE `itemStore`, `optionStore`
- Bằng chứng cần chụp: Ảnh kết quả sau mỗi bước.
- Sau khi chạy: Trả M về 100.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-023"></a>

### TC-RS-BR-023 — Nút xanh Thực hiện tổng hợp（集計実行） không xét điểm đỏ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Thứ tự đánh giá tương đối” (AC-G25)

<!-- Mã truy vết: TD-RULE-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc “Cố định 30” (dưới 30) vừa đổi từ 30 thành 35 và lưu; S03=32 Không đỏ (kết quả trước).
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

1. Bấm Thực hiện tổng hợp（集計実行）, chờ hoàn tất.
2. Xem kết quả S03.

**期待結果（Kết quả mong đợi）**

S03 vẫn Không đỏ.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Quy trình vận hành khi có đánh giá tương đối là gì?” (Q12) ("chạy nút xanh không tự chứng minh đã cập nhật kết quả đỏ"); CODE đường ghi điểm “Nút xanh 集計実行 (chạy tổng hợp – nút xanh dương)”
- Bằng chứng cần chụp: Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](01-test-strategy.vi.md#conventions) mục 9 “Quy ước thực thi chung”） dòng S03 sau khi tổng hợp xong; ảnh thời điểm chạy trên màn Tổng hợp thành tích（成績集計）.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-024"></a>

### TC-RS-BR-024 — Xem, xuất, công khai, in lại không kích hoạt xét

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Xem/xuất không tự xét” (AC-G28)

<!-- Mã truy vết: TC-RS-BR-015, TD-OUT-01, TD-OUT-03, TD-OUT-04, AC-G28 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Như case “Lưu cấu hình không xét; kết quả trước giữ tới lần chạy lại” bước 1 (đã lưu `<35`, chưa chạy lại; S03=32 Không đỏ).
- Dữ liệu test: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước

**操作（Thao tác）**

1. Chạy trích xuất, xuất Excel.
2. Mở màn công khai học sinh, tải PDF công khai.
3. Xuất PDF phiếu.

**期待結果（Kết quả mong đợi）**

S03 vẫn Không đỏ ở mọi đầu ra; không có lượt xét mới (thời điểm kết quả không đổi); không có lượt tổng hợp mới (lượt/thời điểm tổng hợp mới nhất không đổi).

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?” (Q16); [đặc tả v2](../specification.vi.md) (R18) mục 7.2 “Bảng sự kiện” (dòng cuối), mục 9.3 “Xuất file”, mục 10.3 “Quyền, thời điểm và đầu ra liên quan”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Xem/xuất không tự xét” (AC-G28) ("không xét lại hoặc tổng hợp lại"); Figma MW “chương 00 – hướng dẫn đọc và luồng tổng thể” (58:10202) 「閲覧・出力だけでは再判定しない。」 (chỉ xem/xuất thì không xét lại), “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:7060)
- Bằng chứng cần chụp: File/ảnh đầu ra; bằng chứng thời điểm cập nhật kết quả và lượt tổng hợp mới nhất không đổi trước/sau (khi có schema).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-025"></a>

### TC-RS-BR-025 — Đầu ra không bị chặn vì chưa có hoặc chưa xét được kết quả đỏ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Xem/xuất không tự xét” (AC-G28)

<!-- Mã truy vết: TD-OUT-01, TD-OUT-03, TD-OUT-04 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Một số ô Chưa từng xét, một số Chưa xét được.
- Dữ liệu test: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước

**操作（Thao tác）**

1. Chạy trích xuất và xuất Excel.
2. Công khai cho học sinh, xem màn học sinh.
3. Xuất PDF phiếu.

**期待結果（Kết quả mong đợi）**

Mọi thao tác hoàn tất bình thường; ô chưa có kết quả không có dấu đỏ và hiển thị theo thiết lập hiện hữu. Quyền, lịch công khai, điều kiện ẩn hiện có vẫn giữ.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Thiếu dữ liệu xét có chặn công khai hoặc phát hành không?” (Q15); [đặc tả v2](../specification.vi.md) (R18) mục 8.4 “Lỗi kỹ thuật và thông báo” (đoạn cuối); Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:7068) 「未判定だけを理由に公開・帳票発行を止めない。」 (không dừng công khai/phát hành phiếu chỉ vì chưa xét được)
- Bằng chứng cần chụp: Ảnh/file đầu ra.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-026"></a>

### TC-RS-BR-026 — Không chuyển đổi và không dùng ngưỡng đỏ cũ（`red_score`） làm fallback

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Bảo toàn điểm đỏ cũ” (AC-G38)

<!-- Mã truy vết: TD-ITEM-01, TD-SRC-03, TD-ENV-03, TD-STU-01, TC-RS-DATA-006 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có `red_score`=30 ở DB (nếu dữ liệu cho phép).
- Dữ liệu test: mục số nguyên (M=100), nguồn chưa có kết quả tổng hợp; quyền đọc DB local (chỉ SELECT/SHOW), học sinh S01 (điểm 29)

**操作（Thao tác）**

1. Không có quy tắc mới: đăng ký S01=29, xem đầu ra.
2. Có quy tắc không khớp S01 (lọc lớp G-B): chạy lại, xem.
3. Có quy tắc thiếu dữ liệu (nguồn chưa có kết quả tổng hợp): chạy lại, xem.

**期待結果（Kết quả mong đợi）**

Cả ba bước: S01 không có dấu đỏ từ `red_score`; trạng thái tương ứng lần lượt là không có quy tắc / Không áp dụng / Chưa xét được.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Có chuyển thiết lập điểm đỏ cũ sang chức năng mới không?” (Q17); [đặc tả v2](../specification.vi.md) (R18) mục 8.3 “Không tạo được ngưỡng hợp lệ”, mục 12.3 “Không chuyển đổi dữ liệu đỏ cũ”; code hiện tại “`red_score`, `changed_red_score`”
- Bằng chứng cần chụp: SELECT `red_score`; ảnh đầu ra ba bước.
- Sau khi chạy: `red_score` không đổi (case “Cột ngưỡng cũ không bị chuyển đổi hay xóa”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-027"></a>

### TC-RS-BR-027 — Chạy lại nhiều lần cho cùng kết quả, không nhân đôi dấu

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật” (AC-G22)

<!-- Mã truy vết: TD-RULE-01, TD-OUT-02, TD-STU-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc “Cố định 30” (dưới 30); S01=29 Đỏ; trích xuất cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) (`※`, `!`).
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29), cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau)

**操作（Thao tác）**

1. Chạy nút cam 3 lần liên tiếp (chờ mỗi lần hoàn tất).
2. Xem trích xuất; SELECT số kết quả hiện hành của ô S01 (khi có schema).

**期待結果（Kết quả mong đợi）**

Ô S01 hiện `※29!` (không `※※29!!`); chỉ một kết quả hiện hành cho ô.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 7.1 “Trình tự cho một ô” (đoạn cuối)
- Bằng chứng cần chụp: Ảnh trích xuất; ảnh SELECT.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-028"></a>

### TC-RS-BR-028 — Nhóm tham chiếu có lớp khác M không gây lỗi dừng xử lý

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kế thừa tỷ lệ nhóm” (AC-G15)

<!-- Mã truy vết: TD-SRC-06, TD-RULE-09, AC-G15, TC-RS-CALC-024 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Nguồn nhóm có M khác nhau (20/50 và 80/100) (20/50 và 80/100). quy tắc theo tỷ lệ điểm của nhóm từ 65% (cố định 70 `<`). Học sinh P1 thuộc đối tượng quy tắc có S = 60.
- Dữ liệu test: nhóm có M khác nhau (20/50 và 80/100), quy tắc theo tỷ lệ điểm của nhóm từ 65%; P1: S = 60

**操作（Thao tác）**

1. Lưu quy tắc theo tỷ lệ điểm của nhóm từ 65% với nguồn là nhóm trên.
2. Chạy nút xanh rồi nút cam cho phạm vi.
3. Xem màn kết quả xử lý và kết quả P1.

**期待結果（Kết quả mong đợi）**

1. Lưu được; không bị chặn vì nhóm có lớp khác M.

2–3. Xử lý hoàn tất, không lỗi dừng do khác M. `R=(20+80)/(50+100)×100≈66.7%` lấy từ kết quả tổng hợp hiện có → khớp `≥65%` → `T=70` → P1 Đỏ. Nếu tính trung bình tỷ lệ cá nhân (`(40%+80%)/2=60%` → Không áp dụng) là sai. Không có tùy chọn A/B.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Tỷ lệ nhóm có cần xử lý riêng khi các lớp khác điểm tối đa không?” (Q31); [đặc tả v2](../specification.vi.md) (R18) mục 5.3 “Tỷ lệ nhóm” (công thức `R` = tổng điểm ÷ tổng điểm tối đa của cùng tập; Phạm vi vận hành, đoạn cuối); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Kế thừa tỷ lệ nhóm” (AC-G15) ("không tính lại bằng trung bình tỷ lệ cá nhân"; "không bị chặn cấu hình hoặc làm dừng xử lý"); C-01
- Bằng chứng cần chụp: Ảnh lưu quy tắc; ảnh màn kết quả xử lý và giá trị tỷ lệ nhóm của nguồn; ảnh kết quả P1; log lỗi (nếu có).
- Ghi chú: nhóm có M khác nhau (20/50 và 80/100) phân biệt được hai cách tính (66.7% và 60%); case “Tỷ lệ nhóm R = 70% khớp điều kiện ≥ 65%” thì không vì cùng M.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-029"></a>

### TC-RS-BR-029 — Mục lựa chọn không được xét, nhưng bộ lọc theo lựa chọn vẫn dùng để chọn đối tượng

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kiểu điểm được hỗ trợ” (AC-G02)

<!-- Mã truy vết: TD-ITEM-04, TD-ITEM-01, TD-RULE-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục kiểu lựa chọn A/B/C (A/B/C) có giá trị cho S01 = B, S02 = A.
- Dữ liệu test: mục số nguyên (M=100); mục kiểu lựa chọn A/B/C, quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

1. Tạo quy tắc cho mục số nguyên (M=100) với bộ lọc theo lựa chọn（選択肢型） mục kiểu lựa chọn A/B/C = B, cố định 30 `<`.
2. Đăng ký S01=29, S02=29.

**期待結果（Kết quả mong đợi）**

S01 Đỏ (thuộc đối tượng); S02 Không áp dụng. Không có ô nào của mục kiểu lựa chọn A/B/C được xét đỏ.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Những loại điểm nào thuộc đối tượng?” (Q2); [đặc tả v2](../specification.vi.md) (R18) mục 1.2 “Phạm vi thiết kế” (đoạn cuối)
- Bằng chứng cần chụp: Ảnh cấu hình bộ lọc; ảnh kết quả.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-030"></a>

### TC-RS-BR-030 — Ô điểm đơn vị được xét riêng theo từng đơn vị

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kiểu điểm được hỗ trợ” (AC-G02); tiêu chí nghiệm thu “Nhận diện ô điểm” (AC-G03)

<!-- Mã truy vết: TD-ITEM-03, TD-RULE-01, TC-RS-CALC-011, TC-RS-CALC-027 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục điểm đơn vị (đơn vị U1 có M riêng 40) có quy tắc “Cố định 30” (dưới 30) (`<30`). S06 (G-B): U1 = 25, U2 = 35.
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30); mục điểm đơn vị (đơn vị U1 có M riêng 40)

**操作（Thao tác）**

1. Đăng ký điểm U1, U2 của S06.
2. Xem ba đầu ra ở phạm vi đơn vị.

**期待結果（Kết quả mong đợi）**

U1 Đỏ, U2 Không đỏ; dấu chỉ ở ô U1. Hai đơn vị không bị gộp thành một ô.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Những loại điểm nào thuộc đối tượng?” (Q2), câu “Lấy trung bình của nhóm nào và kết quả tổng hợp nào?” (Q9); [đặc tả v2](../specification.vi.md) (R18) mục 2.2 “Một ô điểm được nhận diện như thế nào?”; Figma MW “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9455) 「数値入力と単元別の点数が対象。」 (đối tượng là nhập số và điểm theo đơn vị), “chương 02 – điều kiện áp dụng và nguồn trung bình” (58:8855)
- Bằng chứng cần chụp: Ảnh/file đầu ra theo đơn vị.
- Ghi chú: M theo đơn vị: case “Phân giải M: mặc định → đơn vị → lựa chọn lớp”. Trung bình theo đơn vị: case “Trung bình riêng cho từng đơn vị” (nguồn trung bình theo đơn vị chưa tích hợp — đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-031"></a>

### TC-RS-BR-031 — Giáo viên có quyền sửa mục cấu hình được quy tắc đỏ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Quyền thao tác và phạm vi dữ liệu” (AC-G01)

<!-- Mã truy vết: TD-ROLE-01, TD-ITEM-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Đăng nhập tài khoản giáo viên có quyền sửa mục (giáo viên thường, không phải nhân viên nội bộ).
- Dữ liệu test: tài khoản giáo viên có quyền sửa mục, mục số nguyên (M=100)

**操作（Thao tác）**

Thêm, sửa điều kiện, sửa ngưỡng, đổi thứ tự, xóa một quy tắc của mục số nguyên (M=100).

**期待結果（Kết quả mong đợi）**

Mọi thao tác thành công.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Ai được thiết lập điều kiện điểm đỏ?” (Q1); [đặc tả v2](../specification.vi.md) (R18) mục 1.3 “Quyền sử dụng”
- Bằng chứng cần chụp: Ảnh danh sách sau mỗi thao tác.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-032"></a>

### TC-RS-BR-032 — Vào được màn nhưng không có quyền sửa mục → không sửa được quy tắc của mục đó

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Quyền thao tác và phạm vi dữ liệu” (AC-G01)

<!-- Mã truy vết: TD-ROLE-02, TD-ITEM-06, TC-RS-ERR-006 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Đăng nhập tài khoản giáo viên không có quyền sửa mục. mục chỉ dành nội bộ có một quy tắc.
- Dữ liệu test: tài khoản giáo viên không có quyền sửa mục, mục chỉ dành nội bộ

**操作（Thao tác）**

1. Mở Thiết lập ô nhập（入力欄設定）.
2. Thử mở và sửa quy tắc của mục chỉ dành nội bộ.

**期待結果（Kết quả mong đợi）**

Không có thao tác sửa/thêm/xóa cho mục chỉ dành nội bộ trên màn, hoặc lưu bị từ chối. Quy tắc không đổi.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Ai được thiết lập điều kiện điểm đỏ?” (Q1); [đặc tả v2](../specification.vi.md) (R18) mục 1.3 “Quyền sử dụng” ("có quyền vào màn hình không đồng nghĩa sửa mọi mục")
- Bằng chứng cần chụp: Ảnh màn; phản hồi khi lưu.
- Ghi chú: Kiểm request trực tiếp: case “Gửi request lưu quy tắc trực tiếp khi không có quyền sửa mục”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-033"></a>

### TC-RS-BR-033 — Quyền sửa mục không tự cấp quyền chạy hàng loạt

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Quyền thao tác và phạm vi dữ liệu” (AC-G01)

<!-- Mã truy vết: TD-ROLE-04, TC-RS-ERR-008 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Đăng nhập tài khoản sửa được mục nhưng không có quyền chạy hàng loạt.
- Dữ liệu test: tài khoản sửa được mục nhưng không có quyền chạy hàng loạt

**操作（Thao tác）**

1. Sửa một quy tắc (thành công).
2. Mở Tổng hợp thành tích（成績集計）, thử chạy tính toán hàng loạt.

**期待結果（Kết quả mong đợi）**

Không chạy được hàng loạt (thao tác không có hoặc bị từ chối theo quyền hiện hành).

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Ai được thiết lập điều kiện điểm đỏ?” (Q1); [đặc tả v2](../specification.vi.md) (R18) mục 1.3 “Quyền sử dụng” (Chạy tính toán hàng loạt); Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:6950) 「実行権限がない場合は、権限のある担当者へ再実行を依頼。」 (không có quyền chạy thì nhờ người có quyền chạy lại)
- Bằng chứng cần chụp: Ảnh màn Tổng hợp thành tích（成績集計）.
- Ghi chú: Request trực tiếp: case “Gọi trực tiếp request chạy tính toán hàng loạt khi không có quyền chạy”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-034"></a>

### TC-RS-BR-034 — Bật tự tổng hợp khi đăng ký: hệ thống không chặn; quy tắc độc lập với trung bình vẫn xét

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-01, TD-ITEM-02, TD-STU-01, TD-STU-09 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Tự tổng hợp khi đăng ký = Thực hiện（実行する）. mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30); mục số thập phân (M=100) có công thức `A×0.5`.
- Dữ liệu test: mục số nguyên (M=100), mục số thập phân (M=100); quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29), học sinh S09 (mục số thập phân 29.5)

**操作（Thao tác）**

1. Lưu quy tắc công thức (không bị chặn vì tự tổng hợp đang bật).
2. Đặt tự tổng hợp = Không thực hiện（実行しない）, đăng ký S01=29.

**期待結果（Kết quả mong đợi）**

1. Lưu được; không có ràng buộc hệ thống buộc tắt.
2. S01 vẫn được xét khi đăng ký → Đỏ.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Quy trình vận hành khi có đánh giá tương đối là gì?” (Q12) ("tắt tự tổng hợp không tắt bước xét khi đăng ký điểm"); [đặc tả v2](../specification.vi.md) (R18) mục 7.4 “Quy trình vận hành khi dùng trung bình/tỷ lệ nhóm” (đoạn sau các bước)
- Bằng chứng cần chụp: Ảnh cấu hình; ảnh kết quả.
- Sau khi chạy: Trả cấu hình về trạng thái ban đầu.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-035"></a>

### TC-RS-BR-035 — Bộ lọc nhóm tổng hợp khác loại phải kết hợp VÀ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05)

<!-- Mã truy vết: TD-RULE-14 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Hai loại nhóm tổng hợp: K1 = Nhóm thành tích（成績グループ） có mục Nâng cao; K2 = một loại nhóm tổng hợp khác có mục X. P5 chỉ thuộc Nâng cao; P6 chỉ thuộc X; P7 thuộc cả Nâng cao và X; P8 không thuộc cả hai. Cả bốn học khối 1.
- Dữ liệu test: quy tắc lọc theo nhóm tổng hợp thuộc hai loại nhóm; S = 20 cho P5–P8

**操作（Thao tác）**

1. Đăng ký điểm 20 cho P5–P8.
2. Xem kết quả.
3. Mở lại quy tắc.

**期待結果（Kết quả mong đợi）**

1–2. Chỉ P7 thỏa cả hai loại nhóm và được xét → Đỏ. P5, P6, P8: Không áp dụng.

3. Mỗi giá trị vẫn gắn đúng loại nhóm của nó.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 5.1 “Đối tượng áp dụng”; [xác nhận thiết kế ngày 30/09](../../../sources/2026-09-30-design-review-confirmation.vi.md) (Q35: bộ lọc thường OR cùng loại/AND khác loại; điều kiện trung bình/tỷ lệ nhóm AND với bộ lọc); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 3.2 “`apply_condition`”.
- Bằng chứng cần chụp: Ảnh kết quả bốn học sinh; ảnh form mở lại xác nhận mỗi giá trị vẫn gắn đúng loại nhóm.
- Ghi chú: P5–P8 là học sinh bổ sung ngoài TD-STU. Oracle AND là CONFIRMED; biểu diễn JSON/schema vẫn có thể là PROPOSED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-036"></a>

### TC-RS-BR-036 — Cùng lượt đăng ký: ô thiếu nguồn chưa xét được, ô ngưỡng cố định vẫn được xét

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-06, TD-SRC-03, TD-RULE-01, TD-ITEM-02, TD-GRP-01, TD-STU-01, AC-G23, TC-RS-BR-010 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Trên mục số nguyên (M=100): ưu tiên 1 = quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8) (dùng trung bình, nguồn nguồn chưa có kết quả tổng hợp), ưu tiên 2 = quy tắc “Cố định 30” (dưới 30). Trên mục số thập phân (M=100): chỉ quy tắc “Cố định 30” (dưới 30). Lớp G-A có S01.
- Dữ liệu test: mục số nguyên (M=100); mục số thập phân (M=100); quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8); quy tắc “Cố định 30” (dưới 30); nguồn chưa có kết quả tổng hợp; các lớp học phần G-A, G-B, G-C; học sinh S01 (điểm 29); S01 mục số thập phân (M=100) = 29.5

**操作（Thao tác）**

1. Trong cùng một lượt đăng ký điểm của lớp G-A, lưu S01: mục số nguyên (M=100) = 29, mục số thập phân (M=100) = 29.5.
2. Xem kết quả hai ô và thông báo.

**期待結果（Kết quả mong đợi）**

1. Lượt lưu không dừng hay báo lỗi chung vì ô mục số nguyên (M=100) thiếu nguồn.
2. Ô mục số nguyên (M=100): Chưa xét được; không dùng ưu tiên 2 (quy tắc “Cố định 30” (dưới 30)) thay thế, nên không Đỏ.
3. Ô mục số thập phân (M=100): Đỏ (29.5 `<30`).

**補足（Bổ sung）**

- Nguồn: [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23) (bảng điều kiện chạy, dòng "Cùng lượt có ô phụ thuộc nguồn và ô độc lập"); [đặc tả v2](../specification.vi.md) (R18) mục 4.3 “Chọn quy tắc”, mục 5.5 “Chọn bản nguồn” bước 4; [tài liệu chia công việc v2](../split-tasks.vi.md) (RSD-TASK) công việc “Cập nhật kết quả khi đăng ký và chạy hàng loạt” (Task 4) (Thay đổi nghiệp vụ)
- Bằng chứng cần chụp: Ảnh màn đăng ký sau khi lưu; ảnh kết quả hai ô; thông báo hiển thị. SELECT kết quả của hai ô (khi có schema).
- Ghi chú: Tiêu chí nghiệm thu tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại”. Ô thiếu nguồn đơn lẻ: case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-037"></a>

### TC-RS-BR-037 — Xóa hoặc thôi dùng điểm đơn vị thì ngừng kết quả đỏ cũ của ô đó

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị” (AC-G24)

<!-- Mã truy vết: TD-ITEM-03, TD-RULE-01, TC-RS-BR-030, TD-GRP-01, TD-STU-06, AC-G24 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục điểm đơn vị (đơn vị U1 có M riêng 40) có quy tắc “Cố định 30” (dưới 30). S06 (G-B): U1 = 25, U2 = 35 đã đăng ký; U1 đang Đỏ, U2 Không đỏ (như case “Ô điểm đơn vị được xét riêng theo từng đơn vị”).
- Dữ liệu test: mục điểm đơn vị (đơn vị U1 có M riêng 40); quy tắc “Cố định 30” (dưới 30); các lớp học phần G-A, G-B, G-C; học sinh S06 (điểm dự kiến 24)

**操作（Thao tác）**

1. Xác nhận U1 Đỏ ở ba đầu ra.
2. Biến thể (a): xóa điểm U1 của S06 thành trống rồi lưu.
3. Biến thể (b): thôi dùng đơn vị U1 cho lớp G-B theo thao tác hiện có (nếu màn hỗ trợ), rồi đăng ký lại hoặc chạy nút cam cho G-B.
4. Xem ba đầu ra và bộ lọc đỏ của trích xuất.

**期待結果（Kết quả mong đợi）**

1. Sau (a) hoặc (b), ô U1 của S06 không còn dấu đỏ ở ba đầu ra; bộ lọc đỏ không giữ S06 chỉ vì U1 cũ.
2. U2 giữ kết quả Không đỏ; không bị gộp hay xét lại sai.

**補足（Bổ sung）**

- Nguồn: [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị” (AC-G24) ("Xóa/không dùng điểm đơn vị phải ngừng kết quả cũ"); [đặc tả v2](../specification.vi.md) (R18) mục 7.3 “Thay đổi điểm tối đa” (dòng "Sửa maximum/việc sử dụng theo đơn vị"), mục 7.2 “Bảng sự kiện” (dòng "Xóa điểm số thành trống"), mục 2.2 “Một ô điểm được nhận diện như thế nào?”
- Bằng chứng cần chụp: Ảnh/file ba đầu ra trước và sau; ảnh thao tác xóa hoặc thôi dùng đơn vị.
- Sau khi chạy: Khôi phục điểm U1 và thiết lập đơn vị của G-B.
- Ghi chú: Tiêu chí nghiệm thu tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị”. Biến thể (b) BLOCKED cho tới khi xác minh màn và thao tác "thôi dùng đơn vị"; hỏi team dev.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-038"></a>

### TC-RS-BR-038 — Nhóm lớp học（授業）: dùng kết quả tổng hợp của đúng lớp chứa ô đang xét

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12)

<!-- Mã truy vết: TD-POP-02, TD-ITEM-01, TD-POP-06, AC-G12 -->

**前提条件（Điều kiện trước）**

- Điều kiện: thiết lập tổng hợp X đã bật thêm Lớp học（授業） (X đã bật lớp học và đã tổng hợp). S11 học cả G-A và G-D; trong X trung bình lớp G-A = 40, G-D = 70. Quy tắc trên mục số nguyên (M=100): Toàn bộ đối tượng, ngưỡng Công thức（計算式） `A×0.5`, `<`; nguồn công thức = X / Lớp học（授業）.
- Dữ liệu test: thiết lập tổng hợp X đã bật thêm Lớp học（授業）, học sinh S11 học hai lớp Toán I (G-A, G-D); mục số nguyên (M=100); S11 có điểm 25 ở cả G-A và G-D

**操作（Thao tác）**

1. Chạy nút cam cho G-A và G-D.
2. Xem kết quả hai ô của S11 trên trích xuất.

**期待結果（Kết quả mong đợi）**

- Ô ở G-A: `T=40×0.5=20` → 25 Không đỏ.
- Ô ở G-D: `T=70×0.5=35` → 25 Đỏ.
- Không ô nào dùng kết quả của lớp kia, của khối/lớp chủ nhiệm, hay trung bình chung của môn.

**補足（Bổ sung）**

- Nguồn: [context điểm đỏ](../../../CONTEXT.md) (CTX) mục 9.6 “Ba phản hồi review DB và bài học thiết kế ngày 28/09” (quyết định DB-R3 mục 2: bật thêm lớp học thì dùng kết quả của lớp liên quan); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12) (bảng quy tắc chọn/đọc nhóm: "không đọc kết quả lớp khác với ô đang xét"); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 3.1 “Bộ thông tin nguồn” ("Loại 5 phải khớp cả lớp, không chỉ môn" — PROPOSED), mục 3.4 “`judgment_context`” (`population_key` chứa ID lớp thực tế)
- Bằng chứng cần chụp: Ảnh kết quả tổng hợp X theo lớp; ảnh trích xuất hai ô; SELECT `judgment_context.sources` của hai ô nếu có schema.
- Ghi chú: Dữ liệu học sinh học hai lớp cùng môn: hỏi team dev khi chuẩn bị; không tạo được thì dùng hai học sinh khác lớp và ghi Notes. Phụ thuộc phạm vi đợt có công thức (phạm vi phát hành chưa chốt — đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-039"></a>

### TC-RS-BR-039 — Nhóm môn học（科目グループ）: dùng cấu hình riêng của môn hoặc default đã lưu; thiếu/sai thì Chưa xét được

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12); tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn” (AC-G13)

<!-- Mã truy vết: TD-POP-05, TD-ITEM-01, AC-G12 -->

**前提条件（Điều kiện trước）**

- Điều kiện: nhóm môn học “Nhóm môn Toán” có cấu hình riêng cho Toán I（数学Ⅰ） và default. Quy tắc trên mục số nguyên (M=100) dùng nguồn công thức = X / nhóm môn học “Nhóm môn Toán”, ngưỡng `A×0.5`, `<`.
- Dữ liệu test: nhóm môn học “Nhóm môn Toán”; mục số nguyên (M=100); S01 = 25

**操作（Thao tác）**

1. Chạy nút cam; xem S01 và nhóm được dùng.
2. Xóa cấu hình riêng của Toán I (để môn rơi về default); chạy lại; xem.
3. Làm default thiếu hoặc trỏ tới cấu hình không hợp lệ (biến thể (b) của nhóm môn học “Nhóm môn Toán”); chạy lại; xem trạng thái và thông báo.

**期待結果（Kết quả mong đợi）**

1. Dùng kết quả của nhóm theo cấu hình riêng của Toán I.
2. Dùng kết quả của nhóm theo default đã lưu.
3. S01 Chưa xét được; không thay bằng nhóm khác, bằng 0 hay bằng kết quả trước; thông báo/tiến độ tách phần chưa xét được.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Ba loại nhóm cấu hình có xuất hiện ngoài khối/HR/lớp học không?” (Q33); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12)/G13 (bảng quy tắc chọn/đọc nhóm: "Chọn nhóm môn học — dùng cấu hình riêng của môn hoặc default đã lưu. Không thay default thiếu/tham chiếu sai bằng nhóm khác hay 0"); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 3.1 “Bộ thông tin nguồn”, mục 3.4 “`judgment_context`” (PROPOSED)
- Bằng chứng cần chụp: Ảnh cấu hình nhóm môn ở mỗi bước; ảnh kết quả S01; SELECT `reason_code` và `judgment_context.sources` nếu có schema.
- Ghi chú: (PROPOSED) Bước 1–2: `sources[]` giữ `population_type=6` và ID nhóm môn đã chọn, thêm `resolved_population_type`/`resolved_population_ref_id`; bước 3: `reason_code` là `source_invalid` hoặc `membership_missing` theo thiết kế cuối. Dữ liệu nhóm tham chiếu: hỏi team dev khi chuẩn bị.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-040"></a>

### TC-RS-BR-040 — Loại nhóm được bật nhưng chưa có kết quả, hoặc tham chiếu đã lưu không còn hợp lệ → Chưa xét được, không tự đổi nhóm

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn” (AC-G13); tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại” (AC-G21)

<!-- Mã truy vết: TD-ITEM-01, TD-POP-02, TD-POP-03, TD-STU-01, AC-G13, AC-G21 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Quy tắc trên mục số nguyên (M=100) có điều kiện Trung bình `A≥50`, cố định 30 `<`; S01 = 29, đang Đỏ theo nguồn X / Lớp học（授業） đã tổng hợp.
- Dữ liệu test: thiết lập tổng hợp X đã bật thêm Lớp học（授業）, nhóm tổng hợp thứ hạng “Toán I khối 1+2”; mục số nguyên (M=100); học sinh S01 (điểm 29)

**操作（Thao tác）**

1. (a) Tạo quy tắc mới dùng nhóm tổng hợp nhóm tổng hợp thứ hạng “Toán I khối 1+2” nhưng X chưa chạy tổng hợp cho nhóm này; chạy nút cam; xem S01.
2. (b) Quy tắc đang dùng X / Lớp học: tắt công tắc Lớp học（授業） của trường/năm; mở danh sách quy tắc và xem S01 (chưa chạy).
3. Chạy nút cam; xem S01.
4. (c) Xóa nhóm nhóm tổng hợp thứ hạng “Toán I khối 1+2” đang được quy tắc khác tham chiếu; chạy nút cam; xem ô dùng quy tắc đó.

**期待結果（Kết quả mong đợi）**

1. S01 Chưa xét được (thiếu nguồn); lựa chọn nhóm tồn tại không có nghĩa đã có dữ liệu.
2. Chỉ đổi cấu hình: S01 vẫn giữ kết quả Đỏ trước (không bị xóa ngay).
3. S01 Chưa xét được; không tự chuyển sang khối/lớp chủ nhiệm hoặc nhóm khác, không dùng quy tắc ưu tiên thấp hơn, không dùng kết quả cũ làm hiện hành.
4. Ô chịu ảnh hưởng Chưa xét được; không âm thầm đổi loại/ID nhóm đã lưu.

**補足（Bổ sung）**

- Nguồn: [context điểm đỏ](../../../CONTEXT.md) (CTX) mục 9.6 “Ba phản hồi review DB và bài học thiết kế ngày 28/09” (quyết định DB-R3 mục 4: được bật để chọn không đồng nghĩa đã có dữ liệu hợp lệ); [đặc tả v2](../specification.vi.md) (R18) mục 5.4 “Bộ thông tin nguồn”, mục 5.5 “Chọn bản nguồn”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn” (AC-G13) ("Áp dụng cùng cách xử lý thiếu/không hợp lệ khi loại tổng hợp được bật nhưng chưa có kết quả, hoặc tham chiếu đã lưu trở nên không khả dụng trước lần xét lại"), tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại” (AC-G21); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 3.1 “Bộ thông tin nguồn” (PROPOSED: `source_missing`, `source_invalid`; thay đổi cấu hình đơn thuần không xóa kết quả trước)
- Bằng chứng cần chụp: Ảnh S01 sau mỗi bước; ảnh thông báo/tiến độ; SELECT `judgment_status`, `reason_code` nếu có schema.
- Sau khi chạy: Bật lại công tắc Lớp học, khôi phục nhóm tổng hợp thứ hạng “Toán I khối 1+2”.
- Ghi chú: (PROPOSED) Bước 1: `reason_code`=`source_missing`; bước 3–4: `source_invalid`. Nếu hệ thống chặn xóa nhóm đang được tham chiếu ở bước 4 thì ghi hành vi thực tế, không FAIL. Dữ liệu nhóm tham chiếu: hỏi team dev khi chuẩn bị.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="val"></a>

## 3. Validation (VAL)

<a id="tc-rs-val-001"></a>

### TC-RS-VAL-001 — Điểm cố định: biên −1 / 0 / 100 / 101 với M=100

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Điểm cố định” (AC-G08)

<!-- Mã truy vết: TD-ITEM-01, TC-RS-UI-017 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) (M=100 cho mọi đối tượng), Toàn bộ đối tượng.
- Dữ liệu test: mục số nguyên (M=100); N = −1, 0, 100, 101

**操作（Thao tác）**

Lần lượt nhập Điểm cố định（固定点数）= −1, 0, 100, 101 và bấm Cập nhật（更新する）.

**期待結果（Kết quả mong đợi）**

−1: không lưu được, có lỗi. 0: lưu được. 100: lưu được. 101: không lưu được, có lỗi vượt M. Khi lỗi, cấu hình đã lưu trước đó không đổi.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Điểm bằng ngưỡng có bị xét đỏ không?” (Q4); [đặc tả v2](../specification.vi.md) (R18) mục 6.2 “Ngưỡng cố định”; Figma MW “chương 03 – ngưỡng, công thức, trạng thái nhập” (58:7491); Figma MW (58:7979) 「基準点が対象の満点を超えています。対象の満点以下の値を入力してください。」 (điểm chuẩn vượt điểm tối đa của đối tượng; hãy nhập giá trị không vượt điểm tối đa), (58:8015) 「対象の満点（100点）以下の値を入力してください。」 (hãy nhập giá trị không vượt điểm tối đa của đối tượng (100))
- Bằng chứng cần chụp: Ảnh thông báo lỗi; ảnh danh sách sau mỗi lần.
- Ghi chú: Câu chữ theo Figma MW là PROPOSED, kiểm ở case “Thông báo lỗi vượt điểm tối đa và chia 0”; không FAIL case này chỉ vì câu chữ.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-002"></a>

### TC-RS-VAL-002 — Điểm cố định phải ≤ M của mọi đối tượng (M=20 và M=100)

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Điểm cố định” (AC-G08)

<!-- Mã truy vết: TD-ITEM-07, SI-02 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục có M khác nhau theo lớp (G-A M=20, G-B M=100) (G-A M=20, G-B M=100).
- Dữ liệu test: mục có M khác nhau theo lớp (G-A M=20, G-B M=100); N = 30, 20

**操作（Thao tác）**

1. Toàn bộ đối tượng, N=30, Lưu.
2. Toàn bộ đối tượng, N=20, Lưu.
3. Lọc chỉ lớp G-B, N=30, Lưu.

**期待結果（Kết quả mong đợi）**

1. Không lưu được (G-A M=20).
2. Lưu được.
3. Lưu được.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Điểm bằng ngưỡng có bị xét đỏ không?” (Q4) (N=30 với lớp M=20 và M=100); [đặc tả v2](../specification.vi.md) (R18) mục 6.2 “Ngưỡng cố định”; Figma MW “chương 03 – ngưỡng, công thức, trạng thái nhập” (58:7979) 「基準点が対象の満点を超えています。対象の満点以下の値を入力してください。」 (điểm chuẩn vượt điểm tối đa của đối tượng; hãy nhập giá trị không vượt điểm tối đa)
- Bằng chứng cần chụp: Ảnh lỗi và danh sách.
- Ghi chú: Cách phân giải M có chênh lệch trong code (khác biệt đặc tả–code về “Phân giải M”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-003"></a>

### TC-RS-VAL-003 — Mở rộng phạm vi sau khi lưu: kiểm lại ngưỡng cố định với M của đối tượng mới

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Điểm cố định” (AC-G08)

<!-- Mã truy vết: TD-ITEM-07 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục có M khác nhau theo lớp (G-A M=20, G-B M=100); quy tắc lọc chỉ G-B, cố định 30 đã lưu.
- Dữ liệu test: mục có M khác nhau theo lớp (G-A M=20, G-B M=100)

**操作（Thao tác）**

Sửa bộ lọc thành G-A hoặc G-B (giữ N=30), bấm Lưu.

**期待結果（Kết quả mong đợi）**

Không lưu được vì G-A có M=20; cấu hình cũ (chỉ G-B) giữ nguyên.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Điểm bằng ngưỡng có bị xét đỏ không?” (Q4) ("kiểm tra tại thời điểm lưu cho mọi đối tượng"); [đặc tả v2](../specification.vi.md) (R18) mục 6.2 “Ngưỡng cố định” ("Kiểm tra lại khi sửa đối tượng áp dụng làm phạm vi… rộng hơn")
- Bằng chứng cần chụp: Ảnh lỗi; ảnh cấu hình sau khi đóng.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-004"></a>

### TC-RS-VAL-004 — Ngưỡng cố định/tỷ lệ trống hoặc không phải số

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11)

<!-- Mã truy vết: TD-ITEM-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Màn cấu hình mục số nguyên (M=100).
- Dữ liệu test: mục số nguyên (M=100); Giá trị: trống, `abc`, `3O` (chữ O), `３０` (số toàn khổ)

**操作（Thao tác）**

Với loại Điểm cố định（固定点数） rồi Tỷ lệ điểm tối đa（得点率）: nhập từng giá trị, bấm Lưu.

**期待結果（Kết quả mong đợi）**

Trống, `abc`, `3O`: không lưu được, có lỗi. `３０`: xử lý theo quy ước nhập số hiện hành của BLEND (TBD — có thể chuẩn hóa thành 30 hoặc báo lỗi).

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.1 “Thành phần chung của màn ngưỡng”, mục 6.2 “Ngưỡng cố định” ("Để trống hoặc nhập không phải số thì không được lưu")
- Bằng chứng cần chụp: Ảnh thông báo lỗi cho từng giá trị (trống, `abc`, `3O`) ở cả hai loại; ảnh giá trị sau khi Lưu với `３０`.
- Ghi chú: Ký tự toàn khổ: chưa có nguồn quy định tự chuyển hay báo lỗi.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-005"></a>

### TC-RS-VAL-005 — Điểm cố định thập phân

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11)

<!-- Mã truy vết: TD-ITEM-02 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số thập phân (M=100) (thập phân).
- Dữ liệu test: mục số thập phân (M=100); N = 29.5, 29.55, 29.555, 29.5555

**操作（Thao tác）**

Nhập từng giá trị, Lưu, mở lại.

**期待結果（Kết quả mong đợi）**

Đề xuất (thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ”): 29.5, 29.55, 29.555 lưu và mở lại đúng; 29.5555 bị từ chối, không tự cắt/làm tròn. Tối thiểu (CONFIRMED, đặc tả v2 mục 6.8 “Yêu cầu độ chính xác”): không được âm thầm làm tròn/cắt giá trị mà không báo.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.1 “Thành phần chung của màn ngưỡng” ("Phạm vi chữ số thập phân của Điểm cố định: chưa chốt"); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 2.1 “`red_score_settings`”, mục 4.2 “Xử lý phần lẻ và miền lưu trữ” (`threshold_value` DECIMAL(9,3), tối đa 3 chữ số lẻ — PROPOSED)
- Bằng chứng cần chụp: Ảnh giá trị sau khi mở lại.
- Ghi chú: PROPOSED — giới hạn số chưa chốt (đặc tả v2 mục 13.1); ngoài phần tối thiểu, không phải must-pass.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-006"></a>

### TC-RS-VAL-006 — Tỷ lệ N: biên −1 / 0 / 100 / 101

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Tỷ lệ điểm tối đa” (AC-G10)

<!-- Mã truy vết: TD-ITEM-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100), loại Tỷ lệ điểm tối đa（得点率）.
- Dữ liệu test: mục số nguyên (M=100); N = −1, 0, 100, 101; biến thể thập phân 30.5, 30.5555

**操作（Thao tác）**

Nhập từng giá trị, Lưu.

**期待結果（Kết quả mong đợi）**

−1 và 101: không lưu được. 0 và 100: lưu được. 30.5 lưu được, 30.5555 bị từ chối (PROPOSED, thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ”).

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.2 “Ngưỡng cố định”, mục 6.8 “Yêu cầu độ chính xác” ("Tỷ lệ phần trăm: 0–100%"); [context điểm đỏ](../../../CONTEXT.md) (CTX) mục 5.1 “Giá trị xét và ngưỡng”; Figma MW “màn Ngưỡng – tỷ lệ điểm tối đa” (58:8194) 「0〜100」; [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 4.1 “Loại ngưỡng và tính hợp lệ” (`0≤N≤100`), mục 4.2 “Xử lý phần lẻ và miền lưu trữ” (tối đa 3 chữ số lẻ — PROPOSED)
- Bằng chứng cần chụp: Ảnh lỗi và danh sách.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-007"></a>

### TC-RS-VAL-007 — Xử lý phần lẻ: bắt buộc chọn cách làm tròn; p = 0 / 1 / 9 / 10; lần đầu p=1

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 6.5 “Xử lý phần lẻ”, mục 6.8 “Yêu cầu độ chính xác”

<!-- Mã truy vết: TD-ITEM-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100), Tỷ lệ 30%.
- Dữ liệu test: mục số nguyên (M=100); p = 0, 1, 9, 10; cách làm tròn: chưa chọn

**操作（Thao tác）**

1. Bật Xử lý phần lẻ（端数処理）: quan sát giá trị p mặc định.
2. Không chọn cách làm tròn, Lưu.
3. Chọn Làm tròn xuống（切り捨て） với p=0, 1, 9, 10; Lưu từng lần.

**期待結果（Kết quả mong đợi）**

1. p hiển thị 1.
2. Không lưu được.
3. p=1 và 9 lưu được; p=0 và 10 không lưu được.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.5 “Xử lý phần lẻ”, mục 6.8 “Yêu cầu độ chính xác” (đề xuất p=1–9); Figma MW “màn Ngưỡng – tỷ lệ điểm tối đa” (58:8194), “màn Ngưỡng – công thức” (58:8389) (ô 小数第［1］位 và danh sách cách làm tròn)
- Bằng chứng cần chụp: Ảnh từng bước.
- Ghi chú: PROPOSED — không phải must-pass.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-008"></a>

### TC-RS-VAL-008 — Công thức phải có ít nhất một dòng

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kiểm công thức khi lưu” (AC-G17)

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Loại Công thức tính（計算式）.
- Dữ liệu test: —

**操作（Thao tác）**

Xóa hết các dòng công thức (nếu UI cho phép), bấm Lưu.

**期待結果（Kết quả mong đợi）**

Không lưu được (hoặc UI không cho xóa dòng cuối).

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.4 “Công thức dùng trung bình” ("Công thức có ít nhất một dòng"); Figma MW “màn Ngưỡng – công thức” (58:8389)
- Bằng chứng cần chụp: Ảnh lỗi khi Lưu, hoặc ảnh cho thấy không xóa được dòng cuối.
- Ghi chú: Phạm vi phát hành của Công thức chưa chốt (đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-009"></a>

### TC-RS-VAL-009 — Chia cho số cố định 0 không lưu được

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kiểm công thức khi lưu” (AC-G17)

<!-- Mã truy vết: TC-RS-UI-017, TC-RS-CALC-021 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Loại Công thức tính（計算式）.
- Dữ liệu test: Dòng 1: Trung bình（平均点）÷ Số cố định（固定値）0; biến thể 0.0

**操作（Thao tác）**

Nhập công thức, Lưu.

**期待結果（Kết quả mong đợi）**

Không lưu được; lỗi chỉ rõ dòng/vế phải.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.4 “Công thức dùng trung bình”; [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Ngưỡng dùng trung bình có chỉ gồm hai công thức cố định không?” (Q6); Figma MW “chương 03 – ngưỡng, công thức, trạng thái nhập” (58:7507); Figma MW (58:7816) 「式1：0で割ることはできません。右辺の値を変更してください。」 (dòng 1: không thể chia cho 0; đổi giá trị vế phải), (58:7907) 「0で割ることはできません。右辺の値を変更してください。」 (thông báo tại dòng)
- Bằng chứng cần chụp: Ảnh lỗi chỉ rõ dòng/vế phải chia cho 0.
- Ghi chú: Câu chữ theo Figma MW là PROPOSED, kiểm ở case “Thông báo lỗi vượt điểm tối đa và chia 0”. Chia 0 khi chạy: case “Chia 0 phát sinh khi chạy → Chưa xét được”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-010"></a>

### TC-RS-VAL-010 — Toán hạng trống hoặc không phải số

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kiểm công thức khi lưu” (AC-G17)

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Loại Công thức tính（計算式）.
- Dữ liệu test: Vế phải Số cố định（固定値）: trống, `abc`; toán tử: chưa chọn

**操作（Thao tác）**

Nhập từng biến thể, Lưu.

**期待結果（Kết quả mong đợi）**

Không lưu được; lỗi chỉ ra dòng thiếu.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.4 “Công thức dùng trung bình” ("Mỗi dòng phải có đủ vế trái, toán tử và vế phải hợp lệ")
- Bằng chứng cần chụp: Ảnh lỗi cho từng biến thể, thấy dòng bị báo.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-011"></a>

### TC-RS-VAL-011 — Kết quả phép tính（式の結果） chỉ tham chiếu dòng phía trước

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kiểm công thức khi lưu” (AC-G17)

<!-- Mã truy vết: AC-G17 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Công thức 3 dòng.
- Dữ liệu test: (a) Dòng 1 dùng Kết quả phép tính; (b) dòng 2 tham chiếu chính dòng 2; (c) dòng 2 tham chiếu dòng 3; (d) dòng 3 tham chiếu dòng 1

**操作（Thao tác）**

Thử từng biến thể, bấm Lưu.

**期待結果（Kết quả mong đợi）**

(a), (b), (c): không chọn được hoặc không lưu được.

(d): lưu được.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.4 “Công thức dùng trung bình” (bảng toán hạng: "Kết quả một dòng phía trước… Dòng đầu không được chọn; không tham chiếu chính dòng, dòng phía sau hoặc dòng đã bị xóa"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Kiểm công thức khi lưu” (AC-G17) ("từ chối… tham chiếu chính dòng/dòng sau/dòng đã xóa")
- Bằng chứng cần chụp: Ảnh từng biến thể.
- Ghi chú: Quy tắc tham chiếu dòng là tiêu chí nghiệm thu “Kiểm công thức khi lưu”. Chỉ chạy khi công thức nhiều dòng thuộc đợt phát hành (phạm vi phát hành chưa chốt — đặc tả v2 mục 13.1); ngoài đợt thì SKIPPED. Cách chọn toán hạng trên UI theo tập toán hạng đề xuất (đề xuất thiết kế chờ review — đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-012"></a>

### TC-RS-VAL-012 — Xóa/đổi thứ tự dòng không tự nối lại tham chiếu

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kiểm công thức khi lưu” (AC-G17)

<!-- Mã truy vết: AC-G17 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Công thức 3 dòng: dòng 2 dùng kết quả dòng 1, dòng 3 dùng kết quả dòng 2.
- Dữ liệu test: —

**操作（Thao tác）**

1. Xóa dòng 2, bấm Lưu.
2. Tạo lại công thức 3 dòng như điều kiện đầu; đổi thứ tự để dòng 3 lên vị trí 2, bấm Lưu.

**期待結果（Kết quả mong đợi）**

1. Dòng 3 báo tham chiếu không hợp lệ hoặc buộc chọn lại; không âm thầm trỏ sang dòng 1.
2. Dòng vừa chuyển lên (đang tham chiếu dòng mới nằm phía sau nó) bị báo tham chiếu không hợp lệ hoặc buộc chọn lại; không tự đổi sang dòng khác chỉ vì cùng số thứ tự.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.4 “Công thức dùng trung bình” ("Khi xóa hoặc đổi thứ tự dòng, không tự nối lại tham chiếu sai"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Kiểm công thức khi lưu” (AC-G17) ("Xóa hoặc đổi thứ tự dòng không được âm thầm trỏ sang công thức khác chỉ vì nó mang cùng số thứ tự")
- Bằng chứng cần chụp: Ảnh dòng liên quan sau mỗi lần Lưu (thông báo lỗi hoặc ô chọn dòng buộc chọn lại).
- Ghi chú: Tiêu chí tiêu chí nghiệm thu “Kiểm công thức khi lưu”; cơ chế UI (báo lỗi hay buộc chọn lại) theo thiết kế. Chỉ chạy khi công thức nhiều dòng thuộc đợt phát hành (phạm vi phát hành chưa chốt — đặc tả v2 mục 13.1); ngoài đợt thì SKIPPED. Bước 2 cần UI có thao tác đổi thứ tự dòng; nếu không có thì ghi N/A cho bước này.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-013"></a>

### TC-RS-VAL-013 — Số cố định trong công thức không bị giới hạn 0–100

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 6.4 “Công thức dùng trung bình”, mục 6.8 “Yêu cầu độ chính xác”

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Loại Công thức tính（計算式）.
- Dữ liệu test: `A × 150`, `A × 0.5`, `A − 150`

**操作（Thao tác）**

Nhập từng công thức, Lưu.

**期待結果（Kết quả mong đợi）**

Lưu được (không áp giới hạn 0–100 hay 0–M cho toán hạng).

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.4 “Công thức dùng trung bình”, mục 6.8 “Yêu cầu độ chính xác” (giới hạn độ dài số: chưa chốt)
- Bằng chứng cần chụp: Ảnh danh sách quy tắc sau khi Lưu từng công thức (thấy công thức đã lưu).
- Ghi chú: PROPOSED; giới hạn số chữ số chưa chốt (đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-014"></a>

### TC-RS-VAL-014 — Tên thiết lập: bắt buộc, độ dài, trùng tên

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 4.2 “Nội dung một dòng”, mục 5.1 “Đối tượng áp dụng”

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Màn thêm quy tắc.
- Dữ liệu test: Tên trống; tên chỉ khoảng trắng; 255 ký tự; 256 ký tự; 255 ký tự có thêm khoảng trắng ở đầu và cuối; hai quy tắc cùng tên

**操作（Thao tác）**

1. Nhập từng giá trị, Lưu, mở lại.
2. Tạo quy tắc thứ hai trùng tên quy tắc thứ nhất, Lưu.

**期待結果（Kết quả mong đợi）**

1. Trống/chỉ khoảng trắng: không lưu được. 255 ký tự: lưu được, mở lại đủ. 256 ký tự: bị từ chối, không tự cắt. 255 ký tự kèm khoảng trắng đầu/cuối: lưu được, tên lưu đã bỏ khoảng trắng đầu/cuối (đủ 255 ký tự).
2. Lưu được; hai dòng riêng theo ưu tiên.

**補足（Bổ sung）**

- Nguồn: Figma MW “chương 02 – điều kiện áp dụng và nguồn trung bình” (58:8925) 「設計案：名称は必須。」 (đề xuất thiết kế: tên là bắt buộc); CODE AutoRating `registCondition` 「設定名称を入力してください」 (hãy nhập tên thiết lập); [đặc tả v2](../specification.vi.md) (R18) không nêu; [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 2.1 “`red_score_settings`”, mục 4.1 “Loại ngưỡng và tính hợp lệ”–mục 4.2 “Xử lý phần lẻ và miền lưu trữ” (`setting_name` bắt buộc, 1–255 ký tự sau khi bỏ khoảng trắng đầu/cuối, không cần duy nhất — PROPOSED); [đặc tả v2](../specification.vi.md) (R18) mục 4.2 “Nội dung một dòng”, mục 5.1 “Đối tượng áp dụng”
- Bằng chứng cần chụp: Ảnh lỗi với tên trống và tên 256 ký tự; ảnh form mở lại với tên 255 ký tự; ảnh danh sách có hai quy tắc trùng tên.
- Ghi chú: PROPOSED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-015"></a>

### TC-RS-VAL-015 — Chọn giới hạn bằng bộ lọc nhưng không có bộ lọc nào

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05)

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Màn thêm quy tắc.
- Dữ liệu test: Giới hạn bằng bộ lọc（特定条件で絞り込む）, không chọn giá trị

**操作（Thao tác）**

Chọn giới hạn bằng bộ lọc, không chọn điều kiện, Lưu.

**期待結果（Kết quả mong đợi）**

Không lưu được; có thông báo lỗi. Câu chữ thông báo không phải must-pass (Figma chưa có).

**補足（Bổ sung）**

- Nguồn: CODE AutoRating `registCondition` 「絞り込み条件を１つ以上設定してください」 (hãy đặt ít nhất một điều kiện lọc); Figma MW “màn Điều kiện áp dụng – điều kiện tỷ lệ điểm của nhóm” (58:9164) không có thông báo này
- Bằng chứng cần chụp: Ảnh thông báo lỗi khi Lưu.
- Ghi chú: PROPOSED: đặc tả v2 mục 5.1 “Đối tượng áp dụng” ghi đây là đề xuất thiết kế ("chọn giới hạn nhưng không có bộ lọc thì báo lỗi"), khớp mẫu AutoRating; tiêu chí nghiệm thu v2 chỉ nêu ở phần Chi tiết thiết kế.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-016"></a>

### TC-RS-VAL-016 — Lỗi khi lưu không làm mất cấu hình/kết quả đã lưu

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04)

<!-- Mã truy vết: TD-RULE-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc “Cố định 30” (dưới 30) đã lưu; S01 Đỏ.
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30); N = 101

**操作（Thao tác）**

1. Mở quy tắc “Cố định 30” (dưới 30), đổi N=101, Lưu (lỗi).
2. Quay lại danh sách, xem ba đầu ra.

**期待結果（Kết quả mong đợi）**

Cấu hình vẫn 30; S01 vẫn Đỏ. Giá trị vừa nhập có được giữ trên form hay không: PROPOSED (không must-pass).

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 4.4 “Lưu, đổi thứ tự và xóa”, mục 8.4 “Lỗi kỹ thuật và thông báo”; [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Lưu điều kiện hoặc thay nguồn có cập nhật ngay kết quả không?” (Q13)
- Bằng chứng cần chụp: Ảnh danh sách, đầu ra.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-017"></a>

### TC-RS-VAL-017 — Trích xuất: bật ký hiệu thì bắt buộc nhập ký hiệu

Priority: TBD ｜ Status: IMPLEMENTED ｜ Requirement ID: tiêu chí nghiệm thu “Hiển thị ô trích xuất” (AC-G30)

<!-- Mã truy vết: TD-ROLE-07, CF-03 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mở Trích xuất thành tích（成績抽出）, tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm).
- Dữ liệu test: Ký hiệu đầu BẬT, ô trống; ký hiệu cuối BẬT, ô trống

**操作（Thao tác）**

Chạy trích xuất với từng biến thể.

**期待結果（Kết quả mong đợi）**

Có lỗi yêu cầu nhập ký hiệu; không chạy trích xuất.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 9.1 “Thiết lập”; Figma MW “chương 05, khung A – thiết lập cách hiển thị/trích xuất” (58:6319) 「前に付ける記号を入力してください。」 (hãy nhập ký hiệu gắn phía trước); Figma MW “chương 05 – trạng thái lỗi: bật ký hiệu nhưng chưa nhập” (58:6820) (trạng thái lỗi bật ký hiệu phía trước nhưng chưa nhập, cùng câu (58:6891)); CODE `AdminNBGradeExtractionSettingController::validateDisplayPattern` :1957 (bật ký hiệu mà ô trống → lỗi)
- Bằng chứng cần chụp: Ảnh lỗi cho từng biến thể; ảnh cho thấy trích xuất không chạy.
- Ghi chú: Nhãn/vị trí khác nhau giữa các frame Figma (xung đột giữa các frame Figma về “Nhãn và vị trí tùy chọn đỏ ở Trích xuất thành tích（成績抽出）”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-018"></a>

### TC-RS-VAL-018 — Phiếu điểm: chỉ bắt buộc ký tự khi chọn phía trước/phía sau

Priority: TBD ｜ Status: IMPLEMENTED ｜ Requirement ID: tiêu chí nghiệm thu “Tùy chọn trên phiếu” (AC-G35)

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Công cụ phiếu điểm（通知表ツール）, dòng Thiết lập điểm đỏ（赤点設定）.
- Dữ liệu test: Nguyên trạng（そのまま表示）, Kèm ngoặc（カッコ付き）, Ký tự phía trước（前に任意の文字） để trống, Ký tự phía sau（後ろに任意の文字） để trống

**操作（Thao tác）**

Chọn từng lựa chọn ở dòng Thiết lập điểm đỏ（赤点設定）, bấm Cập nhật（更新する）.

**期待結果（Kết quả mong đợi）**

Nguyên trạng, Kèm ngoặc: không hiện ô ký tự, lưu được. Phía trước/sau để trống: không lưu được.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 11.1 “Tùy chọn hiển thị đỏ”; Figma MW “tùy chọn đỏ ở Công cụ phiếu điểm (đặc tả v2: 07-A)” (58:5176) (modal lựa chọn); CODE `ReportCardWidgetController::grades_normal` validate :1981–2066 (kiểm `prepend_string` / `append_string` khi chọn phía trước/phía sau)
- Bằng chứng cần chụp: Ảnh dòng Thiết lập điểm đỏ（赤点設定） sau Cập nhật với từng lựa chọn; ảnh lỗi khi để trống ký tự.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-019"></a>

### TC-RS-VAL-019 — Cảnh báo ngưỡng biên không chặn lưu

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Biên so sánh và cảnh báo” (AC-G07)

<!-- Mã truy vết: TD-ITEM-01, AC-G07 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100).
- Dữ liệu test: mục số nguyên (M=100); Cố định N=0 và N=100, mỗi giá trị với `<` và `≤`; Tỷ lệ N=0, N=100; Tỷ lệ N=0.4 với Làm tròn（四捨五入） (ra `T=0`)

**操作（Thao tác）**

Nhập từng giá trị, Lưu, mở lại.

**期待結果（Kết quả mong đợi）**

1. Cảnh báo theo `T` cuối và dấu: `<0` (không ai đỏ) và `≤100` (mọi điểm hợp lệ đỏ) phải có cảnh báo; các tổ hợp biên khác theo thiết kế.
2. Tỷ lệ 0.4 làm tròn ra `T=0`: cảnh báo xét theo `T=0`, không theo giá trị nhập 0.4.
3. Cảnh báo không chặn lưu; mở lại, giá trị đã lưu giữ nguyên (không tự đổi thành giá trị khác).

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Điểm bằng ngưỡng có bị xét đỏ không?” (Q4) (cảnh báo không chặn); [đặc tả v2](../specification.vi.md) (R18) mục 6.6 “Ngưỡng âm và cảnh báo biên”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Biên so sánh và cảnh báo” (AC-G07) ("cảnh báo ngưỡng 0/điểm tối đa cũng theo `T` cuối và dấu so sánh, không đổi giá trị"); Figma MW “chương 03 – ngưỡng, công thức, trạng thái nhập” (58:8018), (58:8019)
- Bằng chứng cần chụp: Ảnh cảnh báo từng tổ hợp; ảnh form mở lại.
- Ghi chú: Nguyên tắc cảnh báo theo `T` cuối và dấu là tiêu chí nghiệm thu “Biên so sánh và cảnh báo”; câu chữ cảnh báo và cảnh báo cho các tổ hợp khác (`≤0`, `<100`) TBD. Tỷ lệ thập phân chỉ chạy nếu ô tỷ lệ nhận thập phân.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-020"></a>

### TC-RS-VAL-020 — Kết quả công thức âm hoặc vượt M không phải lỗi lưu

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Ngưỡng âm” (AC-G18)

<!-- Mã truy vết: TD-RULE-10, TC-RS-CALC-017, TC-RS-CALC-018 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Loại Công thức tính（計算式）.
- Dữ liệu test: quy tắc công thức trung bình − 20 (`A−20`); công thức `A × 3`

**操作（Thao tác）**

Lưu từng công thức.

**期待結果（Kết quả mong đợi）**

Lưu được; không kiểm `0≤T≤M` tại lúc lưu cho công thức.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Công thức cho ngưỡng âm thì xử lý thế nào?” (Q25); [đặc tả v2](../specification.vi.md) (R18) mục 6.4 “Công thức dùng trung bình”, mục 6.7 “Đổi loại ngưỡng và đổi toán hạng”
- Bằng chứng cần chụp: Ảnh danh sách quy tắc sau khi Lưu từng công thức (thấy công thức đã lưu, không có lỗi).
- Ghi chú: Kết quả xét: case “Ngưỡng công thức vượt M vẫn hợp lệ”, case “Công thức A−0 cho ngưỡng bằng A”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-021"></a>

### TC-RS-VAL-021 — Đổi loại ngưỡng trong cùng phiên sửa

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 6.7 “Đổi loại ngưỡng và đổi toán hạng”

<!-- Mã truy vết: TD-RULE-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc “Cố định 30” (dưới 30) (cố định 30) đã lưu.
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

1. Đổi sang Tỷ lệ, nhập 40, đổi lại Cố định; xem ô Cố định; đổi sang Tỷ lệ lần nữa, xem ô Tỷ lệ.
2. Đổi lại Cố định, Lưu.
3. Mở lại quy tắc.
4. Đổi sang Tỷ lệ, nhập 50, bấm Hủy; mở lại.
5. (Khi có schema) Lưu quy tắc Tỷ lệ 40 có bật xử lý phần lẻ; đổi sang Cố định 30, Lưu, SELECT; đổi sang Công thức `A×0.5`, Lưu, SELECT.

**期待結果（Kết quả mong đợi）**

1. (PROPOSED) Trong phiên: ô Cố định vẫn 30; quay lại Tỷ lệ vẫn thấy 40.
2. Chỉ giá trị loại cuối cùng (Cố định 30) được kiểm và lưu; không lưu lẫn dữ liệu của loại khác.
3. Mở lại: Cố định 30; không bắt buộc còn giá trị Tỷ lệ 40.
4. Vẫn Cố định 30 (cấu hình đã lưu gần nhất).
5. (PROPOSED theo thiết kế DB v2) Sau mỗi lần lưu, các cột không dùng cho loại hiện tại (`round_*`, `threshold_value`, cột công thức/nguồn) là SQL NULL.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.7 “Đổi loại ngưỡng và đổi toán hạng” (đề xuất thiết kế: trong phiên chỉ ẩn/hiện vùng, có thể quay lại phần vừa nhập; sau lưu và mở lại chỉ khôi phục loại đã lưu; hủy quay về cấu hình đã lưu)
- Bằng chứng cần chụp: Ảnh form ở từng bước; SELECT cấu hình (khi có schema).
- Ghi chú: PROPOSED theo đề xuất thiết kế đặc tả v2 mục 6.7 “Đổi loại ngưỡng và đổi toán hạng”, tài liệu chia công việc v2 công việc “Thiết lập và lưu nhiều quy tắc” ("Đổi loại trong phiên sửa giữ tạm input; mở lại phục hồi loại đã lưu") và thiết kế DB v2 mục 4.1 “Loại ngưỡng và tính hợp lệ” (cột không dùng lưu SQL NULL); phần "chỉ loại đang chọn có hiệu lực" (bước 2) và "hủy quay về cấu hình đã lưu" (bước 4) là tiêu chí chắc hơn. Không phải must-pass cho tới khi đề xuất được review (đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-022"></a>

### TC-RS-VAL-022 — Giá trị điều kiện phân nhánh (trung bình/tỷ lệ nhóm)

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 5.2 “Điều kiện dựa trên trung bình”

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Màn thêm quy tắc có điều kiện.
- Dữ liệu test: Trung bình: trống, −1, 101, 60.5, 60.123456789; tỷ lệ nhóm: −1, 0, 100, 101

**操作（Thao tác）**

Nhập từng giá trị, Lưu.

**期待結果（Kết quả mong đợi）**

Đề xuất (thiết kế DB v2): trống → không lưu được (điều kiện chưa đủ); 60.5 lưu được; 60.123456789 (9 chữ số lẻ) bị từ chối; tỷ lệ nhóm 0 và 100 lưu được, −1 và 101 bị từ chối. Trung bình −1 và 101: thiết kế DB v2 không nêu miền — TBD, ghi hành vi thực tế.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 5.2 “Điều kiện dựa trên trung bình” (không định nghĩa kiểm tra giá trị); Figma MW “màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình” (58:8930) (ô 60 + 未満), “màn Điều kiện áp dụng – điều kiện tỷ lệ điểm của nhóm” (58:9164) (ô 65 % + 以上); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 3.2 “`apply_condition`”, mục 4.2 “Xử lý phần lẻ và miền lưu trữ” (mốc `value` là chuỗi thập phân tối đa 9 chữ số nguyên và 8 chữ số lẻ; mốc tỷ lệ 0–100 — PROPOSED)
- Bằng chứng cần chụp: Ảnh sau khi Lưu từng giá trị (thông báo lỗi, hoặc giá trị khi mở lại).
- Ghi chú: PROPOSED; không phải must-pass.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-023"></a>

### TC-RS-VAL-023 — Giới hạn công thức: 20/21 dòng và số chữ số của số cố định

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11)

<!-- Mã truy vết: TC-RS-ERR-009, AC-G11, SI-06, TC-RS-DATA-001 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Màn Công thức（計算式）, nguồn mặc định.
- Dữ liệu test: (a) 20 dòng: dòng 1 `A × 1`, các dòng sau `kết quả dòng trước × 1`; (b) 21 dòng như (a); (c) `A × 999999999.99999999`; (d) `A × 1000000000`; (e) `A × 0.123456789`

**操作（Thao tác）**

Nhập từng cấu hình, Lưu, mở lại.

**期待結果（Kết quả mong đợi）**

(a) Lưu được, mở lại đủ 20 dòng.

(b) Không thêm được dòng 21 hoặc bị từ chối khi lưu.

(c) Lưu được, giá trị giữ nguyên.

(d), (e) Bị từ chối, không tự cắt/làm tròn.

Gửi trực tiếp request vượt giới hạn cũng bị server từ chối (case “Server kiểm miền giá trị khi bỏ qua kiểm tra phía trình duyệt”).

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.8 “Yêu cầu độ chính xác” (miền giá trị do team chốt); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11), Chi tiết thiết kế (Giới hạn nhập); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 4.2 “Xử lý phần lẻ và miền lưu trữ” (tối đa 20 bước; hệ số tối đa 9 chữ số nguyên và 8 chữ số lẻ; mỗi cột TEXT tối đa 60.000 byte — PROPOSED); khác biệt đặc tả–code về “Giới hạn giá trị ở server” (SI-06)
- Bằng chứng cần chụp: Ảnh form và thông báo; SELECT `formula` (khi có schema).
- Ghi chú: PROPOSED. Nguyên tắc không âm thầm cắt/làm tròn là CONFIRMED (đặc tả v2 mục 6.8 “Yêu cầu độ chính xác”, case “Cấu hình lưu và mở lại đầy đủ, không cắt/làm tròn âm thầm”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-024"></a>

### TC-RS-VAL-024 — Quy tắc dùng trung bình/tỷ lệ nhóm không lưu được khi thiếu nguồn

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05)

<!-- Mã truy vết: TD-ITEM-01, AC-G05, TC-RS-BR-011 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Màn thêm quy tắc của mục số nguyên (M=100).
- Dữ liệu test: mục số nguyên (M=100); (a) Điều kiện trung bình `A≥60`, ngưỡng cố định 30, bỏ trống một phần hoặc toàn bộ nguồn (thời kỳ, thiết lập tổng hợp, nhóm tham chiếu); (b) điều kiện tỷ lệ nhóm ≥65%, nguồn bỏ trống; (c) Toàn bộ đối tượng, ngưỡng Công thức tính（計算式） `A×0.5`, nguồn của công thức bỏ trống

**操作（Thao tác）**

Nhập từng biến thể, bấm Lưu; mở lại danh sách.

**期待結果（Kết quả mong đợi）**

Cả ba biến thể không lưu được; có thông báo thiếu nguồn. Không lưu quy tắc với điều kiện bị bỏ đi hoặc nguồn trống; danh sách quy tắc không đổi.

**補足（Bổ sung）**

- Nguồn: [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05) ("Nếu điều kiện hoặc ngưỡng dùng trung bình/tỷ lệ nhóm thì bắt buộc có nguồn, không bỏ điều kiện khi thiếu dữ liệu"); [đặc tả v2](../specification.vi.md) (R18) mục 5.4 “Bộ thông tin nguồn”, mục 5.6 “Khi nào không cần nguồn?”
- Bằng chứng cần chụp: Ảnh thông báo khi Lưu từng biến thể; ảnh danh sách sau đó.
- Ghi chú: Câu chữ thông báo không phải must-pass. (c) chỉ chạy khi công thức thuộc đợt phát hành (phạm vi phát hành chưa chốt — đặc tả v2 mục 13.1); ngoài đợt thì SKIPPED. Chiều ngược lại (quy tắc không dùng trung bình thì không hiện/không bắt nhập nguồn): case “Nguồn chỉ cần khi quy tắc đọc trung bình/tỷ lệ nhóm”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-025"></a>

### TC-RS-VAL-025 — Server từ chối lưu nhóm tham chiếu không khả dụng hoặc ngoài trường/năm

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12)

<!-- Mã truy vết: TD-POP-01, TD-ENV-02, TD-ITEM-01, TD-ROLE-01, AC-G12 -->

**前提条件（Điều kiện trước）**

- Điều kiện: thiết lập tổng hợp X（評点集計） (lớp học tắt). Công cụ sửa request (DevTools/proxy) trên môi trường test.
- Dữ liệu test: thiết lập tổng hợp X（評点集計）; ID nhóm tổng hợp của trường B (trường B (trường khác)); ID nhóm tổng hợp của năm khác; mục số nguyên (M=100); tài khoản giáo viên có quyền sửa mục

**操作（Thao tác）**

Gửi request lưu quy tắc có nguồn (điều kiện hoặc công thức) với từng biến thể:
1. Loại Lớp học（授業） trong khi công tắc lớp học đang tắt.
2. Nhóm tổng hợp mang ID của trường B.
3. Nhóm tổng hợp mang ID của năm học khác.
4. Nhóm môn học（科目グループ） có ID không tồn tại.

**期待結果（Kết quả mong đợi）**

Cả bốn biến thể bị từ chối; không lưu quy tắc; danh sách quy tắc không đổi; không trả về tên/dữ liệu của trường hay năm khác.

**補足（Bổ sung）**

- Nguồn: [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12) (bảng quy tắc chọn/đọc nhóm: "Server từ chối lưu lựa chọn không khả dụng"); [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Nhóm tham chiếu phía điểm đỏ có tuân theo thiết lập tổng hợp hiện hữu không?…” (Q32); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 3.1 “Bộ thông tin nguồn” ("từ chối lựa chọn trực tiếp không khả dụng hoặc ID ngoài trường/năm" — PROPOSED); quy tắc phát triển BLEND (phạm vi trường/năm, kiểm quyền ở server)
- Bằng chứng cần chụp: Request/response đã sửa (che token/cookie); ảnh danh sách quy tắc sau đó.
- Ghi chú: Không ghi token, cookie hay thông tin đăng nhập vào bằng chứng. Câu chữ lỗi không phải must-pass.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="data"></a>

## 4. Data / Persistence (DATA)

<a id="tc-rs-data-001"></a>

### TC-RS-DATA-001 — Cấu hình lưu và mở lại đầy đủ, không cắt/làm tròn âm thầm

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04); tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11)

<!-- Mã truy vết: TD-ITEM-02, TD-RULE-01, TD-RULE-04, TD-RULE-06, TD-RULE-12 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số thập phân (M=100).
- Dữ liệu test: mục số thập phân (M=100); quy tắc “Cố định 30” (dưới 30) với N=29.5; quy tắc tỷ lệ 30% làm tròn xuống; quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8); quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao)

**操作（Thao tác）**

1. Lưu từng quy tắc.
2. Tải lại trang, mở từng quy tắc.
3. SELECT cấu hình (khi có schema).

**期待結果（Kết quả mong đợi）**

Mọi trường (tên, phạm vi, bộ lọc, điều kiện, loại, N, p, cách làm tròn, toán hạng, so sánh, thứ tự) trùng giá trị đã nhập.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.8 “Yêu cầu độ chính xác” ("không được âm thầm cắt hoặc làm tròn giá trị"); Figma MW “màn danh sách thiết lập điểm đỏ” (58:9903)
- Bằng chứng cần chụp: Ảnh form mở lại; ảnh SELECT.
- Ghi chú: Ngưỡng cố định thập phân: thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ” đề xuất tối đa 3 chữ số lẻ (PROPOSED, giới hạn số chưa chốt — đặc tả v2 mục 13.1); nếu bản cuối không cho phép thập phân, thay 29.5 bằng 29.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-data-002"></a>

### TC-RS-DATA-002 — Kết quả lưu theo định danh ô; mỗi ô chỉ một kết quả hiện hành

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Nhận diện ô điểm” (AC-G03)

<!-- Mã truy vết: TD-ITEM-01, TD-ITEM-03, TD-STU-01, TD-RULE-01, AC-G03 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Đã xét S01 (mục số nguyên (M=100)) và S06 U1/U2 (mục điểm đơn vị (đơn vị U1 có M riêng 40)).
- Dữ liệu test: mục số nguyên (M=100); học sinh S01 (điểm 29), mục điểm đơn vị (đơn vị U1 có M riêng 40); quy tắc “Cố định 30” (dưới 30) (bước 4)

**操作（Thao tác）**

1. SELECT `red_score_results` theo `school_id`, `year`, `evaluate_frame_item_id`, `group_id`, `student_id`, `tangen_id` của các ô.
2. Chạy lại nút cam, SELECT lại.
3. `SHOW INDEX FROM red_score_results`.
4. Chuẩn bị hai mục cùng tên Điểm đánh giá（評点） ở hai kỳ khác nhau; chỉ mục kỳ 1 có quy tắc “Cố định 30” (dưới 30). Đăng ký S01 = 25 ở cả hai mục, xem đầu ra và SELECT.
5. Đổi tên mục kỳ 1 và đổi thứ tự cột mục trên khung đánh giá (nếu màn hỗ trợ); xem đầu ra và SELECT lại, chưa chạy xét.

**期待結果（Kết quả mong đợi）**

1–3. Mỗi ô (trường, năm, mục trên khung đánh giá — gồm kỳ/thời điểm, lớp, học sinh, đơn vị) có đúng một dòng hiện hành; U1/U2 của S06 là hai dòng; ô điểm thường có `tangen_id=0`. Chạy lại không tạo dòng thứ hai.

4. Ô kỳ 1 Đỏ; ô kỳ 2 không có dấu đỏ (không mượn quy tắc hay kết quả của mục cùng tên); hai kết quả gắn đúng `evaluate_frame_item_id` của từng mục.
5. Kết quả Đỏ vẫn gắn với đúng mục kỳ 1 (không theo số thứ tự cột hay tên mục).

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 2.2 “Một ô điểm được nhận diện như thế nào?”, mục 7.1 “Trình tự cho một ô”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Nhận diện ô điểm” (AC-G03); [tài liệu chia công việc v2](../split-tasks.vi.md) (RSD-TASK) công việc “Xét điểm cuối và lưu kết quả chung” (Task 2) ("Không dùng số thứ tự cột/tên mục làm khóa"); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 1.1 “Khóa nhận diện ô điểm”, mục 2.3 “Khóa và chỉ mục” (`uk_red_score_results_01` — PROPOSED)
- Bằng chứng cần chụp: Ảnh SELECT (che thông tin cá nhân); ảnh đầu ra hai mục ở bước 4.
- Ghi chú: Tên bảng/cột theo thiết kế DB v2 (PROPOSED, chưa migrate); nếu schema cuối khác, đổi câu SELECT, giữ kỳ vọng.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-data-003"></a>

### TC-RS-DATA-003 — Sáu trạng thái phân biệt được khi lưu

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Trạng thái sau lần chạy” (AC-G20)

<!-- Mã truy vết: TC-RS-BR-010, TC-RS-BR-002, TD-RULE-01, TD-STU-01, TD-STU-03, TD-STU-05, TC-RS-BR-017, TC-RS-BR-003, AC-G20 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Có ô ở mỗi trạng thái: Đỏ (S01), Không đỏ (S03), Chưa từng xét (ô mới chưa chạy), Chưa xét được (case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”), Không áp dụng (case “Không quy tắc nào khớp khi đủ dữ liệu → Không áp dụng”), Không có điểm (S05).
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29), học sinh S03 (điểm 31), học sinh S05 (ô trống)

**操作（Thao tác）**

1. SELECT `judgment_status`, `is_red`, `red_score_setting_id`, `reason_code` của các ô.
2. Đổi ngưỡng quy tắc “Cố định 30” (dưới 30) thành 35 (chỉ lưu), SELECT lại ô S03.

**期待結果（Kết quả mong đợi）**

1. Sáu trạng thái phân biệt được, không gộp Chưa xét được với Không áp dụng hay Không đỏ. Việc dùng cột, mã số, `reason_code` hoặc `red_score_setting_id` cụ thể là phần thiết kế DB cần đối chiếu khi schema được chốt; không dùng mapping đề xuất làm business oracle. Bất kể cách lưu, kết quả quan sát phải phân biệt rõ sáu trạng thái và trạng thái Đang chờ chạy lại.
2. Dòng của S03 giữ nguyên (đang chờ chạy lại không có trạng thái riêng).

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 8.1 “Các trạng thái phải phân biệt”, mục 8.2 “Bảng chuyển trạng thái”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Trạng thái sau lần chạy” (AC-G20); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 4.3 “Trạng thái kết quả” (PROPOSED)
- Bằng chứng cần chụp: Ảnh SELECT.
- Ghi chú: Phần CONFIRMED: sáu trạng thái phân biệt được; chỉ lưu cấu hình thì giữ kết quả. Mã số trạng thái và tên cột là PROPOSED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-data-004"></a>

### TC-RS-DATA-004 — Xóa quy tắc không xóa dây chuyền kết quả hay điểm

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”, mục 12.2 “Điểm tích hợp chính”

<!-- Mã truy vết: TD-RULE-01, TD-STU-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc “Cố định 30” (dưới 30); S01 Đỏ.
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29)

**操作（Thao tác）**

1. Xóa quy tắc “Cố định 30” (dưới 30).
2. SELECT kết quả và điểm của S01.

**期待結果（Kết quả mong đợi）**

Kết quả S01 vẫn còn; điểm 29 giữ nguyên.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Xóa thiết lập cuối cùng thì dấu đỏ mất ngay hay chờ chạy lại?” (Q28); [đặc tả v2](../specification.vi.md) (R18) mục 4.1 “Điểm vào và trạng thái trống”, mục 12.2 “Điểm tích hợp chính”
- Bằng chứng cần chụp: Ảnh SELECT trước/sau.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-data-005"></a>

### TC-RS-DATA-005 — Xét điểm đỏ không ghi đè điểm học sinh

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 6.4 “Công thức dùng trung bình”, mục 7.1 “Trình tự cho một ô”

<!-- Mã truy vết: TD-STU-01, TD-STU-02, TD-STU-03, TD-STU-04, TD-STU-05, TD-STU-06, TD-STU-07, TD-STU-08, TD-STU-09, TD-RULE-06 -->

**前提条件（Điều kiện trước）**

- Điều kiện: học sinh S01–S09 có điểm. quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8) (có làm tròn).
- Dữ liệu test: quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8); học sinh S01–S09

**操作（Thao tác）**

1. SELECT điểm trước.
2. Chạy nút cam.
3. SELECT điểm sau.

**期待結果（Kết quả mong đợi）**

Mọi điểm giữ nguyên (kể cả S09=29.5).

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.4 “Công thức dùng trung bình” ("Không dùng xử lý làm tròn điểm học sinh hiện có"), mục 7.1 “Trình tự cho một ô”
- Bằng chứng cần chụp: Ảnh SELECT trước/sau.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-data-006"></a>

### TC-RS-DATA-006 — Cột ngưỡng cũ không bị chuyển đổi hay xóa

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Bảo toàn điểm đỏ cũ” (AC-G38)

<!-- Mã truy vết: TD-ITEM-01, TD-ENV-03 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có `red_score` / `changed_red_score` khác NULL (nếu có dữ liệu).
- Dữ liệu test: mục số nguyên (M=100); quyền đọc DB local (chỉ SELECT/SHOW)

**操作（Thao tác）**

1. SELECT hai cột.
2. Thêm/sửa/xóa quy tắc, chạy nút cam.
3. SELECT lại.

**期待結果（Kết quả mong đợi）**

Giá trị không đổi; không có quy tắc mới được tạo tự động từ cột cũ.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Có chuyển thiết lập điểm đỏ cũ sang chức năng mới không?” (Q17); [đặc tả v2](../specification.vi.md) (R18) mục 12.3 “Không chuyển đổi dữ liệu đỏ cũ”; C-02
- Bằng chứng cần chụp: Ảnh SELECT.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-data-007"></a>

### TC-RS-DATA-007 — Cấu hình trình bày ở từng đầu ra lưu riêng, không làm đổi quy tắc/kết quả

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 9.1 “Thiết lập”, mục 10.1 “Phạm vi và tùy chọn”, mục 11.1 “Tùy chọn hiển thị đỏ”

<!-- Mã truy vết: TD-OUT-01, TD-OUT-03, TD-OUT-04 -->

**前提条件（Điều kiện trước）**

- Điều kiện: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước.
- Dữ liệu test: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước

**操作（Thao tác）**

1. Đổi từng cấu hình đầu ra, lưu.
2. Kiểm quy tắc và kết quả xét.

**期待結果（Kết quả mong đợi）**

Quy tắc và kết quả không đổi; cấu hình mỗi đầu ra độc lập (đổi công khai không đổi trích xuất).

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?” (Q16); [đặc tả v2](../specification.vi.md) (R18) mục 9.1 “Thiết lập”, mục 10.1 “Phạm vi và tùy chọn”, mục 11.1 “Tùy chọn hiển thị đỏ”
- Bằng chứng cần chụp: Ảnh cấu hình từng đầu ra trước/sau khi đổi; ảnh danh sách quy tắc và Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](01-test-strategy.vi.md#conventions) mục 9 “Quy ước thực thi chung”） dòng S01 trước/sau.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-data-008"></a>

### TC-RS-DATA-008 — Lưu thông tin giải thích kết quả

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 12.1 “Dữ liệu cấu hình và kết quả cần quản lý”

<!-- Mã truy vết: TD-RULE-03, TD-RULE-06, TD-STU-01, TC-RS-BR-019 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Có ô Đỏ, ô Chưa xét được, ô Không áp dụng và (nếu tạo được) một ô chưa từng xét đã có dòng điều khiển; một ô dùng quy tắc Tỷ lệ (quy tắc tỷ lệ 30%); một ô dùng quy tắc có nguồn trung bình (quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8)).
- Dữ liệu test: học sinh S01 (điểm 29); quy tắc tỷ lệ 30%; quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8)

**操作（Thao tác）**

1. SELECT `red_score_setting_id`, `reason_code`, `judgment_context`, `judged_at` của ô Đỏ (S01), ô Chưa xét được, ô Không áp dụng, ô chưa từng xét, ô Tỷ lệ và ô có nguồn.
2. Làm ô S01 chuyển từ Đỏ sang Không áp dụng (như case “Xóa quy tắc cuối: giữ kết quả tới lần chạy lại; chạy lại → Không áp dụng”), SELECT lại.

**期待結果（Kết quả mong đợi）**

1. Ô Đỏ: có quy tắc được chọn; `judgment_context` có `score`="29", `threshold` dạng tử/mẫu (30/1), `compare_type`=1, `sources` rỗng với quy tắc cố định. Ô Chưa xét được: có `reason_code` (ví dụ `source_missing`). `judged_at` có giá trị cho cả ô Chưa xét được và Không áp dụng; NULL ở ô chưa từng xét. Ô có điểm hợp lệ: `judgment_context` có `grade_id` (ID dòng điểm nguồn). Ô Tỷ lệ: `judgment_context` có `maximum`. Ô có nguồn: `sources[]` có `usage`, `kind`, `reference`, `population_key`; với nhóm môn học（科目グループ） có thêm `resolved_population_type`/`resolved_population_ref_id` nhưng vẫn giữ loại/ID đã chọn. Không có tên học sinh, thông tin liên hệ hay câu lỗi SQL.
2. Sau khi chuyển sang Không áp dụng: không còn giữ ngưỡng, dấu so sánh hay nguồn của lần Đỏ trước.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 12.1 “Dữ liệu cấu hình và kết quả cần quản lý”; [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 3.4 “`judgment_context`” (`judgment_context` — PROPOSED)
- Bằng chứng cần chụp: Ảnh kết quả SELECT của các ô (không lấy cột tên học sinh).
- Ghi chú: PROPOSED — theo thiết kế DB v2 mục 3.4 “`judgment_context`”. `judgment_context` chỉ để giải thích, không thay cơ chế phiên bản (thiết kế DB v2 mục 6 “Phương thức xử lý cập nhật đồng thời”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-data-009"></a>

### TC-RS-DATA-009 — Sao chép, kế thừa năm, nhập/xuất cấu hình

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12); tiêu chí nghiệm thu “Bảo toàn điểm đỏ cũ” (AC-G38); tiêu chí nghiệm thu “Không dùng lại kết quả cho đối tượng mới” (AC-G39)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-07, AC-G38, AC-G39, AC-G12, TC-RS-REG-012 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có cặp quy tắc phân nhánh theo trung bình 60.
- Dữ liệu test: mục số nguyên (M=100); cặp quy tắc phân nhánh theo trung bình 60

**操作（Thao tác）**

1. Thực hiện sao chép mục / kế thừa sang năm 2027 / xuất-nhập / đồng bộ cấu hình (theo chức năng hiện có).
2. Ngay sau mỗi thao tác, chưa chạy xét, xem ba đầu ra và SELECT kết quả của đích.
3. Mục nguồn có thêm `red_score`=40 (dữ liệu cũ): lặp bước 1, xem danh sách quy tắc ở đích.
4. Nhập một tệp cấu hình xuất từ trước khi có chức năng (không có phần quy tắc mới) vào mục đích đang có quy tắc.

**期待結果（Kết quả mong đợi）**

Phần CONFIRMED (tiêu chí nghiệm thu “Bảo toàn điểm đỏ cũ”, tiêu chí nghiệm thu “Không dùng lại kết quả cho đối tượng mới”):

1. Không sao chép kết quả xét; không gắn bản chốt năm cũ vào năm mới; không làm hỏng cấu hình nguồn.
2. Đích ở trạng thái Chưa từng xét cho tới khi chạy xét; đồng bộ cấu hình không được coi là đã xét; không có dấu đỏ ở đầu ra của đích.
3. Không có quy tắc mới nào được tạo từ `red_score` cũ.

Phần PROPOSED (thiết kế DB v2 mục 4.5 “Sao chép và năm học”; tiêu chí nghiệm thu v2 Chi tiết thiết kế): quy tắc đích được ánh xạ lại mục, kỳ/thời điểm, thiết lập tổng hợp, nhóm và ID trong điều kiện; không ánh xạ được mục sở hữu thì không tạo quy tắc; thiếu tham chiếu phụ thì không ghi đè quy tắc đích; không đổi bộ lọc thành Toàn bộ để vượt lỗi; có thông báo phần không lưu được; giữ thứ tự quy tắc và tham chiếu dòng công thức; tham chiếu không ánh xạ được không bị thay bằng dữ liệu cùng tên ở đích; quy tắc chưa đủ không được bật; cấu hình được đọc theo quyền/ngữ cảnh của đích (tài liệu chia công việc v2 công việc “Bảo toàn chuyển cấu hình và chức năng cũ”). Nguồn dùng nhóm lớp học（授業） được phân giải theo lớp của ô đích; nguồn dùng nhóm môn học（科目グループ） được ánh xạ cùng cấu hình riêng theo môn/default phụ thuộc (tiêu chí nghiệm thu v2 bảng quy tắc chọn/đọc nhóm của tiêu chí nghiệm thu “Đúng phạm vi tham chiếu”/G13). Không mang thế hệ ô/phiên bản đặt chỗ/phiên bản hoàn tất từ nguồn sang đích; phiên bản quy tắc của mục đích tăng khi nhận quy tắc (thiết kế DB v2 mục 4.5 “Sao chép và năm học”).

4. (PROPOSED) Nhập được phần có sẵn; quy tắc hiện có của đích không bị âm thầm xóa.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 12.4 “Sao chép, năm mới, nhập/xuất và khôi phục”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Bảo toàn điểm đỏ cũ” (AC-G38), tiêu chí nghiệm thu “Không dùng lại kết quả cho đối tượng mới” (AC-G39); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 4.5 “Sao chép và năm học” (PROPOSED); [tài liệu chia công việc v2](../split-tasks.vi.md) (RSD-TASK) công việc “Bảo toàn chuyển cấu hình và chức năng cũ” (Task 8)
- Bằng chứng cần chụp: Ảnh danh sách quy tắc ở đích sau từng thao tác; ảnh thông báo phần không lưu được; ảnh đầu ra của đích trước khi chạy xét; ảnh SELECT `red_score_results` năm 2027 (không có dòng được sao chép).
- Ghi chú: PROPOSED — đường được hỗ trợ chưa chốt (tài liệu chia công việc v2 công việc “Bảo toàn chuyển cấu hình và chức năng cũ”); đường chưa chốt: SKIPPED. Với đường được hỗ trợ, phần CONFIRMED ở Expected là must-pass. Giữ `red_score` cũ ở bản đích: case “Sao chép, kế thừa năm, xuất/nhập vẫn mang dữ liệu đỏ cũ như trước”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-data-010"></a>

### TC-RS-DATA-010 — Sao chép mẫu phiếu điểm giữ lựa chọn hiển thị đỏ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu, sao chép và PDF phiếu” (AC-G37)

<!-- Mã truy vết: TD-OUT-04, AC-G37, SI-04 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mẫu phiếu A có cấu hình phiếu điểm: ký tự “※” phía trước; mẫu phiếu B chỉ bật điều kiện đỏ (các dòng khác không dùng).
- Dữ liệu test: cấu hình phiếu điểm: ký tự “※” phía trước

**操作（Thao tác）**

1. Sao chép mẫu A và mẫu B.
2. Mở dòng Thiết lập điểm đỏ（赤点設定） ở từng bản sao.
3. Xuất PDF bản sao với S01.

**期待結果（Kết quả mong đợi）**

1–2. Bản sao giữ lựa chọn Ký tự phía trước（前に任意の文字） `※`; mẫu chỉ dùng điều kiện đỏ vẫn còn hiệu lực.

3. PDF: ô S01 hiển thị `※29`. Không sao chép kết quả xét của học sinh.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 11.3 “Lưu và xuất”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Lưu, sao chép và PDF phiếu” (AC-G37); [tài liệu chia công việc v2](../split-tasks.vi.md) (RSD-TASK) công việc “Thêm điều kiện đỏ vào phiếu điểm” (Task 7) (xử lý lưu cấu hình phiếu điểm điều chỉnh `use_condition`; sao chép template thuộc công việc “Thêm điều kiện đỏ vào phiếu điểm” (Task 7)); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 5.1 “Thiết lập hiển thị của Trích xuất thành tích（成績抽出）và Công cụ phiếu điểm（通知表ツール）” (sao chép mẫu giữ lựa chọn và chuỗi, không sao chép kết quả xét của học sinh); CODE `application/blend/Report/Repository/ReportWidgetGradesNormalRepository.php` (nơi lưu `use_condition`); code hiện tại “Copy template 通知表 (phiếu điểm) làm mất display option” (sao chép mẫu mất `display_option`); khác biệt đặc tả–code về “Sao chép mẫu phiếu điểm” (SI-04)
- Bằng chứng cần chụp: Ảnh bản gốc và bản sao; **file PDF thực** của bản sao.
- Ghi chú: Code hiện tại mất `display_option` khi sao chép (khác biệt đặc tả–code về “Sao chép mẫu phiếu điểm”) → dự kiến FAIL cho tới khi sửa. tài liệu chia công việc v2 đưa việc này vào công việc “Thêm điều kiện đỏ vào phiếu điểm”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-data-011"></a>

### TC-RS-DATA-011 — Bảng/cột mới theo quy tắc schema của BLEND

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 12.1 “Dữ liệu cấu hình và kết quả cần quản lý”, mục 12.3 “Không chuyển đổi dữ liệu đỏ cũ”

<!-- Mã truy vết: TD-ENV-03 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Build có migration của tính năng.
- Dữ liệu test: quyền đọc DB local (chỉ SELECT/SHOW)

**操作（Thao tác）**

1. `SHOW CREATE TABLE` và `SHOW FULL COLUMNS` cho `red_score_settings`, `red_score_results`.
2. `SHOW CREATE TABLE` cho `grade_publish_conf_grade_items` và `grade_evaluate_frame_items`; so với bản trước migration (hoặc DDL gốc trong source).

**期待結果（Kết quả mong đợi）**

1. Có phạm vi trường/năm, cột audit và comment theo quy tắc schema hiện hành. Đối chiếu thêm với thiết kế (PROPOSED): InnoDB, `utf8mb4`/`utf8mb4_general_ci`, không khai báo foreign key, có `idx_red_score_settings_01`, `uk_red_score_results_01`, `idx_red_score_results_01`, `setting_status` mặc định 0 và phân biệt rõ trạng thái 0/1/2; `red_score_results` có thêm `cell_generation`, `write_version` (mặc định 0), `judged_version`, `rule_revision` (cho phép NULL); bảng/cột cũ (`red_score`, `changed_red_score`) không đổi.
2. (PROPOSED) Chỉ thêm `red_score_display_type TINYINT UNSIGNED NOT NULL DEFAULT 0` vào `grade_publish_conf_grade_items` và `red_score_revision BIGINT UNSIGNED NOT NULL DEFAULT 0` vào `grade_evaluate_frame_items`; không đổi kiểu/khóa/collation của cột có sẵn, không thêm index hay foreign key. Thiết lập đỏ của Trích xuất thành tích（成績抽出） và Công cụ phiếu điểm（通知表ツール） không có cột/bảng mới (dùng JSON `grade_extract_conf.extract_setting` và phần lưu bảng/điều kiện phiếu điểm hiện có).

**補足（Bổ sung）**

- Nguồn: Quy tắc phát triển BLEND (schema); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 2 “Định nghĩa bảng”, mục 2.3 “Khóa và chỉ mục”, mục 3 “Dữ liệu JSON” (cột bổ sung trên bảng hiện hữu), mục 5.1 “Thiết lập hiển thị của Trích xuất thành tích（成績抽出）và Công cụ phiếu điểm（通知表ツール）” (Trích xuất/phiếu điểm không thêm cột) và `database-design.sql` (PROPOSED); [đặc tả v2](../specification.vi.md) (R18) mục 12.1 “Dữ liệu cấu hình và kết quả cần quản lý”, mục 12.3 “Không chuyển đổi dữ liệu đỏ cũ”
- Bằng chứng cần chụp: Ảnh kết quả SHOW.
- Ghi chú: Tên bảng theo thiết kế DB v2 (PROPOSED). Lệch thiết kế nhưng vẫn đúng quy tắc schema: ghi Notes, không FAIL. thiết kế DB v2 yêu cầu ID `CHAR(32)` là mã hex canonical, tương thích identity/cách so sánh của bảng nguồn (`latin1_bin`); kiểm thêm bằng một câu SELECT nối cột ID của `red_score_results` với bảng nguồn và ghi kết quả. Collation cụ thể trong DDL còn chờ chốt (chưa chốt). Bản v1 đã được khách hàng review và có ba phản hồi (context điểm đỏ mục 9.6 “Ba phản hồi review DB và bài học thiết kế ngày 28/09”); bản v2 đã sửa theo phản hồi nhưng chưa được review kỹ thuật và chưa thực thi DDL (chờ review — đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-data-012"></a>

### TC-RS-DATA-012 — Lưu, đọc lại và sao chép hiệu ứng đỏ theo dòng mục của cấu hình công khai

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 10.1 “Phạm vi và tùy chọn”

<!-- Mã truy vết: TD-OUT-05, TD-OUT-06, TD-ENV-03, TD-ROLE-07, TD-ROLE-06, TD-ENV-02, TD-ITEM-01, TC-RS-FUNC-037 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Build có migration thêm `red_score_display_type`; cấu hình công khai tạo trước khi migrate (dòng cũ) và hai cấu hình X, Y theo hai cấu hình công khai cùng một mục.
- Dữ liệu test: hai cấu hình công khai cùng một mục, cấu hình công khai có mục điểm thường và mục điểm đơn vị; quyền đọc DB local (chỉ SELECT/SHOW); tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm), tài khoản của trường B

**操作（Thao tác）**

1. SELECT `grade_publish_conf_id`, `year`, `evaluate_item_id`, `tangen_flg`, `red_score_display_type` của X, Y và của cấu hình cũ.
2. Mở cấu hình cũ trên màn, xem màn học sinh của cấu hình đó.
3. Sao chép X; SELECT dòng của bản sao.
4. Gửi request lưu với `red_score_display_type`=4, và với ID cấu hình công khai của trường B (tài khoản của trường B / trường B (trường khác)).

**期待結果（Kết quả mong đợi）**

1. X: 1 (ngoặc) ở dòng mục số nguyên (M=100); Y: 2 (`*` trước); dòng thường/đơn vị tách theo `tangen_flg`. Không có cột hiệu ứng trong bảng kết quả của học sinh.
2. Dòng cũ có giá trị 0; hiển thị giữ như trước khi có chức năng.
3. Bản sao có ID cấu hình mới và giữ giá trị 1; không có dòng kết quả học sinh nào được sao chép.
4. Bị từ chối; giá trị đã lưu không đổi.

**補足（Bổ sung）**

- Nguồn: [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 5 “Hiệu ứng theo cấu hình công khai” (`0=không có, 1=ngoặc, 2=* trước, 3=* sau`); `database-design.sql` (ALTER TABLE `grade_publish_conf_grade_items`); [đặc tả v2](../specification.vi.md) (R18) mục 10.1 “Phạm vi và tùy chọn”; [context điểm đỏ](../../../CONTEXT.md) (CTX) mục 9.6 “Ba phản hồi review DB và bài học thiết kế ngày 28/09” (bằng chứng source: model đọc danh sách cột tường minh và controller xóa/chèn lại dòng, nên thêm cột thôi chưa đủ cho lưu/đọc lại)
- Bằng chứng cần chụp: Ảnh SELECT; ảnh màn của cấu hình cũ; request/response đã sửa (che token/cookie).
- Ghi chú: PROPOSED — tên cột và mã giá trị chờ review kỹ thuật. Nếu schema cuối khác, giữ kỳ vọng hành vi của case “Công khai: cùng mục dùng hiệu ứng đỏ khác nhau ở hai cấu hình công khai” và đổi câu SELECT.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-data-013"></a>

### TC-RS-DATA-013 — Phiên bản quy tắc, dòng điều khiển và thế hệ ô được cập nhật đúng sự kiện

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất”, mục 12.1 “Dữ liệu cấu hình và kết quả cần quản lý”

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-01, TD-RULE-08, TD-STU-01, TD-STU-02, TD-ENV-03, TC-RS-ERR-011, TC-RS-BR-019 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Build có migration v2. mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30) và cặp quy tắc cùng áp dụng (dưới 20 và dưới 30); S01 = 29 đã được xét (Đỏ); ô S02 chưa từng xét.
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), cặp quy tắc cùng áp dụng (dưới 20 và dưới 30); học sinh S01 (điểm 29), học sinh S02 (điểm 30); quyền đọc DB local (chỉ SELECT/SHOW)

**操作（Thao tác）**

1. SELECT `red_score_revision` của mục mục số nguyên (M=100) trên `grade_evaluate_frame_items`; SELECT `cell_generation`, `write_version`, `judged_version`, `rule_revision`, `judgment_status` của S01.
2. Lần lượt: thêm một quy tắc; sửa ngưỡng; đổi thứ tự; xóa quy tắc; xóa tới quy tắc cuối. SELECT `red_score_revision` và kết quả S01 sau mỗi thao tác (chưa chạy xét).
3. Lưu lại điểm S01 = 29; SELECT S01.
4. Khi một batch đã đặt chỗ S01 nhưng chưa hoàn tất, SELECT S01.
5. Lưu điểm S02 lần đầu; SELECT S02.
6. Xóa trống ô S01; SELECT S01.

**期待結果（Kết quả mong đợi）**

1. Có giá trị ban đầu; `judged_version` của S01 bằng phiên bản của lần ghi hoàn tất.
2. `red_score_revision` tăng sau mỗi thao tác (kể cả xóa quy tắc cuối); kết quả S01 không đổi (vẫn Đỏ).
3. `write_version` tăng; `judged_version` = `write_version` mới; `rule_revision` = `red_score_revision` hiện tại.
4. `write_version` đã tăng nhưng payload kết quả đã hoàn tất (Đỏ) vẫn còn; đầu ra vẫn đọc kết quả đó, không tự bỏ dấu vì phiên bản lệch.
5. Có đúng một dòng điều khiển; sau khi hoàn tất có trạng thái và `judged_at`.
6. `cell_generation` mới, `judgment_status`=4, thông tin quy tắc/ngưỡng/nguồn cũ bị xóa; dòng điều khiển được giữ.

**補足（Bổ sung）**

- Nguồn: [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 2.2 “`red_score_results`”, mục 4.4 “Cập nhật và hiệu lực kết quả”, mục 6.1 “Dữ liệu điều khiển và dòng được khóa”–mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi”; `database-design.sql` (ALTER TABLE `grade_evaluate_frame_items`); [đặc tả v2](../specification.vi.md) (R18) mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất”, mục 12.1 “Dữ liệu cấu hình và kết quả cần quản lý”; [context điểm đỏ](../../../CONTEXT.md) (CTX) mục 9.6 “Ba phản hồi review DB và bài học thiết kế ngày 28/09” (bài học 2–3: fingerprint giá trị bỏ sót đổi rồi trở lại; sửa/xóa rule vẫn giữ kết quả trước đến lần xét lại)
- Bằng chứng cần chụp: Ảnh SELECT sau mỗi bước (không lấy cột tên học sinh).
- Ghi chú: PROPOSED — cơ chế thế hệ/phiên bản/khóa chờ review kỹ thuật, chưa chạy thử hai kết nối (thiết kế DB v2 mục 6.4 “Phạm vi kết nối và ví dụ kiểm tra”). Hành vi bắt buộc (giữ kết quả khi chỉ sửa quy tắc; lượt cũ không ghi đè) được kiểm ở case “Lượt cũ hoàn tất muộn không ghi đè kết quả của điểm/cấu hình mới hơn”, case “Xóa quy tắc cuối: giữ kết quả tới lần chạy lại; chạy lại → Không áp dụng”. Bước 4 cần cách làm chậm job.

**結果（Kết quả）**

**証跡（Bằng chứng）**
