# RC-001 — Test Spec và báo cáo kiểm thử

Report hiện hành dùng bố cục khách hàng `test-report@2.4.0`: hai sheet **Tổng quan** và **Kiểm thử**. Mỗi tình huống có điều kiện/dữ liệu cần thiết, thao tác và bảng đối chiếu kết quả mong đợi với thực tế của từng trường hợp. Tên trường hợp giải thích ý nghĩa trước mã trong ngoặc, như **Nhỏ hơn (lt)** hoặc **Nhỏ hơn hoặc bằng (le)**. Người đọc có thể hiểu phép kiểm và kết quả ngay tại tình huống đó.

## Trạng thái bàn giao ngày 06/10/2026

Report đã được đưa về trạng thái **chưa thực hiện** để bàn giao cho lượt kiểm thử mới: 569 trường hợp đều là **Chưa thực hiện**, phần **Thực tế** và thông tin lượt chạy để trống, không còn ảnh minh chứng hoặc quan sát của lượt cũ trong workbook. Giữ nguyên 216 TC, 569 mã biến thể, 100 fixture IDs và nội dung điều kiện, dữ liệu, thao tác, kỳ vọng từ nguồn hiện hành. Readiness, căn cứ kỳ vọng và gaps trong nguồn không được nâng trạng thái khi reset report.

- [Report hiện hành](test-report.vi.xlsx).
- [Testcase nguồn](test-cases.vi.md): giữ grammar `test-cases@1.1.0`, dùng context chung để giảm lặp; không đổi oracle hoặc gắn nhãn thành 1.3.0.
- [Phạm vi và gaps](scope-and-approach.vi.md).
- [Dữ liệu kiểm thử](test-data.vi.md).

Workbook hiện hành chưa có kết quả của lượt mới và chưa đủ điều kiện nghiệm thu. Readiness, căn cứ kỳ vọng, đường chạy và bằng chứng còn thiếu được giữ nguyên trong nguồn; không kết luận PASS khi source còn Draft/Blocked hoặc chưa xác nhận kỳ vọng. Reset report không chạy lại ứng dụng.

## Sử dụng report

Đọc Tổng quan trước, rồi theo link đến tình huống cần xem. Điều kiện và thao tác chung chỉ viết một lần; bảng đối chiếu ghi dữ liệu và kỳ vọng cụ thể của từng trường hợp. Ghi quan sát cụ thể ở Thực tế; với Không đạt/Bị chặn/Không thực hiện, ghi sai khác hoặc lý do và bước tiếp theo. Những điều kiện thiếu ảnh hưởng tới kết luận vẫn được hiển thị. Không đổi kỳ vọng theo thực tế.

Phần thông tin và kết quả luôn hiển thị; chỉ phần **Ảnh minh chứng** có một cấp thu/mở, mặc định thu gọn. Mỗi ảnh có tiêu đề mô tả trường hợp hoặc mốc quan sát ở phía trên, ảnh nằm ngay dưới và xếp dọc. Không yêu cầu URL ảnh; chưa có ảnh chỉ hiện một dòng, không dành vùng trống lớn. Không có phụ lục kỹ thuật mặc định; chỉ giữ chi tiết cần để thực hiện hoặc xác minh phép kiểm cạnh nội dung liên quan. Ảnh dùng neo di chuyển và đổi kích thước cùng ô để thu/mở theo hàng trong Excel. Không chèn/sort tùy ý hàng, đổi merge hoặc di chuyển các ô nhập mà checker quản lý.

Hàng trống và vùng ảnh chưa sử dụng được ẩn hoàn toàn. Khi thu gọn ảnh, người đọc nhìn thấy ngay tình huống tiếp theo, không có các hàng mỏng hoặc số hàng chen giữa. Nội dung ô căn trái, sát trên và có lề nhỏ để dễ đọc.

Khi bổ sung bằng chứng, chụp vùng nhìn đủ để thấy đối tượng, dữ liệu và kết quả cần chứng minh. Chỉ chụp toàn trang khi cần đối chiếu toàn bố cục; cuộn và chụp thêm nếu thiếu bối cảnh. Note ngắn bằng tiếng Anh đặt góc trên bên phải trong khoảng trống, không che dữ liệu. Highlight tối thiểu vùng liên quan, tránh khung trùng/lồng/chạm nhau; nếu cần chứng minh cặp điểm và kết quả, dùng một khung bao cả cặp.

Sau khi kiểm thử và review xong, chuyển **chính file kết quả này** sang native Google Sheets, kiểm lại công thức tổng hợp, link điều hướng, ảnh/nhóm hàng và quyền xem của khách hàng, rồi gửi link. Chưa thực hiện conversion/sharing trong đợt cập nhật này; kiểm tra XLSX/Excel không chứng nhận native Google Sheets.

## Sinh và kiểm

Dùng plugin [BLEND Kit](https://github.com/TryHand-Co-Ltd/blend-kit) đã cài: **blend-generate-test-spec** để sinh hoặc kiểm report, **blend-automation-test** để thực hiện phạm vi kiểm thử đã được cho phép và cập nhật chính report này. Plugin là nguồn workflow/runtime duy nhất; không sao chép helper vào tài liệu feature.

BLEND Kit chỉ hỗ trợ report hiện hành `2.4.0`; testcase RC-001 `1.1.0` vẫn được đọc với grammar và kỳ vọng nguyên vẹn. Exporter chỉ tạo file mới, không kế thừa kết quả. Checker chỉ đọc file hiện hữu; workbook format cũ bị từ chối mà không ghi lại, không có workflow migration. Dùng interpreter/dependency đã có của plugin, không tự cài như hệ quả của kiểm report.

Kiểm hoàn tất cần actual, căn cứ/chuẩn bị phù hợp, đóng lượt và xác minh bằng chứng/quyền xem thực tế; không suy từ định dạng đẹp hoặc structural check. Các template/archive/runtime sao chép cũ đã được bỏ khỏi thư mục này; khi cần tra bản trước, dùng lịch sử Git.
