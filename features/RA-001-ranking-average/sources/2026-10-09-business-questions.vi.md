> Trạng thái： bản hỏi ngày 09/10/2026, cập nhật ngày 11/10/2026. Chưa có câu trả lời của khách hàng. Đây không phải Q&A đã xác nhận.
>
> Thay đổi ngày 11/10: đổi đề xuất Q3 sang số chưa làm tròn; ghi bộ dấu so sánh của điều kiện điểm trung bình; thêm Q7. Nếu bản 09/10 đã gửi khách, gửi kèm phần thay đổi này.

# Dùng điểm trung bình của tổng hợp thứ hạng trong tính điểm tự động — Những điểm cần xác nhận

Yêu cầu là dùng điểm trung bình do tổng hợp thứ hạng tính ra trong tính điểm tự động. Ví dụ điểm dự kiến: điểm của học sinh ở bài đã thi là 60, trung bình nhóm ở bài đó là 50, trung bình nhóm ở bài học sinh nghỉ là 70. Phép tính 60 × 70 ÷ 50 = 84.

Số 60 là điểm ở cột được chọn trong công thức, ví dụ **素点** (điểm thô). Số 84 được ghi vào cột đang tính, ví dụ **1学期期末 評点** (điểm đánh giá cuối học kỳ 1). Nếu cột này đang có 75 do giáo viên nhập hoặc do lần tính trước, 75 không phải số đưa vào phép tính.

## Cách chúng tôi đang hiểu yêu cầu

Phần này là cách chúng tôi đang hiểu yêu cầu. Nếu chỗ nào chưa đúng, xin chỉnh lại. Các câu phía dưới là những điểm còn cần xác nhận.

- Ở **計算結果を登録する** (đăng ký kết quả tính), vế trái và vế phải chọn được **科目平均** (trung bình môn). Có bốn phép tính cộng, trừ, nhân, chia. Mỗi vế chọn riêng thiết lập thứ hạng, kỳ và nhóm. Các kỳ khác nhau nằm ở các dòng công thức khác nhau.
- Ở **マッピングした結果を登録する** (đăng ký kết quả đã so và chọn), khi **[基準値]** (giá trị gốc) là **計算結果** (kết quả tính), công thức phía dưới dùng cùng cách chọn trung bình môn.
- Trung bình lấy theo môn của tiết học đang tính.
- Hệ số theo lý do vắng và cách làm tròn trên từng dòng công thức theo quy định của từng trường.
- **科目平均** (trung bình môn) hiện chỉ có ở một số trường. Yêu cầu là đưa thành chức năng dùng chung. Phạm vi gồm lưu thiết lập, mở lại, tính và ghi điểm.
- Số trung bình trong công thức lấy từ kết quả tổng hợp thứ hạng. Bản đã chốt chưa có trong sản phẩm hiện tại, nên công thức lấy số vừa chạy. Cách dùng sau khi có bản đã chốt là câu Q2.
- Yêu cầu 3 đã được xác định ở mục dưới. Một thiết lập có được đặt khoảng điểm trung bình hay không là câu Q6.
- Điều kiện điểm trung bình dùng bộ dấu đang có của màn đã so và chọn: **以上** (từ … trở lên), **より大きい** (lớn hơn), **等しい** (bằng), **より小さい** (nhỏ hơn), **以下** (từ … trở xuống).
- **集計実行** (chạy tổng hợp) chỉ tạo số trung bình. **自動算出実行** (chạy tính điểm tự động) mới tính công thức và ghi vào cột. Chạy tổng hợp giữ nguyên điểm đang có trong cột. Lưu điểm, nhập CSV và tính tự động hàng loạt giữ như hiện tại.

### Yêu cầu 3 — Phạm vi đã xác định

Điểm liệt có hai bước. Bước chọn quy tắc, **詳細設定（適用条件）** (thiết lập chi tiết, điều kiện áp dụng), nằm trước bước đặt ngưỡng **赤点の基準** (tiêu chuẩn điểm liệt). Ở bước chọn quy tắc, điều kiện lọc đã có **平均点** (điểm trung bình). Một thiết lập có thể để từ 50 trở lên, một thiết lập khác để dưới 50. Dòng khớp đầu tiên thì dùng thiết lập đó. Kết quả của thiết lập khớp chỉ là có bị điểm liệt hay không. Bước này không chuyển công thức tính điểm tự động và không ghi điểm dự kiến.

Phạm vi dùng chung được xác định như sau:

- Thêm điểm trung bình vào điều kiện lọc tại màn **計算対象設定** (thiết lập đối tượng được tính), cho mọi trường.
- Từ 50 trở lên là một thiết lập, gắn công thức A. Nhỏ hơn 50 (**50 より小さい**) là một thiết lập khác, gắn công thức B. Danh sách xét từ trên xuống, dòng khớp đầu tiên thì chạy. Thiết lập **全員が対象** (mọi học sinh đều là đối tượng) đặt trên cùng thì các dòng bên dưới không chạy.
- Dòng khớp mà công thức không tính được thì không xét dòng bên dưới. Kết quả trống xử lý ở câu Q4. Điều kiện trung bình chưa có số để so là câu Q7.
- Công thức của dòng khớp vẫn dùng **科目平均** (trung bình môn). Cách chọn này được mở cho mọi trường.
- Số trung bình lấy theo môn của tiết đang tính, đúng thiết lập thứ hạng, kỳ và nhóm đã chọn. Hiện tại lấy số vừa chạy. Cách dùng sau khi có bản đã chốt là câu Q2.
- Lưu điều kiện và công thức, mở lại đúng lựa chọn, tính khi chạy tính điểm tự động, rồi ghi điểm vào cột.

<a id="q1"></a>

## Q1 — Trung bình môn để vào ô giá trị gốc hay chỉ vào công thức

**Hiện trạng：** Trên **マッピングした結果を登録する** (đăng ký kết quả đã so và chọn), ô **[基準値]** (giá trị gốc) hiện là một cột điểm hoặc **計算結果** (kết quả tính). Chọn kết quả tính thì phía dưới hiện công thức. Vế trái và vế phải của công thức đã chọn được **科目平均** (trung bình môn) ở một số trường. Ô giá trị gốc thì chưa có trung bình môn.

**Vấn đề：** Thêm trung bình môn vào hai chỗ này cho hai kết quả khác nhau. Để vào ô giá trị gốc thì cả nhóm so với cùng một số trung bình. Đủ khung thì mọi học sinh được ghi cùng một điểm, là số ở ô **登録する値** (điểm sẽ ghi). Để vào vế trái và vế phải thì mỗi học sinh được tính một số riêng, rồi số riêng đó mới đem đi so khung.

Ví dụ trung bình cả khối là 72 và khung ghi 80 khi từ 70 trở lên. Để trung bình vào ô giá trị gốc thì học sinh nào trong khối cũng được 80. Để trung bình vào công thức thì học sinh có điểm 60 và học sinh có điểm 90 có thể ra hai kết quả khác nhau, rồi mỗi kết quả so khung riêng.

Cách chọn trung bình ở vế trái và vế phải vẫn thực hiện trong cả hai phương án. Câu này chỉ xác nhận có thêm vào ô giá trị gốc hay không.

**Phương án：**

- Phương án A: Thêm **科目平均** (trung bình môn) vào ô **[基準値]** (giá trị gốc). Cả nhóm dùng chung một số trung bình để so khung và có thể nhận cùng một điểm sẽ ghi.
- Phương án B: Không thêm vào ô giá trị gốc. Trung bình môn chỉ đưa vào vế trái và vế phải của công thức. Mỗi học sinh có số riêng rồi mới so khung.

**Đề xuất：** Phương án A. Bảng đánh giá theo khoảng điểm trung bình cần chính số trung bình để so với khung. Điểm dự kiến của từng học sinh, như 84, vẫn tính ở công thức. Lưu ý: các học sinh có cùng một số trung bình sẽ nhận cùng một điểm sẽ ghi.

**Nhờ xác nhận：** Có thêm trung bình môn vào ô giá trị gốc hay không?

**Khách xác nhận (12/10/2026)：** Không thêm **科目平均** vào **[基準値]**. Dùng **計算結果** rồi đặt trung bình môn ở vế trái/phải của công thức (phương án B).

<a id="q2"></a>

## Q2 — Công thức lấy số đã chốt hay số vừa chạy

**Hiện trạng：** Bản đã chốt là bản giữ riêng kết quả tổng hợp thứ hạng. Chức năng này nằm ở [PR 57058](https://github.com/ednity/school-web/pull/57058), **順位集計結果の確定** (xác định kết quả tổng hợp thứ hạng). PR này chưa được gộp vào sản phẩm, nên hiện tại chưa có bản đã chốt. **科目平均** (trung bình môn) hiện tại lấy số vừa chạy, là kết quả mới nhất sau khi bấm **集計実行** (chạy tổng hợp).

Sau khi PR được gộp, cùng một kỳ có thể có hai số. Chạy tổng hợp lại ghi đè số vừa chạy và không ghi vào bản đã chốt. Bản đã chốt đổi khi chốt lại, hoặc khi cập nhật bản chốt bằng số vừa chạy.

**Vấn đề：** Sau khi có bản đã chốt, hai số khác nhau thì điểm dự kiến khác nhau. Bản đã chốt là 70, lần chạy lại ra 68. Phép 60 × 70 ÷ 50 và phép 60 × 68 ÷ 50 ra hai điểm khác nhau. Hiện tại chỉ có số vừa chạy.

**Phương án：**

- Phương án A: Có bản đã chốt thì dùng bản đó. Chưa có bản đã chốt thì dùng số vừa chạy.
- Phương án B: Luôn dùng số vừa chạy, kể cả khi đã có bản chốt.

**Đề xuất：** Hiện tại, vì PR 57058 chưa được gộp, công thức lấy số vừa chạy. Sau khi có bản đã chốt, dùng phương án A. Số vừa chạy mới hơn sẽ chưa vào công thức cho tới khi có bản chốt mới. Lưu ý: công thức có thể chưa theo lần chạy tổng hợp mới nhất.

**Nhờ xác nhận：** Công thức có ưu tiên bản đã chốt, và chỉ dùng số vừa chạy khi chưa có bản đó, hay không?

**Trạng thái (12/10/2026)：** Chưa chốt. Khách nghiêng về chỉ cho chọn kết quả đã chốt, sẽ bàn với mw rồi quyết. Đã ghi ở **成績シート** No.1 như spec chung với xét điểm liệt.

**Khách xác nhận (19/10/2026)：** Chỉ dùng **kết quả tổng hợp thứ hạng đã chốt và còn hiệu lực**; không lấy số vừa chạy thay thế. Chính sách này áp dụng thống nhất cho xét điểm liệt, tính điểm tự động (RA-001) và bảng ánh xạ theo khoảng điểm trung bình ([thread Slack](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1792383099678219)). Đây là phương án "chỉ bản đã chốt" của [đặc tả mục 8.2](../docs/specification.vi.md#source), không phải phương án B của câu hỏi gốc ở trên (luôn dùng số vừa chạy).

- Không có bản chốt hợp lệ cho phạm vi cần đọc thì trung bình coi như thiếu. Điều kiện trung bình thiếu số thì không khớp, xét dòng dưới (Q7); công thức không tính được thì ghi trống vào cột đích (Q4).
- Dropdown **順位集計設定** (thiết lập tổng hợp thứ hạng) hiện **mọi thiết lập đã tạo**, bất kể đã chốt hay chưa. Trạng thái chốt chỉ ảnh hưởng số được đọc khi tính.
- Chức năng này (RA-001) **tạm dừng ở mức hiện tại** theo chỉ đạo của shite: người làm chức năng chốt tổng hợp thứ hạng có thể làm cùng phần này; giữ tiến độ đã có, ưu tiên việc khác.

<a id="q3"></a>

## Q3 — Lấy số đang hiện trên màn thứ hạng hay số chưa làm tròn

**Hiện trạng：** Màn **集計設定(評点集計)** (thiết lập tổng hợp điểm đánh giá) có dòng **端数処理** (xử lý phần lẻ). Dòng này có thể để số lẻ thứ 1 và **四捨五入** (làm tròn thông thường). Dòng ghi chú nói dòng này dùng khi tính điểm trung bình và độ lệch chuẩn. Khi đó màn thứ hạng hiện 38, trong khi số chưa làm tròn là 37,5. Dòng công thức còn có chỗ làm tròn riêng: **しない** (không làm tròn) hoặc **する** (có làm tròn).

Hiện tại, khi công thức dùng **科目平均** (trung bình môn), hệ thống lấy số chưa làm tròn, tức tổng điểm chia số học sinh, ví dụ 37,5.

**Vấn đề：** Đưa 38 hay 37,5 vào công thức thì kết quả khác nhau. Làm tròn ở tổng hợp thứ hạng rồi làm tròn lại ở dòng công thức là hai lần làm tròn.

**Phương án：**

- Phương án A: Đưa vào công thức đúng số đang hiện trên màn thứ hạng, ví dụ 38.
- Phương án B: Đưa số chưa làm tròn, ví dụ 37,5. Phần lẻ chỉ xử lý ở dòng công thức.

**Đề xuất：** Phương án B, giữ như hiện tại. Phần lẻ chỉ được xử lý một lần, ở dòng công thức, theo cách trường đã cấu hình. Điều kiện điểm trung bình cũng so bằng cùng số này. Lưu ý: số trong công thức có thể khác số đang hiện trên màn thứ hạng, ví dụ 37,5 so với 38.

**Nhờ xác nhận：** Số đưa vào công thức và điều kiện có phải số trung bình chưa làm tròn, như hiện tại, hay không?

**Khách xác nhận (12/10/2026)：** Dùng số trước làm tròn, giống xét điểm liệt (phương án đề xuất).

<a id="q4"></a>

## Q4 — Khi chưa có điểm trung bình, điểm đang có có được giữ không

**Hiện trạng：** Công thức cần **科目平均** (trung bình môn) mà chưa có số trung bình của đúng kỳ và đúng nhóm thì dòng công thức không ra số. Hiện tại, kết quả trống được ghi vào cột đang tính, nên điểm đang có trong cột đó bị xóa. Màn đã so và chọn mà không khớp khung nào cũng ghi trống. Chia cho 0 cũng không ra số. Trung bình bằng 0 vẫn là một số hợp lệ, miễn không dùng làm số chia.

**Vấn đề：** Cột **1学期期末 評点** (điểm đánh giá cuối học kỳ 1) đang có 75. Công thức là 60 × trung bình cuối kỳ ÷ trung bình giữa kỳ. Chưa chạy tổng hợp thì 70 và 50 chưa có, công thức không ra số. Cách đang chạy sẽ xóa 75. Điểm thô 60 được giữ nguyên.

Khi đã có 70 và 50, chạy **自動算出実行** (chạy tính điểm tự động) thì công thức ra 84 và ghi đè 75. Việc ghi 84 khi tính được không nằm trong câu này.

**Phương án：**

- Phương án A: Chưa lấy được điểm trung bình thì giữ 75. Chỉ ghi số mới khi công thức tính được.
- Phương án B: Giữ như hiện tại. Không tính được thì ghi trống, 75 bị xóa.

**Đề xuất：** Phương án A. Chưa chạy thứ hạng thì giữ điểm giáo viên đã nhập hoặc kết quả lần trước. Khi đã có điểm trung bình, chạy tính điểm tự động thì 84 ghi đè 75.

**Nhờ xác nhận：** Khi chưa có điểm trung bình, có giữ điểm đang nằm trong cột đang tính hay không?

**Khách xác nhận (12/10/2026)：** Làm theo cách tính điểm tự động hiện tại (phương án B). Không tính được thì ghi trống vào cột đang tính, 75 bị xóa. Khách trả lời lần đầu là giữ điểm; sau khi chúng tôi báo hiện trạng là ghi trống, khách đồng ý đổi: 「その方針で進めましょう」.

<a id="q5"></a>

## Q5 — Có cần trung bình của riêng một tiết học không

**Hiện trạng：** Loại giá trị của vế trái và vế phải hiện tại chưa có **科目平均** (trung bình môn) ở mọi trường. Lựa chọn này hiện có ở trường cấp 3 Uenomiya（上宮高等学校）và trường cấp 2 Uenomiya（上宮学園中学校）.

Chọn **科目平均** (trung bình môn) thì cạnh đó hiện thêm hai ô. Ô thứ nhất chọn tên thiết lập thứ hạng. Ô thứ hai chọn kỳ và nhóm. Nhóm đang có là **学年平均** (trung bình cả khối), **HR平均** (trung bình lớp), trung bình của một nhóm thứ hạng, và nhóm kết hợp. Danh sách chưa có trung bình của riêng một tiết học.

**Vấn đề：** Ví dụ điểm dự kiến dùng trung bình cả khối hoặc cả lớp, đúng các nhóm đang có. Nếu cùng một môn có nhiều tiết học và cần một số trung bình riêng cho từng tiết, danh sách hiện tại chưa có nhóm đó.

**Phương án：**

- Phương án A: Giữ các nhóm đang có, không thêm trung bình của riêng một tiết học.
- Phương án B: Thêm trung bình của riêng một tiết học vào ô nhóm.

**Đề xuất：** Phương án A. Ví dụ của yêu cầu là trung bình của nhóm đã được tổng hợp, như cả khối hoặc cả lớp. Phương án B chỉ cần khi cùng một môn có nhiều tiết và phải tách số trung bình theo từng tiết.

**Nhờ xác nhận：** Có giữ các nhóm đang có, không thêm trung bình của riêng một tiết học, hay không?

**Khách xác nhận (12/10/2026)：** Cần trung bình của tiết học (**授業平均**). Danh sách nhóm giống PR 57058.

<a id="q6"></a>

## Q6 — Một thiết lập có được đặt khoảng điểm trung bình không

**Hiện trạng：** Trên màn **計算対象設定** (thiết lập đối tượng được tính), nhiều điều kiện lọc của cùng một thiết lập phải đúng cùng lúc. Màn này chưa có điểm trung bình.

Từ 50 trở lên gắn công thức A và nhỏ hơn 50 gắn công thức B vẫn là hai thiết lập riêng.

**Vấn đề：** Khi thêm điểm trung bình vào màn này, cần xác nhận một thiết lập có được đặt hai mức thành một khoảng hay không. Ví dụ lớn hơn 50 và nhỏ hơn 80 thì học sinh có điểm trung bình nằm trong khoảng đó mới dùng công thức của thiết lập.

**Phương án：**

- Phương án A: Cho một thiết lập đặt khoảng. Hai mức trên cùng một thiết lập phải đúng cùng lúc.
- Phương án B: Mỗi thiết lập chỉ một mức, như từ 50 trở lên hoặc nhỏ hơn 50. Không ghép hai mức thành một khoảng.

**Đề xuất：** Phương án A. Các điều kiện trên cùng một thiết lập phải đúng cùng lúc, nên hai mức đó là một khoảng. Hai nhánh từ 50 trở lên và nhỏ hơn 50 vẫn là hai thiết lập.

**Nhờ xác nhận：** Một thiết lập có được đặt khoảng điểm trung bình, ví dụ lớn hơn 50 và nhỏ hơn 80, hay không?

**Khách xác nhận (12/10/2026)：** Được đặt cận dưới và cận trên trên một thiết lập, các điều kiện nối AND, giống xét điểm liệt.

<a id="q7"></a>

## Q7 — Chưa có điểm trung bình thì điều kiện được xét thế nào

**Hiện trạng：** Danh sách thiết lập được xét từ trên xuống, dòng khớp đầu tiên thì chạy. Màn **計算対象設定** (thiết lập đối tượng được tính) sẽ có thêm điều kiện điểm trung bình. Điểm trung bình chưa có khi chưa chạy tổng hợp, hoặc khi nhóm của học sinh không có kết quả ở kỳ đã chọn.

**Vấn đề：** Khi chưa có số để so, chưa biết dòng có điều kiện trung bình được coi là khớp hay không. Kết quả khác nhau.

Ví dụ: dòng 1 từ 50 trở lên dùng công thức A, dòng 2 nhỏ hơn 50 dùng công thức B, dòng 3 **全員が対象** (mọi học sinh đều là đối tượng) dùng công thức C. Lớp của học sinh chưa có điểm trung bình. Nếu coi là không khớp, dòng 1 và dòng 2 đều bị bỏ qua, học sinh rơi xuống dòng 3 và nhận kết quả của công thức C, dù yêu cầu là chọn A hoặc B theo trung bình.

**Phương án：**

- Phương án A: Dừng ở dòng có điều kiện chưa xác định được, không xét dòng bên dưới. Cột đích xử lý như khi công thức không tính được, theo Q4.
- Phương án B: Coi là không khớp và xét tiếp dòng bên dưới.

**Đề xuất：** Phương án A. Học sinh không bị áp nhầm công thức của dòng khác chỉ vì chưa chạy tổng hợp. Cách này giống điểm liệt: điều kiện ưu tiên cao chưa xác định được thì không thử quy tắc thấp hơn. Lưu ý: cần chạy tổng hợp trước khi chạy tính điểm tự động thì học sinh mới được tính.

**Nhờ xác nhận：** Khi chưa có điểm trung bình để so, có dừng ở dòng đó và không xét dòng bên dưới hay không?

**Khách xác nhận (12/10/2026)：** Làm theo cách tính điểm tự động hiện tại (phương án B). Khách yêu cầu điều tra cách xử lý hiện có khi không lấy được trung bình hoặc không tính được, rồi làm giống như vậy. Hiện trạng: điều kiện lọc không có giá trị để xét thì coi là không khớp, xét thiết lập tiếp theo; không khớp thiết lập nào thì ghi trống. Không lấy được điểm trung bình thì điều kiện trung bình coi là không khớp và xét dòng bên dưới. Khách trả lời: 「その方針で進めましょう」.
