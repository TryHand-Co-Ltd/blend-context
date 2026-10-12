# Đặc tả RA-001 — Trung bình tổng hợp thứ hạng（順位集計の平均点）

**Ngày cập nhật:** 11/10/2026.

**Đối tượng đọc:** thành viên phát triển, thiết kế, kiểm thử và người phụ trách nghiệp vụ BLEND.

**Phạm vi tài liệu:** dùng điểm trung bình của tổng hợp thứ hạng trong tính điểm tự động. Tài liệu này đủ để hiểu quy tắc, màn hình và thời điểm ghi điểm.

**Trạng thái:** đang xác nhận với khách hàng. Phạm vi thiết kế trong [CONTEXT](../CONTEXT.md) là cách hiểu nội bộ, khách chưa xác nhận. Q1–Q7 trong [bản hỏi](../sources/2026-10-09-business-questions.vi.md) chưa có câu trả lời. Mỗi đề xuất được ghi ngay tại quy tắc liên quan, theo ba mức:

- **Phạm vi đang dùng:** nội bộ đã thống nhất, chờ khách xác nhận cùng bản hỏi.
- **Đề xuất Qn:** phương án tạm cho câu đang hỏi khách.
- **Đề xuất nội bộ:** không cần hỏi khách, chưa review nội bộ.

**Thiết kế giao diện:** [Figma RA-001](https://www.figma.com/design/OkFTBuOyoF2hNnxCFy4Uds/), version "RA-001 v5".

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
14. [Ngoài phạm vi và tài liệu chưa làm](#out)

<a id="scope"></a>

## 1. Mục tiêu và phạm vi

Người cấu hình cột điểm chọn điểm trung bình đã được tổng hợp thứ hạng tính ra, rồi dùng số đó để chọn công thức và để tính điểm ghi vào cột.

| Hạng mục | Nội dung |
| --- | --- |
| Màn danh sách | **自動計算設定** (thiết lập tính điểm tự động) của một cột điểm |
| Chọn ai được tính | **計算対象設定** (thiết lập đối tượng được tính), thêm điều kiện điểm trung bình |
| Cách ghi điểm | **登録方法設定** (thiết lập cách đăng ký): công thức và ánh xạ |
| Kết quả | Ghi vào cột đang tính khi chạy tính điểm tự động |
| Trường | Mọi trường. Hiện **科目平均** (trung bình môn) chỉ có ở **上宮高等学校** (trường cấp 3 Uenomiya) và **上宮学園中学校** (trường cấp 2 Uenomiya) |
| Quyền | Đề xuất nội bộ: giữ quyền của màn tính điểm tự động hiện có. Không thêm quyền mới |

Không thêm radio đăng ký mới. Không thêm ô chọn môn. Trung bình luôn là trung bình môn của tiết học đang cấu hình.

<a id="example"></a>

## 2. Ví dụ điểm dự kiến

| Số | Vai trò |
| --- | --- |
| 60 | Điểm của học sinh ở cột được chọn trong công thức, ví dụ **素点** (điểm thô) |
| 50 | Trung bình nhóm ở bài học sinh đã thi |
| 70 | Trung bình nhóm ở bài học sinh nghỉ |
| 84 | Kết quả 60 × 70 ÷ 50, ghi vào cột đang tính |
| 75 | Điểm đang có ở cột đích, ví dụ **1学期期末 評点** (điểm đánh giá cuối học kỳ 1). Không đưa vào phép tính |

Khi đã có 70 và 50, chạy **自動算出実行** (chạy tính điểm tự động) thì 84 ghi đè 75. Việc giữ hay xóa 75 khi chưa có 70 và 50 là Q4.

<a id="screens"></a>

## 3. Luồng màn hình

**成績帳票設定** (thiết lập phiếu điểm) → **成績設定** (thiết lập điểm) → **成績入力設定** (thiết lập nhập điểm) → **自動計算設定** (thiết lập tính điểm tự động).

Từ một dòng thiết lập:

- **計算対象設定** (thiết lập đối tượng được tính) quyết định dòng này có áp dụng cho học sinh hay không.
- **登録方法設定** (thiết lập cách đăng ký) quyết định công thức hoặc khung ánh xạ của dòng đó.

Chi tiết từng thành phần nằm ở [đặc tả màn hình](screen-definition.vi.md).

<a id="list"></a>

## 4. Danh sách thiết lập và thứ tự

Một cột điểm có nhiều dòng thiết lập. Hệ thống xét từ trên xuống và dùng dòng khớp đầu tiên.

- Dòng đã khớp thì không xét dòng bên dưới, kể cả khi công thức của dòng đó không ra số.
- **全員が対象** (mọi học sinh đều là đối tượng) đặt trên cùng thì mọi học sinh khớp dòng đó và các dòng bên dưới không chạy.
- Hai nhánh của yêu cầu khách là hai dòng: một dòng **50 以上** (từ 50 trở lên) gắn công thức A, một dòng **50 より小さい** (nhỏ hơn 50) gắn công thức B. Đúng 50 thuộc dòng từ 50 trở lên.
- Đặt dòng hẹp hơn phía trên dòng rộng hơn. Nếu không, dòng rộng nuốt các dòng phía dưới.
- Hiện trạng: học sinh không khớp dòng nào thì cột đích bị ghi trống và điểm đang có bị xóa ([research](../research/current-auto-rating-behavior.vi.md), mục 11). RA-001 không đổi hành vi này. Khi dùng điều kiện trung bình, nên có dòng cho mọi khoảng điểm, ví dụ cả nhánh từ 50 trở lên và nhánh nhỏ hơn 50.

Cột **自動計算の対象者** (học sinh được tính tự động) của danh sách hiện điều kiện trung bình dạng "平均点 評点集計 1学期期末/学年平均 50点以上" (điểm trung bình, tên thiết lập thứ hạng, kỳ/nhóm, mốc và dấu). Đây là đề xuất nội bộ, đã vẽ trên Figma màn 01.

Lưu, mở lại, đổi thứ tự bằng nút ▲▼ và xóa dòng giữ cách làm của danh sách hiện có. Lưu thiết lập không tự tính lại điểm học sinh.

<a id="condition"></a>

## 5. Điều kiện lọc theo điểm trung bình

### 5.1. Phạm vi đang dùng

**計算対象設定** (thiết lập đối tượng được tính) thêm loại điều kiện điểm trung bình, cho mọi trường.

Mỗi điều kiện chọn:

- thiết lập tổng hợp thứ hạng
- kỳ
- nhóm, trong các nhóm mục 11
- dấu so sánh và mốc số

Dấu so sánh dùng lại bộ dấu của ánh xạ:

| Dấu | Nghĩa | Ví dụ mốc 50 |
| --- | --- | --- |
| **以上** | từ … trở lên | 50 khớp |
| **より大きい** | lớn hơn | 50 không khớp |
| **等しい** | bằng | Chỉ 50 khớp |
| **より小さい** | nhỏ hơn | 50 không khớp |
| **以下** | từ … trở xuống | 50 khớp |

Không dùng **未満** (dưới). Nhánh "dưới 50" của yêu cầu là **50 より小さい** (nhỏ hơn 50).

Số đem so là trung bình môn của tiết đang cấu hình, đúng thiết lập, kỳ và nhóm đã chọn. Học sinh không có điểm cá nhân ở kỳ đó vẫn được so bằng trung bình của nhóm. Số đem so dùng cùng quy tắc làm tròn với công thức, xem mục 8.3.

Các điều kiện lọc khác trên cùng một thiết lập giữ quy tắc hiện có: phải đúng cùng lúc.

### 5.2. Đề xuất Q6

Đề xuất cho một thiết lập đặt hai mốc thành một khoảng, ví dụ **50 より大きい** (lớn hơn 50) và **80 より小さい** (nhỏ hơn 80). Hai mốc phải đúng cùng lúc nên học sinh có trung bình nằm trong khoảng mới dùng công thức của thiết lập đó.

Nếu khách không chọn khoảng, mỗi thiết lập chỉ một mốc. Hai nhánh từ 50 trở lên và nhỏ hơn 50 vẫn là hai thiết lập, không phụ thuộc Q6.

### 5.3. Đề xuất Q7 — chưa có số trung bình để so

Điều kiện trung bình không xác định được khi chưa chạy tổng hợp, hoặc nhóm của học sinh không có kết quả ở kỳ đã chọn.

Đề xuất: dừng ở dòng đó, không xét dòng bên dưới. Cột đích xử lý như khi công thức không ra số (mục 10, Q4). Cách này giống điểm liệt: điều kiện ưu tiên cao chưa xác định được thì không thử quy tắc thấp hơn.

Ví dụ: dòng 1 **50 以上** (từ 50 trở lên) → công thức A; dòng 2 **50 より小さい** (nhỏ hơn 50) → công thức B; dòng 3 **全員が対象** (mọi học sinh) → công thức C. Lớp của học sinh chưa có trung bình.

- Theo đề xuất: dừng ở dòng 1. Với đề xuất Q4, điểm 75 được giữ.
- Nếu khách chọn phương án còn lại: dòng 1 và dòng 2 đều không khớp, học sinh rơi xuống dòng 3 và nhận kết quả công thức C.

### 5.4. Đề xuất nội bộ

- **Kiểm tra khi lưu:** khi đã thêm điều kiện trung bình thì thiết lập thứ hạng, kỳ, nhóm, dấu và mốc đều bắt buộc. Mốc là số từ 0 trở lên, cho phép số thập phân vì trung bình có thể lẻ, ví dụ 37,5. Không chặn mốc theo điểm tối đa.
- **Dữ liệu cũ dùng OR:** form hiện ẩn cách nối điều kiện và mặc định AND. Một số dòng cũ còn lưu OR. Điều kiện trung bình nối theo cách nối đang lưu của dòng, không đổi nghĩa dòng cũ. Danh sách hiện **かつ** (và) hoặc **または** (hoặc) giữa các điều kiện như hiện tại. Trước khi phát hành, kiểm số dòng OR còn trong dữ liệu.
- **Tham chiếu bị đổi tên hoặc xóa:** xem mục 13.

<a id="formula"></a>

## 6. Công thức dùng trung bình môn

Ở **計算結果を登録する** (đăng ký kết quả tính), vế trái và vế phải chọn được **科目平均** (trung bình môn) tại mọi trường.

- Phép tính của một dòng là cộng, trừ, nhân hoặc chia.
- Mỗi vế chọn riêng thiết lập thứ hạng, kỳ và nhóm.
- Kỳ của bài đã thi và kỳ của bài nghỉ là hai dòng công thức.
- Dòng sau được dùng kết quả dòng trước, như cơ chế công thức hiện có.
- Hệ số theo lý do vắng và **端数処理** (xử lý phần lẻ) của từng dòng công thức theo quy định trường đã cấu hình. Không đặt một quy tắc làm tròn cố định cho mọi trường.
- Không có ô chọn môn. Môn là môn của tiết đang tính.

Lưu công thức phải giữ lựa chọn trung bình môn của mọi trường. Hiện các trường ngoài hai trường Uenomiya không thấy lựa chọn này, và khi lưu thì phần này bị bỏ ([research](../research/current-auto-rating-behavior.vi.md), mục 1–2).

Khi **[基準値]** (giá trị gốc) của ánh xạ là **計算結果** (kết quả tính), công thức phía dưới dùng cùng cách chọn này.

<a id="mapping"></a>

## 7. Ánh xạ theo khung

**マッピングした結果を登録する** (đăng ký kết quả đã so và chọn) so một giá trị với các khung và ghi **登録する値** (điểm sẽ ghi) của khung khớp đầu tiên.

### 7.1. Phạm vi đang dùng

Khi giá trị gốc là kết quả tính, công thức phía dưới chọn được trung bình môn như mục 6. Điểm dự kiến của từng học sinh, như 84, được tính ở công thức rồi mới so khung.

### 7.2. Đề xuất Q1

Đề xuất thêm **科目平均** (trung bình môn) vào chính ô **[基準値]** (giá trị gốc).

Ví dụ trung bình cả khối là 72 và khung từ 70 trở lên ghi 80. Cả nhóm so với 72 nên học sinh trong khối nhận cùng 80.

Nếu khách không thêm vào giá trị gốc, trung bình môn chỉ nằm ở vế trái và vế phải. Học sinh điểm 60 và học sinh điểm 90 có thể ra hai kết quả rồi mỗi kết quả so khung riêng.

<a id="source"></a>

## 8. Số trung bình đưa vào tính

Số trung bình lấy từ kết quả tổng hợp thứ hạng của đúng thiết lập, kỳ, nhóm và môn của tiết đang tính.

### 8.1. Hiện tại

[PR 57058](https://github.com/ednity/school-web/pull/57058) thêm **順位集計結果の確定** (xác định kết quả tổng hợp thứ hạng) nhưng chưa được gộp. Chưa có bản đã chốt trong sản phẩm. Công thức và điều kiện lọc lấy số vừa chạy, là kết quả mới nhất sau **集計実行** (chạy tổng hợp).

Chạy tổng hợp lại ghi đè số vừa chạy. Khi đã có bản đã chốt, chạy tổng hợp lại không ghi vào bản đó. Bản đã chốt đổi khi chốt lại hoặc khi cập nhật bản chốt bằng số vừa chạy.

### 8.2. Đề xuất Q2

Sau khi bản đã chốt có trong sản phẩm, đề xuất dùng bản đã chốt nếu có, và chỉ dùng số vừa chạy khi chưa có bản đó.

Ví dụ bản đã chốt là 70, lần chạy lại ra 68. Phép 60 × 70 ÷ 50 và phép 60 × 68 ÷ 50 ra hai điểm khác nhau. Số vừa chạy mới hơn chưa vào công thức cho tới khi có bản chốt mới.

Nếu khách chọn luôn dùng số vừa chạy, quy tắc ưu tiên bản đã chốt không áp dụng.

### 8.3. Đề xuất Q3

Màn **集計設定(評点集計)** (thiết lập tổng hợp điểm đánh giá) có **端数処理** (xử lý phần lẻ) khi tính điểm trung bình và độ lệch chuẩn. Màn thứ hạng có thể hiện 38 trong khi số chưa làm tròn là 37,5.

**Hiện trạng code:** công thức dùng số chưa làm tròn, tổng điểm ÷ số học sinh ([research](../research/current-auto-rating-behavior.vi.md), mục 7).

**Đề xuất:** giữ số chưa làm tròn, 37,5, cho cả điều kiện lọc và công thức. Phần lẻ của kết quả chỉ xử lý ở **端数処理** (xử lý phần lẻ) của dòng công thức, **しない** (không làm tròn) hoặc **する** (có làm tròn). Không bị làm tròn hai lần. Ngày 10/10 nội bộ đổi đề xuất này từ "số đang hiện trên màn thứ hạng".

Nếu khách chọn số đang hiện, điều kiện và công thức dùng 38. Số có thể bị làm tròn hai lần.

Điều kiện lọc và công thức dùng cùng một quy tắc làm tròn. Không lấy số đã hiện cho một chỗ và số chưa làm tròn cho chỗ kia.

<a id="timing"></a>

## 9. Thời điểm tính và ghi điểm

| Thao tác | Số trung bình | Cột điểm đang tính |
| --- | --- | --- |
| **集計実行** (chạy tổng hợp) | Tạo hoặc ghi đè số vừa chạy | Giữ nguyên |
| **自動算出実行** (chạy tính điểm tự động) | Đọc số đang có để tính | Ghi kết quả khi công thức tính được |
| Lưu điểm, nhập CSV, chạy hàng loạt | Đọc số đang có để tính | Giữ cách ghi hiện tại của từng đường |
| Liên kết **試験・採点管理** (quản lý thi và chấm điểm), phía quản trị và phía học sinh | Đọc số đang có để tính | Giữ cách ghi hiện tại |
| Xử lý riêng của trường (Takaoka, ULS) | Đọc số đang có để tính | Giữ cách ghi hiện tại. Chưa đọc chi tiết, cần kiểm khi triển khai |

Mọi đường trên dùng chung cơ chế tính ([research](../research/current-auto-rating-behavior.vi.md), mục "Các đường gọi"). Quy tắc của mục 4, 5, 10 áp dụng như nhau. Ví dụ học sinh nộp bài qua liên kết thi trước khi có trung bình: với hiện trạng, điểm 75 ở cột đích cũng bị xóa.

Bấm chạy tổng hợp không gắn thêm bước tính công thức. Giáo viên chạy tổng hợp trước, rồi chạy tính điểm tự động khi muốn ghi 84.

<a id="empty"></a>

## 10. Khi không tính được

Công thức không ra số khi thiếu điểm trung bình của đúng kỳ và đúng nhóm, khi chia cho 0, khi thiết lập thứ hạng, kỳ hoặc nhóm đã chọn không còn tồn tại, hoặc khi ánh xạ không khớp khung nào. Trung bình bằng 0 là một số hợp lệ và không được dùng làm số chia.

Điểm ở cột nguồn, ví dụ điểm thô 60, không bị xóa chỉ vì công thức đích không ra số.

### 10.1. Hiện trạng sản phẩm

Kết quả trống được ghi vào cột đang tính, nên điểm đang có ở cột đó biến mất. Ví dụ 75 bị xóa khi chưa có 70 và 50. Học sinh không khớp dòng nào cũng bị ghi trống (mục 4).

### 10.2. Đề xuất Q4

Đề xuất giữ 75 khi chưa lấy được điểm trung bình hoặc khi công thức không ra số. Chỉ ghi số mới khi tính được. Khi đã có 70 và 50, chạy tính điểm tự động thì 84 ghi đè 75.

Dòng đã khớp vẫn không chuyển sang dòng bên dưới. Giữ 75 không có nghĩa hệ thống thử công thức B.

Nếu khách giữ hiện trạng, không tính được thì ghi trống và 75 bị xóa.

Trường hợp điều kiện lọc không xác định được vì thiếu số trung bình là Q7, mục 5.3.

<a id="population"></a>

## 11. Nhóm được chọn

### 11.1. Đề xuất Q5

Đề xuất giữ các nhóm đang có khi chọn **科目平均** (trung bình môn):

- **学年平均** (trung bình cả khối)
- **HR平均** (trung bình lớp)
- trung bình của một nhóm thứ hạng
- nhóm kết hợp

Ví dụ 50 và 70 là trung bình của những nhóm này. Không thêm trung bình của riêng một tiết học.

Nếu cùng một môn có nhiều tiết và khách cần tách số trung bình theo từng tiết, khi đó mới thêm nhóm của một tiết học.

Điều kiện lọc ở mục 5 dùng cùng danh sách nhóm với vế công thức.

<a id="red-score"></a>

## 12. Ranh giới với điểm liệt

Điểm liệt（赤点）có hai bước. **詳細設定（適用条件）** (thiết lập chi tiết, điều kiện áp dụng) đã chọn được **平均点** (điểm trung bình) trước khi đặt **赤点の基準** (tiêu chuẩn điểm liệt). Dòng khớp đầu tiên chỉ kết luận có bị điểm liệt hay không.

RA-001 không đổi quy tắc điểm liệt và không dùng kết quả điểm liệt làm điểm dự kiến. Điều kiện trung bình mới nằm trên **計算対象設定** (thiết lập đối tượng được tính) của tính điểm tự động. Công thức của dòng khớp ghi điểm vào cột.

Điểm liệt dùng **未満** (dưới) trong bộ dấu riêng. Tính điểm tự động dùng bộ dấu của ánh xạ, mục 5.1. Hai bộ dấu không gộp.

<a id="data"></a>

## 13. Dữ liệu

Không thêm bảng mới. Dữ liệu nằm trong cột JSON `condition` của `auto_rating_conf_items`, một dòng cho một dòng thiết lập.

| Phần | Hiện có | Thay đổi đề xuất |
| --- | --- | --- |
| Điều kiện lọc | Mảng `setting_condition`, mỗi phần tử có loại (`jouken-a`) và giá trị (`jouken-b`, `jouken-c`). Loại 1–11 | Thêm một loại điều kiện trung bình. Lưu thiết lập thứ hạng, kỳ, nhóm, dấu (mã 1–5 như ánh xạ) và mốc số. Mã loại cụ thể chốt khi triển khai |
| Vế công thức | `left_/right_formula_type` = 5 (**科目平均**), `left_/right_calc_conf_name` (tên thiết lập thứ hạng), `left_/right_sub_subject_avg` dạng `期間名,区分名,集団名` (tên kỳ, tên phân kỳ, tên nhóm) | Giữ định dạng để đọc được dữ liệu cũ của hai trường Uenomiya. Bỏ chặn lưu theo trường |
| Giá trị gốc của ánh xạ | `standard_type`: 1 **計算結果** (kết quả tính), 2 **評価項目** (mục đánh giá) | Chỉ khi Q1 được xác nhận: thêm loại trung bình môn, lưu thiết lập thứ hạng, kỳ, nhóm cùng phần ánh xạ |
| Số trung bình | Đọc từ kết quả tổng hợp thứ hạng mới nhất | Bản đã chốt chỉ được đọc sau khi PR 57058 nằm trong sản phẩm và khách xác nhận Q2 |
| Cột điểm học sinh | Cột điểm hiện có | Không tạo cột kết quả riêng |

Đề xuất nội bộ: điều kiện trung bình lưu thiết lập thứ hạng, kỳ, nhóm theo cùng định dạng tên với vế công thức, để dùng chung bộ chọn và cách đọc số.

**Tham chiếu bằng tên.** Vì lưu bằng tên, đổi tên hoặc xóa thiết lập thứ hạng, kỳ, nhóm làm mất tham chiếu. Đề xuất nội bộ:

- Mở lại form thì ô không còn khớp hiện là chưa chọn, kèm cảnh báo. Phải chọn lại trước khi lưu.
- Khi tính, tham chiếu không còn khớp được xử lý như thiếu số trung bình: công thức theo mục 10, điều kiện theo Q7.
- Chuyển sang lưu bằng ID là thay đổi lớn hơn, ngoài phạm vi RA-001 nếu không có yêu cầu riêng.

Trường nào lưu thiết lập trung bình môn thì mở lại vẫn thấy đủ thiết lập thứ hạng, kỳ và nhóm. Không bỏ phần này khi lưu.

<a id="out"></a>

## 14. Ngoài phạm vi và tài liệu chưa làm

- Không đổi điểm liệt, trích xuất thành tích, công khai thành tích hay phiếu điểm ngoài việc cột điểm được tính lại có thể xuất hiện ở các đầu ra đó như hiện tại.
- Không tự chạy tính điểm tự động khi bấm **集計実行** (chạy tổng hợp).
- Không thêm ô chọn môn.
- Không thêm radio đăng ký mới.
- Không đổi hành vi ghi trống khi học sinh không khớp dòng nào.
- Không gộp PR 57058 vào phạm vi triển khai của RA-001. RA-001 chỉ đọc bản đã chốt sau khi chức năng đó có trong sản phẩm và Q2 được xác nhận.
- Tiêu chí nghiệm thu, chia việc và đặc tả kiểm thử làm sau khi khách trả lời Q1–Q7.
