# DEC-001 — Trạng thái rule và nhất quán giữa dữ liệu, màn hình

**Trạng thái lịch sử:** phương án active + deleted_at ở ① đã được thay bằng [DEC-002](DEC-002-setting-status.vi.md) ngày 30/09. Các trạng thái chưa xác nhận AND bên dưới là của mốc 29/09; Q35–Q38 nay đã có [xác nhận mới](../sources/2026-09-30-design-review-confirmation.vi.md). Giữ nội dung sau để truy vết, không dùng thay context hiện hành.

Ngày: **29/09/2026**. Phạm vi: RC-001. Căn cứ: [phản hồi năm điểm](../sources/2026-09-29-design-review-feedback.vi.md), [context](../CONTEXT.md#review-consistency-20260929) và chỉ dẫn người phụ trách cập nhật theo phản hồi. Đây là lựa chọn thiết kế của team được phép soạn, không phải khách hàng đã duyệt DDL hoặc mọi phương án dưới đây.

| Điểm | Quyết định/hướng xử lý | Trạng thái |
| --- | --- | --- |
| ① | Giữ active cho hiệu lực xét, thêm deleted_at để nhận diện xóa. Danh sách lấy chưa xóa; bộ xét lấy chưa xóa và active=1. Rule lưu dở có thể sửa tiếp, xóa rồi không trở lại | Yêu cầu phân biệt đã rõ; cách lưu deleted_at là phương án kỹ thuật để review |
| ② | OR cùng loại chỉ áp dụng bộ lọc đối tượng. Các dòng trung bình/tỷ lệ nhóm đề xuất AND với nhau và với bộ lọc | Chưa có xác nhận riêng; chỉ theo dõi ở context/Q&A. Bộ gửi review trình bày thiết kế AND trực tiếp, không ghi lịch sử/chờ xác nhận |
| ③ | Lưu xóa điểm thành công thì ô trống và ngừng dấu/lọc của ô trong cùng transaction. Xóa rule vẫn giữ kết quả trước tới lần xét lại | Kế thừa quy tắc dữ liệu hiện hành; trả lời câu hỏi khách hàng, sửa chú thích sai |
| ④ | Ví dụ cùng rule ở 01-B/03-C: dòng 1 cắt xuống số nguyên, dòng 2 không xử lý; A=49.7 → T=19.2; S=19.1, dấu < → đỏ | Người phụ trách chọn hướng thống nhất theo ví dụ DB; chưa kiểm canvas sau sửa |
| ⑤ | Sửa lớp nền/cấu trúc chứa để panel B hiện bộ chọn độc lập; giữ cấu hình thường/đơn vị riêng | Yêu cầu UI rõ; chưa hoàn tất sửa Figma |

## Lý do và phương án không chọn

- Chỉ active không phân biệt được lưu dở với xóa. Thêm deleted_at giữ hợp đồng active 0/1 và ghi được thời điểm xóa. Chuyển sang enum nhiều trạng thái cũng có thể làm được nhưng không cần cho lần sửa này; không thêm màn quản lý trạng thái hoặc phục hồi rule.
- Không suy xóa qua ngưỡng trống, không xóa vật lý rule để tránh mất quan hệ của kết quả cũ. Form mở trước khi xóa phải bị từ chối lưu sau khi rule đã xóa.
- AND cho điều kiện tổng hợp biểu diễn được khoảng 50≤A<70. Chọn OR hoặc thêm bộ soạn AND/OR tùy ý làm thay đổi kết quả/phạm vi và chưa được chốt.
- Giữ ví dụ làm tròn đã có trong DB/AC để sửa cùng một rule trên UI; không tạo thêm ví dụ khác chỉ để hợp thức hóa mâu thuẫn.

## Tác động và nội dung bị thay thế

Thay định nghĩa active=0 gồm cả xóa mềm trong DB/DDL v2; thêm điều kiện đọc, lưu dở, xóa, copy và chống form cũ phục hồi rule. Bổ sung Task 1/2/3/4/6/8 và AC-G04/G05/G16/G19/G32; giữ số task và AC. Chú thích xóa điểm chờ chạy lại, cách làm tròn dòng 2 của cùng ví dụ, và bộ chọn đơn vị bị che cần được sửa theo [checklist](../docs/v2/figma-update-checklist.vi.md).

Giữ nguyên v1 và các xác nhận cũ. Không chạy migration hoặc sửa ứng dụng. Chỉ phần tổng hợp của AC-G05 chờ quyết định; không mở lại Q3/Q32/Q33 hay giữ các phần khác ở trạng thái chưa rõ.

## Lessons

1. Mỗi trạng thái UI có thao tác tiếp theo khác nhau phải có dữ liệu phân biệt được; kiểm cả lưu dở → tải lại → xóa → mở URL cũ.
2. Quy tắc AND/OR phải nêu rõ loại điều kiện; dùng phản ví dụ A=40 cho hai điều kiện 50≤A<70 để phát hiện cách hiểu sai.
3. Phân biệt đối tượng bị xóa và thời điểm commit: xóa điểm khác xóa rule, khác nguồn không tính được.
4. Tóm tắt và form phải biểu diễn cùng cấu hình đã lưu. Với làm tròn từng bước, kiểm cả T và kết luận ở điểm nằm giữa hai ngưỡng.
5. Node tồn tại không chứng minh nhìn thấy hoặc thao tác được; kiểm layer, clipping và mỗi nhánh thường/đơn vị bằng ảnh sau sửa.
6. Review đủ một nhóm feedback không đồng nghĩa đã bao phủ toàn vòng đời; ghi rõ phạm vi và phần canvas chưa kiểm.
7. Bộ gửi khách hàng mô tả đầy đủ phương án và hành vi, không mang lịch sử chat, mã Q hay nhãn chờ phản hồi. Nguồn/trạng thái giữ trong context nội bộ; hoàn chỉnh bản gửi không đồng nghĩa khách hàng đã duyệt.

## Bằng chứng cần hoàn tất

Tài liệu/DDL và ví dụ được kiểm tĩnh; chưa chạy DB/ứng dụng. Figma vẫn cần ảnh sau sửa và kiểm thao tác liên quan. Reply soạn trong chat không chứng minh đã gửi hoặc nhận được xác nhận AND.
