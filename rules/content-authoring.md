# Quy tắc soạn nội dung BLEND

Áp dụng cho mọi nội dung BLEND: Q&A, DD, task, định nghĩa màn hình, mockup, QA/PR, hướng dẫn, báo cáo, bản dịch và giải thích trong chat. Quy tắc này bổ sung workflow chuyên biệt; không tự cấp quyền sửa ứng dụng, dữ liệu hoặc xuất bản.

## 1. Người đọc và mục đích

- Xác định người đọc và việc họ cần hiểu, quyết định hoặc thực hiện trước khi chọn cấu trúc.
- Nội dung gửi khách hàng tập trung vào hành vi nghiệp vụ, thao tác và kết quả; không mặc định kèm chi tiết triển khai.
- Nội dung kỹ thuật chỉ giữ chi tiết cần để thực hiện hoặc kiểm chứng đúng phạm vi.
- Ngôn ngữ và phạm vi người dùng yêu cầu ưu tiên hơn mặc định của template hoặc skill.

## 2. Tập trung vào vấn đề chính

- Mở đầu ngắn bằng vấn đề và hướng xử lý, rồi đi thẳng vào hành vi hoặc quyết định chính.
- Chỉ giữ section giúp người đọc hiểu, review hoặc thực hiện công việc. Không có bộ chương bắt buộc cho mọi tài liệu.
- Không mặc định thêm lịch sử research, traceability, kiến trúc, schema DB, code, rollout, ma trận test hoặc báo cáo nguồn vào tài liệu khách hàng.
- Research có thể sâu nhưng kết quả trình bày phải gọn. Mỗi quy tắc chỉ giải thích một lần; đặt ví dụ hoặc ngoại lệ cạnh quy tắc liên quan.
- Không bổ sung khả năng, phương án dự phòng hoặc phạm vi triển khai chỉ để tài liệu có vẻ đầy đủ. Không bỏ ngoại lệ làm thay đổi kết quả để rút ngắn.

## 3. Nội dung tiếng Việt có thuật ngữ Nhật

- Mỗi lần dùng tên màn hình, tab, nút, trường, trạng thái hoặc từ khóa nghiệp vụ tiếng Nhật trong nội dung tiếng Việt, đặt nghĩa tiếng Việt ngay cạnh, kể cả trong tiêu đề, bảng, đường dẫn thao tác, link và ví dụ.
- Dùng dạng **Tiếng Việt（日本語）** hoặc **日本語 (tiếng Việt)**. Một glossary riêng không thay thế yêu cầu này.
- Khi không cần đối chiếu UI ở lần nhắc lại, có thể chỉ dùng tiếng Việt. Không dùng tiếng Nhật đơn độc.
- Giữ nhãn Nhật của nguồn/UI chính xác và phân biệt nhãn hiện có với nhãn được đề xuất.
- URL, mã định danh, code và trích dẫn nguyên văn được giữ nguyên; với trích dẫn Nhật, đặt bản dịch hoặc giải thích Việt cạnh bên.
- Mockup UI Nhật có thể giữ nhãn sản phẩm nguyên bản; chú thích dành cho người review đặt ngoài giao diện.

## 4. Nguồn, xác nhận và đề xuất

- Ưu tiên xác nhận mới nhất được phép áp dụng, rồi yêu cầu task và đặc tả gốc đúng phạm vi. Code chứng minh hiện trạng, không thay quyết định nghiệp vụ.
- Phân biệt rõ nội dung đã xác nhận, giả định tạm dùng và đề xuất cần review ngay nơi chúng xuất hiện.
- Không hỏi lại điều đã được trả lời hoặc giữ phương án đã bị thay thế như lựa chọn hiện hành.
- Không biến suy luận của agent thành xác nhận khách hàng. Điểm còn mở phải nêu tình huống, ảnh hưởng và hướng đề xuất; chỉ hỏi điều làm thay đổi kết quả.
- Tài liệu dùng chung chỉ dùng link tương đối trong `blend-context` hoặc URL nguồn dùng chung. Không dùng đường dẫn máy, localhost, helper/file riêng, secret hoặc link ngoài phạm vi được phép.
- Giữ giới hạn kiểm chứng trung thực nhưng phù hợp người đọc; chi tiết công cụ và log research chỉ nằm trong hồ sơ kỹ thuật khi cần.

## 5. Điều chỉnh theo loại nội dung

- **DD/đề xuất gửi khách hàng:** mục tiêu → quy tắc nghiệp vụ → màn hình/thao tác chính → kết quả → điểm cần review.
- **Nội dung có màn hình:** màn hình → tab/khu vực → chức năng; nêu thao tác và kết quả, chỉ mô tả chi tiết trường nhập khi cần quyết định.
- **Q&A:** tình huống cụ thể → điều chưa rõ và ảnh hưởng → phương án/đề xuất → câu xác nhận độc lập.
- **QA/test:** điều kiện chuẩn bị, thao tác và kết quả mong đợi; phân biệt test dự kiến với kết quả đã chạy.
- **Report dạng bảng tính:** nội dung ngoài bảng trường hợp căn giữa theo chiều dọc; nội dung trong bảng trường hợp bắt đầu ở phía trên-trái, cách mép trên khoảng 4 px. Giá trị căn phải có lề phải nhỏ. Google Sheets dùng padding của ô; XLSX dùng hàng đệm 3 pt chỉ trước hàng dữ liệu trong bảng trường hợp, không thêm khoảng trắng hoặc xuống dòng vào giá trị hay định dạng hiển thị. Không tạo thêm hàng đệm ở các phần khác. Tab Tổng quan không highlight từng cụm trong tiêu đề TC và giữ link trên toàn bộ ô; chỉ nhấn mạnh từ khóa trong nội dung kiểm thử. Kiểm tra khoảng cách, nội dung dài và link bằng giao diện thực tế.
- **Task/PR/báo cáo:** vấn đề, thay đổi/kết quả và bằng chứng đúng với người đọc; tuân thủ format chuyên biệt khi được yêu cầu.
- **Mockup:** chỉ chứa UI dự kiến; giải thích và lưu ý review nằm ngoài hình.

## 6. Kiểm tra trước khi giao

- Người đọc có hiểu và sử dụng tài liệu mà không cần lịch sử chat hoặc file local không?
- Mỗi section có giúp review hoặc thực hiện công việc không, và có quy tắc nào bị lặp không?
- Mọi thuật ngữ Nhật trong bản Việt đã có nghĩa Việt ngay cạnh chưa?
- Xác nhận, ví dụ biên, thời điểm và khác biệt đầu ra còn đúng sau khi rút gọn không?
- Đề xuất chưa chốt có được ghi rõ ngay nơi dùng không?
- Link có nằm trong `blend-context` hoặc là nguồn dùng chung, không vượt quá bằng chứng đã có không?
