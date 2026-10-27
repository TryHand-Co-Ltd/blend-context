# Context EM-001 — Ánh xạ đánh giá theo khoảng điểm trung bình

Cập nhật: **27/10/2026** (ghi nhận thống nhất bộ đọc bản chốt dùng chung ở mục 4.1 và 6; trước đó 22/10/2026: đối chiếu code branch EM-001 và thread Slack, thêm mục 4.1 trạng thái triển khai; trước đó 20/10/2026: EM-001 đổi sang mã loại đăng ký 9 vì PR #57058 dùng mã 8, xem kế hoạch mục 15; áp dụng xác nhận của Shite ngày 19/10/2026 về chỉ dùng kết quả tổng hợp thứ hạng đã chốt, mục 4; trước đó 19/10/2026 bổ sung quyết định kế thừa từ RA-001/RC-001 và 16/10/2026 bổ sung kiểm chứng local Q4). Định danh feature: **EM-001**, được người phụ trách xác nhận ngày 14/10/2026. Chưa đối chiếu mã trên Sheet/Redmine.

Tài liệu này là điểm đọc yêu cầu hiện hành của bộ context được người phụ trách yêu cầu tạo. Xác nhận khách hàng là căn cứ nghiệp vụ; đề xuất dưới đây chưa phải thiết kế được duyệt.

## Cách sử dụng context

Đọc theo thứ tự: context này → nguồn Q&A → phụ thuộc RA-001/RC-001 có liên quan → tài liệu dự thảo → research khi cần kiểm hiện trạng.

| Loại thông tin | Cách áp dụng |
| --- | --- |
| Xác nhận trực tiếp của khách | Ràng buộc nghiệp vụ; nguồn gốc/Q1–Q4 được dẫn ở mục 2 |
| Yêu cầu người phụ trách | EM-001 là mã được cung cấp; giữ ví dụ 1, 3, 5; context chỉ là văn bản, người phụ trách thiết kế Figma sau |
| Phản hồi của nhóm | Ghi đúng người xác nhận; không nâng thành lời phê duyệt của khách |
| Quy tắc dùng chung | Đọc bản hiện hành RA-001/RC-001; giữ trạng thái còn mở của nguồn, không dùng bản chép cũ để ghi đè |
| Đề xuất thiết kế | Có thể dùng để thảo luận, chưa là ràng buộc triển khai hoặc kết quả kiểm thử bắt buộc |
| Research | Chỉ chứng minh đoạn code tại revision đã đọc; không chứng minh deployment hoặc phê duyệt nghiệp vụ |

Nếu nội dung mâu thuẫn, đối chiếu xác nhận mới nhất có nguồn rồi cập nhật context. Không tự chọn một phương án nghiệp vụ chưa chốt để tuyên bố yêu cầu đã hoàn tất. Q1–Q4 đã có trả lời; không hỏi lại các nguyên tắc đó chỉ vì UI chưa thiết kế.

## 1. Yêu cầu khách hàng

[Chuỗi yêu cầu](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1791290107759389) mô tả Pattern B: nhà trường đặt trước bảng quy đổi, rồi hệ thống thực hiện hai bước:

1. Dùng trung bình của tập thể được chọn để chọn hàng trong bảng.
2. Dùng điểm cá nhân xét các điều kiện của hàng đó và ghi kết quả vào mục nhận đã chọn.

Ví dụ gốc: cùng điểm cá nhân 85, trung bình 49 → 5; trung bình 60 → 4. Ví dụ 100 điểm/5 mức không cố định thang điểm hoặc ngưỡng của chức năng. **Pattern B′ tự tính ngưỡng ngoài phạm vi.**

## 2. Phạm vi đã xác nhận

Nguồn trực tiếp: [yêu cầu gốc](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1791290107759389), [trả lời Q1–Q4](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1791883926294639). [Phản hồi nhóm](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1791893930779779) được phân loại riêng ở mục 3.

| Nội dung | Quy tắc và nguồn |
| --- | --- |
| Nguồn | Chọn thiết lập tổng hợp, thời kỳ, tập thể và mục điểm cá nhân — yêu cầu gốc |
| Kiểu đầu vào | Điểm cá nhân/nguồn trung bình là mục số; không dùng lựa chọn A/B/C làm căn cứ xét — Q1 |
| Mục nhận | Chọn mục đã có, có thể là số hoặc lựa chọn A/B/C — Q1–Q2 |
| Tập thể | Gồm 学年平均, HR平均, nhóm thứ hạng, nhóm kết hợp và **授業平均** (trung bình theo tiết học, hiện khi 順位集計 bật tổng hợp theo tiết học). 授業平均 là quy tắc kế thừa [RA-001 Q5](../RA-001-ranking-average/CONTEXT.md), không phải xác nhận riêng trong thread EM-001; kỳ 単元 không có 授業平均 (ô trống) |
| Điều kiện | Cấu hình ngưỡng, toán tử, giá trị cần ghi; số điều kiện không bắt buộc bằng số mức của mục nhận — Q2 |
| So sánh | ≥, >, =, <, ≤ theo cấu hình — Q3 |
| Nhiều điều kiện khớp | Xét theo thứ tự, lấy lần khớp đầu tiên — Q3 |
| Không khớp | Ghi trống, kể cả ô đã có kết quả; không tự gán mức thấp nhất — Q3 |
| Lưu và tính | Lưu/mở lại cấu hình; tính/ghi khi chạy AutoRating; tính lại sau khi trung bình hoặc bảng đổi — yêu cầu gốc |
| Kiểm tra số lượng | Dùng bảng/biểu đồ phân bố tần suất（度数分布表・グラフ）ở trích xuất thành tích（成績抽出）, thử vận hành; không tạo màn mới — Q4 và phản hồi nhóm |

### Mục số 1–5 có thể chỉ trả 1, 3, 5

Giới hạn mục nhận và số điều kiện là hai khái niệm riêng. Ví dụ của khách dùng **2, 4, 5**. Ví dụ **1, 3, 5** được bổ sung theo yêu cầu người phụ trách, phù hợp cùng nguyên tắc; không phải các ngưỡng khách đã phê duyệt.

Trong ví dụ này, min/max có hiệu lực là 1–5 và không có cấu hình khác thay giới hạn. Thêm/xóa điều kiện không thay min/max hoặc các lựa chọn của mục nhận. Không tự sinh các kết quả 2, 4 khi bảng chỉ cấu hình 1, 3, 5. Xem [ví dụ đầy đủ](docs/specification.vi.md).

## 3. Phản hồi của nhóm và giới hạn xác nhận

Nhóm bổ sung: điểm cá nhân trống thì kết quả trống theo hiện trạng; nhóm cam kết thử phân bố trên staging và gửi UI review. Chuỗi chưa có phản hồi tiếp theo của khách về phần bổ sung hoặc phê duyệt mockup. Lời nhóm nói tiếp tục theo đề xuất khi chưa được trả lời không làm đề xuất trở thành phê duyệt.

## 4. Phụ thuộc chung

- Dùng chung quy tắc nguồn trung bình với [RA-001](../RA-001-ranking-average/CONTEXT.md) và [RC-001](../RC-001-red-score/CONTEXT.md), theo yêu cầu tái sử dụng phần chung trong Q1.
- RA-001 hiện dùng trung bình **trước làm tròn**, tổng điểm chia **số học sinh có điểm của cùng bản nguồn**, không dùng `examinees`. Nội dung này được đối chiếu từ context/đặc tả RA-001 hiện hành ngày 14/10; không phải câu xác nhận riêng trong chuỗi chức năng này.
- Chính sách nguồn trung bình **đã được Shite xác nhận ngày 19/10/2026** (xem mục "Xác nhận ngày 19/10/2026" dưới đây): chỉ dùng kết quả tổng hợp thứ hạng **đã chốt** và đang hợp lệ; **không** dùng kết quả mới nhất chưa chốt để thay thế. Chưa có bản chốt hợp lệ thì coi là thiếu trung bình và ghi trống. Phương án A cũ ("chưa chốt hoặc đã hủy chốt thì dùng số mới nhất") **không còn áp dụng**. Chạy tổng hợp lại không thay bản chốt đang hợp lệ.
- Mẫu số bằng 0 được coi là thiếu trung bình. Không thay bằng 1 hoặc dùng trung bình 0 giả. Mẫu số cùng bản nguồn gồm học sinh có điểm bị loại khỏi thứ hạng, theo [RA-001, mục 8.2–8.3](../RA-001-ranking-average/docs/specification.vi.md). Với điều kiện xét trung bình không lấy được giá trị, quy tắc chung RA-001 Q7 là coi điều kiện đó không khớp, xét điều kiện tiếp theo và ghi trống nếu không điều kiện nào khớp ([nguồn Q7](../RA-001-ranking-average/sources/2026-10-09-business-questions.vi.md#q7), [đặc tả mục 5.3](../RA-001-ranking-average/docs/specification.vi.md)). Đây là quy tắc chung được kế thừa, không phải xác nhận riêng trong thread EM-001.
- Nhóm dự kiến triển khai sau chức năng dùng trung bình xếp hạng. Trạng thái merge/deploy các PR chưa được kiểm lại trong lần tổ chức context.

### Xác nhận ngày 19/10/2026 về nguồn trung bình đã chốt

Nguồn: [thread RC-001 ④ trong Slack](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1792383099678219), do Shite xác nhận cho cả ba chức năng ① 赤点 (điểm đỏ), ② dùng kết quả 順位集計 (tổng hợp thứ hạng) trong công thức/điều kiện AutoRating và ③ bảng quy đổi theo khoảng trung bình (chính là EM-001). Đây là xác nhận của Shite dành cho nhóm phát triển, không phải phản hồi riêng của khách trong thread EM-001.

| Nội dung | Quy tắc áp dụng cho EM-001 |
| --- | --- |
| Chỉ dùng bản đã chốt | Chỉ đọc kết quả 順位集計 **đã chốt (確定)** và còn hiệu lực. Không dùng kết quả mới nhất chưa chốt để thay thế, kể cả khi số mới nhất khác bản chốt (ví dụ bản chốt 56, số mới nhất 60 thì vẫn dùng 56) |
| Thiếu bản chốt | Thiếu bản chốt hợp lệ cho phạm vi cần đọc thì coi là **thiếu trung bình**. Với chức năng quy đổi, kết quả là **trống**; không giữ giá trị cũ. Đây khác với ① 赤点 (kết quả 判定不能, không xác định được) |
| Chạy tổng hợp lại | Chỉ chạy tổng hợp lại mà bản chốt vẫn hợp lệ thì dùng tiếp bản chốt; điểm đã ghi không tự đổi |
| Gỡ chốt | Không xóa kết quả ngay khi gỡ chốt. Ở lần **自動算出実行** kế tiếp, nếu không còn bản chốt hợp lệ thì ô kết quả được ghi trống |
| Danh sách chọn | Danh sách 順位集計設定 trên màn thiết lập hiển thị **mọi** thiết lập đã tạo, bất kể đã chốt hay chưa. Trạng thái chốt chỉ ảnh hưởng việc lấy kết quả khi tính |
| Không áp dụng | Hiển thị ngưỡng điểm đỏ trên 成績抽出 và Excel, và trạng thái 判定不能 chỉ thuộc chức năng ①. Việc thread tạm dừng chức năng ② không nêu ③ cũng dừng; ③ phụ thuộc cùng bộ đọc nguồn nên cần đối chiếu tiến độ bộ đọc chung |

Quyết định này **đóng Q2 của RA-001** đối với EM-001 (chính sách khi chưa có bản chốt). Điểm "sau khi điểm cá nhân không khớp có quay lại hàng trung bình khác không" ở mục 6 vẫn còn mở.

### Quyết định kế thừa từ RA-001 và RC-001 (ghi nhận 19/10/2026)

Các điểm dưới đây đã có câu trả lời ở tính năng dùng chung, nên EM-001 áp dụng lại và **không hỏi khách lại**. Đây là quy tắc kế thừa, không phải xác nhận riêng trong thread EM-001; không đóng điểm "sau khi điểm cá nhân không khớp có quay lại hàng trung bình khác không" ở mục 6.

| Nội dung | Quy tắc kế thừa | Nguồn |
| --- | --- | --- |
| Phạm vi trường | Nguồn trung bình dùng chung áp dụng cho mọi trường. Hiện **科目平均** (trung bình môn) chỉ mở ở hai trường Uenomiya; RA-001 bỏ cả chặn khi hiển thị lẫn chặn khi lưu công thức. EM-001 không đặt giới hạn trường riêng. Không phát hành sớm hơn bộ đọc nguồn chung, vì nguồn tạm chỉ đọc bảng bản chốt hiện có (đã tra theo khối `hr_grade` của học sinh) và chưa dùng bộ đọc chung | [RA-001 đặc tả mục 1](../RA-001-ranking-average/docs/specification.vi.md), [mục 6](../RA-001-ranking-average/docs/specification.vi.md) |
| Thời điểm tính lại | Lưu thiết lập và **集計実行** (chạy tổng hợp thứ hạng) không ghi điểm. Quy trình vận hành: nhập đủ điểm → **集計実行** → chờ xong → **自動算出実行** (chạy tính điểm tự động). Không có vòng lặp tự hội tụ và không tự kích hoạt tính lại khi trung bình hoặc bảng đổi; "tính lại" trong yêu cầu gốc được hiểu là chạy lại tính điểm tự động theo quy trình này | [RA-001 đặc tả mục 9](../RA-001-ranking-average/docs/specification.vi.md), [RC-001 Q&A, Q12](../RC-001-red-score/sources/confirmed-business-qa.vi.md) |
| Nhãn dấu so sánh | **以上** (từ … trở lên), **より大きい** (lớn hơn), **等しい** (bằng), **より小さい** (nhỏ hơn), **以下** (từ … trở xuống). Không dùng **未満** (dưới). Đây là thống nhất nội bộ của người phụ trách; Figma EM-001 cần dùng cùng nhãn | [RA-001 ghi nhận nội bộ 10/10, mục 1](../RA-001-ranking-average/sources/2026-10-10-internal-design-review.vi.md) |
| Nhóm, bản chốt, mẫu số | Mỗi học sinh so với trung bình của nhóm mình, đọc thêm điều kiện khối để không lấy nhầm số khối khác. Chỉ dùng bản chốt, thiếu nhóm hoặc chưa có bản chốt thì coi như thiếu trung bình (xác nhận của Shite ngày 19/10/2026; không còn dùng số mới nhất cho chưa chốt). Mẫu số là số học sinh có điểm của cùng bản nguồn. Có thể dùng AC-21 đến AC-23 của RA-001 làm ca kiểm khi nối bộ đọc | [RA-001 đặc tả mục 8.1–8.3](../RA-001-ranking-average/docs/specification.vi.md), [mục 14](../RA-001-ranking-average/docs/specification.vi.md), [RC-001 Q&A, Q9](../RC-001-red-score/sources/confirmed-business-qa.vi.md) |

### 4.1. Trạng thái triển khai và lựa chọn kỹ thuật (đối chiếu 22/10/2026)

Nguồn: branch `feature/EM-001_average_range` của `blend`; thread Slack đến 21/10/2026. Nhóm báo hoàn tất code, test và tài liệu ngày 21/10 (kèm báo cáo test và Figma); thread chưa có phản hồi của Shite về phần giao này. Đây là hiện trạng code, không phải phê duyệt nghiệp vụ hoặc thiết kế.

- **Khớp yêu cầu đã chốt:** mã loại 9; 5 toán tử (nhãn 以上 / より大きい / 等しい / より小さい / 以下); chọn khoảng khớp đầu tiên rồi điều kiện cá nhân khớp đầu tiên; không khớp hoặc thiếu trung bình thì trống; điểm cá nhân trống thì trống, 0 là hợp lệ; chỉ dùng kết quả đã chốt, tra theo khối của học sinh; mẫu số là số học sinh có điểm; không có màn mới (dùng 度数分布表・グラフ).
- **Cách xử lý "thiếu trung bình":** RA-001 Q7 diễn đạt là "coi không khớp, xét điều kiện tiếp theo". Code trả trống ngay khi thiếu trung bình vì mọi khoảng cùng dùng một trung bình, kết quả tương đương.
- **Lựa chọn kỹ thuật của nhóm, chưa được khách xác nhận** (Q3: cấu hình sai là trách nhiệm của trường, nên cần người phụ trách xác nhận mức kiểm tra này): (a) từ chối khi lưu nếu giá trị đăng ký ngoài min/max hoặc là số lẻ ở mục số; (b) tối đa 20 khoảng và 20 điều kiện mỗi khoảng; (c) ô điều kiện chưa dùng ("選択してください", để trống cả ngưỡng và giá trị) khác với đăng ký trống ("(空欄)"), nhập dở thì báo lỗi; (d) kiểm tra mục thuộc đúng cấu hình khi lưu/mở màn sửa. Chi tiết xem [kế hoạch 15.y–15.v và 15.u](plans/average-range-mapping-implementation-plan.vi.md).
- **Bộ đọc bản chốt dùng chung (thống nhất nội bộ 27/10/2026, chưa phải xác nhận của khách):** shite và người làm PR #57058 thống nhất ba chức năng (xét điểm liệt, RA-001, EM-001) dùng chung `getTotalResults()` / `getTotalData()` có tham số `$use_fix_table`; hàm đã có trong PR (chưa vào `master`). EM-001 hiện đọc bằng `AverageRangeSourceStub` và `getFinalizedEach*TotalResult` (cùng bảng `grade_calc_fix_*`, cùng quy tắc: chỉ bản chốt, mẫu số là số học sinh có điểm), sẽ chuyển sang hàm chung sau. EM-001 chưa xử lý 科目グループ (nhóm môn học) ở giao diện và nguồn, khác RA-001. Gộp thử với đầu PR `9a91794106b` (27/10): xung đột chữ ở `AutoRating.php` (4 chỗ) và `m_AutoRatingConfItemRegistType.php`, giữ cả hai bên; mã loại 9 không trùng mã 8 của PR. Chi tiết: [RA-001 research](../RA-001-ranking-average/research/confirmed-result-reader.vi.md).
- **Chưa làm / còn mở:** thay nguồn tạm bằng bộ đọc chung nói trên (trước đây dự kiến `RankingAverageReader`); kiểm tra với bảng thật của PR; `use_relative_evaluation`, F-08, F-09; lịch sử cho ô trống (D4) và tham chiếu nhóm theo tên (ERR-001); CSRF của `auto_rating/*` (D8, có từ trước, làm riêng).

## 5. Thiết kế đang đề xuất

[Nội dung giao diện bằng văn bản](docs/screen-definition.vi.md) là đầu vào chuẩn bị thiết kế. Người phụ trách sẽ vẽ mockup trên Figma sau; chưa có liên kết hoặc thiết kế Figma được duyệt. Bộ context không chứa mockup HTML/CSS. Cấu trúc hai cận nối VÀ, cận thứ hai tùy chọn, việc dùng mục đích đang cấu hình, tên phương thức mới và nội dung log là đề xuất.

**Phân biệt nguyên tắc và cách áp dụng:** Q3 EM-001 xác nhận điều kiện cá nhân xét theo thứ tự, lấy lần khớp đầu tiên và ghi trống nếu không điều kiện nào khớp. Quy tắc chung RA-001 Q7 cũng đã chốt: điều kiện trung bình không lấy được giá trị được coi là không khớp, xét điều kiện tiếp theo; nếu không điều kiện nào khớp thì ghi trống. Áp dụng nguyên tắc này cho thứ tự các hàng trung bình EM-001 là cách cụ thể hóa thiết kế, không phải xác nhận riêng của Shite trong thread EM-001. Sau khi một hàng đã được chọn, việc không quay sang hàng trung bình khác nếu điểm cá nhân không khớp vẫn là diễn giải thiết kế, chưa được thread xác nhận riêng.

## 6. Việc còn mở

| Điểm cần hoàn thiện | Loại | Ảnh hưởng và cách tiếp tục |
| --- | --- | --- |
| Chính sách bản nguồn (Q2 của RA-001) | Đã xác nhận 19/10/2026 | Chỉ dùng bản chốt, thiếu thì trống. Còn cần nối bộ đọc chung theo quy tắc này (từ 27/10/2026 là `getTotalResults()` / `getTotalData()` có `$use_fix_table` của PR #57058, thay cho `RankingAverageReader`) và kiểm tích hợp với chức năng chốt 順位集計 khi merge |
| Cách ánh xạ quy tắc chung vào hai lớp | Cụ thể hóa thiết kế | Hàng trung bình không thể xét/không khớp thì xét hàng tiếp theo theo RA-001 Q7; không còn hàng khớp thì trống. Việc có quay lại hàng trung bình sau khi điểm cá nhân không khớp hay không vẫn cần review thiết kế; không ghi thành xác nhận của Shite |
| Figma, điều khiển, tên phương thức | Thiết kế chưa thực hiện | Người phụ trách thiết kế sau; không tạo mockup hoặc coi bố cục cũ là đã duyệt |
| Mapping với giới hạn mục đích/quyền ghi | Bằng chứng kỹ thuật | Đối chiếu các đường ghi thực tế khi triển khai; không tạo ngoại lệ nghiệp vụ mới từ suy đoán |
| Phân bố hiện có đáp ứng Q4 | Bằng chứng vận hành | Đã kiểm tra local với mục số và A/B/C, bảng và biểu đồ khớp số lượng; xem mục 10. Còn kiểm tra staging, kết quả trống và luồng tự tính EM-001 → trích xuất |
| Liên kết Sheet/Redmine | Metadata nguồn | Mã EM-001 đã được cung cấp; thiếu liên kết không làm Q1–Q4 thành chưa xác nhận |

Các công việc tiếp theo:

1. Bổ sung liên kết Work Item/Redmine khi có; mã EM-001 đã được người phụ trách xác nhận.
2. Review UI và chi tiết hai lớp điều kiện; giữ nguyên các nguyên tắc đã chốt.
3. Nối bộ đọc nguồn chung theo quy tắc chỉ dùng bản chốt và kiểm tích hợp mẫu số. Kiểm riêng luồng chốt → gỡ chốt → chạy lại 自動算出実行 khi chức năng chốt 順位集計 đã có trên nhánh chính; hiện bảng bản chốt thật chưa có trong DB local nên bản tạm trả trống.
4. Tiếp tục kiểm tra trên staging và luồng tự tính EM-001 → trích xuất, gồm mục số, lựa chọn và kết quả trống. Kết quả local ngày 16/10 ở mục 10 chưa thay thế các bước này.
5. Đánh giá lại phạm vi dev/QA và ước lượng sau review. Không dùng ước lượng cũ 13–20,5 ngày công cho thiết kế mới.
6. Khi yêu cầu và thiết kế hoàn tất, chuẩn bị tài liệu tổng quan tương tự chức năng điểm đỏ theo yêu cầu khách.

## 7. Tài liệu và cập nhật

Đọc [Q&A](sources/confirmed-business-qa.vi.md), [đặc tả dự thảo](docs/specification.vi.md), [màn hình](docs/screen-definition.vi.md) và [research](research/current-mapping-behavior.vi.md). Xác nhận mới được đối chiếu và cập nhật context trước; không coi tài liệu hoặc thiết kế là bằng chứng tính năng đã triển khai.

## 8. Những cách hiểu không được dùng làm đầu vào triển khai

- Không cố định năm mức, không bắt các kết quả liên tiếp, không bắt số điều kiện bằng số mức; 1, 3, 5 là ví dụ, không phải tập kết quả cố định mới.
- Không biến A/B/C thành đầu vào số bằng mã lưu, hoặc mặc định A=5/B=3/C=1. Hai ví dụ trong tài liệu là hai cấu hình độc lập.
- Không bắt điều kiện phủ kín mọi điểm hoặc cấm mọi chồng lấn; cấu hình tự do đi cùng thứ tự và quy tắc ghi trống đã xác nhận.
- Không tự giữ kết quả cũ hoặc tự gán mức thấp nhất khi không khớp.
- Không coi giới hạn “tối đa hai cận”, một phương thức mới, không có bộ chọn đích riêng hay cấu trúc JSON/DB là yêu cầu khách đã chốt.
- Không đưa Pattern B′, màn phân bố mới, ngưỡng cũ hoặc ước lượng cũ vào phạm vi.
- Không dùng `examinees` làm mẫu số. Không rơi về số mới nhất chưa chốt khi thiếu bản chốt (xác nhận 19/10/2026): kết quả là trống.

**Mức sẵn sàng:** đủ làm cơ sở đọc yêu cầu và chuẩn bị thiết kế; chưa đủ để AI tự coi toàn bộ thiết kế, tích hợp và nghiệm thu đã hoàn tất. Các ví dụ được kiểm logic không phải bằng chứng runtime.

## 9. Kết quả đối chiếu nguồn ngày 14/10/2026

Đã đọc lại yêu cầu gốc và toàn bộ 8 phản hồi của chuỗi Slack; nguồn báo hết trang. Đã đối chiếu cả 7 tài liệu Markdown trong EM-001. Không phát hiện mâu thuẫn còn lại giữa yêu cầu cốt lõi trong bộ context và nội dung Shite trả lời tại lần đọc này.

Phân loại đã làm rõ: Q1–Q4 là căn cứ nghiệp vụ; điểm cá nhân trống và cam kết staging là phần nhóm trả lời; ví dụ 1, 3, 5 do người phụ trách yêu cầu; các chi tiết UI/validation/hai lớp/log là đề xuất; mẫu số/bản chốt lấy từ nguồn chung RA-001. Kết luận này là kiểm nội dung, không phải phê duyệt thiết kế hoặc kiểm chứng ứng dụng. Khi có phản hồi mới, đọc lại nguồn và cập nhật trạng thái trước khi dùng làm đầu vào cho AI.

## 10. Kiểm chứng local Q4 ngày 16/10/2026

Đã thao tác trực tiếp chức năng trích xuất thành tích（成績抽出）trên môi trường local, trường demo, năm học 2026, lớp 1–3, nhóm Toán I G-A. Chọn mục đánh giá trong thiết lập mục hiển thị（表示項目設定）, chạy trích xuất và đối chiếu bảng phân bố với biểu đồ trên dữ liệu có sẵn; không sửa điểm học sinh.

| Mục và thời kỳ kiểm tra | Bảng phân bố | Biểu đồ |
| --- | --- | --- |
| Đánh giá cuối năm dạng số, cuối năm | Mức 1: 3 người; mức 2: 2 người; mức 3–5: 0 người | Khớp bảng |
| Mục lựa chọn A/B/C, cuối kỳ I | A: 1 người; B: 1 người; C: 1 người | Khớp bảng, hiển thị ba nhãn A/B/C |

Kết quả hỗ trợ hướng tái sử dụng bảng/biểu đồ phân bố hiện có theo Q4, không bổ sung màn đếm người riêng. Đây là bằng chứng vận hành local của chức năng hiện có, không phải xác nhận mới của khách hoặc kết quả nghiệm thu EM-001. Chưa kiểm tra trên staging, chưa kiểm tra riêng cách xử lý kết quả trống và chưa kiểm tra luồng tự tính EM-001 → trích xuất. Chưa đối chiếu revision ứng dụng đang chạy; phạm vi kết luận giới hạn ở môi trường và dữ liệu đã thử. Báo cáo gửi khách mới được soạn trong phiên làm việc, chưa có bằng chứng đã gửi hoặc được khách phản hồi.
