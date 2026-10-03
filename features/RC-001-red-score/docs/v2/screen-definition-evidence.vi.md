# Hồ sơ nội bộ — căn cứ của đặc tả màn hình

Ngày ghi nhận: **30/09/2026**. Feature: **RC-001**, nguồn Sheet. Hồ sơ này không thuộc bộ gửi khách hàng.

## Phạm vi và phiên bản

- Tài liệu được chỉnh: [Đặc tả màn hình và dữ liệu](screen-definition.vi.md).
- SHA-256 bản trước chỉnh: `2698a05b252a1c78b37f29d8d4abb7e9f97aed5c51ec2f696cdb79332b6c490d` (file chưa commit).
- Lượt này chỉ chỉnh tài liệu theo review đã được người phụ trách phê duyệt; không mở/kiểm lại Figma, không chạy ứng dụng hoặc SQL.
- Phần đối chiếu Figma bên dưới được chuyển nguyên từ bản trước chỉnh để giữ lịch sử bằng chứng. Đây là ghi nhận của lượt soạn trước, không phải canvas được tái xác minh trong lượt này.
- Bản trước ghi đã xác nhận node của tám cụm và đối chiếu một số trạng thái/ghi chú ngày 30/09; chưa xác minh từng trường của toàn bộ mockup hoặc hành vi lưu/chạy của ứng dụng.

## Căn cứ chỉnh nội dung

| Điểm review | Căn cứ và cách xử lý |
| --- | --- |
| SD-01 — bộ lọc | [DB, mục 3.2](database-design.vi.md#32-apply_condition) xác định bảy loại bộ lọc, OR cùng loại/AND khác loại và AND các điều kiện tổng hợp. Bổ sung bảng lựa chọn, phân biệt lớp chủ nhiệm/lớp học phần; “toàn bộ” chỉ bỏ bộ lọc thông thường, không xóa điều kiện tổng hợp đã nhập. Khi cả hai nhóm điều kiện trống mới có nghĩa không giới hạn |
| SD-02 — lưu thứ tự | Source hiện hữu của tính tự động dùng nút lên/xuống và gửi lưu ngay. Dùng hành vi này làm phương án thiết kế cho điểm đỏ; chưa chứng minh nút hoặc xử lý điểm đỏ đã tồn tại trên canvas/runtime. Bổ sung ranh giới thành công, thất bại, chưa rõ kết quả và quay lại |
| SD-03 — lượt chạy có nhiều loại ô | [AC-G23](acceptance-criteria.vi.md) yêu cầu ô thiếu nguồn chưa xét được nhưng ô độc lập trong cùng lượt vẫn xử lý. Làm rõ ngay điều kiện của nút chạy và bổ sung ví dụ |
| SD-04 — giới hạn ký hiệu | Đã đọc input và validation của ký hiệu trích xuất: phần này không có trần số ký tự cụ thể. Chưa đủ căn cứ kết luận toàn đường lưu không có giới hạn; chưa xác minh trần ký hiệu phiếu. Ghi rõ hai giới hạn chưa xác định, không tự đặt số hoặc tuyên bố không giới hạn |

## Source đã đọc — bằng chứng tĩnh

Application revision: `7652109b4542ecc9fb392bde6f2afb755a244316`; working tree ứng dụng sạch tại lúc đọc. Các định danh sau là đường dẫn tương đối từ repository `blend`; không có permalink source đã xác minh trong lượt này.

- `blend:application/views/grade_report_setting/auto_rating/edit.php:510-573`: nút sắp xếp dùng up/down, gửi POST tới đường sort sau mỗi lần bấm; đây là UI tính tự động hiện có.
- `blend:application/controllers/grade_report_setting/auto_rating/AutoRatingConfController.php:455-500`: đổi thứ tự trong transaction. Không coi đoạn này là bằng chứng xử lý điểm đỏ mới.
- `blend:application/views/grade/grade_setting_system/new_grade_extraction/edit/parts/detail/common/_display_pattern.php:29-43`: input prefix/suffix là text, không khai báo maxlength trong phần đã đọc.
- `blend:application/controllers/grade/grade_setting_system/new_grade_extraction/AdminNBGradeExtractionSettingController.php:1956-1980`: kiểm ký hiệu rỗng khi bật; không có kiểm độ dài ở method này. Không suy việc thiếu kiểm tại đây thành không có giới hạn ở mọi tầng.
- `blend:application/views/grade_report_setting/report_card/widget_grades_normal.php:1355-1358`: trường ký hiệu phía sau của điều kiện ô chọn hiện có dùng `append_string`, không khai báo maxlength ở input này. Chưa xác minh đủ đường lưu/kiểm độ dài để công bố trần cho điều kiện đỏ mới.

## Việc cần hoàn thiện trước bản gửi cuối

- Xác minh trần số ký tự ký hiệu trích xuất và ký hiệu phiếu trên đúng đường lưu, xác định cách đếm ký tự và cách báo lỗi; không chuyển thành câu hỏi yêu cầu khách hàng điều tra kỹ thuật.
- Bản Nhật và bố cục Google Sheets chưa được tạo/kiểm trong lượt chỉnh bản Việt này.
- Phương án lên/xuống và lưu ngay cần đối chiếu với màn thiết kế khi lượt kiểm Figma được giao trở lại. Không đánh dấu canvas hoặc runtime hoàn tất từ thay đổi Markdown.

## Lịch sử đối chiếu Figma chuyển từ bản trước

### Tham chiếu bản vẽ và phạm vi đối chiếu

Các số 00–07 trong bảng dưới là cụm trên Figma, khác số tab dự kiến của tài liệu. Một cụm Figma có thể chứa nhiều màn hoặc trạng thái. “Đã xác nhận node” nghĩa là đã chọn đúng vùng và đọc URL tương ứng, không đồng nghĩa đã kiểm mọi trường hoặc thao tác trong vùng đó.

| Cụm Figma | Link node hiện hành | Nội dung đã đối chiếu trực tiếp | Phần còn cần đối chiếu chi tiết |
| --- | --- | --- | --- |
| 00 — Hướng dẫn | [Hướng dẫn và luồng tổng thể](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-10180) | Cách đọc, luồng 01→04 và ba đầu ra; phân biệt chú thích với màn sản phẩm | Không dùng việc đọc hướng dẫn để kết luận các màn khác đã được kiểm |
| 01 — Điểm vào/danh sách/xóa | [Cụm 01](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-9443) · [Trạng thái lưu dở](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-10163) | Dòng chưa hoàn chỉnh, mở ngưỡng sửa tiếp, xóa quy tắc và giữ kết quả trước | Các trường của màn điểm vào và danh sách chính; node riêng của hộp xác nhận xóa |
| 02 — Điều kiện/nguồn | [Cụm 02](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-8717) · [Ghi chú nguồn](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-8729) · [AND/OR và ưu tiên](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=166-4) | Phạm vi đối tượng, nguồn độc lập, nhóm theo cấu hình, AND/OR và ví dụ ưu tiên | Từng control của hai trạng thái form 02-A/02-B |
| 03 — Ngưỡng/công thức | [Cụm 03](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-7480) · [Giải thích ví dụ 49.7→24→19.2](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-7504) | Ví dụ phần lẻ, không ghi đè điểm, ngưỡng âm và lỗi công thức | Toàn bộ trường nhập, giá trị đang chọn và bố cục form 03-A/B/C |
| 04 — Thực hiện/kết quả | [Cụm 04](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=188-2) · [Giải thích xóa điểm/xóa quy tắc](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=188-141) | Xóa điểm có hiệu lực sau lưu thành công; xóa quy tắc giữ kết quả đến lần xét lại | Khu vực nút tổng hợp và tính toán; các control vận hành |
| 05 — Trích xuất/Excel | [Cụm 05](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-6230) | Đã xác nhận node và vị trí cụm | Chưa đọc chi tiết nội dung; bảng thành phần ở tab 07 dựa trên đặc tả hiện hành |
| 06 — Công khai/học sinh | [Cụm 06](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-5580) · [So sánh điểm thường/đơn vị](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-5615) | Phía điểm đơn vị có bộ chọn nhìn thấy và ghi chú lưu riêng; đọc được một phần phía điểm thường | Đọc trọn phía điểm thường, form công khai chính và kết quả học sinh |
| 07 — Phiếu/PDF | [Cụm 07](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=58-5111) | Tiêu đề/giải thích khớp đầu tiên; cấu trúc ví dụ bốn cách hiển thị | Từng trường hộp tùy chọn, ký tự mẫu cuối bảng và PDF mẫu |

Những phần chưa đối chiếu trực tiếp vẫn được mô tả theo yêu cầu và thiết kế đã tổng hợp; không coi hình minh họa chưa đọc rõ là căn cứ để đổi nghiệp vụ. Bản này có thể được review nội dung, đồng thời giữ rõ phần đối chiếu bản vẽ còn lại.
