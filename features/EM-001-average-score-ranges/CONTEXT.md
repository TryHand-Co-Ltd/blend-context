# Context EM-001 — Ánh xạ đánh giá theo khoảng điểm trung bình

Cập nhật: **14/10/2026**. Định danh feature: **EM-001**, được người phụ trách xác nhận ngày 14/10/2026. Chưa đối chiếu mã trên Sheet/Redmine.

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
- Chính sách chưa có bản chốt còn chờ Q2 của RA-001. Phương án A đang dùng: phạm vi đang chốt chỉ dùng bản chốt; nếu bản chốt thiếu nhóm cần đọc thì coi là thiếu trung bình, **không rơi về số mới nhất**. Chưa chốt hoặc đã hủy chốt thì dùng số mới nhất. Chạy tổng hợp lại không cập nhật bản chốt. Không đóng Q2 dựa trên Q1–Q4 ở đây.
- Mẫu số bằng 0 được coi là thiếu trung bình. Không thay bằng 1 hoặc dùng trung bình 0 giả. Mẫu số cùng bản nguồn gồm học sinh có điểm bị loại khỏi thứ hạng, theo [RA-001, mục 8.2–8.3](../RA-001-ranking-average/docs/specification.vi.md). Với điều kiện xét trung bình không lấy được giá trị, quy tắc chung RA-001 Q7 là coi điều kiện đó không khớp, xét điều kiện tiếp theo và ghi trống nếu không điều kiện nào khớp ([nguồn Q7](../RA-001-ranking-average/sources/2026-10-09-business-questions.vi.md#q7), [đặc tả mục 5.3](../RA-001-ranking-average/docs/specification.vi.md)). Đây là quy tắc chung được kế thừa, không phải xác nhận riêng trong thread EM-001.
- Nhóm dự kiến triển khai sau chức năng dùng trung bình xếp hạng. Trạng thái merge/deploy các PR chưa được kiểm lại trong lần tổ chức context.

## 5. Thiết kế đang đề xuất

[Nội dung giao diện bằng văn bản](docs/screen-definition.vi.md) là đầu vào chuẩn bị thiết kế. Người phụ trách sẽ vẽ mockup trên Figma sau; chưa có liên kết hoặc thiết kế Figma được duyệt. Bộ context không chứa mockup HTML/CSS. Cấu trúc hai cận nối VÀ, cận thứ hai tùy chọn, việc dùng mục đích đang cấu hình, tên phương thức mới và nội dung log là đề xuất.

**Phân biệt nguyên tắc và cách áp dụng:** Q3 EM-001 xác nhận điều kiện cá nhân xét theo thứ tự, lấy lần khớp đầu tiên và ghi trống nếu không điều kiện nào khớp. Quy tắc chung RA-001 Q7 cũng đã chốt: điều kiện trung bình không lấy được giá trị được coi là không khớp, xét điều kiện tiếp theo; nếu không điều kiện nào khớp thì ghi trống. Áp dụng nguyên tắc này cho thứ tự các hàng trung bình EM-001 là cách cụ thể hóa thiết kế, không phải xác nhận riêng của Shite trong thread EM-001. Sau khi một hàng đã được chọn, việc không quay sang hàng trung bình khác nếu điểm cá nhân không khớp vẫn là diễn giải thiết kế, chưa được thread xác nhận riêng.

## 6. Việc còn mở

| Điểm cần hoàn thiện | Loại | Ảnh hưởng và cách tiếp tục |
| --- | --- | --- |
| Chính sách bản nguồn Q2 | Nghiệp vụ chung còn mở | Theo dõi RA-001; giữ phương án A là tạm dùng, không tự chốt chỉ dùng bản chốt |
| Cách ánh xạ quy tắc chung vào hai lớp | Cụ thể hóa thiết kế | Hàng trung bình không thể xét/không khớp thì xét hàng tiếp theo theo RA-001 Q7; không còn hàng khớp thì trống. Việc có quay lại hàng trung bình sau khi điểm cá nhân không khớp hay không vẫn cần review thiết kế; không ghi thành xác nhận của Shite |
| Figma, điều khiển, tên phương thức | Thiết kế chưa thực hiện | Người phụ trách thiết kế sau; không tạo mockup hoặc coi bố cục cũ là đã duyệt |
| Mapping với giới hạn mục đích/quyền ghi | Bằng chứng kỹ thuật | Đối chiếu các đường ghi thực tế khi triển khai; không tạo ngoại lệ nghiệp vụ mới từ suy đoán |
| Phân bố hiện có đáp ứng Q4 | Bằng chứng vận hành | Thử trên staging, báo thiếu hụt nếu có; chưa có kết quả |
| Liên kết Sheet/Redmine | Metadata nguồn | Mã EM-001 đã được cung cấp; thiếu liên kết không làm Q1–Q4 thành chưa xác nhận |

Các công việc tiếp theo:

1. Bổ sung liên kết Work Item/Redmine khi có; mã EM-001 đã được người phụ trách xác nhận.
2. Review UI và chi tiết hai lớp điều kiện; giữ nguyên các nguyên tắc đã chốt.
3. Theo dõi Q2 của RA-001, kiểm tích hợp bộ đọc nguồn và mẫu số.
4. Thử màn phân bố hiện có trên staging, gồm mục số, lựa chọn và kết quả trống; chưa có kết quả thử.
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
- Không dùng `examinees` làm mẫu số hoặc fallback sang số mới nhất khi phạm vi đang chốt thiếu nhóm.

**Mức sẵn sàng:** đủ làm cơ sở đọc yêu cầu và chuẩn bị thiết kế; chưa đủ để AI tự coi toàn bộ thiết kế, tích hợp và nghiệm thu đã hoàn tất. Các ví dụ được kiểm logic không phải bằng chứng runtime.

## 9. Kết quả đối chiếu nguồn ngày 14/10/2026

Đã đọc lại yêu cầu gốc và toàn bộ 8 phản hồi của chuỗi Slack; nguồn báo hết trang. Đã đối chiếu cả 7 tài liệu Markdown trong EM-001. Không phát hiện mâu thuẫn còn lại giữa yêu cầu cốt lõi trong bộ context và nội dung Shite trả lời tại lần đọc này.

Phân loại đã làm rõ: Q1–Q4 là căn cứ nghiệp vụ; điểm cá nhân trống và cam kết staging là phần nhóm trả lời; ví dụ 1, 3, 5 do người phụ trách yêu cầu; các chi tiết UI/validation/hai lớp/log là đề xuất; mẫu số/bản chốt lấy từ nguồn chung RA-001. Kết luận này là kiểm nội dung, không phải phê duyệt thiết kế hoặc kiểm chứng ứng dụng. Khi có phản hồi mới, đọc lại nguồn và cập nhật trạng thái trước khi dùng làm đầu vào cho AI.
