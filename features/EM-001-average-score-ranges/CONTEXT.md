# Context EM-001 — Ánh xạ đánh giá theo khoảng điểm trung bình

Cập nhật: **02/11/2026** (thêm mục 12: PR #57058 đã có kiểm soát loại trừ ở đầu `439657dac95`, kết quả kiểm lại trên bản gộp, chỉ dẫn của Shite, hai quyết định về `use_relative_evaluation` và các điểm còn mở; trước đó 30/10/2026: thêm mục 11: kiểm chứng bản gộp với PR #57058 `15d6c9d60ae`, gồm lỗi 成績連携 đã sửa; ghi nhận quyết định của nhóm PR #57058 về dữ liệu chốt cũ thiếu 評価項目ID và kiểm soát loại trừ chung, mục 4.1 và 6; trước đó 28/10/2026: chuyển EM-001 sang bộ đọc chung `getTotalResults()` của PR #57058, mục 4.1; trước đó 27/10/2026: ghi nhận thống nhất bộ đọc bản chốt dùng chung ở mục 4.1 và 6; trước đó 22/10/2026: đối chiếu code branch EM-001 và thread Slack, thêm mục 4.1 trạng thái triển khai; trước đó 20/10/2026: EM-001 đổi sang mã loại đăng ký 9 vì PR #57058 dùng mã 8, xem kế hoạch mục 15; áp dụng xác nhận của Shite ngày 19/10/2026 về chỉ dùng kết quả tổng hợp thứ hạng đã chốt, mục 4; trước đó 19/10/2026 bổ sung quyết định kế thừa từ RA-001/RC-001 và 16/10/2026 bổ sung kiểm chứng local Q4). Định danh feature: **EM-001**, được người phụ trách xác nhận ngày 14/10/2026. Chưa đối chiếu mã trên Sheet/Redmine.

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
- **Lựa chọn kỹ thuật của nhóm, chưa được khách xác nhận** (Q3: cấu hình sai là trách nhiệm của trường, nên cần người phụ trách xác nhận mức kiểm tra này): (a) từ chối khi lưu nếu giá trị đăng ký ngoài min/max hoặc là số lẻ ở mục số; (b) tối đa 10 khoảng và 20 điều kiện mỗi khoảng, đồng thời JSON cấu hình sau khi định dạng không quá 60.000 byte (cột `condition` là `TEXT` 65.535 byte; cấu hình DB của app không bật strict nên dữ liệu quá dài bị cắt âm thầm; 20×20 ước tính 92–100KB nên không dùng được; kiểm tra này chạy ở cả hai đường ghi `condition` có thể làm nó lớn lên: `registFormula` (lưu cách đăng ký) và `registCondition` (sửa 絞り込み条件 – điều kiện lọc; đã tái hiện 28/10/2026: cấu hình 59.900 byte + 80 bộ lọc bị cắt còn 65.535 byte, JSON hỏng, trước khi thêm kiểm tra). `delete`/`sort` chỉ đổi `sort_no` nên không đổi dung lượng đáng kể; chuyển năm học ghi JSON gọn hơn); (c) ô điều kiện chưa dùng ("選択してください", để trống cả ngưỡng và giá trị) khác với đăng ký trống ("(空欄)"), nhập dở thì báo lỗi; (d) kiểm tra mục thuộc đúng cấu hình khi lưu/mở màn sửa. Chi tiết xem [kế hoạch 15.y–15.v và 15.u](plans/average-range-mapping-implementation-plan.vi.md).
- **Bộ đọc bản chốt dùng chung (thống nhất nội bộ 27/10/2026, chưa phải xác nhận của khách; EM-001 đã chuyển sang 28/10/2026):** shite và người làm PR #57058 thống nhất ba chức năng (xét điểm liệt, RA-001, EM-001) đọc kết quả đã chốt qua `GradeCalcResultService::getTotalResults()` với `$use_fix_table = true` (PR #57058, chưa vào `master`), dùng `student_count` (không dùng `examinees` hay `avg_score` đã làm tròn); trung bình trước làm tròn = tổng điểm ÷ `student_count`. EM-001 nay đọc qua `AverageRangeFixedSource` (nhánh `feature/EM-001_average_range`), **không còn SQL riêng** (đã bỏ `AverageRangeSourceStub` và `getFinalizedEach*TotalResult`). Tập hợp hỗ trợ: 学年毎, HR毎, 授業 (chỉ khi bật 授業毎の集計), nhóm tổng hợp thứ hạng, nhóm kết hợp; **科目グループ (nhóm môn học) đã hỗ trợ từ 28/10/2026**: giao diện hiện tên nhóm + 平均, `AutoRating` đổi thành `calc_group_sub_subject__<id>` và hàm chung `getTotalResults` tự xác định nhóm thực tế theo môn của tiết (đã chạy thử trên DB local: môn 10028 ra nhóm kết hợp 115÷5 = 23, môn khác ra HR). Trước khi PR #57058 vào `master`, nhánh tự thoái lui an toàn: hàm chung chưa có tham số `$use_fix_table` hoặc chưa có bảng/lớp bản chốt thì mọi trung bình thiếu, ô ghi trống, không đọc kết quả chưa chốt. Gộp thử với đầu PR `9a91794106b`: xung đột chữ chỉ ở `m_AutoRatingConfItemRegistType.php` (`REGIST_TYPES_CHOICE`, giữ cả hai bên); `AutoRating.php` tự gộp được (kiểm lại 28/10/2026); mã loại 9 không trùng mã 8 của PR. Yêu cầu `log_id` chỉ áp dụng cho xét điểm liệt. Chi tiết: [RA-001 research](../RA-001-ranking-average/research/confirmed-result-reader.vi.md).
- **Kiểm soát loại trừ chung và dữ liệu chốt cũ (thread Slack ngày 29–30/10/2026; nội bộ, chưa phải xác nhận của khách):** (1) PR #57058 sẽ thêm kiểm soát loại trừ chung giữa thao tác 確定 (chốt) và 一括自動算出 (tính tự động hàng loạt), dùng trạng thái đang chạy và bảng khóa hiện có: bên chạy trước thắng, 確定 bị từ chối nếu 一括自動算出 đang chạy, ngược lại 一括自動算出 phải chờ; lưu điểm theo lớp giữ transaction hiện có. Sau khi triển khai, diff mới nhất sẽ được chia sẻ để phía xét điểm liệt/ánh xạ kiểm tra ba điểm: ảnh hưởng đến cách gọi và kết quả, phạm vi (đường chỉ xét điểm liệt, CSV 一括入力), xử lý khi chờ/lỗi và hiển thị hoàn tất. Bước đầu chỉ rà soát phạm vi ảnh hưởng, chưa giả định kiểm soát riêng cho từng chức năng. (2) Kết quả tổng hợp theo lớp (授業毎の集計) đã có từ trước thiếu 評価項目ID: không thêm kiểm tra khi 確定, không sửa hàng loạt DB production; sau release xác nhận trường bị ảnh hưởng, CS/営業 hướng dẫn tổng hợp lại và 確定 lại; 倉島さん đã xác nhận giữ nguyên như vậy ngày 30/10/2026. **Ảnh hưởng tới EM-001 (suy luận từ code ngày 29/10, đã đo lại 30/10 và không đúng):** EM-001 đọc bản chốt qua `getTotalResults(..., true)`. Đo 30/10 với dữ liệu 授業毎 có `evaluate_item_id` rỗng: EM-001 vẫn đọc được trung bình, kết quả giống hệt khi điền đủ (mục 11). Không cần tổng hợp lại, 確定 lại vì lý do này. **Kiểm tra cục bộ 29/10/2026 trên cây gộp EM-001 + PR #57058 (chưa có khóa trong PR):** (a) EM-001 chỉ phụ thuộc phần chung ở `AutoRating::calcAverageRange`, gồm hai lần đọc riêng không khóa (`GradeCalcFixLogRepository::findActiveBy`, rồi `getTotalResults` với `$use_fix_table = true`); (b) giả lập `unfix` giữa hai lần đọc làm toàn bộ 125/125 ô trong khối thử bị ghi trống, không có thông báo, nên kiểm soát loại trừ phải bao cả phần đọc của EM-001; (c) các đường vào `AutoRating::calc` gồm 一括自動算出 (`AutoRatingBatch`, được xếp hàng từ màn tính điểm, CSV 一括入力, màn xếp hạng và `GroupOptionUseCase`), lưu điểm theo lớp, CSV nhập theo lớp và liên kết thi cuối kỳ (`ScoringResultService`); EM-001 không có đường chỉ xét điểm liệt; (d) đường lưu theo lớp, CSV nhập lớp (giả lập hai bước) và cron của CSV 一括入力 cho kết quả trùng khớp với batch đầy đủ; (e) EM-001 ghi cùng bốn bảng như các loại khác (`grades`, `auto_rating_log`, `grades_value_changelog`, `high_kanten_values`). Các mục từng ghi là chưa đo (màn upload thật, đường liên kết thi cuối kỳ, đường chạy trong transaction, chiều ngược lại) đã đo ngày 30/10/2026, xem mục 11. Còn chưa có (tại 30/10): kiểm soát loại trừ của PR #57058 (đầu `15d6c9d60ae` chưa có phần này cho 一括自動算出) và diff cuối. **Cập nhật 02/11/2026:** PR đã thêm kiểm soát này ở đầu `439657dac95`, đã kiểm lại, xem mục 12.
- **Sửa theo phản hồi của shite (28/10/2026, đã kiểm lại và tái hiện cả 5 điểm):** (1) điểm cá nhân của mục 単元 (đơn vị bài học) tra theo `loop_tangen_id` chỉ khi mục thuộc kỳ 単元, ngược lại dùng 0; (2) 科目グループ (nhóm môn học) trỏ tới 授業 (tiết học) vẫn ra trung bình, vì `AverageRangeFixedSource` nhận dòng `type=group` đúng `group_id` của tiết; kỳ 単元 vẫn trống; (3) tập hợp lưu **theo khóa có loại** (`hr_grade`, `homeroom`, `group`, `calc_group__ID`, `calc_group_combo__ID`, `calc_group_sub_subject__ID`) thay vì tên (tên trùng giữa các loại nên không phân biệt được); chuyển năm học (`takeover/output_data.php`) đổi ID sang ID của năm mới, ID không có bản đích giữ nguyên; log và danh sách vẫn hiện tên; (4) lựa chọn kỳ lấy từ danh sách kết hợp học kỳ–thời kỳ và tập hợp lấy từ `createPopulationList`, không còn phụ thuộc cờ 学年/HR của 順位集計; (5) giới hạn như mục (b) ở trên. Giá trị cũ lưu theo tên (nếu có ở DB local) cần đổi sang khóa thủ công; chưa phát hành nên không có dữ liệu thật.
- **Chưa làm / còn mở:** thay nguồn tạm bằng bộ đọc chung nói trên (trước đây dự kiến `RankingAverageReader`); kiểm tra với bảng thật của PR; F-08, F-09 (`use_relative_evaluation` đã chốt hướng ngày 02/11/2026, xem mục 12.4; chưa triển khai); lịch sử cho ô trống (D4) và tham chiếu nhóm theo tên (ERR-001); CSRF của `auto_rating/*` (D8, có từ trước, làm riêng).

## 5. Thiết kế đang đề xuất

[Nội dung giao diện bằng văn bản](docs/screen-definition.vi.md) là đầu vào chuẩn bị thiết kế. Người phụ trách sẽ vẽ mockup trên Figma sau; chưa có liên kết hoặc thiết kế Figma được duyệt. Bộ context không chứa mockup HTML/CSS. Cấu trúc hai cận nối VÀ, cận thứ hai tùy chọn, việc dùng mục đích đang cấu hình, tên phương thức mới và nội dung log là đề xuất.

**Phân biệt nguyên tắc và cách áp dụng:** Q3 EM-001 xác nhận điều kiện cá nhân xét theo thứ tự, lấy lần khớp đầu tiên và ghi trống nếu không điều kiện nào khớp. Quy tắc chung RA-001 Q7 cũng đã chốt: điều kiện trung bình không lấy được giá trị được coi là không khớp, xét điều kiện tiếp theo; nếu không điều kiện nào khớp thì ghi trống. Áp dụng nguyên tắc này cho thứ tự các hàng trung bình EM-001 là cách cụ thể hóa thiết kế, không phải xác nhận riêng của Shite trong thread EM-001. Sau khi một hàng đã được chọn, việc không quay sang hàng trung bình khác nếu điểm cá nhân không khớp vẫn là diễn giải thiết kế, chưa được thread xác nhận riêng.

## 6. Việc còn mở

| Điểm cần hoàn thiện | Loại | Ảnh hưởng và cách tiếp tục |
| --- | --- | --- |
| Chính sách bản nguồn (Q2 của RA-001) | Đã xác nhận 19/10/2026 | Chỉ dùng bản chốt, thiếu thì trống. Còn cần nối bộ đọc chung theo quy tắc này (từ 27/10/2026 là `getTotalResults()` / `getTotalData()` có `$use_fix_table` của PR #57058, thay cho `RankingAverageReader`) và kiểm tích hợp với chức năng chốt 順位集計 khi merge |
| Kiểm soát loại trừ chung (PR #57058) và dữ liệu chốt cũ thiếu 評価項目ID | Đã kiểm 02/11/2026 trên đầu `439657dac95`; chờ diff cuối | PR đã có khóa; đã kiểm ba điểm ở mục 4.1 và kết quả ở mục 12.2–12.3. Dữ liệu cũ thiếu 評価項目ID không ảnh hưởng EM-001 (mục 11). Rủi ro chạy xen trên đường batch nay được khóa bao; đường trong transaction vốn nhất quán; chỉ lệnh CLI chạy tay không được bảo vệ. Cần kiểm lại một lần khi đầu PR ngừng thay đổi |
| `use_relative_evaluation` (相対評価機能を利用する, bật chức năng đánh giá tương đối) | Đã chốt hướng 02/11/2026 (nội bộ); chưa triển khai | Ẩn lựa chọn loại 9 khi cờ tắt, giữ cấu hình đã lưu; xem mục 12.4 |
| Cận trung bình âm | Chưa chốt, chưa sửa | Xem mục 12.5 |
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

1. Khi cờ tắt: **ẩn** lựa chọn loại 9 (平均点の範囲で評価を登録する, đăng ký đánh giá theo khoảng điểm trung bình) giống cách ẩn 順位連動設定; chỉ thay đổi hiển thị trong `AutoRatingConfController`, không đổi cách tính. Đây là **hạn chế mới theo trường**, thay cho ghi nhận trước đó "EM-001 không đặt giới hạn trường riêng" (mục 4, bảng kế thừa).
2. Trường đã cấu hình loại 9 mà sau đó tắt cờ: xử lý như 順位連動設定 hiện nay, **giữ nguyên cấu hình đã lưu**, không xóa.

Trạng thái: đã triển khai trong `AutoRatingConfController::editFormula` (02/11/2026, chưa commit): bỏ loại 9 khỏi danh sách lựa chọn khi `use_relative_evaluation` rỗng, áp dụng cho cả danh sách thường lẫn danh sách mục A/B/C. **Bổ sung kỹ thuật (không đổi hướng đã chốt, cần báo Shite):** nếu mục đang mở **đã lưu loại 9** thì vẫn giữ lựa chọn 9 dù cờ tắt. Lý do: thử trên app cho thấy khi bỏ hẳn radio 9, màn sửa vẫn tick radio 1 mặc định, bấm 更新する (cập nhật) làm mục bị ghi đè thành loại 1 và **xóa sạch cấu hình khoảng, không có thông báo**, trái với ý "giữ cấu hình đã lưu". Cách xử lý 順位連動設定 (loại 8) của PR #57058 có thể có cùng điểm yếu; chưa kiểm vì branch EM-001 không có loại 8.

Kết quả kiểm trên app local (trường 2, đổi tạm cờ rồi trả về 0): cờ 0 → danh sách 1,2,3,4,5,7 (không có 9); cờ 1 → có 9; mục A/B/C cờ 0 → 2,3, cờ 1 → 2,3,9; mục đã lưu loại 9 + cờ 0 → radio 9 được tick, lưu lại vẫn là loại 9 và giữ cấu hình; bản chưa sửa thì bị ghi đè (tái hiện). Chưa có test tự động (logic nằm trong controller, repo chưa có test controller này).

### 12.5. Việc còn mở / chưa chốt (không được tự sửa)

- **Cận trung bình âm:** kiểm tra hiện chỉ cho 0 đến 6 chữ số nguyên, tối đa 4 thập phân (kế thừa RA-001), nhưng DB local có 359 mục khung điểm có min âm (đến -100). Chưa hỏi/chốt với RA-001 hay người phụ trách; code đã hoàn nguyên về trạng thái kế thừa.
- **Đề xuất của nhóm chưa được khách/Shite duyệt:** 10 khoảng, 20 điều kiện, 60.000 byte (mục 4.1 b); từ chối khoảng có cận trống; kiểm min/max và số nguyên khi lưu.
- **Chênh lệch chưa giải thích:** so sánh snapshot `grades`/`auto_rating_log` giữa bản gộp và bản đối chứng có khác biệt chưa rõ nguyên nhân (các cột dữ liệu giống nhau).
- **Chưa kiểm:** đồng thời thật; màn thi của học sinh; bảng/biểu đồ phân bố trên staging; lớp có điểm tối đa khác nhau; màn xếp hạng bằng thao tác thật; chuyển năm học qua UI đầy đủ.
- **Sau đó:** lời xác nhận "sẽ làm theo hướng đó, báo lại khi xong" đã gửi 15:10; kiểm tích hợp lại khi đầu PR #57058 ổn định.

### 12.6. Code đã commit trong ngày

Commit local `91656631038` (chưa push): nạp `GradeCalcDetailConf_m` trong `AutoRating::getAverageRangePopulationToken` (sửa lỗi 成績連携 ở mục 11) kèm `AutoRatingAveragePopulationTokenTest` (3 test). Các thay đổi chưa được xác nhận (cận âm, test đặc trưng race, test phụ thuộc model, test takeover) đã bỏ.
