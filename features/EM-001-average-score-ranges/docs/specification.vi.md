# Đặc tả dự thảo — Ánh xạ theo khoảng trung bình

Ngày: 14/10/2026. Đọc [context](../CONTEXT.md) và [nguồn xác nhận](../sources/confirmed-business-qa.vi.md) trước. Tài liệu này diễn giải context, không phải nguồn yêu cầu độc lập. Mục 1 là nguyên tắc đã xác nhận; mục 2–3 là ví dụ; mục 4 là đề xuất; mục 5 kế thừa nguồn chung và nêu hướng vận hành; mục 6 là kiểm chứng chưa thực hiện.

## 1. Thiết lập và tính

Chọn mục nhận có sẵn, nguồn trung bình (thiết lập tổng hợp, kỳ, tập thể) và mục số của học sinh. Trung bình chọn hàng, điểm học sinh chọn kết quả trong hàng đó. Lưu/mở lại phải giữ điều kiện, toán tử, giá trị và thứ tự. Chạy AutoRating để tính/ghi; cần tính lại khi bảng hoặc trung bình thay đổi.

Xét điều kiện theo thứ tự, khớp đầu tiên được dùng. Không khớp ghi trống, kể cả có kết quả cũ; không tự gán giá trị thấp nhất. Mục nhận có thể là số hoặc lựa chọn. Giá trị ánh xạ gắn với mục nhận đã chọn; cách nhập và kiểm tra hợp lệ chưa được Shite quy định chi tiết trong chuỗi.

## 2. Ví dụ mục số chỉ dùng 1, 3, 5

Mục nhận là điểm xếp loại（評定）, giới hạn có hiệu lực 1–5, không có cấu hình khác thay giới hạn. **Dữ liệu minh họa theo yêu cầu người phụ trách**, không thay ví dụ gốc của khách.

| Trung bình nhóm | Điều kiện điểm cá nhân xét theo thứ tự |
| --- | --- |
| 0 ≤ trung bình <50 | ≥80 → 5; ≥65 → 3; <65 → 1 |
| 50 ≤ trung bình <70 | ≥90 → 5; ≥75 → 3; <75 → 1 |
| 70 ≤ trung bình ≤100 | ≥95 → 5; ≥85 → 3 |

- Trung bình 49, điểm 85 → 5; trung bình 60, điểm 85 → 3; trung bình 60, điểm 30 → 1.
- Trung bình 70, điểm 70 → trống: hàng cuối không có điều kiện cho điểm này.
- Giá trị 2, 4 vẫn nằm trong giới hạn mục nhận nhưng không được bảng này trả về.
- Thêm/xóa điều kiện không thay giới hạn 1–5. Không yêu cầu số điều kiện bằng 5.

Ví dụ gốc dùng bảng khác: trung bình 60, điểm 85 → **4**. Ví dụ Q2 của khách dùng kết quả **2, 4, 5**. Không trình bày các bảng này như cùng một cấu hình.

## 3. Ví dụ mục lựa chọn

Bộ A/B/C dùng cùng ngưỡng minh họa ở mục 2, thay kết quả 5 → A, 3 → B, 1 → C. Đây là cách minh họa hai loại mục nhận, không phải quy tắc quy đổi A=5/B=3/C=1 áp dụng trong hệ thống. Mã lưu của lựa chọn không đồng nhất với nhãn hiển thị và không được dùng làm điểm nguồn.

## 4. Chi tiết đề xuất cần review

**Toàn bộ mục này là đề xuất hoặc điểm kỹ thuật cần đối chiếu, không phải xác nhận bổ sung của Shite.** Quy tắc chung lấy lần khớp đầu tiên và ghi trống khi không khớp ở mục 1 vẫn là yêu cầu đã chốt; việc mô tả hai lớp bên dưới không mở lại các nguyên tắc đó.

- Đề xuất kiểm giá trị đầu ra theo loại và giới hạn của mục nhận. Cách từ chối cấu hình ngoài giới hạn hay giới hạn kết quả khi ghi cần đối chiếu hiện trạng; không coi đây là validation Shite đã phê duyệt.

- Phương án biểu diễn khoảng trung bình: hai phép so sánh nối VÀ, cận thứ hai có thể bỏ; danh sách hàng có thứ tự. Đây là phương án UI để review, **không phải giới hạn nghiệp vụ tối đa hai điều kiện đã được khách chốt**.
- Chọn hàng khớp đầu tiên, chỉ xét điều kiện cá nhân trong hàng đó; không quay sang hàng sau khi không khớp điểm cá nhân.
- Thiếu trung bình hoặc không có hàng khớp → trống. Điểm cá nhân trống → trống là phần nhóm bổ sung theo hiện trạng. Điểm 0 không phải ô trống.
- Dùng mục nhận đang cấu hình, không thêm bộ chọn riêng; thêm phương thức mới cho hai bước. Đây là lựa chọn UI, không phải xác nhận Q2.
- Tóm tắt và log thể hiện thứ tự, nguồn thực dùng, điều kiện khớp và kết quả. Chi tiết dữ liệu/log chưa chốt.
- Quyền ghi/ô sửa tay và giới hạn có hiệu lực trước lưu cần giữ theo hệ thống hiện có, đối chiếu khi triển khai.

## 5. Nguồn trung bình và vận hành

Dùng quy tắc chung [RA-001](../../RA-001-ranking-average/docs/specification.vi.md): trước làm tròn, tổng điểm/số học sinh có điểm của cùng bản nguồn; không dùng `examinees`. Ví dụ 1.812/30 = 60,4 thì 30 là số học sinh có điểm. Chính sách bản chốt theo Q2 còn mở của RA-001. Theo phương án A đang dùng, phạm vi đang chốt mà thiếu nhóm thì coi là thiếu trung bình, không lấy số mới nhất; mẫu số 0 cũng là thiếu trung bình. Xem context mục 4 trước khi dùng nguồn.

Hướng vận hành đề xuất: chỉ sửa bảng thì lưu và chạy AutoRating đủ phạm vi; nguồn điểm đổi thì cập nhật tổng hợp/bản chốt theo chính sách chung rồi chạy lại. Chuỗi này không xác nhận riêng cách tự kích hoạt từng đường ghi điểm.

## 6. Kiểm chứng còn cần

Kiểm biên/toán tử, chồng lấn và thứ tự; không khớp xóa kết quả cũ; ô trống/0; mục số chỉ dùng 1, 3, 5; mục lựa chọn; lưu/mở lại; nguồn đúng nhóm/bản/mẫu số; quyền ghi và tính lại. Thử bảng/biểu đồ phân bố hiện có trên staging theo Q4. Đây là phạm vi kiểm chứng dự kiến, chưa phải test spec hoặc test đã chạy.

Bản tiếng Nhật: [specification.ja.md](specification.ja.md). Bản dịch cùng nội dung, không bổ sung phê duyệt nghiệp vụ.
