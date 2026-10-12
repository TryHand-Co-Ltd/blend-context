# Context RA-001 — Trung bình tổng hợp thứ hạng（順位集計の平均点）

Cập nhật: **11/10/2026**.

**Tài liệu này là nguồn yêu cầu hiện hành của feature.** Đặc tả trong [docs](docs/README.md) diễn giải nguồn này.

**Trạng thái: đang xác nhận với khách hàng.** Khách chưa trả lời Q1–Q7, chưa có mục nào được khách chốt. Phạm vi ở mục 2 là cách hiểu nội bộ dùng để thiết kế. Đề xuất ở mục 3 và mục 4 chưa phải yêu cầu đã xác nhận.

Work item: **Implement Ranking Average in Automatic Grade Calculation and Apply It to Conditions, Formulas, and Grade Registration**.

## 1. Yêu cầu của khách hàng

Dùng điểm trung bình do tổng hợp thứ hạng（順位集計）tính ra trong tính điểm tự động（自動計算）.

Ví dụ điểm dự kiến（見込み点）: điểm của học sinh ở bài đã thi là 60, trung bình nhóm ở bài đó là 50, trung bình nhóm ở bài học sinh nghỉ là 70. Phép tính 60 × 70 ÷ 50 = 84.

- 60 là điểm ở cột được chọn trong công thức, ví dụ **素点** (điểm thô).
- 84 được ghi vào cột đang tính, ví dụ **1学期期末 評点** (điểm đánh giá cuối học kỳ 1).
- 75 nếu đang nằm ở cột đích là điểm đã có, không phải số đưa vào phép tính.

Yêu cầu phân nhánh: điểm trung bình từ 50 trở lên thì dùng công thức A, dưới 50 thì dùng công thức B. Khách hàng cho rằng phần này có thể đã có để xác định điểm liệt（赤点）. Việc kiểm tra cho thấy điểm liệt chỉ kết luận có bị điểm liệt hay không. Tính điểm tự động cần nhánh riêng.

Một số trường đã chọn **科目平均** (trung bình môn) trong công thức. Yêu cầu là đưa cơ chế đó thành chức năng dùng chung, gồm lưu, mở lại, tính và ghi điểm, và nối với kết quả tổng hợp thứ hạng đã được xác định.

## 2. Phạm vi thiết kế đang dùng

Nội bộ đã thống nhất sau khi kiểm tra mã và màn hình. **Khách hàng chưa xác nhận** và vẫn có thể chỉnh lại. Bằng chứng hiện trạng code nằm ở [research](research/current-auto-rating-behavior.vi.md). Các điểm thống nhất ngày 10/10 nằm ở [ghi nhận nội bộ](sources/2026-10-10-internal-design-review.vi.md).

| Mục | Quy tắc |
| --- | --- |
| Chỗ dùng trung bình trong công thức | Ở **計算結果を登録する** (đăng ký kết quả tính), vế trái và vế phải chọn được **科目平均** (trung bình môn). Bốn phép tính cộng, trừ, nhân, chia. Mỗi vế chọn riêng thiết lập thứ hạng, kỳ và nhóm. Kỳ khác nhau nằm ở các dòng công thức khác nhau. |
| Ánh xạ khi giá trị gốc là kết quả tính | Ở **マッピングした結果を登録する** (đăng ký kết quả đã so và chọn), khi **[基準値]** (giá trị gốc) là **計算結果** (kết quả tính), công thức phía dưới dùng cùng cách chọn trung bình môn. |
| Môn | Trung bình lấy theo môn của tiết học đang tính. Không thêm ô chọn môn. |
| Hệ số và làm tròn từng dòng | Hệ số theo lý do vắng và cách làm tròn trên từng dòng công thức giữ theo quy định của từng trường. |
| Dùng chung | Mở **科目平均** (trung bình môn) cho mọi trường. Phạm vi gồm lưu thiết lập, mở lại đúng lựa chọn, tính và ghi điểm. |
| Điều kiện lọc | Thêm điểm trung bình vào **計算対象設定** (thiết lập đối tượng được tính). Từ 50 trở lên là một thiết lập gắn công thức A. Nhỏ hơn 50 là một thiết lập khác gắn công thức B. |
| Dấu so sánh | Dùng lại bộ dấu của ánh xạ: **以上** (từ … trở lên), **より大きい** (lớn hơn), **等しい** (bằng), **より小さい** (nhỏ hơn), **以下** (từ … trở xuống). Không dùng **未満** (dưới). |
| Thứ tự | Danh sách xét từ trên xuống. Dòng khớp đầu tiên thì chạy. **全員が対象** (mọi học sinh đều là đối tượng) đặt trên cùng thì các dòng bên dưới không chạy. |
| Không rơi xuống dòng sau | Dòng đã khớp mà công thức không tính được thì không xét dòng bên dưới. Cách ghi khi kết quả trống là Q4. Điều kiện không xác định được vì thiếu số trung bình là Q7. |
| Nguồn số hiện tại | Bản đã chốt kết quả tổng hợp thứ hạng nằm ở [PR 57058](https://github.com/ednity/school-web/pull/57058), **順位集計結果の確定** (xác định kết quả tổng hợp thứ hạng). PR chưa được gộp. Hiện tại công thức lấy số vừa chạy sau **集計実行** (chạy tổng hợp). |
| Thời điểm ghi điểm | **集計実行** (chạy tổng hợp) chỉ tạo số trung bình và không ghi đè cột điểm. **自動算出実行** (chạy tính điểm tự động) mới tính công thức và ghi vào cột. Lưu điểm, nhập CSV, chạy hàng loạt và liên kết **試験・採点管理** (quản lý thi và chấm điểm) dùng cùng cơ chế tính, giữ thời điểm ghi như hiện tại. |
| Không phải điểm liệt | **詳細設定（適用条件）** (thiết lập chi tiết, điều kiện áp dụng) của điểm liệt đã có **平均点** (điểm trung bình) trước **赤点の基準** (tiêu chuẩn điểm liệt). Kết quả chỉ là có bị điểm liệt hay không. |

## 3. Câu hỏi đang chờ khách hàng

| Câu | Đề xuất đang dùng tạm trong đặc tả | Nếu khách chọn phương án còn lại |
| --- | --- | --- |
| [Q1](sources/2026-10-09-business-questions.vi.md#q1) | Thêm **科目平均** (trung bình môn) vào **[基準値]** (giá trị gốc). Cả nhóm có thể nhận cùng **登録する値** (điểm sẽ ghi). | Chỉ để trung bình ở vế trái và vế phải. |
| [Q2](sources/2026-10-09-business-questions.vi.md#q2) | Sau khi PR 57058 được gộp, có bản đã chốt thì dùng bản đó, chưa có thì dùng số vừa chạy. | Luôn dùng số vừa chạy. |
| [Q3](sources/2026-10-09-business-questions.vi.md#q3) | Đưa số chưa làm tròn (tổng điểm ÷ số học sinh), đúng như code hiện tại. Phần lẻ chỉ xử lý ở dòng công thức. Đổi ngày 10/10 từ đề xuất cũ "số đang hiện trên màn thứ hạng". | Đưa đúng số đang hiện trên màn thứ hạng. |
| [Q4](sources/2026-10-09-business-questions.vi.md#q4) | Chưa lấy được điểm trung bình thì giữ điểm đang có trong cột đích. Chỉ ghi số mới khi công thức tính được. | Giữ như hiện tại: không tính được thì ghi trống và xóa điểm đang có. |
| [Q5](sources/2026-10-09-business-questions.vi.md#q5) | Giữ **学年平均** (trung bình cả khối), **HR平均** (trung bình lớp), nhóm thứ hạng và nhóm kết hợp. Không thêm trung bình của riêng một tiết học. | Thêm trung bình của riêng một tiết học. |
| [Q6](sources/2026-10-09-business-questions.vi.md#q6) | Một thiết lập được đặt khoảng, ví dụ lớn hơn 50 và nhỏ hơn 80, vì các điều kiện trên cùng một thiết lập phải đúng cùng lúc. | Mỗi thiết lập chỉ một mức. |
| [Q7](sources/2026-10-09-business-questions.vi.md#q7) | Điều kiện trung bình không xác định được vì chưa có số thì dừng ở dòng đó, không xét dòng dưới. Cột đích xử lý như Q4. | Coi là không khớp và xét tiếp dòng bên dưới. |

Đặc tả mô tả đề xuất này là phương án thiết kế tạm, và ghi rõ chỗ còn chờ trả lời. Không triển khai phương án còn lại song song chỉ để phòng khách chọn khác.

## 4. Đề xuất thiết kế nội bộ, chưa review

Các điểm dưới đây không cần hỏi khách nhưng chưa được review nội bộ. Chi tiết ở [đặc tả](docs/specification.vi.md).

| Mục | Đề xuất |
| --- | --- |
| Lưu điều kiện trung bình | Thêm một loại vào `setting_condition` của `auto_rating_conf_items.condition`. Lưu thiết lập thứ hạng, kỳ, nhóm theo cùng định dạng với vế trung bình môn của công thức; thêm dấu so sánh và mốc số. Không thêm bảng. |
| Kiểm tra khi lưu | Thiết lập thứ hạng, kỳ, nhóm, dấu và mốc đều bắt buộc. Mốc là số từ 0 trở lên, cho phép số thập phân. |
| Tham chiếu bị đổi tên hoặc xóa | Công thức hiện lưu thiết lập thứ hạng, kỳ, nhóm bằng tên. Đổi tên hoặc xóa thì mở lại không thấy lựa chọn cũ và khi tính không lấy được số. Đề xuất mở lại hiện cảnh báo chưa chọn, bắt chọn lại trước khi lưu; khi tính thì xử lý như thiếu số trung bình. |
| Dữ liệu cũ dùng OR | Điều kiện trung bình nối theo cách nối đang lưu của dòng. Dòng cũ dùng OR giữ nguyên nghĩa. Trước khi phát hành kiểm số dòng OR còn trong dữ liệu. |
| Hiển thị trên danh sách | Cột **自動計算の対象者** (học sinh được tính tự động) hiện điều kiện dạng "平均点 評点集計 1学期期末/学年平均 50点以上" (điểm trung bình, thiết lập thứ hạng, kỳ/nhóm, mốc). |
| Quyền | Giữ quyền của màn tính điểm tự động hiện có. Không thêm quyền mới. |
| Đường tính | Mọi đường gọi tính điểm tự động, gồm liên kết thi phía học sinh và xử lý riêng của trường, áp dụng cùng quy tắc. Bốn thư viện riêng của trường chưa đọc chi tiết. |

## 5. Thiết kế giao diện

[Figma RA-001](https://www.figma.com/design/OkFTBuOyoF2hNnxCFy4Uds/), vẽ theo UI đang chạy. Các trang **00｜Guide**, **01｜List and priority**, **02｜Conditions**, **03｜Formula**, **04｜Mapping states**. Version mới nhất "RA-001 v5". Figma thể hiện đề xuất hiện hành, không phải xác nhận của khách.

## 6. Tài liệu chưa làm

Tiêu chí nghiệm thu, chia việc và đặc tả kiểm thử làm sau khi khách trả lời Q1–Q7. Không tạo file rỗng trước.

## 7. Thứ tự đọc

1. Context này.
2. [Đặc tả](docs/specification.vi.md) và [đặc tả màn hình](docs/screen-definition.vi.md).
3. [Bản hỏi tiếng Việt](sources/2026-10-09-business-questions.vi.md) và [bản hỏi tiếng Nhật](sources/2026-10-09-business-questions.ja.md) khi cần đúng câu đang chờ khách.
4. [Ghi nhận nội bộ 10/10](sources/2026-10-10-internal-design-review.vi.md) và [hiện trạng code](research/current-auto-rating-behavior.vi.md) khi cần căn cứ.
