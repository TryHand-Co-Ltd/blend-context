# Đặc tả chức năng điểm đỏ（赤点）

**Phiên bản:** 1.1 — 25/09/2026, cập nhật xác nhận Q3.  
**Đối tượng đọc:** thành viên phát triển, thiết kế, kiểm thử và người phụ trách nghiệp vụ BLEND.  
**Phạm vi tài liệu:** đặc tả chức năng đầy đủ, gồm màn hình, quy tắc tính, vòng đời kết quả, đầu ra và yêu cầu tích hợp. Có thể chuyển riêng file này cho team; không cần tài liệu nội bộ khác để hiểu các quy tắc.

**Cơ sở áp dụng:** các yêu cầu và Q&A đã xác nhận đến ngày 25/09/2026, gồm phản hồi Q3 bổ sung do người phụ trách cung cấp trong phiên: dùng kết quả tổng hợp thứ hạng hiện có; không xử lý riêng hoặc ngăn cấu hình khác điểm tối đa giữa các lớp trong cùng nhóm, nhưng tình huống đó không được gây lỗi làm dừng xử lý. Q3 đã đóng theo hướng kế thừa kết quả hiện hữu, không còn chờ chọn A/B.

**Thiết kế giao diện:** dùng trang **Japanese Design** của [Figma tiếng Nhật — luồng tổng thể và thiết kế chi tiết ngày 25/09](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-1631). Tên UI tiếng Nhật trong tài liệu là nhãn để đối chiếu; phần giải thích và yêu cầu viết bằng tiếng Việt. Các giá trị mẫu trên Figma không tự trở thành giá trị mặc định của sản phẩm.

Bản Figma tiếng Nhật đã đồng bộ Q3 theo mục 5.3: bỏ chú thích giả định Q3-A và ví dụ trộn điểm tối đa; các màn được xếp ngang, đánh dấu thao tác và nối luồng. Bản Việt còn theo bố cục cũ và chưa đồng bộ Q3 ở lượt này.

**Trạng thái bàn giao:** dùng để review thiết kế toàn feature. Phạm vi triển khai/phát hành cần thống nhất riêng; tài liệu không xác nhận chức năng đã được xây dựng hoặc kiểm thử thành công. Những lựa chọn bổ sung để cụ thể hóa màn hình và tích hợp được ghi **Đề xuất thiết kế** tại nơi áp dụng.

## Mục lục

1. [Mục tiêu, phạm vi và quyền sử dụng](#scope)
2. [Khái niệm và dữ liệu dùng để xét](#concepts)
3. [Bản đồ màn hình và luồng thao tác](#screens)
4. [Danh sách thiết lập và thứ tự ưu tiên](#configuration)
5. [Điều kiện áp dụng và nguồn tham chiếu](#conditions)
6. [Ngưỡng điểm, công thức và xử lý phần lẻ](#thresholds)
7. [Quy trình xét và thời điểm cập nhật](#execution)
8. [Trạng thái kết quả và xử lý lỗi](#states)
9. [Trích xuất thành tích](#extraction)
10. [Công khai thành tích](#publication)
11. [Công cụ phiếu điểm và PDF](#report-card)
12. [Dữ liệu, tích hợp và bảo toàn chức năng cũ](#integration)
13. [Điểm cần chốt khi triển khai và nguồn tham chiếu](#delivery)

<a id="scope"></a>

## 1. Mục tiêu, phạm vi và quyền sử dụng

### 1.1. Mục tiêu

Người được sửa mục đánh giá có thể đặt một hoặc nhiều điều kiện để xác định điểm đỏ. Hệ thống xét **điểm cuối đã lưu của từng ô**, lưu một kết quả dùng chung và sử dụng kết quả đó tại:

- **Trích xuất thành tích（成績抽出）:** lọc học sinh và đánh dấu các ô đỏ theo thiết lập xuất.
- **Công khai thành tích（成績公開）:** thể hiện dấu đỏ trong phạm vi điểm được phép công khai.
- **Công cụ phiếu điểm（通知表ツール）:** áp dụng điều kiện trình bày điểm đỏ khi tạo phiếu/PDF.

Kết quả xét chỉ trả lời ô điểm có thỏa điều kiện đỏ đang áp dụng hay không. Nó không thay điểm số, không quyết định toàn bộ việc lên lớp/đạt môn và không tự thay quy tắc xếp hạng.

### 1.2. Phạm vi thiết kế

| Hạng mục | Nội dung |
| --- | --- |
| Kiểu dữ liệu | Nhập số nguyên（数値入力（整数））, Nhập số thập phân（数値入力（小数）） và mục điểm số theo đơn vị bài học |
| Cấu hình | Nhiều thiết lập cho một mục; tên, thứ tự ưu tiên, điều kiện áp dụng và ngưỡng riêng |
| Loại ngưỡng | Điểm cố định; tỷ lệ điểm tối đa hiện hành; công thức dùng trung bình |
| Phân nhánh | Theo đối tượng và bộ lọc; bổ sung điều kiện trung bình hoặc tỷ lệ nhóm |
| Công thức | Cộng, trừ, nhân, chia; trung bình tham chiếu, số cố định/hệ số, kết quả dòng trước; xử lý phần lẻ theo dòng |
| So sánh cuối | Nhỏ hơn（未満） hoặc Nhỏ hơn hoặc bằng（以下） |
| Thời điểm xét | Sau xử lý đăng ký/cập nhật điểm và trong luồng tính toán hàng loạt được hỗ trợ |
| Đầu ra | Ba đầu ra trên cùng đọc kết quả đã lưu; cấu hình trình bày riêng |
| Vòng đời | Sửa/xóa thiết lập, sửa/xóa điểm, thay nguồn, chạy lại, thiếu dữ liệu, sao chép và thay năm theo phạm vi tích hợp |

**Ngoài phạm vi:** xét trực tiếp kiểu lựa chọn A/B/C hoặc Đạt/không đạt（合否）; ngôn ngữ công thức tự do, script, hàm tùy ý hoặc hệ thống biến mới; phân phối xếp loại/top %/đồng hạng; chuyển đổi ngưỡng đỏ cũ; quản lý hoàn tất nhập điểm tất cả môn; chặn phát hành chỉ vì thiếu kết quả đỏ; lưu cố định toàn bộ phiếu đã phát hành; tự lặp tính điểm–tổng hợp cho đến khi hội tụ.

Loại điểm A/B/C không được xét đỏ trực tiếp, nhưng **bộ lọc theo lựa chọn hiện có vẫn được dùng** để xác định đối tượng áp dụng của một mục điểm số.

### 1.3. Quyền sử dụng

| Thao tác | Điều kiện quyền |
| --- | --- |
| Xem/sửa thiết lập đỏ của một mục | Có quyền truy cập chức năng thiết lập tương ứng và quyền xem/sửa đúng mục đó; giáo viên thường được sử dụng nếu thỏa các quyền này |
| Thêm, đổi thứ tự, sửa điều kiện/ngưỡng, xóa | Kiểm quyền sửa mục ở cả màn hình và yêu cầu lưu; có quyền vào màn hình không đồng nghĩa sửa mọi mục |
| Đăng ký/sửa điểm | Giữ quyền lớp, môn, học sinh, kỳ/thời điểm và phạm vi đăng ký điểm hiện có |
| Chạy tính toán hàng loạt | Giữ quyền thực thi hiện hành và phạm vi được phép; quyền sửa một mục không tự cấp quyền chạy cho cả khối/trường |
| Trích xuất, thiết lập công khai, thiết kế phiếu | Giữ quyền riêng của từng chức năng |
| Học sinh/phụ huynh xem kết quả | Chỉ dữ liệu được phép xem của đúng học sinh, đúng trường/năm và lịch công khai; không có quyền sửa điều kiện đỏ |

Không mở quyền qua việc đổi ID trong URL hoặc dữ liệu gửi lên. Nguồn tổng hợp, mục đánh giá, lớp và đơn vị được chọn phải thuộc ngữ cảnh mà người thao tác được phép sử dụng.

### 1.4. Ranh giới giữa thiết kế đầy đủ và phạm vi triển khai

**Các loại ngưỡng và công thức trong tài liệu được mô tả đầy đủ để thiết kế. Khi triển khai, chỉ làm các loại đã chốt yêu cầu nghiệp vụ và được xác nhận nằm trong phạm vi triển khai của đợt đó.** Có công thức/ví dụ trên spec hoặc Figma không tự có nghĩa phải implement công thức đó. Việc đã xác nhận một quy tắc tính cũng không tự đưa cả nhóm chức năng vào bản phát hành.

| Nhóm | Phạm vi thiết kế trong spec | Giới hạn triển khai hiện tại |
| --- | --- | --- |
| Điểm cố định `T=N` | Mô tả đầy đủ ngưỡng và dấu so sánh | Là mức tối thiểu đã trao đổi; phạm vi trường, luồng và đợt triển khai vẫn phải được thống nhất |
| Tỷ lệ maximum `T=M×N/100` | Mô tả đầy đủ maximum hiện hành và tùy chọn phần lẻ | Quy tắc nghiệp vụ đã chốt; chỉ triển khai trong đợt được chọn bao gồm loại này, chưa mặc định thuộc đợt đầu |
| Công thức trung bình và phân nhánh theo trung bình | Thiết kế đủ phép cộng/trừ/nhân/chia, tham chiếu dòng và xử lý phần lẻ; các ví dụ minh họa khả năng cần biểu diễn | Đã xác nhận hướng thiết kế; chưa có danh sách công thức được duyệt triển khai cho đợt đầu. Có thể để giai đoạn sau; không coi mọi tổ hợp toán hạng/phép toán là phạm vi implement đã chốt |
| Phân nhánh theo tỷ lệ nhóm | Kế thừa kết quả tổng hợp thứ hạng hiện có theo xác nhận Q3 | Đã chốt hướng nghiệp vụ; còn xác minh nguồn/độ chính xác và chọn đợt triển khai. Quy tắc có điều kiện áp dụng dùng tỷ lệ nhóm cũng cần nguồn này, kể cả ngưỡng phía sau là cố định |

Trước khi bắt đầu phần triển khai tương ứng, ghi rõ danh sách loại ngưỡng/công thức và điều kiện áp dụng được chọn cho đợt đó. Phần chưa được chọn giữ ở phạm vi thiết kế, không hiển thị như lựa chọn đang hoạt động trong sản phẩm. Mỗi phần được triển khai vẫn phải hoàn chỉnh từ thiết lập → xét → kết quả chung → ba đầu ra tương ứng; không bỏ các quy tắc quyền, trạng thái hoặc bảo toàn dữ liệu đã chốt.

<a id="concepts"></a>

## 2. Khái niệm và dữ liệu dùng để xét

### 2.1. Các đại lượng

| Ký hiệu | Ý nghĩa | Quy tắc |
| --- | --- | --- |
| `S` | Điểm số của học sinh | Giá trị cuối cùng đã được xử lý và lưu hợp lệ cho đúng ô điểm |
| `M` | Điểm tối đa có hiệu lực | Giá trị hiện hành của đúng mục, lớp, kỳ/thời điểm và đơn vị tại lần xét |
| `A` | Trung bình điểm của nhóm tham chiếu | Giá trị trước làm tròn của đúng kết quả tổng hợp đã chọn |
| `R` | Tỷ lệ điểm của nhóm tham chiếu | Kế thừa kết quả tổng hợp thứ hạng hiện có; cách tổng hợp đã được ghi nhận là `tổng điểm / tổng điểm tối đa × 100`, từ cùng một bản tổng hợp và tập dữ liệu; xem mục 5.3 về độ chính xác |
| `N`, `k` | Số do người thiết lập nhập | Ngưỡng cố định, tỷ lệ hoặc số/hệ số trong công thức; miền hợp lệ tùy vai trò |
| `T` | Ngưỡng xét cuối | Kết quả sau phép tính và các bước xử lý phần lẻ đã chọn |

Trong các công thức/ví dụ, dấu chấm biểu thị phần thập phân. `A=49.99` là trung bình 49 phẩy 99; `R=65` là tỷ lệ 65%.

### 2.2. Một ô điểm được nhận diện như thế nào?

Một kết quả thuộc **đúng học sinh + trường + năm học + lớp học phần/môn + mục đánh giá + kỳ/thời điểm + đơn vị bài học nếu có**. Dữ liệu kỹ thuật phải giữ đủ các chiều này hoặc liên kết đến bản ghi có đầy đủ các chiều tương đương.

Không ghép kết quả theo tên mục hiển thị, số thứ tự cột hoặc chỉ học sinh/môn. Hai đơn vị dùng cùng một mục đánh giá vẫn là hai ô khác nhau. Khi một bản ghi bị xóa/tái tạo, kết quả cũ không được gắn nhầm vào ô mới.

### 2.3. Điểm được đưa vào xét

- Dùng điểm sau xử lý tính toán, giới hạn miền điểm và các cập nhật liên quan. Nếu phép tính trung gian cho `120` nhưng điểm hợp lệ lưu là `100`, xét `S=100`.
- Điểm sửa tay vẫn được xét. Ví dụ sửa `28` thành `35` thì dùng `35`, kể cả bộ tính điểm tự động bỏ qua ô sửa tay để tránh ghi đè.
- Điểm dự kiến（見込点） có giá trị số vẫn được xét. Trạng thái dự kiến và kết quả đỏ là hai thông tin độc lập.
- Cờ Chưa dự thi（未受験） không tự loại một giá trị số khỏi xét đỏ. Việc loại khỏi thứ hạng là quy tắc khác.
- `0` hợp lệ là số. Ô trống, `NULL` hoặc điểm không còn hoạt động không được biến thành `0`.
- Không yêu cầu mục đánh giá phải có công thức AutoRating mới được xét đỏ. AutoRating là cơ chế tính điểm tự động hiện có; bước xét đỏ phải bao phủ cả điểm nhập trực tiếp.

### 2.4. Phân giải điểm tối đa

Áp dụng cấu hình có hiệu lực theo thứ tự: **mức mặc định của mục/kỳ → mức riêng của đơn vị bài học nếu có → mức ghi đè từ lựa chọn lớp nếu thực sự áp dụng**. Mức sau thay mức trước khi đủ điều kiện.

Ví dụ: mặc định `100`, đơn vị `40`, lựa chọn lớp hợp lệ ghi đè `50` thì dùng `M=50`; không có lựa chọn lớp thì dùng `40`. Không có hàng ngoại lệ của đơn vị có thể nghĩa là dùng mức chuẩn, không tự kết luận thiếu dữ liệu.

Tạo một định nghĩa lựa chọn maximum chưa làm lớp sử dụng lựa chọn đó. Mã lựa chọn `1` hoặc `2` không phải maximum 1 hoặc 2 điểm. Không dùng điểm cao nhất thực tế trong nhóm, tổng maximum của nhóm hoặc mặc định `100` thay cho `M` cá nhân.

**Phân biệt thời điểm dữ liệu:** tỷ lệ điểm tối đa độc lập dùng `M` hiện hành. Trung bình và tỷ lệ nhóm dùng dữ liệu của bản tổng hợp được chọn, có ưu tiên bản chốt. Không lấy `M` hiện hành ghép vào tổng điểm của bản chốt để tính lại tỷ lệ nhóm.

<a id="screens"></a>

## 3. Bản đồ màn hình và luồng thao tác

Các liên kết Figma dưới đây thuộc **bản vẽ tiếng Nhật**: 01–04 ở hàng trên, ba đầu ra 05–07 ở hàng dưới. Khung đánh dấu nút/link và mũi tên thể hiện thao tác; các hình A/B/C trong cùng cụm là trạng thái của một màn, không phải bước chuyển màn.

| Màn/khu vực | Vai trò | Figma tiếng Nhật |
| --- | --- | --- |
| Thiết lập ô nhập（入力欄設定） | Điểm vào cấu hình đỏ của mục | [01 — Điểm vào và danh sách](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-2) |
| Thiết lập điểm đỏ（赤点設定） | Danh sách, thêm/xóa, ưu tiên, mở hai màn chi tiết | [01 — Danh sách và trạng thái xóa](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-2) |
| Điều kiện áp dụng（適用条件） | Chọn đối tượng và điều kiện phân nhánh; hai hình chính là trạng thái khác nhau của cùng form | [02 — Điều kiện và nguồn tham chiếu](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-1663) |
| Thiết lập ngưỡng（基準設定） | Chọn loại ngưỡng, công thức, phần lẻ và dấu so sánh; ba hình chính là trạng thái khác nhau của cùng form | [03 — Ngưỡng và công thức](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-1885) |
| Thiết lập tổng hợp thứ hạng（順位集計設定） | Cấu hình vận hành khi dùng đánh giá tương đối | [04 — Vận hành và kết quả](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-2423) |
| Tổng hợp thành tích（成績集計） | Tổng hợp nguồn rồi chạy tính toán/xét | [04 — Vận hành và kết quả](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-2423) |
| Trích xuất thành tích（成績抽出） | Chọn cách đánh dấu/lọc và xem/xuất kết quả | [05 — Thiết lập và đầu ra](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-2559) |
| Thiết lập công khai thành tích（成績公開設定） | Chọn cách hiển thị đỏ | [06 — Công khai và màn học sinh](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-2689) |
| Xác nhận thành tích（成績確認） | Học sinh xem kết quả được công khai | [06 — Công khai và màn học sinh](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-2689) |
| Công cụ phiếu điểm（通知表ツール） | Chọn điều kiện hiển thị, lưu bảng và xuất PDF | [07 — Tùy chọn và PDF](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-2732) |

**Luồng chuẩn:** mở mục điểm số → danh sách thiết lập đỏ. Từ danh sách, mở màn điều kiện áp dụng hoặc màn ngưỡng tương ứng; sau khi lưu quay lại danh sách. Đăng ký điểm hoặc chạy tính toán phù hợp để xét, rồi đọc cùng kết quả có hiệu lực trên ba đầu ra.

Không có radio chọn chế độ xét thủ công/tự động riêng. Không có radio chọn bỏ qua bản chốt để luôn dùng nguồn mới nhất. Lưu cấu hình và hoàn tất xét là hai sự kiện khác nhau.

<a id="configuration"></a>

## 4. Danh sách thiết lập và thứ tự ưu tiên

### 4.1. Điểm vào và trạng thái trống

Từ [Thiết lập nhập điểm（成績入力設定）](https://ad31.schoolstg.mwsite.work/admin/grade_report_setting/manage), người dùng vào Thiết lập ô nhập（入力欄設定）, chọn mục điểm số và mở Thiết lập điểm đỏ（赤点設定）.

Màn danh sách luôn cho biết mục, kiểu điểm và phạm vi kỳ/thời điểm đang cấu hình. Với mục không thuộc loại số, không cung cấp thao tác tạo quy tắc đỏ có hiệu lực.

Khi chưa có thiết lập, hiển thị trạng thái chưa thiết lập và thao tác thêm. Không tự dựng điều kiện từ ngưỡng đỏ cũ; cũng không tự tạo quy tắc mặc định dưới 30. Nếu vừa xóa thiết lập cuối, danh sách trống **không có nghĩa kết quả cũ đã hết hiệu lực**; cần thông báo về lần chạy lại.

### 4.2. Nội dung một dòng

| Thành phần | Nội dung |
| --- | --- |
| Tên thiết lập（設定名称） | Tên giúp người dùng phân biệt các quy tắc, ví dụ “Trung bình từ 60 trở lên” |
| Ưu tiên（優先順位） | Thứ tự xét từ trên xuống; thứ tự đã lưu phải giữ nguyên khi mở lại |
| Điều kiện áp dụng | Tóm tắt phạm vi, bộ lọc và điều kiện trung bình/tỷ lệ nếu có; mở màn sửa điều kiện |
| Ngưỡng | Loại, tham số/công thức, dấu so sánh và xử lý phần lẻ; mở màn sửa ngưỡng |
| Thao tác | Thêm, xóa và thay đổi thứ tự theo điều khiển trên bản vẽ |

Tên chỉ để nhận biết, không dùng làm khóa liên kết dữ liệu. Tóm tắt phải phản ánh dữ liệu đã lưu, không dựng từ input của lần sửa chưa hoàn tất.

### 4.3. Chọn quy tắc

1. Xét các quy tắc theo thứ tự ưu tiên đã lưu.
2. Kiểm đối tượng và điều kiện áp dụng.
3. Quy tắc đầu tiên xác định là khớp được chọn; sau đó mới tính ngưỡng của quy tắc đó.
4. Khi đã chọn, không xét quy tắc phía dưới dù công thức của quy tắc đã chọn thiếu dữ liệu hoặc chia cho 0.
5. Khi đủ thông tin và tất cả quy tắc đều không khớp, kết quả là **không áp dụng**.

Nếu chưa xác định được điều kiện trung bình/tỷ lệ của một quy tắc có khả năng áp dụng, không được coi thiếu dữ liệu là điều kiện sai rồi chuyển xuống quy tắc thấp hơn. Nếu bộ lọc không phụ thuộc trung bình đã đủ chứng minh quy tắc không áp dụng, có thể bỏ qua quy tắc đó mà không cần đọc nguồn trung bình của nó.

Ví dụ hai quy tắc đều áp dụng cho một học sinh: ưu tiên 1 có ngưỡng 20, ưu tiên 2 có ngưỡng 30. Với `S=25` và dấu `<`, chọn ưu tiên 1 và kết luận không đỏ; không lấy ngưỡng nghiêm ngặt hơn là 30.

### 4.4. Lưu, đổi thứ tự và xóa

- Lưu thành công cập nhật cấu hình; không tự báo “đã cập nhật điểm đỏ của học sinh”. Hướng dẫn người dùng đăng ký/chạy lại theo [mục 7](#execution).
- Đổi thứ tự có thể đổi quy tắc được chọn. Thứ tự mới chỉ ảnh hưởng kết quả sau lần xét tiếp theo.
- Khi xóa, nêu rõ thiết lập sẽ bị xóa và kết quả học sinh chỉ được cập nhật ở lần xét tiếp theo. Hủy thao tác giữ nguyên thiết lập.
- Xóa thiết lập cuối cùng vẫn giữ kết quả trước cho đến lần đăng ký điểm hoặc tính toán hàng loạt tiếp theo. Lượt đó phải xét cả mục đã hết quy tắc để ngừng dùng kết quả cũ.
- Quay lại/hủy chỉnh sửa không ghi cấu hình đang nhập. Lưu lỗi không làm mất cấu hình đã lưu thành công trước đó và không làm đổi kết quả xét.

**Đề xuất thiết kế cho thao tác thêm:** quy tắc mới đặt sau các quy tắc đã có; chỉ đưa vào danh sách có hiệu lực sau khi có đủ điều kiện và ngưỡng hợp lệ. Nếu luồng hai màn cần lưu trung gian, phần đang thiếu ngưỡng không được tham gia chọn ưu tiên như một quy tắc hoàn chỉnh. Không tạo ngưỡng `0` ngầm để hoàn thành bản ghi.

<a id="conditions"></a>

## 5. Điều kiện áp dụng và nguồn tham chiếu

### 5.1. Đối tượng áp dụng

Màn Điều kiện áp dụng（適用条件） có tên thiết lập, lựa chọn áp dụng cho toàn bộ đối tượng trong phạm vi mục hoặc giới hạn bằng bộ lọc. “Toàn bộ” không mở rộng ra ngoài trường, năm, mục và phạm vi người dùng được phép cấu hình.

Kế thừa các bộ lọc phù hợp của màn tính tự động: giáo khoa/môn, khối, lớp/nhóm và các điều kiện lựa chọn đang được hỗ trợ. Không mở thêm toàn bộ loại lọc chỉ vì engine có mã xử lý.

**Cách kết hợp:** nhiều giá trị trong cùng một loại lọc dùng **HOẶC**; giữa các loại lọc dùng **VÀ**. Ví dụ chọn khối 1 hoặc 2 và nhóm nâng cao nghĩa là học sinh thuộc một trong hai khối, đồng thời thuộc nhóm nâng cao. Không thêm trình soạn AND/OR lồng nhau.

**Đề xuất thiết kế:** khi bật giới hạn đối tượng nhưng chưa chọn bộ lọc có nội dung hợp lệ, báo lỗi thay vì tự hiểu là tất cả. Đổi trường nguồn ở cấp trên phải bỏ lựa chọn phụ thuộc không còn hợp lệ; không tự chọn một nguồn khác để làm form hợp lệ.

### 5.2. Điều kiện dựa trên trung bình

Cho phép thêm điều kiện về Trung bình điểm（平均点） và một mốc so sánh. Dùng `A` trước làm tròn, không dùng số đã định dạng để hiển thị.

Ví dụ:

| Ưu tiên | Điều kiện áp dụng | Ngưỡng |
| --- | --- | --- |
| 1 | `A ≥ 60` | Cố định `T=30` |
| 2 | `A < 60` | Công thức `T=A×0.5` |

Đây là hai quy tắc độc lập trong danh sách, không phải một form chỉ hỗ trợ đúng hai nhánh. Có thể thêm quy tắc cho đối tượng khác và sắp xếp theo nhu cầu.

**Đề xuất thiết kế cho dấu của điều kiện phân nhánh:** hỗ trợ `<`, `≤`, `≥`, `>` để biểu diễn ranh giới không chồng lấn. Nhãn tương ứng: Nhỏ hơn（未満）, Không lớn hơn（以下）, Từ mức này trở lên（以上）, Lớn hơn（超過）. Dấu ở đây chọn quy tắc; dấu xét điểm đỏ cuối chỉ có `<` hoặc `≤`.

Trung bình thật `49.99` phải đi vào nhánh `<50` dù UI tổng hợp hiện `50`. Việc xử lý phần lẻ trong công thức sau đó không thay đổi nhánh đã chọn.

### 5.3. Tỷ lệ nhóm — kế thừa kết quả tổng hợp thứ hạng hiện có

**Q3 đã xác nhận.** Điều kiện Tỷ lệ điểm của nhóm（集団の得点率） dùng kết quả tổng hợp thứ hạng hiện có của đúng nhóm và bản nguồn. Cách tổng hợp hiện hữu đã được ghi nhận là:

```text
R = Tổng điểm của nhóm trong bản tổng hợp
    ÷ Tổng điểm tối đa tương ứng của cùng tập dữ liệu
    × 100
```

Không xây thêm cách tính trung bình cộng tỷ lệ cá nhân; không dùng `A / M` của học sinh đang xét hoặc tính lại nhóm từ điểm chưa tổng hợp. Công thức trên mô tả cách tổng hợp hiện hữu, không yêu cầu một bộ tổng hợp riêng cho chức năng điểm đỏ.

**Độ chính xác:** giữ yêu cầu dùng `R` trước làm tròn để so với mốc phần trăm. Câu “dùng nguyên kết quả hiện tại” chưa xác nhận thay yêu cầu này bằng số đã làm tròn trên màn hình. Khi thiết kế tích hợp, kiểm tra kết quả nguồn cung cấp giá trị hoặc các thành phần đủ độ chính xác; nếu chưa đủ thì ghi nhận khoảng trống, không tự đổi quy tắc hoặc mở lại lựa chọn A/B.

**Phạm vi vận hành:** khách hàng xác nhận khác điểm tối đa cho cùng mục giữa các lớp không xảy ra trong thực tế ở cùng nhóm tổng hợp; nếu khác chương trình học thì nhóm tổng hợp cũng khác nhau. Không thêm xử lý nghiệp vụ riêng hoặc chức năng ngăn cấu hình này. Nếu vẫn xảy ra, tiếp tục dùng kết quả tổng hợp hiện hữu; riêng sự khác điểm tối đa không được gây lỗi làm dừng xử lý. Các trường hợp thiếu nguồn hoặc dữ liệu không hợp lệ vẫn theo quy tắc chung, không thay dữ liệu thiếu bằng 0 hoặc tự coi là đã đạt.

**Ví dụ:** cùng môn, mục và kỳ; nhóm tham chiếu có hai học sinh với điểm `60/100` và `80/100` trong cùng bản tổng hợp.

| Đại lượng | Kết quả |
| --- | --- |
| Tổng điểm | `60+80=140` |
| Tổng điểm tối đa | `100+100=200` |
| Tỷ lệ nhóm | `140/200×100 = 70%` |
| Điều kiện `R ≥ 65%` | Khớp |

Nếu quy tắc khớp có ngưỡng cố định `70`, học sinh có `S=60` sẽ đỏ khi chọn `<`, học sinh có `S=80` không đỏ. Cả quy tắc vẫn cần nguồn tổng hợp dù loại ngưỡng là cố định, vì **điều kiện chọn quy tắc** sử dụng tỷ lệ nhóm.

Không thêm tùy chọn A/B vào sản phẩm. Ví dụ trộn điểm tối đa 50/100 trước đây không còn là tiêu chí nghiệm thu một cách tính riêng. Việc kiểm tra tình huống này chỉ cần bảo đảm không phát sinh lỗi làm dừng xử lý do khác điểm tối đa. Nguyên tắc hiển thị ở ba đầu ra không đổi.

### 5.4. Bộ thông tin nguồn

Khi điều kiện hoặc công thức cần trung bình/tỷ lệ, người dùng xác định:

| Trường | Ý nghĩa |
| --- | --- |
| Thời kỳ tổng hợp（集計対象時期） | Kỳ/thời điểm của kết quả nguồn |
| Thiết lập tổng hợp thứ hạng（順位集計設定） | Bộ thiết lập đã tạo kết quả tổng hợp |
| Nhóm học sinh được tổng hợp（集計対象（母集団）） | Nhóm tham chiếu, ví dụ nhóm lớp chủ nhiệm được cấu hình |
| Môn, mục đánh giá và đơn vị | Phân giải theo đúng ngữ cảnh ô đang xét; không lấy môn/mục/đơn vị khác chỉ vì có kết quả |

Nhóm tham chiếu và đối tượng áp dụng là hai khái niệm riêng. Ví dụ một quy tắc chỉ áp dụng cho lớp A nhưng tham chiếu trung bình của nhóm gồm A và B. Lọc chỉ lớp A trên màn xuất không làm thay trung bình tham chiếu.

Mỗi nơi sử dụng nguồn phải lưu đủ lựa chọn của chính nó. **Đề xuất thiết kế:** dùng một bộ nguồn cho các toán hạng `A` trong một công thức; điều kiện áp dụng có bộ nguồn được thể hiện tại điều kiện đó. Nếu hai nơi cùng chọn một nguồn thì dùng cùng bản nguồn trong lượt xét, không tra lại thành hai thời điểm khác nhau. Không âm thầm đổi nguồn công thức khi sửa nguồn của điều kiện áp dụng.

### 5.5. Chọn bản nguồn

1. Tìm bản tổng hợp đã chốt có hiệu lực **đúng phạm vi nguồn**; có thì dùng bản đó.
2. Chỉ khi chưa có bản chốt tương ứng mới dùng kết quả tổng hợp hoàn tất mới nhất có sẵn của cùng phạm vi.
3. Bản chốt đã chọn thiếu dữ liệu thì báo chưa xét được; không chuyển sang bản thường hoặc bản khác kỳ.
4. Chưa có kết quả tổng hợp phù hợp thì chưa xét được. Không tự tính từ điểm chưa tổng hợp hoặc danh sách đang lọc để xuất.

Trung bình thô có thể lấy từ tổng điểm và số người có điểm của cùng bản nguồn. Không thay số người có điểm bằng số người thuộc xếp hạng. Với tỷ lệ nhóm kế thừa kết quả hiện hữu, tử số và mẫu số phải tương ứng cùng tập đóng góp theo cấu hình tổng hợp; không ghép các tổng đã áp dụng chính sách loại trừ khác nhau.

Số lượng bằng 0, tổng maximum không hợp lệ hoặc không xác định được các thành phần cùng bản nguồn làm phép tính phụ thuộc đó không hợp lệ. Không dùng `0` giả. Việc ánh xạ nguồn chốt và điểm theo đơn vị là yêu cầu tích hợp bắt buộc, không được bỏ chiều đơn vị hoặc thay bản chốt bằng bản thường.

<a id="average-snapshot-dependency"></a>
<a id="average-source-mock"></a>

**Triển khai trước:** có thể dùng dummy data cho nguồn trung bình/snapshot để không bị block bởi [PR #57058](https://github.com/ednity/school-web/pull/57058) chưa merge; tích hợp nguồn thật khi sẵn sàng.

### 5.6. Khi nào không cần nguồn?

Ngưỡng cố định hoặc tỷ lệ maximum **và điều kiện áp dụng đều không đọc trung bình/tỷ lệ nhóm** thì không cần nguồn tổng hợp. Form ngưỡng tương ứng không hiện các trường nguồn không dùng và không yêu cầu chọn chúng khi lưu.

Nếu ngưỡng cố định `30` chỉ dùng khi `A≥60`, vẫn phải có nguồn `A` để chọn quy tắc. Thiếu nguồn sẽ là chưa xét được, không được bỏ điều kiện và áp `30` cho mọi học sinh.

<a id="thresholds"></a>

## 6. Ngưỡng điểm, công thức và xử lý phần lẻ

Phần này mô tả **thiết kế đầy đủ**. Danh sách công thức minh họa không phải danh sách bắt buộc implement; áp dụng giới hạn triển khai tại mục 1.4.

### 6.1. Thành phần chung của màn ngưỡng

Hiển thị mục đang cấu hình, tên quy tắc và một loại ngưỡng đang chọn: Điểm cố định（固定点数）, Tỷ lệ điểm tối đa（得点率） hoặc Công thức（計算式）. Phần so sánh cuối chọn Nhỏ hơn（未満） hay Nhỏ hơn hoặc bằng（以下）.

Mỗi lần lưu phải có loại, tham số/công thức và dấu hợp lệ. **Đề xuất mặc định khi tạo mới:** mở loại cố định, dấu `<`, chưa nhập giá trị ngưỡng; không biến giá trị mẫu thành ngưỡng thật. Với tỷ lệ/công thức, mặc định không xử lý phần lẻ; tỷ lệ giữ đúng mặc định của phương án đã xác nhận.

| Dấu cuối | Điểm đỏ khi | Với `S=30`, `T=30` |
| --- | --- | --- |
| Nhỏ hơn（未満） | `S<T` | Không đỏ |
| Nhỏ hơn hoặc bằng（以下） | `S≤T` | Đỏ |

### 6.2. Ngưỡng cố định

`T=N`. Khi lưu, `N` phải là số hợp lệ và thỏa `0≤N≤M` của **mọi đối tượng mà thiết lập áp dụng**. Không lấy maximum mặc định 100 để cho lưu ngưỡng 30 nếu có đối tượng áp dụng thực tế maximum 20. Người dùng cần giảm ngưỡng hoặc thu hẹp/tách phạm vi.

Kiểm tra lại khi sửa đối tượng áp dụng làm phạm vi của ngưỡng cố định rộng hơn. Không tự sửa `30` thành `20`.

Đây là kiểm tra cấu hình lúc lưu. Nếu `M` thay đổi về sau, lần xét loại cố định vẫn dùng `T=N` đã lưu; không tự đổi ngưỡng hoặc làm phép tính cố định phụ thuộc maximum. Không lấy chính sách `M>0` của loại tỷ lệ để bỏ xét ngưỡng cố định đã hợp lệ.

### 6.3. Tỷ lệ điểm tối đa

```text
T_thô = M hiện hành × N / 100
T = T_thô sau xử lý phần lẻ đã chọn, nếu có
```

Tỷ lệ nhập nằm trong `0–100`, kể cả hai biên. Khi chạy, phải phân giải được `M` dương, hữu hạn, đúng ngữ cảnh. `M=0`, `M<0` hoặc không xác định được nguồn không tạo được ngưỡng hợp lệ; không thay bằng 100.

Ví dụ `M=75`, `N=30`: `T_thô=22.5`. Với `S=22.2`, dấu `<`:

- Không xử lý phần lẻ: `T=22.5` → đỏ.
- Chủ động làm tròn xuống về số nguyên: `T=22` → không đỏ.

Nếu nguồn tổng hợp đã chốt khi `M=100`, sau đó mức hiện hành đổi thành `50`, lần xét tỷ lệ độc lập 30% dùng `T=15`. Với `S=20`, kết quả không đỏ. Không lấy `M=100` của bản chốt cho phép tính độc lập này.

### 6.4. Công thức dùng trung bình

Thiết kế theo các dòng phép tính, không nhập chuỗi biểu thức tự do. Mỗi dòng có **Vế trái（左辺）**, **Phép toán（演算子）**, **Vế phải（右辺）**, **Xử lý phần lẻ（端数処理）** và thao tác xóa; có thao tác thêm dòng.

**Đề xuất tập toán hạng cho chức năng này:**

| Toán hạng | Giá trị | Giới hạn |
| --- | --- | --- |
| Trung bình điểm（平均点） | `A` từ bộ nguồn đã chọn | Không đọc lại điểm chưa tổng hợp để tự tạo trung bình |
| Số cố định（固定値） | Số hoặc hệ số nhập trực tiếp, ví dụ `20`, `0.5`, `2` | Phải là số hợp lệ; không áp giới hạn `0–100` của ô tỷ lệ lên mọi hệ số |
| Kết quả phép tính（式の結果） | Kết quả một dòng phía trước, sau xử lý phần lẻ của dòng đó | Dòng đầu không được chọn; không tham chiếu chính dòng, dòng phía sau hoặc dòng đã bị xóa |

Mỗi dòng dùng một trong bốn phép `+`, `−`, `×`, `÷`. Kết quả dòng cuối là `T`. Không tự mở thêm toán hạng điểm mục khác/thiết lập lớp/hàm tùy ý chỉ vì bộ tính điểm hiện có hỗ trợ chúng.

| Nhu cầu | Cách cấu hình |
| --- | --- |
| Một nửa trung bình | Dòng 1: `A×0.5` |
| Trung bình trừ 20 | Dòng 1: `A−20` |
| Trung bình cộng 5 | Dòng 1: `A+5` |
| Một nửa trung bình nhân hệ số 0.8 | Dòng 1: `A÷2`; dòng 2: `kết quả dòng 1 × 0.8` |

Tối thiểu có một dòng đầy đủ. Không cho lưu phép chia có mẫu số cố định bằng 0, toán hạng thiếu hoặc tham chiếu dòng không hợp lệ. Nếu mẫu số chỉ trở thành 0 khi chạy hoặc nguồn lúc chạy không còn đủ dữ liệu, xử lý là chưa xét được theo [mục 8](#states).

Khi xóa/sắp lại dòng, kiểm các tham chiếu bị ảnh hưởng; không tự đổi tham chiếu sang dòng có cùng số thứ tự nhưng khác ý nghĩa. Công thức tạo ngưỡng, tuyệt đối không gọi tác dụng ghi/xóa điểm của bộ tính điểm để lưu `T` vào ô học sinh.

### 6.5. Xử lý phần lẻ

Tỷ lệ maximum có một lựa chọn xử lý phần lẻ trên ngưỡng tính được. Công thức có lựa chọn trên **từng dòng**. Chọn không xử lý nghĩa là không thực hiện bước làm tròn tùy chọn tại vị trí đó, không phải tính toán với độ chính xác vô hạn.

**Đề xuất chi tiết kế thừa cơ chế tính tự động hiện có:**

| Trường | Giá trị và hành vi |
| --- | --- |
| Có xử lý hay không | Không（しない） / Có（する）; mặc định không |
| Vị trí chữ số | Số nguyên `p` từ 1 đến 9; khi bật lần đầu hiển thị `p=1` |
| Ý nghĩa vị trí | `p=1` xử lý chữ số thập phân thứ nhất, kết quả còn số nguyên; `p=2` còn một chữ số; `p=9` còn tám chữ số |
| Phương thức | Làm tròn gần nhất（四捨五入）, Làm tròn lên（切り上げ）, Làm tròn xuống（切り捨て） |
| Khi bật nhưng thiếu phương thức | Yêu cầu chọn trước khi lưu; không mặc định một phương thức từ ô chọn đang rỗng |

Để tránh khác nhau với ngưỡng âm, định nghĩa rõ: gần nhất dùng quy tắc nửa đơn vị ra xa 0; lên theo `ceil`, xuống theo `floor`, tại số chữ số được chọn. Không diễn giải làm tròn xuống như xóa phần lẻ về phía 0.

| Giá trị trước xử lý | Cách xử lý | Kết quả |
| --- | --- | ---: |
| `29.7` | Không xử lý | `29.7` |
| `29.7` | Xuống, `p=1` | `29` |
| `29.75` | Gần nhất, `p=2` | `29.8` |
| `−5.2` | Lên, `p=1` | `−5` |
| `−5.2` | Xuống, `p=1` | `−6` |
| `−5.5` | Gần nhất, `p=1` | `−6` |

Ví dụ `A=49.7`: dòng 1 `A÷2=24.85`. Nếu làm tròn xuống số nguyên ngay dòng 1, dòng 2 nhân `0.8` nhận `24`, cho `19.2`. Nếu dòng 1 không xử lý, dòng 2 cho `19.88`. Không gộp hai công thức này thành một rồi chỉ làm tròn cuối.

Không làm tròn `S` thay cho `T`. Không dùng số đã hiển thị rút gọn làm đầu vào dòng sau hoặc làm biên so sánh.

### 6.6. Ngưỡng âm và cảnh báo biên

Ngưỡng âm hữu hạn được tính đúng là hợp lệ. Ví dụ `A=15`, công thức `A−20` cho `T=−5`: trong miền điểm không âm không ai đỏ; nếu mục cho phép điểm âm thì `−6<−5`, còn `−5` chỉ đỏ với dấu `≤`. Không ép `T` về 0 hoặc vào miền điểm của học sinh.

Cảnh báo dựa trên **ngưỡng cuối và dấu so sánh**, không dựa riêng tham số:

| Điều kiện | Nội dung cần giúp người dùng hiểu |
| --- | --- |
| `T=0`, dấu `<`, miền điểm không âm | Không có điểm nào nhỏ hơn 0 |
| `T=0`, dấu `≤` | Điểm 0 vẫn bị xét đỏ |
| `T=M`, dấu `<` | Điểm đúng maximum không đỏ |
| `T=M`, dấu `≤` | Cả điểm đúng maximum cũng đỏ |
| Công thức `A−0` | Ngưỡng là `A`, không phải 0 |

Chỉ đưa cảnh báo cụ thể khi có đủ dữ liệu để xác định đúng ngưỡng/phạm vi. Cảnh báo không sửa giá trị và không thay thế validation. Ngưỡng âm hợp lệ hoặc ngưỡng công thức vượt maximum không tự trở thành lỗi chỉ vì ngoài miền điểm lưu.

### 6.7. Đổi loại ngưỡng và đổi toán hạng

**Đề xuất thiết kế để thống nhất thao tác:** trong cùng phiên sửa, đổi loại ngưỡng chỉ ẩn/hiện vùng tương ứng, có thể quay lại phần vừa nhập trước khi lưu. Chỉ loại đang chọn có hiệu lực. Sau lưu và mở lại, khôi phục đầy đủ loại đã lưu; không cam kết khôi phục dữ liệu của mọi loại từng nhập nhưng đang ẩn, không tạo lịch sử riêng cho chúng.

Đổi loại toán hạng thì xóa lựa chọn phụ thuộc không còn phù hợp của chính toán hạng đó; các dòng khác giữ nguyên nếu còn hợp lệ. Phải kiểm lại tham chiếu và dữ liệu trước khi lưu. Hủy quay về cấu hình đã lưu gần nhất.

### 6.8. Yêu cầu độ chính xác

Phân biệt miền nhập nghiệp vụ đã chốt (`0≤N≤M` cho cố định, `0≤N≤100` cho tỷ lệ) với giới hạn lưu trữ kỹ thuật. Không tự đặt giới hạn số dòng, độ dài tên, số chữ số hay độ lớn hệ số thành quy định khách hàng từ một ảnh mẫu.

**Hợp đồng bắt buộc khi hiện thực:** lưu/mở lại không âm thầm cắt giá trị hợp lệ; phép so sánh đúng tại `S=T`; không nhận số vô hạn/không phải số; tràn số không được tạo kết luận đỏ/không đỏ. Team chốt miền biểu diễn, số chữ số được nhận và giới hạn số dòng dựa trên schema/cơ chế tính được chọn trước khi hoàn tất thiết kế kỹ thuật. Nếu vượt giới hạn đã công bố thì báo lỗi, không tự làm tròn hoặc cắt bớt.

<a id="execution"></a>

## 7. Quy trình xét và thời điểm cập nhật

### 7.1. Trình tự cho một ô

1. Xác định ô thuộc đúng phạm vi được phép xử lý; hoàn tất các xử lý làm thay đổi điểm của lượt đăng ký/tính toán.
2. Lấy `S` cuối. Nếu ô không có điểm hoặc không còn hoạt động, không xét như số 0 và ngừng dùng dấu đỏ gắn với điểm đã mất.
3. Lấy cấu hình hiện hành, xét điều kiện áp dụng theo ưu tiên ở [mục 4.3](#configuration).
4. Khi chọn được quy tắc, phân giải đúng những dữ liệu cần cho loại ngưỡng đó. Loại cố định độc lập không cần tải nguồn trung bình hoặc maximum để tính `T`.
5. Tính `T`, xử lý phần lẻ theo cấu hình, rồi so `S<T` hoặc `S≤T`.
6. Lưu kết quả đỏ/không đỏ; nếu không thể xét hoặc không áp dụng, lưu trạng thái tương ứng để kết quả cũ hết hiệu lực đúng thời điểm.
7. Sau khi ghi thành công, ba đầu ra sử dụng cùng kết quả mới. Không đầu ra nào tự chọn lại quy tắc hoặc tính lại ngưỡng.

Quy tắc đỏ không ghi lại điểm học sinh. Cùng dữ liệu, cấu hình và nguồn phải cho cùng kết quả khi chạy lại; chạy nhiều lần không nhân đôi dấu hoặc tạo nhiều kết quả hiện hành cho cùng ô.

### 7.2. Bảng sự kiện

| Sự kiện | Xử lý điểm đỏ |
| --- | --- |
| Đăng ký/sửa điểm trực tiếp | Xét sau khi có điểm cuối của lượt xử lý; cập nhật khi lượt lưu/xét thành công |
| Nhập CSV điểm | Cùng quy tắc xét, giữ ranh giới đăng ký của CSV; không chỉ áp dụng với màn nhập tay |
| Liên kết kết quả chấm bài thi | Các ô điểm được ghi trong phạm vi hỗ trợ cũng phải xét, kể cả nhánh tính tự động bị bỏ qua |
| Tính toán hàng loạt | Xét đúng phạm vi lớp/kỳ/thời điểm được yêu cầu; bao gồm mục không có công thức tính điểm và mục cần ngừng dùng kết quả cũ |
| Lưu ngưỡng, dấu, công thức, nguồn hoặc thứ tự | Chỉ lưu cấu hình; giữ kết quả hoàn tất trước đến lần xét tiếp theo |
| Thay điều kiện đối tượng | Giữ trước trong lúc chờ; lần xét mới xác định lại có áp dụng không |
| Xóa một hoặc toàn bộ thiết lập | Giữ trước trong lúc chờ; lần xét mới chọn theo danh sách còn lại hoặc chuyển không áp dụng |
| Tổng hợp lại/cập nhật nhóm tham chiếu | Không tự chạy xét mọi học sinh phụ thuộc; chuẩn bị nguồn và chạy lại đúng phạm vi |
| Xóa điểm số thành trống | Không còn điểm để gắn dấu; bộ lọc đỏ không dùng kết quả của số đã xóa |
| Xem, trích xuất, công khai, in lại | Chỉ đọc; không kích hoạt xét hoặc tổng hợp |

Trường không có công thức tính điểm tự động nhưng có cấu hình đỏ vẫn cần đường chạy hàng loạt. Khi xóa quy tắc cuối, mục có kết quả cũ vẫn phải nằm trong phạm vi có thể chạy lại; không lọc nó ra chỉ vì không còn cấu hình.

### 7.3. Thay đổi điểm tối đa

| Thao tác | Hành vi cần giữ/tích hợp |
| --- | --- |
| Lưu định nghĩa tại [Thiết lập điểm tối đa（満点設定）](https://ad31.schoolstg.mwsite.work/admin/grade_report_setting/manage/detail/option/register/change_max_score) | Đường đã khảo sát chỉ lưu cấu hình; không yêu cầu tự xét toàn bộ điểm ngay |
| Sửa Giá trị tối đa（最大値） trong Thiết lập ô nhập（入力欄設定） | Chỉ thay cấu hình; kết quả trước còn dùng đến lần xét phù hợp |
| Lưu lựa chọn maximum khi đăng ký điểm của lớp | Tích hợp xét sau các xử lý điểm hiện có của lượt đăng ký |
| Lưu tại [Thiết lập điểm tối đa hàng loạt（満点一括設定）](https://ad31.schoolstg.mwsite.work/admin/grade/lesson_group/setting?setting_type=change_max_score) | Khi trường có chức năng và người dùng đủ quyền, đường lưu hiện có xếp hàng tính theo các lớp/kỳ được phép; kết quả mới chỉ có sau xử lý thành công |
| Sửa maximum/việc sử dụng theo đơn vị | Theo đúng đường xử lý hiện có; nếu điểm bị xóa hoặc ngừng hoạt động phải xử lý vòng đời kết quả, không chỉ đổi mẫu số |

Không suy mọi màn có chữ “điểm tối đa” đều chạy AutoRating. Màn định nghĩa lựa chọn và màn lưu lựa chọn của lớp là hai thao tác khác nhau. Khả năng maximum theo đơn vị của bộ tính cũng không có nghĩa mọi màn maximum hàng loạt hiện đã hỗ trợ chọn từng đơn vị.

### 7.4. Quy trình vận hành khi dùng trung bình/tỷ lệ nhóm

1. Trong Thiết lập tổng hợp thứ hạng（順位集計設定） → Thiết lập chi tiết（詳細設定）, đặt tự tổng hợp khi đăng ký điểm thành **Không thực hiện（実行しない）** cho quy trình đánh giá tương đối.
2. Chuẩn bị và hoàn tất các điểm đầu vào của toàn bộ nhóm cần lấy làm nguồn, kể cả xử lý tính điểm nguồn có liên quan.
3. Tại [Tổng hợp thành tích（成績集計）](https://ad31.schoolstg.mwsite.work/admin/grade/grade_setting_system/grade_calc), chọn đúng phạm vi rồi chạy nút xanh **Thực hiện tổng hợp（集計実行）**. Chờ hoàn tất.
4. Kiểm nguồn có hiệu lực: nếu có bản chốt đúng phạm vi, bản chốt vẫn được ưu tiên; chạy tổng hợp mới không tự thay bản chốt.
5. Chạy nút cam **Thực hiện tính toán tự động（自動算出実行）** cho phạm vi cần xét. Chờ hoàn tất và kiểm các mục chưa xét được/lỗi.
6. Xem/trích xuất/công khai/in bằng kết quả đã hoàn tất.

Tắt tự tổng hợp không tắt việc xét khi đăng ký điểm. Lúc chưa có nguồn hợp lệ, phép xét phụ thuộc nguồn sẽ chưa có kết luận; người phụ trách chuẩn bị nguồn rồi chạy lại. Các quy tắc độc lập với trung bình vẫn xét được.

Nếu bước tính tự động sau tổng hợp lại sửa chính điểm đã dùng tạo nguồn, điểm hiện hành và nguồn tổng hợp có thể khác thời điểm. Phải chuẩn bị đúng đầu vào và kiểm cấu hình phụ thuộc; hệ thống không tự lặp xanh–cam đến khi hội tụ. Không tuyên bố hỗ trợ công thức phụ thuộc vòng hoặc luôn dùng “trung bình vừa bấm nút xanh”.

### 7.5. Phạm vi một lượt và thứ tự hoàn tất

Một lượt phải xác định các ô bị tác động, kể cả ô môn chính hoặc ô khác được cập nhật bởi xử lý điểm liên quan. Không chỉ xét trường người dùng vừa gửi lên, cũng không tự xét lại toàn trường.

**Đề xuất tích hợp:** cố định cấu hình và bản nguồn theo phạm vi hợp lý của lượt hiện có; lưu định danh nguồn đã dùng. Nếu điểm/cấu hình mới hơn được lưu trong lúc lượt cũ còn chạy, lượt cũ không được hoàn tất muộn rồi ghi đè kết quả của lượt mới. Dùng cơ chế job/giao dịch hiện có và kiểm tra thứ tự cập nhật; không bắt buộc thêm hệ thống hàng đợi hay khóa toàn trường.

<a id="states"></a>

## 8. Trạng thái kết quả và xử lý lỗi

### 8.1. Các trạng thái phải phân biệt

Tên dưới đây mô tả nghiệp vụ; không bắt buộc thêm tất cả thành nhãn trên màn học sinh.

| Trạng thái | Ý nghĩa | Dấu/lọc đỏ |
| --- | --- | --- |
| Đỏ | Đã xét thành công, `S` thỏa dấu so sánh với `T` | Có thể được đánh dấu/lọc theo cấu hình đầu ra |
| Không đỏ | Đã xét thành công, `S` không thỏa ngưỡng | Không thêm dấu đỏ, không thỏa lọc đỏ |
| Chưa từng xét | Chưa có kết quả hoàn tất cho ô | Không thêm dấu; không được coi là đã đạt |
| Chưa xét được | Đã chạy nhưng thiếu dữ liệu hoặc không tạo được ngưỡng hợp lệ | Ngừng dùng kết quả trước; không thêm dấu/lọc đỏ từ kết quả cũ |
| Không áp dụng | Đủ dữ liệu để xác định không có thiết lập phù hợp, kể cả hết cấu hình sau lần chạy lại | Ngừng dùng kết quả trước; không phải kết luận đạt một ngưỡng |
| Không có điểm | Ô trống, điểm đã bị xóa hoặc không hoạt động | Không xét từ số 0 giả; không dùng dấu/lọc của ô số trước đó |

**Đang chờ chạy lại** là tình trạng cấu hình/nguồn đã thay đổi trong khi kết quả trước còn hiệu lực; không tự biến thành trạng thái không đỏ hoặc chưa xét được. Khi chưa chạy lại, có thể tiếp tục dùng dấu đỏ trước đó theo các quy tắc đã chốt.

### 8.2. Bảng chuyển trạng thái

| Trước thao tác | Thao tác/kết quả | Sau thao tác |
| --- | --- | --- |
| `S=32`, không đỏ với ngưỡng `<30` | Lưu ngưỡng `<35`, chưa xét | Tiếp tục không đỏ theo kết quả trước; hướng dẫn chạy lại |
| Như trên | Xét thành công với ngưỡng `<35` | Đỏ |
| `S=29`, đỏ với `<30` | Sửa thành `40`, lượt lưu/xét thành công | `S=40`, không đỏ; không chờ một chế độ thủ công riêng |
| Đỏ, đang phụ thuộc trung bình | Đã chạy nhưng không có nguồn hợp lệ | Chưa xét được; ngừng dấu/lọc cũ, giữ điểm số |
| Đỏ | Đổi phạm vi sang lớp khác, chưa xét | Giữ kết quả trước |
| Như trên | Chạy lại, đủ dữ liệu xác định không khớp | Không áp dụng; ngừng dấu/lọc cũ |
| Đỏ | Xóa thiết lập cuối, chưa xét | Giữ kết quả trước dù danh sách cấu hình rỗng |
| Như trên | Lần đăng ký/tính lại xác định hết cấu hình | Không áp dụng; ngừng dấu/lọc cũ |
| Đỏ | Xóa điểm thành trống thành công | Không có điểm; không giữ dấu bằng dữ liệu xét cũ |
| Chưa xét được | Bổ sung nguồn/khắc phục công thức nhưng chỉ lưu cấu hình | Vẫn chưa có kết luận mới |
| Như trên | Xét lại thành công | Đỏ hoặc không đỏ theo dữ liệu của lần xét mới |

### 8.3. Không tạo được ngưỡng hợp lệ

Bao gồm: thiếu nguồn trung bình cần để chọn nhánh hoặc tính ngưỡng; nguồn chốt thiếu dữ liệu; maximum không hợp lệ cho loại tỷ lệ; thiếu toán hạng; chia cho 0; không có số lượng/mẫu số hợp lệ; kết quả số học không hữu hạn.

Sau lần xét này, **ngừng dùng kết quả cũ làm kết quả hiện hành**. Không giữ dấu cũ cho đến khi có kết quả thành công khác. Không tự chọn nguồn khác, đi xuống quy tắc thấp hơn, thay thiếu bằng 0 hoặc bật lại ngưỡng legacy. Giữ nguyên điểm học sinh.

Ngưỡng âm hợp lệ không thuộc nhóm lỗi. Trường hợp xác định chắc chắn không có quy tắc áp dụng cũng khác thiếu thông tin để xác định quy tắc.

### 8.4. Lỗi kỹ thuật và thông báo

Lỗi lưu dữ liệu, mất kết nối hoặc tiến trình dừng khác với kết quả nghiệp vụ “chưa xét được”. Nếu thao tác lưu trạng thái thất bại, không được báo rằng kết quả cũ đã ngừng hiệu lực hoặc đã xét thành công.

- Lượt nhập trực tiếp/CSV/liên kết giữ ranh giới giao dịch của đường đăng ký tương ứng; điểm và kết quả xét phải nhất quán ở ranh giới công bố thành công.
- Batch có thể hoàn tất một phần. Không hứa rollback cả lượt khi phần sau thất bại; không suy số lớp đã xử lý thành số ô đã xét thành công.
- Người phụ trách phải biết phạm vi đã cập nhật, chưa xét được hoặc thất bại đủ để khắc phục và chạy lại. Không đưa lỗi SQL, stack trace hoặc dữ liệu học sinh ngoài quyền vào thông báo.
- Không thêm retry vô hạn. Xử lý phục hồi và chống yêu cầu trùng theo cơ chế chạy hiện có; không báo hoàn tất ngay khi mới xếp hàng.

**Đề xuất nội dung thông báo:** “Đã lưu thiết lập. Hãy đăng ký lại điểm hoặc chạy tính toán cho phạm vi cần cập nhật”; “Chưa thể xét vì chưa có kết quả tổng hợp phù hợp”; “Điểm tối đa không hợp lệ”; “Không thể tính ngưỡng vì phép chia cho 0”; “Một phần dữ liệu chưa được cập nhật; kiểm tra phạm vi lỗi trước khi chạy lại”. Đây là ý nghĩa thông báo, chưa phải bản dịch UI cuối.

Không bổ sung chặn trích xuất/công khai/phát hành chỉ vì thiếu hoặc đang chờ kết quả đỏ. Các quyền, lịch, điều kiện ẩn và chặn hiện hữu của chức năng vẫn giữ nguyên.

<a id="extraction"></a>

## 9. Trích xuất thành tích（成績抽出）

Màn thao tác: [Trích xuất thành tích（成績抽出）](https://ad31.schoolstg.mwsite.work/admin/nb/grade/grade_setting_system/grade_extraction). Bản vẽ: [05-A — Chi tiết hiển thị](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4595-1806), [05-B — Kết quả](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4595-1986).

### 9.1. Thiết lập

| Tùy chọn | Hành vi |
| --- | --- |
| Lọc học sinh có điểm đỏ | Khi bật, chỉ giữ học sinh có ít nhất một ô đỏ trong phạm vi mục/môn/kỳ/đơn vị đang xét của bộ lọc |
| Ký hiệu phía trước | Bật thì bắt buộc nhập ký hiệu; thêm trước giá trị của ô đỏ |
| Ký hiệu phía sau | Bật thì bắt buộc nhập ký hiệu; thêm sau giá trị của ô đỏ |
| Tô màu ô | Bật thì dùng màu chọn từ bảng màu hiện hữu cho đúng ô đỏ |

Ký hiệu trước và sau có thể cùng bật. Chỉ bật ký hiệu hoặc màu không tự giới hạn danh sách học sinh. **Đề xuất mặc định:** không bật các hiệu ứng/lọc mới khi chưa được người dùng cấu hình, để không tự thay các mẫu trích xuất đang dùng.

Không mở bộ chọn màu hay hệ màu riêng. Màu đỏ minh họa từng quan sát là nền `#E38487`, chữ thường `#222222`; phải kế thừa palette/template thực tế, không ép mọi template dùng hai mã này.

### 9.2. Kết quả và ví dụ

Học sinh có Toán 24 đỏ và Văn 70 không đỏ: khi bật lọc đỏ trong phạm vi có Toán thì học sinh được giữ, nhưng chỉ ô Toán có hiệu ứng đỏ. Không tô cả dòng hoặc tất cả ô của học sinh đó. Nếu bộ lọc chỉ xét Văn thì ô Toán ngoài phạm vi không giúp học sinh thỏa điều kiện đỏ.

Với ô đỏ `24`, cấu hình ký hiệu trước `※`, sau `!` cho `※24!`. Ô không đỏ/chưa xét được/không áp dụng không được thêm các ký hiệu này từ kết quả cũ đã hết hiệu lực.

Trước lần chạy lại sau xóa cấu hình cuối, kết quả đỏ cũ vẫn có thể khiến học sinh thỏa bộ lọc. Sau lần chạy lại xác định không áp dụng, học sinh không còn thỏa bộ lọc nhờ ô đó. Danh sách rỗng là kết quả hợp lệ, không phải lỗi hệ thống.

Kết hợp bộ lọc đỏ với bộ lọc khác theo cơ chế trích xuất hiện hữu; không thay ý nghĩa các điều kiện khác. Các hiệu ứng đỏ phải đi qua cơ chế trang trí ô hiện có; không lấy điểm gốc để hiện lại ô đã bị ẩn.

### 9.3. Xuất file

Bảng trên màn hình và Excel phải lấy cùng trạng thái cho cùng ô trong cùng lần xuất. Không nhận cờ đỏ hoặc kết quả tính ngưỡng do trình duyệt gửi lên như kết luận tin cậy. Kiểm quyền và dữ liệu nguồn tại server.

Không chạy xét chỉ vì tải Excel. Phải kiểm file Excel thực để xác nhận ký hiệu, màu, ô rỗng và số liệu; ảnh HTML không thay bằng chứng file xuất. Định dạng bổ sung chỉ nằm trong phạm vi nếu đường xuất đó thực sự được hỗ trợ.

<a id="publication"></a>

## 10. Công khai thành tích（成績公開）

Màn cấu hình: [Thiết lập công khai thành tích（成績公開設定）](https://ad31.schoolstg.mwsite.work/admin/grade_report_setting/grade_publish). Đầu ra: [Xác nhận thành tích（成績確認） phía học sinh](https://ad31.schoolstg.mwsite.work/student/grade/grade_publish). Bản vẽ: [06-A — Thiết lập](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4595-2269), [06-B — Kết quả học sinh](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4595-2453).

### 10.1. Phạm vi và tùy chọn

Cho cấu hình hiển thị đỏ đối với mục có thiết lập đỏ, trong đúng phạm vi điểm thường/đơn vị của thiết lập công khai. Các cách trang trí được dùng là thêm ngoặc, dấu `*` cố định phía trước hoặc phía sau; không thêm ký tự tự do, lọc học sinh đỏ hoặc nền đỏ riêng trong bản đầu.

**Đề xuất khi chưa cấu hình hiệu ứng:** giữ cách hiển thị điểm hiện hữu; không tự thêm dấu. Không tạo thêm một trạng thái nghiệp vụ “không hiển thị vì đỏ”.

Việc mục hết cấu hình sau khi xóa quy tắc cuối chỉ ảnh hưởng khả năng tạo/sửa cấu hình theo điều kiện hiện hành. **Không dùng phép kiểm “còn rule không?” ở renderer để bỏ ngay dấu đã cấu hình**: kết quả và hiệu ứng đang dùng vẫn phải tuân theo thời điểm ngừng hiệu lực ở [mục 8](#states). Không xóa cấu hình trình bày đã lưu như tác dụng phụ của thao tác xóa quy tắc.

### 10.2. Kết hợp điểm dự kiến và điểm đỏ

Kết hợp các hiệu ứng khác nhau; hiệu ứng trùng chỉ một lần. Ngoặc bao quanh phần số và dấu `*`; vị trí trước/sau là hai hiệu ứng khác nhau.

| Hiệu ứng dự kiến | Hiệu ứng đỏ | Với điểm 24 đồng thời có hai trạng thái |
| --- | --- | --- |
| Ngoặc | `*` phía trước | `(*24)` |
| `*` phía trước | `*` phía trước | `*24`, không phải `**24` |
| Ngoặc | Ngoặc | `(24)`, không phải `((24))` |
| `*` phía trước | `*` phía sau | `*24*` |
| Không trang trí | Ngoặc | `(24)` |
| Đã bị ẩn theo thiết lập có hiệu lực | Bất kỳ hiệu ứng đỏ | Giữ ẩn; không khôi phục số hoặc chỉ để lại dấu làm lộ trạng thái |

Hai ví dụ `(*24)` và `*24` là các trường hợp đã xác nhận trực tiếp; các dòng khác cụ thể hóa cùng quy tắc kết hợp/khử trùng. Không suy số trạng thái từ số lượng dấu trên chuỗi. Chỉ kết quả đỏ còn hiệu lực mới đóng góp hiệu ứng đỏ.

### 10.3. Quyền, thời điểm và đầu ra liên quan

Giữ lịch công khai, trường/năm, đối tượng học sinh/phụ huynh và ẩn điểm. API hoặc PDF thuộc luồng công khai phải giữ cùng kết quả và quy tắc hiển thị; không lấy màn hồ sơ giáo viên làm bằng chứng thay cho màn học sinh.

Mở lại màn công khai không chạy xét. Một kết quả chuyển sang chưa xét được hoặc không áp dụng sẽ ngừng hiệu ứng đỏ, nhưng các hiệu ứng dự kiến/thiết lập khác còn hiệu lực vẫn giữ. Không tô nền đỏ riêng; nền tiêu đề, bảng và các định dạng khác không bị xóa.

<a id="report-card"></a>

## 11. Công cụ phiếu điểm（通知表ツール） và PDF

Màn thao tác: [Công cụ phiếu điểm（通知表ツール）](https://ad31.schoolstg.mwsite.work/admin/grade_report_setting/report_card). Bản vẽ: [07-A — Tùy chọn ô](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4595-2848), [07-B — PDF theo template](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4595-3183).

### 11.1. Tùy chọn hiển thị đỏ

Trong tùy chọn của mục điểm, bổ sung điều kiện đỏ với các lựa chọn:

| Cách hiển thị | Ví dụ với 24 đỏ |
| --- | --- |
| Nguyên trạng（そのまま表示） | `24` |
| Kèm ngoặc（カッコ付き） | `(24)` |
| Ký tự phía trước | Với `※`: `※24` |
| Ký tự phía sau | Với `※`: `24※` |

Chỉ bắt buộc ký tự khi chọn trước/sau. Không thêm lựa chọn ẩn hoặc gạch chéo riêng cho điều kiện đỏ; các điều kiện có sẵn vẫn giữ các khả năng đó. Không thêm nền đỏ riêng hoặc ép mọi trường về một template.

**Đề xuất mặc định:** nguyên trạng để việc thêm khả năng mới không tự đổi mẫu đã lưu. Thay đổi trong hộp tùy chọn chỉ được lưu bền vững theo luồng hiện hữu: hoàn tất/đóng hộp, rồi bấm **Cập nhật（更新する）** ở màn bảng bên dưới. Mở lại phải giữ đúng lựa chọn và ký tự đã lưu.

### 11.2. Thứ tự và điều kiện khớp đầu tiên

```text
Các kiểm soát ẩn ô / kỳ hợp lệ hiện có
→ điều kiện môn cụ thể
→ các điều kiện ô chọn theo thứ tự hiện có
→ điều kiện điểm đỏ
→ điều kiện ô trống
→ hiển thị thông thường khi không có điều kiện khớp
```

Tại chuỗi điều kiện, **gặp điều kiện khớp đầu tiên thì dùng kết quả của điều kiện đó và dừng**. Chọn nguyên trạng cũng dừng. Không kết hợp mọi hiệu ứng giống màn công khai.

| Trường hợp | Kết quả |
| --- | --- |
| Điểm 24 vừa dự kiến vừa đỏ; điều kiện dự kiến phía trên chọn ngoặc; đỏ chọn `※` trước | `(24)`, không thêm `※` |
| Như trên nhưng dự kiến chọn nguyên trạng | `24`, không chuyển xuống điều kiện đỏ |
| Điều kiện phía trên đã ẩn/gạch chéo | Giữ kết quả ẩn/gạch chéo; đỏ không làm hiện lại điểm |
| Không có điều kiện phía trên khớp; ô đỏ chọn `※` trước | `※24` |
| Không có điểm | Không áp dấu đỏ của kết quả cũ; xử lý ô trống theo cấu hình hiện hữu |

Không diễn giải rằng bất kỳ điều kiện ẩn ở vị trí nào cũng thắng toàn cục. Ví dụ ô chọn thứ nhất khớp và để nguyên trạng thì chuỗi đã kết thúc, không quét tiếp ô chọn thứ hai để tìm lệnh ẩn.

### 11.3. Lưu và xuất

Khi chỉ dùng điều kiện đỏ, hệ thống vẫn phải ghi nhận bảng có sử dụng điều kiện; không mất hiệu lực vì các điều kiện cũ khác chưa được chọn. Sao chép template giữ cấu hình trình bày phù hợp nhưng không sao chép kết quả xét của học sinh.

PDF đọc đúng trạng thái của ô theo đơn vị/kỳ/môn. Phải kiểm PDF thực sau lưu/mở lại và sau các chuyển trạng thái. Dấu đỏ không được tràn ô, mất ký tự hoặc làm thay cấu trúc template hiện có. Bản tổng hợp đã chốt không đồng nghĩa mọi nội dung phiếu đã được đóng băng; không bổ sung quản lý phiên bản file phiếu.

<a id="integration"></a>

## 12. Dữ liệu, tích hợp và bảo toàn chức năng cũ

Phần này là yêu cầu tích hợp và **đề xuất thiết kế kỹ thuật để team review**, không phải mô tả schema mới đã tồn tại. Không cần mở source để hiểu hành vi; tên thành phần bên dưới chỉ giúp định hướng triển khai, không phải tham chiếu đến file trong máy người soạn.

### 12.1. Dữ liệu cấu hình và kết quả cần quản lý

| Nhóm dữ liệu | Nội dung tối thiểu về ý nghĩa | Ràng buộc |
| --- | --- | --- |
| Danh sách quy tắc của mục | Liên kết trường/năm/mục/phạm vi, tên, thứ tự | Nhiều quy tắc, thứ tự xác định; tách khỏi ngưỡng scalar cũ |
| Điều kiện áp dụng | Phạm vi môn/đối tượng, loại bộ lọc, giá trị, dấu so sánh và nguồn nếu dùng trung bình/tỷ lệ | Phân biệt không khớp với không đủ dữ liệu để xác định khớp |
| Ngưỡng | Loại, `N`, dấu cuối; cấu hình phần lẻ; các dòng toán hạng/phép toán/tham chiếu nếu có | Chỉ loại hiện hành có hiệu lực; không thực thi chuỗi code từ input |
| Nguồn tham chiếu | Kỳ, bộ tổng hợp, nhóm; ánh xạ môn/mục/đơn vị | Đúng trường/năm; ưu tiên bản chốt tự động |
| Kết quả hiện hành của ô | Identity ô, trạng thái ở mục 8, quy tắc/lượt xét liên quan, thời điểm | Một kết quả hiện hành; không dùng một boolean để gộp chưa xét được thành không đỏ |
| Thông tin giải thích lượt xét | Điểm được dùng, ngưỡng cuối/dấu; maximum hoặc nguồn tổng hợp khi có; nguyên nhân chưa xét được | Đề xuất lưu đủ để kiểm tra và chống ghi đè sai thời điểm, không yêu cầu sao chép toàn bộ dữ liệu học sinh/nguồn |
| Thiết lập trình bày | Lọc/ký hiệu/màu của trích xuất, hiệu ứng công khai, điều kiện phiếu | Thuộc từng đầu ra, không làm thay đổi kết quả xét |

Không cần xóa lịch sử vật lý để ngừng hiệu lực kết quả cũ. Tuy nhiên, không bắt buộc xây thêm màn lịch sử, hệ thống version toàn bộ rule hoặc kho chụp toàn bộ phiếu chỉ để đáp ứng yêu cầu này.

Thiết kế DB cuối cần chỉ ra khóa nhận diện ô, liên kết cấu hình, cách biểu diễn chưa xét được/không áp dụng, phạm vi cập nhật và cách giữ kết quả sau xóa rule đến lượt chạy lại. Không ràng buộc xóa dây chuyền khiến xóa rule lập tức xóa kết quả còn phải dùng.

### 12.2. Điểm tích hợp chính

| Thành phần/luồng | Trách nhiệm khi bổ sung điểm đỏ | Điều phải tránh |
| --- | --- | --- |
| Màn cấu hình tham chiếu AutoRating | Tái sử dụng cách nhập bộ lọc, công thức, ưu tiên và phần lẻ phù hợp; kiểm quyền sửa mục | Bê nguyên mọi loại toán hạng hoặc gate riêng một trường thành yêu cầu chung |
| Đăng ký điểm trực tiếp và CSV | Sau các xử lý tạo điểm cuối, xác định tập ô cần xét và lưu nhất quán với lượt đăng ký | Chỉ gắn xét bên trong nhánh tính công thức, bỏ sót điểm nhập tay |
| Liên kết điểm thi | Xét cả ô đã ghi khi bước chuẩn bị AutoRating không nhận lớp đó | Bỏ sót điểm vì không có lần gọi bộ tính điểm |
| AutoRating và tính hàng loạt | Tách việc tính ngưỡng khỏi tác dụng thay điểm; bao phủ không-config, nhập tay, môn liên quan và đơn vị | Kế thừa hành vi ghi `NULL` khi không khớp hoặc ép ngưỡng vào min/max của điểm |
| Nút chạy và dựng danh sách batch | Có đường chạy cho chỉ-rule-đỏ và cho mục đã hết rule nhưng còn kết quả cần xử lý; giữ quyền/phạm vi hiện có | Dựa duy nhất vào “có công thức AutoRating” để cho chạy hoặc chọn đối tượng |
| `GradeCalcResultService` và nguồn chốt | Cung cấp đúng bản nguồn, trung bình thô, tỷ lệ nhóm kế thừa kết quả hiện hữu với độ chính xác cần thiết và ngữ cảnh đơn vị; có thể dùng dummy data trước | Tự coi bản thường là bản chốt; bỏ `tangen_id`; ghép tử/mẫu khác tập học sinh; mặc định tỷ lệ đã làm tròn đáp ứng so sánh trước làm tròn |
| `GradeScoreRangeService`/cơ chế maximum | Phân giải đầy đủ mặc định, đơn vị, lựa chọn lớp | Dùng helper chưa có tầng đơn vị như đã bao phủ toàn bộ |
| Dữ liệu dùng chung, `GradePublishService` và PDF công khai | Đưa trạng thái xét theo đúng ô đến web/API/PDF; áp hiệu ứng công khai | Tính lại ngưỡng tại renderer hoặc làm lộ điểm ẩn |
| Bộ chuyển đổi và lưu tùy chọn phiếu | Thêm đỏ đúng thứ tự, giữ first-match, lưu cờ sử dụng điều kiện và đọc lại/copy template | Chỉ sửa bản vẽ/render mà thiếu đường lưu khi chỉ có điều kiện đỏ |
| Trích xuất và Excel | Lọc và trang trí dùng cùng kết quả được kiểm quyền tại server | Tin cờ đỏ phía trình duyệt hoặc áp ngưỡng riêng cho file xuất |

Những điểm hiện trạng nêu trên được đối chiếu source; không phải bằng chứng feature mới đã tích hợp. Không cần sửa tất cả thành phần nếu kiến trúc triển khai có một điểm chung bao phủ đúng các đường này.

### 12.3. Không chuyển đổi dữ liệu đỏ cũ

Không tự chuyển `red_score` hoặc `changed_red_score` thành quy tắc mới có hiệu lực. Không đổi ý nghĩa cột từ ngưỡng thành cờ boolean, mã công thức hoặc kết quả xét. Không tự reset các giá trị này khi lưu cấu hình mới.

Các báo cáo/tùy biến trường đang đọc ngưỡng cũ vẫn phải được giữ nguyên nghĩa và cách hoạt động. Ba đầu ra chung trong spec này không tự bao gồm mọi báo cáo riêng của trường. Không dùng ngưỡng cũ làm fallback khi không có quy tắc mới, quy tắc không khớp hoặc thiếu dữ liệu.

Không migrate dữ liệu cũ không có nghĩa được xóa cột hoặc bỏ qua các đường sao chép/xuất nhập đang mang dữ liệu cũ.

### 12.4. Sao chép, năm mới, nhập/xuất và khôi phục

**Đề xuất thiết kế:** đưa cấu hình mới đi theo phạm vi cấu hình được người dùng chọn trong thao tác hiện hữu; không thêm một quy trình sao chép riêng. Chi tiết hỗ trợ từng đường phải được chốt trong danh sách phát hành.

| Thao tác | Cách xử lý đề xuất |
| --- | --- |
| Sao chép cấu hình sang phạm vi khác | Sao chép các rule của mục được chọn; ánh xạ lại mục/kỳ/môn/nhóm/đơn vị; giữ thứ tự và công thức hợp lệ |
| Kế thừa năm học | Ánh xạ sang năm mới; không gắn nguồn chốt của năm cũ thành nguồn mới; không sao chép kết quả xét học sinh |
| Xuất/nhập cấu hình | Bao gồm cấu hình đỏ mới khi đường đó được hỗ trợ; kiểm tham chiếu, loại ngưỡng và quyền như lưu form |
| File cấu hình phiên bản cũ chưa có phần đỏ mới | Không tự tạo rule từ dữ liệu legacy; xử lý thiếu phần mới theo chế độ nhập, không âm thầm xóa rule hiện hành |
| Khôi phục/thay khung điểm | Kết quả gắn với ô bị xóa/tái tạo phải ngừng dùng; không gắn kết quả cũ vào identity mới |
| Đồng bộ cấu hình chung xuống lớp | Giữ đúng ánh xạ và phạm vi; không tự xem thao tác đồng bộ cấu hình là đã chạy xét |
| Sao chép template phiếu | Giữ tùy chọn trình bày đỏ phù hợp; kết quả vẫn lấy của đúng học sinh/ô khi xuất |

Nếu không ánh xạ được một tham chiếu, **đề xuất** không kích hoạt rule thiếu dữ liệu và báo rõ phần chưa sao chép/nhập thành công; không chọn thay một nhóm cùng tên. Trước khi hỗ trợ đường đó, team cần xác định hành vi lỗi theo chế độ giao dịch hiện hữu và thông báo đủ để người dùng sửa. Nếu chưa hỗ trợ một đường trong bản đầu, phải thể hiện rõ giới hạn thay vì làm mất rule âm thầm.

<a id="delivery"></a>

## 13. Điểm cần chốt khi triển khai và nguồn tham chiếu

### 13.1. Các quyết định còn lại được phân loại rõ

| Nội dung | Trạng thái của bản này | Việc cần làm |
| --- | --- | --- |
| Q3 — tỷ lệ nhóm | Đã xác nhận dùng kết quả tổng hợp thứ hạng hiện có; không xử lý riêng hoặc chặn cấu hình khác điểm tối đa | Đồng bộ chú thích/ví dụ trên Figma; xác minh nguồn và độ chính xác khi tích hợp. Không còn chờ khách hàng chọn A/B |
| Phạm vi triển khai/phát hành | Chưa chốt danh sách theo từng đợt | Đầu mối thống nhất các loại ngưỡng/công thức và điều kiện áp dụng được triển khai, nhóm trường/người dùng, luồng ghi điểm và ba đầu ra theo mục 1.4; bản tối thiểu từng trao đổi là cố định, có thể thêm tỷ lệ |
| Chi tiết UI được gắn đề xuất | Có phương án cụ thể trong file | Review mặc định tạo mới, trạng thái thêm dở, dấu phân nhánh, tập toán hạng, hành vi đổi loại và thông báo; không gọi đây là xác nhận riêng của khách hàng |
| Độ chính xác và giới hạn kỹ thuật | Hành vi phải giữ đã nêu; chưa chốt schema vật lý | Chọn miền số/độ chính xác/giới hạn đầu vào và số dòng, kiểm `S=T`, số âm, tràn và lưu/mở lại trước khi hiện thực |
| Nguồn chốt và tổng hợp đơn vị | Có thể triển khai trước bằng dummy data để không bị block | Tích hợp và kiểm chứng nguồn thật khi sẵn sàng |
| DB và cập nhật đồng thời | Có mô hình ý nghĩa và ràng buộc trong mục 12 | Hoàn tất bản thiết kế lưu cấu hình/kết quả mới, cùng tồn tại legacy, transaction/thứ tự cập nhật; trình đầu mối review thiết kế DB |
| Sao chép/năm mới/import/export/khôi phục | Hướng tích hợp đề xuất đã nêu | Chốt từng đường được hỗ trợ và hành vi khi thiếu phần mới hoặc không remap được; không để giới hạn ẩn |
| Chứng minh tích hợp | Chưa có kết quả thực thi của feature mới trong tài liệu | Kiểm quyền, lưu điểm, batch, lỗi, nguồn chốt, Excel, màn học sinh/API/PDF và phiếu thực theo phần được triển khai |

Các câu đã chốt không được mở lại như lựa chọn A/B: dùng maximum hiện hành cho tỷ lệ độc lập; cho chọn phần lẻ; chấp nhận ngưỡng âm hợp lệ; ngừng dùng kết quả cũ sau lần xét không tạo được ngưỡng; giữ kết quả sau xóa rule cuối đến khi chạy lại; phiếu dừng ở điều kiện khớp đầu tiên; công khai kết hợp hiệu ứng khác và khử trùng hiệu ứng giống nhau.

Phần không phụ thuộc trung bình có thể được chuẩn bị độc lập với tích hợp nguồn chốt, nhưng vẫn phải hoàn thành từ cấu hình → xét → kết quả chung → đầu ra trong phạm vi được chọn. Một phần còn chờ nguồn kỹ thuật không tự làm phần nghiệp vụ đã chốt trở thành chưa rõ.

### 13.2. Cách sử dụng Figma và nguồn gốc xác nhận

- [Figma tiếng Nhật — hướng dẫn đọc và thiết kế hiện hành](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-1631): tham chiếu bố cục, điều hướng và trạng thái màn. Các link cụ thể ở mục 3 cùng thuộc trang Japanese Design. Đã đối chiếu cấu trúc, ghi chú tổng thể và các màn chính; chưa phải chứng nhận mọi chi tiết tương tác/pixel hoặc bản vẽ đã được khách hàng duyệt toàn bộ.
- [Phản hồi và ảnh gốc ngày 24/09](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1790245548913629?thread_ts=1789563761.146189&cid=C0BRGJA6XDE): cơ sở nhiều cấu hình/ưu tiên, điều kiện áp dụng, chuỗi công thức và quy trình tổng hợp–tính toán.
- [Q&A cuộc họp ngày 24/09](https://tryhand.slack.com/files/U096NBBJLSU/F0C498QAKAQ/2026-09-24_______qa___________________.md?origin_team=T08LS8ZGDTP): nguồn xác nhận nền; nội dung cần dùng đã được trình bày trong spec, không yêu cầu mở tệp này để hiểu chức năng.
- [Phản hồi Q1–Q7.2 ngày 25/09](https://app.slack.com/client/T08LS8ZGDTP/C0BRGJA6XDE/thread/C0BRGJA6XDE-1789563761.146189/1790315716.848689): nguồn của các quyết định bổ sung về maximum, phần lẻ, ngưỡng âm, vòng đời kết quả và hiển thị.
- Xác nhận Q3 bổ sung ngày 25/09 do người phụ trách cung cấp nguyên văn trong phiên, gồm nội dung sau trao đổi với MW và câu “về cơ bản, chỉ cần dùng nguyên kết quả tổng hợp thứ hạng hiện tại”. Chưa có permalink riêng cho phản hồi bổ sung; không gán phản hồi này cho liên kết Slack phía trên.

Các quy tắc cần triển khai và ví dụ kỳ vọng đều nằm trong tài liệu này. Nếu bản vẽ hoặc dữ liệu mẫu khác với quy tắc nghiệp vụ đã xác nhận, đối chiếu và sửa phần khác biệt trước khi triển khai; không dùng một hình cũ để khôi phục chế độ xét riêng, floor bắt buộc hoặc chính sách giữ kết quả đã bị thay thế. Việc hoàn tất tài liệu không đồng nghĩa duyệt phát hành toàn bộ feature.
