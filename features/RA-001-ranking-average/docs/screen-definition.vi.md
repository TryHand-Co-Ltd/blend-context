# RA-001 — Đặc tả màn hình

**Ngày cập nhật:** 12/10/2026.

**Người đọc:** thiết kế và phát triển. Nhãn tiếng Nhật là nhãn trên sản phẩm. Thành phần đánh dấu **mới** là phần RA-001 thêm; còn lại giữ như hiện tại.

**Figma:** [RA-001](https://www.figma.com/design/OkFTBuOyoF2hNnxCFy4Uds/), version "RA-001 v9 – cân bố cục, ghi chú cho khách". Trang **00｜Guide**, **01｜List and priority**, **02｜Conditions**, **03｜Formula**, **04｜Mapping states**. Bảng đối chiếu ở mục 08.

**Trạng thái:** khách đã xác nhận Q1, Q3–Q7 ngày 12/10/2026. Q2 đã xác nhận ngày 19/10/2026 (chỉ dùng bản tổng hợp đã chốt); Q2 không đổi màn hình nào. Dropdown **順位集計設定** (thiết lập tổng hợp thứ hạng) hiện mọi thiết lập đã tạo, bất kể đã chốt hay chưa. Quy tắc nghiệp vụ nằm ở [đặc tả](specification.vi.md).

## 00 — Cách đọc

- **Bắt buộc** là điều kiện để lưu phần đang nhập. “—” dùng cho nhãn và nút.
- Giá trị 50, 60, 70, 75, 84 là ví dụ của yêu cầu, không phải giá trị mặc định.
- Lưu bất kỳ màn nào cũng không tính lại điểm học sinh.

Luồng: **成績帳票設定** → **成績設定** → **成績入力設定** → **自動計算設定** → **計算対象設定** hoặc **登録方法設定**.

## 01 — Danh sách thiết lập

<a id="screen-list"></a>

**Màn hình:** **自動計算設定** (thiết lập tính điểm tự động). Tiêu đề ví dụ `1学期期末:「評点」の自動計算設定`. Figma 01-A.

| STT | Thành phần | Loại | Bắt buộc | Thao tác và kết quả | Ghi chú |
| --- | --- | --- | --- | --- | --- |
| 1 | Khối cơ bản, quyền sửa tay, **自動計算設定の管理用メモ** (memo) | Hiện có | — | Giữ nguyên | — |
| 2 | Bảng **詳細設定** (thiết lập chi tiết), năm cột | Bảng hiện có | — | Xét từ trên xuống, dùng dòng khớp đầu tiên | Không thêm cột, không thêm nút |
| 3 | Cột **自動計算の対象者** (học sinh được tính tự động) | Văn bản | — | **Mới:** hiện điều kiện trung bình `平均点 評点集計 1学期期末/学年平均 50点以上`. Nhiều điều kiện nối bằng chữ nối hiện có | Ví dụ Figma: 設定2 `…50点以上`, 設定3 `…50点より小さい`, 設定1 `全員が対象` ở dưới cùng |
| 4 | [編集] ở cột đối tượng | Liên kết hiện có | — | Mở [02](#screen-condition) của đúng dòng | — |
| 5 | [編集] ở cột cách đăng ký | Liên kết hiện có | — | Mở [03](#screen-formula) hoặc [04](#screen-mapping) của đúng dòng | — |
| 6 | Thêm chi tiết, **削除** (xóa), **優先順位** ▲▼ | Nút hiện có | — | Giữ hành vi hiện tại | ▲ dòng đầu và ▼ dòng cuối không bấm được |
| 7 | Hai dòng chú thích dưới bảng | Văn bản | — | **Mới:** `※上から順に判定し、最初に条件に一致した設定のみを適用します。` / `※「全員が対象」を最上位にすると、下の平均点条件は適用されません。` | Quyết định nội bộ |

## 02 — Đối tượng được tính

<a id="screen-condition"></a>

**Màn hình:** **計算対象設定** (thiết lập đối tượng được tính). Tiêu đề `「1学期期末 評点」の詳細設定（計算対象）`. Figma 02-A. Khoảng trên–dưới (Q6) không vẽ khung riêng vì không có UI mới: thêm dòng 平均点 thứ hai bằng nút hiện có; quy tắc ghi ở ghi chú 02 và 02-A-2.

| STT | Thành phần | Loại | Bắt buộc | Thao tác và kết quả | Ghi chú |
| --- | --- | --- | --- | --- | --- |
| 1 | **設定名称** (tên thiết lập) | Ô văn bản hiện có | Theo hiện tại | Tên dòng trên danh sách | — |
| 2 | **全員が対象** hoặc lọc | Radio hiện có | Bắt buộc | — | — |
| 3 | Các dòng lọc hiện có | Hiện có | Có điều kiện | Giữ môn và các loại cũ | — |
| 4 | Dropdown loại lọc | Dropdown hiện có | — | **Mới:** nhóm cuối `----集計条件で絞り込む----` (không chọn được) và mục **平均点**. Chưa chọn loại thì phần bên phải trống | Figma 02-3 |
| 5 | Thiết lập thứ hạng | Dropdown **mới** | Bắt buộc | Tên **順位集計設定** của năm học. Mục đầu `選択してください` | Figma 02-4 |
| 6 | Kỳ/nhóm | Dropdown **mới** | Bắt buộc | Dạng `1学期期末/学年平均`. Nhóm theo [05](#screen-population). Mục đầu `選択してください` | Q5 |
| 7 | Mốc | Ô số **mới** | Bắt buộc | Số từ 0 trở lên, cho phép thập phân | Lỗi nếu trống hoặc âm |
| 8 | Dấu | Dropdown **mới** | Bắt buộc | **以上**, **より大きい**, **と等しい**, **より小さい**, **以下**. Không có **未満** | — |
| 9 | Xóa dòng lọc | Nút hiện có | — | Xóa dòng điều kiện | — |
| 10 | Thêm dòng lọc | Nút hiện có | — | Thêm điều kiện thứ hai, ví dụ khoảng **50 より大きい** + **80 より小さい** | Q6, AND. Figma ghi chú 02-A-2 |
| 11 | Chú thích `※絞り込み条件を複数設定した場合、全ての条件を満たす生徒が対象となります。` | Văn bản | — | Nhắc quy tắc AND | — |
| 12 | Lưu | Nút hiện có | — | Lưu và mở lại đúng lựa chọn. Tham chiếu không còn thì hiện `選択してください` kèm cảnh báo | Không tính điểm lúc lưu |

Kết quả khi tính (Figma 02-A-2):

- Một mốc: 49,9 → 設定3; 50 và 70 → 設定2.
- Khoảng **50 より大きい** + **80 より小さい**: 50 và 80 không khớp; 50,1 và 79,9 khớp.
- Không lấy được trung bình: điều kiện không khớp, xét dòng dưới; không khớp dòng nào thì ghi trống (Q7).

## 03 — Công thức

<a id="screen-formula"></a>

**Màn hình:** **登録方法設定** (thiết lập cách đăng ký), chọn **計算結果を登録する**. Tiêu đề `「1学期期末 評点」の詳細設定（登録方法）`. Figma 03-A.

| STT | Thành phần | Loại | Bắt buộc | Thao tác và kết quả | Ghi chú |
| --- | --- | --- | --- | --- | --- |
| 1 | Các dòng công thức (式1, 式2…) | Bảng hiện có | Có điều kiện | Vế trái, phép tính (+ − × ÷), vế phải | — |
| 2 | Loại giá trị mỗi vế | Dropdown hiện có | Bắt buộc | **成績登録項目**, **固定値**, **式の結果** (không có ở 式1), **授業設定** (khi có), **科目平均** (**mới** cho mọi trường) | Figma 03-1 |
| 3 | Thiết lập thứ hạng | Dropdown | Bắt buộc khi chọn **科目平均** | Hiện khi chọn **科目平均**, ẩn với loại khác | Figma 03-2 |
| 4 | Kỳ/nhóm | Dropdown | Bắt buộc khi chọn **科目平均** | Dạng `1学期期末/学年平均`, nhóm theo [05](#screen-population) | Q5 |
| 5 | **端数処理** | Lựa chọn hiện có | — | **しない** / **する**; **する** thì hiện **小数第** và **四捨五入**, **切り上げ**, **切り捨て** | Figma 03-3. Áp lên kết quả dòng, sau khi đọc trung bình chưa làm tròn (Q3) |
| 6 | **計算式を追加** (thêm công thức), xóa dòng | Nút hiện có | — | Giữ nguyên | — |
| 7 | **戻る**, **更新する** | Nút hiện có | — | **更新する** lưu; mở lại vẫn thấy **科目平均**, thiết lập, kỳ/nhóm | Bỏ chặn lưu theo trường |

Ví dụ trên Figma: 式1 `科目平均 評点集計 1学期期末/学年平均 × 素点`; 式2 `式1の計算結果 ÷ 科目平均 評点集計 1学期中間/学年平均`. 60 × 70 ÷ 50 = 84.

## 04 — Ánh xạ

<a id="screen-mapping"></a>

**Màn hình:** **登録方法設定**, chọn **マッピングした結果を登録する**. Figma 04-A.

| STT | Thành phần | Loại | Bắt buộc | Thao tác và kết quả | Ghi chú |
| --- | --- | --- | --- | --- | --- |
| 1 | **[基準値]** | Dropdown hiện có | Bắt buộc | **計算結果** hoặc cột điểm. **Không** thêm **科目平均** | Q1 |
| 2 | Bảng công thức khi chọn **計算結果** | Như [03](#screen-formula) | Có điều kiện | Vế trái/phải chọn được **科目平均**; tính riêng từng học sinh rồi so khung | Figma 04-A-1 |
| 3 | Khung: **[比較値]**, **[比較条件]**, **登録する値**, **枠を追加**, nút trừ | Hiện có | Bắt buộc | Khung khớp đầu tiên được ghi | Figma 04-3 |
| 4 | Không ra số hoặc không khớp khung | — | — | Ghi trống | Q4. Figma 04-A-2, 04-4 |

Không thêm ô chọn bản tổng hợp (Q2) và không thêm checkbox giữ điểm (Q4). Figma 04-4.

## 05 — Nhóm

<a id="screen-population"></a>

Dùng chung cho dropdown kỳ/nhóm ở 02 và 03. Chỉ hiện nhóm mà thiết lập thứ hạng đã chọn có tổng hợp (Q5, giống chọn nguồn của xét điểm liệt và PR 57058).

| Nhóm | Nhãn |
| --- | --- |
| Cả khối | `学年平均` |
| Lớp chủ nhiệm | `HR平均` |
| Tiết học | `授業平均` |
| Nhóm thứ hạng | Tên nhóm |
| Nhóm kết hợp | Tên nhóm |
| Nhóm môn học | Tên nhóm |

Không có ô chọn môn. Môn là môn của tiết đang cấu hình.

## 06 — Chạy và ghi điểm

| STT | Thao tác | Số trung bình | Cột đang tính |
| --- | --- | --- | --- |
| 1 | Lưu ở 01, 02, 03, 04 | Không đọc | Không đổi |
| 2 | **集計実行** | Tạo hoặc ghi đè số mới nhất | Không đổi |
| 3 | **自動算出実行** | Đọc để tính | Ghi kết quả; không tính được thì ghi trống |
| 4 | Lưu điểm, CSV, batch, liên kết **試験・採点管理** | Đọc để tính | Giữ đường ghi hiện tại |

## 07 — Câu hỏi khách

| Câu | Trạng thái | Ảnh hưởng màn hình |
| --- | --- | --- |
| Q1 | Đã xác nhận: không thêm vào **[基準値]** | 04-1 giữ nguyên |
| Q2 | Đã xác nhận 19/10: chỉ dùng bản tổng hợp đã chốt | Không đổi màn hình |
| Q3 | Đã xác nhận: số chưa làm tròn | Không có control |
| Q4 | Đã xác nhận: ghi trống | Không có control |
| Q5 | Đã xác nhận: thêm `授業平均`, danh sách như PR 57058 | 05 |
| Q6 | Đã xác nhận: nhiều mốc, AND | 02-10, 02-11 |
| Q7 | Đã xác nhận: thiếu trung bình thì không khớp | Không có control |

## 08 — Đối chiếu Figma

| Figma | Mục đặc tả màn hình | Mục đặc tả nghiệp vụ |
| --- | --- | --- |
| 00 Guide | 00, 07 | 1 |
| 01-A, ghi chú 01-1 → 01-3 | 01 | 4 |
| Ghi chú 02, 02-A, 02-A-1, 02-A-2 | 02 (STT 4–12) | 5.1, 5.2, 5.3 |
| 02-3, 02-4 | 02 (STT 4–8), 05 | 5.1, 8.3, 11 |
| 03-A, 03-1 → 03-4 | 03, 05 | 6, 8.3, 11 |
| 04-A, 04-A-1 → 04-A-3, 04-3, 04-4 | 04 | 7, 8.2, 10 |
