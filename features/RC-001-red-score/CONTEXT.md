# Context chuẩn của chức năng điểm đỏ（赤点）

Cập nhật: **30/09/2026 — ưu tiên một cột setting_status; Q35–Q38 đã được khách hàng xác nhận, AND chỉ trong từng rule. Tài liệu đã cập nhật; Figma MW đã được kiểm trực tiếp và đồng bộ ngày 30/09**.

**Tài liệu này là source of truth của feature:** đầu vào chuẩn để so sánh thay đổi, chỉnh thiết kế, lập task, tiêu chí nghiệm thu và triển khai. Việc đổi vai trò nguồn chuẩn do người phụ trách yêu cầu trong phiên ngày 24/09. Tài liệu được đặt cùng Q&A đã xác nhận trong thư mục context; nội dung không còn là baseline ngày 23/09.

**Trạng thái:** đã tổng hợp các yêu cầu/xác nhận hiện hành, những quyết định còn mở và giới hạn tích hợp. Chưa phải phê duyệt toàn bộ thiết kế, phạm vi phát hành hoặc xác nhận tính năng đã được triển khai. Không biến “research đã làm rõ” thành “nghiệp vụ đã đồng ý”.

**Trạng thái thiết kế:** nguồn mockup hiện hành là [file Figma của Movitation Works (MW)](#design-updated), do người phụ trách cung cấp và xác nhận đã cập nhật UI. Ngày 30/09/2026 canvas file MW đã được đối chiếu trực tiếp: năm phản hồi ①–⑤ đã thể hiện, file không có prototype (xem [checklist](docs/v2/figma-update-checklist.vi.md)). Việc xếp hàng ngang, đánh dấu thao tác và đồng bộ chú thích Q3 được ghi bên dưới là bằng chứng của bản Nhật trước khi đổi file; không tự coi đã kiểm lại các nội dung đó trên file MW. Chỉ sử dụng bản Nhật; bản Figma tiếng Việt đã được người phụ trách xác nhận xóa và không còn thuộc phạm vi đồng bộ. Thiết kế DB/tích hợp và phạm vi phát hành vẫn cần hoàn thiện riêng. Xem [phạm vi ảnh hưởng của Q3](#q3-design-impact) và [việc còn lại](#design-pending).

## Mục lục

**Nguồn mockup hiện hành:** dùng [link Figma MW tại mục 4.4](#design-updated), file key `iAB9nFC3RuqxbLUMsh79jd`, node được cung cấp `0:1`. Các link của file `O2fNFrlnuG8XdQlQIc3H3T` là tham chiếu lịch sử. Node/frame của file cũ không được tự ghép vào URL file MW.

- [1. Nguồn chuẩn và cách áp dụng](#sources)
- [2. Thiết kế đầy đủ, triển khai và phát hành có giới hạn](#scope)
- [3. Yêu cầu hiện hành](#bindings)
- [4. Màn hình và ảnh tham chiếu gốc](#figma)
  - [Thiết kế Figma đã cập nhật ngày 25/09](#design-updated)
- [5. Công thức, nguồn và luồng thực hiện](#rules)
- [6. Ba đầu ra](#outputs)
- [7. Điểm tối đa và dữ liệu cũ](#maximum)
- [8. Tích hợp: điều đã biết, việc còn phải làm](#code)
- [9. Trạng thái xác nhận và tác động tới thiết kế](#qa)
  - [Ảnh hưởng sau khi Q3 đã xác nhận](#q3-design-impact)
  - [Các phần thiết kế còn pending](#design-pending)
  - [Ba phản hồi review DB và bài học thiết kế ngày 28/09](#db-review-20260928)
  - [Năm phản hồi review và lessons ngày 29/09](#review-consistency-20260929)
  - [Xác nhận và trạng thái thiết kế ngày 30/09](#review-consistency-20260930)
- [10. Bằng chứng và giới hạn](#evidence)
- [11. Những nội dung cũ đã bị thay thế](#history)
- [12. Cập nhật khi có phản hồi mới](#next)

<a id="sources"></a>

## 1. Nguồn chuẩn và cách áp dụng

### 1.1. Thứ tự áp dụng từ lần cập nhật này

1. **Context này** cung cấp yêu cầu hiện hành và trạng thái từng quyết định.
2. Xác nhận/thay đổi mới được người có thẩm quyền cho phép áp dụng được đối chiếu với context, ghi rõ phần thay thế và cập nhật vào đây trước khi dùng làm baseline cho công việc tiếp theo.
3. [Q&A đã xác nhận](sources/confirmed-business-qa.vi.md) là bản đọc theo câu hỏi, bổ trợ context mà không tạo nguồn chuẩn cạnh tranh. Bộ câu hỏi cũ đến Q33 đã có câu trả lời; Q34–Q38 đã có trả lời mới ngày 30/09: ưu tiên setting_status, xác nhận AND trong rule và các hành vi UI. Các việc thiết kế/tích hợp tại mục 9.5 được đọc cùng mục 9.7–9.8.
4. Research ngày 24/09 cung cấp nền tích hợp; điều tra ngày 25/09 bổ sung luồng maximum và thứ tự hiển thị; đối chiếu source ngày 28/09 bổ sung DB-R3 tại mục 9.6. Trạng thái quyết định trong research cũ là lịch sử; dùng context này và Q&A tiếng Việt đã bổ sung Q32–Q33 ngày 28/09 để xác định trạng thái hiện hành. Code chứng minh hiện trạng, không tự sửa yêu cầu. Các báo cáo research ngày 24–25/09 được nhắc ở đây là tài liệu lịch sử không kèm trong repository này.
5. Google Sheets, các spec/task/AC cũ, report phân tích và mockup cũ là **nguồn lịch sử hoặc tài liệu dẫn hướng**, không còn là source of truth của feature. Không tự nhập lại điều khoản từ Sheets nếu trái hoặc chưa được ghi nhận trong context.

Nếu phát hiện khác biệt giữa context và xác nhận gốc, ghi nhận khác biệt, sửa đúng phần có căn cứ và cập nhật Q&A tương ứng. Không âm thầm chọn cách hiểu tiện cho implementation. Một đề xuất A trong Q&A chưa có câu trả lời không trở thành mặc định được duyệt.

### 1.2. Căn cứ của lần cập nhật

- Ngày 28/09/2026, người phụ trách cung cấp link file Figma `iAB9nFC3RuqxbLUMsh79jd`, node `0:1`, xác nhận đây là file của Movitation Works và thay cho link mockup trước. Link hiện hành được ghi tại mục 4.4. Đây là xác nhận về nguồn thiết kế; lượt cập nhật context không kiểm canvas, quyền truy cập hay ánh xạ frame trong file mới.

- Ngày 28/09/2026, người phụ trách xác nhận trong phiên rằng bản Figma tiếng Việt đã được xóa, chỉ còn sử dụng bản tiếng Nhật, và yêu cầu cập nhật tài liệu. Đây là xác nhận về nguồn thiết kế hiện hành, không thay đổi nghiệp vụ Q3; lượt cập nhật tài liệu này không kiểm lại canvas hoặc thực hiện thao tác xóa trên Figma.

- Xác nhận Q3 bổ sung ngày 25/09 do người phụ trách cung cấp nguyên văn trong phiên: sau trao đổi với MW, không cần xử lý riêng hoặc ngăn cấu hình khác điểm tối đa trong cùng nhóm; tình huống đó không được gây lỗi làm dừng xử lý. Câu bổ sung xác nhận về cơ bản dùng nguyên kết quả tổng hợp thứ hạng hiện tại. Chưa có permalink riêng cho hai phản hồi này; không gán chúng cho liên kết Slack bên dưới.
- [Phản hồi Slack ngày 25/09, Q1–Q7.2 và ba ảnh đính kèm](https://app.slack.com/client/T08LS8ZGDTP/C0BRGJA6XDE/thread/C0BRGJA6XDE-1789563761.146189/1790315716.848689). Đã đọc nguyên văn và đối chiếu với Q&A đã gửi; người phụ trách yêu cầu cập nhật Q&A và context theo những nội dung đã xác nhận. Bản reply soạn trong phiên chưa được coi là tin nhắn đã gửi hoặc xác nhận bổ sung từ khách hàng.
- [Message Slack ngày 24/09 và sáu ảnh gốc](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1790245548913629?thread_ts=1789563761.146189&cid=C0BRGJA6XDE).
- [Trả lời Q&A cuộc họp ngày 24/09](https://tryhand.slack.com/files/U096NBBJLSU/F0C498QAKAQ/2026-09-24_______qa___________________.md?origin_team=T08LS8ZGDTP), đối chiếu tệp người phụ trách cung cấp trong phiên.
- Q&A r16 tiếng Nhật/Việt và các phản hồi cũ còn hiệu lực, đã đối chiếu từng phần trong research; giữ nguyên các file lịch sử.
- Nền research ngày 24/09 tại commit 3b32492d439a30d323af2b2369534b6b680ef23a; phần kiểm lại ngày 25/09 về Q1/Q3/Q7.1 tại commit 7652109b4542ecc9fb392bde6f2afb755a244316. Không coi các phần chưa kiểm lại là đã được tái xác minh toàn bộ; source không chứng minh ad31 đang chạy đúng cùng bản.

**Ảnh chuẩn cho yêu cầu tham chiếu màn hình là ảnh gốc trong message Slack.** Không dùng ảnh dựng, sơ đồ hoặc diễn giải trong report làm chuẩn thay thế. Figma là bản thiết kế cần sửa theo yêu cầu; hình đã vẽ không tự xác nhận quyết định nghiệp vụ.

### 1.3. Cách đọc trạng thái

| Nhãn | Ý nghĩa |
| --- | --- |
| Yêu cầu hiện hành / đã xác nhận | Được sử dụng cho thiết kế trong phạm vi đã ghi; vẫn không đồng nghĩa đã phát hành |
| Hướng thiết kế đã xác nhận | Đã rõ khả năng và luồng cần có; chi tiết được ghi là còn mở không tự được chốt |
| Đã xác minh source | Có bằng chứng hiện trạng; không phải xác nhận mong muốn mới |
| Đề xuất kỹ thuật | Cách làm có căn cứ để team thiết kế, có thể thay bằng cách tương đương |
| Open Q | Quyết định nghiệp vụ chưa có câu trả lời; các nhánh kết quả liên quan chưa được nghiệm thu |
| Gap tích hợp | Việc tìm nguồn/thiết kế/kiểm chứng của team, không chuyển thành câu hỏi chọn DB hoặc framework |

<a id="scope"></a>

## 2. Thiết kế đầy đủ, triển khai và phát hành có giới hạn

### 2.1. Mục tiêu

Thiết lập điều kiện cho một mục đánh giá, xét điểm cuối của từng học sinh và sử dụng chung kết quả ở Trích xuất thành tích（成績抽出）, Công khai thành tích（成績公開） và Công cụ phiếu điểm（通知表ツール）.

Đây là một phần hỗ trợ đánh giá tương đối dựa trên ngưỡng; không có nghĩa hỗ trợ mọi quy chế phân phối xếp loại, top %, xử lý đồng hạng hoặc toàn bộ liên kết thứ hạng.

### 2.2. Phạm vi thiết kế đầy đủ

Thiết kế phải biểu diễn được toàn bộ các phần sau, kể cả phần có thể chưa phát hành ngay:

| Phần | Nội dung phải được xem xét trong thiết kế | Giới hạn phát hành |
| --- | --- | --- |
| Kiểu điểm | Số nguyên, số thập phân, điểm theo đơn vị bài học | Đã xác nhận là đối tượng; không quay lại hỏi có hỗ trợ đơn vị không |
| Cấu trúc thiết lập | Nhiều thiết lập cho một mục, điều kiện áp dụng, ưu tiên và hai màn chi tiết | Hoãn trung bình không có nghĩa bỏ cấu trúc nhiều thiết lập |
| Điểm cố định | Ngưỡng và lựa chọn nhỏ hơn/nhỏ hơn hoặc bằng | Là cấu hình tối thiểu được trao đổi |
| Tỷ lệ điểm tối đa | Dùng điểm tối đa hiện hành đúng ngữ cảnh; cho chọn xử lý phần lẻ của ngưỡng | Có thể gồm trong bản đầu; quyết định nghiệp vụ đã rõ nhưng phạm vi phát hành chưa chốt |
| Công thức trung bình | Nguồn trung bình, chuỗi bốn phép toán, kết quả dòng trước, xử lý phần lẻ | Có thể phát hành sau |
| Phân nhánh trung bình/tỷ lệ | Điều kiện áp dụng dựa trên nguồn tổng hợp, không nhét hai nhánh cứng vào từng form | Q3 đã xác nhận kế thừa kết quả tổng hợp hiện hữu; còn phụ thuộc phạm vi phát hành và tích hợp nguồn |
| Luồng chạy | Đăng ký điểm, CSV/liên kết điểm có liên quan, tính hàng loạt, nguồn tổng hợp | Mỗi lát cắt phải xác định đủ đường vào được hỗ trợ |
| Ba đầu ra | Kết quả dùng chung, cấu hình trình bày riêng, bảo toàn ẩn điểm/quyền | Bản phát hành phải dùng được từ thiết lập đến đầu ra tương ứng |
| Dữ liệu và vòng đời | Cấu hình mới/kết quả mới; đơn vị; cùng tồn tại legacy; sao chép/năm mới/import-export theo phạm vi hiện có | Danh sách luồng hỗ trợ phải ghi rõ trước phát hành |

Thiết kế được tiếp tục hoàn thiện và mở rộng khi có phản hồi mới, nhưng phần mở rộng phải được ghi vào context với trạng thái phù hợp. “Thiết kế đầy đủ” không cho phép thêm ngôn ngữ công thức tự do, hệ thống biến tùy ý, queue mới hoặc mọi tính năng tương lai chưa có nhu cầu xác nhận.

### 2.3. Phạm vi triển khai/phát hành

**Chưa chốt danh sách cuối cùng.** File trả lời nêu bản tối thiểu chỉ điểm cố định; message đi kèm vẫn để khả năng thêm tỷ lệ điểm và giao đầu mối thống nhất Sales/CS cùng trường. Giữ đúng khác biệt này.

Trước khi triển khai/phát hành phải xác định riêng: loại điều kiện được bật, loại điểm/luồng ghi được bao phủ, trường/người sử dụng/phạm vi thao tác, ba đầu ra và phụ thuộc nguồn tổng hợp. Không lấy toàn bộ bản thiết kế làm phạm vi triển khai tự động.

Có thể thiết kế đầy đủ và phát hành từng phần:
- Phần không phụ thuộc trung bình có thể tách khỏi việc tích hợp nguồn chốt, nhưng vẫn cần kết quả dùng chung và đủ đường đăng ký/chạy lại.
- Các quyết định về ngưỡng phần lẻ, điểm tối đa hiện hành và thiếu dữ liệu đã có phản hồi ngày 25/09; đưa tỷ lệ vào bản phát hành vẫn cần xác định phạm vi, tích hợp và kiểm chứng tương ứng.
- Chỉ thêm công thức/phân nhánh trung bình khi có nguồn đúng ngữ cảnh, ưu tiên bản chốt, xử lý lỗi và quy trình vận hành được xác định.
- Không biểu thị một phần chưa triển khai như lựa chọn hoạt động trên màn sản phẩm.

**Loại khỏi bản đầu:** A/B/C và đạt/không đạt dạng lựa chọn. Chưa chốt cách mở rộng chúng. Không chuyển dữ liệu điểm đỏ cũ. Không thêm quản lý hoàn tất mọi môn, chặn phát hành vì thiếu kết quả đỏ, lưu cố định toàn bộ phiếu hoặc vòng lặp tự hội tụ tính–tổng hợp.

<a id="bindings"></a>

## 3. Yêu cầu hiện hành

| ID | Quy tắc | Phạm vi/ngoại lệ |
| --- | --- | --- |
| R01 | Quyền thiết lập theo quyền chức năng và quyền sửa đúng mục | Không mặc định chỉ nhân viên nội bộ; không mở quyền batch toàn trường từ quyền sửa một mục |
| R02 | Xét điểm cuối đã lưu, gồm dự kiến và nhập/sửa tay | Không yêu cầu mục phải có AutoRating; không tự loại điểm có số vì cờ chưa dự thi |
| R03 | Phân biệt số 0, ô trống và chưa có kết quả | Không thay trống bằng 0; không coi chưa có dấu đỏ là đã đạt |
| R04 | Cho chọn nhỏ hơn hoặc nhỏ hơn hoặc bằng | Không tiếp tục bắt mọi rule dùng nhỏ hơn |
| R05 | Một mục có nhiều cấu hình, chọn theo ưu tiên giống tính toán tự động | Không gộp kết quả mọi rule hoặc tự lấy ngưỡng lớn nhất |
| R06 | Công thức trung bình dùng nguồn được chọn và bốn phép toán | Kết quả là ngưỡng; không ghi/xóa/giới hạn điểm học sinh để tính ngưỡng |
| R07 | Chọn nhánh bằng trung bình trước làm tròn; công thức có thể xử lý phần lẻ theo bước; tỷ lệ điểm tối đa cũng cho chọn xử lý phần lẻ | Không cắt điểm học sinh thay cho ngưỡng; không còn floor bắt buộc cho mọi tỷ lệ |
| R08 | Đúng kỳ/bộ tổng hợp/nhóm/môn/mục và ngữ cảnh đơn vị; ưu tiên bản chốt, chưa chốt dùng kết quả đã chạy mới nhất | Không lấy trung bình tập đang lọc xuất; không tự đổi nguồn khi thiếu |
| R09 | Fixed/rate độc lập không cần trung bình; tỷ lệ dùng điểm tối đa hiện hành đúng ngữ cảnh | Bản chốt là chính sách của nguồn trung bình, không thay M hiện hành của tỷ lệ độc lập; nếu điều kiện áp dụng đọc trung bình thì vẫn phụ thuộc trung bình |
| R10 | Không có chế độ thủ công/tự động riêng; xét sau hoàn tất xử lý điểm | Tính hàng loạt theo thao tác hiện có cũng phải bao phủ xét đỏ |
| R11 | Giữ kết quả trước khi chưa chạy lại, kể cả xóa thiết lập cuối; khi đã xét lại mà không tạo được ngưỡng hợp lệ hoặc không có thiết lập áp dụng thì ngừng dùng kết quả cũ | Thiếu dữ liệu là chưa xét được; không có điều kiện là không áp dụng; cả hai không phải kết luận đã đạt và không xóa điểm học sinh |
| R12 | Không chặn đầu ra chỉ vì thiếu/chờ xét; xem/xuất không tự xét lại | Giữ quyền/lịch/ẩn điểm và cảnh báo đang áp dụng |
| R13 | Ba đầu ra dùng chung kết quả có hiệu lực; phiếu xét điều kiện khớp đầu tiên, dòng đỏ sau ô chọn/trước ô trống; công khai kết hợp dấu khác, dấu trùng một lần | Không làm lộ điểm đã ẩn/gạch chéo; bản đầu không thêm nền đỏ riêng ở công khai/PDF |
| R14 | Không chuyển legacy; không phá consumer hoặc đổi nghĩa ngưỡng cũ | Không dùng legacy làm fallback ngầm khi chưa có rule mới |
| R15 | Điểm theo đơn vị thuộc đối tượng | Không lấy mặc định thay maximum đơn vị hoặc gộp hai đơn vị chỉ vì cùng mục |
| R16 | Thiết kế đầy đủ và lát cắt phát hành là hai quyết định | Phạm vi release chờ đầu mối Sales/CS; không tự triển khai mọi phần |
| R17 | Ngưỡng âm được tính hợp lệ thì xét bình thường, không ép về 0 | Không chuyển sang nhánh không tính được chỉ vì T âm; thiếu toán hạng/chia 0 vẫn là không tạo được ngưỡng hợp lệ |
| R18 | Tỷ lệ nhóm kế thừa kết quả tổng hợp thứ hạng hiện có theo Q3 | Không xử lý nghiệp vụ riêng hoặc chặn cấu hình khác điểm tối đa trong cùng nhóm; tình huống đó không được gây lỗi làm dừng xử lý. Giữ nguồn/độ chính xác và quy tắc dữ liệu không hợp lệ đã có |

Quy tắc chọn ưu tiên được source xác minh: chọn cấu hình đầu tiên khớp đối tượng **trước khi** tính công thức; không tự thử cấu hình thấp hơn khi cấu hình đã chọn thiếu dữ liệu. Đây là cách cụ thể hóa yêu cầu tham chiếu cơ chế hiện có, không phải lựa chọn “tính thành công đầu tiên”. Phản hồi ngày 25/09 yêu cầu ngừng dùng kết quả cũ sau lần không tạo được ngưỡng hợp lệ (Q5 đã gửi, nội dung tương ứng B) hoặc sau lần xác định không có thiết lập áp dụng (Q6.1-A); giữ trước trong lúc chưa chạy lại, kể cả đã xóa cấu hình cuối (Q6.2-B).

<a id="figma"></a>

## 4. Màn hình và ảnh tham chiếu gốc

### 4.1. Bản đồ ảnh gốc ngày 24/09 và 25/09

Số ảnh theo message Slack, không theo thứ tự ảnh đính kèm đảo ngược trong chat. ID tệp chỉ để phân biệt ảnh cùng tên.

| Ảnh | ID tệp Slack | Màn/khu vực gốc và ý nghĩa |
| --- | --- | --- |
| 1 | F0C3YS1A1EF | Thiết lập phương thức đăng ký（登録方法設定）: chuỗi phép tính |
| 2 | F0C3PPCEL3H | Thiết lập tính toán tự động（自動計算設定）: danh sách chi tiết và Ưu tiên（優先順位） |
| 3 | F0C3YU779NF | Thiết lập đối tượng tính toán（計算対象設定）: đối tượng và bộ lọc |
| 4 | F0C407CNFRT | Cùng màn phương thức đăng ký, khoanh cột Xử lý phần lẻ（端数処理） |
| 5 | F0C3PU11ZDM | Thiết lập tổng hợp thứ hạng（順位集計設定） → Thiết lập chi tiết（詳細設定） |
| 6 | F0C47901PS5 | Tổng hợp thành tích（成績集計）: nút xanh và nút cam |

Các ảnh tính toán tự động là mẫu cho thiết kế mới, không phải yêu cầu sửa mọi chức năng hiện hữu trong các màn đó. Ảnh số 5 đang chọn Thực hiện（実行する）; quy trình mới yêu cầu Không thực hiện（実行しない） khi vận hành đánh giá tương đối.

Ba ảnh trong phản hồi ngày 25/09 có thứ tự riêng:

| Ảnh ngày 25/09 | ID tệp Slack | Nội dung và giới hạn |
| --- | --- | --- |
| 1 | F0C47LTLK3P | Form tạo Thiết lập điểm tối đa（満点設定）, trường demo 515/năm 2026; chưa có mục/lựa chọn được nhập, không chứng minh đã chạy AutoRating |
| 2 | F0C4EM5BW81 | Sửa Điểm số（得点） trong Thiết lập ô nhập（入力欄設定）, maximum 200/minimum 0, áp dụng Bài kiểm tra năng lực（実力テスト） giữa kỳ học kỳ 1/2; đã đối chiếu đúng mục live |
| 3 | F0C48GSCWRK | Thiết kế tùy chọn phiếu: môn cụ thể → ô chọn → đỏ → ô trống; dòng đỏ mới là thiết kế, không phải chứng minh ad31 đã có |

### 4.2. Luồng và phần cần thay

**Thiết lập ô nhập（入力欄設定） → danh sách thiết lập điểm đỏ của mục → điều kiện áp dụng hoặc ngưỡng/công thức.**

- Danh sách có tên, đối tượng, tóm tắt ngưỡng, thêm/xóa, ưu tiên; tham chiếu [màn danh sách gốc](https://ad31.schoolstg.mwsite.work/admin/grade_report_setting/auto_rating/edit/18d912002d0e11f1a3fe0ab8afae87b7).
- Điều kiện áp dụng tham chiếu [màn chọn đối tượng gốc](https://ad31.schoolstg.mwsite.work/admin/grade_report_setting/auto_rating/edit_condition/18e1ac622d0e11f1a22b0ab8afae87b7/18e1ad342d0e11f1b7b60ab8afae87b7). Không mặc định phải có một UI AND/OR mới; dùng bộ lọc phù hợp hiện có rồi bổ sung điều kiện trung bình/tỷ lệ.
- Ngưỡng/công thức tham chiếu [màn công thức gốc](https://ad31.schoolstg.mwsite.work/admin/grade_report_setting/auto_rating/edit_formula/18e1ac622d0e11f1a22b0ab8afae87b7/18e1ad342d0e11f1b7b60ab8afae87b7). Phân biệt toán hạng, phép toán, xử lý phần lẻ và phép so sánh cuối.
- Bỏ radio hai chế độ xét riêng. Màn lưu thiết lập không được tạo cảm giác đã xét xong. Hướng thiết kế là dùng thao tác chạy lại hiện có; số lượng/vị trí nút còn phải trình bày nhất quán, không giữ nút cũ chỉ vì mockup từng có.
- Không phục hồi radio tùy chọn bản chốt/mới nhất. Fixed/rate độc lập không hiện các trường nguồn trung bình không cần thiết.
- Không giữ nguyên bốn form đóng cứng của mockup cũ làm giới hạn thiết kế công thức mới. Cách tổ chức loại/mẫu công thức là phần thiết kế, chưa được quyết định bởi tên frame.

[File Figma hiện hành của MW](#design-updated) phải được kiểm đúng page/frame trước khi chỉnh. Không dùng node lịch sử hay ảnh của report để khẳng định canvas hiện tại. Lượt cập nhật UI ngày 25/09 đã kiểm hai trang và chỉnh các phần chịu ảnh hưởng trên file cũ, ghi tại mục 4.4; bằng chứng đó không phải kiểm chứng file MW.

Các yêu cầu chỉnh màn trong phần này vẫn là nội dung cần đối chiếu khi hoàn thiện thiết kế. Trạng thái chờ nghiệp vụ, cần đồng bộ bản vẽ và cần hoàn thiện thiết kế kỹ thuật được phân biệt tại [mục 9.5](#design-pending), không gom tất cả thành “đang chờ Q&A”.

### 4.3. Đổi loại và xử lý phần lẻ: điều source đã giải đáp

Đổi phương thức tính trong cùng phiên hiện chỉ ẩn/hiện; server có thể ghi nhiều khối dữ liệu, nhưng khi mở lại chỉ phục hồi loại đang dùng. Đổi loại toán hạng có trường hợp đặt lại dropdown. Vì vậy “luôn giữ” và “luôn xóa ngay” đều không mô tả đầy đủ hiện trạng.

**Đề xuất kỹ thuật:** theo pattern hiện có, không thêm kho lưu lịch sử các loại ẩn; mô tả rõ cùng phiên và sau lưu/mở lại. Đây là kết quả hoàn thành yêu cầu nghiên cứu Q12 cũ, không phải một câu trả lời mới chấp thuận xóa mọi input.

UI công thức hiện mặc định không xử lý phần lẻ, vị trí chữ số 1–9; phương thức có làm tròn thông thường/lên/xuống. Vị trí 1 nghĩa xử lý chữ số thập phân thứ nhất để còn số nguyên; vị trí 2 còn một chữ số. Trên form 03-C của Figma, ô nhập hiển thị 小数第［p］位 kèm chú thích “位置1は整数”: p=1 nghĩa là còn số nguyên. Các giá trị này là **căn cứ đề xuất kế thừa**, chưa tự được duyệt thành mọi giới hạn của tính năng mới. Thiết kế phải ghi rõ giá trị/mặc định được chọn, không gọi “không làm tròn” là độ chính xác vô hạn.

<a id="design-updated"></a>

### 4.4. Thiết kế Figma hiện hành

- **Nguồn hiện hành:** [Figma — Movitation Works (MW)](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/%25E8%25B5%25A4%25E7%2582%25B9%25E5%2588%25A4%25E5%25AE%259A%25E5%25AF%25BE%25E5%25BF%259C?node-id=0-1&p=f&t=uSbj1CRisHDeJszF-0). File key: `iAB9nFC3RuqxbLUMsh79jd`; node trong link: `0:1`. Dùng file này cho các lần đối chiếu và cập nhật mockup tiếp theo. Người phụ trách xác nhận đây là file MW đã cập nhật UI; canvas và các frame liên quan đã được kiểm trực tiếp ngày 30/09/2026 (xem [checklist](docs/v2/figma-update-checklist.vi.md)).
- **Tham chiếu lịch sử:** [bản Figma tiếng Nhật trước khi chuyển sang MW](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-1631), trang `Japanese Design`. Các bảng nội dung, link chương và node dưới đây ghi lại lần kiểm trên file cũ, không phải mapping sang file MW. Cần tìm đúng frame trong file mới; không thay file key rồi giữ nguyên node ID cũ.

Lịch sử: lượt đồng bộ Q&A đầu tiên chỉnh chữ, hộp thoại và chú thích trên hai bản; lượt tổ chức lại tiếp theo chỉ thay bố cục bản Nhật, tái sử dụng các màn gốc và giữ font Noto Sans JP. Hiện chỉ bản Nhật còn được sử dụng; thông tin kiểm chứng hai ngôn ngữ bên dưới là bằng chứng của thời điểm trước, không phải yêu cầu duy trì hai bản.

| Phần | Nội dung hiện hành |
| --- | --- |
| Q1/Q2/Q4 | Ghi nhận dùng maximum hiện hành, cho chọn xử lý phần lẻ ngưỡng tỷ lệ và chấp nhận ngưỡng âm; bỏ nhãn còn chờ xác nhận của các quyết định này |
| Q3 — bản Nhật hiện hành | Đã bỏ chú thích giả định Q3-A và ví dụ trộn 20/50, 80/100; ghi rõ dùng kết quả tổng hợp thứ hạng hiện có, không thêm cách tính riêng hoặc lỗi dừng chỉ vì khác điểm tối đa. Không còn công việc đồng bộ bản Figma tiếng Việt |
| Q5 — thiếu dữ liệu | Sửa nội dung màn trạng thái 06A và chú thích công thức/nguồn/maximum: lần xét không tạo được ngưỡng hợp lệ chuyển chưa xét được, không dùng kết quả cũ; không coi là đã đạt hoặc xóa điểm |
| Q6.1/Q6.2 — không áp dụng/xóa cuối | Sửa hộp thoại 02D và chú thích đầu ra: xóa cuối vẫn giữ kết quả trước tới lần chạy lại; sau lần xác định không còn thiết lập áp dụng mới ngừng dấu/lọc. Bổ sung yêu cầu dùng thao tác chạy lại hiện hữu cả khi mục đã hết rule |
| Q7.1/Q7.2 — đầu ra | Giữ cách trình bày đã đúng trong bản vẽ, chuyển chú thích thành đã xác nhận: phiếu dùng điều kiện khớp đầu tiên, đỏ sau ô chọn/trước ô trống; công khai kết hợp hiệu ứng khác nhau và không lặp dấu trùng; không thêm nền đỏ riêng vào công khai/PDF |

**Kiểm chứng lượt đồng bộ Q&A:** đã xem bố cục tổng thể, kiểm trực quan hộp xóa ở cả hai ngôn ngữ và vùng kết quả thiếu dữ liệu; kiểm font trên các lớp đã sửa. Đã tải lại file và đọc lại các nội dung thay đổi quan trọng. Khi đó mỗi trang có sáu vị trí ghi giả định Q3-A; đây là số của bố cục trước khi bản Nhật được tổ chức lại, không phải yêu cầu lặp chú thích sáu lần. Đây là kiểm tra nội dung/bố cục Figma, không phải chạy prototype đầy đủ hoặc nghiệm thu ứng dụng.

**Tổ chức lại riêng bản Nhật:** 15 màn chính, mỗi màn xuất hiện một lần trong luồng mới; trạng thái bổ sung được cắt đúng vùng liên quan và đặt ngay dưới màn. Mỗi chương có tiêu đề, thao tác/kết quả và chú thích ngắn tại chỗ. Không còn một bảng note tổng hợp dài đứng tách khỏi các màn. Quy tắc chung nằm ở chương 00; Q3 đã được ghi là xác nhận tại hướng dẫn đọc và chương điều kiện. Bố cục bản Nhật nay có 01–04 trên một hàng, 05–07 ở hàng dưới; chú thích thao tác/mũi tên nằm trên lớp riêng và các trạng thái khác nhau của cùng form không được vẽ thành chuỗi chuyển màn.

| Chương bản Nhật | Nội dung |
| --- | --- |
| [00 — Hướng dẫn đọc](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-1631) | Sơ đồ đọc ngang, cách hiểu mũi tên và Q3 đã xác nhận |
| [01 — Điểm vào, danh sách, xóa](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-2) | Màn thiết lập, ưu tiên, danh sách trống và hộp xóa thiết lập cuối |
| [02 — Điều kiện và nguồn trung bình](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-1663) | Trung bình điểm, tỷ lệ nhóm theo kết quả thứ hạng hiện có, tất cả/lọc đối tượng và nguồn tham chiếu; hai hình chính là trạng thái khác nhau của cùng form |
| [03 — Ngưỡng và công thức](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-1885) | Cố định, tỷ lệ maximum, công thức, xử lý phần lẻ, chưa nhập và lỗi nhập |
| [04 — Thực hiện và kết quả](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-2423) | Tắt tự tổng hợp, thứ tự xanh/cam, thiếu dữ liệu và thời điểm dùng/ngừng dùng kết quả cũ |
| [05 — Trích xuất và Excel](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-2559) | Thiết lập cạnh đầu ra; giữ ví dụ 0 kết quả và lỗi thiếu ký hiệu |
| [06 — Công khai và màn học sinh](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-2689) | Thiết lập cạnh kết quả; phân biệt có/không có cấu hình và kết hợp hiệu ứng |
| [07 — Phiếu điểm và PDF](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-2732) | Thứ tự điều kiện, mẫu phiếu và các lựa chọn nguyên trạng/ngoặc/ký hiệu |

Đã kiểm ảnh xuất của tám chương trước lượt xếp ngang; lượt mới kiểm trực quan các màn 01, 02, 04, 05 trên canvas và đọc lại chú thích Q3 ở 00, 02; không thấy các câu cũ giữ kết quả khi xét lại thiếu dữ liệu hoặc bỏ dấu ngay khi xóa cuối. Bố cục Nhật cũ tại node `4523:2` được giữ ở dạng tham chiếu ẩn, tên **Tham chiếu — bố cục cũ（参考｜旧配置（非表示・9月25日内容を保持））**; note được hỏi tại `4536:603` thuộc bố cục cũ đó. Các quy tắc nghiệp vụ/Q&A không thay đổi trong lượt sắp xếp này.

Bản vẽ đã được cập nhật theo yêu cầu của người phụ trách; chưa tự mang trạng thái khách hàng duyệt toàn bộ thiết kế. Các file SVG/ghi chú xuất trước lượt này là tài liệu lịch sử, không ghi đè lại lên canvas mà bỏ qua các thay đổi ngày 25/09.

<a id="rules"></a>

## 5. Công thức, nguồn và luồng thực hiện

### 5.1. Giá trị xét và ngưỡng

- S: điểm số cuối cùng đã lưu của đúng ô.
- M: điểm tối đa hiện hành có hiệu lực của đúng mục/kỳ/lớp/đơn vị tại lần xét; không lấy M của bản tổng hợp đã chốt cho điều kiện tỷ lệ độc lập (Q1-A ngày 25/09).
- A: trung bình trước làm tròn từ đúng nguồn tổng hợp.
- T: ngưỡng sau các bước tính và xử lý phần lẻ đã chọn.

| Dạng | Cách hiểu hiện hành | Trạng thái / giới hạn |
| --- | --- | --- |
| Điểm cố định（固定点数） | T = N; so S với T theo dấu được chọn | Giữ giới hạn nhập 0 ≤ N ≤ M của đối tượng áp dụng lúc lưu; đây không còn là Open Q |
| Tỷ lệ điểm tối đa（得点率） | T trước xử lý phần lẻ = M hiện hành × N / 100; có lựa chọn xử lý phần lẻ | Q1-A/Q2-A đã được trả lời; mặc định không xử lý theo phương án A, giới hạn cụ thể của UI cần ghi trong thiết kế |
| Công thức trung bình | T là kết quả chuỗi có A; biểu diễn được tỷ lệ trung bình, A−N, A+N và các phép kết hợp; T âm hợp lệ vẫn được dùng | Q3 đã chốt kế thừa tỷ lệ nhóm hiện hữu; ngưỡng âm đã chốt Q4-A. Nguồn và độ chính xác còn cần kiểm khi tích hợp |
| Phân nhánh | Chọn một thiết lập bằng điều kiện áp dụng, rồi tính T của thiết lập đó | Sau chạy lại không khớp thì ngừng dùng kết quả cũ; thiếu thông tin để chọn nhánh là chưa xét được, không phải đã xác định không khớp |

Không còn quy định chung T = floor(M×N/100) hoặc floor(A×N/100). Các ví dụ cắt nguyên cũ chỉ đúng khi người thiết lập đã chọn cách xử lý đó. Giữ nguyên S khi xử lý phần lẻ của T.

**Giữ yêu cầu cảnh báo giá trị biên:** khi xác định được ngưỡng và thang điểm tương ứng, cảnh báo ngưỡng 0/maximum phải dựa trên **T cuối cùng và dấu so sánh được chọn**, không áp máy móc vào tham số N. Với A−N, N=0 cho T=A, không phải T=0. Với điểm hợp lệ không âm, T=0 và dấu nhỏ hơn không chọn ai, nhưng dấu nhỏ hơn hoặc bằng vẫn chọn điểm 0. T=M và dấu nhỏ hơn không chọn điểm đúng M, còn dấu nhỏ hơn hoặc bằng chọn cả điểm đó. Cảnh báo không tự sửa T và không thay thế kiểm tra giới hạn khi lưu điều kiện cố định.

Ràng buộc nhập kế thừa: khi lưu điều kiện cố định, giữ 0 ≤ N ≤ M của đối tượng áp dụng; phần trăm của loại tỷ lệ điểm nằm trong 0–100. Nếu cùng cấu hình nhắm tới lớp/đơn vị có M khác nhau, phải kiểm đúng phạm vi; ngưỡng không phù hợp thì thu hẹp phạm vi hoặc điều chỉnh cấu hình. Không dùng maximum mặc định để bỏ qua M thực tế thấp hơn. Câu Q8 của bản trước đã được rút: phương án cho N vượt M là đề nghị nới yêu cầu, chưa có nhu cầu mới yêu cầu nới. Việc M thay đổi sau khi rule đã lưu không tự thay T=N, không tự làm rule cố định phụ thuộc M trong mỗi lần xét và không thêm trigger. Không áp giới hạn tham số của hai công thức trung bình cũ lên toàn bộ toán hạng của chuỗi công thức mới. Miền số, bước nhập, giới hạn số dòng và độ chính xác cụ thể phải được quyết định trong thiết kế; không tự bịa giới hạn từ ảnh.

**Ngưỡng âm — đã chốt Q4-A ngày 25/09:** T âm hữu hạn được tính hợp lệ vẫn được dùng để xét bình thường. Trong miền điểm không âm, T=−5 cho kết quả không đỏ với cả hai dấu < và ≤; nếu điểm âm được phép thì so sánh đúng giá trị thật. Đây là lần xét hợp lệ, không đi vào nhánh không tạo được ngưỡng chỉ vì T âm. Không ép T về 0 bằng cơ chế chặn min/max của **điểm lưu**. Chia cho 0 hoặc thiếu toán hạng vẫn không tạo được ngưỡng hợp lệ: sau lần xét này ngừng dùng kết quả trước theo Q5, không tạo kết luận đã đạt. Yêu cầu đã chốt không phải kết quả test đã chạy.

### 5.2. Nguồn trung bình và điều kiện phân nhánh

Giữ đúng trường/năm/kỳ/bộ tổng hợp/nhóm/môn/mục/đơn vị áp dụng. Dữ liệu trung bình và các đại lượng cấu thành phải thuộc cùng bản nguồn. Trung bình trước làm tròn có thể được tính từ tổng điểm/số người đã lưu của bản đó; không tính lại trên điểm chưa tổng hợp.

Nguồn chốt có ưu tiên tự động. Nếu bản chốt được chọn thiếu dữ liệu, không tự bỏ sang một bản khác; áp xử lý thiếu dữ liệu. Xem/xuất không chọn lại nguồn để tái xét.

**Q3 đã xác nhận: kế thừa kết quả tổng hợp thứ hạng hiện có.** Theo kết quả nghiên cứu source đã ghi nhận, tỷ lệ nhóm là tổng điểm chia tổng điểm tối đa; không xây thêm cách tính trung bình tỷ lệ từng học sinh hoặc bộ tổng hợp riêng cho chức năng mới. Đây là hướng kế thừa kết quả hiện hữu, không phải xác nhận một kết quả bắt buộc cho ví dụ trộn điểm tối đa 50/100.

Khách hàng xác nhận cùng mục có điểm tối đa khác nhau giữa các lớp là cấu hình có thể thiết lập nhưng không xảy ra trong thực tế ở cùng nhóm tổng hợp; nếu khác chương trình học thì nhóm tổng hợp cũng khác. Không thêm xử lý nghiệp vụ riêng hoặc chức năng ngăn cấu hình. Nếu vẫn xảy ra, tiếp tục dùng kết quả hiện hữu; riêng sự khác điểm tối đa không được gây lỗi làm dừng xử lý.

Giữ đúng nhóm/bản nguồn, ưu tiên bản chốt và giá trị trước làm tròn. Câu “dùng nguyên kết quả hiện tại” không tự cho phép thay bằng số đã làm tròn trên màn hình. Team cần kiểm dữ liệu nguồn và độ chính xác khi tích hợp; chưa có bằng chứng rằng mọi nguồn đã đáp ứng. Thiếu nguồn hoặc dữ liệu không hợp lệ vẫn theo quy tắc chung, không thay bằng 0 hoặc tự coi là đã đạt.

### 5.3. Thời điểm thực hiện

| Sự kiện | Quy tắc hiện hành |
| --- | --- |
| Đăng ký/sửa điểm | Hoàn tất xử lý điểm liên quan rồi xét S cuối; bao gồm nhập trực tiếp, CSV và đường liên kết được hỗ trợ |
| Tính điểm hàng loạt | Cùng nghiệp vụ xét, đúng phạm vi; không chỉ chạy trên ô có công thức AutoRating |
| Lưu cấu hình | Lưu khác xét; giữ trước trong lúc chờ và hướng dẫn chạy lại |
| Đổi nhóm trung bình / nguồn tổng hợp được cập nhật | Chuẩn bị nguồn rồi đăng ký/chạy tính lại cho phạm vi chịu ảnh hưởng; không tự chạy mọi phụ thuộc |
| Đổi M | Đường hiện có gọi AutoRating thì tích hợp theo đường đó; đường chỉ lưu cấu hình chờ đăng ký/chạy lại |
| Chưa có kết quả | Không thêm dấu đỏ; không coi là đã đạt |
| Thiếu dữ liệu khi đã chạy | Không tạo được ngưỡng hợp lệ thì ngừng dùng kết quả trước; chưa xét được, không tạo kết luận đã đạt; không đổi nguồn hoặc thử cấu hình thấp hơn để có kết quả |
| Mục còn cấu hình nhưng học sinh không khớp sau chạy lại | Khi đủ thông tin xác định không có thiết lập áp dụng, ngừng dùng kết quả cũ và ảnh hưởng dấu/lọc; không áp dụng khác với chưa xét được |
| Xóa thiết lập cuối cùng, chưa chạy lại | Giữ kết quả trước tới lần đăng ký điểm/tính hàng loạt tiếp theo; lần đó xác định hết cấu hình thì ngừng dùng kết quả cũ, không xóa điểm hay bật lại legacy |
| Điểm bị xóa thành trống | Ngay khi lưu xóa thành công, ô trống và ngừng dấu/đóng góp lọc đỏ của ô trong cùng transaction; không chờ chạy lại, không xét như số 0. Lưu lỗi không được báo đã xóa |
| Xem/trích xuất/in lại | Đọc kết quả hoàn tất; không kích hoạt xét |

Quy trình trung bình: tắt tự tổng hợp → chuẩn bị đầy đủ điểm đầu vào → xanh và chờ xong → cam và chờ xong → dùng đầu ra. Tắt tự tổng hợp không tắt đăng ký điểm/tính tự động.

Ngừng dùng kết quả cũ không có nghĩa xóa vật lý toàn bộ lịch sử. Chính sách Q5 nói về lần xét không tạo được ngưỡng sử dụng từ dữ liệu hiện tại; lỗi kỹ thuật khi lưu phải được báo đúng phạm vi chưa cập nhật, không báo thành công hoặc giả định kết quả đã bị vô hiệu hóa nếu lưu thất bại. Q6.2 đòi đường chạy lại vẫn bao phủ mục đã bị xóa thiết lập cuối cùng.

Nếu cam thay chính các điểm dùng làm nguồn trung bình, nguồn và S có thể khác thời điểm. Thiết kế phải chỉ rõ đầu vào nào phải được hoàn tất trước xanh, bản nguồn nào được dùng và phạm vi công thức được hỗ trợ. Không thêm vòng lặp tự hội tụ; đây là giới hạn vận hành/kiểm chứng của phần trung bình. Không ghi “luôn dùng trung bình vừa chạy xanh” khi bản chốt khác vẫn có hiệu lực.

<a id="outputs"></a>

## 6. Ba đầu ra

### 6.1. Trích xuất thành tích（成績抽出）

- Giữ các lựa chọn lọc, ký hiệu trước, ký hiệu sau, tô màu ô; prefix/suffix có thể cùng bật, ký hiệu phải có giá trị khi bật.
- Chỉ bật lọc mới giới hạn danh sách. Một học sinh có ít nhất một ô đỏ trong phạm vi áp dụng thỏa bộ lọc; không tô mọi ô của học sinh đó.
- Dùng palette hiện hữu. Mẫu màu lịch sử quan sát là nền #E38487 và chữ thường #222222; chưa phải cam kết mọi template/môi trường dùng đúng màu này.
- Kết quả rỗng hợp lệ. HTML đúng không chứng minh file Excel/PDF đúng; phải kiểm từng định dạng được hỗ trợ.
- Thiếu kết quả không phải không đỏ; không dùng ngưỡng tính lại tại renderer.

### 6.2. Công khai thành tích（成績公開）

- Các cách thể hiện là ngoặc hoặc dấu * cố định trước/sau; không thêm ký tự tùy ý, bộ lọc học sinh hoặc nền riêng cho điểm đỏ.
- Phần tạo/sửa thiết lập hiển thị đỏ áp dụng cho mục có cấu hình đỏ; khi xóa cấu hình cuối, không dùng việc mục hết cấu hình để bỏ dấu/kết quả cũ ngay trước lần chạy lại. Cách đọc kết quả ở đầu ra phải giữ đúng Q6.2-B và cập nhật sau lần xét tương ứng.
- Kết quả cần kiểm là Xác nhận thành tích（成績確認） phía học sinh, cùng API/PDF liên quan; không thay bằng màn hồ sơ giáo viên.
- Giữ quyền học sinh/phụ huynh, trường/năm, lịch công khai, ẩn điểm.
- Đã chốt Q7.2-A: kết hợp hiệu ứng khác nhau, hiệu ứng trùng chỉ một lần. Ví dụ dự kiến dùng ngoặc, đỏ dùng `*` trước thì `(*24)`; cùng dùng `*` trước thì `*24`, không `**24`. Không áp cơ chế first-match của phiếu cho công khai chỉ vì cùng dùng một kết quả xét. Nền màu riêng chỉ là khả năng cân nhắc sau bản đầu.

### 6.3. Công cụ phiếu điểm（通知表ツール）

- Các lựa chọn cho đỏ: nguyên trạng, ngoặc, ký tự trước hoặc sau; chỉ bắt buộc ký tự khi dùng trước/sau.
- Giữ quy trình lưu bảng hiện hữu: đóng hộp rồi Cập nhật（更新する） ở màn bên dưới; không thêm quy trình phát hành mới.
- Không thêm ẩn/gạch chéo vào riêng lựa chọn đỏ; vẫn giữ các điều kiện bảo vệ hiển thị hiện hữu.
- Không thêm nền đỏ riêng hoặc ép mọi template về một cấu trúc.
- Đã chốt Q7.1-A: dòng điểm đỏ sau các điều kiện ô chọn và trước ô trống như ảnh ngày 25/09. Source xác nhận chọn điều kiện khớp đầu tiên, kể cả Nguyên trạng（そのまま表示）. Điểm 24 dự kiến dùng ngoặc thì `(24)`; dự kiến dùng nguyên trạng thì `24`, không xét tiếp đỏ để thêm dấu. Điều kiện phía trên đã ẩn/gạch chéo thì đỏ không làm hiện lại điểm; không suy thành mọi lệnh ẩn ở bất kỳ vị trí nào luôn có ưu tiên toàn cục.
- Cần kiểm lưu/đọc lại cả khi chỉ bật đỏ, cờ dùng điều kiện, sao chép template và PDF thật.

### 6.4. Hiệu ứng và các màn liên quan

Ẩn điểm không được bị dấu đỏ làm hiện lại. Bỏ nền đỏ riêng không xóa nền header/bảng/template. Giữ dữ liệu trạng thái dự kiến và kết quả đỏ riêng, không suy số trạng thái từ số dấu *.

Các điểm mở màn:
- [Thiết lập nhập điểm（成績入力設定）](https://ad31.schoolstg.mwsite.work/admin/grade_report_setting/manage).
- [Trích xuất thành tích（成績抽出）](https://ad31.schoolstg.mwsite.work/admin/nb/grade/grade_setting_system/grade_extraction).
- [Thiết lập công khai thành tích（成績公開設定）](https://ad31.schoolstg.mwsite.work/admin/grade_report_setting/grade_publish).
- [Xác nhận thành tích（成績確認） phía học sinh](https://ad31.schoolstg.mwsite.work/student/grade/grade_publish).
- [Công cụ phiếu điểm（通知表ツール）](https://ad31.schoolstg.mwsite.work/admin/grade_report_setting/report_card).

Các link là địa chỉ tham chiếu, không chứng minh các màn vừa được kiểm live.

<a id="maximum"></a>

## 7. Điểm tối đa và dữ liệu cũ

### 7.1. Phân giải điểm tối đa

| Dữ liệu | Vai trò |
| --- | --- |
| grade_evaluate_items.grades_column | Ánh xạ mục đánh giá sang cột điểm; tên UI không phải khóa duy nhất |
| grade_evaluate_frame_items.max_value | Maximum mặc định theo frame item/kỳ |
| weekly_plan_curriculum_tangen_change_max_values.change_max_value | Maximum riêng đơn vị khi nguồn master/group và cờ áp dụng phù hợp |
| grades_group_option.value và tangen_id | Lựa chọn thực tế của lớp/đơn vị; mã choice không phải maximum |
| grade_evaluate_frame_option_item_effect.changed_max_score | Maximum do lựa chọn lớp ghi đè, phải khớp choice/frame/kỳ |
| grade_calc_result_*_ranks.max_score | Maximum đã lưu trong kết quả tổng hợp; phải biết một ô hay tổng nhiều môn |
| grade_calc_result_*_total.max_score | Tổng maximum của nhóm; không dùng làm mẫu số cá nhân |
| height_score / total_height / avg_height | Điểm cao nhất thực tế, khác maximum cấu hình |

Trong các đường đăng ký điểm và AutoRating đã kiểm: **mặc định mục → đơn vị bài học → lựa chọn lớp áp dụng cuối**. Ví dụ 100 → 40 → 50 thì dùng 50; không có lựa chọn lớp thì dùng 40. Maximum đơn vị lưu theo ngoại lệ: không có hàng ngoại lệ có thể nghĩa bằng mức chuẩn, không phải mất maximum.

GradeScoreRangeService hiện chưa có cùng tầng đơn vị; không gọi nguyên helper đó rồi tuyên bố đã bao phủ điểm đơn vị. Nguồn M cần thống nhất đúng ngữ cảnh; không dùng mặc định 100, điểm cao nhất hoặc tổng maximum của nhóm thay thế. Mốc dùng cho tỷ lệ độc lập đã chốt là M hiện hành tại lần xét, không phải M của bản tổng hợp đã chốt.

Một lựa chọn tồn tại không chứng minh lớp đang dùng nó. Nghiên cứu source, dữ liệu đã lưu, thao tác UI và kết quả ba đầu ra là các lớp bằng chứng khác nhau.

**Kết quả kiểm luồng ngày 25/09, không phải xác nhận nghiệp vụ mới:** lưu định nghĩa tại Thiết lập điểm tối đa（満点設定） qua `optionStore` và sửa Giá trị tối đa（最大値） của mục qua `itemStore` không gọi/xếp hàng AutoRating trong đường đã đọc. Đăng ký điểm/lựa chọn theo lớp của hệ thống thành tích mới có gọi AutoRating; lưu lựa chọn lớp hàng loạt có xếp hàng batch khi thỏa điều kiện sử dụng. Job theo phạm vi lớp và kỳ được phép, không chỉ một ô vừa đổi maximum. Nguồn và giới hạn nằm trong bằng chứng Q1/Q3. Không thêm trigger cho mọi màn từ lời khách hàng “nếu có chạy”.

Tên Điểm tối đa（満点） do người dùng đặt cho một trường nhập số trong Thiết lập điều kiện đánh giá（評価条件設定） không chứng minh có hiệu ứng ghi đè maximum. Ngoài ra, engine có hỗ trợ maximum riêng đơn vị không chứng minh màn định nghĩa lựa chọn maximum/hàng loạt hiện có hỗ trợ mọi thao tác theo đơn vị; phần đó cần tích hợp đúng phạm vi đã xác nhận cho điểm đơn vị.

### 7.2. Legacy và vòng đời cấu hình mới

Ngưỡng cũ red_score / changed_red_score có consumer tùy biến trường, ví dụ báo cáo dùng phép so sánh nhỏ hơn hoặc bằng. Chúng còn được mang qua duplicate, takeover năm học, export, import, failback và đồng bộ cấu hình vào lớp. Không đổi nghĩa scalar thành boolean/mã công thức hoặc tự reset khi lưu cấu hình mới.

Không chuyển legacy thành rule mới, không dùng như fallback. Cấu hình nhiều điều kiện/công thức và kết quả từng ô cần thiết kế lưu riêng về ý nghĩa; tên bảng/DDL chưa được duyệt và chưa được tạo trong lượt này.

**Đề xuất tích hợp vòng đời:** cấu hình mới đi theo phạm vi sao chép đã được chọn trong thao tác hiện hữu, remap đúng trường/năm/kỳ/mục/nhóm/đơn vị; không sao chép kết quả xét học sinh hoặc gắn bản chốt năm cũ vào năm mới. Không suy “không migrate legacy” thành “không cần kiểm copy/import”. Phạm vi hỗ trợ cụ thể và xử lý tham chiếu không remap được phải ghi trong thiết kế/phát hành; chưa là một xác nhận mới về tự bật cấu hình ở năm sau.

Mốc bàn giao DB là bản có thể review về cấu hình, kết quả, identity từng ô và cùng tồn tại với legacy. Không coi hoàn thành research là đã hoàn thành thiết kế DB hoặc được chạy migration.

<a id="code"></a>

## 8. Tích hợp: điều đã biết, việc còn phải làm

Đường dẫn source dưới đây tương đối từ repository ứng dụng. Bằng chứng chi tiết, dòng và hash nằm trong research cuối. Đây là các trách nhiệm kỹ thuật cần giải quyết, không phải giao sửa tất cả file hoặc xác nhận bug live.

| Gap | Đã xác minh và ảnh hưởng | Việc cần hoàn tất trước phần triển khai liên quan |
| --- | --- | --- |
| I01 — Đường ghi điểm | Có đăng ký lớp, CSV, batch và liên kết kết quả thi; không chỉ một controller | Xác định điểm hoàn tất thật và các ô bị tác động; bao phủ mọi đường của lát cắt phát hành |
| I02 — Không có công thức / điểm sửa tay | AutoRating có return khi không có cấu hình và bỏ tính lại ô đã nhập tay | Xét đỏ phải độc lập với việc có công thức hay ô được AutoRating tính; không đặt chỉ bên trong vòng tính |
| I03 — Điểm cuối và môn liên quan | Sau tính còn giới hạn min/max, xử lý đơn vị không dùng, ghi môn chính/sao chép điểm | Đọc S cuối, bao phủ ô môn chính hoặc ô khác thực sự thay đổi, không dùng kết quả trung gian |
| I04 — Batch và quyền | Nút cam hiện phụ thuộc có AutoRating và có thể giới hạn nhân viên; dựng đối tượng có bộ lọc trước calc | Trường chỉ có rule đỏ và mục đã xóa rule cuối vẫn cần đường chạy lại phù hợp Q6.2-B; giữ quyền người chạy hiện hữu, thống nhất UI/server và phạm vi |
| I05 — Thành công/skip/lỗi | Lưu trực tiếp/CSV có transaction; batch ghi dần; counter không phải số ô xét thành công | Ghi nhận kết quả thật, không hứa atomic toàn batch; tách lỗi kỹ thuật khỏi skip nghiệp vụ; thiết kế retry/recovery theo cơ chế có sẵn |
| I06 — Nguồn chốt | PR #57058 chưa merge; có thể dùng dummy data để triển khai trước | Tích hợp và kiểm chứng nguồn thật khi sẵn sàng; giữ quy tắc ưu tiên bản chốt |
| I07 — Trung bình theo đơn vị | Log tổng hợp có tangen_id nhưng bộ đọc trung bình khảo sát chưa giữ chiều này trong SELECT/map | Giữ identity đơn vị, không gộp trung bình hai đơn vị; không hỏi lại phạm vi đơn vị đã xác nhận |
| I08 — Maximum | Nhiều tầng; helper hiện thiếu tầng đơn vị; lưu định nghĩa khác lưu lựa chọn của lớp về trigger | Phân giải M hiện hành đúng Q1-A và giới hạn nhập đã kế thừa; không mở cơ chế tự tính mọi phụ thuộc hoặc lấy snapshot M cho tỷ lệ độc lập |
| I09 — Không áp dụng / NULL / công thức hỏng | Engine cũ có đường ghi NULL khi không khớp, công thức lỗi có thể trả NULL khác FALSE | Không sao chép tác dụng xóa điểm; ngừng dùng kết quả cũ sau thiếu ngưỡng hoặc no-match theo Q5/Q6.1, phân biệt hai trạng thái; T âm hợp lệ xét bình thường |
| I10 — Kết quả dùng chung và output | Service điểm chung đi tới web/API/PDF; phiếu dùng return sớm; cờ lưu điều kiện có nhánh riêng | Lưu/đọc lại đủ cấu hình; kết quả cùng identity; không tin payload Excel như kết luận server; kiểm từng consumer thật |
| I11 — Vòng đời/legacy | Nhiều đường duplicate/takeover/export/import/failback/sync mang ngưỡng cũ | Bảo toàn legacy, remap cấu hình mới đúng phạm vi, không copy kết quả cá nhân hoặc tham chiếu chéo năm |
| I12 — Đồng thời và thời điểm nguồn | Batch theo lớp có thể kéo dài; lần chạy/điểm/quy tắc thay đổi có thứ tự | Không để lượt cũ hoàn tất muộn ghi đè kết quả mới; xác định nguồn và phạm vi một lượt theo kiến trúc hiện có, không tự thêm hạ tầng |

Các điểm đọc source chính:
- application/domain/tmp/AutoRating.php: calc, calcAutoRating, calcPerStudent, calcResult, createRegistData, save, calcDecimalPlace.
- application/controllers/grade/grade_setting_system/AdminNBGradeSettingSystemLessonController.php và AdminNBGradeSettingSystemLessonCsvController.php: lưu điểm, transaction, gọi tính và tổng hợp.
- application/controllers/batch/grade/AutoRatingBatch.php và application/models/AutoRatingBatchRunning_m.php: dựng đối tượng, chạy theo lớp, trạng thái/counter.
- application/blend/GradeExam/Service/ScoringResultService.php: liên kết điểm thi, có đường ghi điểm trước khi bỏ qua AutoRating do thiếu lựa chọn lớp.
- application/usecase/grade_setting/common/query_service/GradeCalcResultService.php: nguồn tổng hợp trung bình; GradeScoreRangeService.php: miền điểm.
- application/controllers/grade_report_setting/auto_rating/AutoRatingConfController.php và các view auto_rating: editor, bộ lọc, quyền/giới hạn cấu hình toán hạng.
- application/blend/Report/Convert/ReportWidgetGradesNormalData.php và application/blend/Report/Repository/ReportWidgetGradesNormalRepository.php: ưu tiên/cờ lưu dữ liệu phiếu.
- application/usecase/grade_setting/common/query_service/GradeService.php, GradePublishService.php, GradePublishPdfService.php: dữ liệu chung và đầu ra.
- application/usecase/grade_setting/{duplicate,takeover,export,import,failback}/ và repository frame item: vòng đời cấu hình.

Nguồn trung bình nhóm hiện có bị giới hạn theo trường trong cấu hình/ghi dữ liệu. Việc có nhánh code không chứng minh đã bật cho mọi trường. Khi đưa vào feature mới phải xử lý quyền/phạm vi trường theo R01 và kế hoạch phát hành; không sao chép nguyên gate tùy biến thành yêu cầu chung.

Nguồn snapshot tham chiếu [PR #57058](https://github.com/ednity/school-web/pull/57058), còn open/chưa merge khi kiểm ngày 25/09/2026. Các lần kiểm GitHub tiếp theo dùng GitHub CLI.

### 8.1. Triển khai trước bằng dummy data

Có thể dùng dummy data cho nguồn trung bình/snapshot để triển khai trước, không bị block bởi PR chưa merge; tích hợp nguồn thật khi sẵn sàng. Nội dung này đã được ghi trong [spec tiếng Việt — bản làm việc v2](docs/v2/specification.vi.md#conditions).

<a id="qa"></a>

## 9. Trạng thái xác nhận và tác động tới thiết kế

Số Q ở bảng này là **số của bộ remaining Q&A r17 đã gửi (bản ngày 24/09)**, không phải số trong Q&A confirmed. Giữ nguyên số câu đã gửi. Nguồn gồm [phản hồi khách hàng ngày 25/09](https://app.slack.com/client/T08LS8ZGDTP/C0BRGJA6XDE/thread/C0BRGJA6XDE-1789563761.146189/1790315716.848689) và hai phản hồi Q3 bổ sung do người phụ trách cung cấp trong phiên, chưa có permalink riêng. Bản reply của team không phải nguồn xác nhận từ khách hàng.

### 9.1. Bảng trạng thái theo từng câu đã gửi

| Câu đã gửi | Kết quả ngày 25/09 | Nơi ghi nhận trong Q&A confirmed | Việc còn lại |
| --- | --- | --- | --- |
| Q1 | A — dùng M hiện hành khi xét tỷ lệ độc lập | Q23 | Trả lời lý do câu hỏi cũ và kết quả kiểm trigger; không mở lại lựa chọn M |
| Q2 | A — cho chọn xử lý phần lẻ ngưỡng tỷ lệ | Q24 | Cụ thể hóa UI theo cơ chế tham chiếu, giữ mặc định không xử lý của phương án A |
| Q3 | **Đã xác nhận dùng kết quả tổng hợp thứ hạng hiện có**, không xử lý riêng hoặc ngăn cấu hình khác điểm tối đa; không gây lỗi dừng xử lý do tình huống đó | Q31 | Bản Figma Nhật lịch sử đã đồng bộ Q3; MW còn theo mục 9.7. Kiểm nguồn và độ chính xác khi tích hợp. Không hỏi lại A/B |
| Q4 | A — T âm hợp lệ vẫn xét bình thường | Q25 | Bỏ xử lý coi T âm là lỗi; không ép về 0 |
| Q5 | Nội dung khách hàng tương ứng B — không giữ kết quả trước làm kết quả hiện hành khi không tạo được ngưỡng hợp lệ | Q26 | Team phản hồi đồng ý cách hiểu; không giữ đề xuất A cũ làm mặc định, không coi bản reply đã được gửi |
| Q6.1 | A — ngừng dùng kết quả cũ sau lần xét xác định không có thiết lập áp dụng | Q27 | Phân biệt không áp dụng với chưa đủ dữ liệu chọn nhánh |
| Q6.2 | B — xóa thiết lập cuối vẫn giữ kết quả trước tới lần chạy lại | Q28 | Bảo đảm thao tác chạy lại bao phủ cả mục đã hết cấu hình; không bỏ dấu ngay tại thao tác xóa |
| Q7.1 | A — dòng đỏ sau ô chọn/trước ô trống, theo cơ chế trên xuống được hỏi lại | Q29 | Trả lời cơ chế first-match đã kiểm; giữ nguyên trạng cũng dừng, không ghép mọi hiệu ứng |
| Q7.2 | A — kết hợp hiệu ứng khác nhau, trùng chỉ một lần | Q30 | Không thêm nền đỏ riêng vào bản đầu; khả năng nền màu để sau |

[Q&A confirmed ngày 25/09](sources/confirmed-business-qa.vi.md) giữ Q1–Q30 và bổ sung Q31 cho Q3. Bộ Q1–Q7.2 đã gửi không còn câu hỏi nghiệp vụ mở. Bản tiếng Nhật `02-business-qa-open.ja.md` ngày 24/09 được giữ như bản câu hỏi đã gửi, không phải danh sách open hiện hành. Không dùng nó để mở lại những câu đã có phản hồi.

**Phạm vi triển khai/phát hành** vẫn chưa chốt theo phần 2, do đầu mối Sales/CS thống nhất. Đóng toàn bộ câu hỏi trong bộ bổ sung không đồng nghĩa triển khai/phát hành đã được duyệt: các khoảng trống tích hợp I01–I12 vẫn phải giải quyết và kiểm chứng.

<a id="q3-design-impact"></a>

### 9.2. Ảnh hưởng thiết kế sau khi Q3 đã xác nhận

**Không còn chờ khách hàng chọn A/B.** Hướng nghiệp vụ đã chốt là dùng kết quả tổng hợp thứ hạng hiện có, không xử lý riêng hoặc ngăn cấu hình khác điểm tối đa giữa các lớp trong cùng nhóm. Tình huống đó không được gây lỗi làm dừng xử lý. Không diễn giải thành yêu cầu xây thêm một cách tổng hợp.

| Phần thiết kế | Ảnh hưởng của xác nhận Q3 | Việc cần làm |
| --- | --- | --- |
| Danh sách nhiều thiết lập, ưu tiên, điều hướng và các loại ngưỡng | Không đổi cấu trúc | Tiếp tục theo quy tắc đã xác nhận |
| Điều kiện tỷ lệ nhóm và chú thích nguồn | Đã xác nhận, không còn giả định/chờ chọn A/B | Bản Nhật lịch sử đã đồng bộ; MW còn theo mục 9.7. Triển khai theo kết quả tổng hợp hiện hữu |
| Nguồn dữ liệu và độ chính xác | Còn việc tích hợp, không còn lựa chọn nghiệp vụ A/B | Xác minh đúng nhóm/bản nguồn, ưu tiên bản chốt và giá trị trước làm tròn; không tự dùng số đã làm tròn trên màn hình |
| Ví dụ và tiêu chí phân nhánh | Không yêu cầu cách tính riêng cho nhóm trộn điểm tối đa | Dùng ví dụ cùng điểm tối đa; với tình huống khác điểm tối đa chỉ yêu cầu không gây lỗi dừng xử lý do sự khác biệt đó |
| Vòng đời kết quả và ba đầu ra | Giữ Q5/Q6/Q7 | Thiếu dữ liệu vẫn theo quy tắc chung; không coi mọi ô là đã đạt chỉ để tránh lỗi |
| Thiết kế DB, nguồn chốt, đơn vị và phạm vi phát hành | Không tự hoàn tất khi đóng Q3 | Hoàn thiện thiết kế/tích hợp và xác định đợt triển khai riêng |

Ví dụ cùng nhóm có `60/100` và `80/100`: tỷ lệ từ kết quả tổng hợp là `140/200×100=70%`, khớp điều kiện từ 65% trở lên. Nếu ngưỡng của quy tắc khớp là 70 và dấu so sánh là nhỏ hơn, điểm 60 đỏ và điểm 80 không đỏ. Quy tắc dùng tỷ lệ để chọn nhánh vẫn cần nguồn tổng hợp dù ngưỡng phía sau là cố định.

Phản hồi Q3 chưa xác nhận bỏ yêu cầu giá trị trước làm tròn. Nếu kết quả hiện hữu thiếu độ chính xác cần thiết, ghi khoảng trống tích hợp và đánh giá cách đáp ứng; không âm thầm thay quy tắc, cũng không hỏi lại khách hàng chọn A/B.

### 9.3. Những phần thiết kế phải đồng bộ từ giả định ngày 24/09

| Câu | Giả định trước phản hồi | Yêu cầu hiện hành / tác động |
| --- | --- | --- |
| Q1 | A — M hiện hành | Đã chốt A. Dùng M có hiệu lực tại lần xét, không bổ sung lựa chọn snapshot M; giữ riêng nguồn trung bình ưu tiên bản chốt |
| Q2 | A — có lựa chọn phần lẻ, mặc định không xử lý | Đã chốt A. Giữ điều khiển phương thức/vị trí chữ số; không floor bắt buộc; không coi mọi giới hạn UI hiện hữu là đã được duyệt riêng |
| Q3 | A — tỷ lệ tổng | Đã chốt kế thừa kết quả tổng hợp hiện hữu; không xử lý riêng hoặc ngăn cấu hình khác điểm tối đa trong cùng nhóm, không gây lỗi dừng xử lý do tình huống đó. Bỏ nhãn giả định và ví dụ A/B trong thiết kế hiện hành |
| Q4 | A — dùng T âm hợp lệ | Đã chốt A. Lần xét hợp lệ có thể không chọn ai, vẫn cập nhật kết quả; không đi qua Q5 chỉ vì âm |
| Q5 | A — giữ kết quả hoàn tất trước sau lần không tính được | **Đổi sang hướng B khách hàng trả lời.** Ngừng dùng kết quả cũ, chuyển chưa xét được; dấu/lọc ba đầu ra phải đồng bộ. Không sửa điểm hoặc mặc định đã đạt |
| Q6.1 | A — ngừng dùng khi không khớp sau xét | Đã chốt A. Ghi nhận không áp dụng, ngừng dấu/lọc cũ; không fallback legacy |
| Q6.2 | A — ngừng dùng ngay khi xóa thiết lập cuối | **Đổi sang B.** Giữ kết quả tới lần chạy lại. Cần sửa nội dung thao tác xóa/đầu ra và bảo đảm mục đã hết rule vẫn được chạy lại |
| Q7.1 | A — đỏ sau checkbox | Đã chốt A theo first-match được kiểm. Điều kiện nguyên trạng cũng dừng; giữ kết quả ẩn/gạch chéo đã được áp dụng |
| Q7.2 | A — kết hợp dấu khác, dấu trùng một lần | Đã chốt A. Giữ ví dụ `(*24)`/`*24`; không thêm nền đỏ riêng ở bản đầu |

Q5 và Q6.2 là hai thay đổi so với giả định ngày 24/09. Đã sửa nội dung UI và chú thích liên quan trên Figma theo mục 4.4; việc thiết kế lưu kết quả, tích hợp và kiểm ứng dụng vẫn chưa hoàn tất. Không dùng cập nhật canvas làm bằng chứng code đã thực hiện đúng vòng đời mới.

Ngưỡng cố định 0..M (Q8 cũ đã rút) vẫn được giữ, không mở lại. Q5 xử lý thiếu dữ liệu; Q6.1 xử lý đủ dữ liệu nhưng không có thiết lập phù hợp; Q6.2 là giai đoạn trước lần chạy lại. Q7 chỉ quy định trình bày kết quả còn hiệu lực, không thay thế các trạng thái đó. Ngừng dùng kết quả không phải yêu cầu xóa lịch sử vật lý. Các lỗi ghi kết quả vẫn phải được xử lý trung thực, không suy bảo đảm rollback hay thành công toàn batch.

### 9.4. Đối chiếu số câu lịch sử

Bảng sau chỉ ghi việc đổi số **ngày 24/09 trước khi gửi**, không đánh số lại ở ngày 25/09:

| Q ở r17 trước sắp xếp ngày 24/09 | Số trong bộ đã gửi | Nội dung |
| --- | --- | --- |
| Q4 | Q1 | Phiên bản điểm tối đa |
| Q1 | Q2 | Phần lẻ của tỷ lệ |
| Q2 | Q3 | Đại lượng tỷ lệ chọn nhánh |
| Q5 | Q4 | Ngưỡng âm |
| Q3 | Q5 | Kết quả sau lần không tính được |
| Q7 | Q6.1 | Không khớp sau xét; Q6.2 tách riêng hiệu lực xóa thiết lập cuối |
| Q6.1 / Q6.2 | Q7.1 / Q7.2 | Hiển thị phiếu / công khai |
| Q8 | Rút khỏi danh sách mở | Giữ giới hạn nhập cố định hiện hành; không tự đề xuất nới |

Số trong Q&A confirmed là bộ riêng; dùng bảng 9.1 để nối Q đã gửi với Q23–Q31. Các liên kết/nhãn open trong research và tài liệu lịch sử chưa được cập nhật đồng loạt; không dùng trạng thái cũ ở đó thay cho context này.

<a id="design-pending"></a>

### 9.5. Các phần thiết kế còn pending sau phản hồi ngày 25/09

**Trạng thái lịch sử sau phản hồi 25/09; đọc cùng mục 9.7.** Q3 đã có xác nhận bổ sung; context, Q&A, spec và chú thích bản Nhật lịch sử đã đồng bộ tại mốc đó. Q35 đã được xác nhận ngày 30/09 tại mục 9.8; canvas MW chưa được kiểm sau sửa. Chỉ sử dụng Figma tiếng Nhật; bản Figma tiếng Việt đã được xóa nên không còn công việc tổ chức lại hoặc đồng bộ bản đó. Những cập nhật Q1/Q2/Q4–Q7 và việc tổ chức lại bản Nhật tại mục 4.4 vẫn được giữ; các phần kỹ thuật, review và tích hợp chưa hoàn thiện vẫn có trạng thái riêng.

| Phần còn cần hoàn thiện | Trạng thái và việc cần làm | Khi nào được coi là hoàn tất phần thiết kế? |
| --- | --- | --- |
| Luồng màn hình chính và cấu hình nhiều điều kiện | **Bố cục màn chính/phần chi tiết đã có và được giữ trong lượt cập nhật.** Tiếp tục review danh sách/ưu tiên và hai màn chi tiết mở từ danh sách (điều kiện áp dụng, ngưỡng/công thức), quyền và các trạng thái; không có chế độ xét riêng | Review đầy đủ các thao tác/điều hướng theo phần 4.2; lượt chỉnh nội dung Q&A không tự thay thế kiểm prototype và mọi nhánh thao tác |
| Form ngưỡng và công thức | **Đã đồng bộ quyết định Q1/Q2/Q4 trên canvas; còn review chi tiết.** Giữ các màn lựa chọn/điều khiển hiện có và cập nhật chú thích M hiện hành, phần lẻ, T âm. Miền nhập/độ chính xác và hành vi đổi loại vẫn cần chốt trong thiết kế chi tiết theo phần 4.3/5.1 | Review các chi tiết UI và ví dụ biên; không biến mọi chi tiết team đề xuất thành xác nhận riêng của khách hàng |
| Tỷ lệ nhóm dùng để chọn nhánh | **Q3 đã xác nhận kế thừa kết quả tổng hợp hiện hữu.** Bản Nhật đã bỏ Q3-A và ví dụ trộn điểm tối đa; chỉ còn kiểm nguồn/độ chính xác khi tích hợp | Kiểm nguồn/độ chính xác, phân nhánh thông thường và không lỗi dừng xử lý do khác điểm tối đa |
| Trạng thái kết quả, xóa thiết lập và chạy lại | **Đã sửa UI/chú thích Q5/Q6.1/Q6.2 trên canvas.** 02D giữ trước tới khi chạy lại, 06A không dùng cũ khi thiếu dữ liệu; ghi rõ chạy lại cả khi hết rule. Còn review và thiết kế cơ chế lưu/tích hợp | Review các trạng thái trước/sau và hoàn thiện tích hợp tương ứng; không coi kiểm UI là chứng minh lưu/xét trên ứng dụng |
| Ba màn/định dạng đầu ra | **Đã đồng bộ chú thích và xác nhận Q7 trên canvas.** Giữ quy tắc/ví dụ trình bày hiện có, sửa ảnh hưởng xóa cuối và thiếu dữ liệu theo Q5/Q6.2. Còn kiểm tích hợp đầu ra thật | Review thiết kế và sau triển khai kiểm từng đầu ra; không dùng bản vẽ làm bằng chứng PDF/Excel hoặc công khai thật đã đúng |
| Nguồn trung bình, bản chốt, đơn vị và maximum | Có thể triển khai trước bằng dummy data để không bị block; tích hợp nguồn thật khi sẵn sàng | Nguồn thật đúng ngữ cảnh và quy tắc đã chốt |
| Thiết kế lưu dữ liệu và luồng thực hiện | **Cần hoàn thiện thiết kế kỹ thuật**, theo I01–I05, I09, I11–I12: cấu hình/kết quả mới, cùng tồn tại legacy, các đường ghi điểm/chạy lại, quyền, lỗi, đồng thời, sao chép/năm mới/import-export | Có bản thiết kế DB/luồng đủ để review, phân biệt kết quả có hiệu lực/chưa xét/không áp dụng và các đường hỗ trợ; báo đầu mối khi thiết kế DB hoàn tất theo yêu cầu đã có |
| Tích hợp đầu ra và phạm vi bản phát hành | **Cần xác định phạm vi và kế hoạch kiểm chứng**, theo I10 và phần 2.3. Không coi thiết kế đầy đủ là đồng ý phát hành mọi tính năng | Danh sách tính năng/luồng được đưa vào bản đầu được thống nhất; thiết kế chỉ rõ các phụ thuộc và bằng chứng cần kiểm, không tuyên bố QA/phát hành đã xong |

**Thứ tự tiếp tục:** review luồng Figma tiếng Nhật với người phụ trách; hoàn thiện nguồn dữ liệu/DB/luồng. Không còn chờ A/B hoặc cần hai bộ thiết kế.

**Kết luận về mức sẵn sàng sau Q3:** hướng nghiệp vụ Q3 đã chốt; tài liệu và bản Figma tiếng Nhật được ghi nhận đã đồng bộ Q3. Thông tin mới về DB-R3 và file Figma MW nằm tại mục 9.6. Thiết kế kỹ thuật/DB, độ chính xác và ánh xạ nguồn, phạm vi phát hành và kiểm chứng triển khai vẫn còn; đóng Q3 không hoàn thành thay các phần đó.

<a id="db-review-20260928"></a>

### 9.6. Ba phản hồi review DB và bài học thiết kế ngày 28/09

**Nguồn:** người phụ trách cung cấp nguyên văn ba phản hồi tiếng Nhật của khách hàng trong phiên ngày 28/09/2026, sau khi gửi thiết kế DB, chia việc, tiêu chí nghiệm thu và UI Mockup để review. Sau đó người phụ trách cung cấp phản hồi làm rõ riêng DB-R3 và câu xác nhận của khách hàng: “そのようなイメージです” — “Đúng, chúng tôi hình dung theo hướng như vậy.” Chưa có permalink riêng. Xác nhận này áp dụng cho đề xuất hành vi nhóm tham chiếu được hỏi ngay trước đó, không phê duyệt toàn bộ bản reply ban đầu, DDL hoặc cơ chế đồng thời.

| Mã nội bộ của phản hồi | Yêu cầu phải giải quyết | Trạng thái quyết định |
| --- | --- | --- |
| DB-R1 | Lưu riêng hiệu ứng điểm đỏ theo cấu hình công khai（公開設定）, mục đánh giá（評価項目） và phân loại điểm thường/đơn vị（通常／単元）; bổ sung DDL cùng lưu, đọc lại và copy. Cùng mục có thể dùng ngoặc ở cấu hình X và dấu `*` phía trước ở cấu hình Y | V2 đề xuất mở rộng `grade_publish_conf_grade_items.red_score_display_type`, đã mô tả lưu/đọc/copy; chờ review kỹ thuật, chưa thực thi DDL |
| DB-R2 | Chỉ rõ dòng được khóa, thời điểm khóa hoặc dữ liệu/phiên bản đối chiếu trước ghi; chống batch dùng điểm 29 ghi đè kết quả mới đã lưu cho điểm 40; xử lý xóa/tạo lại ô điểm | V2 đã mô tả thế hệ ô, phiên bản đặt chỗ/hoàn tất/rule, khóa và điều kiện ghi tại DB design mục 6. Đây là thiết kế đề xuất; thử cạnh tranh, đo lock và xác minh mọi writer thuộc phạm vi triển khai chưa thực hiện |
| DB-R3 | Khối/HR/lớp học theo công tắc hiện hữu; ba loại nhóm cấu hình xuất hiện khi có cấu hình tương ứng, độc lập ba công tắc; chọn cấu hình tổng hợp rồi chọn nhóm | **Đã xác nhận qua Q32 và Q33, phương án A.** Không loại nhóm môn khỏi dropdown. Mã enum, chi tiết mapping và tích hợp nguồn là thiết kế kỹ thuật, không được tự xem là khách hàng đã duyệt |

**Quyết định DB-R3 đã xác nhận** — ghi tương ứng tại [Q32](sources/confirmed-business-qa.vi.md#q32-population-confirmed) và [Q33 — phương án A](sources/confirmed-business-qa.vi.md#q33-population-option-a):

1. Danh sách nhóm tham chiếu của điểm đỏ tuân theo thiết lập tổng hợp thứ hạng hiện hữu. Khối（学年）, lớp chủ nhiệm（ホームルーム） và lớp học（授業） chỉ được chọn khi loại tổng hợp tương ứng được bật; không hiển thị cố định đủ sáu loại.
2. Chọn cùng một cấu hình tổng hợp X, rồi chọn loại nhóm để đọc đúng kết quả của X. Nếu chỉ bật khối/HR thì trong ba loại trên chỉ có khối/HR; bật thêm lớp học thì có thêm lựa chọn lớp học và dùng kết quả của lớp liên quan. Không tạo cấu hình tổng hợp mới chỉ để đổi loại nhóm.
3. Không thêm công tắc bật/tắt tổng hợp riêng phía điểm đỏ. Source xác minh các cờ hiện hữu thuộc trường/năm học trong `grade_calc_detail_conf`, khác với ID của từng cấu hình `grade_calc_conf`.
4. Được bật để chọn không đồng nghĩa đã có dữ liệu tổng hợp hợp lệ. Quy tắc nguồn chốt, thiếu dữ liệu và Q26 không đổi; không thay dữ liệu thiếu bằng 0 hoặc tự lấy kết quả loại nhóm khác.
5. Q33 xác nhận ba loại nhóm tổng hợp thứ hạng（順位集計グループ）, tổ hợp（組み合わせグループ） và nhóm môn học（科目グループ） xuất hiện theo cấu hình hiện có của trường/năm, độc lập ba công tắc khối/HR/lớp học. Hiển thị tên nhóm đã đặt, lưu đúng ID; không bắt có đủ sáu loại khi chưa có cấu hình tương ứng.
6. Theo mẫu Công khai thành tích（成績公開設定）, chọn Thiết lập tổng hợp thứ hạng（順位集計設定） rồi chọn Đối tượng tổng hợp（集計対象）. Áp dụng cho cả nguồn điều kiện và nguồn công thức nhưng giữ hai lựa chọn độc lập. Không tự thêm trường thứ hạng, tên hiển thị hay biểu đồ từ màn mẫu.
7. Khách hàng nói rõ “Aの認識です” — “Tôi hiểu theo A”. Câu sau “ここだと、科目ごとの母集団とかは選べなかったと思いますが” — “ở đây hình như không chọn được nhóm tham chiếu theo từng môn” là nhận xét về hiện trạng màn tham chiếu, không phải xác nhận loại bỏ nhóm môn. Không mở lại A/B hoặc suy giới hạn này sang chức năng điểm đỏ.

**Đối chiếu màn tham chiếu của Q33:** source cùng baseline nêu dưới cho thấy `GradePublishConfController.php:560` gọi danh sách đầy đủ; `application/views/grade_report_setting/grade_publish/edit_conf_item.php:1002,1059` của Kết quả tổng hợp theo môn/lớp học（科目・授業ごとの集計結果） không loại nhóm môn. Khu vực Kết quả tổng hợp nhiều môn（複数科目の集計結果） tại `:1175,1245` mới bỏ lớp học và nhóm môn. Không suy nguyên nhân cụ thể từ trí nhớ của khách hàng: ảnh chỉ hiển thị giá trị đang chọn, và dropdown live ad31 chưa đọc được.

**Tác động Figma từ Q33:** đối chiếu bộ chọn nguồn của điều kiện và công thức theo thứ tự cấu hình tổng hợp → đối tượng tổng hợp; bổ sung các nhóm đã cấu hình bằng tên thực tế, ghi rõ ba công tắc chỉ điều khiển khối/HR/lớp học. Chú thích review nằm ngoài UI; không thêm công tắc riêng hoặc bảng cấu hình theo từng môn trong form. Chưa xác định node cần sửa trên MW: lần thử hiện tại MCP báo quota và Browser không xác minh được quyền đã lưu. Đây là danh sách yêu cầu để đối chiếu, không phải kết luận đã thấy thiếu trên canvas hoặc đã cập nhật Figma.

**Trạng thái UI do người phụ trách báo:** UI Mockup đã được cập nhật vào [file Figma của Movitation Works (MW)](#design-updated), key `iAB9nFC3RuqxbLUMsh79jd`, node được cung cấp `0:1`. URL hiện đã được xác định; còn cần đối chiếu canvas và tìm frame tương ứng từng màn. Ghi nhận thao tác của người phụ trách, không nhận là thao tác của agent hoặc canvas đã được kiểm. Các link Figma cũ chỉ là tham chiếu lịch sử. Bước UI tiếp theo là đối chiếu file MW và báo chênh lệch còn lại; không tự cập nhật lại bản cũ. Mọi chỉnh sửa UI tiếp theo vẫn phải báo trước theo yêu cầu người phụ trách.

**Bằng chứng source đã đọc trong phiên trước bước lập kế hoạch:** repository `blend`, revision `7652109b4542ecc9fb392bde6f2afb755a244316`. Đây là bằng chứng tĩnh, không xác nhận schema đang deploy hay hành vi runtime.

- `blend:application/migration/20230117_grade_publish.sql:38` và `application/migration/2024/20240911_tangen.sql:41`: bảng `grade_publish_conf_grade_items` có ID cấu hình công khai, mục đánh giá, năm và `tangen_flg`. `application/models/GradePublishConfGradeItems_m.php:35` đọc danh sách cột tường minh; `:50` có đường copy. `application/controllers/grade_report_setting/grade_publish/GradePublishConfController.php:1101` xóa/chèn lại các dòng cấu hình, `:1685` dựng dữ liệu lưu tường minh. Vì vậy thêm cột thôi chưa đủ cho lưu/đọc lại; đây là ứng viên tái sử dụng, chưa phải DDL đã duyệt.
- [Thiết kế DB đã gửi — v1](docs/v1/database-design.ja.md) và [DDL đã gửi — v1](docs/v1/database-design.ja.sql) chỉ đề xuất hai bảng rule/kết quả, chưa lưu hiệu ứng công khai. Mục 4.4 đã nêu chống ghi cũ nhưng chưa cung cấp cơ chế thực hiện. Đây là bằng chứng của bản được review; phần sửa tiếp theo thực hiện trên v2.
- `blend:application/usecase/grade_setting/common/query_service/GradeCalcResultService.php:853`: `createPopulationList()` tạo `hr_grade`, `homeroom`, `group`, `calc_group__<id>`, `calc_group_combo__<id>`, `calc_group_sub_subject__<id>`, tùy cấu hình tổng hợp. Hai tham số loại trừ lớp học/nhóm môn mặc định là `false`. Diff [PR #57058](https://github.com/ednity/school-web/pull/57058) đã đọc cho thấy màn thiết lập liên kết thứ hạng gọi hàm với trường/năm, không truyền cờ loại trừ. Danh sách lựa chọn không tự chứng minh bộ đọc nguồn hỗ trợ đầy đủ cả sáu loại trong mọi ngữ cảnh.

**Bằng chứng source bổ sung cho DB-R3:** `blend:application/views/grade_report_setting/grade_calc/_nav.php:5` và `manage.php:44` có tab Thiết lập — chỉ nhân viên（設定 ※社員のみ） và ba tùy chọn tổng hợp; `application/models/GradeCalcDetailConf_m.php:27` đọc cờ theo trường/năm; `application/domain/tmp/GradeCalc.php:263` truyền cùng danh sách cấu hình qua ba nhánh tổng hợp; `:2050` và `:2133` lưu cùng `grade_calc_conf_id` với phạm vi nhóm tương ứng. Baseline vẫn là `7652109b4542ecc9fb392bde6f2afb755a244316`. Chưa kiểm DB/live ad31 trong lượt này: truy cập Browser bị chặn tại bước xác minh quyền, và phiên DB chưa được thiết lập. Không đưa giới hạn này vào lời xác nhận nghiệp vụ như một câu hỏi còn mở.

**Phần kỹ thuật vẫn là đề xuất:** [DB design v2](docs/v2/database-design.vi.md) chọn mở rộng cấu hình công khai hiện hữu, dùng dòng kết quả làm dòng điều khiển thế hệ/phiên bản và phiên bản rule ở mục sở hữu; [DDL v2](docs/v2/database-design.sql) tương ứng đã được soạn. Ánh xạ nhóm theo hành vi DB-R3 đã chốt. Các tên/mã kỹ thuật là phương án thiết kế của team, không phải khách hàng đã duyệt chỉ bởi Q32. DB-R1/DB-R2 không được đổi thành Approved theo DB-R3.

**Bài học áp dụng cho lần bổ sung:**

1. Tách ba trách nhiệm lưu: điều kiện xét, kết quả xét của ô, cấu hình trình bày của từng đầu ra. Mỗi lựa chọn trên UI phải nối được tới schema, ghi, đọc lại, copy và consumer; hai bảng mới không đồng nghĩa đã đủ thiết kế lưu của feature.
2. Viết invariant cùng cơ chế bảo đảm và tình huống kiểm. Fingerprint của giá trị có thể bỏ sót thay đổi rồi trở về giá trị cũ; ID bản ghi có thể không đổi khi chỉ xóa nội dung ô. Khóa dòng kết quả có thể không tồn tại ở lần ghi đầu. Phương án fingerprint/khóa trong reply trước chưa giải quyết đủ các trường hợp này và không được dùng như bảo đảm đã kiểm chứng.
3. Giữ đúng Q6.2-B: sửa/xóa rule vẫn giữ kết quả trước đến lần xét lại. Ngăn một lượt cũ ghi đè kết quả mới là yêu cầu cạnh tranh cập nhật riêng, không phải lý do vô hiệu hóa ngay kết quả đang lưu khi sửa rule.
4. Đối chiếu lựa chọn UI với mã lưu, ID tham chiếu, cách xác định thành viên và cách đọc nguồn thật. Không gộp nhóm môn học vào nhóm tổng hợp chỉ vì tên gần nhau; không suy `group_id` của ô điểm đã biểu diễn lựa chọn nguồn lớp học.
5. Đồng bộ DB/SQL, spec, chia việc và AC theo cùng hợp đồng; báo riêng tác động tới Figma tiếng Nhật trước khi sửa. Không đưa lock/version/schema kỹ thuật vào form của người dùng chỉ để bù thiếu tài liệu.
6. Phân biệt ba tầng: loại dữ liệu mà schema biểu diễn, lựa chọn đang được bật trong cấu hình trường/năm, và kết quả tổng hợp thực sự có thể đọc. Không đồng nhất “hỗ trợ sáu loại” với “luôn hiện sáu lựa chọn”.
7. Gắn câu xác nhận ngắn với đúng đề xuất vừa được hỏi; đóng phần hành vi đó, không mở lại để khách hàng xác nhận lần nữa và không mở rộng thành duyệt mọi chi tiết kỹ thuật. Reply khách hàng nên nêu cách hiểu đúng, phương án cụ thể và ví dụ để xác nhận.
8. Tách “người phụ trách đã cập nhật Figma MW” khỏi “agent đã đối chiếu bản MW”. Khi đổi file, ghi đúng URL/file key/node được cung cấp và giữ các link cũ như lịch sử; không dùng frame cũ làm đích sửa mới khi chưa có mapping. Chưa đối chiếu canvas không chặn cập nhật tài liệu theo hành vi đã xác nhận.

**Trạng thái tại mốc 28/09:** đã bổ sung nội dung v2 theo DB-R1–DB-R3 để review. Đánh giá đó không bao phủ đủ vòng đời rule lưu dở và canvas; các thiếu sót mới, cách xử lý và trạng thái chờ xác nhận được cập nhật tại mục 9.7. Kiểm tra bao gồm cấu trúc hai bản SQL, các mã AC, liên kết và đối chiếu yêu cầu/kỹ thuật. V1 giữ nguyên. Không triển khai code, chạy migration hoặc sửa Figma; I10/I12, mọi writer thuộc phạm vi phát hành, hiệu năng khóa và tích hợp nguồn vẫn cần kiểm chứng thực thi. Theo yêu cầu người phụ trách, plan là tài liệu workflow nội bộ bằng tiếng Việt hoặc English, không lưu trong `blend-context` và không thuộc bộ gửi khách hàng.

**Mốc phiên bản tài liệu:** ngày 28/09, người phụ trách xác nhận bộ file hiện tại làm v1. Đã chuyển 11 file vào `docs/v1/`, sao chép nguyên nội dung sang `docs/v2/` và kiểm SHA-256 trùng bản gốc tại thời điểm tách. V1 được giữ nguyên; tại mốc này v2 có 9 file Nhật/Việt/SQL với các bổ sung DB-R1–DB-R3 để review, không còn hai file English trong thư mục v2 khi kiểm kê. Bản English lịch sử ở v1 không đại diện cho nội dung sửa mới. Xem [chỉ mục phiên bản](docs/README.md). Context và Q&A không nhân bản theo phiên bản.

**Ngôn ngữ tài liệu từ lần cập nhật tiếp theo:** theo yêu cầu người phụ trách ngày 28/09, bộ tài liệu tạo/cập nhật dùng bản Nhật và Việt, thay cho Nhật và English. Khi cập nhật v2, đồng bộ hai bản Nhật/Việt; bổ sung bản Nhật cho đặc tả nếu chưa có. Không tạo hoặc cập nhật bản English trừ khi được yêu cầu riêng. Các file English đang có được giữ làm tham chiếu của mốc cũ, không coi là bản đồng hành được cập nhật; v1 tiếp tục giữ nguyên toàn bộ. Quy tắc này không đổi ngôn ngữ của plan nội bộ: plan vẫn chỉ cần một bản Việt hoặc English ngoài repository này.

**Ưu tiên của lượt thực hiện:** người phụ trách yêu cầu hoãn phần tạo/chuyển đổi ngôn ngữ để làm nội dung plan trước. Vì vậy lượt này cập nhật các bản Nhật/Việt đã có, chưa tạo đặc tả Nhật mới và không chỉnh bản English lịch sử tại v1. Không diễn giải việc hoãn thành xóa tài liệu lịch sử.

<a id="review-consistency-20260929"></a>

### 9.7. Năm phản hồi review và lessons ngày 29/09

**Lịch sử ngày 29/09:** phương án lưu và trạng thái chờ trong bảng dưới đã được cập nhật bởi mục 9.8 ngày 30/09. Giữ bảng để truy vết, không dùng làm trạng thái hiện hành.

Nguồn: [nguyên văn khách hàng và bản dịch](sources/2026-09-29-design-review-feedback.vi.md), do người phụ trách cung cấp và yêu cầu cập nhật. [Q34–Q38](sources/confirmed-business-qa.vi.md#q34-rule-deletion-state) giữ trạng thái từng ý. Reply tiếng Anh trong phiên là bản soạn, chưa chứng minh đã gửi hoặc đã có câu trả lời cho đề xuất AND.

| Phản hồi | Hướng xử lý hiện hành | Trạng thái |
| --- | --- | --- |
| ① — rule lưu dở/xóa | Rule chưa hoàn chỉnh còn trong danh sách để sửa tiếp; đã xóa thì không hiện/không xét. DB/DDL chọn thêm deleted_at, giữ active cho hiệu lực; bảo vệ cả lưu từ form cũ, copy và không xóa kết quả cá nhân dây chuyền | Yêu cầu phân biệt rõ; tên cột là thiết kế kỹ thuật, không tự là khách hàng duyệt DDL |
| ② — AND/OR | Bộ lọc thường: OR cùng loại, AND khác loại. Đề xuất các dòng trung bình/tỷ lệ nhóm dùng AND với nhau và với bộ lọc, kể cả cùng loại. A≥50 và A<70: 40/70 không thỏa, 50/60 thỏa | **Q35 chưa có xác nhận riêng của khách hàng**; trạng thái này giữ trong context/Q&A. Bộ tài liệu gửi review trình bày trực tiếp thiết kế AND và ví dụ, không chèn lịch sử phản hồi hoặc nhãn chờ xác nhận; không mở lại Q3/Q32/Q33 |
| ③ — xóa điểm | Khi lưu thành công, cùng transaction chuyển không có điểm, ô trống, ngừng dấu/lọc đỏ của ô. Không chờ chạy lại; xóa rule vẫn giữ trước theo Q28 | Quy tắc dữ liệu hiện hành được làm rõ để trả lời khách hàng; chú thích Figma cần sửa |
| ④ — phần lẻ | Cùng rule 01-B/03-C: dòng 1 A÷2 cắt xuống số nguyên, dòng 2 nhân 0.8 không xử lý; A=49.7 cho T=19.2, S=19.1 với < thì đỏ. Sửa cột tên nhóm không đè phép toán | Chọn thống nhất theo DB/AC dưới chỉ dẫn người phụ trách; không áp thành mặc định mọi công thức |
| ⑤ — bộ chọn đơn vị | Hiển thị và thao tác độc lập ở cả A/B, sửa nền che panel B; bảo toàn cấu hình thường/đơn vị | Yêu cầu UI rõ, không thêm bảng/cột cho lỗi layer |

**Decisions và lessons:** [DEC-001 bản Việt](decisions/DEC-001-review-state-and-ui-consistency.vi.md) / [bản Nhật](decisions/DEC-001-review-state-and-ui-consistency.ja.md) ghi lựa chọn, phương án không chọn, phần thay thế và bài học. Điểm chính: trạng thái UI phải phân biệt được khi lưu; AND/OR cần phản ví dụ; phân biệt xóa điểm/rule theo thời điểm commit; đối chiếu kết quả ở điểm nằm giữa hai ngưỡng; node tồn tại không chứng minh hiển thị.

**Figma:** chưa hoàn tất cập nhật hoặc kiểm trực quan. Các quan sát về 02-A/B, 03-C, 04 và panel B là khách hàng báo. [Checklist sửa thủ công bản Việt](docs/v2/figma-update-checklist.vi.md) / [bản Nhật](docs/v2/figma-update-checklist.ja.md) liệt kê đủ vị trí, câu chữ và kiểm sau sửa. Chỉ đổi trạng thái hoàn tất khi có node/ảnh đã kiểm; không dùng kiểm tài liệu làm bằng chứng canvas.

**Bàn giao tài liệu:** v2 có 9 tài liệu/SQL đã cập nhật và 2 checklist Figma. Giữ 8 task, 40 AC; phần điều kiện tổng hợp của AC-G05 đã được xác nhận tại mốc 30/09. Không chạy DDL, sửa ứng dụng, stage hoặc publish trong lượt cập nhật này. Thiết kế chi tiết vẫn cần review; chưa có bằng chứng runtime.

**Quy ước bộ gửi review — người phụ trách xác nhận trong phiên:** Database Design/DDL, AC, Split Tasks và đặc tả là tài liệu độc lập trình bày phương án đầy đủ, không ghi mã Q, lịch sử phản hồi, nội dung trao đổi hoặc trạng thái chờ khách hàng. AND/OR được mô tả trực tiếp: bộ lọc OR cùng loại/AND khác loại; điều kiện trung bình và tỷ lệ nhóm AND với nhau và với bộ lọc. Nguồn phản hồi, trạng thái xác nhận và lessons/decisions giữ ở hồ sơ context nội bộ, không kèm bộ gửi; việc gửi bản hoàn chỉnh để review không tự trở thành khách hàng đã phê duyệt hoặc kiểm thử thành công. Chỉ dẫn này thay yêu cầu trước đó đưa nhãn chờ xác nhận vào file gửi hoặc chú thích mockup. Không đổi nguồn hay xóa lịch sử nội bộ.

<a id="review-consistency-20260930"></a>

### 9.8. Xác nhận ngày 30/09 và thiết kế trạng thái hiện hành

Nguồn: [nguyên văn khách hàng và bản dịch](sources/2026-09-30-design-review-confirmation.vi.md); yêu cầu cập nhật do người phụ trách cung cấp. Bản này thay các trạng thái tương ứng ở mục 9.7, không xóa nguồn cũ.

| Điểm | Quy tắc hiện hành | Trạng thái |
| --- | --- | --- |
| ① / Q34 | Ưu tiên đổi active thành setting_status. Chỉ nếu có ràng buộc xử lý chung cần active thì giải thích lý do và dùng deleted_flg. Không tiếp tục active + deleted_at | Hướng ưu tiên khách hàng yêu cầu; team chọn setting_status với 0 đang thiết lập/vô hiệu, 1 có hiệu lực, 2 đã xóa. Mã số/kiểu TINYINT là lựa chọn kỹ thuật |
| ② / Q35 | Trong một rule: bộ lọc OR cùng loại/AND khác loại; trung bình/tỷ lệ nhóm AND với nhau và với bộ lọc. Giữa nhiều rule: chọn khớp đầu tiên theo ưu tiên, không AND các rule | **Đã xác nhận**, đóng câu hỏi AND/OR |
| ③ / Q36 | Lưu xóa điểm thành công thì ô trống, ngừng dấu/lọc đỏ của ô ngay; xóa rule vẫn giữ kết quả trước tới lần xét lại | **Đã xác nhận**, đã thể hiện khác biệt trên Frame 04 (thẻ giải thích và hình minh họa 5 ô) |
| ④ / Q37 | Dòng 1 A÷2 cắt xuống, dòng 2 nhân 0.8 không xử lý: A=49.7, T=19.2; S=19.1 với < là đỏ; sửa chữ chồng | **Đã xác nhận**, áp dụng cho ví dụ cùng rule; đã thể hiện ở 01-B và 03-C |
| ⑤ / Q38 | Hai phía thường/đơn vị đều thấy và kiểm được lựa chọn độc lập; sửa nền che panel B | **Đã xác nhận**, không có thay đổi schema từ lỗi layer; panel B đã kiểm hiển thị đầy đủ |

[DEC-002 Việt](decisions/DEC-002-setting-status.vi.md) / [Nhật](decisions/DEC-002-setting-status.ja.md) ghi lý do chọn một cột, kiểm giới hạn tương thích và mã lưu. Danh sách dùng setting_status IN (0,1), bộ xét chỉ =1; xóa chuyển 2 cùng transaction tăng phiên bản rule. Mã 2 không được kiểm như boolean true. Không có dữ liệu chứng minh cần giữ active trong phạm vi source đã đọc; nếu tích hợp phát hiện khác, phải nêu đường phụ thuộc trước khi dùng phương án dự phòng.

Bộ gửi review tiếp tục mô tả trực tiếp thiết kế, không chép lịch sử này hoặc nhãn chờ xác nhận lên tài liệu/canvas. Q35–Q38 được chốt nghiệp vụ không có nghĩa DDL/ứng dụng đã được chạy hay Cursor/Claude đã hoàn tất sửa Figma. [Checklist Việt](docs/v2/figma-update-checklist.vi.md) / [Nhật](docs/v2/figma-update-checklist.ja.md) chỉ rõ phần cần kiểm/sửa, nhất là giới hạn AND trong một rule. Giữ 8 task, 40 AC, v1 không đổi; không tự publish.

<a id="evidence"></a>

## 10. Bằng chứng và giới hạn

- Xác nhận Q3 bổ sung được người phụ trách cung cấp nguyên văn trong phiên ngày 25/09. Lượt chỉnh Figma bản Nhật chỉ thay chú thích/bố cục, không kiểm lại source/runtime; kết quả nghiên cứu trước đó vẫn có giới hạn và baseline riêng.
- Nền ngày 24/09: tệp trả lời cuộc họp, message/sáu ảnh Slack, Q&A r16 và source baseline 3b32492d439a30d323af2b2369534b6b680ef23a. Dấu vết source/hash và các khoảng trống thuộc lần đó nằm trong research ngày 24/09; không coi là mọi đường đều đã được kiểm lại ở baseline mới.
- Bổ sung ngày 25/09: đọc nguyên văn message Q1–Q7.2 và ba ảnh; kiểm source Q1/Q3/Q7.1 tại 7652109b4542ecc9fb392bde6f2afb755a244316. Báo cáo và bằng chứng file/dòng ghi các đường đã kiểm. Không sửa application code.
- UI ad31 ngày 25/09: mở form maximum và đúng mục Điểm số（得点） maximum 200/minimum 0 tại trường demo 515/năm 2026; mở tùy chọn phiếu ở bảng 4133, thấy hướng dẫn xét điều kiện từ trên xuống. Chỉ bật phần form để xem, tải lại bỏ thay đổi, không lưu. Dòng đỏ trong ảnh thứ ba là thiết kế; màn live đã kiểm chưa có dòng mới đó.
- Tại thời điểm kiểm, trường demo 515 và 2/năm 2026 không có định nghĩa trong nhóm Thiết lập điểm tối đa（満点設定）. Trường 515 có trường nhập số tên Điểm tối đa（満点） ở nhóm điều kiện đánh giá, không chứng minh có ghi đè maximum. Chưa xác minh cặp lớp đang dùng 50/100 cùng nhóm; không dùng ví dụ làm dữ liệu thật.
- Màn lựa chọn maximum hàng loạt tại trường 2 trả thông báo không thể truy cập. Source cho thấy có điều kiện bật/quyền/khung chương trình, nhưng chưa xác định nguyên nhân cụ thể của phản hồi live chỉ từ thông báo này. Không vượt qua giới hạn truy cập.
- Ảnh chỉ chứng minh nội dung ảnh; UI chỉ chứng minh trạng thái quan sát. Không lưu maximum/điểm, chạy AutoRating/batch, truy vấn DB, kiểm API, gây lỗi phục hồi hoặc xuất PDF/Excel trong lần điều tra ngày 25/09. Chưa xác minh source đang deploy hoặc nguồn snapshot. Không có bằng chứng nghiệm thu evaluator mới.
- CodeGraph là công cụ đã dùng trong research ngày 24/09, không phải bước chạy lại ngày 25/09. Điều tra bổ sung dùng srcwalk/source và Browser; không tuyên bố một công cụ chưa chạy là nguồn bằng chứng.
- Bằng chứng ad31 ngày 22/09 là lịch sử: maximum thay thế đã được quan sát trong giới hạn nhập; đối chiếu dữ liệu tổng hợp đã lưu không chứng minh bộ xét đỏ mới hoặc ba đầu ra đúng. Không dùng fixture cũ như dữ liệu chắc chắn vẫn tồn tại.
- Tính đầy đủ của research là trong các nguồn và các đường đã nêu; chưa phải audit mọi tùy biến trường hoặc mọi module ghi điểm toàn repository. Những đường phát hiện thêm khi thiết kế phải được đánh giá và cập nhật I01, không âm thầm bỏ qua.

<a id="history"></a>

## 11. Những nội dung cũ đã bị thay thế

| Nội dung cũ | Kết luận hiện hành |
| --- | --- |
| Q3 còn chờ A/B hoặc phải xử lý riêng nhóm có điểm tối đa khác nhau | Đã xác nhận dùng kết quả tổng hợp thứ hạng hiện có; không xử lý riêng hoặc ngăn cấu hình, nhưng không gây lỗi dừng xử lý do tình huống đó |
| Google Sheets là source of truth cần mở lại mỗi lần | Context này là baseline; Sheets chỉ là nguồn lịch sử, không tự cấp yêu cầu mới |
| Mọi điều kiện dùng nhỏ hơn; hai tỷ lệ bắt buộc floor | Cho chọn nhỏ hơn/nhỏ hơn hoặc bằng; xử lý phần lẻ theo loại và quyết định liên quan |
| Một mục chỉ một loại hoặc một form hai nhánh | Nhiều thiết lập có điều kiện áp dụng và ưu tiên |
| Hai form trung bình với công thức đóng cứng | Chuỗi phép tính linh hoạt theo mẫu AutoRating |
| Chế độ manual/auto, mặc định manual | Không có chế độ xét riêng; đi theo đăng ký điểm và tính hàng loạt hiện hữu |
| Đổi nguồn/maximum luôn tự chạy toàn bộ nếu auto | Trigger theo đường hiện có và vận hành đã xác nhận; không tự theo dõi mọi phụ thuộc |
| Điểm đơn vị còn chờ xác nhận | Đã thuộc đối tượng |
| Có thể cần migrate dữ liệu cũ, giữ biên cũ | Không migrate; giữ consumer legacy nguyên nghĩa |
| Bảng gộp hiệu ứng r15 là đặc tả cuối | Ngày 25/09 chốt riêng: phiếu chọn điều kiện khớp đầu tiên với đỏ sau ô chọn/trước ô trống; công khai kết hợp dấu khác, dấu trùng một lần |
| Đổi loại luôn giữ/xóa mọi giá trị | Hiện trạng phân biệt cùng phiên/mở lại/toán hạng; thiết kế cần mô tả cụ thể |
| Dùng nguyên AutoRating là tự đủ | Có no-config/manual skip, ghi NULL, min/max, khác transaction và bộ lọc batch |
| Giữ kết quả trước khi chờ nghĩa luôn giữ sau skip | Ngày 25/09: khi đã xét mà không tạo được ngưỡng hợp lệ thì ngừng dùng kết quả cũ; chưa xét được không đồng nghĩa đã đạt |
| Xóa thiết lập đỏ cuối thì bỏ dấu ngay (giả định cũ) | Q6.2-B: giữ kết quả trước tới lần đăng ký/tính lại; lần đó không còn cấu hình thì ngừng dùng |
| M của tỷ lệ độc lập còn có thể dùng bản chốt | Q1-A: dùng M hiện hành đúng ngữ cảnh; chính sách bản chốt giữ riêng cho nguồn trung bình |
| T âm còn chờ quyết định hoặc coi là không tính được | Q4-A: xét T âm hợp lệ bình thường, không ép về 0 |
| Đọc M từ helper chung là đủ mọi trường hợp | Phải có tầng đơn vị/ghi đè; helper khảo sát chưa đầy đủ |
| Hoàn thiện mockup/report nghĩa hoàn tất implementation | Thiết kế, xác nhận, source và runtime có bằng chứng riêng |

Các spec/split-tasks/AC và giả định cũ, kể cả bản tạo trước phản hồi ngày 25/09, không được dùng để khôi phục những điều đã bị thay thế. Khi cần lập lại, xuất phát từ context này cùng câu trả lời mới đã được cập nhật.

<a id="next"></a>

## 12. Cập nhật khi có phản hồi mới

1. Xác định điều nào trong context bị bổ sung/thay thế, nguồn xác nhận và ngày; không so với Sheets như chuẩn quyết định.
2. Ghi câu trả lời theo đúng file, phiên bản và từng leaf. Giữ số của bộ đã gửi (bản ngày 24/09); lần cập nhật 25/09 ghi các quyết định tại confirmed Q23–Q31 theo bảng 9.1, trong đó Q31 tương ứng Q3 đã gửi. Bảng 9.4 chỉ là lịch sử đổi số trước khi gửi. Một câu con được trả lời không tự đóng các câu con khác.
3. Khi có xác nhận, người phụ trách cập nhật quy tắc hiện hành và bảng trạng thái tại mục 9.1; đối chiếu bảng tác động mục 9.3, sửa phần thiết kế bị ảnh hưởng rồi đồng bộ Q&A đã xác nhận. Cập nhật trạng thái từng phần tại mục 9.5 theo bằng chứng đã hoàn thiện/đã kiểm, không chỉ đổi nhãn thành hoàn tất vì có câu trả lời. Với Q3, kiểm phạm vi mục 9.2 trước khi chốt công thức, nguồn dữ liệu và ví dụ phân nhánh. Giữ các giới hạn kỹ thuật độc lập với quyết định nghiệp vụ.
4. Cập nhật phạm vi thiết kế đầy đủ và danh sách triển khai/phát hành riêng. Một yêu cầu được đưa vào thiết kế không tự được bật trong release.
5. Khi source/provider/môi trường thay đổi, kiểm lại các đường liên quan và bằng chứng; không dùng hash hay lời giải thích lịch sử làm chứng minh runtime.
6. Chỉ sửa Figma, code, dữ liệu hoặc xuất bản khi được giao đúng phạm vi. Việc cập nhật context không tự cấp các quyền đó.

**Bàn giao hiện hành:** context/Q&A đến Q38 cùng phản hồi 30/09 và DEC-002. Thiết kế dùng setting_status; AND trong từng rule, xóa điểm, ví dụ phần lẻ và hiển thị thường/đơn vị đã được xác nhận. Tài liệu hiện hành độc lập với lịch sử phản hồi. Figma chưa kiểm hoàn tất; không suy thiết kế thành runtime/QA.
