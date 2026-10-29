# Đặc tả dự thảo — Ánh xạ theo khoảng trung bình

Cập nhật: 15/10/2026. Đọc [context](../CONTEXT.md) và [nguồn xác nhận](../sources/confirmed-business-qa.vi.md) trước. Tài liệu này diễn giải context, không phải nguồn yêu cầu độc lập. Mục 1 là nguyên tắc đã xác nhận; mục 2–3 là ví dụ; mục 4 là đề xuất; mục 5 kế thừa nguồn chung và nêu hướng vận hành; mục 6 là kiểm chứng chưa thực hiện.

## 1. Thiết lập và tính

Chọn mục nhận có sẵn, nguồn trung bình (thiết lập tổng hợp, kỳ, tập thể) và mục số của học sinh. Trung bình chọn hàng, điểm học sinh chọn kết quả trong hàng đó. Lưu/mở lại phải giữ điều kiện, toán tử, giá trị và thứ tự. Chạy AutoRating để tính/ghi; cần tính lại khi bảng hoặc trung bình thay đổi.

Xét điều kiện theo thứ tự, khớp đầu tiên được dùng. Không khớp ghi trống, kể cả có kết quả cũ; không tự gán giá trị thấp nhất. Mục nhận có thể là số hoặc lựa chọn. Giá trị ánh xạ gắn với mục nhận đã chọn; cách nhập và kiểm tra hợp lệ chưa được Shite quy định chi tiết trong chuỗi.

## 2. Ví dụ mục số chỉ dùng 1, 3, 5

Mục nhận là điểm xếp loại（評定）, giới hạn có hiệu lực 1–5, không có cấu hình khác thay giới hạn. **Dữ liệu minh họa theo yêu cầu người phụ trách**, không thay ví dụ gốc của khách.

| Trung bình nhóm | Điều kiện điểm cá nhân xét theo thứ tự |
| --- | --- |
| 0 ≤ trung bình <50 | ≥80 → 5; ≥65 → 3; <65 → 1 |
| 50 ≤ trung bình <70 | ≥90 → 5; ≥75 → 3; <75 → 1 |
| 70 ≤ trung bình ≤100 | ≥95 → 5; ≥85 → 3; <85 → 1 |

- Trung bình 49, điểm 85 → 5; trung bình 60, điểm 85 → 3; trung bình 60, điểm 30 → 1.
- Trung bình 70, điểm 70 → 1; bản mục nhận lựa chọn tương ứng trả C.
- Ví dụ LOG: 1812 ÷ 30 = 60,4; trung bình thuộc khoảng thứ hai, điểm cá nhân 85 khớp điều kiện thứ hai → 3.
- Ví dụ không khớp riêng: nếu đổi điều kiện cuối của hàng thứ ba thành <65 → 1, trung bình 70 và điểm cá nhân 70 → trống, kể cả đã có kết quả. Đây là cấu hình khác, không phải bảng mockup ở trên.
- Giá trị 2, 4 vẫn nằm trong giới hạn mục nhận nhưng không được bảng này trả về.
- Thêm/xóa điều kiện không thay giới hạn 1–5. Không yêu cầu số điều kiện bằng 5.

Ví dụ gốc dùng bảng khác: trung bình 60, điểm 85 → **4**. Ví dụ Q2 của khách dùng kết quả **2, 4, 5**. Không trình bày các bảng này như cùng một cấu hình.

## 3. Ví dụ mục lựa chọn

Bảng minh họa được đồng bộ với [mockup Figma](https://www.figma.com/design/ECOs3PWUGyxIS6LS0MnTjm/EM-001%EF%BD%9C%E5%B9%B3%E5%9D%87%E7%82%B9%E3%81%AE%E7%AF%84%E5%9B%B2%E3%81%AB%E5%9F%BA%E3%81%A5%E3%81%8F%E8%A9%95%E4%BE%A1%E8%A8%AD%E5%AE%9A-%E2%80%94-%E7%94%BB%E9%9D%A2%E6%A1%88?node-id=152-8) ngày 15/10/2026 theo yêu cầu người phụ trách; không phải phê duyệt thiết kế của khách.

Bộ A/B/C dùng cùng ngưỡng minh họa ở mục 2, thay kết quả 5 → A, 3 → B, 1 → C. Đây là cách minh họa hai loại mục nhận, không phải quy tắc quy đổi A=5/B=3/C=1 áp dụng trong hệ thống. Mã lưu của lựa chọn không đồng nhất với nhãn hiển thị và không được dùng làm điểm nguồn.

## 4. Chi tiết đề xuất cần review

**Toàn bộ mục này là đề xuất hoặc điểm kỹ thuật cần đối chiếu, không phải xác nhận bổ sung của Shite.** Quy tắc chung lấy lần khớp đầu tiên và ghi trống khi không khớp ở mục 1 vẫn là yêu cầu đã chốt; việc mô tả hai lớp bên dưới không mở lại các nguyên tắc đó.

- Kiểm giá trị đầu ra theo loại và giới hạn của mục nhận. **Hiện trạng code (22/10/2026):** khi lưu, từ chối giá trị đăng ký ngoài min/max của mục nhận, và số lẻ ở mục số (数値入力); mục thập phân (小数入力) chỉ kiểm min/max; mục lựa chọn phải thuộc các lựa chọn của mục (kể cả "(空欄)"). Nếu min/max của mục đổi sau khi lưu thì lúc chạy giá trị vẫn bị giới hạn về min/max. Đây là lựa chọn của nhóm, không phải validation Shite đã phê duyệt (Q3: cấu hình sai là trách nhiệm của trường); cần người phụ trách xác nhận.
- Giới hạn kỹ thuật tối đa 10 khoảng và 20 điều kiện mỗi khoảng, và JSON cấu hình định dạng không quá 60.000 byte (cột `TEXT` chứa tối đa 65.535 byte; quá dài sẽ bị cắt âm thầm nên bị từ chối khi lưu); không phải yêu cầu của khách.
- Ô điều kiện chưa dùng (để trống cả ngưỡng và giá trị đăng ký, hiển thị "選択してください" ở mục dạng chọn) bị bỏ qua; khác với giá trị "(空欄)" là đăng ký trống hợp lệ. Nhập dở một nửa thì báo lỗi.
- Nguồn trung bình gồm cả 授業平均 (trung bình theo tiết học) kế thừa [RA-001 Q5](../../RA-001-ranking-average/CONTEXT.md); kỳ 単元 không có 授業平均 nên kết quả trống. Nguồn còn gồm 科目グループ (nhóm môn học, tên cũ 科目ごとの母集団) theo danh sách tập hợp đã xác nhận; nhóm thực tế được hàm chung xác định theo môn của tiết đang tính (28/10/2026). Nếu nhóm thực tế là 授業 (tiết học) thì dùng dòng tổng hợp của chính tiết đó. Tập hợp được lưu theo khóa có loại (ví dụ `calc_group__<ID>`) chứ không theo tên, và được đổi sang ID mới khi chuyển năm học.

- Phương án biểu diễn khoảng trung bình: hai phép so sánh nối VÀ, cận thứ hai có thể bỏ; danh sách hàng có thứ tự. Đây là phương án UI để review, **không phải giới hạn nghiệp vụ tối đa hai điều kiện đã được khách chốt**.
- Nếu điều kiện xét trung bình của một hàng không lấy được giá trị, coi hàng đó không khớp và xét hàng tiếp theo theo quy tắc chung [RA-001 Q7](../../RA-001-ranking-average/sources/2026-10-09-business-questions.vi.md#q7). Nếu không còn hàng/điều kiện nào khớp thì ghi trống theo nguyên tắc chung. Đây là kế thừa quy tắc, không phải xác nhận riêng trong thread EM-001.
- Đề xuất chọn hàng trung bình khớp đầu tiên rồi chỉ xét điều kiện cá nhân trong hàng đó; nếu điểm cá nhân không khớp thì ghi trống, không quay sang hàng trung bình kế tiếp. Phần không quay lại hàng trung bình là diễn giải thiết kế cần review, không phải chi tiết Shite xác nhận riêng.
- Điểm cá nhân trống → trống là phần nhóm bổ sung theo hiện trạng. Điểm 0 không phải ô trống.
- Dùng mục nhận đang cấu hình, không thêm bộ chọn riêng; thêm phương thức mới cho hai bước. Đây là lựa chọn UI, không phải xác nhận Q2.
- Tóm tắt và log thể hiện thứ tự, nguồn thực dùng, điều kiện khớp và kết quả. Chi tiết dữ liệu/log chưa chốt.
- Quyền ghi/ô sửa tay và giới hạn có hiệu lực trước lưu cần giữ theo hệ thống hiện có, đối chiếu khi triển khai.

## 5. Nguồn trung bình và vận hành

Dùng quy tắc chung [RA-001](../../RA-001-ranking-average/docs/specification.vi.md): trước làm tròn, tổng điểm/số học sinh có điểm của cùng bản nguồn; không dùng `examinees`. Ví dụ **1812 ÷ 30 = 60,4** thì 30 là số học sinh có điểm. Chính sách bản chốt đã được Shite xác nhận ngày 19/10/2026 ([thread RC-001 ④](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1792383099678219), áp dụng cho cả ①②③): **chỉ dùng kết quả tổng hợp thứ hạng đã chốt và còn hiệu lực**, không dùng số mới nhất chưa chốt để thay thế. Thiếu bản chốt hợp lệ cho phạm vi cần đọc (chưa chốt, đã gỡ chốt, thiếu nhóm) thì coi là thiếu trung bình và kết quả **trống**, không giữ giá trị cũ; mẫu số 0 cũng là thiếu trung bình. Chạy tổng hợp lại mà bản chốt còn hiệu lực thì dùng tiếp bản chốt. Gỡ chốt không xóa điểm ngay; ô được ghi trống ở lần **自動算出実行** kế tiếp. Danh sách chọn 順位集計設定 hiển thị mọi thiết lập, bất kể đã chốt hay chưa. Khi điều kiện xét trung bình thiếu giá trị, áp dụng quy tắc RA-001 Q7: coi là không khớp, xét điều kiện tiếp theo; nếu không điều kiện nào khớp thì ghi trống. Xem context mục 4 trước khi dùng nguồn.

Hướng vận hành đề xuất: chỉ sửa bảng thì lưu và chạy AutoRating đủ phạm vi; nguồn điểm đổi thì cập nhật tổng hợp/bản chốt theo chính sách chung rồi chạy lại. Chuỗi này không xác nhận riêng cách tự kích hoạt từng đường ghi điểm.

## 6. Kiểm chứng còn cần

Kiểm biên/toán tử, chồng lấn và thứ tự; không khớp xóa kết quả cũ; ô trống/0; mục số chỉ dùng 1, 3, 5; mục lựa chọn; lưu/mở lại; nguồn đúng nhóm/bản/mẫu số; chỉ dùng bản chốt (có bản chốt khác số mới nhất thì dùng bản chốt; chưa chốt hoặc gỡ chốt rồi chạy lại thì trống và không giữ giá trị cũ; chỉ chạy tổng hợp lại thì kết quả cũ giữ nguyên); danh sách chọn 順位集計設定 không lọc theo trạng thái chốt; quyền ghi và tính lại. Thử bảng/biểu đồ phân bố hiện có trên staging theo Q4. Đây là phạm vi kiểm chứng dự kiến, chưa phải test spec hoặc test đã chạy.

Bản tiếng Nhật: [specification.ja.md](specification.ja.md). Bản dịch cùng nội dung, không bổ sung phê duyệt nghiệp vụ.
