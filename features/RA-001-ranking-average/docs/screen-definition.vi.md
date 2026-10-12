# RA-001 — Đặc tả màn hình

**Ngày cập nhật:** 11/10/2026.

**Người đọc:** thiết kế và phát triển. Nhãn Nhật là nhãn đang có trên sản phẩm. Ô điểm trung bình trên **計算対象設定** (thiết lập đối tượng được tính) là thành phần mới.

**Figma:** [RA-001](https://www.figma.com/design/OkFTBuOyoF2hNnxCFy4Uds/), vẽ theo UI đang chạy, version "RA-001 v5". Trang **01｜List and priority** ứng với mục 01, **02｜Conditions** với mục 02, **03｜Formula** với mục 03, **04｜Mapping states** với mục 04. Figma thể hiện đề xuất hiện hành, không phải xác nhận của khách.

**Trạng thái:** đang xác nhận với khách. Quy tắc nghiệp vụ nằm ở [đặc tả](specification.vi.md). Q1–Q7 chưa được khách hàng trả lời. Dòng nào phụ thuộc đề xuất thì ghi trong cột ghi chú.

## 00 — Cách đọc

- **Bắt buộc** là điều kiện để lưu phần đang nhập. “—” dùng cho nhãn và nút.
- Thao tác và kết quả là hành vi cần có, không phải biên bản đã chạy trên môi trường.
- Giá trị 50, 60, 70, 75, 84 chỉ là ví dụ của yêu cầu, không phải giá trị mặc định.

Luồng: **成績帳票設定** (thiết lập phiếu điểm) → **成績設定** (thiết lập điểm) → **成績入力設定** (thiết lập nhập điểm) → **自動計算設定** (thiết lập tính điểm tự động).

## 01 — Danh sách thiết lập

**Màn hình:** **自動計算設定** (thiết lập tính điểm tự động) của một cột điểm.

| STT | Thành phần | Loại | Bắt buộc | Thao tác và kết quả | Ghi chú |
| --- | --- | --- | --- | --- | --- |
| 1 | Tên cột đang tính | Nhãn | — | Giữ đúng cột, ví dụ **1学期期末 評点** (điểm đánh giá cuối học kỳ 1) | Không đổi cột bằng tên hiển thị |
| 2 | Danh sách dòng thiết lập | Danh sách | — | Xét từ trên xuống, dùng dòng khớp đầu tiên | Dòng khớp mà không ra số vẫn không xét dòng dưới |
| 3 | **全員が対象** (mọi học sinh đều là đối tượng) | Cách chọn đối tượng của một dòng | — | Nếu dòng này ở trên cùng, các dòng dưới không chạy | Đặt nhánh hẹp hơn phía trên |
| 4 | Cột **自動計算の対象者** (học sinh được tính tự động) | Văn bản | — | Hiện điều kiện trung bình dạng "平均点 評点集計 1学期期末/学年平均 50点以上" (điểm trung bình, thiết lập thứ hạng, kỳ/nhóm, mốc) | Đề xuất nội bộ. Giữa các điều kiện hiện **かつ** (và) hoặc **または** (hoặc) như hiện tại |
| 5 | **計算対象設定** (thiết lập đối tượng được tính) | Liên kết [編集] (sửa) | — | Mở điều kiện của đúng dòng | [02](#screen-condition) |
| 6 | **登録方法設定** (thiết lập cách đăng ký) | Liên kết [編集] (sửa) | — | Mở công thức hoặc ánh xạ của đúng dòng | [03](#screen-formula), [04](#screen-mapping) |
| 7 | **削除** (xóa), **優先順位** (thứ tự ưu tiên) ▲▼ | Nút hiện có | — | Giữ hành vi danh sách hiện tại. Lưu thiết lập không tính điểm học sinh | ▲ của dòng đầu và ▼ của dòng cuối không bấm được |
| 8 | Ghi chú khi thiếu trung bình | Ghi chú ngoài UI trên Figma | — | Nhắc cách xử lý khi chưa có số trung bình | Theo đề xuất Q4 và Q7 |

## 02 — Đối tượng được tính

<a id="screen-condition"></a>

**Màn hình:** **計算対象設定** (thiết lập đối tượng được tính).

**Mục đích:** quyết định học sinh nào dùng công thức của dòng này. Thêm điều kiện điểm trung bình.

| STT | Thành phần | Loại | Bắt buộc | Thao tác và kết quả | Ghi chú |
| --- | --- | --- | --- | --- | --- |
| 1 | Tên thiết lập | Ô văn bản hiện có | Theo màn hiện tại | Giữ tên dòng trên danh sách | — |
| 2 | Mọi học sinh hoặc lọc | Radio hiện có, trên một hàng | Bắt buộc | **全員が対象** (mọi học sinh đều là đối tượng) hoặc lọc theo điều kiện | Mọi học sinh đặt trên cùng thì chặn dòng dưới |
| 3 | Các điều kiện đang có | Bộ lọc hiện có | Có điều kiện | Giữ môn, khóa và các loại hiện có. Nhiều điều kiện trên cùng một dòng phải đúng cùng lúc | Không đổi nghĩa các loại cũ. Dòng cũ lưu OR giữ nguyên nghĩa |
| 4 | Loại điều kiện điểm trung bình | Bộ chọn mới | Có điều kiện | Chọn khi muốn so trung bình nhóm | Có ở mọi trường |
| 5 | Thiết lập thứ hạng, kỳ, nhóm | Bộ chọn | Bắt buộc khi có dòng trung bình | Chọn đúng kết quả tổng hợp cần so | Nhóm theo [mục 05](#screen-population). Tham chiếu đã bị đổi tên hoặc xóa thì hiện chưa chọn, kèm cảnh báo (đề xuất nội bộ) |
| 6 | Dấu | Bộ chọn | Bắt buộc khi có dòng trung bình | **以上** (từ … trở lên), **より大きい** (lớn hơn), **等しい** (bằng), **より小さい** (nhỏ hơn), **以下** (từ … trở xuống) | Không có **未満** (dưới) |
| 7 | Mốc | Ô số | Bắt buộc khi có dòng trung bình | Ví dụ **50 以上** (từ 50 trở lên) hoặc **50 より小さい** (nhỏ hơn 50) | Đề xuất nội bộ: số từ 0 trở lên, cho phép số thập phân |
| 8 | Thêm điều kiện | Nút hiện có | — | Thêm một mốc nữa trên cùng dòng | Khoảng, ví dụ lớn hơn 50 và nhỏ hơn 80, là đề xuất Q6 |
| 9 | Lưu | Nút hiện có | — | Lưu và mở lại đúng các mốc đã chọn | Không tính điểm học sinh lúc lưu |

Hai nhánh của yêu cầu là hai dòng danh sách, không phải hai mốc trên một dòng: một dòng từ 50 trở lên gắn công thức A, một dòng nhỏ hơn 50 gắn công thức B.

Khi chưa có số trung bình để so, đề xuất Q7 là dừng ở dòng đó và không xét dòng dưới.

## 03 — Công thức

<a id="screen-formula"></a>

**Màn hình:** **登録方法設定** (thiết lập cách đăng ký), chọn **計算結果を登録する** (đăng ký kết quả tính).

| STT | Thành phần | Loại | Bắt buộc | Thao tác và kết quả | Ghi chú |
| --- | --- | --- | --- | --- | --- |
| 1 | Các dòng công thức | Bảng hiện có | Có điều kiện | Mỗi dòng có vế trái, phép tính, vế phải | Cộng, trừ, nhân, chia |
| 2 | Loại giá trị | Bộ chọn | Bắt buộc cho vế đang dùng | Thêm **科目平均** (trung bình môn) cho mọi trường | Hiện chỉ có ở hai trường Uenomiya |
| 3 | Thiết lập thứ hạng | Bộ chọn | Bắt buộc khi vế là trung bình môn | Chọn tên thiết lập tổng hợp | Mỗi vế chọn riêng |
| 4 | Kỳ và nhóm | Bộ chọn | Bắt buộc khi vế là trung bình môn | Ví dụ cuối kỳ cả khối, giữa kỳ cả lớp | Hai kỳ là hai dòng |
| 5 | Làm tròn dòng | Lựa chọn hiện có | — | **しない** (không làm tròn) hoặc **する** (có làm tròn) | Theo quy định trường. Đề xuất Q3: vế nhận số chưa làm tròn, phần lẻ chỉ xử lý ở đây |
| 6 | Lưu | Nút hiện có | — | Mở lại vẫn thấy trung bình môn, thiết lập, kỳ và nhóm | Trường khác hai trường Uenomiya hiện không lưu được phần này |

Ví dụ đọc được trên form: dòng 1 là trung bình cuối kỳ, dòng 2 là điểm thô 60 nhân dòng 1 rồi chia trung bình giữa kỳ. Kết quả 84 ghi vào cột đang tính khi chạy tính điểm tự động.

## 04 — Ánh xạ

<a id="screen-mapping"></a>

**Màn hình:** **登録方法設定** (thiết lập cách đăng ký), chọn **マッピングした結果を登録する** (đăng ký kết quả đã so và chọn).

| STT | Thành phần | Loại | Bắt buộc | Thao tác và kết quả | Ghi chú |
| --- | --- | --- | --- | --- | --- |
| 1 | **[基準値]** (giá trị gốc) | Bộ chọn hiện có | Bắt buộc | Cột điểm hoặc **計算結果** (kết quả tính) | Đề xuất Q1 thêm **科目平均** (trung bình môn) |
| 2 | Công thức khi giá trị gốc là kết quả tính | Bảng như mục 03 | Có điều kiện | Tính số riêng của học sinh, ví dụ 84, rồi so khung | Phạm vi đang dùng, không phụ thuộc Q1 |
| 3 | Khung và **登録する値** (điểm sẽ ghi) | Bảng hiện có | Bắt buộc khi dùng ánh xạ | Khung khớp đầu tiên được ghi. **[比較値]** (giá trị so) chọn **手入力** (nhập tay) hoặc **授業設定** (thiết lập tiết học) | Không khớp khung nào thì xử lý theo Q4 |
| 4 | Trung bình môn đặt tại giá trị gốc | Bộ chọn đề xuất | Có điều kiện | Cả nhóm so cùng một số và có thể nhận cùng điểm sẽ ghi | Chỉ làm nếu khách xác nhận Q1 |

Ví dụ Q1: trung bình cả khối 72, khung từ 70 trở lên ghi 80. Nếu trung bình nằm ở giá trị gốc, học sinh trong khối nhận 80. Nếu trung bình chỉ nằm trong công thức, học sinh điểm 60 và học sinh điểm 90 so khung bằng hai kết quả khác nhau.

## 05 — Nhóm

<a id="screen-population"></a>

Dùng chung cho điều kiện lọc và cho vế **科目平均** (trung bình môn).

| Nhóm | Trong đề xuất Q5 |
| --- | --- |
| **学年平均** (trung bình cả khối) | Giữ |
| **HR平均** (trung bình lớp) | Giữ |
| Trung bình của một nhóm thứ hạng | Giữ |
| Nhóm kết hợp | Giữ |
| Trung bình của riêng một tiết học | Không thêm, trừ khi khách chọn phương án còn lại của Q5 |

Không có ô chọn môn. Môn là môn của tiết đang cấu hình.

## 06 — Chạy và ghi điểm

| STT | Thao tác | Kết quả với số trung bình | Kết quả với cột đang tính |
| --- | --- | --- | --- |
| 1 | **集計実行** (chạy tổng hợp) | Tạo hoặc ghi đè số vừa chạy | Giữ nguyên, kể cả 75 |
| 2 | **自動算出実行** (chạy tính điểm tự động) | Đọc số đang dùng để tính | Khi tính được thì ghi, ví dụ 84 đè 75 |
| 3 | Lưu điểm, nhập CSV, chạy hàng loạt | Đọc số đang dùng để tính | Giữ đường ghi hiện tại |
| 4 | Liên kết **試験・採点管理** (quản lý thi và chấm điểm), phía quản trị và phía học sinh | Đọc số đang dùng để tính | Giữ đường ghi hiện tại |
| 5 | Xử lý riêng của trường (Takaoka, ULS) | Đọc số đang dùng để tính | Giữ đường ghi hiện tại. Cần kiểm chi tiết khi triển khai |

Số đang dùng hiện tại là số vừa chạy, chưa làm tròn. Sau khi **順位集計結果の確定** (xác định kết quả tổng hợp thứ hạng) có trong sản phẩm, ưu tiên bản đã chốt là đề xuất Q2.

Khi chưa có số trung bình, đề xuất Q4 là giữ điểm đang có trong cột. Hiện trạng sản phẩm là ghi trống và xóa điểm đó. Cả hai cách đều không chuyển sang dòng thiết lập bên dưới. Học sinh không khớp dòng nào vẫn bị ghi trống như hiện tại.

## 07 — Những chỗ chờ khách hàng

| Câu | Chỗ trên màn | Nếu giữ đề xuất | Nếu khách chọn phương án kia |
| --- | --- | --- | --- |
| Q1 | Ô giá trị gốc của ánh xạ | Có thêm trung bình môn | Ô này không có trung bình môn |
| Q2 | Không thêm ô chọn bản | Có bản đã chốt thì đọc bản đó | Luôn đọc số vừa chạy |
| Q3 | Số đưa vào điều kiện và vế công thức | Số chưa làm tròn | Số đang hiện trên màn thứ hạng |
| Q4 | Cột đích khi không ra số | Giữ điểm đang có | Ghi trống |
| Q5 | Ô nhóm | Không có trung bình từng tiết | Thêm trung bình từng tiết |
| Q6 | Hai mốc trên một dòng điều kiện | Được đặt khoảng | Mỗi dòng thiết lập chỉ một mốc |
| Q7 | Điều kiện trung bình khi chưa có số | Dừng ở dòng đó | Xét tiếp dòng bên dưới |
