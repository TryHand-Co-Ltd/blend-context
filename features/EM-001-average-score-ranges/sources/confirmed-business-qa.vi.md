# Nguồn xác nhận của Shite và phản hồi của nhóm — EM-001

**Nguồn:** [chuỗi trao đổi Slack về Average Score Ranges](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1791290107759389), [phản hồi Q1–Q4 của Shite](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1791883926294639) và [lời xác nhận lại của nhóm](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1791893930779779). Tài liệu câu hỏi đính kèm ngày 13/10 là đề xuất của nhóm; các phần trái với phản hồi này đã bị thay thế.

## Yêu cầu gốc vẫn áp dụng

- Pattern B gồm hai bước: trung bình nhóm chọn hàng, rồi điểm cá nhân được xét theo điều kiện của hàng đó để ghi kết quả. Pattern B′ không thuộc phạm vi.
- Chỉ định cấu hình tổng hợp, thời kỳ, tập thể, mục điểm cá nhân và mục nhận kết quả; cho đăng ký/sửa điều kiện, lưu/mở lại cấu hình, tính/ghi khi chạy AutoRating và tính lại khi trung bình hoặc bảng thay đổi.
- Ví dụ gốc: cùng điểm cá nhân 85, trung bình 49 → 5, trung bình 60 → 4. Mốc 100 điểm/5 mức chỉ minh họa. Các tài liệu tham khảo có phương án cũ, không được coi mọi chi tiết trong đó là yêu cầu đã chốt.
- Shite yêu cầu tổ chức đề xuất màn hình, phạm vi thay đổi, điểm cần xác nhận và ước lượng; điểm chưa chốt cần phương án và khuyến nghị để review.

## Nội dung đã chốt

1. **Loại mục (Q1):** Mục dùng làm điểm cá nhân và nguồn trung bình để xét điều kiện là **mục số**; không dùng mục lựa chọn A/B/C làm căn cứ xét, giống quy tắc xét điểm đỏ. **Mục nhận kết quả có thể là mục lựa chọn**, chẳng hạn đánh giá theo quan điểm A/B/C. Ví dụ Shite đưa ra: trung bình điểm thô 0–50 → C, 51–70 → B, 71–100 → A. Đây là ví dụ, không phải các mốc cố định. Những phần có thể dùng chung với xét điểm đỏ và chức năng trung bình xếp hạng cần được dùng chung.
2. **Giá trị đích và số điều kiện (Q2):** Không tạo khái niệm “số mức đánh giá” riêng hay chức năng tăng/giảm mức. Người dùng chọn mục nhận kết quả đã có, rồi cấu hình điều kiện và giá trị đăng ký thuộc mục đó. Số điều kiện ánh xạ **không cần bằng** số giá trị/mức của mục nhận kết quả. Ví dụ Shite: mục số có giới hạn 1–5 nhưng bảng chỉ dùng ba kết quả 2, 4, 5.
3. **So sánh và trường hợp không khớp (Q3):** Dùng các toán tử hiện có: từ…trở lên（以上）, lớn hơn（より大きい）, bằng（等しい）, nhỏ hơn（より小さい）, từ…trở xuống（以下）. Nếu nhiều điều kiện cùng khớp, lấy **điều kiện khớp đầu tiên theo thứ tự cấu hình**. Nếu không khớp điều kiện nào, ghi **trống**, kể cả khi ô trước đó có kết quả. Không tự gán mức thấp nhất; muốn mức đó thì phải cấu hình điều kiện rõ ràng, ví dụ “dưới 30 điểm → 1”. Phản hồi của Shite nêu “theo đặc tả hiện có” và nhóm xác nhận đã đối chiếu với chức năng đăng ký kết quả ánh xạ（マッピングした結果を登録する）; chưa có kiểm thử runtime mới trong lần cập nhật tài liệu này.
4. **Kiểm tra số lượng kết quả (Q4):** Shite hướng dẫn dùng bảng và biểu đồ phân bố tần suất（度数分布表・グラフ）trong màn hình trích xuất thành tích（成績抽出）. Shite yêu cầu thử luồng vận hành thực tế. Phản hồi triển khai của nhóm được ghi riêng bên dưới.

## Phần bổ sung không phải lời xác nhận trực tiếp của Shite

- **Nhóm bổ sung trong phản hồi cuối:** điểm cá nhân để trống cũng cho kết quả trống theo đặc tả hiện có. Đây không phải câu Shite nêu trực tiếp; chuỗi chưa có phản hồi tiếp theo của Shite về phần bổ sung. Phân biệt ô trống với 0 dựa trên khảo sát mã nguồn.
- Nhóm trả lời Q4 rằng không tạo màn mới và sẽ thử trên staging, báo cáo kết quả; chưa có kết quả thử trong chuỗi.
- Ví dụ bổ sung theo yêu cầu người dùng, không phải ngưỡng Shite phê duyệt: chỉ dùng 1, 3, 5 cũng hợp lệ; 2 và 4 vẫn thuộc giới hạn mục đích nhưng không được bảng này trả về. Đây không phải thao tác đổi mục đích thành thang ba mức.

## Việc tiếp theo và giới hạn xác nhận

- Sau khi yêu cầu và thiết kế hoàn tất, Shite yêu cầu chuẩn bị tài liệu tổng quan tương tự tài liệu đã làm cho chức năng điểm đỏ. Đây là việc tiếp theo, chưa phải tài liệu đã được tạo hoặc duyệt.
- Nhóm dự kiến thiết kế UI rồi gửi Shite review; chưa có phê duyệt thiết kế; các ví dụ nghiệp vụ được ghi trong [đặc tả dự thảo](../docs/specification.vi.md).
- Q1–Q4 ở trên đã được trả lời; không tiếp tục trình bày đề xuất cũ “chỉ nhận kết quả số”, “tối thiểu hai mức”, “cột còn lại tự động”, hoặc “chặn mọi khoảng chồng lấn” như đặc tả đã chốt. Chi tiết hình thức nhập điều kiện cho hai bước cần thiết kế và review theo các quy tắc đã xác nhận, đặc biệt thứ tự xét điều kiện và ghi trống khi không khớp.
- Việc chọn bản tổng hợp khi chưa có bản chốt đã được Shite xác nhận ngày 19/10/2026 trong [thread RC-001 ④](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1792383099678219) (chỉ dùng bản chốt, thiếu thì trống); phản hồi Q1–Q4 trong thread EM-001 không chốt vấn đề đó. Ước lượng 13–20,5 ngày công trong bản phân tích cũ chỉ áp dụng cho phạm vi **mục nhận kết quả số và bảng ngưỡng đề xuất cũ**, nên cần ước lượng lại sau khi thiết kế mới hoàn tất.

## Ranh giới xác nhận sau đối chiếu toàn chuỗi

- **Chưa được Shite duyệt:** layout/số màn, nhãn phương thức mới, việc không thêm bộ chọn đích riêng, ngưỡng A/B/C và 1, 3, 5 trong ví dụ bổ sung, cấu trúc hai cận VÀ/cận tùy chọn và chi tiết log. Đây là đề xuất để thể hiện yêu cầu.
- **Phụ thuộc hoặc cụ thể hóa thiết kế:** trước làm tròn, cách kích hoạt tính lại và việc áp dụng quy tắc chung vào thứ tự hai lớp EM-001. Quy tắc RA-001 Q7 về điều kiện trung bình không lấy được giá trị đã được xác nhận trong feature chung: coi là không khớp, xét điều kiện tiếp theo, và ghi trống nếu không điều kiện nào khớp. Đây là nội dung kế thừa, không phải xác nhận riêng trong thread EM-001. Việc có quay sang hàng trung bình khác sau khi điểm cá nhân không khớp vẫn là diễn giải thiết kế cần review.
- **Phản hồi của nhóm:** triển khai chức năng này sau chức năng dùng trung bình xếp hạng; thử phân bố trên staging; gửi UI để review. Lời nhóm nói sẽ tiếp tục theo đề xuất khi chưa được trả lời không làm các đề xuất tự trở thành phê duyệt.
- Shite yêu cầu dùng chung phần đặc tả có thể dùng chung, tự kiểm nội dung trước khi gửi và trao đổi ngắn gọn, rõ ý.
- Đã đọc toàn bộ yêu cầu gốc và 8 phản hồi ngày 14/10/2026; nguồn báo không còn tin nhắn trong chuỗi. Chưa có phê duyệt thiết kế hoặc kết quả thử staging trong nguồn này.

## Ví dụ nguồn và cách đọc

Bảng minh họa trong yêu cầu gốc (điểm cá nhân dùng cho các cột kết quả):

| Trung bình nhóm | Kết quả 5 | Kết quả 4 | Kết quả 3 | Kết quả 2 | Kết quả 1 |
| --- | --- | --- | --- | --- | --- |
| 0 ≤ TB <50 | ≥80 | 65 ≤ điểm <80 | 45 ≤ điểm <65 | 25 ≤ điểm <45 | <25 |
| 50 ≤ TB <70 | ≥90 | 75 ≤ điểm <90 | 55 ≤ điểm <75 | 35 ≤ điểm <55 | <35 |
| 70 ≤ TB ≤100 | ≥95 | 85 ≤ điểm <95 | 65 ≤ điểm <85 | 45 ≤ điểm <65 | <45 |

Bảng trên giữ ví dụ gốc, không phải cấu hình bắt buộc. Ví dụ Q2 riêng của khách: 0–50 → 2, 51–70 → 4, 71–100 → 5. Cách viết khoảng số nguyên đó không xác nhận cách xử lý số thập phân giữa 50 và 51; khi cấu hình phải dùng toán tử tường minh theo Q3. Ví dụ A/B/C ở Q1 minh họa loại mục nhận, không thay yêu cầu hai bước của Pattern B.

Nguồn tham khảo được dẫn trong yêu cầu gốc: [tài liệu Pattern B/B′](https://docs.google.com/spreadsheets/d/19Xrn06a-ijqB8QYwqaeOTGZ-pecvuy4DAx-Lq2WFj2E/edit?gid=916885722#gid=916885722), [tài liệu nhóm khoảng trung bình](https://docs.google.com/spreadsheets/d/1wpnSchkIwPcHfhT6u-OZIM7c_Qu-9ixL1WH-iuv3lVY/edit?gid=772723315#gid=772723315). Khách nói tài liệu có phương án cũ, không coi mọi chi tiết là xác nhận; lần chuẩn hóa context này dựa vào thread đã đọc, không tuyên bố đã kiểm lại hai Sheet.

Bản tiếng Nhật: [confirmed-business-qa.ja.md](confirmed-business-qa.ja.md). Bản dịch cùng nội dung, không bổ sung phê duyệt nghiệp vụ.

## Xác nhận bổ sung ngày 19/10/2026 (từ thread RC-001 ④)

Nguồn: [thread Slack](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1792383099678219), người xác nhận là Shite, trả lời cho nhóm phát triển. Không phải phản hồi của khách trong thread EM-001.

- Chức năng ③ (EM-001) dùng **chỉ kết quả 順位集計 (tổng hợp thứ hạng) đã chốt (確定) và còn hiệu lực**, cùng chính sách với ① 赤点 và ②; không dùng kết quả mới nhất chưa chốt để thay thế.
- Thiếu bản chốt hợp lệ thì coi trung bình là thiếu; với chức năng quy đổi, kết quả để **trống** và không giữ giá trị cũ.
- Danh sách chọn 順位集計設定 hiển thị mọi thiết lập đã tạo, bất kể đã chốt hay chưa; trạng thái chốt chỉ ảnh hưởng việc lấy kết quả khi tính.
- Phần hiển thị ngưỡng điểm đỏ trên 成績抽出 và Excel chỉ thuộc chức năng ①, không áp dụng cho EM-001.
- Chức năng ② được tạm dừng ở mức hiện tại; thread không nói ③ dừng.
