<!-- blend-template: test-cases@1.1.0 -->
# RC-001 — Testcase điểm đỏ（赤点）

## Quy ước và context

| Field | Value |
| --- | --- |
| Revision | RC-001-v2-report-2026-10-04 |
| Feature | RC-001 — Điểm đỏ（赤点） |
| Conventions | Giữ 216 Case IDs và 569 Variant IDs từ bộ đã review. Status CONFIRMED/IMPLEMENTED → Confirmed; PROPOSED → Proposed; TBD/CONFLICT → Awaiting decision. IMPLEMENTED là căn cứ bảo toàn hiện trạng, không phải approval khách hàng. READY → Ready, BLOCKED → Blocked, UNASSESSED → Draft. Cao → High; Priority TBD → Medium tạm để tương thích schema, không đổi thứ tự luồng. Execution bắt đầu NOT RUN; không copy actual/evidence từ lịch sử. |

### Context: CTX-COMMON

| Field | Value |
| --- | --- |
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi quan sát thực tế và ảnh minh chứng của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

## Các testcase

### Flow: Quản lý danh sách quy tắc đỏ của một mục

#### TC-RS-FUNC-001 — Hàng Thiết lập điểm đỏ（赤点設定） xuất hiện trong Thiết lập ô nhập（入力欄設定） cho mục điểm số

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập điểm đỏ（赤点設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”; AC-G02 chỉ xác nhận loại điểm được hỗ trợ; trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Đăng nhập tài khoản giáo viên có quyền sửa mục. Chưa có quy tắc đỏ cho mục số nguyên (M=100); mục số thập phân (M=100) có ít nhất một quy tắc. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: môi trường test (trường A, năm học 2026), tài khoản giáo viên có quyền sửa mục, mục số nguyên (M=100), mục số thập phân (M=100), mục điểm đơn vị (đơn vị U1 có M riêng 40) |
| Thao tác | 1. Mở Thiết lập nhập điểm（成績入力設定）→ Thiết lập ô nhập（入力欄設定） của kỳ 1学期期末 (cuối kỳ học kỳ 1).<br>2. Tìm hàng Thiết lập điểm đỏ（赤点設定） ở bảng mục nhập.<br>3. Bấm link của hàng này ở cột mục số nguyên (M=100), mục số thập phân (M=100), mục điểm đơn vị (đơn vị U1 có M riêng 40). |
| Expected | 1. Theo Figma MW, hàng Thiết lập điểm đỏ（赤点設定） được đặt giữa hàng Tính tự động（自動計算） và hàng Thiết lập ẩn mục nhập（入力項目の非表示設定）. Đây là oracle UI PROPOSED; nếu bố cục khác, ghi Notes để đối chiếu, không mở bug từ riêng vị trí.<br>2. Có thao tác mở thiết lập cho mục số nguyên, số thập phân và điểm đơn vị.<br>3. Bấm link chuyển sang màn danh sách Thiết lập điểm đỏ（赤点設定） của đúng mục. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| integer | Mục số nguyên: M=100; bấm liên kết Thiết lập điểm đỏ（赤点設定） tại cột mục số nguyên. | 1. Theo Figma MW, hàng Thiết lập điểm đỏ（赤点設定） được đặt giữa hàng Tính tự động（自動計算） và hàng Thiết lập ẩn mục nhập（入力項目の非表示設定）. Đây là oracle UI PROPOSED; nếu bố cục khác, ghi Notes để đối chiếu, không mở bug từ riêng vị trí.<br>2. Có thao tác mở thiết lập cho mục số nguyên.<br>3. Bấm link chuyển sang màn danh sách Thiết lập điểm đỏ（赤点設定） của đúng mục. |
| decimal | Mục thập phân: M=100; bấm liên kết Thiết lập điểm đỏ（赤点設定） tại cột mục thập phân có ít nhất một quy tắc. | 1. Theo Figma MW, hàng Thiết lập điểm đỏ（赤点設定） được đặt giữa hàng Tính tự động（自動計算） và hàng Thiết lập ẩn mục nhập（入力項目の非表示設定）. Đây là oracle UI PROPOSED; nếu bố cục khác, ghi Notes để đối chiếu, không mở bug từ riêng vị trí.<br>2. Có thao tác mở thiết lập cho mục số thập phân.<br>3. Bấm link chuyển sang màn danh sách Thiết lập điểm đỏ（赤点設定） của đúng mục. |
| unit | Mục điểm đơn vị: U1 có M riêng 40; bấm liên kết Thiết lập điểm đỏ（赤点設定） tại cột mục điểm đơn vị. | 1. Theo Figma MW, hàng Thiết lập điểm đỏ（赤点設定） được đặt giữa hàng Tính tự động（自動計算） và hàng Thiết lập ẩn mục nhập（入力項目の非表示設定）. Đây là oracle UI PROPOSED; nếu bố cục khác, ghi Notes để đối chiếu, không mở bug từ riêng vị trí.<br>2. Có thao tác mở thiết lập cho mục điểm đơn vị.<br>3. Bấm link chuyển sang màn danh sách Thiết lập điểm đỏ（赤点設定） của đúng mục. |

#### TC-RS-FUNC-002 — Mục kiểu lựa chọn và Đạt/không đạt（合否） không có thao tác tạo quy tắc đỏ có hiệu lực

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập điểm đỏ（赤点設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Kiểu điểm được hỗ trợ” (AC-G02 «Kiểu điểm được hỗ trợ»); tiêu chí nghiệm thu “Phạm vi từng đợt” (AC-G40 «Phạm vi từng đợt»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Blocked |
| Gap | G-PREP-TC-RS-FUNC-002 |
| Cấu hình | Đăng nhập tài khoản giáo viên có quyền sửa mục. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục kiểu lựa chọn A/B/C, mục Đạt/không đạt（合否） |
| Thao tác | 1. Mở Thiết lập ô nhập（入力欄設定）.<br>2. Xem hàng Thiết lập điểm đỏ（赤点設定） ở cột mục kiểu lựa chọn A/B/C, mục Đạt/không đạt（合否）.<br>3. Thử mở URL màn danh sách điểm đỏ của mục kiểu lựa chọn A/B/C bằng ID mục (nếu biết URL). |
| Expected | 1. Không có thao tác tạo quy tắc đỏ có hiệu lực cho hai mục này.<br>2. Nếu có endpoint truy cập trực tiếp, server vẫn từ chối tạo/lưu quy tắc cho mục không thuộc loại số; không dùng việc URL không hiển thị làm bằng chứng duy nhất. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| choice | Mục lựa chọn: Mục A/B/C; Kiểm tra bước 1–2, rồi thử URL trực tiếp bằng ID mục nếu biết URL; không tự dựng route. | Không có thao tác tạo quy tắc đỏ có hiệu lực cho mục A/B/C. Nếu có endpoint truy cập trực tiếp, server từ chối tạo/lưu quy tắc cho mục không thuộc loại số; không dùng việc URL không hiển thị làm bằng chứng duy nhất. |
| passfail | Mục Đạt/không đạt: Mục Đạt/không đạt（合否）; Kiểm tra bước 1–2. Nhánh endpoint chỉ đánh giá nếu có đường truy cập được xác minh; không coi việc thiếu URL là PASS. | Không có thao tác tạo quy tắc đỏ có hiệu lực cho mục Đạt/không đạt（合否）. Nếu có endpoint truy cập trực tiếp, server từ chối tạo/lưu quy tắc cho mục không thuộc loại số; không dùng việc URL không hiển thị làm bằng chứng duy nhất. |

#### TC-RS-FUNC-004 — Thêm quy tắc qua Điều kiện áp dụng（適用条件） rồi Ngưỡng（基準設定）; lưu điều kiện khi chưa có ngưỡng thì sang màn ngưỡng

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập điểm đỏ（赤点設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04 «Lưu và mở lại nhiều thiết lập»); định nghĩa màn hình v2 §03 mục 15（条件保存）đã xác nhận 2026-10-07; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) đã có cặp quy tắc cùng áp dụng (dưới 20 và dưới 30) (2 quy tắc). Đăng nhập tài khoản giáo viên có quyền sửa mục. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100), cặp quy tắc cùng áp dụng (dưới 20 và dưới 30); quy tắc “Cố định 30” (dưới 30) |
| Thao tác | 1. Ở danh sách, bấm Thêm thiết lập chi tiết（詳細設定の追加）.<br>2. Nhập Tên thiết lập（設定名称） "Cố định 30", chọn Toàn bộ đối tượng（全員が対象）, bấm Cập nhật（更新する）; quan sát màn chuyển đến.<br>3. Trên màn Ngưỡng（基準設定） vừa mở, chọn Điểm cố định（固定点数）, nhập 30, chọn Nhỏ hơn（未満）, bấm Cập nhật（更新する）.<br>4. Xem danh sách. |
| Expected | 1. Sau khi lưu điều kiện của quy tắc mới（ngưỡng chưa nhập）: chuyển sang màn Ngưỡng（基準設定） của đúng quy tắc; không quay về danh sách ở bước này.<br>2. Sau khi lưu ngưỡng: quay về danh sách.<br>3. Dòng mới hiện tên, tóm tắt điều kiện "toàn bộ" và ngưỡng "Điểm cố định: 30 điểm, Nhỏ hơn" đúng với dữ liệu đã lưu.<br>4. **PROPOSED (đặc tả v2 mục 4.4 “Lưu, đổi thứ tự và xóa”):** dòng mới nằm sau các quy tắc đã có. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. Sau khi lưu điều kiện của quy tắc mới（ngưỡng chưa nhập）: chuyển sang màn Ngưỡng（基準設定） của đúng quy tắc; không quay về danh sách ở bước này.<br>2. Sau khi lưu ngưỡng: quay về danh sách.<br>3. Dòng mới hiện tên, tóm tắt điều kiện "toàn bộ" và ngưỡng "Điểm cố định: 30 điểm, Nhỏ hơn" đúng với dữ liệu đã lưu.<br>4. **PROPOSED (đặc tả v2 mục 4.4 “Lưu, đổi thứ tự và xóa”):** dòng mới nằm sau các quy tắc đã có. |

#### TC-RS-FUNC-005 — Nhiều quy tắc hiển thị theo ưu tiên; đổi thứ tự bằng ▲▼ được lưu

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập điểm đỏ（赤点設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04 «Lưu và mở lại nhiều thiết lập»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) có 3 quy tắc tên quy tắc 1, quy tắc 2, quy tắc 3 (tên tạm trong case) theo thứ tự. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), cặp quy tắc cùng áp dụng (dưới 20 và dưới 30) |
| Thao tác | 1. Bấm ▼ ở quy tắc 1.<br>2. Tải lại trang.<br>3. Bấm ▲ ở quy tắc 3.<br>4. Đăng xuất, đăng nhập lại, mở danh sách. |
| Expected | 1. Sau bước 1 thứ tự là quy tắc 2, quy tắc 1, quy tắc 3 và giữ nguyên sau khi tải lại.<br>2. Sau bước 3 thứ tự là quy tắc 2, quy tắc 3, quy tắc 1 và giữ nguyên khi mở lại.<br>3. Đổi thứ tự không làm thay kết quả đỏ hiện có (kiểm ở case “Lưu cấu hình không xét; kết quả trước giữ tới lần chạy lại”). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. Sau bước 1 thứ tự là quy tắc 2, quy tắc 1, quy tắc 3 và giữ nguyên sau khi tải lại.<br>2. Sau bước 3 thứ tự là quy tắc 2, quy tắc 3, quy tắc 1 và giữ nguyên khi mở lại.<br>3. Đổi thứ tự không làm thay kết quả đỏ hiện có (kiểm ở case “Lưu cấu hình không xét; kết quả trước giữ tới lần chạy lại”). |

#### TC-RS-FUNC-006 — Xóa một quy tắc có xác nhận; Hủy（キャンセル） giữ nguyên

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập điểm đỏ（赤点設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04 «Lưu và mở lại nhiều thiết lập»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Mục số nguyên (M=100) có 2 quy tắc. Mỗi trường hợp bắt đầu độc lập từ danh sách 2 quy tắc; không dùng kết quả Hủy làm baseline cho Xóa. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); cặp quy tắc cùng áp dụng (dưới 20 và dưới 30) |
| Thao tác | 1. Khôi phục danh sách 2 quy tắc trước mỗi trường hợp.<br>2. Bấm Xóa（削除） ở quy tắc thứ 2 để mở hộp xác nhận.<br>3. Thực hiện lựa chọn riêng trong bảng trường hợp và đọc lại danh sách/kết quả học sinh. |
| Expected | 1. Hộp xác nhận nêu thiết lập sẽ bị xóa và kết quả học sinh chỉ cập nhật ở lần xét tiếp theo.<br>2. Hủy: danh sách giữ 2 quy tắc.<br>3. Xóa: danh sách còn 1 quy tắc; kết quả đỏ hiện có không đổi cho tới lần xét tiếp theo (case “Xóa quy tắc cuối: giữ kết quả tới lần chạy lại; chạy lại → Không áp dụng”). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| cancel | Hủy xóa: Chọn **Hủy（キャンセル）** trong hộp xác nhận. | 1. Hộp xác nhận nêu thiết lập sẽ bị xóa và kết quả học sinh chỉ cập nhật ở lần xét tiếp theo.<br>2. Hủy: danh sách giữ 2 quy tắc. |
| delete | Đồng ý xóa: Chọn **Xóa（削除する）** trong hộp xác nhận. | 1. Hộp xác nhận nêu thiết lập sẽ bị xóa và kết quả học sinh chỉ cập nhật ở lần xét tiếp theo.<br>3. Xóa: danh sách còn 1 quy tắc; kết quả đỏ hiện có không đổi cho tới lần xét tiếp theo (case “Xóa quy tắc cuối: giữ kết quả tới lần chạy lại; chạy lại → Không áp dụng”). |

#### TC-RS-FUNC-007 — Quay lại（戻る）/hủy chỉnh sửa không lưu dữ liệu đang nhập

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập điểm đỏ（赤点設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04 «Lưu và mở lại nhiều thiết lập»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30) |
| Thao tác | 1. Khôi phục quy tắc “Cố định 30” với ngưỡng 30, Nhỏ hơn（未満） và tên đã lưu trước mỗi trường hợp.<br>2. Mở màn và thay giá trị theo trường hợp đang chạy, chưa bấm Cập nhật（更新する）.<br>3. Bấm **Quay lại（戻る）**, rồi mở lại hai màn và đối chiếu danh sách. |
| Expected | Danh sách và hai màn vẫn hiện giá trị đã lưu trước đó (30, Nhỏ hơn, tên cũ). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| back-threshold | Quay lại từ màn ngưỡng: Mở **Ngưỡng（基準設定）**, đổi 30 thành 35 và chọn **Nhỏ hơn hoặc bằng（以下）**; bấm Quay lại, không lưu. | Danh sách và hai màn vẫn hiện giá trị đã lưu trước đó (30, Nhỏ hơn, tên cũ). |
| back-condition | Quay lại từ màn điều kiện: Mở **Điều kiện áp dụng（適用条件）**, đổi tên rồi bấm Quay lại, không lưu. | Danh sách và hai màn vẫn hiện giá trị đã lưu trước đó (30, Nhỏ hơn, tên cũ). |

#### TC-RS-FUNC-014 — Quy tắc mới chỉ có điều kiện, chưa có ngưỡng, không tham gia xét

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập điểm đỏ（赤点設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 4.4 “Lưu, đổi thứ tự và xóa”; tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04 «Lưu và mở lại nhiều thiết lập»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Blocked |
| Gap | G-PREP-TC-RS-FUNC-014 |
| Cấu hình | - Điều kiện chung: trường A/năm 2026, mục số nguyên TD-ITEM-01 (M=100), S01 có điểm 29; giáo viên có quyền sửa rule và chạy xét lại. Hai tab cùng phạm vi mục/kỳ. Mỗi biến thể có bản reset riêng, đúng hai rule Toàn bộ với dấu `&lt;`; ghi identity rule ưu tiên 1 và rule đối chứng ưu tiên 2. Phạm vi trích xuất chỉ gồm ô này để ô đỏ khác không ảnh hưởng bộ lọc.<br>- `incomplete-excluded`: rule ưu tiên 1 chỉ lưu điều kiện, chưa có ngưỡng; rule đối chứng ưu tiên 2 có T=30. Đây là fixture TD-RULE-13/TD-RULE-01.<br>- `complete-deleted-stale`: rule ưu tiên 1 hoàn chỉnh T=30, rule đối chứng ưu tiên 2 T=20; chạy baseline S01=29 → Đỏ theo rule ưu tiên 1.<br>- `incomplete-deleted-stale`: rule ưu tiên 1 chỉ có điều kiện, rule đối chứng ưu tiên 2 T=20; chạy baseline S01=29 → Không đỏ theo rule đối chứng. T=20 là cấu hình riêng của hai biến thể stale-form, không thay TD-RULE-01 dùng chung. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Điều kiện chung: trường A/năm 2026, mục số nguyên TD-ITEM-01 (M=100), S01 có điểm 29; giáo viên có quyền sửa rule và chạy xét lại. Hai tab cùng phạm vi mục/kỳ. Mỗi biến thể có bản reset riêng, đúng hai rule Toàn bộ với dấu `&lt;`; ghi identity rule ưu tiên 1 và rule đối chứng ưu tiên 2. Phạm vi trích xuất chỉ gồm ô này để ô đỏ khác không ảnh hưởng bộ lọc.<br>- `incomplete-excluded`: rule ưu tiên 1 chỉ lưu điều kiện, chưa có ngưỡng; rule đối chứng ưu tiên 2 có T=30. Đây là fixture TD-RULE-13/TD-RULE-01.<br>- `complete-deleted-stale`: rule ưu tiên 1 hoàn chỉnh T=30, rule đối chứng ưu tiên 2 T=20; chạy baseline S01=29 → Đỏ theo rule ưu tiên 1.<br>- `incomplete-deleted-stale`: rule ưu tiên 1 chỉ có điều kiện, rule đối chứng ưu tiên 2 T=20; chạy baseline S01=29 → Không đỏ theo rule đối chứng. T=20 là cấu hình riêng của hai biến thể stale-form, không thay TD-RULE-01 dùng chung. |
| Thao tác | 1. Với `incomplete-excluded`, dựng fixture riêng, xem dòng chưa hoàn chỉnh; đăng ký S01=29 và đọc kết quả, identity rule/ngưỡng đã dùng cùng đầu ra trích xuất.<br>2. Với `complete-deleted-stale`, reset và xác nhận baseline Đỏ/T=30. Mở form ngưỡng của rule ưu tiên 1 ở tab A. Xóa đúng rule đó ở tab B, rồi gửi lưu T=30 từ form cũ ở tab A. Reload danh sách và đọc trạng thái rule; trước khi chạy xét lại, đọc điểm/kết quả đã hoàn tất của S01.<br>3. Chạy xét lại thành công cho đúng ô của `complete-deleted-stale`; đọc identity rule/ngưỡng được chọn. Chạy trích xuất một lượt tắt lọc để thấy điểm và dấu, một lượt bật lọc đỏ để kiểm membership của S01.<br>4. Với `incomplete-deleted-stale`, reset và xác nhận baseline Không đỏ/T=20. Mở form ngưỡng của rule nhập dở ở tab A, nhập T=40 nhưng **chưa lưu**. Xóa đúng rule nhập dở ở tab B, rồi gửi T=40 từ form cũ ở tab A. Reload danh sách và đọc trạng thái rule.<br>5. Chạy xét lại thành công cho đúng ô của `incomplete-deleted-stale`; đọc identity rule/ngưỡng và thực hiện hai lượt trích xuất tắt/bật lọc như bước 3. Lưu bằng chứng riêng cho từng biến thể, không dùng kết quả của biến thể trước. |
| Expected | 1. `incomplete-excluded`: dòng nhập dở hiện chưa thiết lập và cho mở ngưỡng; không tạo ngưỡng 0 ngầm. Bộ xét chọn đúng rule đối chứng T=30, S01=29 Đỏ; rule nhập dở không tham gia xét.<br>2. `complete-deleted-stale`: lưu form cũ không phục hồi rule đã xóa trong danh sách hoặc bộ xét. Trước lần xét lại, S01 vẫn giữ điểm 29 và kết quả Đỏ/T=30 đã hoàn tất. Sau lần xét lại, bộ xét chọn đúng identity rule đối chứng T=20 → **Không đỏ**; lượt tắt lọc hiện 29 không dấu đỏ, lượt bật lọc không có S01.<br>3. `incomplete-deleted-stale`: T=40 gửi từ form cũ không làm rule nhập dở đã xóa sống lại hoặc trở thành rule hoàn chỉnh. Sau lần xét lại, bộ xét vẫn chọn đúng rule đối chứng T=20 → **Không đỏ**, điểm 29 giữ nguyên; lượt tắt lọc không có dấu đỏ, lượt bật lọc không có S01. Nếu rule 40 bị phục hồi thì 29&lt;40 sẽ Đỏ, nên không được PASS trường hợp đó dù danh sách đã ẩn rule.<br>4. Rule đối chứng giữ nguyên cấu hình/identity ở cả hai biến thể stale-form. Nếu từ chối form cũ, thông báo an toàn; không áp đặt mã HTTP hoặc enum/schema chưa được xác nhận. Thiếu seam gửi form, chạy xét hoặc reader đáng tin thì ghi BLOCKED cho biến thể liên quan. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| incomplete-excluded | Quy tắc chưa có ngưỡng: TD-RULE-13 chỉ có điều kiện ở ưu tiên 1; TD-RULE-01/T=30 ở ưu tiên 2. Đăng ký S01=29; đọc dòng nhập dở, identity rule/ngưỡng và đầu ra. | 1. `incomplete-excluded`: dòng nhập dở hiện chưa thiết lập và cho mở ngưỡng; không tạo ngưỡng 0 ngầm. Bộ xét chọn đúng rule đối chứng T=30, S01=29 Đỏ; rule nhập dở không tham gia xét. |
| complete-deleted-stale | Form cũ của quy tắc hoàn chỉnh đã xóa: Reset S01=29/Đỏ theo rule ưu tiên 1/T=30, rule đối chứng ưu tiên 2/T=20. Mở form tab A, xóa rule ở tab B rồi gửi T=30 từ form cũ. Đọc trước/sau lần xét lại; trích xuất tắt/bật lọc riêng. | 2. `complete-deleted-stale`: lưu form cũ không phục hồi rule đã xóa trong danh sách hoặc bộ xét. Trước lần xét lại, S01 vẫn giữ điểm 29 và kết quả Đỏ/T=30 đã hoàn tất. Sau lần xét lại, bộ xét chọn đúng identity rule đối chứng T=20 → **Không đỏ**; lượt tắt lọc hiện 29 không dấu đỏ, lượt bật lọc không có S01.<br>4. Rule đối chứng giữ nguyên cấu hình/identity ở cả hai biến thể stale-form. Nếu từ chối form cũ, thông báo an toàn; không áp đặt mã HTTP hoặc enum/schema chưa được xác nhận. Thiếu seam gửi form, chạy xét hoặc reader đáng tin thì ghi BLOCKED cho biến thể liên quan. |
| incomplete-deleted-stale | Form cũ của quy tắc nhập dở đã xóa: Reset S01=29/Không đỏ theo rule đối chứng ưu tiên 2/T=20. Tab A nhập T=40 cho rule nhập dở nhưng chưa lưu; tab B xóa rule đó, rồi gửi form cũ tab A. Chạy xét lại; đọc identity/ngưỡng và trích xuất tắt/bật lọc riêng. | 3. `incomplete-deleted-stale`: T=40 gửi từ form cũ không làm rule nhập dở đã xóa sống lại hoặc trở thành rule hoàn chỉnh. Sau lần xét lại, bộ xét vẫn chọn đúng rule đối chứng T=20 → **Không đỏ**, điểm 29 giữ nguyên; lượt tắt lọc không có dấu đỏ, lượt bật lọc không có S01. Nếu rule 40 bị phục hồi thì 29&lt;40 sẽ Đỏ, nên không được PASS trường hợp đó dù danh sách đã ẩn rule.<br>4. Rule đối chứng giữ nguyên cấu hình/identity ở cả hai biến thể stale-form. Nếu từ chối form cũ, thông báo an toàn; không áp đặt mã HTTP hoặc enum/schema chưa được xác nhận. Thiếu seam gửi form, chạy xét hoặc reader đáng tin thì ghi BLOCKED cho biến thể liên quan. |

#### TC-RS-FUNC-033 — Đổi tên quy tắc: giữ liên kết, thứ tự và kết quả

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập điểm đỏ（赤点設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04 «Lưu và mở lại nhiều thiết lập»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | quy tắc “Cố định 30” (dưới 30) đã xét: S01 Đỏ. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29) |
| Thao tác | 1. Đổi tên quy tắc “Cố định 30” (dưới 30) từ "Cố định 30" thành "Ngưỡng học kỳ 1", Lưu.<br>2. Xem danh sách và ba đầu ra.<br>3. Chạy lại bằng đăng ký điểm S01=29. |
| Expected | 1–2. Danh sách hiện tên mới ở cùng vị trí ưu tiên, tóm tắt không đổi; S01 vẫn Đỏ ở ba đầu ra.<br><br>3. S01 Đỏ; quy tắc được chọn vẫn là quy tắc đã đổi tên (không tạo quy tắc mới, không mất liên kết). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1–2. Danh sách hiện tên mới ở cùng vị trí ưu tiên, tóm tắt không đổi; S01 vẫn Đỏ ở ba đầu ra.<br><br>3. S01 Đỏ; quy tắc được chọn vẫn là quy tắc đã đổi tên (không tạo quy tắc mới, không mất liên kết). |

#### TC-RS-VAL-014 — Tên thiết lập: bắt buộc, độ dài, trùng tên

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập điểm đỏ（赤点設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 4.2 “Nội dung một dòng”, mục 5.1 “Đối tượng áp dụng”; trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Màn thêm quy tắc. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Tên trống; tên chỉ khoảng trắng; 255 ký tự; 256 ký tự; 255 ký tự có thêm khoảng trắng ở đầu và cuối; hai quy tắc cùng tên |
| Thao tác | 1. Nhập từng giá trị, Lưu, mở lại.<br>2. Tạo quy tắc thứ hai trùng tên quy tắc thứ nhất, Lưu. |
| Expected | 1. Trống/chỉ khoảng trắng: không lưu được. 255 ký tự: lưu được, mở lại đủ. 256 ký tự: bị từ chối, không tự cắt. 255 ký tự kèm khoảng trắng đầu/cuối: lưu được, tên lưu đã bỏ khoảng trắng đầu/cuối (đủ 255 ký tự).<br>2. Lưu được; hai dòng riêng theo ưu tiên. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| empty | Tên trống: Tên=""; bấm Lưu. | Tên trống: không lưu được. |
| space | Chỉ khoảng trắng: Tên chỉ chứa khoảng trắng; bấm Lưu. | Tên chỉ khoảng trắng: không lưu được. |
| len255 | 255 ký tự: Nhập tên đủ 255 ký tự; lưu và mở lại. | Tên **255 ký tự** lưu được, mở lại đủ; không bị cắt. |
| len256 | 256 ký tự: Nhập tên 256 ký tự; bấm Lưu. | Tên **256 ký tự** bị từ chối; không tự cắt. |
| padded255 | 255 ký tự kèm khoảng trắng: Nhập 255 ký tự và thêm khoảng trắng đầu/cuối; lưu, mở lại. | Lưu được; bỏ khoảng trắng đầu/cuối, tên lưu vẫn đủ **255 ký tự**. |
| duplicate | Trùng tên: Tạo quy tắc thứ hai cùng tên quy tắc thứ nhất; bấm Lưu. | Lưu được quy tắc thứ hai trùng tên; hai dòng riêng theo ưu tiên. |

#### TC-RS-VAL-016 — Lỗi khi lưu không làm mất cấu hình/kết quả đã lưu

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập điểm đỏ（赤点設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04 «Lưu và mở lại nhiều thiết lập»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | quy tắc “Cố định 30” (dưới 30) đã lưu; S01 Đỏ. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30); N = 101 |
| Thao tác | 1. Mở quy tắc “Cố định 30” (dưới 30), đổi N=101, Lưu (lỗi).<br>2. Quay lại danh sách, xem ba đầu ra. |
| Expected | Cấu hình vẫn 30; S01 vẫn Đỏ. Giá trị vừa nhập có được giữ trên form hay không: PROPOSED (không must-pass). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Cấu hình vẫn 30; S01 vẫn Đỏ. Giá trị vừa nhập có được giữ trên form hay không: PROPOSED (không must-pass). |

#### TC-RS-DATA-001 — Cấu hình lưu và mở lại đầy đủ, không cắt/làm tròn âm thầm

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập điểm đỏ（赤点設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04 «Lưu và mở lại nhiều thiết lập»); tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11 «Giữ chính xác giá trị»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số thập phân (M=100). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100); quy tắc “Cố định 30” (dưới 30) với N=29.5; quy tắc tỷ lệ 30% làm tròn xuống; quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8); quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao) |
| Thao tác | 1. Lưu từng quy tắc.<br>2. Tải lại trang, mở từng quy tắc.<br>3. SELECT cấu hình (khi có schema). |
| Expected | Mọi trường (tên, phạm vi, bộ lọc, điều kiện, loại, N, p, cách làm tròn, toán hạng, so sánh, thứ tự) trùng giá trị đã nhập. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| fixed | Cố định 29.5: Lưu N=29.5, tải lại/mở cấu hình; SELECT khi có schema. | Mọi trường (tên, phạm vi, bộ lọc, điều kiện, loại, N, p, cách làm tròn, toán hạng, so sánh, thứ tự) trùng giá trị đã nhập. |
| ratio | Tỷ lệ 30 phần trăm cắt xuống: Lưu tỷ lệ30%, làm tròn xuống; tải lại/mở cấu hình; SELECT khi có schema. | Mọi trường (tên, phạm vi, bộ lọc, điều kiện, loại, N, p, cách làm tròn, toán hạng, so sánh, thứ tự) trùng giá trị đã nhập. |
| formula | Công thức hai dòng: Lưu hai dòng trung bình÷2×0.8; tải lại/mở cấu hình; SELECT khi có schema. | Mọi trường (tên, phạm vi, bộ lọc, điều kiện, loại, N, p, cách làm tròn, toán hạng, so sánh, thứ tự) trùng giá trị đã nhập. |
| filter | Bộ lọc kết hợp: Lưu Khối1 hoặc2 và nhóm Nâng cao; tải lại/mở cấu hình; SELECT khi có schema. | Mọi trường (tên, phạm vi, bộ lọc, điều kiện, loại, N, p, cách làm tròn, toán hạng, so sánh, thứ tự) trùng giá trị đã nhập. |

#### TC-RS-DATA-004 — Xóa quy tắc không xóa dây chuyền kết quả hay điểm

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập điểm đỏ（赤点設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”, mục 12.2 “Điểm tích hợp chính”; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | quy tắc “Cố định 30” (dưới 30); S01 Đỏ. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29) |
| Thao tác | 1. Xóa quy tắc “Cố định 30” (dưới 30).<br>2. SELECT kết quả và điểm của S01. |
| Expected | Kết quả S01 vẫn còn; điểm 29 giữ nguyên. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Kết quả S01 vẫn còn; điểm 29 giữ nguyên. |

#### TC-RS-UI-001 — Nhãn trạng thái ở hàng Thiết lập điểm đỏ（赤点設定） trong Thiết lập ô nhập（入力欄設定）

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập điểm đỏ（赤点設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”; trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) chưa có quy tắc; mục số thập phân (M=100) có quy tắc; mục kiểu lựa chọn A/B/C là mục lựa chọn. tài khoản giáo viên có quyền sửa mục. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100), mục số thập phân (M=100), mục kiểu lựa chọn A/B/C |
| Thao tác | 1. Mở Thiết lập ô nhập（入力欄設定）.<br>2. Ghi lại nhãn/ký hiệu ở hàng Thiết lập điểm đỏ（赤点設定） cho từng cột mục. |
| Expected | Mục chưa có quy tắc và mục đã có quy tắc được phân biệt được; mục lựa chọn không có thao tác mở thiết lập (đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”).<br><br>Nhãn cụ thể theo Figma (PROPOSED): [設定する] (thiết lập) / 編集 (sửa) + 設定済み (đã thiết lập) / —. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Mục chưa có quy tắc và mục đã có quy tắc được phân biệt được; mục lựa chọn không có thao tác mở thiết lập (đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”).<br><br>Nhãn cụ thể theo Figma (PROPOSED): [設定する] (thiết lập) / 編集 (sửa) + 設定済み (đã thiết lập) / —. |

#### TC-RS-UI-002 — Cấu trúc màn danh sách Thiết lập điểm đỏ（赤点設定）

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập điểm đỏ（赤点設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”, mục 4.2 “Nội dung một dòng”; trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) có cặp quy tắc phân nhánh theo trung bình 60 (2 quy tắc). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); cặp quy tắc phân nhánh theo trung bình 60 |
| Thao tác | 1. Mở Thiết lập nhập điểm（成績入力設定） (URL ở đường dẫn các màn liên quan) → Thiết lập ô nhập（入力欄設定） của kỳ Cuối kỳ học kỳ 1（1学期期末）.<br>2. Ở hàng Thiết lập điểm đỏ（赤点設定） của cột mục số nguyên (M=100), bấm nút mở thiết lập (Figma: 編集 (sửa)).<br>3. Trên màn danh sách, đối chiếu lần lượt các mục a–g ở Expected Result. |
| Expected | a. Breadcrumb: Thiết lập bảng thành tích（成績帳票設定） - Thiết lập thành tích（成績設定） - Thiết lập nhập điểm（成績入力設定） - Thiết lập điểm đỏ（赤点設定）.<br><br>b. Link Quay lại Thiết lập nhập điểm（[成績入力設定へ戻る]）.<br><br>c. Khối Giải thích bổ sung（※補足説明※） thu gọn/mở được.<br><br>d. Nút Thêm thiết lập chi tiết（詳細設定の追加）.<br><br>e. Bảng có các cột Tên thiết lập（設定名称）; Điều kiện áp dụng（適用条件） kèm Sửa（[編集]）; Ngưỡng đỏ（赤点の基準） kèm Sửa（[編集]）; Xóa（削除）; Ưu tiên（優先順位） ▲▼; có 2 dòng theo cặp quy tắc phân nhánh theo trung bình 60.<br><br>f. Câu 「上から順に適用条件を確認し、最初に一致した設定を使用します。」 (kiểm điều kiện từ trên xuống, dùng thiết lập khớp đầu tiên).<br><br>g. Câu cuối trang 「設定を変更した場合は、成績登録または成績集計の自動算出を再実行してください。」 (đổi thiết lập thì chạy lại đăng ký điểm hoặc tính tự động). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | a. Breadcrumb: Thiết lập bảng thành tích（成績帳票設定） - Thiết lập thành tích（成績設定） - Thiết lập nhập điểm（成績入力設定） - Thiết lập điểm đỏ（赤点設定）.<br><br>b. Link Quay lại Thiết lập nhập điểm（[成績入力設定へ戻る]）.<br><br>c. Khối Giải thích bổ sung（※補足説明※） thu gọn/mở được.<br><br>d. Nút Thêm thiết lập chi tiết（詳細設定の追加）.<br><br>e. Bảng có các cột Tên thiết lập（設定名称）; Điều kiện áp dụng（適用条件） kèm Sửa（[編集]）; Ngưỡng đỏ（赤点の基準） kèm Sửa（[編集]）; Xóa（削除）; Ưu tiên（優先順位） ▲▼; có 2 dòng theo cặp quy tắc phân nhánh theo trung bình 60.<br><br>f. Câu 「上から順に適用条件を確認し、最初に一致した設定を使用します。」 (kiểm điều kiện từ trên xuống, dùng thiết lập khớp đầu tiên).<br><br>g. Câu cuối trang 「設定を変更した場合は、成績登録または成績集計の自動算出を再実行してください。」 (đổi thiết lập thì chạy lại đăng ký điểm hoặc tính tự động). |

#### TC-RS-UI-003 — Định dạng tiêu đề màn danh sách

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập điểm đỏ（赤点設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04 «Lưu và mở lại nhiều thiết lập»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số thập phân (M=100). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100) |
| Thao tác | Mở màn danh sách của mục số thập phân (M=100), đọc tiêu đề. |
| Expected | Theo tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập”: màn danh sách thể hiện kỳ Cuối kỳ học kỳ 1（1学期期末）, tên mục, kiểu nhập Nhập số – thập phân（数値入力・小数） và Thiết lập điểm đỏ（赤点設定）.<br><br>Định dạng tiêu đề theo Figma (PROPOSED): 「1学期期末 ／ 評点（数値入力・小数） の赤点設定」; lệch thì ghi Notes, không FAIL. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Theo tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập”: màn danh sách thể hiện kỳ Cuối kỳ học kỳ 1（1学期期末）, tên mục, kiểu nhập Nhập số – thập phân（数値入力・小数） và Thiết lập điểm đỏ（赤点設定）.<br><br>Định dạng tiêu đề theo Figma (PROPOSED): 「1学期期末 ／ 評点（数値入力・小数） の赤点設定」; lệch thì ghi Notes, không FAIL. |

#### TC-RS-UI-004 — Tóm tắt điều kiện và ngưỡng trên từng dòng danh sách

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập điểm đỏ（赤点設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 4.2 “Nội dung một dòng”; trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) có cặp quy tắc phân nhánh theo trung bình 60 và một quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8), cặp quy tắc phân nhánh theo trung bình 60 |
| Thao tác | Xem cột Điều kiện áp dụng（適用条件） và Ngưỡng đỏ（赤点の基準） của từng dòng. |
| Expected | Mỗi dòng cho biết môn/nguồn/mốc của điều kiện, loại ngưỡng, giá trị, dấu so sánh; dòng công thức cho thấy các dòng tính và xử lý phần lẻ. Định dạng theo Figma (đề xuất). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Mỗi dòng cho biết môn/nguồn/mốc của điều kiện, loại ngưỡng, giá trị, dấu so sánh; dòng công thức cho thấy các dòng tính và xử lý phần lẻ. Định dạng theo Figma (đề xuất). |

#### TC-RS-UI-005 — Trạng thái danh sách trống

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập điểm đỏ（赤点設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”; trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) không có quy tắc. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100) |
| Thao tác | Mở danh sách. |
| Expected | Hiển thị câu báo không có thiết lập và nút thêm; không có dòng mẫu. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Hiển thị câu báo không có thiết lập và nút thêm; không có dòng mẫu. |

#### TC-RS-UI-006 — Hộp xác nhận khi xóa quy tắc cuối

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập điểm đỏ（赤点設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 4.4 “Lưu, đổi thứ tự và xóa”; trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) chỉ có quy tắc “Cố định 30” (dưới 30). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30) |
| Thao tác | Bấm Xóa（削除） ở dòng duy nhất. |
| Expected | Hộp xác nhận nói rõ thiết lập sẽ bị xóa và kết quả trước còn được dùng tới lần chạy lại; điểm được giữ. Có lựa chọn Hủy và xác nhận. Không yêu cầu thông báo riêng đây là thiết lập cuối hoặc nhãn nút xác nhận tùy biến. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Hộp xác nhận nêu thiết lập sẽ bị xóa, kết quả trước được giữ tới lần chạy lại và điểm không bị xóa; có Hủy/xác nhận. Hủy giữ nguyên rule. Không yêu cầu câu riêng cho trường hợp rule cuối hoặc nhãn xác nhận tùy biến. |

#### TC-RS-UI-007 — Dòng quy tắc mới chỉ có điều kiện, chưa có ngưỡng

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập điểm đỏ（赤点設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 4.4 “Lưu, đổi thứ tự và xóa”; AC-G04 «Lưu và mở lại nhiều thiết lập»; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Blocked |
| Gap | G-PREP-TC-RS-UI-007 |
| Cấu hình | trường A/năm 2026, mục số nguyên TD-ITEM-01 (M=100), S01=29; giáo viên có quyền sửa và chạy xét. Rule ưu tiên 1 chỉ lưu điều kiện Toàn bộ, chưa có ngưỡng; rule đối chứng ưu tiên 2 Toàn bộ, T=20, dấu `&lt;`. Ghi identity hai rule và dựng lại fixture trước mỗi biến thể; baseline sau xét là Không đỏ theo rule đối chứng. Cách biểu diễn enum/schema vẫn là PROPOSED. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: form ngưỡng ở tab A sẽ nhập T=40 nhưng chưa lưu; tab B dùng để xóa rule nhập dở. Phạm vi trích xuất chỉ có ô S01=29 này. Đây là fixture của `FUNC-014/incomplete-deleted-stale`, không thay ngưỡng 30 dùng chung. |
| Thao tác | 1. Với `incomplete-row`, quay về danh sách, xem dòng nhập dở và thao tác mở thiết lập ngưỡng; chạy xét và đọc rule đối chứng T=20 đã dùng cho S01.<br>2. Với `incomplete-deleted-stale`, reset fixture và xác nhận baseline Không đỏ/T=20. Mở form ngưỡng của rule nhập dở ở tab A, nhập T=40 nhưng chưa lưu; xóa rule đó ở tab B rồi gửi lưu tab A. Reload danh sách và đọc trạng thái rule.<br>3. Chạy xét lại thành công; đọc identity rule/ngưỡng đã dùng và trích xuất S01 một lượt tắt lọc, một lượt bật lọc đỏ. Ghi kết quả riêng cho hai biến thể. |
| Expected | 1. `incomplete-row`: dòng hiển thị trạng thái chưa có ngưỡng và link mở thiết lập ngưỡng. Bộ xét chọn rule đối chứng T=20, S01=29 Không đỏ; không tạo ngưỡng 0 ngầm. Không yêu cầu câu cảnh báo riêng trên dòng; cần xác minh cả UI và kết quả xét, không suy PASS chỉ từ danh sách.<br>2. `incomplete-deleted-stale`: dòng đã xóa không xuất hiện lại; gửi T=40 từ form cũ không phục hồi rule trong bộ xét. Sau lần xét lại, identity rule đối chứng và T=20 giữ đúng, S01=29 **Không đỏ**. Lượt tắt lọc hiện 29 không dấu đỏ; lượt bật lọc không có S01. Nếu rule 40 bị phục hồi thì 29&lt;40 sẽ Đỏ và biến thể phải FAIL.<br>3. Schema/enum là cách hiện thực đề xuất. Nếu chưa xác minh được form cũ, đường chạy xét hoặc reader rule/ngưỡng thì giữ biến thể BLOCKED, không suy PASS chỉ từ danh sách. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| incomplete-row | Hiển thị quy tắc chưa có ngưỡng: S01=29, rule ưu tiên 1 nhập dở, rule đối chứng ưu tiên 2/T=20. Xem dòng và link ngưỡng; chạy xét và đọc identity rule/ngưỡng đã dùng. | Dòng hiển thị trạng thái chưa có ngưỡng và link mở thiết lập ngưỡng. Bộ xét chọn rule đối chứng T=20, S01=29 Không đỏ; không tạo ngưỡng 0 ngầm. Không yêu cầu câu cảnh báo riêng trên dòng; kết luận dựa trên cả UI và kết quả xét. |
| incomplete-deleted-stale | Form cũ của quy tắc nhập dở đã xóa: Reset S01=29/Không đỏ theo rule đối chứng ưu tiên 2/T=20. Tab A nhập T=40 cho rule nhập dở nhưng chưa lưu; tab B xóa rule đó, rồi gửi form cũ tab A. Chạy xét lại; đọc identity/ngưỡng và trích xuất tắt/bật lọc riêng. | 2. `incomplete-deleted-stale`: dòng đã xóa không xuất hiện lại; gửi T=40 từ form cũ không phục hồi rule trong bộ xét. Sau lần xét lại, identity rule đối chứng và T=20 giữ đúng, S01=29 **Không đỏ**. Lượt tắt lọc hiện 29 không dấu đỏ; lượt bật lọc không có S01. Nếu rule 40 bị phục hồi thì 29&lt;40 sẽ Đỏ và biến thể phải FAIL.<br>3. Schema/enum là cách hiện thực đề xuất. Nếu chưa xác minh được form cũ, đường chạy xét hoặc reader rule/ngưỡng thì giữ biến thể BLOCKED, không suy PASS chỉ từ danh sách. |

#### TC-RS-FUNC-003 — Danh sách trống không tự dựng rule từ cấu hình legacy

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập điểm đỏ（赤点設定） |
| screen_relative_path | unknown |
| Căn cứ | AC-G04 «Lưu và mở lại nhiều thiết lập»; AC-G38 «Bảo toàn điểm đỏ cũ»; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | - Mục chưa có rule mới nhưng có giá trị legacy và kết quả legacy đã lưu. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Mục chưa có rule mới nhưng có giá trị legacy và kết quả legacy đã lưu. |
| Thao tác | 1. Mở danh sách rule đỏ trống.<br>2. Chạy xét hoặc mở đầu ra. |
| Expected | Danh sách không tự tạo rule/default từ ngưỡng legacy. Giá trị và kết quả legacy giữ nguyên; không dùng legacy làm rule fallback. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Danh sách không tự tạo rule/default từ ngưỡng legacy. Giá trị và kết quả legacy giữ nguyên; không dùng legacy làm rule fallback. |

### Flow: Điều kiện áp dụng

#### TC-RS-FUNC-008 — Điều kiện áp dụng: Toàn bộ đối tượng hoặc giới hạn bằng bộ lọc kế thừa từ tính tự động

| Field | Value |
| --- | --- |
| Chức năng | Điều kiện áp dụng（適用条件） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05 «Đối tượng áp dụng và nhu cầu nguồn»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Đăng nhập tài khoản giáo viên có quyền sửa mục. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: các lớp học phần G-A, G-B, G-C, quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao) |
| Thao tác | 1. Mở Điều kiện áp dụng của một quy tắc mới.<br>2. Chọn Toàn bộ đối tượng（全員が対象）, lưu, mở lại.<br>3. Chọn Giới hạn bằng bộ lọc（特定条件で絞り込む）, bấm Thêm điều kiện lọc（絞り込み条件を追加）, liệt kê các loại lọc có trong danh sách.<br>4. Cấu hình như quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao), lưu, mở lại. |
| Expected | 1. Hai lựa chọn đối tượng lưu và mở lại đúng.<br>2. Có các bộ lọc Môn/phân môn（教科・科目）, Khối（学年）, lớp/nhóm và các điều kiện lựa chọn đang được hỗ trợ (đặc tả v2 mục 5.1 “Đối tượng áp dụng”). Danh sách đề xuất (PROPOSED, thiết kế DB v2 mục 3.2 “`apply_condition`”): khối (`hr_grade`), môn (`subject`), phân môn (`sub_subject`), lớp học phần (`group`), lớp chủ nhiệm (`homeroom`), nhóm tổng hợp (`calc_group`), mã lựa chọn của mục (`choice`).<br>3. Không có trình soạn AND/OR lồng nhau. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| all | Toàn bộ đối tượng: Chọn **Toàn bộ đối tượng（全員が対象）**, lưu/mở lại. | 1. Hai lựa chọn đối tượng lưu và mở lại đúng.<br>2. Có các bộ lọc Môn/phân môn（教科・科目）, Khối（学年）, lớp/nhóm và các điều kiện lựa chọn đang được hỗ trợ (đặc tả v2 mục 5.1 “Đối tượng áp dụng”). Danh sách đề xuất (PROPOSED, thiết kế DB v2 mục 3.2 “`apply_condition`”): khối (`hr_grade`), môn (`subject`), phân môn (`sub_subject`), lớp học phần (`group`), lớp chủ nhiệm (`homeroom`), nhóm tổng hợp (`calc_group`), mã lựa chọn của mục (`choice`).<br>3. Không có trình soạn AND/OR lồng nhau. |
| filter | Giới hạn bằng bộ lọc: Chọn **Giới hạn bằng bộ lọc（特定条件で絞り込む）**; thêm/kiểm các loại lọc; lưu Khối1 hoặc2 và nhóm Nâng cao, mở lại. | 1. Hai lựa chọn đối tượng lưu và mở lại đúng.<br>2. Có các bộ lọc Môn/phân môn（教科・科目）, Khối（学年）, lớp/nhóm và các điều kiện lựa chọn đang được hỗ trợ (đặc tả v2 mục 5.1 “Đối tượng áp dụng”). Danh sách đề xuất (PROPOSED, thiết kế DB v2 mục 3.2 “`apply_condition`”): khối (`hr_grade`), môn (`subject`), phân môn (`sub_subject`), lớp học phần (`group`), lớp chủ nhiệm (`homeroom`), nhóm tổng hợp (`calc_group`), mã lựa chọn của mục (`choice`).<br>3. Không có trình soạn AND/OR lồng nhau. |

#### TC-RS-FUNC-009 — Điều kiện phân nhánh theo Trung bình（平均点） được lưu cùng bộ nguồn

| Field | Value |
| --- | --- |
| Chức năng | Điều kiện áp dụng（適用条件） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Đăng nhập tài khoản giáo viên có quyền sửa mục. Có nguồn tổng hợp mặc định. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cặp quy tắc phân nhánh theo trung bình 60, bản tổng hợp mới nhất chưa chốt (trung bình 62) |
| Thao tác | 1. Tạo quy tắc "Trung bình dưới 60": thêm bộ lọc Môn（教科・科目）= Toán（数学） và điều kiện Trung bình（平均点）.<br>2. Chọn Thời kỳ tổng hợp（集計対象時期）= 1学期期末 (cuối kỳ học kỳ 1), Thiết lập tổng hợp thứ hạng（順位集計設定）= 評点集計 (tổng hợp điểm đánh giá), Nhóm học sinh được tổng hợp — 集計対象（母集団）= ホームルーム (lớp chủ nhiệm; file Figma cũ ghi HR毎).<br>3. Nhập mốc 60, dấu Nhỏ hơn（未満）, lưu.<br>4. Tạo quy tắc thứ hai với mốc 60, dấu Từ mức này trở lên（以上）.<br>5. Mở lại cả hai. |
| Expected | 1. Cả hai quy tắc lưu được, là hai dòng riêng trong danh sách (không phải một form hai nhánh).<br>2. Mở lại giữ đủ bộ nguồn, mốc, dấu.<br>3. Không có lựa chọn Kết quả tổng hợp dùng để tham chiếu（参照する集計結果） (đặc tả v2 mục 3 “Bản đồ màn hình và luồng thao tác”, mục 5.5 “Chọn bản nguồn”). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| below60 | Điều kiện dưới 60: Tạo riêng rule Trung bình dưới60; chọn bộ nguồn ở bước2, mốc60/dấu **Nhỏ hơn（未満）**, lưu/mở lại. | 1. Cả hai quy tắc lưu được, là hai dòng riêng trong danh sách (không phải một form hai nhánh).<br>2. Mở lại giữ đủ bộ nguồn, mốc, dấu.<br>3. Không có lựa chọn Kết quả tổng hợp dùng để tham chiếu（参照する集計結果） (đặc tả v2 mục 3 “Bản đồ màn hình và luồng thao tác”, mục 5.5 “Chọn bản nguồn”). |
| from60 | Điều kiện từ 60: Giữ rule dưới60, tạo rule thứ hai cùng bộ nguồn/mốc60, dấu **Từ mức này trở lên（以上）**; lưu/mở lại cả hai. | 1. Cả hai quy tắc lưu được, là hai dòng riêng trong danh sách (không phải một form hai nhánh).<br>2. Mở lại giữ đủ bộ nguồn, mốc, dấu.<br>3. Không có lựa chọn Kết quả tổng hợp dùng để tham chiếu（参照する集計結果） (đặc tả v2 mục 3 “Bản đồ màn hình và luồng thao tác”, mục 5.5 “Chọn bản nguồn”). |

#### TC-RS-FUNC-010 — Điều kiện Tỷ lệ điểm của nhóm（集団の得点率） được lưu cùng bộ nguồn

| Field | Value |
| --- | --- |
| Chức năng | Điều kiện áp dụng（適用条件） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Đăng nhập tài khoản giáo viên có quyền sửa mục. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc theo tỷ lệ điểm của nhóm từ 65% |
| Thao tác | 1. Tạo quy tắc với điều kiện Tỷ lệ điểm của nhóm（集団の得点率）, nguồn mặc định, mốc 65, dấu Từ mức này trở lên（以上）.<br>2. Lưu, mở lại. |
| Expected | Lưu và mở lại đúng loại điều kiện, nguồn, mốc 65 và dấu. Không có tùy chọn chọn cách tính A/B. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Lưu và mở lại đúng loại điều kiện, nguồn, mốc 65 và dấu. Không có tùy chọn chọn cách tính A/B. |

#### TC-RS-BR-004 — Kết hợp bộ lọc: HOẶC trong cùng loại, VÀ giữa các loại

| Field | Value |
| --- | --- |
| Chức năng | Điều kiện áp dụng（適用条件） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05 «Đối tượng áp dụng và nhu cầu nguồn»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) chỉ có quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao). Bốn học sinh: P1 khối 1 + Nâng cao; P2 khối 2 + Nâng cao; P3 khối 3 + Nâng cao; P4 khối 1, không Nâng cao. Mỗi người điểm 20. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao) |
| Thao tác | 1. Đăng ký điểm 20 cho P1–P4.<br>2. Xem kết quả. |
| Expected | P1, P2: Đỏ. P3, P4: Không áp dụng. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | P1, P2: Đỏ. P3, P4: Không áp dụng. |

#### TC-RS-BR-041 — Điều kiện trung bình cùng nguồn kết hợp AND

| Field | Value |
| --- | --- |
| Chức năng | Điều kiện áp dụng（適用条件） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05 «Đối tượng áp dụng và nhu cầu nguồn»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Blocked |
| Gap | G-PREP-TC-RS-BR-041 |
| Cấu hình | mỗi biến thể chỉ thay một nhóm điều kiện, cùng rule và cùng đối tượng áp dụng; ngưỡng cố định `T=70`, dấu `&lt;`, P1 có `S=60` và thuộc phạm vi áp dụng. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: TD-SRC-17…24 cho A; TD-SRC-11…13 cho R; TD-SRC-14…16 cho A+R; TD-GRP-04 cho ba bộ lọc; TD-SRC-26…29 cho trạng thái thiếu/lỗi dữ liệu. Giá trị và thao tác từng lượt ở bảng Variants. Đây là fixture cần provision/quan sát, chưa phải dữ liệu đã có. Mỗi lượt reset và có identity/snapshot/reader riêng; không tái sử dụng kết quả từ lượt trước. |
| Thao tác | 1. Khôi phục baseline riêng của trường hợp đang chạy; xác minh đúng fixture, identity và giá trị qua reader/UI.<br>2. Lưu điều kiện cùng rule, bộ nguồn và bộ lọc theo dữ liệu/thao tác riêng của trường hợp; không thay nguồn từ lượt trước.<br>3. Chạy xét, đọc điểm, trạng thái kết quả và nguồn đã dùng; lưu bằng chứng riêng.<br>4. Mở lại chính rule để đối chiếu nguồn và phép AND. Nhánh reopen-summary kiểm lại các cấu hình đã thực hiện, không tạo fixture mới. |
| Expected | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| A-P9 | Dưới cận dưới: TD-SRC-17, snapshot BR041-A-P9; P9 có **A=40**, **S=60**, **T=70**, dấu **&lt;**. Lưu điều kiện cùng nguồn **A≥50 AND A&lt;70**; reset và xác minh reader trước khi xét. | A≥50 không thỏa → P9 **Không áp dụng**; không có dấu đỏ.<br>Kết quả chỉ hợp lệ khi identity/snapshot và giá trị reader khớp fixture của lượt này.<br>Giữ các điều kiện trong **cùng rule**, đúng nguồn và phép **AND** khi mở lại; không ghép hai rule riêng hoặc đổi thành OR. Nếu không dựng/xác minh được identity và giá trị qua reader/UI, ghi BLOCKED/NEEDS_EVIDENCE cho trường hợp này; không đổi kỳ vọng theo kết quả chạy. |
| A-P10 | Bằng cận dưới: TD-SRC-18, snapshot BR041-A-P10; P10 có **A=50**, **S=60**, **T=70**, dấu **&lt;**. Lưu điều kiện cùng nguồn **A≥50 AND A&lt;70**; reset và xác minh reader trước khi xét. | A≥50 và A&lt;70 đều thỏa → P10 **Đỏ** vì **60&lt;70**.<br>Kết quả chỉ hợp lệ khi identity/snapshot và giá trị reader khớp fixture của lượt này.<br>Giữ các điều kiện trong **cùng rule**, đúng nguồn và phép **AND** khi mở lại; không ghép hai rule riêng hoặc đổi thành OR. Nếu không dựng/xác minh được identity và giá trị qua reader/UI, ghi BLOCKED/NEEDS_EVIDENCE cho trường hợp này; không đổi kỳ vọng theo kết quả chạy. |
| A-P11 | Trong khoảng: TD-SRC-19, snapshot BR041-A-P11; P11 có **A=60**, **S=60**, **T=70**, dấu **&lt;**. Lưu điều kiện cùng nguồn **A≥50 AND A&lt;70**; reset và xác minh reader trước khi xét. | A≥50 và A&lt;70 đều thỏa → P11 **Đỏ** vì **60&lt;70**.<br>Kết quả chỉ hợp lệ khi identity/snapshot và giá trị reader khớp fixture của lượt này.<br>Giữ các điều kiện trong **cùng rule**, đúng nguồn và phép **AND** khi mở lại; không ghép hai rule riêng hoặc đổi thành OR. Nếu không dựng/xác minh được identity và giá trị qua reader/UI, ghi BLOCKED/NEEDS_EVIDENCE cho trường hợp này; không đổi kỳ vọng theo kết quả chạy. |
| A-P12 | Bằng cận trên: TD-SRC-20, snapshot BR041-A-P12; P12 có **A=70**, **S=60**, **T=70**, dấu **&lt;**. Lưu điều kiện cùng nguồn **A≥50 AND A&lt;70**; reset và xác minh reader trước khi xét. | A&lt;70 không thỏa → P12 **Không áp dụng**; không có dấu đỏ.<br>Kết quả chỉ hợp lệ khi identity/snapshot và giá trị reader khớp fixture của lượt này.<br>Giữ các điều kiện trong **cùng rule**, đúng nguồn và phép **AND** khi mở lại; không ghép hai rule riêng hoặc đổi thành OR. Nếu không dựng/xác minh được identity và giá trị qua reader/UI, ghi BLOCKED/NEEDS_EVIDENCE cho trường hợp này; không đổi kỳ vọng theo kết quả chạy. |
| A-P13 | Sát dưới cận dưới: TD-SRC-21, snapshot BR041-A-P13; P13 có **A=49.9**, **S=60**, **T=70**, dấu **&lt;**. Lưu điều kiện cùng nguồn **A≥50 AND A&lt;70**; reset và xác minh reader trước khi xét. | A≥50 không thỏa → P13 **Không áp dụng**; không có dấu đỏ.<br>Kết quả chỉ hợp lệ khi identity/snapshot và giá trị reader khớp fixture của lượt này.<br>Giữ các điều kiện trong **cùng rule**, đúng nguồn và phép **AND** khi mở lại; không ghép hai rule riêng hoặc đổi thành OR. Nếu không dựng/xác minh được identity và giá trị qua reader/UI, ghi BLOCKED/NEEDS_EVIDENCE cho trường hợp này; không đổi kỳ vọng theo kết quả chạy. |
| A-P14 | Cận dưới dạng thập phân: TD-SRC-22, snapshot BR041-A-P14; P14 có **A=50.0**, **S=60**, **T=70**, dấu **&lt;**. Lưu điều kiện cùng nguồn **A≥50 AND A&lt;70**; reset và xác minh reader trước khi xét. | A≥50 và A&lt;70 đều thỏa → P14 **Đỏ** vì **60&lt;70**.<br>Kết quả chỉ hợp lệ khi identity/snapshot và giá trị reader khớp fixture của lượt này.<br>Giữ các điều kiện trong **cùng rule**, đúng nguồn và phép **AND** khi mở lại; không ghép hai rule riêng hoặc đổi thành OR. Nếu không dựng/xác minh được identity và giá trị qua reader/UI, ghi BLOCKED/NEEDS_EVIDENCE cho trường hợp này; không đổi kỳ vọng theo kết quả chạy. |
| A-P15 | Sát dưới cận trên: TD-SRC-23, snapshot BR041-A-P15; P15 có **A=69.9**, **S=60**, **T=70**, dấu **&lt;**. Lưu điều kiện cùng nguồn **A≥50 AND A&lt;70**; reset và xác minh reader trước khi xét. | A≥50 và A&lt;70 đều thỏa → P15 **Đỏ** vì **60&lt;70**.<br>Kết quả chỉ hợp lệ khi identity/snapshot và giá trị reader khớp fixture của lượt này.<br>Giữ các điều kiện trong **cùng rule**, đúng nguồn và phép **AND** khi mở lại; không ghép hai rule riêng hoặc đổi thành OR. Nếu không dựng/xác minh được identity và giá trị qua reader/UI, ghi BLOCKED/NEEDS_EVIDENCE cho trường hợp này; không đổi kỳ vọng theo kết quả chạy. |
| A-P16 | Cận trên dạng thập phân: TD-SRC-24, snapshot BR041-A-P16; P16 có **A=70.0**, **S=60**, **T=70**, dấu **&lt;**. Lưu điều kiện cùng nguồn **A≥50 AND A&lt;70**; reset và xác minh reader trước khi xét. | A&lt;70 không thỏa → P16 **Không áp dụng**; không có dấu đỏ.<br>Kết quả chỉ hợp lệ khi identity/snapshot và giá trị reader khớp fixture của lượt này.<br>Giữ các điều kiện trong **cùng rule**, đúng nguồn và phép **AND** khi mở lại; không ghép hai rule riêng hoặc đổi thành OR. Nếu không dựng/xác minh được identity và giá trị qua reader/UI, ghi BLOCKED/NEEDS_EVIDENCE cho trường hợp này; không đổi kỳ vọng theo kết quả chạy. |
| RR-60 | Tỷ lệ trong khoảng: TD-SRC-11; reader **R=60%**, P1 **S=60**, **T=70**, dấu **&lt;**. Lưu điều kiện cùng nguồn **R≥50% AND R&lt;70%** và xét; dùng snapshot riêng, không dùng lượt trước. | **R=60%** thỏa cả hai điều kiện → P1 **Đỏ** vì **60&lt;70**. Không tự tính lại R khi thiếu source fixture quan sát được.<br>Kết quả chỉ hợp lệ khi identity/snapshot và giá trị reader khớp fixture của lượt này.<br>Giữ các điều kiện trong **cùng rule**, đúng nguồn và phép **AND** khi mở lại; không ghép hai rule riêng hoặc đổi thành OR. Nếu không dựng/xác minh được identity và giá trị qua reader/UI, ghi BLOCKED/NEEDS_EVIDENCE cho trường hợp này; không đổi kỳ vọng theo kết quả chạy. |
| RR-49.9 | Tỷ lệ dưới cận dưới: TD-SRC-12; reader **R=49.9%**, P1 **S=60**, **T=70**, dấu **&lt;**. Lưu điều kiện cùng nguồn **R≥50% AND R&lt;70%** và xét; dùng snapshot riêng, không dùng lượt trước. | **R=49.9%** không thỏa khoảng **50%≤R&lt;70%** → P1 **Không áp dụng**. Không tự tính lại R khi thiếu source fixture quan sát được.<br>Kết quả chỉ hợp lệ khi identity/snapshot và giá trị reader khớp fixture của lượt này.<br>Giữ các điều kiện trong **cùng rule**, đúng nguồn và phép **AND** khi mở lại; không ghép hai rule riêng hoặc đổi thành OR. Nếu không dựng/xác minh được identity và giá trị qua reader/UI, ghi BLOCKED/NEEDS_EVIDENCE cho trường hợp này; không đổi kỳ vọng theo kết quả chạy. |
| RR-70 | Tỷ lệ bằng cận trên: TD-SRC-13; reader **R=70%**, P1 **S=60**, **T=70**, dấu **&lt;**. Lưu điều kiện cùng nguồn **R≥50% AND R&lt;70%** và xét; dùng snapshot riêng, không dùng lượt trước. | **R=70%** không thỏa khoảng **50%≤R&lt;70%** → P1 **Không áp dụng**. Không tự tính lại R khi thiếu source fixture quan sát được.<br>Kết quả chỉ hợp lệ khi identity/snapshot và giá trị reader khớp fixture của lượt này.<br>Giữ các điều kiện trong **cùng rule**, đúng nguồn và phép **AND** khi mở lại; không ghép hai rule riêng hoặc đổi thành OR. Nếu không dựng/xác minh được identity và giá trị qua reader/UI, ghi BLOCKED/NEEDS_EVIDENCE cho trường hợp này; không đổi kỳ vọng theo kết quả chạy. |
| AR-60-60 | Cả A và R thỏa: TD-SRC-14; identity/snapshot riêng, reader **A=60**, **R=60%**, P1 **S=60**, **T=70**, dấu **&lt;**. Lưu **A≥50 AND R≥50%** và xét. | **A=60, R=60%** → P1 **Đỏ** vì cả hai điều kiện thỏa và **60&lt;70**.<br>Kết quả chỉ hợp lệ khi identity/snapshot và giá trị reader khớp fixture của lượt này.<br>Giữ các điều kiện trong **cùng rule**, đúng nguồn và phép **AND** khi mở lại; không ghép hai rule riêng hoặc đổi thành OR. Nếu không dựng/xác minh được identity và giá trị qua reader/UI, ghi BLOCKED/NEEDS_EVIDENCE cho trường hợp này; không đổi kỳ vọng theo kết quả chạy. |
| AR-40-60 | A không thỏa: TD-SRC-15; identity/snapshot riêng, reader **A=40**, **R=60%**, P1 **S=60**, **T=70**, dấu **&lt;**. Lưu **A≥50 AND R≥50%** và xét. | **A=40, R=60%** → P1 **Không áp dụng**; chỉ một điều kiện thỏa không đủ để áp dụng rule.<br>Kết quả chỉ hợp lệ khi identity/snapshot và giá trị reader khớp fixture của lượt này.<br>Giữ các điều kiện trong **cùng rule**, đúng nguồn và phép **AND** khi mở lại; không ghép hai rule riêng hoặc đổi thành OR. Nếu không dựng/xác minh được identity và giá trị qua reader/UI, ghi BLOCKED/NEEDS_EVIDENCE cho trường hợp này; không đổi kỳ vọng theo kết quả chạy. |
| AR-60-40 | R không thỏa: TD-SRC-16; identity/snapshot riêng, reader **A=60**, **R=40%**, P1 **S=60**, **T=70**, dấu **&lt;**. Lưu **A≥50 AND R≥50%** và xét. | **A=60, R=40%** → P1 **Không áp dụng**; chỉ một điều kiện thỏa không đủ để áp dụng rule.<br>Kết quả chỉ hợp lệ khi identity/snapshot và giá trị reader khớp fixture của lượt này.<br>Giữ các điều kiện trong **cùng rule**, đúng nguồn và phép **AND** khi mở lại; không ghép hai rule riêng hoặc đổi thành OR. Nếu không dựng/xác minh được identity và giá trị qua reader/UI, ghi BLOCKED/NEEDS_EVIDENCE cho trường hợp này; không đổi kỳ vọng theo kết quả chạy. |
| FILTER-POS | Khớp cả khối và nhóm: TD-GRP-04, identity/reader/snapshot riêng. Khớp khối 1 và nhóm Nâng cao; giữ **A=60**, **R=60%**, **S=60**, **T=70**, dấu **&lt;**, rule **A≥50 AND R≥50%**. Chạy riêng và ghi reader của lượt này, không thay A/R khi đổi bộ lọc. | Khớp khối 1 và nhóm Nâng cao → **Đỏ** vì **60&lt;70**. **OR** chỉ trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là loại khác nên phải **AND**.<br>Kết quả chỉ hợp lệ khi identity/snapshot và giá trị reader khớp fixture của lượt này.<br>Giữ các điều kiện trong **cùng rule**, đúng nguồn và phép **AND** khi mở lại; không ghép hai rule riêng hoặc đổi thành OR. Nếu không dựng/xác minh được identity và giá trị qua reader/UI, ghi BLOCKED/NEEDS_EVIDENCE cho trường hợp này; không đổi kỳ vọng theo kết quả chạy. |
| FILTER-GRADE-NEG | Sai khối: TD-GRP-04, identity/reader/snapshot riêng. Chỉ sai khối, vẫn thuộc Nâng cao; giữ **A=60**, **R=60%**, **S=60**, **T=70**, dấu **&lt;**, rule **A≥50 AND R≥50%**. Chạy riêng và ghi reader của lượt này, không thay A/R khi đổi bộ lọc. | Chỉ sai khối, vẫn thuộc Nâng cao → **Không áp dụng**, không có dấu đỏ. **OR** chỉ trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là loại khác nên phải **AND**.<br>Kết quả chỉ hợp lệ khi identity/snapshot và giá trị reader khớp fixture của lượt này.<br>Giữ các điều kiện trong **cùng rule**, đúng nguồn và phép **AND** khi mở lại; không ghép hai rule riêng hoặc đổi thành OR. Nếu không dựng/xác minh được identity và giá trị qua reader/UI, ghi BLOCKED/NEEDS_EVIDENCE cho trường hợp này; không đổi kỳ vọng theo kết quả chạy. |
| FILTER-GROUP-NEG | Sai nhóm: TD-GRP-04, identity/reader/snapshot riêng. Chỉ sai nhóm, vẫn thuộc khối 1; giữ **A=60**, **R=60%**, **S=60**, **T=70**, dấu **&lt;**, rule **A≥50 AND R≥50%**. Chạy riêng và ghi reader của lượt này, không thay A/R khi đổi bộ lọc. | Chỉ sai nhóm, vẫn thuộc khối 1 → **Không áp dụng**, không có dấu đỏ. **OR** chỉ trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là loại khác nên phải **AND**.<br>Kết quả chỉ hợp lệ khi identity/snapshot và giá trị reader khớp fixture của lượt này.<br>Giữ các điều kiện trong **cùng rule**, đúng nguồn và phép **AND** khi mở lại; không ghép hai rule riêng hoặc đổi thành OR. Nếu không dựng/xác minh được identity và giá trị qua reader/UI, ghi BLOCKED/NEEDS_EVIDENCE cho trường hợp này; không đổi kỳ vọng theo kết quả chạy. |
| P17-A-NAN | Nguồn A không phải số: TD-SRC-26; reader **A=NaN**, **S=25**. Reset riêng, giữ rule ưu tiên thấp hơn **T=30** làm đối chứng fallback; ghi identity/source và trạng thái trước khi xét. | **Chưa xét được**, không xuống rule thấp hơn dù **25&lt;30**, không giữ kết quả đỏ cũ. Bằng chứng thể hiện riêng A, S và trạng thái kết quả; không thay Chưa xét được bằng Không áp dụng.<br>Giữ các điều kiện trong **cùng rule**, đúng nguồn và phép **AND** khi mở lại; không ghép hai rule riêng hoặc đổi thành OR. Nếu không dựng/xác minh được identity và giá trị qua reader/UI, ghi BLOCKED/NEEDS_EVIDENCE cho trường hợp này; không đổi kỳ vọng theo kết quả chạy. |
| P19-A-INFINITY | Nguồn A vô hạn: TD-SRC-28; reader **A=Infinity**, **S=25**. Reset riêng, giữ rule ưu tiên thấp hơn **T=30** làm đối chứng fallback; ghi identity/source và trạng thái trước khi xét. | **Chưa xét được**, không xuống rule thấp hơn dù **25&lt;30**, không giữ kết quả đỏ cũ. Bằng chứng thể hiện riêng A, S và trạng thái kết quả; không thay Chưa xét được bằng Không áp dụng.<br>Giữ các điều kiện trong **cùng rule**, đúng nguồn và phép **AND** khi mở lại; không ghép hai rule riêng hoặc đổi thành OR. Nếu không dựng/xác minh được identity và giá trị qua reader/UI, ghi BLOCKED/NEEDS_EVIDENCE cho trường hợp này; không đổi kỳ vọng theo kết quả chạy. |
| P18-A-EMPTY | Thiếu nguồn A: TD-SRC-27; reader **A=thiếu/null**, **S=25**. Reset riêng, giữ rule ưu tiên thấp hơn **T=30** làm đối chứng fallback; ghi identity/source và trạng thái trước khi xét. | **Chưa xét được**, không xuống rule thấp hơn dù **25&lt;30**, không giữ kết quả đỏ cũ. Bằng chứng thể hiện riêng A, S và trạng thái kết quả; không thay Chưa xét được bằng Không áp dụng.<br>Giữ các điều kiện trong **cùng rule**, đúng nguồn và phép **AND** khi mở lại; không ghép hai rule riêng hoặc đổi thành OR. Nếu không dựng/xác minh được identity và giá trị qua reader/UI, ghi BLOCKED/NEEDS_EVIDENCE cho trường hợp này; không đổi kỳ vọng theo kết quả chạy. |
| P18-S-EMPTY | Thiếu điểm học sinh: TD-SRC-29; reader **A=60** hợp lệ nhưng **S không có điểm**. Reset và xác minh source/identity riêng trước khi xét. | **Không có điểm**, phân biệt với lỗi/thiếu nguồn A và trạng thái Chưa xét được. Bằng chứng thể hiện A hợp lệ, S trống và trạng thái kết quả riêng; không thay trống bằng 0.<br>Giữ các điều kiện trong **cùng rule**, đúng nguồn và phép **AND** khi mở lại; không ghép hai rule riêng hoặc đổi thành OR. Nếu không dựng/xác minh được identity và giá trị qua reader/UI, ghi BLOCKED/NEEDS_EVIDENCE cho trường hợp này; không đổi kỳ vọng theo kết quả chạy. |
| reopen-summary | Giữ nguồn và AND khi mở lại: Sau mỗi cấu hình A+A, R+R, A+R và bộ lọc đã chạy, mở lại chính rule đó và đối chiếu source/điều kiện; không tạo thêm lượt AA-POS không có fixture. | Mỗi rule giữ đúng identity nguồn/snapshot và các điều kiện đã lưu, kết hợp bằng **AND**, không chuyển thành OR hoặc tách thành hai rule. Đối chiếu kết quả đã ghi cho từng fixture; positive A+A là A-P10/P11/P14/P15, không tạo lượt không có fixture.<br>Kết quả chỉ hợp lệ khi identity/snapshot và giá trị reader khớp fixture của lượt này.<br>Giữ các điều kiện trong **cùng rule**, đúng nguồn và phép **AND** khi mở lại; không ghép hai rule riêng hoặc đổi thành OR. Nếu không dựng/xác minh được identity và giá trị qua reader/UI, ghi BLOCKED/NEEDS_EVIDENCE cho trường hợp này; không đổi kỳ vọng theo kết quả chạy. |

#### TC-RS-BR-005 — Toàn bộ đối tượng（全員が対象） không vượt phạm vi mục, trường, năm

| Field | Value |
| --- | --- |
| Chức năng | Điều kiện áp dụng（適用条件） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05 «Đối tượng áp dụng và nhu cầu nguồn»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30) (Toàn bộ). Trường B (trường B (trường khác)) có học sinh điểm 10 ở mục tương tự. Mục mục số thập phân (M=100) (không có quy tắc) có S09=29.5. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100), mục số thập phân (M=100); quy tắc “Cố định 30” (dưới 30), trường B (trường khác), học sinh S09 (mục số thập phân 29.5) |
| Thao tác | 1. Chạy xét hàng loạt cho trường A.<br>2. Xem kết quả S09 ở mục số thập phân (M=100) và dữ liệu trường B. |
| Expected | Chỉ ô của mục số nguyên (M=100) trong trường A năm 2026 được xét. S09 ở mục số thập phân (M=100) và học sinh trường B không bị ảnh hưởng. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Chỉ ô của mục số nguyên (M=100) trong trường A năm 2026 được xét. S09 ở mục số thập phân (M=100) và học sinh trường B không bị ảnh hưởng. |

#### TC-RS-BR-029 — Mục lựa chọn không được xét, nhưng bộ lọc theo lựa chọn vẫn dùng để chọn đối tượng

| Field | Value |
| --- | --- |
| Chức năng | Điều kiện áp dụng（適用条件） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Kiểu điểm được hỗ trợ” (AC-G02 «Kiểu điểm được hỗ trợ»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục kiểu lựa chọn A/B/C (A/B/C) có giá trị cho S01 = B, S02 = A. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); mục kiểu lựa chọn A/B/C, quy tắc “Cố định 30” (dưới 30) |
| Thao tác | 1. Tạo quy tắc cho mục số nguyên (M=100) với bộ lọc theo lựa chọn（選択肢型） mục kiểu lựa chọn A/B/C = B, cố định 30 `&lt;`.<br>2. Đăng ký S01=29, S02=29. |
| Expected | S01 Đỏ (thuộc đối tượng); S02 Không áp dụng. Không có ô nào của mục kiểu lựa chọn A/B/C được xét đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | S01 Đỏ (thuộc đối tượng); S02 Không áp dụng. Không có ô nào của mục kiểu lựa chọn A/B/C được xét đỏ. |

#### TC-RS-BR-035 — Bộ lọc nhóm tổng hợp khác loại phải kết hợp VÀ

| Field | Value |
| --- | --- |
| Chức năng | Điều kiện áp dụng（適用条件） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05 «Đối tượng áp dụng và nhu cầu nguồn»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Hai loại nhóm tổng hợp: K1 = Nhóm thành tích（成績グループ） có mục Nâng cao; K2 = một loại nhóm tổng hợp khác có mục X. P5 chỉ thuộc Nâng cao; P6 chỉ thuộc X; P7 thuộc cả Nâng cao và X; P8 không thuộc cả hai. Cả bốn học khối 1. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc lọc theo nhóm tổng hợp thuộc hai loại nhóm; S = 20 cho P5–P8 |
| Thao tác | 1. Đăng ký điểm 20 cho P5–P8.<br>2. Xem kết quả.<br>3. Mở lại quy tắc. |
| Expected | 1–2. Chỉ P7 thỏa cả hai loại nhóm và được xét → Đỏ. P5, P6, P8: Không áp dụng.<br><br>3. Mỗi giá trị vẫn gắn đúng loại nhóm của nó. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1–2. Chỉ P7 thỏa cả hai loại nhóm và được xét → Đỏ. P5, P6, P8: Không áp dụng.<br><br>3. Mỗi giá trị vẫn gắn đúng loại nhóm của nó. |

#### TC-RS-VAL-015 — Chọn giới hạn bằng bộ lọc nhưng không có bộ lọc nào

| Field | Value |
| --- | --- |
| Chức năng | Điều kiện áp dụng（適用条件） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05 «Đối tượng áp dụng và nhu cầu nguồn»); trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Màn thêm quy tắc. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Giới hạn bằng bộ lọc（特定条件で絞り込む）, không chọn giá trị |
| Thao tác | Chọn giới hạn bằng bộ lọc, không chọn điều kiện, Lưu. |
| Expected | Không lưu được; có thông báo lỗi. Câu chữ thông báo không phải must-pass (Figma chưa có). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Không lưu được; có thông báo lỗi. Câu chữ thông báo không phải must-pass (Figma chưa có). |

#### TC-RS-VAL-022 — Giá trị điều kiện phân nhánh (trung bình/tỷ lệ nhóm)

| Field | Value |
| --- | --- |
| Chức năng | Điều kiện áp dụng（適用条件） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 5.2 “Điều kiện dựa trên trung bình”; xác nhận miền Trung bình 0–100 (2026-10-07); trạng thái nguồn CONFIRMED (miền Trung bình 0–100) / PROPOSED (độ dài chữ số lẻ); ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Màn thêm quy tắc có điều kiện. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Trung bình: trống, −1, 0, 100, 101, 60.5, 60.123456789; tỷ lệ nhóm: −1, 0, 100, 101 |
| Thao tác | Nhập từng giá trị, Lưu. |
| Expected | 1. **CONFIRMED (2026-10-07):** điều kiện Trung bình（平均点） chỉ nhận **0–100**. `−1` và `101` bị từ chối, không lưu; `0` và `100` lưu được.<br>2. Trống → không lưu được (điều kiện chưa đủ). `60.5` lưu được; `60.123456789` (9 chữ số lẻ) bị từ chối (**PROPOSED**, thiết kế DB v2).<br>3. Tỷ lệ nhóm（集団の得点率）: `0` và `100` lưu được; `−1` và `101` bị từ chối. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| avg-empty | Trung bình để trống: Nhập điều kiện Trung bình với giá trị trống; bấm Lưu. | Trung bình trống không lưu được vì điều kiện chưa đủ. |
| avg-negative | Trung bình âm: Nhập Trung bình=−1; bấm Lưu. | **CONFIRMED:** Trung bình **−1** bị từ chối, không lưu. |
| avg0 | Trung bình bằng 0: Nhập Trung bình=0; bấm Lưu. | **CONFIRMED:** Trung bình **0** lưu được. |
| avg100 | Trung bình bằng 100: Nhập Trung bình=100; bấm Lưu. | **CONFIRMED:** Trung bình **100** lưu được. |
| avg101 | Trung bình vượt 100: Nhập Trung bình=101; bấm Lưu. | **CONFIRMED:** Trung bình **101** bị từ chối, không lưu. |
| avg605 | Trung bình có một chữ số lẻ: Nhập Trung bình=60.5; bấm Lưu. | **PROPOSED** (thiết kế DB v2): Trung bình **60.5** lưu được. |
| avg-long | Trung bình có chín chữ số lẻ: Nhập Trung bình=60.123456789; bấm Lưu. | **PROPOSED** (thiết kế DB v2): Trung bình **60.123456789** có 9 chữ số lẻ, bị từ chối. |
| ratio-negative | Tỷ lệ nhóm âm: Nhập tỷ lệ nhóm=−1; bấm Lưu. | Tỷ lệ nhóm **−1** bị từ chối. |
| ratio0 | Tỷ lệ nhóm bằng 0: Nhập tỷ lệ nhóm=0; bấm Lưu. | Tỷ lệ nhóm **0** lưu được. |
| ratio100 | Tỷ lệ nhóm bằng 100: Nhập tỷ lệ nhóm=100; bấm Lưu. | Tỷ lệ nhóm **100** lưu được. |
| ratio101 | Tỷ lệ nhóm vượt 100: Nhập tỷ lệ nhóm=101; bấm Lưu. | Tỷ lệ nhóm **101** bị từ chối. |

#### TC-RS-UI-008 — Màn Điều kiện áp dụng（適用条件設定）: bố cục và chuyển Toàn bộ/Bộ lọc

| Field | Value |
| --- | --- |
| Chức năng | Điều kiện áp dụng（適用条件） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 5.1 “Đối tượng áp dụng”; trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Mở thêm quy tắc cho mục số thập phân (M=100). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100) |
| Thao tác | 1. Đối chiếu bố cục và đọc nguyên văn hướng dẫn điều kiện.<br>2. Chọn Toàn bộ đối tượng（全員が対象）.<br>3. Chọn Giới hạn bằng bộ lọc（特定条件で絞り込む）, thêm hai điều kiện cùng loại và hai điều kiện khác loại. |
| Expected | 1. Có các phần tử như Source.<br>2. Không hiện vùng Điều kiện lọc（絞り込み条件）.<br>3. Hiện vùng lọc, thêm được điều kiện và câu 「※同じ種類の条件はいずれか1つ、種類が違う条件はすべて満たす生徒が対象となります。」 (cùng loại chỉ cần thỏa một điều kiện, khác loại phải thỏa tất cả). Hướng dẫn phải phân biệt OR trong cùng loại bộ lọc với AND giữa các loại điều kiện; không dùng câu này để thay thế phép AND giữa các điều kiện nguồn A/R trong cùng rule. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. Có các phần tử như Source.<br>2. Không hiện vùng Điều kiện lọc（絞り込み条件）.<br>3. Hiện vùng lọc, thêm được điều kiện và câu 「※同じ種類の条件はいずれか1つ、種類が違う条件はすべて満たす生徒が対象となります。」 (cùng loại chỉ cần thỏa một điều kiện, khác loại phải thỏa tất cả). Hướng dẫn phải phân biệt OR trong cùng loại bộ lọc với AND giữa các loại điều kiện; không dùng câu này để thay thế phép AND giữa các điều kiện nguồn A/R trong cùng rule. |

#### TC-RS-UI-009 — Khối điều kiện Trung bình（平均点） và nguồn tham chiếu, không có ô chọn "kết quả tổng hợp dùng để tham chiếu"

| Field | Value |
| --- | --- |
| Chức năng | Điều kiện áp dụng（適用条件） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 3 “Bản đồ màn hình và luồng thao tác”, mục 5.4 “Bộ thông tin nguồn”, mục 5.5 “Chọn bản nguồn”; trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Màn Điều kiện áp dụng, Giới hạn bằng bộ lọc. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | Thêm điều kiện Trung bình（平均点）, xem các ô. |
| Expected | CONFIRMED: có ba ô nguồn (thời kỳ, thiết lập tổng hợp thứ hạng, nhóm tham chiếu); **không** có ô chọn kết quả tổng hợp cụ thể/bản chốt.<br><br>PROPOSED: câu mục tham chiếu, bố cục ô mốc + đơn vị 点 (điểm) + dấu. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | CONFIRMED: có ba ô nguồn (thời kỳ, thiết lập tổng hợp thứ hạng, nhóm tham chiếu); **không** có ô chọn kết quả tổng hợp cụ thể/bản chốt.<br><br>PROPOSED: câu mục tham chiếu, bố cục ô mốc + đơn vị 点 (điểm) + dấu. |

#### TC-RS-UI-010 — Khối điều kiện Tỷ lệ điểm của nhóm（集団の得点率）

| Field | Value |
| --- | --- |
| Chức năng | Điều kiện áp dụng（適用条件） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 5.3 “Tỷ lệ nhóm — kế thừa kết quả tổng hợp thứ hạng hiện có”; trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Màn Điều kiện áp dụng. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | Thêm điều kiện Tỷ lệ điểm của nhóm（集団の得点率）. |
| Expected | Có ba ô nguồn như UI-009, ô mốc với đơn vị %, dấu so sánh. Không có tùy chọn cách tính A/B (Q&amp;A nghiệp vụ đã xác nhận câu “Tỷ lệ nhóm có cần xử lý riêng khi các lớp khác điểm tối đa không?” — CONFIRMED). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Có ba ô nguồn như UI-009, ô mốc với đơn vị %, dấu so sánh. Không có tùy chọn cách tính A/B (Q&amp;A nghiệp vụ đã xác nhận câu “Tỷ lệ nhóm có cần xử lý riêng khi các lớp khác điểm tối đa không?” — CONFIRMED). |

### Flow: Ngưỡng điểm cố định

#### TC-RS-FUNC-011 — Chọn loại ngưỡng làm thay đổi vùng nhập

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”, mục 6.1 “Thành phần chung của màn ngưỡng”; trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Mở Ngưỡng của một quy tắc. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | 1. Mở màn Ngưỡng（基準設定） của rule.<br>2. Chọn đúng loại ngưỡng trong trường hợp; quan sát vùng nhập thay đổi và các trường liên quan. |
| Expected | 1. Cố định: có ô ngưỡng và dấu so sánh; không có vùng nguồn trung bình, không có xử lý phần lẻ.<br>2. Tỷ lệ: có ô %, xử lý phần lẻ, dấu so sánh; không có vùng nguồn trung bình.<br>3. Công thức: có vùng nguồn trung bình, bảng dòng công thức, dấu so sánh. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| fixed | Chọn cố định: Chọn **Điểm cố định（固定点数）** và quan sát vùng nhập. | 1. Cố định: có ô ngưỡng và dấu so sánh; không có vùng nguồn trung bình, không có xử lý phần lẻ. |
| ratio | Chọn tỷ lệ: Chọn **Tỷ lệ điểm tối đa（得点率）** và quan sát vùng nhập. | 2. Tỷ lệ: có ô %, xử lý phần lẻ, dấu so sánh; không có vùng nguồn trung bình. |
| formula | Chọn công thức: Chọn **Công thức（計算式）** và quan sát vùng nhập. | 3. Công thức: có vùng nguồn trung bình, bảng dòng công thức, dấu so sánh. |

#### TC-RS-FUNC-013 — Dấu so sánh Nhỏ hơn（未満）/Nhỏ hơn hoặc bằng（以下） được lưu và hiển thị

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 6.1 “Thành phần chung của màn ngưỡng”; trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Có quy tắc “Cố định 30” (dưới 30). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30), quy tắc cố định 30 với Nhỏ hơn hoặc bằng（以下） |
| Thao tác | 1. Đổi dấu của quy tắc “Cố định 30” (dưới 30) sang Nhỏ hơn hoặc bằng（以下）, lưu, mở lại.<br>2. Đổi lại Nhỏ hơn（未満）, lưu, mở lại. |
| Expected | Dấu đã chọn được lưu, hiển thị đúng ở form và tóm tắt danh sách. Tác động lên kết quả: case “Ngưỡng cố định 30: S = 29 / 30 / 31 với `&lt;` và `≤`”. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| lt | Nhỏ hơn: Dấu nhỏ hơn | Dấu đã chọn được lưu, hiển thị đúng ở form và tóm tắt danh sách. Tác động lên kết quả: case “Ngưỡng cố định 30: S = 29 / 30 / 31 với `&lt;` và `≤`”. |
| le | Nhỏ hơn hoặc bằng: Dấu nhỏ hơn hoặc bằng | Dấu đã chọn được lưu, hiển thị đúng ở form và tóm tắt danh sách. Tác động lên kết quả: case “Ngưỡng cố định 30: S = 29 / 30 / 31 với `&lt;` và `≤`”. |

#### TC-RS-VAL-001 — Điểm cố định: biên −1 / 0 / 100 / 101 với M=100

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Điểm cố định” (AC-G08 «Điểm cố định»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) (M=100 cho mọi đối tượng), Toàn bộ đối tượng. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); N = −1, 0, 100, 101 |
| Thao tác | Lần lượt nhập Điểm cố định（固定点数）= −1, 0, 100, 101 và bấm Cập nhật（更新する）. |
| Expected | −1: không lưu được, có lỗi. 0: lưu được. 100: lưu được. 101: không lưu được, có lỗi vượt M. Khi lỗi, cấu hình đã lưu trước đó không đổi. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| negative | N=-1: Nhập N=−1; lưu. | **N=−1**: không lưu được, có lỗi; cấu hình đã lưu trước đó không đổi. |
| zero | N=0: Nhập N=0; lưu. | **N=0**: lưu được. |
| maximum | N=100: Nhập N=100, M=100; lưu. | **N=100=M**: lưu được. |
| above | N=101: Nhập N=101, M=100; lưu. | **N=101>M=100**: không lưu được, có lỗi vượt M; cấu hình đã lưu trước đó không đổi. |

#### TC-RS-VAL-002 — Điểm cố định phải ≤ M của mọi đối tượng (M=20 và M=100)

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Điểm cố định” (AC-G08 «Điểm cố định»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục có M khác nhau theo lớp (G-A M=20, G-B M=100) (G-A M=20, G-B M=100). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục có M khác nhau theo lớp (G-A M=20, G-B M=100); N = 30, 20 |
| Thao tác | 1. Toàn bộ đối tượng, N=30, Lưu.<br>2. Toàn bộ đối tượng, N=20, Lưu.<br>3. Lọc chỉ lớp G-B, N=30, Lưu. |
| Expected | 1. Không lưu được (G-A M=20).<br>2. Lưu được.<br>3. Lưu được. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| all30 | Toàn bộ N=30: M=20 và100 trong phạm vi Toàn bộ; nhập N=30 và lưu. | 1. Không lưu được (G-A M=20). |
| all20 | Toàn bộ N=20: M=20 và100 trong phạm vi Toàn bộ; nhập N=20 và lưu. | 2. Lưu được. |
| gb30 | Chỉ G-B N=30: Giới hạn chỉ G-B; nhập N=30 và lưu. | 3. Lưu được. |

#### TC-RS-VAL-003 — Mở rộng phạm vi sau khi lưu: kiểm lại ngưỡng cố định với M của đối tượng mới

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Điểm cố định” (AC-G08 «Điểm cố định»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục có M khác nhau theo lớp (G-A M=20, G-B M=100); quy tắc lọc chỉ G-B, cố định 30 đã lưu. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục có M khác nhau theo lớp (G-A M=20, G-B M=100) |
| Thao tác | Sửa bộ lọc thành G-A hoặc G-B (giữ N=30), bấm Lưu. |
| Expected | Không lưu được vì G-A có M=20; cấu hình cũ (chỉ G-B) giữ nguyên. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Không lưu được vì G-A có M=20; cấu hình cũ (chỉ G-B) giữ nguyên. |

#### TC-RS-VAL-004 — Ngưỡng cố định/tỷ lệ trống hoặc không phải số

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11 «Giữ chính xác giá trị»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Màn cấu hình mục số nguyên (M=100). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); Giá trị: trống, `abc`, `3O` (chữ O), `３０` (số toàn khổ / full-width) |
| Thao tác | Với loại Điểm cố định（固定点数） rồi Tỷ lệ điểm tối đa（得点率）: nhập từng giá trị, bấm Lưu. |
| Expected | Trống, `abc`, `3O`: không lưu được, có lỗi. **CONFIRMED (2026-10-07):** hệ thống không chuẩn hóa số full-width; `３０` bị từ chối (không lưu thành 30) với cả Điểm cố định（固定点数） và Tỷ lệ điểm tối đa（得点率）. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| fixed-empty | Điểm cố định với trống: Nhập **trống** vào Điểm cố định, rồi lưu. | Giá trị **trống** không lưu được, có lỗi. |
| fixed-abc | Điểm cố định với abc: Nhập **abc** vào Điểm cố định, rồi lưu. | Giá trị **abc** không lưu được, có lỗi. |
| fixed-3O | Điểm cố định với 3O: Nhập **3O** vào Điểm cố định, rồi lưu. | Giá trị **3O** không lưu được, có lỗi. |
| fixed-fullwidth | Điểm cố định với ３０: Nhập **３０** (full-width) vào Điểm cố định, rồi lưu. | **CONFIRMED:** `３０` bị từ chối, không chuẩn hóa thành 30, không lưu. |
| ratio-empty | Tỷ lệ với trống: Nhập **trống** vào Tỷ lệ, rồi lưu. | Giá trị **trống** không lưu được, có lỗi. |
| ratio-abc | Tỷ lệ với abc: Nhập **abc** vào Tỷ lệ, rồi lưu. | Giá trị **abc** không lưu được, có lỗi. |
| ratio-3O | Tỷ lệ với 3O: Nhập **3O** vào Tỷ lệ, rồi lưu. | Giá trị **3O** không lưu được, có lỗi. |
| ratio-fullwidth | Tỷ lệ với ３０: Nhập **３０** (full-width) vào Tỷ lệ, rồi lưu. | **CONFIRMED:** `３０` bị từ chối, không chuẩn hóa thành 30, không lưu. |

#### TC-RS-VAL-005 — Điểm cố định thập phân

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11 «Giữ chính xác giá trị»); trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số thập phân (M=100) (thập phân). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100); N = 29.5, 29.55, 29.555, 29.5555 |
| Thao tác | Nhập từng giá trị, Lưu, mở lại. |
| Expected | Đề xuất (thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ”): 29.5, 29.55, 29.555 lưu và mở lại đúng; 29.5555 bị từ chối, không tự cắt/làm tròn. Tối thiểu (CONFIRMED, đặc tả v2 mục 6.8 “Yêu cầu độ chính xác”): không được âm thầm làm tròn/cắt giá trị mà không báo. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| d1 | Điểm cố định 29.5: Nhập **N=29.5**, lưu và mở lại. | **PROPOSED** (thiết kế DB v2 mục 4.2): **29.5** lưu và mở lại đúng. **CONFIRMED** (đặc tả v2 mục 6.8): không được âm thầm làm tròn/cắt giá trị mà không báo. |
| d2 | Điểm cố định 29.55: Nhập **N=29.55**, lưu và mở lại. | **PROPOSED** (thiết kế DB v2 mục 4.2): **29.55** lưu và mở lại đúng. **CONFIRMED** (đặc tả v2 mục 6.8): không được âm thầm làm tròn/cắt giá trị mà không báo. |
| d3 | Điểm cố định 29.555: Nhập **N=29.555**, lưu và mở lại. | **PROPOSED** (thiết kế DB v2 mục 4.2): **29.555** lưu và mở lại đúng. **CONFIRMED** (đặc tả v2 mục 6.8): không được âm thầm làm tròn/cắt giá trị mà không báo. |
| d4 | Điểm cố định 29.5555: Nhập **N=29.5555**, lưu và mở lại. | **PROPOSED** (thiết kế DB v2 mục 4.2): **29.5555** bị từ chối, không tự cắt/làm tròn. **CONFIRMED** (đặc tả v2 mục 6.8): không được âm thầm làm tròn/cắt giá trị mà không báo. |

#### TC-RS-CALC-001 — Ngưỡng cố định 30: S = 29 / 30 / 31 với `<` và `≤`

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Biên so sánh và cảnh báo” (AC-G07 «Biên so sánh và cảnh báo»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) (M=100). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), quy tắc cố định 30 với Nhỏ hơn hoặc bằng（以下）, học sinh S01 (điểm 29), học sinh S02 (điểm 30), học sinh S03 (điểm 31) |
| Thao tác | 1. Chỉ có quy tắc “Cố định 30” (dưới 30) (`T=30`, `&lt;`): đăng ký S01=29, S02=30, S03=31.<br>2. Đổi thành quy tắc cố định 30 với Nhỏ hơn hoặc bằng（以下） (`≤`), chạy lại. |
| Expected | Bước 1: 29 Đỏ; 30 Không đỏ; 31 Không đỏ.<br><br>Bước 2: 29 Đỏ; 30 Đỏ; 31 Không đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| lt | Nhỏ hơn: Ngưỡng 30, dấu nhỏ hơn, cả ba điểm | Bước 1: 29 Đỏ; 30 Không đỏ; 31 Không đỏ. |
| le | Nhỏ hơn hoặc bằng: Ngưỡng 30, dấu nhỏ hơn hoặc bằng, cả ba điểm | Bước 2: 29 Đỏ; 30 Đỏ; 31 Không đỏ. |

#### TC-RS-CALC-002 — Điểm 0 với ngưỡng 0 và 30

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Biên so sánh và cảnh báo” (AC-G07 «Biên so sánh và cảnh báo»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); học sinh S04 (điểm 0) (S=0); N = 0, 30 |
| Thao tác | Với từng cấu hình: cố định 0 `&lt;`, cố định 0 `≤`, cố định 30 `&lt;`: chạy lại, xem S04. |
| Expected | 0 `&lt;`: `0&lt;0` sai → Không đỏ.<br><br>0 `≤`: `0≤0` → Đỏ.<br><br>30 `&lt;`: `0&lt;30` → Đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| zero-lt | Ngưỡng 0, nhỏ hơn: S04=0; cấu hình cố định T=0, dấu &lt;; chạy xét. | 0 `&lt;`: `0&lt;0` sai → Không đỏ. |
| zero-le | Ngưỡng 0, nhỏ hơn hoặc bằng: S04=0; cấu hình cố định T=0, dấu ≤; chạy xét. | 0 `≤`: `0≤0` → Đỏ. |
| thirty-lt | Ngưỡng 30, nhỏ hơn: S04=0; cấu hình cố định T=30, dấu &lt;; chạy xét. | 30 `&lt;`: `0&lt;30` → Đỏ. |

#### TC-RS-CALC-003 — Điểm thập phân sát ngưỡng

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11 «Giữ chính xác giá trị»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số thập phân (M=100) (thập phân, M=100); cố định 30. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100); S = 29.5, 29.9, 30.0, 30.01 |
| Thao tác | Đăng ký bốn học sinh với các điểm trên; xét với `&lt;` rồi `≤`. |
| Expected | `&lt;`: 29.5 Đỏ; 29.9 Đỏ; 30.0 Không đỏ; 30.01 Không đỏ.<br><br>`≤`: 29.5 Đỏ; 29.9 Đỏ; 30.0 Đỏ; 30.01 Không đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| lt | Nhỏ hơn: Dấu nhỏ hơn, cả bốn điểm | `&lt;`: 29.5 Đỏ; 29.9 Đỏ; 30.0 Không đỏ; 30.01 Không đỏ. |
| le | Nhỏ hơn hoặc bằng: Dấu nhỏ hơn hoặc bằng, cả bốn điểm | `≤`: 29.5 Đỏ; 29.9 Đỏ; 30.0 Đỏ; 30.01 Không đỏ. |

#### TC-RS-CALC-004 — Ngưỡng cố định giữ `T=N` khi M đổi về sau

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Điểm cố định” (AC-G08 «Điểm cố định»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | quy tắc “Cố định 30” (dưới 30) (N=30) lưu khi M=100. Sau đó đổi Giá trị tối đa（最大値） của mục số nguyên (M=100) thành 20. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30); S = 15, 20 |
| Thao tác | 1. Đăng ký hai học sinh S=15 và S=20.<br>2. Mở lại quy tắc. |
| Expected | 1. `T=30` → 15 Đỏ; 20 Đỏ. Không chuyển thành Chưa xét được; không tự đổi `T` thành 20 hoặc `M×30%`.<br>2. N vẫn hiển thị 30 (không bị tự sửa). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. `T=30` → 15 Đỏ; 20 Đỏ. Không chuyển thành Chưa xét được; không tự đổi `T` thành 20 hoặc `M×30%`.<br>2. N vẫn hiển thị 30 (không bị tự sửa). |

#### TC-RS-UI-011 — Màn Ngưỡng（基準設定）: ba loại, dấu so sánh và câu giải thích đổi theo dấu

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 6.1 “Thành phần chung của màn ngưỡng”; trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Mở ngưỡng của một quy tắc. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | 1. Xem ba lựa chọn loại.<br>2. Đổi Dấu so sánh（比較条件） giữa Nhỏ hơn（未満） và Nhỏ hơn hoặc bằng（以下）. |
| Expected | 1. Có Điểm cố định（固定点数）, Tỷ lệ điểm tối đa（得点率）, Công thức（計算式） (theo phạm vi phát hành — xem UI-025).<br>2. Câu giải thích dưới dấu đổi theo lựa chọn. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| lt | Nhỏ hơn: Dấu nhỏ hơn | 1. Có Điểm cố định（固定点数）, Tỷ lệ điểm tối đa（得点率）, Công thức（計算式） (theo phạm vi phát hành — xem UI-025).<br>2. Câu giải thích dưới dấu đổi theo lựa chọn. |
| le | Nhỏ hơn hoặc bằng: Dấu nhỏ hơn hoặc bằng | 1. Có Điểm cố định（固定点数）, Tỷ lệ điểm tối đa（得点率）, Công thức（計算式） (theo phạm vi phát hành — xem UI-025).<br>2. Câu giải thích dưới dấu đổi theo lựa chọn. |

#### TC-RS-UI-012 — Mặc định khi tạo quy tắc mới

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 6.1 “Thành phần chung của màn ngưỡng”; trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Thêm quy tắc mới, lưu điều kiện, mở ngưỡng. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | Quan sát giá trị ban đầu. |
| Expected | Loại = Điểm cố định（固定点数）; dấu = Nhỏ hơn（未満）; ô Điểm chuẩn（基準点） trống; tỷ lệ/công thức (nếu mở) mặc định Không xử lý phần lẻ（しない）.<br><br>Quy tắc mới được thêm ở cuối danh sách (PROPOSED). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Loại = Điểm cố định（固定点数）; dấu = Nhỏ hơn（未満）; ô Điểm chuẩn（基準点） trống; tỷ lệ/công thức (nếu mở) mặc định Không xử lý phần lẻ（しない）.<br><br>Quy tắc mới được thêm ở cuối danh sách (PROPOSED). |

#### TC-RS-UI-013 — Ngưỡng cố định không hiển thị nguồn trung bình

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”; trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Mở ngưỡng, chọn Điểm cố định（固定点数）. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | Xem màn. |
| Expected | CONFIRMED: không có khối Trung bình tham chiếu（参照する平均点）; lưu không yêu cầu chọn nguồn.<br><br>PROPOSED: ô Điểm chuẩn（基準点） + đơn vị 点 (điểm), câu 「30点未満を赤点とします。30点は赤点になりません。」 (dưới 30 là đỏ; 30 không đỏ) đổi theo giá trị/dấu, câu 「判定には登録済みの最終点数を使用します。」 (xét dùng điểm cuối đã đăng ký). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | CONFIRMED: không có khối Trung bình tham chiếu（参照する平均点）; lưu không yêu cầu chọn nguồn.<br><br>PROPOSED: ô Điểm chuẩn（基準点） + đơn vị 点 (điểm), câu 「30点未満を赤点とします。30点は赤点になりません。」 (dưới 30 là đỏ; 30 không đỏ) đổi theo giá trị/dấu, câu 「判定には登録済みの最終点数を使用します。」 (xét dùng điểm cuối đã đăng ký). |

### Flow: Ngưỡng công thức

#### TC-RS-FUNC-012 — Công thức: thêm/xóa dòng, kết quả dòng cuối là ngưỡng

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16 «Công thức theo dòng và phần lẻ»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Mở Ngưỡng loại Công thức（計算式）. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8) |
| Thao tác | 1. Cấu hình dòng 1 và dòng 2 như quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8), lưu.<br>2. Mở lại; bấm Thêm công thức（計算式を追加） để có dòng 3, rồi xóa dòng 3, lưu.<br>3. Xem tóm tắt ở danh sách. |
| Expected | 1. Lưu được 2 dòng; mở lại giữ vế trái, phép toán, vế phải và xử lý phần lẻ từng dòng (chi tiết form là PROPOSED theo thiết kế).<br>2. Danh sách tóm tắt đủ các dòng và dấu so sánh (PROPOSED; không dùng làm oracle nghiệp vụ nếu đặc tả chưa chốt bố cục tóm tắt).<br>3. Khi xét, `T` = kết quả dòng cuối; phép tính và xử lý phần lẻ phải tuân theo AC-G16 và case “Công thức hai dòng theo Figma: (A÷2)×0.8, dòng 1 làm tròn xuống”. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. Lưu được 2 dòng; mở lại giữ vế trái, phép toán, vế phải và xử lý phần lẻ từng dòng (chi tiết form là PROPOSED theo thiết kế).<br>2. Danh sách tóm tắt đủ các dòng và dấu so sánh (PROPOSED; không dùng làm oracle nghiệp vụ nếu đặc tả chưa chốt bố cục tóm tắt).<br>3. Khi xét, `T` = kết quả dòng cuối; phép tính và xử lý phần lẻ phải tuân theo AC-G16 và case “Công thức hai dòng theo Figma: (A÷2)×0.8, dòng 1 làm tròn xuống”. |

#### TC-RS-VAL-008 — Công thức phải có ít nhất một dòng

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Kiểm công thức khi lưu” (AC-G17 «Kiểm công thức khi lưu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Loại Công thức tính（計算式）. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | Xóa hết các dòng công thức (nếu UI cho phép), bấm Lưu. |
| Expected | Không lưu được (hoặc UI không cho xóa dòng cuối). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Không lưu được (hoặc UI không cho xóa dòng cuối). |

#### TC-RS-VAL-009 — Chia cho số cố định 0 không lưu được

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Kiểm công thức khi lưu” (AC-G17 «Kiểm công thức khi lưu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Loại Công thức tính（計算式）. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Dòng 1: Trung bình（平均点）÷ Số cố định（固定値）0; biến thể 0.0 |
| Thao tác | Nhập công thức, Lưu. |
| Expected | Không lưu được; lỗi chỉ rõ dòng/vế phải. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| zero | Chia 0: Số chia cố định=0; lưu công thức. | Không lưu được; lỗi chỉ rõ dòng/vế phải. |
| decimal-zero | Chia 0.0: Số chia cố định=0.0; lưu công thức. | Không lưu được; lỗi chỉ rõ dòng/vế phải. |

#### TC-RS-VAL-010 — Toán hạng trống hoặc không phải số

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Kiểm công thức khi lưu” (AC-G17 «Kiểm công thức khi lưu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Loại Công thức tính（計算式）. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Vế phải Số cố định（固定値）: trống, `abc`; toán tử: chưa chọn |
| Thao tác | Nhập từng biến thể, Lưu. |
| Expected | Không lưu được; lỗi chỉ ra dòng thiếu. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| empty | Trống toán hạng: Để trống toán hạng; lưu công thức. | Không lưu được; lỗi chỉ ra dòng thiếu. |
| text | Toán hạng không phải số: Nhập toán hạng không phải số theo fixture; lưu. | Không lưu được; lỗi chỉ ra dòng thiếu. |
| operator | Thiếu phép toán: Để thiếu phép toán; lưu công thức. | Không lưu được; lỗi chỉ ra dòng thiếu. |

#### TC-RS-VAL-011 — Kết quả phép tính（式の結果） chỉ tham chiếu dòng phía trước

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Kiểm công thức khi lưu” (AC-G17 «Kiểm công thức khi lưu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Công thức 3 dòng. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: (a) Dòng 1 dùng Kết quả phép tính; (b) dòng 2 tham chiếu chính dòng 2; (c) dòng 2 tham chiếu dòng 3; (d) dòng 3 tham chiếu dòng 1 |
| Thao tác | Thử từng biến thể, bấm Lưu. |
| Expected | (a), (b), (c): không chọn được hoặc không lưu được.<br><br>(d): lưu được. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| first | Tham chiếu dòng đầu: Chọn Kết quả phép tính（式の結果） ở dòng đầu; thử lưu. | Dòng đầu: không chọn được hoặc không lưu được tham chiếu. |
| self | Tham chiếu chính dòng: Tham chiếu chính dòng đang sửa; thử lưu. | Chính dòng đang sửa: không chọn được hoặc không lưu được tham chiếu. |
| forward | Tham chiếu dòng sau: Tham chiếu dòng phía sau; thử lưu. | Dòng phía sau: không chọn được hoặc không lưu được tham chiếu. |
| backward | Tham chiếu dòng trước: Tham chiếu dòng phía trước; lưu và chạy. | (d): lưu được. |

#### TC-RS-VAL-012 — Xóa/đổi thứ tự dòng không tự nối lại tham chiếu

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Kiểm công thức khi lưu” (AC-G17 «Kiểm công thức khi lưu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Công thức 3 dòng: dòng 2 dùng kết quả dòng 1, dòng 3 dùng kết quả dòng 2. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | 1. Dựng lại công thức ba dòng đúng tham chiếu ban đầu trước mỗi trường hợp.<br>2. Thay dòng/thứ tự theo trường hợp rồi bấm Lưu.<br>3. Đọc lỗi và tham chiếu, kiểm hệ thống không tự nối sang dòng khác. |
| Expected | 1. Dòng 3 báo tham chiếu không hợp lệ hoặc buộc chọn lại; không âm thầm trỏ sang dòng 1.<br>2. Dòng vừa chuyển lên (đang tham chiếu dòng mới nằm phía sau nó) bị báo tham chiếu không hợp lệ hoặc buộc chọn lại; không tự đổi sang dòng khác chỉ vì cùng số thứ tự. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| delete | Xóa dòng đang được tham chiếu: Dựng công thức3 dòng: dòng2 dùng kết quả dòng1, dòng3 dùng kết quả dòng2. Xóa dòng2 rồi Lưu. | 1. Dòng 3 báo tham chiếu không hợp lệ hoặc buộc chọn lại; không âm thầm trỏ sang dòng 1. |
| reorder | Chuyển dòng lên trước nguồn: Reset công thức3 dòng ban đầu; đổi thứ tự dòng3 lên vị trí2, giữ tham chiếu cũ rồi Lưu. | 2. Dòng vừa chuyển lên (đang tham chiếu dòng mới nằm phía sau nó) bị báo tham chiếu không hợp lệ hoặc buộc chọn lại; không tự đổi sang dòng khác chỉ vì cùng số thứ tự. |

#### TC-RS-VAL-013 — Số cố định trong công thức không bị giới hạn 0–100

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 6.4 “Công thức dùng trung bình”, mục 6.8 “Yêu cầu độ chính xác”; trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Loại Công thức tính（計算式）. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: `A × 150`, `A × 0.5`, `A − 150` |
| Thao tác | Nhập từng công thức, Lưu. |
| Expected | Lưu được (không áp giới hạn 0–100 hay 0–M cho toán hạng). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| times150 | Nhân 150: Nhập phép nhân với hằng số150; lưu. | Lưu được (không áp giới hạn 0–100 hay 0–M cho toán hạng). |
| times05 | Nhân 0.5: Nhập phép nhân với hằng số0.5; lưu. | Lưu được (không áp giới hạn 0–100 hay 0–M cho toán hạng). |
| minus150 | Trừ 150: Nhập phép trừ hằng số150; lưu. | Lưu được (không áp giới hạn 0–100 hay 0–M cho toán hạng). |

#### TC-RS-VAL-019 — Cảnh báo ngưỡng biên không chặn lưu

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Biên so sánh và cảnh báo” (AC-G07 «Biên so sánh và cảnh báo»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); Cố định N=0 và N=100, mỗi giá trị với `&lt;` và `≤`; Tỷ lệ N=0, N=100; Tỷ lệ N=0.4 với Làm tròn（四捨五入） (ra `T=0`) |
| Thao tác | Nhập từng giá trị, Lưu, mở lại. |
| Expected | 1. Cảnh báo theo `T` cuối và dấu: `&lt;0` (không ai đỏ) và `≤100` (mọi điểm hợp lệ đỏ) phải có cảnh báo; các tổ hợp biên khác theo thiết kế.<br>2. Tỷ lệ 0.4 làm tròn ra `T=0`: cảnh báo xét theo `T=0`, không theo giá trị nhập 0.4.<br>3. Cảnh báo không chặn lưu; mở lại, giá trị đã lưu giữ nguyên (không tự đổi thành giá trị khác). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| fixed0-lt | Cố định 0, nhỏ hơn: M=100; nhập ngưỡng cố định **N=0**, dấu **&lt;**, Lưu và mở lại; đọc cảnh báo và giá trị đã lưu. | **T=0**, dấu **&lt;**: phải cảnh báo không ai đỏ. Cảnh báo không chặn lưu; mở lại giữ nguyên giá trị, không tự đổi sang giá trị khác. |
| fixed0-le | Cố định 0, nhỏ hơn hoặc bằng: M=100; nhập ngưỡng cố định **N=0**, dấu **≤**, Lưu và mở lại; đọc cảnh báo và giá trị đã lưu. | **T=0**, dấu **≤**: cảnh báo theo tổ hợp biên trong thiết kế; không tự áp kết luận không ai đỏ của dấu &lt;. Cảnh báo không chặn lưu; mở lại giữ nguyên giá trị, không tự đổi sang giá trị khác. |
| fixed100-lt | Cố định 100, nhỏ hơn: M=100; nhập ngưỡng cố định **N=100**, dấu **&lt;**, Lưu và mở lại; đọc cảnh báo và giá trị đã lưu. | **T=100**, dấu **&lt;**: cảnh báo theo tổ hợp biên trong thiết kế; không tự áp kết luận mọi điểm hợp lệ đỏ của dấu ≤. Cảnh báo không chặn lưu; mở lại giữ nguyên giá trị, không tự đổi sang giá trị khác. |
| fixed100-le | Cố định 100, nhỏ hơn hoặc bằng: M=100; nhập ngưỡng cố định **N=100**, dấu **≤**, Lưu và mở lại; đọc cảnh báo và giá trị đã lưu. | **T=100**, dấu **≤**: phải cảnh báo mọi điểm hợp lệ đỏ. Cảnh báo không chặn lưu; mở lại giữ nguyên giá trị, không tự đổi sang giá trị khác. |
| ratio0 | Tỷ lệ 0, dấu nhỏ hơn, không xử lý phần lẻ: T=0, có cảnh báo | Tỷ lệ **N=0**, **T=0**, dấu **&lt;**: phải cảnh báo không ai đỏ. Cảnh báo không chặn lưu; mở lại giữ nguyên giá trị, không tự đổi sang giá trị khác. |
| ratio100 | Tỷ lệ 100, dấu nhỏ hơn hoặc bằng, không xử lý phần lẻ: T=100, có cảnh báo | Tỷ lệ **N=100**, **T=100**, dấu **≤**: phải cảnh báo mọi điểm hợp lệ đỏ. Cảnh báo không chặn lưu; mở lại giữ nguyên giá trị, không tự đổi sang giá trị khác. |
| ratio04 | Tỷ lệ 0.4, dấu nhỏ hơn, làm tròn gần nhất p=1: T=0, có cảnh báo | Tỷ lệ **N=0.4**, làm tròn gần nhất p=1 cho **T=0**, dấu **&lt;**: phải cảnh báo theo T cuối, không theo 0.4. Cảnh báo không chặn lưu; mở lại giữ nguyên giá trị, không tự đổi sang giá trị khác. |

#### TC-RS-VAL-020 — Kết quả công thức âm hoặc vượt M không phải lỗi lưu

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Ngưỡng âm” (AC-G18 «Ngưỡng âm»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Loại Công thức tính（計算式）. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc công thức trung bình − 20 (`A−20`); công thức `A × 3` |
| Thao tác | Lưu từng công thức. |
| Expected | Lưu được; không kiểm `0≤T≤M` tại lúc lưu cho công thức. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| minus20 | Trừ 20: Nhập công thức A−20 và lưu. | Lưu được; không kiểm `0≤T≤M` tại lúc lưu cho công thức. |
| times3 | Nhân 3: Nhập công thức A×3 và lưu. | Lưu được; không kiểm `0≤T≤M` tại lúc lưu cho công thức. |

#### TC-RS-VAL-021 — Đổi loại ngưỡng trong cùng phiên sửa

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 6.7 “Đổi loại ngưỡng và đổi toán hạng”; trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | quy tắc “Cố định 30” (dưới 30) (cố định 30) đã lưu. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30) |
| Thao tác | 1. Đổi sang Tỷ lệ, nhập 40, đổi lại Cố định; xem ô Cố định; đổi sang Tỷ lệ lần nữa, xem ô Tỷ lệ.<br>2. Đổi lại Cố định, Lưu.<br>3. Mở lại quy tắc.<br>4. Đổi sang Tỷ lệ, nhập 50, bấm Hủy; mở lại.<br>5. (Khi có schema) Lưu quy tắc Tỷ lệ 40 có bật xử lý phần lẻ; đổi sang Cố định 30, Lưu, SELECT; đổi sang Công thức `A×0.5`, Lưu, SELECT. |
| Expected | 1. (PROPOSED) Trong phiên: ô Cố định vẫn 30; quay lại Tỷ lệ vẫn thấy 40.<br>2. Chỉ giá trị loại cuối cùng (Cố định 30) được kiểm và lưu; không lưu lẫn dữ liệu của loại khác.<br>3. Mở lại: Cố định 30; không bắt buộc còn giá trị Tỷ lệ 40.<br>4. Vẫn Cố định 30 (cấu hình đã lưu gần nhất).<br>5. (PROPOSED theo thiết kế DB v2) Sau mỗi lần lưu, các cột không dùng cho loại hiện tại (`round_*`, `threshold_value`, cột công thức/nguồn) là SQL NULL. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. (PROPOSED) Trong phiên: ô Cố định vẫn 30; quay lại Tỷ lệ vẫn thấy 40.<br>2. Chỉ giá trị loại cuối cùng (Cố định 30) được kiểm và lưu; không lưu lẫn dữ liệu của loại khác.<br>3. Mở lại: Cố định 30; không bắt buộc còn giá trị Tỷ lệ 40.<br>4. Vẫn Cố định 30 (cấu hình đã lưu gần nhất).<br>5. (PROPOSED theo thiết kế DB v2) Sau mỗi lần lưu, các cột không dùng cho loại hiện tại (`round_*`, `threshold_value`, cột công thức/nguồn) là SQL NULL. |

#### TC-RS-VAL-023 — Giới hạn công thức: 20/21 dòng và số chữ số của số cố định

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11 «Giữ chính xác giá trị»); trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Màn Công thức（計算式）, nguồn mặc định. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: (a) 20 dòng: dòng 1 `A × 1`, các dòng sau `kết quả dòng trước × 1`; (b) 21 dòng như (a); (c) `A × 999999999.99999999`; (d) `A × 1000000000`; (e) `A × 0.123456789` |
| Thao tác | Nhập từng cấu hình, Lưu, mở lại. |
| Expected | (a) Lưu được, mở lại đủ 20 dòng.<br><br>(b) Không thêm được dòng 21 hoặc bị từ chối khi lưu.<br><br>(c) Lưu được, giá trị giữ nguyên.<br><br>(d), (e) Bị từ chối, không tự cắt/làm tròn.<br><br>Gửi trực tiếp request vượt giới hạn cũng bị server từ chối (case “Server kiểm miền giá trị khi bỏ qua kiểm tra phía trình duyệt”). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| lines20 | 20 dòng: Dòng1 A×1, các dòng sau kết quả dòng trước×1, tổng20 dòng; lưu/mở lại. | (a) Lưu được, mở lại đủ 20 dòng.<br>Gửi trực tiếp request vượt giới hạn cũng bị server từ chối (case “Server kiểm miền giá trị khi bỏ qua kiểm tra phía trình duyệt”). |
| lines21 | 21 dòng: Thử21 dòng như fixture20 dòng; lưu. | (b) Không thêm được dòng 21 hoặc bị từ chối khi lưu.<br>Gửi trực tiếp request vượt giới hạn cũng bị server từ chối (case “Server kiểm miền giá trị khi bỏ qua kiểm tra phía trình duyệt”). |
| constant | Hằng số cực lớn: Nhập A×999999999.99999999; lưu/mở lại. | (c) Lưu được, giá trị giữ nguyên.<br>Gửi trực tiếp request vượt giới hạn cũng bị server từ chối (case “Server kiểm miền giá trị khi bỏ qua kiểm tra phía trình duyệt”). |
| integer-overflow | Vượt phần nguyên: Nhập A×1000000000; lưu và thử request trực tiếp. | **PROPOSED**: **A×1000000000** vượt 9 chữ số nguyên, bị từ chối; không tự cắt/làm tròn. Gửi trực tiếp request vượt giới hạn cũng bị server từ chối. |
| fraction-overflow | Vượt phần thập phân: Nhập A×0.123456789; lưu và thử request trực tiếp. | **PROPOSED**: **A×0.123456789** vượt 8 chữ số lẻ, bị từ chối; không tự cắt/làm tròn. Gửi trực tiếp request vượt giới hạn cũng bị server từ chối. |

#### TC-RS-CALC-013 — Công thức một dòng với A=50

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16 «Công thức theo dòng và phần lẻ»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Nguồn có `A=50`; dấu `&lt;`. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Công thức: (a) `A×0.5`; (b) `A−20`; (c) `A+5`; S = 24, 25, 29, 30, 54, 55 |
| Thao tác | Với từng công thức, chạy nút cam, xem kết quả. |
| Expected | (a) `T=25`: 24 Đỏ; 25 Không đỏ.<br><br>(b) `T=30`: 29 Đỏ; 30 Không đỏ.<br><br>(c) `T=55`: 54 Đỏ; 55 Không đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| multiply | Nhân 0.5: Nguồn A=50; tạo công thức A×0.5, chạy xét. | (a) `T=25`: 24 Đỏ; 25 Không đỏ. |
| subtract | Trừ 20: Nguồn A=50; tạo công thức A−20, chạy xét. | (b) `T=30`: 29 Đỏ; 30 Không đỏ. |
| add | Cộng 5: Nguồn A=50; tạo công thức A+5, chạy xét. | (c) `T=55`: 54 Đỏ; 55 Không đỏ. |

#### TC-RS-CALC-014 — Làm tròn theo từng dòng: A=49.7

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16 «Công thức theo dòng và phần lẻ»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Nguồn `A=49.7`; dòng 1 `A÷2`; dòng 2 `Kết quả dòng 1 × 0.8`; `&lt;`. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: S = 19.1 và S = 19.2 |
| Thao tác | 1. Lưu đúng cấu hình: dòng 1 bật xử lý phần lẻ, vị trí 1, làm tròn xuống; dòng 2 không xử lý.<br>2. Chạy xét với `S=19.1` và `S=19.2`. |
| Expected | 1. `24.85→24`; `T=24×0.8=19.2`.<br>2. Với dấu `&lt;`: `S=19.1` Đỏ và `S=19.2` Không đỏ.<br>3. Không làm tròn dòng 2 thành `19`. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. `24.85→24`; `T=24×0.8=19.2`.<br>2. Với dấu `&lt;`: `S=19.1` Đỏ và `S=19.2` Không đỏ.<br>3. Không làm tròn dòng 2 thành `19`. |

#### TC-RS-CALC-015 — Công thức hai dòng theo Figma: (A÷2)×0.8, dòng 1 làm tròn xuống

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16 «Công thức theo dòng và phần lẻ»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Blocked |
| Gap | G-PREP-TC-RS-CALC-015 |
| Cấu hình | giáo viên có quyền sửa thiết lập; dùng mục số thập phân TD-ITEM-02 (`M=100`) trong lớp fixture duy nhất TD-GRP-05; ba học sinh C15-P1/P2/P3 cùng thuộc phạm vi rule và nguồn trung bình TD-SRC-25; chưa có kết quả đỏ cũ. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: C15-P1 có `S=23.9`, C15-P2 có `S=24`, C15-P3 có `S=24.4`; nguồn reader phải trả `A=61`; quy tắc hai dòng `(A÷2)×0.8`. |
| Thao tác | 1. Tạo dòng 1 `A÷2`; chọn **chữ số thập phân thứ 1（小数第1位）** và **Làm tròn xuống（切り捨て）**, tức kết quả dòng 1 được đưa về số nguyên. Tạo dòng 2 `kết quả dòng trước×0.8` và chọn **không xử lý phần lẻ（しない）**.<br>2. Xác nhận TD-SRC-25/reader trả `A=61`; chạy trong đúng lớp TD-GRP-05 với C15-P1/P2/P3 cho hai biến thể dấu `&lt;` và `≤`, không đổi nguồn hoặc cách làm tròn.<br>3. Mở lại cấu hình và đối chiếu kết quả của C15-P1/P2/P3. |
| Expected | Dòng 1 `61÷2=30.5` làm tròn xuống thành `30`; dòng 2 `30×0.8=24`, nên oracle cố định là `T=24`.<br><br>- Với dấu `&lt;`: C15-P1=`23.9` Đỏ; C15-P2=`24` **Không đỏ**; C15-P3=`24.4` **Không đỏ**.<br>- Với dấu `≤`: C15-P1=`23.9` Đỏ; C15-P2=`24` Đỏ; C15-P3=`24.4` **Không đỏ**.<br><br>Mở lại cấu hình và phần tóm tắt phải giữ đúng vị trí làm tròn xuống ở dòng 1, không được thay expected theo kết quả thực tế hoặc ghi đè oracle trong evidence. Phương thức không làm tròn dòng 1 là biến thể riêng, không thuộc case này. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| less-than | Nhỏ hơn: TD-SRC-25 reader **A=61**; TD-GRP-05/C15-P1=23.9, C15-P2=24, C15-P3=24.4. Xét dấu **&lt;**, giữ dòng 1 làm tròn xuống ở chữ số thập phân thứ 1 và dòng 2 không xử lý phần lẻ. | Dòng 1 `61÷2=30.5` làm tròn xuống thành `30`; dòng 2 `30×0.8=24`, nên oracle cố định là `T=24`.<br>Với **&lt;**: C15-P1=**23.9 Đỏ**; C15-P2=**24** **Không đỏ**; C15-P3=**24.4 Không đỏ**.<br>Mở lại cấu hình và phần tóm tắt phải giữ đúng vị trí làm tròn xuống ở dòng 1, không được thay expected theo kết quả thực tế hoặc ghi đè oracle trong evidence. Phương thức không làm tròn dòng 1 là biến thể riêng, không thuộc case này. |
| less-or-equal | Nhỏ hơn hoặc bằng: TD-SRC-25 reader **A=61**; TD-GRP-05/C15-P1=23.9, C15-P2=24, C15-P3=24.4. Xét dấu **≤**, giữ dòng 1 làm tròn xuống ở chữ số thập phân thứ 1 và dòng 2 không xử lý phần lẻ. | Dòng 1 `61÷2=30.5` làm tròn xuống thành `30`; dòng 2 `30×0.8=24`, nên oracle cố định là `T=24`.<br>Với **≤**: C15-P1=**23.9 Đỏ**; C15-P2=**24** Đỏ; C15-P3=**24.4 Không đỏ**.<br>Mở lại cấu hình và phần tóm tắt phải giữ đúng vị trí làm tròn xuống ở dòng 1, không được thay expected theo kết quả thực tế hoặc ghi đè oracle trong evidence. Phương thức không làm tròn dòng 1 là biến thể riêng, không thuộc case này. |
| reopen-summary | Giữ cấu hình khi mở lại: Sau từng lượt dấu &lt;/≤, mở lại quy tắc hai dòng (A÷2)×0.8 và phần tóm tắt; đối chiếu source A=61 và vị trí làm tròn. | Dòng 1 `61÷2=30.5` làm tròn xuống thành `30`; dòng 2 `30×0.8=24`, nên oracle cố định là `T=24`.<br><br>- Với dấu `&lt;`: C15-P1=`23.9` Đỏ; C15-P2=`24` **Không đỏ**; C15-P3=`24.4` **Không đỏ**.<br>- Với dấu `≤`: C15-P1=`23.9` Đỏ; C15-P2=`24` Đỏ; C15-P3=`24.4` **Không đỏ**.<br><br>Mở lại cấu hình và phần tóm tắt phải giữ đúng vị trí làm tròn xuống ở dòng 1, không được thay expected theo kết quả thực tế hoặc ghi đè oracle trong evidence. Phương thức không làm tròn dòng 1 là biến thể riêng, không thuộc case này. |

#### TC-RS-CALC-016 — Ngưỡng âm: A=15, A−20 → T=−5

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Ngưỡng âm” (AC-G18 «Ngưỡng âm»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | quy tắc công thức trung bình − 20; nguồn `A=15`. Biến thể (b) cần mục cho phép điểm âm. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc công thức trung bình − 20; (a) Mục thường: S = 0; (b) mục cho phép điểm âm: S = −6, −5 |
| Thao tác | (a) Xét S=0 với `&lt;` và `≤`.<br><br>(b) Xét −6, −5 với `&lt;` và `≤`. |
| Expected | (a) `T=−5`: `&lt;` Không đỏ; `≤` Không đỏ (nếu hệ thống ép `T` về 0 thì `≤` sẽ Đỏ — sai).<br><br>(b) `&lt;`: −6 Đỏ; −5 Không đỏ. `≤`: −6 Đỏ; −5 Đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| zero-lt | Điểm 0, nhỏ hơn: A=15, công thức A−20 → **T=−5**; mục thường **S=0**, dấu **&lt;**. | **0&lt;−5** sai → **Không đỏ**; T giữ **−5**, không ép về 0. |
| zero-le | Điểm 0, nhỏ hơn hoặc bằng: A=15, công thức A−20 → **T=−5**; mục thường **S=0**, dấu **≤**. | **0≤−5** sai → **Không đỏ**; nếu ép T về 0 thì 0≤0 sẽ Đỏ — sai. |
| negative-lt | Điểm âm, nhỏ hơn: Mục cho phép điểm âm; A=15, T=−5, **S=−6 và −5**, dấu **&lt;**. | **T=−5**: **−6 Đỏ**, **−5 Không đỏ** với dấu **&lt;**. |
| negative-le | Điểm âm, nhỏ hơn hoặc bằng: Mục cho phép điểm âm; A=15, T=−5, **S=−6 và −5**, dấu **≤**. | **T=−5**: **−6 Đỏ**, **−5 Đỏ** với dấu **≤**. |

#### TC-RS-CALC-017 — Ngưỡng công thức vượt M vẫn hợp lệ

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16 «Công thức theo dòng và phần lẻ»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Nguồn `A=80`; công thức `A×1.5`; mục số nguyên (M=100) (M=100). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); S = 100 |
| Thao tác | Chạy nút cam; xem kết quả. |
| Expected | `T=120`; `100&lt;120` → Đỏ. Không bị Chưa xét được, không ép `T` về 100. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | `T=120`; `100&lt;120` → Đỏ. Không bị Chưa xét được, không ép `T` về 100. |

#### TC-RS-CALC-018 — Công thức A−0 cho ngưỡng bằng A

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Biên so sánh và cảnh báo” (AC-G07 «Biên so sánh và cảnh báo»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Nguồn `A=50`; công thức `A−0`, `&lt;`. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: S = 49, 50 |
| Thao tác | 1. Lưu công thức (quan sát cảnh báo).<br>2. Chạy nút cam. |
| Expected | 1. Có cảnh báo giúp hiểu ngưỡng là A (câu chữ TBD), vẫn lưu được.<br>2. `T=50`: 49 Đỏ; 50 Không đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. Có cảnh báo giúp hiểu ngưỡng là A (câu chữ TBD), vẫn lưu được.<br>2. `T=50`: 49 Đỏ; 50 Không đỏ. |

#### TC-RS-CALC-019 — Định nghĩa phương thức làm tròn, số âm và p=9

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16 «Công thức theo dòng và phần lẻ»); trạng thái nguồn TBD; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Awaiting decision |
| Readiness | Blocked |
| Gap | G-ORACLE-TC-RS-CALC-019, G-PREP-TC-RS-CALC-019 |
| Cấu hình | Dùng công thức một dòng `A+0` hoặc `A×1` để đưa giá trị vào bước làm tròn (nguồn dummy có `A` bằng giá trị cần thử). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Bảng ở Expected Result |
| Thao tác | 1. Với từng dòng của Expected Result: đặt `A` (nguồn dummy, dữ liệu giả cho bản tổng hợp đã chốt), chọn xử lý phần lẻ.<br>2. Chạy lại (nút cam).<br>3. Đọc `T` qua thông tin giải thích (case “Lưu thông tin giải thích kết quả”) hoặc qua kết quả xét với S sát ngưỡng. |
| Expected | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br><br>29.7 không xử lý → 29.7.<br><br>29.7 xuống p1 → 29.<br><br>29.75 gần nhất p2 → 29.8.<br><br>−5.2 lên p1 → −5.<br><br>−5.2 xuống p1 → −6.<br><br>−5.5 gần nhất p1 → −6.<br><br>12.5 gần nhất p1 → 13; −12.5 gần nhất p1 → −13; −12.5 lên p1 → −12; −12.5 xuống p1 → −13.<br><br>12.345 gần nhất p2 → 12.3; lên p2 → 12.4.<br><br>2.675 gần nhất p3 → 2.68.<br><br>1.123456789 gần nhất p9 → 1.12345679; xuống p9 → 1.12345678. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| positive-none | Giữ phần lẻ dương: Nguồn dummy **A=29.7** qua công thức A+0 hoặc A×1; chọn **không xử lý**, chạy nút cam và đọc **T** qua giải thích hoặc S sát ngưỡng. Miền âm/p9 hoặc cách làm tròn âm còn PROPOSED/TBD theo phạm vi; thiếu seam thì BLOCKED. | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br>29.7 không xử lý → 29.7. |
| positive-down | Làm tròn xuống số dương: Nguồn dummy **A=29.7** qua công thức A+0 hoặc A×1; chọn **xuống p1**, chạy nút cam và đọc **T** qua giải thích hoặc S sát ngưỡng. Miền âm/p9 hoặc cách làm tròn âm còn PROPOSED/TBD theo phạm vi; thiếu seam thì BLOCKED. | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br>29.7 xuống p1 → 29. |
| positive-nearest | Làm tròn gần nhất số dương: Nguồn dummy **A=29.75** qua công thức A+0 hoặc A×1; chọn **gần nhất p2**, chạy nút cam và đọc **T** qua giải thích hoặc S sát ngưỡng. Miền âm/p9 hoặc cách làm tròn âm còn PROPOSED/TBD theo phạm vi; thiếu seam thì BLOCKED. | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br>29.75 gần nhất p2 → 29.8. |
| negative-up | Làm tròn lên số âm: Nguồn dummy **A=-5.2** qua công thức A+0 hoặc A×1; chọn **lên p1**, chạy nút cam và đọc **T** qua giải thích hoặc S sát ngưỡng. Miền âm/p9 hoặc cách làm tròn âm còn PROPOSED/TBD theo phạm vi; thiếu seam thì BLOCKED. | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br>−5.2 lên p1 → −5. |
| negative-down | Làm tròn xuống số âm: Nguồn dummy **A=-5.2** qua công thức A+0 hoặc A×1; chọn **xuống p1**, chạy nút cam và đọc **T** qua giải thích hoặc S sát ngưỡng. Miền âm/p9 hoặc cách làm tròn âm còn PROPOSED/TBD theo phạm vi; thiếu seam thì BLOCKED. | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br>−5.2 xuống p1 → −6. |
| negative-nearest | Làm tròn gần nhất số âm: Nguồn dummy **A=-5.5** qua công thức A+0 hoặc A×1; chọn **gần nhất p1**, chạy nút cam và đọc **T** qua giải thích hoặc S sát ngưỡng. Miền âm/p9 hoặc cách làm tròn âm còn PROPOSED/TBD theo phạm vi; thiếu seam thì BLOCKED. | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br>−5.5 gần nhất p1 → −6. |
| half-positive | Giữa hai số nguyên dương: Nguồn dummy **A=12.5** qua công thức A+0 hoặc A×1; chọn **gần nhất p1**, chạy nút cam và đọc **T** qua giải thích hoặc S sát ngưỡng. Miền âm/p9 hoặc cách làm tròn âm còn PROPOSED/TBD theo phạm vi; thiếu seam thì BLOCKED. | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br>12.5 gần nhất p1 → 13 |
| half-negative | Giữa hai số nguyên âm: Nguồn dummy **A=-12.5** qua công thức A+0 hoặc A×1; chọn **gần nhất p1**, chạy nút cam và đọc **T** qua giải thích hoặc S sát ngưỡng. Miền âm/p9 hoặc cách làm tròn âm còn PROPOSED/TBD theo phạm vi; thiếu seam thì BLOCKED. | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br>−12.5 gần nhất p1 → −13 |
| half-up | Lên tại số âm giữa hai mức: Nguồn dummy **A=-12.5** qua công thức A+0 hoặc A×1; chọn **lên p1**, chạy nút cam và đọc **T** qua giải thích hoặc S sát ngưỡng. Miền âm/p9 hoặc cách làm tròn âm còn PROPOSED/TBD theo phạm vi; thiếu seam thì BLOCKED. | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br>−12.5 lên p1 → −12 |
| half-down | Xuống tại số âm giữa hai mức: Nguồn dummy **A=-12.5** qua công thức A+0 hoặc A×1; chọn **xuống p1**, chạy nút cam và đọc **T** qua giải thích hoặc S sát ngưỡng. Miền âm/p9 hoặc cách làm tròn âm còn PROPOSED/TBD theo phạm vi; thiếu seam thì BLOCKED. | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br>−12.5 xuống p1 → −13. |
| decimal-nearest | Gần nhất tại p2: Nguồn dummy **A=12.345** qua công thức A+0 hoặc A×1; chọn **gần nhất p2**, chạy nút cam và đọc **T** qua giải thích hoặc S sát ngưỡng. Miền âm/p9 hoặc cách làm tròn âm còn PROPOSED/TBD theo phạm vi; thiếu seam thì BLOCKED. | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br>12.345 gần nhất p2 → 12.3 |
| decimal-up | Lên tại p2: Nguồn dummy **A=12.345** qua công thức A+0 hoặc A×1; chọn **lên p2**, chạy nút cam và đọc **T** qua giải thích hoặc S sát ngưỡng. Miền âm/p9 hoặc cách làm tròn âm còn PROPOSED/TBD theo phạm vi; thiếu seam thì BLOCKED. | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br>lên p2 → 12.4. |
| p3 | Gần nhất tại p3: Nguồn dummy **A=2.675** qua công thức A+0 hoặc A×1; chọn **gần nhất p3**, chạy nút cam và đọc **T** qua giải thích hoặc S sát ngưỡng. Miền âm/p9 hoặc cách làm tròn âm còn PROPOSED/TBD theo phạm vi; thiếu seam thì BLOCKED. | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br>2.675 gần nhất p3 → 2.68. |
| p9-nearest | Gần nhất tại p9: Nguồn dummy **A=1.123456789** qua công thức A+0 hoặc A×1; chọn **gần nhất p9**, chạy nút cam và đọc **T** qua giải thích hoặc S sát ngưỡng. Miền âm/p9 hoặc cách làm tròn âm còn PROPOSED/TBD theo phạm vi; thiếu seam thì BLOCKED. | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br>1.123456789 gần nhất p9 → 1.12345679 |
| p9-down | Xuống tại p9: Nguồn dummy **A=1.123456789** qua công thức A+0 hoặc A×1; chọn **xuống p9**, chạy nút cam và đọc **T** qua giải thích hoặc S sát ngưỡng. Miền âm/p9 hoặc cách làm tròn âm còn PROPOSED/TBD theo phạm vi; thiếu seam thì BLOCKED. | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br>xuống p9 → 1.12345678. |

#### TC-RS-CALC-020 — Làm tròn ngưỡng, không làm tròn điểm học sinh

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16 «Công thức theo dòng và phần lẻ»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số thập phân (M=100) với M=99; tỷ lệ 30% (`T_thô=29.7`), `&lt;`. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100); S = 29.5 |
| Thao tác | (a) Xuống p1.<br><br>(b) Gần nhất p1. |
| Expected | (a) `T=29`; `29.5&lt;29` sai → Không đỏ. (Nếu làm tròn S thành 29 và giữ `T=29.7` → Đỏ — sai.)<br><br>(b) `T=30`; `29.5&lt;30` → Đỏ. (Nếu làm tròn S thành 30 → Không đỏ — sai.)<br><br>Điểm lưu vẫn 29.5. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| down | Làm tròn ngưỡng xuống: M=99,N=30%,T thô29.7,S=29.5,dấu &lt;; chọn Làm tròn xuống p=1, chạy xét và đọc điểm/ngưỡng. | (a) `T=29`; `29.5&lt;29` sai → Không đỏ. (Nếu làm tròn S thành 29 và giữ `T=29.7` → Đỏ — sai.)<br>Điểm lưu vẫn 29.5. |
| nearest | Làm tròn ngưỡng gần nhất: M=99,N=30%,T thô29.7,S=29.5,dấu &lt;; chọn Làm tròn gần nhất p=1, chạy xét và đọc điểm/ngưỡng. | (b) `T=30`; `29.5&lt;30` → Đỏ. (Nếu làm tròn S thành 30 → Không đỏ — sai.)<br>Điểm lưu vẫn 29.5. |

#### TC-RS-CALC-021 — Chia 0 phát sinh khi chạy → Chưa xét được

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 6.4 “Công thức dùng trung bình”, mục 8.3 “Không tạo được ngưỡng hợp lệ”; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | quy tắc công thức 100 ÷ trung bình (`100÷A`), `&lt;`, mục số thập phân (M=100). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100), quy tắc công thức 100 ÷ trung bình; (a) nhóm có trung bình 0 `A=0`; (b) `A=4`, S = 24; (c) `A=3`, S = 33.33, 33.34 |
| Thao tác | Chạy nút cam cho từng nguồn. |
| Expected | (a) Chưa xét được; không dùng ưu tiên thấp hơn.<br><br>(b) `T=25` → 24 Đỏ.<br><br>(c) `T=33.333…` → 33.33 Đỏ; 33.34 Không đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| a0 | Nguồn bằng 0: Công thức100÷A,dấu &lt;; reader A=0, chạy nút cam. | (a) Chưa xét được; không dùng ưu tiên thấp hơn. |
| a4 | Nguồn tạo ngưỡng 25: Công thức100÷A,dấu &lt;; reader A=4,S=24, chạy nút cam. | (b) `T=25` → 24 Đỏ. |
| a3 | Ngưỡng lặp vô hạn phần lẻ: Công thức100÷A,dấu &lt;; reader A=3,S=33.33 và33.34, chạy nút cam. | (c) `T=33.333…` → 33.33 Đỏ; 33.34 Không đỏ. |

#### TC-RS-CALC-028 — Không sai kết quả do sai số dấu phẩy động

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11 «Giữ chính xác giá trị»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số thập phân (M=100); nguồn dummy. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100); (a) `A=1.1`, công thức `A×3`, S = 3.3; (b) `A=0.1`, công thức `A+0.2`, S = 0.3 |
| Thao tác | Xét với `&lt;` và `≤`. |
| Expected | (a) `T=3.3`: `&lt;` Không đỏ; `≤` Đỏ.<br><br>(b) `T=0.3`: `&lt;` Không đỏ; `≤` Đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| multiply-lt | Nhân tại điểm bằng ngưỡng: **A=1.1**, **A×3**, **S=3.3**, dấu **&lt;**; chạy xét. | **T=3.3**, **S=3.3**, dấu **&lt;** → **Không đỏ**; không để sai số tính làm đổi kết luận. |
| multiply-le | Nhân tại điểm bằng ngưỡng: **A=1.1**, **A×3**, **S=3.3**, dấu **≤**; chạy xét. | **T=3.3**, **S=3.3**, dấu **≤** → **Đỏ**; không để sai số tính làm đổi kết luận. |
| add-lt | Cộng tại điểm bằng ngưỡng: **A=0.1**, **A+0.2**, **S=0.3**, dấu **&lt;**; chạy xét. | **T=0.3**, **S=0.3**, dấu **&lt;** → **Không đỏ**; không để sai số tính làm đổi kết luận. |
| add-le | Cộng tại điểm bằng ngưỡng: **A=0.1**, **A+0.2**, **S=0.3**, dấu **≤**; chạy xét. | **T=0.3**, **S=0.3**, dấu **≤** → **Đỏ**; không để sai số tính làm đổi kết luận. |

#### TC-RS-CALC-029 — Tràn số không tạo kết luận đỏ/không đỏ

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11 «Giữ chính xác giá trị»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Công thức. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: (a) `A × 999999999999999999999` (21 chữ số); `A ÷ 0.000000001`.&lt;br&gt;(b) 20 dòng, mỗi dòng `× 999999999.99999999` (dòng 1: `A × 999999999.99999999`), không xử lý phần lẻ; `A=50`. |
| Thao tác | 1. Nhập (a), Lưu.<br>2. Nhập (b), Lưu, chạy nút cam. |
| Expected | 1. (a) vượt giới hạn nhập đề xuất (9 chữ số nguyên, 8 chữ số lẻ) → bị từ chối khi lưu, không tự cắt số.<br>2. (b) nằm trong giới hạn nhập nên lưu được; khi chạy, ngưỡng vượt miền số được hỗ trợ → Chưa xét được (đề xuất `reason_code=numeric_overflow`) hoặc lỗi kỹ thuật được báo. Không có ô nào thành Đỏ/Không đỏ từ giá trị tràn. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| constant | Hằng số cực lớn: Nhập A×999999999999999999999 (21 chữ số); lưu. | **PROPOSED**: Hằng số 21 chữ số vượt giới hạn nhập 9 chữ số nguyên, 8 chữ số lẻ → bị từ chối khi lưu; không tự cắt số. |
| divisor | Số chia cực nhỏ: Nhập A÷0.000000001; lưu. | **PROPOSED**: Số chia **0.000000001** có 9 chữ số lẻ, vượt giới hạn 8 chữ số lẻ → bị từ chối khi lưu; không tự cắt số. |
| overflow | Tràn trong lúc tính: A=50;20 dòng nhân999999999.99999999, không xử lý phần lẻ; lưu rồi chạy nút cam. | 20 dòng nhân **999999999.99999999**, A=50: nằm trong giới hạn nhập nên lưu được. Khi chạy, ngưỡng tràn miền số → **Chưa xét được** (reason_code=numeric_overflow là đề xuất) hoặc báo lỗi kỹ thuật; không có ô nào thành Đỏ/Không đỏ từ giá trị tràn. |

#### TC-RS-CALC-030 — Công thức cho T=0; ô trống vẫn là Không có điểm

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 2.3 “Điểm được đưa vào xét”, mục 6.6 “Ngưỡng âm và cảnh báo biên”; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Nguồn `A=20`; công thức `A−20`. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S04 (điểm 0) (0), học sinh S05 (ô trống) (trống) |
| Thao tác | Xét với `&lt;` rồi `≤`. |
| Expected | `T=0`. `&lt;`: S04 Không đỏ. `≤`: S04 Đỏ. S05: Không có điểm ở cả hai (không bị coi là 0). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| lt | Nhỏ hơn: Dấu nhỏ hơn | `T=0`. `&lt;`: S04 Không đỏ. S05: Không có điểm (không bị coi là 0). |
| le | Nhỏ hơn hoặc bằng: Dấu nhỏ hơn hoặc bằng | `T=0`. `≤`: S04 Đỏ. S05: Không có điểm (không bị coi là 0). |

#### TC-RS-UI-015 — Màn Công thức: thứ tự khối nguồn trung bình và dòng công thức

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”, mục 6.4 “Công thức dùng trung bình”; trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Mở ngưỡng, chọn Công thức（計算式）. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | Ghi lại thứ tự các khối từ trên xuống. |
| Expected | Khối nguồn chỉ hiện với Công thức, không hiện với cố định/tỷ lệ (đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”).<br><br>Thứ tự khối theo Figma (PROPOSED): khối Trung bình tham chiếu（参照する平均点） nằm trước bảng dòng công thức và trước Xét điểm đỏ（赤点の判定）. Đặc tả v2 không quy định thứ tự; lệch thì ghi Notes, không FAIL. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Khối nguồn chỉ hiện với Công thức, không hiện với cố định/tỷ lệ (đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”).<br><br>Thứ tự khối theo Figma (PROPOSED): khối Trung bình tham chiếu（参照する平均点） nằm trước bảng dòng công thức và trước Xét điểm đỏ（赤点の判定）. Đặc tả v2 không quy định thứ tự; lệch thì ghi Notes, không FAIL. |

#### TC-RS-UI-016 — Bảng dòng công thức

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 6.4 “Công thức dùng trung bình”; trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Công thức. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8) |
| Thao tác | 1. Nhập quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8).<br>2. Thêm/xóa dòng. |
| Expected | Có đủ cột; chọn Kết quả phép tính（式の結果） thì hiện ô chọn dòng; mỗi dòng có Xử lý phần lẻ riêng; thêm/xóa dòng được; có câu dòng cuối là ngưỡng. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Có đủ cột; chọn Kết quả phép tính（式の結果） thì hiện ô chọn dòng; mỗi dòng có Xử lý phần lẻ riêng; thêm/xóa dòng được; có câu dòng cuối là ngưỡng. |

#### TC-RS-UI-017 — Thông báo lỗi vượt điểm tối đa và chia 0

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 8.4 “Lỗi kỹ thuật và thông báo”; trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); Cố định N=120; công thức `A ÷ 0` |
| Thao tác | 1. Lưu N=120.<br>2. Lưu công thức chia 0. |
| Expected | 1. Không lưu được. Đầu vùng nhập có 「基準点が対象の満点を超えています。対象の満点以下の値を入力してください。」 (điểm chuẩn vượt điểm tối đa của đối tượng; hãy nhập giá trị không vượt điểm tối đa); tại ô Điểm chuẩn（基準点） có 「対象の満点（100点）以下の値を入力してください。」 và dòng 「対象の満点：100点」 (điểm tối đa của đối tượng: 100); giá trị 120 còn giữ.<br>2. Không lưu được. Đầu vùng nhập có 「式1：0で割ることはできません。右辺の値を変更してください。」 (dòng 1: không thể chia cho 0; đổi giá trị vế phải); tại dòng 1 có 「0で割ることはできません。右辺の値を変更してください。」; các giá trị đã nhập còn giữ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| maximum | Thông báo vượt điểm tối đa: M=100; nhập điểm cố định N=120, bấm Lưu; đọc thông báo đầu vùng nhập/tại ô và giá trị còn giữ. | 1. Không lưu được. Đầu vùng nhập có 「基準点が対象の満点を超えています。対象の満点以下の値を入力してください。」 (điểm chuẩn vượt điểm tối đa của đối tượng; hãy nhập giá trị không vượt điểm tối đa); tại ô Điểm chuẩn（基準点） có 「対象の満点（100点）以下の値を入力してください。」 và dòng 「対象の満点：100点」 (điểm tối đa của đối tượng: 100); giá trị 120 còn giữ. |
| divide-zero | Thông báo chia cho 0: Nhập công thức dòng1 A÷0, bấm Lưu; đọc thông báo đầu vùng nhập/tại dòng và giá trị còn giữ. | 2. Không lưu được. Đầu vùng nhập có 「式1：0で割ることはできません。右辺の値を変更してください。」 (dòng 1: không thể chia cho 0; đổi giá trị vế phải); tại dòng 1 có 「0で割ることはできません。右辺の値を変更してください。」; các giá trị đã nhập còn giữ. |

### Flow: Nguồn trung bình và tỷ lệ nhóm

#### TC-RS-FUNC-015 — Quy trình vận hành dùng trung bình: tắt tự tổng hợp → nút xanh → nút cam

| Field | Value |
| --- | --- |
| Chức năng | Nguồn tổng hợp |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Thứ tự đánh giá tương đối” (AC-G25 «Thứ tự đánh giá tương đối»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) có cặp quy tắc phân nhánh theo trung bình 60. Điểm của nhóm HR1 đã đầy đủ. Không có bản chốt cho nguồn mặc định. Đăng nhập tài khoản có quyền chạy hàng loạt. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); cặp quy tắc phân nhánh theo trung bình 60, các lớp chủ nhiệm HR1, HR2, học sinh S01–S05 |
| Thao tác | 1. Thiết lập tổng hợp thứ hạng（順位集計設定）→ Thiết lập chi tiết（詳細設定）: đặt tự tổng hợp khi đăng ký điểm là Không thực hiện（実行しない）.<br>2. Ở Tổng hợp thành tích（成績集計）, chọn Khối 1, kỳ 1学期期末 (cuối kỳ học kỳ 1), bấm Thực hiện tổng hợp（集計実行）, chờ hoàn tất.<br>3. Bấm Thực hiện tính toán tự động（自動算出実行）, chờ hoàn tất.<br>4. Xem kết quả ở ba đầu ra.<br>5. Sau bước 3, xem lần chạy tổng hợp gần nhất hiển thị ở Tổng hợp thành tích（成績集計）. |
| Expected | 1. Sau bước 2 (chỉ nút xanh), kết quả đỏ chưa thay đổi.<br>2. Sau bước 3, mỗi ô của S01–S05 có kết quả theo nhánh đúng với `A` của tổng hợp vừa chạy.<br>3. Ba đầu ra hiển thị cùng kết quả mới.<br>4. (Theo tiêu chí nghiệm thu “Thứ tự đánh giá tương đối”) Bước 3 không tự chạy lại Thực hiện tổng hợp（集計実行） hay thêm lượt xét thứ hai, kể cả khi tính tự động làm đổi điểm dùng cho trung bình: lần chạy tổng hợp gần nhất vẫn là lần ở bước 2. Muốn dùng trung bình mới thì người dùng chạy lại quy trình. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. Sau bước 2 (chỉ nút xanh), kết quả đỏ chưa thay đổi.<br>2. Sau bước 3, mỗi ô của S01–S05 có kết quả theo nhánh đúng với `A` của tổng hợp vừa chạy.<br>3. Ba đầu ra hiển thị cùng kết quả mới.<br>4. (Theo tiêu chí nghiệm thu “Thứ tự đánh giá tương đối”) Bước 3 không tự chạy lại Thực hiện tổng hợp（集計実行） hay thêm lượt xét thứ hai, kể cả khi tính tự động làm đổi điểm dùng cho trung bình: lần chạy tổng hợp gần nhất vẫn là lần ở bước 2. Muốn dùng trung bình mới thì người dùng chạy lại quy trình. |

#### TC-RS-FUNC-034 — Nguồn của điều kiện áp dụng và nguồn của công thức lưu độc lập

| Field | Value |
| --- | --- |
| Chức năng | Nguồn tổng hợp |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Ba nguồn cùng Thiết lập tổng hợp thứ hạng（順位集計設定） và nhóm ホームルーム (lớp chủ nhiệm), khác Thời kỳ tổng hợp（集計対象時期）: P `A=60`; P2 `A=70`; Q `A=40`. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Quy tắc: điều kiện Trung bình（平均点） `≥50` dùng nguồn P; ngưỡng Công thức（計算式） `A×0.5` dùng nguồn Q; `&lt;`. S = 25 |
| Thao tác | 1. Lưu quy tắc, mở lại.<br>2. Chỉ đổi nguồn của điều kiện từ P sang P2, Lưu, mở lại.<br>3. Chạy nút cam.<br>4. Trên form, đổi Thời kỳ tổng hợp（集計対象時期） của nguồn điều kiện sang kỳ mà Thiết lập tổng hợp thứ hạng（順位集計設定） đang chọn vẫn hợp lệ; rồi đổi sang kỳ mà thiết lập đó không còn hợp lệ. Xem các ô chọn phụ thuộc sau mỗi lần đổi. |
| Expected | 1. Mỗi phần hiện đúng nguồn của mình (điều kiện: P; công thức: Q).<br>2. Điều kiện dùng P2; công thức vẫn dùng Q.<br>3. `70≥50` khớp; `T=40×0.5=20` → S=25 Không đỏ. Nếu công thức bị đổi theo P2 (`T=35`) hoặc dùng P (`T=30`) thì S=25 thành Đỏ — sai.<br>4. (PROPOSED) Chỉ lựa chọn phụ thuộc không còn hợp lệ bị xóa; lựa chọn còn hợp lệ được giữ; nguồn của công thức không đổi. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. Mỗi phần hiện đúng nguồn của mình (điều kiện: P; công thức: Q).<br>2. Điều kiện dùng P2; công thức vẫn dùng Q.<br>3. `70≥50` khớp; `T=40×0.5=20` → S=25 Không đỏ. Nếu công thức bị đổi theo P2 (`T=35`) hoặc dùng P (`T=30`) thì S=25 thành Đỏ — sai.<br>4. (PROPOSED) Chỉ lựa chọn phụ thuộc không còn hợp lệ bị xóa; lựa chọn còn hợp lệ được giữ; nguồn của công thức không đổi. |

#### TC-RS-FUNC-036 — Danh sách nhóm tham chiếu theo thiết lập tổng hợp hiện hữu

| Field | Value |
| --- | --- |
| Chức năng | Nguồn tổng hợp |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Trường A/2026 có thiết lập tổng hợp X（評点集計） (khối, lớp chủ nhiệm bật; lớp học tắt), nhóm tổng hợp thứ hạng “Toán I khối 1+2”, nhóm tổ hợp “Tổ hợp Toán”, nhóm môn học “Nhóm môn Toán”. Mở form thêm quy tắc của mục số nguyên (M=100) với điều kiện Trung bình（平均点） và ngưỡng Công thức（計算式） dùng trung bình. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: thiết lập tổng hợp X（評点集計）, thiết lập tổng hợp X đã bật thêm Lớp học（授業）, nhóm tổng hợp thứ hạng “Toán I khối 1+2”, nhóm tổ hợp “Tổ hợp Toán”, nhóm môn học “Nhóm môn Toán”; mục số nguyên (M=100); tài khoản giáo viên có quyền sửa mục, tài khoản có quyền chạy hàng loạt |
| Thao tác | 1. Mở form thêm rule cho mục số nguyên M=100, có điều kiện Trung bình（平均点） và ngưỡng Công thức（計算式）.<br>2. Dùng công tắc/nguồn riêng theo trường hợp, chọn kỳ và thiết lập tổng hợp trước khi mở danh sách nhóm.<br>3. Ghi các lựa chọn, lưu/mở lại và đối chiếu tên/ID của đúng nhóm nguồn. |
| Expected | 1. Trong ba loại cơ bản chỉ có Khối（学年） và Lớp chủ nhiệm（ホームルーム）; không có Lớp học（授業）. Có nhóm tổng hợp thứ hạng “Toán I khối 1+2”, nhóm tổ hợp “Tổ hợp Toán”, nhóm môn học “Nhóm môn Toán”, hiển thị bằng tên đã đặt.<br>2. Có thêm lựa chọn Lớp học（授業） trong cùng X; không phải tạo cấu hình tổng hợp mới để có loại này.<br>3. Không còn khối/lớp chủ nhiệm/lớp học; nhóm tổng hợp, tổ hợp, nhóm môn vẫn chọn được. Mở lại hiện đúng tên nhóm tổng hợp thứ hạng “Toán I khối 1+2” (đã lưu theo ID).<br>4. Chỉ có Khối（学年）; không hiện cố định đủ sáu loại, không có lựa chọn rỗng mang tên loại chưa cấu hình.<br>5. Nguồn điều kiện và nguồn công thức mở lại đúng lựa chọn riêng của từng phần. Form không có công tắc bật/tắt tổng hợp riêng của điểm đỏ, không có trường thứ hạng, tên hiển thị hay biểu đồ lấy từ màn công khai. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| switch-sequence | Danh sách thay đổi theo công tắc của X: Cùng X theo thứ tự: nguồn điều kiện chọn kỳ → Thiết lập tổng hợp thứ hạng（順位集計設定） X → Đối tượng tổng hợp（集計対象）. Ghi lựa chọn khi khối/lớp chủ nhiệm bật, lớp học tắt. Bật Lớp học（授業）, tổng hợp lại X và đọc danh sách. Sau đó tắt cả ba công tắc, chọn nhóm Toán I khối1+2, lưu/mở lại. | 1. Trong ba loại cơ bản chỉ có Khối（学年） và Lớp chủ nhiệm（ホームルーム）; không có Lớp học（授業）. Có nhóm tổng hợp thứ hạng “Toán I khối 1+2”, nhóm tổ hợp “Tổ hợp Toán”, nhóm môn học “Nhóm môn Toán”, hiển thị bằng tên đã đặt.<br>2. Có thêm lựa chọn Lớp học（授業） trong cùng X; không phải tạo cấu hình tổng hợp mới để có loại này.<br>3. Không còn khối/lớp chủ nhiệm/lớp học; nhóm tổng hợp, tổ hợp, nhóm môn vẫn chọn được. Mở lại hiện đúng tên nhóm tổng hợp thứ hạng “Toán I khối 1+2” (đã lưu theo ID).<br>5. Nguồn điều kiện và nguồn công thức mở lại đúng lựa chọn riêng của từng phần. Form không có công tắc bật/tắt tổng hợp riêng của điểm đỏ, không có trường thứ hạng, tên hiển thị hay biểu đồ lấy từ màn công khai. |
| grade-only | Chỉ có loại khối: Fixture trường/năm không có nhóm tổng hợp/tổ hợp/nhóm môn đã cấu hình, chỉ bật khối; chọn kỳ/thiết lập tổng hợp rồi mở danh sách Đối tượng tổng hợp. | 4. Chỉ có Khối（学年）; không hiện cố định đủ sáu loại, không có lựa chọn rỗng mang tên loại chưa cấu hình.<br>5. Nguồn điều kiện và nguồn công thức mở lại đúng lựa chọn riêng của từng phần. Form không có công tắc bật/tắt tổng hợp riêng của điểm đỏ, không có trường thứ hạng, tên hiển thị hay biểu đồ lấy từ màn công khai. |
| formula-source | Nguồn công thức khác nguồn điều kiện: Chuẩn bị/lưu nguồn điều kiện trước; ở nguồn công thức chọn Thiết lập tổng hợp thứ hạng → Đối tượng tổng hợp, chọn nhóm **khác** nguồn điều kiện; lưu/mở lại cả hai phần. | 5. Nguồn điều kiện và nguồn công thức mở lại đúng lựa chọn riêng của từng phần. Form không có công tắc bật/tắt tổng hợp riêng của điểm đỏ, không có trường thứ hạng, tên hiển thị hay biểu đồ lấy từ màn công khai. |

#### TC-RS-BR-006 — Nhóm tham chiếu tách khỏi đối tượng áp dụng và danh sách đang lọc ở đầu ra

| Field | Value |
| --- | --- |
| Chức năng | Nguồn tổng hợp |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Quy tắc chỉ áp dụng cho lớp G-A (bộ lọc lớp), công thức `A×0.5`, nguồn có nhóm tham chiếu là một nhóm tổng hợp chứa cả G-A và G-B, `A=50` (G-A riêng có trung bình 40). Đã xét: `T=25`. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Nguồn theo nhóm tổng hợp chứa G-A và G-B (không dùng nhóm theo khối vì G-A thuộc khối 1, G-B thuộc khối 2); các lớp học phần G-A, G-B, G-C |
| Thao tác | 1. Xem kết quả của học sinh G-A điểm 24 (Đỏ) và 26 (Không đỏ).<br>2. Chạy trích xuất chỉ lọc lớp G-A.<br>3. Chạy lại xét. |
| Expected | Kết quả vẫn dùng `T=25` (từ `A=50` của cả nhóm). Lọc lớp ở đầu ra hoặc đối tượng chỉ G-A không làm trung bình thành 40 (`T=20`). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Kết quả vẫn dùng `T=25` (từ `A=50` của cả nhóm). Lọc lớp ở đầu ra hoặc đối tượng chỉ G-A không làm trung bình thành 40 (`T=20`). |

#### TC-RS-BR-007 — Nguồn: bản đã chốt được ưu tiên hơn tổng hợp mới hơn

| Field | Value |
| --- | --- |
| Chức năng | Nguồn tổng hợp |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn” (AC-G13 «Ưu tiên bản chốt và xử lý thiếu nguồn»); tiêu chí nghiệm thu “Phạm vi từng đợt” (AC-G40 «Phạm vi từng đợt»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Có bản tổng hợp đã chốt (trung bình 49.99) (chốt, `A=49.99`) và bản tổng hợp mới nhất chưa chốt (trung bình 62) (mới hơn, `A=62`) cùng phạm vi. mục số nguyên (M=100) có cặp quy tắc phân nhánh theo trung bình 60. Dummy data (dữ liệu giả cho bản tổng hợp đã chốt). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); bản tổng hợp đã chốt (trung bình 49.99), bản tổng hợp mới nhất chưa chốt (trung bình 62), cặp quy tắc phân nhánh theo trung bình 60; học sinh điểm 24 và 26 |
| Thao tác | 1. Chạy nút cam.<br>2. Xem kết quả. |
| Expected | Dùng `A=49.99` → nhánh ưu tiên 2 (`A&lt;60`), `T=24.995` → điểm 24 Đỏ, điểm 26 Không đỏ. Không dùng `A=62` (sẽ vào nhánh `A≥60`, `T=30`, điểm 26 Đỏ). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Dùng `A=49.99` → nhánh ưu tiên 2 (`A&lt;60`), `T=24.995` → điểm 24 Đỏ, điểm 26 Không đỏ. Không dùng `A=62` (sẽ vào nhánh `A≥60`, `T=30`, điểm 26 Đỏ). |

#### TC-RS-BR-008 — Nguồn: chưa có bản chốt → dùng tổng hợp hoàn tất mới nhất cùng phạm vi

| Field | Value |
| --- | --- |
| Chức năng | Nguồn tổng hợp |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn” (AC-G13 «Ưu tiên bản chốt và xử lý thiếu nguồn»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Chỉ có bản tổng hợp mới nhất chưa chốt (trung bình 62) (`A=62`), không có bản chốt; có thêm một tổng hợp cũ hơn `A=55` và một tổng hợp khác kỳ mới hơn `A=40`. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: bản tổng hợp mới nhất chưa chốt (trung bình 62), cặp quy tắc phân nhánh theo trung bình 60 |
| Thao tác | 1. Chạy nút cam.<br>2. Xem kết quả học sinh điểm 26 và 29.<br>3. Bắt đầu một lượt tổng hợp mới cùng phạm vi sau bản tổng hợp mới nhất chưa chốt (trung bình 62) nhưng chưa hoàn tất (đang chạy hoặc thất bại); chạy lại nút cam. |
| Expected | 1–2. Dùng `A=62` (mới nhất, cùng kỳ) → nhánh `A≥60`, `T=30` → 26 và 29 Đỏ. Không dùng bản cũ hơn hoặc bản khác kỳ.<br><br>3. Vẫn dùng `A=62` của bản hoàn tất mới nhất; không đọc lượt tổng hợp chưa hoàn tất. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| completed | Bản mới nhất hoàn tất: Dùng bản hoàn tất mới nhất cùng kỳ A=62; chạy nút cam, đọc điểm26/29. | Bản hoàn tất mới nhất cùng kỳ **A=62** → nhánh **A≥60,T=30**: điểm **26 và 29 Đỏ**. Không dùng bản cũ A=55 hoặc bản khác kỳ A=40. |
| running | Bản mới đang chạy: Sau bản A=62, bắt đầu tổng hợp mới cùng scope nhưng còn đang chạy; chạy lại nút cam. | Khi lượt tổng hợp mới đang chạy, vẫn dùng bản **hoàn tất mới nhất A=62**, không đọc nguồn chưa hoàn tất → **26 và 29 Đỏ** theo **T=30**; không dùng bản cũ/khác kỳ. |
| failed | Bản mới thất bại: Sau bản A=62, tổng hợp mới cùng scope thất bại; chạy lại nút cam. | Khi lượt tổng hợp mới thất bại, vẫn dùng bản **hoàn tất mới nhất A=62**, không đọc nguồn chưa hoàn tất → **26 và 29 Đỏ** theo **T=30**; không dùng bản cũ/khác kỳ. |

#### TC-RS-BR-009 — Nguồn: bản đã chốt thiếu dữ liệu → Chưa xét được, không chuyển sang bản thường

| Field | Value |
| --- | --- |
| Chức năng | Nguồn tổng hợp |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn” (AC-G13 «Ưu tiên bản chốt và xử lý thiếu nguồn»); tiêu chí nghiệm thu “Phạm vi từng đợt” (AC-G40 «Phạm vi từng đợt»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Có bản đã chốt thiếu dữ liệu của ô (chốt, thiếu dòng cho môn/mục) và bản tổng hợp mới nhất chưa chốt (trung bình 62) (thường, đầy đủ). cặp quy tắc phân nhánh theo trung bình 60. Ô trước đó Đỏ. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: bản đã chốt thiếu dữ liệu của ô, bản tổng hợp mới nhất chưa chốt (trung bình 62), cặp quy tắc phân nhánh theo trung bình 60 |
| Thao tác | 1. Chạy nút cam.<br>2. Xem kết quả và ba đầu ra. |
| Expected | Chưa xét được; ngừng dùng dấu/lọc đỏ cũ; điểm giữ nguyên. Không dùng bản tổng hợp mới nhất chưa chốt (trung bình 62) hay bản khác kỳ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Chưa xét được; ngừng dùng dấu/lọc đỏ cũ; điểm giữ nguyên. Không dùng bản tổng hợp mới nhất chưa chốt (trung bình 62) hay bản khác kỳ. |

#### TC-RS-BR-010 — Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác

| Field | Value |
| --- | --- |
| Chức năng | Nguồn tổng hợp |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn” (AC-G13 «Ưu tiên bản chốt và xử lý thiếu nguồn»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Công thức `A×0.5` với nguồn nguồn chưa có kết quả tổng hợp (chưa tổng hợp). Ô trước đó Đỏ. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: nguồn chưa có kết quả tổng hợp |
| Thao tác | 1. Chạy nút cam.<br>2. Xem kết quả. |
| Expected | Chưa xét được; `A` không bị coi là 0 (nếu coi 0 thì `T=0`, mọi điểm dương Không đỏ); không dùng nhóm khác; ngừng dấu đỏ cũ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Chưa xét được; `A` không bị coi là 0 (nếu coi 0 thì `T=0`, mọi điểm dương Không đỏ); không dùng nhóm khác; ngừng dấu đỏ cũ. |

#### TC-RS-BR-011 — Nguồn chỉ cần khi quy tắc đọc trung bình/tỷ lệ nhóm

| Field | Value |
| --- | --- |
| Chức năng | Nguồn tổng hợp |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05 «Đối tượng áp dụng và nhu cầu nguồn»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Không có kết quả tổng hợp nào (nguồn chưa có kết quả tổng hợp). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30), quy tắc tỷ lệ 30%, nguồn chưa có kết quả tổng hợp, học sinh S01 (điểm 29) |
| Thao tác | 1. Dùng nguồn chưa có kết quả tổng hợp; chỉ để một rule của trường hợp đang chạy.<br>2. Đăng ký S01=29 và đọc trạng thái, nguồn/ngưỡng đã dùng. |
| Expected | 1. Đỏ (không cần nguồn).<br>2. Đỏ (`M=100`, `T=30`; không cần nguồn).<br>3. Chưa xét được; không bỏ điều kiện để áp 30 cho mọi học sinh. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| fixed | Cố định không cần nguồn: Chỉ có rule cố định30,&lt;,Toàn bộ/không điều kiện trung bình; nguồn chưa có tổng hợp; đăng ký S01=29. | 1. Đỏ (không cần nguồn). |
| ratio | Tỷ lệ không cần trung bình: Chỉ có rule tỷ lệ30%,M=100; nguồn chưa có tổng hợp; đăng ký S01=29. | 2. Đỏ (`M=100`, `T=30`; không cần nguồn). |
| average-condition | Điều kiện cần trung bình: Chỉ có rule cố định30,&lt;,điều kiện A≥60; nguồn chưa có tổng hợp; đăng ký S01=29. | 3. Chưa xét được; không bỏ điều kiện để áp 30 cho mọi học sinh. |

#### TC-RS-BR-028 — Nhóm tham chiếu có lớp khác M không gây lỗi dừng xử lý

| Field | Value |
| --- | --- |
| Chức năng | Nguồn tổng hợp |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Kế thừa tỷ lệ nhóm” (AC-G15 «Kế thừa tỷ lệ nhóm»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | nhóm tham chiếu gồm G-A có `M=20` và G-B có `M=100`; rule dùng `R (tỷ lệ nhóm)` với điều kiện `R≥65%`; P1 thuộc phạm vi được xét ở G-B (`M=100`). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: G-A có `10/20`, G-B có `80/100`; fixture nguồn đã chuẩn bị/quan sát phải ghi rõ giá trị `R` thực sự được reader sử dụng. Với nguồn tổng điểm/tổng M, fixture này cho `R=75%`; P1 có `S=60`, ngưỡng cố định `T=70` hợp lệ với `M=100`. |
| Thao tác | 1. Lưu quy tắc theo tỷ lệ điểm của nhóm từ 65% với nguồn là nhóm trên; ghi source snapshot/reader và xác nhận `R=75%` đã được chuẩn bị.<br>2. Chạy nút xanh rồi nút cam cho phạm vi.<br>3. Xem màn kết quả xử lý và kết quả P1. |
| Expected | 1. Lưu được; không bị chặn vì nhóm có lớp khác M.<br><br>2–3. Xử lý hoàn tất, không lỗi dừng do khác M. Ghi lại trong evidence nguồn/bản snapshot và `R` thực sự được reader dùng; nếu reader dùng nguồn tổng điểm/tổng M thì fixture này cho `R=(10+80)/(20+100)×100=75%`, khớp `≥65%`, `T=70` và P1 Đỏ. Không dùng phép tính trong case để áp đặt một cách tổng hợp mới; không dùng trung bình tỷ lệ cá nhân làm oracle thay cho nguồn hiện hữu. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. Lưu được; không bị chặn vì nhóm có lớp khác M.<br><br>2–3. Xử lý hoàn tất, không lỗi dừng do khác M. Ghi lại trong evidence nguồn/bản snapshot và `R` thực sự được reader dùng; nếu reader dùng nguồn tổng điểm/tổng M thì fixture này cho `R=(10+80)/(20+100)×100=75%`, khớp `≥65%`, `T=70` và P1 Đỏ. Không dùng phép tính trong case để áp đặt một cách tổng hợp mới; không dùng trung bình tỷ lệ cá nhân làm oracle thay cho nguồn hiện hữu. |

#### TC-RS-BR-034 — Bật tự tổng hợp khi đăng ký: hệ thống không chặn; quy tắc độc lập với trung bình vẫn xét

| Field | Value |
| --- | --- |
| Chức năng | Nguồn tổng hợp |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23 «Bao phủ đường đăng ký và chạy lại»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Tự tổng hợp khi đăng ký = Thực hiện（実行する）. mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30); mục số thập phân (M=100) có công thức `A×0.5`. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100), mục số thập phân (M=100); quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29), học sinh S09 (mục số thập phân 29.5) |
| Thao tác | 1. Lưu quy tắc công thức (không bị chặn vì tự tổng hợp đang bật).<br>2. Đặt tự tổng hợp = Không thực hiện（実行しない）, đăng ký S01=29. |
| Expected | 1. Lưu được; không có ràng buộc hệ thống buộc tắt.<br>2. S01 vẫn được xét khi đăng ký → Đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. Lưu được; không có ràng buộc hệ thống buộc tắt.<br>2. S01 vẫn được xét khi đăng ký → Đỏ. |

#### TC-RS-BR-038 — Nhóm lớp học（授業）: dùng kết quả tổng hợp của đúng lớp chứa ô đang xét

| Field | Value |
| --- | --- |
| Chức năng | Nguồn tổng hợp |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | thiết lập tổng hợp X đã bật thêm Lớp học（授業） (X đã bật lớp học và đã tổng hợp). S11 học cả G-A và G-D; trong X trung bình lớp G-A = 40, G-D = 70. Quy tắc trên mục số nguyên (M=100): Toàn bộ đối tượng, ngưỡng Công thức（計算式） `A×0.5`, `&lt;`; nguồn công thức = X / Lớp học（授業）. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: thiết lập tổng hợp X đã bật thêm Lớp học（授業）, học sinh S11 học hai lớp Toán I (G-A, G-D); mục số nguyên (M=100); S11 có điểm 25 ở cả G-A và G-D |
| Thao tác | 1. Chạy nút cam cho G-A và G-D.<br>2. Xem kết quả hai ô của S11 trên trích xuất. |
| Expected | - Ô ở G-A: `T=40×0.5=20` → 25 Không đỏ.<br>- Ô ở G-D: `T=70×0.5=35` → 25 Đỏ.<br>- Không ô nào dùng kết quả của lớp kia, của khối/lớp chủ nhiệm, hay trung bình chung của môn. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | - Ô ở G-A: `T=40×0.5=20` → 25 Không đỏ.<br>- Ô ở G-D: `T=70×0.5=35` → 25 Đỏ.<br>- Không ô nào dùng kết quả của lớp kia, của khối/lớp chủ nhiệm, hay trung bình chung của môn. |

#### TC-RS-BR-039 — Nhóm môn học（科目グループ）: dùng cấu hình riêng của môn hoặc default đã lưu; thiếu/sai thì Chưa xét được

| Field | Value |
| --- | --- |
| Chức năng | Nguồn tổng hợp |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu»); tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn” (AC-G13 «Ưu tiên bản chốt và xử lý thiếu nguồn»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | nhóm môn học “Nhóm môn Toán” có cấu hình riêng cho Toán I（数学Ⅰ） và default. Quy tắc trên mục số nguyên (M=100) dùng nguồn công thức = X / nhóm môn học “Nhóm môn Toán”, ngưỡng `A×0.5`, `&lt;`. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: nhóm môn học “Nhóm môn Toán”; mục số nguyên (M=100); S01 = 25 |
| Thao tác | 1. Chạy nút cam; xem S01 và nhóm được dùng.<br>2. Xóa cấu hình riêng của Toán I (để môn rơi về default); chạy lại; xem.<br>3. Làm default thiếu hoặc trỏ tới cấu hình không hợp lệ (biến thể (b) của nhóm môn học “Nhóm môn Toán”); chạy lại; xem trạng thái và thông báo. |
| Expected | 1. Dùng kết quả của nhóm theo cấu hình riêng của Toán I.<br>2. Dùng kết quả của nhóm theo default đã lưu.<br>3. S01 Chưa xét được; không thay bằng nhóm khác, bằng 0 hay bằng kết quả trước; thông báo/tiến độ tách phần chưa xét được. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| private | Nguồn riêng: Dùng cấu hình riêng Toán I trong Nhóm môn Toán; chạy nút cam và đọc nhóm được dùng. | 1. Dùng kết quả của nhóm theo cấu hình riêng của Toán I. |
| default | Nguồn mặc định: Xóa cấu hình riêng Toán I để rơi về default đã lưu; chạy lại. | 2. Dùng kết quả của nhóm theo default đã lưu. |
| default-missing | Nguồn mặc định thiếu: Dựng default thiếu theo fixture; chạy lại và đọc trạng thái/thông báo. | 3. S01 Chưa xét được; không thay bằng nhóm khác, bằng 0 hay bằng kết quả trước; thông báo/tiến độ tách phần chưa xét được. |
| default-invalid | Nguồn mặc định không hợp lệ: Dựng default không hợp lệ theo fixture; chạy lại và đọc trạng thái/thông báo. | 3. S01 Chưa xét được; không thay bằng nhóm khác, bằng 0 hay bằng kết quả trước; thông báo/tiến độ tách phần chưa xét được. |

#### TC-RS-BR-040 — Loại nhóm được bật nhưng chưa có kết quả, hoặc tham chiếu đã lưu không còn hợp lệ → Chưa xét được, không tự đổi nhóm

| Field | Value |
| --- | --- |
| Chức năng | Nguồn tổng hợp |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn” (AC-G13 «Ưu tiên bản chốt và xử lý thiếu nguồn»); tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại” (AC-G21 «Giữ kết quả trước khi chạy lại và xóa rule cuối»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Quy tắc trên mục số nguyên (M=100) có điều kiện Trung bình `A≥50`, cố định 30 `&lt;`; S01 = 29, đang Đỏ theo nguồn X / Lớp học（授業） đã tổng hợp. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: thiết lập tổng hợp X đã bật thêm Lớp học（授業）, nhóm tổng hợp thứ hạng “Toán I khối 1+2”; mục số nguyên (M=100); học sinh S01 (điểm 29) |
| Thao tác | 1. (a) Tạo quy tắc mới dùng nhóm tổng hợp nhóm tổng hợp thứ hạng “Toán I khối 1+2” nhưng X chưa chạy tổng hợp cho nhóm này; chạy nút cam; xem S01.<br>2. (b) Quy tắc đang dùng X / Lớp học: tắt công tắc Lớp học（授業） của trường/năm; mở danh sách quy tắc và xem S01 (chưa chạy).<br>3. Chạy nút cam; xem S01.<br>4. (c) Xóa nhóm nhóm tổng hợp thứ hạng “Toán I khối 1+2” đang được quy tắc khác tham chiếu; chạy nút cam; xem ô dùng quy tắc đó. |
| Expected | 1. S01 Chưa xét được (thiếu nguồn); lựa chọn nhóm tồn tại không có nghĩa đã có dữ liệu.<br>2. Chỉ đổi cấu hình: S01 vẫn giữ kết quả Đỏ trước (không bị xóa ngay).<br>3. S01 Chưa xét được; không tự chuyển sang khối/lớp chủ nhiệm hoặc nhóm khác, không dùng quy tắc ưu tiên thấp hơn, không dùng kết quả cũ làm hiện hành.<br>4. Ô chịu ảnh hưởng Chưa xét được; không âm thầm đổi loại/ID nhóm đã lưu. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| missing-source | Nguồn mới thiếu: Chọn nhóm Toán I khối1+2 nhưng X chưa tổng hợp nhóm này; chạy nút cam. | Nhóm đã chọn tồn tại nhưng chưa có dữ liệu nguồn: **S01 Chưa xét được**; không coi lựa chọn nhóm là dữ liệu đã tổng hợp. |
| disabled-group | Nhóm bị tắt: Từ baseline S01=29 Đỏ, tắt Lớp học（授業）; đọc trước chạy, rồi chạy nút cam và đọc lại. | Sau khi chỉ tắt Lớp học（授業） mà chưa chạy lại, **S01 giữ Đỏ trước đó**. Sau nút cam: **Chưa xét được**; không chuyển sang khối/lớp chủ nhiệm/nhóm khác, không xuống rule thấp hơn hoặc dùng kết quả cũ làm hiện hành. |
| deleted-group | Nhóm bị xóa: Xóa nhóm Toán I khối1+2 đang được rule tham chiếu; chạy nút cam và đọc ô chịu ảnh hưởng. | Sau khi xóa nhóm được tham chiếu và chạy lại, ô chịu ảnh hưởng **Chưa xét được**; không âm thầm đổi loại/ID nhóm đã lưu. |

#### TC-RS-VAL-024 — Quy tắc dùng trung bình/tỷ lệ nhóm không lưu được khi thiếu nguồn

| Field | Value |
| --- | --- |
| Chức năng | Nguồn tổng hợp |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05 «Đối tượng áp dụng và nhu cầu nguồn»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Màn thêm quy tắc của mục số nguyên (M=100). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); (a) Điều kiện trung bình `A≥60`, ngưỡng cố định 30, bỏ trống một phần hoặc toàn bộ nguồn (thời kỳ, thiết lập tổng hợp, nhóm tham chiếu); (b) điều kiện tỷ lệ nhóm ≥65%, nguồn bỏ trống; (c) Toàn bộ đối tượng, ngưỡng Công thức tính（計算式） `A×0.5`, nguồn của công thức bỏ trống |
| Thao tác | 1. Mở form/request lưu quy tắc của mục số nguyên M=100 bằng tài khoản được sửa mục.<br>2. Giữ các phần hợp lệ, chỉ thay phần nguồn nêu ở trường hợp đang chạy; gửi riêng từng lượt.<br>3. Đọc response và mở lại danh sách để kiểm cấu hình có bị đổi hay lộ dữ liệu ngoài quyền không. |
| Expected | Cả ba biến thể không lưu được; có thông báo thiếu nguồn. Không lưu quy tắc với điều kiện bị bỏ đi hoặc nguồn trống; danh sách quy tắc không đổi. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| condition-period | Điều kiện trung bình thiếu kỳ: Điều kiện trung bình A≥60, cố định30; chỉ để trống Thời kỳ tổng hợp（集計対象時期）; bấm Lưu rồi đọc response/danh sách. Các phần còn lại dùng fixture của trường hợp. | Không lưu được vì thiếu nguồn của trường hợp này; có thông báo thiếu nguồn. Không bỏ điều kiện để lưu hoặc lưu nguồn trống; danh sách rule không đổi. |
| condition-setting | Điều kiện trung bình thiếu thiết lập: Điều kiện trung bình A≥60, cố định30; chỉ để trống Thiết lập tổng hợp thứ hạng（順位集計設定）; bấm Lưu rồi đọc response/danh sách. Các phần còn lại dùng fixture của trường hợp. | Không lưu được vì thiếu nguồn của trường hợp này; có thông báo thiếu nguồn. Không bỏ điều kiện để lưu hoặc lưu nguồn trống; danh sách rule không đổi. |
| condition-group | Điều kiện trung bình thiếu nhóm: Điều kiện trung bình A≥60, cố định30; chỉ để trống nhóm tham chiếu; bấm Lưu rồi đọc response/danh sách. Các phần còn lại dùng fixture của trường hợp. | Không lưu được vì thiếu nguồn của trường hợp này; có thông báo thiếu nguồn. Không bỏ điều kiện để lưu hoặc lưu nguồn trống; danh sách rule không đổi. |
| condition-all | Điều kiện trung bình thiếu toàn bộ: Điều kiện trung bình A≥60, cố định30; để trống toàn bộ bộ nguồn; bấm Lưu rồi đọc response/danh sách. Các phần còn lại dùng fixture của trường hợp. | Không lưu được vì thiếu nguồn của trường hợp này; có thông báo thiếu nguồn. Không bỏ điều kiện để lưu hoặc lưu nguồn trống; danh sách rule không đổi. |
| ratio-all | Điều kiện tỷ lệ thiếu nguồn: Điều kiện tỷ lệ nhóm ≥65%; để trống bộ nguồn của điều kiện; bấm Lưu rồi đọc response/danh sách. Các phần còn lại dùng fixture của trường hợp. | Không lưu được vì thiếu nguồn của trường hợp này; có thông báo thiếu nguồn. Không bỏ điều kiện để lưu hoặc lưu nguồn trống; danh sách rule không đổi. |
| formula-all | Công thức thiếu nguồn: Toàn bộ đối tượng; ngưỡng công thức A×0.5; để trống bộ nguồn của công thức; bấm Lưu rồi đọc response/danh sách. Các phần còn lại dùng fixture của trường hợp. | Không lưu được vì thiếu nguồn của trường hợp này; có thông báo thiếu nguồn. Không bỏ điều kiện để lưu hoặc lưu nguồn trống; danh sách rule không đổi. |

#### TC-RS-VAL-025 — Server từ chối lưu nhóm tham chiếu không khả dụng hoặc ngoài trường/năm

| Field | Value |
| --- | --- |
| Chức năng | Nguồn tổng hợp |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | thiết lập tổng hợp X（評点集計） (lớp học tắt). Công cụ sửa request (DevTools/proxy) trên môi trường test. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: thiết lập tổng hợp X（評点集計）; ID nhóm tổng hợp của trường B (trường B (trường khác)); ID nhóm tổng hợp của năm khác; mục số nguyên (M=100); tài khoản giáo viên có quyền sửa mục |
| Thao tác | 1. Mở form/request lưu quy tắc của mục số nguyên M=100 bằng tài khoản được sửa mục.<br>2. Giữ các phần hợp lệ, chỉ thay phần nguồn nêu ở trường hợp đang chạy; gửi riêng từng lượt.<br>3. Đọc response và mở lại danh sách để kiểm cấu hình có bị đổi hay lộ dữ liệu ngoài quyền không. |
| Expected | Cả bốn biến thể bị từ chối; không lưu quy tắc; danh sách quy tắc không đổi; không trả về tên/dữ liệu của trường hay năm khác. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| condition-disabled | Điều kiện nhóm tắt: Tài khoản giáo viên có quyền sửa mục số nguyên M=100 của trường A; từ request lưu hợp lệ, sửa **nguồn của điều kiện**: chọn nguồn loại **Lớp học（授業）** khi công tắc lớp học đang tắt. Gửi request riêng, đọc response và danh sách; không tự dựng endpoint/ID. | Nguồn của trường hợp này bị từ chối; không lưu rule, danh sách rule không đổi; không trả tên/dữ liệu của trường hoặc năm khác. |
| condition-school | Điều kiện sai trường: Tài khoản giáo viên có quyền sửa mục số nguyên M=100 của trường A; từ request lưu hợp lệ, sửa **nguồn của điều kiện**: thay ID nhóm tổng hợp bằng ID thuộc **trường B**. Gửi request riêng, đọc response và danh sách; không tự dựng endpoint/ID. | Nguồn của trường hợp này bị từ chối; không lưu rule, danh sách rule không đổi; không trả tên/dữ liệu của trường hoặc năm khác. |
| condition-year | Điều kiện sai năm: Tài khoản giáo viên có quyền sửa mục số nguyên M=100 của trường A; từ request lưu hợp lệ, sửa **nguồn của điều kiện**: thay ID nhóm tổng hợp bằng ID thuộc **năm khác**. Gửi request riêng, đọc response và danh sách; không tự dựng endpoint/ID. | Nguồn của trường hợp này bị từ chối; không lưu rule, danh sách rule không đổi; không trả tên/dữ liệu của trường hoặc năm khác. |
| condition-missing | Điều kiện nhóm không tồn tại: Tài khoản giáo viên có quyền sửa mục số nguyên M=100 của trường A; từ request lưu hợp lệ, sửa **nguồn của điều kiện**: dùng ID **Nhóm môn học（科目グループ） không tồn tại**. Gửi request riêng, đọc response và danh sách; không tự dựng endpoint/ID. | Nguồn của trường hợp này bị từ chối; không lưu rule, danh sách rule không đổi; không trả tên/dữ liệu của trường hoặc năm khác. |
| formula-disabled | Công thức nhóm tắt: Tài khoản giáo viên có quyền sửa mục số nguyên M=100 của trường A; từ request lưu hợp lệ, sửa **nguồn của công thức**: chọn nguồn loại **Lớp học（授業）** khi công tắc lớp học đang tắt. Gửi request riêng, đọc response và danh sách; không tự dựng endpoint/ID. | Nguồn của trường hợp này bị từ chối; không lưu rule, danh sách rule không đổi; không trả tên/dữ liệu của trường hoặc năm khác. |
| formula-school | Công thức sai trường: Tài khoản giáo viên có quyền sửa mục số nguyên M=100 của trường A; từ request lưu hợp lệ, sửa **nguồn của công thức**: thay ID nhóm tổng hợp bằng ID thuộc **trường B**. Gửi request riêng, đọc response và danh sách; không tự dựng endpoint/ID. | Nguồn của trường hợp này bị từ chối; không lưu rule, danh sách rule không đổi; không trả tên/dữ liệu của trường hoặc năm khác. |
| formula-year | Công thức sai năm: Tài khoản giáo viên có quyền sửa mục số nguyên M=100 của trường A; từ request lưu hợp lệ, sửa **nguồn của công thức**: thay ID nhóm tổng hợp bằng ID thuộc **năm khác**. Gửi request riêng, đọc response và danh sách; không tự dựng endpoint/ID. | Nguồn của trường hợp này bị từ chối; không lưu rule, danh sách rule không đổi; không trả tên/dữ liệu của trường hoặc năm khác. |
| formula-missing | Công thức nhóm không tồn tại: Tài khoản giáo viên có quyền sửa mục số nguyên M=100 của trường A; từ request lưu hợp lệ, sửa **nguồn của công thức**: dùng ID **Nhóm môn học（科目グループ） không tồn tại**. Gửi request riêng, đọc response và danh sách; không tự dựng endpoint/ID. | Nguồn của trường hợp này bị từ chối; không lưu rule, danh sách rule không đổi; không trả tên/dữ liệu của trường hoặc năm khác. |

#### TC-RS-CALC-026 — Mẫu số trung bình khi có học sinh bị loại khỏi xếp hạng

| Field | Value |
| --- | --- |
| Chức năng | Nguồn tổng hợp |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14 «Giá trị thô từ cùng tập dữ liệu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | nhóm có học sinh bị loại khỏi xếp hạng; công thức `A×0.5`, `&lt;`. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: nhóm có học sinh bị loại khỏi xếp hạng; S = 22 |
| Thao tác | Chạy nút xanh rồi nút cam; ghi `A` đọc được. |
| Expected | `A = (60+40+20)/3 = 40` (mẫu số là số người có điểm của cùng bản) → `T=20` → S=22 Không đỏ. Nếu hệ thống dùng số người thuộc xếp hạng (`A=100/2=50`, `T=25` → Đỏ) là sai. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | `A = (60+40+20)/3 = 40` (mẫu số là số người có điểm của cùng bản) → `T=20` → S=22 Không đỏ. Nếu hệ thống dùng số người thuộc xếp hạng (`A=100/2=50`, `T=25` → Đỏ) là sai. |

#### TC-RS-CALC-027 — Trung bình riêng cho từng đơn vị

| Field | Value |
| --- | --- |
| Chức năng | Nguồn tổng hợp |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 5.5 “Chọn bản nguồn”; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Blocked |
| Gap | G-PREP-TC-RS-CALC-027 |
| Cấu hình | mục điểm đơn vị (đơn vị U1 có M riêng 40) có công thức `A×0.5`, `&lt;`. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục điểm đơn vị (đơn vị U1 có M riêng 40); trung bình riêng theo đơn vị (U1=40, U2=70) (U1 `A=40`, U2 `A=70`); S06 U1 = 25, U2 = 30 |
| Thao tác | Chạy nút xanh rồi nút cam. |
| Expected | Kỳ vọng theo đặc tả v2: U1 `T=20` → 25 Không đỏ; U2 `T=35` → 30 Đỏ. Nguồn trung bình theo đơn vị chưa tích hợp (đặc tả v2 mục 13.1): nếu không tách được thì ghi nhận, không đánh PASS. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Kỳ vọng theo đặc tả v2: U1 `T=20` → 25 Không đỏ; U2 `T=35` → 30 Đỏ. Nguồn trung bình theo đơn vị chưa tích hợp (đặc tả v2 mục 13.1): nếu không tách được thì ghi nhận, không đánh PASS. |

#### TC-RS-CALC-031 — Nguồn không có mẫu số hợp lệ (tổng điểm tối đa 0, số người có điểm 0) → Chưa xét được

| Field | Value |
| --- | --- |
| Chức năng | Nguồn tổng hợp |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14 «Giá trị thô từ cùng tập dữ liệu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Quy tắc 1: quy tắc theo tỷ lệ điểm của nhóm từ 65% (điều kiện tỷ lệ nhóm). Quy tắc 2 (mục khác): công thức `A×0.5`. Cách tạo dữ liệu: hỏi team dev khi chuẩn bị. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc theo tỷ lệ điểm của nhóm từ 65%; (a) Bản tổng hợp của nhóm có tổng điểm tối đa = 0; (b) bản tổng hợp tồn tại nhưng không học sinh nào có điểm; S01 = 29 |
| Thao tác | Với từng nguồn: chạy nút xanh (nếu cần) rồi nút cam; xem kết quả S01. |
| Expected | (a) Điều kiện tỷ lệ nhóm không xác định được → Chưa xét được; không coi `R=0` là không khớp để thành Không áp dụng hay chuyển xuống ưu tiên thấp hơn.<br><br>(b) `A` không xác định được → Chưa xét được; không coi `A=0` (nếu coi 0 thì `T=0`, S01 Không đỏ — sai).<br><br>Cả hai: ngừng dấu đỏ cũ; không lấy nguồn khác. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| zero-maximum | Mẫu số tỷ lệ nhóm bằng 0: Rule điều kiện tỷ lệ nhóm≥65%; bản tổng hợp có tổng điểm tối đa=0, S01=29. Chuẩn bị nguồn qua đường team xác minh; chạy xanh nếu cần rồi cam. | (a) Điều kiện tỷ lệ nhóm không xác định được → Chưa xét được; không coi `R=0` là không khớp để thành Không áp dụng hay chuyển xuống ưu tiên thấp hơn.<br>Cả hai: ngừng dấu đỏ cũ; không lấy nguồn khác. |
| zero-count | Không ai có điểm trong nguồn: Rule công thức A×0.5; bản tổng hợp tồn tại nhưng số học sinh có điểm=0, S01=29. Chuẩn bị nguồn qua đường team xác minh; chạy xanh nếu cần rồi cam. | (b) `A` không xác định được → Chưa xét được; không coi `A=0` (nếu coi 0 thì `T=0`, S01 Không đỏ — sai).<br>Cả hai: ngừng dấu đỏ cũ; không lấy nguồn khác. |

#### TC-RS-CALC-032 — Tỷ lệ nhóm: tử số và mẫu số lấy cùng tập đóng góp

| Field | Value |
| --- | --- |
| Chức năng | Nguồn tổng hợp |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14 «Giá trị thô từ cùng tập dữ liệu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | quy tắc theo tỷ lệ điểm của nhóm từ 65% là quy tắc duy nhất. Nhóm tham chiếu có 3 học sinh: 60/100, 80/100 và một học sinh chưa có điểm (M=100). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc theo tỷ lệ điểm của nhóm từ 65%; S = 60 |
| Thao tác | 1. Chạy nút xanh; ghi tổng điểm và tổng điểm tối đa hiển thị ở kết quả tổng hợp.<br>2. Chạy nút cam; xem kết quả S=60. |
| Expected | 1. Tổng điểm và tổng điểm tối đa lấy cùng tập học sinh có điểm theo cấu hình tổng hợp.<br>2. Với cấu hình tổng hợp không tính học sinh chưa có điểm: `R=140/200×100=70%` → khớp `≥65%` → `T=70` → S=60 Đỏ. Ghép tổng điểm của 2 người với tổng tối đa của 3 người (`140/300=46.7%` → Không áp dụng) là sai. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. Tổng điểm và tổng điểm tối đa lấy cùng tập học sinh có điểm theo cấu hình tổng hợp.<br>2. Với cấu hình tổng hợp không tính học sinh chưa có điểm: `R=140/200×100=70%` → khớp `≥65%` → `T=70` → S=60 Đỏ. Ghép tổng điểm của 2 người với tổng tối đa của 3 người (`140/300=46.7%` → Không áp dụng) là sai. |

#### TC-RS-ERR-016 — Chưa xét được: sửa nguồn nhưng chỉ lưu cấu hình vẫn chưa có kết luận; xét lại mới có

| Field | Value |
| --- | --- |
| Chức năng | Nguồn tổng hợp |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Trạng thái sau lần chạy” (AC-G20 «Trạng thái sau lần chạy»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Ô S01 Chưa xét được (như case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”: công thức `A×0.5`, nguồn chưa tổng hợp). Nguồn không có bản chốt. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S01 (điểm 29); nguồn sau tổng hợp có `A=62` (giá trị như bản tổng hợp mới nhất chưa chốt (trung bình 62)) |
| Thao tác | 1. Chạy Thực hiện tổng hợp（集計実行） cho nguồn để có `A=62`; mở lại và lưu thiết lập quy tắc (không đổi nội dung). Xem đầu ra.<br>2. Chạy nút cam. Xem đầu ra. |
| Expected | 1. Vẫn Chưa xét được; không có dấu đỏ.<br>2. `T=62×0.5=31` → S01=29 Đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. Vẫn Chưa xét được; không có dấu đỏ.<br>2. `T=62×0.5=31` → S01=29 Đỏ. |

#### TC-RS-BR-026 — Không fallback sang legacy khi rule mới thiếu hoặc không khớp dữ liệu

| Field | Value |
| --- | --- |
| Chức năng | Nguồn tổng hợp |
| screen_relative_path | unknown |
| Căn cứ | AC-G12 «Đúng phạm vi tham chiếu»; AC-G38 «Bảo toàn điểm đỏ cũ»; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | - Có rule mới thiếu nguồn/không khớp và kết quả legacy cũ của cùng ô. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Có rule mới thiếu nguồn/không khớp và kết quả legacy cũ của cùng ô. |
| Thao tác | 1. Chạy nút cam.<br>2. Xem trạng thái ô và ba đầu ra. |
| Expected | Ô chuyển đúng trạng thái Chưa xét được/Không áp dụng theo nguyên nhân; không dùng legacy làm fallback và không tự ghi đè kết quả cũ ngoài chính sách trạng thái đã xác nhận. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| no-match | Không quy tắc khớp: Có legacy cũ; rule mới không khớp dù đủ dữ liệu. Chạy nút cam, đọc trạng thái/ba đầu ra. | Đủ dữ liệu nhưng không rule mới nào khớp: **Không áp dụng**; không dùng legacy làm fallback, không ghi đè kết quả cũ ngoài chính sách trạng thái đã xác nhận. |
| missing-input | Thiếu dữ liệu để xét: Có legacy cũ; rule mới thiếu dữ liệu cần xét. Chạy nút cam, đọc trạng thái/ba đầu ra. | Thiếu dữ liệu cần xét: **Chưa xét được**; không dùng legacy làm fallback, không ghi đè kết quả cũ ngoài chính sách trạng thái đã xác nhận. |

### Flow: Thời điểm xét và vòng đời kết quả

#### TC-RS-FUNC-016 — Đăng ký/sửa điểm trực tiếp ở màn lớp kích hoạt xét

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23 «Bao phủ đường đăng ký và chạy lại»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30); mục số nguyên (M=100) không có quy tắc tính tự động. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29), học sinh S03 (điểm 31) |
| Thao tác | 1. Ở màn đăng ký điểm của lớp G-A, nhập S01=29, S03=31, lưu.<br>2. Xem trích xuất. |
| Expected | Sau khi lưu thành công: S01 Đỏ, S03 Không đỏ. Đây là đường đăng ký trực tiếp với quy tắc cố định, nên không yêu cầu nguồn trung bình hoặc nút cam; không suy rộng kết luận này cho case dùng trung bình/tỷ lệ nhóm. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Sau khi lưu thành công: S01 Đỏ, S03 Không đỏ. Đây là đường đăng ký trực tiếp với quy tắc cố định, nên không yêu cầu nguồn trung bình hoặc nút cam; không suy rộng kết luận này cho case dùng trung bình/tỷ lệ nhóm. |

#### TC-RS-FUNC-017 — Nhập CSV điểm lớp học phần (NB) kích hoạt xét

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23 «Bao phủ đường đăng ký và chạy lại»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30). Chạy hai lần: (a) trường có tính tự động, (b) trường không có tính tự động. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29) |
| Thao tác | 1. Mở Đăng ký thành tích bằng CSV（成績CSV登録） của lớp G-A, nhập CSV với S01=29.<br>2. Xem kết quả ở trích xuất.<br>3. Nhập lại CSV với S01=31, xem kết quả. |
| Expected | 1–2. Nhập thành công → S01 được xét: Đỏ, ở cả (a) và (b) (không phụ thuộc việc trường có tính tự động).<br><br>3. S01 Không đỏ; không còn dấu đỏ cũ.<br><br>Điểm và kết quả nhất quán theo ranh giới giao dịch hiện có (tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn”). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| auto-on | Trường có tính tự động, thực hiện toàn bộ chuỗi CSV: Trường có tính tự động; CSV G-A/S01=29 rồi31, đọc kết quả sau mỗi lần. | 1–2. Nhập thành công → S01 được xét: Đỏ, ở cả (a) và (b) (không phụ thuộc việc trường có tính tự động).<br><br>3. S01 Không đỏ; không còn dấu đỏ cũ.<br><br>Điểm và kết quả nhất quán theo ranh giới giao dịch hiện có (tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn”). |
| auto-off | Trường không có tính tự động, cùng chuỗi CSV: Trường không có tính tự động; CSV G-A/S01=29 rồi31, đọc kết quả sau mỗi lần. | 1–2. Nhập thành công → S01 được xét: Đỏ, ở cả (a) và (b) (không phụ thuộc việc trường có tính tự động).<br><br>3. S01 Không đỏ; không còn dấu đỏ cũ.<br><br>Điểm và kết quả nhất quán theo ranh giới giao dịch hiện có (tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn”). |

#### TC-RS-FUNC-018 — Liên kết kết quả chấm bài thi kích hoạt xét

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23 «Bao phủ đường đăng ký và chạy lại»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Blocked |
| Gap | G-PREP-TC-RS-FUNC-018 |
| Cấu hình | Có bài thi đã chấm liên kết tới mục số nguyên (M=100) cho lớp G-A và lớp G-C; quy tắc “Cố định 30” (dưới 30) trên mục số nguyên (M=100). G-A đủ thiết lập để AutoRating chạy. G-C được chuẩn bị để `createArgument` không trả lớp này (ví dụ chưa đăng ký thiết lập lớp học bắt buộc（入力必須の授業設定）), nên AutoRating bị bỏ qua. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), các lớp học phần G-A, G-B, G-C, học sinh S01 (điểm 29) |
| Thao tác | 1. Xác minh đúng bài thi đã chấm và identity lớp/mục/ô đích của trường hợp.<br>2. Liên kết và đọc điểm cuối đã ghi/kết quả đỏ; không bỏ qua ô đã ghi khi AutoRating không chạy.<br>3. Nếu kiểm phần tùy chọn cần trung bình, ghi giới hạn nguồn cũ còn TBD, không kết luận PASS/FAIL phần đó. |
| Expected | 1. S01 Đỏ.<br><br>2–3. Điểm 28 của G-C đã được ghi và ô đó được xét → Đỏ, dù AutoRating bị bỏ qua. Không có ô đã ghi nào ở G-C bị để lại không có kết quả.<br><br>4. Quy tắc cần trung bình: liên kết không chạy tổng hợp thứ hạng nên trung bình có thể cũ — việc chấp nhận trung bình cũ chưa chốt, phần này TBD, không đánh PASS/FAIL. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| linked | Liên kết điểm ở G-A: Liên kết bài thi đã chấm G-A/S01=29; đọc điểm/kết quả. Phần trung bình tùy chọn còn TBD. | Liên kết điểm **S01=29** ở G-A → **Đỏ**, gồm trường hợp không có rule tính tự động. Phần tùy chọn cần trung bình: liên kết không chạy tổng hợp thứ hạng nên nguồn có thể cũ; việc chấp nhận nguồn cũ còn **TBD**, không đánh PASS/FAIL cho phần đó. |
| auto-skipped | Nhánh AutoRating bỏ qua ở G-C: G-C bị createArgument/AutoRating bỏ qua; liên kết điểm28 của G-C và đọc mọi ô đã ghi. | G-C bị AutoRating bỏ qua nhưng đã ghi điểm **28** → ô đó phải được xét **Đỏ**; không có ô đã ghi ở G-C bị để lại không có kết quả. Phần tùy chọn cần trung bình còn **TBD**, không đánh PASS/FAIL cho việc chấp nhận nguồn cũ. |

#### TC-RS-FUNC-019 — Lưu lựa chọn điểm tối đa của lớp khi đăng ký điểm kích hoạt xét

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị” (AC-G24 «Trigger khi đổi điểm tối đa/đơn vị»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục điểm đơn vị (đơn vị U1 có M riêng 40) có quy tắc tỷ lệ 30% (30%). Lớp G-B chưa dùng lựa chọn lớp; S06 có điểm U1 = 14 (M=40 → T=12 → Không đỏ). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc tỷ lệ 30% |
| Thao tác | 1. Ở màn đăng ký điểm lớp G-B, chọn lựa chọn lớp M=50 cho U1, lưu.<br>2. Xem kết quả S06. |
| Expected | Sau khi lưu thành công: M=50 → T=15 → S06=14 Đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Sau khi lưu thành công: M=50 → T=15 → S06=14 Đỏ. |

#### TC-RS-FUNC-020 — Lưu Thiết lập điểm tối đa hàng loạt（満点一括設定） xếp hàng tính toán rồi mới có kết quả mới

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị” (AC-G24 «Trigger khi đổi điểm tối đa/đơn vị»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Trường có chức năng Thiết lập điểm tối đa hàng loạt（満点一括設定） (`/admin/grade/lesson_group/setting?setting_type=change_max_score`); tài khoản có quyền chạy hàng loạt; quy tắc tỷ lệ 30% trên mục điểm đơn vị (đơn vị U1 có M riêng 40). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc tỷ lệ 30% |
| Thao tác | 1. Lưu M=50 cho các lớp/kỳ được phép.<br>2. Ngay sau khi lưu (trước khi batch xong), xem kết quả.<br>3. Chờ batch hoàn tất, xem lại. |
| Expected | 1. Ngay sau khi lưu: kết quả cũ vẫn hiện; không báo "hoàn tất" khi mới xếp hàng.<br>2. Sau batch thành công: kết quả theo M=50. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. Ngay sau khi lưu: kết quả cũ vẫn hiện; không báo "hoàn tất" khi mới xếp hàng.<br>2. Sau batch thành công: kết quả theo M=50. |

#### TC-RS-FUNC-021 — Trường chỉ có quy tắc đỏ (không có tính tự động) vẫn có đường chạy hàng loạt

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23 «Bao phủ đường đăng ký và chạy lại»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Trường không có quy tắc tính tự động nào đang hoạt động; mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), tài khoản có quyền chạy hàng loạt |
| Thao tác | 1. Mở Tổng hợp thành tích（成績集計） (`/admin/grade/grade_setting_system/grade_calc`).<br>2. Tìm thao tác Thực hiện tính toán tự động（自動算出実行） cho Khối 1, kỳ 1学期期末 (cuối kỳ học kỳ 1).<br>3. Chạy, chờ hoàn tất, xem kết quả. |
| Expected | Chạy được bằng thao tác hàng loạt hiện có (không có chế độ xét đỏ riêng); sau khi chạy, các ô được xét theo quy tắc “Cố định 30” (dưới 30). Nhãn/cách hiện nút cho trường không có tính tự động chưa chốt — không đánh giá phần này. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Chạy được bằng thao tác hàng loạt hiện có (không có chế độ xét đỏ riêng); sau khi chạy, các ô được xét theo quy tắc “Cố định 30” (dưới 30). Nhãn/cách hiện nút cho trường không có tính tự động chưa chốt — không đánh giá phần này. |

#### TC-RS-FUNC-035 — Nhập CSV đăng ký điểm lớp chủ nhiệm hàng loạt（HR成績CSV一括登録） kích hoạt xét

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | `/admin/grade/bulk_input/csv/{homeroom_id}` |
| Căn cứ | tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23 «Bao phủ đường đăng ký và chạy lại»); đặc tả v2 mục 7.2 “Bảng sự kiện”; trạng thái nguồn TBD (phạm vi release của đường HR成績CSV一括登録); ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Awaiting decision |
| Readiness | Blocked |
| Gap | G-ORACLE-TC-RS-FUNC-035, G-PREP-TC-RS-FUNC-035 |
| Cấu hình | mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30). Hai biến thể tách riêng: `auto-on` (trường có tính tự động) và `auto-off` (trường không có tính tự động). URL chuẩn: `/admin/grade/bulk_input/csv/{homeroom_id}` (HR成績CSV一括登録). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29); homeroom có quyền mở HR成績CSV一括登録 |
| Thao tác | 1. Mở `/admin/grade/bulk_input/csv/{homeroom_id}` theo biến thể (ghi URL, HTTP status, quyền, feature flag nếu bị chặn).<br>2. Nhập CSV đăng ký điểm lớp chủ nhiệm hàng loạt（HR成績CSV一括登録） với S01=28.<br>3. Xem kết quả đỏ của S01. |
| Expected | **Blocked — chờ quyết định phạm vi release** (G-ORACLE-TC-RS-FUNC-035): chưa xác nhận HR成績CSV一括登録 có thuộc đợt phát hành hay không. Khi đã thuộc phạm vi: theo đặc tả v2 mục 7.2, nhập thành công → S01 Đỏ. Không dùng việc local không mở được màn hình để kết luận ngoài phạm vi release; đó là G-PREP-TC-RS-FUNC-035 riêng. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| auto-on | Trường **có** tính tự động; mở `/admin/grade/bulk_input/csv/{homeroom_id}`; CSV HR S01=28; đọc kết quả. | **Blocked (phạm vi release):** chờ xác nhận đường này thuộc đợt. Nếu đã thuộc phạm vi và màn mở được: nhập thành công → S01 Đỏ. Nếu màn không truy cập được (403/404/feature off): ghi URL, HTTP status, quyền, flag → G-PREP-TC-RS-FUNC-035; **không** dùng để kết luận ngoài phạm vi release. |
| auto-off | Trường **không** có tính tự động; cùng URL và CSV HR S01=28; đọc kết quả. | **Blocked (phạm vi release):** chờ xác nhận đường này thuộc đợt. Nếu đã thuộc phạm vi và màn mở được: ghi hành vi thực tế sau nhập (có xét ngay hay chỉ xếp hàng khi auto bật). Nếu màn không truy cập được: ghi URL/status/quyền/flag → G-PREP-TC-RS-FUNC-035; tách khỏi quyết định phạm vi release. |

#### TC-RS-BR-015 — Lưu cấu hình không xét; kết quả trước giữ tới lần chạy lại

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại” (AC-G21 «Giữ kết quả trước khi chạy lại và xóa rule cuối»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | quy tắc “Cố định 30” (dưới 30); S03 sửa thành 32 và đã xét → Không đỏ. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30) |
| Thao tác | 1. Đổi ngưỡng thành 35 `&lt;`, lưu.<br>2. Xem ba đầu ra.<br>3. Đổi thứ tự quy tắc/đổi nguồn (nếu có), lưu, xem lại.<br>4. Chỉ đổi dấu (`&lt;35` → `≤35`), lưu, xem lại. Nếu công thức thuộc đợt phát hành: chỉ đổi công thức của một quy tắc công thức, lưu, xem lại.<br>5. Chạy lại (đăng ký lại điểm S03 hoặc nút cam), xem ba đầu ra. |
| Expected | 1. Sau lưu: không báo "đã cập nhật điểm đỏ học sinh"; có hướng dẫn chạy lại.<br><br>2–4. S03 vẫn Không đỏ theo kết quả trước; hiệu ứng hiển thị trước đó giữ nguyên.<br><br>5. Sau chạy lại thành công: S03 Đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. Sau lưu: không báo "đã cập nhật điểm đỏ học sinh"; có hướng dẫn chạy lại.<br><br>2–4. S03 vẫn Không đỏ theo kết quả trước; hiệu ứng hiển thị trước đó giữ nguyên.<br><br>5. Sau chạy lại thành công: S03 Đỏ. |

#### TC-RS-BR-016 — Sửa điểm 29 → 40 được lưu và xét trong cùng lượt

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn” (AC-G26 «Lưu thành công và thông báo an toàn»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | quy tắc “Cố định 30” (dưới 30); S01=29 Đỏ. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29) |
| Thao tác | 1. Sửa S01 thành 40, lưu thành công.<br>2. Xem ba đầu ra ngay sau đó. |
| Expected | S01 Không đỏ; không cần bật một chế độ thủ công/tự động riêng. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | S01 Không đỏ; không cần bật một chế độ thủ công/tự động riêng. |

#### TC-RS-BR-017 — Chạy lại không tạo được ngưỡng hợp lệ → Chưa xét được, ngừng kết quả cũ, giữ điểm

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Trạng thái sau lần chạy” (AC-G20 «Trạng thái sau lần chạy»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Ô S01=29 Đỏ theo công thức `A×0.5` (nguồn bản tổng hợp mới nhất chưa chốt (trung bình 62)). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục có M không hợp lệ, quy tắc công thức 100 ÷ trung bình, bản tổng hợp mới nhất chưa chốt (trung bình 62); học sinh S01 (điểm 29), nguồn chưa có kết quả tổng hợp |
| Thao tác | 1. Từ baseline độc lập, xác nhận S01=29 đang Đỏ; tạo biến thể (a) bằng cách đổi nguồn sang nguồn chưa có kết quả tổng hợp (không có tổng hợp), lưu, chạy lại.<br>2. Khôi phục/rebuild baseline S01=29 Đỏ; tạo biến thể (b) bằng quy tắc tỷ lệ với M không hợp lệ (mục có M không hợp lệ), rồi chạy lại.<br>3. Khôi phục/rebuild baseline S01=29 Đỏ; tạo biến thể (c) bằng quy tắc công thức 100 ÷ trung bình với `A=0`, rồi chạy lại.<br>4. Sau mỗi biến thể: xem ba đầu ra và điểm S01. |
| Expected | Mỗi biến thể: trạng thái Chưa xét được; dấu/lọc đỏ cũ ngừng ở cả ba đầu ra; điểm S01 vẫn 29; không đi xuống quy tắc thấp hơn; không bật lại ngưỡng cũ `red_score`. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| invalid-M | Điểm tối đa không hợp lệ: Reset S01=29 Đỏ, chuyển sang quy tắc tỷ lệ với M không hợp lệ rồi chạy lại; đối chiếu cả ba đầu ra. | Mỗi biến thể: trạng thái Chưa xét được; dấu/lọc đỏ cũ ngừng ở cả ba đầu ra; điểm S01 vẫn 29; không đi xuống quy tắc thấp hơn; không bật lại ngưỡng cũ `red_score`. |
| missing-source | Thiếu nguồn tổng hợp: Reset S01=29 Đỏ, đổi nguồn sang nguồn chưa có kết quả tổng hợp rồi lưu/chạy lại; đối chiếu cả ba đầu ra. | Mỗi biến thể: trạng thái Chưa xét được; dấu/lọc đỏ cũ ngừng ở cả ba đầu ra; điểm S01 vẫn 29; không đi xuống quy tắc thấp hơn; không bật lại ngưỡng cũ `red_score`. |
| invalid-formula | Công thức chia cho nguồn bằng 0: Reset S01=29 Đỏ, cấu hình 100÷A với **A=0** rồi chạy lại; đối chiếu cả ba đầu ra. | Mỗi biến thể: trạng thái Chưa xét được; dấu/lọc đỏ cũ ngừng ở cả ba đầu ra; điểm S01 vẫn 29; không đi xuống quy tắc thấp hơn; không bật lại ngưỡng cũ `red_score`. |

#### TC-RS-BR-018 — Đổi phạm vi làm ô không còn quy tắc áp dụng: giữ khi chưa chạy; chạy lại → Không áp dụng

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại” (AC-G21 «Giữ kết quả trước khi chạy lại và xóa rule cuối»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Quy tắc lọc lớp G-A; S01 (G-A) = 29 Đỏ. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S01 (điểm 29) |
| Thao tác | 1. Đổi bộ lọc sang lớp G-B, lưu. Xem đầu ra.<br>2. Chạy lại. Xem đầu ra. |
| Expected | 1. S01 vẫn Đỏ (kết quả trước).<br>2. S01 Không áp dụng; ngừng dấu/lọc đỏ cũ; điểm giữ nguyên. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. S01 vẫn Đỏ (kết quả trước).<br>2. S01 Không áp dụng; ngừng dấu/lọc đỏ cũ; điểm giữ nguyên. |

#### TC-RS-BR-019 — Xóa quy tắc cuối: giữ kết quả tới lần chạy lại; chạy lại → Không áp dụng

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại” (AC-G21 «Giữ kết quả trước khi chạy lại và xóa rule cuối»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) chỉ có quy tắc “Cố định 30” (dưới 30); S01=29 Đỏ. Trích xuất cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, công khai `*` trước, phiếu cấu hình phiếu điểm: ký tự “※” phía trước đã cấu hình. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100), quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29), cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước |
| Thao tác | 1. Xóa quy tắc “Cố định 30” (dưới 30) (quy tắc cuối).<br>2. Xem ba đầu ra.<br>3. Chạy lại bằng đăng ký điểm lớp G-A hoặc chạy hàng loạt.<br>4. Xem ba đầu ra và cấu hình trình bày đầu ra. |
| Expected | 1–2. Danh sách rỗng nhưng S01 vẫn hiện dấu đỏ/thỏa lọc ở ba đầu ra.<br><br>3–4. Lần chạy xét cả mục đã hết quy tắc: S01 Không áp dụng, ngừng dấu/lọc; điểm giữ nguyên. Cấu hình trình bày đỏ đã lưu ở đầu ra không bị xóa như tác dụng phụ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| registration | Chạy lại bằng đăng ký điểm: Reset S01=29 Đỏ và rule cuối/T=30; xóa rule, đọc trước chạy; đăng ký lại điểm G-A, đọc ba đầu ra/cấu hình. | 1–2. Danh sách rỗng nhưng S01 vẫn hiện dấu đỏ/thỏa lọc ở ba đầu ra.<br><br>3–4. Lần chạy xét cả mục đã hết quy tắc: S01 Không áp dụng, ngừng dấu/lọc; điểm giữ nguyên. Cấu hình trình bày đỏ đã lưu ở đầu ra không bị xóa như tác dụng phụ. |
| batch | Chạy lại bằng nút cam, reset baseline trước lượt này: Reset độc lập S01=29 Đỏ và rule cuối/T=30; xóa rule, đọc trước chạy; chạy nút cam, đọc ba đầu ra/cấu hình. | 1–2. Danh sách rỗng nhưng S01 vẫn hiện dấu đỏ/thỏa lọc ở ba đầu ra.<br><br>3–4. Lần chạy xét cả mục đã hết quy tắc: S01 Không áp dụng, ngừng dấu/lọc; điểm giữ nguyên. Cấu hình trình bày đỏ đã lưu ở đầu ra không bị xóa như tác dụng phụ. |

#### TC-RS-BR-020 — Xóa điểm thành trống → Không có điểm, bỏ dấu đỏ cũ

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Dùng điểm cuối cùng” (AC-G19 «Dùng điểm cuối cùng»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | S01=29 Đỏ. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S01 (điểm 29), cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu |
| Thao tác | 1. Xóa điểm S01 thành trống, lưu.<br>2. Xem ba đầu ra, chạy trích xuất có lọc đỏ. |
| Expected | S01 Không có điểm; không còn dấu đỏ; không thỏa lọc đỏ nhờ ô này. Không cần chờ chạy lại. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | S01 Không có điểm; không còn dấu đỏ; không thỏa lọc đỏ nhờ ô này. Không cần chờ chạy lại. |

#### TC-RS-BR-021 — Tổng hợp lại hoặc đổi nhóm tham chiếu không tự xét lại

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Thứ tự đánh giá tương đối” (AC-G25 «Thứ tự đánh giá tương đối»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Công thức `A×0.5`, `A=50` → `T=25`; học sinh điểm 24 Đỏ. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: bản tổng hợp mới nhất chưa chốt (trung bình 62) |
| Thao tác | 1. Sửa điểm nhóm để trung bình mới là 40, bấm Thực hiện tổng hợp（集計実行）.<br>2. Xem kết quả học sinh 24.<br>3. Bấm Thực hiện tính toán tự động（自動算出実行）, xem lại. |
| Expected | 1–2. Vẫn Đỏ theo kết quả trước (không tự xét lại).<br><br>3. `A=40` → `T=20` → 24 Không đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1–2. Vẫn Đỏ theo kết quả trước (không tự xét lại).<br><br>3. `A=40` → `T=20` → 24 Không đỏ. |

#### TC-RS-BR-022 — Đổi M ở Thiết lập điểm tối đa（満点設定） hoặc Giá trị tối đa（最大値） không tự xét lại

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị” (AC-G24 «Trigger khi đổi điểm tối đa/đơn vị»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) có quy tắc tỷ lệ 30% (30%); S03 = 31, `M=100` → `T=30` → Không đỏ. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc tỷ lệ 30% |
| Thao tác | 1. Sửa Giá trị tối đa（最大値） của mục số nguyên (M=100) ở Thiết lập ô nhập（入力欄設定） thành 200, lưu. Xem kết quả.<br>2. Lưu một định nghĩa lựa chọn ở Thiết lập điểm tối đa（満点設定） (`/admin/grade_report_setting/manage/detail/option/register/change_max_score`) (chưa gán cho lớp). Xem kết quả.<br>3. Đăng ký lại điểm S03. Xem kết quả. |
| Expected | 1–2. S03 vẫn Không đỏ (kết quả trước).<br><br>3. `M=200` → `T=60` → S03=31 Đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1–2. S03 vẫn Không đỏ (kết quả trước).<br><br>3. `M=200` → `T=60` → S03=31 Đỏ. |

#### TC-RS-BR-023 — Nút xanh Thực hiện tổng hợp（集計実行） không xét điểm đỏ

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Thứ tự đánh giá tương đối” (AC-G25 «Thứ tự đánh giá tương đối»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | quy tắc “Cố định 30” (dưới 30) vừa đổi từ 30 thành 35 và lưu; S03=32 Không đỏ (kết quả trước). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30) |
| Thao tác | 1. Bấm Thực hiện tổng hợp（集計実行）, chờ hoàn tất.<br>2. Xem kết quả S03. |
| Expected | S03 vẫn Không đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | S03 vẫn Không đỏ. |

#### TC-RS-BR-024 — Xem, xuất, công khai, in lại không kích hoạt xét

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Xem/xuất không tự xét” (AC-G28 «Xem/xuất không tự xét»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Như case “Lưu cấu hình không xét; kết quả trước giữ tới lần chạy lại” bước 1 (đã lưu `&lt;35`, chưa chạy lại; S03=32 Không đỏ). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước |
| Thao tác | 1. Chạy trích xuất, xuất Excel.<br>2. Mở màn công khai học sinh, tải PDF công khai.<br>3. Xuất PDF phiếu. |
| Expected | S03 vẫn Không đỏ ở mọi đầu ra; không có lượt xét mới (thời điểm kết quả không đổi); không có lượt tổng hợp mới (lượt/thời điểm tổng hợp mới nhất không đổi). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| extract | Trích xuất: S03 đã lưu **Không đỏ**; chỉ xem/xuất màn **Trích xuất thành tích（成績抽出）**, đọc thời điểm kết quả và lượt/thời điểm tổng hợp trước/sau để kiểm không phát sinh xét. | S03 vẫn Không đỏ ở mọi đầu ra; không có lượt xét mới (thời điểm kết quả không đổi); không có lượt tổng hợp mới (lượt/thời điểm tổng hợp mới nhất không đổi). |
| excel | Excel trích xuất: S03 đã lưu **Không đỏ**; chỉ xem/xuất file **Excel** sau Trích xuất thành tích（成績抽出）, đọc thời điểm kết quả và lượt/thời điểm tổng hợp trước/sau để kiểm không phát sinh xét. | S03 vẫn Không đỏ ở mọi đầu ra; không có lượt xét mới (thời điểm kết quả không đổi); không có lượt tổng hợp mới (lượt/thời điểm tổng hợp mới nhất không đổi). |
| publish-web | Web công khai: S03 đã lưu **Không đỏ**; chỉ xem/xuất màn **Xác nhận thành tích（成績確認）**, đọc thời điểm kết quả và lượt/thời điểm tổng hợp trước/sau để kiểm không phát sinh xét. | S03 vẫn Không đỏ ở mọi đầu ra; không có lượt xét mới (thời điểm kết quả không đổi); không có lượt tổng hợp mới (lượt/thời điểm tổng hợp mới nhất không đổi). |
| publish-pdf | PDF công khai: S03 đã lưu **Không đỏ**; chỉ xem/xuất PDF **Công khai thành tích（成績公開）**, đọc thời điểm kết quả và lượt/thời điểm tổng hợp trước/sau để kiểm không phát sinh xét. | S03 vẫn Không đỏ ở mọi đầu ra; không có lượt xét mới (thời điểm kết quả không đổi); không có lượt tổng hợp mới (lượt/thời điểm tổng hợp mới nhất không đổi). |
| report | Phiếu điểm: S03 đã lưu **Không đỏ**; chỉ xem/xuất PDF **Công cụ phiếu điểm（通知表ツール）**, đọc thời điểm kết quả và lượt/thời điểm tổng hợp trước/sau để kiểm không phát sinh xét. | S03 vẫn Không đỏ ở mọi đầu ra; không có lượt xét mới (thời điểm kết quả không đổi); không có lượt tổng hợp mới (lượt/thời điểm tổng hợp mới nhất không đổi). |

#### TC-RS-BR-027 — Chạy lại nhiều lần cho cùng kết quả, không nhân đôi dấu

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật” (AC-G22 «Kết quả chung và thứ tự cập nhật»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | quy tắc “Cố định 30” (dưới 30); S01=29 Đỏ; trích xuất cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) (`※`, `!`). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29), cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) |
| Thao tác | 1. Chạy nút cam 3 lần liên tiếp (chờ mỗi lần hoàn tất).<br>2. Xem trích xuất; SELECT số kết quả hiện hành của ô S01 (khi có schema). |
| Expected | Ô S01 hiện `※29!` (không `※※29!!`); chỉ một kết quả hiện hành cho ô. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Ô S01 hiện `※29!` (không `※※29!!`); chỉ một kết quả hiện hành cho ô. |

#### TC-RS-BR-037 — Xóa hoặc thôi dùng điểm đơn vị thì ngừng kết quả đỏ cũ của ô đó

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị” (AC-G24 «Trigger khi đổi điểm tối đa/đơn vị»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục điểm đơn vị (đơn vị U1 có M riêng 40) có quy tắc “Cố định 30” (dưới 30). S06 (G-B): U1 = 25, U2 = 35 đã đăng ký; U1 đang Đỏ, U2 Không đỏ (như case “Ô điểm đơn vị được xét riêng theo từng đơn vị”). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục điểm đơn vị (đơn vị U1 có M riêng 40); quy tắc “Cố định 30” (dưới 30); các lớp học phần G-A, G-B, G-C; học sinh S06 (điểm dự kiến 24) |
| Thao tác | 1. Xác nhận U1 Đỏ ở ba đầu ra.<br>2. Biến thể (a): xóa điểm U1 của S06 thành trống rồi lưu.<br>3. Khôi phục/rebuild fixture U1 Đỏ, U2 Không đỏ; biến thể (b): thôi dùng đơn vị U1 cho lớp G-B theo thao tác hiện có (nếu màn hỗ trợ), rồi đăng ký lại hoặc chạy nút cam cho G-B.<br>4. Xem ba đầu ra và bộ lọc đỏ của trích xuất. |
| Expected | 1. Mỗi biến thể dùng fixture độc lập. Sau (a) hoặc (b), ô U1 của S06 trong fixture tương ứng không còn dấu đỏ ở ba đầu ra; bộ lọc đỏ không giữ S06 chỉ vì U1 cũ.<br>2. U2 giữ kết quả Không đỏ; không bị gộp hay xét lại sai. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| delete-unit | Xóa điểm đơn vị: Reset S06/G-B U1=25 Đỏ, U2=35 Không đỏ; xóa trống điểm U1 và lưu, đọc ba đầu ra và bộ lọc đỏ. | 1. Mỗi biến thể dùng fixture độc lập. Sau (a) hoặc (b), ô U1 của S06 trong fixture tương ứng không còn dấu đỏ ở ba đầu ra; bộ lọc đỏ không giữ S06 chỉ vì U1 cũ.<br>2. U2 giữ kết quả Không đỏ; không bị gộp hay xét lại sai. |
| disable-unit | Thôi sử dụng đơn vị: Reset S06/G-B U1=25 Đỏ, U2=35 Không đỏ; thôi dùng U1 theo thao tác hiện có nếu hỗ trợ, rồi đăng ký lại hoặc chạy nút cam G-B; đọc ba đầu ra. | 1. Mỗi biến thể dùng fixture độc lập. Sau (a) hoặc (b), ô U1 của S06 trong fixture tương ứng không còn dấu đỏ ở ba đầu ra; bộ lọc đỏ không giữ S06 chỉ vì U1 cũ.<br>2. U2 giữ kết quả Không đỏ; không bị gộp hay xét lại sai. |

#### TC-RS-ERR-012 — Nhập CSV lựa chọn điểm tối đa của lớp

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | `/admin/nb/grade/grade_setting_system/lesson_group_csv/option_regist/{group_id}` (hoặc `/admin/grade/grade_setting_system/lesson_group_csv/option_regist/{group_id}`); bulk liên quan: `/admin/grade/lesson_group/setting?setting_type=change_max_score` |
| Căn cứ | tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị” (AC-G24 «Trigger khi đổi điểm tối đa/đơn vị»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | — (G-PREP-TC-RS-ERR-012 đã clear: màn/route mở được; kết quả thực thi FAIL — option lưu nhưng không chạy đường tính) |
| Cấu hình | mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc tỷ lệ 30% (30%); S06 U1=14 Không đỏ với M=40. Route CSV lựa chọn điểm tối đa của lớp: `lesson_group_csv/option_regist/{group_id}` (NB hoặc legacy). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc tỷ lệ 30%; CSV gán lựa chọn M=50 cho lớp G-B (group 3378747) |
| Thao tác | 1. Mở đúng URL CSV lựa chọn điểm tối đa; nếu 404/403 thì ghi URL, HTTP status, quyền tài khoản và feature flag, rồi dừng theo G-PREP-TC-RS-ERR-012 (không kết luận thiếu spec).<br>2. Nhập CSV thành công với lựa chọn M=50 cho lớp G-B.<br>3. Chờ đường tính hiện có hoàn tất; xem kết quả S06 U1. |
| Expected | **CONFIRMED (AC-G24):** sau khi nhập CSV điểm tối đa thành công, hệ thống chạy đường tính hiện có và cập nhật kết quả điểm đỏ. Với quy tắc tỷ lệ 30% và M=50 → `T=15` → S06=14 Đỏ. Không còn oracle TBD về “có xét lại ngay hay không”. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: mở URL CSV → nhập M=50 cho G-B → chờ đường tính → đọc S06 U1. | Sau nhập CSV thành công và đường tính xong: S06 U1 Đỏ (`T=15`). Nếu không mở được màn: ghi URL/HTTP/quyền/flag → Blocked môi trường (G-PREP-TC-RS-ERR-012), không phải thiếu AC. |

#### TC-RS-ERR-015 — Bản ghi điểm bị xóa rồi tạo lại không kế thừa kết quả cũ

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Nhận diện ô điểm” (AC-G03 «Nhận diện ô điểm»); tiêu chí nghiệm thu “Không dùng lại kết quả cho đối tượng mới” (AC-G39 «Không dùng lại kết quả cho đối tượng mới»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | S01 Đỏ ở mục điểm đơn vị (đơn vị U1 có M riêng 40) U1. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục điểm đơn vị (đơn vị U1 có M riêng 40) |
| Thao tác | 1. Dựng riêng baseline ô S01/U1 Đỏ, đúng identity/thế hệ và đường được phép; không dùng dữ liệu từ trường hợp trước.<br>2. Xóa/tạo lại hoặc cho batch chạy đồng thời theo chuỗi thao tác riêng của trường hợp.<br>3. Đọc đầu ra và dữ liệu hiện hành; đối chiếu trạng thái/thế hệ, không coi cùng giá trị là cùng ô cũ. |
| Expected | Sau bước 1: không còn dấu đỏ của ô cũ. Sau bước 2: ô mới được xét theo 35 → Không đỏ; không mang kết quả Đỏ cũ.<br><br>4. Kích hoạt lại/nhập lại cùng giá trị không làm kết quả Đỏ trước khi xóa sống lại; ô chỉ có kết quả của lần xét sau khi tạo lại.<br>5. Lượt batch cũ không ghi kết quả vào ô đã tạo lại; ô giữ kết quả của lần đăng ký 35 (Không đỏ). (PROPOSED theo thiết kế DB v2 mục 4.4 “Cập nhật và hiệu lực kết quả”, mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi”) Khi xóa: `cell_generation` mới, `judgment_status`=4 và thông tin quy tắc/ngưỡng/nguồn cũ bị xóa trong cùng transaction; dòng điều khiển được giữ; tạo lại dùng thế hệ mới. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| recreate35 | Tạo lại ô với điểm khác: S01/U1 đang Đỏ; bỏ dùng U1/thay khung theo thao tác hiện có để ô xóa/ngừng hoạt động. Tạo lại ô, nhập **35**, lưu và xem đầu ra. | Sau xóa/ngừng ô: không còn dấu đỏ của ô cũ. Tạo lại và đăng ký **35 → Không đỏ**, không mang Đỏ cũ. (PROPOSED theo thiết kế DB v2 mục 4.4 “Cập nhật và hiệu lực kết quả”, mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi”) Khi xóa: `cell_generation` mới, `judgment_status`=4 và thông tin quy tắc/ngưỡng/nguồn cũ bị xóa trong cùng transaction; dòng điều khiển được giữ; tạo lại dùng thế hệ mới. |
| same29 | Tạo lại cùng giá trị: Dựng ô **29 Đỏ**, xóa/xóa mềm rồi kích hoạt/tạo lại cùng **29** không qua đường xét nếu có thao tác đó; xem đầu ra. Sau đó đăng ký lại điểm và đọc lại. | Khôi phục/tạo lại cùng **29** không làm Đỏ trước xóa sống lại; ô chỉ có kết quả từ lần xét sau khi tạo lại. (PROPOSED theo thiết kế DB v2 mục 4.4 “Cập nhật và hiệu lực kết quả”, mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi”) Khi xóa: `cell_generation` mới, `judgment_status`=4 và thông tin quy tắc/ngưỡng/nguồn cũ bị xóa trong cùng transaction; dòng điều khiển được giữ; tạo lại dùng thế hệ mới. |
| old-batch | Batch cũ sau khi tạo lại ô: Dựng ô Đỏ; bắt đầu batch lớp, khi chưa xong xóa ô rồi tạo lại và đăng ký **35**. Chờ batch cũ, xem đầu ra và SELECT. | Batch cũ không ghi vào ô đã tạo lại; giữ kết quả lần đăng ký **35/Không đỏ**. (PROPOSED theo thiết kế DB v2 mục 4.4 “Cập nhật và hiệu lực kết quả”, mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi”) Khi xóa: `cell_generation` mới, `judgment_status`=4 và thông tin quy tắc/ngưỡng/nguồn cũ bị xóa trong cùng transaction; dòng điều khiển được giữ; tạo lại dùng thế hệ mới. |

### Flow: Trích xuất thành tích（成績抽出）

#### TC-RS-FUNC-022 — Trích xuất thành tích（成績抽出）: các tùy chọn đỏ được lưu và mở lại đúng

| Field | Value |
| --- | --- |
| Chức năng | Trích xuất thành tích（成績抽出） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Hiển thị ô trích xuất” (AC-G30 «Hiển thị ô trích xuất»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30). Đăng nhập tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100), quy tắc “Cố định 30” (dưới 30); cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) |
| Thao tác | 1. Mở thiết lập hiển thị của trích xuất, khung Thiết lập chi tiết thông tin lớp học（授業情報の詳細設定）, phần điều kiện đỏ.<br>2. Cấu hình cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, lưu, mở lại.<br>3. Cấu hình cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) (hai ký hiệu cùng bật), lưu, mở lại.<br>4. (PROPOSED) Chạy SELECT cột `extract_setting` của dòng `grade_extract_conf` tương ứng mẫu vừa lưu, lọc theo trường/năm test.<br>5. (PROPOSED) Nếu màn có chức năng sao chép thiết lập trích xuất hiện có: sao chép mẫu cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, mở bản sao. |
| Expected | 1. Có bốn tùy chọn độc lập: lọc học sinh có điểm đỏ, ký hiệu phía trước, ký hiệu phía sau, tô màu ô.<br>2. Ký hiệu trước và sau cùng bật được.<br>3. Màu chỉ chọn từ bảng màu hiện có (không có bộ chọn màu tự do).<br>4. Mở lại giữ đúng giá trị.<br>5. (PROPOSED) JSON `extract_setting` chứa phần điều kiện đỏ với các khóa `use_target_extract`, `use_prefix_mark`, `prefix_mark`, `use_suffix_mark`, `suffix_mark`, `use_cell_coloring`, `cell_color` khớp giá trị trên màn; không có cột/bảng mới cho thiết lập này.<br>6. (PROPOSED) Bản sao giữ nguyên bốn tùy chọn, ký hiệu và màu. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| filter-color | Cấu hình lọc và màu: Lọc đỏ + `*` trước + màu từ bảng màu hiện có; lưu/mở lại và đối chiếu SELECT đề xuất. | Có bốn tùy chọn độc lập: lọc đỏ, ký hiệu trước, ký hiệu sau, màu ô. Cấu hình lọc, `*` trước và màu lưu/mở lại đúng; màu chỉ chọn từ bảng màu hiện có, không có bộ chọn tự do. **PROPOSED**: JSON extract_setting có use_target_extract, use_prefix_mark, prefix_mark, use_suffix_mark, suffix_mark, use_cell_coloring, cell_color khớp màn hình; không thêm cột/bảng cho thiết lập này. |
| prefix-suffix | Cấu hình ký hiệu trước/sau: Bật đồng thời `※` trước và `!` sau; lưu/mở lại và đối chiếu SELECT đề xuất. | Ký hiệu trước **`※`** và sau **`!`** cùng bật được; lưu/mở lại đúng. Bốn tùy chọn độc lập; màu dùng bảng màu hiện có, không chọn tự do. **PROPOSED**: JSON extract_setting có use_target_extract, use_prefix_mark, prefix_mark, use_suffix_mark, suffix_mark, use_cell_coloring, cell_color khớp màn hình; không thêm cột/bảng cho thiết lập này. |
| copy | Sao chép cấu hình theo phần đề xuất: Nếu có chức năng hiện hữu, sao chép cấu hình lọc+`*` trước+màu, mở bản sao; phần này PROPOSED. | **PROPOSED**: Khi có chức năng sao chép hiện hữu, bản sao giữ nguyên bốn tùy chọn, ký hiệu và màu đã lưu; mở lại đúng. **PROPOSED**: JSON extract_setting có use_target_extract, use_prefix_mark, prefix_mark, use_suffix_mark, suffix_mark, use_cell_coloring, cell_color khớp màn hình; không thêm cột/bảng cho thiết lập này. |

#### TC-RS-FUNC-023 — Trích xuất: lọc giữ học sinh có ít nhất một ô đỏ trong phạm vi đang xét

| Field | Value |
| --- | --- |
| Chức năng | Trích xuất thành tích（成績抽出） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Lọc khi trích xuất” (AC-G29 «Lọc khi trích xuất»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Kết quả đã xét: S10 Toán 24 Đỏ và Ngữ văn 20 Đỏ trong cùng phạm vi; S03 Không đỏ ở mọi môn. S10 có thêm ô Toán ở một thời điểm khác, Không đỏ. S06 có mục điểm đơn vị (đơn vị U1 có M riêng 40) U1 = 25 Đỏ, U2 = 35 Không đỏ. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S10 (học lớp G-B và G-C), học sinh S03 (điểm 31), học sinh S06 (điểm dự kiến 24), mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc “Cố định 30” (dưới 30), cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) |
| Thao tác | 1. Dựng baseline có đúng điểm/kết quả đã xét và scope của trường hợp; không dùng ô đỏ ngoài thời điểm/đơn vị làm control.<br>2. Chạy Trích xuất thành tích（成績抽出） với scope và tùy chọn riêng của trường hợp.<br>3. Đọc danh sách học sinh, điểm/dấu của cả đối tượng đích và đối chứng. |
| Expected | 1. Bước 1: S10 có trong danh sách, S03 không.<br>2. Bước 2: S10 vẫn có trong danh sách nhờ Ngữ văn 20 Đỏ; không được loại S10 chỉ vì ô Toán ngoài phạm vi.<br>3. Bước 3: danh sách không bị lọc theo đỏ (chỉ bật ký hiệu không giới hạn học sinh).<br>4. Bước 4: S10 không có trong danh sách; ô đỏ ở thời điểm khác không giúp thỏa điều kiện.<br>5. Bước 5: S06 không có trong danh sách; ô đỏ của U1 ngoài phạm vi đơn vị.<br>6. S10 vẫn có trong danh sách nhờ Ngữ văn 20 Đỏ; ô Toán đã xóa không còn dấu đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| multi-red-scope | Hai môn có ô đỏ: Bật lọc+`*` trước+màu, scope **Toán và Ngữ văn**; S10 có Toán24/Ngữ văn20 Đỏ, S03 Không đỏ. Chạy trích xuất, đọc membership. | Phạm vi Toán và Ngữ văn: **S10 có trong danh sách** nhờ các ô Đỏ trong phạm vi; S03 Không đỏ **không có trong danh sách**. |
| one-red-in-scope | Chỉ môn còn trong phạm vi: Bật lọc+`*` trước+màu, scope chỉ **Ngữ văn**; giữ Ngữ văn20 Đỏ của S10, Toán ngoài scope; chạy trích xuất. | 2. Bước 2: S10 vẫn có trong danh sách nhờ Ngữ văn 20 Đỏ; không được loại S10 chỉ vì ô Toán ngoài phạm vi. |
| no-red-in-scope | Đối chứng không có ô đỏ: Cùng scope Toán/Ngữ văn và lọc bật như lượt multi-red-scope; đọc riêng S03/Không đỏ ở mọi môn. | Đối chứng **S03** không có ô Đỏ nào trong phạm vi → **không có trong danh sách** khi bật lọc đỏ. |
| filter-off | Ký hiệu không bật lọc: Chọn cấu hình chỉ **`※` trước, `!` sau**, lọc đỏ TẮT; chạy trích xuất và đọc danh sách. | 3. Bước 3: danh sách không bị lọc theo đỏ (chỉ bật ký hiệu không giới hạn học sinh). |
| another-period-only | Ô đỏ ở thời điểm khác: Bật lọc+`*` trước+màu; chọn **thời điểm khác** thời điểm ô Toán Đỏ của S10. Ô Toán của thời điểm đang chọn Không đỏ; chạy trích xuất. | 4. Bước 4: S10 không có trong danh sách; ô đỏ ở thời điểm khác không giúp thỏa điều kiện. |
| other-unit-only | Chỉ đơn vị không đỏ trong phạm vi: S06 U1=25 Đỏ, U2=35 Không đỏ; bật lọc+`*` trước+màu nhưng chọn phạm vi **chỉ U2**, chạy trích xuất. | 5. Bước 5: S06 không có trong danh sách; ô đỏ của U1 ngoài phạm vi đơn vị. |
| after-delete | Xóa một môn nhưng môn kia vẫn đỏ: Dựng baseline scope Toán/Ngữ văn như multi-red-scope; xóa thành công Toán của S10, giữ Ngữ văn20 Đỏ; chạy lại lọc cả hai môn. | 6. S10 vẫn có trong danh sách nhờ Ngữ văn 20 Đỏ; ô Toán đã xóa không còn dấu đỏ. |

#### TC-RS-FUNC-024 — Trích xuất: chỉ ô đỏ được thêm ký hiệu/tô màu

| Field | Value |
| --- | --- |
| Chức năng | Trích xuất thành tích（成績抽出） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Hiển thị ô trích xuất” (AC-G30 «Hiển thị ô trích xuất»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | fixture riêng S10, Toán=24 Đỏ và Ngữ văn=70 Không đỏ; ngưỡng cố định 30, dấu nhỏ hơn, M=100 ở cả hai mục. Không kế thừa Ngữ văn=20 của FUNC-023. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S10 (học lớp G-B và G-C), cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) |
| Thao tác | 1. Xác minh fixture riêng S10/Toán24 Đỏ/Ngữ văn70 Không đỏ.<br>2. Chạy trích xuất với tùy chọn riêng trong bảng trường hợp.<br>3. Đọc từng ô, không dùng màu cả dòng làm bằng chứng. |
| Expected | 1. cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu: ô Toán hiện `*24` với nền màu Đỏ（赤） của bảng màu; ô Ngữ văn `70` không ký hiệu, không màu; không tô cả dòng.<br>2. cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau): ô Toán `※24!`; ô Ngữ văn `70`. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| prefix-color | Ký hiệu trước và màu ô: Fixture riêng S10/Toán24 Đỏ, Ngữ văn70 Không đỏ; bật lọc+`*` trước+màu, chạy trích xuất và xem từng ô S10; không dùng Ngữ văn20 từ FUNC-023. | 1. cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu: ô Toán hiện `*24` với nền màu Đỏ（赤） của bảng màu; ô Ngữ văn `70` không ký hiệu, không màu; không tô cả dòng. |
| prefix-suffix | Ký hiệu hai phía: Cùng fixture riêng S10/Toán24 Đỏ, Ngữ văn70 Không đỏ; dùng chỉ `※` trước/`!` sau, chạy trích xuất và xem từng ô. | 2. cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau): ô Toán `※24!`; ô Ngữ văn `70`. |

#### TC-RS-FUNC-025 — Trích xuất: file Excel khớp màn hình

| Field | Value |
| --- | --- |
| Chức năng | Trích xuất thành tích（成績抽出） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Excel khớp và dùng kết luận server” (AC-G31 «Excel khớp và dùng kết luận server»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Như case “Trích xuất: chỉ ô đỏ được thêm ký hiệu/tô màu”; S05 có ô trống. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau), học sinh S05 (ô trống), học sinh S10 (học lớp G-B và G-C) |
| Thao tác | 1. Dựng fixture/thiết lập của trường hợp, chạy trích xuất và chụp màn kết quả.<br>2. Xuất/mở Excel của chính lượt đó.<br>3. Đối chiếu học sinh, số liệu, ký hiệu, màu, ô trống và điểm ẩn; đọc dấu hiệu có phát sinh xét khi tải không. |
| Expected | 1–2. Danh sách học sinh trong Excel giống màn hình (lọc đỏ đang bật). Cùng ô: ký hiệu, màu nền, số liệu, ô trống trong Excel giống màn hình. Ô trống không hiện số 0. Tải Excel không kích hoạt xét.<br><br>3. Mỗi biến thể: file Excel khớp màn hình cùng lần — (a) đủ học sinh, chỉ ô đỏ có ký hiệu/màu; (b) Excel không có học sinh giống màn hình; (c) ô bị ngừng kết quả cũ không còn ký hiệu/màu; (d) điểm ẩn không hiện lại trong Excel. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| filter-on | Xuất Excel có lọc: Chạy trích xuất lọc đỏ BẬT, chụp màn kết quả rồi tải/mở Excel cùng lượt. | Lọc đỏ bật: danh sách Excel giống màn hình đã lọc; chỉ các ô Đỏ có ký hiệu/màu. Excel khớp màn hình cùng lần về học sinh, điểm, ký hiệu, màu và ô trống; ô trống không thành 0. Tải Excel không kích hoạt xét. |
| filter-off | Xuất Excel không lọc: Cấu hình chỉ `※` trước/`!` sau, lọc đỏ TẮT; chụp màn rồi tải/mở Excel cùng lượt. | Lọc đỏ tắt: đủ học sinh như màn hình, chỉ các ô Đỏ có ký hiệu/màu. Excel khớp màn hình cùng lần về học sinh, điểm, ký hiệu, màu và ô trống; ô trống không thành 0. Tải Excel không kích hoạt xét. |
| empty | Excel không có học sinh khớp: Chọn phạm vi không có ô Đỏ; chụp màn 0kết quả rồi tải/mở Excel cùng lượt. | Phạm vi không có ô Đỏ: Excel không có học sinh, giống màn hình. Excel khớp màn hình cùng lần về học sinh, điểm, ký hiệu, màu và ô trống; ô trống không thành 0. Tải Excel không kích hoạt xét. |
| stale | Excel khi kết quả cũ ngừng hiệu lực: Chuẩn bị ô trước Đỏ chuyển Chưa xét được như BR-010, kết quả cũ ngừng; chụp màn rồi tải/mở Excel cùng lượt. | Ô có kết quả cũ đã ngừng hiệu lực không còn ký hiệu/màu đỏ trong Excel hoặc màn hình. Excel khớp màn hình cùng lần về học sinh, điểm, ký hiệu, màu và ô trống; ô trống không thành 0. Tải Excel không kích hoạt xét. |
| hidden | Excel bảo toàn điểm ẩn: Mục điểm bị ẩn theo thiết lập ẩn mục nhập, fixture ERR-014; chụp màn rồi tải/mở Excel cùng lượt. | Điểm bị ẩn không hiện lại trong Excel. Excel khớp màn hình cùng lần về học sinh, điểm, ký hiệu, màu và ô trống; ô trống không thành 0. Tải Excel không kích hoạt xét. |

#### TC-RS-VAL-017 — Trích xuất: bật ký hiệu thì bắt buộc nhập ký hiệu

| Field | Value |
| --- | --- |
| Chức năng | Trích xuất thành tích（成績抽出） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Hiển thị ô trích xuất” (AC-G30 «Hiển thị ô trích xuất»); trạng thái nguồn IMPLEMENTED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Mở Trích xuất thành tích（成績抽出）, tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Ký hiệu đầu BẬT, ô trống; ký hiệu cuối BẬT, ô trống |
| Thao tác | Chạy trích xuất với từng biến thể. |
| Expected | Có lỗi yêu cầu nhập ký hiệu; không chạy trích xuất. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| prefix | Ký hiệu trước để trống: Bật tùy chọn ký hiệu phía trước, để ký hiệu trống; chạy trích xuất. | Có lỗi yêu cầu nhập ký hiệu; không chạy trích xuất. |
| suffix | Ký hiệu sau để trống: Bật tùy chọn ký hiệu phía sau, để ký hiệu trống; chạy trích xuất. | Có lỗi yêu cầu nhập ký hiệu; không chạy trích xuất. |

#### TC-RS-UI-020 — Trích xuất: vị trí và nhãn tùy chọn đỏ

| Field | Value |
| --- | --- |
| Chức năng | Trích xuất thành tích（成績抽出） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 9.1 “Thiết lập”; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm); mục số nguyên (M=100) có quy tắc. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu |
| Thao tác | 1. Mở Trích xuất thành tích（成績抽出）→ Thiết lập mục hiển thị（表示項目設定）→ chi tiết mục Điểm đánh giá（評点） kỳ Cuối kỳ học kỳ 1（1学期期末）.<br>2. Ghi lại vị trí và nhãn các tùy chọn đỏ. |
| Expected | Theo specification v2 mục 9.1, có bốn tùy chọn độc lập: lọc học sinh có điểm đỏ, ký hiệu phía trước, ký hiệu phía sau và tô màu ô; màu chỉ chọn từ bảng màu hiện có. Vị trí và nhãn cụ thể trên UI theo Figma chỉ là tham khảo, không thay đổi oracle nghiệp vụ.<br><br>Không đánh giá nhãn/vị trí cụ thể của Figma như một oracle riêng; chỉ kiểm tra đủ bốn tùy chọn nghiệp vụ và việc lưu/mở lại đúng giá trị. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Theo specification v2 mục 9.1, có bốn tùy chọn độc lập: lọc học sinh có điểm đỏ, ký hiệu phía trước, ký hiệu phía sau và tô màu ô; màu chỉ chọn từ bảng màu hiện có. Vị trí và nhãn cụ thể trên UI theo Figma chỉ là tham khảo, không thay đổi oracle nghiệp vụ.<br><br>Không đánh giá nhãn/vị trí cụ thể của Figma như một oracle riêng; chỉ kiểm tra đủ bốn tùy chọn nghiệp vụ và việc lưu/mở lại đúng giá trị. |

#### TC-RS-UI-021 — Trích xuất: kết quả 0 học sinh và hiển thị ô đỏ số thập phân

| Field | Value |
| --- | --- |
| Chức năng | Trích xuất thành tích（成績抽出） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Lọc khi trích xuất” (AC-G29 «Lọc khi trích xuất»); trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu; (a) Không ô đỏ nào; (b) học sinh điểm 23.9 Đỏ (mục thập phân) |
| Thao tác | Chạy trích xuất cho (a), (b). |
| Expected | (a) Không lỗi; hiện thông báo không có học sinh khớp.<br><br>(b) Ô hiện `*23.9` (giữ nguyên giá trị điểm). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| empty | Không có học sinh đỏ: Fixture(a) không ô Đỏ; cấu hình lọc+`*` trước+màu; chạy trích xuất. | (a) Không lỗi; hiện thông báo không có học sinh khớp. |
| decimal | Hiển thị điểm thập phân: Fixture(b) học sinh có điểm23.9 Đỏ ở mục thập phân; cùng cấu hình lọc+`*` trước+màu, chạy trích xuất. | (b) Ô hiện `*23.9` (giữ nguyên giá trị điểm). |

#### TC-RS-ERR-013 — Trích xuất: ô vừa thỏa điều kiện màu khác vừa là ô đỏ

| Field | Value |
| --- | --- |
| Chức năng | Trích xuất thành tích（成績抽出） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Hiển thị ô trích xuất” (AC-G30 «Hiển thị ô trích xuất»); context hiện chỉ quy định có thể tô màu điểm đỏ và màn hình/Excel phải nhất quán; trạng thái nguồn TBD (màu ưu tiên khi trùng); ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Awaiting decision |
| Readiness | Blocked |
| Gap | G-ORACLE-TC-RS-ERR-013 |
| Cấu hình | Mục có điều kiện Khoảng điểm（点数範囲） 0–30 tô Vàng（黄） và điều kiện đỏ tô Đỏ（赤）, ký hiệu `*`. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S01 (điểm 29) (29) |
| Thao tác | Chạy trích xuất, xuất Excel. |
| Expected | **Blocked — chờ quyết định nghiệp vụ về màu ưu tiên** khi ô đồng thời có màu Khoảng điểm（点数範囲） và màu điểm đỏ. Không tự kết luận PASS/FAIL cho màu cuối. CONFIRMED phần không tranh chấp (chỉ ghi nhận khi chạy sau quyết định): điều kiện Khoảng điểm vẫn giữ nghĩa cũ; màn hình và Excel cho cùng kết quả. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: chạy trích xuất + Excel khi ô vừa thỏa Khoảng điểm vừa đỏ. | **Blocked:** chờ quyết định màu ưu tiên. Không PASS/FAIL màu cuối cho tới khi có quyết định. |

#### TC-RS-REG-006 — Trích xuất: mẫu hiện có không cấu hình đỏ cho kết quả như trước

| Field | Value |
| --- | --- |
| Chức năng | Trích xuất thành tích（成績抽出） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 9.1 “Thiết lập”, mục 9.2 “Kết quả và ví dụ”, mục 9.3 “Xuất file”; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Ba mẫu trích xuất hiện có (có Khoảng điểm（点数範囲） tô màu, có lọc, có ký hiệu). Baseline màn và Excel. Mục có quy tắc “Cố định 30” (dưới 30). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30); học sinh S01–S10 |
| Thao tác | 1. Chạy lại ba mẫu, xuất Excel, so với baseline.<br>2. Mở màn tạo mẫu trích xuất mới, Thiết lập công khai thành tích（成績公開設定） chưa từng lưu hiệu ứng đỏ, và dòng Thiết lập điểm đỏ（赤点設定） của một bảng phiếu điểm mới. |
| Expected | 1. Danh sách học sinh, giá trị, ký hiệu, màu và định dạng Excel bằng baseline (mẫu chưa bật tùy chọn đỏ).<br>2. (PROPOSED) Trích xuất: lọc đỏ và các hiệu ứng đỏ mặc định TẮT; công khai: chưa chọn hiệu ứng đỏ nào, và khi chưa cấu hình thì màn học sinh vẫn hiển thị như hiện có dù mục có ô Đỏ; phiếu điểm: Nguyên trạng（そのまま表示）. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| color | Mẫu màu hiện hữu: Dùng mẫu hiện có Khoảng điểm（点数範囲） tô màu, chưa bật tùy chọn đỏ; chạy/xuất Excel và so baseline của mẫu. | Mẫu hiện có chưa bật tùy chọn đỏ: danh sách học sinh, giá trị, ký hiệu, màu và định dạng Excel **bằng baseline** của chính mẫu này. |
| filter | Mẫu lọc hiện hữu: Dùng mẫu hiện có lọc, chưa bật tùy chọn đỏ; chạy/xuất Excel và so baseline của mẫu. | Mẫu hiện có chưa bật tùy chọn đỏ: danh sách học sinh, giá trị, ký hiệu, màu và định dạng Excel **bằng baseline** của chính mẫu này. |
| symbol | Mẫu ký hiệu hiện hữu: Dùng mẫu hiện có ký hiệu, chưa bật tùy chọn đỏ; chạy/xuất Excel và so baseline của mẫu. | Mẫu hiện có chưa bật tùy chọn đỏ: danh sách học sinh, giá trị, ký hiệu, màu và định dạng Excel **bằng baseline** của chính mẫu này. |
| defaults | Mặc định cấu hình mới: Mở tạo mẫu trích xuất mới, công khai chưa lưu hiệu ứng đỏ và dòng đỏ của bảng phiếu mới; quan sát mặc định, phần này PROPOSED. | **PROPOSED**: Trích xuất mới mặc định TẮT lọc/hiệu ứng đỏ; công khai chưa chọn hiệu ứng đỏ và màn học sinh giữ hiển thị hiện có dù có ô Đỏ; phiếu điểm mặc định **Nguyên trạng（そのまま表示）**. |

### Flow: Công khai thành tích（成績公開）

#### TC-RS-FUNC-026 — Công khai thành tích（成績公開）: ba hiệu ứng đỏ hiển thị đúng ở màn học sinh

| Field | Value |
| --- | --- |
| Chức năng | Công khai thành tích（成績公開） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Cấu hình công khai và ẩn điểm” (AC-G32 «Cấu hình công khai và ẩn điểm»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | S01 Đỏ (29), không phải điểm dự kiến. Lịch công khai đang mở. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); mục điểm đơn vị (đơn vị U1 có M riêng 40); học sinh S01 (điểm 29), học sinh S06 (điểm dự kiến 24), tài khoản học sinh S01, tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm) |
| Thao tác | 1. Dựng đúng ô Đỏ và tài khoản học sinh của trường hợp, lịch công khai mở.<br>2. Lưu hiệu ứng riêng, xem màn học sinh và mở lại thiết lập khi trường hợp yêu cầu.<br>3. Đọc đúng ô/đơn vị, đối chiếu hiệu ứng và ô đối chứng. |
| Expected | 1–3. Lần lượt `(29)`, `*29`, `29*`. Không có nền màu riêng cho ô đỏ.<br><br>4. Hiệu ứng đã lưu gần nhất (`*` phía sau) được chọn sẵn.<br>5. Ô U1 hiện `*25`; ô U2 không ký hiệu. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| parentheses | Hiệu ứng ngoặc: S01=29 Đỏ; lưu **Ngoặc（括弧）**, xem Xác nhận thành tích（成績確認） bằng S01. | Ô S01 Đỏ hiển thị **`(29)`**, không có nền màu riêng cho ô Đỏ. |
| prefix | Hiệu ứng phía trước: S01=29 Đỏ; lưu `*` phía trước, xem bằng S01. | Ô S01 Đỏ hiển thị **`*29`**, không có nền màu riêng cho ô Đỏ. |
| suffix-reopen | Hiệu ứng phía sau và mở lại: S01=29 Đỏ; lưu `*` phía sau, xem bằng S01 rồi mở lại thiết lập. | Ô S01 Đỏ hiển thị **`29*`**, không có nền màu riêng. Mở lại, hiệu ứng đã lưu gần nhất **`*` phía sau** được chọn sẵn. |
| unit-prefix | Điểm đơn vị với hiệu ứng phía trước: S06/U1=25 Đỏ; lưu `*` phía trước ở mục điểm đơn vị, xem bằng S06 và đối chiếu U2. | Ô U1 Đỏ của S06 hiển thị **`*25`**; U2 không ký hiệu, không có nền màu riêng cho ô Đỏ. |

#### TC-RS-FUNC-027 — Công khai: kết hợp hiệu ứng Điểm dự kiến（見込点） và điểm đỏ, khử trùng

| Field | Value |
| --- | --- |
| Chức năng | Công khai thành tích（成績公開） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Kết hợp hiệu ứng công khai” (AC-G33 «Kết hợp hiệu ứng công khai»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | S06 = 24, vừa là Điểm dự kiến（見込点） vừa Đỏ. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Người có quyền cấu hình công khai; xem bằng tài khoản học sinh S06 đúng trường/năm/lịch mở. |
| Fixture | local: học sinh S06 (điểm dự kiến 24), tài khoản học sinh S06; fixture quyền phải map đúng học sinh S06, không dùng tài khoản S01 để xem dữ liệu S06. |
| Thao tác | Với mỗi dòng của bảng dưới, cấu hình hiệu ứng dự kiến và hiệu ứng đỏ, lưu, xem màn học sinh của S06.<br><br>(a) Ngoặc + `*` trước; (b) `*` trước + `*` trước; (c) Ngoặc + Ngoặc; (d) `*` trước + `*` sau; (e) không trang trí + Ngoặc; (f) điểm bị ẩn theo thiết lập hiện có（表示しない） + `*` trước. |
| Expected | (a) `(*24)`; (b) `*24`, không phải `**24`; (c) `(24)`, không phải `((24))`; (d) `*24*`; (e) `(24)`; (f) vẫn ẩn, không hiện số, không để lại riêng dấu `*`. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| a | Ngoặc dự kiến và ký hiệu đỏ phía trước: S06=24 vừa Điểm dự kiến（見込点） vừa Đỏ; hiệu ứng **Ngoặc + `*` trước**. Lưu và xem bằng tài khoản S06. | Hiển thị **`(*24)`**; giữ identity/quyền của S06, không dùng tài khoản S01 để xem S06. |
| b | Cùng ký hiệu phía trước: S06=24 vừa Điểm dự kiến（見込点） vừa Đỏ; hiệu ứng **`*` trước + `*` trước**. Lưu và xem bằng tài khoản S06. | Hiển thị **`*24`, không phải `**24`**; giữ identity/quyền của S06, không dùng tài khoản S01 để xem S06. |
| c | Cùng hiệu ứng ngoặc: S06=24 vừa Điểm dự kiến（見込点） vừa Đỏ; hiệu ứng **Ngoặc + Ngoặc**. Lưu và xem bằng tài khoản S06. | Hiển thị **`(24)`, không phải `((24))`**; giữ identity/quyền của S06, không dùng tài khoản S01 để xem S06. |
| d | Ký hiệu ở hai phía: S06=24 vừa Điểm dự kiến（見込点） vừa Đỏ; hiệu ứng **`*` trước + `*` sau**. Lưu và xem bằng tài khoản S06. | Hiển thị **`*24*`**; giữ identity/quyền của S06, không dùng tài khoản S01 để xem S06. |
| e | Chỉ ngoặc đỏ: S06=24 vừa Điểm dự kiến（見込点） vừa Đỏ; hiệu ứng **Dự kiến không trang trí + đỏ Ngoặc**. Lưu và xem bằng tài khoản S06. | Hiển thị **`(24)`**; giữ identity/quyền của S06, không dùng tài khoản S01 để xem S06. |
| f | Điểm ẩn: S06=24 vừa Điểm dự kiến（見込点） vừa Đỏ; hiệu ứng **Điểm bị ẩn theo thiết lập hiện có（表示しない） + đỏ `*` trước**. Lưu và xem bằng tài khoản S06. | Hiển thị **Điểm vẫn ẩn, không hiện số hoặc để riêng dấu `*`**; giữ identity/quyền của S06, không dùng tài khoản S01 để xem S06. |

#### TC-RS-FUNC-028 — Công khai: web, API và PDF học sinh dùng cùng kết quả và cùng hiệu ứng

| Field | Value |
| --- | --- |
| Chức năng | Công khai thành tích（成績公開） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Đúng người, lịch và đầu ra công khai” (AC-G34 «Đúng người, lịch và đầu ra công khai»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Như case “Công khai thành tích（成績公開）: ba hiệu ứng đỏ hiển thị đúng ở màn học sinh” với hiệu ứng `*` trước. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S01 (điểm 29), tài khoản học sinh S01 |
| Thao tác | 1. Xác minh S01=29 Đỏ và cấu hình công khai `*` trước, phiên học sinh đúng quyền.<br>2. Xem/tải kênh của trường hợp, đối chiếu cùng ô với các kênh còn lại. |
| Expected | Cả ba hiển thị `*29` cho cùng ô; không nền màu. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| web | Web học sinh: S01=29 Đỏ, hiệu ứng `*` phía trước; dùng tài khoản S01 xem/tải màn **Xác nhận thành tích（成績確認）** của cùng ô/kỳ. | Cả ba hiển thị `*29` cho cùng ô; không nền màu. |
| api | API học sinh: S01=29 Đỏ, hiệu ứng `*` phía trước; dùng tài khoản S01 xem/tải response API công khai bằng phiên học sinh của cùng ô/kỳ. | Cả ba hiển thị `*29` cho cùng ô; không nền màu. |
| pdf | PDF học sinh: S01=29 Đỏ, hiệu ứng `*` phía trước; dùng tài khoản S01 xem/tải PDF công khai của đúng học sinh của cùng ô/kỳ. | Cả ba hiển thị `*29` cho cùng ô; không nền màu. |

#### TC-RS-FUNC-037 — Công khai: cùng mục dùng hiệu ứng đỏ khác nhau ở hai cấu hình công khai

| Field | Value |
| --- | --- |
| Chức năng | Công khai thành tích（成績公開） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Cấu hình công khai và ẩn điểm” (AC-G32 «Cấu hình công khai và ẩn điểm»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Hai cấu hình Thiết lập công khai thành tích（成績公開設定） X và Y cùng chứa mục số nguyên (M=100); S01 Đỏ (29), không phải điểm dự kiến; lịch công khai của cả hai đang mở cho S01. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: hai cấu hình công khai cùng một mục, cấu hình công khai có mục điểm thường và mục điểm đơn vị; mục số nguyên (M=100), mục điểm đơn vị (đơn vị U1 có M riêng 40); học sinh S01 (điểm 29); tài khoản học sinh S01, tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm) |
| Thao tác | 1. Dựng X/Y cùng mục S01=29 Đỏ, lịch công khai mở và đúng quyền S01; giữ cấu hình/baseline của trường hợp độc lập.<br>2. Thực hiện thao tác hoặc kênh đọc riêng trong bảng trường hợp; lưu/mở lại khi trường hợp yêu cầu.<br>3. Đối chiếu identity, cấu hình và kết quả; kiểm X/Y và phân loại thường/đơn vị không ảnh hưởng lẫn nhau. |
| Expected | 1–2. X giữ Ngoặc, Y giữ `*` phía trước; lưu cấu hình này không đổi cấu hình kia.<br>3. Theo X: `(29)`; theo Y: `*29`. Web, API và PDF của cùng cấu hình cho cùng cách hiển thị.<br>4. X' giữ Ngoặc cho mục số nguyên (M=100); không sao chép kết quả xét của học sinh.<br>5. Mỗi phân loại thường/đơn vị mở lại đúng lựa chọn của mình; không trộn.<br>6. Có thông báo lỗi; Y vẫn là `*` phía trước (cấu hình cũ được giữ). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| web | Đối chiếu X/Y trên web: Lưu X=**Ngoặc（括弧）**, Y=**`*` phía trước**, cùng mục S01=29 Đỏ; mở lại cả hai rồi đăng nhập S01 xem từng cấu hình trên Xác nhận thành tích（成績確認）. | 1–2. X giữ Ngoặc, Y giữ `*` phía trước; lưu cấu hình này không đổi cấu hình kia.<br>3. Theo X: `(29)`; theo Y: `*29`. Web, API và PDF của cùng cấu hình cho cùng cách hiển thị. |
| api | Đối chiếu X/Y qua API: Dựng X=Ngoặc, Y=`*` trước như web; đọc API của từng cấu hình bằng quyền S01 nếu API có, đối chiếu cùng identity/kỳ. | 1–2. X giữ Ngoặc, Y giữ `*` phía trước; lưu cấu hình này không đổi cấu hình kia.<br>3. Theo X: `(29)`; theo Y: `*29`. Web, API và PDF của cùng cấu hình cho cùng cách hiển thị. |
| pdf | Đối chiếu X/Y trên PDF: Dựng X=Ngoặc, Y=`*` trước như web; xuất PDF của từng cấu hình nếu có, đối chiếu cùng S01/kỳ. | 1–2. X giữ Ngoặc, Y giữ `*` phía trước; lưu cấu hình này không đổi cấu hình kia.<br>3. Theo X: `(29)`; theo Y: `*29`. Web, API và PDF của cùng cấu hình cho cùng cách hiển thị. |
| copy | Sao chép cấu hình X: Sau setup X=Ngoặc cho mục số nguyên M=100, dùng chức năng sao chép hiện hữu tạo X′ rồi mở bản sao; không dùng kết quả xét cá nhân làm dữ liệu copy. | 4. X' giữ Ngoặc cho mục số nguyên (M=100); không sao chép kết quả xét của học sinh. |
| item-types | Điểm thường và đơn vị độc lập: Ở X: mục số nguyên **điểm thường（通常）=Ngoặc**, mục điểm đơn vị U1/M40 **điểm đơn vị（単元）=`*` phía sau**; lưu/mở lại. | 5. Mỗi phân loại thường/đơn vị mở lại đúng lựa chọn của mình; không trộn. |
| save-failure | Lỗi lưu không đổi Y: Dựng Y đang lưu **`*` phía trước**; đổi sang `*` phía sau và giả lập lỗi lưu được phép, mở lại Y và đọc thông báo. | 6. Có thông báo lỗi; Y vẫn là `*` phía trước (cấu hình cũ được giữ). |

#### TC-RS-BR-025 — Đầu ra không bị chặn vì chưa có hoặc chưa xét được kết quả đỏ

| Field | Value |
| --- | --- |
| Chức năng | Công khai thành tích（成績公開） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Xem/xuất không tự xét” (AC-G28 «Xem/xuất không tự xét»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Một số ô Chưa từng xét, một số Chưa xét được. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước |
| Thao tác | 1. Xác minh fixture có ô Chưa từng xét/Chưa xét được và quyền/lịch/ẩn hiện hữu.<br>2. Xem/xuất kênh của trường hợp, ghi khả năng hoàn tất và trạng thái hiển thị. |
| Expected | Mọi thao tác hoàn tất bình thường; ô chưa có kết quả không có dấu đỏ và hiển thị theo thiết lập hiện hữu. Quyền, lịch công khai, điều kiện ẩn hiện có vẫn giữ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| extract | Trích xuất: Fixture có ô **Chưa từng xét** và **Chưa xét được**; xem/xuất màn **Trích xuất thành tích（成績抽出）** theo quyền, lịch và thiết lập ẩn hiện hữu; đọc khả năng hoàn tất và dấu đỏ. | Mọi thao tác hoàn tất bình thường; ô chưa có kết quả không có dấu đỏ và hiển thị theo thiết lập hiện hữu. Quyền, lịch công khai, điều kiện ẩn hiện có vẫn giữ. |
| excel | Excel trích xuất: Fixture có ô **Chưa từng xét** và **Chưa xét được**; xem/xuất file **Excel** sau Trích xuất thành tích（成績抽出） theo quyền, lịch và thiết lập ẩn hiện hữu; đọc khả năng hoàn tất và dấu đỏ. | Mọi thao tác hoàn tất bình thường; ô chưa có kết quả không có dấu đỏ và hiển thị theo thiết lập hiện hữu. Quyền, lịch công khai, điều kiện ẩn hiện có vẫn giữ. |
| publish | Công khai: Fixture có ô **Chưa từng xét** và **Chưa xét được**; xem/xuất màn **Công khai thành tích（成績公開）** theo quyền, lịch và thiết lập ẩn hiện hữu; đọc khả năng hoàn tất và dấu đỏ. | Mọi thao tác hoàn tất bình thường; ô chưa có kết quả không có dấu đỏ và hiển thị theo thiết lập hiện hữu. Quyền, lịch công khai, điều kiện ẩn hiện có vẫn giữ. |
| report | Phiếu điểm: Fixture có ô **Chưa từng xét** và **Chưa xét được**; xem/xuất PDF **Công cụ phiếu điểm（通知表ツール）** theo quyền, lịch và thiết lập ẩn hiện hữu; đọc khả năng hoàn tất và dấu đỏ. | Mọi thao tác hoàn tất bình thường; ô chưa có kết quả không có dấu đỏ và hiển thị theo thiết lập hiện hữu. Quyền, lịch công khai, điều kiện ẩn hiện có vẫn giữ. |

#### TC-RS-UI-022 — Công khai: dòng cách hiển thị đỏ theo mục có thiết lập, kể cả khi 0 học sinh đỏ hoặc vừa xóa thiết lập cuối

| Field | Value |
| --- | --- |
| Chức năng | Công khai thành tích（成績公開） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Cấu hình công khai và ẩn điểm” (AC-G32 «Cấu hình công khai và ẩn điểm»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) có quy tắc nhưng không ô nào đỏ; mục Tri thức – kỹ năng（知識・技能） chưa từng có quy tắc và chưa từng đặt cách hiển thị đỏ. tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30) |
| Thao tác | 1. Mở Thiết lập công khai thành tích（成績公開設定）→ khung Thành tích（成績）.<br>2. Ở dòng của Điểm đánh giá（評点）, chọn `*` phía trước, bấm Đăng ký（登録する）.<br>3. Xóa quy tắc cuối của mục số nguyên (M=100) (chỉ còn quy tắc “Cố định 30” (dưới 30) thì xóa quy tắc “Cố định 30” (dưới 30)), **không** chạy lại; mở lại khung Thành tích（成績）. |
| Expected | 1. Mục Điểm đánh giá（評点） có dòng cách hiển thị đỏ dù 0 học sinh đỏ; mục Tri thức – kỹ năng（知識・技能） không có dòng.<br>2. Lưu được; mở lại vẫn là `*` phía trước.<br>3. Dòng của Điểm đánh giá（評点） vẫn hiện với lựa chọn `*` phía trước đã lưu; cấu hình trình bày không bị xóa theo thao tác xóa quy tắc. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. Mục Điểm đánh giá（評点） có dòng cách hiển thị đỏ dù 0 học sinh đỏ; mục Tri thức – kỹ năng（知識・技能） không có dòng.<br>2. Lưu được; mở lại vẫn là `*` phía trước.<br>3. Dòng của Điểm đánh giá（評点） vẫn hiện với lựa chọn `*` phía trước đã lưu; cấu hình trình bày không bị xóa theo thao tác xóa quy tắc. |

#### TC-RS-UI-023 — Công khai: danh sách tùy chọn hiển thị đỏ

| Field | Value |
| --- | --- |
| Chức năng | Công khai thành tích（成績公開） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 10.1 “Phạm vi và tùy chọn”; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Như UI-022. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | Mở danh sách chọn của dòng đỏ. |
| Expected | Theo specification v2 mục 10.1 và Q&amp;A Q16, danh sách chỉ có Kèm ngoặc, `*` phía trước và `*` phía sau; không có ô chữ tự do và không có màu nền riêng. Không đưa tùy chọn Nguyên trạng（そのまま表示） vào oracle vì không thuộc danh sách đã chốt trong specification/Q&amp;A. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Theo specification v2 mục 10.1 và Q&amp;A Q16, danh sách chỉ có Kèm ngoặc, `*` phía trước và `*` phía sau; không có ô chữ tự do và không có màu nền riêng. Không đưa tùy chọn Nguyên trạng（そのまま表示） vào oracle vì không thuộc danh sách đã chốt trong specification/Q&amp;A. |

#### TC-RS-UI-026 — Bộ chọn hiệu ứng đỏ của điểm thường và điểm đơn vị hiển thị độc lập

| Field | Value |
| --- | --- |
| Chức năng | Công khai thành tích（成績公開） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Cấu hình công khai và ẩn điểm” (AC-G32 «Cấu hình công khai và ẩn điểm»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Có một cấu hình công khai chứa cả mục điểm thường và mục điểm đơn vị; tài khoản có quyền sửa cấu hình công khai. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục thường và mục đơn vị cùng có kết quả đỏ; lựa chọn hiển thị khác nhau cho hai loại. |
| Thao tác | 1. Mở màn hình cấu hình công khai và đến khu vực hiển thị điểm đỏ.<br>2. Kiểm tra panel điểm thường và panel điểm đơn vị.<br>3. Chọn hiệu ứng khác nhau cho hai panel, lưu, đóng và mở lại. |
| Expected | 1. Cả hai panel đều hiển thị bộ chọn tương ứng; panel điểm đơn vị không bị nền hoặc lớp khác che.<br>2. Có thể thao tác hai bộ chọn độc lập.<br>3. Sau khi mở lại, mỗi panel giữ đúng lựa chọn của mình; lựa chọn điểm thường không ghi đè lựa chọn điểm đơn vị và ngược lại. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. Cả hai panel đều hiển thị bộ chọn tương ứng; panel điểm đơn vị không bị nền hoặc lớp khác che.<br>2. Có thể thao tác hai bộ chọn độc lập.<br>3. Sau khi mở lại, mỗi panel giữ đúng lựa chọn của mình; lựa chọn điểm thường không ghi đè lựa chọn điểm đơn vị và ngược lại. |

#### TC-RS-REG-007 — Công khai: hiệu ứng Điểm dự kiến（見込点） và thiết lập khác được giữ

| Field | Value |
| --- | --- |
| Chức năng | Công khai thành tích（成績公開） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Kết hợp hiệu ứng công khai” (AC-G33 «Kết hợp hiệu ứng công khai»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | cấu hình công khai: “*” phía trước. S06 (dự kiến, Đỏ). Một học sinh khác có điểm dự kiến, Không đỏ. Baseline màn học sinh. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cấu hình công khai: “*” phía trước; học sinh S06 (điểm dự kiến 24) |
| Thao tác | 1. Xem màn học sinh.<br>2. Làm S06 chuyển Chưa xét được (như case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”), xem lại.<br>3. Xóa quy tắc cuối, mở Thiết lập công khai thành tích（成績公開設定）. |
| Expected | 1. Học sinh Không đỏ hiển thị như baseline (ngoặc dự kiến).<br>2. S06 bỏ `*` đỏ nhưng giữ ngoặc dự kiến: `(24)`.<br>3. Cấu hình hiển thị đã lưu không bị xóa. Nền và định dạng khác như baseline. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. Học sinh Không đỏ hiển thị như baseline (ngoặc dự kiến).<br>2. S06 bỏ `*` đỏ nhưng giữ ngoặc dự kiến: `(24)`.<br>3. Cấu hình hiển thị đã lưu không bị xóa. Nền và định dạng khác như baseline. |

#### TC-RS-REG-008 — Công khai: điểm ẩn, lịch và đối tượng công khai được giữ

| Field | Value |
| --- | --- |
| Chức năng | Công khai thành tích（成績公開） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Cấu hình công khai và ẩn điểm” (AC-G32 «Cấu hình công khai và ẩn điểm»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Ready |
| Gap | none |
| Cấu hình | S06 Đỏ, mục đặt Không hiển thị（表示しない） cho điểm dự kiến; lịch công khai đang mở cho HR2; một lịch đã đóng. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Người có quyền cấu hình công khai; xem bằng tài khoản học sinh S06 đúng trường/năm/lịch mở. |
| Fixture | local: học sinh S06 (điểm dự kiến 24), tài khoản học sinh S06 theo TD-ROLE-06; TD-ROLE-05 thuộc S01 và không dùng cho case này. |
| Thao tác | 1. Xác minh S06/TD-ROLE-06, thiết lập ẩn điểm dự kiến và lịch của trường hợp.<br>2. Xem/tải đúng kênh và lịch mở/đóng trong bảng trường hợp.<br>3. Đối chiếu baseline quyền/ẩn, không dùng tài khoản S01 để kiểm S06. |
| Expected | 1. Điểm vẫn ẩn; không có dấu đỏ riêng lẻ.<br>2. Không xem được như baseline. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| web-open | Web học sinh khi lịch mở: Tài khoản **S06 theo TD-ROLE-06**, không dùng S01/TD-ROLE-05; S06 có điểm dự kiến24/Đỏ, mục Không hiển thị（表示しない）. Lịch HR2 **mở**: xem/tải màn **Xác nhận thành tích（成績確認）** của S06 và đối chiếu baseline quyền/ẩn. | 1. Điểm vẫn ẩn; không có dấu đỏ riêng lẻ. |
| api-open | API học sinh khi lịch mở: Tài khoản **S06 theo TD-ROLE-06**, không dùng S01/TD-ROLE-05; S06 có điểm dự kiến24/Đỏ, mục Không hiển thị（表示しない）. Lịch HR2 **mở**: xem/tải response API công khai bằng phiên học sinh của S06 và đối chiếu baseline quyền/ẩn. | 1. Điểm vẫn ẩn; không có dấu đỏ riêng lẻ. |
| pdf-open | PDF học sinh khi lịch mở: Tài khoản **S06 theo TD-ROLE-06**, không dùng S01/TD-ROLE-05; S06 có điểm dự kiến24/Đỏ, mục Không hiển thị（表示しない）. Lịch HR2 **mở**: xem/tải PDF công khai của đúng học sinh của S06 và đối chiếu baseline quyền/ẩn. | 1. Điểm vẫn ẩn; không có dấu đỏ riêng lẻ. |
| web-closed | Web học sinh khi lịch đóng: Tài khoản **S06 theo TD-ROLE-06**, không dùng S01/TD-ROLE-05; S06 có điểm dự kiến24/Đỏ, mục Không hiển thị（表示しない）. Lịch **đóng**: xem/tải màn **Xác nhận thành tích（成績確認）** của S06 và đối chiếu baseline quyền/ẩn. | 2. Không xem được như baseline. |
| api-closed | API học sinh khi lịch đóng: Tài khoản **S06 theo TD-ROLE-06**, không dùng S01/TD-ROLE-05; S06 có điểm dự kiến24/Đỏ, mục Không hiển thị（表示しない）. Lịch **đóng**: xem/tải response API công khai bằng phiên học sinh của S06 và đối chiếu baseline quyền/ẩn. | 2. Không xem được như baseline. |
| pdf-closed | PDF học sinh khi lịch đóng: Tài khoản **S06 theo TD-ROLE-06**, không dùng S01/TD-ROLE-05; S06 có điểm dự kiến24/Đỏ, mục Không hiển thị（表示しない）. Lịch **đóng**: xem/tải PDF công khai của đúng học sinh của S06 và đối chiếu baseline quyền/ẩn. | 2. Không xem được như baseline. |

### Flow: Công cụ phiếu điểm（通知表ツール） và PDF

#### TC-RS-FUNC-029 — Công cụ phiếu điểm（通知表ツール）: bốn cách hiển thị đỏ trên PDF

| Field | Value |
| --- | --- |
| Chức năng | Công cụ phiếu điểm（通知表ツール） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Tùy chọn trên phiếu” (AC-G35 «Tùy chọn trên phiếu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | S01 Đỏ (29), không điểm dự kiến, không cờ nào. Các dòng khác của hộp tùy chọn chọn Nguyên trạng（そのまま表示）. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S01 (điểm 29), cấu hình phiếu điểm: ký tự “※” phía trước, tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm) |
| Thao tác | Với từng cách hiển thị: chọn ở dòng Thiết lập điểm đỏ（赤点設定）, đóng hộp, bấm Cập nhật（更新する）, xuất PDF phiếu của S01.<br><br>(a) Nguyên trạng（そのまま表示）; (b) Kèm ngoặc（カッコ付き）; (c) Ký tự phía trước（前に任意の文字） `※`; (d) Ký tự phía sau（後ろに任意の文字） `※`. |
| Expected | (a) `29`; (b) `(29)`; (c) `※29`; (d) `29※`. Không nền màu; ký tự không tràn ô, không mất ký tự, không đổi cấu trúc template. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| unchanged | Nguyên trạng: S01=29 Đỏ; chọn **Nguyên trạng（そのまま表示）**, Cập nhật rồi xuất PDF. | PDF của S01 hiển thị **`29`**. Không nền màu; không tràn/mất ký tự và không đổi cấu trúc template. |
| parentheses | Kèm ngoặc: S01=29 Đỏ; chọn **Kèm ngoặc（カッコ付き）**, Cập nhật rồi xuất PDF. | PDF của S01 hiển thị **`(29)`**. Không nền màu; không tràn/mất ký tự và không đổi cấu trúc template. |
| prefix | Ký tự phía trước: S01=29 Đỏ; chọn **Ký tự phía trước（前に任意の文字）**=`※`, Cập nhật rồi xuất PDF. | PDF của S01 hiển thị **`※29`**. Không nền màu; không tràn/mất ký tự và không đổi cấu trúc template. |
| suffix | Ký tự phía sau: S01=29 Đỏ; chọn **Ký tự phía sau（後ろに任意の文字）**=`※`, Cập nhật rồi xuất PDF. | PDF của S01 hiển thị **`29※`**. Không nền màu; không tràn/mất ký tự và không đổi cấu trúc template. |

#### TC-RS-FUNC-030 — Phiếu điểm: thứ tự điều kiện và dừng ở điều kiện khớp đầu tiên

| Field | Value |
| --- | --- |
| Chức năng | Công cụ phiếu điểm（通知表ツール） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Phiếu dừng ở điều kiện khớp đầu tiên” (AC-G36 «Phiếu dừng ở điều kiện khớp đầu tiên»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | S06 = 24 vừa dự kiến vừa Đỏ; S01 = 29 Đỏ, không cờ; S05 ô trống, trước đó từng Đỏ. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S06 (điểm dự kiến 24), học sinh S01 (điểm 29), học sinh S05 (ô trống), cấu hình phiếu điểm: ký tự “※” phía trước |
| Thao tác | Cấu hình hộp tùy chọn theo từng dòng, bấm Cập nhật（更新する）, xuất PDF.<br><br>(a) Dự kiến = Kèm ngoặc; đỏ = `※` trước → xem S06.<br><br>(b) Dự kiến = Nguyên trạng; đỏ = `※` trước → xem S06.<br><br>(c) Dự kiến = Ẩn（表示しない） hoặc Gạch chéo（斜線）; đỏ = `※` trước → xem S06.<br><br>(d) Không điều kiện phía trên khớp; đỏ = `※` trước → xem S01.<br><br>(e) Ô trống（空欄の場合）= Kèm ngoặc; đỏ = `※` trước → xem S05.<br><br>(f) Trường hợp môn cụ thể（特定の科目の場合） = Toán, Kèm ngoặc; đỏ = `※` trước → xem S01 (Toán, Đỏ).<br><br>(g) Tạm gắn thêm cờ Chưa dự thi（未受験） cho S06; Dự kiến = Nguyên trạng, Chưa dự thi = Ẩn（表示しない）; đỏ = `※` trước → xem S06. |
| Expected | (a) `(24)`, không thêm `※`; (b) `24`, không chuyển xuống điều kiện đỏ; (c) giữ ẩn/gạch chéo, đỏ không làm hiện lại điểm; (d) `※29`; (e) không áp dấu đỏ của kết quả cũ; ô trống hiển thị theo cấu hình ô trống; (f) `(29)`, điều kiện môn cụ thể thắng, không thêm `※`; (g) `24`: Nguyên trạng ở dòng dự kiến dừng xét, không áp lệnh Ẩn của dòng chưa dự thi phía sau. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| a | Dự kiến kèm ngoặc: S06=24; Dự kiến=Kèm ngoặc, đỏ=`※` trước. Bấm **Cập nhật（更新する）** và xuất PDF. | **`(24)`, không thêm `※`**. |
| b | Dự kiến giữ nguyên: S06=24; Dự kiến=Nguyên trạng, đỏ=`※` trước. Bấm **Cập nhật（更新する）** và xuất PDF. | **`24`; không chuyển xuống điều kiện đỏ**. |
| c-hidden | Dự kiến ẩn: S06=24; Dự kiến=Ẩn（表示しない）, đỏ=`※` trước. Bấm **Cập nhật（更新する）** và xuất PDF. | **Giữ ẩn, điều kiện đỏ không làm hiện lại điểm**. |
| c-slash | Dự kiến gạch chéo: S06=24; Dự kiến=Gạch chéo（斜線）, đỏ=`※` trước. Bấm **Cập nhật（更新する）** và xuất PDF. | **Giữ gạch chéo, điều kiện đỏ không làm hiện lại điểm**. |
| d | Chỉ điều kiện đỏ khớp: S01=29; không điều kiện phía trên khớp, đỏ=`※` trước. Bấm **Cập nhật（更新する）** và xuất PDF. | **`※29`**. |
| e | Ô trống từng Đỏ: S05 trống; Ô trống（空欄の場合）=Kèm ngoặc, đỏ=`※` trước. Bấm **Cập nhật（更新する）** và xuất PDF. | **Không áp dấu đỏ của kết quả cũ; ô trống hiển thị theo cấu hình ô trống**. |
| f | Điều kiện môn cụ thể thắng: S01/Toán=29 Đỏ; Trường hợp môn cụ thể（特定の科目の場合）=Toán/Kèm ngoặc, đỏ=`※` trước. Bấm **Cập nhật（更新する）** và xuất PDF. | **`(29)`; điều kiện môn cụ thể thắng, không thêm `※`**. |
| g | Nguyên trạng dừng xét điều kiện sau: S06=24, thêm cờ Chưa dự thi（未受験）; Dự kiến=Nguyên trạng, Chưa dự thi=Ẩn（表示しない）, đỏ=`※` trước. Bấm **Cập nhật（更新する）** và xuất PDF. | **`24`; Nguyên trạng ở dòng dự kiến dừng xét, không áp Ẩn của dòng chưa dự thi phía sau**. |

#### TC-RS-FUNC-031 — Phiếu điểm: lưu qua Cập nhật（更新する）, mở lại giữ lựa chọn; chỉ dùng điều kiện đỏ vẫn được ghi nhận

| Field | Value |
| --- | --- |
| Chức năng | Công cụ phiếu điểm（通知表ツール） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Lưu, sao chép và PDF phiếu” (AC-G37 «Lưu, sao chép và PDF phiếu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Bảng điểm（成績表） chưa dùng điều kiện nào (Thiết lập điều kiện hiển thị（表示条件を設定）= Không thiết lập（設定しない）). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cấu hình phiếu điểm: ký tự “※” phía trước |
| Thao tác | 1. Mở hộp tùy chọn, chọn Thiết lập（設定する）, chỉ chọn dòng đỏ = `※` trước, các dòng khác Nguyên trạng. Đóng hộp, **không** bấm Cập nhật; tải lại trang.<br>2. Lặp lại, lần này bấm Cập nhật（更新する）; tải lại, mở hộp.<br>3. Xuất PDF. |
| Expected | 1. Không bấm Cập nhật: thay đổi không được lưu (hành vi hiện có).<br>2. Có bấm Cập nhật: mở lại thấy dòng đỏ = `※` trước; bảng được ghi nhận là có dùng điều kiện dù chỉ điều kiện đỏ được chọn.<br>3. PDF áp dụng điều kiện đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| unsaved | Đóng mà chưa cập nhật: Bảng chưa dùng điều kiện: mở tùy chọn, chọn Thiết lập（設定する）, chỉ dòng đỏ=`※` trước, các dòng khác Nguyên trạng; đóng hộp **không bấm Cập nhật**, tải lại. | 1. Không bấm Cập nhật: thay đổi không được lưu (hành vi hiện có). |
| saved-pdf | Cập nhật rồi xuất PDF: Dựng cùng baseline độc lập, chọn chỉ dòng đỏ=`※` trước; đóng hộp và bấm **Cập nhật（更新する）**, tải lại/mở hộp rồi xuất PDF. | 2. Có bấm Cập nhật: mở lại thấy dòng đỏ = `※` trước; bảng được ghi nhận là có dùng điều kiện dù chỉ điều kiện đỏ được chọn.<br>3. PDF áp dụng điều kiện đỏ. |

#### TC-RS-VAL-018 — Phiếu điểm: chỉ bắt buộc ký tự khi chọn phía trước/phía sau

| Field | Value |
| --- | --- |
| Chức năng | Công cụ phiếu điểm（通知表ツール） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Tùy chọn trên phiếu” (AC-G35 «Tùy chọn trên phiếu»); trạng thái nguồn IMPLEMENTED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Công cụ phiếu điểm（通知表ツール）, dòng Thiết lập điểm đỏ（赤点設定）. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Nguyên trạng（そのまま表示）, Kèm ngoặc（カッコ付き）, Ký tự phía trước（前に任意の文字） để trống, Ký tự phía sau（後ろに任意の文字） để trống |
| Thao tác | Chọn từng lựa chọn ở dòng Thiết lập điểm đỏ（赤点設定）, bấm Cập nhật（更新する）. |
| Expected | Nguyên trạng, Kèm ngoặc: không hiện ô ký tự, lưu được. Phía trước/sau để trống: không lưu được. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| unchanged | Nguyên trạng: Chọn Nguyên trạng（そのまま表示） ở dòng đỏ, bấm Cập nhật. | **Nguyên trạng（そのまま表示）**: không hiện ô ký tự, lưu được. |
| parentheses | Kèm ngoặc: Chọn Kèm ngoặc（カッコ付き） ở dòng đỏ, bấm Cập nhật. | **Kèm ngoặc（カッコ付き）**: không hiện ô ký tự, lưu được. |
| prefix | Ký tự trước trống: Chọn Ký tự phía trước（前に任意の文字）, để trống ký tự, bấm Cập nhật. | **Ký tự phía trước（前に任意の文字）** để trống: không lưu được. |
| suffix | Ký tự sau trống: Chọn Ký tự phía sau（後ろに任意の文字）, để trống ký tự, bấm Cập nhật. | **Ký tự phía sau（後ろに任意の文字）** để trống: không lưu được. |

#### TC-RS-DATA-010 — Sao chép mẫu phiếu điểm giữ lựa chọn hiển thị đỏ

| Field | Value |
| --- | --- |
| Chức năng | Công cụ phiếu điểm（通知表ツール） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Lưu, sao chép và PDF phiếu” (AC-G37 «Lưu, sao chép và PDF phiếu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Mẫu phiếu A có cấu hình phiếu điểm: ký tự “※” phía trước; mẫu phiếu B chỉ bật điều kiện đỏ (các dòng khác không dùng). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cấu hình phiếu điểm: ký tự “※” phía trước |
| Thao tác | 1. Sao chép mẫu A và mẫu B.<br>2. Mở dòng Thiết lập điểm đỏ（赤点設定） ở từng bản sao.<br>3. Xuất PDF bản sao với S01. |
| Expected | 1–2. Bản sao giữ lựa chọn Ký tự phía trước（前に任意の文字） `※`; mẫu chỉ dùng điều kiện đỏ vẫn còn hiệu lực.<br><br>3. PDF: ô S01 hiển thị `※29`. Không sao chép kết quả xét của học sinh. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| template-a | Sao chép mẫu A: Mẫu A dùng `※` phía trước; sao chép A, mở dòng Thiết lập điểm đỏ（赤点設定） của bản sao và xuất PDF S01. | 1–2. Bản sao giữ lựa chọn Ký tự phía trước（前に任意の文字） `※`; mẫu chỉ dùng điều kiện đỏ vẫn còn hiệu lực.<br><br>3. PDF: ô S01 hiển thị `※29`. Không sao chép kết quả xét của học sinh. |
| template-b | Sao chép mẫu chỉ dùng đỏ: Mẫu B chỉ bật điều kiện đỏ, dòng khác không dùng; sao chép B, mở dòng đỏ và xuất PDF S01. | 1–2. Bản sao giữ lựa chọn Ký tự phía trước（前に任意の文字） `※`; mẫu chỉ dùng điều kiện đỏ vẫn còn hiệu lực.<br><br>3. PDF: ô S01 hiển thị `※29`. Không sao chép kết quả xét của học sinh. |

#### TC-RS-UI-024 — Phiếu điểm: hộp Thiết lập hiển thị tùy chọn mục đăng ký điểm（成績登録項目オプション表示設定）

| Field | Value |
| --- | --- |
| Chức năng | Công cụ phiếu điểm（通知表ツール） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Tùy chọn trên phiếu” (AC-G35 «Tùy chọn trên phiếu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm); mẫu phiếu có ô Điểm đánh giá（評点）. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cấu hình phiếu điểm: ký tự “※” phía trước |
| Thao tác | 1. Mở hộp tùy chọn của ô, chọn Thiết lập（設定する）.<br>2. Ghi lại thứ tự dòng và các lựa chọn của dòng Thiết lập điểm đỏ（赤点設定）. |
| Expected | CONFIRMED: dòng đỏ nằm sau các dòng checkbox và trước Trường hợp ô trống（空欄の場合）; lựa chọn của dòng đỏ là Nguyên trạng（そのまま表示）, Kèm ngoặc（カッコ付き）, Ký tự phía trước（前に任意の文字）, Ký tự phía sau（後ろに任意の文字）; không có Ẩn（表示しない）/Gạch chéo（斜線）.<br><br>PROPOSED: nhãn dòng 「赤点設定」 (thiết lập điểm đỏ) và câu ghi chú. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | CONFIRMED: dòng đỏ nằm sau các dòng checkbox và trước Trường hợp ô trống（空欄の場合）; lựa chọn của dòng đỏ là Nguyên trạng（そのまま表示）, Kèm ngoặc（カッコ付き）, Ký tự phía trước（前に任意の文字）, Ký tự phía sau（後ろに任意の文字）; không có Ẩn（表示しない）/Gạch chéo（斜線）.<br><br>PROPOSED: nhãn dòng 「赤点設定」 (thiết lập điểm đỏ) và câu ghi chú. |

#### TC-RS-REG-009 — Phiếu điểm: các điều kiện hiển thị hiện có giữ hành vi

| Field | Value |
| --- | --- |
| Chức năng | Công cụ phiếu điểm（通知表ツール） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Phiếu dừng ở điều kiện khớp đầu tiên” (AC-G36 «Phiếu dừng ở điều kiện khớp đầu tiên»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Hai bảng điểm hiện có: (a) dùng điều kiện môn cụ thể và ô trống; (b) dùng checkbox Chưa dự thi（未受験） với ẩn. Baseline PDF. Mục có quy tắc “Cố định 30” (dưới 30); hai bảng chưa bật dòng đỏ. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30); học sinh S05 (ô trống), học sinh S07 (điểm 35, cờ Chưa dự thi（未受験）) |
| Thao tác | Xuất PDF hai bảng, so với baseline. |
| Expected | PDF bằng baseline (cùng ký hiệu, ô ẩn, ô trống). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| subject-empty | Môn cụ thể và ô trống: Bảng a chưa bật dòng đỏ, dùng điều kiện môn cụ thể và ô trống; xuất PDF với S05 trống, so baseline ký hiệu/ô ẩn/ô trống. | PDF bằng baseline (cùng ký hiệu, ô ẩn, ô trống). |
| notexam-hidden | Chưa dự thi và ẩn: Bảng b chưa bật dòng đỏ, dùng checkbox Chưa dự thi（未受験） với ẩn; xuất PDF S07=35/cờ chưa dự thi, so baseline. | PDF bằng baseline (cùng ký hiệu, ô ẩn, ô trống). |

#### TC-RS-REG-010 — PDF phiếu: bố cục template không đổi khi có dấu đỏ

| Field | Value |
| --- | --- |
| Chức năng | Công cụ phiếu điểm（通知表ツール） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Lưu, sao chép và PDF phiếu” (AC-G37 «Lưu, sao chép và PDF phiếu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | cấu hình phiếu điểm: ký tự “※” phía trước với ký tự `※`; ô hẹp nhất của template chứa điểm 3 chữ số (ví dụ 100 nếu có quy tắc `≤100`, hoặc 29.5 cho mục thập phân). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cấu hình phiếu điểm: ký tự “※” phía trước; học sinh S01 (điểm 29), học sinh S09 (mục số thập phân 29.5) |
| Thao tác | Xuất PDF; so với baseline. |
| Expected | Dấu hiển thị đủ trong ô; không mất ký tự, không nền đỏ; các phần khác bằng baseline. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Dấu hiển thị đủ trong ô; không mất ký tự, không nền đỏ; các phần khác bằng baseline. |

### Flow: Ba đầu ra dùng chung một kết quả

#### TC-RS-FUNC-032 — Ba đầu ra dùng cùng kết quả cho cùng ô

| Field | Value |
| --- | --- |
| Chức năng | Kết quả dùng chung |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật” (AC-G22 «Kết quả chung và thứ tự cập nhật»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | cùng một lượt xét đã lưu kết quả S01 Đỏ, S03 Không đỏ, S05 Không có điểm; actor có quyền xem trích xuất, công khai và phiếu điểm. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: S01 `S=29`, S03 `S=31`, S05 ô trống; cấu hình trích xuất lọc + “*” + tô màu; công khai “*”; phiếu điểm “※”. |
| Thao tác | 1. Xác minh cùng lượt xét đã lưu S01 Đỏ, S03 Không đỏ, S05 Không có điểm và quyền xem các đầu ra.<br>2. Xem/xuất qua kênh của trường hợp, không loại S03/S05 khỏi fixture trước khi kiểm.<br>3. Đối chiếu điểm, trạng thái và kết quả đã lưu trước/sau chỉ xem/xuất; không tự tính lại rule/ngưỡng. |
| Expected | Cả ba đầu ra đều dùng cùng kết quả đã lưu: S01 có dấu đỏ theo cấu hình riêng của từng output; S03 không có dấu đỏ; S05 không bị coi là điểm 0 và không có dấu đỏ. Excel phải giữ nguyên dữ liệu; màn công khai và PDF không được tự chọn lại rule hoặc tính lại ngưỡng. Nếu chạy lại sau khi chỉ xem/xuất, kết quả và bằng chứng phải không đổi. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| extract-off | Trích xuất không lọc: Chạy lượt **không lọc** để S01=29 Đỏ, S03=31 Không đỏ, S05 trống đều có mặt; lưu Excel baseline và đối chiếu kết quả đã lưu. | Cả ba đầu ra đều dùng cùng kết quả đã lưu: S01 có dấu đỏ theo cấu hình riêng của từng output; S03 không có dấu đỏ; S05 không bị coi là điểm 0 và không có dấu đỏ. Excel phải giữ nguyên dữ liệu; màn công khai và PDF không được tự chọn lại rule hoặc tính lại ngưỡng. Nếu chạy lại sau khi chỉ xem/xuất, kết quả và bằng chứng phải không đổi. |
| extract-on | Trích xuất có lọc: Dựng baseline không lọc chứa cả S01/S03/S05; bật lọc đỏ, lưu Excel trước/sau khi xem lại, đối chiếu kết quả đã lưu. | Cả ba đầu ra đều dùng cùng kết quả đã lưu: S01 có dấu đỏ theo cấu hình riêng của từng output; S03 không có dấu đỏ; S05 không bị coi là điểm 0 và không có dấu đỏ. Excel phải giữ nguyên dữ liệu; màn công khai và PDF không được tự chọn lại rule hoặc tính lại ngưỡng. Nếu chạy lại sau khi chỉ xem/xuất, kết quả và bằng chứng phải không đổi. |
| publish | Công khai cùng lượt xét: Mở màn học sinh công khai của cùng kỳ/lượt xét chứa S01 Đỏ/S03 Không đỏ/S05 Không có điểm; đối chiếu kết quả đã lưu, không chỉ giao diện. | Cả ba đầu ra đều dùng cùng kết quả đã lưu: S01 có dấu đỏ theo cấu hình riêng của từng output; S03 không có dấu đỏ; S05 không bị coi là điểm 0 và không có dấu đỏ. Excel phải giữ nguyên dữ liệu; màn công khai và PDF không được tự chọn lại rule hoặc tính lại ngưỡng. Nếu chạy lại sau khi chỉ xem/xuất, kết quả và bằng chứng phải không đổi. |
| report | Phiếu điểm cùng lượt xét: Xuất PDF phiếu cùng học sinh/kỳ/lượt xét; đối chiếu S01 Đỏ/S03 Không đỏ/S05 Không có điểm với kết quả đã lưu. | Cả ba đầu ra đều dùng cùng kết quả đã lưu: S01 có dấu đỏ theo cấu hình riêng của từng output; S03 không có dấu đỏ; S05 không bị coi là điểm 0 và không có dấu đỏ. Excel phải giữ nguyên dữ liệu; màn công khai và PDF không được tự chọn lại rule hoặc tính lại ngưỡng. Nếu chạy lại sau khi chỉ xem/xuất, kết quả và bằng chứng phải không đổi. |

#### TC-RS-ERR-014 — Mục bị ẩn theo thiết lập ẩn mục nhập

| Field | Value |
| --- | --- |
| Chức năng | Kết quả dùng chung |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Cấu hình công khai và ẩn điểm” (AC-G32 «Cấu hình công khai và ẩn điểm»); trạng thái nguồn TBD; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Awaiting decision |
| Readiness | Draft |
| Gap | G-ORACLE-TC-RS-ERR-014, G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) có quy tắc, bị ẩn cho G-B qua Thiết lập ẩn mục nhập（入力項目の非表示設定）. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); học sinh S06 (điểm dự kiến 24) |
| Thao tác | Chạy xét; xem ba đầu ra cho S06. |
| Expected | Có xét hay không: TBD (chưa chốt). CONFIRMED phần không tranh chấp: không đầu ra nào làm hiện lại điểm đang bị ẩn. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| extract | Trích xuất: Mục M=100 bị ẩn cho G-B qua Thiết lập ẩn mục nhập（入力項目の非表示設定）; chạy xét rồi xem màn **Trích xuất thành tích（成績抽出）** cho S06. Có xét hay không vẫn **TBD**; không tự kết luận phần đó. | Có xét hay không: TBD (chưa chốt). CONFIRMED phần không tranh chấp: không đầu ra nào làm hiện lại điểm đang bị ẩn. |
| publish | Công khai: Mục M=100 bị ẩn cho G-B qua Thiết lập ẩn mục nhập（入力項目の非表示設定）; chạy xét rồi xem màn **Công khai thành tích（成績公開）** cho S06. Có xét hay không vẫn **TBD**; không tự kết luận phần đó. | Có xét hay không: TBD (chưa chốt). CONFIRMED phần không tranh chấp: không đầu ra nào làm hiện lại điểm đang bị ẩn. |
| report | Phiếu điểm: Mục M=100 bị ẩn cho G-B qua Thiết lập ẩn mục nhập（入力項目の非表示設定）; chạy xét rồi xem PDF **Công cụ phiếu điểm（通知表ツール）** cho S06. Có xét hay không vẫn **TBD**; không tự kết luận phần đó. | Có xét hay không: TBD (chưa chốt). CONFIRMED phần không tranh chấp: không đầu ra nào làm hiện lại điểm đang bị ẩn. |

### Flow: Chọn quy tắc và phân nhánh

#### TC-RS-BR-001 — Chọn quy tắc khớp đầu tiên theo ưu tiên, không lấy ngưỡng nghiêm hơn

| Field | Value |
| --- | --- |
| Chức năng | Xét theo ưu tiên |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Chọn quy tắc khớp đầu tiên” (AC-G06 «Chọn quy tắc khớp đầu tiên»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) có cặp quy tắc cùng áp dụng (dưới 20 và dưới 30) (ưu tiên 1: `&lt;20`, ưu tiên 2: `&lt;30`). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); cặp quy tắc cùng áp dụng (dưới 20 và dưới 30); S02 được sửa thành 25 |
| Thao tác | 1. Đăng ký S02=25.<br>2. Đổi thứ tự (ưu tiên 1 là `&lt;30`), bấm chạy lại (đăng ký lại điểm hoặc nút cam).<br>3. Xem kết quả sau mỗi lần xét. |
| Expected | 1. Lần 1: chọn quy tắc `&lt;20` → Không đỏ.<br>2. Lần 2 (sau chạy lại): chọn quy tắc `&lt;30` → Đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| priority20 | Ưu tiên ngưỡng 20: M=100; rule ưu tiên1 &lt;20, ưu tiên2 &lt;30; đăng ký S02=25 và đọc rule/kết quả. | 1. Lần 1: chọn quy tắc `&lt;20` → Không đỏ. |
| priority30 | Đổi ưu tiên sang ngưỡng 30: Từ baseline S02=25 với ưu tiên1&lt;20, đổi thứ tự để ưu tiên1&lt;30; đăng ký lại hoặc nút cam, đọc rule/kết quả. | 2. Lần 2 (sau chạy lại): chọn quy tắc `&lt;30` → Đỏ. |

#### TC-RS-BR-002 — Không quy tắc nào khớp khi đủ dữ liệu → Không áp dụng

| Field | Value |
| --- | --- |
| Chức năng | Xét theo ưu tiên |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Chọn quy tắc khớp đầu tiên” (AC-G06 «Chọn quy tắc khớp đầu tiên»); tiêu chí nghiệm thu “Trạng thái sau lần chạy” (AC-G20 «Trạng thái sau lần chạy»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) chỉ có quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao) (khối 1/2 và nhóm Nâng cao). S07 thuộc khối 2 nhưng không thuộc nhóm Nâng cao. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao), học sinh S07 (điểm 35, cờ Chưa dự thi（未受験）) |
| Thao tác | 1. Đăng ký S07=20.<br>2. Xem kết quả ở ba đầu ra. |
| Expected | S07 ở trạng thái Không áp dụng: không có dấu/lọc đỏ; không được coi là "đạt một ngưỡng". |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | S07 ở trạng thái Không áp dụng: không có dấu/lọc đỏ; không được coi là "đạt một ngưỡng". |

#### TC-RS-BR-003 — Ưu tiên 1 khớp nhưng thiếu dữ liệu → Chưa xét được, không chuyển xuống ưu tiên 2

| Field | Value |
| --- | --- |
| Chức năng | Xét theo ưu tiên |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Chọn quy tắc khớp đầu tiên” (AC-G06 «Chọn quy tắc khớp đầu tiên»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Hai cấu hình thử: (A) ưu tiên 1 = quy tắc công thức 100 ÷ trung bình (100 ÷ A, Toàn bộ) với nguồn nhóm có trung bình 0 (`A=0`); ưu tiên 2 = quy tắc “Cố định 30” (dưới 30). (B) ưu tiên 1 = quy tắc có điều kiện `A≥60` với nguồn nguồn chưa có kết quả tổng hợp (không có tổng hợp); ưu tiên 2 = quy tắc “Cố định 30” (dưới 30). (C) ưu tiên 1 = quy tắc có bộ lọc Môn（教科・科目）= Ngữ văn và điều kiện `A≥60` (nguồn nguồn chưa có kết quả tổng hợp); ưu tiên 2 = quy tắc “Cố định 30” (dưới 30); ô đang xét là Toán. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc công thức 100 ÷ trung bình, quy tắc “Cố định 30” (dưới 30), nhóm có trung bình 0, nguồn chưa có kết quả tổng hợp, học sinh S01 (điểm 29) |
| Thao tác | 1. Dựng fixture độc lập đúng cặp ưu tiên của trường hợp.<br>2. Đăng ký S01=29 và đọc identity rule được chọn, trạng thái và nguồn/ngưỡng. |
| Expected | (A) Quy tắc 1 được chọn, chia 0 → Chưa xét được; không dùng ưu tiên 2.<br><br>(B) Không xác định được điều kiện trung bình → Chưa xét được; không coi thiếu dữ liệu là "không khớp" để xuống ưu tiên 2.<br><br>(C) Bộ lọc môn đã đủ chứng minh quy tắc 1 không áp dụng → được bỏ qua mà không cần nguồn; ưu tiên 2 áp dụng → Đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| divide-zero | Rule được chọn nhưng chia 0: FixtureA: ưu tiên1 Toàn bộ/công thức100÷A,reader A=0; ưu tiên2 cố định30,&lt;. Đăng ký S01=29 và đọc rule/trạng thái. | (A) Quy tắc 1 được chọn, chia 0 → Chưa xét được; không dùng ưu tiên 2. |
| missing-average | Thiếu nguồn của điều kiện: FixtureB: ưu tiên1 A≥60 nhưng chưa có tổng hợp; ưu tiên2 cố định30,&lt;. Đăng ký S01=29 và đọc rule/trạng thái. | (B) Không xác định được điều kiện trung bình → Chưa xét được; không coi thiếu dữ liệu là "không khớp" để xuống ưu tiên 2. |
| filter-miss | Bộ lọc đủ loại rule: FixtureC: ưu tiên1 Môn=Ngữ văn+A≥60 nhưng nguồn thiếu; ô đang xét Toán. Ưu tiên2 cố định30,&lt;; đăng ký S01=29 và đọc rule/trạng thái. | (C) Bộ lọc môn đã đủ chứng minh quy tắc 1 không áp dụng → được bỏ qua mà không cần nguồn; ưu tiên 2 áp dụng → Đỏ. |

#### TC-RS-BR-036 — Cùng lượt đăng ký: ô thiếu nguồn chưa xét được, ô ngưỡng cố định vẫn được xét

| Field | Value |
| --- | --- |
| Chức năng | Xét theo ưu tiên |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23 «Bao phủ đường đăng ký và chạy lại»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Trên mục số nguyên (M=100): ưu tiên 1 = quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8) (dùng trung bình, nguồn nguồn chưa có kết quả tổng hợp), ưu tiên 2 = quy tắc “Cố định 30” (dưới 30). Trên mục số thập phân (M=100): chỉ quy tắc “Cố định 30” (dưới 30). Lớp G-A có S01. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); mục số thập phân (M=100); quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8); quy tắc “Cố định 30” (dưới 30); nguồn chưa có kết quả tổng hợp; các lớp học phần G-A, G-B, G-C; học sinh S01 (điểm 29); S01 mục số thập phân (M=100) = 29.5 |
| Thao tác | 1. Trong cùng một lượt đăng ký điểm của lớp G-A, lưu S01: mục số nguyên (M=100) = 29, mục số thập phân (M=100) = 29.5.<br>2. Xem kết quả hai ô và thông báo. |
| Expected | 1. Lượt lưu không dừng hay báo lỗi chung vì ô mục số nguyên (M=100) thiếu nguồn.<br>2. Ô mục số nguyên (M=100): Chưa xét được; không dùng ưu tiên 2 (quy tắc “Cố định 30” (dưới 30)) thay thế, nên không Đỏ.<br>3. Ô mục số thập phân (M=100): Đỏ (29.5 `&lt;30`). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. Lượt lưu không dừng hay báo lỗi chung vì ô mục số nguyên (M=100) thiếu nguồn.<br>2. Ô mục số nguyên (M=100): Chưa xét được; không dùng ưu tiên 2 (quy tắc “Cố định 30” (dưới 30)) thay thế, nên không Đỏ.<br>3. Ô mục số thập phân (M=100): Đỏ (29.5 `&lt;30`). |

#### TC-RS-CALC-022 — Phân nhánh theo trung bình: A = 40 / 50 / 49.99 (dùng A trước làm tròn)

| Field | Value |
| --- | --- |
| Chức năng | Xét theo ưu tiên |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14 «Giá trị thô từ cùng tập dữ liệu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Ưu tiên 1: `A≥50` → cố định 30 `&lt;`. Ưu tiên 2: `A&lt;50` → `A×0.5` `&lt;`. mục số thập phân (M=100). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100); Nguồn `A=40`, `A=50`, `A=49.99` (bản tổng hợp đã chốt (trung bình 49.99), màn tổng hợp hiện 50.0); S = 19, 20, 24.99, 25, 29, 30 |
| Thao tác | 1. Với từng nguồn, chạy nút cam, xem kết quả.<br>2. Với `A=49.99`: bật gần nhất p1 cho dòng `A×0.5`, chạy lại. |
| Expected | `A=40` → ưu tiên 2, `T=20`: 19 Đỏ; 20 Không đỏ.<br><br>`A=50` → ưu tiên 1, `T=30`: 29 Đỏ; 30 Không đỏ.<br><br>`A=49.99` → ưu tiên 2, `T=24.995`: 24.99 Đỏ; 25 Không đỏ; 29 Không đỏ (nếu dùng 50 thì 29 Đỏ — sai).<br><br>Bước 2: `T=25`, vẫn ưu tiên 2: 24.99 Đỏ; 29 Không đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| a40 | Nguồn dưới mốc: Nguồn A=40; ưu tiên1 A≥50/cố định30,&lt;, ưu tiên2 A&lt;50/A×0.5,&lt;; chạy cam cho điểm19/20. | `A=40` → ưu tiên 2, `T=20`: 19 Đỏ; 20 Không đỏ. |
| a50 | Nguồn bằng mốc: Nguồn A=50, cùng hai rule; chạy cam cho điểm29/30. | `A=50` → ưu tiên 1, `T=30`: 29 Đỏ; 30 Không đỏ. |
| a4999-none | Nguồn thô sát dưới mốc: Nguồn đã chốt A=49.99 dù màn hiện50.0; cùng hai rule, không làm tròn A×0.5; chạy cam cho24.99/25/29. | `A=49.99` → ưu tiên 2, `T=24.995`: 24.99 Đỏ; 25 Không đỏ; 29 Không đỏ (nếu dùng 50 thì 29 Đỏ — sai). |
| a4999-round | Làm tròn ngưỡng từ nguồn thô: Nguồn đã chốt A=49.99; bật gần nhất p=1 cho A×0.5, giữ điều kiện dùng A thô; chạy lại điểm24.99/29. | Bước 2: `T=25`, vẫn ưu tiên 2: 24.99 Đỏ; 29 Không đỏ. |

#### TC-RS-CALC-023 — Biên nhánh A=60.00 và A=59.96

| Field | Value |
| --- | --- |
| Chức năng | Xét theo ưu tiên |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14 «Giá trị thô từ cùng tập dữ liệu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Ưu tiên 1: `A≥60` → cố định 25 `&lt;`. Ưu tiên 2: `A&lt;60` → `A×0.5` `&lt;`. mục số thập phân (M=100). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100); hai nguồn có trung bình 60 và 59.96 (`A=60.00`; `A=59.96`); S = 27, 29.99 |
| Thao tác | Chạy nút cam với từng nguồn. |
| Expected | `A=60.00` → ưu tiên 1, `T=25`: 27 Không đỏ.<br><br>`A=59.96` → ưu tiên 2, `T=29.98`: 27 Đỏ; 29.99 Không đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| a60 | Nguồn bằng mốc 60: A=60.00; ưu tiên1 A≥60/cố định25,&lt;, ưu tiên2 A&lt;60/A×0.5,&lt;; chạy cam cho S=27. | `A=60.00` → ưu tiên 1, `T=25`: 27 Không đỏ. |
| a5996 | Nguồn sát dưới mốc 60: A=59.96, cùng hai rule; chạy cam cho S=27 và29.99. | `A=59.96` → ưu tiên 2, `T=29.98`: 27 Đỏ; 29.99 Không đỏ. |

#### TC-RS-CALC-024 — Tỷ lệ nhóm R = 70% khớp điều kiện ≥ 65%

| Field | Value |
| --- | --- |
| Chức năng | Xét theo ưu tiên |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Kế thừa tỷ lệ nhóm” (AC-G15 «Kế thừa tỷ lệ nhóm»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | quy tắc theo tỷ lệ điểm của nhóm từ 65% là quy tắc duy nhất. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc theo tỷ lệ điểm của nhóm từ 65%; (a) nhóm có tỷ lệ điểm 70% (cùng M) (60/100, 80/100); (b) nguồn 50/100, 70/100; S = 60, 70, 80 |
| Thao tác | Chạy nút xanh rồi nút cam cho từng nguồn. |
| Expected | (a) `R=140/200×100=70%` → khớp; `T=70`: 60 Đỏ; 70 Không đỏ; 80 Không đỏ.<br><br>(b) `R=120/200×100=60%` → không khớp → cả ba Không áp dụng. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| r70 | Tỷ lệ nhóm trên mốc: Nguồn60/100 và80/100 → R=70%; rule điều kiện tỷ lệ nhóm từ65%; chạy xanh rồi cam cho điểm60/70/80. | (a) `R=140/200×100=70%` → khớp; `T=70`: 60 Đỏ; 70 Không đỏ; 80 Không đỏ. |
| r60 | Tỷ lệ nhóm dưới mốc: Nguồn50/100 và70/100 → R=60%; cùng rule, chạy xanh rồi cam cho điểm60/70/80. | (b) `R=120/200×100=60%` → không khớp → cả ba Không áp dụng. |

#### TC-RS-CALC-025 — Tỷ lệ nhóm 64.99% (hiển thị 65.0) không khớp ≥ 65%

| Field | Value |
| --- | --- |
| Chức năng | Xét theo ưu tiên |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14 «Giá trị thô từ cùng tập dữ liệu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Blocked |
| Gap | G-PREP-TC-RS-CALC-025 |
| Cấu hình | quy tắc theo tỷ lệ điểm của nhóm từ 65%; mục thập phân. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc theo tỷ lệ điểm của nhóm từ 65%; (a) Nguồn 64.98/100 và 65.00/100 → `R=64.99%`; (b) 65/100 và 65/100 → `R=65%`; S = 60 |
| Thao tác | Chạy nút xanh rồi nút cam cho từng nguồn. |
| Expected | (a) `R` thô = `64.99%` không khớp `≥65%` → Không áp dụng. Nếu seam chỉ cung cấp `65.0%` đã làm tròn, case bị BLOCKED/NEEDS_EVIDENCE vì thiếu dữ liệu nguồn, không được đổi oracle thành khớp.<br><br>(b) Khớp → S=60 Đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| r6499 | Tỷ lệ thô sát dưới mốc: Nguồn64.98/100 và65.00/100 → R thô64.99%; rule từ65%,S=60; chạy xanh rồi cam. Chỉ có seam R làm tròn65.0% thì BLOCKED/NEEDS_EVIDENCE. | (a) `R` thô = `64.99%` không khớp `≥65%` → Không áp dụng. Nếu seam chỉ cung cấp `65.0%` đã làm tròn, case bị BLOCKED/NEEDS_EVIDENCE vì thiếu dữ liệu nguồn, không được đổi oracle thành khớp. |
| r65 | Tỷ lệ bằng mốc: Nguồn65/100 và65/100 → R=65%; rule từ65%,S=60; chạy xanh rồi cam. | (b) Khớp → S=60 Đỏ. |

### Flow: Điểm được xét

#### TC-RS-BR-012 — Điểm được xét là điểm cuối đã lưu (dự kiến, sửa tay, sau giới hạn miền điểm)

| Field | Value |
| --- | --- |
| Chức năng | Đăng ký thành tích（成績登録） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Dùng điểm cuối cùng” (AC-G19 «Dùng điểm cuối cùng»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30) và (cho biến thể c) mục số nguyên có thêm tính tự động có quy tắc tính tự động cho kết quả vượt 100. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100), mục số nguyên có thêm tính tự động; học sinh S06 (điểm dự kiến 24), học sinh S08 (sửa tay 28 thành 35), quy tắc “Cố định 30” (dưới 30) |
| Thao tác | (a) S06 = 24 là Điểm dự kiến（見込点）: đăng ký.<br><br>(b) S08: nhập 28, lưu; sửa tay thành 35, lưu.<br><br>(c) Tạo dữ liệu mà phép tính cho 120 nhưng điểm lưu hợp lệ là 100; áp quy tắc cố định 100 `&lt;` và 100 `≤`. |
| Expected | (a) Đỏ.<br><br>(b) Sau lần lưu thứ hai: xét 35 → Không đỏ.<br><br>(c) Xét `S=100`: `&lt;100` Không đỏ; `≤100` Đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| projected | Điểm dự kiến: Rule cố định30,&lt;; đăng ký S06=24 với cờ Điểm dự kiến（見込点）. | (a) Đỏ. |
| manual | Sửa điểm bằng tay: Rule cố định30,&lt;; S08 nhập28/lưu rồi sửa35/lưu; đọc sau từng lần. | (b) Sau lần lưu thứ hai: xét 35 → Không đỏ. |
| clamp-lt | Điểm cuối bằng ngưỡng, nhỏ hơn: Tính tự động cho120 nhưng điểm cuối đã lưu hợp lệ100; rule cố định100,&lt;, chạy xét. | Xét điểm cuối đã lưu **S=100**, không xét giá trị trung gian 120: **100&lt;100 → Không đỏ**. |
| clamp-le | Điểm cuối bằng ngưỡng, nhỏ hơn hoặc bằng: Cùng giá trị trung gian120/điểm cuối100; rule cố định100,≤, chạy xét. | Xét điểm cuối đã lưu **S=100**, không xét giá trị trung gian 120: **100≤100 → Đỏ**. |

#### TC-RS-BR-013 — Cờ Chưa dự thi（未受験） không loại điểm số khỏi xét

| Field | Value |
| --- | --- |
| Chức năng | Đăng ký thành tích（成績登録） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Dùng điểm cuối cùng” (AC-G19 «Dùng điểm cuối cùng»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | quy tắc “Cố định 30” (dưới 30) (`&lt;30`). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30); học sinh S07 (điểm 35, cờ Chưa dự thi（未受験）) (35, cờ Chưa dự thi) và biến thể S07 = 25 cùng cờ; học sinh S09 (mục số thập phân 29.5) (mục số thập phân (M=100) = 29.5) được thiết lập loại khỏi xếp hạng; mục số thập phân (M=100) có quy tắc “Cố định 30” (dưới 30) |
| Thao tác | 1. Đăng ký S07=35 kèm cờ Chưa dự thi（未受験）.<br>2. Sửa S07=25, giữ cờ.<br>3. Đăng ký điểm 29.5 cho S09 (học sinh bị loại khỏi xếp hạng); chạy nút xanh rồi nút cam. |
| Expected | 1. Được xét → Không đỏ.<br>2. Được xét → Đỏ.<br>3. S09 được xét → Đỏ (29.5 `&lt;30`); việc bị loại khỏi xếp hạng không loại ô khỏi xét đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| notexam35 | Chưa dự thi có điểm 35: Rule cố định30,&lt;; đăng ký S07=35 kèm cờ Chưa dự thi（未受験）. | 1. Được xét → Không đỏ. |
| notexam25 | Chưa dự thi có điểm 25: Sửa S07=25, giữ cờ Chưa dự thi（未受験） và rule cố định30,&lt;; lưu. | 2. Được xét → Đỏ. |
| ranking-excluded | Bị loại khỏi xếp hạng: S09 bị loại khỏi xếp hạng, mục thập phânM100/rule cố định30,&lt;; đăng ký29.5, chạy xanh rồi cam. | 3. S09 được xét → Đỏ (29.5 `&lt;30`); việc bị loại khỏi xếp hạng không loại ô khỏi xét đỏ. |

#### TC-RS-BR-014 — Ô trống không bị coi là 0 (trạng thái Không có điểm)

| Field | Value |
| --- | --- |
| Chức năng | Đăng ký thành tích（成績登録） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Dùng điểm cuối cùng” (AC-G19 «Dùng điểm cuối cùng»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | quy tắc “Cố định 30” (dưới 30) (`&lt;30`) và quy tắc cố định 30 với Nhỏ hơn hoặc bằng（以下） biến thể cố định 0 `≤`. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30), quy tắc cố định 30 với Nhỏ hơn hoặc bằng（以下）; học sinh S05 (ô trống) (trống), học sinh S04 (điểm 0) (0) |
| Thao tác | 1. Với quy tắc “Cố định 30” (dưới 30): đăng ký S04=0, để S05 trống.<br>2. Đổi thành quy tắc cố định 0 `≤`, chạy lại. |
| Expected | 1. S04 Đỏ (0 hợp lệ là số); S05 Không có điểm, không dấu đỏ.<br>2. S04 Đỏ (`0≤0`); S05 vẫn Không có điểm (không thành Đỏ như thể là 0). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| fixed30-lt | Phân biệt trống và 0: Rule cố định30,&lt;; đăng ký S04=0, để S05 trống; đọc cả hai ô. | 1. S04 Đỏ (0 hợp lệ là số); S05 Không có điểm, không dấu đỏ. |
| fixed0-le | Ngưỡng 0 vẫn phân biệt trống: Đổi rule thành cố định0,≤; S04=0 và S05 trống; chạy lại, đọc cả hai ô. | 2. S04 Đỏ (`0≤0`); S05 vẫn Không có điểm (không thành Đỏ như thể là 0). |

#### TC-RS-BR-030 — Ô điểm đơn vị được xét riêng theo từng đơn vị

| Field | Value |
| --- | --- |
| Chức năng | Đăng ký thành tích（成績登録） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Kiểu điểm được hỗ trợ” (AC-G02 «Kiểu điểm được hỗ trợ»); tiêu chí nghiệm thu “Nhận diện ô điểm” (AC-G03 «Nhận diện ô điểm»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục điểm đơn vị (đơn vị U1 có M riêng 40) có quy tắc “Cố định 30” (dưới 30) (`&lt;30`). S06 (G-B): U1 = 25, U2 = 35. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30); mục điểm đơn vị (đơn vị U1 có M riêng 40) |
| Thao tác | 1. Đăng ký điểm U1, U2 của S06.<br>2. Xem ba đầu ra ở phạm vi đơn vị. |
| Expected | U1 Đỏ, U2 Không đỏ; dấu chỉ ở ô U1. Hai đơn vị không bị gộp thành một ô. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | U1 Đỏ, U2 Không đỏ; dấu chỉ ở ô U1. Hai đơn vị không bị gộp thành một ô. |

#### TC-RS-REG-003 — Ô nhập tay được AutoRating bỏ qua vẫn giữ giá trị tay và vẫn được xét đỏ

| Field | Value |
| --- | --- |
| Chức năng | Đăng ký thành tích（成績登録） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Dùng điểm cuối cùng” (AC-G19 «Dùng điểm cuối cùng»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên có thêm tính tự động + quy tắc “Cố định 30” (dưới 30); S08 nhập tay 28. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên có thêm tính tự động, quy tắc “Cố định 30” (dưới 30); học sinh S08 (sửa tay 28 thành 35) |
| Thao tác | 1. Lưu S08=28 bằng nhập tay; chạy nút cam.<br>2. Xem điểm và kết quả đỏ. |
| Expected | Điểm S08 vẫn 28 (không bị AutoRating ghi đè); S08 Đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Điểm S08 vẫn 28 (không bị AutoRating ghi đè); S08 Đỏ. |

### Flow: Quyền và kiểm tra phía server

#### TC-RS-BR-031 — Giáo viên có quyền sửa mục cấu hình được quy tắc đỏ

| Field | Value |
| --- | --- |
| Chức năng | Quyền thao tác |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Quyền thao tác và phạm vi dữ liệu” (AC-G01 «Quyền thao tác và phạm vi dữ liệu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Đăng nhập tài khoản giáo viên có quyền sửa mục (giáo viên thường, không phải nhân viên nội bộ). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: tài khoản giáo viên có quyền sửa mục, mục số nguyên (M=100) |
| Thao tác | 1. Đăng nhập giáo viên thường có quyền sửa đúng mục M=100, không cần tài khoản nội bộ.<br>2. Thực hiện thao tác riêng trong bảng trường hợp và đọc lại rule. |
| Expected | Mọi thao tác thành công. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| add | Thêm quy tắc: Giáo viên thường có quyền sửa mục M=100, không phải nội bộ; thử thêm rule của mục. | Mọi thao tác thành công. |
| condition | Sửa điều kiện: Cùng giáo viên có quyền; sửa điều kiện áp dụng của rule thuộc mục M=100. | Mọi thao tác thành công. |
| threshold | Sửa ngưỡng: Cùng giáo viên có quyền; sửa ngưỡng của rule thuộc mục M=100. | Mọi thao tác thành công. |
| reorder | Đổi thứ tự: Cùng giáo viên có quyền; đổi ưu tiên các rule thuộc mục M=100. | Mọi thao tác thành công. |
| delete | Xóa quy tắc: Cùng giáo viên có quyền; xóa một rule thuộc mục M=100. | Mọi thao tác thành công. |

#### TC-RS-BR-032 — Vào được màn nhưng không có quyền sửa mục → không sửa được quy tắc của mục đó

| Field | Value |
| --- | --- |
| Chức năng | Quyền thao tác |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Quyền thao tác và phạm vi dữ liệu” (AC-G01 «Quyền thao tác và phạm vi dữ liệu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Đăng nhập tài khoản giáo viên không có quyền sửa mục. mục chỉ dành nội bộ có một quy tắc. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: tài khoản giáo viên không có quyền sửa mục, mục chỉ dành nội bộ |
| Thao tác | 1. Mở Thiết lập ô nhập（入力欄設定）.<br>2. Thử mở và sửa quy tắc của mục chỉ dành nội bộ. |
| Expected | Không có thao tác sửa/thêm/xóa cho mục chỉ dành nội bộ trên màn, hoặc lưu bị từ chối. Quy tắc không đổi. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Không có thao tác sửa/thêm/xóa cho mục chỉ dành nội bộ trên màn, hoặc lưu bị từ chối. Quy tắc không đổi. |

#### TC-RS-BR-033 — Quyền sửa mục không tự cấp quyền chạy hàng loạt

| Field | Value |
| --- | --- |
| Chức năng | Quyền thao tác |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Quyền thao tác và phạm vi dữ liệu” (AC-G01 «Quyền thao tác và phạm vi dữ liệu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Đăng nhập tài khoản sửa được mục nhưng không có quyền chạy hàng loạt. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: tài khoản sửa được mục nhưng không có quyền chạy hàng loạt |
| Thao tác | 1. Sửa một quy tắc (thành công).<br>2. Mở Tổng hợp thành tích（成績集計）, thử chạy tính toán hàng loạt. |
| Expected | Không chạy được hàng loạt (thao tác không có hoặc bị từ chối theo quyền hiện hành). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Không chạy được hàng loạt (thao tác không có hoặc bị từ chối theo quyền hiện hành). |

#### TC-RS-ERR-006 — Gửi request lưu quy tắc trực tiếp khi không có quyền sửa mục

| Field | Value |
| --- | --- |
| Chức năng | Quyền thao tác |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Quyền thao tác và phạm vi dữ liệu” (AC-G01 «Quyền thao tác và phạm vi dữ liệu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | tài khoản giáo viên không có quyền sửa mục; mục chỉ dành nội bộ có một quy tắc. Có bản ghi request lưu/xóa/đổi thứ tự hợp lệ lấy từ tài khoản giáo viên có quyền sửa mục. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: tài khoản giáo viên không có quyền sửa mục, mục chỉ dành nội bộ |
| Thao tác | 1. Ghi baseline cấu hình và request hợp lệ bằng tài khoản có quyền; chuyển sang phiên giáo viên không được sửa mục.<br>2. Gửi riêng request của trường hợp đang chạy với identity đích giữ nguyên.<br>3. Đọc response, cấu hình và dấu hiệu lượt xét; không suy từ việc UI không có nút. |
| Expected | Mọi request bị từ chối; cấu hình không đổi; không có lượt xét phát sinh. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| save | Lưu không có quyền: Dùng phiên giáo viên **không có quyền sửa mục**, gửi lại POST lưu hợp lệ đã ghi từ tài khoản có quyền cho rule của mục chỉ dành nội bộ. | Mọi request bị từ chối; cấu hình không đổi; không có lượt xét phát sinh. |
| delete | Xóa không có quyền: Cùng phiên không có quyền sửa mục, gửi lại POST xóa hợp lệ của rule trong mục chỉ dành nội bộ. | Mọi request bị từ chối; cấu hình không đổi; không có lượt xét phát sinh. |
| reorder | Đổi thứ tự không có quyền: Cùng phiên không có quyền sửa mục, gửi lại POST đổi thứ tự hợp lệ của rule trong mục chỉ dành nội bộ. | Mọi request bị từ chối; cấu hình không đổi; không có lượt xét phát sinh. |

#### TC-RS-ERR-007 — Giả mạo ID khác trường/năm hoặc nguồn không được phép

| Field | Value |
| --- | --- |
| Chức năng | Quyền thao tác |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Quyền thao tác và phạm vi dữ liệu” (AC-G01 «Quyền thao tác và phạm vi dữ liệu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | tài khoản của trường B (trường B) và tài khoản giáo viên có quyền sửa mục (trường A). Ghi lại cấu hình, điểm và kết quả đỏ của trường A trước khi chạy. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: trường B (trường khác), tài khoản của trường B |
| Thao tác | 1. Ghi baseline cấu hình, điểm và kết quả trường A; xác minh tài khoản/identity và request thật.<br>2. Dùng actor và sửa đúng một trường identity theo trường hợp; gửi riêng từng request.<br>3. Đọc response cùng dữ liệu đích và baseline, kiểm dữ liệu ngoài trường/năm/quyền không bị lộ hoặc đổi. |
| Expected | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| read-school | Đọc mục trường khác: Tài khoản **trường B**: mở URL/gửi request xem ID mục/rule của **trường A**. Dùng request/ID đã xác minh; gửi riêng và đọc response, cấu hình, điểm/kết quả trường A trước/sau. | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |
| save-school | Lưu mục trường khác: Tài khoản **trường B**: gửi request lưu ID mục/rule của **trường A**. Dùng request/ID đã xác minh; gửi riêng và đọc response, cấu hình, điểm/kết quả trường A trước/sau. | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |
| delete-school | Xóa mục trường khác: Tài khoản **trường B**: gửi request xóa ID mục/rule của **trường A**. Dùng request/ID đã xác minh; gửi riêng và đọc response, cấu hình, điểm/kết quả trường A trước/sau. | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |
| source-school | Nguồn trường khác: Giáo viên được sửa mục **trường A**: sửa request lưu rule của trường A để tham chiếu  nguồn tổng hợp thuộc **trường B**. Dùng request/ID đã xác minh; gửi riêng và đọc response, cấu hình, điểm/kết quả trường A trước/sau. | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |
| source-year | Nguồn năm khác: Giáo viên được sửa mục **trường A**: sửa request lưu rule của trường A để tham chiếu  nguồn tổng hợp thuộc **năm 2025**. Dùng request/ID đã xác minh; gửi riêng và đọc response, cấu hình, điểm/kết quả trường A trước/sau. | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |
| class-school | Lớp trường khác: Giáo viên được sửa mục **trường A**: sửa request lưu rule của trường A để tham chiếu  ID lớp trong bộ lọc thuộc **trường B**. Dùng request/ID đã xác minh; gửi riêng và đọc response, cấu hình, điểm/kết quả trường A trước/sau. | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |
| class-year | Lớp năm khác: Giáo viên được sửa mục **trường A**: sửa request lưu rule của trường A để tham chiếu  ID lớp trong bộ lọc thuộc **năm 2025**. Dùng request/ID đã xác minh; gửi riêng và đọc response, cấu hình, điểm/kết quả trường A trước/sau. | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |
| group-school | Nhóm trường khác: Giáo viên được sửa mục **trường A**: sửa request lưu rule của trường A để tham chiếu  ID nhóm trong bộ lọc thuộc **trường B**. Dùng request/ID đã xác minh; gửi riêng và đọc response, cấu hình, điểm/kết quả trường A trước/sau. | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |
| group-year | Nhóm năm khác: Giáo viên được sửa mục **trường A**: sửa request lưu rule của trường A để tham chiếu  ID nhóm trong bộ lọc thuộc **năm 2025**. Dùng request/ID đã xác minh; gửi riêng và đọc response, cấu hình, điểm/kết quả trường A trước/sau. | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |
| unit-school | Đơn vị trường khác: Giáo viên được sửa mục **trường A**: sửa request lưu rule của trường A để tham chiếu  ID đơn vị thuộc **trường B**. Dùng request/ID đã xác minh; gửi riêng và đọc response, cấu hình, điểm/kết quả trường A trước/sau. | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |
| unit-year | Đơn vị năm khác: Giáo viên được sửa mục **trường A**: sửa request lưu rule của trường A để tham chiếu  ID đơn vị thuộc **năm 2025**. Dùng request/ID đã xác minh; gửi riêng và đọc response, cấu hình, điểm/kết quả trường A trước/sau. | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |

#### TC-RS-ERR-008 — Gọi trực tiếp request chạy tính toán hàng loạt khi không có quyền chạy

| Field | Value |
| --- | --- |
| Chức năng | Quyền thao tác |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Quyền thao tác và phạm vi dữ liệu” (AC-G01 «Quyền thao tác và phạm vi dữ liệu»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | tài khoản sửa được mục nhưng không có quyền chạy hàng loạt; bản ghi request chạy nút cam hợp lệ từ tài khoản có quyền chạy hàng loạt. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: tài khoản sửa được mục nhưng không có quyền chạy hàng loạt; endpoint/request URL lấy từ route hiện hành của build, không ghi URL giả định vào oracle. |
| Thao tác | Dùng phiên tài khoản sửa được mục nhưng không có quyền chạy hàng loạt gửi request chạy tính toán hàng loạt cho khối 1. |
| Expected | Kỳ vọng theo đặc tả v2: bị từ chối, không xếp hàng/không xét. Nếu chưa xác định được route hoặc seam request ở build đang kiểm, ghi BLOCKED/NEEDS_EVIDENCE thay vì READY; không biến việc thiếu URL thành kết quả đạt. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Kỳ vọng theo đặc tả v2: bị từ chối, không xếp hàng/không xét. Nếu chưa xác định được route hoặc seam request ở build đang kiểm, ghi BLOCKED/NEEDS_EVIDENCE thay vì READY; không biến việc thiếu URL thành kết quả đạt. |

#### TC-RS-ERR-009 — Server kiểm miền giá trị khi bỏ qua kiểm tra phía trình duyệt

| Field | Value |
| --- | --- |
| Chức năng | Quyền thao tác |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11 «Giữ chính xác giá trị»); tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16 «Công thức theo dòng và phần lẻ»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | tài khoản giáo viên có quyền sửa mục; bản ghi request lưu ngưỡng hợp lệ. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: N cố định = 101, −1; tỷ lệ = 101; mẫu số cố định = 0; N = `NaN`, `Infinity`, `1e400`, chuỗi rỗng; công thức có phép toán/hàm không được phép (ví dụ `^`, `max`) hoặc chuỗi biểu thức tự do thay cho các dòng; điều kiện áp dụng (khi có schema, PROPOSED theo thiết kế DB v2 mục 3.2 “`apply_condition`”): JSON `null`, chuỗi rỗng, object rỗng, khóa lạ, cả hai array rỗng |
| Thao tác | Sửa request (bỏ kiểm tra JS) và gửi từng giá trị. |
| Expected | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| above | Điểm cố định vượt tối đa: Từ request lưu ngưỡng hợp lệ bằng giáo viên có quyền, bỏ kiểm tra JS và gửi **N cố định=101**.  Ghi payload/response riêng, không thay cùng lúc các trường khác. | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| negative | Điểm cố định âm: Từ request lưu ngưỡng hợp lệ bằng giáo viên có quyền, bỏ kiểm tra JS và gửi **N cố định=−1**.  Ghi payload/response riêng, không thay cùng lúc các trường khác. | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| ratio-above | Tỷ lệ vượt 100: Từ request lưu ngưỡng hợp lệ bằng giáo viên có quyền, bỏ kiểm tra JS và gửi **tỷ lệ=101**.  Ghi payload/response riêng, không thay cùng lúc các trường khác. | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| divide-zero | Mẫu số cố định bằng 0: Từ request lưu ngưỡng hợp lệ bằng giáo viên có quyền, bỏ kiểm tra JS và gửi **mẫu số cố định=0**.  Ghi payload/response riêng, không thay cùng lúc các trường khác. | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| nan | Giá trị không phải số: Từ request lưu ngưỡng hợp lệ bằng giáo viên có quyền, bỏ kiểm tra JS và gửi **N=NaN**.  Ghi payload/response riêng, không thay cùng lúc các trường khác. | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| infinity | Giá trị vô hạn: Từ request lưu ngưỡng hợp lệ bằng giáo viên có quyền, bỏ kiểm tra JS và gửi **N=Infinity**.  Ghi payload/response riêng, không thay cùng lúc các trường khác. | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| exponent | Giá trị tràn dạng số mũ: Từ request lưu ngưỡng hợp lệ bằng giáo viên có quyền, bỏ kiểm tra JS và gửi **N=1e400**.  Ghi payload/response riêng, không thay cùng lúc các trường khác. | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| empty | Giá trị N trống: Từ request lưu ngưỡng hợp lệ bằng giáo viên có quyền, bỏ kiểm tra JS và gửi **N là chuỗi rỗng**.  Ghi payload/response riêng, không thay cùng lúc các trường khác. | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| power | Phép toán không hỗ trợ: Từ request lưu ngưỡng hợp lệ bằng giáo viên có quyền, bỏ kiểm tra JS và gửi **phép toán ^**.  Ghi payload/response riêng, không thay cùng lúc các trường khác. | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| max | Hàm không hỗ trợ: Từ request lưu ngưỡng hợp lệ bằng giáo viên có quyền, bỏ kiểm tra JS và gửi **hàm max**.  Ghi payload/response riêng, không thay cùng lúc các trường khác. | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| expression | Biểu thức tự do: Từ request lưu ngưỡng hợp lệ bằng giáo viên có quyền, bỏ kiểm tra JS và gửi **chuỗi biểu thức tự do thay cấu trúc các dòng**.  Ghi payload/response riêng, không thay cùng lúc các trường khác. | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| null | Điều kiện JSON null: Từ request lưu ngưỡng hợp lệ bằng giáo viên có quyền, bỏ kiểm tra JS và gửi **apply_condition=JSON null**. Phần apply_condition chỉ chạy khi có schema; vẫn PROPOSED theo thiết kế DB v2. Ghi payload/response riêng, không thay cùng lúc các trường khác. | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| empty-string | Điều kiện là chuỗi rỗng: Từ request lưu ngưỡng hợp lệ bằng giáo viên có quyền, bỏ kiểm tra JS và gửi **apply_condition=chuỗi rỗng**. Phần apply_condition chỉ chạy khi có schema; vẫn PROPOSED theo thiết kế DB v2. Ghi payload/response riêng, không thay cùng lúc các trường khác. | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| object | Điều kiện là object rỗng: Từ request lưu ngưỡng hợp lệ bằng giáo viên có quyền, bỏ kiểm tra JS và gửi **apply_condition=object rỗng**. Phần apply_condition chỉ chạy khi có schema; vẫn PROPOSED theo thiết kế DB v2. Ghi payload/response riêng, không thay cùng lúc các trường khác. | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| unknown-key | Điều kiện có khóa lạ: Từ request lưu ngưỡng hợp lệ bằng giáo viên có quyền, bỏ kiểm tra JS và gửi **apply_condition chứa khóa không biết**. Phần apply_condition chỉ chạy khi có schema; vẫn PROPOSED theo thiết kế DB v2. Ghi payload/response riêng, không thay cùng lúc các trường khác. | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| arrays | Hai mảng điều kiện rỗng: Từ request lưu ngưỡng hợp lệ bằng giáo viên có quyền, bỏ kiểm tra JS và gửi **apply_condition có cả hai array rỗng**. Phần apply_condition chỉ chạy khi có schema; vẫn PROPOSED theo thiết kế DB v2. Ghi payload/response riêng, không thay cùng lúc các trường khác. | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |

#### TC-RS-ERR-010 — Server không tin cờ đỏ hoặc ngưỡng do trình duyệt gửi lên

| Field | Value |
| --- | --- |
| Chức năng | Quyền thao tác |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Excel khớp và dùng kết luận server” (AC-G31 «Excel khớp và dùng kết luận server»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Blocked |
| Gap | G-PREP-TC-RS-ERR-010 |
| Cấu hình | S03 của trường A/năm 2026 có điểm server `31`, quy tắc `&lt;30`, kết luận Không đỏ; S01=29 Đỏ là control trong bộ lọc. Cấu hình trích xuất gồm lọc học sinh có điểm đỏ, ký hiệu “*” phía trước và tô màu. Ghi identity trường/năm/mục của S03, S01 và một trường B/năm khác ngoài quyền tài khoản; endpoint/field thực tế chỉ dùng sau khi được xác minh, chưa giả định `output_excel` nhận mọi field. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: lượt không lọc chứa S03=31 không dấu/màu đỏ; lượt có lọc chỉ chứa S01, loại S03. Các request sửa độc lập từ baseline tương ứng, không sửa dữ liệu server. |
| Thao tác | 1. Tài khoản phụ trách đầu ra ghi request/response và Excel baseline của lượt không lọc (S03=31 Không đỏ) và có lọc (S01 có, S03 vắng); xác minh endpoint/field/quyền/identity thật.<br>2. Chỉ sửa payload đúng một trường theo trường hợp; không sửa dữ liệu server. Field chưa được endpoint nhận phải ghi seam/BLOCKED, không tự dựng endpoint.<br>3. Lưu payload/response/file Excel nếu có; đối chiếu điểm/ngưỡng/kết quả tin cậy và quyền, không dùng một dấu UI làm bằng chứng duy nhất. |
| Expected | Ở các biến thể không lọc, server từ chối payload giả hoặc Excel vẫn cho S03=31, Không đỏ, không có `*`/màu đỏ; điểm 10, ngưỡng 50 và cờ giả không đổi kết luận server. Ở request **có lọc**, S03 không được đưa vào Excel dù identity được chèn vào payload; S01 vẫn có mặt. Request trường/năm ngoài quyền bị từ chối hoặc không trả dữ liệu ngoài quyền. Nếu endpoint không nhận field giả, ghi rõ biến thể chưa kiểm được/BLOCKED và seam cần kiểm; không dùng NOT_APPLICABLE để suy rằng nghĩa vụ server đã PASS. Chỉ đánh PASS từng biến thể khi có payload thật được endpoint xử lý cùng response/file và dữ liệu tin cậy đối chiếu. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| forged-red-flag | Giả cờ đỏ: Request **không lọc**: chỉ gán cờ đỏ cho S03; điểm server31, ngưỡng server30 giữ nguyên. | Payload giả bị từ chối hoặc Excel vẫn **S03=31, Không đỏ**, không `*`/màu đỏ; giá trị do trình duyệt gửi không đổi điểm/ngưỡng/kết luận server. Nếu endpoint không nhận field giả, ghi BLOCKED và seam còn thiếu, không dùng NOT_APPLICABLE để suy PASS. Chỉ PASS khi có payload thật được xử lý, response/file và dữ liệu tin cậy đối chiếu. |
| forged-prefix | Giả ký hiệu trước: Request **không lọc**: chỉ gán dấu trước `*` cho S03; điểm31/ngưỡng30 giữ nguyên. | Payload giả bị từ chối hoặc Excel vẫn **S03=31, Không đỏ**, không `*`/màu đỏ; giá trị do trình duyệt gửi không đổi điểm/ngưỡng/kết luận server. Nếu endpoint không nhận field giả, ghi BLOCKED và seam còn thiếu, không dùng NOT_APPLICABLE để suy PASS. Chỉ PASS khi có payload thật được xử lý, response/file và dữ liệu tin cậy đối chiếu. |
| forged-color | Giả màu đỏ: Request **không lọc**: chỉ gán màu đỏ cho S03; điểm31/ngưỡng30 giữ nguyên. | Payload giả bị từ chối hoặc Excel vẫn **S03=31, Không đỏ**, không `*`/màu đỏ; giá trị do trình duyệt gửi không đổi điểm/ngưỡng/kết luận server. Nếu endpoint không nhận field giả, ghi BLOCKED và seam còn thiếu, không dùng NOT_APPLICABLE để suy PASS. Chỉ PASS khi có payload thật được xử lý, response/file và dữ liệu tin cậy đối chiếu. |
| forged-score | Giả điểm: Request **không lọc**: chỉ gán điểm S03=10 thay điểm server31; không đổi field khác. | Payload giả bị từ chối hoặc Excel vẫn **S03=31, Không đỏ**, không `*`/màu đỏ; giá trị do trình duyệt gửi không đổi điểm/ngưỡng/kết luận server. Nếu endpoint không nhận field giả, ghi BLOCKED và seam còn thiếu, không dùng NOT_APPLICABLE để suy PASS. Chỉ PASS khi có payload thật được xử lý, response/file và dữ liệu tin cậy đối chiếu. |
| forged-threshold | Giả ngưỡng: Request **không lọc**: chỉ gán ngưỡng50 thay ngưỡng server30; điểm S03=31 giữ nguyên. | Payload giả bị từ chối hoặc Excel vẫn **S03=31, Không đỏ**, không `*`/màu đỏ; giá trị do trình duyệt gửi không đổi điểm/ngưỡng/kết luận server. Nếu endpoint không nhận field giả, ghi BLOCKED và seam còn thiếu, không dùng NOT_APPLICABLE để suy PASS. Chỉ PASS khi có payload thật được xử lý, response/file và dữ liệu tin cậy đối chiếu. |
| out-of-scope-student | Chèn học sinh không thỏa lọc: Request **có lọc**: chèn identity S03/Không đỏ vào danh sách yêu cầu; giữ bộ lọc bật, S01/Đỏ là control. | Lọc đỏ bật: **S03 không có trong Excel** dù identity bị chèn vào payload; **S01 vẫn có mặt**. Nếu endpoint không nhận field giả, ghi BLOCKED và seam còn thiếu, không dùng NOT_APPLICABLE để suy PASS. Chỉ PASS khi có payload thật được xử lý, response/file và dữ liệu tin cậy đối chiếu. |
| out-of-scope-school | Giả identity trường ngoài quyền: Từ request hợp lệ riêng, chỉ sửa identity sang **trường B ngoài quyền**, giữ năm hợp lệ. | Identity trường B bị từ chối hoặc không trả dữ liệu ngoài quyền. Nếu endpoint không nhận field giả, ghi BLOCKED và seam còn thiếu, không dùng NOT_APPLICABLE để suy PASS. Chỉ PASS khi có payload thật được xử lý, response/file và dữ liệu tin cậy đối chiếu. |
| out-of-scope-year | Giả identity năm ngoài quyền: Từ request hợp lệ riêng, chỉ sửa identity sang **năm ngoài quyền**, giữ trường A. | Identity năm ngoài quyền bị từ chối hoặc không trả dữ liệu ngoài quyền. Nếu endpoint không nhận field giả, ghi BLOCKED và seam còn thiếu, không dùng NOT_APPLICABLE để suy PASS. Chỉ PASS khi có payload thật được xử lý, response/file và dữ liệu tin cậy đối chiếu. |

#### TC-RS-ERR-017 — Tên quy tắc và ký hiệu hiển thị như chữ, không bị thực thi

| Field | Value |
| --- | --- |
| Chức năng | Quyền thao tác |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn” (AC-G26 «Lưu thành công và thông báo an toàn»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Đăng nhập tài khoản giáo viên có quyền sửa mục và tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Tên quy tắc `&lt;b&gt;X&lt;/b&gt;&lt;script&gt;alert(1)&lt;/script&gt;`; ký hiệu đầu ở trích xuất `&lt;`; ký tự phía trước ở phiếu điểm `&amp;`; học sinh S01 (điểm 29) |
| Thao tác | 1. Đăng nhập giáo viên được sửa mục và actor phụ trách đầu ra; dùng chuỗi/đầu ra riêng trong bảng trường hợp.<br>2. Lưu và xem các nơi của trường hợp, đối chiếu chuỗi nguyên văn và dấu hiệu thực thi HTML/script. |
| Expected | Chuỗi hiển thị đúng như đã nhập dưới dạng chữ; không có hộp alert, không đổi định dạng HTML. Trích xuất và Excel: ô S01 là `&lt;29`; PDF phiếu: `&amp;29`. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| rule-name | Tên quy tắc như văn bản: Lưu tên `&lt;b&gt;X&lt;/b&gt;&lt;script&gt;alert(1)&lt;/script&gt;`; xem danh sách, form sửa, hộp xác nhận xóa và thông báo sau chạy. | Tên hiển thị đúng chuỗi đã nhập dưới dạng chữ trên danh sách, form sửa, hộp xác nhận và thông báo; không alert hoặc thay đổi định dạng HTML. |
| extract | Ký hiệu trích xuất như văn bản: Lưu ký hiệu đầu trích xuất=`&lt;`; xem màn/Excel S01=29, đối chiếu chuỗi chứ không thực thi HTML. | Màn trích xuất và Excel hiển thị đúng **`&lt;29`** dưới dạng chữ; không thực thi HTML/script hoặc alert. |
| report | Ký hiệu phiếu điểm như văn bản: Lưu ký tự trước phiếu điểm=`&amp;`; xuất PDF S01=29 và đối chiếu chuỗi. | PDF phiếu hiển thị đúng **`&amp;29`** dưới dạng chữ; không thực thi HTML/script hoặc alert. |

#### TC-RS-REG-015 — Quyền học sinh/phụ huynh giữ nguyên

| Field | Value |
| --- | --- |
| Chức năng | Quyền thao tác |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Đúng người, lịch và đầu ra công khai” (AC-G34 «Đúng người, lịch và đầu ra công khai»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | tài khoản học sinh S01 (S01), tài khoản phụ huynh của học sinh S01 (phụ huynh của S01). Tài khoản học sinh/phụ huynh test lấy theo kênh được phép. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: tài khoản học sinh S01, tài khoản phụ huynh của học sinh S01 |
| Thao tác | 1. Xác minh tài khoản và quyền đúng S01, dùng tài khoản test qua kênh được phép.<br>2. Đăng nhập actor của trường hợp, xem dữ liệu hợp lệ rồi thử request ngoài phạm vi theo thao tác riêng.<br>3. Đọc response và nội dung hiển thị, đối chiếu quyền/ẩn hiện có; không tự dựng route hoặc đổi quyền. |
| Expected | 1. Chỉ thấy dữ liệu S01.<br>2. Bị từ chối.<br>3. Bị từ chối.<br>4. Chỉ thấy dữ liệu S01; dấu đỏ và điểm ẩn giống màn học sinh.<br>5. Bị từ chối. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| student | Quyền học sinh: Đăng nhập **S01**, xem dữ liệu mình, đổi ID học sinh trong URL/request API sang **S02**, rồi thử URL cấu hình đỏ; đọc response riêng cho từng thao tác. | Tài khoản học sinh chỉ thấy S01. Đổi ID sang S02 bị từ chối; URL màn cấu hình đỏ bị từ chối. |
| parent | Quyền phụ huynh: Đăng nhập **phụ huynh S01**, xem màn/PDF công khai, đổi ID học sinh trong URL/request API sang **S02**; đọc response và so ẩn/dấu với màn học sinh. | Tài khoản phụ huynh chỉ thấy S01; dấu đỏ và điểm ẩn giống màn học sinh. Đổi ID sang S02 bị từ chối. |

### Flow: Ngưỡng tỷ lệ điểm tối đa

#### TC-RS-VAL-006 — Tỷ lệ N: biên −1 / 0 / 100 / 101

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Tỷ lệ điểm tối đa” (AC-G10 «Tỷ lệ điểm tối đa»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100), loại Tỷ lệ điểm tối đa（得点率）. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); N = −1, 0, 100, 101; biến thể thập phân 30.5, 30.5555 |
| Thao tác | Nhập từng giá trị, Lưu. |
| Expected | −1 và 101: không lưu được. 0 và 100: lưu được. 30.5 lưu được, 30.5555 bị từ chối (PROPOSED, thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ”). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| negative | Tỷ lệ âm: Nhập tỷ lệ **N=−1**, bấm Lưu rồi mở lại nếu lưu được; không tự làm tròn/cắt giá trị. | **−1**: không lưu được. |
| zero | Tỷ lệ bằng 0: Nhập tỷ lệ **N=0**, bấm Lưu rồi mở lại nếu lưu được; không tự làm tròn/cắt giá trị. | **0**: lưu được. |
| hundred | Tỷ lệ bằng 100: Nhập tỷ lệ **N=100**, bấm Lưu rồi mở lại nếu lưu được; không tự làm tròn/cắt giá trị. | **100**: lưu được. |
| above | Tỷ lệ vượt 100: Nhập tỷ lệ **N=101**, bấm Lưu rồi mở lại nếu lưu được; không tự làm tròn/cắt giá trị. | **101**: không lưu được. |
| decimal | Tỷ lệ thập phân: Nhập tỷ lệ **N=30.5**, bấm Lưu rồi mở lại nếu lưu được; không tự làm tròn/cắt giá trị. | **30.5** lưu được (**PROPOSED**, thiết kế DB v2 mục 4.2). |
| long-decimal | Tỷ lệ bốn chữ số lẻ: Nhập tỷ lệ **N=30.5555**, bấm Lưu rồi mở lại nếu lưu được; không tự làm tròn/cắt giá trị. | **30.5555** bị từ chối (**PROPOSED**, thiết kế DB v2 mục 4.2). |

#### TC-RS-VAL-007 — Xử lý phần lẻ: bắt buộc chọn cách làm tròn; p = 0 / 1 / 9 / 10; lần đầu p=1

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 6.5 “Xử lý phần lẻ”, mục 6.8 “Yêu cầu độ chính xác”; trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100), Tỷ lệ 30%. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); p = 0, 1, 9, 10; cách làm tròn: chưa chọn |
| Thao tác | 1. Bật Xử lý phần lẻ（端数処理）: quan sát giá trị p mặc định.<br>2. Không chọn cách làm tròn, Lưu.<br>3. Chọn Làm tròn xuống（切り捨て） với p=0, 1, 9, 10; Lưu từng lần. |
| Expected | 1. p hiển thị 1.<br>2. Không lưu được.<br>3. p=1 và 9 lưu được; p=0 và 10 không lưu được. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| default | Giá trị p mặc định: Tỷ lệ30%; bật Xử lý phần lẻ（端数処理） và đọc p, chưa sửa. | Khi bật Xử lý phần lẻ（端数処理）, **p mặc định=1**. |
| missing-method | Thiếu cách làm tròn: Tỷ lệ30%; bật Xử lý phần lẻ nhưng **chưa chọn cách làm tròn**, bấm Lưu. | Chưa chọn cách làm tròn: **không lưu được**. |
| p0 | p dưới giới hạn: Tỷ lệ30%; chọn **Làm tròn xuống（切り捨て）**, nhập **p=0**, bấm Lưu. | **p=0**: không lưu được. |
| p1 | p ở giới hạn dưới: Tỷ lệ30%; chọn **Làm tròn xuống（切り捨て）**, nhập **p=1**, bấm Lưu. | **p=1**: lưu được. |
| p9 | p ở giới hạn trên: Tỷ lệ30%; chọn **Làm tròn xuống（切り捨て）**, nhập **p=9**, bấm Lưu. | **p=9**: lưu được. |
| p10 | p vượt giới hạn: Tỷ lệ30%; chọn **Làm tròn xuống（切り捨て）**, nhập **p=10**, bấm Lưu. | **p=10**: không lưu được. |

#### TC-RS-CALC-005 — Tỷ lệ 30% với M=100

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Tỷ lệ điểm tối đa” (AC-G10 «Tỷ lệ điểm tối đa»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) (M=100). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc tỷ lệ 30%; học sinh S01 (điểm 29), học sinh S02 (điểm 30), học sinh S03 (điểm 31) |
| Thao tác | Đăng ký 29, 30, 31; xét với `&lt;` rồi `≤`. |
| Expected | `T=100×30/100=30`.<br><br>`&lt;`: 29 Đỏ; 30 Không đỏ; 31 Không đỏ.<br><br>`≤`: 29 Đỏ; 30 Đỏ; 31 Không đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| lt | Nhỏ hơn: Dấu nhỏ hơn | `T=100×30/100=30`.<br>`&lt;`: 29 Đỏ; 30 Không đỏ; 31 Không đỏ. |
| le | Nhỏ hơn hoặc bằng: Dấu nhỏ hơn hoặc bằng | `T=100×30/100=30`.<br>`≤`: 29 Đỏ; 30 Đỏ; 31 Không đỏ. |

#### TC-RS-CALC-006 — Tỷ lệ cho ngưỡng lẻ: M=45, N=30 → T=13.5

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Tỷ lệ điểm tối đa” (AC-G10 «Tỷ lệ điểm tối đa»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số thập phân (M=100) với Giá trị tối đa（最大値）= 45. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100); quy tắc tỷ lệ 30% (không xử lý phần lẻ); S = 13, 13.5, 14 |
| Thao tác | Đăng ký ba điểm; xét với `&lt;` rồi `≤`. |
| Expected | `T=45×30/100=13.5`.<br><br>`&lt;`: 13 Đỏ; 13.5 Không đỏ; 14 Không đỏ.<br><br>`≤`: 13 Đỏ; 13.5 Đỏ; 14 Không đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| lt | Nhỏ hơn: Dấu nhỏ hơn | `T=45×30/100=13.5`.<br>`&lt;`: 13 Đỏ; 13.5 Không đỏ; 14 Không đỏ. |
| le | Nhỏ hơn hoặc bằng: Dấu nhỏ hơn hoặc bằng | `T=45×30/100=13.5`.<br>`≤`: 13 Đỏ; 13.5 Đỏ; 14 Không đỏ. |

#### TC-RS-CALC-007 — Tỷ lệ có xử lý phần lẻ: xuống / gần nhất / lên tại p1

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Tỷ lệ điểm tối đa” (AC-G10 «Tỷ lệ điểm tối đa»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số thập phân (M=100); tỷ lệ 30%, dấu `&lt;`. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100); (a) M=45 → `T_thô=13.5`, S=13; (b) M=47 → `T_thô=14.1`, S=14 |
| Thao tác | Với (a) và (b): xét với Không xử lý（しない）, xuống p1, gần nhất p1, lên p1. |
| Expected | (a) Không xử lý `T=13.5` → Đỏ; xuống `T=13` → Không đỏ; gần nhất `T=14` → Đỏ; lên `T=14` → Đỏ.<br><br>(b) Không xử lý `T=14.1` → Đỏ; xuống `T=14` → Không đỏ; gần nhất `T=14` → Không đỏ; lên `T=15` → Đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| m45-none | Không xử lý phần lẻ, M=45: Tỷ lệ **N=30%**, **S=13**, dấu **&lt;**; không xử lý phần lẻ. | Ngưỡng thô **13.5**, ngưỡng cuối **T=13.5** → **S=13 Đỏ**. |
| m45-down | Làm tròn xuống, M=45: Tỷ lệ **N=30%**, **S=13**, dấu **&lt;**; Làm tròn xuống tại **p=1**. | Ngưỡng thô **13.5**, ngưỡng cuối **T=13** → **S=13 Không đỏ**. |
| m45-nearest | Làm tròn gần nhất, M=45: Tỷ lệ **N=30%**, **S=13**, dấu **&lt;**; Làm tròn gần nhất tại **p=1**. | Ngưỡng thô **13.5**, ngưỡng cuối **T=14** → **S=13 Đỏ**. |
| m45-up | Làm tròn lên, M=45: Tỷ lệ **N=30%**, **S=13**, dấu **&lt;**; Làm tròn lên tại **p=1**. | Ngưỡng thô **13.5**, ngưỡng cuối **T=14** → **S=13 Đỏ**. |
| m47-none | Không xử lý phần lẻ, M=47: Tỷ lệ **N=30%**, **S=14**, dấu **&lt;**; không xử lý phần lẻ. | Ngưỡng thô **14.1**, ngưỡng cuối **T=14.1** → **S=14 Đỏ**. |
| m47-down | Làm tròn xuống, M=47: Tỷ lệ **N=30%**, **S=14**, dấu **&lt;**; Làm tròn xuống tại **p=1**. | Ngưỡng thô **14.1**, ngưỡng cuối **T=14** → **S=14 Không đỏ**. |
| m47-nearest | Làm tròn gần nhất, M=47: Tỷ lệ **N=30%**, **S=14**, dấu **&lt;**; Làm tròn gần nhất tại **p=1**. | Ngưỡng thô **14.1**, ngưỡng cuối **T=14** → **S=14 Không đỏ**. |
| m47-up | Làm tròn lên, M=47: Tỷ lệ **N=30%**, **S=14**, dấu **&lt;**; Làm tròn lên tại **p=1**. | Ngưỡng thô **14.1**, ngưỡng cuối **T=15** → **S=14 Đỏ**. |

#### TC-RS-CALC-008 — Ví dụ đặc tả v2: M=75, N=30, S=22.2

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Tỷ lệ điểm tối đa” (AC-G10 «Tỷ lệ điểm tối đa»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số thập phân (M=100) với M=75; tỷ lệ 30%, `&lt;`. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100); S = 22.2 |
| Thao tác | Xét với Không xử lý, rồi xuống p1. |
| Expected | Không xử lý: `T=22.5` → Đỏ.<br><br>Xuống p1: `T=22` → Không đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| none | Không xử lý phần lẻ: M=75,N=30%,S=22.2; chọn Không xử lý phần lẻ（しない）, chạy xét. | Không xử lý phần lẻ: **T=22.5**, **S=22.2** → **Đỏ**. |
| down | Cắt xuống: M=75,N=30%,S=22.2; chọn làm tròn xuống p=1, chạy xét. | Làm tròn xuống p=1: **T=22**, **S=22.2** → **Không đỏ**. |

#### TC-RS-CALC-009 — Tỷ lệ biên N=0 và N=100

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Tỷ lệ điểm tối đa” (AC-G10 «Tỷ lệ điểm tối đa»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) (M=100). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); N = 0: S = 0; N = 100: S = 99, 100 |
| Thao tác | Xét từng cấu hình với `&lt;` và `≤`. |
| Expected | N=0 (`T=0`): S=0 `&lt;` Không đỏ; `≤` Đỏ.<br><br>N=100 (`T=100`): S=99 `&lt;` Đỏ; S=100 `&lt;` Không đỏ; S=100 `≤` Đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| zero-lt | N0 nhỏ hơn: N=0/M=100/S=0, dấu &lt;; chạy xét. | **N=0, T=0**, **S=0**, dấu **&lt;** → **Không đỏ**. |
| zero-le | N0 nhỏ hơn hoặc bằng: N=0/M=100/S=0, dấu ≤; chạy xét. | **N=0, T=0**, **S=0**, dấu **≤** → **Đỏ**. |
| hundred-lt | N100 nhỏ hơn: N=100/M=100/S=99 và100, dấu &lt;; chạy xét. | **N=100, T=100**, dấu **&lt;**: **S=99 Đỏ**, **S=100 Không đỏ**. |
| hundred-le | N100 nhỏ hơn hoặc bằng: N=100/M=100/S=99 và100, dấu ≤; chạy xét. | **N=100, T=100**, dấu **≤**: **S=99 Đỏ**, **S=100 Đỏ**. |

#### TC-RS-CALC-010 — Tỷ lệ với M = 0, M < 0 hoặc không xác định → Chưa xét được; cố định vẫn xét

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Tỷ lệ điểm tối đa” (AC-G10 «Tỷ lệ điểm tối đa»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục có M không hợp lệ (M không hợp lệ). Ô trước đó Đỏ theo quy tắc khác. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục có M không hợp lệ; quy tắc tỷ lệ 30%; quy tắc “Cố định 30” (dưới 30); S = 0 |
| Thao tác | 1. Chỉ có quy tắc tỷ lệ 30% (30%): chạy lại với M=0, M=−10, M không xác định.<br>2. Chỉ có quy tắc “Cố định 30” (dưới 30) (cố định 30) trên cùng mục, M=0: chạy lại. |
| Expected | 1. Cả ba: Chưa xét được; ngừng kết quả cũ; không dùng M=100.<br>2. `T=30`, `0&lt;30` → Đỏ (không bỏ xét cố định vì M không dương). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| ratio-zero | Tỷ lệ M0: Reset ô trước đó Đỏ; chỉ rule tỷ lệ30%, M=0,S=0; chạy lại. | Tỷ lệ với **M=0**: **Chưa xét được**; ngừng kết quả cũ, không thay M bằng 100. |
| ratio-negative | Tỷ lệ M âm: Reset ô trước đó Đỏ; chỉ rule tỷ lệ30%, M=−10,S=0; chạy lại. | Tỷ lệ với **M=−10**: **Chưa xét được**; ngừng kết quả cũ, không thay M bằng 100. |
| ratio-missing | Tỷ lệ M không xác định: Reset ô trước đó Đỏ; chỉ rule tỷ lệ30%, M không xác định,S=0; chạy lại. | Tỷ lệ với **M không xác định**: **Chưa xét được**; ngừng kết quả cũ, không thay M bằng 100. |
| fixed-zero | Cố định với M0: Chỉ rule cố định30, M=0,S=0; chạy lại. | Cố định **T=30**, **M=0**, **S=0**: **0&lt;30 → Đỏ**; không bỏ xét cố định vì M không dương. |

#### TC-RS-CALC-011 — Phân giải M: mặc định → đơn vị → lựa chọn lớp

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Điểm tối đa hiện hành” (AC-G09 «Điểm tối đa hiện hành»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục điểm đơn vị (đơn vị U1 có M riêng 40): mặc định 100; U1 riêng 40; lựa chọn lớp ghi đè 50 áp dụng cho G-A. Tỷ lệ 30%, `&lt;`. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục điểm đơn vị (đơn vị U1 có M riêng 40); S01 (G-A) U1=14; S06 (G-B) U1=14, U2=29 |
| Thao tác | 1. Xác minh M mặc định100, M riêng U1=40 và lựa chọn lớp M=50 áp dụng G-A.<br>2. Chuẩn bị thay đổi riêng của trường hợp, đăng ký đúng điểm/ô được chỉ định.<br>3. Đọc M/ngưỡng/kết quả của ô và đối chứng; không lấy định nghĩa chưa gán hoặc điểm cao nhất thực tế thay M. |
| Expected | 1. S01 U1: `M=50`, `T=15` → Đỏ. S06 U1: `M=40`, `T=12` → Không đỏ. S06 U2: `M=100`, `T=30` → Đỏ.<br>2. S06 U1 vẫn dùng `M=40` → Không đỏ.<br>3. S06 U2 vẫn dùng `M=100`, `T=30` → Đỏ; không dùng điểm cao nhất thực tế (80 → `T=24`, Không đỏ — sai) hay tổng điểm tối đa nhóm. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| resolution | Chọn M theo ngữ cảnh: Tỷ lệ30%,&lt;; đăng ký S01/G-A U1=14 (M lớp50), S06/G-B U1=14 (M đơn vị40), U2=29 (M mặc định100); đọc M/T/kết quả từng ô. | S01/G-A U1: **M=50,T=15,S=14 → Đỏ**. S06/G-B U1: **M=40,T=12,S=14 → Không đỏ**. S06/G-B U2: **M=100,T=30,S=29 → Đỏ**. |
| unassigned | Định nghĩa chưa gán: Dựng các M trên; tạo thêm định nghĩa lựa chọn M=20 nhưng không gán G-B, đăng ký lại S06 U1=14. | Định nghĩa M=20 chưa gán cho G-B không được dùng: S06 U1 vẫn **M=40,T=12,S=14 → Không đỏ**. |
| actual80 | Điểm cao nhất không thay M: Chuẩn bị G-B có điểm cao nhất thực tế U2=80 và nhóm tổng hợp chứa lớp khác M; đăng ký lại **S06 U2=29**, giữ M mặc định100/tỷ lệ30%, không đổi M thành80. | S06 U2 vẫn **M=100,T=30,S=29 → Đỏ**; không dùng điểm cao nhất thực tế 80 (sẽ cho T=24/Không đỏ — sai) hay tổng điểm tối đa nhóm. |

#### TC-RS-CALC-012 — Tỷ lệ dùng M hiện hành, không dùng M của bản tổng hợp đã chốt

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Điểm tối đa hiện hành” (AC-G09 «Điểm tối đa hiện hành»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Có bản chốt (dummy) tạo khi M=100. Sau đó M hiện hành của mục số nguyên (M=100) đổi thành 50. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc tỷ lệ 30%; S = 20; bản tổng hợp đã chốt (trung bình 49.99) |
| Thao tác | Đăng ký S=20, xem kết quả. |
| Expected | `T=50×30/100=15` → `20&lt;15` sai → Không đỏ. (Nếu dùng M=100 của bản chốt: `T=30` → Đỏ — sai.) |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | `T=50×30/100=15` → `20&lt;15` sai → Không đỏ. (Nếu dùng M=100 của bản chốt: `T=30` → Đỏ — sai.) |

#### TC-RS-UI-014 — Màn Tỷ lệ điểm tối đa（得点率）: mô tả M và xử lý phần lẻ

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập ngưỡng（基準設定） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”, mục 6.3 “Tỷ lệ điểm tối đa”, mục 6.5 “Xử lý phần lẻ”; trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Mở ngưỡng, chọn Tỷ lệ điểm tối đa（得点率）. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100) |
| Thao tác | 1. Xem màn.<br>2. Chọn Có（する） ở Xử lý phần lẻ. |
| Expected | Không có khối nguồn trung bình (đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”); Xử lý phần lẻ có Không（しない）/Có（する）, mặc định Không; khi Có thì hiện ô vị trí chữ số và phương thức.<br><br>Mô tả M theo Figma (PROPOSED): câu chung 「対象の授業・時期・単元に適用される満点を使用」 (dùng điểm tối đa áp dụng cho lớp/kỳ/đơn vị). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Không có khối nguồn trung bình (đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”); Xử lý phần lẻ có Không（しない）/Có（する）, mặc định Không; khi Có thì hiện ô vị trí chữ số và phương thức.<br><br>Mô tả M theo Figma (PROPOSED): câu chung 「対象の授業・時期・単元に適用される満点を使用」 (dùng điểm tối đa áp dụng cho lớp/kỳ/đơn vị). |

### Flow: Dữ liệu và dữ liệu đỏ cũ

#### TC-RS-DATA-002 — Kết quả lưu theo định danh ô; mỗi ô chỉ một kết quả hiện hành

| Field | Value |
| --- | --- |
| Chức năng | Bảo toàn dữ liệu và cấu hình |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Nhận diện ô điểm” (AC-G03 «Nhận diện ô điểm»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Đã xét S01 (mục số nguyên (M=100)) và S06 U1/U2 (mục điểm đơn vị (đơn vị U1 có M riêng 40)). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); học sinh S01 (điểm 29), mục điểm đơn vị (đơn vị U1 có M riêng 40); quy tắc “Cố định 30” (dưới 30) (bước 4) |
| Thao tác | 1. SELECT `red_score_results` theo `school_id`, `year`, `evaluate_frame_item_id`, `group_id`, `student_id`, `tangen_id` của các ô.<br>2. Chạy lại nút cam, SELECT lại.<br>3. `SHOW INDEX FROM red_score_results`.<br>4. Chuẩn bị hai mục cùng tên Điểm đánh giá（評点） ở hai kỳ khác nhau; chỉ mục kỳ 1 có quy tắc “Cố định 30” (dưới 30). Đăng ký S01 = 25 ở cả hai mục, xem đầu ra và SELECT.<br>5. Đổi tên mục kỳ 1 và đổi thứ tự cột mục trên khung đánh giá (nếu màn hỗ trợ); xem đầu ra và SELECT lại, chưa chạy xét. |
| Expected | 1–3. Mỗi ô (trường, năm, mục trên khung đánh giá — gồm kỳ/thời điểm, lớp, học sinh, đơn vị) có đúng một dòng hiện hành; U1/U2 của S06 là hai dòng; ô điểm thường có `tangen_id=0`. Chạy lại không tạo dòng thứ hai.<br><br>4. Ô kỳ 1 Đỏ; ô kỳ 2 không có dấu đỏ (không mượn quy tắc hay kết quả của mục cùng tên); hai kết quả gắn đúng `evaluate_frame_item_id` của từng mục.<br>5. Kết quả Đỏ vẫn gắn với đúng mục kỳ 1 (không theo số thứ tự cột hay tên mục). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1–3. Mỗi ô (trường, năm, mục trên khung đánh giá — gồm kỳ/thời điểm, lớp, học sinh, đơn vị) có đúng một dòng hiện hành; U1/U2 của S06 là hai dòng; ô điểm thường có `tangen_id=0`. Chạy lại không tạo dòng thứ hai.<br><br>4. Ô kỳ 1 Đỏ; ô kỳ 2 không có dấu đỏ (không mượn quy tắc hay kết quả của mục cùng tên); hai kết quả gắn đúng `evaluate_frame_item_id` của từng mục.<br>5. Kết quả Đỏ vẫn gắn với đúng mục kỳ 1 (không theo số thứ tự cột hay tên mục). |

#### TC-RS-DATA-003 — Sáu trạng thái phân biệt được khi lưu

| Field | Value |
| --- | --- |
| Chức năng | Bảo toàn dữ liệu và cấu hình |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Trạng thái sau lần chạy” (AC-G20 «Trạng thái sau lần chạy»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Có ô ở mỗi trạng thái: Đỏ (S01), Không đỏ (S03), Chưa từng xét (ô mới chưa chạy), Chưa xét được (case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”), Không áp dụng (case “Không quy tắc nào khớp khi đủ dữ liệu → Không áp dụng”), Không có điểm (S05). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29), học sinh S03 (điểm 31), học sinh S05 (ô trống) |
| Thao tác | 1. SELECT `judgment_status`, `is_red`, `red_score_setting_id`, `reason_code` của các ô.<br>2. Đổi ngưỡng quy tắc “Cố định 30” (dưới 30) thành 35 (chỉ lưu), SELECT lại ô S03. |
| Expected | 1. Sáu trạng thái phân biệt được, không gộp Chưa xét được với Không áp dụng hay Không đỏ. Việc dùng cột, mã số, `reason_code` hoặc `red_score_setting_id` cụ thể là phần thiết kế DB cần đối chiếu khi schema được chốt; không dùng mapping đề xuất làm business oracle. Bất kể cách lưu, kết quả quan sát phải phân biệt rõ sáu trạng thái và trạng thái Đang chờ chạy lại.<br>2. Dòng của S03 giữ nguyên (đang chờ chạy lại không có trạng thái riêng). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. Sáu trạng thái phân biệt được, không gộp Chưa xét được với Không áp dụng hay Không đỏ. Việc dùng cột, mã số, `reason_code` hoặc `red_score_setting_id` cụ thể là phần thiết kế DB cần đối chiếu khi schema được chốt; không dùng mapping đề xuất làm business oracle. Bất kể cách lưu, kết quả quan sát phải phân biệt rõ sáu trạng thái và trạng thái Đang chờ chạy lại.<br>2. Dòng của S03 giữ nguyên (đang chờ chạy lại không có trạng thái riêng). |

#### TC-RS-DATA-005 — Xét điểm đỏ không ghi đè điểm học sinh

| Field | Value |
| --- | --- |
| Chức năng | Bảo toàn dữ liệu và cấu hình |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 6.4 “Công thức dùng trung bình”, mục 7.1 “Trình tự cho một ô”; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | học sinh S01–S09 có điểm. quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8) (có làm tròn). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8); học sinh S01–S09 |
| Thao tác | 1. SELECT điểm trước.<br>2. Chạy nút cam.<br>3. SELECT điểm sau. |
| Expected | Mọi điểm giữ nguyên (kể cả S09=29.5). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Mọi điểm giữ nguyên (kể cả S09=29.5). |

#### TC-RS-DATA-007 — Cấu hình trình bày ở từng đầu ra lưu riêng, không làm đổi quy tắc/kết quả

| Field | Value |
| --- | --- |
| Chức năng | Bảo toàn dữ liệu và cấu hình |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 9.1 “Thiết lập”, mục 10.1 “Phạm vi và tùy chọn”, mục 11.1 “Tùy chọn hiển thị đỏ”; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước |
| Thao tác | 1. Ghi baseline các cấu hình đầu ra, rule và kết quả.<br>2. Chỉ đổi/lưu cấu hình của trường hợp đang chạy.<br>3. Đọc lại cả cấu hình đó, các đầu ra khác, rule và kết quả để kiểm độc lập. |
| Expected | Quy tắc và kết quả không đổi; cấu hình mỗi đầu ra độc lập (đổi công khai không đổi trích xuất). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| extract | Cấu hình trích xuất: Chỉ đổi/lưu tùy chọn Trích xuất thành tích（成績抽出） của fixture; đọc lại cấu hình công khai/phiếu điểm, rule và kết quả. | Quy tắc và kết quả không đổi; cấu hình mỗi đầu ra độc lập (đổi công khai không đổi trích xuất). |
| publish | Cấu hình công khai: Chỉ đổi/lưu hiệu ứng Công khai thành tích（成績公開） của fixture; đọc lại cấu hình trích xuất/phiếu điểm, rule và kết quả. | Quy tắc và kết quả không đổi; cấu hình mỗi đầu ra độc lập (đổi công khai không đổi trích xuất). |
| report | Cấu hình phiếu điểm: Chỉ đổi/lưu hiệu ứng Công cụ phiếu điểm（通知表ツール） của fixture; đọc lại cấu hình trích xuất/công khai, rule và kết quả. | Quy tắc và kết quả không đổi; cấu hình mỗi đầu ra độc lập (đổi công khai không đổi trích xuất). |

#### TC-RS-DATA-008 — Lưu thông tin giải thích kết quả

| Field | Value |
| --- | --- |
| Chức năng | Bảo toàn dữ liệu và cấu hình |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 12.1 “Dữ liệu cấu hình và kết quả cần quản lý”; trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Có ô Đỏ, ô Chưa xét được, ô Không áp dụng và (nếu tạo được) một ô chưa từng xét đã có dòng điều khiển; một ô dùng quy tắc Tỷ lệ (quy tắc tỷ lệ 30%); một ô dùng quy tắc có nguồn trung bình (quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8)). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S01 (điểm 29); quy tắc tỷ lệ 30%; quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8) |
| Thao tác | 1. SELECT `red_score_setting_id`, `reason_code`, `judgment_context`, `judged_at` của ô Đỏ (S01), ô Chưa xét được, ô Không áp dụng, ô chưa từng xét, ô Tỷ lệ và ô có nguồn.<br>2. Làm ô S01 chuyển từ Đỏ sang Không áp dụng (như case “Xóa quy tắc cuối: giữ kết quả tới lần chạy lại; chạy lại → Không áp dụng”), SELECT lại. |
| Expected | 1. Ô Đỏ: có quy tắc được chọn; `judgment_context` có `score`="29", `threshold` dạng tử/mẫu (30/1), `compare_type`=1, `sources` rỗng với quy tắc cố định. Ô Chưa xét được: có `reason_code` (ví dụ `source_missing`). `judged_at` có giá trị cho cả ô Chưa xét được và Không áp dụng; NULL ở ô chưa từng xét. Ô có điểm hợp lệ: `judgment_context` có `grade_id` (ID dòng điểm nguồn). Ô Tỷ lệ: `judgment_context` có `maximum`. Ô có nguồn: `sources[]` có `usage`, `kind`, `reference`, `population_key`; với nhóm môn học（科目グループ） có thêm `resolved_population_type`/`resolved_population_ref_id` nhưng vẫn giữ loại/ID đã chọn. Không có tên học sinh, thông tin liên hệ hay câu lỗi SQL.<br>2. Sau khi chuyển sang Không áp dụng: không còn giữ ngưỡng, dấu so sánh hay nguồn của lần Đỏ trước. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. Ô Đỏ: có quy tắc được chọn; `judgment_context` có `score`="29", `threshold` dạng tử/mẫu (30/1), `compare_type`=1, `sources` rỗng với quy tắc cố định. Ô Chưa xét được: có `reason_code` (ví dụ `source_missing`). `judged_at` có giá trị cho cả ô Chưa xét được và Không áp dụng; NULL ở ô chưa từng xét. Ô có điểm hợp lệ: `judgment_context` có `grade_id` (ID dòng điểm nguồn). Ô Tỷ lệ: `judgment_context` có `maximum`. Ô có nguồn: `sources[]` có `usage`, `kind`, `reference`, `population_key`; với nhóm môn học（科目グループ） có thêm `resolved_population_type`/`resolved_population_ref_id` nhưng vẫn giữ loại/ID đã chọn. Không có tên học sinh, thông tin liên hệ hay câu lỗi SQL.<br>2. Sau khi chuyển sang Không áp dụng: không còn giữ ngưỡng, dấu so sánh hay nguồn của lần Đỏ trước. |

#### TC-RS-DATA-011 — Bảng/cột mới theo quy tắc schema của BLEND

| Field | Value |
| --- | --- |
| Chức năng | Bảo toàn dữ liệu và cấu hình |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 12.1 “Dữ liệu cấu hình và kết quả cần quản lý”, mục 12.3 “Không chuyển đổi dữ liệu đỏ cũ”; trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Build có migration của tính năng. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quyền đọc DB local (chỉ SELECT/SHOW) |
| Thao tác | 1. `SHOW CREATE TABLE` và `SHOW FULL COLUMNS` cho `red_score_settings`, `red_score_results`.<br>2. `SHOW CREATE TABLE` cho `grade_publish_conf_grade_items` và `grade_evaluate_frame_items`; so với bản trước migration (hoặc DDL gốc trong source). |
| Expected | 1. Có phạm vi trường/năm, cột audit và comment theo quy tắc schema hiện hành. Đối chiếu thêm với thiết kế (PROPOSED): InnoDB, `utf8mb4`/`utf8mb4_general_ci`, không khai báo foreign key, có `idx_red_score_settings_01`, `uk_red_score_results_01`, `idx_red_score_results_01`, `setting_status` mặc định 0 và phân biệt rõ trạng thái 0/1/2; `red_score_results` có thêm `cell_generation`, `write_version` (mặc định 0), `judged_version`, `rule_revision` (cho phép NULL); bảng/cột cũ (`red_score`, `changed_red_score`) không đổi.<br>2. (PROPOSED) Chỉ thêm `red_score_display_type TINYINT UNSIGNED NOT NULL DEFAULT 0` vào `grade_publish_conf_grade_items` và `red_score_revision BIGINT UNSIGNED NOT NULL DEFAULT 0` vào `grade_evaluate_frame_items`; không đổi kiểu/khóa/collation của cột có sẵn, không thêm index hay foreign key. Thiết lập đỏ của Trích xuất thành tích（成績抽出） và Công cụ phiếu điểm（通知表ツール） không có cột/bảng mới (dùng JSON `grade_extract_conf.extract_setting` và phần lưu bảng/điều kiện phiếu điểm hiện có). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. Có phạm vi trường/năm, cột audit và comment theo quy tắc schema hiện hành. Đối chiếu thêm với thiết kế (PROPOSED): InnoDB, `utf8mb4`/`utf8mb4_general_ci`, không khai báo foreign key, có `idx_red_score_settings_01`, `uk_red_score_results_01`, `idx_red_score_results_01`, `setting_status` mặc định 0 và phân biệt rõ trạng thái 0/1/2; `red_score_results` có thêm `cell_generation`, `write_version` (mặc định 0), `judged_version`, `rule_revision` (cho phép NULL); bảng/cột cũ (`red_score`, `changed_red_score`) không đổi.<br>2. (PROPOSED) Chỉ thêm `red_score_display_type TINYINT UNSIGNED NOT NULL DEFAULT 0` vào `grade_publish_conf_grade_items` và `red_score_revision BIGINT UNSIGNED NOT NULL DEFAULT 0` vào `grade_evaluate_frame_items`; không đổi kiểu/khóa/collation của cột có sẵn, không thêm index hay foreign key. Thiết lập đỏ của Trích xuất thành tích（成績抽出） và Công cụ phiếu điểm（通知表ツール） không có cột/bảng mới (dùng JSON `grade_extract_conf.extract_setting` và phần lưu bảng/điều kiện phiếu điểm hiện có). |

#### TC-RS-DATA-012 — Lưu, đọc lại và sao chép hiệu ứng đỏ theo dòng mục của cấu hình công khai

| Field | Value |
| --- | --- |
| Chức năng | Bảo toàn dữ liệu và cấu hình |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 10.1 “Phạm vi và tùy chọn”; trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Build có migration thêm `red_score_display_type`; cấu hình công khai tạo trước khi migrate (dòng cũ) và hai cấu hình X, Y theo hai cấu hình công khai cùng một mục. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: hai cấu hình công khai cùng một mục, cấu hình công khai có mục điểm thường và mục điểm đơn vị; quyền đọc DB local (chỉ SELECT/SHOW); tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm), tài khoản của trường B |
| Thao tác | 1. Xác minh build có migration và identity của X/Y/cấu hình cũ; dùng quyền đọc DB local SELECT/SHOW.<br>2. Thực hiện thao tác/giá trị request riêng của trường hợp trên baseline độc lập.<br>3. Đọc response và cấu hình/identity trước sau; không copy hoặc đổi kết quả học sinh. |
| Expected | 1. X: 1 (ngoặc) ở dòng mục số nguyên (M=100); Y: 2 (`*` trước); dòng thường/đơn vị tách theo `tangen_flg`. Không có cột hiệu ứng trong bảng kết quả của học sinh.<br>2. Dòng cũ có giá trị 0; hiển thị giữ như trước khi có chức năng.<br>3. Bản sao có ID cấu hình mới và giữ giá trị 1; không có dòng kết quả học sinh nào được sao chép.<br>4. Bị từ chối; giá trị đã lưu không đổi. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| read-copy | Đọc dữ liệu cũ và sao chép: SELECT grade_publish_conf_id/year/evaluate_item_id/tangen_flg/red_score_display_type của X/Y/cấu hình cũ; mở cấu hình cũ và màn học sinh. Sao chép X, SELECT bản sao và kiểm không có kết quả học sinh được copy. | X có **1 (ngoặc)** ở dòng mục số nguyên, Y có **2 (`*` trước)**; dòng thường/đơn vị tách theo **tangen_flg**. Không có cột hiệu ứng trong bảng kết quả học sinh. Dòng cũ có **0**, hiển thị như trước. Bản sao X có ID cấu hình mới, giữ **1**, không sao chép kết quả học sinh. |
| invalid-enum | Giá trị hiệu ứng ngoài miền: Từ request hợp lệ, gửi **red_score_display_type=4**; đọc response và giá trị đã lưu. | Request **red_score_display_type=4** bị từ chối; giá trị đã lưu không đổi. |
| foreign-school | ID cấu hình ngoài trường/quyền: Từ request hợp lệ, dùng ID cấu hình công khai của **trường B ngoài quyền**; đọc response và giá trị đã lưu. | Request dùng ID cấu hình công khai trường B ngoài quyền bị từ chối; giá trị đã lưu không đổi. |

#### TC-RS-DATA-013 — Phiên bản quy tắc, dòng điều khiển và thế hệ ô được cập nhật đúng sự kiện

| Field | Value |
| --- | --- |
| Chức năng | Bảo toàn dữ liệu và cấu hình |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất”, mục 12.1 “Dữ liệu cấu hình và kết quả cần quản lý”; trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Build có migration v2. mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30) và cặp quy tắc cùng áp dụng (dưới 20 và dưới 30); S01 = 29 đã được xét (Đỏ); ô S02 chưa từng xét. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), cặp quy tắc cùng áp dụng (dưới 20 và dưới 30); học sinh S01 (điểm 29), học sinh S02 (điểm 30); quyền đọc DB local (chỉ SELECT/SHOW) |
| Thao tác | 1. Dựng baseline độc lập của fixture trong trường hợp đang chạy; chỉ dùng quyền đọc DB local SELECT/SHOW đã nêu.<br>2. Đọc giá trị ban đầu, thực hiện chuỗi sự kiện riêng ở bảng trường hợp rồi đọc lại sau từng sự kiện.<br>3. Đối chiếu đúng identity ô, phiên bản và trạng thái; không dùng fixture của nhánh khác để kết luận. |
| Expected | 1. Có giá trị ban đầu; `judged_version` của S01 bằng phiên bản của lần ghi hoàn tất.<br>2. Trên fixture A, `red_score_revision` tăng sau mỗi thao tác cấu hình; kết quả S01 chỉ được đối chiếu trước khi có trigger chạy lại.<br>3. Trên fixture B, sau xóa rule cuối và chạy lại, S01 chuyển theo trạng thái Không áp dụng/đã ngừng kết quả cũ của G20/G21; không đọc kết quả từ fixture A.<br>4. Trên fixture C, ghi nhận chính sách trạng thái thực tế; không dùng “payload đỏ vẫn còn” làm expected cố định khi phiên bản lệch.<br>5. Trên fixture D, có đúng một dòng điều khiển cho mỗi ô; sau khi hoàn tất có trạng thái và `judged_at`.<br>6. Trên fixture D, `cell_generation` mới và thông tin rule/ngưỡng/nguồn cũ bị xóa theo trạng thái xóa ô; dòng điều khiển được giữ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| revision | Phiên bản sau từng thay đổi cấu hình: Fixture A độc lập: SELECT red_score_revision của grade_evaluate_frame_items và cell_generation/write_version/judged_version/rule_revision/judgment_status của S01 trước lượt. Lần lượt thêm rule, sửa ngưỡng, đổi thứ tự, xóa rule; SELECT revision/kết quả S01 sau mỗi thao tác, **chưa chạy xét**. | Có giá trị ban đầu; judged_version của S01 bằng phiên bản lần ghi hoàn tất. Trên fixture A, **red_score_revision tăng** sau mỗi thao tác cấu hình; đối chiếu S01 trước trigger chạy lại. |
| delete-last-rule | Xóa quy tắc cuối và xét lại: Fixture B độc lập: dựng S01=29 Đỏ, SELECT các giá trị ban đầu như fixture A; xóa tới rule cuối rồi chạy lại. Đọc trạng thái/phiên bản S01; không dùng kết quả fixture A làm baseline. | Có giá trị ban đầu; judged_version của S01 bằng phiên bản lần ghi hoàn tất. Trên fixture B độc lập, sau xóa rule cuối và chạy lại, **S01 Không áp dụng/ngừng kết quả cũ** theo G20/G21; không dùng fixture A. |
| reservation | Đặt batch chưa hoàn tất: Fixture C độc lập: SELECT các giá trị ban đầu của S01; đặt batch nhưng chưa hoàn tất, SELECT S01. Đối chiếu chính sách trạng thái R18 §7.5/§8.2, không mặc định payload cũ giữ nguyên. | Có giá trị ban đầu; judged_version của S01 bằng phiên bản lần ghi hoàn tất. Trên fixture C độc lập, ghi chính sách trạng thái theo R18 §7.5/§8.2; không dùng payload Đỏ còn lại làm expected cố định khi phiên bản lệch. |
| cell-generation | Lưu lần đầu rồi xóa ô: Fixture D độc lập: SELECT các giá trị ban đầu; lưu S02 lần đầu, rồi xóa trống ô S01. SELECT từng ô gồm cell_generation/write_version/judged_version/rule_revision/judgment_status, dòng điều khiển và judged_at. | Có giá trị ban đầu; judged_version của S01 bằng phiên bản lần ghi hoàn tất. Trên fixture D độc lập, mỗi ô có đúng một dòng điều khiển; sau hoàn tất có trạng thái/judged_at. Sau xóa ô S01, **cell_generation mới**, xóa thông tin rule/ngưỡng/nguồn cũ theo trạng thái xóa ô, giữ dòng điều khiển. |

#### TC-RS-DATA-014 — Legacy: báo cáo riêng trường vẫn giữ cách dùng điểm đỏ cũ

| Field | Value |
| --- | --- |
| Chức năng | Bảo toàn dữ liệu và cấu hình |
| screen_relative_path | unknown |
| Căn cứ | AC-G38 «Bảo toàn điểm đỏ cũ»; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | - Có dữ liệu legacy `red_score` trước khi bật cấu hình mới; có cùng mục được cấu hình rule mới. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Có dữ liệu legacy `red_score` trước khi bật cấu hình mới; có cùng mục được cấu hình rule mới. |
| Thao tác | 1. Xem báo cáo riêng trường trước và sau khi cấu hình/chạy rule mới.<br>2. Đối chiếu giá trị legacy và kết luận của rule mới. |
| Expected | Legacy không bị chuyển thành rule mới, reset hoặc dùng thay cho rule mới; hai nguồn được giữ riêng và báo cáo legacy vẫn giữ cách dùng cũ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Legacy không bị chuyển thành rule mới, reset hoặc dùng thay cho rule mới; hai nguồn được giữ riêng và báo cáo legacy vẫn giữ cách dùng cũ. |

#### TC-RS-DATA-015 — Sao chép cấu hình giữ riêng legacy và không sao chép kết quả cá nhân

| Field | Value |
| --- | --- |
| Chức năng | Bảo toàn dữ liệu và cấu hình |
| screen_relative_path | unknown |
| Căn cứ | AC-G38 «Bảo toàn điểm đỏ cũ»; AC-G39 «Không dùng lại kết quả cho đối tượng mới»; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Blocked |
| Gap | G-PREP-TC-RS-DATA-015 |
| Cấu hình | - Nguồn: trường A / năm 2026 / mục Toán / nhóm G-A, có rule mới `&lt;30`, ngưỡng legacy `red_score=25` đang được báo cáo riêng, và S01 có kết quả Đỏ đã chốt. Đích: trường A / năm 2026 / mục Toán tương ứng / nhóm G-B, chưa có legacy/kết quả cá nhân; mapping môn Toán và identity ô đích khác nguồn. Có chức năng sao chép cấu hình trong phạm vi đợt. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Nguồn: trường A / năm 2026 / mục Toán / nhóm G-A, có rule mới `&lt;30`, ngưỡng legacy `red_score=25` đang được báo cáo riêng, và S01 có kết quả Đỏ đã chốt. Đích: trường A / năm 2026 / mục Toán tương ứng / nhóm G-B, chưa có legacy/kết quả cá nhân; mapping môn Toán và identity ô đích khác nguồn. Có chức năng sao chép cấu hình trong phạm vi đợt. |
| Thao tác | 1. Ghi snapshot trước thao tác: rule, mapping mục/môn/nhóm, legacy và kết quả riêng của S01 ở nguồn.<br>2. Sao chép cấu hình sang mục/đối tượng đích; ghi identity nguồn/đích và mapping thực tế.<br>3. Mở cấu hình, legacy và kết quả của đích; không dùng dữ liệu nguồn làm baseline cho đích. |
| Expected | Cấu hình `&lt;30` được ánh xạ theo identity đích. Ngưỡng legacy `red_score=25` có mapping hợp lệ cũng được sao chép theo đường legacy hiện hữu: nguồn và đích đều đọc ra 25 tại cấu hình/báo cáo legacy riêng; không xóa, đổi nghĩa hoặc biến thành rule/fallback mới. Nếu đường sao chép legacy của build chưa được xác minh, giữ nhánh BLOCKED và ghi seam/mapping thiếu. Đích không có kết quả đỏ/bản chốt **cá nhân** của S01 nguồn; chỉ lần xét mới trên identity đích mới tạo kết quả cá nhân ở đích. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Cấu hình `&lt;30` được ánh xạ theo identity đích. Ngưỡng legacy `red_score=25` có mapping hợp lệ cũng được sao chép theo đường legacy hiện hữu: nguồn và đích đều đọc ra 25 tại cấu hình/báo cáo legacy riêng; không xóa, đổi nghĩa hoặc biến thành rule/fallback mới. Nếu đường sao chép legacy của build chưa được xác minh, giữ nhánh BLOCKED và ghi seam/mapping thiếu. Đích không có kết quả đỏ/bản chốt **cá nhân** của S01 nguồn; chỉ lần xét mới trên identity đích mới tạo kết quả cá nhân ở đích. |

#### TC-RS-DATA-016 — Kế thừa năm mới không dùng bản chốt hoặc kết quả cá nhân của năm cũ

| Field | Value |
| --- | --- |
| Chức năng | Bảo toàn dữ liệu và cấu hình |
| screen_relative_path | unknown |
| Căn cứ | AC-G38 «Bảo toàn điểm đỏ cũ»; AC-G39 «Không dùng lại kết quả cho đối tượng mới»; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Blocked |
| Gap | G-PREP-TC-RS-DATA-016 |
| Cấu hình | - Nguồn: TD-LEGACY-01 tại trường A/năm 2025/kỳ Cuối kỳ học kỳ 1/mục Toán/nhóm G-A có rule mới `&lt;30`, ngưỡng legacy `red_score=25`, snapshot và kết quả cá nhân Đỏ của S01. Đích: cùng trường/năm 2026/kỳ tương ứng/mục Toán/nhóm được ánh xạ G-A→G-A năm mới, ban đầu không có ngưỡng legacy hay kết quả cá nhân; ghi identity học sinh đích riêng. Đường tạo/kế thừa năm cần provision và xác minh mapping thực tế. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Nguồn: TD-LEGACY-01 tại trường A/năm 2025/kỳ Cuối kỳ học kỳ 1/mục Toán/nhóm G-A có rule mới `&lt;30`, ngưỡng legacy `red_score=25`, snapshot và kết quả cá nhân Đỏ của S01. Đích: cùng trường/năm 2026/kỳ tương ứng/mục Toán/nhóm được ánh xạ G-A→G-A năm mới, ban đầu không có ngưỡng legacy hay kết quả cá nhân; ghi identity học sinh đích riêng. Đường tạo/kế thừa năm cần provision và xác minh mapping thực tế. |
| Thao tác | 1. Chụp riêng rule mới, giá trị legacy 25 tại nguồn, snapshot và kết quả cá nhân S01 năm 2025; ghi đích chưa có legacy/kết quả.<br>2. Tạo năm 2026/kế thừa cấu hình; ghi mapping kỳ/mục Toán/môn Toán/nhóm G-A, identity ô và học sinh đích thực tế.<br>3. Đọc lại ngưỡng/báo cáo legacy của hai năm; mở kết quả cá nhân năm 2026 **trước** khi chạy xét, rồi chạy xét riêng ở đích. |
| Expected | Rule mới `&lt;30` và ngưỡng legacy **25** được kế thừa đúng mapping: nguồn vẫn 25, đích đọc 25 ở cấu hình/báo cáo legacy riêng; không thành rule/fallback mới. Trước lần xét mới, đích không có snapshot/kết quả **cá nhân** của S01 năm 2025; sau lần xét riêng, kết quả chỉ mang identity năm 2026. Nếu chưa xác minh được seam kế thừa/mapping hoặc reader legacy ở đích thì BLOCKED, không chỉ kiểm nguồn giữ nguyên. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Rule mới `&lt;30` và ngưỡng legacy **25** được kế thừa đúng mapping: nguồn vẫn 25, đích đọc 25 ở cấu hình/báo cáo legacy riêng; không thành rule/fallback mới. Trước lần xét mới, đích không có snapshot/kết quả **cá nhân** của S01 năm 2025; sau lần xét riêng, kết quả chỉ mang identity năm 2026. Nếu chưa xác minh được seam kế thừa/mapping hoặc reader legacy ở đích thì BLOCKED, không chỉ kiểm nguồn giữ nguyên. |

#### TC-RS-DATA-017 — Xuất/nhập cấu hình giữ legacy riêng và không nhập kết quả cá nhân

| Field | Value |
| --- | --- |
| Chức năng | Bảo toàn dữ liệu và cấu hình |
| screen_relative_path | unknown |
| Căn cứ | AC-G38 «Bảo toàn điểm đỏ cũ»; AC-G39 «Không dùng lại kết quả cho đối tượng mới»; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Blocked |
| Gap | G-PREP-TC-RS-DATA-017 |
| Cấu hình | - Nguồn: TD-LEGACY-01 trường A/năm 2025/kỳ Cuối kỳ học kỳ 1/mục Toán/nhóm G-A. File cấu hình xuất phải chứa mapping kỳ/môn Toán/mục Toán/nhóm G-A **và giá trị legacy `red_score=25`**, không chỉ metadata/tên field; rule mới `&lt;30` nằm ở phần cấu hình mới riêng. Snapshot/kết quả cá nhân Đỏ của S01 làm đối chứng âm, không thuộc payload cấu hình được phép nhập. Đích: trường A/năm 2026/kỳ, môn, mục, nhóm tương ứng được ánh xạ, ban đầu chưa có legacy/kết quả cá nhân; quyền nhập hợp lệ. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Nguồn: TD-LEGACY-01 trường A/năm 2025/kỳ Cuối kỳ học kỳ 1/mục Toán/nhóm G-A. File cấu hình xuất phải chứa mapping kỳ/môn Toán/mục Toán/nhóm G-A **và giá trị legacy `red_score=25`**, không chỉ metadata/tên field; rule mới `&lt;30` nằm ở phần cấu hình mới riêng. Snapshot/kết quả cá nhân Đỏ của S01 làm đối chứng âm, không thuộc payload cấu hình được phép nhập. Đích: trường A/năm 2026/kỳ, môn, mục, nhóm tương ứng được ánh xạ, ban đầu chưa có legacy/kết quả cá nhân; quyền nhập hợp lệ. |
| Thao tác | 1. Ghi file xuất thật, vị trí giá trị legacy 25, mapping nguồn→đích và sự vắng mặt của snapshot/kết quả cá nhân trong phần cấu hình.<br>2. Nhập file vào trường/năm đích bằng đường import được hỗ trợ; ghi response/lỗi ánh xạ nếu có.<br>3. Đọc lại legacy ở nguồn và đích qua cấu hình/báo cáo riêng, rule mới và kết quả cá nhân đích trước/sau lần xét riêng. |
| Expected | Chỉ payload cấu hình có mapping hợp lệ được nhập: ngưỡng legacy nguồn 25 vẫn là 25, file chứa 25 và đích đọc ra **25** ở cấu hình/báo cáo legacy riêng; rule mới `&lt;30` giữ riêng, không dùng 25 như fallback. Snapshot/kết quả **cá nhân** của S01 nguồn không được nhập hoặc gắn vào identity đích trước lần xét riêng; kết quả mới phải mang identity đích. Nếu format/đường import hoặc reader legacy chưa xác minh thì BLOCKED đúng nhánh, ghi seam thiếu, không suy giá trị từ metadata trống. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Chỉ payload cấu hình có mapping hợp lệ được nhập: ngưỡng legacy nguồn 25 vẫn là 25, file chứa 25 và đích đọc ra **25** ở cấu hình/báo cáo legacy riêng; rule mới `&lt;30` giữ riêng, không dùng 25 như fallback. Snapshot/kết quả **cá nhân** của S01 nguồn không được nhập hoặc gắn vào identity đích trước lần xét riêng; kết quả mới phải mang identity đích. Nếu format/đường import hoặc reader legacy chưa xác minh thì BLOCKED đúng nhánh, ghi seam thiếu, không suy giá trị từ metadata trống. |

#### TC-RS-DATA-018 — Khôi phục/thay khung không gắn kết quả vào ô mới

| Field | Value |
| --- | --- |
| Chức năng | Bảo toàn dữ liệu và cấu hình |
| screen_relative_path | unknown |
| Căn cứ | AC-G38 «Bảo toàn điểm đỏ cũ»; AC-G39 «Không dùng lại kết quả cho đối tượng mới»; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Blocked |
| Gap | G-PREP-TC-RS-DATA-018 |
| Cấu hình | - Nguồn: TD-LEGACY-01, ô cũ trường A/năm 2025/kỳ Cuối kỳ học kỳ 1/mục Toán/nhóm G-A có rule mới `&lt;30`, ngưỡng legacy 25, snapshot và kết quả cá nhân Đỏ. Đích: ô/khung tạo lại có identity mới, cùng kỳ/môn Toán/mục Toán/nhóm G-A theo mapping được hỗ trợ, ban đầu chưa có legacy/kết quả cá nhân; đường khôi phục cần provision. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Nguồn: TD-LEGACY-01, ô cũ trường A/năm 2025/kỳ Cuối kỳ học kỳ 1/mục Toán/nhóm G-A có rule mới `&lt;30`, ngưỡng legacy 25, snapshot và kết quả cá nhân Đỏ. Đích: ô/khung tạo lại có identity mới, cùng kỳ/môn Toán/mục Toán/nhóm G-A theo mapping được hỗ trợ, ban đầu chưa có legacy/kết quả cá nhân; đường khôi phục cần provision. |
| Thao tác | 1. Chụp identity, rule mới, ngưỡng legacy 25 và kết quả cá nhân ô cũ; ghi ô đích chưa có các giá trị đó.<br>2. Khôi phục/thay khung theo đường được hỗ trợ; ghi mapping kỳ/môn/mục/nhóm và ô cũ → ô mới, không tự ghép theo tên giống nhau.<br>3. Đọc lại ngưỡng/báo cáo legacy nguồn và đích, rule mới và kết quả cá nhân ô mới trước/sau khi xét riêng; kiểm ba đầu ra theo identity ô. |
| Expected | Nguồn giữ ngưỡng legacy **25**; ô/khung mới có mapping hợp lệ cũng đọc **25** qua cấu hình/báo cáo legacy riêng, không thành rule/fallback mới. Ô mới **không** nhận snapshot/kết quả cá nhân của ô cũ trước lần xét riêng; sau đó kết quả phải mang identity ô mới. Nếu chưa xác minh đường khôi phục/mapping hoặc reader legacy ở đích thì BLOCKED, không bỏ nhánh. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Nguồn giữ ngưỡng legacy **25**; ô/khung mới có mapping hợp lệ cũng đọc **25** qua cấu hình/báo cáo legacy riêng, không thành rule/fallback mới. Ô mới **không** nhận snapshot/kết quả cá nhân của ô cũ trước lần xét riêng; sau đó kết quả phải mang identity ô mới. Nếu chưa xác minh đường khôi phục/mapping hoặc reader legacy ở đích thì BLOCKED, không bỏ nhánh. |

#### TC-RS-DATA-019 — Đồng bộ cấu hình không đồng nghĩa đã xét

| Field | Value |
| --- | --- |
| Chức năng | Bảo toàn dữ liệu và cấu hình |
| screen_relative_path | unknown |
| Căn cứ | AC-G38 «Bảo toàn điểm đỏ cũ»; AC-G39 «Không dùng lại kết quả cho đối tượng mới»; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Blocked |
| Gap | G-PREP-TC-RS-DATA-019 |
| Cấu hình | - Nguồn: TD-LEGACY-01 trường A/năm 2025/kỳ Cuối kỳ học kỳ 1/mục Toán/nhóm G-A có rule mới `&lt;30`, ngưỡng legacy 25, snapshot và kết quả cá nhân Đỏ của S01. Đích: cùng trường/năm 2026/kỳ tương ứng/môn Toán/mục Toán/nhóm được ánh xạ G-A→G-A năm mới, ban đầu không có legacy, snapshot hoặc kết quả nguồn; đường sync cấu hình cần provision. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Nguồn: TD-LEGACY-01 trường A/năm 2025/kỳ Cuối kỳ học kỳ 1/mục Toán/nhóm G-A có rule mới `&lt;30`, ngưỡng legacy 25, snapshot và kết quả cá nhân Đỏ của S01. Đích: cùng trường/năm 2026/kỳ tương ứng/môn Toán/mục Toán/nhóm được ánh xạ G-A→G-A năm mới, ban đầu không có legacy, snapshot hoặc kết quả nguồn; đường sync cấu hình cần provision. |
| Thao tác | 1. Ghi mapping kỳ/môn/mục/nhóm, identity nguồn/đích, giá trị legacy nguồn 25 và snapshot/kết quả cá nhân nguồn; ghi trạng thái đích ban đầu.<br>2. Đồng bộ cấu hình; đọc lại rule mới và ngưỡng/báo cáo legacy ở cả nguồn lẫn đích.<br>3. Mở kết quả cá nhân và ba đầu ra của đích **trước** khi chạy xét, sau đó chạy xét riêng ở đích và đọc lại. |
| Expected | Đồng bộ cấu hình có mapping hợp lệ giữ ngưỡng legacy **25** ở nguồn và đưa **25** tới cấu hình/báo cáo legacy riêng của đích; không thành rule/fallback mới. Trước lần xét riêng, đích chưa được coi là đã xét và không dùng snapshot/kết quả **cá nhân** nguồn; sau đó kết quả chỉ thuộc identity đích. Nếu seam sync/mapping hoặc reader legacy ở đích chưa xác minh thì BLOCKED, không coi chỉ bảo toàn nguồn là đủ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Đồng bộ cấu hình có mapping hợp lệ giữ ngưỡng legacy **25** ở nguồn và đưa **25** tới cấu hình/báo cáo legacy riêng của đích; không thành rule/fallback mới. Trước lần xét riêng, đích chưa được coi là đã xét và không dùng snapshot/kết quả **cá nhân** nguồn; sau đó kết quả chỉ thuộc identity đích. Nếu seam sync/mapping hoặc reader legacy ở đích chưa xác minh thì BLOCKED, không coi chỉ bảo toàn nguồn là đủ. |

#### TC-RS-DATA-006 — Giá trị legacy giữ nguyên khi thay đổi rule mới

| Field | Value |
| --- | --- |
| Chức năng | Bảo toàn dữ liệu và cấu hình |
| screen_relative_path | unknown |
| Căn cứ | AC-G38 «Bảo toàn điểm đỏ cũ»; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | - Có giá trị và kết quả legacy trước khi thêm rule mới. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Có giá trị và kết quả legacy trước khi thêm rule mới. |
| Thao tác | 1. Thêm, sửa, xóa và chạy rule mới.<br>2. Đọc lại giá trị legacy và kết quả legacy. |
| Expected | Giá trị legacy không bị sửa, xóa hoặc dùng lại làm kết quả cá nhân của rule mới. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Giá trị legacy không bị sửa, xóa hoặc dùng lại làm kết quả cá nhân của rule mới. |

#### TC-RS-DATA-009 — Copy, kế thừa năm, import/export và sync không mang kết quả cũ

| Field | Value |
| --- | --- |
| Chức năng | Bảo toàn dữ liệu và cấu hình |
| screen_relative_path | unknown |
| Căn cứ | AC-G38 «Bảo toàn điểm đỏ cũ»; AC-G39 «Không dùng lại kết quả cho đối tượng mới»; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | - Nguồn có cấu hình, bản chốt và kết quả cá nhân legacy; đích là năm mới/đối tượng mới. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Nguồn có cấu hình, bản chốt và kết quả cá nhân legacy; đích là năm mới/đối tượng mới. |
| Thao tác | 1. Xác minh nguồn/đích, dữ liệu legacy/bản chốt/kết quả cá nhân và mapping fixture của trường hợp.<br>2. Chuyển cấu hình qua đường được hỗ trợ của trường hợp.<br>3. Đọc phần chuyển, mapping, bản chốt và kết quả cá nhân trước khi xét ở đích. |
| Expected | Chỉ phần được phép copy/sync được chuyển; không chuyển kết quả cá nhân hoặc bản chốt legacy sang identity đích. Mapping đúng; đích chỉ có kết quả sau lượt xét riêng. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| copy | Sao chép cấu hình: Dùng fixture/đường **DATA-015** đã nêu, có cấu hình/legacy/bản chốt/kết quả cá nhân ở nguồn; thực hiện **copy** qua chức năng được hỗ trợ, đọc nguồn/đích và mapping identity trước khi xét ở đích. Không tự dựng route/ID. | Chỉ phần được phép copy/sync được chuyển; không chuyển kết quả cá nhân hoặc bản chốt legacy sang identity đích. Mapping đúng; đích chỉ có kết quả sau lượt xét riêng. |
| year | Kế thừa năm: Dùng fixture/đường **DATA-016** đã nêu, có cấu hình/legacy/bản chốt/kết quả cá nhân ở nguồn; thực hiện **kế thừa năm** qua chức năng được hỗ trợ, đọc nguồn/đích và mapping identity trước khi xét ở đích. Không tự dựng route/ID. | Chỉ phần được phép copy/sync được chuyển; không chuyển kết quả cá nhân hoặc bản chốt legacy sang identity đích. Mapping đúng; đích chỉ có kết quả sau lượt xét riêng. |
| import-export | Xuất và nhập cấu hình: Dùng fixture/đường **DATA-017** đã nêu, có cấu hình/legacy/bản chốt/kết quả cá nhân ở nguồn; thực hiện **xuất/nhập** qua chức năng được hỗ trợ, đọc nguồn/đích và mapping identity trước khi xét ở đích. Không tự dựng route/ID. | Chỉ phần được phép copy/sync được chuyển; không chuyển kết quả cá nhân hoặc bản chốt legacy sang identity đích. Mapping đúng; đích chỉ có kết quả sau lượt xét riêng. |
| sync | Đồng bộ cấu hình: Dùng fixture/đường **DATA-019** đã nêu, có cấu hình/legacy/bản chốt/kết quả cá nhân ở nguồn; thực hiện **sync** qua chức năng được hỗ trợ, đọc nguồn/đích và mapping identity trước khi xét ở đích. Không tự dựng route/ID. | Chỉ phần được phép copy/sync được chuyển; không chuyển kết quả cá nhân hoặc bản chốt legacy sang identity đích. Mapping đúng; đích chỉ có kết quả sau lượt xét riêng. |

### Flow: Trạng thái kết quả và lỗi

#### TC-RS-UI-018 — Màn Tổng hợp thành tích（成績集計）: nút xanh/cam và lần chạy trước

| Field | Value |
| --- | --- |
| Chức năng | Lỗi và cập nhật kết quả |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 7.2 “Bảng sự kiện”; trạng thái nguồn IMPLEMENTED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | tài khoản có quyền chạy hàng loạt; trường có tính tự động. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: tài khoản có quyền chạy hàng loạt |
| Thao tác | Mở Tổng hợp thành tích（成績集計）. |
| Expected | Mỗi khối có Thực hiện tổng hợp（集計実行） và Thực hiện tính toán tự động（自動算出実行） kèm thời điểm chạy trước, như màn hiện có. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Mỗi khối có Thực hiện tổng hợp（集計実行） và Thực hiện tính toán tự động（自動算出実行） kèm thời điểm chạy trước, như màn hiện có. |

#### TC-RS-UI-019 — Thông báo kết quả sau khi chạy: hoàn tất, chưa xét được, thất bại một phần

| Field | Value |
| --- | --- |
| Chức năng | Lỗi và cập nhật kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn” (AC-G26 «Lưu thành công và thông báo an toàn»); trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Như case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác” (thiếu nguồn) và case “Batch hoàn tất một phần: báo đúng phạm vi đã/không cập nhật” (lỗi một phần). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: nguồn chưa có kết quả tổng hợp |
| Thao tác | 1. Chạy nút cam khi thiếu nguồn.<br>2. Chạy khi có lỗi một phần (theo cách giả lập được team dev cho phép). |
| Expected | 1. Thông báo hoàn tất nêu có mục chưa xét được, phạm vi và lý do, và kết quả trước không còn dùng.<br>2. Thông báo nêu phạm vi đã cập nhật / chưa cập nhật và hướng dẫn chạy lại; không báo hoàn tất toàn bộ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| missing | Thông báo thiếu nguồn: Dùng fixture của BR-010: nguồn chưa có kết quả tổng hợp; chạy nút cam, ghi thông báo/phạm vi/trạng thái. | Thông báo hoàn tất nêu có mục **Chưa xét được**, phạm vi và lý do; kết quả trước không còn dùng. |
| partial | Thông báo lỗi một phần: Dùng fixture ERR-003 và seam lỗi được team cho phép; chạy batch với lỗi một phần, ghi thông báo/phạm vi/hướng dẫn chạy lại. | Thông báo nêu phạm vi **đã cập nhật/chưa cập nhật** và hướng dẫn chạy lại; không báo hoàn tất toàn bộ. |

#### TC-RS-ERR-001 — Hiển thị theo từng trạng thái kết quả ở ba đầu ra

| Field | Value |
| --- | --- |
| Chức năng | Lỗi và cập nhật kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Trạng thái sau lần chạy” (AC-G20 «Trạng thái sau lần chạy»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Chuẩn bị bảy ô cùng mục mục số nguyên (M=100): (1) Đỏ; (2) Không đỏ; (3) Chưa từng xét (ô mới, chưa có lượt xét); (4) Chưa xét được (như case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”); (5) Không áp dụng (như case “Không quy tắc nào khớp khi đủ dữ liệu → Không áp dụng”); (6) Không có điểm (S05); (7) Đang chờ chạy lại: Đỏ trước đó, sau đó đổi ngưỡng và chưa chạy lại. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước |
| Thao tác | 1. Xác minh đủ bảy trạng thái cùng mục/kỳ và đúng cấu hình đầu ra, quyền xem.<br>2. Xem/xuất kênh của trường hợp, giữ cả các ô đối chứng trong lượt không lọc; kiểm membership thêm ở lượt có lọc theo nguồn.<br>3. Đối chiếu trạng thái/dấu của từng ô với kết quả đã lưu và các đầu ra khác. |
| Expected | Chỉ ô (1) và (7) có dấu đỏ và làm học sinh thỏa lọc đỏ. Ô (2)–(6) không có dấu đỏ, không thỏa lọc; (3), (4), (5) không được hiển thị như "đạt". Ba đầu ra cho cùng kết luận. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| extract | Trích xuất: Chuẩn bị đủ bảy trạng thái đã nêu; trích xuất **không lọc** để thấy cả đối chứng, rồi lượt có lọc và Excel theo thao tác nguồn; đối chiếu membership/dấu với đúng identity từng ô. | Chỉ ô (1) và (7) có dấu đỏ và làm học sinh thỏa lọc đỏ. Ô (2)–(6) không có dấu đỏ, không thỏa lọc; (3), (4), (5) không được hiển thị như "đạt". Ba đầu ra cho cùng kết luận. |
| publish | Công khai: Cùng fixture đủ bảy trạng thái đã nêu; xem/xuất màn **Công khai thành tích（成績公開）** của đúng học sinh/kỳ, đối chiếu từng ô với kết quả đã lưu và đầu ra khác. | Chỉ ô (1) và (7) có dấu đỏ và làm học sinh thỏa lọc đỏ. Ô (2)–(6) không có dấu đỏ, không thỏa lọc; (3), (4), (5) không được hiển thị như "đạt". Ba đầu ra cho cùng kết luận. |
| report | Phiếu điểm: Cùng fixture đủ bảy trạng thái đã nêu; xem/xuất PDF **Công cụ phiếu điểm（通知表ツール）** của đúng học sinh/kỳ, đối chiếu từng ô với kết quả đã lưu và đầu ra khác. | Chỉ ô (1) và (7) có dấu đỏ và làm học sinh thỏa lọc đỏ. Ô (2)–(6) không có dấu đỏ, không thỏa lọc; (3), (4), (5) không được hiển thị như "đạt". Ba đầu ra cho cùng kết luận. |

#### TC-RS-ERR-002 — Lỗi kỹ thuật khi lưu kết quả khác với Chưa xét được; không báo thành công giả

| Field | Value |
| --- | --- |
| Chức năng | Lỗi và cập nhật kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn” (AC-G26 «Lưu thành công và thông báo an toàn»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Blocked |
| Gap | G-PREP-TC-RS-ERR-002 |
| Cấu hình | chuẩn bị bản reset **độc lập cho từng biến thể và từng đường** nhập trực tiếp, Đăng ký thành tích bằng CSV（成績CSV登録） và liên kết điểm thi. Mỗi bản có điểm Toán 24 đang Đỏ, Ngữ văn 20 đang Đỏ và bằng chứng điểm/kết quả trước thao tác; file CSV và bài thi đã chấm phải ánh xạ tới đúng ô Toán của S01 (M=100). Chuẩn bị hai seam lỗi riêng trên từng đường, cho cả xóa và sửa nếu build hỗ trợ: lỗi lưu điểm và lỗi ghi kết quả đỏ; ghi thời điểm lỗi và ranh giới giao dịch thực tế. Chưa có seam/đường đọc đáng tin thì giữ biến thể tương ứng BLOCKED. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: S01, Toán 24 → sửa thành 35 (không đỏ nếu xét thành công), Ngữ văn 20 giữ nguyên; rule “Cố định 30” với dấu `&lt;`. Biến thể xóa dùng cùng điểm ban đầu nhưng bản reset khác biến thể sửa. |
| Thao tác | 1. Với `*-success-delete`, dùng ba bản reset riêng và xóa ô Toán lần lượt bằng nhập trực tiếp, Đăng ký thành tích bằng CSV（成績CSV登録） và liên kết điểm thi; không giả lập lỗi.<br>2. Với `*-delete-save-failure`, reset trước từng lượt, xóa ô Toán qua đúng đường tương ứng và gây lỗi **lưu điểm**. Với `*-delete-result-write-failure`, dùng ba bản reset khác, xóa ô Toán nhưng gây lỗi **ghi kết quả đỏ** sau đường xử lý điểm. Mỗi biến thể có Run ID, baseline, response và đọc lại riêng; không dùng kết quả của lỗi lưu điểm làm baseline cho lỗi ghi kết quả.<br>3. Với `*-edit-save-failure`, reset trước từng lượt, sửa Toán 24→35 qua từng đường và gây lỗi **lưu điểm**. Với `*-edit-result-write-failure`, dùng các bản reset khác, sửa cùng giá trị nhưng gây lỗi **ghi kết quả đỏ** sau đường xử lý điểm. Không dùng trạng thái từ biến thể xóa làm baseline sửa.<br>4. Sau mỗi biến thể, đọc lại điểm và kết quả đỏ của đúng ô Toán, ô Ngữ văn không đích và ba đầu ra; lưu thông báo, trạng thái giao dịch/response và identity để đối chiếu. Không dùng thông báo thành công hay một dấu UI làm bằng chứng duy nhất cho ghi điểm/kết quả. |
| Expected | 1. Mỗi đường xóa thành công chỉ xóa điểm/kết quả Toán của identity đích; Ngữ văn vẫn Đỏ và S01 vẫn qua bộ lọc nhờ Ngữ văn. CSV phải ánh xạ đúng ô.<br>2. Với `*-delete-save-failure`, không báo đã xóa/xét thành công; đối chiếu điểm và kết quả Toán với baseline 24/Đỏ. Với `*-delete-result-write-failure`, cũng không báo thành công giả và phải phân biệt điểm đã bị xóa hay chưa theo ranh giới giao dịch thực tế; không tự coi ô là trống/Chưa xét được hoặc mặc định rollback. Đọc lại điểm, kết quả và trạng thái giao dịch của **từng** biến thể; nếu ranh giới commit hoặc trạng thái nhất quán chưa quan sát được thì giữ đúng biến thể BLOCKED, ghi giá trị thực tế của hai ô và không sửa oracle theo kết quả chạy.<br>3. Với lỗi **sửa điểm 24→35**, không báo đã sửa và xét thành công giả. Lỗi lưu điểm phải được đối chiếu với điểm/kết quả trước đó; lỗi ghi kết quả phải phân biệt điểm đã lưu hay chưa theo ranh giới giao dịch hiện có. Không trình bày kết quả cũ Đỏ như kết luận mới đã hoàn tất cho điểm 35, cũng không tự đánh dấu Chưa xét được do lỗi kỹ thuật. Nếu ranh giới ghi/đọc hoặc trạng thái nhất quán chưa quan sát được, giữ đúng biến thể BLOCKED và ghi giá trị thực tế của cả hai ô thay vì tự đổi oracle thành PASS.<br>4. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên ở mọi lượt. Thông báo thất bại không chứa lỗi SQL, stack trace hay dữ liệu ngoài quyền. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| direct-success-delete | Xóa thành công qua nhập trực tiếp: Reset độc lập S01/Toán **24 Đỏ**, Ngữ văn **20 Đỏ**, rule **T=30**, dấu **&lt;**. Qua nhập trực tiếp, xóa điểm Toán 24, không giả lập lỗi; xác minh mapping đúng ô Toán, không dùng kết quả của lượt trước. | Chỉ điểm/kết quả Toán của identity đích được xóa; S01 vẫn qua bộ lọc nhờ Ngữ văn Đỏ. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên. Thông báo thất bại không chứa lỗi SQL, stack trace hoặc dữ liệu ngoài quyền. Đọc lại điểm/kết quả, response và ranh giới giao dịch riêng của lượt này; thiếu seam hoặc phép đọc đáng tin thì ghi BLOCKED, không đổi oracle theo kết quả chạy. |
| csv-success-delete | Xóa thành công qua Đăng ký thành tích bằng CSV（成績CSV登録）: Reset độc lập S01/Toán **24 Đỏ**, Ngữ văn **20 Đỏ**, rule **T=30**, dấu **&lt;**. Qua Đăng ký thành tích bằng CSV（成績CSV登録）, xóa điểm Toán 24, không giả lập lỗi; xác minh mapping đúng ô Toán, không dùng kết quả của lượt trước. | Chỉ điểm/kết quả Toán của identity đích được xóa; S01 vẫn qua bộ lọc nhờ Ngữ văn Đỏ. CSV ánh xạ đúng ô. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên. Thông báo thất bại không chứa lỗi SQL, stack trace hoặc dữ liệu ngoài quyền. Đọc lại điểm/kết quả, response và ranh giới giao dịch riêng của lượt này; thiếu seam hoặc phép đọc đáng tin thì ghi BLOCKED, không đổi oracle theo kết quả chạy. |
| linked-success-delete | Xóa thành công qua liên kết điểm thi: Reset độc lập S01/Toán **24 Đỏ**, Ngữ văn **20 Đỏ**, rule **T=30**, dấu **&lt;**. Qua liên kết điểm thi, xóa điểm Toán 24, không giả lập lỗi; xác minh mapping đúng ô Toán, không dùng kết quả của lượt trước. | Chỉ điểm/kết quả Toán của identity đích được xóa; S01 vẫn qua bộ lọc nhờ Ngữ văn Đỏ. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên. Thông báo thất bại không chứa lỗi SQL, stack trace hoặc dữ liệu ngoài quyền. Đọc lại điểm/kết quả, response và ranh giới giao dịch riêng của lượt này; thiếu seam hoặc phép đọc đáng tin thì ghi BLOCKED, không đổi oracle theo kết quả chạy. |
| direct-delete-save-failure | Xóa bị lỗi lưu điểm qua nhập trực tiếp: Reset độc lập S01/Toán **24 Đỏ**, Ngữ văn **20 Đỏ**, rule **T=30**, dấu **&lt;**. Qua nhập trực tiếp, xóa điểm Toán 24, gây lỗi lưu điểm; xác minh mapping đúng ô Toán, không dùng kết quả của lượt trước. | Không báo đã xóa/xét thành công. Đối chiếu điểm và kết quả Toán với baseline **24/Đỏ**; không tự coi ô trống/Chưa xét được hoặc mặc định rollback. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên. Thông báo thất bại không chứa lỗi SQL, stack trace hoặc dữ liệu ngoài quyền. Đọc lại điểm/kết quả, response và ranh giới giao dịch riêng của lượt này; thiếu seam hoặc phép đọc đáng tin thì ghi BLOCKED, không đổi oracle theo kết quả chạy. |
| csv-delete-save-failure | Xóa bị lỗi lưu điểm qua Đăng ký thành tích bằng CSV（成績CSV登録）: Reset độc lập S01/Toán **24 Đỏ**, Ngữ văn **20 Đỏ**, rule **T=30**, dấu **&lt;**. Qua Đăng ký thành tích bằng CSV（成績CSV登録）, xóa điểm Toán 24, gây lỗi lưu điểm; xác minh mapping đúng ô Toán, không dùng kết quả của lượt trước. | Không báo đã xóa/xét thành công. Đối chiếu điểm và kết quả Toán với baseline **24/Đỏ**; không tự coi ô trống/Chưa xét được hoặc mặc định rollback. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên. Thông báo thất bại không chứa lỗi SQL, stack trace hoặc dữ liệu ngoài quyền. Đọc lại điểm/kết quả, response và ranh giới giao dịch riêng của lượt này; thiếu seam hoặc phép đọc đáng tin thì ghi BLOCKED, không đổi oracle theo kết quả chạy. |
| linked-delete-save-failure | Xóa bị lỗi lưu điểm qua liên kết điểm thi: Reset độc lập S01/Toán **24 Đỏ**, Ngữ văn **20 Đỏ**, rule **T=30**, dấu **&lt;**. Qua liên kết điểm thi, xóa điểm Toán 24, gây lỗi lưu điểm; xác minh mapping đúng ô Toán, không dùng kết quả của lượt trước. | Không báo đã xóa/xét thành công. Đối chiếu điểm và kết quả Toán với baseline **24/Đỏ**; không tự coi ô trống/Chưa xét được hoặc mặc định rollback. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên. Thông báo thất bại không chứa lỗi SQL, stack trace hoặc dữ liệu ngoài quyền. Đọc lại điểm/kết quả, response và ranh giới giao dịch riêng của lượt này; thiếu seam hoặc phép đọc đáng tin thì ghi BLOCKED, không đổi oracle theo kết quả chạy. |
| direct-delete-result-write-failure | Xóa bị lỗi ghi kết quả qua nhập trực tiếp: Reset độc lập S01/Toán **24 Đỏ**, Ngữ văn **20 Đỏ**, rule **T=30**, dấu **&lt;**. Qua nhập trực tiếp, xóa điểm Toán 24, gây lỗi ghi kết quả đỏ; xác minh mapping đúng ô Toán, không dùng kết quả của lượt trước. | Không báo xóa/xét thành công giả. Phân biệt điểm Toán đã bị xóa hay chưa theo ranh giới giao dịch thực tế; không tự coi ô trống/Chưa xét được hoặc mặc định rollback. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên. Thông báo thất bại không chứa lỗi SQL, stack trace hoặc dữ liệu ngoài quyền. Đọc lại điểm/kết quả, response và ranh giới giao dịch riêng của lượt này; thiếu seam hoặc phép đọc đáng tin thì ghi BLOCKED, không đổi oracle theo kết quả chạy. |
| csv-delete-result-write-failure | Xóa bị lỗi ghi kết quả qua Đăng ký thành tích bằng CSV（成績CSV登録）: Reset độc lập S01/Toán **24 Đỏ**, Ngữ văn **20 Đỏ**, rule **T=30**, dấu **&lt;**. Qua Đăng ký thành tích bằng CSV（成績CSV登録）, xóa điểm Toán 24, gây lỗi ghi kết quả đỏ; xác minh mapping đúng ô Toán, không dùng kết quả của lượt trước. | Không báo xóa/xét thành công giả. Phân biệt điểm Toán đã bị xóa hay chưa theo ranh giới giao dịch thực tế; không tự coi ô trống/Chưa xét được hoặc mặc định rollback. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên. Thông báo thất bại không chứa lỗi SQL, stack trace hoặc dữ liệu ngoài quyền. Đọc lại điểm/kết quả, response và ranh giới giao dịch riêng của lượt này; thiếu seam hoặc phép đọc đáng tin thì ghi BLOCKED, không đổi oracle theo kết quả chạy. |
| linked-delete-result-write-failure | Xóa bị lỗi ghi kết quả qua liên kết điểm thi: Reset độc lập S01/Toán **24 Đỏ**, Ngữ văn **20 Đỏ**, rule **T=30**, dấu **&lt;**. Qua liên kết điểm thi, xóa điểm Toán 24, gây lỗi ghi kết quả đỏ; xác minh mapping đúng ô Toán, không dùng kết quả của lượt trước. | Không báo xóa/xét thành công giả. Phân biệt điểm Toán đã bị xóa hay chưa theo ranh giới giao dịch thực tế; không tự coi ô trống/Chưa xét được hoặc mặc định rollback. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên. Thông báo thất bại không chứa lỗi SQL, stack trace hoặc dữ liệu ngoài quyền. Đọc lại điểm/kết quả, response và ranh giới giao dịch riêng của lượt này; thiếu seam hoặc phép đọc đáng tin thì ghi BLOCKED, không đổi oracle theo kết quả chạy. |
| direct-edit-save-failure | Sửa bị lỗi lưu điểm qua nhập trực tiếp: Reset độc lập S01/Toán **24 Đỏ**, Ngữ văn **20 Đỏ**, rule **T=30**, dấu **&lt;**. Qua nhập trực tiếp, sửa điểm Toán 24→35, gây lỗi lưu điểm; xác minh mapping đúng ô Toán, không dùng kết quả của lượt trước. | Không báo sửa/xét thành công giả. Đối chiếu lỗi lưu điểm với baseline **24/Đỏ**; không trình bày Đỏ cũ như kết luận mới cho **35**, không tự đổi thành Chưa xét được vì lỗi kỹ thuật. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên. Thông báo thất bại không chứa lỗi SQL, stack trace hoặc dữ liệu ngoài quyền. Đọc lại điểm/kết quả, response và ranh giới giao dịch riêng của lượt này; thiếu seam hoặc phép đọc đáng tin thì ghi BLOCKED, không đổi oracle theo kết quả chạy. |
| csv-edit-save-failure | Sửa bị lỗi lưu điểm qua Đăng ký thành tích bằng CSV（成績CSV登録）: Reset độc lập S01/Toán **24 Đỏ**, Ngữ văn **20 Đỏ**, rule **T=30**, dấu **&lt;**. Qua Đăng ký thành tích bằng CSV（成績CSV登録）, sửa điểm Toán 24→35, gây lỗi lưu điểm; xác minh mapping đúng ô Toán, không dùng kết quả của lượt trước. | Không báo sửa/xét thành công giả. Đối chiếu lỗi lưu điểm với baseline **24/Đỏ**; không trình bày Đỏ cũ như kết luận mới cho **35**, không tự đổi thành Chưa xét được vì lỗi kỹ thuật. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên. Thông báo thất bại không chứa lỗi SQL, stack trace hoặc dữ liệu ngoài quyền. Đọc lại điểm/kết quả, response và ranh giới giao dịch riêng của lượt này; thiếu seam hoặc phép đọc đáng tin thì ghi BLOCKED, không đổi oracle theo kết quả chạy. |
| linked-edit-save-failure | Sửa bị lỗi lưu điểm qua liên kết điểm thi: Reset độc lập S01/Toán **24 Đỏ**, Ngữ văn **20 Đỏ**, rule **T=30**, dấu **&lt;**. Qua liên kết điểm thi, sửa điểm Toán 24→35, gây lỗi lưu điểm; xác minh mapping đúng ô Toán, không dùng kết quả của lượt trước. | Không báo sửa/xét thành công giả. Đối chiếu lỗi lưu điểm với baseline **24/Đỏ**; không trình bày Đỏ cũ như kết luận mới cho **35**, không tự đổi thành Chưa xét được vì lỗi kỹ thuật. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên. Thông báo thất bại không chứa lỗi SQL, stack trace hoặc dữ liệu ngoài quyền. Đọc lại điểm/kết quả, response và ranh giới giao dịch riêng của lượt này; thiếu seam hoặc phép đọc đáng tin thì ghi BLOCKED, không đổi oracle theo kết quả chạy. |
| direct-edit-result-write-failure | Sửa bị lỗi ghi kết quả qua nhập trực tiếp: Reset độc lập S01/Toán **24 Đỏ**, Ngữ văn **20 Đỏ**, rule **T=30**, dấu **&lt;**. Qua nhập trực tiếp, sửa điểm Toán 24→35, gây lỗi ghi kết quả đỏ; xác minh mapping đúng ô Toán, không dùng kết quả của lượt trước. | Không báo sửa/xét thành công giả. Phân biệt **35** đã lưu hay chưa theo ranh giới giao dịch thực tế; không trình bày Đỏ cũ như kết luận mới cho 35 và không tự đổi thành Chưa xét được vì lỗi kỹ thuật. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên. Thông báo thất bại không chứa lỗi SQL, stack trace hoặc dữ liệu ngoài quyền. Đọc lại điểm/kết quả, response và ranh giới giao dịch riêng của lượt này; thiếu seam hoặc phép đọc đáng tin thì ghi BLOCKED, không đổi oracle theo kết quả chạy. |
| csv-edit-result-write-failure | Sửa bị lỗi ghi kết quả qua Đăng ký thành tích bằng CSV（成績CSV登録）: Reset độc lập S01/Toán **24 Đỏ**, Ngữ văn **20 Đỏ**, rule **T=30**, dấu **&lt;**. Qua Đăng ký thành tích bằng CSV（成績CSV登録）, sửa điểm Toán 24→35, gây lỗi ghi kết quả đỏ; xác minh mapping đúng ô Toán, không dùng kết quả của lượt trước. | Không báo sửa/xét thành công giả. Phân biệt **35** đã lưu hay chưa theo ranh giới giao dịch thực tế; không trình bày Đỏ cũ như kết luận mới cho 35 và không tự đổi thành Chưa xét được vì lỗi kỹ thuật. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên. Thông báo thất bại không chứa lỗi SQL, stack trace hoặc dữ liệu ngoài quyền. Đọc lại điểm/kết quả, response và ranh giới giao dịch riêng của lượt này; thiếu seam hoặc phép đọc đáng tin thì ghi BLOCKED, không đổi oracle theo kết quả chạy. |
| linked-edit-result-write-failure | Sửa bị lỗi ghi kết quả qua liên kết điểm thi: Reset độc lập S01/Toán **24 Đỏ**, Ngữ văn **20 Đỏ**, rule **T=30**, dấu **&lt;**. Qua liên kết điểm thi, sửa điểm Toán 24→35, gây lỗi ghi kết quả đỏ; xác minh mapping đúng ô Toán, không dùng kết quả của lượt trước. | Không báo sửa/xét thành công giả. Phân biệt **35** đã lưu hay chưa theo ranh giới giao dịch thực tế; không trình bày Đỏ cũ như kết luận mới cho 35 và không tự đổi thành Chưa xét được vì lỗi kỹ thuật. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên. Thông báo thất bại không chứa lỗi SQL, stack trace hoặc dữ liệu ngoài quyền. Đọc lại điểm/kết quả, response và ranh giới giao dịch riêng của lượt này; thiếu seam hoặc phép đọc đáng tin thì ghi BLOCKED, không đổi oracle theo kết quả chạy. |

#### TC-RS-ERR-003 — Batch hoàn tất một phần: báo đúng phạm vi đã/không cập nhật

| Field | Value |
| --- | --- |
| Chức năng | Lỗi và cập nhật kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Batch hoàn tất một phần” (AC-G27 «Batch hoàn tất một phần»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Blocked |
| Gap | G-PREP-TC-RS-ERR-003 |
| Cấu hình | Batch dùng `TD-GRP-03`: BATCH-GA1 và BATCH-GA2 cùng khối 1; giả lập lỗi riêng ở BATCH-GA2. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: BATCH-S01 thuộc BATCH-GA1, BATCH-S02 thuộc BATCH-GA2, BATCH-S03 thuộc BATCH-GC ngoài batch; mỗi học sinh có identity ô điểm fixture riêng. Không dùng S01/G-A hoặc lớp master làm bằng chứng nếu chưa chứng minh mapping. |
| Thao tác | 1. Chạy nút cam cho khối.<br>2. Xem thông báo và kết quả từng lớp.<br>3. Gỡ giả lập lỗi, chạy lại nút cam chỉ cho phạm vi BATCH-GA2.<br>4. Xem kết quả hai lớp.<br>5. Chạy nút cam cho BATCH-GA1; khi chưa xong, giáo viên sửa và lưu điểm BATCH-S01. Chờ batch xong, xem thông báo/tiến độ và kết quả BATCH-S01. |
| Expected | 1–2. G-A1 cập nhật; G-A2 giữ trạng thái trước lượt. Thông báo cho biết phạm vi đã cập nhật, chưa cập nhật và cần chạy lại; không báo hoàn tất toàn bộ; không suy số lớp đã xử lý thành số ô đã xét. Không hứa rollback toàn lượt. Không tự retry vô hạn. G-C ngoài batch không bị tính vào kết quả.<br><br>3–4. BATCH-GA2 được cập nhật; BATCH-GA1 giữ kết quả của bước 1, mỗi ô chỉ có một kết quả hiệu lực, không trùng.<br><br>5. Phần của BATCH-S01 trong lượt batch (đã bị lần lưu mới thay thế) không được tính là cập nhật thành công, cũng không được tính là Chưa xét được; BATCH-S01 giữ kết quả của lần lưu mới. (PROPOSED theo thiết kế DB v2 mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi”) Tiến độ ghi phần này là `superseded`; deadlock/timeout rollback toàn transaction đó và chỉ retry hữu hạn theo job hiện có. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| partial-G-A2-failure | Batch lỗi riêng lớp thứ hai: TD-GRP-03; chạy nút cam cho BATCH-GA1 và BATCH-GA2, giả lập lỗi riêng BATCH-GA2; đọc từng lớp và thông báo, BATCH-GC ngoài batch. | 1–2. G-A1 cập nhật; G-A2 giữ trạng thái trước lượt. Thông báo cho biết phạm vi đã cập nhật, chưa cập nhật và cần chạy lại; không báo hoàn tất toàn bộ; không suy số lớp đã xử lý thành số ô đã xét. Không hứa rollback toàn lượt. Không tự retry vô hạn. G-C ngoài batch không bị tính vào kết quả. |
| retry-G-A2-only | Chạy lại riêng lớp lỗi: Dựng trạng thái sau lượt lỗi BATCH-GA2, gỡ giả lập lỗi rồi chạy nút cam chỉ BATCH-GA2; đối chiếu BATCH-GA1 trước/sau. | 3–4. BATCH-GA2 được cập nhật; BATCH-GA1 giữ kết quả của bước 1, mỗi ô chỉ có một kết quả hiệu lực, không trùng. |
| concurrent-score-write | Sửa điểm khi batch đang chạy: Batch BATCH-GA1 chưa xong, giáo viên sửa/lưu BATCH-S01; chờ batch và đối chiếu thông báo, tiến độ, điểm/kết quả của lần lưu mới. | 5. Phần của BATCH-S01 trong lượt batch (đã bị lần lưu mới thay thế) không được tính là cập nhật thành công, cũng không được tính là Chưa xét được; BATCH-S01 giữ kết quả của lần lưu mới. (PROPOSED theo thiết kế DB v2 mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi”) Tiến độ ghi phần này là `superseded`; deadlock/timeout rollback toàn transaction đó và chỉ retry hữu hạn theo job hiện có. |

#### TC-RS-ERR-004 — Đã xếp hàng không phải đã hoàn tất; bấm chạy trùng

| Field | Value |
| --- | --- |
| Chức năng | Lỗi và cập nhật kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Batch hoàn tất một phần” (AC-G27 «Batch hoàn tất một phần»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | tài khoản có quyền chạy hàng loạt. Đã đổi ngưỡng, chưa chạy lại. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30) |
| Thao tác | 1. Bấm Thực hiện tính toán tự động（自動算出実行）, đọc thông báo ngay khi request trả về.<br>2. Bấm lại lần nữa khi lượt đầu chưa xong.<br>3. Sau khi xong, xem kết quả. |
| Expected | 1. Nếu xử lý chạy nền: thông báo là đã nhận/xếp hàng, không phải đã hoàn tất; kết quả chưa đổi cho tới khi xử lý xong.<br>2. Chống trùng theo cơ chế hiện có (không tạo hai lượt ghi chồng gây kết quả sai).<br>3. Một kết quả hiện hành cho mỗi ô, đúng theo ngưỡng mới. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | 1. Nếu xử lý chạy nền: thông báo là đã nhận/xếp hàng, không phải đã hoàn tất; kết quả chưa đổi cho tới khi xử lý xong.<br>2. Chống trùng theo cơ chế hiện có (không tạo hai lượt ghi chồng gây kết quả sai).<br>3. Một kết quả hiện hành cho mỗi ô, đúng theo ngưỡng mới. |

#### TC-RS-ERR-005 — Thông báo lỗi không lộ SQL, stack trace hoặc dữ liệu ngoài quyền

| Field | Value |
| --- | --- |
| Chức năng | Lỗi và cập nhật kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn” (AC-G26 «Lưu thành công và thông báo an toàn»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Các tình huống lỗi của ERR-002, ERR-003, ERR-006, ERR-009. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | Thu thập mọi thông báo lỗi hiển thị cho người dùng trong các case trên. |
| Expected | Không có câu SQL, stack trace, đường dẫn file server hoặc tên/điểm học sinh ngoài quyền người thao tác. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| save-error | Thông báo lỗi lưu: Thu thập thông báo thật của các lượt lỗi lưu/ghi kết quả thuộc ERR-002; kiểm quyền người nhận và nội dung lộ dữ liệu. | Không có câu SQL, stack trace, đường dẫn file server hoặc tên/điểm học sinh ngoài quyền người thao tác. |
| batch-error | Thông báo lỗi batch: Thu thập thông báo thật của lỗi một phần ERR-003; kiểm quyền người nhận và nội dung lộ dữ liệu. | Không có câu SQL, stack trace, đường dẫn file server hoặc tên/điểm học sinh ngoài quyền người thao tác. |
| permission-error | Thông báo lỗi quyền: Thu thập thông báo từ request thiếu quyền ERR-006; kiểm nội dung lộ dữ liệu. | Không có câu SQL, stack trace, đường dẫn file server hoặc tên/điểm học sinh ngoài quyền người thao tác. |
| input-error | Thông báo dữ liệu không hợp lệ: Thu thập thông báo từ request giá trị không hợp lệ ERR-009; kiểm nội dung lộ dữ liệu. | Không có câu SQL, stack trace, đường dẫn file server hoặc tên/điểm học sinh ngoài quyền người thao tác. |

#### TC-RS-ERR-011 — Lượt cũ hoàn tất muộn không ghi đè kết quả của điểm/cấu hình mới hơn

| Field | Value |
| --- | --- |
| Chức năng | Lỗi và cập nhật kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Nhận diện ô điểm” (AC-G03 «Nhận diện ô điểm»); tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu»); tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại” (AC-G21 «Giữ kết quả trước khi chạy lại và xóa rule cuối»); tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật” (AC-G22 «Kết quả chung và thứ tự cập nhật»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Batch lớn đang chạy cho khối 1; quy tắc “Cố định 30” (dưới 30) trên mục của S01; nguồn trung bình của cặp quy tắc phân nhánh theo trung bình 60 đã có một bản tổng hợp. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S01 (điểm 29); quy tắc “Cố định 30” (dưới 30); cặp quy tắc phân nhánh theo trung bình 60 |
| Thao tác | 1. Khi batch chưa xong, sửa S01 từ 29 thành 40 và lưu.<br>2. Chờ batch xong, xem S01.<br>3. Chạy lại batch; khi chưa xong, đổi ngưỡng quy tắc “Cố định 30” (dưới 30) thành 45, lưu, rồi đăng ký lại điểm S01 (40). Chờ batch cũ xong, xem S01.<br>4. Với mục dùng cặp quy tắc phân nhánh theo trung bình 60: bắt đầu batch; khi chưa xong, bấm Thực hiện tổng hợp（集計実行） cho cùng phạm vi, chờ cả hai xong. SELECT kết quả và bản nguồn được ghi nhận cho các ô của lượt batch.<br>5. Khôi phục ngưỡng 30, S01 = 29 (Đỏ). Bắt đầu batch; khi batch đã đọc điểm 29 nhưng chưa xong, sửa S01 thành 40 và lưu, rồi sửa lại 29 và lưu. Chờ batch cũ xong, SELECT kết quả S01.<br>6. Lặp bước 5 nhưng thay bằng: xóa trống ô S01 và lưu, rồi nhập lại 29 và lưu.<br>7. S01 = 40 (Không đỏ). Bắt đầu batch; khi chưa xong, chỉ đổi ngưỡng quy tắc “Cố định 30” (dưới 30) thành 45 và lưu, không đăng ký lại điểm. Chờ batch cũ xong, xem S01; sau đó chạy lại batch và xem S01. |
| Expected | 1–2. S01 = 40 và Không đỏ; batch cũ không ghi lại kết quả Đỏ của điểm 29.<br><br>3. S01 Đỏ theo cấu hình mới (`40&lt;45`); batch cũ không ghi đè bằng kết quả theo ngưỡng 30.<br>4. Mọi ô của một lượt batch dùng cùng một bản nguồn (hoặc toàn bản cũ, hoặc toàn bản mới); không có lượt báo thành công mà ghép điểm/kết quả của hai thời điểm.<br>5–6. Kết quả hiện hành của S01 là kết quả của lần lưu cuối (29 → Đỏ, xét bởi lần đăng ký sau cùng); lượt batch cũ không ghi đè dù giá trị điểm cuối trùng với giá trị batch đã đọc. Ô chỉ có một dòng kết quả hiện hành.<br>7. Sau khi chỉ lưu ngưỡng: kết quả trước được giữ tới lần xét lại (tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại”). Chạy lại batch → S01 Đỏ theo ngưỡng 45. (PROPOSED theo thiết kế DB v2 mục 6.2 “Đăng ký thường và batch”) Lượt batch cũ bị từ chối ghi vì phiên bản danh sách quy tắc (`red_score_revision`) đã đổi, nên không ghi kết quả theo ngưỡng 30 sau khi ngưỡng mới đã được lưu.<br>8. (PROPOSED) SELECT `write_version`, `judged_version`, `rule_revision` của S01: `judged_version` bằng phiên bản của lần ghi hoàn tất sau cùng; lượt cũ không làm giảm hay ghi đè các giá trị này. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| score-update | Sửa điểm khi batch đang chạy: S01 từ 29→40 rồi lưu; chờ batch cũ và đọc điểm/kết quả. | 1–2. S01 = 40 và Không đỏ; batch cũ không ghi lại kết quả Đỏ của điểm 29.<br>8. (PROPOSED) SELECT `write_version`, `judged_version`, `rule_revision` của S01: `judged_version` bằng phiên bản của lần ghi hoàn tất sau cùng; lượt cũ không làm giảm hay ghi đè các giá trị này. |
| rule-update | Sửa ngưỡng và ghi lại điểm: Khi batch chưa xong, đổi T=30→45 rồi đăng ký lại S01=40; chờ batch cũ và đọc kết quả. | 3. S01 Đỏ theo cấu hình mới (`40&lt;45`); batch cũ không ghi đè bằng kết quả theo ngưỡng 30.<br>8. (PROPOSED) SELECT `write_version`, `judged_version`, `rule_revision` của S01: `judged_version` bằng phiên bản của lần ghi hoàn tất sau cùng; lượt cũ không làm giảm hay ghi đè các giá trị này. |
| aggregation-snapshot-update | Tổng hợp nguồn đồng thời: Mục dùng cặp rule phân nhánh trung bình 60; khi batch chưa xong, bấm Thực hiện tổng hợp（集計実行） cùng scope; chờ cả hai và đối chiếu nguồn từng ô. | 4. Mọi ô của một lượt batch dùng cùng một bản nguồn (hoặc toàn bản cũ, hoặc toàn bản mới); không có lượt báo thành công mà ghép điểm/kết quả của hai thời điểm.<br>8. (PROPOSED) SELECT `write_version`, `judged_version`, `rule_revision` của S01: `judged_version` bằng phiên bản của lần ghi hoàn tất sau cùng; lượt cũ không làm giảm hay ghi đè các giá trị này. |
| edit-away-and-back | Đổi điểm rồi trả về cùng giá trị: Reset T=30/S01=29 Đỏ; khi batch đã đọc 29 nhưng chưa xong, lưu 40 rồi lưu lại 29; đọc kết quả sau batch. | 5–6. Kết quả hiện hành của S01 là kết quả của lần lưu cuối (29 → Đỏ, xét bởi lần đăng ký sau cùng); lượt batch cũ không ghi đè dù giá trị điểm cuối trùng với giá trị batch đã đọc. Ô chỉ có một dòng kết quả hiện hành.<br>8. (PROPOSED) SELECT `write_version`, `judged_version`, `rule_revision` của S01: `judged_version` bằng phiên bản của lần ghi hoàn tất sau cùng; lượt cũ không làm giảm hay ghi đè các giá trị này. |
| delete-and-recreate | Xóa ô rồi nhập lại cùng giá trị: Reset T=30/S01=29 Đỏ; khi batch đã đọc 29 nhưng chưa xong, xóa trống/lưu rồi nhập lại 29/lưu; đọc kết quả sau batch. | 5–6. Kết quả hiện hành của S01 là kết quả của lần lưu cuối (29 → Đỏ, xét bởi lần đăng ký sau cùng); lượt batch cũ không ghi đè dù giá trị điểm cuối trùng với giá trị batch đã đọc. Ô chỉ có một dòng kết quả hiện hành.<br>8. (PROPOSED) SELECT `write_version`, `judged_version`, `rule_revision` của S01: `judged_version` bằng phiên bản của lần ghi hoàn tất sau cùng; lượt cũ không làm giảm hay ghi đè các giá trị này. |
| rule-update-without-score-write | Chỉ sửa ngưỡng khi batch đang chạy: Reset S01=40 Không đỏ/T=30; khi batch chưa xong, chỉ lưu T=45, không đăng ký lại điểm; đọc sau batch cũ rồi chạy batch mới và đối chiếu. | 7. Sau khi chỉ lưu ngưỡng: kết quả trước được giữ tới lần xét lại (tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại”). Chạy lại batch → S01 Đỏ theo ngưỡng 45. (PROPOSED theo thiết kế DB v2 mục 6.2 “Đăng ký thường và batch”) Lượt batch cũ bị từ chối ghi vì phiên bản danh sách quy tắc (`red_score_revision`) đã đổi, nên không ghi kết quả theo ngưỡng 30 sau khi ngưỡng mới đã được lưu.<br>8. (PROPOSED) SELECT `write_version`, `judged_version`, `rule_revision` của S01: `judged_version` bằng phiên bản của lần ghi hoàn tất sau cùng; lượt cũ không làm giảm hay ghi đè các giá trị này. |

#### TC-RS-ERR-018 — Hai lượt xét lần đầu đồng thời hoặc gửi lại thao tác hoàn tất chỉ tạo một kết quả

| Field | Value |
| --- | --- |
| Chức năng | Lỗi và cập nhật kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật” (AC-G22 «Kết quả chung và thứ tự cập nhật»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Ô S01 của mục số nguyên (M=100) chưa từng được xét (chưa có dòng kết quả); quy tắc “Cố định 30” (dưới 30) là quy tắc duy nhất; có cách cho hai lượt chạy gần như cùng lúc. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29) (29); tài khoản có quyền chạy hàng loạt, tài khoản giáo viên nhập điểm lớp G-A, G-B, G-C |
| Thao tác | 1. Xác minh baseline trước hoặc sau lần xét đầu đúng theo trường hợp, rule cố định30 và quyền actor.<br>2. Thực hiện lượt đồng thời/gửi lại riêng theo bảng trường hợp; seam không có thì ghi Bị chặn.<br>3. Đọc ba đầu ra và SELECT dòng kết quả đúng ô để kiểm số dòng/ký hiệu và tính idempotent. |
| Expected | 1–2. S01 Đỏ; ô có đúng một kết quả hiện hành; ký hiệu đỏ không bị nhân đôi ở đầu ra (không có `**29`, `((29))`).<br>3. Không phát sinh dòng hoặc thao tác ghi thứ hai; kết quả không đổi. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| concurrent | Hai lượt xét lần đầu: Ô S01 chưa có kết quả: cùng lúc giáo viên lưu **29** ở Đăng ký thành tích（成績登録） và tài khoản được batch chạy nút cam G-A; đọc ba đầu ra/SELECT. | **S01 Đỏ**; ô chỉ có **một kết quả hiện hành**, không nhân đôi ký hiệu ở đầu ra (không `**29`, `((29))`). |
| replay-form | Gửi lại form hoàn tất: Dựng baseline sau hai lượt lần đầu của concurrent; gửi lại form đăng ký cùng dữ liệu29; xem/SELECT, không dùng ô chưa xét làm baseline. | Gửi lại form sau baseline bước 1–2 không phát sinh dòng hoặc thao tác ghi thứ hai; kết quả **S01 Đỏ** không đổi, không nhân đôi ký hiệu. |
| replay-job | Gửi lại job hoàn tất: Dựng baseline sau concurrent; chạy lại job **cùng lượt** nếu môi trường cho seam, xem/SELECT. Không có seam thì BLOCKED. | Chạy lại job cùng lượt sau baseline bước 1–2 không phát sinh dòng/thao tác ghi thứ hai; kết quả **S01 Đỏ** không đổi, không nhân đôi ký hiệu. Không có seam thì **BLOCKED**. |

#### TC-RS-ERR-019 — Đăng ký lần đầu đồng thời hai mục khác nhau của cùng học sinh giữ đủ cả hai

| Field | Value |
| --- | --- |
| Chức năng | Lỗi và cập nhật kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật” (AC-G22 «Kết quả chung và thứ tự cập nhật»); trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Cùng học sinh S01, lớp G-A, cùng kỳ Cuối kỳ học kỳ 1（1学期期末）, điểm thường; hai mục số khác nhau (mục số nguyên (M=100) và một mục số thứ hai của cùng khung) đều có quy tắc cố định 30 `&lt;`; chưa có dòng điểm vật lý nào của S01 cho kỳ này. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29); tài khoản giáo viên nhập điểm lớp G-A, G-B, G-C (hai phiên đăng nhập) |
| Thao tác | 1. Hai phiên cùng lúc: phiên 1 lưu S01 = 29 cho mục số nguyên (M=100); phiên 2 lưu S01 = 45 cho mục thứ hai.<br>2. Mở lại Đăng ký thành tích（成績登録）; xem trích xuất; SELECT dòng điểm của S01 (trường/năm/học sinh/lớp/kỳ/đơn vị) và dòng kết quả của hai ô. |
| Expected | - Cả hai điểm được giữ: mục số nguyên (M=100) = 29 (Đỏ), mục thứ hai = 45 (Không đỏ).<br>- Chỉ một dòng điểm vật lý cho S01/G-A/kỳ/điểm thường; không có dòng trùng; không mất điểm hoặc kết quả của mục nào. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | - Cả hai điểm được giữ: mục số nguyên (M=100) = 29 (Đỏ), mục thứ hai = 45 (Không đỏ).<br>- Chỉ một dòng điểm vật lý cho S01/G-A/kỳ/điểm thường; không có dòng trùng; không mất điểm hoặc kết quả của mục nào. |

### Flow: Phạm vi phát hành

#### TC-RS-UI-025 — Loại ngưỡng/điều kiện chưa thuộc phạm vi phát hành không hiện như đang hoạt động

| Field | Value |
| --- | --- |
| Chức năng | Phạm vi triển khai |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Phạm vi từng đợt” (AC-G40 «Phạm vi từng đợt»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Có danh sách phạm vi phát hành (đặc tả v2 mục 1.4, mục 13.1). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | 1. Mở màn Điều kiện áp dụng（適用条件設定）, xem các loại điều kiện.<br>2. Mở màn Ngưỡng đỏ（赤点の基準）, xem các loại ngưỡng.<br>3. Với loại không có trong danh sách phát hành (ví dụ Công thức（計算式）, điều kiện Trung bình（平均点））: nếu chọn được thì thử Lưu. |
| Expected | Loại ngoài phạm vi không hiện như lựa chọn dùng được; không lưu được cấu hình dùng loại đó. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Loại ngoài phạm vi không hiện như lựa chọn dùng được; không lưu được cấu hình dùng loại đó. |

### Flow: Hồi quy AutoRating và các luồng hiện có

#### TC-RS-REG-001 — Điểm do tính tự động（自動計算） tạo ra không đổi khi có quy tắc đỏ

| Field | Value |
| --- | --- |
| Chức năng | Hồi quy luồng hiện có |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 7.1 “Trình tự cho một ô”, mục 12.2 “Điểm tích hợp chính”; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên có thêm tính tự động có quy tắc tính tự động; baseline điểm tự động của khối 1. Thêm quy tắc “Cố định 30” (dưới 30). |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên có thêm tính tự động, quy tắc “Cố định 30” (dưới 30) |
| Thao tác | 1. Chạy nút cam cho khối 1.<br>2. So điểm của mục số nguyên có thêm tính tự động với baseline. |
| Expected | Mọi điểm tự động bằng baseline; chỉ có thêm kết quả đỏ. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Mọi điểm tự động bằng baseline; chỉ có thêm kết quả đỏ. |

#### TC-RS-REG-002 — Quy tắc đỏ không kế thừa hành vi "không khớp thì ghi NULL" của AutoRating

| Field | Value |
| --- | --- |
| Chức năng | Hồi quy luồng hiện có |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 12.2 “Điểm tích hợp chính”; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) chỉ có quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao); S07=20 không khớp (như case “Không quy tắc nào khớp khi đủ dữ liệu → Không áp dụng”). Mục không có quy tắc tính tự động. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao), học sinh S07 (điểm 35, cờ Chưa dự thi（未受験）) |
| Thao tác | 1. Đăng ký S07=20; chạy nút cam.<br>2. Xem điểm S07 trên màn nhập điểm và DB. |
| Expected | Điểm S07 vẫn 20 (không bị xóa/NULL); kết quả là Không áp dụng. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Điểm S07 vẫn 20 (không bị xóa/NULL); kết quả là Không áp dụng. |

#### TC-RS-REG-004 — Nút cam/nút xanh của trường đang dùng AutoRating hoạt động như trước

| Field | Value |
| --- | --- |
| Chức năng | Hồi quy luồng hiện có |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 1.3 “Quyền sử dụng”, mục 7.4 “Quy trình vận hành khi dùng trung bình/tỷ lệ nhóm”; trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Trường có AutoRating active; tài khoản có quyền chạy hàng loạt. Baseline: phạm vi chọn được và danh sách lớp được xếp hàng. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên có thêm tính tự động |
| Thao tác | 1. Mở màn, chọn cùng phạm vi như baseline.<br>2. Chạy nút cam rồi nút xanh. |
| Expected | Nút hiện, phạm vi chọn và danh sách lớp xếp hàng như baseline; AutoRating tính như baseline (REG-001). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| orange | Nút cam: Trường AutoRating active; tài khoản được chạy batch, chọn cùng scope baseline và chạy nút cam, đối chiếu danh sách lớp/job/kết quả. | Nút hiện, phạm vi chọn và danh sách lớp xếp hàng như baseline; AutoRating tính như baseline (REG-001). |
| green | Nút xanh: Cùng trường/quyền/scope baseline, chạy nút xanh sau chuỗi nút cam của nguồn; đối chiếu danh sách lớp/job/kết quả. | Nút hiện, phạm vi chọn và danh sách lớp xếp hàng như baseline; AutoRating tính như baseline (REG-001). |

#### TC-RS-REG-005 — Kết quả tổng hợp thứ hạng（順位集計） không đổi khi có quy tắc đỏ đọc nguồn

| Field | Value |
| --- | --- |
| Chức năng | Hồi quy luồng hiện có |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 5.5 “Chọn bản nguồn”, mục 7.4 “Quy trình vận hành khi dùng trung bình/tỷ lệ nhóm”, mục 12.2 “Điểm tích hợp chính”; trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | cặp quy tắc phân nhánh theo trung bình 60 và quy tắc theo tỷ lệ điểm của nhóm từ 65% đang dùng nguồn của khối 1. Baseline: kết quả tổng hợp (trung bình, thứ hạng, số người) chạy trên build cũ với cùng dữ liệu. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cặp quy tắc phân nhánh theo trung bình 60, quy tắc theo tỷ lệ điểm của nhóm từ 65% |
| Thao tác | 1. Chạy nút xanh rồi nút cam cho khối 1.<br>2. So trung bình, thứ hạng, số người với baseline. |
| Expected | Trung bình, thứ hạng, số người bằng baseline; nút cam không ghi lại kết quả tổng hợp. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Trung bình, thứ hạng, số người bằng baseline; nút cam không ghi lại kết quả tổng hợp. |

#### TC-RS-REG-013 — Các màn điểm tối đa lưu và xếp hàng như trước

| Field | Value |
| --- | --- |
| Chức năng | Hồi quy luồng hiện có |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị” (AC-G24 «Trigger khi đổi điểm tối đa/đơn vị»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Baseline trên build cũ: giá trị lưu, thông báo và danh sách job khi thực hiện ba bước dưới với cùng dữ liệu. mục điểm đơn vị (đơn vị U1 có M riêng 40) có quy tắc tỷ lệ 30%. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc tỷ lệ 30%; mục điểm đơn vị (đơn vị U1 có M riêng 40) |
| Thao tác | 1. Chuẩn bị cùng dữ liệu và baseline build cũ của thao tác đang kiểm.<br>2. Lưu thay đổi điểm tối đa theo màn của trường hợp, mở lại khi có thể.<br>3. So giá trị, thông báo và danh sách job/lớp/kỳ với baseline. |
| Expected | Giá trị lưu, thông báo và danh sách job (lớp/kỳ được xếp hàng) bằng baseline. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| definition | Định nghĩa điểm tối đa: Đổi định nghĩa M ở **Thiết lập điểm tối đa（満点設定）**, lưu/mở lại; so giá trị/thông báo/job với baseline cùng dữ liệu. | Giá trị lưu, thông báo và danh sách job (lớp/kỳ được xếp hàng) bằng baseline. |
| maximum | Giá trị tối đa: Đổi **Giá trị tối đa（最大値）**, lưu/mở lại; so giá trị/thông báo/job với baseline cùng dữ liệu. | Giá trị lưu, thông báo và danh sách job (lớp/kỳ được xếp hàng) bằng baseline. |
| batch | Điểm tối đa hàng loạt: Lưu lựa chọn **M=50 cho G-B** ở **Thiết lập điểm tối đa hàng loạt（満点一括設定）**; xem job và so baseline. | Giá trị lưu, thông báo và danh sách job (lớp/kỳ được xếp hàng) bằng baseline. |

#### TC-RS-REG-014 — Batch không phát sinh truy vấn theo từng ô（N+1）

| Field | Value |
| --- | --- |
| Chức năng | Hồi quy luồng hiện có |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 12.2 “Điểm tích hợp chính”; trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Khối có ít nhất 2 cỡ dữ liệu khác nhau (ví dụ 10 và 100 học sinh) trên môi trường local; bật log truy vấn. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: môi trường test (trường A, năm học 2026) |
| Thao tác | Chạy batch với từng cỡ dữ liệu; đếm truy vấn liên quan đến quy tắc/nguồn/kết quả đỏ. |
| Expected | Số truy vấn đọc quy tắc/nguồn/M không tăng tuyến tính theo số ô. Thời gian chạy chỉ ghi lại để so, không có ngưỡng pass/fail (tài liệu chưa đặt ngưỡng). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| size10 | Batch cỡ nhỏ: Cỡ **10 học sinh** trên môi trường local, bật log; chạy batch và đếm truy vấn đọc rule/nguồn/M/kết quả đỏ. | Số truy vấn đọc quy tắc/nguồn/M không tăng tuyến tính theo số ô. Thời gian chạy chỉ ghi lại để so, không có ngưỡng pass/fail (tài liệu chưa đặt ngưỡng). |
| size100 | Batch cỡ lớn: Cỡ **100 học sinh**, cùng loại fixture/log; chạy batch, đếm truy vấn và so cả hai cỡ, ghi thời gian không tự đặt ngưỡng. | Số truy vấn đọc quy tắc/nguồn/M không tăng tuyến tính theo số ô. Thời gian chạy chỉ ghi lại để so, không có ngưỡng pass/fail (tài liệu chưa đặt ngưỡng). |

#### TC-RS-REG-016 — Đăng ký điểm: xử lý điểm liên quan và giao dịch giữ như trước

| Field | Value |
| --- | --- |
| Chức năng | Hồi quy luồng hiện có |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất”, mục 8.4 “Lỗi kỹ thuật và thông báo”; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Mục có môn chính/môn con và quan điểm, có quy tắc tính tự động（自動計算設定） (mục số nguyên có thêm tính tự động) để các bước sau tính tự động chạy; baseline điểm môn chính, điểm quan điểm được sao chép và tín chỉ（単位） sau khi lưu điểm môn con. quy tắc “Cố định 30” (dưới 30) ở mục môn chính và ở mục nhận điểm sao chép theo quan điểm. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30); mục số nguyên (M=100); mục số nguyên có thêm tính tự động |
| Thao tác | 1. Xác minh fixture môn chính/môn con/quan điểm, AutoRating và baseline tín chỉ, điểm sao chép; giá trị trung gian/cuối phải khác phía ngưỡng30.<br>2. Lưu điểm môn con qua đường riêng trong bảng trường hợp.<br>3. Đọc điểm môn chính/quan điểm/tín chỉ, thông báo/lỗi và kết quả đỏ sau các bước xử lý cuối, đối chiếu baseline của chính đường đó. |
| Expected | 1–2. Điểm môn chính, điểm quan điểm được sao chép và tín chỉ bằng baseline; thông báo và hành vi lỗi của từng đường như baseline.<br><br>3. Ô môn chính và ô nhận điểm sao chép được xét theo giá trị cuối sau các bước sau tính tự động, không theo giá trị trung gian (đặc tả v2 mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất”). |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| direct | Ghi trực tiếp NB: Lưu điểm môn con qua **Màn lớp NB Đăng ký thành tích（成績登録）**; đọc môn chính/quan điểm sao chép/tín chỉ và ô đỏ. Dữ liệu trung gian/cuối nằm khác phía ngưỡng30 theo fixture. | 1–2. Điểm môn chính, điểm quan điểm được sao chép và tín chỉ bằng baseline; thông báo và hành vi lỗi của từng đường như baseline.<br><br>3. Ô môn chính và ô nhận điểm sao chép được xét theo giá trị cuối sau các bước sau tính tự động, không theo giá trị trung gian (đặc tả v2 mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất”). |
| csv | CSV lớp NB: Lưu điểm môn con qua **CSV lớp NB**; đọc môn chính/quan điểm sao chép/tín chỉ và ô đỏ. Giữ fixture trung gian/cuối khác phía ngưỡng30. | 1–2. Điểm môn chính, điểm quan điểm được sao chép và tín chỉ bằng baseline; thông báo và hành vi lỗi của từng đường như baseline.<br><br>3. Ô môn chính và ô nhận điểm sao chép được xét theo giá trị cuối sau các bước sau tính tự động, không theo giá trị trung gian (đặc tả v2 mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất”). |
| hr-csv | CSV lớp chủ nhiệm hàng loạt: Lưu điểm môn con qua **Đăng ký điểm hàng loạt bằng CSV（HR成績CSV一括登録）**; đọc môn chính/quan điểm sao chép/tín chỉ và ô đỏ. Giữ fixture trung gian/cuối khác phía ngưỡng30. | 1–2. Điểm môn chính, điểm quan điểm được sao chép và tín chỉ bằng baseline; thông báo và hành vi lỗi của từng đường như baseline.<br><br>3. Ô môn chính và ô nhận điểm sao chép được xét theo giá trị cuối sau các bước sau tính tự động, không theo giá trị trung gian (đặc tả v2 mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất”). |

#### TC-RS-REG-017 — Thiết lập ô nhập（入力欄設定）: các hàng hiện có không bị ảnh hưởng

| Field | Value |
| --- | --- |
| Chức năng | Hồi quy luồng hiện có |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”, mục 12.2 “Điểm tích hợp chính”; trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Baseline màn với nhiều mục; có mục có tính tự động và mục bị ẩn. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100), mục số nguyên có thêm tính tự động |
| Thao tác | 1. Mở màn, so bố cục với baseline.<br>2. Bấm link ở hàng Tính tự động（自動計算） và Thiết lập ẩn mục nhập（入力項目の非表示設定）.<br>3. Sửa một giá trị ở hàng khác, lưu. |
| Expected | Cột thẳng hàng, link mở đúng màn của đúng mục, lưu các hàng khác như baseline. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Cột thẳng hàng, link mở đúng màn của đúng mục, lưu các hàng khác như baseline. |

#### TC-RS-REG-011 — Consumer legacy giữ hành vi sau khi thêm rule đỏ

| Field | Value |
| --- | --- |
| Chức năng | Hồi quy luồng hiện có |
| screen_relative_path | unknown |
| Căn cứ | AC-G38 «Bảo toàn điểm đỏ cũ»; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | - Consumer/báo cáo hiện có đang hiển thị giá trị legacy trước khi bật rule mới. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Consumer/báo cáo hiện có đang hiển thị giá trị legacy trước khi bật rule mới. |
| Thao tác | 1. Thêm và chạy rule đỏ mới.<br>2. Mở consumer/báo cáo legacy cùng kỳ. |
| Expected | Consumer legacy giữ hành vi và giá trị trước đó, trừ phần tích hợp đỏ được xác nhận riêng; không đọc nhầm payload kết quả cá nhân mới. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ tình huống: Thực hiện đủ các bước chung theo thứ tự; kiểm cả đối tượng đích và đối chứng cùng fixture, không bỏ bước. | Consumer legacy giữ hành vi và giá trị trước đó, trừ phần tích hợp đỏ được xác nhận riêng; không đọc nhầm payload kết quả cá nhân mới. |

#### TC-RS-REG-012 — Các luồng chuyển cấu hình không làm mất legacy

| Field | Value |
| --- | --- |
| Chức năng | Hồi quy luồng hiện có |
| screen_relative_path | unknown |
| Căn cứ | AC-G38 «Bảo toàn điểm đỏ cũ»; AC-G39 «Không dùng lại kết quả cho đối tượng mới»; trạng thái nguồn CONFIRMED; ưu tiên nguồn Cao |
| Priority | High |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | - Có dữ liệu legacy và kết quả cá nhân ở nguồn; thực hiện một đường chuyển cấu hình được hỗ trợ. |
| Kích hoạt | @CTX-COMMON |
| Quan sát | @CTX-COMMON |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Có dữ liệu legacy và kết quả cá nhân ở nguồn; thực hiện một đường chuyển cấu hình được hỗ trợ. |
| Thao tác | 1. Xác minh nguồn legacy/kết quả cá nhân và identity đích của đường đang kiểm.<br>2. Chuyển cấu hình qua đường trong bảng trường hợp.<br>3. Đọc nguồn/đích trên consumer/báo cáo, đối chiếu legacy và mapping kết quả. |
| Expected | Legacy ở nguồn vẫn nguyên vẹn; đích không nhận kết quả cá nhân ngoài mapping hợp lệ và không dùng lại kết quả nguồn. |
| Bảo toàn | @CTX-COMMON |
| Bằng chứng | @CTX-COMMON |
| Reset | @CTX-COMMON |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| copy | Sao chép giữ legacy: Dùng fixture/đường **DATA-015** đã nêu, có cấu hình/legacy/bản chốt/kết quả cá nhân ở nguồn; thực hiện **copy** qua chức năng được hỗ trợ, đọc nguồn/đích và mapping identity trước khi xét ở đích. Không tự dựng route/ID. | Legacy ở nguồn vẫn nguyên vẹn; đích không nhận kết quả cá nhân ngoài mapping hợp lệ và không dùng lại kết quả nguồn. |
| year | Năm mới giữ legacy: Dùng fixture/đường **DATA-016** đã nêu, có cấu hình/legacy/bản chốt/kết quả cá nhân ở nguồn; thực hiện **kế thừa năm** qua chức năng được hỗ trợ, đọc nguồn/đích và mapping identity trước khi xét ở đích. Không tự dựng route/ID. | Legacy ở nguồn vẫn nguyên vẹn; đích không nhận kết quả cá nhân ngoài mapping hợp lệ và không dùng lại kết quả nguồn. |
| import | Nhập giữ legacy: Dùng fixture/đường **DATA-017** đã nêu, có cấu hình/legacy/bản chốt/kết quả cá nhân ở nguồn; thực hiện **import** qua chức năng được hỗ trợ, đọc nguồn/đích và mapping identity trước khi xét ở đích. Không tự dựng route/ID. | Legacy ở nguồn vẫn nguyên vẹn; đích không nhận kết quả cá nhân ngoài mapping hợp lệ và không dùng lại kết quả nguồn. |
| sync | Đồng bộ giữ legacy: Dùng fixture/đường **DATA-019** đã nêu, có cấu hình/legacy/bản chốt/kết quả cá nhân ở nguồn; thực hiện **sync** qua chức năng được hỗ trợ, đọc nguồn/đích và mapping identity trước khi xét ở đích. Không tự dựng route/ID. | Legacy ở nguồn vẫn nguyên vẹn; đích không nhận kết quả cá nhân ngoài mapping hợp lệ và không dùng lại kết quả nguồn. |
