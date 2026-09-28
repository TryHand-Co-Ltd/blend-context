# Q&A đã xác nhận về chức năng điểm đỏ（赤点）

Ngày cập nhật: **25/09/2026**.

Tài liệu ghi lại các yêu cầu đã có, [phản hồi ngày 24/09 cùng ảnh gốc trên Slack](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1790245548913629?thread_ts=1789563761.146189&cid=C0BRGJA6XDE), [trả lời Q&A cuộc họp](https://tryhand.slack.com/files/U096NBBJLSU/F0C498QAKAQ/2026-09-24_______qa___________________.md?origin_team=T08LS8ZGDTP) và [phản hồi bổ sung ngày 25/09](https://app.slack.com/client/T08LS8ZGDTP/C0BRGJA6XDE/thread/C0BRGJA6XDE-1789563761.146189/1790315716.848689). Những nội dung xác minh bằng source được ghi riêng ở phần 2; chúng không được gọi là xác nhận nghiệp vụ.

Giữ nguyên số Q1–Q30 của tài liệu này. Phần 3 bổ sung **Q31 cho xác nhận Q3 của bộ câu hỏi đã gửi** (bản ngày 24/09); không nhầm với Q3 của tài liệu confirmed này. Xác nhận bổ sung được người phụ trách cung cấp nguyên văn trong phiên ngày 25/09, chưa có permalink riêng. Các câu hỏi bổ sung về hiện trạng AutoRating và thứ tự hiển thị đã có kết quả điều tra để trả lời, không phải quyết định nghiệp vụ mới đã được khách hàng duyệt.

## 1. Yêu cầu đã có và nội dung được xác nhận

### Q1 — Ai được thiết lập điều kiện điểm đỏ?

**Đã xác nhận.** Người có quyền sửa mục đánh giá được thiết lập điều kiện điểm đỏ của mục đó, theo quyền truy cập chức năng và quyền sửa mục hiện có. Giáo viên thường có thể sử dụng khi thỏa cả hai điều kiện; không giới hạn chỉ nhân viên nội bộ. Có quyền vào Thiết lập nhập điểm（成績入力設定） không có nghĩa được sửa mọi mục.

Quyền sửa một mục không tự cấp quyền chạy tính toán hàng loạt cho toàn khối hoặc toàn trường. Quy trình chạy lại hàng loạt vẫn cần đối chiếu quyền hiện hành.

### Q2 — Những loại điểm nào thuộc đối tượng?

**Đã xác nhận.** Bao gồm Nhập số nguyên（数値入力（整数））, Nhập số thập phân（数値入力（小数）） và điểm số theo đơn vị bài học. Không tiếp tục để điểm đơn vị ở trạng thái chưa xác nhận.

Kiểu lựa chọn（選択肢型） như A/B/C hoặc Đạt/không đạt（合否） bị loại khỏi phiên bản đầu; chỉ là ứng viên mở rộng. Chưa chốt việc mở rộng sẽ xét theo lựa chọn cụ thể hay giá trị quy đổi. Không sử dụng mã lưu của lựa chọn như điểm số.

Việc không xét đỏ cho mục A/B/C không loại bỏ các bộ lọc theo lựa chọn đang được dùng để xác định đối tượng của một mục điểm số.

### Q3 — Dùng điểm nào để xét, và phân biệt điểm 0 với ô trống thế nào?

**Tiếp tục yêu cầu đã có.** Xét điểm cuối cùng đã lưu sau các xử lý điểm liên quan, bao gồm Điểm dự kiến（見込点） và điểm nhập/sửa tay. Không bắt buộc mục phải có công thức tính tự động mới được xét đỏ.

Ví dụ điểm được sửa từ 28 thành 35 thì xét 35. Nếu phép tính tạo 120 nhưng xử lý lưu điểm hợp lệ giới hạn còn 100, phải xét điểm cuối 100. Không thay đổi điểm học sinh chỉ để khớp với kết quả xét cũ.

Cờ Chưa dự thi（未受験） không tự loại điểm có giá trị số khỏi xét đỏ; loại khỏi thứ hạng là quyết định khác. Không đổi ô trống thành 0. Điểm 0 hợp lệ được xét như một số; ô không có điểm không được kết luận đạt hoặc đỏ từ một giá trị 0 giả. Yêu cầu điểm rỗng không xét được kế thừa, không đồng nhất với thiếu trung bình khi vẫn có điểm số.

### Q4 — Điểm bằng ngưỡng có bị xét đỏ không?

**Đã xác nhận thay đổi.** Người thiết lập được chọn Nhỏ hơn（未満） hoặc Nhỏ hơn hoặc bằng（以下）.

Với ngưỡng 30: điểm 30 không đỏ khi chọn nhỏ hơn, nhưng đỏ khi chọn nhỏ hơn hoặc bằng. Không tiếp tục áp dụng quy định cũ rằng mọi điều kiện mới chỉ dùng phép so sánh nhỏ hơn.

Phép so sánh và xử lý phần lẻ là hai thiết lập khác nhau. Đổi dấu so sánh không thay thế việc làm tròn ngưỡng.

**Giữ yêu cầu cảnh báo biên đã có:** cảnh báo ngưỡng bằng 0 hoặc điểm tối đa phải theo ngưỡng cuối và dấu đã chọn, không theo riêng tham số nhập. Ngưỡng 0 với nhỏ hơn hoặc bằng vẫn chọn điểm 0; công thức trung bình trừ 0 có ngưỡng bằng trung bình, không phải 0.

**Giới hạn nhập đã kế thừa, không phải xác nhận mới:** khi lưu điều kiện cố định, giữ ngưỡng từ 0 đến điểm tối đa của đối tượng áp dụng; không dùng mức mặc định 100 để cho qua một nhóm thực tế chỉ có điểm tối đa 20. Nếu một ngưỡng chung không phù hợp mọi đối tượng thì điều chỉnh phạm vi hoặc cấu hình tương ứng. Không bổ sung lựa chọn nới giới hạn khi chưa có yêu cầu. Đây là kiểm tra lúc lưu cấu hình, không phải tự đổi ngưỡng đã lưu hoặc tự bỏ xét loại cố định khi điểm tối đa thay đổi về sau.

Giới hạn ô nhập ngưỡng cố định không cấm kết quả âm hợp lệ của công thức; chính sách này đã được xác nhận ngày 25/09 tại Q25.

### Q5 — Một mục đánh giá có một hay nhiều thiết lập điểm đỏ?

**Đã xác nhận.** Một mục có thể có nhiều thiết lập, mỗi thiết lập có điều kiện áp dụng và độ ưu tiên. Cách chọn theo ưu tiên tham chiếu tính toán tự động hiện có; không gộp tất cả các thiết lập rồi lấy kết quả nghiêm ngặt nhất.

Luồng màn hình là Thiết lập ô nhập（入力欄設定） → danh sách thiết lập điểm đỏ của mục → sửa điều kiện áp dụng hoặc sửa ngưỡng/công thức. Ảnh gốc số 2 trên Slack là mẫu danh sách; ảnh số 3 là mẫu màn điều kiện áp dụng.

Phân nhánh trung bình được biểu diễn ở điều kiện áp dụng, chẳng hạn cấu hình 1 dùng khi trung bình từ 60 trở lên, cấu hình 2 dùng khi dưới 60. Không giới hạn cấu trúc thành một form chỉ có đúng hai nhánh.

### Q6 — Ngưỡng dùng trung bình có chỉ gồm hai công thức cố định không?

**Đã xác nhận hướng thiết kế.** Thiết kế cho phép chọn nguồn trung bình và thực hiện cộng, trừ, nhân, chia để tạo ngưỡng; tham chiếu các dòng tính của Đăng ký kết quả tính toán（計算結果を登録する） trong ảnh gốc số 1.

Các ví dụ cần biểu diễn được gồm `A × 0.5`, `A − 20`, `A + 5`, `(A ÷ 2) × k`. Kết quả là ngưỡng để so với điểm, không phải giá trị ghi đè điểm học sinh.

Tập toán hạng cụ thể phải được mô tả trong thiết kế. Từ “biến” trong ví dụ chưa yêu cầu ngôn ngữ công thức tự do, script, hàm tùy ý hoặc một hệ thống biến mới. Những khả năng này không tự được đưa vào phạm vi.

### Q7 — Công thức dùng trung bình xử lý phần lẻ như thế nào?

**Đã xác nhận hướng chức năng.** Cho phép có hoặc không xử lý phần lẻ trong quá trình tính, tương tự tính toán tự động và cột Xử lý phần lẻ（端数処理） trong ảnh gốc số 4. Không áp một lựa chọn giữ lẻ/cắt nguyên bắt buộc cho mọi công thức.

Ví dụ trung bình 49.7 trừ 20 cho 29.7; nếu người dùng chọn cắt về số nguyên thì ngưỡng thành 29. Điểm 29.5 sẽ cho kết quả khác nhau. Không cắt điểm của học sinh thay cho cắt ngưỡng.

Cách làm tròn, vị trí chữ số và mặc định cần được ghi cụ thể trong thiết kế dựa trên cơ chế tham chiếu. Ngày 25/09 đã xác nhận cho chọn xử lý phần lẻ cả với điều kiện tỷ lệ điểm tối đa; xem Q24.

### Q8 — Trung bình dùng để chọn nhánh là trước hay sau làm tròn?

**Giữ hướng đã được trả lời trước đó.** Dùng trung bình trước làm tròn từ kết quả tổng hợp được chọn. Trung bình thật 49.99 không được coi là 50 chỉ vì màn hình hiển thị 50.

Cho phép xử lý phần lẻ trong công thức tính ngưỡng không tự thay đổi nguyên tắc chọn nhánh. Không tính lại trung bình từ các điểm chưa được tổng hợp để tạo một nguồn mới ngoài quy trình.

### Q9 — Lấy trung bình của nhóm nào và kết quả tổng hợp nào?

**Đã xác nhận.** Chỉ định Thời kỳ tổng hợp（集計対象時期）, Thiết lập tổng hợp thứ hạng（順位集計設定） và Nhóm học sinh được tổng hợp（集計対象（母集団））, rồi lấy đúng môn và mục tương ứng. Điểm theo đơn vị phải được giữ đúng ngữ cảnh đơn vị.

Có kết quả đã chốt tương ứng thì ưu tiên kết quả đó; chưa chốt thì dùng kết quả tổng hợp đã thực hiện mới nhất có sẵn. Không có radio cho người dùng bỏ qua bản chốt theo ý muốn. Không dùng một bản chốt khác kỳ chỉ vì mới hơn.

Danh sách học sinh lọc để trích xuất, công khai hoặc in phiếu không trở thành nhóm mới để tính trung bình. Đối tượng áp dụng điều kiện và nhóm tham chiếu trung bình là hai khái niệm riêng.

### Q10 — Điều kiện nào không cần nguồn trung bình?

**Đã xác nhận.** Điểm cố định và tỷ lệ theo điểm tối đa độc lập không cần nguồn trung bình.

Tuy nhiên, nếu điều kiện áp dụng của một ngưỡng cố định lại là “trung bình từ 60 trở lên”, toàn bộ thiết lập vẫn phụ thuộc trung bình. Chỉ coi là độc lập khi cả phần chọn thiết lập lẫn phần tính ngưỡng đều không sử dụng trung bình.

### Q11 — Khi nào xét điểm đỏ và có cần chế độ thủ công/tự động riêng không?

**Đã xác nhận thay đổi.** Không có hai chế độ riêng cho điểm đỏ. Đăng ký/sửa điểm và xử lý tính toán tự động liên quan là đường chạy xét; thao tác tính toán hàng loạt hiện có phải bao phủ bước xét theo phạm vi được hỗ trợ.

Điểm cố định hoặc tỷ lệ không phụ thuộc trung bình được xác định khi đăng ký điểm. Các điều kiện cần trung bình sử dụng nguồn hợp lệ đã có; thiếu nguồn thì bỏ qua phép tính đó.

Ví dụ sửa 29 thành 40 với điều kiện dưới 30: khi lượt lưu và xét thành công, điểm 40 không còn đỏ. Không giải thích rằng phải chờ một “chế độ thủ công” riêng.

### Q12 — Quy trình vận hành khi có đánh giá tương đối là gì?

**Đã xác nhận.** Tắt tổng hợp thứ hạng tự động khi đăng ký điểm. Sau khi điểm của toàn bộ nhóm cần tham chiếu đã đầy đủ, vào [Tổng hợp thành tích（成績集計）](https://ad31.schoolstg.mwsite.work/admin/grade/grade_setting_system/grade_calc), chạy nút xanh Thực hiện tổng hợp（集計実行）, chờ hoàn tất, rồi chạy nút cam Thực hiện tính toán tự động（自動算出実行）.

Ảnh gốc số 5 chỉ vị trí bật/tắt, nhưng đang chọn Thực hiện（実行する）; trạng thái vận hành được yêu cầu là Không thực hiện（実行しない）. Ảnh số 6 chỉ đúng hai thao tác xanh/cam.

Tắt tự tổng hợp không tắt bước xét khi đăng ký điểm. Chạy nút xanh không tự chứng minh đã cập nhật kết quả đỏ. Nếu đang dùng bản chốt, một lần tổng hợp mới không tự thay bản chốt đó. Các thao tác bỏ sót được quản lý bằng quy trình vận hành; không tự thêm vòng lặp tổng hợp–tính lại đến khi hội tụ.

### Q13 — Lưu điều kiện hoặc thay nguồn có cập nhật ngay kết quả không?

**Đã xác nhận.** Lưu cấu hình không đồng nghĩa đã chạy xét. Khi sửa điều kiện, đổi nhóm trung bình hoặc cập nhật kết quả tổng hợp, được giữ kết quả đỏ/không đỏ đã hoàn tất trước đó đến lần chạy lại phù hợp. Không đưa điểm hiển thị trở về giá trị cũ.

Ví dụ điểm 32 đang không đỏ theo ngưỡng dưới 30; đổi thành dưới 35 rồi mới lưu cấu hình thì kết quả trước vẫn được dùng. Sau lần xét thành công mới chuyển thành đỏ.

Không bổ sung bắt buộc cơ chế theo dõi mọi phụ thuộc để tự xét toàn bộ học sinh khi nhóm nguồn hoặc kết quả tổng hợp thay đổi. Nếu thay điểm một học sinh làm trung bình của cả nhóm thay đổi, quy trình cần chạy lại đúng phạm vi nhóm chịu ảnh hưởng.

Giữ cảnh báo/hướng dẫn chạy lại phù hợp. Quy tắc giữ kết quả trong lúc **chưa chạy lại** không tự quyết định cách xử lý **đã chạy nhưng thiếu dữ liệu**.

Ngày 25/09 đã xác nhận riêng: sau lần xét không tạo được ngưỡng hợp lệ thì ngừng dùng kết quả trước (Q26); xóa thiết lập cuối cùng thì giữ kết quả trong lúc chưa chạy lại (Q28). Không gộp hai thời điểm này.

### Q14 — Thay điểm tối đa thì xử lý thế nào?

**Đã có hướng xử lý.** Không xóa kết quả xét trước chỉ vì vừa đổi điểm tối đa. Đường thay đổi nào vốn chạy tính toán tự động thì tích hợp xét theo đường đó; đường chỉ lưu cấu hình sẽ phản ánh qua đăng ký điểm hoặc chạy lại tính toán.

Không có yêu cầu tự xét mọi phạm vi từ tất cả màn lưu điểm tối đa. Ngày 25/09 đã xác nhận dùng điểm tối đa hiện hành cho điều kiện tỷ lệ độc lập (Q23). Câu hỏi khách hàng hỏi lại về AutoRating được đối chiếu hiện trạng tại Q20; lời “nếu AutoRating chạy thì xét lại” không phải xác nhận rằng mọi màn đều tự chạy.

### Q15 — Thiếu dữ liệu xét có chặn công khai hoặc phát hành không?

**Đã xác nhận.** Không bổ sung chặn Trích xuất thành tích（成績抽出）, Công khai thành tích（成績公開） hoặc Công cụ phiếu điểm（通知表ツール） chỉ vì chưa xét được điểm đỏ.

Chưa từng có kết quả thì không gắn dấu đỏ và vẫn dùng thiết lập hiển thị hiện hữu. Không có dấu đỏ không có nghĩa đã được xét đạt. Giữ quyền, lịch công khai, ẩn điểm và cảnh báo liên quan.

Thiếu trung bình thì bỏ qua, không thay bằng 0 hoặc tự chọn nhóm khác. Điểm tối đa không hợp lệ cũng không tạo kết luận từ mẫu số giả. Chính sách **ngừng dùng kết quả cũ sau lần xét không tạo được ngưỡng hợp lệ** đã được bổ sung ngày 25/09 tại Q26; không coi thiếu dấu đỏ là đã đạt.

### Q16 — Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?

**Yêu cầu đã có, tiếp tục áp dụng.** Ba đầu ra sử dụng cùng kết quả xét đã hoàn tất; cách trình bày được cấu hình riêng. Xem, xuất, công khai hoặc in lại không tự chạy xét và không tính lại ngưỡng theo danh sách đang lọc.

Giữ phạm vi định dạng đã có: trích xuất có lọc/ký hiệu trước/ký hiệu sau/tô ô; công khai có ngoặc hoặc dấu `*` trước/sau; phiếu có nguyên trạng/ngoặc/ký tự trước/sau. Bản đầu không thêm nền riêng cho điểm đỏ ở công khai và PDF. Ngày 25/09 đã xác nhận riêng thứ tự trên phiếu (Q29) và kết hợp hiệu ứng trên công khai (Q30); không áp chung một cơ chế cho cả hai đầu ra.

Điểm đã ẩn hoặc gạch chéo không được làm lộ lại bởi dấu đỏ. Dùng bản tổng hợp đã chốt không bổ sung yêu cầu lưu cố định toàn bộ phiếu hoặc quản lý phiên bản phiếu đã phát hành.

### Q17 — Có chuyển thiết lập điểm đỏ cũ sang chức năng mới không?

**Đã xác nhận.** Không kế thừa hoặc chuyển dữ liệu cũ thành điều kiện mới đang có hiệu lực. Câu hỏi giữ phép so sánh cũ khi chuyển dữ liệu không còn áp dụng.

Không chuyển dữ liệu không có nghĩa được xóa cột, đổi nghĩa dữ liệu hoặc phá chức năng tùy biến trường đang dùng điểm đỏ cũ. Cần trình bày thiết kế lưu cấu hình/kết quả mới và ảnh hưởng với phần cũ khi hoàn tất thiết kế DB.

### Q18 — Thiết kế đầy đủ có đồng nghĩa phát hành toàn bộ không?

**Đã xác nhận cách làm.** Tiếp tục thiết kế đầy đủ: nhiều thiết lập và ưu tiên, điều kiện áp dụng, điểm cố định/tỷ lệ điểm, công thức trung bình và xử lý phần lẻ, ba đầu ra, số nguyên/thập phân và điểm đơn vị. Thiết kế có thể được hoàn thiện/mở rộng qua review; phần chưa xác nhận phải giữ nhãn đề xuất hoặc câu hỏi mở.

**Quy trình được người phụ trách yêu cầu:** bắt đầu thiết kế từ các yêu cầu đã xác nhận; không cần đợi toàn bộ Q&A còn mở được trả lời. Các lựa chọn tạm dùng để vẽ và mô tả phải được ghi là giả định thiết kế, không phải xác nhận nghiệp vụ. Khi có câu trả lời, cập nhật context và những phần thiết kế chịu ảnh hưởng trước khi chốt triển khai/phát hành.

**Phạm vi triển khai/phát hành chưa chốt.** Cấu hình tối thiểu được trao đổi là điểm cố định; có thể thêm tỷ lệ điểm. Công thức và phân nhánh trung bình có thể để giai đoạn sau. Phải giới hạn rõ danh sách được phát hành sau khi đầu mối thống nhất với Sales/CS và trường. Không coi bản thiết kế đầy đủ là phê duyệt triển khai toàn bộ.

Mỗi phần được phát hành phải sử dụng được từ thiết lập → xét → ba đầu ra tương ứng. Không quảng bá là hỗ trợ mọi hình thức đánh giá tương đối; các dạng phân phối xếp loại, top %, hệ thống biến tùy ý và kiểu lựa chọn chưa được đưa vào phạm vi.

## 2. Các câu hỏi hiện trạng đã được research làm rõ

Những kết luận sau là **bằng chứng source để thiết kế**, không phải câu trả lời nghiệp vụ mới hoặc chứng minh tính năng mới đã chạy đúng.

### Q19 — BLEND hiện giữ giá trị thế nào khi đổi phương thức tính?

**Đã xác minh trong source.** Đổi phương thức trong cùng phiên chủ yếu ẩn/hiện vùng nhập. Lưu có thể ghi cả các khối đang ẩn, nhưng mở lại chỉ phục hồi vùng của phương thức hiện hành. Vì vậy không bảo đảm khôi phục đầy đủ phương thức cũ qua nhiều lần lưu/mở lại. Đổi loại toán hạng là thao tác khác và có trường hợp đặt lại lựa chọn.

Đủ căn cứ hoàn thành yêu cầu tham khảo cách hiện có. Hướng thiết kế là không bổ sung lưu lịch sử mọi loại cấu hình; hành vi chi tiết cần thể hiện trong thiết kế, không ghi “luôn giữ” hoặc “luôn xóa” cho mọi trường.

### Q20 — Những đường đổi điểm tối đa nào hiện chạy tính tự động?

**Đã xác minh trong source; bổ sung ngày 25/09 để trả lời câu hỏi trong Q1 đã gửi.** Lưu tại [Thiết lập điểm tối đa（満点設定）](https://ad31.schoolstg.mwsite.work/admin/grade_report_setting/manage/detail/option/register/change_max_score) trong ảnh thứ nhất chỉ lưu định nghĩa lựa chọn/điểm tối đa tương ứng, không tự gọi hoặc xếp hàng AutoRating trong luồng đã kiểm. Sửa Giá trị tối đa（最大値） ở Thiết lập ô nhập（入力欄設定） trong ảnh thứ hai cũng không tự gọi AutoRating.

Đây là thao tác khác với chọn lựa chọn áp dụng cho lớp rồi đăng ký điểm trong hệ thống thành tích mới: đường đăng ký điểm có gọi AutoRating. Màn Thiết lập điểm tối đa hàng loạt（満点一括設定） có xếp hàng AutoRating cho phạm vi lớp/kỳ được phép; màn này chỉ dùng được khi chức năng được bật và thỏa quyền/các điều kiện hiện có. Xếp hàng không đồng nghĩa mọi ô đã được tính hoặc lượt chạy đã hoàn tất. Không tự áp kết luận của hệ thống mới cho mọi hệ thống cũ/tùy biến.

Khảo sát trước đó cũng ghi nhận sửa mức riêng đơn vị ở đường cấu hình đã đọc không tự gọi tính tự động; không suy mọi thao tác mang tên đổi maximum đều có cùng trigger.

Đây là căn cứ đặt bước tích hợp theo luồng hiện có, không phải bằng chứng mọi đường ghi điểm của toàn hệ thống đã được kiểm hoặc chức năng đỏ mới đã tích hợp xong.

### Q21 — Xử lý hiện có có bảo đảm cả lượt hàng loạt cùng thành công hoặc cùng thất bại không?

**Đã xác minh trong source.** Lưu điểm trực tiếp/CSV có ranh giới transaction của lượt đăng ký; đường batch đã khảo sát ghi dần. Số lớp xử lý xong không chứng minh mọi ô đều tạo kết quả mới. Không có căn cứ hứa rollback toàn bộ batch khi phần sau lỗi.

Team thiết kế tích hợp theo ranh giới ghi hiện có, phân biệt phần đã lưu, phần bỏ qua và phần thất bại. Không cần người sử dụng quyết định transaction hay công nghệ hàng đợi. Chính sách với ô không tạo được ngưỡng hợp lệ đã chốt tại Q26; không suy rộng câu trả lời đó thành bảo đảm xử lý mọi lỗi lưu dữ liệu hoặc rollback toàn bộ batch.

### Q22 — Cơ chế công thức và ưu tiên nào đã có để tham chiếu?

**Đã xác minh trong source.** Có các phép cộng/trừ/nhân/chia, toán hạng trung bình nhóm và tham chiếu dòng trước, xử lý phần lẻ theo dòng. Hiện trạng vị trí chữ số bằng 1 nghĩa xử lý về số nguyên, không phải giữ một chữ số thập phân. Các giá trị mặc định và giới hạn của UI hiện hữu là căn cứ đề xuất, không tự trở thành xác nhận riêng cho ngưỡng đỏ.

Tính toán tự động chọn cấu hình khớp đầu tiên trước khi tính; thiếu dữ liệu của cấu hình đó không tự chuyển sang cấu hình thấp hơn. Phiếu điểm dùng điều kiện hiển thị khớp đầu tiên: môn cụ thể → các ô chọn theo thứ tự → ô trống. Kể cả kiểu nguyên trạng cũng kết thúc xét điều kiện. Ngày 25/09, khách hàng chọn vị trí điều kiện đỏ mới sau các ô chọn và trước ô trống (Q29); kết quả kiểm code giải đáp câu hỏi về cơ chế hiện hữu, không phải bằng chứng dòng đỏ mới đã được triển khai.

Nếu điều kiện phía trên đã ẩn/gạch chéo, dòng đỏ phía dưới không được làm hiện lại điểm. Không mô tả code là quét mọi dòng để ưu tiên bất kỳ điều kiện ẩn/gạch chéo ở vị trí nào.

Không dùng nguyên tác dụng ghi/xóa/giới hạn điểm của bộ tính hiện có để tạo ngưỡng hoặc dấu đỏ. Điều kiện không khớp, ô không còn điểm và thiếu trung bình là những tình huống cần được phân biệt.

## 3. Các quyết định bổ sung ngày 25/09

Nguồn: [phản hồi Q1–Q7.2 ngày 25/09](https://app.slack.com/client/T08LS8ZGDTP/C0BRGJA6XDE/thread/C0BRGJA6XDE-1789563761.146189/1790315716.848689). Số trong ngoặc dưới đây giữ nguyên số câu của bộ Q&A đã gửi, không đổi số của bộ đó.

### Q23 — Khi xét tỷ lệ điểm, dùng điểm tối đa nào? (Q1 đã gửi)

**Đã xác nhận A.** Khi đăng ký điểm hoặc chạy xét lại theo luồng đã thống nhất, dùng điểm cuối của học sinh và điểm tối đa hiện hành có hiệu lực cho đúng mục, lớp, kỳ và đơn vị. Không dùng điểm tối đa của kết quả tổng hợp đã chốt thay cho mức hiện hành của điều kiện tỷ lệ độc lập. Nguyên tắc ưu tiên bản chốt cho nguồn trung bình vẫn giữ riêng.

Ví dụ đã chốt tổng hợp ở maximum 100, sau đó maximum đổi thành 50 và điểm cuối vẫn là 20: lần xét mới với điều kiện nhỏ hơn 30% dùng ngưỡng `50 × 30% = 15`, nên 20 không đỏ. Đây là ví dụ phân biệt mẫu số, không yêu cầu giữ nguyên điểm học sinh khi trường thay thang điểm.

Khách hàng giải thích rằng thay thang điểm sau nhập điểm không phổ biến và thường đi kèm điều chỉnh điểm học sinh. Họ hỏi thêm vì sao Q&A đề cập bản chốt và màn nào tự chạy AutoRating; các nội dung này cần phản hồi theo kết quả điều tra, không mở lại lựa chọn A.

### Q24 — Tỷ lệ điểm tối đa có cho chọn xử lý phần lẻ không? (Q2 đã gửi)

**Đã xác nhận A.** Điều kiện tỷ lệ điểm tối đa cho chọn không xử lý hoặc xử lý phần lẻ của ngưỡng. Khi xử lý, chọn vị trí chữ số thập phân và phương thức tương tự Thiết lập tính toán tự động（自動計算設定）. Không cắt/làm tròn điểm của học sinh thay cho ngưỡng.

Ví dụ maximum 75, tỷ lệ 30% cho ngưỡng 22.5. Điểm 22.2 đỏ nếu dùng nhỏ hơn 22.5; nếu chủ động chọn cắt ngưỡng về 22 thì không đỏ. Mặc định không xử lý phần lẻ được giữ theo phương án A đã đề xuất; bộ giá trị và giới hạn cụ thể của màn cần được ghi rõ trong thiết kế, không suy rằng mọi chi tiết UI đã được duyệt.

### Q25 — Công thức cho ngưỡng âm thì xử lý thế nào? (Q4 đã gửi)

**Đã xác nhận A.** Chấp nhận ngưỡng âm được tính hợp lệ và so sánh bình thường; không ép ngưỡng về 0. Ví dụ trung bình 15 trừ 20 cho −5: trong miền điểm không âm không ai đỏ. Nếu mục cho phép điểm âm, điểm −6 nhỏ hơn −5; điểm −5 chỉ thỏa phép nhỏ hơn hoặc bằng.

Lần xét này có kết quả hợp lệ, không đi vào xử lý thiếu dữ liệu ở Q26 chỉ vì ngưỡng âm. Các bước xử lý phần lẻ đã chọn vẫn được thực hiện.

### Q26 — Đã xét lại nhưng không tạo được ngưỡng hợp lệ thì dùng kết quả cũ không? (Q5 đã gửi)

**Đã ghi nhận hướng khách hàng trả lời, tương ứng B.** Sau khi đã chạy xét lại mà không tạo được ngưỡng sử dụng từ dữ liệu hiện tại, ngừng dùng kết quả trước làm kết quả hiện hành; ô đó chưa có kết luận mới cho đến lần xét thành công. Khách hàng nêu rằng kết quả cũ không còn đủ cơ sở so với dữ liệu tham chiếu hiện tại và giữ lại có thể gây hiểu nhầm, đồng thời đề nghị team phản hồi cách hiểu này. Không giữ đề xuất A cũ làm mặc định và không cần hỏi lại A/B.

Phạm vi gồm thiếu nguồn trung bình cần thiết để chọn nhánh/tính ngưỡng, maximum không hợp lệ, thiếu toán hạng hoặc chia cho 0. Không tự lấy nguồn khác, thay thiếu dữ liệu bằng 0 hay chuyển xuống cấu hình ưu tiên thấp hơn để tạo một kết quả. Không có dấu đỏ không có nghĩa đã xét đạt; không bổ sung chặn đầu ra chỉ vì chưa xét được.

Phân biệt với **chưa chạy lại**, khi kết quả trước vẫn được dùng. Không xóa điểm học sinh hoặc suy thành yêu cầu xóa toàn bộ lịch sử. Lỗi lưu dữ liệu kỹ thuật phải được báo đúng phạm vi chưa cập nhật, không được báo xét thành công hoặc tự suy đã ngừng dùng kết quả nếu thao tác lưu thất bại.

### Q27 — Xét lại xong mà không còn thiết lập áp dụng thì làm gì? (Q6.1 đã gửi)

**Đã xác nhận A.** Khi đủ thông tin để xác định không có thiết lập áp dụng sau lần xét lại, ngừng dùng kết quả đỏ trước đó. Không thêm dấu đỏ và không dùng ô đó để thỏa bộ lọc điểm đỏ; điểm học sinh vẫn giữ nguyên.

Ví dụ điểm 29 từng đỏ theo cấu hình mọi lớp, sau đó cấu hình chỉ còn áp dụng cho lớp khác: sau khi chạy lại, không dùng dấu đỏ cũ. Đây là không áp dụng, không phải kết luận đã đạt một ngưỡng. Không khôi phục ngưỡng legacy làm phương án thay thế. Thiếu thông tin để chọn nhánh thuộc Q26, khác với đã xác định không có nhánh phù hợp.

### Q28 — Xóa thiết lập cuối cùng thì dấu đỏ mất ngay hay chờ chạy lại? (Q6.2 đã gửi)

**Đã xác nhận B.** Xóa thiết lập cuối cùng của một mục vẫn giữ kết quả trước trong lúc chưa chạy lại. Lần đăng ký điểm hoặc tính toán hàng loạt tiếp theo xét theo cấu hình/dữ liệu hiện hành; khi xác định mục không còn thiết lập áp dụng thì ngừng dùng kết quả trước theo Q27.

Ví dụ điểm 29 đang đỏ: xóa thiết lập duy nhất nhưng chưa chạy lại thì dấu cũ vẫn được dùng; sau lần chạy lại thì ngừng dùng. Không tự bỏ dấu hoặc ảnh hưởng bộ lọc ngay khi xóa cấu hình. Thiết kế phải bảo đảm có đường chạy lại cho mục đã hết cấu hình, không xóa điểm hoặc bật lại dữ liệu đỏ cũ.

### Q29 — Điều kiện điểm đỏ nằm ở đâu trên phiếu điểm? (Q7.1 đã gửi)

**Đã xác nhận A, theo cơ chế xét từ trên xuống được khách hàng hỏi lại.** Tại Công cụ phiếu điểm（通知表ツール）, đặt điều kiện đỏ sau các điều kiện ô chọn hiện có và trước điều kiện ô trống, như ảnh thứ ba ngày 25/09. Cơ chế hiện hữu đã kiểm tại Q22 là chọn điều kiện khớp đầu tiên; team cần phản hồi kết quả kiểm này cho khách hàng.

Ví dụ 24 vừa là Điểm dự kiến（見込点） vừa đỏ: nếu điều kiện dự kiến chọn ngoặc thì hiển thị `(24)`; nếu chọn Nguyên trạng（そのまま表示） thì hiển thị `24`. Không chuyển tiếp xuống điều kiện đỏ để thêm `※`. Nếu điều kiện phía trên đã ẩn/gạch chéo thì không làm hiện lại điểm. Kết quả xét đỏ vẫn tồn tại dù không có ký hiệu đỏ trên phiếu.

### Q30 — Công khai thành tích kết hợp điểm dự kiến và điểm đỏ thế nào? (Q7.2 đã gửi)

**Đã xác nhận A.** Tại Công khai thành tích（成績公開）, kết hợp các hiệu ứng khác nhau; cùng hiệu ứng thì chỉ hiển thị một lần. Ví dụ điểm dự kiến dùng ngoặc và đỏ dùng `*` phía trước thì hiển thị `(*24)`; cả hai dùng cùng `*` phía trước thì chỉ `*24`, không phải `**24`.

Giữ quy tắc ẩn điểm và phạm vi định dạng hiện hữu. Bản đầu không thêm màu nền riêng cho điểm đỏ; khách hàng cho phép cân nhắc nền màu về sau, không phải phê duyệt đưa vào bản đầu. Cách trình bày khác phiếu điểm không thay đổi kết quả xét dùng chung.

### Q31 — Tỷ lệ nhóm có cần xử lý riêng khi các lớp khác điểm tối đa không? (Q3 đã gửi)

**Đã xác nhận: dùng kết quả tổng hợp thứ hạng hiện có.** Sau khi trao đổi với MW, khách hàng cho biết BLEND cho phép cấu hình điểm tối đa khác nhau giữa lớp A và B cho cùng mục điểm gốc, nhưng tình huống đó không xảy ra trong thực tế ở cùng nhóm tổng hợp. Nếu hai lớp thuộc chương trình học khác nhau thì nhóm tổng hợp thứ hạng cũng khác nhau.

Không thêm xử lý nghiệp vụ riêng hoặc chức năng ngăn cấu hình này. Nếu vẫn xảy ra, sự khác điểm tối đa không được gây lỗi làm dừng xử lý. Khách hàng bổ sung: “Vì vậy, về cơ bản, chỉ cần dùng nguyên kết quả tổng hợp thứ hạng hiện tại là được.” Không cần hỏi lại A/B hoặc xây cách tính trung bình tỷ lệ từng học sinh riêng cho chức năng mới.

Đây là xác nhận kế thừa kết quả hiện hữu, không phải yêu cầu mới về kết quả cụ thể của nhóm trộn điểm tối đa 50/100. Giữ đúng nhóm và bản nguồn, ưu tiên bản chốt, yêu cầu giá trị trước làm tròn và xử lý dữ liệu không hợp lệ đã có. Phản hồi không tự xác nhận số đã làm tròn trên màn hình đáp ứng yêu cầu so sánh; độ chính xác dữ liệu nguồn còn cần kiểm khi tích hợp. Các quy tắc Q26–Q30 không thay đổi.

Nguồn: hai phản hồi tiếng Nhật do người phụ trách cung cấp nguyên văn trong phiên ngày 25/09/2026; chưa có permalink riêng. Đóng Q3 không đồng nghĩa hoàn tất tích hợp, cập nhật Figma hoặc phê duyệt phạm vi phát hành.
