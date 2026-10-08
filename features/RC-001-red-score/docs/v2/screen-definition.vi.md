# Điểm đỏ（赤点） — Đặc tả màn hình và dữ liệu

Ngày: **30/09/2026**.

Tài liệu giải thích từng màn hình có chức năng gì, người dùng thao tác trên từng thành phần như thế nào và kết quả mong đợi. Các phần được tổ chức để có thể đưa vào những tab tương ứng trong cùng một Google Sheets. Các tab 00–11 định nghĩa màn hình và nghiệp vụ; các tab 12–14 là phụ lục dữ liệu, không cần đọc để hiểu thao tác màn hình.

Nội dung mô tả thiết kế đầy đủ. Các chức năng được đưa vào từng đợt phát hành sẽ được xác định riêng; phần chưa hỗ trợ không được xuất hiện như lựa chọn đang hoạt động. Giới hạn nhập và mặc định cụ thể được ghi tại định nghĩa từng màn hình.

**Figma tham chiếu:** [Bản thiết kế tiếng Nhật của MW](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=0-1). Các link theo màn hỗ trợ đối chiếu thiết kế. Tài liệu định nghĩa hành vi của chức năng, không phải xác nhận tính năng đã được triển khai hoặc kiểm thử.

<a id="overview"></a>
## 00 — Tổng quan và cách đọc

### Mục đích và người sử dụng

Cho phép thiết lập một hoặc nhiều quy tắc cho mục điểm số, xét điểm cuối đã lưu của từng học sinh và dùng chung kết quả tại trích xuất thành tích, công khai thành tích và phiếu điểm. Kết quả điểm đỏ không thay đổi điểm số hoặc tự quyết định đạt môn/lên lớp.

| Người sử dụng | Có thể làm gì | Giới hạn |
| --- | --- | --- |
| Người có quyền thiết lập mục đánh giá | Thêm, sửa, sắp xếp và xóa quy tắc điểm đỏ | Phải có cả quyền truy cập chức năng và quyền sửa đúng mục; giáo viên thường cũng được dùng khi đủ quyền |
| Người đăng ký điểm | Nhập/sửa/xóa điểm; các ô liên quan được xét theo luồng đăng ký | Theo lớp, môn, học sinh, thời điểm và đơn vị được phép |
| Người được chạy tính toán hàng loạt | Tổng hợp nguồn và chạy tính toán trong phạm vi được cấp | Quyền sửa quy tắc không tự cấp quyền chạy toàn khối/trường |
| Người sử dụng trích xuất, công khai hoặc phiếu điểm | Cấu hình cách trình bày và sử dụng kết quả | Giữ quyền riêng và quy trình lưu/xuất hiện có của từng chức năng |
| Học sinh/phụ huynh | Xem điểm được công khai | Chỉ đúng học sinh, năm học, lịch công khai và phạm vi hiển thị được phép; không sửa quy tắc |

**Đối tượng:** mục nhập số nguyên, số thập phân và điểm số theo đơn vị bài học. Mục lựa chọn A/B/C hoặc đạt/không đạt không được xét đỏ trực tiếp; bộ lọc theo lựa chọn vẫn có thể dùng để giới hạn đối tượng của một mục điểm số.

### Danh sách các tab dự kiến

| Tab | Nội dung | Người đọc chính |
| --- | --- | --- |
| [00 — Tổng quan](#overview) | Mục tiêu, quyền, luồng và cách đọc | Tất cả |
| [01 — Điểm vào thiết lập](#screen-entry) | Mở thiết lập đỏ từ mục điểm số | Người thiết lập |
| [02 — Danh sách quy tắc](#screen-rules) | Thêm, sửa, ưu tiên, lưu dở và xóa | Người thiết lập |
| [03 — Điều kiện áp dụng](#screen-conditions) | Đối tượng, AND/OR, điều kiện tổng hợp và nguồn | Người thiết lập |
| [04 — Ngưỡng và công thức](#screen-threshold) | Cố định, tỷ lệ, phép tính và phần lẻ | Người thiết lập |
| [05 — Thiết lập tổng hợp](#screen-ranking) | Chuẩn bị cách tổng hợp và nhóm tham chiếu | Người quản lý tổng hợp |
| [06 — Thực hiện và kết quả](#screen-execution) | Tổng hợp, chạy tính toán, thời điểm cập nhật và lỗi | Người vận hành |
| [07 — Trích xuất và Excel](#screen-extraction) | Lọc, ký hiệu, màu ô và xuất file | Người trích xuất |
| [08 — Thiết lập công khai](#screen-publication) | Hiệu ứng riêng theo cấu hình và loại điểm | Người thiết lập công khai |
| [09 — Xem điểm công khai](#screen-student) | Kết quả học sinh/phụ huynh nhìn thấy | Người phụ trách nghiệp vụ |
| [10 — Phiếu điểm và PDF](#screen-report) | Tùy chọn ô, ưu tiên hiển thị, lưu mẫu và PDF | Người thiết kế/xuất phiếu |
| [11 — Quy tắc và ví dụ chung](#shared-rules) | Trạng thái, thời điểm, tình huống biên và sao chép | Người phụ trách nghiệp vụ, QA |
| [12 — Tổng quan dữ liệu](#db-overview) | Quan hệ lưu trữ và các bảng hiện hữu được bổ sung | Người phụ trách kỹ thuật |
| [13 — Dữ liệu quy tắc](#db-settings) | Các trường của quy tắc và nguồn/công thức | Người phụ trách kỹ thuật |
| [14 — Dữ liệu kết quả](#db-results) | Các trường kết quả và ý nghĩa trạng thái | Người phụ trách kỹ thuật |

Số tab trong tài liệu khác số cụm trên Figma. Mỗi màn bên dưới có link tới cụm tương ứng; các hình A/B/C có thể là trạng thái của cùng màn, không phải các bước liên tiếp.

### Luồng sử dụng

1. Chọn mục điểm số và mở danh sách quy tắc.
2. Thêm quy tắc; nhập điều kiện áp dụng và ngưỡng/công thức. Quy tắc đủ dữ liệu mới được tham gia xét.
3. Điều chỉnh ưu tiên bằng nút lên/xuống; mỗi lần bấm được lưu ngay khi xử lý thành công. Lưu thiết lập chưa cập nhật kết quả điểm đỏ của học sinh.
4. Đăng ký điểm hoặc chạy tính toán. Nếu dùng trung bình/tỷ lệ nhóm, chuẩn bị đủ điểm nguồn, hoàn tất tổng hợp rồi chạy tính toán.
5. Trích xuất, công khai hoặc in phiếu từ cùng kết quả đã hoàn tất; mỗi đầu ra có cách trình bày riêng.

### Quy ước bảng thành phần

- **Bắt buộc** là yêu cầu khi lưu phần đang nhập. “Có điều kiện” được giải thích tại dòng tương ứng; “—” dùng cho nút, nhãn và nội dung chỉ đọc.
- **Điều kiện hiển thị** luôn nằm trong phạm vi quyền của màn. Không thể có thêm quyền bằng cách sửa địa chỉ hoặc mã dữ liệu gửi lên.
- **Thao tác và kết quả** mô tả hành vi cần có khi triển khai, không phải báo cáo ứng dụng đã chạy đúng.
- Số thứ tự là số thành phần trong bảng, không phải mã công việc. Tên thao tác bằng tiếng Việt mô tả chức năng; nhãn Nhật được giữ khi đã có trong nguồn thiết kế.
- Các hình A/B/C trong cùng màn là trạng thái minh họa, không mặc định là các bước hoặc màn độc lập.
- Giá trị mẫu và tên nhóm trong ví dụ chỉ để giải thích, không tự trở thành giá trị mặc định.

<a id="screen-entry"></a>
## 01 — Điểm vào thiết lập

**Màn hình:** Thiết lập nhập điểm（成績入力設定） → Thiết lập ô nhập（入力欄設定）.  
**Mục đích:** chọn đúng mục điểm số trước khi thiết lập quy tắc.  
**Figma:** [Cụm 01 — Điểm vào và danh sách](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-9443).

| STT | Thành phần | Loại | Bắt buộc/tùy chọn | Giới hạn/kiểm tra | Điều kiện hiển thị | Thao tác và kết quả | Chuyển đến | Ghi chú |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | Mục đánh giá đang chọn | Nhãn/ngữ cảnh hiện có | — | Đúng trường, năm, khung, kỳ/thời điểm và mục | Khi mở thiết lập ô nhập | Hiển thị tên và loại điểm để người dùng biết đang cấu hình cho mục nào | — | Hai mục cùng tên vẫn là hai mục riêng |
| 2 | Thiết lập điểm đỏ（赤点設定） | Nút/liên kết | — | Kiểm quyền xem/sửa mục ở màn hình và khi nhận thao tác | Mục số nguyên, số thập phân hoặc điểm số theo đơn vị; người dùng có quyền tương ứng | Mở danh sách quy tắc của đúng mục | [02 — Danh sách](#screen-rules) | Không mở chức năng xét trực tiếp cho A/B/C hoặc đạt/không đạt |
| 3 | Thông tin điểm thường/đơn vị | Nhãn theo ngữ cảnh | — | Giữ đúng loại điểm và đơn vị nếu có | Theo mục đang thiết lập | Làm rõ phạm vi cấu hình; khi xét phải phân biệt từng ô đơn vị | — | Không dùng cùng kết quả cho hai đơn vị khác nhau |

**Khi chưa có quy tắc:** mở danh sách trống và cho phép thêm. Không tự tạo từ ngưỡng đỏ cũ hoặc đặt sẵn quy tắc “dưới 30”.

<a id="screen-rules"></a>
## 02 — Danh sách quy tắc điểm đỏ

**Màn hình:** Thiết lập điểm đỏ（赤点設定）.  
**Mục đích:** xem các quy tắc của một mục, đặt ưu tiên và mở hai phần chỉnh sửa.  
**Figma:** [Cụm 01 — Danh sách và xóa](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-9443) · [Dòng chỉ mới lưu điều kiện](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-10163).

| STT | Thành phần | Loại | Bắt buộc/tùy chọn | Giới hạn/kiểm tra | Điều kiện hiển thị | Thao tác và kết quả | Chuyển đến | Ghi chú |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | Mục, kiểu điểm và thời điểm | Nhãn | — | Đúng mục được mở từ màn trước | Luôn hiển thị | Xác định phạm vi của toàn danh sách | — | Không thay bằng tên quy tắc |
| 2 | Chưa thiết lập | Trạng thái trống | — | Không có dòng chưa xóa | Khi chưa thêm hoặc đã xóa hết quy tắc | Giải thích chưa có quy tắc; giữ thao tác thêm | — | Xóa hết quy tắc chưa làm mất kết quả học sinh trước lần xét lại |
| 3 | Thêm quy tắc | Nút | — | Có quyền sửa mục | Khi được sửa danh sách | Bắt đầu quy tắc mới ở cuối thứ tự; ngưỡng chưa nhập | [03 — Điều kiện](#screen-conditions), sau đó [04 — Ngưỡng](#screen-threshold) | Mặc định thiết kế: loại cố định, dấu nhỏ hơn; không điền ngầm 0 |
| 4 | Tên thiết lập（設定名称） | Nội dung của dòng | — | Tên lấy từ cấu hình đã lưu | Dòng chưa xóa | Giúp phân biệt các quy tắc | — | Đổi tên không đổi liên kết; cho phép trùng tên |
| 5 | Ưu tiên（優先順位） | Nút lên/xuống theo phương án kế thừa màn tính tự động | — | Mỗi lần chuyển một vị trí; dòng đầu không lên, dòng cuối không xuống | Có nhiều quy tắc và được phép sửa | Bấm nút để chuyển dòng và gửi lưu ngay; không có bước bấm Lưu riêng cho thứ tự | Tại màn này | Chỉ coi đã đổi sau lưu thành công; thứ tự mới ảnh hưởng ở lần xét tiếp theo |
| 6 | Tóm tắt điều kiện | Nội dung/liên kết sửa | — | Phản ánh điều kiện đã lưu | Mỗi dòng | Xem đối tượng, bộ lọc và điều kiện tổng hợp; mở sửa điều kiện | [03 — Điều kiện](#screen-conditions) | Nguồn của điều kiện phải phân biệt với nguồn công thức |
| 7 | Tóm tắt ngưỡng/công thức | Nội dung/liên kết sửa | — | Loại, dấu, giá trị và phần lẻ khớp cấu hình đã lưu | Mỗi dòng | Mở Thiết lập ngưỡng（基準設定） để nhập/sửa | [04 — Ngưỡng](#screen-threshold) | Tên nhóm dài không chồng cột phép toán; không dùng dữ liệu chưa lưu để tóm tắt |
| 8 | Chưa hoàn chỉnh（未完成） | Trạng thái dòng | — | Chưa đủ điều kiện hoặc ngưỡng hợp lệ | Quy tắc lưu dở, chưa xóa | Giữ dòng để tiếp tục chỉnh sửa; không tham gia xét/ưu tiên | — | Không phải quy tắc “ngưỡng 0” |
| 9 | Mở thiết lập ngưỡng（基準設定を開く） | Nút/liên kết | — | Kiểm dòng còn tồn tại và chưa xóa | Dòng cần hoàn tất ngưỡng | Mở phần ngưỡng với nội dung đã lưu | [04 — Ngưỡng](#screen-threshold) | Tải lại danh sách vẫn sửa tiếp được |
| 10 | Xóa quy tắc | Nút và hộp xác nhận | — | Kiểm quyền và trạng thái dòng tại lúc lưu | Dòng chưa xóa, kể cả lưu dở | Hiện xác nhận; đồng ý và lưu thành công thì bỏ dòng khỏi danh sách và các lần xét tiếp theo | Tại màn này | Kết quả học sinh đã hoàn tất vẫn giữ đến lần xét lại |
| 11 | Hủy xóa | Nút trong hộp xác nhận | — | Không ghi thay đổi | Khi hộp xác nhận mở | Đóng hộp; giữ quy tắc và kết quả | Danh sách | Không tự xóa khi đóng hộp |
| 12 | Hướng dẫn sau lưu/sắp xếp/xóa | Thông báo | — | Chỉ báo thành công sau khi lưu thực sự thành công | Sau thao tác có thay đổi được lưu | Phân biệt “đã lưu thiết lập” với “đã cập nhật kết quả”; hướng dẫn đăng ký điểm hoặc chạy tính toán lại | [06 — Thực hiện](#screen-execution) | Lưu lỗi giữ dữ liệu đã lưu trước đó; không báo xét thành công |
| 13 | Quay lại | Nút/liên kết | — | Chờ yêu cầu lưu thứ tự đang gửi kết thúc trước khi rời màn | Theo điều hướng màn | Quay về mục đang cấu hình; giữ các thay đổi đã lưu thành công | [01 — Điểm vào](#screen-entry) | Quay lại không hoàn tác thứ tự đã lưu; hủy input trong màn điều kiện/ngưỡng theo nút riêng của màn đó |

**Ví dụ ưu tiên:** hai quy tắc đều khớp, quy tắc trên dùng `<20`, quy tắc dưới dùng `<30`. Điểm 25 không đỏ vì sử dụng quy tắc trên. Quy tắc lưu dở không chặn quy tắc hoàn chỉnh phía dưới.

**Lưu thứ tự — phương án thiết kế kế thừa thao tác tính tự động hiện có:** bấm lên/xuống một lần thì gửi lưu một lần; trong lúc chờ, không nhận thêm thao tác sắp xếp hoặc rời màn. Lưu thành công thì hiển thị thứ tự mới và thông báo đã lưu thiết lập; mở lại hoặc tải lại vẫn giữ thứ tự đó. Nếu hệ thống xác nhận lưu thất bại thì giữ thứ tự đã lưu trước, báo lỗi và cho thử lại. Nếu mất kết nối nên chưa biết đã lưu hay chưa, thông báo chưa xác nhận kết quả và đọc lại danh sách trước khi cho thao tác tiếp; không báo thành công hoặc khẳng định đã hoàn tác. Không chạy xét học sinh chỉ vì đổi thứ tự.

**Xóa an toàn:** tải lại không hiện quy tắc đã xóa; một form mở từ trước khi xóa không được lưu để làm quy tắc đó xuất hiện lại. Không bổ sung nút khôi phục hoặc bật/tắt quy tắc chỉ vì dữ liệu có trạng thái chưa hiệu lực.

<a id="screen-conditions"></a>
## 03 — Điều kiện áp dụng và nguồn tham chiếu

**Màn hình:** Điều kiện áp dụng（適用条件）.  
**Mục đích:** xác định học sinh/ô điểm nào được áp dụng một quy tắc.  
**Figma:** [Cụm 02 — Điều kiện và nguồn](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-8717) · [Hướng dẫn AND/OR và ưu tiên](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=166-4) · [Giải thích nhóm tham chiếu](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-8729). Hai hình 02-A/02-B là trạng thái của cùng màn.

| STT | Thành phần | Loại | Bắt buộc/tùy chọn | Giới hạn/kiểm tra | Điều kiện hiển thị | Thao tác và kết quả | Chuyển đến | Ghi chú |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | Mục đang cấu hình | Nhãn | — | Đúng mục và kỳ/thời điểm | Luôn hiển thị | Giữ ngữ cảnh quy tắc | — | Không đổi mục thông qua tên hiển thị |
| 2 | Tên thiết lập（設定名称） | Ô văn bản | Bắt buộc | 1–255 ký tự sau bỏ khoảng trắng đầu/cuối | Luôn hiển thị | Nhập tên để nhận biết trong danh sách | — | Không yêu cầu duy nhất; nội dung được hiển thị như văn bản |
| 3 | Toàn bộ hoặc giới hạn đối tượng | Lựa chọn phạm vi bộ lọc thông thường | Bắt buộc | “Toàn bộ” chỉ bỏ lọc đối tượng thông thường, vẫn trong phạm vi mục và quyền | Luôn hiển thị | Chọn toàn bộ đối tượng hoặc giới hạn bằng các loại trong bảng dưới | Tại màn này | Điều kiện trung bình/tỷ lệ nhóm được cấu hình riêng và không tự bị xóa khi chọn toàn bộ |
| 4 | Loại bộ lọc đối tượng | Bộ chọn | Có điều kiện | Bảy loại tách biệt theo bảng bên dưới; chỉ cung cấp loại được hỗ trợ trong đợt triển khai | Khi giới hạn đối tượng | Thêm bộ lọc theo đúng loại; lớp chủ nhiệm và lớp học phần là hai loại khác nhau | Tại màn này | Không bổ sung trình soạn AND/OR lồng nhau |
| 5 | Giá trị bộ lọc | Bộ chọn một hoặc nhiều giá trị | Bắt buộc cho bộ lọc đã thêm | Ít nhất một giá trị tồn tại, đúng phạm vi và còn khả dụng; đủ trường phụ thuộc của loại | Sau khi chọn loại lọc | Chọn các giá trị áp dụng theo bảng dưới | Tại màn này | Cùng loại dùng OR, kể cả nhiều dòng; giữa các loại dùng AND |
| 6 | Thêm/xóa bộ lọc | Nút | — | Nếu chọn giới hạn mà không còn bộ lọc hợp lệ thì không cho lưu như “toàn bộ” | Khi sửa phạm vi | Thêm hoặc bỏ đúng dòng lọc | Tại màn này | Không bỏ điều kiện còn lại như tác dụng phụ |
| 7 | Loại điều kiện tổng hợp | Bộ chọn | Tùy chọn; bắt buộc khi thêm dòng | Trung bình điểm（平均点） hoặc Tỷ lệ điểm của nhóm（集団の得点率） | Khi sử dụng điều kiện tổng hợp | Chọn đại lượng để quyết định quy tắc có áp dụng | Tại màn này | Các dòng này AND với nhau, kể cả cùng loại |
| 8 | Dấu so sánh của điều kiện | Bộ chọn | Bắt buộc cho dòng tổng hợp | `<`, `≤`, `≥`, `>` | Khi thêm điều kiện tổng hợp | So sánh giá trị nguồn với mốc nhập | Tại màn này | Khác dấu xét đỏ cuối, vốn chỉ có `<` hoặc `≤` |
| 9 | Mốc so sánh | Ô số | Bắt buộc cho dòng tổng hợp | Số hữu hạn; tối đa 9 chữ số nguyên và 8 chữ số lẻ; mốc tỷ lệ nhóm trong 0–100 | Khi thêm điều kiện tổng hợp | Nhập điểm hoặc tỷ lệ theo đại lượng đã chọn | — | Ví dụ tỷ lệ 65 biểu thị 65%; không dùng số hiển thị đã làm tròn để so |
| 10 | Thời kỳ tổng hợp（集計対象時期） | Bộ chọn kỳ/thời điểm | Bắt buộc khi điều kiện cần nguồn | Thời kỳ hợp lệ trong trường/năm | Khi sử dụng trung bình/tỷ lệ nhóm | Chỉ định thời kỳ của dữ liệu tham chiếu | — | Kỳ nguồn được chọn riêng; môn/mục/đơn vị phải khớp ngữ cảnh |
| 11 | Thiết lập tổng hợp thứ hạng（順位集計設定） | Bộ chọn | Bắt buộc khi cần nguồn | Cấu hình thuộc trường/năm và quyền hiện hành | Khi sử dụng trung bình/tỷ lệ nhóm | Chọn bộ tổng hợp trước khi chọn đối tượng tổng hợp | — | Thay nguồn cấp trên phải bỏ lựa chọn con không còn hợp lệ |
| 12 | Đối tượng tổng hợp（集計対象） | Bộ chọn | Bắt buộc khi cần nguồn | Theo bảng khả dụng bên dưới; hiển thị tên, lưu đúng định danh | Sau khi xác định cấu hình tổng hợp | Chọn nhóm dùng làm nguồn cho điều kiện này | — | Không đồng nhất nhóm tham chiếu với danh sách học sinh được áp dụng |
| 13 | Thêm/xóa dòng điều kiện tổng hợp | Nút | — | Mỗi dòng còn lại phải đủ trường hợp lệ | Khi sửa điều kiện | Thay số điều kiện cần đồng thời thỏa | Tại màn này | Không tự biến AND thành OR khi có nhiều dòng cùng loại |
| 14 | Giải thích AND/OR | Nội dung hướng dẫn | — | Nêu rõ hai loại kết hợp | Tại khu vực điều kiện | Giúp hiểu bộ lọc và điều kiện tổng hợp trong một quy tắc | — | Nhiều quy tắc vẫn dùng ưu tiên, không AND với nhau |
| 15 | Lưu điều kiện | Nút | — | Kiểm tên, quyền, đối tượng, số, nguồn và tham chiếu; đổi phạm vi phải kiểm lại ngưỡng cố định đã lưu với điểm tối đa của mọi đối tượng mới | Khi được sửa | Lưu điều kiện. Nếu ngưỡng chưa nhập（chưa hoàn chỉnh / đang thêm quy tắc mới） thì chuyển sang màn Ngưỡng（基準設定）. Nếu quy tắc đã hoàn chỉnh và đang sửa từ danh sách thì quay về danh sách. Phạm vi mới làm ngưỡng không hợp lệ thì từ chối và giữ cấu hình trước | [04 — Ngưỡng](#screen-threshold)（khi chưa có ngưỡng）／[02 — Danh sách](#screen-rules)（khi sửa quy tắc đã hoàn chỉnh từ danh sách） | Chưa có ngưỡng thì giữ lưu dở; không điền ngầm ngưỡng, không xét lại học sinh. Xác nhận 2026-10-07: chỉ mới lưu điều kiện thì tiếp tục sang nhập ngưỡng |
| 16 | Hủy/quay lại | Nút/liên kết | — | Không ghi các thay đổi chưa lưu | Khi sửa | Trở về danh sách với cấu hình đã lưu gần nhất | [02 — Danh sách](#screen-rules) | Lỗi lưu phải chỉ rõ nội dung cần sửa; không làm mất bản cũ |

### Các loại bộ lọc đối tượng

“Chọn nhiều” có nghĩa các giá trị của cùng loại được kết hợp OR, kể cả khi thêm thành nhiều dòng. Các loại khác nhau trong bảng kết hợp AND. Danh sách chỉ chứa dữ liệu hợp lệ thuộc trường/năm và phạm vi được phép.

| Loại bộ lọc | Giá trị được chọn | Số lựa chọn | Trường phụ thuộc và cách hiểu |
| --- | --- | --- | --- |
| Giáo khoa | Giáo khoa có trong cấu hình của trường | Một hoặc nhiều | Khác loại với môn học; chọn cả giáo khoa và môn thì phải thỏa cả hai |
| Môn học | Môn học có trong phạm vi cấu hình | Một hoặc nhiều | Không dùng tên môn để gộp các môn khác nhau |
| Khối | Khối của học sinh trong năm học | Một hoặc nhiều | Ví dụ khối 1 hoặc khối 2 |
| Lớp chủ nhiệm | Lớp chủ nhiệm của học sinh | Một hoặc nhiều | Khác loại với lớp học phần; không gộp hai loại thành “lớp/nhóm” |
| Lớp học phần | Lớp học phần của ô điểm được xét | Một hoặc nhiều | Ví dụ chọn lớp chủ nhiệm 1A và lớp học phần Toán B thì học sinh phải thỏa cả hai |
| Nhóm tổng hợp | Nhóm thành viên thuộc cấu hình nhóm đã chọn | Một hoặc nhiều | Chọn một cấu hình nhóm cho mỗi dòng rồi chọn nhóm thuộc cấu hình đó; nhiều dòng cùng loại vẫn OR. Đây là lọc đối tượng, không tự thay nhóm nguồn trung bình |
| Giá trị của mục lựa chọn | Các giá trị được định nghĩa trong một mục lựa chọn | Một hoặc nhiều | Chọn một mục lựa chọn cho mỗi dòng rồi chọn giá trị của mục đó; giữ đúng cặp mục–giá trị. Các dòng loại này vẫn OR, không tự chuyển thành AND khi chọn mục khác |

Đổi cấu hình nhóm hoặc mục lựa chọn phải bỏ các giá trị con không còn hợp lệ và yêu cầu chọn lại trước khi lưu; không tự giữ giá trị trùng tên của cấu hình khác.

**Chỉ dùng điều kiện trung bình/tỷ lệ nhóm:** chọn toàn bộ ở phần đối tượng thông thường, không thêm bộ lọc, rồi nhập các dòng điều kiện tổng hợp và bộ nguồn của chúng. Ví dụ chỉ nhập `A≥50` và `A<70` thì quy tắc áp dụng khi `50≤A<70` trong phạm vi mục, không cần thêm một lớp hoặc khối giả. Chọn toàn bộ không bỏ qua các dòng tổng hợp này. Chỉ khi không có cả bộ lọc thông thường lẫn điều kiện tổng hợp mới áp dụng vô điều kiện trong phạm vi mục. Nếu đã chọn giới hạn bằng bộ lọc thông thường nhưng để rỗng thì báo lỗi; người dùng phải nhập bộ lọc hoặc chủ động chuyển phần đó về toàn bộ.

### Các lựa chọn nguồn khả dụng

| Loại nhóm | Khi nào được chọn? | Kết quả đọc |
| --- | --- | --- |
| Khối（学年） | Bật tổng hợp theo khối trong thiết lập hiện hữu | Kết quả theo khối tương ứng của cấu hình đã chọn |
| Lớp chủ nhiệm（ホームルーム） | Bật tổng hợp theo lớp chủ nhiệm | Kết quả đúng lớp chủ nhiệm tương ứng |
| Lớp học（授業） | Bật tổng hợp theo lớp học | Kết quả đúng lớp học phần của ô đang xét; không lấy một lớp khác cùng môn |
| Nhóm tổng hợp thứ hạng（順位集計グループ） | Có nhóm cấu hình phù hợp | Kết quả của nhóm đã chọn bằng tên và lưu bằng ID |
| Tổ hợp nhóm（組み合わせグループ） | Có tổ hợp cấu hình phù hợp | Kết quả của tổ hợp đã chọn |
| Nhóm môn học（科目グループ） | Có cấu hình nhóm môn phù hợp | Nhóm thực tế được phân giải theo cấu hình riêng của môn hoặc cấu hình mặc định đã lưu |

Ba loại nhóm cấu hình cuối độc lập với ba công tắc khối/lớp chủ nhiệm/lớp học. Không luôn hiển thị đủ sáu loại khi chưa có cấu hình, không thêm công tắc tổng hợp riêng phía điểm đỏ. Nhóm chọn được chưa có nghĩa đã có kết quả tổng hợp hợp lệ. Khi nhóm/default mất hiệu lực, không tự chọn nhóm cùng tên hoặc nguồn thay thế.

### Cách hiểu bằng ví dụ

| Thiết lập | Cách hiểu |
| --- | --- |
| Chọn khối 1 và khối 2, đồng thời chọn nhóm nâng cao | Thuộc khối 1 **hoặc** khối 2, **và** thuộc nhóm nâng cao |
| Cùng nguồn: trung bình ≥50 và trung bình <70 | `50≤A<70`; 40 và 70 không thỏa, 50 và 60 thỏa |
| Áp dụng cho lớp A, tham chiếu trung bình nhóm A+B | Đối tượng được xét là lớp A; nguồn trung bình vẫn là A+B |
| Ngưỡng cố định 30, nhưng điều kiện là trung bình ≥60 | Vẫn cần nguồn trung bình để biết quy tắc có áp dụng; thiếu nguồn không được bỏ điều kiện rồi áp 30 cho tất cả |

Nguồn của điều kiện và nguồn của công thức được lưu độc lập. Sửa nguồn tại màn này không tự đổi nguồn ở màn ngưỡng. Cách chọn bản chốt và xử lý thiếu nguồn xem [quy tắc chung](#source-policy).

<a id="screen-threshold"></a>
## 04 — Thiết lập ngưỡng và công thức

**Màn hình:** Thiết lập ngưỡng（基準設定）.  
**Mục đích:** xác định ngưỡng và dấu so sánh dùng cho quy tắc đã chọn.  
**Figma:** [Cụm 03 — Cố định, tỷ lệ và công thức](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-7480) · [Giải thích ví dụ phần lẻ](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-7504). Các hình 03-A/B/C là ba trạng thái theo loại ngưỡng.

### Thành phần chung, điểm cố định và tỷ lệ

| STT | Thành phần | Loại | Bắt buộc/tùy chọn | Giới hạn/kiểm tra | Điều kiện hiển thị | Thao tác và kết quả | Chuyển đến | Ghi chú |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | Mục và tên quy tắc | Nhãn | — | Đúng quy tắc được mở | Luôn hiển thị | Giữ ngữ cảnh chỉnh sửa | — | Không ghi ngưỡng sang quy tắc khác |
| 2 | Loại ngưỡng | Bộ chọn | Bắt buộc | Điểm cố định（固定点数）, Tỷ lệ điểm tối đa（得点率）, Công thức（計算式） theo phạm vi hỗ trợ | Luôn hiển thị | Đổi vùng nhập theo loại; chỉ loại đang chọn có hiệu lực | Tại màn này | Mặc định thiết kế khi tạo mới: cố định, chưa có giá trị |
| 3 | Dấu xét đỏ | Bộ chọn | Bắt buộc | Nhỏ hơn（未満） hoặc Nhỏ hơn hoặc bằng（以下） | Mọi loại ngưỡng | Quy định đỏ khi `S<T` hoặc `S≤T` | — | Mặc định thiết kế: nhỏ hơn; không làm tròn điểm học sinh |
| 4 | Ngưỡng cố định | Ô số | Bắt buộc với loại cố định | `0≤N≤M` của mọi đối tượng áp dụng; tối đa 3 chữ số lẻ, trong miền lưu trữ | Khi chọn cố định | Dùng trực tiếp `T=N` | — | Để trống là chưa nhập, không phải 0; không cần nguồn trung bình ở phần ngưỡng |
| 5 | Tỷ lệ theo điểm tối đa | Ô số kèm % | Bắt buộc với loại tỷ lệ | 0–100 kể cả hai biên, tối đa 3 chữ số lẻ | Khi chọn tỷ lệ | Tính `T=M hiện hành×N/100`, rồi xử lý phần lẻ nếu bật | — | Không lấy maximum của bản chốt hoặc mặc định 100 |
| 6 | Xử lý phần lẻ（端数処理） của tỷ lệ | Bộ chọn bật/tắt | Bắt buộc với loại tỷ lệ | Không xử lý（しない） / Có xử lý（する） | Khi chọn tỷ lệ | Quy định có làm tròn ngưỡng tính được hay không | Tại màn này | Mặc định không xử lý |
| 7 | Vị trí chữ số của tỷ lệ | Ô số/bộ chọn | Bắt buộc khi bật xử lý | Số nguyên `p=1..9`; lần đầu bật là 1 | Khi bật xử lý phần lẻ của tỷ lệ | Kết quả giữ `p−1` chữ số thập phân | — | p=1 còn số nguyên; không phải giữ một chữ số lẻ |
| 8 | Phương thức làm tròn của tỷ lệ | Bộ chọn | Bắt buộc khi bật xử lý | Gần nhất, lên hoặc xuống | Khi bật xử lý phần lẻ của tỷ lệ | Áp dụng sau phép nhân tỷ lệ | — | Không tự chọn thay khi đang thiếu phương thức |
| 9 | Cảnh báo ngưỡng biên | Nội dung cảnh báo | — | Dựa trên ngưỡng cuối, dấu xét và miền điểm khi đủ dữ liệu | Khi cấu hình khiến ngưỡng bằng 0 hoặc maximum | Giải thích đối tượng sẽ bị xét đỏ | — | Không tự thay giá trị; `A−0` cho ngưỡng A, không phải 0 |
| 10 | Lưu ngưỡng | Nút | — | Đủ loại, dấu, giá trị/công thức, quyền và tham chiếu hợp lệ | Khi được sửa | Lưu loại đang chọn; khi cả điều kiện và ngưỡng đầy đủ, quy tắc được tham gia lần xét tiếp theo | [02 — Danh sách](#screen-rules) | Không chạy xét ngay; lỗi giữ cấu hình đã lưu |
| 11 | Hủy/quay lại | Nút/liên kết | — | Không lưu phần đang nhập | Khi sửa | Trở về cấu hình đã lưu gần nhất | [02 — Danh sách](#screen-rules) | Không hứa lưu lại mọi loại ngưỡng từng nhập nhưng đã bỏ |

**Ngưỡng cố định khi phạm vi có maximum khác nhau:** ngưỡng 30 không được lưu cho phạm vi chứa đối tượng maximum 20. Cần giảm ngưỡng hoặc thu hẹp/tách phạm vi; không tự đổi 30 thành 20. Nếu maximum đổi sau khi ngưỡng đã lưu hợp lệ, lần xét cố định vẫn dùng N đã lưu; không tự đổi ngưỡng theo maximum mới.

### Thành phần của công thức

| STT | Thành phần | Loại | Bắt buộc/tùy chọn | Giới hạn/kiểm tra | Điều kiện hiển thị | Thao tác và kết quả | Chuyển đến | Ghi chú |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 12 | Nguồn trung bình của công thức | Nhóm bộ chọn | Có điều kiện | Bắt buộc khi có toán hạng trung bình; đúng thời kỳ, cấu hình và nhóm | Khi công thức dùng trung bình | Chọn thời kỳ, sau đó cấu hình tổng hợp → đối tượng tổng hợp | Tại màn này | Quy tắc khả dụng như [màn điều kiện](#screen-conditions); nguồn riêng của công thức |
| 13 | Danh sách dòng tính | Bảng | Bắt buộc | Ít nhất 1, tối đa 20 dòng hoàn chỉnh theo thiết kế | Khi chọn công thức | Tính lần lượt; kết quả dòng cuối là ngưỡng T | — | Không nhập biểu thức tự do, script hoặc hàm tùy ý |
| 14 | Vế trái（左辺） | Bộ chọn loại và giá trị | Bắt buộc mỗi dòng | Trung bình, số cố định hoặc kết quả dòng trước | Mỗi dòng công thức | Xác định toán hạng trái | — | Dòng đầu không được tham chiếu kết quả dòng trước |
| 15 | Phép toán（演算子） | Bộ chọn | Bắt buộc mỗi dòng | Cộng, trừ, nhân, chia | Mỗi dòng công thức | Thực hiện phép tính giữa hai toán hạng | — | Kết quả dùng làm ngưỡng, không ghi vào điểm học sinh |
| 16 | Vế phải（右辺） | Bộ chọn loại và giá trị | Bắt buộc mỗi dòng | Cùng tập toán hạng; không lưu phép chia có mẫu số cố định bằng 0 | Mỗi dòng công thức | Xác định toán hạng phải | — | Nếu mẫu số thành 0 khi chạy thì chưa xét được |
| 17 | Số cố định（固定値）/hệ số | Ô số | Bắt buộc khi chọn loại này | Số hữu hạn, tối đa 9 chữ số nguyên và 8 chữ số lẻ | Toán hạng là số | Nhập ví dụ 20, 0.5 hoặc −5 | — | Không áp giới hạn 0–100 của ô phần trăm lên mọi hệ số |
| 18 | Kết quả phép tính（式の結果） | Bộ chọn dòng | Bắt buộc khi chọn loại này | Chỉ dòng phía trước còn tồn tại; không tự tham chiếu hoặc trỏ dòng phía sau | Từ dòng thứ hai | Dùng kết quả sau xử lý phần lẻ của dòng được chọn | — | Đổi số thứ tự không được âm thầm làm tham chiếu trỏ sang dòng khác |
| 19 | Thêm dòng | Nút | — | Không vượt 20 dòng theo thiết kế | Khi sửa công thức | Thêm phép tính tiếp theo | Tại màn này | Dòng mới phải đủ dữ liệu trước khi lưu |
| 20 | Xóa dòng | Nút | — | Phải còn ít nhất một dòng hợp lệ; kiểm mọi tham chiếu bị ảnh hưởng | Mỗi dòng khi được sửa | Bỏ dòng và yêu cầu sửa tham chiếu không hợp lệ trước khi lưu | Tại màn này | Không tự thay bằng dòng có cùng số thứ tự |
| 21 | Xử lý phần lẻ từng dòng | Bộ chọn bật/tắt | Bắt buộc mỗi dòng | Không xử lý hoặc có xử lý | Mỗi dòng | Xử lý kết quả ngay tại dòng đó | Tại màn này | Mặc định không xử lý; không gộp thành chỉ làm tròn cuối |
| 22 | Chữ số thập phân thứ p（小数第［p］位） | Ô số/bộ chọn | Bắt buộc khi bật | Số nguyên 1–9; khi bật lần đầu là 1 | Dòng có xử lý phần lẻ | Xác định vị trí chữ số cần xử lý | — | Chú thích Vị trí 1 cho kết quả số nguyên（位置1は整数） |
| 23 | Phương thức phần lẻ từng dòng | Bộ chọn | Bắt buộc khi bật | Gần nhất（四捨五入）, Lên（切り上げ）, Xuống（切り捨て） | Dòng có xử lý phần lẻ | Tạo kết quả dòng dùng cho dòng sau | — | Cách xử lý số âm được giải thích ngay bên dưới |
| 24 | Lỗi công thức/nguồn | Thông báo | — | Chỉ rõ trường hoặc tham chiếu cần sửa | Khi lưu không hợp lệ | Ngăn lưu cấu hình có lỗi; giữ cấu hình trước | Tại màn này | Không lộ lỗi kỹ thuật nội bộ; lỗi lúc chạy được xử lý tại quy tắc trạng thái |

Trong cùng phiên sửa, có thể giữ tạm phần nhập khi chuyển qua lại các loại. Sau lưu/mở lại, chỉ bảo đảm phục hồi loại đã lưu cùng cấu hình của nó. Đổi loại toán hạng bỏ các lựa chọn phụ thuộc không còn phù hợp, nhưng không làm mất dòng khác còn hợp lệ.

### Ví dụ phải đọc được từ form và danh sách

| Tình huống | Thiết lập | Kết quả |
| --- | --- | --- |
| Điểm bằng ngưỡng | S=30, T=30 | Dấu `<`: không đỏ; dấu `≤`: đỏ |
| Tỷ lệ có phần lẻ | M=75, 30%, S=22.2, dấu `<` | Không xử lý: T=22.5, đỏ. Xuống số nguyên: T=22, không đỏ |
| Công thức minh họa 03-C | A=49.7; dòng 1 A÷2, xuống số nguyên; dòng 2 kết quả dòng 1×0.8, không xử lý | 49.7÷2=24.85 → 24 → 19.2. S=19.1 với `<` là đỏ |
| Vị trí phần lẻ khác | Cùng phép tính nhưng chỉ xuống số nguyên ở dòng 2 | T=19, S=19.1 không đỏ; đây là cấu hình khác |
| Ngưỡng âm | A=15, công thức A−20 | T=−5 hợp lệ, không ép về 0. Điểm không âm không đỏ |
| Làm tròn số âm | Giá trị −5.2, p=1 | Lên thành −5; xuống thành −6 |
| Làm tròn gần nhất tại điểm giữa | Giá trị −5.5, p=1 | Thành −6, theo quy tắc nửa đơn vị ra xa 0 |

Không làm tròn điểm học sinh thay cho ngưỡng, không cắt trung bình nguồn trước khi chọn điều kiện. Dữ liệu vượt giới hạn được báo lỗi, không tự cắt bớt để lưu.

<a id="screen-ranking"></a>
## 05 — Thiết lập tổng hợp thứ hạng

**Màn hình:** Thiết lập tổng hợp thứ hạng（順位集計設定） và Thiết lập chi tiết（詳細設定） hiện có.  
**Mục đích:** chuẩn bị nguồn và quy trình tổng hợp cho các quy tắc dùng trung bình/tỷ lệ nhóm.  
**Figma:** [Cụm 04 — Chuẩn bị và vận hành](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=188-2).

| STT | Thành phần | Loại | Bắt buộc/tùy chọn | Giới hạn/kiểm tra | Điều kiện hiển thị | Thao tác và kết quả | Chuyển đến | Ghi chú |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | Bộ thiết lập tổng hợp | Lựa chọn hiện có | Bắt buộc khi chuẩn bị nguồn | Đúng trường/năm, môn/mục và thời kỳ | Theo màn hiện hữu | Xác định bộ tổng hợp được tham chiếu | — | Không tạo thêm cấu hình chỉ để đổi khối/lớp chủ nhiệm/lớp học |
| 2 | Tự tổng hợp khi đăng ký điểm | Lựa chọn hiện có | Theo quy trình dùng trung bình/tỷ lệ nhóm | Đặt Không thực hiện（実行しない） cho quy trình đánh giá tương đối | Tại thiết lập chi tiết, theo quyền hiện hành | Tách việc hoàn tất điểm đầu vào khỏi thao tác tổng hợp nguồn | — | Không tắt đăng ký điểm hoặc bước xét đỏ khi đăng ký |
| 3 | Tổng hợp theo khối/lớp chủ nhiệm/lớp học | Các lựa chọn hiện có | Theo cấu hình của trường/năm | Chỉ người có quyền quản lý các thiết lập này được đổi | Ở khu vực quản trị hiện hữu | Quyết định ba loại nguồn có thể chọn trên form điểm đỏ | [03 — Điều kiện](#screen-conditions), [04 — Ngưỡng](#screen-threshold) | Không sao chép công tắc sang form điểm đỏ |
| 4 | Nhóm tổng hợp, tổ hợp, nhóm môn | Cấu hình nhóm hiện có | Theo nhu cầu nguồn | Đúng trường/năm, định danh và mapping hợp lệ | Theo chức năng hiện hữu | Cung cấp những nhóm đã cấu hình để lựa chọn | — | Ba loại nhóm này không phụ thuộc ba công tắc ở dòng trên |
| 5 | Lưu thiết lập tổng hợp | Thao tác lưu hiện có | — | Theo quyền/validation hiện có | Khi có quyền sửa | Lưu nguồn/cách tổng hợp | [06 — Thực hiện](#screen-execution) theo điều hướng hiện có | Lưu chưa tạo kết quả tổng hợp mới hoặc xét lại đỏ |

Không bổ sung màn chọn bỏ qua bản chốt. Kết quả đã chốt được ưu tiên tự động theo [chính sách nguồn](#source-policy). Chức năng chốt kết quả thuộc luồng tổng hợp hiện hữu, không phải một chức năng chốt riêng của điểm đỏ.

<a id="screen-execution"></a>
## 06 — Tổng hợp, chạy tính toán và cập nhật kết quả

**Màn hình:** Tổng hợp thành tích（成績集計）; liên quan các đường đăng ký điểm hiện có.  
**Mục đích:** chạy đúng trình tự và biết phần nào đã được cập nhật.  
**Figma:** [Cụm 04 — Thực hiện và trạng thái](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=188-2) · [Giải thích thời điểm xóa điểm/xóa quy tắc](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=188-141).

| STT | Thành phần | Loại | Bắt buộc/tùy chọn | Giới hạn/kiểm tra | Điều kiện hiển thị | Thao tác và kết quả | Chuyển đến | Ghi chú |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | Phạm vi chạy | Các bộ chọn hiện có | Bắt buộc | Trường/năm, lớp, kỳ/thời điểm và đối tượng trong quyền | Trước khi thực hiện | Chọn phạm vi cần tổng hợp/tính toán | Tại màn này | Không tự mở rộng thành toàn trường |
| 2 | Thực hiện tổng hợp（集計実行） | Nút xanh hiện có | — | Hoàn tất đầu vào cần dùng; có quyền thực hiện | Theo chức năng tổng hợp hiện có | Tạo/cập nhật kết quả nguồn; chờ hoàn tất trước bước tiếp | Tại màn này | Chạy xong chưa đồng nghĩa đã xét đỏ; không tự thay bản chốt đang có hiệu lực |
| 3 | Thực hiện tính toán tự động（自動算出実行） | Nút cam hiện có | — | Có quyền, đúng phạm vi; kiểm tình trạng nguồn theo từng ô, không chặn cả lượt chỉ vì một ô thiếu nguồn tổng hợp | Theo quyền chạy hiện hành | Xử lý các ô độc lập/đủ nguồn; ô thiếu nguồn ghi nhận chưa xét được và được nêu riêng trong kết quả | Tại màn này | Phải bao phủ mục chỉ có rule đỏ, không có công thức tính điểm, và mục vừa xóa rule cuối |
| 4 | Trạng thái thực hiện/thông báo kết quả | Hiển thị hiện có được bổ sung nội dung cần thiết | — | Phân biệt đang chờ, đã cập nhật, chưa xét được và lỗi | Trong/sau lượt xử lý | Cho biết phần chưa hoàn tất để xử lý tiếp | Tại màn này | Vào hàng đợi không phải hoàn tất; số lớp xử lý không tự là số ô xét thành công |
| 5 | Thông tin thiếu dữ liệu | Thông báo trong phạm vi được phép xem | — | Nêu lý do nghiệp vụ: thiếu nguồn, maximum không hợp lệ, phép chia không hợp lệ… | Khi đã chạy nhưng không tạo được ngưỡng | Hướng dẫn chuẩn bị nguồn/sửa cấu hình rồi chạy lại | Màn tương ứng với nguyên nhân | Không suy “không có dấu đỏ” là đã đạt |
| 6 | Thông báo hoàn tất một phần | Thông báo kết quả lượt chạy | — | Phân biệt phần đã cập nhật và phần lỗi kỹ thuật | Khi lượt hàng loạt chưa hoàn tất toàn bộ | Giữ kết quả đã lưu, thông báo phạm vi cần khắc phục/chạy lại | Tại màn này | Không thông báo đã hoàn tác toàn lượt nếu thực tế đã lưu một phần |
| 7 | Thực hiện lại sau khắc phục | Thao tác chạy hiện có | — | Giữ quyền, phạm vi và chống ghi kết quả cũ | Khi cần cập nhật lại | Xét theo điểm, cấu hình và nguồn phù hợp của lượt mới | Tại màn này | Không thêm chế độ điểm đỏ thủ công/tự động riêng hoặc vòng lặp vô hạn |

**Ví dụ một lượt có hai ô:** ô A cần trung bình nhưng chưa có nguồn phù hợp; ô B có ngưỡng cố định 30 và điều kiện không phụ thuộc tổng hợp, điểm đã lưu là 24, dấu `<`. Ô A được ghi nhận chưa xét được; ô B vẫn được xét đỏ. Thông báo phải phân biệt phần đã cập nhật, phần chưa xét được và lỗi kỹ thuật nếu có; không yêu cầu đủ nguồn của A mới xử lý B. Sau khi chuẩn bị nguồn cho A, thực hiện lại theo phạm vi được phép. Điều này không cho phép thử quy tắc ưu tiên thấp hơn trên chính ô A.

### Các thao tác đăng ký điểm liên quan

| Đường thao tác | Kết quả cần có |
| --- | --- |
| Nhập/sửa điểm trực tiếp | Xét điểm cuối được lưu; bao gồm điểm nhập tay, dự kiến và số 0 hợp lệ, kể cả mục không có công thức tính tự động |
| Nhập điểm bằng CSV | Cùng quy tắc xét trong phạm vi dòng/ô được đăng ký và ranh giới lưu hiện có |
| Liên kết kết quả thi/chấm bài | Các ô thực sự được ghi trong phạm vi hỗ trợ cũng được xét, không bỏ sót chỉ vì không chạy tính tự động |
| Xóa điểm thành trống | Ngay khi lưu thành công, ô trống và ngừng dấu/đóng góp lọc đỏ của ô; không chờ chạy lại |
| Lưu mức tối đa tại định nghĩa/mục | Chỉ thay cấu hình; không tự xét toàn trường |
| Lưu lựa chọn maximum theo lớp hoặc theo luồng hàng loạt hiện có | Kết quả cập nhật sau khi đường tính hiện hữu được phép thực hiện thành công |
| Xóa/ngừng sử dụng điểm đơn vị | Ngừng dùng kết quả gắn với điểm đã mất; không biến thành điểm 0 |

Các đường này dùng màn hiện có; tài liệu không bổ sung nút “xét đỏ” riêng vào từng màn nhập điểm.

**Trình tự dùng trung bình/tỷ lệ nhóm:** tắt tự tổng hợp → hoàn tất đầu vào của nhóm → chạy nút xanh và chờ xong → chạy nút cam và chờ xong → kiểm lỗi/chưa xét được → sử dụng đầu ra. Nếu bước tính sửa chính dữ liệu nguồn, cần vận hành lại đúng phạm vi; hệ thống không tự lặp tổng hợp–tính toán đến khi hội tụ.

**Ví dụ cập nhật đồng thời:** lượt hàng loạt đọc điểm 29, sau đó giáo viên lưu 40 và kết quả không đỏ. Lượt cũ hoàn tất muộn không được gắn kết quả đỏ của 29 lên điểm 40; cả trường hợp 29→40→29 hoặc xóa rồi nhập lại 29 cũng không được dùng kết quả của lượt cũ.

<a id="screen-extraction"></a>
## 07 — Trích xuất thành tích và Excel

**Màn hình:** Trích xuất thành tích（成績抽出）, gồm phần thiết lập hiển thị và bảng kết quả.  
**Mục đích:** lọc học sinh có điểm đỏ hoặc đánh dấu từng ô đỏ khi xem/xuất.  
**Figma:** [Cụm 05 — Thiết lập, kết quả và Excel](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-6230).

| STT | Thành phần | Loại | Bắt buộc/tùy chọn | Giới hạn/kiểm tra | Điều kiện hiển thị | Thao tác và kết quả | Chuyển đến | Ghi chú |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | Phạm vi trích xuất | Bộ lọc hiện có | Theo chức năng hiện có | Môn, mục, kỳ/thời điểm, học sinh và đơn vị trong quyền | Khi thiết lập trích xuất | Xác định các ô được xét trong bộ lọc đỏ và xuất | Tại màn này | Không dùng danh sách đang lọc để tính lại trung bình |
| 2 | Lọc học sinh có điểm đỏ | Ô chọn/bật tắt | Tùy chọn | Có ít nhất một ô đỏ còn hiệu lực trong phạm vi đã chọn | Phần điều kiện trích xuất | Khi bật, chỉ giữ học sinh thỏa lọc đỏ; khi tắt không loại học sinh theo tiêu chí này | Bảng kết quả | Mặc định thiết kế: tắt; các bộ lọc khác vẫn áp dụng |
| 3 | Ký hiệu phía trước | Ô chọn và ô văn bản | Có điều kiện | Bật thì ký hiệu không được rỗng; giới hạn độ dài theo [bảng ký hiệu](#symbol-limits) | Phần hiển thị điểm đỏ | Thêm ký hiệu trước giá trị của đúng ô đỏ; không tự cắt chuỗi khi lưu | Bảng kết quả/Excel | Mặc định tắt; có thể bật đồng thời ký hiệu phía sau |
| 4 | Ký hiệu phía sau | Ô chọn và ô văn bản | Có điều kiện | Bật thì ký hiệu không được rỗng; giới hạn độ dài theo [bảng ký hiệu](#symbol-limits) | Phần hiển thị điểm đỏ | Thêm ký hiệu sau giá trị của đúng ô đỏ; không tự cắt chuỗi khi lưu | Bảng kết quả/Excel | Mặc định tắt; không áp cho mọi ô của học sinh có điểm đỏ |
| 5 | Tô màu ô | Ô chọn và bảng màu hiện có | Tùy chọn | Dùng giá trị hợp lệ trong palette hiện hữu | Phần hiển thị điểm đỏ | Tô đúng ô đỏ bằng màu được chọn | Bảng kết quả/Excel | Không tạo hệ màu riêng hoặc ép màu minh họa thành màu bắt buộc |
| 6 | Áp dụng điều kiện/xem kết quả | Thao tác trích xuất hiện có | — | Kiểm quyền, phạm vi và ký hiệu bắt buộc | Khi sử dụng màn | Dựng bảng từ kết quả xét đã hoàn tất | Bảng kết quả | Không kích hoạt tổng hợp hoặc xét lại |
| 7 | Ô điểm trong bảng kết quả | Nội dung bảng | — | Cùng giá trị và kết quả đúng ô; giữ ẩn điểm | Khi có dữ liệu | Áp ký hiệu/màu theo lựa chọn đối với ô đỏ | — | Chưa xét/không áp dụng/không có điểm không nhận dấu đỏ từ kết quả đã hết hiệu lực |
| 8 | Không có kết quả phù hợp | Trạng thái bảng rỗng | — | Không có học sinh thỏa toàn bộ điều kiện | Sau trích xuất | Hiển thị kết quả rỗng hợp lệ | — | Không phải lỗi chỉ vì không có học sinh đỏ |
| 9 | Xuất Excel | Nút xuất hiện có | — | Server kiểm phạm vi và trạng thái; không tin cờ đỏ/ngưỡng sửa từ trình duyệt | Theo quyền và chức năng xuất | Xuất đúng học sinh, điểm, ký hiệu, màu và ô trống của cùng lần xuất | File Excel | Không tự xét khi tải file; các định dạng khác chỉ theo phạm vi có hỗ trợ |
| 10 | Lưu/mở lại/sao chép thiết lập trích xuất | Thao tác hiện có | — | Giữ đúng các lựa chọn lọc, ký hiệu và màu của cấu hình | Theo chức năng quản lý thiết lập hiện có | Phục hồi đúng lựa chọn khi dùng lại hoặc sao chép | Thiết lập tương ứng | Không sao chép kết quả xét của học sinh; lỗi lưu không làm mất cấu hình trước |

**Ví dụ:** học sinh có Toán 24 đỏ, Văn 70 không đỏ. Trong phạm vi có Toán, bật lọc thì học sinh được giữ; chỉ ô Toán có hiệu ứng. Nếu chỉ trích xuất Văn, ô Toán nằm ngoài phạm vi không giúp thỏa lọc đỏ. Với ký hiệu trước `※`, sau `!`, ô Toán hiển thị `※24!`.

Chỉ bật ký hiệu/màu không đồng nghĩa bật lọc. Nếu ô Toán bị xóa và lưu thành công thì ngừng đóng góp vào lọc ngay; học sinh vẫn có thể còn trong kết quả nếu có một ô đỏ khác trong phạm vi. Điểm bị ẩn không được làm lộ lại bằng số hoặc ký hiệu.

<a id="screen-publication"></a>
## 08 — Thiết lập công khai thành tích

**Màn hình:** Thiết lập công khai thành tích（成績公開設定）.  
**Mục đích:** chọn cách hiển thị điểm đỏ riêng cho từng cấu hình công khai, từng mục và loại điểm thường/đơn vị.  
**Figma:** [Cụm 06 — Thiết lập công khai](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-5580) · [So sánh thường/đơn vị](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-5615).

| STT | Thành phần | Loại | Bắt buộc/tùy chọn | Giới hạn/kiểm tra | Điều kiện hiển thị | Thao tác và kết quả | Chuyển đến | Ghi chú |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | Cấu hình công khai và mục | Ngữ cảnh/bộ chọn hiện có | Theo màn hiện hữu | Đúng cấu hình, năm, mục và quyền | Khi chỉnh thiết lập công khai | Xác định nơi lưu lựa chọn hiển thị | Tại màn này | Cùng mục ở hai cấu hình được chọn hiệu ứng khác nhau |
| 2 | Phần điểm thường | Khu vực cấu hình | — | Phân biệt với điểm đơn vị | Khi cấu hình có mục điểm thường thuộc đối tượng | Hiển thị lựa chọn riêng của điểm thường | — | Không dùng lựa chọn phía đơn vị thay thế |
| 3 | Phần điểm theo đơn vị | Khu vực cấu hình | — | Giữ đúng loại điểm; control không bị nền che/cắt | Khi cấu hình có mục điểm đơn vị thuộc đối tượng | Hiển thị lựa chọn riêng của điểm đơn vị | — | Hai phía đều phải thấy rõ giá trị đang chọn |
| 4 | Cách hiển thị điểm đỏ（赤点の表示方法） | Bộ chọn cho từng mục/loại điểm | Tùy chọn hiệu ứng | Không hiệu ứng; ngoặc; dấu `*` cố định trước; dấu `*` cố định sau | Phần tạo/sửa hiệu ứng cho mục số có thiết lập đỏ | Chọn hiệu ứng áp khi ô có kết quả đỏ còn hiệu lực | Tại màn này | Không thêm ký tự tự do, lọc học sinh đỏ hoặc màu nền riêng |
| 5 | Hiển thị kèm ngoặc（括弧付きで表示する） | Lựa chọn trong bộ chọn | Tùy chọn | Theo hiệu ứng đã chọn | Trong bộ chọn hiển thị đỏ | Ví dụ điểm 24 thành `(24)` khi đủ điều kiện | — | Đây là một lựa chọn, không phải bộ chọn trùng khác |
| 6 | Hiệu ứng điểm dự kiến hiện có | Bộ chọn hiện có | Theo màn hiện hữu | Giữ cấu hình dự kiến độc lập | Khi chức năng hiện có áp dụng | Kết hợp với hiệu ứng đỏ theo bảng bên dưới | — | Bỏ hiệu ứng đỏ không được xóa hiệu ứng dự kiến còn hiệu lực |
| 7 | Lưu thiết lập công khai | Nút lưu hiện có | — | Kiểm mã lựa chọn, quyền, đúng cấu hình/mục/loại điểm | Khi được sửa | Lưu và đọc lại đúng lựa chọn mỗi bên | Màn công khai theo điều hướng hiện có | Lỗi lưu giữ cấu hình trước; không sửa kết quả xét |
| 8 | Sao chép cấu hình | Thao tác hiện có | — | Ánh xạ đúng mục và phân loại thường/đơn vị | Theo chức năng sao chép hiện có được hỗ trợ | Giữ các lựa chọn hiển thị của cấu hình sao chép | Cấu hình đích | Không sao chép kết quả xét của học sinh |
| 9 | Lịch, đối tượng và ẩn điểm | Thành phần hiện có | Theo màn hiện hữu | Giữ nguyên quyền và lịch công khai | Theo chức năng hiện có | Kiểm soát những gì học sinh/phụ huynh được xem | [09 — Xem công khai](#screen-student) | Dấu đỏ không làm lộ điểm đã ẩn |

### Kết quả của lựa chọn hiển thị

| Điểm 24 có cả trạng thái dự kiến và đỏ | Hiệu ứng dự kiến | Hiệu ứng đỏ | Kết quả |
| --- | --- | --- | --- |
| Hai hiệu ứng khác nhau | Ngoặc | `*` trước | `(*24)` |
| Cùng dấu ở cùng vị trí | `*` trước | `*` trước | `*24`, không phải `**24` |
| Cùng ngoặc | Ngoặc | Ngoặc | `(24)`, không phải `((24))` |
| Dấu trước và sau | `*` trước | `*` sau | `*24*` |
| Chỉ đỏ có hiệu ứng | Không hiệu ứng | Ngoặc | `(24)` |
| Điểm đã bị ẩn | Bất kỳ | Bất kỳ | Giữ ẩn cả số và ký hiệu có thể làm lộ thông tin |

Ví dụ cùng mục điểm đỏ 24: cấu hình công khai X chọn ngoặc, Y chọn `*` trước; X hiển thị `(24)`, Y hiển thị `*24`. Lưu/mở lại/sao chép không làm hai cấu hình hoặc hai loại thường/đơn vị ghi đè lựa chọn của nhau.

Khi xóa quy tắc đỏ cuối, không tự xóa hiệu ứng công khai đã lưu hoặc bỏ dấu cũ ngay. Kết quả trước còn hiệu lực đến lần xét tiếp theo; sau lần xét xác định không áp dụng mới ngừng phần hiệu ứng đỏ.

<a id="screen-student"></a>
## 09 — Xem điểm được công khai

**Màn hình:** Xác nhận thành tích（成績確認） phía học sinh/phụ huynh.  
**Mục đích:** xem điểm theo cấu hình công khai được phép sử dụng.  
**Figma:** [Cụm 06 — Kết quả phía học sinh](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-5580).

| STT | Thành phần | Loại | Bắt buộc/tùy chọn | Giới hạn/kiểm tra | Điều kiện hiển thị | Thao tác và kết quả | Chuyển đến | Ghi chú |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | Học sinh, năm/kỳ và phạm vi công khai | Nhãn/bộ chọn hiện có | Theo màn hiện hữu | Đúng quan hệ học sinh/phụ huynh và lịch | Khi được quyền xem | Hiển thị đúng dữ liệu được công khai | Tại màn này | Không suy quyền chỉ từ đường dẫn hoặc ID |
| 2 | Ô điểm thường | Nội dung bảng | — | Điểm, trạng thái và hiệu ứng của đúng ô | Khi mục được công khai và không bị ẩn | Hiển thị số với hiệu ứng riêng của cấu hình | — | Không lấy thiết lập thường của cấu hình khác |
| 3 | Ô điểm đơn vị | Nội dung bảng | — | Giữ đúng đơn vị và lựa chọn hiển thị của loại đơn vị | Khi mục đơn vị được công khai | Hiển thị tương tự theo dữ liệu riêng | — | Không gộp kết quả nhiều đơn vị |
| 4 | Ô chưa xét/chưa xét được/không áp dụng | Nội dung bảng | — | Dùng trạng thái hiện hành, không biến thành “đã đạt” | Khi ô chưa có kết luận đỏ có hiệu lực | Không thêm hiệu ứng đỏ; giữ các định dạng hợp lệ khác | — | Không bắt buộc thêm toàn bộ nhãn trạng thái nội bộ lên màn học sinh |
| 5 | Ô không có điểm hoặc bị ẩn | Nội dung bảng | — | Không thay trống bằng 0; không để dấu cũ | Theo dữ liệu và cấu hình ẩn | Giữ cách hiển thị trống/ẩn hiện hữu | — | Không để lại ký hiệu khiến lộ trạng thái của điểm ẩn |
| 6 | Xem lại hoặc xuất PDF công khai | Thao tác hiện có, nếu được hỗ trợ | — | Cùng quyền, lịch, điểm và hiệu ứng | Theo chức năng công khai hiện có | Đọc kết quả đã lưu, nhất quán giữa web và PDF tương ứng | Đầu ra hiện có | Không kích hoạt xét/tổng hợp; PDF công khai khác PDF phiếu điểm |

Màn này dùng quy tắc kết hợp hiệu ứng tại [08 — Thiết lập công khai](#screen-publication). Không thêm nền đỏ riêng. Khi kết quả đỏ hết hiệu lực, chỉ bỏ hiệu ứng đỏ; nền bảng, định dạng và hiệu ứng dự kiến khác vẫn được giữ.

<a id="screen-report"></a>
## 10 — Công cụ phiếu điểm, tùy chọn ô và PDF

**Màn hình:** Công cụ phiếu điểm（通知表ツール） và hộp tùy chọn hiển thị của mục điểm.  
**Mục đích:** đặt cách trình bày điểm đỏ trong mẫu phiếu hiện có.  
**Figma:** [Cụm 07 — Tùy chọn và kết quả PDF](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-5111).

| STT | Thành phần | Loại | Bắt buộc/tùy chọn | Giới hạn/kiểm tra | Điều kiện hiển thị | Thao tác và kết quả | Chuyển đến | Ghi chú |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | Mẫu/bảng phiếu và mục điểm | Thành phần hiện có | Theo chức năng hiện có | Đúng mẫu, môn, kỳ/thời điểm, loại điểm và quyền sửa | Khi thiết kế phiếu | Chọn đúng mục cần đặt cách hiển thị | Hộp tùy chọn ô | Không ép các mẫu trường về một bố cục chung |
| 2 | Điều kiện điểm đỏ | Dòng điều kiện | Tùy chọn sử dụng | Nằm sau các điều kiện ô chọn và trước ô trống | Tại tùy chọn mục điểm có hỗ trợ | Áp dụng khi ô đỏ và chưa có điều kiện phía trên khớp | Tại hộp tùy chọn | Không thay vị trí ưu tiên theo hiệu ứng “mạnh hơn” |
| 3 | Cách hiển thị khi đỏ | Bộ chọn | Bắt buộc cho điều kiện đang cấu hình | Nguyên trạng（そのまま表示）, Kèm ngoặc（カッコ付き）, ký tự trước hoặc sau | Trong dòng điều kiện đỏ | Chọn kết quả `24`, `(24)`, `※24` hoặc `24※` | Tại hộp tùy chọn | Mặc định thiết kế: nguyên trạng; không thêm ẩn/gạch chéo/nền riêng cho đỏ |
| 4 | Ký tự phía trước/sau | Ô văn bản | Có điều kiện | Bắt buộc khi chọn trước/sau; giới hạn độ dài theo [bảng ký hiệu](#symbol-limits) | Khi chọn kiểu ký tự tương ứng | Nhập chuỗi cần ghép với số; không tự cắt chuỗi khi lưu | — | Không bắt nhập nếu chọn nguyên trạng hoặc ngoặc |
| 5 | Hoàn tất/đóng hộp tùy chọn | Thao tác hiện có | — | Giữ lựa chọn hợp lệ theo luồng của hộp | Khi đang sửa tùy chọn | Trở về bảng thiết kế | Bảng thiết kế phiếu | Chưa thay cho bước lưu bền vững ở dòng dưới |
| 6 | Cập nhật（更新する） | Nút ở màn bảng | — | Kiểm quyền và dữ liệu tùy chọn | Sau khi hoàn tất tùy chọn | Lưu mẫu và lựa chọn; mở lại đúng nội dung | Tại màn bảng | Chỉ dùng điều kiện đỏ vẫn phải lưu được; lỗi không báo thành công |
| 7 | Các điều kiện hiển thị hiện có | Danh sách điều kiện | Theo chức năng hiện có | Giữ thứ tự và nguyên tắc khớp đầu tiên | Tại tùy chọn ô | Điều kiện phía trên có thể quyết định hiển thị trước khi đến đỏ | — | Không cộng mọi hiệu ứng như màn công khai |
| 8 | Sao chép mẫu | Thao tác hiện có | — | Giữ cấu hình trình bày, đúng phạm vi | Theo chức năng sao chép hiện có | Mẫu đích có lựa chọn/ký tự tương ứng | Mẫu đích | Kết quả xét vẫn lấy theo học sinh/ô đích, không sao chép kết quả cá nhân |
| 9 | Xuất/in PDF phiếu | Thao tác hiện có | — | Đọc mẫu đã lưu và đúng học sinh/môn/thời điểm/đơn vị | Khi được phép xuất phiếu | Xuất theo điều kiện khớp đầu tiên và kết quả xét có hiệu lực | PDF phiếu điểm | Không xét lại khi in; không thêm quản lý đóng băng/phiên bản toàn phiếu |
| 10 | Ô điểm trên PDF | Nội dung đầu ra | — | Giữ cấu trúc mẫu, font/ký tự, không tràn hoặc mất dấu | Trong PDF | Hiển thị kết quả theo bảng ưu tiên dưới đây | — | Không nền đỏ riêng; giữ nền bảng/header của mẫu |

### Thứ tự áp dụng trong một ô phiếu

Sau các kiểm soát ẩn ô và thời kỳ hiện có: **điều kiện môn cụ thể → các điều kiện ô chọn theo thứ tự → điểm đỏ → ô trống → hiển thị thông thường**. Gặp điều kiện khớp đầu tiên thì dùng kết quả và dừng; lựa chọn nguyên trạng cũng kết thúc xét.

| Tình huống | Kết quả trên phiếu |
| --- | --- |
| Điểm 24 vừa dự kiến vừa đỏ; điều kiện dự kiến phía trên chọn ngoặc; đỏ chọn `※` trước | `(24)`, không thêm `※` |
| Như trên nhưng điều kiện dự kiến chọn nguyên trạng | `24`; không tiếp tục xuống đỏ |
| Điều kiện phía trên đã áp dụng ẩn/gạch chéo | Giữ kết quả đó; đỏ không làm hiện lại điểm |
| Không có điều kiện phía trên khớp; đỏ chọn `※` trước | `※24` |
| Điểm bị xóa thành trống và đã lưu thành công | Không còn dấu đỏ của điểm cũ; áp quy tắc ô trống hiện hữu |

Không hiểu rằng một điều kiện ẩn ở bất kỳ vị trí nào luôn thắng toàn bộ: nếu chuỗi đã dừng ở điều kiện khớp phía trên thì không tìm tiếp điều kiện phía dưới. Lưu mẫu xong chưa thay điểm hoặc kết quả xét học sinh.

<a id="shared-rules"></a>
## 11 — Quy tắc, trạng thái và ví dụ chung

Phần này giải thích những quy tắc được nhiều màn sử dụng; không phải một màn quản trị mới. Các tên trạng thái mô tả nghiệp vụ, không bắt buộc tạo thêm nhãn trên màn học sinh.

### Điểm nào được xét?

| Dữ liệu | Cách sử dụng |
| --- | --- |
| Điểm cuối S | Giá trị cuối đã lưu sau tính toán, giới hạn điểm và cập nhật liên quan; không dùng giá trị trung gian |
| Điểm nhập/sửa tay | Được xét cả khi không có hoặc không chạy công thức tính điểm tự động |
| Điểm dự kiến（見込点） | Số điểm vẫn được xét; cờ dự kiến là thông tin riêng, không bị thay bằng cờ đỏ |
| Chưa dự thi（未受験） nhưng có số | Cờ chưa dự thi không tự loại số đó khỏi xét đỏ; loại khỏi thứ hạng là việc khác |
| Số 0 | Là điểm hợp lệ, được so với ngưỡng |
| Trống/xóa/ngừng dùng | Không đổi thành 0, không giữ dấu của số trước đó |
| Maximum M | Mặc định mục/kỳ → ngoại lệ đơn vị có hiệu lực → lựa chọn lớp thực sự áp dụng cuối cùng. Ví dụ 100→40→50 thì dùng 50 |
| Trung bình A/tỷ lệ nhóm R | Giá trị trước làm tròn của đúng bản nguồn. Trung bình 49.99 vẫn nhỏ hơn 50 dù màn tổng hợp hiển thị 50 |

Khác học sinh, trường, năm, lớp học phần, mục, thời điểm hoặc đơn vị là khác ô. Không liên kết kết quả chỉ bằng tên môn/mục hiển thị. Hai đơn vị cùng tên mục không dùng chung kết quả.

<a id="source-policy"></a>
### Chọn nguồn và chọn quy tắc

1. Duyệt quy tắc hoàn chỉnh theo ưu tiên. Bộ lọc không phụ thuộc tổng hợp đã xác định không áp dụng thì bỏ qua quy tắc đó.
2. Nếu một quy tắc có khả năng áp dụng nhưng thiếu dữ liệu để quyết định, ghi nhận chưa xét được; không coi thiếu dữ liệu là “không khớp” để thử quy tắc thấp hơn.
3. Chọn quy tắc đầu tiên xác định khớp. Tính ngưỡng của quy tắc đó; thiếu nguồn hoặc công thức không tính được thì không thử quy tắc khác.
4. Nếu đủ dữ liệu xác định tất cả quy tắc không áp dụng, kết quả là không áp dụng.

Nguồn tổng hợp phải đúng trường/năm/kỳ, cấu hình, nhóm, môn/mục và đơn vị. Có bản chốt tương ứng thì tự động ưu tiên; chỉ khi chưa có mới dùng bản hoàn tất mới nhất của cùng phạm vi. Bản chốt được chọn thiếu dữ liệu không được thay bằng bản thường, kỳ khác, nhóm khác, điểm chưa tổng hợp hoặc số 0.

Nguồn của điều kiện và công thức độc lập. Khi cùng một nguồn được dùng nhiều lần trong một lượt, phải dùng cùng bản và cùng bộ giá trị. Tỷ lệ nhóm kế thừa kết quả tổng hợp hiện có; không tính riêng trung bình tỷ lệ từng học sinh và không ghép maximum hiện hành của một học sinh vào tổng của bản chốt.

Ví dụ hai điểm 60/100 và 80/100 trong cùng nguồn cho tỷ lệ nhóm 70%, thỏa điều kiện từ 65% trở lên. Nếu các lớp có maximum khác nhau, vẫn kế thừa kết quả tổng hợp hiện hữu; không thêm chặn cấu hình hay dừng xử lý chỉ vì sự khác biệt đó.

### Trạng thái và ảnh hưởng đầu ra

| Trạng thái | Ý nghĩa | Hiển thị/lọc đỏ |
| --- | --- | --- |
| Đỏ | Đã xét thành công và điểm thỏa dấu so sánh | Được đánh dấu/lọc theo từng đầu ra |
| Không đỏ | Đã xét thành công và không thỏa ngưỡng | Không có hiệu ứng đỏ |
| Chưa từng xét | Chưa có kết quả hoàn tất | Không thêm dấu đỏ; không được coi là đã đạt |
| Chưa xét được | Đã chạy nhưng thiếu nguồn/toán hạng, maximum không hợp lệ cho tỷ lệ, chia cho 0 hoặc tràn số | Khi lưu trạng thái thành công, ngừng dùng dấu/lọc từ kết quả trước; giữ điểm |
| Không áp dụng | Đủ thông tin xác định không có quy tắc phù hợp, gồm hết quy tắc sau lần xét lại | Ngừng kết quả đỏ trước; không phải kết luận đạt một ngưỡng |
| Không có điểm | Điểm trống, bị xóa hoặc ngừng hoạt động | Không dùng số 0 giả hoặc dấu cũ |

“Đang chờ chạy lại” có nghĩa cấu hình/nguồn đã thay đổi nhưng kết quả trước vẫn có hiệu lực. Đây không phải kết luận mới “không đỏ” hoặc “chưa xét được”. Không chặn trích xuất, công khai hoặc phiếu chỉ vì chưa xét/chưa xét được; các quyền, lịch và điều kiện ẩn hiện có vẫn áp dụng.

### Khi nào kết quả thay đổi?

| Thao tác | Ngay sau lưu thành công | Sau lần xét tiếp theo |
| --- | --- | --- |
| Sửa ngưỡng/dấu/đối tượng/ưu tiên/công thức/nguồn | Giữ kết quả học sinh trước; hướng dẫn chạy lại | Chọn và xét theo cấu hình hiện hành |
| Xóa một hoặc toàn bộ quy tắc | Dòng quy tắc biến mất; kết quả học sinh trước vẫn giữ | Xét quy tắc còn lại hoặc không áp dụng nếu đã hết |
| Xóa điểm thành trống | Ô trống; ngừng dấu và đóng góp lọc đỏ của ô ngay | Chỉ xét khi có điểm hợp lệ trở lại; không kế thừa kết quả ô cũ |
| Sửa 29 thành 40 | Khi lượt lưu/xét thành công, giữ điểm 40 cùng kết quả của điểm 40 | Không cho lượt cũ hoàn tất muộn ghi đè |
| Chỉ cập nhật kết quả tổng hợp | Giữ kết quả đỏ trước; không tự xét mọi phụ thuộc | Dùng nguồn được chọn theo ưu tiên bản chốt |
| Đã chạy nhưng không tính được ngưỡng | Sau lưu trạng thái thành công, ngừng dùng kết quả cũ | Khắc phục rồi chạy lại mới có kết luận mới |
| Xem/tải Excel/công khai/in lại | Đọc kết quả hiện hành, không thay dữ liệu xét | Không tự khởi chạy lượt xét |

Lỗi kỹ thuật khi lưu khác với “chưa xét được”: không báo đã xóa điểm, đã vô hiệu hóa kết quả cũ hoặc đã xét thành công nếu việc ghi dữ liệu thất bại. Lượt hàng loạt đã hoàn tất một phần phải chỉ rõ phần còn lỗi để chạy lại phù hợp.

### Các kiểm tra nhập liệu thống nhất

| Nội dung | Quy tắc thiết kế |
| --- | --- |
| Tên quy tắc | 1–255 ký tự sau bỏ khoảng trắng đầu/cuối; không bắt duy nhất |
| Ngưỡng cố định | Số trong 0..maximum của mọi đối tượng lúc lưu; tối đa 3 chữ số lẻ và không vượt 999999.999 |
| Tỷ lệ maximum | 0–100, tối đa 3 chữ số lẻ |
| Mốc trung bình, số/hệ số công thức | Số hữu hạn, tối đa 9 chữ số nguyên và 8 chữ số lẻ |
| Mốc tỷ lệ nhóm | 0–100, tối đa 8 chữ số lẻ |
| Công thức | 1–20 dòng đầy đủ; không tham chiếu chính dòng/dòng sau/dòng đã xóa; không lưu chia cho số 0 cố định |
| Phần lẻ | Mặc định không xử lý; bật thì có vị trí 1–9 và phương thức; xử lý ngưỡng/kết quả dòng, không xử lý điểm học sinh thay thế |
| Nguồn/đối tượng | Đúng quyền, trường/năm và còn hợp lệ; không tự bỏ bộ lọc hoặc thay nguồn để lưu thành công |
| Ký hiệu trích xuất/phiếu | Bắt nhập khi bật kiểu cần ký hiệu; xem giới hạn và hành vi lưu tại [bảng ký hiệu](#symbol-limits) |
| Lưu/mở lại | Không âm thầm cắt giá trị hợp lệ; vượt giới hạn báo lỗi trước khi chấp nhận |

<a id="symbol-limits"></a>
### Giới hạn nhập ký hiệu

| Nơi nhập | Điều kiện bắt buộc | Số ký tự tối đa | Khi dữ liệu không hợp lệ |
| --- | --- | --- | --- |
| Ký hiệu trước/sau của trích xuất | Không được rỗng khi bật vị trí tương ứng; có thể dùng chuỗi ký hiệu, ví dụ `※!` | Chưa xác định con số; cần xác minh trước khi chốt đặc tả | Báo tại trường cần sửa và giữ cấu hình đã lưu trước; không âm thầm cắt chuỗi |
| Ký hiệu trước/sau trên phiếu | Không được rỗng khi chọn kiểu trước/sau; không bắt nhập với nguyên trạng/ngoặc | Chưa xác định con số; cần xác minh trước khi chốt đặc tả | Không báo lưu thành công khi ký hiệu chưa hợp lệ; giữ mẫu đã lưu trước và không cắt chuỗi |

Hai giới hạn còn thiếu do đội phát triển xác minh trên đường lưu tương ứng, gồm số ký tự, cách đếm và thông báo khi vượt giới hạn. Không hiểu “chưa xác định” là nhập không giới hạn hoặc mặc định chỉ cho một ký tự. Khi chốt giới hạn, phải cập nhật bảng này và dùng cùng quy tắc khi nhập, lưu và mở lại.

### Các trường hợp sao chép và dữ liệu cũ

| Tình huống | Hành vi |
| --- | --- |
| Ngưỡng điểm đỏ cũ | Không tự chuyển thành quy tắc mới; không reset/đổi nghĩa hoặc dùng làm nguồn thay thế khi thiếu quy tắc mới |
| Báo cáo/tùy biến trường hiện dùng dữ liệu cũ | Giữ hoạt động hiện hữu; không coi mọi báo cáo riêng trường thuộc ba đầu ra chung |
| Sao chép/chuyển năm trong đường được hỗ trợ | Ánh xạ đúng mục, kỳ, môn, nhóm, đơn vị và tham chiếu dòng công thức; giữ thứ tự |
| Quy tắc đã xóa | Không sao chép để phục hồi |
| Quy tắc lưu dở được đường sao chép hỗ trợ | Giữ chưa hiệu lực, không tự kích hoạt; chỉ lưu khi các tham chiếu đã nhập ánh xạ hợp lệ |
| Không ánh xạ được | Báo phần không được lưu; không đổi nhóm bằng tên hoặc bỏ điều kiện thành “tất cả”; không ghi đè quy tắc đích bằng dữ liệu thiếu |
| Kết quả cá nhân và nguồn chốt năm cũ | Không sao chép thành kết quả/nguồn mới của năm sau |
| Khôi phục/thay khung/xóa rồi tạo lại ô | Kết quả ô cũ hết hiệu lực; không gắn sang ô mới kể cả ID hoặc số điểm giống trước |
| File cấu hình cũ thiếu phần đỏ mới | Không tự tạo từ legacy hoặc âm thầm xóa quy tắc hiện hành; xử lý theo chế độ nhập của đường được hỗ trợ |

Phạm vi sao chép, chuyển năm, xuất/nhập và khôi phục phải được xác định cho từng đợt. Chuyển cấu hình thành công không có nghĩa đã chạy xét. Phần dùng nguồn tổng hợp chỉ hoàn tất tích hợp khi đã kiểm với dữ liệu nguồn thật, đúng bản chốt, đơn vị và độ chính xác.

<a id="db-overview"></a>
## 12 — Tổng quan dữ liệu và quan hệ lưu trữ

Đây là phụ lục định nghĩa dữ liệu lưu trữ. Khi chuyển sang Google Sheets, giữ các phần 12, 13 và 14 trong ba tab dữ liệu riêng; không trộn các cột DB vào bảng thành phần màn hình 01–10. Không cần đọc schema để hiểu thao tác màn hình. Bảng dưới mô tả phương án lưu, không khẳng định DB đã được tạo hoặc migration đã chạy.

### Các nhóm dữ liệu

| Bảng/kho dữ liệu | Phạm vi thay đổi | Một dòng/cấu hình thể hiện gì? | Liên quan màn |
| --- | --- | --- | --- |
| `red_score_settings` | Bảng mới | Một quy tắc thuộc một mục của khung đánh giá, trong một trường/năm | 02–04 |
| `red_score_results` | Bảng mới | Một kết quả hiện hành và thông tin điều khiển cập nhật của một ô điểm | 06–10 |
| `grade_evaluate_frame_items` | Bổ sung cột | Phiên bản danh sách quy tắc của mục, dùng ngăn lượt cũ ghi đè sau sửa cấu hình | 02–04, 06 |
| `grade_publish_conf_grade_items` | Bổ sung cột | Hiệu ứng đỏ của từng cấu hình công khai/năm/mục/loại thường–đơn vị | 08–09 |
| `grade_extract_conf.extract_setting` | Bổ sung nội dung trong JSON hiện có | Lọc, ký hiệu trước/sau và màu ô theo cấu hình trích xuất | 07 |
| Phần lưu bảng/điều kiện phiếu hiện có | Bổ sung điều kiện, không thêm bảng/cột riêng | Lựa chọn trình bày đỏ và chuỗi ký hiệu của mẫu phiếu | 10 |

Một mục có nhiều quy tắc. Một quy tắc có thể được dùng cho nhiều ô. Mỗi ô chỉ có một dòng kết quả hiện hành; ba đầu ra cùng đọc kết quả đó, nhưng lưu lựa chọn trình bày riêng. Xóa quy tắc không xóa dây chuyền kết quả còn phải giữ đến lần xét lại.

### Nhận diện ô và liên kết

Khóa duy nhất của kết quả: `school_id + year + evaluate_frame_item_id + group_id + student_id + tangen_id`.

| Thông tin | Ý nghĩa |
| --- | --- |
| `school_id`, `year` | Trường và năm học |
| `evaluate_frame_item_id` | Mục thuộc khung đánh giá; xác định mục đánh giá, kỳ/thời điểm và cột điểm liên quan |
| `group_id`, `student_id` | Lớp học phần và học sinh |
| `tangen_id` | 0 cho điểm thường; ID đơn vị cho điểm theo đơn vị |
| `red_score_setting_id` trong kết quả | Quy tắc được chọn khi đã xác định được; có thể NULL khi không chọn được |

Ứng dụng kiểm tra các liên kết và quyền; không khai báo foreign key. Hai bảng mới dùng InnoDB, `utf8mb4`, `utf8mb4_general_ci`. Không thay định danh hoặc collation của bảng nguồn chỉ để thêm chức năng này.

### Hai cột bổ sung

| Bảng | Cột | Kiểu / NULL / mặc định | Ý nghĩa và cách dùng |
| --- | --- | --- | --- |
| `grade_evaluate_frame_items` | `red_score_revision` | BIGINT UNSIGNED / không NULL / 0 | Tăng cùng transaction khi thêm/sửa/xóa/sắp xếp quy tắc; dùng kiểm lượt xét, không phải nhãn trạng thái trên UI |
| `grade_publish_conf_grade_items` | `red_score_display_type` | TINYINT UNSIGNED / không NULL / 0 | 0: không hiệu ứng; 1: ngoặc; 2: `*` trước; 3: `*` sau. Dòng cũ mặc định 0 để giữ hiển thị hiện hữu |

Hiệu ứng công khai lưu theo `grade_publish_conf_id + year + evaluate_item_id + tangen_flg`. `tangen_flg` phân biệt điểm thường/đơn vị, **không phải ID của một đơn vị cụ thể**. Phải giữ giá trị qua lưu, đọc lại, sao chép và đầu ra web/PDF.

JSON trích xuất sử dụng các khóa theo thiết kế hiện hành: `use_target_extract`, `use_prefix_mark`, `prefix_mark`, `use_suffix_mark`, `suffix_mark`, `use_cell_coloring`, `cell_color`. Tùy chọn phiếu đi theo luồng lưu bảng hiện có bằng Cập nhật（更新する） sau khi hoàn tất hộp thoại.

### Tính nhất quán khi cập nhật

- Điểm cuối và kết quả xét phải nhất quán ở thời điểm công bố lưu thành công.
- Thế hệ ô, phiên bản lượt ghi và phiên bản quy tắc giúp loại kết quả của lượt cũ; không chỉ dựa vào thời gian hoàn tất.
- Xóa/tạo lại ô có thế hệ mới, kể cả khi nhập lại cùng số điểm. Sửa quy tắc giữ kết quả trước trong lúc chờ xét lại.
- Không vô hiệu hóa kết quả trước chỉ vì đã có lượt mới đang chờ. Lỗi lưu không tự biến thành trạng thái nghiệp vụ chưa xét được.
- Chi tiết giao dịch và thứ tự khóa nằm trong [thiết kế DB, mục 6](database-design.vi.md#6-phương-thức-xử-lý-cập-nhật-đồng-thời); không đưa cơ chế này thành control của màn hình.

<a id="db-settings"></a>
## 13 — Định nghĩa dữ liệu quy tắc

**Bảng:** `red_score_settings`. Một dòng tương ứng một quy tắc của một mục trên khung đánh giá.

| Cột | Kiểu dữ liệu | Cho phép NULL | Mặc định | Ý nghĩa |
| --- | --- | --- | --- | --- |
| `id` | BIGINT UNSIGNED | Không | Tự tăng | Định danh quy tắc |
| `school_id` | INT UNSIGNED | Không | — | Trường sở hữu |
| `year` | INT UNSIGNED | Không | — | Năm học |
| `evaluate_frame_item_id` | CHAR(32) | Không | — | Mục thuộc khung đánh giá |
| `setting_name` | VARCHAR(255) | Không | — | Tên quy tắc, không dùng làm khóa |
| `sort_no` | INT UNSIGNED | Không | — | Thứ tự từ 1; số nhỏ xét trước |
| `compare_type` | TINYINT UNSIGNED | Không | — | 1: nhỏ hơn; 2: nhỏ hơn hoặc bằng |
| `threshold_type` | TINYINT UNSIGNED | Không | — | 1: cố định; 2: tỷ lệ maximum; 3: công thức |
| `threshold_value` | DECIMAL(9,3) | Có | NULL | Ngưỡng cố định hoặc phần trăm; NULL nếu chưa nhập hoặc dùng công thức |
| `apply_condition` | TEXT | Có | NULL | JSON điều kiện; SQL NULL nghĩa toàn bộ đối tượng trong phạm vi mục |
| `period_id` | INT UNSIGNED | Có | NULL | Học kỳ nguồn trung bình của công thức |
| `term_id` | INT UNSIGNED | Có | NULL | Thời điểm nguồn trung bình của công thức |
| `grade_calc_conf_id` | CHAR(32) | Có | NULL | Cấu hình tổng hợp của nguồn công thức |
| `population_type` | TINYINT UNSIGNED | Có | NULL | Loại nhóm nguồn công thức, theo bảng bên dưới |
| `population_ref_id` | CHAR(32) | Có | NULL | ID cấu hình nhóm đối với loại 3/4/6 |
| `formula` | TEXT | Có | NULL | JSON các dòng phép tính và phần lẻ từng dòng |
| `round_flg` | TINYINT UNSIGNED | Có | NULL | 0/1: không/có xử lý phần lẻ của loại tỷ lệ maximum |
| `round_type` | TINYINT UNSIGNED | Có | NULL | 1: gần nhất; 2: lên; 3: xuống |
| `round_digits` | TINYINT UNSIGNED | Có | NULL | Vị trí p từ 1–9, kết quả còn p−1 chữ số lẻ |
| `setting_status` | TINYINT UNSIGNED | Không | 0 | 0: đang thiết lập/vô hiệu; 1: hoàn chỉnh, có hiệu lực; 2: đã xóa |
| `created_at` | TIMESTAMP | Không | CURRENT_TIMESTAMP | Thời điểm tạo |
| `created` | INT | Không | — | Người tạo theo cơ chế hiện có |
| `updated_at` | TIMESTAMP | Có | NULL | Thời điểm cập nhật gần nhất |
| `updated` | INT | Có | NULL | Người cập nhật gần nhất |

Mã số là phương án lưu kỹ thuật. Danh sách lấy trạng thái 0/1; bộ xét chỉ lấy 1. Không kiểm trạng thái bằng “khác 0” vì mã 2 là đã xóa. Khi lưu dở, giữ loại/dấu đang chọn và giá trị chưa nhập là NULL. Không có cột `active` hoặc `deleted_at` trong phương án bảng mới này.

### Dữ liệu dùng theo loại ngưỡng

| Loại | Giá trị ngưỡng | Nguồn của công thức | Công thức | Phần lẻ cấp quy tắc |
| --- | --- | --- | --- | --- |
| Cố định | Bắt buộc khi hoàn tất ngưỡng | NULL | NULL | NULL |
| Tỷ lệ maximum | Bắt buộc khi hoàn tất ngưỡng | NULL | NULL | `round_flg=0/1`; khi bật cần type/digits |
| Công thức | NULL | Đủ bộ khi dùng trung bình; không dùng thì NULL | Bắt buộc | NULL; phần lẻ nằm trong từng dòng |

Nguồn của **điều kiện áp dụng** nằm trong `apply_condition`, không thay thế nguồn công thức ở các cột trên. Vì thế quy tắc cố định vẫn có thể phụ thuộc tổng hợp nếu điều kiện dùng trung bình/tỷ lệ nhóm.

### Cấu trúc điều kiện và công thức

| Nội dung | Thành phần chính | Quy tắc |
| --- | --- | --- |
| Bộ lọc thường trong `apply_condition.filters` | Loại, các giá trị và khóa điều kiện nếu loại yêu cầu | OR cùng loại, AND khác loại; giữ khóa đi cùng từng giá trị, bỏ trùng phù hợp |
| `apply_condition.aggregate_conditions` | Đại lượng average/group_rate, dấu lt/lte/gte/gt, mốc số và bộ nguồn | Các dòng AND với nhau và với bộ lọc; mốc tỷ lệ 0–100 |
| Bộ nguồn | `period_id`, `term_id`, `grade_calc_conf_id`, `population_type`, `population_ref_id` | Cùng cấu trúc được dùng ở điều kiện và công thức nhưng lưu độc lập |
| Các dòng trong `formula` | Toán hạng trái/phải, phép toán, tham chiếu dòng trước và cấu hình phần lẻ | Dòng sau nhận kết quả dòng trước sau xử lý; không tham chiếu vòng/dòng sau |

SQL NULL của điều kiện nghĩa toàn phạm vi; JSON null, chuỗi/object rỗng hoặc cả hai danh sách điều kiện rỗng không được dùng để bỏ qua validation. Mỗi cột TEXT giới hạn thiết kế 60.000 byte UTF-8; số thập phân trong JSON lưu bằng chuỗi để giữ giá trị. Không tự thực thi chuỗi dữ liệu như mã.

| `population_type` | Nhóm | `population_ref_id` |
| --- | --- | --- |
| 1 | Khối của học sinh trong năm | NULL |
| 2 | Lớp chủ nhiệm của học sinh trong năm | NULL |
| 3 | Nhóm tổng hợp | `grade_calc_groups.id` |
| 4 | Tổ hợp nhóm | `grade_calc_group_combos.id` |
| 5 | Lớp học phần của ô đang xét | NULL; lớp thực lấy theo ô |
| 6 | Nhóm môn học | `grade_calc_group_sub_subjects.id`; giữ ID đã chọn và phân giải nhóm thực tế |

**Chỉ mục:** khóa chính `id`; chỉ mục đọc danh sách `(school_id, year, evaluate_frame_item_id, setting_status, sort_no)`. Thứ tự đọc xác định theo `sort_no, id`. Xóa mềm không tái sử dụng ID cho quy tắc khác.

<a id="db-results"></a>
## 14 — Định nghĩa dữ liệu kết quả

**Bảng:** `red_score_results`. Một dòng cho một ô hiện hành, đồng thời giữ dữ liệu kiểm soát cập nhật.

| Cột | Kiểu dữ liệu | Cho phép NULL | Mặc định | Ý nghĩa |
| --- | --- | --- | --- | --- |
| `id` | BIGINT UNSIGNED | Không | Tự tăng | Định danh dòng |
| `school_id` | INT UNSIGNED | Không | — | Trường của ô điểm |
| `year` | INT UNSIGNED | Không | — | Năm học |
| `evaluate_frame_item_id` | CHAR(32) | Không | — | Mục thuộc khung đánh giá |
| `group_id` | INT UNSIGNED | Không | — | Lớp học phần |
| `student_id` | INT UNSIGNED | Không | — | Học sinh |
| `tangen_id` | INT UNSIGNED | Không | 0 | Đơn vị bài học; 0 với điểm thường |
| `cell_generation` | CHAR(32) | Không | — | Định danh thế hệ ô, đổi khi xóa/tạo lại |
| `write_version` | BIGINT UNSIGNED | Không | 0 | Phiên bản đặt chỗ/ghi mới nhất |
| `judged_version` | BIGINT UNSIGNED | Có | NULL | Phiên bản của kết quả đã lưu gần nhất |
| `rule_revision` | BIGINT UNSIGNED | Có | NULL | Phiên bản danh sách quy tắc đã dùng |
| `red_score_setting_id` | BIGINT UNSIGNED | Có | NULL | Quy tắc được chọn trong lần xét |
| `judgment_status` | TINYINT UNSIGNED | Có | NULL | Trạng thái hoàn tất theo bảng dưới |
| `is_red` | TINYINT UNSIGNED | Có | NULL | 1 đỏ, 0 không đỏ khi xét thành công; NULL khi chưa có kết luận |
| `reason_code` | VARCHAR(32) | Có | NULL | Nguyên nhân của trạng thái không có kết luận |
| `judgment_context` | TEXT | Có | NULL | Điểm, ngưỡng, dấu và nguồn thực sự đã dùng |
| `judged_at` | DATETIME | Có | NULL | Thời điểm hoàn tất kết quả đã lưu |
| `created_at` | TIMESTAMP | Không | CURRENT_TIMESTAMP | Thời điểm tạo dòng |
| `created` | INT | Không | — | Người tạo |
| `updated_at` | TIMESTAMP | Có | NULL | Thời điểm cập nhật dòng |
| `updated` | INT | Có | NULL | Người cập nhật |

### Mã kết quả

| Nghiệp vụ | `judgment_status` | `is_red` | Quy tắc được chọn | Nguyên nhân |
| --- | --- | --- | --- | --- |
| Chưa từng xét | Không có dòng, hoặc NULL trên dòng mới đặt chỗ | NULL | NULL | NULL |
| Đỏ | 1 | 1 | Bắt buộc | NULL |
| Không đỏ | 1 | 0 | Bắt buộc | NULL |
| Chưa xét được | 2 | NULL | Có nếu đã chọn được | Bắt buộc |
| Không áp dụng | 3 | NULL | NULL | `no_applicable_rule` |
| Không có điểm | 4 | NULL | NULL | `no_score` |

Chỉ ô còn điểm hợp lệ có `judgment_status=1` và `is_red=1` đóng góp dấu/lọc đỏ. Có dòng điều khiển chưa chứng minh đã xét. `is_red=NULL` khác không đỏ. Không thêm mã “chờ chạy lại” để làm mất kết quả trước.

Các mã cho chưa xét được: `source_missing` (thiếu nguồn), `source_invalid` (nguồn không hợp lệ), `membership_missing` (không xác định nhóm), `membership_ambiguous` (nhóm mâu thuẫn), `maximum_invalid`, `condition_invalid`, `formula_invalid`, `division_by_zero`, `numeric_overflow`. Giao diện giải thích bằng ngôn ngữ nghiệp vụ, không hiển thị lỗi SQL.

### Thông tin giải thích kết quả

| Nội dung trong `judgment_context` | Mục đích |
| --- | --- |
| `score`, `grade_id` | Giữ điểm và định danh bản ghi điểm thực sự đã dùng |
| `threshold`, `compare_type` | Ngưỡng và dấu của lần xét; ngưỡng lưu dạng tử/mẫu số nguyên rút gọn để giữ độ chính xác |
| `maximum` | Maximum thực sự dùng cho loại tỷ lệ; không dùng thì NULL |
| `sources` | Các nguồn dùng ở điều kiện, công thức hoặc cả hai; bản chốt/mới nhất, định danh bản nguồn và đầy đủ phạm vi |
| Nhóm môn đã phân giải | Giữ cả ID nhóm môn đã chọn và loại/nhóm thực tế được đọc; không ghi đè lựa chọn gốc |

Trạng thái xét thành công bắt buộc có điểm, ngưỡng và dấu. Chưa xét được giữ phần thông tin đã xác định. Không áp dụng/không có điểm không giữ ngưỡng hay nguồn cũ không còn được dùng. Không lưu toàn bộ danh sách học sinh nguồn, thông tin liên hệ hoặc toàn bộ lịch sử trong trường này.

**Khóa/chỉ mục:** khóa chính `id`; unique key theo sáu trường nhận diện ô tại [tab 12](#db-overview); chỉ mục đọc `(school_id, year, group_id, student_id)`. Kết quả phải được ghi nhất quán, không nhân đôi sau chạy lại hoặc gửi lại yêu cầu hoàn tất.

### Tài liệu kỹ thuật tham khảo

- [Thiết kế DB đầy đủ](database-design.vi.md) và [DDL](database-design.sql).
- [Đặc tả chức năng](specification.vi.md).
- [Tiêu chí nghiệm thu](acceptance-criteria.vi.md).
- [Chia công việc](split-tasks.vi.md).

Các tài liệu kỹ thuật bổ sung chi tiết lưu trữ và kiểm chứng. Có thể đọc độc lập các màn hình và ví dụ trong tài liệu này để hiểu hành vi nghiệp vụ.
