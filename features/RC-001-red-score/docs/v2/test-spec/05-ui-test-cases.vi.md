# 05 — Test case giao diện (UI)

Vai trò mặc định, nơi xem kết quả xét, bằng chứng mặc định và tra nhanh mã dữ liệu (TD-…): [01 §9](01-test-strategy.vi.md#conventions) «Quy ước thực thi chung».

Nguồn chính: [file Figma của Movitation Works (MW)](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/%25E8%25B5%25A4%25E7%2582%25B9%25E5%2588%25A4%25E5%25AE%259A%25E5%25AF%25BE%25E5%25BF%259C?node-id=0-1) (đối chiếu chỉ đọc 29/09/2026; node trong case là node file MW, mở bằng `?node-id=58-…`), đối chiếu R18 «đặc tả RC-001 v2» §3 «Bản đồ màn hình và luồng thao tác»–§11 «Công cụ phiếu điểm（通知表ツール） và PDF».

Quy ước riêng cho file này:

- R18 §13.2 «Tài liệu liên quan» ghi Figma "chưa phải chứng nhận mọi chi tiết tương tác/pixel hoặc bản vẽ đã được khách hàng duyệt toàn bộ", và chi tiết UI gắn đề xuất vẫn chờ review (R18 §13.1 «Điều kiện triển khai và kiểm chứng»). Vì vậy **câu chữ/nhãn/bố cục chỉ có trong Figma là PROPOSED**; phần có căn cứ QAC «Q&A nghiệp vụ đã xác nhận»/R18/RSD-AC là CONFIRMED; phần Figma khác spec là **CONFLICT** (không đánh giá phần tranh chấp — [01 §3](01-test-strategy.vi.md) «Nhãn trạng thái của test case»).
- Giá trị mẫu trên Figma (30, 60, 65, `※`…) là dữ liệu minh họa, không phải mặc định sản phẩm (R18 phần mở đầu).
- "Lưu" = bấm Cập nhật（更新する）. Mọi case đang **NOT RUN**.

<a id="tc-rs-ui-001"></a>

### TC-RS-UI-001 — Nhãn trạng thái ở hàng Thiết lập điểm đỏ（赤点設定） trong Thiết lập ô nhập（入力欄設定）

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”

<!-- Mã truy vết: TD-ITEM-01, TD-ITEM-02, TD-ITEM-04, TD-ROLE-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) chưa có quy tắc; mục số thập phân (M=100) có quy tắc; mục kiểu lựa chọn A/B/C là mục lựa chọn. tài khoản giáo viên có quyền sửa mục.
- Dữ liệu test: mục số nguyên (M=100), mục số thập phân (M=100), mục kiểu lựa chọn A/B/C

**操作（Thao tác）**

1. Mở Thiết lập ô nhập（入力欄設定）.
2. Ghi lại nhãn/ký hiệu ở hàng Thiết lập điểm đỏ（赤点設定） cho từng cột mục.

**期待結果（Kết quả mong đợi）**

Mục chưa có quy tắc và mục đã có quy tắc được phân biệt được; mục lựa chọn không có thao tác mở thiết lập (đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”).

Nhãn cụ thể theo Figma (PROPOSED): [設定する] (thiết lập) / 編集 (sửa) + 設定済み (đã thiết lập) / —.

**補足（Bổ sung）**

- Nguồn: Figma MW “màn Thiết lập ô nhập（入力欄設定）, lối vào điểm đỏ” (58:9848–9870) (ô [設定する] (thiết lập), 編集 (sửa) + 設定済み (đã thiết lập), —); [đặc tả v2](../specification.vi.md) (R18) mục 4.1 “Điểm vào và trạng thái trống”
- Bằng chứng cần chụp: Ảnh hàng Thiết lập điểm đỏ（赤点設定）.
- Ghi chú: Nhãn chỉ có trong Figma là PROPOSED: lệch thì ghi Notes, không FAIL.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-002"></a>

### TC-RS-UI-002 — Cấu trúc màn danh sách Thiết lập điểm đỏ（赤点設定）

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”, mục 4.2 “Nội dung một dòng”

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-07, TD-ENV-05 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có cặp quy tắc phân nhánh theo trung bình 60 (2 quy tắc).
- Dữ liệu test: mục số nguyên (M=100); cặp quy tắc phân nhánh theo trung bình 60

**操作（Thao tác）**

1. Mở Thiết lập nhập điểm（成績入力設定） (URL ở đường dẫn các màn liên quan) → Thiết lập ô nhập（入力欄設定） của kỳ Cuối kỳ học kỳ 1（1学期期末）.
2. Ở hàng Thiết lập điểm đỏ（赤点設定） của cột mục số nguyên (M=100), bấm nút mở thiết lập (Figma: 編集 (sửa)).
3. Trên màn danh sách, đối chiếu lần lượt các mục a–g ở Expected Result.

**期待結果（Kết quả mong đợi）**

a. Breadcrumb: Thiết lập bảng thành tích（成績帳票設定） - Thiết lập thành tích（成績設定） - Thiết lập nhập điểm（成績入力設定） - Thiết lập điểm đỏ（赤点設定）.

b. Link Quay lại Thiết lập nhập điểm（[成績入力設定へ戻る]）.

c. Khối Giải thích bổ sung（※補足説明※） thu gọn/mở được.

d. Nút Thêm thiết lập chi tiết（詳細設定の追加）.

e. Bảng có các cột Tên thiết lập（設定名称）; Điều kiện áp dụng（適用条件） kèm Sửa（[編集]）; Ngưỡng đỏ（赤点の基準） kèm Sửa（[編集]）; Xóa（削除）; Ưu tiên（優先順位） ▲▼; có 2 dòng theo cặp quy tắc phân nhánh theo trung bình 60.

f. Câu 「上から順に適用条件を確認し、最初に一致した設定を使用します。」 (kiểm điều kiện từ trên xuống, dùng thiết lập khớp đầu tiên).

g. Câu cuối trang 「設定を変更した場合は、成績登録または成績集計の自動算出を再実行してください。」 (đổi thiết lập thì chạy lại đăng ký điểm hoặc tính tự động).

**補足（Bổ sung）**

- Nguồn: Figma MW “màn danh sách thiết lập điểm đỏ” (58:9903) (UI｜02): breadcrumb (58:10006–10008), (58:10020) [成績入力設定へ戻る] (quay lại Thiết lập nhập điểm), (58:10022–10024) ※補足説明※ ▼表示する (giải thích bổ sung, ▼ hiện), (58:10030) 詳細設定の追加 (thêm thiết lập chi tiết), cột (58:10041–10053), (58:10035), (58:10158); [đặc tả v2](../specification.vi.md) (R18) mục 4.1 “Điểm vào và trạng thái trống”, mục 4.2 “Nội dung một dòng”
- Bằng chứng cần chụp: Ảnh toàn màn; ghi Actual Result theo từng mục a–g.
- Ghi chú: Có nhiều quy tắc và ưu tiên là CONFIRMED (đặc tả v2 mục 4.2 “Nội dung một dòng”, mục 4.3 “Chọn quy tắc”); nhãn và bố cục là PROPOSED. Không có mục Cho phép sửa tay（手動変更の可否） như AutoRating (suy từ đặc tả v2 mục 3: không có chế độ xét thủ công/tự động riêng).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-003"></a>

### TC-RS-UI-003 — Định dạng tiêu đề màn danh sách

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04)

<!-- Mã truy vết: TD-ITEM-02, AC-G04 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số thập phân (M=100).
- Dữ liệu test: mục số thập phân (M=100)

**操作（Thao tác）**

Mở màn danh sách của mục số thập phân (M=100), đọc tiêu đề.

**期待結果（Kết quả mong đợi）**

Theo tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập”: màn danh sách thể hiện kỳ Cuối kỳ học kỳ 1（1学期期末）, tên mục, kiểu nhập Nhập số – thập phân（数値入力・小数） và Thiết lập điểm đỏ（赤点設定）.

Định dạng tiêu đề theo Figma (PROPOSED): 「1学期期末 ／ 評点（数値入力・小数） の赤点設定」; lệch thì ghi Notes, không FAIL.

**補足（Bổ sung）**

- Nguồn: Figma MW “màn danh sách thiết lập điểm đỏ” (58:10026) 「1学期期末 ／ 評点（数値入力・小数） の赤点設定」, “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9532); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04) ("Danh sách thể hiện mục/kiểu/thời điểm")
- Bằng chứng cần chụp: Ảnh tiêu đề.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-004"></a>

### TC-RS-UI-004 — Tóm tắt điều kiện và ngưỡng trên từng dòng danh sách

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 4.2 “Nội dung một dòng”

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-07, TD-RULE-06 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có cặp quy tắc phân nhánh theo trung bình 60 và một quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8).
- Dữ liệu test: mục số nguyên (M=100); quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8), cặp quy tắc phân nhánh theo trung bình 60

**操作（Thao tác）**

Xem cột Điều kiện áp dụng（適用条件） và Ngưỡng đỏ（赤点の基準） của từng dòng.

**期待結果（Kết quả mong đợi）**

Mỗi dòng cho biết môn/nguồn/mốc của điều kiện, loại ngưỡng, giá trị, dấu so sánh; dòng công thức cho thấy các dòng tính và xử lý phần lẻ. Định dạng theo Figma (đề xuất).

**補足（Bổ sung）**

- Nguồn: Figma MW “màn danh sách thiết lập điểm đỏ” (58:10058–10142) (「数学／ホームルーム平均 60点以上」 (Toán / trung bình lớp chủ nhiệm từ 60), 「固定点数：30点未満」, bảng công thức 式1 ホームルーム平均 ÷ 2 小数第1位切り捨て / 式2 式1 × 0.8 しない, 「判定：計算結果未満」; file cũ ghi 「数学／HR平均 60点以上」); [đặc tả v2](../specification.vi.md) (R18) mục 4.2 “Nội dung một dòng”
- Bằng chứng cần chụp: Ảnh toàn bảng danh sách, thấy đủ cột Điều kiện áp dụng（適用条件） và Ngưỡng đỏ（赤点の基準） của cả ba dòng.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-005"></a>

### TC-RS-UI-005 — Trạng thái danh sách trống

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”

<!-- Mã truy vết: TD-ITEM-01, TC-RS-FUNC-003 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) không có quy tắc.
- Dữ liệu test: mục số nguyên (M=100)

**操作（Thao tác）**

Mở danh sách.

**期待結果（Kết quả mong đợi）**

Hiển thị câu báo không có thiết lập và nút thêm; không có dòng mẫu.

**補足（Bổ sung）**

- Nguồn: Figma MW “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9533–9539) (nút 詳細設定の追加, câu 「赤点設定はありません。」 (không có thiết lập điểm đỏ)); [đặc tả v2](../specification.vi.md) (R18) mục 4.1 “Điểm vào và trạng thái trống”
- Bằng chứng cần chụp: Ảnh toàn màn danh sách trống.
- Ghi chú: Không tự tạo quy tắc mặc định là CONFIRMED (case “Danh sách trống không tự tạo quy tắc mặc định hoặc chuyển từ ngưỡng đỏ cũ”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-006"></a>

### TC-RS-UI-006 — Hộp xác nhận khi xóa quy tắc cuối

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 4.4 “Lưu, đổi thứ tự và xóa”

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-01, TC-RS-BR-019 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) chỉ có quy tắc “Cố định 30” (dưới 30).
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

Bấm Xóa（削除） ở dòng duy nhất.

**期待結果（Kết quả mong đợi）**

Hộp xác nhận nêu đây là thiết lập cuối, kết quả trước còn dùng tới lần chạy lại, điểm được giữ; có Hủy và Xóa.

**補足（Bổ sung）**

- Nguồn: Figma MW “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9613–9625) (「赤点設定を削除しますか？」 (xóa thiết lập điểm đỏ?), 「「設定1」はこの項目の最後の設定です。」 (「thiết lập 1」 là thiết lập cuối của mục này), 「削除後も再実行まで前回結果を使用します。」, 「再実行後に赤点表示・抽出を停止。点数は残します。」, nút キャンセル (hủy) / 削除する (xóa)); [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Xóa thiết lập cuối cùng thì dấu đỏ mất ngay hay chờ chạy lại?” (Q28); [đặc tả v2](../specification.vi.md) (R18) mục 4.4 “Lưu, đổi thứ tự và xóa”
- Bằng chứng cần chụp: Ảnh hộp.
- Sau khi chạy: Bấm Hủy.
- Ghi chú: Ý nghĩa (giữ kết quả tới lần chạy lại) là CONFIRMED (Q&A nghiệp vụ đã xác nhận câu “Xóa thiết lập cuối cùng thì dấu đỏ mất ngay hay chờ chạy lại?”, kiểm ở case “Xóa quy tắc cuối: giữ kết quả tới lần chạy lại; chạy lại → Không áp dụng”); câu chữ là PROPOSED. Hộp khi xóa quy tắc không phải cuối: Figma không có frame riêng.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-007"></a>

### TC-RS-UI-007 — Dòng quy tắc mới chỉ có điều kiện, chưa có ngưỡng

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 13.1 “Các quyết định còn lại được phân loại rõ”

<!-- Mã truy vết: TD-RULE-13, TC-RS-FUNC-014 -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc mới chỉ có điều kiện, chưa có ngưỡng vừa lưu điều kiện.
- Dữ liệu test: quy tắc mới chỉ có điều kiện, chưa có ngưỡng

**操作（Thao tác）**

Quay về danh sách, xem dòng.

**期待結果（Kết quả mong đợi）**

Dòng hiển thị chưa có ngưỡng, có link mở thiết lập ngưỡng và câu báo không dùng để xét.

**補足（Bổ sung）**

- Nguồn: Figma MW “chương 01 – lối vào, danh sách, xóa thiết lập” (58:10165–10179) (「基準が未設定のため、この設定は判定に使用しません。」 (vì chưa đặt ngưỡng, thiết lập này không được dùng để xét), cột ngưỡng 「未設定」, link 「基準設定を開く」 (mở thiết lập ngưỡng), (58:10179)); [đặc tả v2](../specification.vi.md) (R18) mục 13.1 “Các quyết định còn lại được phân loại rõ” (trạng thái thêm dở là đề xuất)
- Bằng chứng cần chụp: Ảnh dòng quy tắc chưa có ngưỡng trên danh sách.
- Ghi chú: Hành vi xét: case “Quy tắc mới chỉ có điều kiện, chưa có ngưỡng, không tham gia xét”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-008"></a>

### TC-RS-UI-008 — Màn Điều kiện áp dụng（適用条件設定）: bố cục và chuyển Toàn bộ/Bộ lọc

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 5.1 “Đối tượng áp dụng”

<!-- Mã truy vết: TD-ITEM-02 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mở thêm quy tắc cho mục số thập phân (M=100).
- Dữ liệu test: mục số thập phân (M=100)

**操作（Thao tác）**

1. Đối chiếu bố cục.
2. Chọn Toàn bộ đối tượng（全員が対象）.
3. Chọn Giới hạn bằng bộ lọc（特定条件で絞り込む）.

**期待結果（Kết quả mong đợi）**

1. Có các phần tử như Source.
2. Không hiện vùng Điều kiện lọc（絞り込み条件）.
3. Hiện vùng lọc, thêm được điều kiện và câu 「※同じ種類の条件はいずれか1つ、種類が違う条件はすべて満たす生徒が対象となります。」 (cùng loại chỉ cần thỏa một điều kiện, khác loại phải thỏa tất cả).

**補足（Bổ sung）**

- Nguồn: Figma MW “màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình” (58:8930) (UI｜03A): breadcrumb (58:9033–9035), tiêu đề (58:9052), (58:9058) 設定名称, (58:9067–9079) 対象者 (đối tượng) 全員が対象 / 特定条件で絞り込む, (58:9083–9103) 絞り込み条件 + 絞り込み条件を追加 + 教科・科目を選択する, nút (58:9160) 戻る / (58:9163) 更新する; Figma MW (58:9156) (câu ghi chú bộ lọc mới; file cũ 4595:485 ghi 「※絞り込み条件を複数設定した場合、全ての条件を満たす生徒が対象となります。」 (nhiều điều kiện lọc thì phải thỏa tất cả)); Figma MW “chương 02 – điều kiện áp dụng và nguồn trung bình” (58:8754) 「（絞り込み欄は表示しない）」 (không hiện vùng lọc); [đặc tả v2](../specification.vi.md) (R18) mục 5.1 “Đối tượng áp dụng”
- Bằng chứng cần chụp: Ảnh bước 1–3.
- Sau khi chạy: Bấm Quay lại（戻る）.
- Ghi chú: Có đối tượng và bộ lọc như AutoRating là CONFIRMED (đặc tả v2 mục 5.1 “Đối tượng áp dụng”); danh sách loại bộ lọc cụ thể chưa chốt.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-009"></a>

### TC-RS-UI-009 — Khối điều kiện Trung bình（平均点） và nguồn tham chiếu, không có ô chọn "kết quả tổng hợp dùng để tham chiếu"

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 3 “Bản đồ màn hình và luồng thao tác”, mục 5.4 “Bộ thông tin nguồn”, mục 5.5 “Chọn bản nguồn”

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Màn Điều kiện áp dụng, Giới hạn bằng bộ lọc.
- Dữ liệu test: —

**操作（Thao tác）**

Thêm điều kiện Trung bình（平均点）, xem các ô.

**期待結果（Kết quả mong đợi）**

CONFIRMED: có ba ô nguồn (thời kỳ, thiết lập tổng hợp thứ hạng, nhóm tham chiếu); **không** có ô chọn kết quả tổng hợp cụ thể/bản chốt.

PROPOSED: câu mục tham chiếu, bố cục ô mốc + đơn vị 点 (điểm) + dấu.

**補足（Bổ sung）**

- Nguồn: Figma MW “màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình” (58:9113–9150) (平均点, 集計対象時期 (thời kỳ tổng hợp), 順位集計設定 (thiết lập tổng hợp xếp hạng), 集計対象（母集団） (nhóm tham chiếu), 「参照項目：評点　／　対象科目に対応する集計結果を使用」 (mục tham chiếu: điểm đánh giá / dùng kết quả tổng hợp ứng với môn), 平均点が [60] 点 [未満]); [đặc tả v2](../specification.vi.md) (R18) mục 3 “Bản đồ màn hình và luồng thao tác”, mục 5.4 “Bộ thông tin nguồn”, mục 5.5 “Chọn bản nguồn”
- Bằng chứng cần chụp: Ảnh khối điều kiện.
- Ghi chú: Dấu điều kiện: đề xuất thiết kế chờ review — đặc tả v2 mục 13.1.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-010"></a>

### TC-RS-UI-010 — Khối điều kiện Tỷ lệ điểm của nhóm（集団の得点率）

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 5.3 “Tỷ lệ nhóm — kế thừa kết quả tổng hợp thứ hạng hiện có”

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Màn Điều kiện áp dụng.
- Dữ liệu test: —

**操作（Thao tác）**

Thêm điều kiện Tỷ lệ điểm của nhóm（集団の得点率）.

**期待結果（Kết quả mong đợi）**

Có ba ô nguồn như UI-009, ô mốc với đơn vị %, dấu so sánh. Không có tùy chọn cách tính A/B (Q&A nghiệp vụ đã xác nhận câu “Tỷ lệ nhóm có cần xử lý riêng khi các lớp khác điểm tối đa không?” — CONFIRMED).

**補足（Bổ sung）**

- Nguồn: Figma MW “màn Điều kiện áp dụng – điều kiện tỷ lệ điểm của nhóm” (58:9164) (UI｜03B): (58:9347) 集団の得点率, (58:9354–9374) nguồn, (58:9376–9384) 「得点率が [65] % [以上]」; [đặc tả v2](../specification.vi.md) (R18) mục 5.3 “Tỷ lệ nhóm — kế thừa kết quả tổng hợp thứ hạng hiện có”
- Bằng chứng cần chụp: Ảnh khối điều kiện Tỷ lệ điểm của nhóm（集団の得点率）.
- Ghi chú: Không có tùy chọn A/B là CONFIRMED; phần còn lại PROPOSED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-011"></a>

### TC-RS-UI-011 — Màn Ngưỡng（基準設定）: ba loại, dấu so sánh và câu giải thích đổi theo dấu

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 6.1 “Thành phần chung của màn ngưỡng”

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mở ngưỡng của một quy tắc.
- Dữ liệu test: —

**操作（Thao tác）**

1. Xem ba lựa chọn loại.
2. Đổi Dấu so sánh（比較条件） giữa Nhỏ hơn（未満） và Nhỏ hơn hoặc bằng（以下）.

**期待結果（Kết quả mong đợi）**

1. Có Điểm cố định（固定点数）, Tỷ lệ điểm tối đa（得点率）, Công thức（計算式） (theo phạm vi phát hành — xem UI-025).
2. Câu giải thích dưới dấu đổi theo lựa chọn.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.1 “Thành phần chung của màn ngưỡng”; Figma MW “chương 03 – ngưỡng, công thức, trạng thái nhập” (58:7582–7591) (radio 固定点数 / 得点率 / 計算式), (58:7625–7630) (比較条件 以下, 「生徒の点数が基準点以下の場合に赤点とします。」), (58:7733–7738) (未満, 「…基準点未満の場合に赤点とします。」), nút 戻る / 更新する
- Bằng chứng cần chụp: Ảnh hai trạng thái dấu.
- Ghi chú: Ba loại và hai dấu là CONFIRMED (Q&A nghiệp vụ đã xác nhận câu “Những loại điểm nào thuộc đối tượng?”, câu “Điểm bằng ngưỡng có bị xét đỏ không?”); câu chữ PROPOSED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-012"></a>

### TC-RS-UI-012 — Mặc định khi tạo quy tắc mới

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 6.1 “Thành phần chung của màn ngưỡng”

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Thêm quy tắc mới, lưu điều kiện, mở ngưỡng.
- Dữ liệu test: —

**操作（Thao tác）**

Quan sát giá trị ban đầu.

**期待結果（Kết quả mong đợi）**

Loại = Điểm cố định（固定点数）; dấu = Nhỏ hơn（未満）; ô Điểm chuẩn（基準点） trống; tỷ lệ/công thức (nếu mở) mặc định Không xử lý phần lẻ（しない）.

Quy tắc mới được thêm ở cuối danh sách (PROPOSED).

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.1 “Thành phần chung của màn ngưỡng” ("Đề xuất mặc định khi tạo mới: mở loại cố định, dấu `<`, chưa nhập giá trị ngưỡng"); Figma MW “chương 03 – ngưỡng, công thức, trạng thái nhập” (58:7641–7738) (“chương 03, khung A – ngưỡng điểm cố định” (03-A) → 新規作成｜基準は未入力 (tạo mới, chưa nhập ngưỡng)); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) Chi tiết thiết kế (Thêm và đổi loại); [tài liệu chia công việc v2](../split-tasks.vi.md) (RSD-TASK) công việc “Thiết lập và lưu nhiều quy tắc” (Task 1)
- Bằng chứng cần chụp: Ảnh form quy tắc mới trước khi nhập; ảnh danh sách sau khi lưu (vị trí dòng mới).
- Ghi chú: Mặc định Không xử lý cho tỷ lệ là CONFIRMED (Q&A nghiệp vụ đã xác nhận câu “Tỷ lệ điểm tối đa có cho chọn xử lý phần lẻ không?”); phần còn lại PROPOSED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-013"></a>

### TC-RS-UI-013 — Ngưỡng cố định không hiển thị nguồn trung bình

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mở ngưỡng, chọn Điểm cố định（固定点数）.
- Dữ liệu test: —

**操作（Thao tác）**

Xem màn.

**期待結果（Kết quả mong đợi）**

CONFIRMED: không có khối Trung bình tham chiếu（参照する平均点）; lưu không yêu cầu chọn nguồn.

PROPOSED: ô Điểm chuẩn（基準点） + đơn vị 点 (điểm), câu 「30点未満を赤点とします。30点は赤点になりません。」 (dưới 30 là đỏ; 30 không đỏ) đổi theo giá trị/dấu, câu 「判定には登録済みの最終点数を使用します。」 (xét dùng điểm cuối đã đăng ký).

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 5.6 “Khi nào không cần nguồn?”; Figma MW “chương 03 – ngưỡng, công thức, trạng thái nhập” (58:7493) 「独立した固定条件には平均の参照欄を表示しない。」 (điều kiện cố định độc lập không hiện ô tham chiếu trung bình), “màn Ngưỡng – điểm cố định” (58:8022) (UI｜04A: 基準点 [30] 点, (58:8184), (58:8186))
- Bằng chứng cần chụp: Ảnh màn ngưỡng cố định trước và sau khi đổi giá trị/dấu.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-014"></a>

### TC-RS-UI-014 — Màn Tỷ lệ điểm tối đa（得点率）: mô tả M và xử lý phần lẻ

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”, mục 6.3 “Tỷ lệ điểm tối đa”, mục 6.5 “Xử lý phần lẻ”

<!-- Mã truy vết: TD-ITEM-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mở ngưỡng, chọn Tỷ lệ điểm tối đa（得点率）.
- Dữ liệu test: mục số nguyên (M=100)

**操作（Thao tác）**

1. Xem màn.
2. Chọn Có（する） ở Xử lý phần lẻ.

**期待結果（Kết quả mong đợi）**

Không có khối nguồn trung bình (đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”); Xử lý phần lẻ có Không（しない）/Có（する）, mặc định Không; khi Có thì hiện ô vị trí chữ số và phương thức.

Mô tả M theo Figma (PROPOSED): câu chung 「対象の授業・時期・単元に適用される満点を使用」 (dùng điểm tối đa áp dụng cho lớp/kỳ/đơn vị).

**補足（Bổ sung）**

- Nguồn: Figma MW “màn Ngưỡng – tỷ lệ điểm tối đa” (58:8194) (UI｜04B): (58:8338–8344) 得点率 [30] %, (58:8348–8351) 満点 「対象の授業・時期・単元に適用される満点を使用」 (dùng điểm tối đa áp dụng cho lớp/kỳ/đơn vị), (58:8355–8367) 端数処理 しない/する, (58:8379), (58:8381) 「平均点の参照設定は不要です。」 (không cần thiết lập tham chiếu trung bình); Figma MW “chương 03 – ngưỡng, công thức, trạng thái nhập” (58:7605–7622) (する: 小数第 [1] 位 [切り捨て]); [đặc tả v2](../specification.vi.md) (R18) mục 5.6 “Khi nào không cần nguồn?”, mục 6.3 “Tỷ lệ điểm tối đa”, mục 6.5 “Xử lý phần lẻ”
- Bằng chứng cần chụp: Ảnh hai trạng thái.
- Ghi chú: Khi đối tượng có nhiều M khác nhau, không có một giá trị M duy nhất để hiện — ghi cách màn hình thực tế hiển thị.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-015"></a>

### TC-RS-UI-015 — Màn Công thức: thứ tự khối nguồn trung bình và dòng công thức

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”, mục 6.4 “Công thức dùng trung bình”

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mở ngưỡng, chọn Công thức（計算式）.
- Dữ liệu test: —

**操作（Thao tác）**

Ghi lại thứ tự các khối từ trên xuống.

**期待結果（Kết quả mong đợi）**

Khối nguồn chỉ hiện với Công thức, không hiện với cố định/tỷ lệ (đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”).

Thứ tự khối theo Figma (PROPOSED): khối Trung bình tham chiếu（参照する平均点） nằm trước bảng dòng công thức và trước Xét điểm đỏ（赤点の判定）. Đặc tả v2 không quy định thứ tự; lệch thì ghi Notes, không FAIL.

**補足（Bổ sung）**

- Nguồn: Figma MW “màn Ngưỡng – công thức” (58:8389) (UI｜04C): (58:8533) 参照する平均点 nằm trước bảng dòng (58:8594), (58:8563) và trước (58:8566) 赤点の判定 (xét điểm đỏ); [đặc tả v2](../specification.vi.md) (R18) mục 5.6 “Khi nào không cần nguồn?”, mục 6.4 “Công thức dùng trung bình”
- Bằng chứng cần chụp: Ảnh toàn màn.
- Ghi chú: Thứ tự khối chỉ có trong Figma là PROPOSED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-016"></a>

### TC-RS-UI-016 — Bảng dòng công thức

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 6.4 “Công thức dùng trung bình”

<!-- Mã truy vết: TD-RULE-06 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Công thức.
- Dữ liệu test: quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8)

**操作（Thao tác）**

1. Nhập quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8).
2. Thêm/xóa dòng.

**期待結果（Kết quả mong đợi）**

Có đủ cột; chọn Kết quả phép tính（式の結果） thì hiện ô chọn dòng; mỗi dòng có Xử lý phần lẻ riêng; thêm/xóa dòng được; có câu dòng cuối là ngưỡng.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.4 “Công thức dùng trung bình”; Figma MW “màn Ngưỡng – công thức” (58:8594), (58:8563) (cột No / 左辺 (vế trái) / 演算子 (toán tử) / 右辺 (vế phải) / 端数処理 / 削除; 式1 平均点 ÷ 固定値 2; 式2 式の結果 [式1] × 固定値 0.8, 小数第1位 切り捨て; nút 計算式を追加 (thêm công thức)), (58:8581) 「最後の式の結果を基準点として使用します。」 (dùng kết quả dòng cuối làm điểm chuẩn); “chương 03 – ngưỡng, công thức, trạng thái nhập” (58:7899) (biến thể 「…赤点の基準点として…」)
- Bằng chứng cần chụp: Ảnh bảng công thức sau khi nhập quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8), sau khi thêm dòng và sau khi xóa dòng.
- Ghi chú: Câu chữ về dòng cuối trên Figma khác nhau giữa màn Ngưỡng – công thức và phần giải thích của chương 03 (ngưỡng, công thức, trạng thái nhập) — ghi nhận, không đánh giá câu chữ.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-017"></a>

### TC-RS-UI-017 — Thông báo lỗi vượt điểm tối đa và chia 0

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 8.4 “Lỗi kỹ thuật và thông báo”

<!-- Mã truy vết: TD-ITEM-01, CF-07, TC-RS-VAL-001, TC-RS-VAL-009 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100).
- Dữ liệu test: mục số nguyên (M=100); Cố định N=120; công thức `A ÷ 0`

**操作（Thao tác）**

1. Lưu N=120.
2. Lưu công thức chia 0.

**期待結果（Kết quả mong đợi）**

1. Không lưu được. Đầu vùng nhập có 「基準点が対象の満点を超えています。対象の満点以下の値を入力してください。」 (điểm chuẩn vượt điểm tối đa của đối tượng; hãy nhập giá trị không vượt điểm tối đa); tại ô Điểm chuẩn（基準点） có 「対象の満点（100点）以下の値を入力してください。」 và dòng 「対象の満点：100点」 (điểm tối đa của đối tượng: 100); giá trị 120 còn giữ.
2. Không lưu được. Đầu vùng nhập có 「式1：0で割ることはできません。右辺の値を変更してください。」 (dòng 1: không thể chia cho 0; đổi giá trị vế phải); tại dòng 1 có 「0で割ることはできません。右辺の値を変更してください。」; các giá trị đã nhập còn giữ.

**補足（Bổ sung）**

- Nguồn: Figma MW “chương 03 – ngưỡng, công thức, trạng thái nhập” (58:7909) (trạng thái vượt điểm tối đa: (58:7979), (58:8000), (58:8015)); Figma MW (58:7746) (trạng thái chia 0: (58:7816), (58:7907)); Figma MW (58:8712) (giữ giá trị đã nhập); [đặc tả v2](../specification.vi.md) (R18) mục 8.4 “Lỗi kỹ thuật và thông báo”; xung đột Figma–đặc tả về “Câu thông báo lỗi vượt điểm tối đa và chia 0” (CF-07)
- Bằng chứng cần chụp: Ảnh thông báo lỗi và ô/dòng bị đánh dấu cho từng bước, thấy giá trị đã nhập còn giữ.
- Ghi chú: File Figma cũ có hai biến thể câu chữ cho mỗi thông báo (vượt điểm tối đa và chia 0); file MW chỉ còn một bộ như trên nên case chuyển từ CONFLICT sang PROPOSED (câu chữ vẫn là thiết kế, chưa phải yêu cầu đã xác nhận). Khác câu chữ nhưng đúng ý nghĩa và vị trí: ghi Notes, không FAIL. Hành vi chặn lưu: case “Điểm cố định: biên −1 / 0 / 100 / 101 với M=100”, case “Chia cho số cố định 0 không lưu được”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-018"></a>

### TC-RS-UI-018 — Màn Tổng hợp thành tích（成績集計）: nút xanh/cam và lần chạy trước

Priority: TBD ｜ Status: IMPLEMENTED ｜ Requirement ID: đặc tả v2 mục 7.2 “Bảng sự kiện”

<!-- Mã truy vết: TD-ROLE-03, TC-RS-FUNC-021 -->

**前提条件（Điều kiện trước）**

- Điều kiện: tài khoản có quyền chạy hàng loạt; trường có tính tự động.
- Dữ liệu test: tài khoản có quyền chạy hàng loạt

**操作（Thao tác）**

Mở Tổng hợp thành tích（成績集計）.

**期待結果（Kết quả mong đợi）**

Mỗi khối có Thực hiện tổng hợp（集計実行） và Thực hiện tính toán tự động（自動算出実行） kèm thời điểm chạy trước, như màn hiện có.

**補足（Bổ sung）**

- Nguồn: Figma MW “màn Tổng hợp thành tích（成績集計） – nút xanh/cam, lần chạy trước” (58:7232) (UI｜06): cột (58:7356–7371) (学年, 集計対象時期, 集計者, 集計日時, 順位集計, 成績自動算出), nút (58:7392) 集計実行 / (58:7397) 自動算出実行, (58:7399) 「前回実行：…」 (lần chạy trước), (58:7458); [đặc tả v2](../specification.vi.md) (R18) mục 7.2 “Bảng sự kiện”
- Bằng chứng cần chụp: Ảnh từng khối có hai nút và thời điểm chạy trước.
- Ghi chú: Câu cuối trang của màn Tổng hợp thành tích（成績集計） trên Figma (nút xanh/cam, lần chạy trước) là PROPOSED. Nút cam với trường chỉ có quy tắc đỏ: case “Trường chỉ có quy tắc đỏ (không có tính tự động) vẫn có đường chạy hàng loạt” (cách hiển thị chưa chốt).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-019"></a>

### TC-RS-UI-019 — Thông báo kết quả sau khi chạy: hoàn tất, chưa xét được, thất bại một phần

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn” (AC-G26)

<!-- Mã truy vết: TC-RS-BR-010, TC-RS-ERR-003, TD-SRC-03, TC-RS-ERR-002 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Như case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác” (thiếu nguồn) và case “Batch hoàn tất một phần: báo đúng phạm vi đã/không cập nhật” (lỗi một phần).
- Dữ liệu test: nguồn chưa có kết quả tổng hợp

**操作（Thao tác）**

1. Chạy nút cam khi thiếu nguồn.
2. Chạy khi có lỗi một phần (theo cách giả lập được team dev cho phép).

**期待結果（Kết quả mong đợi）**

1. Thông báo hoàn tất nêu có mục chưa xét được, phạm vi và lý do, và kết quả trước không còn dùng.
2. Thông báo nêu phạm vi đã cập nhật / chưa cập nhật và hướng dẫn chạy lại; không báo hoàn tất toàn bộ.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 8.4 “Lỗi kỹ thuật và thông báo”; Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:7047–7060), (58:7062) (「対象：第2学年・1学期期末 ／ 数学・評点（参照する平均点が不足）」 (đối tượng… thiếu trung bình tham chiếu)); Figma MW (58:7465–7479) (「一部のデータを保存できませんでした。…」 (một phần dữ liệu không lưu được), 更新済みの範囲 / 更新できなかった範囲, 「…保存失敗を「判定完了」として扱いません。」 (không coi lưu thất bại là xét xong))
- Bằng chứng cần chụp: Ảnh thông báo sau mỗi lần chạy (toàn văn thông báo).
- Ghi chú: Nguyên tắc phân biệt thành công / thiếu dữ liệu / lỗi kỹ thuật là CONFIRMED (đặc tả v2 mục 8.4 “Lỗi kỹ thuật và thông báo”, kiểm ở case “Lỗi kỹ thuật khi lưu kết quả khác với Chưa xét được; không báo thành công giả”/003); câu chữ và bố cục là PROPOSED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-020"></a>

### TC-RS-UI-020 — Trích xuất: vị trí và nhãn tùy chọn đỏ

Priority: TBD ｜ Status: CONFLICT ｜ Requirement ID: đặc tả v2 mục 9.1 “Thiết lập”

<!-- Mã truy vết: TD-ROLE-07, TD-ITEM-01, TD-OUT-01, CF-03 -->

**前提条件（Điều kiện trước）**

- Điều kiện: tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm); mục số nguyên (M=100) có quy tắc.
- Dữ liệu test: mục số nguyên (M=100); cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu

**操作（Thao tác）**

1. Mở Trích xuất thành tích（成績抽出）→ Thiết lập mục hiển thị（表示項目設定）→ chi tiết mục Điểm đánh giá（評点） kỳ Cuối kỳ học kỳ 1（1学期期末）.
2. Ghi lại vị trí và nhãn các tùy chọn đỏ.

**期待結果（Kết quả mong đợi）**

Phần không tranh chấp: có bốn tùy chọn độc lập (lọc, ký hiệu trước, ký hiệu sau, tô màu); màu dùng bảng màu hiện có (đặc tả v2 mục 9.1 “Thiết lập”).

Phần tranh chấp (không đánh giá): tùy chọn nằm ở Thiết lập chi tiết thông tin lớp học（授業情報の詳細設定） với nhãn 抽出する / 強調記号を接頭に表示する / 強調記号を接尾に表示する / セルを色付けする (frame “tùy chọn đỏ ở Trích xuất thành tích (đặc tả v2: 05-A)”) hay ở màn điều kiện trích xuất với nhãn của frame “chương 05, khung A – thiết lập cách hiển thị/trích xuất”.

**補足（Bổ sung）**

- Nguồn: Figma MW “tùy chọn đỏ ở Trích xuất thành tích (đặc tả v2: 05-A)” (58:6359) (UI｜07A, (58:6491–6536), khớp bốn tùy chọn ở đặc tả v2 mục 9.1, nút 戻る / 更新する); Figma MW “chương 05, khung A – thiết lập cách hiển thị/trích xuất” (58:6321–6354) (05-A, màn 成績抽出 với 赤点の設定: 「赤点のある生徒を抽出する」 (trích xuất học sinh có điểm đỏ), 「前に記号を付ける」 (gắn ký hiệu phía trước), 「後ろに記号を付ける」, 「セルに色を付ける」, nút 戻る / 抽出する); xung đột giữa các frame Figma về “Nhãn và vị trí tùy chọn đỏ ở Trích xuất thành tích（成績抽出）” (CF-03); [đặc tả v2](../specification.vi.md) (R18) mục 9.1 “Thiết lập”
- Bằng chứng cần chụp: Ảnh màn.
- Ghi chú: Đặc tả v2 mục 9.1 nêu bốn tùy chọn nhưng không chốt nhãn tiếng Nhật và vị trí; hai frame Figma khác nhau.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-021"></a>

### TC-RS-UI-021 — Trích xuất: kết quả 0 học sinh và hiển thị ô đỏ số thập phân

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: tiêu chí nghiệm thu “Lọc khi trích xuất” (AC-G29)

<!-- Mã truy vết: TD-OUT-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu.
- Dữ liệu test: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu; (a) Không ô đỏ nào; (b) học sinh điểm 23.9 Đỏ (mục thập phân)

**操作（Thao tác）**

Chạy trích xuất cho (a), (b).

**期待結果（Kết quả mong đợi）**

(a) Không lỗi; hiện thông báo không có học sinh khớp.

(b) Ô hiện `*23.9` (giữ nguyên giá trị điểm).

**補足（Bổ sung）**

- Nguồn: Figma MW “chương 05 – trích xuất thành tích và kết quả Excel” (58:6247) 「0件は正常。未判定を非赤点／合格と数えない。」 (0 kết quả là bình thường; không tính chưa xét được là không đỏ/đạt), “chương 05, khung A – thiết lập cách hiển thị/trích xuất” (58:6354) 「条件に一致する生徒はいません。」 (không có học sinh khớp điều kiện); Figma MW “kết quả Trích xuất thành tích (đặc tả v2: 05-B)” (58:6779) `*29`, (58:6803) `*23.9`
- Bằng chứng cần chụp: Ảnh kết quả trích xuất (a) và ô S=23.9 ở (b).
- Ghi chú: 0 kết quả không phải lỗi và không tính chưa xét được là không đỏ: nguyên tắc CONFIRMED (đặc tả v2 mục 8.1 “Các trạng thái phải phân biệt”, mục 9.2 “Kết quả và ví dụ”); câu chữ PROPOSED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-022"></a>

### TC-RS-UI-022 — Công khai: dòng cách hiển thị đỏ theo mục có thiết lập, kể cả khi 0 học sinh đỏ hoặc vừa xóa thiết lập cuối

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Cấu hình công khai và ẩn điểm” (AC-G32)

<!-- Mã truy vết: TD-ITEM-01, TD-ROLE-07, TD-RULE-01, TC-RS-BR-019 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có quy tắc nhưng không ô nào đỏ; mục Tri thức – kỹ năng（知識・技能） chưa từng có quy tắc và chưa từng đặt cách hiển thị đỏ. tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm).
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

1. Mở Thiết lập công khai thành tích（成績公開設定）→ khung Thành tích（成績）.
2. Ở dòng của Điểm đánh giá（評点）, chọn `*` phía trước, bấm Đăng ký（登録する）.
3. Xóa quy tắc cuối của mục số nguyên (M=100) (chỉ còn quy tắc “Cố định 30” (dưới 30) thì xóa quy tắc “Cố định 30” (dưới 30)), **không** chạy lại; mở lại khung Thành tích（成績）.

**期待結果（Kết quả mong đợi）**

1. Mục Điểm đánh giá（評点） có dòng cách hiển thị đỏ dù 0 học sinh đỏ; mục Tri thức – kỹ năng（知識・技能） không có dòng.
2. Lưu được; mở lại vẫn là `*` phía trước.
3. Dòng của Điểm đánh giá（評点） vẫn hiện với lựa chọn `*` phía trước đã lưu; cấu hình trình bày không bị xóa theo thao tác xóa quy tắc.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 10.1 “Phạm vi và tùy chọn” (không dùng phép kiểm "còn rule không?" để bỏ ngay dấu đã cấu hình; không xóa cấu hình trình bày đã lưu khi xóa quy tắc); Figma MW “tùy chọn đỏ ở Công khai thành tích (đặc tả v2: 06-A)” (58:5622) (UI｜07B: (58:5783–5785) 「［赤点］判定時に評価項目の値を [前に「*」付きで表示する]」); Figma MW “chương 06 – công khai thành tích và màn học sinh” (58:5592) 「設定がある項目、または最後の設定削除後で再実行前の項目に表示方法の行を出す。赤点0人・未判定でも行は出る。」 (mục có thiết lập, hoặc mục vừa xóa thiết lập cuối mà chưa chạy lại, thì hiện dòng; 0 học sinh đỏ/chưa xét cũng hiện), “chương 06 – dòng Cách hiển thị điểm đỏ（赤点の表示方法）có/không hiện” (58:5611–5621) (B: 「一度も表示方法を設定していない」 (chưa từng đặt cách hiển thị) thì không hiện dòng; 「最後の設定削除直後は行を残す。保存済みの表示方法は消さない。」 (ngay sau khi xóa thiết lập cuối vẫn giữ dòng, không xóa cách hiển thị đã lưu))
- Bằng chứng cần chụp: Ảnh khung Thành tích（成績） có cả hai mục (bước 1); ảnh sau khi mở lại ở bước 2 và bước 3.
- Sau khi chạy: Tạo lại quy tắc “Cố định 30” (dưới 30) cho mục số nguyên (M=100) nếu case sau cần.
- Ghi chú: Hiện dòng theo mục có thiết lập và giữ cấu hình trình bày đã lưu khi xóa quy tắc là CONFIRMED (đặc tả v2 mục 10.1 “Phạm vi và tùy chọn”). Việc dòng vẫn hiện sau khi xóa thiết lập cuối và trước khi chạy lại theo Figma MW; nếu build ẩn dòng nhưng vẫn giữ giá trị đã lưu và dấu trên màn học sinh thì ghi Notes, không FAIL. Dấu trên màn học sinh sau khi xóa quy tắc cuối: case “Xóa quy tắc cuối: giữ kết quả tới lần chạy lại; chạy lại → Không áp dụng”. Nhãn dòng là PROPOSED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-023"></a>

### TC-RS-UI-023 — Công khai: danh sách tùy chọn hiển thị đỏ

Priority: TBD ｜ Status: CONFLICT ｜ Requirement ID: đặc tả v2 mục 10.1 “Phạm vi và tùy chọn”

<!-- Mã truy vết: CF-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Như UI-022.
- Dữ liệu test: —

**操作（Thao tác）**

Mở danh sách chọn của dòng đỏ.

**期待結果（Kết quả mong đợi）**

Phần không tranh chấp: có Kèm ngoặc, `*` phía trước, `*` phía sau; không có ô chữ tự do; không có màu nền (đặc tả v2 mục 10.1 “Phạm vi và tùy chọn”).

Phần tranh chấp (không đánh giá): có hay không tùy chọn Nguyên trạng（原状）.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?” (Q16): 括弧つき (có ngoặc) / 前に「*」 / 後ろに「*」; Figma MW “chương 06 – công khai thành tích và màn học sinh” (58:5591) 「原状／括弧／固定*の前後。自由文字・赤点専用背景色は追加しない。」 (nguyên trạng / ngoặc / `*` cố định trước-sau; không thêm chữ tự do và màu nền riêng); xung đột Figma–đặc tả về “Tùy chọn hiển thị đỏ ở Công khai thành tích（成績公開）” (CF-01); [đặc tả v2](../specification.vi.md) (R18) mục 10.1 “Phạm vi và tùy chọn”
- Bằng chứng cần chụp: Ảnh danh sách chọn.
- Ghi chú: Có cần thêm Nguyên trạng（そのまま表示） cho dòng đỏ hay không chưa chốt.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-024"></a>

### TC-RS-UI-024 — Phiếu điểm: hộp Thiết lập hiển thị tùy chọn mục đăng ký điểm（成績登録項目オプション表示設定）

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Tùy chọn trên phiếu” (AC-G35)

<!-- Mã truy vết: TD-ROLE-07, TD-OUT-04 -->

**前提条件（Điều kiện trước）**

- Điều kiện: tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm); mẫu phiếu có ô Điểm đánh giá（評点）.
- Dữ liệu test: cấu hình phiếu điểm: ký tự “※” phía trước

**操作（Thao tác）**

1. Mở hộp tùy chọn của ô, chọn Thiết lập（設定する）.
2. Ghi lại thứ tự dòng và các lựa chọn của dòng Thiết lập điểm đỏ（赤点設定）.

**期待結果（Kết quả mong đợi）**

CONFIRMED: dòng đỏ nằm sau các dòng checkbox và trước Trường hợp ô trống（空欄の場合）; lựa chọn của dòng đỏ là Nguyên trạng（そのまま表示）, Kèm ngoặc（カッコ付き）, Ký tự phía trước（前に任意の文字）, Ký tự phía sau（後ろに任意の文字）; không có Ẩn（表示しない）/Gạch chéo（斜線）.

PROPOSED: nhãn dòng 「赤点設定」 (thiết lập điểm đỏ) và câu ghi chú.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Điều kiện điểm đỏ nằm ở đâu trên phiếu điểm?” (Q29); Figma MW “tùy chọn đỏ ở Công cụ phiếu điểm (đặc tả v2: 07-A)” (58:5176) (UI｜07C): (58:5386) 「※上から最初に一致した条件の表示方法を使用します。非表示・斜線の設定は維持します。」, dòng (58:5401) 特定の科目の場合 → (58:5418) [見込点]チェック → [未受験]チェック → (58:5434) 赤点設定 → (58:5464) 空欄の場合, (58:5474); Figma MW “chương 07 – phiếu điểm PDF” (58:5175)
- Bằng chứng cần chụp: Ảnh hộp.
- Ghi chú: Trong dữ liệu text Figma có lớp chồng hiển thị [未受験] sau 赤点設定; hiển thị của frame “tùy chọn đỏ ở Công cụ phiếu điểm (đặc tả v2: 07-A)” xác nhận thứ tự nhìn thấy khớp Q&A nghiệp vụ đã xác nhận câu “Điều kiện điểm đỏ nằm ở đâu trên phiếu điểm?”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-026"></a>

### TC-RS-UI-026 — Bộ chọn hiệu ứng đỏ của điểm thường và điểm đơn vị hiển thị độc lập

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Cấu hình công khai và ẩn điểm” (AC-G32)

<!-- Mã truy vết: Q38, AC-G32 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Có một cấu hình công khai chứa cả mục điểm thường và mục điểm đơn vị; tài khoản có quyền sửa cấu hình công khai.
- Dữ liệu test: mục thường và mục đơn vị cùng có kết quả đỏ; lựa chọn hiển thị khác nhau cho hai loại.

**操作（Thao tác）**

1. Mở màn hình cấu hình công khai và đến khu vực hiển thị điểm đỏ.
2. Kiểm tra panel điểm thường và panel điểm đơn vị.
3. Chọn hiệu ứng khác nhau cho hai panel, lưu, đóng và mở lại.

**期待結果（Kết quả mong đợi）**

1. Cả hai panel đều hiển thị bộ chọn tương ứng; panel điểm đơn vị không bị nền hoặc lớp khác che.
2. Có thể thao tác hai bộ chọn độc lập.
3. Sau khi mở lại, mỗi panel giữ đúng lựa chọn của mình; lựa chọn điểm thường không ghi đè lựa chọn điểm đơn vị và ngược lại.

**補足（Bổ sung）**

- Nguồn: [xác nhận thiết kế ngày 30/09](../../../sources/2026-09-30-design-review-confirmation.vi.md) (Q38: hai phía thường/đơn vị phải hiển thị và kiểm được lựa chọn độc lập); [đặc tả v2](../specification.vi.md) (R18) mục 10.1; [checklist cập nhật Figma](../figma-update-checklist.vi.md) mục 5.
- Bằng chứng cần chụp: Ảnh trước khi thao tác; ảnh từng panel sau khi chọn; ảnh mở lại sau khi lưu.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-025"></a>

### TC-RS-UI-025 — Loại ngưỡng/điều kiện chưa thuộc phạm vi phát hành không hiện như đang hoạt động

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Phạm vi từng đợt” (AC-G40)

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Có danh sách phạm vi phát hành (đặc tả v2 mục 1.4, mục 13.1).
- Dữ liệu test: —

**操作（Thao tác）**

1. Mở màn Điều kiện áp dụng（適用条件設定）, xem các loại điều kiện.
2. Mở màn Ngưỡng đỏ（赤点の基準）, xem các loại ngưỡng.
3. Với loại không có trong danh sách phát hành (ví dụ Công thức（計算式）, điều kiện Trung bình（平均点））: nếu chọn được thì thử Lưu.

**期待結果（Kết quả mong đợi）**

Loại ngoài phạm vi không hiện như lựa chọn dùng được; không lưu được cấu hình dùng loại đó.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 1.4 “Ranh giới giữa thiết kế đầy đủ và phạm vi triển khai”
- Bằng chứng cần chụp: Ảnh màn.
- Ghi chú: BLOCKED cho tới khi có danh sách phạm vi phát hành (đặc tả v2 mục 13.1). Các case của loại không được chọn: SKIPPED ([tài liệu “Chiến lược kiểm thử”](01-test-strategy.vi.md) mục 1 “Phạm vi”).

**結果（Kết quả）**

**証跡（Bằng chứng）**
