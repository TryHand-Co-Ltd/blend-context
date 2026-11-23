# Context EM-001 — Ánh xạ đánh giá theo khoảng điểm trung bình

Cập nhật: **16/11/2026** (thêm mục 13: kết quả review ngày 03/11, yêu cầu đổi tên/đổi chữ và câu hỏi về giới hạn của Shite ngày 13/11, số đo dung lượng ngày 28/10; trước đó 02/11/2026: thêm mục 12: PR #57058 đã có kiểm soát loại trừ ở đầu `439657dac95`, kết quả kiểm lại trên bản gộp, chỉ dẫn của Shite, hai quyết định về `use_relative_evaluation` và các điểm còn mở; trước đó 30/10/2026: thêm mục 11: kiểm chứng bản gộp với PR #57058 `15d6c9d60ae`, gồm lỗi 成績連携 đã sửa; ghi nhận quyết định của nhóm PR #57058 về dữ liệu chốt cũ thiếu 評価項目ID và kiểm soát loại trừ chung, mục 4.1 và 6; trước đó 28/10/2026: chuyển EM-001 sang bộ đọc chung `getTotalResults()` của PR #57058, mục 4.1; trước đó 27/10/2026: ghi nhận thống nhất bộ đọc bản chốt dùng chung ở mục 4.1 và 6; trước đó 22/10/2026: đối chiếu code branch EM-001 và thread Slack, thêm mục 4.1 trạng thái triển khai; trước đó 20/10/2026: EM-001 đổi sang mã loại đăng ký 9 vì PR #57058 dùng mã 8, xem kế hoạch mục 15; áp dụng xác nhận của Shite ngày 19/10/2026 về chỉ dùng kết quả tổng hợp thứ hạng đã chốt, mục 4; trước đó 19/10/2026 bổ sung quyết định kế thừa từ RA-001/RC-001 và 16/10/2026 bổ sung kiểm chứng local Q4). Định danh feature: **EM-001**, được người phụ trách xác nhận ngày 14/10/2026. Chưa đối chiếu mã trên Sheet/Redmine.

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
- **Lựa chọn kỹ thuật của nhóm, chưa được khách xác nhận** (Q3: cấu hình sai là trách nhiệm của trường, nên cần người phụ trách xác nhận mức kiểm tra này): (a) từ chối khi lưu nếu giá trị đăng ký ngoài min/max hoặc là số lẻ ở mục số; (b) tối đa 10 khoảng và 20 điều kiện mỗi khoảng (từ 19/11/2026 là 20 khoảng × 10 điều kiện, xem mục 13.8), đồng thời JSON cấu hình sau khi định dạng không quá 60.000 byte (từ 17/11/2026 là 65.000 byte) (cột `condition` là `TEXT` 65.535 byte; cấu hình DB của app không bật strict nên dữ liệu quá dài bị cắt âm thầm; 20×20 ước tính 92–100KB nên không dùng được; kiểm tra này chạy ở cả hai đường ghi `condition` có thể làm nó lớn lên: `registFormula` (lưu cách đăng ký) và `registCondition` (sửa 絞り込み条件 – điều kiện lọc; đã tái hiện 28/10/2026: cấu hình 59.900 byte + 80 bộ lọc bị cắt còn 65.535 byte, JSON hỏng, trước khi thêm kiểm tra). `delete`/`sort` chỉ đổi `sort_no` nên không đổi dung lượng đáng kể; chuyển năm học ghi JSON gọn hơn); (c) ô điều kiện chưa dùng ("選択してください", để trống cả ngưỡng và giá trị) khác với đăng ký trống ("(空欄)"), nhập dở thì báo lỗi; (d) kiểm tra mục thuộc đúng cấu hình khi lưu/mở màn sửa. Chi tiết xem [kế hoạch 15.y–15.v và 15.u](plans/average-range-mapping-implementation-plan.vi.md).
- **Bộ đọc bản chốt dùng chung (thống nhất nội bộ 27/10/2026, chưa phải xác nhận của khách; EM-001 đã chuyển sang 28/10/2026):** shite và người làm PR #57058 thống nhất ba chức năng (xét điểm liệt, RA-001, EM-001) đọc kết quả đã chốt qua `GradeCalcResultService::getTotalResults()` với `$use_fix_table = true` (PR #57058, chưa vào `master`), dùng `student_count` (không dùng `examinees` hay `avg_score` đã làm tròn); trung bình trước làm tròn = tổng điểm ÷ `student_count`. EM-001 nay đọc qua `AverageRangeFixedSource` (nhánh `feature/EM-001_average_range`), **không còn SQL riêng** (đã bỏ `AverageRangeSourceStub` và `getFinalizedEach*TotalResult`). Tập hợp hỗ trợ: 学年毎, HR毎, 授業 (chỉ khi bật 授業毎の集計), nhóm tổng hợp thứ hạng, nhóm kết hợp; **科目グループ (nhóm môn học) đã hỗ trợ từ 28/10/2026**: giao diện hiện tên nhóm + 平均, `AutoRating` đổi thành `calc_group_sub_subject__<id>` và hàm chung `getTotalResults` tự xác định nhóm thực tế theo môn của tiết (đã chạy thử trên DB local: môn 10028 ra nhóm kết hợp 115÷5 = 23, môn khác ra HR). Trước khi PR #57058 vào `master`, nhánh tự thoái lui an toàn: hàm chung chưa có tham số `$use_fix_table` hoặc chưa có bảng/lớp bản chốt thì mọi trung bình thiếu, ô ghi trống, không đọc kết quả chưa chốt. Gộp thử với đầu PR `9a91794106b`: xung đột chữ chỉ ở `m_AutoRatingConfItemRegistType.php` (`REGIST_TYPES_CHOICE`, giữ cả hai bên); `AutoRating.php` tự gộp được (kiểm lại 28/10/2026); mã loại 9 không trùng mã 8 của PR. Yêu cầu `log_id` chỉ áp dụng cho xét điểm liệt. Chi tiết: [RA-001 research](../RA-001-ranking-average/research/confirmed-result-reader.vi.md).
- **Kiểm soát loại trừ chung và dữ liệu chốt cũ (thread Slack ngày 29–30/10/2026; nội bộ, chưa phải xác nhận của khách):** (1) PR #57058 sẽ thêm kiểm soát loại trừ chung giữa thao tác 確定 (chốt) và 一括自動算出 (tính tự động hàng loạt), dùng trạng thái đang chạy và bảng khóa hiện có: bên chạy trước thắng, 確定 bị từ chối nếu 一括自動算出 đang chạy, ngược lại 一括自動算出 phải chờ; lưu điểm theo lớp giữ transaction hiện có. Sau khi triển khai, diff mới nhất sẽ được chia sẻ để phía xét điểm liệt/ánh xạ kiểm tra ba điểm: ảnh hưởng đến cách gọi và kết quả, phạm vi (đường chỉ xét điểm liệt, CSV 一括入力), xử lý khi chờ/lỗi và hiển thị hoàn tất. Bước đầu chỉ rà soát phạm vi ảnh hưởng, chưa giả định kiểm soát riêng cho từng chức năng. (2) Kết quả tổng hợp theo lớp (授業毎の集計) đã có từ trước thiếu 評価項目ID: không thêm kiểm tra khi 確定, không sửa hàng loạt DB production; sau release xác nhận trường bị ảnh hưởng, CS/営業 hướng dẫn tổng hợp lại và 確定 lại; 倉島さん đã xác nhận giữ nguyên như vậy ngày 30/10/2026. **Ảnh hưởng tới EM-001 (suy luận từ code ngày 29/10, đã đo lại 30/10 và không đúng):** EM-001 đọc bản chốt qua `getTotalResults(..., true)`. Đo 30/10 với dữ liệu 授業毎 có `evaluate_item_id` rỗng: EM-001 vẫn đọc được trung bình, kết quả giống hệt khi điền đủ (mục 11). Không cần tổng hợp lại, 確定 lại vì lý do này. **Kiểm tra cục bộ 29/10/2026 trên cây gộp EM-001 + PR #57058 (chưa có khóa trong PR):** (a) EM-001 chỉ phụ thuộc phần chung ở `AutoRating::calcAverageRange`, gồm hai lần đọc riêng không khóa (`GradeCalcFixLogRepository::findActiveBy`, rồi `getTotalResults` với `$use_fix_table = true`); (b) giả lập `unfix` giữa hai lần đọc làm toàn bộ 125/125 ô trong khối thử bị ghi trống, không có thông báo, nên kiểm soát loại trừ phải bao cả phần đọc của EM-001; (c) các đường vào `AutoRating::calc` gồm 一括自動算出 (`AutoRatingBatch`, được xếp hàng từ màn tính điểm, CSV 一括入力, màn xếp hạng và `GroupOptionUseCase`), lưu điểm theo lớp, CSV nhập theo lớp và liên kết thi cuối kỳ (`ScoringResultService`); EM-001 không có đường chỉ xét điểm liệt; (d) đường lưu theo lớp, CSV nhập lớp (giả lập hai bước) và cron của CSV 一括入力 cho kết quả trùng khớp với batch đầy đủ; (e) EM-001 ghi cùng bốn bảng như các loại khác (`grades`, `auto_rating_log`, `grades_value_changelog`, `high_kanten_values`). Các mục từng ghi là chưa đo (màn upload thật, đường liên kết thi cuối kỳ, đường chạy trong transaction, chiều ngược lại) đã đo ngày 30/10/2026, xem mục 11. Còn chưa có (tại 30/10): kiểm soát loại trừ của PR #57058 (đầu `15d6c9d60ae` chưa có phần này cho 一括自動算出) và diff cuối. **Cập nhật 02/11/2026:** PR đã thêm kiểm soát này ở đầu `439657dac95`, đã kiểm lại, xem mục 12.
- **Sửa theo phản hồi của shite (28/10/2026, đã kiểm lại và tái hiện cả 5 điểm):** (1) điểm cá nhân của mục 単元 (đơn vị bài học) tra theo `loop_tangen_id` chỉ khi mục thuộc kỳ 単元, ngược lại dùng 0; (2) 科目グループ (nhóm môn học) trỏ tới 授業 (tiết học) vẫn ra trung bình, vì `AverageRangeFixedSource` nhận dòng `type=group` đúng `group_id` của tiết; kỳ 単元 vẫn trống; (3) tập hợp lưu **theo khóa có loại** (`hr_grade`, `homeroom`, `group`, `calc_group__ID`, `calc_group_combo__ID`, `calc_group_sub_subject__ID`) thay vì tên (tên trùng giữa các loại nên không phân biệt được); chuyển năm học (`takeover/output_data.php`) đổi ID sang ID của năm mới, ID không có bản đích giữ nguyên; log và danh sách vẫn hiện tên; (4) lựa chọn kỳ lấy từ danh sách kết hợp học kỳ–thời kỳ và tập hợp lấy từ `createPopulationList`, không còn phụ thuộc cờ 学年/HR của 順位集計; (5) giới hạn như mục (b) ở trên. Giá trị cũ lưu theo tên (nếu có ở DB local) cần đổi sang khóa thủ công; chưa phát hành nên không có dữ liệu thật.
- **Chưa làm / còn mở:** thay nguồn tạm bằng bộ đọc chung nói trên (trước đây dự kiến `RankingAverageReader`); kiểm tra với bảng thật của PR; F-08, F-09 (`use_relative_evaluation` đã chốt hướng ngày 02/11/2026, xem mục 12.4; chưa triển khai); lịch sử cho ô trống (D4) và tham chiếu nhóm theo tên (ERR-001); CSRF của `auto_rating/*` (D8, có từ trước, làm riêng).
- **Cập nhật 13/11/2026:** con số 10 khoảng × 20 điều kiện và 60.000 byte ở mục (b) **không phải spec chốt**: Shite review PR #57688 là OK ngày 03/11 nhưng nói rõ giới hạn còn bàn với MW; ngày 13/11 Shite nêu thêm việc hai bên hiểu ngược trục hàng/cột và bảng 18 dải của 豊南 không vừa. Xem mục 13. **Đã đóng 19/11/2026:** Shite chốt 20 × 10 và giữ 65.000 byte (mục 13.8).
- **Cập nhật 17/11/2026:** MW xác nhận production không bật Strict SQL Mode (như local); Shite chọn xử lý dung lượng bằng kiểm tra ở app, chưa đổi cột; việc nâng 60.000 → 65.000 chưa được xác nhận. Xem mục 13.6.

## 5. Thiết kế đang đề xuất

[Nội dung giao diện bằng văn bản](docs/screen-definition.vi.md) là đầu vào chuẩn bị thiết kế. Người phụ trách sẽ vẽ mockup trên Figma sau; chưa có liên kết hoặc thiết kế Figma được duyệt. Bộ context không chứa mockup HTML/CSS. Cấu trúc hai cận nối VÀ, cận thứ hai tùy chọn, việc dùng mục đích đang cấu hình, tên phương thức mới và nội dung log là đề xuất.

**Phân biệt nguyên tắc và cách áp dụng:** Q3 EM-001 xác nhận điều kiện cá nhân xét theo thứ tự, lấy lần khớp đầu tiên và ghi trống nếu không điều kiện nào khớp. Quy tắc chung RA-001 Q7 cũng đã chốt: điều kiện trung bình không lấy được giá trị được coi là không khớp, xét điều kiện tiếp theo; nếu không điều kiện nào khớp thì ghi trống. Áp dụng nguyên tắc này cho thứ tự các hàng trung bình EM-001 là cách cụ thể hóa thiết kế, không phải xác nhận riêng của Shite trong thread EM-001. Sau khi một hàng đã được chọn, việc không quay sang hàng trung bình khác nếu điểm cá nhân không khớp vẫn là diễn giải thiết kế, chưa được thread xác nhận riêng.

## 6. Việc còn mở

| Điểm cần hoàn thiện | Loại | Ảnh hưởng và cách tiếp tục |
| --- | --- | --- |
| Chính sách bản nguồn (Q2 của RA-001) | Đã xác nhận 19/10/2026 | Chỉ dùng bản chốt, thiếu thì trống. Còn cần nối bộ đọc chung theo quy tắc này (từ 27/10/2026 là `getTotalResults()` / `getTotalData()` có `$use_fix_table` của PR #57058, thay cho `RankingAverageReader`) và kiểm tích hợp với chức năng chốt 順位集計 khi merge |
| Kiểm soát loại trừ chung (PR #57058) và dữ liệu chốt cũ thiếu 評価項目ID | Đã kiểm 02/11/2026 trên đầu `439657dac95`; chờ diff cuối | PR đã có khóa; đã kiểm ba điểm ở mục 4.1 và kết quả ở mục 12.2–12.3. Dữ liệu cũ thiếu 評価項目ID không ảnh hưởng EM-001 (mục 11). Rủi ro chạy xen trên đường batch nay được khóa bao; đường trong transaction vốn nhất quán; chỉ lệnh CLI chạy tay không được bảo vệ. Cần kiểm lại một lần khi đầu PR ngừng thay đổi Đầu PR đã đổi sang `544fd08880f3` ngày 06/11/2026 và chưa đọc lại: xem mục 12.2. |
| `use_relative_evaluation` (相対評価機能を利用する, bật chức năng đánh giá tương đối) | Đã chốt hướng 02/11/2026 (nội bộ); chưa triển khai | Ẩn lựa chọn loại 9 khi cờ tắt, giữ cấu hình đã lưu; xem mục 12.4 |
| Cận trung bình âm | Chưa chốt, chưa sửa | Xem mục 12.5 |
| Giới hạn số khoảng/điều kiện/dung lượng và cách chia bảng | **Đã chốt 19/11/2026:** 20 × 10, 65.000 byte (Shite chỉ đạo); chưa chia bảng riêng, chưa đổi cột lưu sang `MEDIUMTEXT` | Mục 13.8; chỉ đổi nếu Shite/MW yêu cầu |
| Đổi tên 「平均点連動評価」 và đổi chữ 丸め前 | Chỉ dẫn của Shite 13/11/2026; đã sửa và đã commit (xem 13.10) | Mục 13.1–13.2 |
| `rank_link` (loại 8) trong bảng xóa dữ liệu, dùng chung phần tạo lựa chọn với 順位連動設定, xem lại phương thức dùng chung | Shite xác nhận 19/11/2026: làm ở PR #57688 sau khi #57058 vào; chưa làm | Mục 13.10; phụ thuộc #57058 |
| Cài đặt dạng cũ (lưu tên) | Chỉ có trong DB local (dữ liệu thử); đề xuất không chuyển đổi, chờ Shite xác nhận không có môi trường khác dùng nhánh | Mục 13.10 |
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


## 11. Kiểm chứng bản gộp EM-001 + PR #57058 ngày 30/10/2026

Đầu PR đã đổi sang `544fd08880f3` ngày 06/11/2026 và chưa đọc lại: xem mục 12.2.

Phạm vi: nhánh `feature/EM-001_average_range` (HEAD `0dc9973efb1`) gộp với đầu PR #57058 `15d6c9d60ae` (cập nhật 30/10/2026 01:18 UTC) trong cây tạm, DB local `school_dev`, trường 2, khối 1, kỳ 21394 (1学期期末). Đây là bằng chứng vận hành local, không phải xác nhận của khách hay kết quả nghiệm thu. Đã áp tạm 3 cột của migration PR (`evaluate_item_id` ở hai bảng 授業毎, `calc_conf_updated_at`) vì code PR mới đọc `log.evaluate_item_id`; thiếu thì batch lỗi `Unknown column`. Dữ liệu thử và cột đã khôi phục sau khi chạy. Chi tiết số liệu nằm trong phiên làm việc, không lưu SQL ở đây.

| Hạng mục | Kết quả |
| --- | --- |
| Unit test (shim thay PHPUnit) | Mapper 32, FixedSource 26 (3 test mới), AutoRating 13, `AutoRatingAveragePopulationTokenTest` 3 mới: tất cả pass. Test mới bắt được lỗi 成績連携: bỏ sửa thì 2/3 fail |
| Batch (一括自動算出), 125 dòng | 32 khớp, 33 `no_condition`, 54 `score_blank`, 6 `average_missing`; giống kết quả 29/10 |
| Lưu theo lớp (12 lớp) | md5 các ô giống hệt batch |
| Dữ liệu cũ thiếu 評価項目ID (tập hợp 授業) | `evaluate_item_id` rỗng hay đủ đều đọc ra cùng trung bình (62÷3). Không ảnh hưởng EM-001. Chỉ đo nhóm 授業 |
| Chạy xen, không transaction (batch, lưu lớp) | `unfix` giữa hai lần đọc: cả lớp `average_missing`, ô trống, không có thông báo. `unfix` của PR xóa luôn bảng bản chốt |
| Chạy xen, trong transaction (REPEATABLE READ) | Kết quả như bình thường. Các đường CSV, thi cuối kỳ chạy trong transaction nên không bị |
| Chiều ngược (chưa chốt khi đọc đầu, chốt ngay sau) | Trống đúng trạng thái lúc đọc; chạy lại thì có giá trị |
| `update` (確定 lại) giữa hai lần đọc | Kết quả bình thường |
| CSV nhập lớp qua màn thật | Điểm 70→95 được lưu, 評点 ra đúng theo khoảng và điều kiện |
| 一括入力 CSV qua màn thật | Cần bật `use_grade_bulk_input`, có 成績一括登録設定 và loại trừ môn trùng lớp. Upload "登録しました。", hàng đợi (HR + 4 lớp) tạo đúng. Batch tự chạy từ màn dùng `php index.php` ở thư mục mặc định của container (nhánh chưa gộp PR) nên ra `average_missing`; chạy lại bằng bản gộp cho kết quả đúng (điểm 95 → 5) |
| 成績連携 (thi cuối kỳ) qua màn thật | Lỗi trước khi sửa: `Call to a member function getByYear() on null` ở `GradeCalcResultService::createPopulationList`, gọi từ `AutoRating::getAverageRangePopulationToken`; `AdminGradeExamScoreController` không nạp `GradeCalcDetailConf_m`. Cả thao tác bị hủy, không ghi gì. Sau khi nạp model trong `getAverageRangePopulationToken`: hoàn tất, 20 học sinh, 14 khớp (11→3, 3→5), 6 `no_condition`, kiểm tính lại độc lập đạt |
| Lưu cấu hình trên giao diện | Chặn: giá trị ghi chưa chọn, khoảng mới để trống (thiếu trung bình, thiếu điều kiện), ngưỡng không phải số. Lưu hợp lệ: lưu đúng 3 khoảng × 3 điều kiện, mở lại hiển thị đúng, batch với cấu hình mới khớp tính lại độc lập (65 khớp) |

**Lỗi đã sửa trong code (đã commit local `91656631038` ngày 02/11/2026, chưa push):** `AutoRating::getAverageRangePopulationToken` nạp `GradeCalcDetailConf_m` trước khi lấy danh sách tên tập hợp. Lỗi do commit `659039609a3` (lần sửa theo review) thêm vào; các test trước không thấy vì controller thử tự nạp model này.

**Còn lại:** PR #57058 chưa có kiểm soát loại trừ cho 一括自動算出 ở đầu `15d6c9d60ae`; rủi ro chạy xen không transaction (batch, lưu lớp) cần được bao trong kiểm soát đó. (Tại 30/10; đã kiểm lại ngày 02/11, xem mục 12.) Chưa đo các nhóm 学年毎/HR毎 với dữ liệu cũ thiếu 評価項目ID ngoài nhóm 授業.

## 12. Cập nhật 02/11/2026: kiểm soát loại trừ của PR #57058, chỉ dẫn của Shite và quyết định về `use_relative_evaluation`

Phạm vi: nhánh `feature/EM-001_average_range` (HEAD `91656631038`, trước đó `0dc9973efb1`; PR riêng của EM-001 là ednity/school-web#57688) gộp thử với đầu PR #57058 `439657dac95` (02/11/2026, 倉島雅司, "排他制御の処理を追加" – thêm xử lý kiểm soát loại trừ). Mọi xác nhận dưới đây là **nội bộ nhóm phát triển**, không phải phản hồi của khách. Kết quả test là bằng chứng vận hành local, không phải nghiệm thu.

### 12.0. Diễn biến trong ngày 02/11/2026 (theo thứ tự thời gian, giờ +07)

| Giờ | Ai / ở đâu | Nội dung |
| --- | --- | --- |
| ~13:39 | Shite chuyển tiếp trong thread RC-001 ④ ([tin nhắn](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1793601539437549?thread_ts=1792383099.678219&cid=C0BRGJA6XDE)), gửi cho người phụ trách ① 赤点 và Tuan Vo | Chuyển tiếp thông báo của 倉島さん (người phụ trách PR #57058) và dặn nhóm kiểm tra, chỉnh sửa theo đó (xem dưới) |
| sau 13:39 | Tuan Vo (phiên làm việc) | Kiểm tra PR đầu `439657dac95`: thay đổi gì, khác gì so với code EM-001, có điểm cần xác nhận không; chạy thử ứng dụng; bỏ qua phần không liên quan (ví dụ 赤点). Kết quả ở 12.2–12.3 |
| 15:02 | Tuan Vo, thread EM-001 | Báo kết quả (không cần sửa gì cho khóa) và hỏi 2 điểm về `use_relative_evaluation` (12.4) |
| 15:07 | Shite, thread EM-001 | "That approach is fine." (đồng ý cả hai điểm) |
| 15:10 | Tuan Vo, thread EM-001 | Xác nhận sẽ làm theo hướng đó, báo lại khi xong |

**Thông báo của 倉島さん được Shite chuyển tiếp (tóm tắt, bản gốc tiếng Nhật):** phần xử lý 排他制御 (kiểm soát loại trừ) đã triển khai xong và đẩy lên PR #57058; vẫn còn chỉnh sửa comment đôi chút nhưng việc triển khai về cơ bản đã đủ; tiếp tục làm unit test và tài liệu; vì đây là thay đổi lớn nên ngoài tài liệu cho QA còn soạn tài liệu cho phát triển, cần tài liệu nào thì báo; nhờ xác nhận.

**Chỉ dẫn của Shite kèm theo (dịch từ tiếng Nhật):** "Có vẻ phần xử lý kiểm soát loại trừ đã vào PR, hãy kiểm tra và thực hiện các chỉnh sửa phù hợp theo đó. Hãy hỗ trợ các chức năng đánh giá tương đối liên quan ngoài chức năng phán định điểm liệt (赤点判定)." Do đó: (a) việc kiểm tra tác động của khóa lên EM-001 và (b) việc xem EM-001 có phải theo cờ đánh giá tương đối hay không đều nằm trong phạm vi của chỉ dẫn này. Lưu ý: 倉島さん nói PR còn chỉnh comment nên đầu `439657dac95` có thể còn đổi; cần kiểm lại khi ổn định.

### 12.1. Cơ sở yêu cầu (không đổi, nhắc lại để đọc một chỗ)

- Yêu cầu và Q1–Q4 của khách: mục 1–2. Chỉ dùng kết quả 順位集計 (tổng hợp thứ hạng) đã chốt: mục 4 (Shite, 19/10/2026). Quy tắc kế thừa RA-001/RC-001: mục 4. Bộ đọc chung `getTotalResults(..., true)`: mục 4.1 (nội bộ 27/10/2026).
- Chỉ dẫn của Shite ngày 02/11/2026 (thread RC-001 ④, [tin nhắn](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1793601539437549)): sau khi PR #57058 có kiểm soát loại trừ, kiểm xem EM-001 bị ảnh hưởng gì; hỗ trợ các chức năng đánh giá tương đối liên quan **ngoài** chức năng xét điểm liệt (赤点判定). Chức năng 赤点 không thuộc phạm vi EM-001. Lưu ý: ban đầu câu này từng bị hiểu nhầm là câu trả lời cho câu hỏi về `use_relative_evaluation`; thực tế đó là yêu cầu đồng bộ các chức năng đánh giá tương đối với kiểm soát loại trừ. Câu hỏi về cờ vẫn mở cho đến khi có xác nhận ở 12.4.

### 12.2. PR #57058 đầu `439657dac95` thêm gì (đọc từ code, đối chiếu local)

**Cập nhật 23/11/2026:** đầu PR #57058 đã đổi từ `439657dac95` (đọc 02/11/2026) sang `544fd08880f3` (cập nhật lần cuối 06/11/2026, 33 file, vẫn OPEN, chưa có comment hay review; kiểm ngày 23/11/2026). Toàn bộ phần kiểm tra ở mục 11 và 12 (kiểm soát loại trừ, thử gộp nhánh, bộ đọc nguồn đã chốt) được đọc ở đầu cũ và **chưa đọc lại ở đầu mới**; mới chỉ xem các file kế thừa năm học ở đầu mới (mục 13.10). Cần kiểm lại kiểm soát loại trừ, xung đột khi gộp và bộ đọc nguồn trước khi merge, và kiểm lại nếu PR đổi tiếp.

| Nội dung | Hành vi |
| --- | --- |
| Khóa theo trường | Khóa `GradeCalcFix_{school_id}` (`AggregateRankLock_m::getGradeCalcFixLockName`, thời gian chờ 300 giây) |
| 一括自動算出 (batch) | Sau khi đặt trạng thái 実行中 (đang chạy), batch lấy rồi nhả ngay khóa trên; nếu không lấy được thì trả dòng hàng đợi về chưa chạy, ghi log và bỏ qua lượt này |
| 確定 (chốt), 更新 (cập nhật nội dung chốt), 解除 (gỡ chốt) | Qua `executeOperationWithLock`: khóa tính điểm (chỉ chốt/cập nhật), khóa chốt, rồi kiểm toàn trường có dòng batch đang 実行中 (kể cả dòng bất thường bị bỏ lại) thì từ chối với thông báo "第N学年の成績自動算出が実行中のため、確定・確定内容の更新・確定の解除はできません。完了後に再度お試しください。" |
| Sau lần tổng hợp thất bại | `has_failed_after_latest` chặn 確定/更新 (không liên quan EM-001) |

Phép gộp thử bằng `git merge-tree` với đầu PR: 2 xung đột chữ đơn giản, cùng thêm hai phía (`m_AutoRatingConfItemRegistType.php`, `AutoRating.php` quanh dòng 644), giải quyết bằng giữ cả hai. Đầu PR đã gộp `master` (gồm PR #57369 về `auto_rating`).

### 12.3. Kết quả kiểm trên bản gộp

- **Thành công:** 71 unit test (shim thay PHPUnit); biên 15 ca; 7 loại tập hợp (HR, 学年, nhóm thứ hạng, nhóm kết hợp, 科目グループ, 授業 …); 5 toán tử cho cả trung bình lẫn điểm cá nhân; giá trị 0; kẹp min/max (100 → 30 ô, 0 → 29 ô, NULL → 66 ô); chuyển trạng thái chốt → gỡ chốt → chạy lại (gỡ chốt rồi chạy: toàn bộ NULL; chốt lại: 3 → 65 ô, NULL 60 ô).
- **Khóa:** 確定 bị từ chối khi tồn tại dòng batch trạng thái 2; batch chờ khóa đang giữ rồi mới chạy; nút 自動算出 trên màn hình hoạt động. Cờ `use_relative_evaluation` = 1 thì UI hiện cả lựa chọn 8 (順位連動設定) và 9.
- **Đường vào `AutoRating::calc`:** batch xếp hàng (nút 自動算出, màn xếp hạng, CSV 一括入力, `GroupOptionUseCase`) được khóa bao. Lưu điểm theo lớp, CSV theo lớp, liên kết thi cuối kỳ chạy trong transaction (REPEATABLE READ; `use_readonly_start()` không chuyển sang replica trong transaction) nên không trộn dữ liệu cũ/mới. Chỉ lệnh CLI `php index.php batch/grade/AutoRatingBatch index …` chạy tay không được bảo vệ (dùng cho dev).
- **Kết luận thread Slack (RC-001 ④):** khóa chỉ áp dụng cho 一括自動算出; đăng ký thường nằm trong transaction. Hieu rút câu hỏi liên quan ([tin nhắn](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1793604896064279)); Shite sẽ nhận yêu cầu code review sau khi hoàn tất ([tin nhắn](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1793605030469169)).
- **Phát hiện không thuộc EM-001 (chỉ để báo):** đầu PR tự nó có cảnh báo `$mapping_option_list` chưa khai báo ở `edit_formula.php`; dòng batch tồn đọng ở trạng thái 2 chặn 確定 cả trường (thiết kế của PR).
- **Giới hạn kiểm:** chưa chụp được thông báo từ chối trên màn hình; hai thao tác đồng thời thật chỉ được mô phỏng; chưa có dữ liệu bản chốt local cho 授業平均 và コース.

### 12.4. Quyết định về `use_relative_evaluation` (nội bộ, 02/11/2026)

`school_grade_conf.use_relative_evaluation` ("相対評価機能を利用する", dùng chức năng đánh giá tương đối) do migration `20260825_grade_calc_fix.sql` của PR #57058 thêm. Hiện cờ này chặn các nút 確定 (HTTP 403 ở `AdminGradeSettingSystemGradeCalcController`) và ẩn loại 8 (`REGIST_TYPE_RANK_LINK`, 順位連動設定) trong `AutoRatingConfController` (chỉ UI, không chặn ở server/engine). Loại 9 của EM-001 hiện luôn hiện.

Hai câu hỏi do Tuan Vo đăng trong [thread EM-001](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1793606562301979?thread_ts=1791290107.759389&cid=C0BRGJA6XDE) lúc 15:02 (+07) ngày 02/11/2026; **Shite** trả lời lúc 15:07 ([tin nhắn](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1793606848381429?thread_ts=1791290107.759389&cid=C0BRGJA6XDE)): "That approach is fine." Tuan Vo đã đăng lời xác nhận sẽ làm theo hướng đó và báo lại khi xong lúc 15:10 (đã gửi). Xác nhận này là của Shite dành cho nhóm phát triển, không phải của khách:

1. Khi cờ tắt: **ẩn** lựa chọn loại 9 (平均点連動評価, đánh giá liên động theo điểm trung bình; tên ban đầu 「平均点の範囲で評価を登録する」) giống cách ẩn 順位連動設定; chỉ thay đổi hiển thị trong `AutoRatingConfController`, không đổi cách tính. Đây là **hạn chế mới theo trường**, thay cho ghi nhận trước đó "EM-001 không đặt giới hạn trường riêng" (mục 4, bảng kế thừa).
2. Trường đã cấu hình loại 9 mà sau đó tắt cờ: xử lý như 順位連動設定 hiện nay, **giữ nguyên cấu hình đã lưu**, không xóa.

Trạng thái: đã triển khai trong `AutoRatingConfController::editFormula` (02/11/2026; đã commit `bb1c54849ec`): bỏ loại 9 khỏi danh sách lựa chọn khi `use_relative_evaluation` rỗng, áp dụng cho cả danh sách thường lẫn danh sách mục A/B/C. **Bổ sung kỹ thuật (không đổi hướng đã chốt, cần báo Shite):** nếu mục đang mở **đã lưu loại 9** thì vẫn giữ lựa chọn 9 dù cờ tắt. Lý do: thử trên app cho thấy khi bỏ hẳn radio 9, màn sửa vẫn tick radio 1 mặc định, bấm 更新する (cập nhật) làm mục bị ghi đè thành loại 1 và **xóa sạch cấu hình khoảng, không có thông báo**, trái với ý "giữ cấu hình đã lưu". Cách xử lý 順位連動設定 (loại 8) của PR #57058 có thể có cùng điểm yếu; chưa kiểm vì branch EM-001 không có loại 8.

Kết quả kiểm trên app local (trường 2, đổi tạm cờ rồi trả về 0): cờ 0 → danh sách 1,2,3,4,5,7 (không có 9); cờ 1 → có 9; mục A/B/C cờ 0 → 2,3, cờ 1 → 2,3,9; mục đã lưu loại 9 + cờ 0 → radio 9 được tick, lưu lại vẫn là loại 9 và giữ cấu hình; bản chưa sửa thì bị ghi đè (tái hiện). Chưa có test tự động (logic nằm trong controller, repo chưa có test controller này).

### 12.5. Việc còn mở / chưa chốt (không được tự sửa)

- **Cận trung bình âm:** kiểm tra hiện chỉ cho 0 đến 6 chữ số nguyên, tối đa 4 thập phân (kế thừa RA-001), nhưng DB local có 359 mục khung điểm có min âm (đến -100). Chưa hỏi/chốt với RA-001 hay người phụ trách; code đã hoàn nguyên về trạng thái kế thừa.
- **Đề xuất của nhóm chưa được khách/Shite duyệt:** 10 khoảng, 20 điều kiện, 60.000 byte (mục 4.1 b); từ chối khoảng có cận trống; kiểm min/max và số nguyên khi lưu. **Đã thay thế:** 20 × 10 và 65.000 byte, Shite duyệt 19/11/2026 (mục 13.8).
- **Chênh lệch chưa giải thích:** so sánh snapshot `grades`/`auto_rating_log` giữa bản gộp và bản đối chứng có khác biệt chưa rõ nguyên nhân (các cột dữ liệu giống nhau).
- **Chưa kiểm:** đồng thời thật; màn thi của học sinh; bảng/biểu đồ phân bố trên staging; lớp có điểm tối đa khác nhau; màn xếp hạng bằng thao tác thật; chuyển năm học qua UI đầy đủ.
- **Sau đó:** lời xác nhận "sẽ làm theo hướng đó, báo lại khi xong" đã gửi 15:10; kiểm tích hợp lại khi đầu PR #57058 ổn định.

### 12.6. Code đã commit trong ngày

Commit local `91656631038` (chưa push): nạp `GradeCalcDetailConf_m` trong `AutoRating::getAverageRangePopulationToken` (sửa lỗi 成績連携 ở mục 11) kèm `AutoRatingAveragePopulationTokenTest` (3 test). Các thay đổi chưa được xác nhận (cận âm, test đặc trưng race, test phụ thuộc model, test takeover) đã bỏ.

## 13. Cập nhật 16/11/2026: phản hồi của Shite ngày 03/11 và 13/11, số đo dung lượng ngày 28/10

Nguồn: [tin nhắn của Shite 13/11/2026 21:11 (+07)](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1794579067380739?thread_ts=1791290107.759389&cid=C0BRGJA6XDE) gửi Hieu và Tuan sau cuộc họp với MW; [tin nhắn của Shite 03/11/2026](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1793654503994759?thread_ts=1791290107.759389&cid=C0BRGJA6XDE); [số đo của Tuan Vo 28/10/2026](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1793188019983779?thread_ts=1791290107.759389&cid=C0BRGJA6XDE). Mọi nội dung dưới đây là **chỉ dẫn nội bộ của Shite cho nhóm phát triển**, không phải phản hồi của khách. Chỉ 13.1 và 13.2 đã được sửa ngày 16/11/2026 (đã commit sau đó, xem 13.10; trước đó chưa tạo PR; xem cập nhật trong từng mục); 13.3 và 13.4 chưa triển khai tại thời điểm đó (13.3 đã được Shite chốt 20 × 10 ngày 19/11, xem mục 13.8).

### 13.1. Đổi tên chức năng (chỉ dẫn, đã chốt)

- Dùng tên **「平均点連動評価」** (đánh giá liên động theo điểm trung bình), do cuộc họp chốt, cho cả mục số lẫn mục lựa chọn. Rà màn hình thiết lập và các chữ khác để không còn tên cũ.
- Tên cũ trong bộ context này: 「平均点の範囲で評価を登録する」 (đăng ký đánh giá theo khoảng điểm trung bình) và 「平均点の範囲」 (khoảng điểm trung bình).
- Shite không nói: tiêu đề ticket 228112/228077 và tên mã nội bộ (`average_range`, loại 9) có đổi không — chưa coi là đổi. **Cập nhật 16/11/2026:** đã tìm và đổi tên cũ trong code local (màn sửa loại số và loại lựa chọn, màn công thức, modal lịch sử, thông báo lỗi, comment); không còn tên cũ trong code, dump DB và cột lưu cấu hình/log; không có Excel nào in nhãn này. Chưa commit.

### 13.2. Đổi chữ 「丸め前」 (trước khi làm tròn)

- Đổi thành cách nói dễ hiểu hơn, ví dụ 「端数処理前の平均点」 (điểm trung bình trước khi xử lý phần lẻ); câu chữ cụ thể do nhóm chọn.
- Shite nêu rõ **không phải yêu cầu đổi cách tính**: giữ cách hiện tại, tức trung bình = tổng điểm đã chốt ÷ số học sinh, bất kể cài đặt làm tròn bên 順位集計 (tổng hợp thứ hạng). Chỉ đổi chữ hiển thị. Cụm "trước làm tròn" trong các tài liệu này vẫn là mô tả kỹ thuật, không phải chữ trên màn hình.
- **Cập nhật 16/11/2026:** đã đổi trong code local thành 「端数処理前の平均点」 (tiêu đề cột khoảng điểm ở màn sửa, màn công thức, modal lịch sử và dòng giá trị trung bình trong modal); cách tính không đổi, kiểm bằng cách đảo ngược các thay đổi chữ ra đúng bản gốc. Chưa commit.

### 13.3. Giới hạn kích thước bảng (cần xác nhận, chưa quyết)

- **Hiện trạng Shite đã xem:** 10 dải trung bình (hàng) × 20 điều kiện cá nhân (cột). **Trong nửa sau cuộc họp, Shite hình dung 20 hàng × 10 cột**, nên hai bên đang hiểu ngược trục. Với giới hạn hiện tại, ngay cả 18 dải của 豊南 (Honan) cũng không nhập được vào một bảng.
- Shite muốn chốt giới hạn cuối cùng và **cách chia bảng (分割運用 – vận hành chia nhỏ)** sau khi có kết quả hỏi MW. Câu gốc không nói rõ "chia" là chia cái gì (nhiều thiết lập trên nhiều mục đánh giá, hay bảng riêng theo nhóm đối tượng); chưa hỏi lại.
- Shite nói rõ: đây **không phải** quy tắc "trong tổng 200 ô thì xếp tự do" (合計200セル以内なら自由に組める). Nhóm cần làm cho phần giải thích trên màn hình và phần kiểm tra khi lưu khớp với giới hạn thực, **kể cả giới hạn dung lượng**. Chưa biết thông báo lỗi hiện tại đã nêu rõ giới hạn nào bị vượt hay chưa. **Cập nhật 16/11/2026 (đã commit sau đó, xem 13.10):** lỗi vượt số khoảng ("平均点帯は10個以内で設定してください。") và số điều kiện ("平均点帯N 個人条件は20個以内で設定してください。"; từ 17/11 đổi từ "…個まで設定できます") đã tách và nêu số từ trước; lỗi dung lượng nay nêu giới hạn 60.000 byte và nói dung lượng dùng chung cho cả thiết lập (không chỉ bảng khoảng điểm); hai lời khuyên ở màn công thức và màn lọc đã thống nhất thành một câu; tiêu đề bảng/thông báo dùng cách gọi của Shite: 平均点帯 (khoảng điểm trung bình, hàng) và 個人条件 (điều kiện cá nhân, cột); lỗi "chưa có điều kiện nào" và các dòng mô tả cột ở màn danh sách/màn công thức cũng gọi là 個人条件, còn 個人点 (điểm cá nhân) chỉ dùng cho giá trị đem so sánh. Đã thấy thông báo dung lượng trên app local ở cả màn công thức và màn lọc (絞り込み条件): lưu cấu hình 59.983 byte rồi thêm một dòng lọc thì bị từ chối, bản đã lưu không đổi. Lưu ý: với 10 × 20 giá trị dài nhất, riêng bảng khoảng điểm chỉ khoảng 51 KB (dưới 60.000 byte); dung lượng chỉ bị vượt khi cộng thêm phần khác (ví dụ 絞り込み条件). màn thiết lập có ghi chú nêu ba giới hạn độc lập (số lấy từ hằng số trong `AverageRangeMapper`) và nói dung lượng dùng chung với 絞り込み条件 (điều kiện lọc đối tượng). Các con số chưa đổi; chưa chốt giới hạn cuối và cách chia bảng.
- **Review ngày 03/11/2026:** Shite review PR #57688 là OK nhưng 10 × 20 **chưa phải spec chốt**; sẽ báo sau khi quyết định.
- Chưa có số nào đổi. Không đổi sang "giới hạn chỉ theo dung lượng" trừ khi Shite và MW chọn.

### 13.4. Số đo của Tuan Vo trên bản local ngày 28/10/2026 (không phải production, chưa chạy lại ở đây)

Shite đính kèm ảnh một bảng của ca MW (別表2-1); Tuan đọc là 46 hàng (trung bình 25–70) × 10 mức. Tôi chưa xem ảnh.

| Cỡ (dải × điều kiện) | Dung lượng lưu | Số biến form gửi | Màn thiết lập |
| --- | --- | --- | --- |
| 10 × 20 (giới hạn đến 18/11/2026) | khoảng 51,7 KB với giá trị dài nhất | trong giới hạn | không báo |
| 20 × 10 (giới hạn từ 19/11/2026, đo 19/11 ở local) | 55.522 byte với giá trị dài nhất; 51.762 byte với giá trị thường | trong giới hạn | không báo |
| 46 × 10 | khoảng 111 KB, phải đổi cột sang MEDIUMTEXT | khoảng 1.600; ổn so với `max_input_vars` = 6000 | khoảng 10.000 phần tử, dựng 0,2 giây, thêm hàng/cột 8–15 ms |
| 100 × 100 | khoảng 2,1–2,4 MB | khoảng 30.000; PHP bỏ phần thừa âm thầm, thử nghiệm chỉ 20 khoảng tới server | khoảng 164.000 phần tử, dựng 12 giây (trình duyệt đứng), 0,2–0,4 giây mỗi lần bấm |

- Batch tự tính (125 dòng học sinh, 12 lớp, 5 lần chạy mỗi cỡ, đã nới cột trên DB local): chạy thường 13–14 giây; cỡ cấu hình chỉ thêm vài chục mili giây; bộ nhớ đỉnh 20 → 33 MB ở 100 × 100; không log nào bị cắt. Một vài lần chậm gấp 2–3 lần, cả ở bước không phụ thuộc cấu hình, nên Tuan quy cho máy local.
- Chưa đo: số học sinh lớn; cấu hình server production (chỉ đọc file trong repo).
- Gợi ý của Tuan: gộp các hàng liền kề giống hệt nhau (như trung bình 25–31) thành một khoảng để giảm dung lượng.
- **Suy ra ở đây (ước lượng, không đo):** khoảng 240–260 byte mỗi ô (51,7 KB cho 200 ô; 111 KB cho 460 ô), nên giới hạn 60.000 byte tương ứng khoảng 230–250 ô với giá trị dài nhất. Giới hạn theo số lượng và giới hạn dung lượng là hai giới hạn khác nhau; 200 ô đã sát ngưỡng dung lượng. Bảng 20 × 10 chưa được đo với giới hạn 60.000 byte tại thời điểm này (đã đo ngày 16/11/2026, xem mục 13.6).
- Tuan chọn 10 × 20 một mình và đã nói rõ ([tin nhắn 28/10](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1793175332325559?thread_ts=1791290107.759389&cid=C0BRGJA6XDE); với giá trị dài nhất 13 × 20 đã khoảng 66 KB). Các loại cũ (mapping, formula) không có giới hạn dung lượng và có thể bị cắt tương tự; là hành vi sẵn có, chưa đổi.

### 13.5. Việc còn mở

- Hỏi Shite: (1) 分割運用 là chia gì và nhóm có nên đề xuất cách không; (2) chỉnh phần giải thích và kiểm tra lưu theo **giới hạn hiện tại** ngay, hay chờ con số mới từ MW. Đề xuất của nhóm: làm ngay theo giới hạn hiện tại (màn hình ghi số dải tối đa, số điều kiện tối đa, dung lượng tối đa, và nói không phải "tổng 200 ô xếp tự do"; lỗi lưu nêu rõ giới hạn nào bị vượt), đổi số khi Shite quyết. Chưa gửi gì lên Slack.
- Việc 13.1–13.2 là đổi chữ hiển thị, làm được ngay, không chờ quyết định về giới hạn.

### 13.6. Cập nhật 17/11/2026: nâng giới hạn dung lượng 60.000 → 65.000 byte, dữ liệu của loại đăng ký không dùng, SQL mode production

Nguồn (thread Slack của Shite, giờ +07): [Shite 16/11 15:17](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1794817075151239?thread_ts=1791290107.759389&cid=C0BRGJA6XDE); [Tuan 16/11 16:06](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1794820008281209?thread_ts=1791290107.759389&cid=C0BRGJA6XDE); [Shite 16/11 17:06](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1794823573537949?thread_ts=1791290107.759389&cid=C0BRGJA6XDE); [Shite 16/11 17:27](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1794824863333039?thread_ts=1791290107.759389&cid=C0BRGJA6XDE); [Tuan 16/11 17:46](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1794825992525509?thread_ts=1791290107.759389&cid=C0BRGJA6XDE); [Tuan 17/11 08:29](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1794878979035629?thread_ts=1791290107.759389&cid=C0BRGJA6XDE); [Shite 17/11 08:33](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1794879208867779?thread_ts=1791290107.759389&cid=C0BRGJA6XDE). Xác nhận SQL mode do 山岡丈彦 (Yamaoka, phía MW) trả lời ngày 16/11/2026 18:31 khi Shite hỏi trong một cuộc trao đổi khác; Shite chuyển tiếp cho Hieu và Tuan (không có liên kết trong thread này). Đây là trao đổi nội bộ và phía MW, không phải xác nhận của khách.

**Câu hỏi của Shite (16/11 15:17):** lấy 65.000 byte làm ứng viên, kiểm tra bảng 20 khoảng × 10 điều kiện (bố cục 20 hàng × 10 cột, xem 13.3) có vừa không, kể cả các 絞り込み条件 (điều kiện lọc) cần thiết; 65.000 byte là giới hạn cho toàn bộ JSON của một cài đặt (bảng ánh xạ, 絞り込み条件...), biên còn 535 byte nên phải kiểm việc cập nhật sau khi lưu và 年度引継ぎ (chuyển năm học); dữ liệu cũ còn lại có phải do form chỉ ẩn ô không dùng nhưng vẫn gửi khi lưu không, và vì sao thiết kế như vậy.

**Số đo của Tuan trên app local (không phải production):**

- 20 × 10 vừa 65.000 byte: loại số 51,9 KB, giá trị dài nhất 55,3 KB; loại lựa chọn giá trị dài nhất 55,4 KB; cài đặt 20 × 10 mới tạo chỉ có khoảng 3 KB phần khác. Ngưỡng "phần khác" tối đa để 20 × 10 vừa: ở 65.000 là khoảng 16,1 KB (giá trị điển hình) / 12,7 KB (dài nhất); ở 60.000 là khoảng 11,1 KB / 7,7 KB.
- 絞り込み条件: khoảng 108 byte mỗi điều kiện đơn giản (điều kiện dài có ID và học kỳ khoảng 200 byte); lưu được tới 121 điều kiện (điển hình), 90 (loại số, dài nhất), 88 (loại lựa chọn, dài nhất), vượt thì bị chặn đúng. Dữ liệu local tối đa 7 điều kiện (khoảng 0,8–1,4 KB). **Danh sách 絞り込み条件 cần thiết của khách: không tìm thấy trong tài liệu nào** (đã tra thread Slack, ảnh 別表2-1, Google Sheets 成績に関する資料_相対評価 và 次年度成績機能_仕様, thư mục Drive của EM-001, bộ context này), nên số liệu trên chỉ là ước lượng theo dữ liệu local.
- Nguyên nhân chính là **dữ liệu cũ của các loại đăng ký khác** (mapping, công thức...). Trên DB local (khoảng 56.000 cài đặt không phải loại 9): phần khác lớn hơn 12,7 KB có 172 cài đặt, lớn hơn 16,1 KB có 68 (lớn nhất khoảng 35 KB); ở 60.000 tương ứng lớn hơn 7,7 KB có 1.569 và lớn hơn 11,1 KB có 294. Nâng lên 65.000 giảm số cài đặt không đủ chỗ cho 20 × 10 khoảng 4–9 lần (ước lượng theo dung lượng JSON hiện có của từng cài đặt). Nếu các cài đặt này chuyển sang 平均点連動評価 thì dữ liệu cũ đi theo.
- Biên 535 byte: sắp xếp lại, lưu lại, xóa không làm lớn thêm; 年度引継ぎ cho bản sao nhỏ hơn bản gốc (64.883 so với 64.976 byte) và lưu lại thì về đúng 64.976 byte; cả hai chỗ có kiểm dung lượng (lưu cách đăng ký, lưu 絞り込み条件) đều chặn đúng khi vượt 65.000; các đường ghi không kiểm dung lượng (`delete`, `sort`, 年度引継ぎ, bộ sinh SQL) không làm JSON lớn thêm trong các thao tác đã thử.
- **Lý do dữ liệu cũ còn lại:** form gửi toàn bộ các loại đăng ký và chỉ ẩn ô không dùng, nên khi lưu vẫn ghi cả phần đó; ở loại khác 9 chỉ `average_range` bị xóa. Dữ liệu cũ không được dùng khi chạy tự động và không hiện lại khi chuyển về loại cũ nhưng vẫn chiếm dung lượng. Lý do thiết kế: không có tài liệu; theo lịch sử git (12/2023), màn hình khởi đầu là trang tĩnh chứa mọi loại đăng ký trong một form, JSON của một cài đặt dùng chung hai màn nên mỗi lần lưu gộp/ghi đè cả khối. Tuan cho rằng đây là hệ quả của thiết kế đó, không phải tính năng cố ý; 倉島 (Kurashima, người làm bản đầu) biết chắc.

**Kiểm lại trên app thật ngày 16/11/2026 (bản sao trong container, code repo không đổi):** dùng một cài đặt tạm mang dữ liệu cũ thật khoảng 12 KB cộng đệm, bảng 20 × 10 giá trị dài, cùng một form: bị chặn ở 60.000 byte; lưu được 61.236 byte ở 65.000, JSON hợp lệ, đủ 20 × 10. Form gửi 920 biến; `max_input_vars` thực tế khi chạy qua web là 6000 (do `.htaccess` và `.user.ini`). Một cài đặt lưu lần đầu 63.224 byte, mở lại và lưu lần hai còn 58.236 byte (chưa tìm nguyên nhân; không lớn thêm). Cài đặt tạm đã xóa, giới hạn trong container đã hoàn về 20 × 10 / 60.000.

**SQL mode production:** 山岡 (MW) xác nhận Strict SQL Mode **tắt** ở cả GLOBAL lẫn SESSION. Production giống local: dữ liệu vượt 65.535 byte bị cắt âm thầm, JSON hỏng, không báo lỗi; chốt chặn duy nhất là phép kiểm dung lượng trong app. Các loại đăng ký cũ không kiểm dung lượng nên có thể đã bị cắt như vậy.

**Chỉ dẫn và quyết định:**

- 16/11 17:06, Shite: sẽ hỏi Kurashima về việc **bỏ dữ liệu của loại đăng ký không dùng khỏi phần được lưu**; có phản hồi thì xử lý. Tuan đề xuất việc này (chưa triển khai, chưa thử); chỉ có tác dụng khi cài đặt được lưu lại, dữ liệu cũ đã nằm trong DB cần lưu lại hoặc dọn riêng.
- 16/11 17:27, Shite hỏi rủi ro khi nâng 60.000 lên 65.000 và nói nếu không có thì nên nâng để giảm trường hợp không lưu được. Tuan trả lời (16/11 17:46): rủi ro duy nhất là biên 5.535 → 535 byte; cần xác nhận SQL mode.
- 17/11 08:29, Tuan đề xuất: (1) nâng lên 65.000 byte kèm quy ước mọi đường ghi mới vào cột này phải kiểm dung lượng hoặc đo lại; (2) hoặc đổi cột sang `MEDIUMTEXT`.
- 17/11 08:33, Shite: đổi kiểu cột ảnh hưởng lớn nên **trước mắt xử lý bằng thêm kiểm tra (validation) ở phía ứng dụng**; sau release, nếu khi trường vận hành thực tế có nhiều cài đặt vượt dung lượng cho phép thì cân nhắc đổi kiểu cột hoặc thay đổi nền tảng; dữ liệu không dùng đang xác nhận với Kurashima (cc Tuan).
- **16/11 17:13, Shite hỏi 倉島 (Kurashima) trong kênh 運用保守_tryhand (không phải thread EM-001; không có liên kết ở đây):** đề nghị bỏ dữ liệu của loại đăng ký không dùng khỏi phần được lưu, **chỉ cho 平均点マッピング (tên mới 平均点連動評価)**: khi lưu cài đặt đang chọn loại này thì bỏ dữ liệu riêng của loại không dùng; giữ 絞り込み条件, 対象科目 (môn đối tượng), 設定順序 (thứ tự cài đặt) và phần 平均点マッピング; không mở rộng sang cách lưu của loại khác, không dọn hàng loạt DB hiện có. Lý do Shite nêu: 20 khoảng × 10 điều kiện cộng dữ liệu không dùng vượt dung lượng, nâng 60.000 → 65.000 cũng chưa đủ; dữ liệu không dùng không được dùng khi tự tính và không được dùng để khôi phục khi mở lại màn sửa. Shite hỏi ý đồ ban đầu và chức năng/vận hành nào bị ảnh hưởng.
- **17/11, 倉島 trả lời:** không có ý đồ giữ dữ liệu không dùng, chỉ là sót khi thiết kế; nhận ra sau release, lúc đó không gây hại nên bỏ qua. Nếu được, đề nghị **không chỉ 平均点マッピング mà với mọi loại tính toán (登録方法) đều không để lại dữ liệu cũ không dùng** (bớt rẽ nhánh, triển khai đơn giản hơn); nếu khó thì liên hệ lại; 倉島 cũng sẽ tự kiểm tra hoạt động.
- **17/11, Shite (sau trả lời của 倉島), cc Hieu và Tuan:** không có ý đồ triển khai nên không cần lưu dữ liệu không dùng; muốn sửa **cả các loại đăng ký khác ngoài 平均点連動評価** để cũng không lưu dữ liệu không dùng; nhờ Hieu và Tuan xác nhận, nếu không có vấn đề thì tiến hành. Giờ chính xác của hai tin này chưa được ghi lại. Phạm vi vì vậy **rộng hơn đề xuất ban đầu** (chỉ loại 9); việc dọn hàng loạt dữ liệu đã có trong DB không được nhắc tới trong hai tin này.
- **Kiểm tra kỹ ngày 17/11/2026 (đọc code và chạy thử trên app local; bản thử của việc dọn dữ liệu chỉ nằm trong container, đã hoàn, repo không đổi):**
  1. **Khóa theo loại:** 1 `formula_list`; 2 `mapping-evaluate_frame_item_id`, `mapping_list`, `mapping_formula_list`; 3 `fix_value`; 4 `evaluate_frame_item_id`; 5 `calc_average`; 6 `unit`; 7 `tangen`; 9 `average_range`. Khóa chung phải giữ: `regist_type`, `condition_join_type`, `sub_subject_scorp`, `sort_no`, `setting_condition`, `subjects`, `sub_subjects` (bộ đọc luôn đọc), cùng `setting_name`, `auto_rating_conf_item_id` và khóa `dummy` (giá trị rỗng, có ở khoảng 30.000 dòng; nguồn gốc là ô nhập ẩn `name="dummy"` ở `edit_condition.php` dòng 216, gửi theo form).
  2. **Bộ đọc lúc chạy:** so sánh kết quả `getAutoRatingConfItem` giữa JSON gốc và JSON đã bỏ khóa của loại không dùng trên **toàn bộ 56.372 dòng** của DB local. 56.138 dòng giống hệt nhau, không thêm cảnh báo hay ngoại lệ (loại 1: 15.738; 2: 28.932; 3: 5.824; 4: 3.773; 5: 1.687; 6: 60; 7: 105; 9: 19). 232 dòng không có `regist_type` (bộ đọc bỏ qua) và 2 dòng đã xóa mềm vốn lỗi sẵn ở bộ đọc (không so sánh được).
  3. **Các chỗ đọc khác:** đều đọc theo loại hoặc kiểm `isset`: màn danh sách `edit.php`, modal lịch sử, phần JS của `edit_formula` (mỗi loại chỉ điền phần của mình), 年度引継ぎ (`setCondition`). Bộ sinh SQL chép nguyên cột `condition`. `registCondition` chỉ `array_merge` JSON cũ với dữ liệu gửi lên nên không phụ thuộc khóa riêng của loại nào (cài đặt mới tạo từ màn 絞り込み条件 cũng chưa có các khóa này). `evaluate_frame_item_id` trong JSON chỉ loại 4 dùng (年度引継ぎ đổi ID nếu có); cột cùng tên ở bảng `auto_rating_conf` là thứ khác.
  4. **Chạy qua giao diện với bản dọn dữ liệu:** lưu lại không đổi một cài đặt loại 1, 2, 4, 5 của trường 2 năm 2026. JSON chỉ còn khóa chung và khóa của loại đó (6.481 → 4.748; 5.553 → 2.692; 2.314 → 443; 4.038 → 674 byte). Màn danh sách không lỗi; mở lại màn sửa thì toàn bộ giá trị form của loại đó giống hệt trước khi lưu. Sau đó chạy tiếp qua giao diện cho **loại 3, 6, 7** (loại 6 phải bật tạm cấu hình hệ thống đơn vị, đã hoàn): lưu không đổi, mở lại, giá trị form giống hệt; cũng chạy `registCondition` (lưu 絞り込み条件), đổi thứ tự, xóa; và **年度引継ぎ thật** 2027 (đã dọn) → 2028 qua `copyCurriculum`. Chạy riêng hàm `setCondition` của 年度引継ぎ trên toàn bộ 56.392 dòng (loại 1–7, 9) với ID ánh xạ giả: kết quả giống hệt khi bỏ khóa loại không dùng, không có lệch. Sau đó chạy lại 年度引継ぎ thật 2027 → 2028 với thêm hai cài đặt thử loại 6 và 7: **cả 8 loại (1–7, 9) đều được sao chép đủ**, ID `evaluate_frame_item_id` trong `unit` và `tangen` được ánh xạ sang ID mới của năm 2028 (đã xóa hai cài đặt thử). Phát hiện có sẵn từ trước, không liên quan thay đổi: 切り戻し năm 2029 báo lỗi "評価項目選択肢は入力必須です" do dữ liệu có sẵn.
  5. **So sánh A/B cùng một thao tác:** cài đặt loại 1 có dữ liệu thật khoảng 12 KB, chuyển sang 平均点連動評価, bảng 20 × 10 giá trị dài nhất. Bản gốc lưu 60.224 byte (sẽ bị chặn ở giới hạn 60.000 hiện tại); bản có dọn dữ liệu lưu 52.571 byte.
  6. **Cơ chế dữ liệu cũ (kiểm bằng chạy thật):** ô của loại không dùng chỉ gửi dữ liệu thật khi người dùng **đổi loại ngay trong lần mở đó**. Mở lại màn sửa rồi lưu thì các ô ẩn của loại cũ trống, nên dữ liệu cũ bị thay bằng phần khung trống: cùng cài đặt, mở lại và lưu không đổi thì 60.224 → 55.236 byte (`formula_list` 3.734 → 588 byte, dạng gọn). Vì vậy dữ liệu cũ chủ yếu làm phình **lần lưu đầu tiên sau khi đổi loại**, đúng lúc chuyển sang 平均点連動評価 từ một cài đặt lớn; phần khung trống khoảng 1,5 KB vẫn còn.
  7. **Phần khác còn lại nếu bỏ dữ liệu loại cũ:** với cài đặt đang dùng của loại 1–7 (53.158 dòng), phần khóa chung trung bình 294 byte, lớn nhất 902 byte (dạng gọn của MySQL; bản lưu có xuống dòng và thụt lề lớn hơn, chưa đo). Ước lượng: phần khác không quá khoảng 1–2 KB, nên 20 × 10 giá trị dài nhất (khoảng 52 KB) vừa cả ở 60.000 byte với mọi cài đặt hiện có trên DB local. Số 172 và 68 nêu ở trên gồm cả cài đặt đã xóa mềm; chỉ tính cài đặt đang dùng là 157 (lớn hơn 12,7 KB) và 63 (lớn hơn 16,1 KB). Phần lớn dung lượng đó là dữ liệu của chính loại đang chọn (loại 1 có 15 dòng lớn hơn 12,7 KB và vẫn 15 dòng sau khi dọn), nên mở rộng việc dọn sang mọi loại chỉ giảm trung bình khoảng 0,6 KB (loại 1, 2) đến 1,4 KB (loại 3–7) mỗi cài đặt. Lợi ích chính của việc mở rộng là mã gọn hơn và tránh phình lần lưu đầu khi đổi loại.
  8. **Điểm cần làm đúng khi triển khai:** bỏ khóa của loại không dùng **trước** phép kiểm dung lượng ở `registFormula` (hiện kiểm sau khi gộp mọi khóa; kiểm trước khi bỏ thì vẫn tính cả dữ liệu cũ); `average_range` hiện được gán `[]` cho loại khác 9, cần bỏ hẳn khóa. Dữ liệu cũ đã có trong DB chỉ mất khi cài đặt được lưu lại; 年度引継ぎ và bộ sinh SQL chép nguyên JSON.
- **Chưa xác nhận:** Shite chưa nói thẳng có nâng lên 65.000 hay không; Tuan sẽ hỏi lại. Hieu và Tuan được nhờ xác nhận việc mở rộng sang mọi loại đăng ký (chưa trả lời). Code repo lúc đó (17/11) là `MAX_RANGES = 10`, `MAX_CONDITIONS = 20`, `MAX_CONDITION_BYTES = 60000` (từ 19/11 là 20 / 10 / 65000, xem mục 13.8); chưa đổi hằng số, chưa đổi con số trong các tài liệu khác. Khi chốt thì đổi hằng số và các chỗ ghi 60.000 (thông báo lỗi và ghi chú màn hình tự lấy theo hằng số; unit test dùng hằng số).

### 13.7. Triển khai ngày 17/11/2026 (code đã commit, xem 13.10): bỏ dữ liệu loại đăng ký không dùng cho mọi loại, nâng 65.000 byte

Quyết định của Tuan (người phụ trách): thực hiện việc mở rộng sang mọi loại đăng ký, và nâng 60.000 lên 65.000 byte. Giới hạn độ dài `setting_name` (100 ký tự) đã thử rồi **bỏ lại** theo yêu cầu cùng ngày, vì sợ chặn các tên dài có sẵn ở production; hiện **không có giới hạn tên**. Số khoảng và số điều kiện **giữ 10 × 20** (chưa đổi trục sang 20 × 10) — đã đổi sang 20 × 10 ngày 19/11/2026, xem mục 13.8.

- **Thay đổi:** (1) `registFormula`: hàm mới `removeUnusedRegistTypeData` bỏ khóa của các loại không chọn **trước** phép kiểm dung lượng (loại 1 `formula_list`; 2 `mapping-evaluate_frame_item_id`, `mapping_list`, `mapping_formula_list`; 3 `fix_value`; 4 `evaluate_frame_item_id`; 5 `calc_average`; 6 `unit`; 7 `tangen`; 9 `average_range`), khóa chung giữ nguyên; `average_range` không còn gán `[]` cho loại khác 9 mà bỏ hẳn khóa. (2) `MAX_CONDITION_BYTES` 60.000 → 65.000 (thông báo lỗi và ghi chú ở màn công thức lấy số từ hằng số). (3) Chú thích test sửa 60,000 → 65,000.
- **Chạy qua giao diện (bản sao trong container):** lưu lại không đổi cài đặt loại 1, 2, 4, 5 và 9: JSON chỉ còn khóa chung và khóa của loại đó (loại 1 6.481 → 4.748; loại 2 5.553 → 2.692; loại 4 2.314 → 443; loại 5 4.038 → 674; loại 9, bảng 20 × 10 với giới hạn số khoảng nới tạm trong container, 51.908 → 49.243 byte, đủ 20 khoảng). Thêm 絞り込み条件: 400 dòng bị chặn với thông báo nêu 65.000 byte; 40 dòng lưu được (54.006 byte). **Loại 3, 6, 7 chạy bằng thao tác thật trên màn hình với mã cuối cùng** (chọn loại bằng chuột, nhập giá trị, bấm 更新する; loại 6 cần bật tạm hệ thống đơn vị và đặt cột lưu của mục thử thành `base_unit`, đã hoàn): cùng một cài đặt đổi lần lượt loại 4 → 3 → 7 → 6. Loại 3: 399 byte, chỉ còn `fix_value` = 7; loại 7 (平均, 小数第1位, 四捨五入): 561 byte, chỉ còn `tangen`, `fix_value` mất; loại 6 (điểm 60, 以上): 515 byte, chỉ còn `unit`, `tangen` mất. Mở lại màn sửa sau mỗi lần: loại được chọn đúng, giá trị form giống hệt, không có lỗi PHP. Lưu 絞り込み条件 (`registCondition`) trên loại 6 bằng giao diện: dữ liệu `unit` còn nguyên. Cảnh báo PHP "Undefined array key mapping-right_formula_type" ở loại 2 có sẵn từ trước (cùng kết quả với mã gốc `HEAD`), không do thay đổi này.
- **`registCondition` cũng bỏ dữ liệu loại không dùng** (thêm sau, cùng hàm, trước phép kiểm dung lượng): lưu 絞り込み条件 không đổi cho cài đặt loại 1 còn dữ liệu thừa, 6.481 → 4.780 byte, chỉ còn khóa chung và `formula_list`.
- **Rủi ro còn lại do không giới hạn tên:** biên so với 65.535 byte là 535 byte; các đường không kiểm dung lượng (sắp xếp, xóa) ghi JSON dạng thoát ký tự Nhật (6 byte/ký tự), còn 年度引継ぎ ghi dạng không thoát (3 byte/ký tự), nên một cài đặt loại 9 gần 65.000 byte do 年度引継ぎ tạo và có tên rất dài toàn chữ Nhật có thể lớn thêm khi sắp xếp; khi lưu qua màn sửa thì bị chặn bằng thông báo vượt dung lượng. Dữ liệu local dài nhất 77 ký tự; production chưa kiểm.
- **Chưa làm:** dữ liệu cũ trong DB chỉ mất khi lưu lại qua màn công thức; test đơn vị chưa chạy được (container không có PHPUnit); chưa xác nhận với MW: cột `condition` ở production vẫn là `TEXT` và `max_input_vars` của production.
- **Chỉnh theo review PR 赤点 (17/11/2026, chỉ phần liên quan, code đã commit):** (1) ba comment lộ ra trình duyệt ở `edit_formula.php` (một comment CSS, hai comment JS) chuyển thành comment PHP `<?php // … ?>`; (2) comment sai ở `_log_modal.php` (nói có xử lý lịch sử cũ nhưng code không có) sửa lại; (3) thông báo lỗi dùng đúng chữ trên màn hình: hàng gọi là 平均点帯N, cột là 個人条件M (trước là 範囲N / 条件M), 登録値 thay cho 登録する値, câu giới hạn đổi từ "…個まで設定できます" sang "…個以内で設定してください"; test cập nhật theo. (4) Đã làm thêm cùng ngày: bỏ chữ "PR #57058" khỏi comment đầu `AverageRangeFixedSource.php`; `validateRanges` nay trả đúng một thông báo `AverageRangeMapper::INVALID_VALUE_MESSAGE` (「不正な値が送信されました。」, giá trị gửi lên không hợp lệ) khi toán tử của cận dưới, cận trên hoặc 個人条件 không hợp lệ, thay cho thông báo "chọn toán tử" (chỉ xảy ra khi POST bị sửa); test đơn vị cập nhật và thêm một test mới. Đã thử qua ứng dụng thật (mục thử 20 khoảng): sửa toán tử cận dưới, cận trên và 個人条件 thành `9` đều trả đúng thông báo trên, dữ liệu mục thử không đổi (49.243 byte, 20 khoảng). (5) Hai comment trong `AverageRangeMapperTest.php` nhắc "ví dụ của khách" và "giới hạn cũ" đã viết lại thành mô tả đúng nội dung của test (chỉ đổi comment, không chạy lại test). (6) Chữ trên màn hình `edit_formula.php` thống nhất "範囲" → 平均点帯 (nút 「平均点帯を追加」, hộp xác nhận xóa, câu hướng dẫn và các ghi chú; "平均点帯（行）"); chữ "条件" chỉ cột đổi thành 個人条件 ở hướng dẫn và ghi chú. Đã mở màn hình thật: không còn chữ 範囲 nào hiển thị. (7) Rà lại toàn bộ phạm vi tính năng ngày 17/11/2026: hộp lịch sử tính tự động `_log_modal.php` còn dùng 範囲 / 条件N nên đổi thành 平均点帯N / 個人条件N (kể cả các câu giải thích khi để trống và câu ghi chú); ghi chú và hộp xác nhận xóa cột ở `edit_formula.php` đổi "条件" thành 個人条件. Kiểm chứng: chạy nguyên 4 file test (74 test, 252 assertion, bằng bộ chạy thay PHPUnit vì container không có PHPUnit) đều đạt; hộp lịch sử hiển thị thật bằng view + log dựng từ `buildDetailLog()` cho 5 trường hợp (khớp, không có 平均点帯, thiếu điểm trung bình, 個人点 trống, không có 個人条件) không còn 範囲, không có cảnh báo PHP; ma trận `removeUnusedRegistTypeData` cho cả 8 loại đúng khóa; lưu lại qua màn hình thật loại 2 (5.325 → 2.692 byte), loại 5 (2.447 → 624), loại 9 sau khi xóa bớt xuống 2 平均点帯 (51.785 → 5.504, id 0 và 1, hiển thị lại đúng) và mục 20 平均点帯 bị chặn với 「平均点帯は10個以内で設定してください。」; các dòng thử đã khôi phục đúng kích thước ban đầu. Chưa kiểm được ở ứng dụng thật: phép tính thật (chạy 自動計算) vì cần PR #57058 chưa merge và sẽ ghi điểm của cả lớp; dữ liệu 絞り込み条件 giả của mục thử lớn gây nhiều cảnh báo PHP ở dòng 567 của `AutoRatingConfItemRepository.php` (HRコース không có trong danh sách, mã có từ trước, không thuộc thay đổi này). Ghi nhớ khi PR #57058 merge: loại 8 (順位連動設定) chưa nằm trong bảng khóa của `removeUnusedRegistTypeData`, nên khóa riêng của loại 8 sẽ không bị dọn khi chọn loại khác; cần thêm vào bảng. (8) Chạy lại 17/11/2026 qua ứng dụng thật với mã hiện tại (thao tác bằng sự kiện click/đổi giá trị trên màn hình thật, nút 更新する thật): một mục đổi lần lượt loại 5 → 4 → 3 → 1 → 7 → 6 (2.447 → 441 → 397 → 1.238 → 559 → 513 byte), mỗi lần chỉ còn khóa chung và khóa của loại đó, mở lại màn sửa thấy giá trị giống hệt (loại 6 cần bật tạm hệ thống đơn vị và đặt cột lưu của mục thử thành `base_unit`, đã hoàn); `registCondition`: loại 6 giữ nguyên `unit`, và dữ liệu thừa cố ý chèn vào (`fix_value`, `formula_list`, `calc_average`, `tangen`, `average_range`) bị bỏ sau khi lưu 絞り込み条件 (577 → 547 byte); nút thêm/xóa: hộp xác nhận xóa hiện 「平均点帯を削除します。」 và 「個人条件の列を削除します。」, hủy thì giữ nguyên; nút thêm không giới hạn phía trình duyệt, giới hạn do máy chủ chặn khi lưu (12 平均点帯 → 「平均点帯は10個以内で設定してください。」, 21 個人条件 → 「平均点帯1 個人条件は20個以内で設定してください。」); 2 平均点帯 × 20 個人条件 lưu được và mở lại đúng; sửa toán tử cận dưới/cận trên/個人条件 thành `9` (kể cả khi có lỗi khác) đều chỉ trả 「不正な値が送信されました。」. 年度引継ぎ: không chạy lại toàn bộ (thao tác này thay cả cài đặt của trường trong năm đích); gọi trực tiếp `setCondition()` thật với điều kiện thật của 8 loại: JSON hợp lệ, khóa giữ nguyên, ID đổi sang ID mới (loại 4 và 9), kích thước không tăng; và cách đổi 集計対象 của loại 9 đúng cho 順位集計グループ / 組み合わせ / 科目グループ, giữ nguyên nếu không có đích. Mọi dòng thử đã khôi phục.

### 13.8. Cập nhật 19/11/2026 (code đã commit sau đó, xem 13.10): đổi giới hạn sang 20 khoảng × 10 điều kiện

**Bối cảnh.** Tối 17/11/2026 (23:54) Shite phản hồi hai điểm sau báo cáo tiến độ: (1) bảng xóa dữ liệu loại không dùng không có `rank_link` của 順位連動設定 (thứ hạng liên động); (2) giới hạn vẫn là "10 khoảng × 20 điều kiện" trong khi anh nhớ đã nói 20 × 10, và hỏi vì sao hiểu lệch. Các tin liên quan trong thread: 13/11 Shite viết cuộc họp hình dung 20 hàng × 10 cột (mục 13.3); 16/11 nhờ kiểm chứng 20 × 10 có khả thi không (Tuan kiểm chứng bằng giới hạn tạm: vừa trong 60–65 KB); 16/11 Shite nhắn 倉島 rằng đang kiểm chứng "平均点20範囲×各10条件". Thread không có tin nào Shite nói thẳng "đổi code sang 20 × 10"; mục 13.7 ghi Tuan đã giữ 10 × 20 ngày 17/11.

**Quyết định của Tuan (người phụ trách), 19/11/2026:** đổi sang **20 khoảng (平均点帯, hàng) × 10 điều kiện mỗi khoảng (個人条件, cột)**. Giới hạn dung lượng giữ 65.000 byte.

- **Code (blend, đã commit `7437983bc1a`):** `AverageRangeMapper::MAX_RANGES` 10 → 20, `MAX_CONDITIONS` 20 → 10, sửa comment; thêm test `testLimitsAre20RangesBy10Conditions` cố định hai số. Ghi chú ở màn công thức và thông báo lỗi lấy số từ hằng số nên tự đổi; trong JS và view không có chỗ ghi cứng 10 hoặc 20.
- **Kết quả đã chạy (container local, nhánh feature/EM-001_average_range):** `AverageRangeMapperTest` 36 test OK; cấu hình tối đa 20 × 10 với giá trị dài nhất là 55.522 byte (loại thường 51.762 byte), qua kiểm dung lượng 65.000 byte. Trên màn hình: ghi chú hiện "平均点帯（行）は最大20、個人条件（条件列）は…最大10"; lưu nguyên 20 × 10 thành công; thêm dải thứ 21 báo 「平均点帯は20個以内で設定してください。」; thêm cột thứ 11 báo 「平均点帯1 個人条件は10個以内で設定してください。」. Khi vượt cả hai, chỉ hiện lỗi số dải (kiểm tra dừng ở lỗi đầu tiên).
- **Test case QA:** case EM-QA-018 (tối đa 20 平均点帯) và EM-QA-019 (tối đa 10 個人条件) và phần phạm vi ở trang bìa của hai sheet VI/JA đã sửa theo.
- **Điểm 1 (`rank_link`) vẫn mở:** loại 8 (順位連動設定, `REGIST_TYPE_RANK_LINK`) chỉ có trong PR #57058, không có ở nhánh này và master, nên bảng xóa dữ liệu của nhánh này (8 mục: loại 1–7 và 9) không có `rank_link`. Đã gộp thử hai nhánh (`git merge-tree`, không đổi working tree) và chạy hàm xóa: lưu loại 9 khi còn dữ liệu `rank_link` thì `rank_link` vẫn còn. **Shite đã trả lời ngày 19/11/2026 (10:55):** xử lý `rank_link` ở PR #57688 **sau khi** #57058 được đưa vào (thêm `rank_link` vào bảng xóa và thêm test). Shite cũng phê bình việc báo hoàn thành không nêu phạm vi chưa làm và lý do; khi xin review phải nêu sẵn. Chưa sửa vì phụ thuộc #57058 ([thread](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1795060534707919?thread_ts=1791290107.759389&cid=C0BRGJA6XDE)).
- **Đã đóng — phê duyệt con số 20 × 10 (Shite, 19/11/2026 10:55):** Shite chỉ đạo làm theo 20 平均点帯 × 10 個人条件, cho rằng nếu không lưu dữ liệu không dùng thì thiết kế này vẫn đáp ứng được, và yêu cầu kiểm chứng kèm theo ([thread](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1795060534707919?thread_ts=1791290107.759389&cid=C0BRGJA6XDE)). Mục "chưa có phê duyệt của Shite/MW cho con số cuối" của bản trước nay **đã đóng**. Shite không nói đến giới hạn dung lượng nên vẫn giữ 65.000 byte. Việc "chưa tìm trong thread khác hoặc biên bản MW câu 20 × 10" không còn cần thiết.
- **Kiểm chứng lại 20 × 10 sau chỉ đạo của Shite (19/11/2026, container local, mã hiện tại):** (1) script giới hạn: hằng số 20 × 10, cấu hình lớn nhất 55.522 byte (loại thường 51.762 byte) qua kiểm dung lượng, 21 平均点帯 và 11 個人条件 đều bị chặn đúng thông báo, 20 平均点帯 và 10 個人条件 không lỗi: ALL OK; (2) `AverageRangeMapperTest` 36 test, 159 assertion đạt; cả 4 file test nhắc `AverageRange` (`AverageRangeMapperTest`, `AverageRangeFixedSourceTest`, `AutoRatingAverageRangeTest`, `AutoRatingAveragePopulationTokenTest`) đều đạt (hai file sau chỉ có cảnh báo deprecation); (3) trên màn hình thật: mục thử hiển thị đúng 20 平均点帯 × 10 個人条件, ghi chú giới hạn hiện 20 / 10 / 65.000 byte; bấm 更新する lưu thành công, dữ liệu không đổi (49.243 byte, cùng giá trị băm md5); thêm dải thứ 21 và lưu: 「平均点帯は20個以内で設定してください。」; thêm cột thứ 11 (điền ở cả 20 dải) và lưu: 「平均点帯1 個人条件は10個以内で設定してください。」; sau hai lần bị chặn, dữ liệu trong DB vẫn nguyên (49.243 byte, cùng md5).
- **Chưa làm / chưa kiểm (còn lại):** đã commit và push (xem 13.10); chưa chạy trên staging; đã báo cáo Shite ngày 19/11 (xem 13.10); xử lý `rank_link` chờ #57058 vào; các case QA cho tính tự động, lịch sử, kế thừa năm học chờ chức năng 確定 vào. `MReportLayoutVariablesTest` (5 test fail) không liên quan: nhánh không khác master ở phần đó.

### 13.9. Cập nhật 19/11/2026 (code đã commit sau đó, xem 13.10): lưu nguồn trung bình theo ID (theo góp ý review)

**Nguồn yêu cầu.** Góp ý của reviewer (m-kurashima) trên PR #57688: [https://github.com/ednity/school-web/pull/57688#discussion_r4623772092](https://github.com/ednity/school-web/pull/57688#discussion_r4623772092). Nội dung: lưu tên 順位集計設定 / học kỳ / thời kỳ thì khi tên bị đổi, thiết lập mất liên kết, nên lưu ID; key `sub_subject_avg` chứa học kỳ, thời kỳ và tập thể là khó hiểu; `score_frame_item_id` nên thống nhất thành `evaluate_frame_item_id`. Reviewer nêu dạng lưu mong muốn và nói thiết lập 順位連動 của #57058 cũng lưu theo dạng này.

**Quyết định của Tuan (người phụ trách nhánh này), 19/11/2026:** sửa theo reviewer và đổi ID ngay trong nhánh này, cho đồng bộ. Việc của #57058 (không phải PR do Tuan quản lý) để ngoài phạm vi.

| Trước (lưu tên) | Sau (lưu ID) |
|---|---|
| `calc_conf_name`: tên 順位集計設定 | `grade_calc_conf_id`: ID (uuid 32 ký tự) của `grade_calc_conf` |
| `sub_subject_avg`: `"{tên học kỳ},{tên thời kỳ},{population}"` | `period_term`: `"{period_id}_{term_id}"` và `population` (khóa riêng: `hr_grade`, `homeroom`, `group`, `calc_group__ID`…) |
| `score_frame_item_id` | `evaluate_frame_item_id` |

- **Phạm vi sửa (đã làm ở local):** form và JS màn sửa công thức (`edit_formula.php`), `AutoRatingConfController` (danh sách lựa chọn dạng ID => tên, lưu, kiểm tra), `AverageRangeSource` / `AverageRangeFixedSource` (nhận ID, không còn đổi tên thành ID), `AutoRating` (tính tự động; xác nhận ID thuộc đúng trường và năm học trước khi đọc kết quả; lịch sử vẫn ghi tên), `AutoRatingConfItemRepository` (tóm tắt trên danh sách tra tên từ ID; ID không còn thì hiện 「（削除された順位集計設定）」), kế thừa năm học (`output_data.php`: thêm tham số `linked_term_ids` và `link_grade_calc_conf_ids`, đổi `grade_calc_conf_id`, `period_term`, `population`, `evaluate_frame_item_id`; không có ánh xạ thì giữ ID cũ như các thiết lập khác).
- **Dữ liệu đã lưu theo dạng cũ:** chức năng chưa phát hành nên không chuyển đổi. Khi mở lại màn sửa, mục lưu dạng cũ hiện cảnh báo 「保存されている平均点の設定が見つかりません。選択し直してください。」 và phải chọn lại; trên danh sách, 順位集計設定 hiện 「（削除された順位集計設定）」. Trong DB local có các mục loại 9 dạng cũ (dữ liệu thử), chưa chuyển.
- **Đã kiểm tra (container local, 19/11/2026):** `AverageRangeFixedSourceTest` 24 test, `AutoRatingAverageRangeTest` 14 test (thêm 1 test cho ghi lịch sử khi 順位集計設定 đã bị xóa), `AutoRatingConfTakeOverAverageRangeTest` 4 test mới cho kế thừa năm học (đổi đủ 4 loại ID, giữ ID cũ khi không có ánh xạ, không đổi `period_term` khi chỉ có một phía học kỳ hoặc thời kỳ, giữ nguyên `hr_grade` / `homeroom` / `group`), `AverageRangeMapperTest` 37 test: đều đạt. Trên màn hình thật: danh sách lựa chọn dạng ID; mục dạng cũ hiện cảnh báo; chọn lại và lưu thì DB có đúng 4 khóa mới (`grade_calc_conf_id`, `period_term`, `population`, `evaluate_frame_item_id`), không còn khóa cũ, không có `column_no`; mở lại hiển thị đúng và không cảnh báo; danh sách hiện 「平均点：素点集計（平均点）　時期：1学期期末　集計対象：HR平均」; bỏ trống hoặc gửi ID giả thì báo 「平均点の順位集計設定を選択してください。」 và 「平均点の対象時期と集計対象を選択してください。」, DB không đổi; đổi tên 順位集計設定 thì màn sửa và danh sách hiện tên mới, không cảnh báo; đặt `active = 0` cho 順位集計設定 (mô phỏng xóa) thì màn sửa cảnh báo và danh sách hiện 「（削除された順位集計設定）」 (đã khôi phục sau khi thử).
- **Test case QA:** thêm EM-QA-026 (đổi tên 順位集計設定) và EM-QA-027 (xóa 順位集計設定) vào cả hai sheet VI và JA.
- **Chưa làm / chưa kiểm:** chưa chạy kế thừa năm học bằng màn hình thật (chỉ có test đơn vị cho hàm đổi ID); chưa chạy tính tự động và xem lịch sử với dạng ID (cần chức năng 確定 của #57058 để có kết quả tổng hợp đã chốt; mới có test đơn vị); chưa chuyển đổi các mục dạng cũ trong DB local (đã kiểm và quyết định đề xuất ở 13.10); đã commit và push (xem 13.10). Ghi chú: trong danh sách file của #57058 không thấy `TakeOverUsecase.php` / `output_data.php`, nên chưa rõ `rank_link` được xử lý thế nào khi kế thừa năm học (ngoài phạm vi nhánh này).

### 13.10. Cập nhật 23/11/2026: code đã commit, phản hồi review ngày 19/11, quyết định giữ vị trí cột trống, dữ liệu dạng cũ

**Trạng thái code (repository `blend`, nhánh `feature/EM-001_average_range`).** PR [#57688](https://github.com/ednity/school-web/pull/57688) đang OPEN, base `master`, chưa có kết quả review; head khớp commit mới nhất (kiểm 23/11/2026). Các ghi chú "code local, chưa commit" ở mục 13.8 và 13.9 đã lỗi thời.

| Commit (đã push) | Nội dung |
| --- | --- |
| `7437983bc1a` | Giới hạn 20 平均点帯 (khoảng điểm trung bình) × 10 個人条件 (điều kiện cá nhân), mục 13.8 |
| `a9d1fde317c` | Lưu nguồn trung bình theo ID (mục 13.9); hằng số `m_AutoRatingConfItemRegistType::KEYS_BY_REGIST_TYPE`; lỗi nêu đúng số cột đã nhập; đổi thứ tự hiển thị radio: 単元別テスト (kiểm tra theo đơn vị bài học, loại 7) trước, 平均点連動評価 (loại 9) sau |
| `268e2ab4151` | Ô điều kiện trống giữ nguyên vị trí (bên dưới) |

**Góp ý của reviewer m-kurashima trên PR #57688 (19/11/2026): 4 thread và 1 bình luận bổ sung** (2 lượt review lúc 03:56 và 05:13 UTC):

| Góp ý | Nội dung | Tình trạng |
| --- | --- | --- |
| [r4623388821](https://github.com/ednity/school-web/pull/57688#discussion_r4623388821) | Bảng khóa của từng loại đăng ký nên là hằng số | (a) đã làm: `KEYS_BY_REGIST_TYPE`, dùng ở `removeUnusedRegistTypeData`. (b) thêm `rank_link` (loại 8): **chờ #57058** |
| [r4623772092](https://github.com/ednity/school-web/pull/57688#discussion_r4623772092) | Lưu ID thay cho tên | Đã làm, mục 13.9 |
| [r4623983784](https://github.com/ednity/school-web/pull/57688#discussion_r4623983784) | (a) số cột trong thông báo lỗi; (b) hỏi về việc dồn trái cột trống | (a) đã làm. (b) Shite chốt phương án C, bên dưới |
| [r4624128184](https://github.com/ednity/school-web/pull/57688#discussion_r4624128184) | Xem lại phương thức này sau khi #57058 vào: phía 順位連動設定 (thiết lập thứ hạng liên động) của #57058 đã có xử lý tương đương (đoạn R1243–R1263 của file `diff-4d575afb…` trong diff #57058) nên dùng lại được | **Chờ #57058** |
| [r4624609918](https://github.com/ednity/school-web/pull/57688#discussion_r4624609918) (bổ sung cho r4623388821) | Ví dụ: `KEYS_BY_REGIST_TYPE = [REGIST_TYPE_FORMULA => ['formula_list'], REGIST_TYPE_MAPPING => ['mapping-evaluate_frame_item_id', 'mapping_list', 'mapping_formula_list'], …]`; controller dùng hằng số này | Đã làm theo ví dụ này (`KEYS_BY_REGIST_TYPE`) |

**Quyết định của Shite (19/11/2026 16:46, [tin nhắn](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1795081567331669?thread_ts=1791290107.759389&cid=C0BRGJA6XDE)) và triển khai.** Đây là chỉ dẫn nội bộ của Shite cho nhóm phát triển, không phải phản hồi của khách.

1. **Ô điều kiện cá nhân trống: chọn phương án C (giữ nguyên vị trí).** Lý do của Shite: bản trước loại cột trống theo từng 平均点帯, khiến một số hàng bị dồn trái và thứ tự đánh giá đã xếp thẳng hàng bị lệch; có thể có thiết lập kiểu "平均点帯 này không dùng đánh giá 1". Nhập dở một nửa vẫn báo lỗi theo đúng số cột thực tế. Phương án A (dồn trái) và B (báo lỗi khi có cột trống phía trước) không còn là hướng hiện hành.
2. **Dữ liệu lưu theo định dạng cũ cần được kiểm tra** (mục "Dữ liệu dạng cũ" bên dưới).
3. **Việc còn lại sau #57058 gồm hai việc riêng:** (a) thêm `rank_link` vào bảng xóa dữ liệu loại không dùng, kiểm tra giữ khi chọn và xóa khi đổi sang loại khác; (b) dùng chung với phía 順位連動設定 (thiết lập thứ hạng liên động) phần tạo danh sách lựa chọn cho 順位集計設定 (thiết lập tổng hợp thứ hạng), 学期時期 (học kỳ / thời kỳ) và 母集団 (tập hợp tham chiếu). Shite lưu ý góp ý của Kurashima là (b), không phải "cleanup logic" của (a).

**Hành vi sau khi sửa (commit `268e2ab4151`).**

- `AverageRangeMapper::normalizeRanges`: số hiệu 個人条件 là vị trí cột đã nhập (`id` = vị trí, tính từ 0). Cột trống hoàn toàn (ngưỡng và giá trị đăng ký đều rỗng; ở mục dạng chọn là "選択してください") được **giữ nguyên vị trí**, lưu với phép so sánh mặc định `1`. Chỉ các cột trống **nằm sau cột có dữ liệu cuối cùng** bị cắt bỏ. Giá trị "(空欄)" (`null`, đăng ký trống) không phải ô trống.
- Ô trống được **bỏ qua khi kiểm tra** (`validateRanges`) và **khi tính** (`selectCondition`); nếu một 平均点帯 không có cột nào được nhập thì vẫn báo 「個人条件を1つ以上設定してください」. Nhập dở một nửa báo lỗi theo số cột đã nhập.
- Lịch sử (`auto_rating_log.detail_log`) chỉ ghi các cột có dữ liệu, với số hiệu là vị trí gốc (ví dụ cột 1 trống, khớp cột 2 thì ghi "個人条件2"); modal 成績自動算出履歴 (lịch sử tự động tính điểm) dùng `id + 1` nên khớp. Màn hình danh sách hiển thị ô trống đúng cột; màn hình sửa mở lại đúng vị trí.
- **Giới hạn 10 cột tính theo vị trí:** cột trống ở giữa vẫn được đếm; cột trống sau cột 10 bị cắt nên không gây lỗi; nhập dữ liệu ở cột 11 báo 「平均点帯N 個人条件は10個以内で設定してください。」.
- Vì vị trí đã được lưu, bỏ `column_no` và `removeColumnNo`. Dữ liệu đã lưu trước đây (đã dồn trái) vẫn đọc bình thường, nhưng không khôi phục được vị trí gốc.
- Kế thừa năm học không sửa `ranges`, nên vị trí cột trống được giữ khi kế thừa.

**Kiểm chứng (19/11/2026, container local).**

- Test tự động: `AverageRangeMapperTest` 40 test, 178 assertion (thêm test giữ vị trí, cắt cột cuối, bỏ qua khi tính và ghi log, toàn bộ cột trống); `AverageRangeFixedSourceTest` 24 test; `AutoRatingAverageRangeTest` 14 test (4 cảnh báo deprecation); `AutoRatingConfTakeOverAverageRangeTest` 4 test: đều đạt.
- Kiểm tra ngẫu nhiên 825.435 trường hợp (cột trống rải rác, 1–10 cột): điều kiện được chọn và số hiệu cột luôn khớp cách đọc từ trái sang phải trên dữ liệu gửi lên; lưu rồi đọc lại bằng JSON giữ nguyên; cấu hình 20 × 10 có cột trống 47.065 byte, dưới 65.000 byte.
- Màn hình thật, mục dạng số: để trống cột 1 của dải 1 và cột 3, cột 10 của dải 2 rồi lưu: DB giữ cột 1 và cột 3, cắt cột 10; mở lại và danh sách đúng vị trí; nhập dở báo 「平均点帯1 個人条件1 登録値を入力してください。」 và 「平均点帯3 個人条件5 個人点の値を入力してください。」.
- Màn hình thật, mục dạng chọn (A/B/C/(空欄)): cột 1 và 3 trống, cột 4 chọn "(空欄)": lưu `''` và `null` tách biệt; mở lại hiện "選択してください" và "(空欄)" đúng chỗ, không cảnh báo; danh sách đúng.
- Tính tự động thật cho một lớp 20 học sinh (cột 1 và 3 trống; cột 2 là ≥60 → 3, cột 4 là ≥40 → 2, cột 5 là ≥0 → 1): 20/20 đúng kể cả điểm biên (40,0 vào cột 4; 39,9 vào cột 5; 70 vào cột 2); giá trị ghi vào điểm số khớp. **Dùng bản vá tạm chỉ trong container** vì nhánh chưa có chức năng 確定 (xác định, chốt) của #57058; đã khôi phục sau khi thử.
- Modal log (mục dạng số): chỉ hiện 個人条件2, 4, 5 với số hiệu đúng; dòng được đánh dấu là 個人条件2, kết quả 3.

**Dữ liệu dạng cũ (theo yêu cầu của Shite 19/11).**

- DB local có 22 dòng loại 9 ở dạng cũ (lưu tên): 5 dòng đang dùng (1 dòng năm 2026, 4 dòng năm 2028 tạo ngày 17/11 khi thử kế thừa năm học) và 17 dòng đã xóa mềm; cùng 1 dòng dạng mới. Tất cả thuộc trường demo (school_id = 2), toàn là dữ liệu thử.
- Theo git, các commit đưa ra dạng cũ chỉ nằm trên nhánh này; PR #57688 chưa merge vào `master`. Git không cho biết nhánh có được deploy lên môi trường thử khác hay không: **chưa xác nhận**.
- Hành vi với dạng cũ: màn hình sửa hiện cảnh báo yêu cầu chọn lại nguồn; khi tự động tính, không có ID nguồn nên coi như không có điểm trung bình và đánh giá để trống (đọc từ `calcAverageRange`; chưa chạy lại với dòng cũ).
- **Quyết định đề xuất của người phụ trách:** không làm xử lý chuyển đổi; chỉ cài đặt lại dữ liệu thử. Đã báo Shite ngày 19/11 và hỏi môi trường nào khác đã dùng nhánh này ([phản hồi 17:20](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1795083601566439?thread_ts=1791290107.759389&cid=C0BRGJA6XDE)); chưa có trả lời. Chưa sửa hay xóa 5 dòng dạng cũ đang dùng trong DB local.

**#57058 và kế thừa năm học.** Tại commit `544fd08` của #57058 (cập nhật 06/11/2026, đến 23/11 vẫn OPEN, chưa merge), nhóm file kế thừa năm học `usecase/grade_setting/takeover` không nằm trong 33 file thay đổi; `output_data.php` không có `rank_link`. `rank_link` lưu `grade_calc_conf_id`, `period_term`, `population` (đổi theo năm) nên sau khi kế thừa sẽ vẫn là ID năm cũ. Đây là nhận xét về PR của người khác, không thuộc phạm vi nhánh này; phần tương ứng cho loại 9 nằm ở `FromAutoRatingConf::setCondition` và có thể làm tham khảo. Chưa đọc ticket Redmine 225156 nên chưa biết kế thừa năm học có nằm ngoài phạm vi của ticket đó hay không. Các phần khác của #57058 (kiểm soát loại trừ, thử gộp nhánh) chưa được đọc lại ở đầu này; xem mục 12.2.

**Chưa làm / chưa kiểm (đến 23/11/2026).**

- Chờ #57058: thêm `rank_link` vào `KEYS_BY_REGIST_TYPE` và bảng xóa, kèm test; dùng chung phần tạo lựa chọn; xem lại phương thức dùng chung (góp ý r4624128184); chạy lại tính tự động với dữ liệu 確定 thật (không dùng bản vá tạm).
- Chưa chạy kế thừa năm học bằng màn hình thật (chỉ test đơn vị và mô phỏng ở mức lớp).
- Mục dạng chọn: đã kiểm lưu, mở lại và danh sách; chưa chạy tính tự động rồi mở modal log.
- Chưa chạy trên staging; chưa chuyển đổi hay dọn 5 dòng dạng cũ trong DB local.
- Chưa có test case QA riêng cho ô trống giữ vị trí (hiện có EM-QA-018, 019, 026, 027 ở Sheet test); đến 23/11/2026 chưa có phản hồi nào của người phụ trách trên PR #57688 (kiểm bằng API GitHub: PR không có bình luận hay trả lời thread; Slack chưa có tin mới của Shite sau 19/11 16:46) — bản nháp trả lời reviewer đã có.
