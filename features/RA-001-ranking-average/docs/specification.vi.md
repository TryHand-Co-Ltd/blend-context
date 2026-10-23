# Đặc tả RA-001 — Trung bình tổng hợp thứ hạng（順位集計の平均点）

**Ngày cập nhật:** 14/10/2026 (cách chọn bản và mẫu số theo điểm liệt, mục 8.2–8.3).

**Đối tượng đọc:** thành viên phát triển, thiết kế, kiểm thử và người phụ trách nghiệp vụ BLEND.

**Phạm vi tài liệu:** dùng điểm trung bình của tổng hợp thứ hạng trong tính điểm tự động. Tài liệu này đủ để triển khai: quy tắc, màn hình, dữ liệu, thời điểm ghi điểm và tiêu chí nghiệm thu.

**Trạng thái:** khách đã xác nhận Q1, Q3–Q7 ngày 12/10/2026 và Q2 ngày 19/10/2026 (chỉ dùng bản đã chốt, mục 8.2). Chức năng từng **tạm dừng** theo chỉ đạo của shite ngày 19/10 và được **làm tiếp từ 22/10** (làm nốt phần còn lại để sau đó hỗ trợ 見込み点). Code đã đổi sang "chỉ bản đã chốt" (nhánh `feature/RA-001_ranking_average`, chưa commit tại 23/10).

Nhãn dùng trong tài liệu:

- **Đã xác nhận Qn:** khách đã trả lời.
- **Hiện trạng:** hành vi sản phẩm đang chạy, đọc từ code ([research](../research/current-auto-rating-behavior.vi.md)). RA-001 giữ nguyên.
- **Quyết định nội bộ:** không cần hỏi khách, team chốt để triển khai.

**Thiết kế giao diện:** [Figma RA-001](https://www.figma.com/design/OkFTBuOyoF2hNnxCFy4Uds/), version "RA-001 v9 – cân bố cục, ghi chú cho khách". Đối chiếu từng màn ở [đặc tả màn hình](screen-definition.vi.md), mục 08.

Work item: Implement Ranking Average in Automatic Grade Calculation and Apply It to Conditions, Formulas, and Grade Registration.

## Mục lục

1. [Mục tiêu và phạm vi](#scope)
2. [Ví dụ điểm dự kiến](#example)
3. [Luồng màn hình](#screens)
4. [Danh sách thiết lập và thứ tự](#list)
5. [Điều kiện lọc theo điểm trung bình](#condition)
6. [Công thức dùng trung bình môn](#formula)
7. [Ánh xạ theo khung](#mapping)
8. [Số trung bình đưa vào tính](#source)
9. [Thời điểm tính và ghi điểm](#timing)
10. [Khi không tính được](#empty)
11. [Nhóm được chọn](#population)
12. [Ranh giới với điểm liệt](#red-score)
13. [Dữ liệu](#data)
14. [Tiêu chí nghiệm thu](#ac)
15. [Ngoài phạm vi và việc còn mở](#out)

<a id="scope"></a>

## 1. Mục tiêu và phạm vi

Người cấu hình cột điểm chọn điểm trung bình đã được tổng hợp thứ hạng tính ra, rồi dùng số đó để chọn công thức và để tính điểm ghi vào cột.

| Hạng mục | Nội dung |
| --- | --- |
| Màn danh sách | **自動計算設定** (thiết lập tính điểm tự động) của một cột điểm. Giữ nguyên năm cột hiện có |
| Chọn ai được tính | **計算対象設定** (thiết lập đối tượng được tính): thêm loại điều kiện **平均点** (điểm trung bình) |
| Cách ghi điểm | **登録方法設定** (thiết lập cách đăng ký): vế trái và vế phải của công thức chọn được **科目平均** (trung bình môn). Áp dụng cho **計算結果を登録する** (đăng ký kết quả tính) và cho công thức dưới **マッピングした結果を登録する** (đăng ký kết quả đã so và chọn) khi giá trị gốc là kết quả tính |
| Kết quả | Ghi vào cột đang tính khi chạy tính điểm tự động |
| Trường | Mọi trường. Hiện **科目平均** chỉ có ở **上宮高等学校** (trường cấp 3 Uenomiya) và **上宮学園中学校** (trường cấp 2 Uenomiya) |
| Quyền | Quyết định nội bộ: giữ quyền của màn tính điểm tự động hiện có. Không thêm quyền mới |

Không thêm radio đăng ký mới. Không thêm ô chọn môn. Trung bình luôn là trung bình môn của tiết học đang cấu hình. Không thêm **科目平均** vào ô **[基準値]** (giá trị gốc) của ánh xạ (đã xác nhận Q1).

<a id="example"></a>

## 2. Ví dụ điểm dự kiến

| Số | Vai trò |
| --- | --- |
| 60 | Điểm của học sinh ở cột được chọn trong công thức, ví dụ **素点** (điểm thô) |
| 50 | Trung bình nhóm ở bài học sinh đã thi |
| 70 | Trung bình nhóm ở bài học sinh nghỉ |
| 84 | Kết quả 60 × 70 ÷ 50, ghi vào cột đang tính |
| 75 | Điểm đang có ở cột đích, ví dụ **1学期期末 評点** (điểm đánh giá cuối học kỳ 1). Không đưa vào phép tính |

Khi đã có 70 và 50, chạy **自動算出実行** (chạy tính điểm tự động) thì 84 ghi đè 75. Khi chưa có 70 hoặc 50, công thức không ra số, cột ghi trống và 75 bị xóa (đã xác nhận Q4, mục 10).

<a id="screens"></a>

## 3. Luồng màn hình

**成績帳票設定** (thiết lập phiếu điểm) → **成績設定** (thiết lập điểm) → **成績入力設定** (thiết lập nhập điểm) → **自動計算設定** (thiết lập tính điểm tự động).

Từ một dòng thiết lập:

- [編集] ở cột **自動計算の対象者** (học sinh được tính tự động) mở **計算対象設定** (thiết lập đối tượng được tính): dòng này áp dụng cho học sinh nào.
- [編集] ở cột cách đăng ký mở **登録方法設定** (thiết lập cách đăng ký): công thức hoặc khung ánh xạ của dòng đó.

Chi tiết từng thành phần nằm ở [đặc tả màn hình](screen-definition.vi.md).

<a id="list"></a>

## 4. Danh sách thiết lập và thứ tự

Một cột điểm có nhiều dòng thiết lập. Hệ thống xét từ trên xuống và dùng dòng khớp đầu tiên (hiện trạng).

- Dòng đã khớp thì không xét dòng bên dưới, kể cả khi công thức của dòng đó không ra số. Khi đó cột ghi trống (mục 10).
- **全員が対象** (mọi học sinh đều là đối tượng) đặt trên cùng thì mọi học sinh khớp dòng đó và các dòng bên dưới không chạy.
- Hai nhánh của yêu cầu là hai dòng: một dòng **50 以上** (từ 50 trở lên) gắn công thức A, một dòng **50 より小さい** (nhỏ hơn 50) gắn công thức B. Đúng 50 thuộc dòng từ 50 trở lên.
- Học sinh không khớp dòng nào thì cột đích ghi trống và điểm đang có bị xóa (hiện trạng, giữ nguyên).

Cột **自動計算の対象者** hiện điều kiện trung bình dạng `平均点 評点集計 1学期期末/学年平均 50点以上`: nhãn **平均点**, tên thiết lập thứ hạng, `kỳ/nhóm`, rồi mốc + `点` + dấu (`以上`, `より大きい`, `と等しい`, `より小さい`, `以下`). Hai mốc trên một dòng hiển thị hai điều kiện, nối bằng chữ nối đang dùng giữa các điều kiện của danh sách.

Dưới danh sách thêm hai dòng chú thích (quyết định nội bộ, đã vẽ ở Figma màn 01):

- `※上から順に判定し、最初に条件に一致した設定のみを適用します。`
- `※「全員が対象」を最上位にすると、下の平均点条件は適用されません。`

Lưu, mở lại, đổi thứ tự bằng nút ▲▼, thêm và xóa dòng giữ cách làm của danh sách hiện có. Lưu thiết lập không tự tính lại điểm học sinh.

<a id="condition"></a>

## 5. Điều kiện lọc theo điểm trung bình

### 5.1. Thành phần

Trong dropdown loại lọc của **計算対象設定**, thêm một nhóm mới ở cuối danh sách: `----集計条件で絞り込む----` (nhãn nhóm, không chọn được), dưới đó là mục **平均点**. Các nhóm và loại lọc cũ giữ nguyên.

Một dòng điều kiện trung bình gồm, theo thứ tự trên màn:

| Ô | Nội dung | Bắt buộc |
| --- | --- | --- |
| Thiết lập thứ hạng | Tên **順位集計設定** (thiết lập tổng hợp thứ hạng) của năm học. Mục đầu `選択してください` | Có |
| Kỳ/nhóm | Một dropdown dạng `1学期期末/学年平均`: kỳ tổng hợp và nhóm (mục 11). Mục đầu `選択してください` | Có |
| Mốc | Ô số | Có |
| Dấu | **以上** (từ … trở lên), **より大きい** (lớn hơn), **等しい** (bằng), **より小さい** (nhỏ hơn), **以下** (từ … trở xuống) | Có |
| Xóa | Nút xóa dòng điều kiện như các loại lọc hiện có | — |

Không dùng **未満** (dưới). Nhánh "dưới 50" của yêu cầu là **50 より小さい** (nhỏ hơn 50).

| Dấu | Mốc 50, trung bình 49,9 | 50 | 50,1 |
| --- | --- | --- | --- |
| **以上** | không khớp | khớp | khớp |
| **より大きい** | không khớp | không khớp | khớp |
| **等しい** | không khớp | khớp | không khớp |
| **より小さい** | khớp | không khớp | không khớp |
| **以下** | khớp | khớp | không khớp |

Số đem so là trung bình môn của tiết đang cấu hình, theo đúng thiết lập, kỳ và nhóm đã chọn (mục 8). Học sinh không có điểm cá nhân ở kỳ đó vẫn được so bằng trung bình của nhóm mình.

### 5.2. Kết hợp điều kiện — đã xác nhận Q6

Một dòng thiết lập được có nhiều điều kiện trung bình. Các điều kiện trên cùng một dòng, cả điều kiện trung bình và điều kiện lọc khác, phải đúng cùng lúc (AND), giống xét điểm liệt (điểm đỏ Q35).

Ví dụ khoảng: dòng điều kiện 1 **50 より大きい**, dòng điều kiện 2 **80 より小さい**, cùng nguồn. Trung bình 50 và 80 không khớp; 50,1 và 79,9 khớp.

Dữ liệu cũ có dòng lưu cách nối OR (hiện trạng: form ẩn lựa chọn và mặc định AND). Quyết định nội bộ: điều kiện trung bình nối theo cách nối đang lưu của dòng; không tự đổi dòng cũ. Trước khi phát hành, đếm số dòng OR còn trong dữ liệu và báo người phụ trách nếu có.

### 5.3. Khi không lấy được điểm trung bình — đã xác nhận Q7

Điều kiện trung bình không có số để so khi: chưa chạy tổng hợp; nhóm của học sinh không có kết quả ở kỳ đã chọn; học sinh không thuộc nhóm đã chọn; hoặc tham chiếu (thiết lập, kỳ, nhóm) không còn tồn tại.

Quy tắc giống các điều kiện lọc hiện có của tính điểm tự động: điều kiện đó coi là **không khớp**, hệ thống xét dòng bên dưới. Không khớp dòng nào thì cột đích ghi trống. Không thay số thiếu bằng 0, không tự đổi sang nguồn khác.

Ví dụ: dòng 1 **50 以上** → công thức A; dòng 2 **50 より小さい** → công thức B; dòng 3 **全員が対象** → công thức C. Lớp của học sinh chưa có trung bình:

- Dòng 1 và dòng 2 không khớp. Học sinh nhận công thức C ở dòng 3.
- Nếu không có dòng 3, cột đích ghi trống và 75 bị xóa.
- Muốn tránh, nhà trường chạy **集計実行** (chạy tổng hợp) trước rồi mới chạy tính điểm tự động.

Điểm này khác điểm đỏ: điểm đỏ không chuyển xuống thiết lập ưu tiên thấp hơn khi thiếu trung bình (điểm đỏ Q26). Tính điểm tự động theo hiện trạng của chính nó, như khách yêu cầu ngày 12/10.

### 5.4. Kiểm tra khi lưu — quyết định nội bộ

- Thiết lập thứ hạng, kỳ/nhóm, mốc và dấu đều bắt buộc. Thiếu ô nào thì báo lỗi tại dòng đó, không lưu.
- Mốc là số từ 0 trở lên, cho phép số thập phân (trung bình có thể lẻ, ví dụ 37,5). Không chặn mốc theo điểm tối đa.
- Không kiểm hai mốc mâu thuẫn (ví dụ lớn hơn 80 và nhỏ hơn 50). Dòng như vậy không bao giờ khớp, giống các điều kiện lọc hiện có.
- Mở lại form phải hiện đúng lựa chọn đã lưu. Tham chiếu không còn khớp (đổi tên hoặc xóa) thì ô hiện `選択してください` kèm cảnh báo; phải chọn lại mới lưu được.

<a id="formula"></a>

## 6. Công thức dùng trung bình môn

Ở **計算結果を登録する** (đăng ký kết quả tính), dropdown loại giá trị của vế trái và vế phải có thêm **科目平均** (trung bình môn) tại mọi trường. Danh sách loại giá trị:

| Loại | Điều kiện hiện |
| --- | --- |
| **成績登録項目** (cột điểm) | Luôn có |
| **固定値** (số cố định) | Luôn có |
| **式の結果** (kết quả dòng trước) | Không chọn được ở dòng công thức 1. Dòng sau chỉ tham chiếu dòng phía trên |
| **授業設定** (thiết lập tiết học) | Khi cột có thiết lập tương ứng (hiện trạng) |
| **科目平均** (trung bình môn) | Mọi trường (mới mở rộng) |

Chọn **科目平均** thì vế đó hiện hai dropdown: tên thiết lập thứ hạng, rồi kỳ/nhóm dạng `1学期期末/学年平均` (nhóm theo mục 11). Chọn loại khác thì ẩn hai dropdown này. Mỗi vế chọn độc lập.

- Phép tính của một dòng là cộng, trừ, nhân hoặc chia.
- Kỳ của bài đã thi và kỳ của bài nghỉ là hai dòng công thức. Ví dụ dòng 1: `科目平均 1学期期末 × 素点`; dòng 2: `式1の計算結果 ÷ 科目平均 1学期中間`.
- **端数処理** (xử lý phần lẻ) của từng dòng giữ như hiện tại: **しない** (không làm tròn) hoặc **する** (có làm tròn), khi làm tròn thì chọn chữ số thập phân và cách làm tròn (**四捨五入**, **切り上げ**, **切り捨て**). Đây là bước riêng sau khi đọc trung bình chưa làm tròn (mục 8.3).
- Hệ số theo lý do vắng (ví dụ × 0,8) do trường tự cấu hình bằng dòng công thức. Không có hệ số cố định trong sản phẩm.
- Không có ô chọn môn. Môn là môn của tiết đang tính.

Lưu công thức phải giữ đủ lựa chọn trung bình môn ở mọi trường. Hiện trạng: trường ngoài hai trường Uenomiya không thấy lựa chọn này, và khi lưu thì các key `calc_conf_name`, `sub_subject_avg` bị bỏ (`AutoRatingConfController::registFormula`). RA-001 bỏ cả hai chặn.

<a id="mapping"></a>

## 7. Ánh xạ theo khung — đã xác nhận Q1

**マッピングした結果を登録する** so một giá trị với các khung và ghi **登録する値** (giá trị sẽ ghi) của khung khớp đầu tiên (hiện trạng).

- Ô **[基準値]** (giá trị gốc) giữ hai loại hiện có: **計算結果** (kết quả tính) và cột điểm. **Không** thêm **科目平均** (đã xác nhận Q1).
- Muốn dùng trung bình trong ánh xạ: chọn **計算結果**, rồi dùng **科目平均** ở vế trái/phải của bảng công thức hiện ra bên dưới (mục 6). Kết quả được tính riêng cho từng học sinh rồi mới so khung.
- Khung, **[比較値]** (giá trị so sánh: **手入力** hoặc **授業設定**), **[比較条件]**, **枠を追加** (thêm khung) và nút xóa khung giữ nguyên.
- Kết quả tính không ra số, hoặc không khớp khung nào: ghi trống (hiện trạng, đã xác nhận Q4).

Ví dụ: khung 1 từ 80 trở lên ghi 5, khung 2 từ 50 trở lên ghi 4. Kết quả 80 khớp cả hai nhưng lấy khung 1. Kết quả 50 ghi 4. Kết quả 40 ghi trống.

<a id="source"></a>

## 8. Số trung bình đưa vào tính

Số trung bình lấy từ kết quả tổng hợp thứ hạng của đúng thiết lập, kỳ, nhóm và môn của tiết đang tính. Điều kiện lọc (mục 5) và vế công thức (mục 6) dùng chung một cách đọc số.

### 8.1. Nguồn đọc — quyết định nội bộ

Dùng chung bộ đọc nguồn với xét điểm liệt ([PR 57572](https://github.com/ednity/school-web/pull/57572): `getRedScoreSourceMetric` của `GradeCalcResultEachSubSubjectLogs_m` / `GradeCalcResultEachGroupLogs_m`), để hai chức năng luôn đọc cùng một số cho cùng nguồn. Nhóm **授業** (tiết học) đọc bảng kết quả theo tiết học; các nhóm khác đọc bảng kết quả theo môn.

Nhóm **授業**, nhóm thứ hạng（順位集計グループ）và nhóm kết hợp（組合わせグループ）: kết quả được ghi riêng cho từng khối, và nhóm thứ hạng có thể chứa học sinh nhiều khối. RA-001 đọc thêm điều kiện khối của học sinh để không lấy nhầm số của khối khác. Cách chọn bản và mẫu số vẫn dùng chung với điểm liệt (mục 8.2, 8.3).

So sánh với mốc dùng số thập phân chính xác (bcmath) như điểm liệt, nên trung bình đúng bằng mốc (ví dụ 3,3 ÷ 3 = 1,1) được coi là bằng mốc.

Kỳ **単元** (kiểm tra theo đơn vị): chỉ khi kỳ/nhóm được chọn là kỳ 単元 thì mới đọc trung bình của đúng đơn vị đang tính. Khi tính cột của kỳ 単元 mà chọn kỳ thường (ví dụ **1学期期末**), hệ thống đọc trung bình của kỳ thường đó như các cột khác. Nhóm `授業平均` không có trung bình theo đơn vị, nên chọn kỳ 単元 thì coi như thiếu trung bình.

### 8.2. Bản đã chốt hay số vừa chạy — đã xác nhận Q2

Ngày 19/10/2026 shite xác nhận ([thread Slack](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1792383099678219)): **chỉ dùng kết quả tổng hợp thứ hạng đã chốt và còn hiệu lực**. Số tổng hợp mới nhất chưa chốt **không** được dùng thay thế. Chính sách này áp dụng thống nhất cho xét điểm liệt, tính điểm tự động (RA-001) và bảng ánh xạ theo khoảng điểm trung bình. Q2 là spec chung với xét điểm liệt, ghi ở **成績シート** (bảng thành tích) No.1.

"Đã chốt" xét theo phạm vi trường, năm, khối, kỳ và phân kỳ:

| Phạm vi của nguồn | Số dùng |
| --- | --- |
| Có bản chốt có hiệu lực, có đủ nhóm cần đọc | Dùng bản chốt |
| Có bản chốt nhưng thiếu nhóm cần đọc (ví dụ chỉ chốt toàn khối, thiếu lớp) | Coi như không có trung bình, **không** lấy số mới nhất |
| Chưa chốt, hoặc bản chốt đã bị hủy | Coi như không có trung bình, **không** lấy số mới nhất |

Khi không có trung bình, xử lý như đã chốt ở mục 5.3 và mục 10: điều kiện trung bình thiếu số thì không khớp, xét dòng dưới; công thức không tính được thì ghi trống vào cột đích, không giữ kết quả cũ.

Dropdown **順位集計設定** (thiết lập tổng hợp thứ hạng) ở điều kiện và công thức hiện **mọi thiết lập đã tạo**, bất kể đã chốt hay chưa. Trạng thái chốt chỉ ảnh hưởng số được đọc khi tính.

Quy tắc chọn bản nằm ở một chỗ trong bộ đọc chung, dùng cho cả điểm liệt và tính điểm tự động. Màn hình không thêm ô chọn bản.

Lịch sử: bản spec ngày 12/10 triển khai theo 案A (ưu tiên bản chốt, chưa chốt thì dùng số mới nhất). Phương án này bị thay thế bởi xác nhận ngày 19/10.

Bản đã chốt là chức năng **順位集計結果の確定** (xác định kết quả tổng hợp thứ hạng) của [PR 57058](https://github.com/ednity/school-web/pull/57058). Chạy tổng hợp lại không ghi vào bản đã chốt.

### 8.3. Số chưa làm tròn — đã xác nhận Q3

Dùng trung bình trước làm tròn, giống xét điểm liệt: tổng điểm ÷ số học sinh làm mẫu số của kết quả tổng hợp. Không dùng số đã làm tròn đang hiện trên màn thứ hạng. Ví dụ màn thứ hạng hiện 38, số dùng là 37,5.

Mẫu số giống điểm liệt: **số học sinh có điểm** của cùng bản nguồn (số dòng thứ hạng của cùng log, gồm cả học sinh bị loại khỏi thứ hạng), không dùng `examinees` (số người tính thứ hạng). Đây cũng là mẫu số của công thức trung bình môn Uenomiya hiện tại, nên dữ liệu cũ của Uenomiya ra cùng số. Số học sinh có điểm bằng 0 thì coi như không có trung bình.

Phần lẻ của kết quả công thức chỉ xử lý ở **端数処理** của dòng công thức. Không làm tròn hai lần.

<a id="timing"></a>

## 9. Thời điểm tính và ghi điểm

| Thao tác | Số trung bình | Cột điểm đang tính |
| --- | --- | --- |
| Lưu thiết lập (danh sách, điều kiện, cách đăng ký) | Không đọc | Không đổi |
| **集計実行** (chạy tổng hợp) | Tạo hoặc ghi đè số mới nhất. Số này không được đọc để tính (mục 8.2, chỉ đọc bản đã chốt) | Không đổi, kể cả 75 |
| **自動算出実行** (chạy tính điểm tự động) | Đọc để tính | Ghi kết quả; không tính được thì ghi trống |
| Lưu điểm, nhập CSV, chạy hàng loạt | Đọc để tính | Giữ cách ghi hiện tại của từng đường |
| Liên kết **試験・採点管理** (quản lý thi và chấm điểm), phía quản trị và phía học sinh | Đọc để tính | Giữ cách ghi hiện tại |
| Xử lý riêng của trường (Takaoka, ULS) | Đọc để tính | Giữ cách ghi hiện tại. Kiểm khi triển khai |

Mọi đường trên tạo `domain\tmp\AutoRating` và dùng chung cơ chế tính ([research](../research/current-auto-rating-behavior.vi.md), mục "Các đường gọi"). Quy tắc mục 4, 5, 10 áp dụng như nhau. Ví dụ học sinh nộp bài qua liên kết thi trước khi có trung bình: cột đích ghi trống như mục 10.

Quy trình vận hành khuyến nghị, giống điểm đỏ Q12: nhập đủ điểm của nhóm → **集計実行** → chờ xong → **自動算出実行**. Chạy tổng hợp không tự chạy tính điểm tự động.

<a id="empty"></a>

## 10. Khi không tính được — đã xác nhận Q4

Giữ hiện trạng của tính điểm tự động. Dòng đã khớp mà công thức không ra số thì **ghi trống vào cột đích**, điểm đang có (ví dụ 75) bị xóa. Không thử dòng bên dưới.

Công thức không ra số khi:

- vế trung bình môn không có số (các trường hợp ở mục 5.3);
- vế cột điểm chưa nhập, trừ khi mục đánh giá đó được cấu hình tính ô chưa nhập là 0 (`evaluate_item_calc_use`, hiện trạng);
- chia cho 0. Trung bình bằng 0 vẫn là số hợp lệ khi không làm số chia.

Ánh xạ có giá trị gốc không ra số, hoặc không khớp khung nào, cũng ghi trống (mục 7).

Điểm ở cột nguồn (ví dụ điểm thô 60) không bị xóa. Không thêm checkbox "giữ điểm".

Khách trả lời Q4 lần đầu là giữ điểm đang có. Ngày 12/10 khách yêu cầu làm theo cách tính điểm tự động hiện tại và đồng ý ghi trống.

<a id="population"></a>

## 11. Nhóm được chọn — đã xác nhận Q5

Danh sách nhóm giống chọn nguồn của xét điểm liệt và PR 57058: theo thiết lập tổng hợp thứ hạng đã chọn, chỉ hiện nhóm mà thiết lập đó có kết quả.

**Cần xác nhận lại sau Q2 (19/10):** shite chỉ xác nhận dropdown **順位集計設定** hiện mọi thiết lập, bất kể đã chốt hay chưa (mục 8.2). Chưa rõ dropdown kỳ/nhóm có lọc "có kết quả" theo kết quả đã chốt hay theo mọi kết quả tổng hợp. Cho tới khi có xác nhận, giữ cách chọn nguồn của xét điểm liệt như trên.

| Nhóm | Nhãn trong dropdown kỳ/nhóm | Khi nào có |
| --- | --- | --- |
| Cả khối | `学年平均` | Thiết lập bật tổng hợp theo khối |
| Lớp chủ nhiệm | `HR平均` | Thiết lập bật tổng hợp theo HR |
| Tiết học | `授業平均` | Thiết lập bật tổng hợp theo tiết học |
| Nhóm thứ hạng | Tên nhóm（順位集計グループ） | Có cấu hình nhóm |
| Nhóm kết hợp | Tên nhóm（組み合わせグループ） | Có cấu hình nhóm kết hợp |
| Nhóm môn học | Tên nhóm（科目グループ） | Có cấu hình nhóm môn học. Nhóm thực tế được xác định theo môn của tiết |

Mỗi học sinh so với trung bình của nhóm mình: khối của học sinh, HR của học sinh, tiết đang tính, nhóm thứ hạng mà học sinh thuộc. Học sinh không thuộc nhóm đã chọn thì không có trung bình (mục 5.3, mục 10).

Điều kiện lọc và vế công thức dùng cùng danh sách nhóm.

<a id="red-score"></a>

## 12. Ranh giới với điểm liệt

Điểm liệt（赤点）đã có **平均点** trong **詳細設定（適用条件）** (thiết lập chi tiết, điều kiện áp dụng). Kết quả của nó chỉ là có bị điểm liệt hay không. RA-001 không đổi quy tắc điểm liệt và không dùng kết quả điểm liệt để tính điểm.

| Mục | Điểm liệt | RA-001 |
| --- | --- | --- |
| Nguồn trung bình, nhóm, số chưa làm tròn | Dùng chung (mục 8, 11) | Dùng chung |
| Bản đã chốt hay số mới nhất | Chỉ bản đã chốt (Q2, 19/10) | Chỉ bản đã chốt (Q2, 19/10) |
| Nhiều điều kiện trên một thiết lập | AND | AND (Q6) |
| Thiếu trung bình | Không chuyển xuống thiết lập thấp hơn | Coi là không khớp, xét dòng dưới (Q7, theo hiện trạng tính điểm tự động) |
| Bộ dấu | Có **未満** | Bộ dấu của ánh xạ, không có **未満** |

<a id="data"></a>

## 13. Dữ liệu

Không thêm bảng và không thêm cột. Dữ liệu nằm trong cột JSON `condition` của `auto_rating_conf_items`, một dòng cho một dòng thiết lập.

| Phần | Hiện có | Thay đổi |
| --- | --- | --- |
| Điều kiện lọc | Mảng `setting_condition`, mỗi phần tử có loại (`jouken-a`) và giá trị (`jouken-b`, `jouken-c`). Loại 1–11 (`m_AutoRatingConfItemCondition`) | Thêm một loại điều kiện trung bình (mã tiếp theo, chốt khi triển khai). Lưu tên thiết lập thứ hạng, `kỳ,phân kỳ,nhóm` theo cùng định dạng với vế công thức, mã dấu 1–5 như `m_AutoRatingConfItemMappingCondition`, và mốc số |
| Vế công thức | `left_/right_formula_type` = 5 (`TYPE_SUB_SUBJECT_AVG`), `left_/right_calc_conf_name`, `left_/right_sub_subject_avg` dạng `期間名,区分名,集団名` | Giữ định dạng để đọc được dữ liệu cũ của Uenomiya. Thêm giá trị nhóm cho tiết học và nhóm môn học. Bỏ chặn lưu theo trường |
| Giá trị gốc của ánh xạ | `standard_type`: 1 kết quả tính, 2 mục đánh giá | Không đổi (Q1) |
| Cột điểm học sinh | Cột điểm hiện có | Không tạo cột kết quả riêng |

**Tham chiếu bằng tên.** Định dạng hiện có lưu thiết lập thứ hạng, kỳ, nhóm bằng tên. Đổi tên hoặc xóa thì tham chiếu không còn khớp: mở lại form hiện `選択してください` kèm cảnh báo (mục 5.4); khi tính thì xử lý như thiếu trung bình (mục 5.3, mục 10). Chuyển sang lưu bằng ID ngoài phạm vi RA-001.

<a id="ac"></a>

## 14. Tiêu chí nghiệm thu

Dữ liệu ví dụ: thiết lập thứ hạng `評点集計`, môn của tiết đang tính, kỳ `1学期期末` và `1学期中間`, nhóm `学年平均`. Học sinh S có điểm thô 60, cột đích đang có 75.

| Mã | Tình huống | Kết quả mong đợi |
| --- | --- | --- |
| AC-01 | Trường ngoài Uenomiya mở công thức | Dropdown vế trái/phải có **科目平均**; lưu rồi mở lại vẫn thấy đúng thiết lập và kỳ/nhóm |
| AC-02 | Dữ liệu cũ của Uenomiya | Mở lại đúng lựa chọn, tính ra cùng kết quả như trước |
| AC-03 | Công thức 60 × 70 ÷ 50, đã chạy tổng hợp | Chạy tính điểm tự động ghi 84, đè 75 |
| AC-04 | Như AC-03 nhưng chưa chạy tổng hợp | Cột ghi trống, 75 bị xóa; điểm thô 60 giữ nguyên |
| AC-05 | Vế phải là trung bình bằng 0 dùng làm số chia | Cột ghi trống |
| AC-06 | Trung bình chưa làm tròn 37,5, màn thứ hạng hiện 38, mốc **38 以上** | Không khớp |
| AC-07 | Dòng 1 **50 以上**, dòng 2 **50 より小さい**; trung bình 50 / 49,9 | 50 dùng dòng 1; 49,9 dùng dòng 2 |
| AC-08 | Một dòng có **50 より大きい** và **80 より小さい** | 50, 80 không khớp; 50,1, 79,9 khớp |
| AC-09 | Thêm dòng 3 **全員が対象**; chưa có trung bình | Học sinh dùng công thức dòng 3 |
| AC-10 | Như AC-09 nhưng không có dòng 3 | Cột ghi trống |
| AC-11 | **全員が対象** đặt trên cùng | Hai dòng trung bình không chạy |
| AC-12 | Nhóm `HR平均`, hai lớp có trung bình 49 và 60 | Mỗi lớp khớp dòng của mình |
| AC-13 | Nhóm `授業平均` khi thiết lập bật tổng hợp theo tiết | Dùng trung bình của tiết đang tính; thiết lập không bật thì không có mục này |
| AC-14 | Đổi tên thiết lập thứ hạng sau khi lưu | Mở lại hiện `選択してください` và cảnh báo; tính thì như thiếu trung bình |
| AC-15 | Lưu điều kiện thiếu mốc hoặc mốc âm | Báo lỗi, không lưu |
| AC-16 | Ánh xạ: **[基準値]** = **計算結果**, công thức có **科目平均**, khung 80→5, 50→4 | Kết quả 80 ghi 5, 50 ghi 4, 40 ghi trống |
| AC-17 | Dropdown **[基準値]** | Không có **科目平均** |
| AC-18 | Danh sách | Cột **自動計算の対象者** hiện `平均点 評点集計 1学期期末/学年平均 50点以上`; có hai dòng chú thích ※ |
| AC-19 | Lưu thiết lập | Không thay đổi điểm học sinh |
| AC-20 | Chạy qua lưu điểm, CSV, batch, liên kết thi | Kết quả giống **自動算出実行** |
| AC-21 | Đã có bản chốt 70, số mới nhất 68 | Dùng 70 |
| AC-22 | Chưa có bản chốt (hoặc bản chốt đã bị hủy), số mới nhất 68 | Coi như thiếu trung bình, không dùng 68 (Q2, 19/10). Điều kiện không khớp, công thức ghi trống |
| AC-23 | Khối đã chốt, bản chốt chỉ có toàn khối; điều kiện đọc `HR平均` (trung bình lớp chủ nhiệm), số mới nhất của lớp là 60 | Coi như thiếu trung bình, không dùng 60 |
| AC-24 | Tổng điểm 124; 2 học sinh có điểm; `examinees` là 3 | Trung bình 62 (chia cho số học sinh có điểm) |

<a id="out"></a>

## 15. Ngoài phạm vi và việc còn mở

**Ngoài phạm vi:**

- Không đổi điểm liệt, trích xuất thành tích, công khai thành tích hay phiếu điểm, ngoài việc cột điểm được tính lại xuất hiện ở các đầu ra đó như hiện tại.
- Không tự chạy tính điểm tự động khi bấm **集計実行**.
- Không thêm ô chọn môn, radio đăng ký mới, ô chọn bản tổng hợp, checkbox giữ điểm.
- Không thêm **科目平均** vào **[基準値]** (Q1).
- Không đổi hành vi ghi trống khi không khớp dòng nào hoặc không tính được (Q4, Q7).
- Không gộp PR 57058 vào RA-001.
- Không chuyển tham chiếu sang lưu bằng ID.

**Việc còn mở trước khi phát hành (không chặn bắt đầu triển khai):**

| Việc | Ai | Ảnh hưởng |
| --- | --- | --- |
| Q2 — chỉ bản đã chốt hay ưu tiên bản đã chốt | Đã xác nhận 19/10/2026: chỉ bản đã chốt (mục 8.2) | Đã đổi trong bộ đọc nguồn chung: hai hàm `getRedScoreSourceMetric` của model khớp nhánh 赤点 `feature/RC-001_red_score_spec`; chạy thử 23/10/2026 |
| PR 57572 (điểm liệt) được gộp | Team | RA-001 dùng chung bộ đọc nguồn của PR này (mục 8.1). Phần code chung trong RA-001 giống hệt PR, gộp trước hay sau đều không xung đột |
| PR 57058 được gộp | Team | Q2 = chỉ bản đã chốt, nên RA-001 phải phát hành sau PR 57058; trước khi gộp, mọi điều kiện/công thức trung bình đều thiếu số. Sau khi gộp, kiểm các trường hợp AC-21 đến AC-23 |
| Bốn thư viện riêng của trường (`TakaokaEx`, `UlsEx`, `UlsJrEx`, `UlsElEx`) | Team | Kiểm có gọi cơ chế chung hay tự tính |
| Số dòng thiết lập cũ dùng OR | Team | Báo người phụ trách nếu có |
