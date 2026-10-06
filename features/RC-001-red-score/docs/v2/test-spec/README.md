# RC-001 — Test Spec và báo cáo kiểm thử

Report hiện hành dùng bố cục khách hàng `test-report@2.5.0`: hai sheet **Tổng quan** và **Kiểm thử**. Mỗi tình huống gồm tiêu đề/kết quả thực hiện, **Điều kiện**, bảng **Bước / Thao tác chung**, bảng trường hợp và ảnh minh chứng. Bảng trường hợp có năm cột: **Trường hợp**, **Dữ liệu / thao tác riêng**, **Kết quả mong đợi**, **Kết quả thực tế**, **Đánh giá**. Tên trường hợp giải thích ý nghĩa trước mã trong ngoặc, như **Nhỏ hơn (lt)** hoặc **Nhỏ hơn hoặc bằng (le)**. Không liệt kê lại tên biến thể trước bảng và không có phần kết quả mong đợi chung ngoài bảng.

## Trạng thái bàn giao ngày 06/10/2026

Report đã được đưa về trạng thái **chưa thực hiện** để bàn giao cho lượt kiểm thử mới: 569 trường hợp đều là **Chưa thực hiện**, phần **Thực tế** và thông tin lượt chạy để trống, không còn ảnh minh chứng hoặc quan sát của lượt cũ trong workbook. Giữ nguyên 216 TC, 569 mã biến thể, 100 fixture IDs và nội dung điều kiện, dữ liệu, thao tác, kỳ vọng từ nguồn hiện hành. Readiness, căn cứ kỳ vọng và gaps trong nguồn không được nâng trạng thái khi reset report.

- [Report hiện hành](test-report.vi.xlsx).
- [Report native Google Sheets — RedScoreTestReport](https://docs.google.com/spreadsheets/d/1OjiF8SubR9Q3t90F_sK64XoAXi7YtD3MV9k9ozSfJF0/edit?gid=202610061#gid=202610061): bản trắng được phép tạo để bàn giao lượt kiểm thử tiếp theo; hai ảnh và caption demo đã bỏ, không là bằng chứng ứng dụng.
- [Testcase nguồn](test-cases.vi.md): giữ grammar `test-cases@1.1.0`, dùng context chung để giảm lặp; không đổi oracle hoặc gắn nhãn thành 1.3.0.
- [Phạm vi và gaps](scope-and-approach.vi.md).
- [Dữ liệu kiểm thử](test-data.vi.md).

Workbook hiện hành chưa có kết quả của lượt mới và chưa đủ điều kiện nghiệm thu. Readiness, căn cứ kỳ vọng, đường chạy và bằng chứng còn thiếu được giữ nguyên trong nguồn. Kết quả tester ghi nhận không đồng nghĩa nghiệm thu: checker kiểm riêng Actual, dữ liệu, kỳ vọng và bằng chứng còn thiếu; không dùng readiness để khóa bộ đếm Đạt/Không đạt về 0. Không chạy được do thiếu điều kiện thì ghi **Bị chặn** và lý do, không tự đổi kỳ vọng. Reset report không chạy lại ứng dụng.

## Sử dụng report

Đọc Tổng quan trước, rồi theo link đến tình huống cần xem. Điều kiện và thao tác chung chỉ viết một lần; bên trái là số bước, bên phải là mô tả thao tác. Bảng trường hợp ghi dữ liệu/thao tác riêng và kỳ vọng đầy đủ của chính nhánh đó, gồm đối chứng hoặc yêu cầu bảo toàn cần thiết. Tên nút, màn hình, toán tử và giá trị quyết định được nhấn đậm có chọn lọc. Ghi quan sát cụ thể ở Kết quả thực tế; với Không đạt/Bị chặn/Không thực hiện, ghi sai khác hoặc lý do và bước tiếp theo. Không đổi kỳ vọng theo thực tế.

Kết quả TC và Tổng quan tổng hợp trực tiếp từ đánh giá của các trường hợp: có **Không đạt** thì TC Không đạt; tất cả **Đạt** thì TC Đạt; tất cả **Không thực hiện** thì TC Không thực hiện; có **Bị chặn** khi không có Không đạt thì TC Bị chặn; tất cả **Chưa thực hiện** thì TC Chưa thực hiện; các tổ hợp còn lại là **Đang thực hiện**. Các vấn đề chuẩn bị/xác minh vẫn được checker nêu riêng, không âm thầm đổi kết quả tester đã nhập thành Chưa đủ kết luận.

Phần thông tin và kết quả luôn hiển thị; chỉ phần **Ảnh minh chứng** có một cấp thu/mở, mặc định thu gọn. Mỗi ảnh có tiêu đề mô tả trường hợp hoặc mốc quan sát ở phía trên, ảnh nằm ngay dưới và xếp dọc. Không yêu cầu URL ảnh; chưa có ảnh chỉ hiện một dòng, không dành vùng trống lớn. Không có phụ lục kỹ thuật mặc định; chỉ giữ chi tiết cần để thực hiện hoặc xác minh phép kiểm cạnh nội dung liên quan. Ảnh dùng neo di chuyển và đổi kích thước cùng ô để thu/mở theo hàng trong Excel. Không chèn/sort tùy ý hàng, đổi merge hoặc di chuyển các ô nhập mà checker quản lý.

Hàng trống và vùng ảnh chưa sử dụng được ẩn hoàn toàn. Khi thu gọn ảnh, người đọc nhìn thấy ngay tình huống tiếp theo, không có các hàng dự phòng hoặc số hàng chen giữa. Nội dung ngoài bảng trường hợp căn giữa theo chiều dọc; nội dung trong bảng căn trên-trái. XLSX có hàng đệm 3 pt (khoảng 4 px) trước mỗi hàng kết quả logic để chữ không sát mép; không thêm trước phần Expected nối tiếp, không chứa thêm nội dung hoặc kết quả và không padding bằng newline. Giá trị căn phải ở Tổng quan có lề phải nhỏ; tiêu đề TC là link trên toàn bộ ô và không highlight từng cụm.

Khi bổ sung bằng chứng, chụp vùng nhìn đủ để thấy đối tượng, dữ liệu và kết quả cần chứng minh. Chỉ chụp toàn trang khi cần đối chiếu toàn bố cục; cuộn và chụp thêm nếu thiếu bối cảnh. Note ngắn bằng tiếng Anh đặt góc trên bên phải trong khoảng trống, không che dữ liệu. Highlight tối thiểu vùng liên quan, tránh khung trùng/lồng/chạm nhau; nếu cần chứng minh cặp điểm và kết quả, dùng một khung bao cả cặp.

Report native Google Sheets nêu trên đã được tạo theo phạm vi được phép, ở trạng thái bàn giao chưa test; không có ảnh demo hoặc bằng chứng ứng dụng. File local giữ 569 trường hợp **Chưa thực hiện**, Thực tế và metadata trống, không có ảnh. Việc tạo hoặc kiểm định dạng không chạy ứng dụng và không chứng minh nghiệm thu.

Trước lượt automation, dùng đúng một report authoritative do người phụ trách chọn: XLSX local hoặc native Google Sheets. Khi chọn native, ghi kết quả vào chính file native đã chỉ định; không tự đồng bộ kết quả về XLSX hoặc giữ hai bản cùng sửa. Khi chọn XLSX, conversion kết quả và quyền chia sẻ cần phạm vi riêng, rồi kiểm native trước khi bàn giao.

Native Sheets ẩn hàng đệm XLSX 3 pt để giữ coordinates binding và dùng padding thực: trên/dưới 4 px, hai bên 8 px. Ảnh phải chèn trong ô, không là floating image; title nằm trên ảnh và phải kiểm thu/mở. Tổng quan có 216 link toàn ô dẫn đến đúng TC bằng công thức HYPERLINK nội bộ; màu xanh/gạch chân không thay việc kiểm computed link và bấm đến đúng tình huống. Công thức tổng hợp, link, ảnh/nhóm hàng, trạng thái lưu và quyền người nhận phải được xác minh riêng; kiểm XLSX/Excel không chứng nhận native Google Sheets.

## Sinh và kiểm

Dùng plugin [BLEND Kit](https://github.com/TryHand-Co-Ltd/blend-kit) đã cài: **blend-generate-test-spec** để sinh hoặc kiểm report, **blend-automation-test** để thực hiện phạm vi kiểm thử đã được cho phép và cập nhật chính report này. Plugin là nguồn workflow/runtime duy nhất; không sao chép helper vào tài liệu feature.

BLEND Kit chỉ hỗ trợ report hiện hành `2.5.0`; testcase RC-001 `1.1.0` vẫn được đọc với grammar, IDs, dữ liệu và căn cứ kỳ vọng nguyên vẹn. Các mô tả từng nhánh được làm rõ từ case/fixture hiện có; không nâng Draft/Blocked thành Ready khi sửa cách trình bày. Exporter chỉ tạo file mới, không kế thừa kết quả. Checker chỉ đọc file hiện hữu; workbook format cũ bị từ chối mà không ghi lại, không có workflow migration. Dùng interpreter/dependency đã có của plugin, không tự cài như hệ quả của kiểm report.

Kiểm hoàn tất cần actual, căn cứ/chuẩn bị phù hợp, đóng lượt và xác minh bằng chứng/quyền xem thực tế; không suy từ định dạng đẹp hoặc structural check. Các template/archive/runtime sao chép cũ đã được bỏ khỏi thư mục này; khi cần tra bản trước, dùng lịch sử Git.
