<!-- blend-template: test-cases@1.1.0 -->
# RC-001 — Testcase điểm đỏ（赤点）

## Quy ước và context

| Field | Value |
| --- | --- |
| Revision | RC-001-v2-report-2026-10-04 |
| Feature | RC-001 — Điểm đỏ（赤点） |
| Conventions | Giữ 216 Case IDs và 569 Variant IDs từ bộ đã review. Status CONFIRMED/IMPLEMENTED → Confirmed; PROPOSED → Proposed; TBD/CONFLICT → Awaiting decision. IMPLEMENTED là căn cứ bảo toàn hiện trạng, không phải approval khách hàng. READY → Ready, BLOCKED → Blocked, UNASSESSED → Draft. Cao → High; Priority TBD → Medium tạm để tương thích schema, không đổi thứ tự luồng. Execution bắt đầu NOT RUN; không copy actual/evidence từ lịch sử. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: môi trường test (trường A, năm học 2026), tài khoản giáo viên có quyền sửa mục, mục số nguyên (M=100), mục số thập phân (M=100), mục điểm đơn vị (đơn vị U1 có M riêng 40) |
| Thao tác | 1. Mở Thiết lập nhập điểm（成績入力設定）→ Thiết lập ô nhập（入力欄設定） của kỳ 1学期期末 (cuối kỳ học kỳ 1).<br>2. Tìm hàng Thiết lập điểm đỏ（赤点設定） ở bảng mục nhập.<br>3. Bấm link của hàng này ở cột mục số nguyên (M=100), mục số thập phân (M=100), mục điểm đơn vị (đơn vị U1 có M riêng 40). |
| Expected | 1. Theo Figma MW, hàng Thiết lập điểm đỏ（赤点設定） được đặt giữa hàng Tính tự động（自動計算） và hàng Thiết lập ẩn mục nhập（入力項目の非表示設定）. Đây là oracle UI PROPOSED; nếu bố cục khác, ghi Notes để đối chiếu, không mở bug từ riêng vị trí.<br>2. Có thao tác mở thiết lập cho mục số nguyên, số thập phân và điểm đơn vị.<br>3. Bấm link chuyển sang màn danh sách Thiết lập điểm đỏ（赤点設定） của đúng mục. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| integer | Mục số nguyên | 1. Theo Figma MW, hàng Thiết lập điểm đỏ（赤点設定） được đặt giữa hàng Tính tự động（自動計算） và hàng Thiết lập ẩn mục nhập（入力項目の非表示設定）. Đây là oracle UI PROPOSED; nếu bố cục khác, ghi Notes để đối chiếu, không mở bug từ riêng vị trí.<br>2. Có thao tác mở thiết lập cho mục số nguyên, số thập phân và điểm đơn vị.<br>3. Bấm link chuyển sang màn danh sách Thiết lập điểm đỏ（赤点設定） của đúng mục. |
| decimal | Mục thập phân | 1. Theo Figma MW, hàng Thiết lập điểm đỏ（赤点設定） được đặt giữa hàng Tính tự động（自動計算） và hàng Thiết lập ẩn mục nhập（入力項目の非表示設定）. Đây là oracle UI PROPOSED; nếu bố cục khác, ghi Notes để đối chiếu, không mở bug từ riêng vị trí.<br>2. Có thao tác mở thiết lập cho mục số nguyên, số thập phân và điểm đơn vị.<br>3. Bấm link chuyển sang màn danh sách Thiết lập điểm đỏ（赤点設定） của đúng mục. |
| unit | Mục đơn vị | 1. Theo Figma MW, hàng Thiết lập điểm đỏ（赤点設定） được đặt giữa hàng Tính tự động（自動計算） và hàng Thiết lập ẩn mục nhập（入力項目の非表示設定）. Đây là oracle UI PROPOSED; nếu bố cục khác, ghi Notes để đối chiếu, không mở bug từ riêng vị trí.<br>2. Có thao tác mở thiết lập cho mục số nguyên, số thập phân và điểm đơn vị.<br>3. Bấm link chuyển sang màn danh sách Thiết lập điểm đỏ（赤点設定） của đúng mục. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục kiểu lựa chọn A/B/C, mục Đạt/không đạt（合否） |
| Thao tác | 1. Mở Thiết lập ô nhập（入力欄設定）.<br>2. Xem hàng Thiết lập điểm đỏ（赤点設定） ở cột mục kiểu lựa chọn A/B/C, mục Đạt/không đạt（合否）.<br>3. Thử mở URL màn danh sách điểm đỏ của mục kiểu lựa chọn A/B/C bằng ID mục (nếu biết URL). |
| Expected | 1. Không có thao tác tạo quy tắc đỏ có hiệu lực cho hai mục này.<br>2. Nếu có endpoint truy cập trực tiếp, server vẫn từ chối tạo/lưu quy tắc cho mục không thuộc loại số; không dùng việc URL không hiển thị làm bằng chứng duy nhất. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| choice | Mục lựa chọn, gồm thử URL trực tiếp ở bước 3 | 1. Không có thao tác tạo quy tắc đỏ có hiệu lực cho hai mục này.<br>2. Nếu có endpoint truy cập trực tiếp, server vẫn từ chối tạo/lưu quy tắc cho mục không thuộc loại số; không dùng việc URL không hiển thị làm bằng chứng duy nhất. |
| passfail | Mục Đạt/không đạt ở bước 1–2 | 1. Không có thao tác tạo quy tắc đỏ có hiệu lực cho hai mục này.<br>2. Nếu có endpoint truy cập trực tiếp, server vẫn từ chối tạo/lưu quy tắc cho mục không thuộc loại số; không dùng việc URL không hiển thị làm bằng chứng duy nhất. |

#### TC-RS-FUNC-004 — Thêm quy tắc qua Điều kiện áp dụng（適用条件） và Ngưỡng（基準設定） rồi quay lại danh sách

| Field | Value |
| --- | --- |
| Chức năng | Thiết lập điểm đỏ（赤点設定） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04 «Lưu và mở lại nhiều thiết lập»); trạng thái nguồn CONFIRMED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Confirmed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) đã có cặp quy tắc cùng áp dụng (dưới 20 và dưới 30) (2 quy tắc). Đăng nhập tài khoản giáo viên có quyền sửa mục. |
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100), cặp quy tắc cùng áp dụng (dưới 20 và dưới 30); quy tắc “Cố định 30” (dưới 30) |
| Thao tác | 1. Ở danh sách, bấm Thêm thiết lập chi tiết（詳細設定の追加）.<br>2. Nhập Tên thiết lập（設定名称） "Cố định 30", chọn Toàn bộ đối tượng（全員が対象）, bấm Cập nhật（更新する）.<br>3. Mở Ngưỡng, chọn Điểm cố định（固定点数）, nhập 30, chọn Nhỏ hơn（未満）, bấm Cập nhật（更新する）.<br>4. Xem danh sách. |
| Expected | 1. Sau mỗi lần cập nhật, màn quay về danh sách.<br>2. Dòng mới hiện tên, tóm tắt điều kiện "toàn bộ" và ngưỡng "Điểm cố định: 30 điểm, Nhỏ hơn" đúng với dữ liệu đã lưu.<br>3. **PROPOSED (đặc tả v2 mục 4.4 “Lưu, đổi thứ tự và xóa”):** dòng mới nằm sau các quy tắc đã có. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. Sau mỗi lần cập nhật, màn quay về danh sách.<br>2. Dòng mới hiện tên, tóm tắt điều kiện "toàn bộ" và ngưỡng "Điểm cố định: 30 điểm, Nhỏ hơn" đúng với dữ liệu đã lưu.<br>3. **PROPOSED (đặc tả v2 mục 4.4 “Lưu, đổi thứ tự và xóa”):** dòng mới nằm sau các quy tắc đã có. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), cặp quy tắc cùng áp dụng (dưới 20 và dưới 30) |
| Thao tác | 1. Bấm ▼ ở quy tắc 1.<br>2. Tải lại trang.<br>3. Bấm ▲ ở quy tắc 3.<br>4. Đăng xuất, đăng nhập lại, mở danh sách. |
| Expected | 1. Sau bước 1 thứ tự là quy tắc 2, quy tắc 1, quy tắc 3 và giữ nguyên sau khi tải lại.<br>2. Sau bước 3 thứ tự là quy tắc 2, quy tắc 3, quy tắc 1 và giữ nguyên khi mở lại.<br>3. Đổi thứ tự không làm thay kết quả đỏ hiện có (kiểm ở case “Lưu cấu hình không xét; kết quả trước giữ tới lần chạy lại”). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. Sau bước 1 thứ tự là quy tắc 2, quy tắc 1, quy tắc 3 và giữ nguyên sau khi tải lại.<br>2. Sau bước 3 thứ tự là quy tắc 2, quy tắc 3, quy tắc 1 và giữ nguyên khi mở lại.<br>3. Đổi thứ tự không làm thay kết quả đỏ hiện có (kiểm ở case “Lưu cấu hình không xét; kết quả trước giữ tới lần chạy lại”). |

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
| Cấu hình | mục số nguyên (M=100) có 2 quy tắc. |
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); cặp quy tắc cùng áp dụng (dưới 20 và dưới 30) |
| Thao tác | 1. Bấm Xóa（削除） ở quy tắc thứ 2, chọn Hủy（キャンセル）.<br>2. Bấm Xóa（削除） lại, chọn Xóa（削除する）. |
| Expected | 1. Hộp xác nhận nêu thiết lập sẽ bị xóa và kết quả học sinh chỉ cập nhật ở lần xét tiếp theo.<br>2. Hủy: danh sách giữ 2 quy tắc.<br>3. Xóa: danh sách còn 1 quy tắc; kết quả đỏ hiện có không đổi cho tới lần xét tiếp theo (case “Xóa quy tắc cuối: giữ kết quả tới lần chạy lại; chạy lại → Không áp dụng”). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| cancel | Hủy xóa | 1. Hộp xác nhận nêu thiết lập sẽ bị xóa và kết quả học sinh chỉ cập nhật ở lần xét tiếp theo.<br>2. Hủy: danh sách giữ 2 quy tắc.<br>3. Xóa: danh sách còn 1 quy tắc; kết quả đỏ hiện có không đổi cho tới lần xét tiếp theo (case “Xóa quy tắc cuối: giữ kết quả tới lần chạy lại; chạy lại → Không áp dụng”). |
| delete | Xác nhận xóa, dựng lại baseline trước lượt này | 1. Hộp xác nhận nêu thiết lập sẽ bị xóa và kết quả học sinh chỉ cập nhật ở lần xét tiếp theo.<br>2. Hủy: danh sách giữ 2 quy tắc.<br>3. Xóa: danh sách còn 1 quy tắc; kết quả đỏ hiện có không đổi cho tới lần xét tiếp theo (case “Xóa quy tắc cuối: giữ kết quả tới lần chạy lại; chạy lại → Không áp dụng”). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30) |
| Thao tác | 1. Mở Ngưỡng của quy tắc “Cố định 30” (dưới 30), đổi 30 thành 35 và đổi sang Nhỏ hơn hoặc bằng（以下）.<br>2. Bấm Quay lại（戻る）.<br>3. Mở Điều kiện áp dụng, đổi tên, bấm Quay lại（戻る）.<br>4. Mở lại hai màn. |
| Expected | Danh sách và hai màn vẫn hiện giá trị đã lưu trước đó (30, Nhỏ hơn, tên cũ). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| back-threshold | Quay lại từ màn ngưỡng | Danh sách và hai màn vẫn hiện giá trị đã lưu trước đó (30, Nhỏ hơn, tên cũ). |
| back-condition | Quay lại từ màn điều kiện | Danh sách và hai màn vẫn hiện giá trị đã lưu trước đó (30, Nhỏ hơn, tên cũ). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Điều kiện chung: trường A/năm 2026, mục số nguyên TD-ITEM-01 (M=100), S01 có điểm 29; giáo viên có quyền sửa rule và chạy xét lại. Hai tab cùng phạm vi mục/kỳ. Mỗi biến thể có bản reset riêng, đúng hai rule Toàn bộ với dấu `&lt;`; ghi identity rule ưu tiên 1 và rule đối chứng ưu tiên 2. Phạm vi trích xuất chỉ gồm ô này để ô đỏ khác không ảnh hưởng bộ lọc.<br>- `incomplete-excluded`: rule ưu tiên 1 chỉ lưu điều kiện, chưa có ngưỡng; rule đối chứng ưu tiên 2 có T=30. Đây là fixture TD-RULE-13/TD-RULE-01.<br>- `complete-deleted-stale`: rule ưu tiên 1 hoàn chỉnh T=30, rule đối chứng ưu tiên 2 T=20; chạy baseline S01=29 → Đỏ theo rule ưu tiên 1.<br>- `incomplete-deleted-stale`: rule ưu tiên 1 chỉ có điều kiện, rule đối chứng ưu tiên 2 T=20; chạy baseline S01=29 → Không đỏ theo rule đối chứng. T=20 là cấu hình riêng của hai biến thể stale-form, không thay TD-RULE-01 dùng chung. |
| Thao tác | 1. Với `incomplete-excluded`, dựng fixture riêng, xem dòng chưa hoàn chỉnh; đăng ký S01=29 và đọc kết quả, identity rule/ngưỡng đã dùng cùng đầu ra trích xuất.<br>2. Với `complete-deleted-stale`, reset và xác nhận baseline Đỏ/T=30. Mở form ngưỡng của rule ưu tiên 1 ở tab A. Xóa đúng rule đó ở tab B, rồi gửi lưu T=30 từ form cũ ở tab A. Reload danh sách và đọc trạng thái rule; trước khi chạy xét lại, đọc điểm/kết quả đã hoàn tất của S01.<br>3. Chạy xét lại thành công cho đúng ô của `complete-deleted-stale`; đọc identity rule/ngưỡng được chọn. Chạy trích xuất một lượt tắt lọc để thấy điểm và dấu, một lượt bật lọc đỏ để kiểm membership của S01.<br>4. Với `incomplete-deleted-stale`, reset và xác nhận baseline Không đỏ/T=20. Mở form ngưỡng của rule nhập dở ở tab A, nhập T=40 nhưng **chưa lưu**. Xóa đúng rule nhập dở ở tab B, rồi gửi T=40 từ form cũ ở tab A. Reload danh sách và đọc trạng thái rule.<br>5. Chạy xét lại thành công cho đúng ô của `incomplete-deleted-stale`; đọc identity rule/ngưỡng và thực hiện hai lượt trích xuất tắt/bật lọc như bước 3. Lưu bằng chứng riêng cho từng biến thể, không dùng kết quả của biến thể trước. |
| Expected | 1. `incomplete-excluded`: dòng nhập dở hiện chưa thiết lập và cho mở ngưỡng; không tạo ngưỡng 0 ngầm. Bộ xét chọn đúng rule đối chứng T=30, S01=29 Đỏ; rule nhập dở không tham gia xét.<br>2. `complete-deleted-stale`: lưu form cũ không phục hồi rule đã xóa trong danh sách hoặc bộ xét. Trước lần xét lại, S01 vẫn giữ điểm 29 và kết quả Đỏ/T=30 đã hoàn tất. Sau lần xét lại, bộ xét chọn đúng identity rule đối chứng T=20 → **Không đỏ**; lượt tắt lọc hiện 29 không dấu đỏ, lượt bật lọc không có S01.<br>3. `incomplete-deleted-stale`: T=40 gửi từ form cũ không làm rule nhập dở đã xóa sống lại hoặc trở thành rule hoàn chỉnh. Sau lần xét lại, bộ xét vẫn chọn đúng rule đối chứng T=20 → **Không đỏ**, điểm 29 giữ nguyên; lượt tắt lọc không có dấu đỏ, lượt bật lọc không có S01. Nếu rule 40 bị phục hồi thì 29&lt;40 sẽ Đỏ, nên không được PASS trường hợp đó dù danh sách đã ẩn rule.<br>4. Rule đối chứng giữ nguyên cấu hình/identity ở cả hai biến thể stale-form. Nếu từ chối form cũ, thông báo an toàn; không áp đặt mã HTTP hoặc enum/schema chưa được xác nhận. Thiếu seam gửi form, chạy xét hoặc reader đáng tin thì ghi BLOCKED cho biến thể liên quan. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| incomplete-excluded | Nhánh incomplete-excluded trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. `incomplete-excluded`: dòng nhập dở hiện chưa thiết lập và cho mở ngưỡng; không tạo ngưỡng 0 ngầm. Bộ xét chọn đúng rule đối chứng T=30, S01=29 Đỏ; rule nhập dở không tham gia xét.<br>2. `complete-deleted-stale`: lưu form cũ không phục hồi rule đã xóa trong danh sách hoặc bộ xét. Trước lần xét lại, S01 vẫn giữ điểm 29 và kết quả Đỏ/T=30 đã hoàn tất. Sau lần xét lại, bộ xét chọn đúng identity rule đối chứng T=20 → **Không đỏ**; lượt tắt lọc hiện 29 không dấu đỏ, lượt bật lọc không có S01.<br>3. `incomplete-deleted-stale`: T=40 gửi từ form cũ không làm rule nhập dở đã xóa sống lại hoặc trở thành rule hoàn chỉnh. Sau lần xét lại, bộ xét vẫn chọn đúng rule đối chứng T=20 → **Không đỏ**, điểm 29 giữ nguyên; lượt tắt lọc không có dấu đỏ, lượt bật lọc không có S01. Nếu rule 40 bị phục hồi thì 29&lt;40 sẽ Đỏ, nên không được PASS trường hợp đó dù danh sách đã ẩn rule.<br>4. Rule đối chứng giữ nguyên cấu hình/identity ở cả hai biến thể stale-form. Nếu từ chối form cũ, thông báo an toàn; không áp đặt mã HTTP hoặc enum/schema chưa được xác nhận. Thiếu seam gửi form, chạy xét hoặc reader đáng tin thì ghi BLOCKED cho biến thể liên quan. |
| complete-deleted-stale | Nhánh complete-deleted-stale trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. `incomplete-excluded`: dòng nhập dở hiện chưa thiết lập và cho mở ngưỡng; không tạo ngưỡng 0 ngầm. Bộ xét chọn đúng rule đối chứng T=30, S01=29 Đỏ; rule nhập dở không tham gia xét.<br>2. `complete-deleted-stale`: lưu form cũ không phục hồi rule đã xóa trong danh sách hoặc bộ xét. Trước lần xét lại, S01 vẫn giữ điểm 29 và kết quả Đỏ/T=30 đã hoàn tất. Sau lần xét lại, bộ xét chọn đúng identity rule đối chứng T=20 → **Không đỏ**; lượt tắt lọc hiện 29 không dấu đỏ, lượt bật lọc không có S01.<br>3. `incomplete-deleted-stale`: T=40 gửi từ form cũ không làm rule nhập dở đã xóa sống lại hoặc trở thành rule hoàn chỉnh. Sau lần xét lại, bộ xét vẫn chọn đúng rule đối chứng T=20 → **Không đỏ**, điểm 29 giữ nguyên; lượt tắt lọc không có dấu đỏ, lượt bật lọc không có S01. Nếu rule 40 bị phục hồi thì 29&lt;40 sẽ Đỏ, nên không được PASS trường hợp đó dù danh sách đã ẩn rule.<br>4. Rule đối chứng giữ nguyên cấu hình/identity ở cả hai biến thể stale-form. Nếu từ chối form cũ, thông báo an toàn; không áp đặt mã HTTP hoặc enum/schema chưa được xác nhận. Thiếu seam gửi form, chạy xét hoặc reader đáng tin thì ghi BLOCKED cho biến thể liên quan. |
| incomplete-deleted-stale | Nhánh incomplete-deleted-stale trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. `incomplete-excluded`: dòng nhập dở hiện chưa thiết lập và cho mở ngưỡng; không tạo ngưỡng 0 ngầm. Bộ xét chọn đúng rule đối chứng T=30, S01=29 Đỏ; rule nhập dở không tham gia xét.<br>2. `complete-deleted-stale`: lưu form cũ không phục hồi rule đã xóa trong danh sách hoặc bộ xét. Trước lần xét lại, S01 vẫn giữ điểm 29 và kết quả Đỏ/T=30 đã hoàn tất. Sau lần xét lại, bộ xét chọn đúng identity rule đối chứng T=20 → **Không đỏ**; lượt tắt lọc hiện 29 không dấu đỏ, lượt bật lọc không có S01.<br>3. `incomplete-deleted-stale`: T=40 gửi từ form cũ không làm rule nhập dở đã xóa sống lại hoặc trở thành rule hoàn chỉnh. Sau lần xét lại, bộ xét vẫn chọn đúng rule đối chứng T=20 → **Không đỏ**, điểm 29 giữ nguyên; lượt tắt lọc không có dấu đỏ, lượt bật lọc không có S01. Nếu rule 40 bị phục hồi thì 29&lt;40 sẽ Đỏ, nên không được PASS trường hợp đó dù danh sách đã ẩn rule.<br>4. Rule đối chứng giữ nguyên cấu hình/identity ở cả hai biến thể stale-form. Nếu từ chối form cũ, thông báo an toàn; không áp đặt mã HTTP hoặc enum/schema chưa được xác nhận. Thiếu seam gửi form, chạy xét hoặc reader đáng tin thì ghi BLOCKED cho biến thể liên quan. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29) |
| Thao tác | 1. Đổi tên quy tắc “Cố định 30” (dưới 30) từ "Cố định 30" thành "Ngưỡng học kỳ 1", Lưu.<br>2. Xem danh sách và ba đầu ra.<br>3. Chạy lại bằng đăng ký điểm S01=29. |
| Expected | 1–2. Danh sách hiện tên mới ở cùng vị trí ưu tiên, tóm tắt không đổi; S01 vẫn Đỏ ở ba đầu ra.<br><br>3. S01 Đỏ; quy tắc được chọn vẫn là quy tắc đã đổi tên (không tạo quy tắc mới, không mất liên kết). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1–2. Danh sách hiện tên mới ở cùng vị trí ưu tiên, tóm tắt không đổi; S01 vẫn Đỏ ở ba đầu ra.<br><br>3. S01 Đỏ; quy tắc được chọn vẫn là quy tắc đã đổi tên (không tạo quy tắc mới, không mất liên kết). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Tên trống; tên chỉ khoảng trắng; 255 ký tự; 256 ký tự; 255 ký tự có thêm khoảng trắng ở đầu và cuối; hai quy tắc cùng tên |
| Thao tác | 1. Nhập từng giá trị, Lưu, mở lại.<br>2. Tạo quy tắc thứ hai trùng tên quy tắc thứ nhất, Lưu. |
| Expected | 1. Trống/chỉ khoảng trắng: không lưu được. 255 ký tự: lưu được, mở lại đủ. 256 ký tự: bị từ chối, không tự cắt. 255 ký tự kèm khoảng trắng đầu/cuối: lưu được, tên lưu đã bỏ khoảng trắng đầu/cuối (đủ 255 ký tự).<br>2. Lưu được; hai dòng riêng theo ưu tiên. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| empty | Tên trống | 1. Trống/chỉ khoảng trắng: không lưu được. 255 ký tự: lưu được, mở lại đủ. 256 ký tự: bị từ chối, không tự cắt. 255 ký tự kèm khoảng trắng đầu/cuối: lưu được, tên lưu đã bỏ khoảng trắng đầu/cuối (đủ 255 ký tự).<br>2. Lưu được; hai dòng riêng theo ưu tiên. |
| space | Chỉ khoảng trắng | 1. Trống/chỉ khoảng trắng: không lưu được. 255 ký tự: lưu được, mở lại đủ. 256 ký tự: bị từ chối, không tự cắt. 255 ký tự kèm khoảng trắng đầu/cuối: lưu được, tên lưu đã bỏ khoảng trắng đầu/cuối (đủ 255 ký tự).<br>2. Lưu được; hai dòng riêng theo ưu tiên. |
| len255 | 255 ký tự | 1. Trống/chỉ khoảng trắng: không lưu được. 255 ký tự: lưu được, mở lại đủ. 256 ký tự: bị từ chối, không tự cắt. 255 ký tự kèm khoảng trắng đầu/cuối: lưu được, tên lưu đã bỏ khoảng trắng đầu/cuối (đủ 255 ký tự).<br>2. Lưu được; hai dòng riêng theo ưu tiên. |
| len256 | 256 ký tự | 1. Trống/chỉ khoảng trắng: không lưu được. 255 ký tự: lưu được, mở lại đủ. 256 ký tự: bị từ chối, không tự cắt. 255 ký tự kèm khoảng trắng đầu/cuối: lưu được, tên lưu đã bỏ khoảng trắng đầu/cuối (đủ 255 ký tự).<br>2. Lưu được; hai dòng riêng theo ưu tiên. |
| padded255 | 255 ký tự kèm khoảng trắng | 1. Trống/chỉ khoảng trắng: không lưu được. 255 ký tự: lưu được, mở lại đủ. 256 ký tự: bị từ chối, không tự cắt. 255 ký tự kèm khoảng trắng đầu/cuối: lưu được, tên lưu đã bỏ khoảng trắng đầu/cuối (đủ 255 ký tự).<br>2. Lưu được; hai dòng riêng theo ưu tiên. |
| duplicate | Trùng tên | 1. Trống/chỉ khoảng trắng: không lưu được. 255 ký tự: lưu được, mở lại đủ. 256 ký tự: bị từ chối, không tự cắt. 255 ký tự kèm khoảng trắng đầu/cuối: lưu được, tên lưu đã bỏ khoảng trắng đầu/cuối (đủ 255 ký tự).<br>2. Lưu được; hai dòng riêng theo ưu tiên. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30); N = 101 |
| Thao tác | 1. Mở quy tắc “Cố định 30” (dưới 30), đổi N=101, Lưu (lỗi).<br>2. Quay lại danh sách, xem ba đầu ra. |
| Expected | Cấu hình vẫn 30; S01 vẫn Đỏ. Giá trị vừa nhập có được giữ trên form hay không: PROPOSED (không must-pass). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Cấu hình vẫn 30; S01 vẫn Đỏ. Giá trị vừa nhập có được giữ trên form hay không: PROPOSED (không must-pass). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100); quy tắc “Cố định 30” (dưới 30) với N=29.5; quy tắc tỷ lệ 30% làm tròn xuống; quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8); quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao) |
| Thao tác | 1. Lưu từng quy tắc.<br>2. Tải lại trang, mở từng quy tắc.<br>3. SELECT cấu hình (khi có schema). |
| Expected | Mọi trường (tên, phạm vi, bộ lọc, điều kiện, loại, N, p, cách làm tròn, toán hạng, so sánh, thứ tự) trùng giá trị đã nhập. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| fixed | Cố định 29.5 | Mọi trường (tên, phạm vi, bộ lọc, điều kiện, loại, N, p, cách làm tròn, toán hạng, so sánh, thứ tự) trùng giá trị đã nhập. |
| ratio | Tỷ lệ 30 phần trăm cắt xuống | Mọi trường (tên, phạm vi, bộ lọc, điều kiện, loại, N, p, cách làm tròn, toán hạng, so sánh, thứ tự) trùng giá trị đã nhập. |
| formula | Công thức hai dòng | Mọi trường (tên, phạm vi, bộ lọc, điều kiện, loại, N, p, cách làm tròn, toán hạng, so sánh, thứ tự) trùng giá trị đã nhập. |
| filter | Bộ lọc kết hợp | Mọi trường (tên, phạm vi, bộ lọc, điều kiện, loại, N, p, cách làm tròn, toán hạng, so sánh, thứ tự) trùng giá trị đã nhập. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29) |
| Thao tác | 1. Xóa quy tắc “Cố định 30” (dưới 30).<br>2. SELECT kết quả và điểm của S01. |
| Expected | Kết quả S01 vẫn còn; điểm 29 giữ nguyên. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Kết quả S01 vẫn còn; điểm 29 giữ nguyên. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100), mục số thập phân (M=100), mục kiểu lựa chọn A/B/C |
| Thao tác | 1. Mở Thiết lập ô nhập（入力欄設定）.<br>2. Ghi lại nhãn/ký hiệu ở hàng Thiết lập điểm đỏ（赤点設定） cho từng cột mục. |
| Expected | Mục chưa có quy tắc và mục đã có quy tắc được phân biệt được; mục lựa chọn không có thao tác mở thiết lập (đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”).<br><br>Nhãn cụ thể theo Figma (PROPOSED): [設定する] (thiết lập) / 編集 (sửa) + 設定済み (đã thiết lập) / —. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Mục chưa có quy tắc và mục đã có quy tắc được phân biệt được; mục lựa chọn không có thao tác mở thiết lập (đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”).<br><br>Nhãn cụ thể theo Figma (PROPOSED): [設定する] (thiết lập) / 編集 (sửa) + 設定済み (đã thiết lập) / —. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); cặp quy tắc phân nhánh theo trung bình 60 |
| Thao tác | 1. Mở Thiết lập nhập điểm（成績入力設定） (URL ở đường dẫn các màn liên quan) → Thiết lập ô nhập（入力欄設定） của kỳ Cuối kỳ học kỳ 1（1学期期末）.<br>2. Ở hàng Thiết lập điểm đỏ（赤点設定） của cột mục số nguyên (M=100), bấm nút mở thiết lập (Figma: 編集 (sửa)).<br>3. Trên màn danh sách, đối chiếu lần lượt các mục a–g ở Expected Result. |
| Expected | a. Breadcrumb: Thiết lập bảng thành tích（成績帳票設定） - Thiết lập thành tích（成績設定） - Thiết lập nhập điểm（成績入力設定） - Thiết lập điểm đỏ（赤点設定）.<br><br>b. Link Quay lại Thiết lập nhập điểm（[成績入力設定へ戻る]）.<br><br>c. Khối Giải thích bổ sung（※補足説明※） thu gọn/mở được.<br><br>d. Nút Thêm thiết lập chi tiết（詳細設定の追加）.<br><br>e. Bảng có các cột Tên thiết lập（設定名称）; Điều kiện áp dụng（適用条件） kèm Sửa（[編集]）; Ngưỡng đỏ（赤点の基準） kèm Sửa（[編集]）; Xóa（削除）; Ưu tiên（優先順位） ▲▼; có 2 dòng theo cặp quy tắc phân nhánh theo trung bình 60.<br><br>f. Câu 「上から順に適用条件を確認し、最初に一致した設定を使用します。」 (kiểm điều kiện từ trên xuống, dùng thiết lập khớp đầu tiên).<br><br>g. Câu cuối trang 「設定を変更した場合は、成績登録または成績集計の自動算出を再実行してください。」 (đổi thiết lập thì chạy lại đăng ký điểm hoặc tính tự động). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | a. Breadcrumb: Thiết lập bảng thành tích（成績帳票設定） - Thiết lập thành tích（成績設定） - Thiết lập nhập điểm（成績入力設定） - Thiết lập điểm đỏ（赤点設定）.<br><br>b. Link Quay lại Thiết lập nhập điểm（[成績入力設定へ戻る]）.<br><br>c. Khối Giải thích bổ sung（※補足説明※） thu gọn/mở được.<br><br>d. Nút Thêm thiết lập chi tiết（詳細設定の追加）.<br><br>e. Bảng có các cột Tên thiết lập（設定名称）; Điều kiện áp dụng（適用条件） kèm Sửa（[編集]）; Ngưỡng đỏ（赤点の基準） kèm Sửa（[編集]）; Xóa（削除）; Ưu tiên（優先順位） ▲▼; có 2 dòng theo cặp quy tắc phân nhánh theo trung bình 60.<br><br>f. Câu 「上から順に適用条件を確認し、最初に一致した設定を使用します。」 (kiểm điều kiện từ trên xuống, dùng thiết lập khớp đầu tiên).<br><br>g. Câu cuối trang 「設定を変更した場合は、成績登録または成績集計の自動算出を再実行してください。」 (đổi thiết lập thì chạy lại đăng ký điểm hoặc tính tự động). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100) |
| Thao tác | Mở màn danh sách của mục số thập phân (M=100), đọc tiêu đề. |
| Expected | Theo tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập”: màn danh sách thể hiện kỳ Cuối kỳ học kỳ 1（1学期期末）, tên mục, kiểu nhập Nhập số – thập phân（数値入力・小数） và Thiết lập điểm đỏ（赤点設定）.<br><br>Định dạng tiêu đề theo Figma (PROPOSED): 「1学期期末 ／ 評点（数値入力・小数） の赤点設定」; lệch thì ghi Notes, không FAIL. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Theo tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập”: màn danh sách thể hiện kỳ Cuối kỳ học kỳ 1（1学期期末）, tên mục, kiểu nhập Nhập số – thập phân（数値入力・小数） và Thiết lập điểm đỏ（赤点設定）.<br><br>Định dạng tiêu đề theo Figma (PROPOSED): 「1学期期末 ／ 評点（数値入力・小数） の赤点設定」; lệch thì ghi Notes, không FAIL. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8), cặp quy tắc phân nhánh theo trung bình 60 |
| Thao tác | Xem cột Điều kiện áp dụng（適用条件） và Ngưỡng đỏ（赤点の基準） của từng dòng. |
| Expected | Mỗi dòng cho biết môn/nguồn/mốc của điều kiện, loại ngưỡng, giá trị, dấu so sánh; dòng công thức cho thấy các dòng tính và xử lý phần lẻ. Định dạng theo Figma (đề xuất). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Mỗi dòng cho biết môn/nguồn/mốc của điều kiện, loại ngưỡng, giá trị, dấu so sánh; dòng công thức cho thấy các dòng tính và xử lý phần lẻ. Định dạng theo Figma (đề xuất). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100) |
| Thao tác | Mở danh sách. |
| Expected | Hiển thị câu báo không có thiết lập và nút thêm; không có dòng mẫu. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Hiển thị câu báo không có thiết lập và nút thêm; không có dòng mẫu. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30) |
| Thao tác | Bấm Xóa（削除） ở dòng duy nhất. |
| Expected | Hộp xác nhận nêu đây là thiết lập cuối, kết quả trước còn dùng tới lần chạy lại, điểm được giữ; có Hủy và Xóa. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Hộp xác nhận nêu đây là thiết lập cuối, kết quả trước còn dùng tới lần chạy lại, điểm được giữ; có Hủy và Xóa. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: form ngưỡng ở tab A sẽ nhập T=40 nhưng chưa lưu; tab B dùng để xóa rule nhập dở. Phạm vi trích xuất chỉ có ô S01=29 này. Đây là fixture của `FUNC-014/incomplete-deleted-stale`, không thay ngưỡng 30 dùng chung. |
| Thao tác | 1. Với `incomplete-row`, quay về danh sách, xem dòng nhập dở và thao tác mở thiết lập ngưỡng; chạy xét và đọc rule đối chứng T=20 đã dùng cho S01.<br>2. Với `incomplete-deleted-stale`, reset fixture và xác nhận baseline Không đỏ/T=20. Mở form ngưỡng của rule nhập dở ở tab A, nhập T=40 nhưng chưa lưu; xóa rule đó ở tab B rồi gửi lưu tab A. Reload danh sách và đọc trạng thái rule.<br>3. Chạy xét lại thành công; đọc identity rule/ngưỡng đã dùng và trích xuất S01 một lượt tắt lọc, một lượt bật lọc đỏ. Ghi kết quả riêng cho hai biến thể. |
| Expected | 1. `incomplete-row`: dòng hiển thị chưa có ngưỡng, có link mở thiết lập ngưỡng và câu báo không dùng để xét. Bộ xét chọn rule đối chứng T=20, S01=29 Không đỏ; không tạo ngưỡng 0 ngầm.<br>2. `incomplete-deleted-stale`: dòng đã xóa không xuất hiện lại; gửi T=40 từ form cũ không phục hồi rule trong bộ xét. Sau lần xét lại, identity rule đối chứng và T=20 giữ đúng, S01=29 **Không đỏ**. Lượt tắt lọc hiện 29 không dấu đỏ; lượt bật lọc không có S01. Nếu rule 40 bị phục hồi thì 29&lt;40 sẽ Đỏ và biến thể phải FAIL.<br>3. Schema/enum là cách hiện thực đề xuất. Nếu chưa xác minh được form cũ, đường chạy xét hoặc reader rule/ngưỡng thì giữ biến thể BLOCKED, không suy PASS chỉ từ danh sách. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| incomplete-row | Nhánh incomplete-row trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. `incomplete-row`: dòng hiển thị chưa có ngưỡng, có link mở thiết lập ngưỡng và câu báo không dùng để xét. Bộ xét chọn rule đối chứng T=20, S01=29 Không đỏ; không tạo ngưỡng 0 ngầm.<br>2. `incomplete-deleted-stale`: dòng đã xóa không xuất hiện lại; gửi T=40 từ form cũ không phục hồi rule trong bộ xét. Sau lần xét lại, identity rule đối chứng và T=20 giữ đúng, S01=29 **Không đỏ**. Lượt tắt lọc hiện 29 không dấu đỏ; lượt bật lọc không có S01. Nếu rule 40 bị phục hồi thì 29&lt;40 sẽ Đỏ và biến thể phải FAIL.<br>3. Schema/enum là cách hiện thực đề xuất. Nếu chưa xác minh được form cũ, đường chạy xét hoặc reader rule/ngưỡng thì giữ biến thể BLOCKED, không suy PASS chỉ từ danh sách. |
| incomplete-deleted-stale | Nhánh incomplete-deleted-stale trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. `incomplete-row`: dòng hiển thị chưa có ngưỡng, có link mở thiết lập ngưỡng và câu báo không dùng để xét. Bộ xét chọn rule đối chứng T=20, S01=29 Không đỏ; không tạo ngưỡng 0 ngầm.<br>2. `incomplete-deleted-stale`: dòng đã xóa không xuất hiện lại; gửi T=40 từ form cũ không phục hồi rule trong bộ xét. Sau lần xét lại, identity rule đối chứng và T=20 giữ đúng, S01=29 **Không đỏ**. Lượt tắt lọc hiện 29 không dấu đỏ; lượt bật lọc không có S01. Nếu rule 40 bị phục hồi thì 29&lt;40 sẽ Đỏ và biến thể phải FAIL.<br>3. Schema/enum là cách hiện thực đề xuất. Nếu chưa xác minh được form cũ, đường chạy xét hoặc reader rule/ngưỡng thì giữ biến thể BLOCKED, không suy PASS chỉ từ danh sách. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Mục chưa có rule mới nhưng có giá trị legacy và kết quả legacy đã lưu. |
| Thao tác | 1. Mở danh sách rule đỏ trống.<br>2. Chạy xét hoặc mở đầu ra. |
| Expected | Danh sách không tự tạo rule/default từ ngưỡng legacy. Giá trị và kết quả legacy giữ nguyên; không dùng legacy làm rule fallback. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Danh sách không tự tạo rule/default từ ngưỡng legacy. Giá trị và kết quả legacy giữ nguyên; không dùng legacy làm rule fallback. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: các lớp học phần G-A, G-B, G-C, quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao) |
| Thao tác | 1. Mở Điều kiện áp dụng của một quy tắc mới.<br>2. Chọn Toàn bộ đối tượng（全員が対象）, lưu, mở lại.<br>3. Chọn Giới hạn bằng bộ lọc（特定条件で絞り込む）, bấm Thêm điều kiện lọc（絞り込み条件を追加）, liệt kê các loại lọc có trong danh sách.<br>4. Cấu hình như quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao), lưu, mở lại. |
| Expected | 1. Hai lựa chọn đối tượng lưu và mở lại đúng.<br>2. Có các bộ lọc Môn/phân môn（教科・科目）, Khối（学年）, lớp/nhóm và các điều kiện lựa chọn đang được hỗ trợ (đặc tả v2 mục 5.1 “Đối tượng áp dụng”). Danh sách đề xuất (PROPOSED, thiết kế DB v2 mục 3.2 “`apply_condition`”): khối (`hr_grade`), môn (`subject`), phân môn (`sub_subject`), lớp học phần (`group`), lớp chủ nhiệm (`homeroom`), nhóm tổng hợp (`calc_group`), mã lựa chọn của mục (`choice`).<br>3. Không có trình soạn AND/OR lồng nhau. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| all | Toàn bộ đối tượng | 1. Hai lựa chọn đối tượng lưu và mở lại đúng.<br>2. Có các bộ lọc Môn/phân môn（教科・科目）, Khối（学年）, lớp/nhóm và các điều kiện lựa chọn đang được hỗ trợ (đặc tả v2 mục 5.1 “Đối tượng áp dụng”). Danh sách đề xuất (PROPOSED, thiết kế DB v2 mục 3.2 “`apply_condition`”): khối (`hr_grade`), môn (`subject`), phân môn (`sub_subject`), lớp học phần (`group`), lớp chủ nhiệm (`homeroom`), nhóm tổng hợp (`calc_group`), mã lựa chọn của mục (`choice`).<br>3. Không có trình soạn AND/OR lồng nhau. |
| filter | Giới hạn bằng bộ lọc | 1. Hai lựa chọn đối tượng lưu và mở lại đúng.<br>2. Có các bộ lọc Môn/phân môn（教科・科目）, Khối（学年）, lớp/nhóm và các điều kiện lựa chọn đang được hỗ trợ (đặc tả v2 mục 5.1 “Đối tượng áp dụng”). Danh sách đề xuất (PROPOSED, thiết kế DB v2 mục 3.2 “`apply_condition`”): khối (`hr_grade`), môn (`subject`), phân môn (`sub_subject`), lớp học phần (`group`), lớp chủ nhiệm (`homeroom`), nhóm tổng hợp (`calc_group`), mã lựa chọn của mục (`choice`).<br>3. Không có trình soạn AND/OR lồng nhau. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cặp quy tắc phân nhánh theo trung bình 60, bản tổng hợp mới nhất chưa chốt (trung bình 62) |
| Thao tác | 1. Tạo quy tắc "Trung bình dưới 60": thêm bộ lọc Môn（教科・科目）= Toán（数学） và điều kiện Trung bình（平均点）.<br>2. Chọn Thời kỳ tổng hợp（集計対象時期）= 1学期期末 (cuối kỳ học kỳ 1), Thiết lập tổng hợp thứ hạng（順位集計設定）= 評点集計 (tổng hợp điểm đánh giá), Nhóm học sinh được tổng hợp — 集計対象（母集団）= ホームルーム (lớp chủ nhiệm; file Figma cũ ghi HR毎).<br>3. Nhập mốc 60, dấu Nhỏ hơn（未満）, lưu.<br>4. Tạo quy tắc thứ hai với mốc 60, dấu Từ mức này trở lên（以上）.<br>5. Mở lại cả hai. |
| Expected | 1. Cả hai quy tắc lưu được, là hai dòng riêng trong danh sách (không phải một form hai nhánh).<br>2. Mở lại giữ đủ bộ nguồn, mốc, dấu.<br>3. Không có lựa chọn Kết quả tổng hợp dùng để tham chiếu（参照する集計結果） (đặc tả v2 mục 3 “Bản đồ màn hình và luồng thao tác”, mục 5.5 “Chọn bản nguồn”). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| below60 | Điều kiện dưới 60 | 1. Cả hai quy tắc lưu được, là hai dòng riêng trong danh sách (không phải một form hai nhánh).<br>2. Mở lại giữ đủ bộ nguồn, mốc, dấu.<br>3. Không có lựa chọn Kết quả tổng hợp dùng để tham chiếu（参照する集計結果） (đặc tả v2 mục 3 “Bản đồ màn hình và luồng thao tác”, mục 5.5 “Chọn bản nguồn”). |
| from60 | Điều kiện từ 60 | 1. Cả hai quy tắc lưu được, là hai dòng riêng trong danh sách (không phải một form hai nhánh).<br>2. Mở lại giữ đủ bộ nguồn, mốc, dấu.<br>3. Không có lựa chọn Kết quả tổng hợp dùng để tham chiếu（参照する集計結果） (đặc tả v2 mục 3 “Bản đồ màn hình và luồng thao tác”, mục 5.5 “Chọn bản nguồn”). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc theo tỷ lệ điểm của nhóm từ 65% |
| Thao tác | 1. Tạo quy tắc với điều kiện Tỷ lệ điểm của nhóm（集団の得点率）, nguồn mặc định, mốc 65, dấu Từ mức này trở lên（以上）.<br>2. Lưu, mở lại. |
| Expected | Lưu và mở lại đúng loại điều kiện, nguồn, mốc 65 và dấu. Không có tùy chọn chọn cách tính A/B. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Lưu và mở lại đúng loại điều kiện, nguồn, mốc 65 và dấu. Không có tùy chọn chọn cách tính A/B. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao) |
| Thao tác | 1. Đăng ký điểm 20 cho P1–P4.<br>2. Xem kết quả. |
| Expected | P1, P2: Đỏ. P3, P4: Không áp dụng. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | P1, P2: Đỏ. P3, P4: Không áp dụng. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: (A) điều kiện cùng nguồn `A≥50` AND `A&lt;70`; mỗi P9–P16 là một lượt độc lập, reset/configure nguồn theo đúng fixture TD-SRC-17…24, không dùng chung một snapshot cho các giá trị khác nhau. (R) dùng snapshot TD-SRC-11/12/13; (A+R) dùng identity/snapshot riêng TD-SRC-14/15/16. Đây là fixture cần provision/quan sát, chưa phải dữ liệu đã có. (Bộ lọc) TD-GRP-04 có ba identity với reader/snapshot riêng nhưng cùng `A=60`, `R=60%`, `S=60`, rule `A≥50 AND R≥50%`, `T=70`, dấu `&lt;`; positive khớp khối 1 và Nâng cao, hai negative chỉ sai khối hoặc chỉ sai nhóm. Phải ghi identity và giá trị reader từng lượt, không thay A/R khi đổi bộ lọc. Trạng thái dùng riêng TD-SRC-26…29: P17 có A=NaN, P19 có A=Infinity, P18-A-EMPTY có A thiếu/null và S=25, P18-S-EMPTY có A=60 và S không có điểm. P17/P18-A/P19 dùng rule ưu tiên thấp hơn `T=30`, `S=25` để phát hiện fallback. Không gộp thiếu A với thiếu điểm S và không tái sử dụng fixture giữa các lượt. |
| Thao tác | 1. Lưu rule A+A. Với từng variant A-P9…A-P16, reset fixture, chọn đúng TD-SRC tương ứng, ghi identity nhóm/snapshot và xác nhận reader trả đúng A trước khi xét.<br>2. Lưu và chạy riêng RR-60/RR-49.9/RR-70 theo TD-SRC-11…13 và AR-60-60/AR-40-60/AR-60-40 theo TD-SRC-14…16; không dùng snapshot của variant trước.<br>3. Chạy riêng FILTER-POS, FILTER-GRADE-NEG và FILTER-GROUP-NEG với TD-GRP-04; mỗi lượt chỉ một predicate lọc âm tính.<br>4. Chạy P17-A-NAN, P19-A-INFINITY, P18-A-EMPTY và P18-S-EMPTY trên TD-SRC-26…29/fixture nguồn riêng; ghi trạng thái reader và kiểm tra không fallback.<br>5. Mở lại từng rule và kiểm tra các điều kiện vẫn thuộc cùng rule, đúng source và không bị đổi thành OR. |
| Expected | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| A-P9 | Nhánh A-P9 trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| A-P10 | Nhánh A-P10 trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| A-P11 | Nhánh A-P11 trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| A-P12 | Nhánh A-P12 trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| A-P13 | Nhánh A-P13 trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| A-P14 | Nhánh A-P14 trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| A-P15 | Nhánh A-P15 trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| A-P16 | Nhánh A-P16 trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| RR-60 | Nhánh RR-60 trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| RR-49.9 | Nhánh RR-49.9 trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| RR-70 | Nhánh RR-70 trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| AR-60-60 | Nhánh AR-60-60 trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| AR-40-60 | Nhánh AR-40-60 trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| AR-60-40 | Nhánh AR-60-40 trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| FILTER-POS | Nhánh FILTER-POS trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| FILTER-GRADE-NEG | Nhánh FILTER-GRADE-NEG trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| FILTER-GROUP-NEG | Nhánh FILTER-GROUP-NEG trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| P17-A-NAN | Nhánh P17-A-NAN trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| P19-A-INFINITY | Nhánh P19-A-INFINITY trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| P18-A-EMPTY | Nhánh P18-A-EMPTY trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| P18-S-EMPTY | Nhánh P18-S-EMPTY trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |
| reopen-summary | Bước 5 sau từng cấu hình ở bước 1–4, giữ source và phép AND khi mở lại; positive A+A đã nằm ở A-P10/P11/P14/P15, không tạo lượt AA-POS không có fixture riêng | 1. Biến thể A: P9/P12/P13/P16 không thỏa; P10/P11/P14/P15 thỏa `50≤A&lt;70`; với `T=70`, chỉ học sinh positive có `S=60` bị Đỏ. Mỗi kết quả chỉ hợp lệ khi source identity/reader evidence khớp TD-SRC tương ứng.<br>2. Biến thể R: `R=60%` → thỏa, P1 Đỏ; `R=49.9%` và `R=70%` → Không áp dụng; không tự tính lại R nếu chưa có source fixture quan sát được.<br>3. Biến thể A+R: `A=60,R=60%` → thỏa, P1 Đỏ; `A=40,R=60%` và `A=60,R=40%` → Không áp dụng. P1 chỉ được xét khi **cả** điều kiện đúng.<br>4. Với cả ba lượt đã xác nhận reader `A=60`, `R=60%`, `S=60`: FILTER-POS khớp tất cả điều kiện nên Đỏ (`60&lt;70`); FILTER-GRADE-NEG chỉ sai khối và FILTER-GROUP-NEG chỉ sai nhóm nên đều Không áp dụng, không có dấu đỏ. OR chỉ áp dụng trong cùng loại (Khối 1 hoặc 2); nhóm Nâng cao là điều kiện loại khác nên phải AND.<br>5. P17-A-NAN, P19-A-INFINITY và P18-A-EMPTY đều Chưa xét được, không xuống rule thấp hơn dù `S=25&lt;T=30`, và không giữ kết quả đỏ cũ. P18-S-EMPTY có A hợp lệ nhưng điểm học sinh trống nên Không có điểm. Bằng chứng phải cho thấy source A, S và trạng thái kết quả riêng; không thay Chưa xét được bằng Không áp dụng. Không diễn giải A+R thành OR, không ghép hai rule riêng bằng AND. Nếu không dựng được giá trị qua reader/UI, biến thể tương ứng BLOCKED/NEEDS_EVIDENCE nhưng giữ oracle trên. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100), mục số thập phân (M=100); quy tắc “Cố định 30” (dưới 30), trường B (trường khác), học sinh S09 (mục số thập phân 29.5) |
| Thao tác | 1. Chạy xét hàng loạt cho trường A.<br>2. Xem kết quả S09 ở mục số thập phân (M=100) và dữ liệu trường B. |
| Expected | Chỉ ô của mục số nguyên (M=100) trong trường A năm 2026 được xét. S09 ở mục số thập phân (M=100) và học sinh trường B không bị ảnh hưởng. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Chỉ ô của mục số nguyên (M=100) trong trường A năm 2026 được xét. S09 ở mục số thập phân (M=100) và học sinh trường B không bị ảnh hưởng. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); mục kiểu lựa chọn A/B/C, quy tắc “Cố định 30” (dưới 30) |
| Thao tác | 1. Tạo quy tắc cho mục số nguyên (M=100) với bộ lọc theo lựa chọn（選択肢型） mục kiểu lựa chọn A/B/C = B, cố định 30 `&lt;`.<br>2. Đăng ký S01=29, S02=29. |
| Expected | S01 Đỏ (thuộc đối tượng); S02 Không áp dụng. Không có ô nào của mục kiểu lựa chọn A/B/C được xét đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | S01 Đỏ (thuộc đối tượng); S02 Không áp dụng. Không có ô nào của mục kiểu lựa chọn A/B/C được xét đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc lọc theo nhóm tổng hợp thuộc hai loại nhóm; S = 20 cho P5–P8 |
| Thao tác | 1. Đăng ký điểm 20 cho P5–P8.<br>2. Xem kết quả.<br>3. Mở lại quy tắc. |
| Expected | 1–2. Chỉ P7 thỏa cả hai loại nhóm và được xét → Đỏ. P5, P6, P8: Không áp dụng.<br><br>3. Mỗi giá trị vẫn gắn đúng loại nhóm của nó. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1–2. Chỉ P7 thỏa cả hai loại nhóm và được xét → Đỏ. P5, P6, P8: Không áp dụng.<br><br>3. Mỗi giá trị vẫn gắn đúng loại nhóm của nó. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Giới hạn bằng bộ lọc（特定条件で絞り込む）, không chọn giá trị |
| Thao tác | Chọn giới hạn bằng bộ lọc, không chọn điều kiện, Lưu. |
| Expected | Không lưu được; có thông báo lỗi. Câu chữ thông báo không phải must-pass (Figma chưa có). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Không lưu được; có thông báo lỗi. Câu chữ thông báo không phải must-pass (Figma chưa có). |

#### TC-RS-VAL-022 — Giá trị điều kiện phân nhánh (trung bình/tỷ lệ nhóm)

| Field | Value |
| --- | --- |
| Chức năng | Điều kiện áp dụng（適用条件） |
| screen_relative_path | unknown |
| Căn cứ | đặc tả v2 mục 5.2 “Điều kiện dựa trên trung bình”; trạng thái nguồn PROPOSED; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Proposed |
| Readiness | Draft |
| Gap | G-PREP-UNASSESSED |
| Cấu hình | Màn thêm quy tắc có điều kiện. |
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Trung bình: trống, −1, 101, 60.5, 60.123456789; tỷ lệ nhóm: −1, 0, 100, 101 |
| Thao tác | Nhập từng giá trị, Lưu. |
| Expected | Đề xuất (thiết kế DB v2): trống → không lưu được (điều kiện chưa đủ); 60.5 lưu được; 60.123456789 (9 chữ số lẻ) bị từ chối; tỷ lệ nhóm 0 và 100 lưu được, −1 và 101 bị từ chối. Trung bình −1 và 101: thiết kế DB v2 không nêu miền — TBD, ghi hành vi thực tế. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| avg-empty | Trung bình trống | Đề xuất (thiết kế DB v2): trống → không lưu được (điều kiện chưa đủ); 60.5 lưu được; 60.123456789 (9 chữ số lẻ) bị từ chối; tỷ lệ nhóm 0 và 100 lưu được, −1 và 101 bị từ chối. Trung bình −1 và 101: thiết kế DB v2 không nêu miền — TBD, ghi hành vi thực tế. |
| avg-negative | Trung bình -1 | Đề xuất (thiết kế DB v2): trống → không lưu được (điều kiện chưa đủ); 60.5 lưu được; 60.123456789 (9 chữ số lẻ) bị từ chối; tỷ lệ nhóm 0 và 100 lưu được, −1 và 101 bị từ chối. Trung bình −1 và 101: thiết kế DB v2 không nêu miền — TBD, ghi hành vi thực tế. |
| avg101 | Trung bình 101 | Đề xuất (thiết kế DB v2): trống → không lưu được (điều kiện chưa đủ); 60.5 lưu được; 60.123456789 (9 chữ số lẻ) bị từ chối; tỷ lệ nhóm 0 và 100 lưu được, −1 và 101 bị từ chối. Trung bình −1 và 101: thiết kế DB v2 không nêu miền — TBD, ghi hành vi thực tế. |
| avg605 | Trung bình 60.5 | Đề xuất (thiết kế DB v2): trống → không lưu được (điều kiện chưa đủ); 60.5 lưu được; 60.123456789 (9 chữ số lẻ) bị từ chối; tỷ lệ nhóm 0 và 100 lưu được, −1 và 101 bị từ chối. Trung bình −1 và 101: thiết kế DB v2 không nêu miền — TBD, ghi hành vi thực tế. |
| avg-long | Trung bình 60.123456789 | Đề xuất (thiết kế DB v2): trống → không lưu được (điều kiện chưa đủ); 60.5 lưu được; 60.123456789 (9 chữ số lẻ) bị từ chối; tỷ lệ nhóm 0 và 100 lưu được, −1 và 101 bị từ chối. Trung bình −1 và 101: thiết kế DB v2 không nêu miền — TBD, ghi hành vi thực tế. |
| ratio-negative | Tỷ lệ -1 | Đề xuất (thiết kế DB v2): trống → không lưu được (điều kiện chưa đủ); 60.5 lưu được; 60.123456789 (9 chữ số lẻ) bị từ chối; tỷ lệ nhóm 0 và 100 lưu được, −1 và 101 bị từ chối. Trung bình −1 và 101: thiết kế DB v2 không nêu miền — TBD, ghi hành vi thực tế. |
| ratio0 | Tỷ lệ 0 | Đề xuất (thiết kế DB v2): trống → không lưu được (điều kiện chưa đủ); 60.5 lưu được; 60.123456789 (9 chữ số lẻ) bị từ chối; tỷ lệ nhóm 0 và 100 lưu được, −1 và 101 bị từ chối. Trung bình −1 và 101: thiết kế DB v2 không nêu miền — TBD, ghi hành vi thực tế. |
| ratio100 | Tỷ lệ 100 | Đề xuất (thiết kế DB v2): trống → không lưu được (điều kiện chưa đủ); 60.5 lưu được; 60.123456789 (9 chữ số lẻ) bị từ chối; tỷ lệ nhóm 0 và 100 lưu được, −1 và 101 bị từ chối. Trung bình −1 và 101: thiết kế DB v2 không nêu miền — TBD, ghi hành vi thực tế. |
| ratio101 | Tỷ lệ 101 | Đề xuất (thiết kế DB v2): trống → không lưu được (điều kiện chưa đủ); 60.5 lưu được; 60.123456789 (9 chữ số lẻ) bị từ chối; tỷ lệ nhóm 0 và 100 lưu được, −1 và 101 bị từ chối. Trung bình −1 và 101: thiết kế DB v2 không nêu miền — TBD, ghi hành vi thực tế. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100) |
| Thao tác | 1. Đối chiếu bố cục và đọc nguyên văn hướng dẫn điều kiện.<br>2. Chọn Toàn bộ đối tượng（全員が対象）.<br>3. Chọn Giới hạn bằng bộ lọc（特定条件で絞り込む）, thêm hai điều kiện cùng loại và hai điều kiện khác loại. |
| Expected | 1. Có các phần tử như Source.<br>2. Không hiện vùng Điều kiện lọc（絞り込み条件）.<br>3. Hiện vùng lọc, thêm được điều kiện và câu 「※同じ種類の条件はいずれか1つ、種類が違う条件はすべて満たす生徒が対象となります。」 (cùng loại chỉ cần thỏa một điều kiện, khác loại phải thỏa tất cả). Hướng dẫn phải phân biệt OR trong cùng loại bộ lọc với AND giữa các loại điều kiện; không dùng câu này để thay thế phép AND giữa các điều kiện nguồn A/R trong cùng rule. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. Có các phần tử như Source.<br>2. Không hiện vùng Điều kiện lọc（絞り込み条件）.<br>3. Hiện vùng lọc, thêm được điều kiện và câu 「※同じ種類の条件はいずれか1つ、種類が違う条件はすべて満たす生徒が対象となります。」 (cùng loại chỉ cần thỏa một điều kiện, khác loại phải thỏa tất cả). Hướng dẫn phải phân biệt OR trong cùng loại bộ lọc với AND giữa các loại điều kiện; không dùng câu này để thay thế phép AND giữa các điều kiện nguồn A/R trong cùng rule. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | Thêm điều kiện Trung bình（平均点）, xem các ô. |
| Expected | CONFIRMED: có ba ô nguồn (thời kỳ, thiết lập tổng hợp thứ hạng, nhóm tham chiếu); **không** có ô chọn kết quả tổng hợp cụ thể/bản chốt.<br><br>PROPOSED: câu mục tham chiếu, bố cục ô mốc + đơn vị 点 (điểm) + dấu. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | CONFIRMED: có ba ô nguồn (thời kỳ, thiết lập tổng hợp thứ hạng, nhóm tham chiếu); **không** có ô chọn kết quả tổng hợp cụ thể/bản chốt.<br><br>PROPOSED: câu mục tham chiếu, bố cục ô mốc + đơn vị 点 (điểm) + dấu. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | Thêm điều kiện Tỷ lệ điểm của nhóm（集団の得点率）. |
| Expected | Có ba ô nguồn như UI-009, ô mốc với đơn vị %, dấu so sánh. Không có tùy chọn cách tính A/B (Q&amp;A nghiệp vụ đã xác nhận câu “Tỷ lệ nhóm có cần xử lý riêng khi các lớp khác điểm tối đa không?” — CONFIRMED). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Có ba ô nguồn như UI-009, ô mốc với đơn vị %, dấu so sánh. Không có tùy chọn cách tính A/B (Q&amp;A nghiệp vụ đã xác nhận câu “Tỷ lệ nhóm có cần xử lý riêng khi các lớp khác điểm tối đa không?” — CONFIRMED). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | 1. Chọn Điểm cố định（固定点数）.<br>2. Chọn Tỷ lệ điểm tối đa（得点率）.<br>3. Chọn Công thức（計算式）. |
| Expected | 1. Cố định: có ô ngưỡng và dấu so sánh; không có vùng nguồn trung bình, không có xử lý phần lẻ.<br>2. Tỷ lệ: có ô %, xử lý phần lẻ, dấu so sánh; không có vùng nguồn trung bình.<br>3. Công thức: có vùng nguồn trung bình, bảng dòng công thức, dấu so sánh. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| fixed | Chọn cố định | 1. Cố định: có ô ngưỡng và dấu so sánh; không có vùng nguồn trung bình, không có xử lý phần lẻ.<br>2. Tỷ lệ: có ô %, xử lý phần lẻ, dấu so sánh; không có vùng nguồn trung bình.<br>3. Công thức: có vùng nguồn trung bình, bảng dòng công thức, dấu so sánh. |
| ratio | Chọn tỷ lệ | 1. Cố định: có ô ngưỡng và dấu so sánh; không có vùng nguồn trung bình, không có xử lý phần lẻ.<br>2. Tỷ lệ: có ô %, xử lý phần lẻ, dấu so sánh; không có vùng nguồn trung bình.<br>3. Công thức: có vùng nguồn trung bình, bảng dòng công thức, dấu so sánh. |
| formula | Chọn công thức | 1. Cố định: có ô ngưỡng và dấu so sánh; không có vùng nguồn trung bình, không có xử lý phần lẻ.<br>2. Tỷ lệ: có ô %, xử lý phần lẻ, dấu so sánh; không có vùng nguồn trung bình.<br>3. Công thức: có vùng nguồn trung bình, bảng dòng công thức, dấu so sánh. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30), quy tắc cố định 30 với Nhỏ hơn hoặc bằng（以下） |
| Thao tác | 1. Đổi dấu của quy tắc “Cố định 30” (dưới 30) sang Nhỏ hơn hoặc bằng（以下）, lưu, mở lại.<br>2. Đổi lại Nhỏ hơn（未満）, lưu, mở lại. |
| Expected | Dấu đã chọn được lưu, hiển thị đúng ở form và tóm tắt danh sách. Tác động lên kết quả: case “Ngưỡng cố định 30: S = 29 / 30 / 31 với `&lt;` và `≤`”. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| lt | Dấu nhỏ hơn | Dấu đã chọn được lưu, hiển thị đúng ở form và tóm tắt danh sách. Tác động lên kết quả: case “Ngưỡng cố định 30: S = 29 / 30 / 31 với `&lt;` và `≤`”. |
| le | Dấu nhỏ hơn hoặc bằng | Dấu đã chọn được lưu, hiển thị đúng ở form và tóm tắt danh sách. Tác động lên kết quả: case “Ngưỡng cố định 30: S = 29 / 30 / 31 với `&lt;` và `≤`”. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); N = −1, 0, 100, 101 |
| Thao tác | Lần lượt nhập Điểm cố định（固定点数）= −1, 0, 100, 101 và bấm Cập nhật（更新する）. |
| Expected | −1: không lưu được, có lỗi. 0: lưu được. 100: lưu được. 101: không lưu được, có lỗi vượt M. Khi lỗi, cấu hình đã lưu trước đó không đổi. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| negative | N=-1 | −1: không lưu được, có lỗi. 0: lưu được. 100: lưu được. 101: không lưu được, có lỗi vượt M. Khi lỗi, cấu hình đã lưu trước đó không đổi. |
| zero | N=0 | −1: không lưu được, có lỗi. 0: lưu được. 100: lưu được. 101: không lưu được, có lỗi vượt M. Khi lỗi, cấu hình đã lưu trước đó không đổi. |
| maximum | N=100 | −1: không lưu được, có lỗi. 0: lưu được. 100: lưu được. 101: không lưu được, có lỗi vượt M. Khi lỗi, cấu hình đã lưu trước đó không đổi. |
| above | N=101 | −1: không lưu được, có lỗi. 0: lưu được. 100: lưu được. 101: không lưu được, có lỗi vượt M. Khi lỗi, cấu hình đã lưu trước đó không đổi. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục có M khác nhau theo lớp (G-A M=20, G-B M=100); N = 30, 20 |
| Thao tác | 1. Toàn bộ đối tượng, N=30, Lưu.<br>2. Toàn bộ đối tượng, N=20, Lưu.<br>3. Lọc chỉ lớp G-B, N=30, Lưu. |
| Expected | 1. Không lưu được (G-A M=20).<br>2. Lưu được.<br>3. Lưu được. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| all30 | Toàn bộ N=30 | 1. Không lưu được (G-A M=20).<br>2. Lưu được.<br>3. Lưu được. |
| all20 | Toàn bộ N=20 | 1. Không lưu được (G-A M=20).<br>2. Lưu được.<br>3. Lưu được. |
| gb30 | Chỉ G-B N=30 | 1. Không lưu được (G-A M=20).<br>2. Lưu được.<br>3. Lưu được. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục có M khác nhau theo lớp (G-A M=20, G-B M=100) |
| Thao tác | Sửa bộ lọc thành G-A hoặc G-B (giữ N=30), bấm Lưu. |
| Expected | Không lưu được vì G-A có M=20; cấu hình cũ (chỉ G-B) giữ nguyên. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Không lưu được vì G-A có M=20; cấu hình cũ (chỉ G-B) giữ nguyên. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); Giá trị: trống, `abc`, `3O` (chữ O), `３０` (số toàn khổ) |
| Thao tác | Với loại Điểm cố định（固定点数） rồi Tỷ lệ điểm tối đa（得点率）: nhập từng giá trị, bấm Lưu. |
| Expected | Trống, `abc`, `3O`: không lưu được, có lỗi. `３０`: xử lý theo quy ước nhập số hiện hành của BLEND (TBD — có thể chuẩn hóa thành 30 hoặc báo lỗi). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| fixed-empty | Cố định với trống | Trống, `abc`, `3O`: không lưu được, có lỗi. `３０`: xử lý theo quy ước nhập số hiện hành của BLEND (TBD — có thể chuẩn hóa thành 30 hoặc báo lỗi). |
| fixed-abc | Cố định với abc | Trống, `abc`, `3O`: không lưu được, có lỗi. `３０`: xử lý theo quy ước nhập số hiện hành của BLEND (TBD — có thể chuẩn hóa thành 30 hoặc báo lỗi). |
| fixed-3O | Cố định với 3O | Trống, `abc`, `3O`: không lưu được, có lỗi. `３０`: xử lý theo quy ước nhập số hiện hành của BLEND (TBD — có thể chuẩn hóa thành 30 hoặc báo lỗi). |
| fixed-fullwidth | Cố định với chữ số toàn chiều rộng, phần TBD giữ BLOCKED | Trống, `abc`, `3O`: không lưu được, có lỗi. `３０`: xử lý theo quy ước nhập số hiện hành của BLEND (TBD — có thể chuẩn hóa thành 30 hoặc báo lỗi). |
| ratio-empty | Tỷ lệ với trống | Trống, `abc`, `3O`: không lưu được, có lỗi. `３０`: xử lý theo quy ước nhập số hiện hành của BLEND (TBD — có thể chuẩn hóa thành 30 hoặc báo lỗi). |
| ratio-abc | Tỷ lệ với abc | Trống, `abc`, `3O`: không lưu được, có lỗi. `３０`: xử lý theo quy ước nhập số hiện hành của BLEND (TBD — có thể chuẩn hóa thành 30 hoặc báo lỗi). |
| ratio-3O | Tỷ lệ với 3O | Trống, `abc`, `3O`: không lưu được, có lỗi. `３０`: xử lý theo quy ước nhập số hiện hành của BLEND (TBD — có thể chuẩn hóa thành 30 hoặc báo lỗi). |
| ratio-fullwidth | Tỷ lệ với chữ số toàn chiều rộng, phần TBD giữ BLOCKED | Trống, `abc`, `3O`: không lưu được, có lỗi. `３０`: xử lý theo quy ước nhập số hiện hành của BLEND (TBD — có thể chuẩn hóa thành 30 hoặc báo lỗi). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100); N = 29.5, 29.55, 29.555, 29.5555 |
| Thao tác | Nhập từng giá trị, Lưu, mở lại. |
| Expected | Đề xuất (thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ”): 29.5, 29.55, 29.555 lưu và mở lại đúng; 29.5555 bị từ chối, không tự cắt/làm tròn. Tối thiểu (CONFIRMED, đặc tả v2 mục 6.8 “Yêu cầu độ chính xác”): không được âm thầm làm tròn/cắt giá trị mà không báo. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| d1 | 29.5 | Đề xuất (thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ”): 29.5, 29.55, 29.555 lưu và mở lại đúng; 29.5555 bị từ chối, không tự cắt/làm tròn. Tối thiểu (CONFIRMED, đặc tả v2 mục 6.8 “Yêu cầu độ chính xác”): không được âm thầm làm tròn/cắt giá trị mà không báo. |
| d2 | 29.55 | Đề xuất (thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ”): 29.5, 29.55, 29.555 lưu và mở lại đúng; 29.5555 bị từ chối, không tự cắt/làm tròn. Tối thiểu (CONFIRMED, đặc tả v2 mục 6.8 “Yêu cầu độ chính xác”): không được âm thầm làm tròn/cắt giá trị mà không báo. |
| d3 | 29.555 | Đề xuất (thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ”): 29.5, 29.55, 29.555 lưu và mở lại đúng; 29.5555 bị từ chối, không tự cắt/làm tròn. Tối thiểu (CONFIRMED, đặc tả v2 mục 6.8 “Yêu cầu độ chính xác”): không được âm thầm làm tròn/cắt giá trị mà không báo. |
| d4 | 29.5555 | Đề xuất (thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ”): 29.5, 29.55, 29.555 lưu và mở lại đúng; 29.5555 bị từ chối, không tự cắt/làm tròn. Tối thiểu (CONFIRMED, đặc tả v2 mục 6.8 “Yêu cầu độ chính xác”): không được âm thầm làm tròn/cắt giá trị mà không báo. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), quy tắc cố định 30 với Nhỏ hơn hoặc bằng（以下）, học sinh S01 (điểm 29), học sinh S02 (điểm 30), học sinh S03 (điểm 31) |
| Thao tác | 1. Chỉ có quy tắc “Cố định 30” (dưới 30) (`T=30`, `&lt;`): đăng ký S01=29, S02=30, S03=31.<br>2. Đổi thành quy tắc cố định 30 với Nhỏ hơn hoặc bằng（以下） (`≤`), chạy lại. |
| Expected | Bước 1: 29 Đỏ; 30 Không đỏ; 31 Không đỏ.<br><br>Bước 2: 29 Đỏ; 30 Đỏ; 31 Không đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| lt | Ngưỡng 30, dấu nhỏ hơn, cả ba điểm | Bước 1: 29 Đỏ; 30 Không đỏ; 31 Không đỏ.<br><br>Bước 2: 29 Đỏ; 30 Đỏ; 31 Không đỏ. |
| le | Ngưỡng 30, dấu nhỏ hơn hoặc bằng, cả ba điểm | Bước 1: 29 Đỏ; 30 Không đỏ; 31 Không đỏ.<br><br>Bước 2: 29 Đỏ; 30 Đỏ; 31 Không đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); học sinh S04 (điểm 0) (S=0); N = 0, 30 |
| Thao tác | Với từng cấu hình: cố định 0 `&lt;`, cố định 0 `≤`, cố định 30 `&lt;`: chạy lại, xem S04. |
| Expected | 0 `&lt;`: `0&lt;0` sai → Không đỏ.<br><br>0 `≤`: `0≤0` → Đỏ.<br><br>30 `&lt;`: `0&lt;30` → Đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| zero-lt | Ngưỡng 0 nhỏ hơn | 0 `&lt;`: `0&lt;0` sai → Không đỏ.<br><br>0 `≤`: `0≤0` → Đỏ.<br><br>30 `&lt;`: `0&lt;30` → Đỏ. |
| zero-le | Ngưỡng 0 nhỏ hơn hoặc bằng | 0 `&lt;`: `0&lt;0` sai → Không đỏ.<br><br>0 `≤`: `0≤0` → Đỏ.<br><br>30 `&lt;`: `0&lt;30` → Đỏ. |
| thirty-lt | Ngưỡng 30 nhỏ hơn | 0 `&lt;`: `0&lt;0` sai → Không đỏ.<br><br>0 `≤`: `0≤0` → Đỏ.<br><br>30 `&lt;`: `0&lt;30` → Đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100); S = 29.5, 29.9, 30.0, 30.01 |
| Thao tác | Đăng ký bốn học sinh với các điểm trên; xét với `&lt;` rồi `≤`. |
| Expected | `&lt;`: 29.5 Đỏ; 29.9 Đỏ; 30.0 Không đỏ; 30.01 Không đỏ.<br><br>`≤`: 29.5 Đỏ; 29.9 Đỏ; 30.0 Đỏ; 30.01 Không đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| lt | Dấu nhỏ hơn, cả bốn điểm | `&lt;`: 29.5 Đỏ; 29.9 Đỏ; 30.0 Không đỏ; 30.01 Không đỏ.<br><br>`≤`: 29.5 Đỏ; 29.9 Đỏ; 30.0 Đỏ; 30.01 Không đỏ. |
| le | Dấu nhỏ hơn hoặc bằng, cả bốn điểm | `&lt;`: 29.5 Đỏ; 29.9 Đỏ; 30.0 Không đỏ; 30.01 Không đỏ.<br><br>`≤`: 29.5 Đỏ; 29.9 Đỏ; 30.0 Đỏ; 30.01 Không đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30); S = 15, 20 |
| Thao tác | 1. Đăng ký hai học sinh S=15 và S=20.<br>2. Mở lại quy tắc. |
| Expected | 1. `T=30` → 15 Đỏ; 20 Đỏ. Không chuyển thành Chưa xét được; không tự đổi `T` thành 20 hoặc `M×30%`.<br>2. N vẫn hiển thị 30 (không bị tự sửa). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. `T=30` → 15 Đỏ; 20 Đỏ. Không chuyển thành Chưa xét được; không tự đổi `T` thành 20 hoặc `M×30%`.<br>2. N vẫn hiển thị 30 (không bị tự sửa). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | 1. Xem ba lựa chọn loại.<br>2. Đổi Dấu so sánh（比較条件） giữa Nhỏ hơn（未満） và Nhỏ hơn hoặc bằng（以下）. |
| Expected | 1. Có Điểm cố định（固定点数）, Tỷ lệ điểm tối đa（得点率）, Công thức（計算式） (theo phạm vi phát hành — xem UI-025).<br>2. Câu giải thích dưới dấu đổi theo lựa chọn. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| lt | Dấu nhỏ hơn | 1. Có Điểm cố định（固定点数）, Tỷ lệ điểm tối đa（得点率）, Công thức（計算式） (theo phạm vi phát hành — xem UI-025).<br>2. Câu giải thích dưới dấu đổi theo lựa chọn. |
| le | Dấu nhỏ hơn hoặc bằng | 1. Có Điểm cố định（固定点数）, Tỷ lệ điểm tối đa（得点率）, Công thức（計算式） (theo phạm vi phát hành — xem UI-025).<br>2. Câu giải thích dưới dấu đổi theo lựa chọn. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | Quan sát giá trị ban đầu. |
| Expected | Loại = Điểm cố định（固定点数）; dấu = Nhỏ hơn（未満）; ô Điểm chuẩn（基準点） trống; tỷ lệ/công thức (nếu mở) mặc định Không xử lý phần lẻ（しない）.<br><br>Quy tắc mới được thêm ở cuối danh sách (PROPOSED). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Loại = Điểm cố định（固定点数）; dấu = Nhỏ hơn（未満）; ô Điểm chuẩn（基準点） trống; tỷ lệ/công thức (nếu mở) mặc định Không xử lý phần lẻ（しない）.<br><br>Quy tắc mới được thêm ở cuối danh sách (PROPOSED). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | Xem màn. |
| Expected | CONFIRMED: không có khối Trung bình tham chiếu（参照する平均点）; lưu không yêu cầu chọn nguồn.<br><br>PROPOSED: ô Điểm chuẩn（基準点） + đơn vị 点 (điểm), câu 「30点未満を赤点とします。30点は赤点になりません。」 (dưới 30 là đỏ; 30 không đỏ) đổi theo giá trị/dấu, câu 「判定には登録済みの最終点数を使用します。」 (xét dùng điểm cuối đã đăng ký). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | CONFIRMED: không có khối Trung bình tham chiếu（参照する平均点）; lưu không yêu cầu chọn nguồn.<br><br>PROPOSED: ô Điểm chuẩn（基準点） + đơn vị 点 (điểm), câu 「30点未満を赤点とします。30点は赤点になりません。」 (dưới 30 là đỏ; 30 không đỏ) đổi theo giá trị/dấu, câu 「判定には登録済みの最終点数を使用します。」 (xét dùng điểm cuối đã đăng ký). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8) |
| Thao tác | 1. Cấu hình dòng 1 và dòng 2 như quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8), lưu.<br>2. Mở lại; bấm Thêm công thức（計算式を追加） để có dòng 3, rồi xóa dòng 3, lưu.<br>3. Xem tóm tắt ở danh sách. |
| Expected | 1. Lưu được 2 dòng; mở lại giữ vế trái, phép toán, vế phải và xử lý phần lẻ từng dòng (chi tiết form là PROPOSED theo thiết kế).<br>2. Danh sách tóm tắt đủ các dòng và dấu so sánh (PROPOSED; không dùng làm oracle nghiệp vụ nếu đặc tả chưa chốt bố cục tóm tắt).<br>3. Khi xét, `T` = kết quả dòng cuối; phép tính và xử lý phần lẻ phải tuân theo AC-G16 và case “Công thức hai dòng theo Figma: (A÷2)×0.8, dòng 1 làm tròn xuống”. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. Lưu được 2 dòng; mở lại giữ vế trái, phép toán, vế phải và xử lý phần lẻ từng dòng (chi tiết form là PROPOSED theo thiết kế).<br>2. Danh sách tóm tắt đủ các dòng và dấu so sánh (PROPOSED; không dùng làm oracle nghiệp vụ nếu đặc tả chưa chốt bố cục tóm tắt).<br>3. Khi xét, `T` = kết quả dòng cuối; phép tính và xử lý phần lẻ phải tuân theo AC-G16 và case “Công thức hai dòng theo Figma: (A÷2)×0.8, dòng 1 làm tròn xuống”. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | Xóa hết các dòng công thức (nếu UI cho phép), bấm Lưu. |
| Expected | Không lưu được (hoặc UI không cho xóa dòng cuối). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Không lưu được (hoặc UI không cho xóa dòng cuối). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Dòng 1: Trung bình（平均点）÷ Số cố định（固定値）0; biến thể 0.0 |
| Thao tác | Nhập công thức, Lưu. |
| Expected | Không lưu được; lỗi chỉ rõ dòng/vế phải. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| zero | Chia 0 | Không lưu được; lỗi chỉ rõ dòng/vế phải. |
| decimal-zero | Chia 0.0 | Không lưu được; lỗi chỉ rõ dòng/vế phải. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Vế phải Số cố định（固定値）: trống, `abc`; toán tử: chưa chọn |
| Thao tác | Nhập từng biến thể, Lưu. |
| Expected | Không lưu được; lỗi chỉ ra dòng thiếu. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| empty | Trống toán hạng | Không lưu được; lỗi chỉ ra dòng thiếu. |
| text | Toán hạng không phải số | Không lưu được; lỗi chỉ ra dòng thiếu. |
| operator | Thiếu phép toán | Không lưu được; lỗi chỉ ra dòng thiếu. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: (a) Dòng 1 dùng Kết quả phép tính; (b) dòng 2 tham chiếu chính dòng 2; (c) dòng 2 tham chiếu dòng 3; (d) dòng 3 tham chiếu dòng 1 |
| Thao tác | Thử từng biến thể, bấm Lưu. |
| Expected | (a), (b), (c): không chọn được hoặc không lưu được.<br><br>(d): lưu được. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| first | Tham chiếu dòng đầu | (a), (b), (c): không chọn được hoặc không lưu được.<br><br>(d): lưu được. |
| self | Tham chiếu chính dòng | (a), (b), (c): không chọn được hoặc không lưu được.<br><br>(d): lưu được. |
| forward | Tham chiếu dòng sau | (a), (b), (c): không chọn được hoặc không lưu được.<br><br>(d): lưu được. |
| backward | Tham chiếu dòng trước | (a), (b), (c): không chọn được hoặc không lưu được.<br><br>(d): lưu được. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | 1. Xóa dòng 2, bấm Lưu.<br>2. Tạo lại công thức 3 dòng như điều kiện đầu; đổi thứ tự để dòng 3 lên vị trí 2, bấm Lưu. |
| Expected | 1. Dòng 3 báo tham chiếu không hợp lệ hoặc buộc chọn lại; không âm thầm trỏ sang dòng 1.<br>2. Dòng vừa chuyển lên (đang tham chiếu dòng mới nằm phía sau nó) bị báo tham chiếu không hợp lệ hoặc buộc chọn lại; không tự đổi sang dòng khác chỉ vì cùng số thứ tự. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| delete | Xóa dòng được tham chiếu | 1. Dòng 3 báo tham chiếu không hợp lệ hoặc buộc chọn lại; không âm thầm trỏ sang dòng 1.<br>2. Dòng vừa chuyển lên (đang tham chiếu dòng mới nằm phía sau nó) bị báo tham chiếu không hợp lệ hoặc buộc chọn lại; không tự đổi sang dòng khác chỉ vì cùng số thứ tự. |
| reorder | Đổi thứ tự dòng được tham chiếu | 1. Dòng 3 báo tham chiếu không hợp lệ hoặc buộc chọn lại; không âm thầm trỏ sang dòng 1.<br>2. Dòng vừa chuyển lên (đang tham chiếu dòng mới nằm phía sau nó) bị báo tham chiếu không hợp lệ hoặc buộc chọn lại; không tự đổi sang dòng khác chỉ vì cùng số thứ tự. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: `A × 150`, `A × 0.5`, `A − 150` |
| Thao tác | Nhập từng công thức, Lưu. |
| Expected | Lưu được (không áp giới hạn 0–100 hay 0–M cho toán hạng). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| times150 | Nhân 150 | Lưu được (không áp giới hạn 0–100 hay 0–M cho toán hạng). |
| times05 | Nhân 0.5 | Lưu được (không áp giới hạn 0–100 hay 0–M cho toán hạng). |
| minus150 | Trừ 150 | Lưu được (không áp giới hạn 0–100 hay 0–M cho toán hạng). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); Cố định N=0 và N=100, mỗi giá trị với `&lt;` và `≤`; Tỷ lệ N=0, N=100; Tỷ lệ N=0.4 với Làm tròn（四捨五入） (ra `T=0`) |
| Thao tác | Nhập từng giá trị, Lưu, mở lại. |
| Expected | 1. Cảnh báo theo `T` cuối và dấu: `&lt;0` (không ai đỏ) và `≤100` (mọi điểm hợp lệ đỏ) phải có cảnh báo; các tổ hợp biên khác theo thiết kế.<br>2. Tỷ lệ 0.4 làm tròn ra `T=0`: cảnh báo xét theo `T=0`, không theo giá trị nhập 0.4.<br>3. Cảnh báo không chặn lưu; mở lại, giá trị đã lưu giữ nguyên (không tự đổi thành giá trị khác). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| fixed0-lt | Cố định 0 nhỏ hơn | 1. Cảnh báo theo `T` cuối và dấu: `&lt;0` (không ai đỏ) và `≤100` (mọi điểm hợp lệ đỏ) phải có cảnh báo; các tổ hợp biên khác theo thiết kế.<br>2. Tỷ lệ 0.4 làm tròn ra `T=0`: cảnh báo xét theo `T=0`, không theo giá trị nhập 0.4.<br>3. Cảnh báo không chặn lưu; mở lại, giá trị đã lưu giữ nguyên (không tự đổi thành giá trị khác). |
| fixed0-le | Cố định 0 nhỏ hơn hoặc bằng | 1. Cảnh báo theo `T` cuối và dấu: `&lt;0` (không ai đỏ) và `≤100` (mọi điểm hợp lệ đỏ) phải có cảnh báo; các tổ hợp biên khác theo thiết kế.<br>2. Tỷ lệ 0.4 làm tròn ra `T=0`: cảnh báo xét theo `T=0`, không theo giá trị nhập 0.4.<br>3. Cảnh báo không chặn lưu; mở lại, giá trị đã lưu giữ nguyên (không tự đổi thành giá trị khác). |
| fixed100-lt | Cố định 100 nhỏ hơn | 1. Cảnh báo theo `T` cuối và dấu: `&lt;0` (không ai đỏ) và `≤100` (mọi điểm hợp lệ đỏ) phải có cảnh báo; các tổ hợp biên khác theo thiết kế.<br>2. Tỷ lệ 0.4 làm tròn ra `T=0`: cảnh báo xét theo `T=0`, không theo giá trị nhập 0.4.<br>3. Cảnh báo không chặn lưu; mở lại, giá trị đã lưu giữ nguyên (không tự đổi thành giá trị khác). |
| fixed100-le | Cố định 100 nhỏ hơn hoặc bằng | 1. Cảnh báo theo `T` cuối và dấu: `&lt;0` (không ai đỏ) và `≤100` (mọi điểm hợp lệ đỏ) phải có cảnh báo; các tổ hợp biên khác theo thiết kế.<br>2. Tỷ lệ 0.4 làm tròn ra `T=0`: cảnh báo xét theo `T=0`, không theo giá trị nhập 0.4.<br>3. Cảnh báo không chặn lưu; mở lại, giá trị đã lưu giữ nguyên (không tự đổi thành giá trị khác). |
| ratio0 | Tỷ lệ 0, dấu nhỏ hơn, không xử lý phần lẻ: T=0, có cảnh báo | 1. Cảnh báo theo `T` cuối và dấu: `&lt;0` (không ai đỏ) và `≤100` (mọi điểm hợp lệ đỏ) phải có cảnh báo; các tổ hợp biên khác theo thiết kế.<br>2. Tỷ lệ 0.4 làm tròn ra `T=0`: cảnh báo xét theo `T=0`, không theo giá trị nhập 0.4.<br>3. Cảnh báo không chặn lưu; mở lại, giá trị đã lưu giữ nguyên (không tự đổi thành giá trị khác). |
| ratio100 | Tỷ lệ 100, dấu nhỏ hơn hoặc bằng, không xử lý phần lẻ: T=100, có cảnh báo | 1. Cảnh báo theo `T` cuối và dấu: `&lt;0` (không ai đỏ) và `≤100` (mọi điểm hợp lệ đỏ) phải có cảnh báo; các tổ hợp biên khác theo thiết kế.<br>2. Tỷ lệ 0.4 làm tròn ra `T=0`: cảnh báo xét theo `T=0`, không theo giá trị nhập 0.4.<br>3. Cảnh báo không chặn lưu; mở lại, giá trị đã lưu giữ nguyên (không tự đổi thành giá trị khác). |
| ratio04 | Tỷ lệ 0.4, dấu nhỏ hơn, làm tròn gần nhất p=1: T=0, có cảnh báo | 1. Cảnh báo theo `T` cuối và dấu: `&lt;0` (không ai đỏ) và `≤100` (mọi điểm hợp lệ đỏ) phải có cảnh báo; các tổ hợp biên khác theo thiết kế.<br>2. Tỷ lệ 0.4 làm tròn ra `T=0`: cảnh báo xét theo `T=0`, không theo giá trị nhập 0.4.<br>3. Cảnh báo không chặn lưu; mở lại, giá trị đã lưu giữ nguyên (không tự đổi thành giá trị khác). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc công thức trung bình − 20 (`A−20`); công thức `A × 3` |
| Thao tác | Lưu từng công thức. |
| Expected | Lưu được; không kiểm `0≤T≤M` tại lúc lưu cho công thức. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| minus20 | Trừ 20 | Lưu được; không kiểm `0≤T≤M` tại lúc lưu cho công thức. |
| times3 | Nhân 3 | Lưu được; không kiểm `0≤T≤M` tại lúc lưu cho công thức. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30) |
| Thao tác | 1. Đổi sang Tỷ lệ, nhập 40, đổi lại Cố định; xem ô Cố định; đổi sang Tỷ lệ lần nữa, xem ô Tỷ lệ.<br>2. Đổi lại Cố định, Lưu.<br>3. Mở lại quy tắc.<br>4. Đổi sang Tỷ lệ, nhập 50, bấm Hủy; mở lại.<br>5. (Khi có schema) Lưu quy tắc Tỷ lệ 40 có bật xử lý phần lẻ; đổi sang Cố định 30, Lưu, SELECT; đổi sang Công thức `A×0.5`, Lưu, SELECT. |
| Expected | 1. (PROPOSED) Trong phiên: ô Cố định vẫn 30; quay lại Tỷ lệ vẫn thấy 40.<br>2. Chỉ giá trị loại cuối cùng (Cố định 30) được kiểm và lưu; không lưu lẫn dữ liệu của loại khác.<br>3. Mở lại: Cố định 30; không bắt buộc còn giá trị Tỷ lệ 40.<br>4. Vẫn Cố định 30 (cấu hình đã lưu gần nhất).<br>5. (PROPOSED theo thiết kế DB v2) Sau mỗi lần lưu, các cột không dùng cho loại hiện tại (`round_*`, `threshold_value`, cột công thức/nguồn) là SQL NULL. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. (PROPOSED) Trong phiên: ô Cố định vẫn 30; quay lại Tỷ lệ vẫn thấy 40.<br>2. Chỉ giá trị loại cuối cùng (Cố định 30) được kiểm và lưu; không lưu lẫn dữ liệu của loại khác.<br>3. Mở lại: Cố định 30; không bắt buộc còn giá trị Tỷ lệ 40.<br>4. Vẫn Cố định 30 (cấu hình đã lưu gần nhất).<br>5. (PROPOSED theo thiết kế DB v2) Sau mỗi lần lưu, các cột không dùng cho loại hiện tại (`round_*`, `threshold_value`, cột công thức/nguồn) là SQL NULL. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: (a) 20 dòng: dòng 1 `A × 1`, các dòng sau `kết quả dòng trước × 1`; (b) 21 dòng như (a); (c) `A × 999999999.99999999`; (d) `A × 1000000000`; (e) `A × 0.123456789` |
| Thao tác | Nhập từng cấu hình, Lưu, mở lại. |
| Expected | (a) Lưu được, mở lại đủ 20 dòng.<br><br>(b) Không thêm được dòng 21 hoặc bị từ chối khi lưu.<br><br>(c) Lưu được, giá trị giữ nguyên.<br><br>(d), (e) Bị từ chối, không tự cắt/làm tròn.<br><br>Gửi trực tiếp request vượt giới hạn cũng bị server từ chối (case “Server kiểm miền giá trị khi bỏ qua kiểm tra phía trình duyệt”). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| lines20 | 20 dòng | (a) Lưu được, mở lại đủ 20 dòng.<br><br>(b) Không thêm được dòng 21 hoặc bị từ chối khi lưu.<br><br>(c) Lưu được, giá trị giữ nguyên.<br><br>(d), (e) Bị từ chối, không tự cắt/làm tròn.<br><br>Gửi trực tiếp request vượt giới hạn cũng bị server từ chối (case “Server kiểm miền giá trị khi bỏ qua kiểm tra phía trình duyệt”). |
| lines21 | 21 dòng | (a) Lưu được, mở lại đủ 20 dòng.<br><br>(b) Không thêm được dòng 21 hoặc bị từ chối khi lưu.<br><br>(c) Lưu được, giá trị giữ nguyên.<br><br>(d), (e) Bị từ chối, không tự cắt/làm tròn.<br><br>Gửi trực tiếp request vượt giới hạn cũng bị server từ chối (case “Server kiểm miền giá trị khi bỏ qua kiểm tra phía trình duyệt”). |
| constant | Hằng số cực lớn | (a) Lưu được, mở lại đủ 20 dòng.<br><br>(b) Không thêm được dòng 21 hoặc bị từ chối khi lưu.<br><br>(c) Lưu được, giá trị giữ nguyên.<br><br>(d), (e) Bị từ chối, không tự cắt/làm tròn.<br><br>Gửi trực tiếp request vượt giới hạn cũng bị server từ chối (case “Server kiểm miền giá trị khi bỏ qua kiểm tra phía trình duyệt”). |
| integer-overflow | Vượt phần nguyên | (a) Lưu được, mở lại đủ 20 dòng.<br><br>(b) Không thêm được dòng 21 hoặc bị từ chối khi lưu.<br><br>(c) Lưu được, giá trị giữ nguyên.<br><br>(d), (e) Bị từ chối, không tự cắt/làm tròn.<br><br>Gửi trực tiếp request vượt giới hạn cũng bị server từ chối (case “Server kiểm miền giá trị khi bỏ qua kiểm tra phía trình duyệt”). |
| fraction-overflow | Vượt phần thập phân | (a) Lưu được, mở lại đủ 20 dòng.<br><br>(b) Không thêm được dòng 21 hoặc bị từ chối khi lưu.<br><br>(c) Lưu được, giá trị giữ nguyên.<br><br>(d), (e) Bị từ chối, không tự cắt/làm tròn.<br><br>Gửi trực tiếp request vượt giới hạn cũng bị server từ chối (case “Server kiểm miền giá trị khi bỏ qua kiểm tra phía trình duyệt”). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Công thức: (a) `A×0.5`; (b) `A−20`; (c) `A+5`; S = 24, 25, 29, 30, 54, 55 |
| Thao tác | Với từng công thức, chạy nút cam, xem kết quả. |
| Expected | (a) `T=25`: 24 Đỏ; 25 Không đỏ.<br><br>(b) `T=30`: 29 Đỏ; 30 Không đỏ.<br><br>(c) `T=55`: 54 Đỏ; 55 Không đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| multiply | Nhân 0.5 | (a) `T=25`: 24 Đỏ; 25 Không đỏ.<br><br>(b) `T=30`: 29 Đỏ; 30 Không đỏ.<br><br>(c) `T=55`: 54 Đỏ; 55 Không đỏ. |
| subtract | Trừ 20 | (a) `T=25`: 24 Đỏ; 25 Không đỏ.<br><br>(b) `T=30`: 29 Đỏ; 30 Không đỏ.<br><br>(c) `T=55`: 54 Đỏ; 55 Không đỏ. |
| add | Cộng 5 | (a) `T=25`: 24 Đỏ; 25 Không đỏ.<br><br>(b) `T=30`: 29 Đỏ; 30 Không đỏ.<br><br>(c) `T=55`: 54 Đỏ; 55 Không đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: S = 19.1 và S = 19.2 |
| Thao tác | 1. Lưu đúng cấu hình: dòng 1 bật xử lý phần lẻ, vị trí 1, làm tròn xuống; dòng 2 không xử lý.<br>2. Chạy xét với `S=19.1` và `S=19.2`. |
| Expected | 1. `24.85→24`; `T=24×0.8=19.2`.<br>2. Với dấu `&lt;`: `S=19.1` Đỏ và `S=19.2` Không đỏ.<br>3. Không làm tròn dòng 2 thành `19`. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. `24.85→24`; `T=24×0.8=19.2`.<br>2. Với dấu `&lt;`: `S=19.1` Đỏ và `S=19.2` Không đỏ.<br>3. Không làm tròn dòng 2 thành `19`. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: C15-P1 có `S=23.9`, C15-P2 có `S=24`, C15-P3 có `S=24.4`; nguồn reader phải trả `A=61`; quy tắc hai dòng `(A÷2)×0.8`. |
| Thao tác | 1. Tạo dòng 1 `A÷2`; chọn **chữ số thập phân thứ 1（小数第1位）** và **Làm tròn xuống（切り捨て）**, tức kết quả dòng 1 được đưa về số nguyên. Tạo dòng 2 `kết quả dòng trước×0.8` và chọn **không xử lý phần lẻ（しない）**.<br>2. Xác nhận TD-SRC-25/reader trả `A=61`; chạy trong đúng lớp TD-GRP-05 với C15-P1/P2/P3 cho hai biến thể dấu `&lt;` và `≤`, không đổi nguồn hoặc cách làm tròn.<br>3. Mở lại cấu hình và đối chiếu kết quả của C15-P1/P2/P3. |
| Expected | Dòng 1 `61÷2=30.5` làm tròn xuống thành `30`; dòng 2 `30×0.8=24`, nên oracle cố định là `T=24`.<br><br>- Với dấu `&lt;`: C15-P1=`23.9` Đỏ; C15-P2=`24` **Không đỏ**; C15-P3=`24.4` **Không đỏ**.<br>- Với dấu `≤`: C15-P1=`23.9` Đỏ; C15-P2=`24` Đỏ; C15-P3=`24.4` **Không đỏ**.<br><br>Mở lại cấu hình và phần tóm tắt phải giữ đúng vị trí làm tròn xuống ở dòng 1, không được thay expected theo kết quả thực tế hoặc ghi đè oracle trong evidence. Phương thức không làm tròn dòng 1 là biến thể riêng, không thuộc case này. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| less-than | Nhánh less-than trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | Dòng 1 `61÷2=30.5` làm tròn xuống thành `30`; dòng 2 `30×0.8=24`, nên oracle cố định là `T=24`.<br><br>- Với dấu `&lt;`: C15-P1=`23.9` Đỏ; C15-P2=`24` **Không đỏ**; C15-P3=`24.4` **Không đỏ**.<br>- Với dấu `≤`: C15-P1=`23.9` Đỏ; C15-P2=`24` Đỏ; C15-P3=`24.4` **Không đỏ**.<br><br>Mở lại cấu hình và phần tóm tắt phải giữ đúng vị trí làm tròn xuống ở dòng 1, không được thay expected theo kết quả thực tế hoặc ghi đè oracle trong evidence. Phương thức không làm tròn dòng 1 là biến thể riêng, không thuộc case này. |
| less-or-equal | Nhánh less-or-equal trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | Dòng 1 `61÷2=30.5` làm tròn xuống thành `30`; dòng 2 `30×0.8=24`, nên oracle cố định là `T=24`.<br><br>- Với dấu `&lt;`: C15-P1=`23.9` Đỏ; C15-P2=`24` **Không đỏ**; C15-P3=`24.4` **Không đỏ**.<br>- Với dấu `≤`: C15-P1=`23.9` Đỏ; C15-P2=`24` Đỏ; C15-P3=`24.4` **Không đỏ**.<br><br>Mở lại cấu hình và phần tóm tắt phải giữ đúng vị trí làm tròn xuống ở dòng 1, không được thay expected theo kết quả thực tế hoặc ghi đè oracle trong evidence. Phương thức không làm tròn dòng 1 là biến thể riêng, không thuộc case này. |
| reopen-summary | Nhánh reopen-summary trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | Dòng 1 `61÷2=30.5` làm tròn xuống thành `30`; dòng 2 `30×0.8=24`, nên oracle cố định là `T=24`.<br><br>- Với dấu `&lt;`: C15-P1=`23.9` Đỏ; C15-P2=`24` **Không đỏ**; C15-P3=`24.4` **Không đỏ**.<br>- Với dấu `≤`: C15-P1=`23.9` Đỏ; C15-P2=`24` Đỏ; C15-P3=`24.4` **Không đỏ**.<br><br>Mở lại cấu hình và phần tóm tắt phải giữ đúng vị trí làm tròn xuống ở dòng 1, không được thay expected theo kết quả thực tế hoặc ghi đè oracle trong evidence. Phương thức không làm tròn dòng 1 là biến thể riêng, không thuộc case này. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc công thức trung bình − 20; (a) Mục thường: S = 0; (b) mục cho phép điểm âm: S = −6, −5 |
| Thao tác | (a) Xét S=0 với `&lt;` và `≤`.<br><br>(b) Xét −6, −5 với `&lt;` và `≤`. |
| Expected | (a) `T=−5`: `&lt;` Không đỏ; `≤` Không đỏ (nếu hệ thống ép `T` về 0 thì `≤` sẽ Đỏ — sai).<br><br>(b) `&lt;`: −6 Đỏ; −5 Không đỏ. `≤`: −6 Đỏ; −5 Đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| zero-lt | Ngưỡng 0 nhỏ hơn | (a) `T=−5`: `&lt;` Không đỏ; `≤` Không đỏ (nếu hệ thống ép `T` về 0 thì `≤` sẽ Đỏ — sai).<br><br>(b) `&lt;`: −6 Đỏ; −5 Không đỏ. `≤`: −6 Đỏ; −5 Đỏ. |
| zero-le | Ngưỡng 0 nhỏ hơn hoặc bằng | (a) `T=−5`: `&lt;` Không đỏ; `≤` Không đỏ (nếu hệ thống ép `T` về 0 thì `≤` sẽ Đỏ — sai).<br><br>(b) `&lt;`: −6 Đỏ; −5 Không đỏ. `≤`: −6 Đỏ; −5 Đỏ. |
| negative-lt | Ngưỡng âm nhỏ hơn | (a) `T=−5`: `&lt;` Không đỏ; `≤` Không đỏ (nếu hệ thống ép `T` về 0 thì `≤` sẽ Đỏ — sai).<br><br>(b) `&lt;`: −6 Đỏ; −5 Không đỏ. `≤`: −6 Đỏ; −5 Đỏ. |
| negative-le | Ngưỡng âm nhỏ hơn hoặc bằng | (a) `T=−5`: `&lt;` Không đỏ; `≤` Không đỏ (nếu hệ thống ép `T` về 0 thì `≤` sẽ Đỏ — sai).<br><br>(b) `&lt;`: −6 Đỏ; −5 Không đỏ. `≤`: −6 Đỏ; −5 Đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); S = 100 |
| Thao tác | Chạy nút cam; xem kết quả. |
| Expected | `T=120`; `100&lt;120` → Đỏ. Không bị Chưa xét được, không ép `T` về 100. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | `T=120`; `100&lt;120` → Đỏ. Không bị Chưa xét được, không ép `T` về 100. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: S = 49, 50 |
| Thao tác | 1. Lưu công thức (quan sát cảnh báo).<br>2. Chạy nút cam. |
| Expected | 1. Có cảnh báo giúp hiểu ngưỡng là A (câu chữ TBD), vẫn lưu được.<br>2. `T=50`: 49 Đỏ; 50 Không đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. Có cảnh báo giúp hiểu ngưỡng là A (câu chữ TBD), vẫn lưu được.<br>2. `T=50`: 49 Đỏ; 50 Không đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Bảng ở Expected Result |
| Thao tác | 1. Với từng dòng của Expected Result: đặt `A` (nguồn dummy, dữ liệu giả cho bản tổng hợp đã chốt), chọn xử lý phần lẻ.<br>2. Chạy lại (nút cam).<br>3. Đọc `T` qua thông tin giải thích (case “Lưu thông tin giải thích kết quả”) hoặc qua kết quả xét với S sát ngưỡng. |
| Expected | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br><br>29.7 không xử lý → 29.7.<br><br>29.7 xuống p1 → 29.<br><br>29.75 gần nhất p2 → 29.8.<br><br>−5.2 lên p1 → −5.<br><br>−5.2 xuống p1 → −6.<br><br>−5.5 gần nhất p1 → −6.<br><br>12.5 gần nhất p1 → 13; −12.5 gần nhất p1 → −13; −12.5 lên p1 → −12; −12.5 xuống p1 → −13.<br><br>12.345 gần nhất p2 → 12.3; lên p2 → 12.4.<br><br>2.675 gần nhất p3 → 2.68.<br><br>1.123456789 gần nhất p9 → 1.12345679; xuống p9 → 1.12345678. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| positive-none | 29.7 không xử lý | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br><br>29.7 không xử lý → 29.7.<br><br>29.7 xuống p1 → 29.<br><br>29.75 gần nhất p2 → 29.8.<br><br>−5.2 lên p1 → −5.<br><br>−5.2 xuống p1 → −6.<br><br>−5.5 gần nhất p1 → −6.<br><br>12.5 gần nhất p1 → 13; −12.5 gần nhất p1 → −13; −12.5 lên p1 → −12; −12.5 xuống p1 → −13.<br><br>12.345 gần nhất p2 → 12.3; lên p2 → 12.4.<br><br>2.675 gần nhất p3 → 2.68.<br><br>1.123456789 gần nhất p9 → 1.12345679; xuống p9 → 1.12345678. |
| positive-down | 29.7 xuống p1 | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br><br>29.7 không xử lý → 29.7.<br><br>29.7 xuống p1 → 29.<br><br>29.75 gần nhất p2 → 29.8.<br><br>−5.2 lên p1 → −5.<br><br>−5.2 xuống p1 → −6.<br><br>−5.5 gần nhất p1 → −6.<br><br>12.5 gần nhất p1 → 13; −12.5 gần nhất p1 → −13; −12.5 lên p1 → −12; −12.5 xuống p1 → −13.<br><br>12.345 gần nhất p2 → 12.3; lên p2 → 12.4.<br><br>2.675 gần nhất p3 → 2.68.<br><br>1.123456789 gần nhất p9 → 1.12345679; xuống p9 → 1.12345678. |
| positive-nearest | 29.75 gần nhất p2 | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br><br>29.7 không xử lý → 29.7.<br><br>29.7 xuống p1 → 29.<br><br>29.75 gần nhất p2 → 29.8.<br><br>−5.2 lên p1 → −5.<br><br>−5.2 xuống p1 → −6.<br><br>−5.5 gần nhất p1 → −6.<br><br>12.5 gần nhất p1 → 13; −12.5 gần nhất p1 → −13; −12.5 lên p1 → −12; −12.5 xuống p1 → −13.<br><br>12.345 gần nhất p2 → 12.3; lên p2 → 12.4.<br><br>2.675 gần nhất p3 → 2.68.<br><br>1.123456789 gần nhất p9 → 1.12345679; xuống p9 → 1.12345678. |
| negative-up | -5.2 lên p1 | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br><br>29.7 không xử lý → 29.7.<br><br>29.7 xuống p1 → 29.<br><br>29.75 gần nhất p2 → 29.8.<br><br>−5.2 lên p1 → −5.<br><br>−5.2 xuống p1 → −6.<br><br>−5.5 gần nhất p1 → −6.<br><br>12.5 gần nhất p1 → 13; −12.5 gần nhất p1 → −13; −12.5 lên p1 → −12; −12.5 xuống p1 → −13.<br><br>12.345 gần nhất p2 → 12.3; lên p2 → 12.4.<br><br>2.675 gần nhất p3 → 2.68.<br><br>1.123456789 gần nhất p9 → 1.12345679; xuống p9 → 1.12345678. |
| negative-down | -5.2 xuống p1 | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br><br>29.7 không xử lý → 29.7.<br><br>29.7 xuống p1 → 29.<br><br>29.75 gần nhất p2 → 29.8.<br><br>−5.2 lên p1 → −5.<br><br>−5.2 xuống p1 → −6.<br><br>−5.5 gần nhất p1 → −6.<br><br>12.5 gần nhất p1 → 13; −12.5 gần nhất p1 → −13; −12.5 lên p1 → −12; −12.5 xuống p1 → −13.<br><br>12.345 gần nhất p2 → 12.3; lên p2 → 12.4.<br><br>2.675 gần nhất p3 → 2.68.<br><br>1.123456789 gần nhất p9 → 1.12345679; xuống p9 → 1.12345678. |
| negative-nearest | -5.5 gần nhất p1 | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br><br>29.7 không xử lý → 29.7.<br><br>29.7 xuống p1 → 29.<br><br>29.75 gần nhất p2 → 29.8.<br><br>−5.2 lên p1 → −5.<br><br>−5.2 xuống p1 → −6.<br><br>−5.5 gần nhất p1 → −6.<br><br>12.5 gần nhất p1 → 13; −12.5 gần nhất p1 → −13; −12.5 lên p1 → −12; −12.5 xuống p1 → −13.<br><br>12.345 gần nhất p2 → 12.3; lên p2 → 12.4.<br><br>2.675 gần nhất p3 → 2.68.<br><br>1.123456789 gần nhất p9 → 1.12345679; xuống p9 → 1.12345678. |
| half-positive | 12.5 gần nhất p1 | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br><br>29.7 không xử lý → 29.7.<br><br>29.7 xuống p1 → 29.<br><br>29.75 gần nhất p2 → 29.8.<br><br>−5.2 lên p1 → −5.<br><br>−5.2 xuống p1 → −6.<br><br>−5.5 gần nhất p1 → −6.<br><br>12.5 gần nhất p1 → 13; −12.5 gần nhất p1 → −13; −12.5 lên p1 → −12; −12.5 xuống p1 → −13.<br><br>12.345 gần nhất p2 → 12.3; lên p2 → 12.4.<br><br>2.675 gần nhất p3 → 2.68.<br><br>1.123456789 gần nhất p9 → 1.12345679; xuống p9 → 1.12345678. |
| half-negative | -12.5 gần nhất p1 | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br><br>29.7 không xử lý → 29.7.<br><br>29.7 xuống p1 → 29.<br><br>29.75 gần nhất p2 → 29.8.<br><br>−5.2 lên p1 → −5.<br><br>−5.2 xuống p1 → −6.<br><br>−5.5 gần nhất p1 → −6.<br><br>12.5 gần nhất p1 → 13; −12.5 gần nhất p1 → −13; −12.5 lên p1 → −12; −12.5 xuống p1 → −13.<br><br>12.345 gần nhất p2 → 12.3; lên p2 → 12.4.<br><br>2.675 gần nhất p3 → 2.68.<br><br>1.123456789 gần nhất p9 → 1.12345679; xuống p9 → 1.12345678. |
| half-up | -12.5 lên p1 | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br><br>29.7 không xử lý → 29.7.<br><br>29.7 xuống p1 → 29.<br><br>29.75 gần nhất p2 → 29.8.<br><br>−5.2 lên p1 → −5.<br><br>−5.2 xuống p1 → −6.<br><br>−5.5 gần nhất p1 → −6.<br><br>12.5 gần nhất p1 → 13; −12.5 gần nhất p1 → −13; −12.5 lên p1 → −12; −12.5 xuống p1 → −13.<br><br>12.345 gần nhất p2 → 12.3; lên p2 → 12.4.<br><br>2.675 gần nhất p3 → 2.68.<br><br>1.123456789 gần nhất p9 → 1.12345679; xuống p9 → 1.12345678. |
| half-down | -12.5 xuống p1 | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br><br>29.7 không xử lý → 29.7.<br><br>29.7 xuống p1 → 29.<br><br>29.75 gần nhất p2 → 29.8.<br><br>−5.2 lên p1 → −5.<br><br>−5.2 xuống p1 → −6.<br><br>−5.5 gần nhất p1 → −6.<br><br>12.5 gần nhất p1 → 13; −12.5 gần nhất p1 → −13; −12.5 lên p1 → −12; −12.5 xuống p1 → −13.<br><br>12.345 gần nhất p2 → 12.3; lên p2 → 12.4.<br><br>2.675 gần nhất p3 → 2.68.<br><br>1.123456789 gần nhất p9 → 1.12345679; xuống p9 → 1.12345678. |
| decimal-nearest | 12.345 gần nhất p2 | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br><br>29.7 không xử lý → 29.7.<br><br>29.7 xuống p1 → 29.<br><br>29.75 gần nhất p2 → 29.8.<br><br>−5.2 lên p1 → −5.<br><br>−5.2 xuống p1 → −6.<br><br>−5.5 gần nhất p1 → −6.<br><br>12.5 gần nhất p1 → 13; −12.5 gần nhất p1 → −13; −12.5 lên p1 → −12; −12.5 xuống p1 → −13.<br><br>12.345 gần nhất p2 → 12.3; lên p2 → 12.4.<br><br>2.675 gần nhất p3 → 2.68.<br><br>1.123456789 gần nhất p9 → 1.12345679; xuống p9 → 1.12345678. |
| decimal-up | 12.345 lên p2 | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br><br>29.7 không xử lý → 29.7.<br><br>29.7 xuống p1 → 29.<br><br>29.75 gần nhất p2 → 29.8.<br><br>−5.2 lên p1 → −5.<br><br>−5.2 xuống p1 → −6.<br><br>−5.5 gần nhất p1 → −6.<br><br>12.5 gần nhất p1 → 13; −12.5 gần nhất p1 → −13; −12.5 lên p1 → −12; −12.5 xuống p1 → −13.<br><br>12.345 gần nhất p2 → 12.3; lên p2 → 12.4.<br><br>2.675 gần nhất p3 → 2.68.<br><br>1.123456789 gần nhất p9 → 1.12345679; xuống p9 → 1.12345678. |
| p3 | 2.675 gần nhất p3 | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br><br>29.7 không xử lý → 29.7.<br><br>29.7 xuống p1 → 29.<br><br>29.75 gần nhất p2 → 29.8.<br><br>−5.2 lên p1 → −5.<br><br>−5.2 xuống p1 → −6.<br><br>−5.5 gần nhất p1 → −6.<br><br>12.5 gần nhất p1 → 13; −12.5 gần nhất p1 → −13; −12.5 lên p1 → −12; −12.5 xuống p1 → −13.<br><br>12.345 gần nhất p2 → 12.3; lên p2 → 12.4.<br><br>2.675 gần nhất p3 → 2.68.<br><br>1.123456789 gần nhất p9 → 1.12345679; xuống p9 → 1.12345678. |
| p9-nearest | 1.123456789 gần nhất p9 | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br><br>29.7 không xử lý → 29.7.<br><br>29.7 xuống p1 → 29.<br><br>29.75 gần nhất p2 → 29.8.<br><br>−5.2 lên p1 → −5.<br><br>−5.2 xuống p1 → −6.<br><br>−5.5 gần nhất p1 → −6.<br><br>12.5 gần nhất p1 → 13; −12.5 gần nhất p1 → −13; −12.5 lên p1 → −12; −12.5 xuống p1 → −13.<br><br>12.345 gần nhất p2 → 12.3; lên p2 → 12.4.<br><br>2.675 gần nhất p3 → 2.68.<br><br>1.123456789 gần nhất p9 → 1.12345679; xuống p9 → 1.12345678. |
| p9-down | 1.123456789 xuống p9 | Các phép thử có fixture/source được quan sát dùng expected dưới đây. Giới hạn `p=9`, miền âm và quy tắc làm tròn âm là PROPOSED/TBD nếu đợt phát hành chưa chốt; thiếu seam thì BLOCKED, không đánh PASS/FAIL.<br><br>29.7 không xử lý → 29.7.<br><br>29.7 xuống p1 → 29.<br><br>29.75 gần nhất p2 → 29.8.<br><br>−5.2 lên p1 → −5.<br><br>−5.2 xuống p1 → −6.<br><br>−5.5 gần nhất p1 → −6.<br><br>12.5 gần nhất p1 → 13; −12.5 gần nhất p1 → −13; −12.5 lên p1 → −12; −12.5 xuống p1 → −13.<br><br>12.345 gần nhất p2 → 12.3; lên p2 → 12.4.<br><br>2.675 gần nhất p3 → 2.68.<br><br>1.123456789 gần nhất p9 → 1.12345679; xuống p9 → 1.12345678. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100); S = 29.5 |
| Thao tác | (a) Xuống p1.<br><br>(b) Gần nhất p1. |
| Expected | (a) `T=29`; `29.5&lt;29` sai → Không đỏ. (Nếu làm tròn S thành 29 và giữ `T=29.7` → Đỏ — sai.)<br><br>(b) `T=30`; `29.5&lt;30` → Đỏ. (Nếu làm tròn S thành 30 → Không đỏ — sai.)<br><br>Điểm lưu vẫn 29.5. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| down | Cắt xuống | (a) `T=29`; `29.5&lt;29` sai → Không đỏ. (Nếu làm tròn S thành 29 và giữ `T=29.7` → Đỏ — sai.)<br><br>(b) `T=30`; `29.5&lt;30` → Đỏ. (Nếu làm tròn S thành 30 → Không đỏ — sai.)<br><br>Điểm lưu vẫn 29.5. |
| nearest | Làm tròn gần nhất | (a) `T=29`; `29.5&lt;29` sai → Không đỏ. (Nếu làm tròn S thành 29 và giữ `T=29.7` → Đỏ — sai.)<br><br>(b) `T=30`; `29.5&lt;30` → Đỏ. (Nếu làm tròn S thành 30 → Không đỏ — sai.)<br><br>Điểm lưu vẫn 29.5. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100), quy tắc công thức 100 ÷ trung bình; (a) nhóm có trung bình 0 `A=0`; (b) `A=4`, S = 24; (c) `A=3`, S = 33.33, 33.34 |
| Thao tác | Chạy nút cam cho từng nguồn. |
| Expected | (a) Chưa xét được; không dùng ưu tiên thấp hơn.<br><br>(b) `T=25` → 24 Đỏ.<br><br>(c) `T=33.333…` → 33.33 Đỏ; 33.34 Không đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| a0 | A0 | (a) Chưa xét được; không dùng ưu tiên thấp hơn.<br><br>(b) `T=25` → 24 Đỏ.<br><br>(c) `T=33.333…` → 33.33 Đỏ; 33.34 Không đỏ. |
| a4 | A4 | (a) Chưa xét được; không dùng ưu tiên thấp hơn.<br><br>(b) `T=25` → 24 Đỏ.<br><br>(c) `T=33.333…` → 33.33 Đỏ; 33.34 Không đỏ. |
| a3 | A3 | (a) Chưa xét được; không dùng ưu tiên thấp hơn.<br><br>(b) `T=25` → 24 Đỏ.<br><br>(c) `T=33.333…` → 33.33 Đỏ; 33.34 Không đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100); (a) `A=1.1`, công thức `A×3`, S = 3.3; (b) `A=0.1`, công thức `A+0.2`, S = 0.3 |
| Thao tác | Xét với `&lt;` và `≤`. |
| Expected | (a) `T=3.3`: `&lt;` Không đỏ; `≤` Đỏ.<br><br>(b) `T=0.3`: `&lt;` Không đỏ; `≤` Đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| multiply-lt | A1.1 nhân 3 nhỏ hơn | (a) `T=3.3`: `&lt;` Không đỏ; `≤` Đỏ.<br><br>(b) `T=0.3`: `&lt;` Không đỏ; `≤` Đỏ. |
| multiply-le | A1.1 nhân 3 nhỏ hơn hoặc bằng | (a) `T=3.3`: `&lt;` Không đỏ; `≤` Đỏ.<br><br>(b) `T=0.3`: `&lt;` Không đỏ; `≤` Đỏ. |
| add-lt | A0.1 cộng 0.2 nhỏ hơn | (a) `T=3.3`: `&lt;` Không đỏ; `≤` Đỏ.<br><br>(b) `T=0.3`: `&lt;` Không đỏ; `≤` Đỏ. |
| add-le | A0.1 cộng 0.2 nhỏ hơn hoặc bằng | (a) `T=3.3`: `&lt;` Không đỏ; `≤` Đỏ.<br><br>(b) `T=0.3`: `&lt;` Không đỏ; `≤` Đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: (a) `A × 999999999999999999999` (21 chữ số); `A ÷ 0.000000001`.&lt;br&gt;(b) 20 dòng, mỗi dòng `× 999999999.99999999` (dòng 1: `A × 999999999.99999999`), không xử lý phần lẻ; `A=50`. |
| Thao tác | 1. Nhập (a), Lưu.<br>2. Nhập (b), Lưu, chạy nút cam. |
| Expected | 1. (a) vượt giới hạn nhập đề xuất (9 chữ số nguyên, 8 chữ số lẻ) → bị từ chối khi lưu, không tự cắt số.<br>2. (b) nằm trong giới hạn nhập nên lưu được; khi chạy, ngưỡng vượt miền số được hỗ trợ → Chưa xét được (đề xuất `reason_code=numeric_overflow`) hoặc lỗi kỹ thuật được báo. Không có ô nào thành Đỏ/Không đỏ từ giá trị tràn. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| constant | Hằng số cực lớn | 1. (a) vượt giới hạn nhập đề xuất (9 chữ số nguyên, 8 chữ số lẻ) → bị từ chối khi lưu, không tự cắt số.<br>2. (b) nằm trong giới hạn nhập nên lưu được; khi chạy, ngưỡng vượt miền số được hỗ trợ → Chưa xét được (đề xuất `reason_code=numeric_overflow`) hoặc lỗi kỹ thuật được báo. Không có ô nào thành Đỏ/Không đỏ từ giá trị tràn. |
| divisor | Số chia cực nhỏ | 1. (a) vượt giới hạn nhập đề xuất (9 chữ số nguyên, 8 chữ số lẻ) → bị từ chối khi lưu, không tự cắt số.<br>2. (b) nằm trong giới hạn nhập nên lưu được; khi chạy, ngưỡng vượt miền số được hỗ trợ → Chưa xét được (đề xuất `reason_code=numeric_overflow`) hoặc lỗi kỹ thuật được báo. Không có ô nào thành Đỏ/Không đỏ từ giá trị tràn. |
| overflow | Tràn trong lúc tính | 1. (a) vượt giới hạn nhập đề xuất (9 chữ số nguyên, 8 chữ số lẻ) → bị từ chối khi lưu, không tự cắt số.<br>2. (b) nằm trong giới hạn nhập nên lưu được; khi chạy, ngưỡng vượt miền số được hỗ trợ → Chưa xét được (đề xuất `reason_code=numeric_overflow`) hoặc lỗi kỹ thuật được báo. Không có ô nào thành Đỏ/Không đỏ từ giá trị tràn. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S04 (điểm 0) (0), học sinh S05 (ô trống) (trống) |
| Thao tác | Xét với `&lt;` rồi `≤`. |
| Expected | `T=0`. `&lt;`: S04 Không đỏ. `≤`: S04 Đỏ. S05: Không có điểm ở cả hai (không bị coi là 0). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| lt | Dấu nhỏ hơn | `T=0`. `&lt;`: S04 Không đỏ. `≤`: S04 Đỏ. S05: Không có điểm ở cả hai (không bị coi là 0). |
| le | Dấu nhỏ hơn hoặc bằng | `T=0`. `&lt;`: S04 Không đỏ. `≤`: S04 Đỏ. S05: Không có điểm ở cả hai (không bị coi là 0). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | Ghi lại thứ tự các khối từ trên xuống. |
| Expected | Khối nguồn chỉ hiện với Công thức, không hiện với cố định/tỷ lệ (đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”).<br><br>Thứ tự khối theo Figma (PROPOSED): khối Trung bình tham chiếu（参照する平均点） nằm trước bảng dòng công thức và trước Xét điểm đỏ（赤点の判定）. Đặc tả v2 không quy định thứ tự; lệch thì ghi Notes, không FAIL. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Khối nguồn chỉ hiện với Công thức, không hiện với cố định/tỷ lệ (đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”).<br><br>Thứ tự khối theo Figma (PROPOSED): khối Trung bình tham chiếu（参照する平均点） nằm trước bảng dòng công thức và trước Xét điểm đỏ（赤点の判定）. Đặc tả v2 không quy định thứ tự; lệch thì ghi Notes, không FAIL. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8) |
| Thao tác | 1. Nhập quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8).<br>2. Thêm/xóa dòng. |
| Expected | Có đủ cột; chọn Kết quả phép tính（式の結果） thì hiện ô chọn dòng; mỗi dòng có Xử lý phần lẻ riêng; thêm/xóa dòng được; có câu dòng cuối là ngưỡng. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Có đủ cột; chọn Kết quả phép tính（式の結果） thì hiện ô chọn dòng; mỗi dòng có Xử lý phần lẻ riêng; thêm/xóa dòng được; có câu dòng cuối là ngưỡng. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); Cố định N=120; công thức `A ÷ 0` |
| Thao tác | 1. Lưu N=120.<br>2. Lưu công thức chia 0. |
| Expected | 1. Không lưu được. Đầu vùng nhập có 「基準点が対象の満点を超えています。対象の満点以下の値を入力してください。」 (điểm chuẩn vượt điểm tối đa của đối tượng; hãy nhập giá trị không vượt điểm tối đa); tại ô Điểm chuẩn（基準点） có 「対象の満点（100点）以下の値を入力してください。」 và dòng 「対象の満点：100点」 (điểm tối đa của đối tượng: 100); giá trị 120 còn giữ.<br>2. Không lưu được. Đầu vùng nhập có 「式1：0で割ることはできません。右辺の値を変更してください。」 (dòng 1: không thể chia cho 0; đổi giá trị vế phải); tại dòng 1 có 「0で割ることはできません。右辺の値を変更してください。」; các giá trị đã nhập còn giữ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| maximum | N120 | 1. Không lưu được. Đầu vùng nhập có 「基準点が対象の満点を超えています。対象の満点以下の値を入力してください。」 (điểm chuẩn vượt điểm tối đa của đối tượng; hãy nhập giá trị không vượt điểm tối đa); tại ô Điểm chuẩn（基準点） có 「対象の満点（100点）以下の値を入力してください。」 và dòng 「対象の満点：100点」 (điểm tối đa của đối tượng: 100); giá trị 120 còn giữ.<br>2. Không lưu được. Đầu vùng nhập có 「式1：0で割ることはできません。右辺の値を変更してください。」 (dòng 1: không thể chia cho 0; đổi giá trị vế phải); tại dòng 1 có 「0で割ることはできません。右辺の値を変更してください。」; các giá trị đã nhập còn giữ. |
| divide-zero | Công thức chia 0 | 1. Không lưu được. Đầu vùng nhập có 「基準点が対象の満点を超えています。対象の満点以下の値を入力してください。」 (điểm chuẩn vượt điểm tối đa của đối tượng; hãy nhập giá trị không vượt điểm tối đa); tại ô Điểm chuẩn（基準点） có 「対象の満点（100点）以下の値を入力してください。」 và dòng 「対象の満点：100点」 (điểm tối đa của đối tượng: 100); giá trị 120 còn giữ.<br>2. Không lưu được. Đầu vùng nhập có 「式1：0で割ることはできません。右辺の値を変更してください。」 (dòng 1: không thể chia cho 0; đổi giá trị vế phải); tại dòng 1 có 「0で割ることはできません。右辺の値を変更してください。」; các giá trị đã nhập còn giữ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); cặp quy tắc phân nhánh theo trung bình 60, các lớp chủ nhiệm HR1, HR2, học sinh S01–S05 |
| Thao tác | 1. Thiết lập tổng hợp thứ hạng（順位集計設定）→ Thiết lập chi tiết（詳細設定）: đặt tự tổng hợp khi đăng ký điểm là Không thực hiện（実行しない）.<br>2. Ở Tổng hợp thành tích（成績集計）, chọn Khối 1, kỳ 1学期期末 (cuối kỳ học kỳ 1), bấm Thực hiện tổng hợp（集計実行）, chờ hoàn tất.<br>3. Bấm Thực hiện tính toán tự động（自動算出実行）, chờ hoàn tất.<br>4. Xem kết quả ở ba đầu ra.<br>5. Sau bước 3, xem lần chạy tổng hợp gần nhất hiển thị ở Tổng hợp thành tích（成績集計）. |
| Expected | 1. Sau bước 2 (chỉ nút xanh), kết quả đỏ chưa thay đổi.<br>2. Sau bước 3, mỗi ô của S01–S05 có kết quả theo nhánh đúng với `A` của tổng hợp vừa chạy.<br>3. Ba đầu ra hiển thị cùng kết quả mới.<br>4. (Theo tiêu chí nghiệm thu “Thứ tự đánh giá tương đối”) Bước 3 không tự chạy lại Thực hiện tổng hợp（集計実行） hay thêm lượt xét thứ hai, kể cả khi tính tự động làm đổi điểm dùng cho trung bình: lần chạy tổng hợp gần nhất vẫn là lần ở bước 2. Muốn dùng trung bình mới thì người dùng chạy lại quy trình. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. Sau bước 2 (chỉ nút xanh), kết quả đỏ chưa thay đổi.<br>2. Sau bước 3, mỗi ô của S01–S05 có kết quả theo nhánh đúng với `A` của tổng hợp vừa chạy.<br>3. Ba đầu ra hiển thị cùng kết quả mới.<br>4. (Theo tiêu chí nghiệm thu “Thứ tự đánh giá tương đối”) Bước 3 không tự chạy lại Thực hiện tổng hợp（集計実行） hay thêm lượt xét thứ hai, kể cả khi tính tự động làm đổi điểm dùng cho trung bình: lần chạy tổng hợp gần nhất vẫn là lần ở bước 2. Muốn dùng trung bình mới thì người dùng chạy lại quy trình. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Quy tắc: điều kiện Trung bình（平均点） `≥50` dùng nguồn P; ngưỡng Công thức（計算式） `A×0.5` dùng nguồn Q; `&lt;`. S = 25 |
| Thao tác | 1. Lưu quy tắc, mở lại.<br>2. Chỉ đổi nguồn của điều kiện từ P sang P2, Lưu, mở lại.<br>3. Chạy nút cam.<br>4. Trên form, đổi Thời kỳ tổng hợp（集計対象時期） của nguồn điều kiện sang kỳ mà Thiết lập tổng hợp thứ hạng（順位集計設定） đang chọn vẫn hợp lệ; rồi đổi sang kỳ mà thiết lập đó không còn hợp lệ. Xem các ô chọn phụ thuộc sau mỗi lần đổi. |
| Expected | 1. Mỗi phần hiện đúng nguồn của mình (điều kiện: P; công thức: Q).<br>2. Điều kiện dùng P2; công thức vẫn dùng Q.<br>3. `70≥50` khớp; `T=40×0.5=20` → S=25 Không đỏ. Nếu công thức bị đổi theo P2 (`T=35`) hoặc dùng P (`T=30`) thì S=25 thành Đỏ — sai.<br>4. (PROPOSED) Chỉ lựa chọn phụ thuộc không còn hợp lệ bị xóa; lựa chọn còn hợp lệ được giữ; nguồn của công thức không đổi. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. Mỗi phần hiện đúng nguồn của mình (điều kiện: P; công thức: Q).<br>2. Điều kiện dùng P2; công thức vẫn dùng Q.<br>3. `70≥50` khớp; `T=40×0.5=20` → S=25 Không đỏ. Nếu công thức bị đổi theo P2 (`T=35`) hoặc dùng P (`T=30`) thì S=25 thành Đỏ — sai.<br>4. (PROPOSED) Chỉ lựa chọn phụ thuộc không còn hợp lệ bị xóa; lựa chọn còn hợp lệ được giữ; nguồn của công thức không đổi. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: thiết lập tổng hợp X（評点集計）, thiết lập tổng hợp X đã bật thêm Lớp học（授業）, nhóm tổng hợp thứ hạng “Toán I khối 1+2”, nhóm tổ hợp “Tổ hợp Toán”, nhóm môn học “Nhóm môn Toán”; mục số nguyên (M=100); tài khoản giáo viên có quyền sửa mục, tài khoản có quyền chạy hàng loạt |
| Thao tác | 1. Ở nguồn của điều kiện: chọn Thời kỳ tổng hợp（集計対象時期）, chọn Thiết lập tổng hợp thứ hạng（順位集計設定） X, rồi mở danh sách Đối tượng tổng hợp（集計対象）. Ghi lại các lựa chọn.<br>2. Bật thêm Lớp học（授業） trong công tắc tổng hợp hiện hữu (thành thiết lập tổng hợp X đã bật thêm Lớp học（授業）), chạy lại tổng hợp X; mở lại danh sách ở bước 1.<br>3. Tắt cả ba công tắc khối/lớp chủ nhiệm/lớp học; mở lại danh sách. Chọn nhóm tổng hợp thứ hạng “Toán I khối 1+2”, lưu, mở lại form.<br>4. Ở trường/năm không có nhóm tổng hợp/tổ hợp/nhóm môn nào được cấu hình và chỉ bật khối: mở danh sách.<br>5. Ở nguồn của công thức: lặp thứ tự chọn Thiết lập tổng hợp thứ hạng → Đối tượng tổng hợp, chọn nhóm khác với nguồn điều kiện; lưu, mở lại. |
| Expected | 1. Trong ba loại cơ bản chỉ có Khối（学年） và Lớp chủ nhiệm（ホームルーム）; không có Lớp học（授業）. Có nhóm tổng hợp thứ hạng “Toán I khối 1+2”, nhóm tổ hợp “Tổ hợp Toán”, nhóm môn học “Nhóm môn Toán”, hiển thị bằng tên đã đặt.<br>2. Có thêm lựa chọn Lớp học（授業） trong cùng X; không phải tạo cấu hình tổng hợp mới để có loại này.<br>3. Không còn khối/lớp chủ nhiệm/lớp học; nhóm tổng hợp, tổ hợp, nhóm môn vẫn chọn được. Mở lại hiện đúng tên nhóm tổng hợp thứ hạng “Toán I khối 1+2” (đã lưu theo ID).<br>4. Chỉ có Khối（学年）; không hiện cố định đủ sáu loại, không có lựa chọn rỗng mang tên loại chưa cấu hình.<br>5. Nguồn điều kiện và nguồn công thức mở lại đúng lựa chọn riêng của từng phần. Form không có công tắc bật/tắt tổng hợp riêng của điểm đỏ, không có trường thứ hạng, tên hiển thị hay biểu đồ lấy từ màn công khai. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| switch-sequence | Bước 1–3 cùng X theo thứ tự | 1. Trong ba loại cơ bản chỉ có Khối（学年） và Lớp chủ nhiệm（ホームルーム）; không có Lớp học（授業）. Có nhóm tổng hợp thứ hạng “Toán I khối 1+2”, nhóm tổ hợp “Tổ hợp Toán”, nhóm môn học “Nhóm môn Toán”, hiển thị bằng tên đã đặt.<br>2. Có thêm lựa chọn Lớp học（授業） trong cùng X; không phải tạo cấu hình tổng hợp mới để có loại này.<br>3. Không còn khối/lớp chủ nhiệm/lớp học; nhóm tổng hợp, tổ hợp, nhóm môn vẫn chọn được. Mở lại hiện đúng tên nhóm tổng hợp thứ hạng “Toán I khối 1+2” (đã lưu theo ID).<br>4. Chỉ có Khối（学年）; không hiện cố định đủ sáu loại, không có lựa chọn rỗng mang tên loại chưa cấu hình.<br>5. Nguồn điều kiện và nguồn công thức mở lại đúng lựa chọn riêng của từng phần. Form không có công tắc bật/tắt tổng hợp riêng của điểm đỏ, không có trường thứ hạng, tên hiển thị hay biểu đồ lấy từ màn công khai. |
| grade-only | Bước 4 với fixture chỉ khối | 1. Trong ba loại cơ bản chỉ có Khối（学年） và Lớp chủ nhiệm（ホームルーム）; không có Lớp học（授業）. Có nhóm tổng hợp thứ hạng “Toán I khối 1+2”, nhóm tổ hợp “Tổ hợp Toán”, nhóm môn học “Nhóm môn Toán”, hiển thị bằng tên đã đặt.<br>2. Có thêm lựa chọn Lớp học（授業） trong cùng X; không phải tạo cấu hình tổng hợp mới để có loại này.<br>3. Không còn khối/lớp chủ nhiệm/lớp học; nhóm tổng hợp, tổ hợp, nhóm môn vẫn chọn được. Mở lại hiện đúng tên nhóm tổng hợp thứ hạng “Toán I khối 1+2” (đã lưu theo ID).<br>4. Chỉ có Khối（学年）; không hiện cố định đủ sáu loại, không có lựa chọn rỗng mang tên loại chưa cấu hình.<br>5. Nguồn điều kiện và nguồn công thức mở lại đúng lựa chọn riêng của từng phần. Form không có công tắc bật/tắt tổng hợp riêng của điểm đỏ, không có trường thứ hạng, tên hiển thị hay biểu đồ lấy từ màn công khai. |
| formula-source | Bước 5, chuẩn bị nguồn điều kiện trước | 1. Trong ba loại cơ bản chỉ có Khối（学年） và Lớp chủ nhiệm（ホームルーム）; không có Lớp học（授業）. Có nhóm tổng hợp thứ hạng “Toán I khối 1+2”, nhóm tổ hợp “Tổ hợp Toán”, nhóm môn học “Nhóm môn Toán”, hiển thị bằng tên đã đặt.<br>2. Có thêm lựa chọn Lớp học（授業） trong cùng X; không phải tạo cấu hình tổng hợp mới để có loại này.<br>3. Không còn khối/lớp chủ nhiệm/lớp học; nhóm tổng hợp, tổ hợp, nhóm môn vẫn chọn được. Mở lại hiện đúng tên nhóm tổng hợp thứ hạng “Toán I khối 1+2” (đã lưu theo ID).<br>4. Chỉ có Khối（学年）; không hiện cố định đủ sáu loại, không có lựa chọn rỗng mang tên loại chưa cấu hình.<br>5. Nguồn điều kiện và nguồn công thức mở lại đúng lựa chọn riêng của từng phần. Form không có công tắc bật/tắt tổng hợp riêng của điểm đỏ, không có trường thứ hạng, tên hiển thị hay biểu đồ lấy từ màn công khai. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Nguồn theo nhóm tổng hợp chứa G-A và G-B (không dùng nhóm theo khối vì G-A thuộc khối 1, G-B thuộc khối 2); các lớp học phần G-A, G-B, G-C |
| Thao tác | 1. Xem kết quả của học sinh G-A điểm 24 (Đỏ) và 26 (Không đỏ).<br>2. Chạy trích xuất chỉ lọc lớp G-A.<br>3. Chạy lại xét. |
| Expected | Kết quả vẫn dùng `T=25` (từ `A=50` của cả nhóm). Lọc lớp ở đầu ra hoặc đối tượng chỉ G-A không làm trung bình thành 40 (`T=20`). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Kết quả vẫn dùng `T=25` (từ `A=50` của cả nhóm). Lọc lớp ở đầu ra hoặc đối tượng chỉ G-A không làm trung bình thành 40 (`T=20`). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); bản tổng hợp đã chốt (trung bình 49.99), bản tổng hợp mới nhất chưa chốt (trung bình 62), cặp quy tắc phân nhánh theo trung bình 60; học sinh điểm 24 và 26 |
| Thao tác | 1. Chạy nút cam.<br>2. Xem kết quả. |
| Expected | Dùng `A=49.99` → nhánh ưu tiên 2 (`A&lt;60`), `T=24.995` → điểm 24 Đỏ, điểm 26 Không đỏ. Không dùng `A=62` (sẽ vào nhánh `A≥60`, `T=30`, điểm 26 Đỏ). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Dùng `A=49.99` → nhánh ưu tiên 2 (`A&lt;60`), `T=24.995` → điểm 24 Đỏ, điểm 26 Không đỏ. Không dùng `A=62` (sẽ vào nhánh `A≥60`, `T=30`, điểm 26 Đỏ). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: bản tổng hợp mới nhất chưa chốt (trung bình 62), cặp quy tắc phân nhánh theo trung bình 60 |
| Thao tác | 1. Chạy nút cam.<br>2. Xem kết quả học sinh điểm 26 và 29.<br>3. Bắt đầu một lượt tổng hợp mới cùng phạm vi sau bản tổng hợp mới nhất chưa chốt (trung bình 62) nhưng chưa hoàn tất (đang chạy hoặc thất bại); chạy lại nút cam. |
| Expected | 1–2. Dùng `A=62` (mới nhất, cùng kỳ) → nhánh `A≥60`, `T=30` → 26 và 29 Đỏ. Không dùng bản cũ hơn hoặc bản khác kỳ.<br><br>3. Vẫn dùng `A=62` của bản hoàn tất mới nhất; không đọc lượt tổng hợp chưa hoàn tất. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| completed | Bản mới nhất hoàn tất | 1–2. Dùng `A=62` (mới nhất, cùng kỳ) → nhánh `A≥60`, `T=30` → 26 và 29 Đỏ. Không dùng bản cũ hơn hoặc bản khác kỳ.<br><br>3. Vẫn dùng `A=62` của bản hoàn tất mới nhất; không đọc lượt tổng hợp chưa hoàn tất. |
| running | Bản mới đang chạy | 1–2. Dùng `A=62` (mới nhất, cùng kỳ) → nhánh `A≥60`, `T=30` → 26 và 29 Đỏ. Không dùng bản cũ hơn hoặc bản khác kỳ.<br><br>3. Vẫn dùng `A=62` của bản hoàn tất mới nhất; không đọc lượt tổng hợp chưa hoàn tất. |
| failed | Bản mới thất bại | 1–2. Dùng `A=62` (mới nhất, cùng kỳ) → nhánh `A≥60`, `T=30` → 26 và 29 Đỏ. Không dùng bản cũ hơn hoặc bản khác kỳ.<br><br>3. Vẫn dùng `A=62` của bản hoàn tất mới nhất; không đọc lượt tổng hợp chưa hoàn tất. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: bản đã chốt thiếu dữ liệu của ô, bản tổng hợp mới nhất chưa chốt (trung bình 62), cặp quy tắc phân nhánh theo trung bình 60 |
| Thao tác | 1. Chạy nút cam.<br>2. Xem kết quả và ba đầu ra. |
| Expected | Chưa xét được; ngừng dùng dấu/lọc đỏ cũ; điểm giữ nguyên. Không dùng bản tổng hợp mới nhất chưa chốt (trung bình 62) hay bản khác kỳ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Chưa xét được; ngừng dùng dấu/lọc đỏ cũ; điểm giữ nguyên. Không dùng bản tổng hợp mới nhất chưa chốt (trung bình 62) hay bản khác kỳ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: nguồn chưa có kết quả tổng hợp |
| Thao tác | 1. Chạy nút cam.<br>2. Xem kết quả. |
| Expected | Chưa xét được; `A` không bị coi là 0 (nếu coi 0 thì `T=0`, mọi điểm dương Không đỏ); không dùng nhóm khác; ngừng dấu đỏ cũ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Chưa xét được; `A` không bị coi là 0 (nếu coi 0 thì `T=0`, mọi điểm dương Không đỏ); không dùng nhóm khác; ngừng dấu đỏ cũ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30), quy tắc tỷ lệ 30%, nguồn chưa có kết quả tổng hợp, học sinh S01 (điểm 29) |
| Thao tác | 1. Chỉ có quy tắc “Cố định 30” (dưới 30) (Toàn bộ, không điều kiện trung bình): đăng ký S01=29.<br>2. Chỉ có quy tắc tỷ lệ 30%: đăng ký S01=29.<br>3. Chỉ có quy tắc "cố định 30 `&lt;`, điều kiện `A≥60`": đăng ký S01=29. |
| Expected | 1. Đỏ (không cần nguồn).<br>2. Đỏ (`M=100`, `T=30`; không cần nguồn).<br>3. Chưa xét được; không bỏ điều kiện để áp 30 cho mọi học sinh. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| fixed | Ngưỡng cố định | 1. Đỏ (không cần nguồn).<br>2. Đỏ (`M=100`, `T=30`; không cần nguồn).<br>3. Chưa xét được; không bỏ điều kiện để áp 30 cho mọi học sinh. |
| ratio | Ngưỡng tỷ lệ | 1. Đỏ (không cần nguồn).<br>2. Đỏ (`M=100`, `T=30`; không cần nguồn).<br>3. Chưa xét được; không bỏ điều kiện để áp 30 cho mọi học sinh. |
| average-condition | Điều kiện trung bình | 1. Đỏ (không cần nguồn).<br>2. Đỏ (`M=100`, `T=30`; không cần nguồn).<br>3. Chưa xét được; không bỏ điều kiện để áp 30 cho mọi học sinh. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: G-A có `10/20`, G-B có `80/100`; fixture nguồn đã chuẩn bị/quan sát phải ghi rõ giá trị `R` thực sự được reader sử dụng. Với nguồn tổng điểm/tổng M, fixture này cho `R=75%`; P1 có `S=60`, ngưỡng cố định `T=70` hợp lệ với `M=100`. |
| Thao tác | 1. Lưu quy tắc theo tỷ lệ điểm của nhóm từ 65% với nguồn là nhóm trên; ghi source snapshot/reader và xác nhận `R=75%` đã được chuẩn bị.<br>2. Chạy nút xanh rồi nút cam cho phạm vi.<br>3. Xem màn kết quả xử lý và kết quả P1. |
| Expected | 1. Lưu được; không bị chặn vì nhóm có lớp khác M.<br><br>2–3. Xử lý hoàn tất, không lỗi dừng do khác M. Ghi lại trong evidence nguồn/bản snapshot và `R` thực sự được reader dùng; nếu reader dùng nguồn tổng điểm/tổng M thì fixture này cho `R=(10+80)/(20+100)×100=75%`, khớp `≥65%`, `T=70` và P1 Đỏ. Không dùng phép tính trong case để áp đặt một cách tổng hợp mới; không dùng trung bình tỷ lệ cá nhân làm oracle thay cho nguồn hiện hữu. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. Lưu được; không bị chặn vì nhóm có lớp khác M.<br><br>2–3. Xử lý hoàn tất, không lỗi dừng do khác M. Ghi lại trong evidence nguồn/bản snapshot và `R` thực sự được reader dùng; nếu reader dùng nguồn tổng điểm/tổng M thì fixture này cho `R=(10+80)/(20+100)×100=75%`, khớp `≥65%`, `T=70` và P1 Đỏ. Không dùng phép tính trong case để áp đặt một cách tổng hợp mới; không dùng trung bình tỷ lệ cá nhân làm oracle thay cho nguồn hiện hữu. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100), mục số thập phân (M=100); quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29), học sinh S09 (mục số thập phân 29.5) |
| Thao tác | 1. Lưu quy tắc công thức (không bị chặn vì tự tổng hợp đang bật).<br>2. Đặt tự tổng hợp = Không thực hiện（実行しない）, đăng ký S01=29. |
| Expected | 1. Lưu được; không có ràng buộc hệ thống buộc tắt.<br>2. S01 vẫn được xét khi đăng ký → Đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. Lưu được; không có ràng buộc hệ thống buộc tắt.<br>2. S01 vẫn được xét khi đăng ký → Đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: thiết lập tổng hợp X đã bật thêm Lớp học（授業）, học sinh S11 học hai lớp Toán I (G-A, G-D); mục số nguyên (M=100); S11 có điểm 25 ở cả G-A và G-D |
| Thao tác | 1. Chạy nút cam cho G-A và G-D.<br>2. Xem kết quả hai ô của S11 trên trích xuất. |
| Expected | - Ô ở G-A: `T=40×0.5=20` → 25 Không đỏ.<br>- Ô ở G-D: `T=70×0.5=35` → 25 Đỏ.<br>- Không ô nào dùng kết quả của lớp kia, của khối/lớp chủ nhiệm, hay trung bình chung của môn. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | - Ô ở G-A: `T=40×0.5=20` → 25 Không đỏ.<br>- Ô ở G-D: `T=70×0.5=35` → 25 Đỏ.<br>- Không ô nào dùng kết quả của lớp kia, của khối/lớp chủ nhiệm, hay trung bình chung của môn. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: nhóm môn học “Nhóm môn Toán”; mục số nguyên (M=100); S01 = 25 |
| Thao tác | 1. Chạy nút cam; xem S01 và nhóm được dùng.<br>2. Xóa cấu hình riêng của Toán I (để môn rơi về default); chạy lại; xem.<br>3. Làm default thiếu hoặc trỏ tới cấu hình không hợp lệ (biến thể (b) của nhóm môn học “Nhóm môn Toán”); chạy lại; xem trạng thái và thông báo. |
| Expected | 1. Dùng kết quả của nhóm theo cấu hình riêng của Toán I.<br>2. Dùng kết quả của nhóm theo default đã lưu.<br>3. S01 Chưa xét được; không thay bằng nhóm khác, bằng 0 hay bằng kết quả trước; thông báo/tiến độ tách phần chưa xét được. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| private | Nguồn riêng | 1. Dùng kết quả của nhóm theo cấu hình riêng của Toán I.<br>2. Dùng kết quả của nhóm theo default đã lưu.<br>3. S01 Chưa xét được; không thay bằng nhóm khác, bằng 0 hay bằng kết quả trước; thông báo/tiến độ tách phần chưa xét được. |
| default | Nguồn mặc định | 1. Dùng kết quả của nhóm theo cấu hình riêng của Toán I.<br>2. Dùng kết quả của nhóm theo default đã lưu.<br>3. S01 Chưa xét được; không thay bằng nhóm khác, bằng 0 hay bằng kết quả trước; thông báo/tiến độ tách phần chưa xét được. |
| default-missing | Nguồn mặc định thiếu | 1. Dùng kết quả của nhóm theo cấu hình riêng của Toán I.<br>2. Dùng kết quả của nhóm theo default đã lưu.<br>3. S01 Chưa xét được; không thay bằng nhóm khác, bằng 0 hay bằng kết quả trước; thông báo/tiến độ tách phần chưa xét được. |
| default-invalid | Nguồn mặc định không hợp lệ | 1. Dùng kết quả của nhóm theo cấu hình riêng của Toán I.<br>2. Dùng kết quả của nhóm theo default đã lưu.<br>3. S01 Chưa xét được; không thay bằng nhóm khác, bằng 0 hay bằng kết quả trước; thông báo/tiến độ tách phần chưa xét được. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: thiết lập tổng hợp X đã bật thêm Lớp học（授業）, nhóm tổng hợp thứ hạng “Toán I khối 1+2”; mục số nguyên (M=100); học sinh S01 (điểm 29) |
| Thao tác | 1. (a) Tạo quy tắc mới dùng nhóm tổng hợp nhóm tổng hợp thứ hạng “Toán I khối 1+2” nhưng X chưa chạy tổng hợp cho nhóm này; chạy nút cam; xem S01.<br>2. (b) Quy tắc đang dùng X / Lớp học: tắt công tắc Lớp học（授業） của trường/năm; mở danh sách quy tắc và xem S01 (chưa chạy).<br>3. Chạy nút cam; xem S01.<br>4. (c) Xóa nhóm nhóm tổng hợp thứ hạng “Toán I khối 1+2” đang được quy tắc khác tham chiếu; chạy nút cam; xem ô dùng quy tắc đó. |
| Expected | 1. S01 Chưa xét được (thiếu nguồn); lựa chọn nhóm tồn tại không có nghĩa đã có dữ liệu.<br>2. Chỉ đổi cấu hình: S01 vẫn giữ kết quả Đỏ trước (không bị xóa ngay).<br>3. S01 Chưa xét được; không tự chuyển sang khối/lớp chủ nhiệm hoặc nhóm khác, không dùng quy tắc ưu tiên thấp hơn, không dùng kết quả cũ làm hiện hành.<br>4. Ô chịu ảnh hưởng Chưa xét được; không âm thầm đổi loại/ID nhóm đã lưu. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| missing-source | Nguồn mới thiếu | 1. S01 Chưa xét được (thiếu nguồn); lựa chọn nhóm tồn tại không có nghĩa đã có dữ liệu.<br>2. Chỉ đổi cấu hình: S01 vẫn giữ kết quả Đỏ trước (không bị xóa ngay).<br>3. S01 Chưa xét được; không tự chuyển sang khối/lớp chủ nhiệm hoặc nhóm khác, không dùng quy tắc ưu tiên thấp hơn, không dùng kết quả cũ làm hiện hành.<br>4. Ô chịu ảnh hưởng Chưa xét được; không âm thầm đổi loại/ID nhóm đã lưu. |
| disabled-group | Nhóm bị tắt | 1. S01 Chưa xét được (thiếu nguồn); lựa chọn nhóm tồn tại không có nghĩa đã có dữ liệu.<br>2. Chỉ đổi cấu hình: S01 vẫn giữ kết quả Đỏ trước (không bị xóa ngay).<br>3. S01 Chưa xét được; không tự chuyển sang khối/lớp chủ nhiệm hoặc nhóm khác, không dùng quy tắc ưu tiên thấp hơn, không dùng kết quả cũ làm hiện hành.<br>4. Ô chịu ảnh hưởng Chưa xét được; không âm thầm đổi loại/ID nhóm đã lưu. |
| deleted-group | Nhóm bị xóa | 1. S01 Chưa xét được (thiếu nguồn); lựa chọn nhóm tồn tại không có nghĩa đã có dữ liệu.<br>2. Chỉ đổi cấu hình: S01 vẫn giữ kết quả Đỏ trước (không bị xóa ngay).<br>3. S01 Chưa xét được; không tự chuyển sang khối/lớp chủ nhiệm hoặc nhóm khác, không dùng quy tắc ưu tiên thấp hơn, không dùng kết quả cũ làm hiện hành.<br>4. Ô chịu ảnh hưởng Chưa xét được; không âm thầm đổi loại/ID nhóm đã lưu. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); (a) Điều kiện trung bình `A≥60`, ngưỡng cố định 30, bỏ trống một phần hoặc toàn bộ nguồn (thời kỳ, thiết lập tổng hợp, nhóm tham chiếu); (b) điều kiện tỷ lệ nhóm ≥65%, nguồn bỏ trống; (c) Toàn bộ đối tượng, ngưỡng Công thức tính（計算式） `A×0.5`, nguồn của công thức bỏ trống |
| Thao tác | Nhập từng biến thể, bấm Lưu; mở lại danh sách. |
| Expected | Cả ba biến thể không lưu được; có thông báo thiếu nguồn. Không lưu quy tắc với điều kiện bị bỏ đi hoặc nguồn trống; danh sách quy tắc không đổi. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| condition-period | Điều kiện trung bình thiếu kỳ | Cả ba biến thể không lưu được; có thông báo thiếu nguồn. Không lưu quy tắc với điều kiện bị bỏ đi hoặc nguồn trống; danh sách quy tắc không đổi. |
| condition-setting | Điều kiện trung bình thiếu thiết lập | Cả ba biến thể không lưu được; có thông báo thiếu nguồn. Không lưu quy tắc với điều kiện bị bỏ đi hoặc nguồn trống; danh sách quy tắc không đổi. |
| condition-group | Điều kiện trung bình thiếu nhóm | Cả ba biến thể không lưu được; có thông báo thiếu nguồn. Không lưu quy tắc với điều kiện bị bỏ đi hoặc nguồn trống; danh sách quy tắc không đổi. |
| condition-all | Điều kiện trung bình thiếu toàn bộ | Cả ba biến thể không lưu được; có thông báo thiếu nguồn. Không lưu quy tắc với điều kiện bị bỏ đi hoặc nguồn trống; danh sách quy tắc không đổi. |
| ratio-all | Điều kiện tỷ lệ thiếu nguồn | Cả ba biến thể không lưu được; có thông báo thiếu nguồn. Không lưu quy tắc với điều kiện bị bỏ đi hoặc nguồn trống; danh sách quy tắc không đổi. |
| formula-all | Công thức thiếu nguồn | Cả ba biến thể không lưu được; có thông báo thiếu nguồn. Không lưu quy tắc với điều kiện bị bỏ đi hoặc nguồn trống; danh sách quy tắc không đổi. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: thiết lập tổng hợp X（評点集計）; ID nhóm tổng hợp của trường B (trường B (trường khác)); ID nhóm tổng hợp của năm khác; mục số nguyên (M=100); tài khoản giáo viên có quyền sửa mục |
| Thao tác | Gửi request lưu quy tắc có nguồn (điều kiện hoặc công thức) với từng biến thể:<br>1. Loại Lớp học（授業） trong khi công tắc lớp học đang tắt.<br>2. Nhóm tổng hợp mang ID của trường B.<br>3. Nhóm tổng hợp mang ID của năm học khác.<br>4. Nhóm môn học（科目グループ） có ID không tồn tại. |
| Expected | Cả bốn biến thể bị từ chối; không lưu quy tắc; danh sách quy tắc không đổi; không trả về tên/dữ liệu của trường hay năm khác. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| condition-disabled | Điều kiện nhóm tắt | Cả bốn biến thể bị từ chối; không lưu quy tắc; danh sách quy tắc không đổi; không trả về tên/dữ liệu của trường hay năm khác. |
| condition-school | Điều kiện sai trường | Cả bốn biến thể bị từ chối; không lưu quy tắc; danh sách quy tắc không đổi; không trả về tên/dữ liệu của trường hay năm khác. |
| condition-year | Điều kiện sai năm | Cả bốn biến thể bị từ chối; không lưu quy tắc; danh sách quy tắc không đổi; không trả về tên/dữ liệu của trường hay năm khác. |
| condition-missing | Điều kiện nhóm không tồn tại | Cả bốn biến thể bị từ chối; không lưu quy tắc; danh sách quy tắc không đổi; không trả về tên/dữ liệu của trường hay năm khác. |
| formula-disabled | Công thức nhóm tắt | Cả bốn biến thể bị từ chối; không lưu quy tắc; danh sách quy tắc không đổi; không trả về tên/dữ liệu của trường hay năm khác. |
| formula-school | Công thức sai trường | Cả bốn biến thể bị từ chối; không lưu quy tắc; danh sách quy tắc không đổi; không trả về tên/dữ liệu của trường hay năm khác. |
| formula-year | Công thức sai năm | Cả bốn biến thể bị từ chối; không lưu quy tắc; danh sách quy tắc không đổi; không trả về tên/dữ liệu của trường hay năm khác. |
| formula-missing | Công thức nhóm không tồn tại | Cả bốn biến thể bị từ chối; không lưu quy tắc; danh sách quy tắc không đổi; không trả về tên/dữ liệu của trường hay năm khác. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: nhóm có học sinh bị loại khỏi xếp hạng; S = 22 |
| Thao tác | Chạy nút xanh rồi nút cam; ghi `A` đọc được. |
| Expected | `A = (60+40+20)/3 = 40` (mẫu số là số người có điểm của cùng bản) → `T=20` → S=22 Không đỏ. Nếu hệ thống dùng số người thuộc xếp hạng (`A=100/2=50`, `T=25` → Đỏ) là sai. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | `A = (60+40+20)/3 = 40` (mẫu số là số người có điểm của cùng bản) → `T=20` → S=22 Không đỏ. Nếu hệ thống dùng số người thuộc xếp hạng (`A=100/2=50`, `T=25` → Đỏ) là sai. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục điểm đơn vị (đơn vị U1 có M riêng 40); trung bình riêng theo đơn vị (U1=40, U2=70) (U1 `A=40`, U2 `A=70`); S06 U1 = 25, U2 = 30 |
| Thao tác | Chạy nút xanh rồi nút cam. |
| Expected | Kỳ vọng theo đặc tả v2: U1 `T=20` → 25 Không đỏ; U2 `T=35` → 30 Đỏ. Nguồn trung bình theo đơn vị chưa tích hợp (đặc tả v2 mục 13.1): nếu không tách được thì ghi nhận, không đánh PASS. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Kỳ vọng theo đặc tả v2: U1 `T=20` → 25 Không đỏ; U2 `T=35` → 30 Đỏ. Nguồn trung bình theo đơn vị chưa tích hợp (đặc tả v2 mục 13.1): nếu không tách được thì ghi nhận, không đánh PASS. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc theo tỷ lệ điểm của nhóm từ 65%; (a) Bản tổng hợp của nhóm có tổng điểm tối đa = 0; (b) bản tổng hợp tồn tại nhưng không học sinh nào có điểm; S01 = 29 |
| Thao tác | Với từng nguồn: chạy nút xanh (nếu cần) rồi nút cam; xem kết quả S01. |
| Expected | (a) Điều kiện tỷ lệ nhóm không xác định được → Chưa xét được; không coi `R=0` là không khớp để thành Không áp dụng hay chuyển xuống ưu tiên thấp hơn.<br><br>(b) `A` không xác định được → Chưa xét được; không coi `A=0` (nếu coi 0 thì `T=0`, S01 Không đỏ — sai).<br><br>Cả hai: ngừng dấu đỏ cũ; không lấy nguồn khác. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| zero-maximum | Tổng điểm tối đa bằng 0 | (a) Điều kiện tỷ lệ nhóm không xác định được → Chưa xét được; không coi `R=0` là không khớp để thành Không áp dụng hay chuyển xuống ưu tiên thấp hơn.<br><br>(b) `A` không xác định được → Chưa xét được; không coi `A=0` (nếu coi 0 thì `T=0`, S01 Không đỏ — sai).<br><br>Cả hai: ngừng dấu đỏ cũ; không lấy nguồn khác. |
| zero-count | Số người bằng 0 | (a) Điều kiện tỷ lệ nhóm không xác định được → Chưa xét được; không coi `R=0` là không khớp để thành Không áp dụng hay chuyển xuống ưu tiên thấp hơn.<br><br>(b) `A` không xác định được → Chưa xét được; không coi `A=0` (nếu coi 0 thì `T=0`, S01 Không đỏ — sai).<br><br>Cả hai: ngừng dấu đỏ cũ; không lấy nguồn khác. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc theo tỷ lệ điểm của nhóm từ 65%; S = 60 |
| Thao tác | 1. Chạy nút xanh; ghi tổng điểm và tổng điểm tối đa hiển thị ở kết quả tổng hợp.<br>2. Chạy nút cam; xem kết quả S=60. |
| Expected | 1. Tổng điểm và tổng điểm tối đa lấy cùng tập học sinh có điểm theo cấu hình tổng hợp.<br>2. Với cấu hình tổng hợp không tính học sinh chưa có điểm: `R=140/200×100=70%` → khớp `≥65%` → `T=70` → S=60 Đỏ. Ghép tổng điểm của 2 người với tổng tối đa của 3 người (`140/300=46.7%` → Không áp dụng) là sai. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. Tổng điểm và tổng điểm tối đa lấy cùng tập học sinh có điểm theo cấu hình tổng hợp.<br>2. Với cấu hình tổng hợp không tính học sinh chưa có điểm: `R=140/200×100=70%` → khớp `≥65%` → `T=70` → S=60 Đỏ. Ghép tổng điểm của 2 người với tổng tối đa của 3 người (`140/300=46.7%` → Không áp dụng) là sai. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S01 (điểm 29); nguồn sau tổng hợp có `A=62` (giá trị như bản tổng hợp mới nhất chưa chốt (trung bình 62)) |
| Thao tác | 1. Chạy Thực hiện tổng hợp（集計実行） cho nguồn để có `A=62`; mở lại và lưu thiết lập quy tắc (không đổi nội dung). Xem đầu ra.<br>2. Chạy nút cam. Xem đầu ra. |
| Expected | 1. Vẫn Chưa xét được; không có dấu đỏ.<br>2. `T=62×0.5=31` → S01=29 Đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. Vẫn Chưa xét được; không có dấu đỏ.<br>2. `T=62×0.5=31` → S01=29 Đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Có rule mới thiếu nguồn/không khớp và kết quả legacy cũ của cùng ô. |
| Thao tác | 1. Chạy nút cam.<br>2. Xem trạng thái ô và ba đầu ra. |
| Expected | Ô chuyển đúng trạng thái Chưa xét được/Không áp dụng theo nguyên nhân; không dùng legacy làm fallback và không tự ghi đè kết quả cũ ngoài chính sách trạng thái đã xác nhận. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| no-match | Không quy tắc khớp | Ô chuyển đúng trạng thái Chưa xét được/Không áp dụng theo nguyên nhân; không dùng legacy làm fallback và không tự ghi đè kết quả cũ ngoài chính sách trạng thái đã xác nhận. |
| missing-input | Thiếu dữ liệu để xét | Ô chuyển đúng trạng thái Chưa xét được/Không áp dụng theo nguyên nhân; không dùng legacy làm fallback và không tự ghi đè kết quả cũ ngoài chính sách trạng thái đã xác nhận. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29), học sinh S03 (điểm 31) |
| Thao tác | 1. Ở màn đăng ký điểm của lớp G-A, nhập S01=29, S03=31, lưu.<br>2. Xem trích xuất. |
| Expected | Sau khi lưu thành công: S01 Đỏ, S03 Không đỏ. Đây là đường đăng ký trực tiếp với quy tắc cố định, nên không yêu cầu nguồn trung bình hoặc nút cam; không suy rộng kết luận này cho case dùng trung bình/tỷ lệ nhóm. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Sau khi lưu thành công: S01 Đỏ, S03 Không đỏ. Đây là đường đăng ký trực tiếp với quy tắc cố định, nên không yêu cầu nguồn trung bình hoặc nút cam; không suy rộng kết luận này cho case dùng trung bình/tỷ lệ nhóm. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29) |
| Thao tác | 1. Mở Đăng ký thành tích bằng CSV（成績CSV登録） của lớp G-A, nhập CSV với S01=29.<br>2. Xem kết quả ở trích xuất.<br>3. Nhập lại CSV với S01=31, xem kết quả. |
| Expected | 1–2. Nhập thành công → S01 được xét: Đỏ, ở cả (a) và (b) (không phụ thuộc việc trường có tính tự động).<br><br>3. S01 Không đỏ; không còn dấu đỏ cũ.<br><br>Điểm và kết quả nhất quán theo ranh giới giao dịch hiện có (tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn”). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| auto-on | Trường có tính tự động, thực hiện toàn bộ chuỗi CSV | 1–2. Nhập thành công → S01 được xét: Đỏ, ở cả (a) và (b) (không phụ thuộc việc trường có tính tự động).<br><br>3. S01 Không đỏ; không còn dấu đỏ cũ.<br><br>Điểm và kết quả nhất quán theo ranh giới giao dịch hiện có (tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn”). |
| auto-off | Trường không có tính tự động, cùng chuỗi CSV | 1–2. Nhập thành công → S01 được xét: Đỏ, ở cả (a) và (b) (không phụ thuộc việc trường có tính tự động).<br><br>3. S01 Không đỏ; không còn dấu đỏ cũ.<br><br>Điểm và kết quả nhất quán theo ranh giới giao dịch hiện có (tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn”). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), các lớp học phần G-A, G-B, G-C, học sinh S01 (điểm 29) |
| Thao tác | 1. Liên kết kết quả chấm của G-A với S01=29 (quy tắc cố định quy tắc “Cố định 30” (dưới 30)), gồm trường hợp lớp không có quy tắc tính tự động.<br>2. Liên kết kết quả chấm của G-C với một học sinh của G-C = 28.<br>3. Xem điểm đã ghi và kết quả đỏ của hai lớp.<br>4. (Tùy chọn) Lặp lại với quy tắc cần trung bình. |
| Expected | 1. S01 Đỏ.<br><br>2–3. Điểm 28 của G-C đã được ghi và ô đó được xét → Đỏ, dù AutoRating bị bỏ qua. Không có ô đã ghi nào ở G-C bị để lại không có kết quả.<br><br>4. Quy tắc cần trung bình: liên kết không chạy tổng hợp thứ hạng nên trung bình có thể cũ — việc chấp nhận trung bình cũ chưa chốt, phần này TBD, không đánh PASS/FAIL. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| linked | Liên kết điểm ở G-A | 1. S01 Đỏ.<br><br>2–3. Điểm 28 của G-C đã được ghi và ô đó được xét → Đỏ, dù AutoRating bị bỏ qua. Không có ô đã ghi nào ở G-C bị để lại không có kết quả.<br><br>4. Quy tắc cần trung bình: liên kết không chạy tổng hợp thứ hạng nên trung bình có thể cũ — việc chấp nhận trung bình cũ chưa chốt, phần này TBD, không đánh PASS/FAIL. |
| auto-skipped | Nhánh AutoRating bỏ qua ở G-C | 1. S01 Đỏ.<br><br>2–3. Điểm 28 của G-C đã được ghi và ô đó được xét → Đỏ, dù AutoRating bị bỏ qua. Không có ô đã ghi nào ở G-C bị để lại không có kết quả.<br><br>4. Quy tắc cần trung bình: liên kết không chạy tổng hợp thứ hạng nên trung bình có thể cũ — việc chấp nhận trung bình cũ chưa chốt, phần này TBD, không đánh PASS/FAIL. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc tỷ lệ 30% |
| Thao tác | 1. Ở màn đăng ký điểm lớp G-B, chọn lựa chọn lớp M=50 cho U1, lưu.<br>2. Xem kết quả S06. |
| Expected | Sau khi lưu thành công: M=50 → T=15 → S06=14 Đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Sau khi lưu thành công: M=50 → T=15 → S06=14 Đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc tỷ lệ 30% |
| Thao tác | 1. Lưu M=50 cho các lớp/kỳ được phép.<br>2. Ngay sau khi lưu (trước khi batch xong), xem kết quả.<br>3. Chờ batch hoàn tất, xem lại. |
| Expected | 1. Ngay sau khi lưu: kết quả cũ vẫn hiện; không báo "hoàn tất" khi mới xếp hàng.<br>2. Sau batch thành công: kết quả theo M=50. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. Ngay sau khi lưu: kết quả cũ vẫn hiện; không báo "hoàn tất" khi mới xếp hàng.<br>2. Sau batch thành công: kết quả theo M=50. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), tài khoản có quyền chạy hàng loạt |
| Thao tác | 1. Mở Tổng hợp thành tích（成績集計） (`/admin/grade/grade_setting_system/grade_calc`).<br>2. Tìm thao tác Thực hiện tính toán tự động（自動算出実行） cho Khối 1, kỳ 1学期期末 (cuối kỳ học kỳ 1).<br>3. Chạy, chờ hoàn tất, xem kết quả. |
| Expected | Chạy được bằng thao tác hàng loạt hiện có (không có chế độ xét đỏ riêng); sau khi chạy, các ô được xét theo quy tắc “Cố định 30” (dưới 30). Nhãn/cách hiện nút cho trường không có tính tự động chưa chốt — không đánh giá phần này. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Chạy được bằng thao tác hàng loạt hiện có (không có chế độ xét đỏ riêng); sau khi chạy, các ô được xét theo quy tắc “Cố định 30” (dưới 30). Nhãn/cách hiện nút cho trường không có tính tự động chưa chốt — không đánh giá phần này. |

#### TC-RS-FUNC-035 — Nhập CSV đăng ký điểm lớp chủ nhiệm hàng loạt（HR成績CSV一括登録） kích hoạt xét

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23 «Bao phủ đường đăng ký và chạy lại»); trạng thái nguồn TBD; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Awaiting decision |
| Readiness | Draft |
| Gap | G-ORACLE-TC-RS-FUNC-035, G-PREP-UNASSESSED |
| Cấu hình | mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30). Chạy hai lần: (a) trường có tính tự động, (b) trường không có tính tự động. |
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29) |
| Thao tác | 1. Nhập CSV đăng ký điểm lớp chủ nhiệm hàng loạt（HR成績CSV一括登録） với S01=28.<br>2. Xem kết quả. |
| Expected | Theo đặc tả v2 mục 7.2 “Bảng sự kiện”: nhập thành công → S01 Đỏ. tài liệu chia công việc v2 chưa đưa đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)” vào đường được hỗ trợ; code đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)” chỉ xếp hàng khi trường dùng tính tự động (context điểm đỏ khoảng trống tích hợp “Không có công thức / điểm sửa tay”) — cần xác nhận đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)” có thuộc đợt không. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| auto-on | Trường có tính tự động | Theo đặc tả v2 mục 7.2 “Bảng sự kiện”: nhập thành công → S01 Đỏ. tài liệu chia công việc v2 chưa đưa đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)” vào đường được hỗ trợ; code đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)” chỉ xếp hàng khi trường dùng tính tự động (context điểm đỏ khoảng trống tích hợp “Không có công thức / điểm sửa tay”) — cần xác nhận đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)” có thuộc đợt không. |
| auto-off | Trường không có tính tự động | Theo đặc tả v2 mục 7.2 “Bảng sự kiện”: nhập thành công → S01 Đỏ. tài liệu chia công việc v2 chưa đưa đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)” vào đường được hỗ trợ; code đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)” chỉ xếp hàng khi trường dùng tính tự động (context điểm đỏ khoảng trống tích hợp “Không có công thức / điểm sửa tay”) — cần xác nhận đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)” có thuộc đợt không. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30) |
| Thao tác | 1. Đổi ngưỡng thành 35 `&lt;`, lưu.<br>2. Xem ba đầu ra.<br>3. Đổi thứ tự quy tắc/đổi nguồn (nếu có), lưu, xem lại.<br>4. Chỉ đổi dấu (`&lt;35` → `≤35`), lưu, xem lại. Nếu công thức thuộc đợt phát hành: chỉ đổi công thức của một quy tắc công thức, lưu, xem lại.<br>5. Chạy lại (đăng ký lại điểm S03 hoặc nút cam), xem ba đầu ra. |
| Expected | 1. Sau lưu: không báo "đã cập nhật điểm đỏ học sinh"; có hướng dẫn chạy lại.<br><br>2–4. S03 vẫn Không đỏ theo kết quả trước; hiệu ứng hiển thị trước đó giữ nguyên.<br><br>5. Sau chạy lại thành công: S03 Đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. Sau lưu: không báo "đã cập nhật điểm đỏ học sinh"; có hướng dẫn chạy lại.<br><br>2–4. S03 vẫn Không đỏ theo kết quả trước; hiệu ứng hiển thị trước đó giữ nguyên.<br><br>5. Sau chạy lại thành công: S03 Đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29) |
| Thao tác | 1. Sửa S01 thành 40, lưu thành công.<br>2. Xem ba đầu ra ngay sau đó. |
| Expected | S01 Không đỏ; không cần bật một chế độ thủ công/tự động riêng. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | S01 Không đỏ; không cần bật một chế độ thủ công/tự động riêng. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục có M không hợp lệ, quy tắc công thức 100 ÷ trung bình, bản tổng hợp mới nhất chưa chốt (trung bình 62); học sinh S01 (điểm 29), nguồn chưa có kết quả tổng hợp |
| Thao tác | 1. Từ baseline độc lập, xác nhận S01=29 đang Đỏ; tạo biến thể (a) bằng cách đổi nguồn sang nguồn chưa có kết quả tổng hợp (không có tổng hợp), lưu, chạy lại.<br>2. Khôi phục/rebuild baseline S01=29 Đỏ; tạo biến thể (b) bằng quy tắc tỷ lệ với M không hợp lệ (mục có M không hợp lệ), rồi chạy lại.<br>3. Khôi phục/rebuild baseline S01=29 Đỏ; tạo biến thể (c) bằng quy tắc công thức 100 ÷ trung bình với `A=0`, rồi chạy lại.<br>4. Sau mỗi biến thể: xem ba đầu ra và điểm S01. |
| Expected | Mỗi biến thể: trạng thái Chưa xét được; dấu/lọc đỏ cũ ngừng ở cả ba đầu ra; điểm S01 vẫn 29; không đi xuống quy tắc thấp hơn; không bật lại ngưỡng cũ `red_score`. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| invalid-M | Nhánh invalid-M trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | Mỗi biến thể: trạng thái Chưa xét được; dấu/lọc đỏ cũ ngừng ở cả ba đầu ra; điểm S01 vẫn 29; không đi xuống quy tắc thấp hơn; không bật lại ngưỡng cũ `red_score`. |
| missing-source | Nhánh missing-source trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | Mỗi biến thể: trạng thái Chưa xét được; dấu/lọc đỏ cũ ngừng ở cả ba đầu ra; điểm S01 vẫn 29; không đi xuống quy tắc thấp hơn; không bật lại ngưỡng cũ `red_score`. |
| invalid-formula | Nhánh invalid-formula trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | Mỗi biến thể: trạng thái Chưa xét được; dấu/lọc đỏ cũ ngừng ở cả ba đầu ra; điểm S01 vẫn 29; không đi xuống quy tắc thấp hơn; không bật lại ngưỡng cũ `red_score`. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S01 (điểm 29) |
| Thao tác | 1. Đổi bộ lọc sang lớp G-B, lưu. Xem đầu ra.<br>2. Chạy lại. Xem đầu ra. |
| Expected | 1. S01 vẫn Đỏ (kết quả trước).<br>2. S01 Không áp dụng; ngừng dấu/lọc đỏ cũ; điểm giữ nguyên. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. S01 vẫn Đỏ (kết quả trước).<br>2. S01 Không áp dụng; ngừng dấu/lọc đỏ cũ; điểm giữ nguyên. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100), quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29), cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước |
| Thao tác | 1. Xóa quy tắc “Cố định 30” (dưới 30) (quy tắc cuối).<br>2. Xem ba đầu ra.<br>3. Chạy lại bằng đăng ký điểm lớp G-A hoặc chạy hàng loạt.<br>4. Xem ba đầu ra và cấu hình trình bày đầu ra. |
| Expected | 1–2. Danh sách rỗng nhưng S01 vẫn hiện dấu đỏ/thỏa lọc ở ba đầu ra.<br><br>3–4. Lần chạy xét cả mục đã hết quy tắc: S01 Không áp dụng, ngừng dấu/lọc; điểm giữ nguyên. Cấu hình trình bày đỏ đã lưu ở đầu ra không bị xóa như tác dụng phụ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| registration | Chạy lại bằng đăng ký điểm | 1–2. Danh sách rỗng nhưng S01 vẫn hiện dấu đỏ/thỏa lọc ở ba đầu ra.<br><br>3–4. Lần chạy xét cả mục đã hết quy tắc: S01 Không áp dụng, ngừng dấu/lọc; điểm giữ nguyên. Cấu hình trình bày đỏ đã lưu ở đầu ra không bị xóa như tác dụng phụ. |
| batch | Chạy lại bằng nút cam, reset baseline trước lượt này | 1–2. Danh sách rỗng nhưng S01 vẫn hiện dấu đỏ/thỏa lọc ở ba đầu ra.<br><br>3–4. Lần chạy xét cả mục đã hết quy tắc: S01 Không áp dụng, ngừng dấu/lọc; điểm giữ nguyên. Cấu hình trình bày đỏ đã lưu ở đầu ra không bị xóa như tác dụng phụ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S01 (điểm 29), cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu |
| Thao tác | 1. Xóa điểm S01 thành trống, lưu.<br>2. Xem ba đầu ra, chạy trích xuất có lọc đỏ. |
| Expected | S01 Không có điểm; không còn dấu đỏ; không thỏa lọc đỏ nhờ ô này. Không cần chờ chạy lại. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | S01 Không có điểm; không còn dấu đỏ; không thỏa lọc đỏ nhờ ô này. Không cần chờ chạy lại. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: bản tổng hợp mới nhất chưa chốt (trung bình 62) |
| Thao tác | 1. Sửa điểm nhóm để trung bình mới là 40, bấm Thực hiện tổng hợp（集計実行）.<br>2. Xem kết quả học sinh 24.<br>3. Bấm Thực hiện tính toán tự động（自動算出実行）, xem lại. |
| Expected | 1–2. Vẫn Đỏ theo kết quả trước (không tự xét lại).<br><br>3. `A=40` → `T=20` → 24 Không đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1–2. Vẫn Đỏ theo kết quả trước (không tự xét lại).<br><br>3. `A=40` → `T=20` → 24 Không đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc tỷ lệ 30% |
| Thao tác | 1. Sửa Giá trị tối đa（最大値） của mục số nguyên (M=100) ở Thiết lập ô nhập（入力欄設定） thành 200, lưu. Xem kết quả.<br>2. Lưu một định nghĩa lựa chọn ở Thiết lập điểm tối đa（満点設定） (`/admin/grade_report_setting/manage/detail/option/register/change_max_score`) (chưa gán cho lớp). Xem kết quả.<br>3. Đăng ký lại điểm S03. Xem kết quả. |
| Expected | 1–2. S03 vẫn Không đỏ (kết quả trước).<br><br>3. `M=200` → `T=60` → S03=31 Đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1–2. S03 vẫn Không đỏ (kết quả trước).<br><br>3. `M=200` → `T=60` → S03=31 Đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30) |
| Thao tác | 1. Bấm Thực hiện tổng hợp（集計実行）, chờ hoàn tất.<br>2. Xem kết quả S03. |
| Expected | S03 vẫn Không đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | S03 vẫn Không đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước |
| Thao tác | 1. Chạy trích xuất, xuất Excel.<br>2. Mở màn công khai học sinh, tải PDF công khai.<br>3. Xuất PDF phiếu. |
| Expected | S03 vẫn Không đỏ ở mọi đầu ra; không có lượt xét mới (thời điểm kết quả không đổi); không có lượt tổng hợp mới (lượt/thời điểm tổng hợp mới nhất không đổi). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| extract | Trích xuất màn | S03 vẫn Không đỏ ở mọi đầu ra; không có lượt xét mới (thời điểm kết quả không đổi); không có lượt tổng hợp mới (lượt/thời điểm tổng hợp mới nhất không đổi). |
| excel | File Excel | S03 vẫn Không đỏ ở mọi đầu ra; không có lượt xét mới (thời điểm kết quả không đổi); không có lượt tổng hợp mới (lượt/thời điểm tổng hợp mới nhất không đổi). |
| publish-web | Màn công khai | S03 vẫn Không đỏ ở mọi đầu ra; không có lượt xét mới (thời điểm kết quả không đổi); không có lượt tổng hợp mới (lượt/thời điểm tổng hợp mới nhất không đổi). |
| publish-pdf | PDF công khai | S03 vẫn Không đỏ ở mọi đầu ra; không có lượt xét mới (thời điểm kết quả không đổi); không có lượt tổng hợp mới (lượt/thời điểm tổng hợp mới nhất không đổi). |
| report | Phiếu điểm | S03 vẫn Không đỏ ở mọi đầu ra; không có lượt xét mới (thời điểm kết quả không đổi); không có lượt tổng hợp mới (lượt/thời điểm tổng hợp mới nhất không đổi). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29), cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) |
| Thao tác | 1. Chạy nút cam 3 lần liên tiếp (chờ mỗi lần hoàn tất).<br>2. Xem trích xuất; SELECT số kết quả hiện hành của ô S01 (khi có schema). |
| Expected | Ô S01 hiện `※29!` (không `※※29!!`); chỉ một kết quả hiện hành cho ô. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Ô S01 hiện `※29!` (không `※※29!!`); chỉ một kết quả hiện hành cho ô. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục điểm đơn vị (đơn vị U1 có M riêng 40); quy tắc “Cố định 30” (dưới 30); các lớp học phần G-A, G-B, G-C; học sinh S06 (điểm dự kiến 24) |
| Thao tác | 1. Xác nhận U1 Đỏ ở ba đầu ra.<br>2. Biến thể (a): xóa điểm U1 của S06 thành trống rồi lưu.<br>3. Khôi phục/rebuild fixture U1 Đỏ, U2 Không đỏ; biến thể (b): thôi dùng đơn vị U1 cho lớp G-B theo thao tác hiện có (nếu màn hỗ trợ), rồi đăng ký lại hoặc chạy nút cam cho G-B.<br>4. Xem ba đầu ra và bộ lọc đỏ của trích xuất. |
| Expected | 1. Mỗi biến thể dùng fixture độc lập. Sau (a) hoặc (b), ô U1 của S06 trong fixture tương ứng không còn dấu đỏ ở ba đầu ra; bộ lọc đỏ không giữ S06 chỉ vì U1 cũ.<br>2. U2 giữ kết quả Không đỏ; không bị gộp hay xét lại sai. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| delete-unit | Nhánh delete-unit trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Mỗi biến thể dùng fixture độc lập. Sau (a) hoặc (b), ô U1 của S06 trong fixture tương ứng không còn dấu đỏ ở ba đầu ra; bộ lọc đỏ không giữ S06 chỉ vì U1 cũ.<br>2. U2 giữ kết quả Không đỏ; không bị gộp hay xét lại sai. |
| disable-unit | Nhánh disable-unit trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Mỗi biến thể dùng fixture độc lập. Sau (a) hoặc (b), ô U1 của S06 trong fixture tương ứng không còn dấu đỏ ở ba đầu ra; bộ lọc đỏ không giữ S06 chỉ vì U1 cũ.<br>2. U2 giữ kết quả Không đỏ; không bị gộp hay xét lại sai. |

#### TC-RS-ERR-012 — Nhập CSV lựa chọn điểm tối đa của lớp

| Field | Value |
| --- | --- |
| Chức năng | Vòng đời kết quả |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị” (AC-G24 «Trigger khi đổi điểm tối đa/đơn vị»); trạng thái nguồn TBD; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Awaiting decision |
| Readiness | Draft |
| Gap | G-ORACLE-TC-RS-ERR-012, G-PREP-UNASSESSED |
| Cấu hình | mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc tỷ lệ 30% (30%); S06 U1=14 Không đỏ với M=40. |
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc tỷ lệ 30%; CSV gán lựa chọn M=50 cho lớp G-B |
| Thao tác | 1. Nhập CSV lựa chọn điểm tối đa.<br>2. Xem kết quả S06 U1. |
| Expected | TBD (chưa chốt): có cần xét lại ngay (`T=15` → Đỏ) hay giữ kết quả trước tới lần chạy lại. Ghi hành vi thực tế. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | TBD (chưa chốt): có cần xét lại ngay (`T=15` → Đỏ) hay giữ kết quả trước tới lần chạy lại. Ghi hành vi thực tế. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục điểm đơn vị (đơn vị U1 có M riêng 40) |
| Thao tác | 1. Bỏ sử dụng đơn vị U1 cho lớp (hoặc thay khung điểm theo thao tác hiện có) để ô bị xóa/ngừng hoạt động.<br>2. Tạo lại ô, nhập 35, lưu.<br>3. Xem đầu ra.<br>4. Đưa ô về Đỏ (nhập 29, lưu). Xóa ô (hoặc xóa mềm theo thao tác hiện có), rồi kích hoạt lại/tạo lại ô với **cùng giá trị 29** nhưng không qua đường xét (nếu có thao tác như vậy, ví dụ khôi phục); xem đầu ra. Sau đó đăng ký lại điểm và xem.<br>5. Bắt đầu batch cho lớp khi ô đang Đỏ; khi batch chưa xong, xóa ô rồi tạo lại và nhập 35. Chờ batch cũ xong, xem đầu ra và SELECT. |
| Expected | Sau bước 1: không còn dấu đỏ của ô cũ. Sau bước 2: ô mới được xét theo 35 → Không đỏ; không mang kết quả Đỏ cũ.<br><br>4. Kích hoạt lại/nhập lại cùng giá trị không làm kết quả Đỏ trước khi xóa sống lại; ô chỉ có kết quả của lần xét sau khi tạo lại.<br>5. Lượt batch cũ không ghi kết quả vào ô đã tạo lại; ô giữ kết quả của lần đăng ký 35 (Không đỏ). (PROPOSED theo thiết kế DB v2 mục 4.4 “Cập nhật và hiệu lực kết quả”, mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi”) Khi xóa: `cell_generation` mới, `judgment_status`=4 và thông tin quy tắc/ngưỡng/nguồn cũ bị xóa trong cùng transaction; dòng điều khiển được giữ; tạo lại dùng thế hệ mới. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| recreate35 | Bước 1–3 xóa rồi tạo lại 35 | Sau bước 1: không còn dấu đỏ của ô cũ. Sau bước 2: ô mới được xét theo 35 → Không đỏ; không mang kết quả Đỏ cũ.<br><br>4. Kích hoạt lại/nhập lại cùng giá trị không làm kết quả Đỏ trước khi xóa sống lại; ô chỉ có kết quả của lần xét sau khi tạo lại.<br>5. Lượt batch cũ không ghi kết quả vào ô đã tạo lại; ô giữ kết quả của lần đăng ký 35 (Không đỏ). (PROPOSED theo thiết kế DB v2 mục 4.4 “Cập nhật và hiệu lực kết quả”, mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi”) Khi xóa: `cell_generation` mới, `judgment_status`=4 và thông tin quy tắc/ngưỡng/nguồn cũ bị xóa trong cùng transaction; dòng điều khiển được giữ; tạo lại dùng thế hệ mới. |
| same29 | Bước 4 xóa rồi khôi phục cùng 29 | Sau bước 1: không còn dấu đỏ của ô cũ. Sau bước 2: ô mới được xét theo 35 → Không đỏ; không mang kết quả Đỏ cũ.<br><br>4. Kích hoạt lại/nhập lại cùng giá trị không làm kết quả Đỏ trước khi xóa sống lại; ô chỉ có kết quả của lần xét sau khi tạo lại.<br>5. Lượt batch cũ không ghi kết quả vào ô đã tạo lại; ô giữ kết quả của lần đăng ký 35 (Không đỏ). (PROPOSED theo thiết kế DB v2 mục 4.4 “Cập nhật và hiệu lực kết quả”, mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi”) Khi xóa: `cell_generation` mới, `judgment_status`=4 và thông tin quy tắc/ngưỡng/nguồn cũ bị xóa trong cùng transaction; dòng điều khiển được giữ; tạo lại dùng thế hệ mới. |
| old-batch | Bước 5 batch cũ sau tạo lại | Sau bước 1: không còn dấu đỏ của ô cũ. Sau bước 2: ô mới được xét theo 35 → Không đỏ; không mang kết quả Đỏ cũ.<br><br>4. Kích hoạt lại/nhập lại cùng giá trị không làm kết quả Đỏ trước khi xóa sống lại; ô chỉ có kết quả của lần xét sau khi tạo lại.<br>5. Lượt batch cũ không ghi kết quả vào ô đã tạo lại; ô giữ kết quả của lần đăng ký 35 (Không đỏ). (PROPOSED theo thiết kế DB v2 mục 4.4 “Cập nhật và hiệu lực kết quả”, mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi”) Khi xóa: `cell_generation` mới, `judgment_status`=4 và thông tin quy tắc/ngưỡng/nguồn cũ bị xóa trong cùng transaction; dòng điều khiển được giữ; tạo lại dùng thế hệ mới. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100), quy tắc “Cố định 30” (dưới 30); cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) |
| Thao tác | 1. Mở thiết lập hiển thị của trích xuất, khung Thiết lập chi tiết thông tin lớp học（授業情報の詳細設定）, phần điều kiện đỏ.<br>2. Cấu hình cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, lưu, mở lại.<br>3. Cấu hình cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) (hai ký hiệu cùng bật), lưu, mở lại.<br>4. (PROPOSED) Chạy SELECT cột `extract_setting` của dòng `grade_extract_conf` tương ứng mẫu vừa lưu, lọc theo trường/năm test.<br>5. (PROPOSED) Nếu màn có chức năng sao chép thiết lập trích xuất hiện có: sao chép mẫu cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, mở bản sao. |
| Expected | 1. Có bốn tùy chọn độc lập: lọc học sinh có điểm đỏ, ký hiệu phía trước, ký hiệu phía sau, tô màu ô.<br>2. Ký hiệu trước và sau cùng bật được.<br>3. Màu chỉ chọn từ bảng màu hiện có (không có bộ chọn màu tự do).<br>4. Mở lại giữ đúng giá trị.<br>5. (PROPOSED) JSON `extract_setting` chứa phần điều kiện đỏ với các khóa `use_target_extract`, `use_prefix_mark`, `prefix_mark`, `use_suffix_mark`, `suffix_mark`, `use_cell_coloring`, `cell_color` khớp giá trị trên màn; không có cột/bảng mới cho thiết lập này.<br>6. (PROPOSED) Bản sao giữ nguyên bốn tùy chọn, ký hiệu và màu. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| filter-color | Cấu hình lọc và màu | 1. Có bốn tùy chọn độc lập: lọc học sinh có điểm đỏ, ký hiệu phía trước, ký hiệu phía sau, tô màu ô.<br>2. Ký hiệu trước và sau cùng bật được.<br>3. Màu chỉ chọn từ bảng màu hiện có (không có bộ chọn màu tự do).<br>4. Mở lại giữ đúng giá trị.<br>5. (PROPOSED) JSON `extract_setting` chứa phần điều kiện đỏ với các khóa `use_target_extract`, `use_prefix_mark`, `prefix_mark`, `use_suffix_mark`, `suffix_mark`, `use_cell_coloring`, `cell_color` khớp giá trị trên màn; không có cột/bảng mới cho thiết lập này.<br>6. (PROPOSED) Bản sao giữ nguyên bốn tùy chọn, ký hiệu và màu. |
| prefix-suffix | Cấu hình ký hiệu trước/sau | 1. Có bốn tùy chọn độc lập: lọc học sinh có điểm đỏ, ký hiệu phía trước, ký hiệu phía sau, tô màu ô.<br>2. Ký hiệu trước và sau cùng bật được.<br>3. Màu chỉ chọn từ bảng màu hiện có (không có bộ chọn màu tự do).<br>4. Mở lại giữ đúng giá trị.<br>5. (PROPOSED) JSON `extract_setting` chứa phần điều kiện đỏ với các khóa `use_target_extract`, `use_prefix_mark`, `prefix_mark`, `use_suffix_mark`, `suffix_mark`, `use_cell_coloring`, `cell_color` khớp giá trị trên màn; không có cột/bảng mới cho thiết lập này.<br>6. (PROPOSED) Bản sao giữ nguyên bốn tùy chọn, ký hiệu và màu. |
| copy | Sao chép cấu hình theo phần đề xuất | 1. Có bốn tùy chọn độc lập: lọc học sinh có điểm đỏ, ký hiệu phía trước, ký hiệu phía sau, tô màu ô.<br>2. Ký hiệu trước và sau cùng bật được.<br>3. Màu chỉ chọn từ bảng màu hiện có (không có bộ chọn màu tự do).<br>4. Mở lại giữ đúng giá trị.<br>5. (PROPOSED) JSON `extract_setting` chứa phần điều kiện đỏ với các khóa `use_target_extract`, `use_prefix_mark`, `prefix_mark`, `use_suffix_mark`, `suffix_mark`, `use_cell_coloring`, `cell_color` khớp giá trị trên màn; không có cột/bảng mới cho thiết lập này.<br>6. (PROPOSED) Bản sao giữ nguyên bốn tùy chọn, ký hiệu và màu. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S10 (học lớp G-B và G-C), học sinh S03 (điểm 31), học sinh S06 (điểm dự kiến 24), mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc “Cố định 30” (dưới 30), cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) |
| Thao tác | 1. Chạy trích xuất với cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, phạm vi gồm Toán và Ngữ văn.<br>2. Chạy lại với phạm vi chỉ Ngữ văn.<br>3. Chạy với cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) (lọc tắt).<br>4. Với cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, chọn thời điểm khác thời điểm có ô Toán Đỏ của S10 (ô Toán của thời điểm đó Không đỏ).<br>5. Với cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu và mục điểm đơn vị (đơn vị U1 có M riêng 40): S06 có U1 Đỏ, U2 Không đỏ; chọn phạm vi chỉ U2.<br>6. Xóa thành công ô Toán của S10, chạy lại lọc với cả Toán và Ngữ văn. |
| Expected | 1. Bước 1: S10 có trong danh sách, S03 không.<br>2. Bước 2: S10 vẫn có trong danh sách nhờ Ngữ văn 20 Đỏ; không được loại S10 chỉ vì ô Toán ngoài phạm vi.<br>3. Bước 3: danh sách không bị lọc theo đỏ (chỉ bật ký hiệu không giới hạn học sinh).<br>4. Bước 4: S10 không có trong danh sách; ô đỏ ở thời điểm khác không giúp thỏa điều kiện.<br>5. Bước 5: S06 không có trong danh sách; ô đỏ của U1 ngoài phạm vi đơn vị.<br>6. S10 vẫn có trong danh sách nhờ Ngữ văn 20 Đỏ; ô Toán đã xóa không còn dấu đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| multi-red-scope | Bước 1, S10 có hai ô đỏ trong phạm vi | 1. Bước 1: S10 có trong danh sách, S03 không.<br>2. Bước 2: S10 vẫn có trong danh sách nhờ Ngữ văn 20 Đỏ; không được loại S10 chỉ vì ô Toán ngoài phạm vi.<br>3. Bước 3: danh sách không bị lọc theo đỏ (chỉ bật ký hiệu không giới hạn học sinh).<br>4. Bước 4: S10 không có trong danh sách; ô đỏ ở thời điểm khác không giúp thỏa điều kiện.<br>5. Bước 5: S06 không có trong danh sách; ô đỏ của U1 ngoài phạm vi đơn vị.<br>6. S10 vẫn có trong danh sách nhờ Ngữ văn 20 Đỏ; ô Toán đã xóa không còn dấu đỏ. |
| one-red-in-scope | Bước 2, S10 chỉ còn Ngữ văn trong phạm vi | 1. Bước 1: S10 có trong danh sách, S03 không.<br>2. Bước 2: S10 vẫn có trong danh sách nhờ Ngữ văn 20 Đỏ; không được loại S10 chỉ vì ô Toán ngoài phạm vi.<br>3. Bước 3: danh sách không bị lọc theo đỏ (chỉ bật ký hiệu không giới hạn học sinh).<br>4. Bước 4: S10 không có trong danh sách; ô đỏ ở thời điểm khác không giúp thỏa điều kiện.<br>5. Bước 5: S06 không có trong danh sách; ô đỏ của U1 ngoài phạm vi đơn vị.<br>6. S10 vẫn có trong danh sách nhờ Ngữ văn 20 Đỏ; ô Toán đã xóa không còn dấu đỏ. |
| no-red-in-scope | Đối chứng S03 của bước 1, không ô nào đỏ | 1. Bước 1: S10 có trong danh sách, S03 không.<br>2. Bước 2: S10 vẫn có trong danh sách nhờ Ngữ văn 20 Đỏ; không được loại S10 chỉ vì ô Toán ngoài phạm vi.<br>3. Bước 3: danh sách không bị lọc theo đỏ (chỉ bật ký hiệu không giới hạn học sinh).<br>4. Bước 4: S10 không có trong danh sách; ô đỏ ở thời điểm khác không giúp thỏa điều kiện.<br>5. Bước 5: S06 không có trong danh sách; ô đỏ của U1 ngoài phạm vi đơn vị.<br>6. S10 vẫn có trong danh sách nhờ Ngữ văn 20 Đỏ; ô Toán đã xóa không còn dấu đỏ. |
| filter-off | Bước 3, chỉ ký hiệu và tắt lọc | 1. Bước 1: S10 có trong danh sách, S03 không.<br>2. Bước 2: S10 vẫn có trong danh sách nhờ Ngữ văn 20 Đỏ; không được loại S10 chỉ vì ô Toán ngoài phạm vi.<br>3. Bước 3: danh sách không bị lọc theo đỏ (chỉ bật ký hiệu không giới hạn học sinh).<br>4. Bước 4: S10 không có trong danh sách; ô đỏ ở thời điểm khác không giúp thỏa điều kiện.<br>5. Bước 5: S06 không có trong danh sách; ô đỏ của U1 ngoài phạm vi đơn vị.<br>6. S10 vẫn có trong danh sách nhờ Ngữ văn 20 Đỏ; ô Toán đã xóa không còn dấu đỏ. |
| another-period-only | Bước 4, ô đỏ nằm ở thời điểm khác | 1. Bước 1: S10 có trong danh sách, S03 không.<br>2. Bước 2: S10 vẫn có trong danh sách nhờ Ngữ văn 20 Đỏ; không được loại S10 chỉ vì ô Toán ngoài phạm vi.<br>3. Bước 3: danh sách không bị lọc theo đỏ (chỉ bật ký hiệu không giới hạn học sinh).<br>4. Bước 4: S10 không có trong danh sách; ô đỏ ở thời điểm khác không giúp thỏa điều kiện.<br>5. Bước 5: S06 không có trong danh sách; ô đỏ của U1 ngoài phạm vi đơn vị.<br>6. S10 vẫn có trong danh sách nhờ Ngữ văn 20 Đỏ; ô Toán đã xóa không còn dấu đỏ. |
| other-unit-only | Bước 5, chỉ U2 Không đỏ | 1. Bước 1: S10 có trong danh sách, S03 không.<br>2. Bước 2: S10 vẫn có trong danh sách nhờ Ngữ văn 20 Đỏ; không được loại S10 chỉ vì ô Toán ngoài phạm vi.<br>3. Bước 3: danh sách không bị lọc theo đỏ (chỉ bật ký hiệu không giới hạn học sinh).<br>4. Bước 4: S10 không có trong danh sách; ô đỏ ở thời điểm khác không giúp thỏa điều kiện.<br>5. Bước 5: S06 không có trong danh sách; ô đỏ của U1 ngoài phạm vi đơn vị.<br>6. S10 vẫn có trong danh sách nhờ Ngữ văn 20 Đỏ; ô Toán đã xóa không còn dấu đỏ. |
| after-delete | Bước 6 sau baseline bước 1, xóa Toán nhưng giữ Ngữ văn | 1. Bước 1: S10 có trong danh sách, S03 không.<br>2. Bước 2: S10 vẫn có trong danh sách nhờ Ngữ văn 20 Đỏ; không được loại S10 chỉ vì ô Toán ngoài phạm vi.<br>3. Bước 3: danh sách không bị lọc theo đỏ (chỉ bật ký hiệu không giới hạn học sinh).<br>4. Bước 4: S10 không có trong danh sách; ô đỏ ở thời điểm khác không giúp thỏa điều kiện.<br>5. Bước 5: S06 không có trong danh sách; ô đỏ của U1 ngoài phạm vi đơn vị.<br>6. S10 vẫn có trong danh sách nhờ Ngữ văn 20 Đỏ; ô Toán đã xóa không còn dấu đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S10 (học lớp G-B và G-C), cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) |
| Thao tác | 1. Chạy trích xuất cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, xem dòng S10.<br>2. Chạy cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau), xem dòng S10. |
| Expected | 1. cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu: ô Toán hiện `*24` với nền màu Đỏ（赤） của bảng màu; ô Ngữ văn `70` không ký hiệu, không màu; không tô cả dòng.<br>2. cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau): ô Toán `※24!`; ô Ngữ văn `70`. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| prefix-color | Ký hiệu trước và màu | 1. cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu: ô Toán hiện `*24` với nền màu Đỏ（赤） của bảng màu; ô Ngữ văn `70` không ký hiệu, không màu; không tô cả dòng.<br>2. cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau): ô Toán `※24!`; ô Ngữ văn `70`. |
| prefix-suffix | Ký hiệu trước và sau | 1. cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu: ô Toán hiện `*24` với nền màu Đỏ（赤） của bảng màu; ô Ngữ văn `70` không ký hiệu, không màu; không tô cả dòng.<br>2. cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau): ô Toán `※24!`; ô Ngữ văn `70`. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau), học sinh S05 (ô trống), học sinh S10 (học lớp G-B và G-C) |
| Thao tác | 1. Chạy trích xuất, chụp màn kết quả.<br>2. Xuất Excel, mở file.<br>3. Lặp bước 1–2 với: (a) cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) (lọc đỏ TẮT); (b) phạm vi không có ô đỏ nào (0 kết quả); (c) sau khi một ô Đỏ bị ngừng kết quả cũ (như case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”, Chưa xét được); (d) mục có điểm bị ẩn theo thiết lập ẩn mục nhập (như case “Mục bị ẩn theo thiết lập ẩn mục nhập”). |
| Expected | 1–2. Danh sách học sinh trong Excel giống màn hình (lọc đỏ đang bật). Cùng ô: ký hiệu, màu nền, số liệu, ô trống trong Excel giống màn hình. Ô trống không hiện số 0. Tải Excel không kích hoạt xét.<br><br>3. Mỗi biến thể: file Excel khớp màn hình cùng lần — (a) đủ học sinh, chỉ ô đỏ có ký hiệu/màu; (b) Excel không có học sinh giống màn hình; (c) ô bị ngừng kết quả cũ không còn ký hiệu/màu; (d) điểm ẩn không hiện lại trong Excel. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| filter-on | Lượt ban đầu bật lọc | 1–2. Danh sách học sinh trong Excel giống màn hình (lọc đỏ đang bật). Cùng ô: ký hiệu, màu nền, số liệu, ô trống trong Excel giống màn hình. Ô trống không hiện số 0. Tải Excel không kích hoạt xét.<br><br>3. Mỗi biến thể: file Excel khớp màn hình cùng lần — (a) đủ học sinh, chỉ ô đỏ có ký hiệu/màu; (b) Excel không có học sinh giống màn hình; (c) ô bị ngừng kết quả cũ không còn ký hiệu/màu; (d) điểm ẩn không hiện lại trong Excel. |
| filter-off | Nhánh a tắt lọc | 1–2. Danh sách học sinh trong Excel giống màn hình (lọc đỏ đang bật). Cùng ô: ký hiệu, màu nền, số liệu, ô trống trong Excel giống màn hình. Ô trống không hiện số 0. Tải Excel không kích hoạt xét.<br><br>3. Mỗi biến thể: file Excel khớp màn hình cùng lần — (a) đủ học sinh, chỉ ô đỏ có ký hiệu/màu; (b) Excel không có học sinh giống màn hình; (c) ô bị ngừng kết quả cũ không còn ký hiệu/màu; (d) điểm ẩn không hiện lại trong Excel. |
| empty | Nhánh b không có ô đỏ | 1–2. Danh sách học sinh trong Excel giống màn hình (lọc đỏ đang bật). Cùng ô: ký hiệu, màu nền, số liệu, ô trống trong Excel giống màn hình. Ô trống không hiện số 0. Tải Excel không kích hoạt xét.<br><br>3. Mỗi biến thể: file Excel khớp màn hình cùng lần — (a) đủ học sinh, chỉ ô đỏ có ký hiệu/màu; (b) Excel không có học sinh giống màn hình; (c) ô bị ngừng kết quả cũ không còn ký hiệu/màu; (d) điểm ẩn không hiện lại trong Excel. |
| stale | Nhánh c kết quả không còn hiệu lực | 1–2. Danh sách học sinh trong Excel giống màn hình (lọc đỏ đang bật). Cùng ô: ký hiệu, màu nền, số liệu, ô trống trong Excel giống màn hình. Ô trống không hiện số 0. Tải Excel không kích hoạt xét.<br><br>3. Mỗi biến thể: file Excel khớp màn hình cùng lần — (a) đủ học sinh, chỉ ô đỏ có ký hiệu/màu; (b) Excel không có học sinh giống màn hình; (c) ô bị ngừng kết quả cũ không còn ký hiệu/màu; (d) điểm ẩn không hiện lại trong Excel. |
| hidden | Nhánh d điểm ẩn | 1–2. Danh sách học sinh trong Excel giống màn hình (lọc đỏ đang bật). Cùng ô: ký hiệu, màu nền, số liệu, ô trống trong Excel giống màn hình. Ô trống không hiện số 0. Tải Excel không kích hoạt xét.<br><br>3. Mỗi biến thể: file Excel khớp màn hình cùng lần — (a) đủ học sinh, chỉ ô đỏ có ký hiệu/màu; (b) Excel không có học sinh giống màn hình; (c) ô bị ngừng kết quả cũ không còn ký hiệu/màu; (d) điểm ẩn không hiện lại trong Excel. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Ký hiệu đầu BẬT, ô trống; ký hiệu cuối BẬT, ô trống |
| Thao tác | Chạy trích xuất với từng biến thể. |
| Expected | Có lỗi yêu cầu nhập ký hiệu; không chạy trích xuất. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| prefix | Ký hiệu trước trống | Có lỗi yêu cầu nhập ký hiệu; không chạy trích xuất. |
| suffix | Ký hiệu sau trống | Có lỗi yêu cầu nhập ký hiệu; không chạy trích xuất. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu |
| Thao tác | 1. Mở Trích xuất thành tích（成績抽出）→ Thiết lập mục hiển thị（表示項目設定）→ chi tiết mục Điểm đánh giá（評点） kỳ Cuối kỳ học kỳ 1（1学期期末）.<br>2. Ghi lại vị trí và nhãn các tùy chọn đỏ. |
| Expected | Theo specification v2 mục 9.1, có bốn tùy chọn độc lập: lọc học sinh có điểm đỏ, ký hiệu phía trước, ký hiệu phía sau và tô màu ô; màu chỉ chọn từ bảng màu hiện có. Vị trí và nhãn cụ thể trên UI theo Figma chỉ là tham khảo, không thay đổi oracle nghiệp vụ.<br><br>Không đánh giá nhãn/vị trí cụ thể của Figma như một oracle riêng; chỉ kiểm tra đủ bốn tùy chọn nghiệp vụ và việc lưu/mở lại đúng giá trị. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Theo specification v2 mục 9.1, có bốn tùy chọn độc lập: lọc học sinh có điểm đỏ, ký hiệu phía trước, ký hiệu phía sau và tô màu ô; màu chỉ chọn từ bảng màu hiện có. Vị trí và nhãn cụ thể trên UI theo Figma chỉ là tham khảo, không thay đổi oracle nghiệp vụ.<br><br>Không đánh giá nhãn/vị trí cụ thể của Figma như một oracle riêng; chỉ kiểm tra đủ bốn tùy chọn nghiệp vụ và việc lưu/mở lại đúng giá trị. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu; (a) Không ô đỏ nào; (b) học sinh điểm 23.9 Đỏ (mục thập phân) |
| Thao tác | Chạy trích xuất cho (a), (b). |
| Expected | (a) Không lỗi; hiện thông báo không có học sinh khớp.<br><br>(b) Ô hiện `*23.9` (giữ nguyên giá trị điểm). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| empty | Fixture a không ô đỏ | (a) Không lỗi; hiện thông báo không có học sinh khớp.<br><br>(b) Ô hiện `*23.9` (giữ nguyên giá trị điểm). |
| decimal | Fixture b điểm thập phân 23.9 | (a) Không lỗi; hiện thông báo không có học sinh khớp.<br><br>(b) Ô hiện `*23.9` (giữ nguyên giá trị điểm). |

#### TC-RS-ERR-013 — Trích xuất: ô vừa thỏa điều kiện màu khác vừa là ô đỏ

| Field | Value |
| --- | --- |
| Chức năng | Trích xuất thành tích（成績抽出） |
| screen_relative_path | unknown |
| Căn cứ | tiêu chí nghiệm thu “Hiển thị ô trích xuất” (AC-G30 «Hiển thị ô trích xuất»); trạng thái nguồn TBD; ưu tiên nguồn TBD |
| Priority | Medium |
| Căn cứ kỳ vọng | Awaiting decision |
| Readiness | Draft |
| Gap | G-ORACLE-TC-RS-ERR-013, G-PREP-UNASSESSED |
| Cấu hình | Mục có điều kiện Khoảng điểm（点数範囲） 0–30 tô Vàng（黄） và điều kiện đỏ tô Đỏ（赤）, ký hiệu `*`. |
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S01 (điểm 29) (29) |
| Thao tác | Chạy trích xuất, xuất Excel. |
| Expected | TBD (chưa chốt) cho màu cuối. CONFIRMED phần không tranh chấp: điều kiện Khoảng điểm vẫn giữ nghĩa cũ; màn hình và Excel cho cùng kết quả. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | TBD (chưa chốt) cho màu cuối. CONFIRMED phần không tranh chấp: điều kiện Khoảng điểm vẫn giữ nghĩa cũ; màn hình và Excel cho cùng kết quả. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30); học sinh S01–S10 |
| Thao tác | 1. Chạy lại ba mẫu, xuất Excel, so với baseline.<br>2. Mở màn tạo mẫu trích xuất mới, Thiết lập công khai thành tích（成績公開設定） chưa từng lưu hiệu ứng đỏ, và dòng Thiết lập điểm đỏ（赤点設定） của một bảng phiếu điểm mới. |
| Expected | 1. Danh sách học sinh, giá trị, ký hiệu, màu và định dạng Excel bằng baseline (mẫu chưa bật tùy chọn đỏ).<br>2. (PROPOSED) Trích xuất: lọc đỏ và các hiệu ứng đỏ mặc định TẮT; công khai: chưa chọn hiệu ứng đỏ nào, và khi chưa cấu hình thì màn học sinh vẫn hiển thị như hiện có dù mục có ô Đỏ; phiếu điểm: Nguyên trạng（そのまま表示）. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| color | Mẫu tô màu | 1. Danh sách học sinh, giá trị, ký hiệu, màu và định dạng Excel bằng baseline (mẫu chưa bật tùy chọn đỏ).<br>2. (PROPOSED) Trích xuất: lọc đỏ và các hiệu ứng đỏ mặc định TẮT; công khai: chưa chọn hiệu ứng đỏ nào, và khi chưa cấu hình thì màn học sinh vẫn hiển thị như hiện có dù mục có ô Đỏ; phiếu điểm: Nguyên trạng（そのまま表示）. |
| filter | Mẫu lọc | 1. Danh sách học sinh, giá trị, ký hiệu, màu và định dạng Excel bằng baseline (mẫu chưa bật tùy chọn đỏ).<br>2. (PROPOSED) Trích xuất: lọc đỏ và các hiệu ứng đỏ mặc định TẮT; công khai: chưa chọn hiệu ứng đỏ nào, và khi chưa cấu hình thì màn học sinh vẫn hiển thị như hiện có dù mục có ô Đỏ; phiếu điểm: Nguyên trạng（そのまま表示）. |
| symbol | Mẫu ký hiệu | 1. Danh sách học sinh, giá trị, ký hiệu, màu và định dạng Excel bằng baseline (mẫu chưa bật tùy chọn đỏ).<br>2. (PROPOSED) Trích xuất: lọc đỏ và các hiệu ứng đỏ mặc định TẮT; công khai: chưa chọn hiệu ứng đỏ nào, và khi chưa cấu hình thì màn học sinh vẫn hiển thị như hiện có dù mục có ô Đỏ; phiếu điểm: Nguyên trạng（そのまま表示）. |
| defaults | Bước 2 các cấu hình mới, phần đề xuất | 1. Danh sách học sinh, giá trị, ký hiệu, màu và định dạng Excel bằng baseline (mẫu chưa bật tùy chọn đỏ).<br>2. (PROPOSED) Trích xuất: lọc đỏ và các hiệu ứng đỏ mặc định TẮT; công khai: chưa chọn hiệu ứng đỏ nào, và khi chưa cấu hình thì màn học sinh vẫn hiển thị như hiện có dù mục có ô Đỏ; phiếu điểm: Nguyên trạng（そのまま表示）. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); mục điểm đơn vị (đơn vị U1 có M riêng 40); học sinh S01 (điểm 29), học sinh S06 (điểm dự kiến 24), tài khoản học sinh S01, tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm) |
| Thao tác | 1. Ở Thiết lập công khai thành tích（成績公開設定）, mục mục số nguyên (M=100), chọn hiệu ứng đỏ Ngoặc（括弧）, lưu. Đăng nhập S01 xem Xác nhận thành tích（成績確認）.<br>2. Lặp với `*` phía trước.<br>3. Lặp với `*` phía sau.<br>4. Mở lại Thiết lập công khai thành tích.<br>5. Với mục điểm đơn vị mục điểm đơn vị (đơn vị U1 có M riêng 40) (S06 U1 = 25 Đỏ), chọn `*` phía trước, lưu; đăng nhập S06 xem. |
| Expected | 1–3. Lần lượt `(29)`, `*29`, `29*`. Không có nền màu riêng cho ô đỏ.<br><br>4. Hiệu ứng đã lưu gần nhất (`*` phía sau) được chọn sẵn.<br>5. Ô U1 hiện `*25`; ô U2 không ký hiệu. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| parentheses | Hiệu ứng ngoặc | 1–3. Lần lượt `(29)`, `*29`, `29*`. Không có nền màu riêng cho ô đỏ.<br><br>4. Hiệu ứng đã lưu gần nhất (`*` phía sau) được chọn sẵn.<br>5. Ô U1 hiện `*25`; ô U2 không ký hiệu. |
| prefix | Hiệu ứng phía trước | 1–3. Lần lượt `(29)`, `*29`, `29*`. Không có nền màu riêng cho ô đỏ.<br><br>4. Hiệu ứng đã lưu gần nhất (`*` phía sau) được chọn sẵn.<br>5. Ô U1 hiện `*25`; ô U2 không ký hiệu. |
| suffix-reopen | Hiệu ứng phía sau và mở lại | 1–3. Lần lượt `(29)`, `*29`, `29*`. Không có nền màu riêng cho ô đỏ.<br><br>4. Hiệu ứng đã lưu gần nhất (`*` phía sau) được chọn sẵn.<br>5. Ô U1 hiện `*25`; ô U2 không ký hiệu. |
| unit-prefix | Điểm đơn vị với hiệu ứng phía trước | 1–3. Lần lượt `(29)`, `*29`, `29*`. Không có nền màu riêng cho ô đỏ.<br><br>4. Hiệu ứng đã lưu gần nhất (`*` phía sau) được chọn sẵn.<br>5. Ô U1 hiện `*25`; ô U2 không ký hiệu. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Người có quyền cấu hình công khai; xem bằng tài khoản học sinh S06 đúng trường/năm/lịch mở. |
| Fixture | local: học sinh S06 (điểm dự kiến 24), tài khoản học sinh S06; fixture quyền phải map đúng học sinh S06, không dùng tài khoản S01 để xem dữ liệu S06. |
| Thao tác | Với mỗi dòng của bảng dưới, cấu hình hiệu ứng dự kiến và hiệu ứng đỏ, lưu, xem màn học sinh của S06.<br><br>(a) Ngoặc + `*` trước; (b) `*` trước + `*` trước; (c) Ngoặc + Ngoặc; (d) `*` trước + `*` sau; (e) không trang trí + Ngoặc; (f) điểm bị ẩn theo thiết lập hiện có（表示しない） + `*` trước. |
| Expected | (a) `(*24)`; (b) `*24`, không phải `**24`; (c) `(24)`, không phải `((24))`; (d) `*24*`; (e) `(24)`; (f) vẫn ẩn, không hiện số, không để lại riêng dấu `*`. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| a | Thực hiện tổ hợp (a) | (a) `(*24)`; (b) `*24`, không phải `**24`; (c) `(24)`, không phải `((24))`; (d) `*24*`; (e) `(24)`; (f) vẫn ẩn, không hiện số, không để lại riêng dấu `*`. |
| b | Thực hiện tổ hợp (b) | (a) `(*24)`; (b) `*24`, không phải `**24`; (c) `(24)`, không phải `((24))`; (d) `*24*`; (e) `(24)`; (f) vẫn ẩn, không hiện số, không để lại riêng dấu `*`. |
| c | Thực hiện tổ hợp (c) | (a) `(*24)`; (b) `*24`, không phải `**24`; (c) `(24)`, không phải `((24))`; (d) `*24*`; (e) `(24)`; (f) vẫn ẩn, không hiện số, không để lại riêng dấu `*`. |
| d | Thực hiện tổ hợp (d) | (a) `(*24)`; (b) `*24`, không phải `**24`; (c) `(24)`, không phải `((24))`; (d) `*24*`; (e) `(24)`; (f) vẫn ẩn, không hiện số, không để lại riêng dấu `*`. |
| e | Thực hiện tổ hợp (e) | (a) `(*24)`; (b) `*24`, không phải `**24`; (c) `(24)`, không phải `((24))`; (d) `*24*`; (e) `(24)`; (f) vẫn ẩn, không hiện số, không để lại riêng dấu `*`. |
| f | Thực hiện tổ hợp (f) | (a) `(*24)`; (b) `*24`, không phải `**24`; (c) `(24)`, không phải `((24))`; (d) `*24*`; (e) `(24)`; (f) vẫn ẩn, không hiện số, không để lại riêng dấu `*`. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S01 (điểm 29), tài khoản học sinh S01 |
| Thao tác | 1. Xem màn web Xác nhận thành tích（成績確認） của S01.<br>2. Gọi API công khai thành tích của S01 bằng phiên học sinh.<br>3. Tải PDF công khai của S01. |
| Expected | Cả ba hiển thị `*29` cho cùng ô; không nền màu. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| web | Màn web | Cả ba hiển thị `*29` cho cùng ô; không nền màu. |
| api | Response API | Cả ba hiển thị `*29` cho cùng ô; không nền màu. |
| pdf | File PDF | Cả ba hiển thị `*29` cho cùng ô; không nền màu. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: hai cấu hình công khai cùng một mục, cấu hình công khai có mục điểm thường và mục điểm đơn vị; mục số nguyên (M=100), mục điểm đơn vị (đơn vị U1 có M riêng 40); học sinh S01 (điểm 29); tài khoản học sinh S01, tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm) |
| Thao tác | 1. Ở X chọn hiệu ứng đỏ Ngoặc（括弧） cho mục số nguyên (M=100), lưu; ở Y chọn `*` phía trước（前に「*」） cho cùng mục, lưu.<br>2. Mở lại X và Y.<br>3. Đăng nhập S01, xem Xác nhận thành tích（成績確認） theo từng cấu hình; gọi API và xuất PDF tương ứng nếu có.<br>4. Sao chép X thành X' (theo chức năng sao chép cấu hình hiện có); mở X'.<br>5. Ở X, mục số nguyên (M=100) (điểm thường（通常）) chọn Ngoặc; mục điểm đơn vị (đơn vị U1 có M riêng 40) (điểm đơn vị（単元）) chọn `*` phía sau; lưu, mở lại.<br>6. Ở Y, đổi sang `*` phía sau và giả lập lỗi lưu; mở lại Y. |
| Expected | 1–2. X giữ Ngoặc, Y giữ `*` phía trước; lưu cấu hình này không đổi cấu hình kia.<br>3. Theo X: `(29)`; theo Y: `*29`. Web, API và PDF của cùng cấu hình cho cùng cách hiển thị.<br>4. X' giữ Ngoặc cho mục số nguyên (M=100); không sao chép kết quả xét của học sinh.<br>5. Mỗi phân loại thường/đơn vị mở lại đúng lựa chọn của mình; không trộn.<br>6. Có thông báo lỗi; Y vẫn là `*` phía trước (cấu hình cũ được giữ). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| web | Bước 1–3 xem X/Y trên web | 1–2. X giữ Ngoặc, Y giữ `*` phía trước; lưu cấu hình này không đổi cấu hình kia.<br>3. Theo X: `(29)`; theo Y: `*29`. Web, API và PDF của cùng cấu hình cho cùng cách hiển thị.<br>4. X' giữ Ngoặc cho mục số nguyên (M=100); không sao chép kết quả xét của học sinh.<br>5. Mỗi phân loại thường/đơn vị mở lại đúng lựa chọn của mình; không trộn.<br>6. Có thông báo lỗi; Y vẫn là `*` phía trước (cấu hình cũ được giữ). |
| api | Bước 1–3 đọc API X/Y | 1–2. X giữ Ngoặc, Y giữ `*` phía trước; lưu cấu hình này không đổi cấu hình kia.<br>3. Theo X: `(29)`; theo Y: `*29`. Web, API và PDF của cùng cấu hình cho cùng cách hiển thị.<br>4. X' giữ Ngoặc cho mục số nguyên (M=100); không sao chép kết quả xét của học sinh.<br>5. Mỗi phân loại thường/đơn vị mở lại đúng lựa chọn của mình; không trộn.<br>6. Có thông báo lỗi; Y vẫn là `*` phía trước (cấu hình cũ được giữ). |
| pdf | Bước 1–3 PDF X/Y | 1–2. X giữ Ngoặc, Y giữ `*` phía trước; lưu cấu hình này không đổi cấu hình kia.<br>3. Theo X: `(29)`; theo Y: `*29`. Web, API và PDF của cùng cấu hình cho cùng cách hiển thị.<br>4. X' giữ Ngoặc cho mục số nguyên (M=100); không sao chép kết quả xét của học sinh.<br>5. Mỗi phân loại thường/đơn vị mở lại đúng lựa chọn của mình; không trộn.<br>6. Có thông báo lỗi; Y vẫn là `*` phía trước (cấu hình cũ được giữ). |
| copy | Bước 4 sau setup X | 1–2. X giữ Ngoặc, Y giữ `*` phía trước; lưu cấu hình này không đổi cấu hình kia.<br>3. Theo X: `(29)`; theo Y: `*29`. Web, API và PDF của cùng cấu hình cho cùng cách hiển thị.<br>4. X' giữ Ngoặc cho mục số nguyên (M=100); không sao chép kết quả xét của học sinh.<br>5. Mỗi phân loại thường/đơn vị mở lại đúng lựa chọn của mình; không trộn.<br>6. Có thông báo lỗi; Y vẫn là `*` phía trước (cấu hình cũ được giữ). |
| item-types | Bước 5 | 1–2. X giữ Ngoặc, Y giữ `*` phía trước; lưu cấu hình này không đổi cấu hình kia.<br>3. Theo X: `(29)`; theo Y: `*29`. Web, API và PDF của cùng cấu hình cho cùng cách hiển thị.<br>4. X' giữ Ngoặc cho mục số nguyên (M=100); không sao chép kết quả xét của học sinh.<br>5. Mỗi phân loại thường/đơn vị mở lại đúng lựa chọn của mình; không trộn.<br>6. Có thông báo lỗi; Y vẫn là `*` phía trước (cấu hình cũ được giữ). |
| save-failure | Bước 6 sau setup Y | 1–2. X giữ Ngoặc, Y giữ `*` phía trước; lưu cấu hình này không đổi cấu hình kia.<br>3. Theo X: `(29)`; theo Y: `*29`. Web, API và PDF của cùng cấu hình cho cùng cách hiển thị.<br>4. X' giữ Ngoặc cho mục số nguyên (M=100); không sao chép kết quả xét của học sinh.<br>5. Mỗi phân loại thường/đơn vị mở lại đúng lựa chọn của mình; không trộn.<br>6. Có thông báo lỗi; Y vẫn là `*` phía trước (cấu hình cũ được giữ). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước |
| Thao tác | 1. Chạy trích xuất và xuất Excel.<br>2. Công khai cho học sinh, xem màn học sinh.<br>3. Xuất PDF phiếu. |
| Expected | Mọi thao tác hoàn tất bình thường; ô chưa có kết quả không có dấu đỏ và hiển thị theo thiết lập hiện hữu. Quyền, lịch công khai, điều kiện ẩn hiện có vẫn giữ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| extract | Trích xuất | Mọi thao tác hoàn tất bình thường; ô chưa có kết quả không có dấu đỏ và hiển thị theo thiết lập hiện hữu. Quyền, lịch công khai, điều kiện ẩn hiện có vẫn giữ. |
| excel | Excel | Mọi thao tác hoàn tất bình thường; ô chưa có kết quả không có dấu đỏ và hiển thị theo thiết lập hiện hữu. Quyền, lịch công khai, điều kiện ẩn hiện có vẫn giữ. |
| publish | Công khai | Mọi thao tác hoàn tất bình thường; ô chưa có kết quả không có dấu đỏ và hiển thị theo thiết lập hiện hữu. Quyền, lịch công khai, điều kiện ẩn hiện có vẫn giữ. |
| report | Phiếu điểm | Mọi thao tác hoàn tất bình thường; ô chưa có kết quả không có dấu đỏ và hiển thị theo thiết lập hiện hữu. Quyền, lịch công khai, điều kiện ẩn hiện có vẫn giữ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30) |
| Thao tác | 1. Mở Thiết lập công khai thành tích（成績公開設定）→ khung Thành tích（成績）.<br>2. Ở dòng của Điểm đánh giá（評点）, chọn `*` phía trước, bấm Đăng ký（登録する）.<br>3. Xóa quy tắc cuối của mục số nguyên (M=100) (chỉ còn quy tắc “Cố định 30” (dưới 30) thì xóa quy tắc “Cố định 30” (dưới 30)), **không** chạy lại; mở lại khung Thành tích（成績）. |
| Expected | 1. Mục Điểm đánh giá（評点） có dòng cách hiển thị đỏ dù 0 học sinh đỏ; mục Tri thức – kỹ năng（知識・技能） không có dòng.<br>2. Lưu được; mở lại vẫn là `*` phía trước.<br>3. Dòng của Điểm đánh giá（評点） vẫn hiện với lựa chọn `*` phía trước đã lưu; cấu hình trình bày không bị xóa theo thao tác xóa quy tắc. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. Mục Điểm đánh giá（評点） có dòng cách hiển thị đỏ dù 0 học sinh đỏ; mục Tri thức – kỹ năng（知識・技能） không có dòng.<br>2. Lưu được; mở lại vẫn là `*` phía trước.<br>3. Dòng của Điểm đánh giá（評点） vẫn hiện với lựa chọn `*` phía trước đã lưu; cấu hình trình bày không bị xóa theo thao tác xóa quy tắc. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | Mở danh sách chọn của dòng đỏ. |
| Expected | Theo specification v2 mục 10.1 và Q&amp;A Q16, danh sách chỉ có Kèm ngoặc, `*` phía trước và `*` phía sau; không có ô chữ tự do và không có màu nền riêng. Không đưa tùy chọn Nguyên trạng（そのまま表示） vào oracle vì không thuộc danh sách đã chốt trong specification/Q&amp;A. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Theo specification v2 mục 10.1 và Q&amp;A Q16, danh sách chỉ có Kèm ngoặc, `*` phía trước và `*` phía sau; không có ô chữ tự do và không có màu nền riêng. Không đưa tùy chọn Nguyên trạng（そのまま表示） vào oracle vì không thuộc danh sách đã chốt trong specification/Q&amp;A. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục thường và mục đơn vị cùng có kết quả đỏ; lựa chọn hiển thị khác nhau cho hai loại. |
| Thao tác | 1. Mở màn hình cấu hình công khai và đến khu vực hiển thị điểm đỏ.<br>2. Kiểm tra panel điểm thường và panel điểm đơn vị.<br>3. Chọn hiệu ứng khác nhau cho hai panel, lưu, đóng và mở lại. |
| Expected | 1. Cả hai panel đều hiển thị bộ chọn tương ứng; panel điểm đơn vị không bị nền hoặc lớp khác che.<br>2. Có thể thao tác hai bộ chọn độc lập.<br>3. Sau khi mở lại, mỗi panel giữ đúng lựa chọn của mình; lựa chọn điểm thường không ghi đè lựa chọn điểm đơn vị và ngược lại. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. Cả hai panel đều hiển thị bộ chọn tương ứng; panel điểm đơn vị không bị nền hoặc lớp khác che.<br>2. Có thể thao tác hai bộ chọn độc lập.<br>3. Sau khi mở lại, mỗi panel giữ đúng lựa chọn của mình; lựa chọn điểm thường không ghi đè lựa chọn điểm đơn vị và ngược lại. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cấu hình công khai: “*” phía trước; học sinh S06 (điểm dự kiến 24) |
| Thao tác | 1. Xem màn học sinh.<br>2. Làm S06 chuyển Chưa xét được (như case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”), xem lại.<br>3. Xóa quy tắc cuối, mở Thiết lập công khai thành tích（成績公開設定）. |
| Expected | 1. Học sinh Không đỏ hiển thị như baseline (ngoặc dự kiến).<br>2. S06 bỏ `*` đỏ nhưng giữ ngoặc dự kiến: `(24)`.<br>3. Cấu hình hiển thị đã lưu không bị xóa. Nền và định dạng khác như baseline. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. Học sinh Không đỏ hiển thị như baseline (ngoặc dự kiến).<br>2. S06 bỏ `*` đỏ nhưng giữ ngoặc dự kiến: `(24)`.<br>3. Cấu hình hiển thị đã lưu không bị xóa. Nền và định dạng khác như baseline. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Người có quyền cấu hình công khai; xem bằng tài khoản học sinh S06 đúng trường/năm/lịch mở. |
| Fixture | local: học sinh S06 (điểm dự kiến 24), tài khoản học sinh S06 theo TD-ROLE-06; TD-ROLE-05 thuộc S01 và không dùng cho case này. |
| Thao tác | 1. Xem màn học sinh, API, PDF của S06.<br>2. Xem khi lịch đóng. |
| Expected | 1. Điểm vẫn ẩn; không có dấu đỏ riêng lẻ.<br>2. Không xem được như baseline. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| web-open | Màn web lịch mở | 1. Điểm vẫn ẩn; không có dấu đỏ riêng lẻ.<br>2. Không xem được như baseline. |
| api-open | API lịch mở | 1. Điểm vẫn ẩn; không có dấu đỏ riêng lẻ.<br>2. Không xem được như baseline. |
| pdf-open | PDF lịch mở | 1. Điểm vẫn ẩn; không có dấu đỏ riêng lẻ.<br>2. Không xem được như baseline. |
| web-closed | Màn web lịch đóng | 1. Điểm vẫn ẩn; không có dấu đỏ riêng lẻ.<br>2. Không xem được như baseline. |
| api-closed | API lịch đóng | 1. Điểm vẫn ẩn; không có dấu đỏ riêng lẻ.<br>2. Không xem được như baseline. |
| pdf-closed | PDF lịch đóng | 1. Điểm vẫn ẩn; không có dấu đỏ riêng lẻ.<br>2. Không xem được như baseline. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S01 (điểm 29), cấu hình phiếu điểm: ký tự “※” phía trước, tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm) |
| Thao tác | Với từng cách hiển thị: chọn ở dòng Thiết lập điểm đỏ（赤点設定）, đóng hộp, bấm Cập nhật（更新する）, xuất PDF phiếu của S01.<br><br>(a) Nguyên trạng（そのまま表示）; (b) Kèm ngoặc（カッコ付き）; (c) Ký tự phía trước（前に任意の文字） `※`; (d) Ký tự phía sau（後ろに任意の文字） `※`. |
| Expected | (a) `29`; (b) `(29)`; (c) `※29`; (d) `29※`. Không nền màu; ký tự không tràn ô, không mất ký tự, không đổi cấu trúc template. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| unchanged | Nguyên trạng | (a) `29`; (b) `(29)`; (c) `※29`; (d) `29※`. Không nền màu; ký tự không tràn ô, không mất ký tự, không đổi cấu trúc template. |
| parentheses | Kèm ngoặc | (a) `29`; (b) `(29)`; (c) `※29`; (d) `29※`. Không nền màu; ký tự không tràn ô, không mất ký tự, không đổi cấu trúc template. |
| prefix | Ký tự phía trước | (a) `29`; (b) `(29)`; (c) `※29`; (d) `29※`. Không nền màu; ký tự không tràn ô, không mất ký tự, không đổi cấu trúc template. |
| suffix | Ký tự phía sau | (a) `29`; (b) `(29)`; (c) `※29`; (d) `29※`. Không nền màu; ký tự không tràn ô, không mất ký tự, không đổi cấu trúc template. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S06 (điểm dự kiến 24), học sinh S01 (điểm 29), học sinh S05 (ô trống), cấu hình phiếu điểm: ký tự “※” phía trước |
| Thao tác | Cấu hình hộp tùy chọn theo từng dòng, bấm Cập nhật（更新する）, xuất PDF.<br><br>(a) Dự kiến = Kèm ngoặc; đỏ = `※` trước → xem S06.<br><br>(b) Dự kiến = Nguyên trạng; đỏ = `※` trước → xem S06.<br><br>(c) Dự kiến = Ẩn（表示しない） hoặc Gạch chéo（斜線）; đỏ = `※` trước → xem S06.<br><br>(d) Không điều kiện phía trên khớp; đỏ = `※` trước → xem S01.<br><br>(e) Ô trống（空欄の場合）= Kèm ngoặc; đỏ = `※` trước → xem S05.<br><br>(f) Trường hợp môn cụ thể（特定の科目の場合） = Toán, Kèm ngoặc; đỏ = `※` trước → xem S01 (Toán, Đỏ).<br><br>(g) Tạm gắn thêm cờ Chưa dự thi（未受験） cho S06; Dự kiến = Nguyên trạng, Chưa dự thi = Ẩn（表示しない）; đỏ = `※` trước → xem S06. |
| Expected | (a) `(24)`, không thêm `※`; (b) `24`, không chuyển xuống điều kiện đỏ; (c) giữ ẩn/gạch chéo, đỏ không làm hiện lại điểm; (d) `※29`; (e) không áp dấu đỏ của kết quả cũ; ô trống hiển thị theo cấu hình ô trống; (f) `(29)`, điều kiện môn cụ thể thắng, không thêm `※`; (g) `24`: Nguyên trạng ở dòng dự kiến dừng xét, không áp lệnh Ẩn của dòng chưa dự thi phía sau. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| a | Tổ hợp a | (a) `(24)`, không thêm `※`; (b) `24`, không chuyển xuống điều kiện đỏ; (c) giữ ẩn/gạch chéo, đỏ không làm hiện lại điểm; (d) `※29`; (e) không áp dấu đỏ của kết quả cũ; ô trống hiển thị theo cấu hình ô trống; (f) `(29)`, điều kiện môn cụ thể thắng, không thêm `※`; (g) `24`: Nguyên trạng ở dòng dự kiến dừng xét, không áp lệnh Ẩn của dòng chưa dự thi phía sau. |
| b | Tổ hợp b | (a) `(24)`, không thêm `※`; (b) `24`, không chuyển xuống điều kiện đỏ; (c) giữ ẩn/gạch chéo, đỏ không làm hiện lại điểm; (d) `※29`; (e) không áp dấu đỏ của kết quả cũ; ô trống hiển thị theo cấu hình ô trống; (f) `(29)`, điều kiện môn cụ thể thắng, không thêm `※`; (g) `24`: Nguyên trạng ở dòng dự kiến dừng xét, không áp lệnh Ẩn của dòng chưa dự thi phía sau. |
| c-hidden | Tổ hợp c với Ẩn | (a) `(24)`, không thêm `※`; (b) `24`, không chuyển xuống điều kiện đỏ; (c) giữ ẩn/gạch chéo, đỏ không làm hiện lại điểm; (d) `※29`; (e) không áp dấu đỏ của kết quả cũ; ô trống hiển thị theo cấu hình ô trống; (f) `(29)`, điều kiện môn cụ thể thắng, không thêm `※`; (g) `24`: Nguyên trạng ở dòng dự kiến dừng xét, không áp lệnh Ẩn của dòng chưa dự thi phía sau. |
| c-slash | Tổ hợp c với Gạch chéo | (a) `(24)`, không thêm `※`; (b) `24`, không chuyển xuống điều kiện đỏ; (c) giữ ẩn/gạch chéo, đỏ không làm hiện lại điểm; (d) `※29`; (e) không áp dấu đỏ của kết quả cũ; ô trống hiển thị theo cấu hình ô trống; (f) `(29)`, điều kiện môn cụ thể thắng, không thêm `※`; (g) `24`: Nguyên trạng ở dòng dự kiến dừng xét, không áp lệnh Ẩn của dòng chưa dự thi phía sau. |
| d | Tổ hợp d | (a) `(24)`, không thêm `※`; (b) `24`, không chuyển xuống điều kiện đỏ; (c) giữ ẩn/gạch chéo, đỏ không làm hiện lại điểm; (d) `※29`; (e) không áp dấu đỏ của kết quả cũ; ô trống hiển thị theo cấu hình ô trống; (f) `(29)`, điều kiện môn cụ thể thắng, không thêm `※`; (g) `24`: Nguyên trạng ở dòng dự kiến dừng xét, không áp lệnh Ẩn của dòng chưa dự thi phía sau. |
| e | Tổ hợp e | (a) `(24)`, không thêm `※`; (b) `24`, không chuyển xuống điều kiện đỏ; (c) giữ ẩn/gạch chéo, đỏ không làm hiện lại điểm; (d) `※29`; (e) không áp dấu đỏ của kết quả cũ; ô trống hiển thị theo cấu hình ô trống; (f) `(29)`, điều kiện môn cụ thể thắng, không thêm `※`; (g) `24`: Nguyên trạng ở dòng dự kiến dừng xét, không áp lệnh Ẩn của dòng chưa dự thi phía sau. |
| f | Tổ hợp f | (a) `(24)`, không thêm `※`; (b) `24`, không chuyển xuống điều kiện đỏ; (c) giữ ẩn/gạch chéo, đỏ không làm hiện lại điểm; (d) `※29`; (e) không áp dấu đỏ của kết quả cũ; ô trống hiển thị theo cấu hình ô trống; (f) `(29)`, điều kiện môn cụ thể thắng, không thêm `※`; (g) `24`: Nguyên trạng ở dòng dự kiến dừng xét, không áp lệnh Ẩn của dòng chưa dự thi phía sau. |
| g | Tổ hợp g | (a) `(24)`, không thêm `※`; (b) `24`, không chuyển xuống điều kiện đỏ; (c) giữ ẩn/gạch chéo, đỏ không làm hiện lại điểm; (d) `※29`; (e) không áp dấu đỏ của kết quả cũ; ô trống hiển thị theo cấu hình ô trống; (f) `(29)`, điều kiện môn cụ thể thắng, không thêm `※`; (g) `24`: Nguyên trạng ở dòng dự kiến dừng xét, không áp lệnh Ẩn của dòng chưa dự thi phía sau. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cấu hình phiếu điểm: ký tự “※” phía trước |
| Thao tác | 1. Mở hộp tùy chọn, chọn Thiết lập（設定する）, chỉ chọn dòng đỏ = `※` trước, các dòng khác Nguyên trạng. Đóng hộp, **không** bấm Cập nhật; tải lại trang.<br>2. Lặp lại, lần này bấm Cập nhật（更新する）; tải lại, mở hộp.<br>3. Xuất PDF. |
| Expected | 1. Không bấm Cập nhật: thay đổi không được lưu (hành vi hiện có).<br>2. Có bấm Cập nhật: mở lại thấy dòng đỏ = `※` trước; bảng được ghi nhận là có dùng điều kiện dù chỉ điều kiện đỏ được chọn.<br>3. PDF áp dụng điều kiện đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| unsaved | Bước 1 không cập nhật | 1. Không bấm Cập nhật: thay đổi không được lưu (hành vi hiện có).<br>2. Có bấm Cập nhật: mở lại thấy dòng đỏ = `※` trước; bảng được ghi nhận là có dùng điều kiện dù chỉ điều kiện đỏ được chọn.<br>3. PDF áp dụng điều kiện đỏ. |
| saved-pdf | Bước 2–3 lưu, mở lại và PDF | 1. Không bấm Cập nhật: thay đổi không được lưu (hành vi hiện có).<br>2. Có bấm Cập nhật: mở lại thấy dòng đỏ = `※` trước; bảng được ghi nhận là có dùng điều kiện dù chỉ điều kiện đỏ được chọn.<br>3. PDF áp dụng điều kiện đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Nguyên trạng（そのまま表示）, Kèm ngoặc（カッコ付き）, Ký tự phía trước（前に任意の文字） để trống, Ký tự phía sau（後ろに任意の文字） để trống |
| Thao tác | Chọn từng lựa chọn ở dòng Thiết lập điểm đỏ（赤点設定）, bấm Cập nhật（更新する）. |
| Expected | Nguyên trạng, Kèm ngoặc: không hiện ô ký tự, lưu được. Phía trước/sau để trống: không lưu được. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| unchanged | Nguyên trạng | Nguyên trạng, Kèm ngoặc: không hiện ô ký tự, lưu được. Phía trước/sau để trống: không lưu được. |
| parentheses | Kèm ngoặc | Nguyên trạng, Kèm ngoặc: không hiện ô ký tự, lưu được. Phía trước/sau để trống: không lưu được. |
| prefix | Ký tự trước trống | Nguyên trạng, Kèm ngoặc: không hiện ô ký tự, lưu được. Phía trước/sau để trống: không lưu được. |
| suffix | Ký tự sau trống | Nguyên trạng, Kèm ngoặc: không hiện ô ký tự, lưu được. Phía trước/sau để trống: không lưu được. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cấu hình phiếu điểm: ký tự “※” phía trước |
| Thao tác | 1. Sao chép mẫu A và mẫu B.<br>2. Mở dòng Thiết lập điểm đỏ（赤点設定） ở từng bản sao.<br>3. Xuất PDF bản sao với S01. |
| Expected | 1–2. Bản sao giữ lựa chọn Ký tự phía trước（前に任意の文字） `※`; mẫu chỉ dùng điều kiện đỏ vẫn còn hiệu lực.<br><br>3. PDF: ô S01 hiển thị `※29`. Không sao chép kết quả xét của học sinh. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| template-a | Sao chép và xuất mẫu A | 1–2. Bản sao giữ lựa chọn Ký tự phía trước（前に任意の文字） `※`; mẫu chỉ dùng điều kiện đỏ vẫn còn hiệu lực.<br><br>3. PDF: ô S01 hiển thị `※29`. Không sao chép kết quả xét của học sinh. |
| template-b | Sao chép và xuất mẫu B | 1–2. Bản sao giữ lựa chọn Ký tự phía trước（前に任意の文字） `※`; mẫu chỉ dùng điều kiện đỏ vẫn còn hiệu lực.<br><br>3. PDF: ô S01 hiển thị `※29`. Không sao chép kết quả xét của học sinh. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cấu hình phiếu điểm: ký tự “※” phía trước |
| Thao tác | 1. Mở hộp tùy chọn của ô, chọn Thiết lập（設定する）.<br>2. Ghi lại thứ tự dòng và các lựa chọn của dòng Thiết lập điểm đỏ（赤点設定）. |
| Expected | CONFIRMED: dòng đỏ nằm sau các dòng checkbox và trước Trường hợp ô trống（空欄の場合）; lựa chọn của dòng đỏ là Nguyên trạng（そのまま表示）, Kèm ngoặc（カッコ付き）, Ký tự phía trước（前に任意の文字）, Ký tự phía sau（後ろに任意の文字）; không có Ẩn（表示しない）/Gạch chéo（斜線）.<br><br>PROPOSED: nhãn dòng 「赤点設定」 (thiết lập điểm đỏ) và câu ghi chú. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | CONFIRMED: dòng đỏ nằm sau các dòng checkbox và trước Trường hợp ô trống（空欄の場合）; lựa chọn của dòng đỏ là Nguyên trạng（そのまま表示）, Kèm ngoặc（カッコ付き）, Ký tự phía trước（前に任意の文字）, Ký tự phía sau（後ろに任意の文字）; không có Ẩn（表示しない）/Gạch chéo（斜線）.<br><br>PROPOSED: nhãn dòng 「赤点設定」 (thiết lập điểm đỏ) và câu ghi chú. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30); học sinh S05 (ô trống), học sinh S07 (điểm 35, cờ Chưa dự thi（未受験）) |
| Thao tác | Xuất PDF hai bảng, so với baseline. |
| Expected | PDF bằng baseline (cùng ký hiệu, ô ẩn, ô trống). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| subject-empty | Bảng a môn cụ thể và ô trống | PDF bằng baseline (cùng ký hiệu, ô ẩn, ô trống). |
| notexam-hidden | Bảng b chưa dự thi và ẩn | PDF bằng baseline (cùng ký hiệu, ô ẩn, ô trống). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cấu hình phiếu điểm: ký tự “※” phía trước; học sinh S01 (điểm 29), học sinh S09 (mục số thập phân 29.5) |
| Thao tác | Xuất PDF; so với baseline. |
| Expected | Dấu hiển thị đủ trong ô; không mất ký tự, không nền đỏ; các phần khác bằng baseline. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Dấu hiển thị đủ trong ô; không mất ký tự, không nền đỏ; các phần khác bằng baseline. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: S01 `S=29`, S03 `S=31`, S05 ô trống; cấu hình trích xuất lọc + “*” + tô màu; công khai “*”; phiếu điểm “※”. |
| Thao tác | 1. Chạy một lượt đối chứng không lọc để S01, S03 và S05 đều có mặt; lưu file Excel làm baseline.<br>2. Chạy lại trích xuất với lọc bật và lưu file Excel trước/sau khi xem lại.<br>3. Mở màn học sinh công khai của cùng kỳ và cùng lượt xét.<br>4. Xuất PDF phiếu điểm của cùng học sinh/kỳ.<br>5. Đối chiếu ba output với kết quả đã lưu, không chỉ đối chiếu giao diện; không loại S03/S05 khỏi fixture trước khi kiểm tra. |
| Expected | Cả ba đầu ra đều dùng cùng kết quả đã lưu: S01 có dấu đỏ theo cấu hình riêng của từng output; S03 không có dấu đỏ; S05 không bị coi là điểm 0 và không có dấu đỏ. Excel phải giữ nguyên dữ liệu; màn công khai và PDF không được tự chọn lại rule hoặc tính lại ngưỡng. Nếu chạy lại sau khi chỉ xem/xuất, kết quả và bằng chứng phải không đổi. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| extract-off | Bước 1 và 5, không lọc | Cả ba đầu ra đều dùng cùng kết quả đã lưu: S01 có dấu đỏ theo cấu hình riêng của từng output; S03 không có dấu đỏ; S05 không bị coi là điểm 0 và không có dấu đỏ. Excel phải giữ nguyên dữ liệu; màn công khai và PDF không được tự chọn lại rule hoặc tính lại ngưỡng. Nếu chạy lại sau khi chỉ xem/xuất, kết quả và bằng chứng phải không đổi. |
| extract-on | Bước 2 và 5, bật lọc | Cả ba đầu ra đều dùng cùng kết quả đã lưu: S01 có dấu đỏ theo cấu hình riêng của từng output; S03 không có dấu đỏ; S05 không bị coi là điểm 0 và không có dấu đỏ. Excel phải giữ nguyên dữ liệu; màn công khai và PDF không được tự chọn lại rule hoặc tính lại ngưỡng. Nếu chạy lại sau khi chỉ xem/xuất, kết quả và bằng chứng phải không đổi. |
| publish | Bước 3 và 5 | Cả ba đầu ra đều dùng cùng kết quả đã lưu: S01 có dấu đỏ theo cấu hình riêng của từng output; S03 không có dấu đỏ; S05 không bị coi là điểm 0 và không có dấu đỏ. Excel phải giữ nguyên dữ liệu; màn công khai và PDF không được tự chọn lại rule hoặc tính lại ngưỡng. Nếu chạy lại sau khi chỉ xem/xuất, kết quả và bằng chứng phải không đổi. |
| report | Bước 4 và 5 | Cả ba đầu ra đều dùng cùng kết quả đã lưu: S01 có dấu đỏ theo cấu hình riêng của từng output; S03 không có dấu đỏ; S05 không bị coi là điểm 0 và không có dấu đỏ. Excel phải giữ nguyên dữ liệu; màn công khai và PDF không được tự chọn lại rule hoặc tính lại ngưỡng. Nếu chạy lại sau khi chỉ xem/xuất, kết quả và bằng chứng phải không đổi. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); học sinh S06 (điểm dự kiến 24) |
| Thao tác | Chạy xét; xem ba đầu ra cho S06. |
| Expected | Có xét hay không: TBD (chưa chốt). CONFIRMED phần không tranh chấp: không đầu ra nào làm hiện lại điểm đang bị ẩn. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| extract | Trích xuất | Có xét hay không: TBD (chưa chốt). CONFIRMED phần không tranh chấp: không đầu ra nào làm hiện lại điểm đang bị ẩn. |
| publish | Công khai | Có xét hay không: TBD (chưa chốt). CONFIRMED phần không tranh chấp: không đầu ra nào làm hiện lại điểm đang bị ẩn. |
| report | Phiếu điểm | Có xét hay không: TBD (chưa chốt). CONFIRMED phần không tranh chấp: không đầu ra nào làm hiện lại điểm đang bị ẩn. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); cặp quy tắc cùng áp dụng (dưới 20 và dưới 30); S02 được sửa thành 25 |
| Thao tác | 1. Đăng ký S02=25.<br>2. Đổi thứ tự (ưu tiên 1 là `&lt;30`), bấm chạy lại (đăng ký lại điểm hoặc nút cam).<br>3. Xem kết quả sau mỗi lần xét. |
| Expected | 1. Lần 1: chọn quy tắc `&lt;20` → Không đỏ.<br>2. Lần 2 (sau chạy lại): chọn quy tắc `&lt;30` → Đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| priority20 | Thứ tự ban đầu | 1. Lần 1: chọn quy tắc `&lt;20` → Không đỏ.<br>2. Lần 2 (sau chạy lại): chọn quy tắc `&lt;30` → Đỏ. |
| priority30 | Đổi thứ tự rồi xét lại | 1. Lần 1: chọn quy tắc `&lt;20` → Không đỏ.<br>2. Lần 2 (sau chạy lại): chọn quy tắc `&lt;30` → Đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao), học sinh S07 (điểm 35, cờ Chưa dự thi（未受験）) |
| Thao tác | 1. Đăng ký S07=20.<br>2. Xem kết quả ở ba đầu ra. |
| Expected | S07 ở trạng thái Không áp dụng: không có dấu/lọc đỏ; không được coi là "đạt một ngưỡng". |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | S07 ở trạng thái Không áp dụng: không có dấu/lọc đỏ; không được coi là "đạt một ngưỡng". |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc công thức 100 ÷ trung bình, quy tắc “Cố định 30” (dưới 30), nhóm có trung bình 0, nguồn chưa có kết quả tổng hợp, học sinh S01 (điểm 29) |
| Thao tác | Với từng cấu hình (A), (B), (C): đăng ký S01=29, xem kết quả. |
| Expected | (A) Quy tắc 1 được chọn, chia 0 → Chưa xét được; không dùng ưu tiên 2.<br><br>(B) Không xác định được điều kiện trung bình → Chưa xét được; không coi thiếu dữ liệu là "không khớp" để xuống ưu tiên 2.<br><br>(C) Bộ lọc môn đã đủ chứng minh quy tắc 1 không áp dụng → được bỏ qua mà không cần nguồn; ưu tiên 2 áp dụng → Đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| divide-zero | Fixture A chia 0 | (A) Quy tắc 1 được chọn, chia 0 → Chưa xét được; không dùng ưu tiên 2.<br><br>(B) Không xác định được điều kiện trung bình → Chưa xét được; không coi thiếu dữ liệu là "không khớp" để xuống ưu tiên 2.<br><br>(C) Bộ lọc môn đã đủ chứng minh quy tắc 1 không áp dụng → được bỏ qua mà không cần nguồn; ưu tiên 2 áp dụng → Đỏ. |
| missing-average | Fixture B thiếu trung bình | (A) Quy tắc 1 được chọn, chia 0 → Chưa xét được; không dùng ưu tiên 2.<br><br>(B) Không xác định được điều kiện trung bình → Chưa xét được; không coi thiếu dữ liệu là "không khớp" để xuống ưu tiên 2.<br><br>(C) Bộ lọc môn đã đủ chứng minh quy tắc 1 không áp dụng → được bỏ qua mà không cần nguồn; ưu tiên 2 áp dụng → Đỏ. |
| filter-miss | Fixture C không khớp lọc | (A) Quy tắc 1 được chọn, chia 0 → Chưa xét được; không dùng ưu tiên 2.<br><br>(B) Không xác định được điều kiện trung bình → Chưa xét được; không coi thiếu dữ liệu là "không khớp" để xuống ưu tiên 2.<br><br>(C) Bộ lọc môn đã đủ chứng minh quy tắc 1 không áp dụng → được bỏ qua mà không cần nguồn; ưu tiên 2 áp dụng → Đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); mục số thập phân (M=100); quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8); quy tắc “Cố định 30” (dưới 30); nguồn chưa có kết quả tổng hợp; các lớp học phần G-A, G-B, G-C; học sinh S01 (điểm 29); S01 mục số thập phân (M=100) = 29.5 |
| Thao tác | 1. Trong cùng một lượt đăng ký điểm của lớp G-A, lưu S01: mục số nguyên (M=100) = 29, mục số thập phân (M=100) = 29.5.<br>2. Xem kết quả hai ô và thông báo. |
| Expected | 1. Lượt lưu không dừng hay báo lỗi chung vì ô mục số nguyên (M=100) thiếu nguồn.<br>2. Ô mục số nguyên (M=100): Chưa xét được; không dùng ưu tiên 2 (quy tắc “Cố định 30” (dưới 30)) thay thế, nên không Đỏ.<br>3. Ô mục số thập phân (M=100): Đỏ (29.5 `&lt;30`). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. Lượt lưu không dừng hay báo lỗi chung vì ô mục số nguyên (M=100) thiếu nguồn.<br>2. Ô mục số nguyên (M=100): Chưa xét được; không dùng ưu tiên 2 (quy tắc “Cố định 30” (dưới 30)) thay thế, nên không Đỏ.<br>3. Ô mục số thập phân (M=100): Đỏ (29.5 `&lt;30`). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100); Nguồn `A=40`, `A=50`, `A=49.99` (bản tổng hợp đã chốt (trung bình 49.99), màn tổng hợp hiện 50.0); S = 19, 20, 24.99, 25, 29, 30 |
| Thao tác | 1. Với từng nguồn, chạy nút cam, xem kết quả.<br>2. Với `A=49.99`: bật gần nhất p1 cho dòng `A×0.5`, chạy lại. |
| Expected | `A=40` → ưu tiên 2, `T=20`: 19 Đỏ; 20 Không đỏ.<br><br>`A=50` → ưu tiên 1, `T=30`: 29 Đỏ; 30 Không đỏ.<br><br>`A=49.99` → ưu tiên 2, `T=24.995`: 24.99 Đỏ; 25 Không đỏ; 29 Không đỏ (nếu dùng 50 thì 29 Đỏ — sai).<br><br>Bước 2: `T=25`, vẫn ưu tiên 2: 24.99 Đỏ; 29 Không đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| a40 | A40 | `A=40` → ưu tiên 2, `T=20`: 19 Đỏ; 20 Không đỏ.<br><br>`A=50` → ưu tiên 1, `T=30`: 29 Đỏ; 30 Không đỏ.<br><br>`A=49.99` → ưu tiên 2, `T=24.995`: 24.99 Đỏ; 25 Không đỏ; 29 Không đỏ (nếu dùng 50 thì 29 Đỏ — sai).<br><br>Bước 2: `T=25`, vẫn ưu tiên 2: 24.99 Đỏ; 29 Không đỏ. |
| a50 | A50 | `A=40` → ưu tiên 2, `T=20`: 19 Đỏ; 20 Không đỏ.<br><br>`A=50` → ưu tiên 1, `T=30`: 29 Đỏ; 30 Không đỏ.<br><br>`A=49.99` → ưu tiên 2, `T=24.995`: 24.99 Đỏ; 25 Không đỏ; 29 Không đỏ (nếu dùng 50 thì 29 Đỏ — sai).<br><br>Bước 2: `T=25`, vẫn ưu tiên 2: 24.99 Đỏ; 29 Không đỏ. |
| a4999-none | A49.99 không làm tròn | `A=40` → ưu tiên 2, `T=20`: 19 Đỏ; 20 Không đỏ.<br><br>`A=50` → ưu tiên 1, `T=30`: 29 Đỏ; 30 Không đỏ.<br><br>`A=49.99` → ưu tiên 2, `T=24.995`: 24.99 Đỏ; 25 Không đỏ; 29 Không đỏ (nếu dùng 50 thì 29 Đỏ — sai).<br><br>Bước 2: `T=25`, vẫn ưu tiên 2: 24.99 Đỏ; 29 Không đỏ. |
| a4999-round | A49.99 có làm tròn | `A=40` → ưu tiên 2, `T=20`: 19 Đỏ; 20 Không đỏ.<br><br>`A=50` → ưu tiên 1, `T=30`: 29 Đỏ; 30 Không đỏ.<br><br>`A=49.99` → ưu tiên 2, `T=24.995`: 24.99 Đỏ; 25 Không đỏ; 29 Không đỏ (nếu dùng 50 thì 29 Đỏ — sai).<br><br>Bước 2: `T=25`, vẫn ưu tiên 2: 24.99 Đỏ; 29 Không đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100); hai nguồn có trung bình 60 và 59.96 (`A=60.00`; `A=59.96`); S = 27, 29.99 |
| Thao tác | Chạy nút cam với từng nguồn. |
| Expected | `A=60.00` → ưu tiên 1, `T=25`: 27 Không đỏ.<br><br>`A=59.96` → ưu tiên 2, `T=29.98`: 27 Đỏ; 29.99 Không đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| a60 | A60 | `A=60.00` → ưu tiên 1, `T=25`: 27 Không đỏ.<br><br>`A=59.96` → ưu tiên 2, `T=29.98`: 27 Đỏ; 29.99 Không đỏ. |
| a5996 | A59.96 | `A=60.00` → ưu tiên 1, `T=25`: 27 Không đỏ.<br><br>`A=59.96` → ưu tiên 2, `T=29.98`: 27 Đỏ; 29.99 Không đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc theo tỷ lệ điểm của nhóm từ 65%; (a) nhóm có tỷ lệ điểm 70% (cùng M) (60/100, 80/100); (b) nguồn 50/100, 70/100; S = 60, 70, 80 |
| Thao tác | Chạy nút xanh rồi nút cam cho từng nguồn. |
| Expected | (a) `R=140/200×100=70%` → khớp; `T=70`: 60 Đỏ; 70 Không đỏ; 80 Không đỏ.<br><br>(b) `R=120/200×100=60%` → không khớp → cả ba Không áp dụng. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| r70 | R70 | (a) `R=140/200×100=70%` → khớp; `T=70`: 60 Đỏ; 70 Không đỏ; 80 Không đỏ.<br><br>(b) `R=120/200×100=60%` → không khớp → cả ba Không áp dụng. |
| r60 | R60 | (a) `R=140/200×100=70%` → khớp; `T=70`: 60 Đỏ; 70 Không đỏ; 80 Không đỏ.<br><br>(b) `R=120/200×100=60%` → không khớp → cả ba Không áp dụng. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc theo tỷ lệ điểm của nhóm từ 65%; (a) Nguồn 64.98/100 và 65.00/100 → `R=64.99%`; (b) 65/100 và 65/100 → `R=65%`; S = 60 |
| Thao tác | Chạy nút xanh rồi nút cam cho từng nguồn. |
| Expected | (a) `R` thô = `64.99%` không khớp `≥65%` → Không áp dụng. Nếu seam chỉ cung cấp `65.0%` đã làm tròn, case bị BLOCKED/NEEDS_EVIDENCE vì thiếu dữ liệu nguồn, không được đổi oracle thành khớp.<br><br>(b) Khớp → S=60 Đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| r6499 | R64.99 | (a) `R` thô = `64.99%` không khớp `≥65%` → Không áp dụng. Nếu seam chỉ cung cấp `65.0%` đã làm tròn, case bị BLOCKED/NEEDS_EVIDENCE vì thiếu dữ liệu nguồn, không được đổi oracle thành khớp.<br><br>(b) Khớp → S=60 Đỏ. |
| r65 | R65 | (a) `R` thô = `64.99%` không khớp `≥65%` → Không áp dụng. Nếu seam chỉ cung cấp `65.0%` đã làm tròn, case bị BLOCKED/NEEDS_EVIDENCE vì thiếu dữ liệu nguồn, không được đổi oracle thành khớp.<br><br>(b) Khớp → S=60 Đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100), mục số nguyên có thêm tính tự động; học sinh S06 (điểm dự kiến 24), học sinh S08 (sửa tay 28 thành 35), quy tắc “Cố định 30” (dưới 30) |
| Thao tác | (a) S06 = 24 là Điểm dự kiến（見込点）: đăng ký.<br><br>(b) S08: nhập 28, lưu; sửa tay thành 35, lưu.<br><br>(c) Tạo dữ liệu mà phép tính cho 120 nhưng điểm lưu hợp lệ là 100; áp quy tắc cố định 100 `&lt;` và 100 `≤`. |
| Expected | (a) Đỏ.<br><br>(b) Sau lần lưu thứ hai: xét 35 → Không đỏ.<br><br>(c) Xét `S=100`: `&lt;100` Không đỏ; `≤100` Đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| projected | Điểm dự kiến 24 | (a) Đỏ.<br><br>(b) Sau lần lưu thứ hai: xét 35 → Không đỏ.<br><br>(c) Xét `S=100`: `&lt;100` Không đỏ; `≤100` Đỏ. |
| manual | Chuỗi sửa tay 28 thành 35 | (a) Đỏ.<br><br>(b) Sau lần lưu thứ hai: xét 35 → Không đỏ.<br><br>(c) Xét `S=100`: `&lt;100` Không đỏ; `≤100` Đỏ. |
| clamp-lt | Điểm sau chặn 100 với nhỏ hơn | (a) Đỏ.<br><br>(b) Sau lần lưu thứ hai: xét 35 → Không đỏ.<br><br>(c) Xét `S=100`: `&lt;100` Không đỏ; `≤100` Đỏ. |
| clamp-le | Điểm sau chặn 100 với nhỏ hơn hoặc bằng | (a) Đỏ.<br><br>(b) Sau lần lưu thứ hai: xét 35 → Không đỏ.<br><br>(c) Xét `S=100`: `&lt;100` Không đỏ; `≤100` Đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30); học sinh S07 (điểm 35, cờ Chưa dự thi（未受験）) (35, cờ Chưa dự thi) và biến thể S07 = 25 cùng cờ; học sinh S09 (mục số thập phân 29.5) (mục số thập phân (M=100) = 29.5) được thiết lập loại khỏi xếp hạng; mục số thập phân (M=100) có quy tắc “Cố định 30” (dưới 30) |
| Thao tác | 1. Đăng ký S07=35 kèm cờ Chưa dự thi（未受験）.<br>2. Sửa S07=25, giữ cờ.<br>3. Đăng ký điểm 29.5 cho S09 (học sinh bị loại khỏi xếp hạng); chạy nút xanh rồi nút cam. |
| Expected | 1. Được xét → Không đỏ.<br>2. Được xét → Đỏ.<br>3. S09 được xét → Đỏ (29.5 `&lt;30`); việc bị loại khỏi xếp hạng không loại ô khỏi xét đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| notexam35 | Cờ chưa dự thi với điểm 35 | 1. Được xét → Không đỏ.<br>2. Được xét → Đỏ.<br>3. S09 được xét → Đỏ (29.5 `&lt;30`); việc bị loại khỏi xếp hạng không loại ô khỏi xét đỏ. |
| notexam25 | Cờ chưa dự thi với điểm 25 | 1. Được xét → Không đỏ.<br>2. Được xét → Đỏ.<br>3. S09 được xét → Đỏ (29.5 `&lt;30`); việc bị loại khỏi xếp hạng không loại ô khỏi xét đỏ. |
| ranking-excluded | Loại khỏi xếp hạng với điểm 29.5 | 1. Được xét → Không đỏ.<br>2. Được xét → Đỏ.<br>3. S09 được xét → Đỏ (29.5 `&lt;30`); việc bị loại khỏi xếp hạng không loại ô khỏi xét đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30), quy tắc cố định 30 với Nhỏ hơn hoặc bằng（以下）; học sinh S05 (ô trống) (trống), học sinh S04 (điểm 0) (0) |
| Thao tác | 1. Với quy tắc “Cố định 30” (dưới 30): đăng ký S04=0, để S05 trống.<br>2. Đổi thành quy tắc cố định 0 `≤`, chạy lại. |
| Expected | 1. S04 Đỏ (0 hợp lệ là số); S05 Không có điểm, không dấu đỏ.<br>2. S04 Đỏ (`0≤0`); S05 vẫn Không có điểm (không thành Đỏ như thể là 0). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| fixed30-lt | Ngưỡng 30 nhỏ hơn, kiểm cả trống và 0 | 1. S04 Đỏ (0 hợp lệ là số); S05 Không có điểm, không dấu đỏ.<br>2. S04 Đỏ (`0≤0`); S05 vẫn Không có điểm (không thành Đỏ như thể là 0). |
| fixed0-le | Ngưỡng 0 nhỏ hơn hoặc bằng, kiểm cả trống và 0 | 1. S04 Đỏ (0 hợp lệ là số); S05 Không có điểm, không dấu đỏ.<br>2. S04 Đỏ (`0≤0`); S05 vẫn Không có điểm (không thành Đỏ như thể là 0). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30); mục điểm đơn vị (đơn vị U1 có M riêng 40) |
| Thao tác | 1. Đăng ký điểm U1, U2 của S06.<br>2. Xem ba đầu ra ở phạm vi đơn vị. |
| Expected | U1 Đỏ, U2 Không đỏ; dấu chỉ ở ô U1. Hai đơn vị không bị gộp thành một ô. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | U1 Đỏ, U2 Không đỏ; dấu chỉ ở ô U1. Hai đơn vị không bị gộp thành một ô. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên có thêm tính tự động, quy tắc “Cố định 30” (dưới 30); học sinh S08 (sửa tay 28 thành 35) |
| Thao tác | 1. Lưu S08=28 bằng nhập tay; chạy nút cam.<br>2. Xem điểm và kết quả đỏ. |
| Expected | Điểm S08 vẫn 28 (không bị AutoRating ghi đè); S08 Đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Điểm S08 vẫn 28 (không bị AutoRating ghi đè); S08 Đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: tài khoản giáo viên có quyền sửa mục, mục số nguyên (M=100) |
| Thao tác | Thêm, sửa điều kiện, sửa ngưỡng, đổi thứ tự, xóa một quy tắc của mục số nguyên (M=100). |
| Expected | Mọi thao tác thành công. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| add | Thử thêm | Mọi thao tác thành công. |
| condition | Thử sửa điều kiện | Mọi thao tác thành công. |
| threshold | Thử sửa ngưỡng | Mọi thao tác thành công. |
| reorder | Thử đổi thứ tự | Mọi thao tác thành công. |
| delete | Thử xóa | Mọi thao tác thành công. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: tài khoản giáo viên không có quyền sửa mục, mục chỉ dành nội bộ |
| Thao tác | 1. Mở Thiết lập ô nhập（入力欄設定）.<br>2. Thử mở và sửa quy tắc của mục chỉ dành nội bộ. |
| Expected | Không có thao tác sửa/thêm/xóa cho mục chỉ dành nội bộ trên màn, hoặc lưu bị từ chối. Quy tắc không đổi. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Không có thao tác sửa/thêm/xóa cho mục chỉ dành nội bộ trên màn, hoặc lưu bị từ chối. Quy tắc không đổi. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: tài khoản sửa được mục nhưng không có quyền chạy hàng loạt |
| Thao tác | 1. Sửa một quy tắc (thành công).<br>2. Mở Tổng hợp thành tích（成績集計）, thử chạy tính toán hàng loạt. |
| Expected | Không chạy được hàng loạt (thao tác không có hoặc bị từ chối theo quyền hiện hành). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Không chạy được hàng loạt (thao tác không có hoặc bị từ chối theo quyền hiện hành). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: tài khoản giáo viên không có quyền sửa mục, mục chỉ dành nội bộ |
| Thao tác | Dùng phiên tài khoản giáo viên không có quyền sửa mục gửi lại các request POST lưu, xóa, đổi thứ tự quy tắc của mục chỉ dành nội bộ. |
| Expected | Mọi request bị từ chối; cấu hình không đổi; không có lượt xét phát sinh. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| save | Gửi lưu | Mọi request bị từ chối; cấu hình không đổi; không có lượt xét phát sinh. |
| delete | Gửi xóa | Mọi request bị từ chối; cấu hình không đổi; không có lượt xét phát sinh. |
| reorder | Gửi đổi thứ tự | Mọi request bị từ chối; cấu hình không đổi; không có lượt xét phát sinh. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: trường B (trường khác), tài khoản của trường B |
| Thao tác | 1. tài khoản của trường B mở URL/gửi request xem, lưu, xóa quy tắc với ID mục/quy tắc của trường A.<br>2. tài khoản giáo viên có quyền sửa mục lưu quy tắc của trường A nhưng sửa request để nguồn tổng hợp trỏ tới thiết lập tổng hợp của trường B hoặc năm 2025.<br>3. tài khoản giáo viên có quyền sửa mục lưu quy tắc của trường A nhưng sửa request: ID lớp/nhóm trong bộ lọc và ID đơn vị thuộc trường B hoặc năm 2025. |
| Expected | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| read-school | Đọc mục trường khác | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |
| save-school | Lưu mục trường khác | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |
| delete-school | Xóa mục trường khác | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |
| source-school | Nguồn trường khác | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |
| source-year | Nguồn năm khác | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |
| class-school | Lớp trường khác | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |
| class-year | Lớp năm khác | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |
| group-school | Nhóm trường khác | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |
| group-year | Nhóm năm khác | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |
| unit-school | Đơn vị trường khác | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |
| unit-year | Đơn vị năm khác | 1. Bị từ chối, không đọc được dữ liệu trường A.<br>2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.<br>3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.<br><br>Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: tài khoản sửa được mục nhưng không có quyền chạy hàng loạt; endpoint/request URL lấy từ route hiện hành của build, không ghi URL giả định vào oracle. |
| Thao tác | Dùng phiên tài khoản sửa được mục nhưng không có quyền chạy hàng loạt gửi request chạy tính toán hàng loạt cho khối 1. |
| Expected | Kỳ vọng theo đặc tả v2: bị từ chối, không xếp hàng/không xét. Nếu chưa xác định được route hoặc seam request ở build đang kiểm, ghi BLOCKED/NEEDS_EVIDENCE thay vì READY; không biến việc thiếu URL thành kết quả đạt. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Kỳ vọng theo đặc tả v2: bị từ chối, không xếp hàng/không xét. Nếu chưa xác định được route hoặc seam request ở build đang kiểm, ghi BLOCKED/NEEDS_EVIDENCE thay vì READY; không biến việc thiếu URL thành kết quả đạt. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: N cố định = 101, −1; tỷ lệ = 101; mẫu số cố định = 0; N = `NaN`, `Infinity`, `1e400`, chuỗi rỗng; công thức có phép toán/hàm không được phép (ví dụ `^`, `max`) hoặc chuỗi biểu thức tự do thay cho các dòng; điều kiện áp dụng (khi có schema, PROPOSED theo thiết kế DB v2 mục 3.2 “`apply_condition`”): JSON `null`, chuỗi rỗng, object rỗng, khóa lạ, cả hai array rỗng |
| Thao tác | Sửa request (bỏ kiểm tra JS) và gửi từng giá trị. |
| Expected | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| above | N101 | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| negative | N âm | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| ratio-above | Tỷ lệ 101 | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| divide-zero | Chia 0 | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| nan | NaN | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| infinity | Infinity | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| exponent | 1e400 | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| empty | N trống | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| power | Phép toán mũ | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| max | Hàm max | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| expression | Biểu thức tự do | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| null | JSON null | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| empty-string | Chuỗi rỗng | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| object | Object rỗng | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| unknown-key | Khóa không biết | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |
| arrays | Mảng rỗng | Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: lượt không lọc chứa S03=31 không dấu/màu đỏ; lượt có lọc chỉ chứa S01, loại S03. Các request sửa độc lập từ baseline tương ứng, không sửa dữ liệu server. |
| Thao tác | 1. Đăng nhập tài khoản phụ trách đầu ra; chụp request/response hợp lệ và file Trích xuất thành tích（成績抽出） không lọc: S03=31 Không đỏ. Chụp riêng lượt bật lọc: S01 có mặt, S03 vắng mặt. Ghi endpoint, field được chấp nhận, identity trường/năm/mục và quyền thật trước khi sửa request.<br>2. Từ **request không lọc**, gửi từng payload độc lập nếu endpoint nhận field đó: (a) gán S03 cờ đỏ/dấu `*`/màu đỏ; (b) gán điểm S03=10 thay vì điểm server 31; (c) gán ngưỡng 50 thay vì ngưỡng server 30. Không thay đồng thời các field giữa các biến thể.<br>3. Từ **request có lọc**, chèn identity S03 (Không đỏ) vào danh sách được yêu cầu, giữ bộ lọc bật. Từ request hợp lệ riêng, sửa identity sang trường B hoặc năm ngoài quyền. Gửi từng request, lưu payload/response và file Excel nếu có. |
| Expected | Ở các biến thể không lọc, server từ chối payload giả hoặc Excel vẫn cho S03=31, Không đỏ, không có `*`/màu đỏ; điểm 10, ngưỡng 50 và cờ giả không đổi kết luận server. Ở request **có lọc**, S03 không được đưa vào Excel dù identity được chèn vào payload; S01 vẫn có mặt. Request trường/năm ngoài quyền bị từ chối hoặc không trả dữ liệu ngoài quyền. Nếu endpoint không nhận field giả, ghi rõ biến thể chưa kiểm được/BLOCKED và seam cần kiểm; không dùng NOT_APPLICABLE để suy rằng nghĩa vụ server đã PASS. Chỉ đánh PASS từng biến thể khi có payload thật được endpoint xử lý cùng response/file và dữ liệu tin cậy đối chiếu. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| forged-red-flag | Bước 2a chỉ sửa cờ đỏ của S03 | Ở các biến thể không lọc, server từ chối payload giả hoặc Excel vẫn cho S03=31, Không đỏ, không có `*`/màu đỏ; điểm 10, ngưỡng 50 và cờ giả không đổi kết luận server. Ở request **có lọc**, S03 không được đưa vào Excel dù identity được chèn vào payload; S01 vẫn có mặt. Request trường/năm ngoài quyền bị từ chối hoặc không trả dữ liệu ngoài quyền. Nếu endpoint không nhận field giả, ghi rõ biến thể chưa kiểm được/BLOCKED và seam cần kiểm; không dùng NOT_APPLICABLE để suy rằng nghĩa vụ server đã PASS. Chỉ đánh PASS từng biến thể khi có payload thật được endpoint xử lý cùng response/file và dữ liệu tin cậy đối chiếu. |
| forged-prefix | Bước 2a chỉ sửa dấu trước thành * cho S03 | Ở các biến thể không lọc, server từ chối payload giả hoặc Excel vẫn cho S03=31, Không đỏ, không có `*`/màu đỏ; điểm 10, ngưỡng 50 và cờ giả không đổi kết luận server. Ở request **có lọc**, S03 không được đưa vào Excel dù identity được chèn vào payload; S01 vẫn có mặt. Request trường/năm ngoài quyền bị từ chối hoặc không trả dữ liệu ngoài quyền. Nếu endpoint không nhận field giả, ghi rõ biến thể chưa kiểm được/BLOCKED và seam cần kiểm; không dùng NOT_APPLICABLE để suy rằng nghĩa vụ server đã PASS. Chỉ đánh PASS từng biến thể khi có payload thật được endpoint xử lý cùng response/file và dữ liệu tin cậy đối chiếu. |
| forged-color | Bước 2a chỉ sửa màu đỏ cho S03 | Ở các biến thể không lọc, server từ chối payload giả hoặc Excel vẫn cho S03=31, Không đỏ, không có `*`/màu đỏ; điểm 10, ngưỡng 50 và cờ giả không đổi kết luận server. Ở request **có lọc**, S03 không được đưa vào Excel dù identity được chèn vào payload; S01 vẫn có mặt. Request trường/năm ngoài quyền bị từ chối hoặc không trả dữ liệu ngoài quyền. Nếu endpoint không nhận field giả, ghi rõ biến thể chưa kiểm được/BLOCKED và seam cần kiểm; không dùng NOT_APPLICABLE để suy rằng nghĩa vụ server đã PASS. Chỉ đánh PASS từng biến thể khi có payload thật được endpoint xử lý cùng response/file và dữ liệu tin cậy đối chiếu. |
| forged-score | Bước 2b chỉ sửa điểm thành 10 | Ở các biến thể không lọc, server từ chối payload giả hoặc Excel vẫn cho S03=31, Không đỏ, không có `*`/màu đỏ; điểm 10, ngưỡng 50 và cờ giả không đổi kết luận server. Ở request **có lọc**, S03 không được đưa vào Excel dù identity được chèn vào payload; S01 vẫn có mặt. Request trường/năm ngoài quyền bị từ chối hoặc không trả dữ liệu ngoài quyền. Nếu endpoint không nhận field giả, ghi rõ biến thể chưa kiểm được/BLOCKED và seam cần kiểm; không dùng NOT_APPLICABLE để suy rằng nghĩa vụ server đã PASS. Chỉ đánh PASS từng biến thể khi có payload thật được endpoint xử lý cùng response/file và dữ liệu tin cậy đối chiếu. |
| forged-threshold | Bước 2c chỉ sửa ngưỡng thành 50 | Ở các biến thể không lọc, server từ chối payload giả hoặc Excel vẫn cho S03=31, Không đỏ, không có `*`/màu đỏ; điểm 10, ngưỡng 50 và cờ giả không đổi kết luận server. Ở request **có lọc**, S03 không được đưa vào Excel dù identity được chèn vào payload; S01 vẫn có mặt. Request trường/năm ngoài quyền bị từ chối hoặc không trả dữ liệu ngoài quyền. Nếu endpoint không nhận field giả, ghi rõ biến thể chưa kiểm được/BLOCKED và seam cần kiểm; không dùng NOT_APPLICABLE để suy rằng nghĩa vụ server đã PASS. Chỉ đánh PASS từng biến thể khi có payload thật được endpoint xử lý cùng response/file và dữ liệu tin cậy đối chiếu. |
| out-of-scope-student | Bước 3 chèn S03 vào lượt có lọc | Ở các biến thể không lọc, server từ chối payload giả hoặc Excel vẫn cho S03=31, Không đỏ, không có `*`/màu đỏ; điểm 10, ngưỡng 50 và cờ giả không đổi kết luận server. Ở request **có lọc**, S03 không được đưa vào Excel dù identity được chèn vào payload; S01 vẫn có mặt. Request trường/năm ngoài quyền bị từ chối hoặc không trả dữ liệu ngoài quyền. Nếu endpoint không nhận field giả, ghi rõ biến thể chưa kiểm được/BLOCKED và seam cần kiểm; không dùng NOT_APPLICABLE để suy rằng nghĩa vụ server đã PASS. Chỉ đánh PASS từng biến thể khi có payload thật được endpoint xử lý cùng response/file và dữ liệu tin cậy đối chiếu. |
| out-of-scope-school | Bước 3 identity trường B ngoài quyền, giữ năm hợp lệ | Ở các biến thể không lọc, server từ chối payload giả hoặc Excel vẫn cho S03=31, Không đỏ, không có `*`/màu đỏ; điểm 10, ngưỡng 50 và cờ giả không đổi kết luận server. Ở request **có lọc**, S03 không được đưa vào Excel dù identity được chèn vào payload; S01 vẫn có mặt. Request trường/năm ngoài quyền bị từ chối hoặc không trả dữ liệu ngoài quyền. Nếu endpoint không nhận field giả, ghi rõ biến thể chưa kiểm được/BLOCKED và seam cần kiểm; không dùng NOT_APPLICABLE để suy rằng nghĩa vụ server đã PASS. Chỉ đánh PASS từng biến thể khi có payload thật được endpoint xử lý cùng response/file và dữ liệu tin cậy đối chiếu. |
| out-of-scope-year | Bước 3 identity năm ngoài quyền, giữ trường A | Ở các biến thể không lọc, server từ chối payload giả hoặc Excel vẫn cho S03=31, Không đỏ, không có `*`/màu đỏ; điểm 10, ngưỡng 50 và cờ giả không đổi kết luận server. Ở request **có lọc**, S03 không được đưa vào Excel dù identity được chèn vào payload; S01 vẫn có mặt. Request trường/năm ngoài quyền bị từ chối hoặc không trả dữ liệu ngoài quyền. Nếu endpoint không nhận field giả, ghi rõ biến thể chưa kiểm được/BLOCKED và seam cần kiểm; không dùng NOT_APPLICABLE để suy rằng nghĩa vụ server đã PASS. Chỉ đánh PASS từng biến thể khi có payload thật được endpoint xử lý cùng response/file và dữ liệu tin cậy đối chiếu. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: Tên quy tắc `&lt;b&gt;X&lt;/b&gt;&lt;script&gt;alert(1)&lt;/script&gt;`; ký hiệu đầu ở trích xuất `&lt;`; ký tự phía trước ở phiếu điểm `&amp;`; học sinh S01 (điểm 29) |
| Thao tác | 1. Lưu quy tắc với tên trên; xem danh sách, form sửa, hộp xác nhận xóa, thông báo sau chạy.<br>2. Lưu ký hiệu/ký tự trên ở trích xuất và phiếu điểm; xem màn, Excel, PDF. |
| Expected | Chuỗi hiển thị đúng như đã nhập dưới dạng chữ; không có hộp alert, không đổi định dạng HTML. Trích xuất và Excel: ô S01 là `&lt;29`; PDF phiếu: `&amp;29`. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| rule-name | Bước 1 các nơi hiển thị tên | Chuỗi hiển thị đúng như đã nhập dưới dạng chữ; không có hộp alert, không đổi định dạng HTML. Trích xuất và Excel: ô S01 là `&lt;29`; PDF phiếu: `&amp;29`. |
| extract | Bước 2 màn trích xuất và Excel | Chuỗi hiển thị đúng như đã nhập dưới dạng chữ; không có hộp alert, không đổi định dạng HTML. Trích xuất và Excel: ô S01 là `&lt;29`; PDF phiếu: `&amp;29`. |
| report | Bước 2 PDF phiếu | Chuỗi hiển thị đúng như đã nhập dưới dạng chữ; không có hộp alert, không đổi định dạng HTML. Trích xuất và Excel: ô S01 là `&lt;29`; PDF phiếu: `&amp;29`. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: tài khoản học sinh S01, tài khoản phụ huynh của học sinh S01 |
| Thao tác | 1. Đăng nhập S01, xem màn.<br>2. Đổi ID học sinh trong URL/request API sang S02.<br>3. Mở URL màn cấu hình đỏ.<br>4. Đăng nhập phụ huynh của S01, xem màn và PDF công khai.<br>5. Đổi ID học sinh trong URL/request API sang S02. |
| Expected | 1. Chỉ thấy dữ liệu S01.<br>2. Bị từ chối.<br>3. Bị từ chối.<br>4. Chỉ thấy dữ liệu S01; dấu đỏ và điểm ẩn giống màn học sinh.<br>5. Bị từ chối. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| student | Bước 1–3 tài khoản học sinh | 1. Chỉ thấy dữ liệu S01.<br>2. Bị từ chối.<br>3. Bị từ chối.<br>4. Chỉ thấy dữ liệu S01; dấu đỏ và điểm ẩn giống màn học sinh.<br>5. Bị từ chối. |
| parent | Bước 4–5 tài khoản phụ huynh | 1. Chỉ thấy dữ liệu S01.<br>2. Bị từ chối.<br>3. Bị từ chối.<br>4. Chỉ thấy dữ liệu S01; dấu đỏ và điểm ẩn giống màn học sinh.<br>5. Bị từ chối. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); N = −1, 0, 100, 101; biến thể thập phân 30.5, 30.5555 |
| Thao tác | Nhập từng giá trị, Lưu. |
| Expected | −1 và 101: không lưu được. 0 và 100: lưu được. 30.5 lưu được, 30.5555 bị từ chối (PROPOSED, thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ”). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| negative | -1 | −1 và 101: không lưu được. 0 và 100: lưu được. 30.5 lưu được, 30.5555 bị từ chối (PROPOSED, thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ”). |
| zero | 0 | −1 và 101: không lưu được. 0 và 100: lưu được. 30.5 lưu được, 30.5555 bị từ chối (PROPOSED, thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ”). |
| hundred | 100 | −1 và 101: không lưu được. 0 và 100: lưu được. 30.5 lưu được, 30.5555 bị từ chối (PROPOSED, thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ”). |
| above | 101 | −1 và 101: không lưu được. 0 và 100: lưu được. 30.5 lưu được, 30.5555 bị từ chối (PROPOSED, thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ”). |
| decimal | 30.5 | −1 và 101: không lưu được. 0 và 100: lưu được. 30.5 lưu được, 30.5555 bị từ chối (PROPOSED, thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ”). |
| long-decimal | 30.5555 | −1 và 101: không lưu được. 0 và 100: lưu được. 30.5 lưu được, 30.5555 bị từ chối (PROPOSED, thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ”). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); p = 0, 1, 9, 10; cách làm tròn: chưa chọn |
| Thao tác | 1. Bật Xử lý phần lẻ（端数処理）: quan sát giá trị p mặc định.<br>2. Không chọn cách làm tròn, Lưu.<br>3. Chọn Làm tròn xuống（切り捨て） với p=0, 1, 9, 10; Lưu từng lần. |
| Expected | 1. p hiển thị 1.<br>2. Không lưu được.<br>3. p=1 và 9 lưu được; p=0 và 10 không lưu được. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| default | Giá trị mặc định p=1 | 1. p hiển thị 1.<br>2. Không lưu được.<br>3. p=1 và 9 lưu được; p=0 và 10 không lưu được. |
| missing-method | Thiếu phương thức | 1. p hiển thị 1.<br>2. Không lưu được.<br>3. p=1 và 9 lưu được; p=0 và 10 không lưu được. |
| p0 | p=0 | 1. p hiển thị 1.<br>2. Không lưu được.<br>3. p=1 và 9 lưu được; p=0 và 10 không lưu được. |
| p1 | p=1 | 1. p hiển thị 1.<br>2. Không lưu được.<br>3. p=1 và 9 lưu được; p=0 và 10 không lưu được. |
| p9 | p=9 | 1. p hiển thị 1.<br>2. Không lưu được.<br>3. p=1 và 9 lưu được; p=0 và 10 không lưu được. |
| p10 | p=10 | 1. p hiển thị 1.<br>2. Không lưu được.<br>3. p=1 và 9 lưu được; p=0 và 10 không lưu được. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc tỷ lệ 30%; học sinh S01 (điểm 29), học sinh S02 (điểm 30), học sinh S03 (điểm 31) |
| Thao tác | Đăng ký 29, 30, 31; xét với `&lt;` rồi `≤`. |
| Expected | `T=100×30/100=30`.<br><br>`&lt;`: 29 Đỏ; 30 Không đỏ; 31 Không đỏ.<br><br>`≤`: 29 Đỏ; 30 Đỏ; 31 Không đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| lt | Dấu nhỏ hơn | `T=100×30/100=30`.<br><br>`&lt;`: 29 Đỏ; 30 Không đỏ; 31 Không đỏ.<br><br>`≤`: 29 Đỏ; 30 Đỏ; 31 Không đỏ. |
| le | Dấu nhỏ hơn hoặc bằng | `T=100×30/100=30`.<br><br>`&lt;`: 29 Đỏ; 30 Không đỏ; 31 Không đỏ.<br><br>`≤`: 29 Đỏ; 30 Đỏ; 31 Không đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100); quy tắc tỷ lệ 30% (không xử lý phần lẻ); S = 13, 13.5, 14 |
| Thao tác | Đăng ký ba điểm; xét với `&lt;` rồi `≤`. |
| Expected | `T=45×30/100=13.5`.<br><br>`&lt;`: 13 Đỏ; 13.5 Không đỏ; 14 Không đỏ.<br><br>`≤`: 13 Đỏ; 13.5 Đỏ; 14 Không đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| lt | Dấu nhỏ hơn | `T=45×30/100=13.5`.<br><br>`&lt;`: 13 Đỏ; 13.5 Không đỏ; 14 Không đỏ.<br><br>`≤`: 13 Đỏ; 13.5 Đỏ; 14 Không đỏ. |
| le | Dấu nhỏ hơn hoặc bằng | `T=45×30/100=13.5`.<br><br>`&lt;`: 13 Đỏ; 13.5 Không đỏ; 14 Không đỏ.<br><br>`≤`: 13 Đỏ; 13.5 Đỏ; 14 Không đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100); (a) M=45 → `T_thô=13.5`, S=13; (b) M=47 → `T_thô=14.1`, S=14 |
| Thao tác | Với (a) và (b): xét với Không xử lý（しない）, xuống p1, gần nhất p1, lên p1. |
| Expected | (a) Không xử lý `T=13.5` → Đỏ; xuống `T=13` → Không đỏ; gần nhất `T=14` → Đỏ; lên `T=14` → Đỏ.<br><br>(b) Không xử lý `T=14.1` → Đỏ; xuống `T=14` → Không đỏ; gần nhất `T=14` → Không đỏ; lên `T=15` → Đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| m45-none | M45 không làm tròn | (a) Không xử lý `T=13.5` → Đỏ; xuống `T=13` → Không đỏ; gần nhất `T=14` → Đỏ; lên `T=14` → Đỏ.<br><br>(b) Không xử lý `T=14.1` → Đỏ; xuống `T=14` → Không đỏ; gần nhất `T=14` → Không đỏ; lên `T=15` → Đỏ. |
| m45-down | M45 cắt xuống | (a) Không xử lý `T=13.5` → Đỏ; xuống `T=13` → Không đỏ; gần nhất `T=14` → Đỏ; lên `T=14` → Đỏ.<br><br>(b) Không xử lý `T=14.1` → Đỏ; xuống `T=14` → Không đỏ; gần nhất `T=14` → Không đỏ; lên `T=15` → Đỏ. |
| m45-nearest | M45 làm tròn gần nhất | (a) Không xử lý `T=13.5` → Đỏ; xuống `T=13` → Không đỏ; gần nhất `T=14` → Đỏ; lên `T=14` → Đỏ.<br><br>(b) Không xử lý `T=14.1` → Đỏ; xuống `T=14` → Không đỏ; gần nhất `T=14` → Không đỏ; lên `T=15` → Đỏ. |
| m45-up | M45 làm tròn lên | (a) Không xử lý `T=13.5` → Đỏ; xuống `T=13` → Không đỏ; gần nhất `T=14` → Đỏ; lên `T=14` → Đỏ.<br><br>(b) Không xử lý `T=14.1` → Đỏ; xuống `T=14` → Không đỏ; gần nhất `T=14` → Không đỏ; lên `T=15` → Đỏ. |
| m47-none | M47 không làm tròn | (a) Không xử lý `T=13.5` → Đỏ; xuống `T=13` → Không đỏ; gần nhất `T=14` → Đỏ; lên `T=14` → Đỏ.<br><br>(b) Không xử lý `T=14.1` → Đỏ; xuống `T=14` → Không đỏ; gần nhất `T=14` → Không đỏ; lên `T=15` → Đỏ. |
| m47-down | M47 cắt xuống | (a) Không xử lý `T=13.5` → Đỏ; xuống `T=13` → Không đỏ; gần nhất `T=14` → Đỏ; lên `T=14` → Đỏ.<br><br>(b) Không xử lý `T=14.1` → Đỏ; xuống `T=14` → Không đỏ; gần nhất `T=14` → Không đỏ; lên `T=15` → Đỏ. |
| m47-nearest | M47 làm tròn gần nhất | (a) Không xử lý `T=13.5` → Đỏ; xuống `T=13` → Không đỏ; gần nhất `T=14` → Đỏ; lên `T=14` → Đỏ.<br><br>(b) Không xử lý `T=14.1` → Đỏ; xuống `T=14` → Không đỏ; gần nhất `T=14` → Không đỏ; lên `T=15` → Đỏ. |
| m47-up | M47 làm tròn lên | (a) Không xử lý `T=13.5` → Đỏ; xuống `T=13` → Không đỏ; gần nhất `T=14` → Đỏ; lên `T=14` → Đỏ.<br><br>(b) Không xử lý `T=14.1` → Đỏ; xuống `T=14` → Không đỏ; gần nhất `T=14` → Không đỏ; lên `T=15` → Đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số thập phân (M=100); S = 22.2 |
| Thao tác | Xét với Không xử lý, rồi xuống p1. |
| Expected | Không xử lý: `T=22.5` → Đỏ.<br><br>Xuống p1: `T=22` → Không đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| none | Không xử lý phần lẻ | Không xử lý: `T=22.5` → Đỏ.<br><br>Xuống p1: `T=22` → Không đỏ. |
| down | Cắt xuống | Không xử lý: `T=22.5` → Đỏ.<br><br>Xuống p1: `T=22` → Không đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); N = 0: S = 0; N = 100: S = 99, 100 |
| Thao tác | Xét từng cấu hình với `&lt;` và `≤`. |
| Expected | N=0 (`T=0`): S=0 `&lt;` Không đỏ; `≤` Đỏ.<br><br>N=100 (`T=100`): S=99 `&lt;` Đỏ; S=100 `&lt;` Không đỏ; S=100 `≤` Đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| zero-lt | N0 nhỏ hơn | N=0 (`T=0`): S=0 `&lt;` Không đỏ; `≤` Đỏ.<br><br>N=100 (`T=100`): S=99 `&lt;` Đỏ; S=100 `&lt;` Không đỏ; S=100 `≤` Đỏ. |
| zero-le | N0 nhỏ hơn hoặc bằng | N=0 (`T=0`): S=0 `&lt;` Không đỏ; `≤` Đỏ.<br><br>N=100 (`T=100`): S=99 `&lt;` Đỏ; S=100 `&lt;` Không đỏ; S=100 `≤` Đỏ. |
| hundred-lt | N100 nhỏ hơn | N=0 (`T=0`): S=0 `&lt;` Không đỏ; `≤` Đỏ.<br><br>N=100 (`T=100`): S=99 `&lt;` Đỏ; S=100 `&lt;` Không đỏ; S=100 `≤` Đỏ. |
| hundred-le | N100 nhỏ hơn hoặc bằng | N=0 (`T=0`): S=0 `&lt;` Không đỏ; `≤` Đỏ.<br><br>N=100 (`T=100`): S=99 `&lt;` Đỏ; S=100 `&lt;` Không đỏ; S=100 `≤` Đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục có M không hợp lệ; quy tắc tỷ lệ 30%; quy tắc “Cố định 30” (dưới 30); S = 0 |
| Thao tác | 1. Chỉ có quy tắc tỷ lệ 30% (30%): chạy lại với M=0, M=−10, M không xác định.<br>2. Chỉ có quy tắc “Cố định 30” (dưới 30) (cố định 30) trên cùng mục, M=0: chạy lại. |
| Expected | 1. Cả ba: Chưa xét được; ngừng kết quả cũ; không dùng M=100.<br>2. `T=30`, `0&lt;30` → Đỏ (không bỏ xét cố định vì M không dương). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| ratio-zero | Tỷ lệ M0 | 1. Cả ba: Chưa xét được; ngừng kết quả cũ; không dùng M=100.<br>2. `T=30`, `0&lt;30` → Đỏ (không bỏ xét cố định vì M không dương). |
| ratio-negative | Tỷ lệ M âm | 1. Cả ba: Chưa xét được; ngừng kết quả cũ; không dùng M=100.<br>2. `T=30`, `0&lt;30` → Đỏ (không bỏ xét cố định vì M không dương). |
| ratio-missing | Tỷ lệ M không xác định | 1. Cả ba: Chưa xét được; ngừng kết quả cũ; không dùng M=100.<br>2. `T=30`, `0&lt;30` → Đỏ (không bỏ xét cố định vì M không dương). |
| fixed-zero | Cố định với M0 | 1. Cả ba: Chưa xét được; ngừng kết quả cũ; không dùng M=100.<br>2. `T=30`, `0&lt;30` → Đỏ (không bỏ xét cố định vì M không dương). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục điểm đơn vị (đơn vị U1 có M riêng 40); S01 (G-A) U1=14; S06 (G-B) U1=14, U2=29 |
| Thao tác | 1. Đăng ký các điểm, xem kết quả.<br>2. Tạo thêm một định nghĩa lựa chọn M=20 ở Thiết lập điểm tối đa（満点設定） nhưng không gán cho G-B; đăng ký lại S06 U1.<br>3. Chuẩn bị G-B sao cho điểm cao nhất thực tế của U2 là 80 và nhóm tổng hợp chứa lớp có M khác (tổng điểm tối đa nhóm khác 100); đăng ký lại S06 U2 = 29. |
| Expected | 1. S01 U1: `M=50`, `T=15` → Đỏ. S06 U1: `M=40`, `T=12` → Không đỏ. S06 U2: `M=100`, `T=30` → Đỏ.<br>2. S06 U1 vẫn dùng `M=40` → Không đỏ.<br>3. S06 U2 vẫn dùng `M=100`, `T=30` → Đỏ; không dùng điểm cao nhất thực tế (80 → `T=24`, Không đỏ — sai) hay tổng điểm tối đa nhóm. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| resolution | Lượt đầu theo các M hợp lệ | 1. S01 U1: `M=50`, `T=15` → Đỏ. S06 U1: `M=40`, `T=12` → Không đỏ. S06 U2: `M=100`, `T=30` → Đỏ.<br>2. S06 U1 vẫn dùng `M=40` → Không đỏ.<br>3. S06 U2 vẫn dùng `M=100`, `T=30` → Đỏ; không dùng điểm cao nhất thực tế (80 → `T=24`, Không đỏ — sai) hay tổng điểm tối đa nhóm. |
| unassigned | Không chọn định nghĩa | 1. S01 U1: `M=50`, `T=15` → Đỏ. S06 U1: `M=40`, `T=12` → Không đỏ. S06 U2: `M=100`, `T=30` → Đỏ.<br>2. S06 U1 vẫn dùng `M=40` → Không đỏ.<br>3. S06 U2 vẫn dùng `M=100`, `T=30` → Đỏ; không dùng điểm cao nhất thực tế (80 → `T=24`, Không đỏ — sai) hay tổng điểm tối đa nhóm. |
| actual80 | Bước 3, điểm học sinh cao nhất thực tế là 80 nhưng M vẫn 100; không đổi M thành 80 | 1. S01 U1: `M=50`, `T=15` → Đỏ. S06 U1: `M=40`, `T=12` → Không đỏ. S06 U2: `M=100`, `T=30` → Đỏ.<br>2. S06 U1 vẫn dùng `M=40` → Không đỏ.<br>3. S06 U2 vẫn dùng `M=100`, `T=30` → Đỏ; không dùng điểm cao nhất thực tế (80 → `T=24`, Không đỏ — sai) hay tổng điểm tối đa nhóm. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc tỷ lệ 30%; S = 20; bản tổng hợp đã chốt (trung bình 49.99) |
| Thao tác | Đăng ký S=20, xem kết quả. |
| Expected | `T=50×30/100=15` → `20&lt;15` sai → Không đỏ. (Nếu dùng M=100 của bản chốt: `T=30` → Đỏ — sai.) |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | `T=50×30/100=15` → `20&lt;15` sai → Không đỏ. (Nếu dùng M=100 của bản chốt: `T=30` → Đỏ — sai.) |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100) |
| Thao tác | 1. Xem màn.<br>2. Chọn Có（する） ở Xử lý phần lẻ. |
| Expected | Không có khối nguồn trung bình (đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”); Xử lý phần lẻ có Không（しない）/Có（する）, mặc định Không; khi Có thì hiện ô vị trí chữ số và phương thức.<br><br>Mô tả M theo Figma (PROPOSED): câu chung 「対象の授業・時期・単元に適用される満点を使用」 (dùng điểm tối đa áp dụng cho lớp/kỳ/đơn vị). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Không có khối nguồn trung bình (đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”); Xử lý phần lẻ có Không（しない）/Có（する）, mặc định Không; khi Có thì hiện ô vị trí chữ số và phương thức.<br><br>Mô tả M theo Figma (PROPOSED): câu chung 「対象の授業・時期・単元に適用される満点を使用」 (dùng điểm tối đa áp dụng cho lớp/kỳ/đơn vị). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); học sinh S01 (điểm 29), mục điểm đơn vị (đơn vị U1 có M riêng 40); quy tắc “Cố định 30” (dưới 30) (bước 4) |
| Thao tác | 1. SELECT `red_score_results` theo `school_id`, `year`, `evaluate_frame_item_id`, `group_id`, `student_id`, `tangen_id` của các ô.<br>2. Chạy lại nút cam, SELECT lại.<br>3. `SHOW INDEX FROM red_score_results`.<br>4. Chuẩn bị hai mục cùng tên Điểm đánh giá（評点） ở hai kỳ khác nhau; chỉ mục kỳ 1 có quy tắc “Cố định 30” (dưới 30). Đăng ký S01 = 25 ở cả hai mục, xem đầu ra và SELECT.<br>5. Đổi tên mục kỳ 1 và đổi thứ tự cột mục trên khung đánh giá (nếu màn hỗ trợ); xem đầu ra và SELECT lại, chưa chạy xét. |
| Expected | 1–3. Mỗi ô (trường, năm, mục trên khung đánh giá — gồm kỳ/thời điểm, lớp, học sinh, đơn vị) có đúng một dòng hiện hành; U1/U2 của S06 là hai dòng; ô điểm thường có `tangen_id=0`. Chạy lại không tạo dòng thứ hai.<br><br>4. Ô kỳ 1 Đỏ; ô kỳ 2 không có dấu đỏ (không mượn quy tắc hay kết quả của mục cùng tên); hai kết quả gắn đúng `evaluate_frame_item_id` của từng mục.<br>5. Kết quả Đỏ vẫn gắn với đúng mục kỳ 1 (không theo số thứ tự cột hay tên mục). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1–3. Mỗi ô (trường, năm, mục trên khung đánh giá — gồm kỳ/thời điểm, lớp, học sinh, đơn vị) có đúng một dòng hiện hành; U1/U2 của S06 là hai dòng; ô điểm thường có `tangen_id=0`. Chạy lại không tạo dòng thứ hai.<br><br>4. Ô kỳ 1 Đỏ; ô kỳ 2 không có dấu đỏ (không mượn quy tắc hay kết quả của mục cùng tên); hai kết quả gắn đúng `evaluate_frame_item_id` của từng mục.<br>5. Kết quả Đỏ vẫn gắn với đúng mục kỳ 1 (không theo số thứ tự cột hay tên mục). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29), học sinh S03 (điểm 31), học sinh S05 (ô trống) |
| Thao tác | 1. SELECT `judgment_status`, `is_red`, `red_score_setting_id`, `reason_code` của các ô.<br>2. Đổi ngưỡng quy tắc “Cố định 30” (dưới 30) thành 35 (chỉ lưu), SELECT lại ô S03. |
| Expected | 1. Sáu trạng thái phân biệt được, không gộp Chưa xét được với Không áp dụng hay Không đỏ. Việc dùng cột, mã số, `reason_code` hoặc `red_score_setting_id` cụ thể là phần thiết kế DB cần đối chiếu khi schema được chốt; không dùng mapping đề xuất làm business oracle. Bất kể cách lưu, kết quả quan sát phải phân biệt rõ sáu trạng thái và trạng thái Đang chờ chạy lại.<br>2. Dòng của S03 giữ nguyên (đang chờ chạy lại không có trạng thái riêng). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. Sáu trạng thái phân biệt được, không gộp Chưa xét được với Không áp dụng hay Không đỏ. Việc dùng cột, mã số, `reason_code` hoặc `red_score_setting_id` cụ thể là phần thiết kế DB cần đối chiếu khi schema được chốt; không dùng mapping đề xuất làm business oracle. Bất kể cách lưu, kết quả quan sát phải phân biệt rõ sáu trạng thái và trạng thái Đang chờ chạy lại.<br>2. Dòng của S03 giữ nguyên (đang chờ chạy lại không có trạng thái riêng). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8); học sinh S01–S09 |
| Thao tác | 1. SELECT điểm trước.<br>2. Chạy nút cam.<br>3. SELECT điểm sau. |
| Expected | Mọi điểm giữ nguyên (kể cả S09=29.5). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Mọi điểm giữ nguyên (kể cả S09=29.5). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước |
| Thao tác | 1. Đổi từng cấu hình đầu ra, lưu.<br>2. Kiểm quy tắc và kết quả xét. |
| Expected | Quy tắc và kết quả không đổi; cấu hình mỗi đầu ra độc lập (đổi công khai không đổi trích xuất). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| extract | Cấu hình trích xuất | Quy tắc và kết quả không đổi; cấu hình mỗi đầu ra độc lập (đổi công khai không đổi trích xuất). |
| publish | Cấu hình công khai | Quy tắc và kết quả không đổi; cấu hình mỗi đầu ra độc lập (đổi công khai không đổi trích xuất). |
| report | Cấu hình phiếu điểm | Quy tắc và kết quả không đổi; cấu hình mỗi đầu ra độc lập (đổi công khai không đổi trích xuất). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S01 (điểm 29); quy tắc tỷ lệ 30%; quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8) |
| Thao tác | 1. SELECT `red_score_setting_id`, `reason_code`, `judgment_context`, `judged_at` của ô Đỏ (S01), ô Chưa xét được, ô Không áp dụng, ô chưa từng xét, ô Tỷ lệ và ô có nguồn.<br>2. Làm ô S01 chuyển từ Đỏ sang Không áp dụng (như case “Xóa quy tắc cuối: giữ kết quả tới lần chạy lại; chạy lại → Không áp dụng”), SELECT lại. |
| Expected | 1. Ô Đỏ: có quy tắc được chọn; `judgment_context` có `score`="29", `threshold` dạng tử/mẫu (30/1), `compare_type`=1, `sources` rỗng với quy tắc cố định. Ô Chưa xét được: có `reason_code` (ví dụ `source_missing`). `judged_at` có giá trị cho cả ô Chưa xét được và Không áp dụng; NULL ở ô chưa từng xét. Ô có điểm hợp lệ: `judgment_context` có `grade_id` (ID dòng điểm nguồn). Ô Tỷ lệ: `judgment_context` có `maximum`. Ô có nguồn: `sources[]` có `usage`, `kind`, `reference`, `population_key`; với nhóm môn học（科目グループ） có thêm `resolved_population_type`/`resolved_population_ref_id` nhưng vẫn giữ loại/ID đã chọn. Không có tên học sinh, thông tin liên hệ hay câu lỗi SQL.<br>2. Sau khi chuyển sang Không áp dụng: không còn giữ ngưỡng, dấu so sánh hay nguồn của lần Đỏ trước. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. Ô Đỏ: có quy tắc được chọn; `judgment_context` có `score`="29", `threshold` dạng tử/mẫu (30/1), `compare_type`=1, `sources` rỗng với quy tắc cố định. Ô Chưa xét được: có `reason_code` (ví dụ `source_missing`). `judged_at` có giá trị cho cả ô Chưa xét được và Không áp dụng; NULL ở ô chưa từng xét. Ô có điểm hợp lệ: `judgment_context` có `grade_id` (ID dòng điểm nguồn). Ô Tỷ lệ: `judgment_context` có `maximum`. Ô có nguồn: `sources[]` có `usage`, `kind`, `reference`, `population_key`; với nhóm môn học（科目グループ） có thêm `resolved_population_type`/`resolved_population_ref_id` nhưng vẫn giữ loại/ID đã chọn. Không có tên học sinh, thông tin liên hệ hay câu lỗi SQL.<br>2. Sau khi chuyển sang Không áp dụng: không còn giữ ngưỡng, dấu so sánh hay nguồn của lần Đỏ trước. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quyền đọc DB local (chỉ SELECT/SHOW) |
| Thao tác | 1. `SHOW CREATE TABLE` và `SHOW FULL COLUMNS` cho `red_score_settings`, `red_score_results`.<br>2. `SHOW CREATE TABLE` cho `grade_publish_conf_grade_items` và `grade_evaluate_frame_items`; so với bản trước migration (hoặc DDL gốc trong source). |
| Expected | 1. Có phạm vi trường/năm, cột audit và comment theo quy tắc schema hiện hành. Đối chiếu thêm với thiết kế (PROPOSED): InnoDB, `utf8mb4`/`utf8mb4_general_ci`, không khai báo foreign key, có `idx_red_score_settings_01`, `uk_red_score_results_01`, `idx_red_score_results_01`, `setting_status` mặc định 0 và phân biệt rõ trạng thái 0/1/2; `red_score_results` có thêm `cell_generation`, `write_version` (mặc định 0), `judged_version`, `rule_revision` (cho phép NULL); bảng/cột cũ (`red_score`, `changed_red_score`) không đổi.<br>2. (PROPOSED) Chỉ thêm `red_score_display_type TINYINT UNSIGNED NOT NULL DEFAULT 0` vào `grade_publish_conf_grade_items` và `red_score_revision BIGINT UNSIGNED NOT NULL DEFAULT 0` vào `grade_evaluate_frame_items`; không đổi kiểu/khóa/collation của cột có sẵn, không thêm index hay foreign key. Thiết lập đỏ của Trích xuất thành tích（成績抽出） và Công cụ phiếu điểm（通知表ツール） không có cột/bảng mới (dùng JSON `grade_extract_conf.extract_setting` và phần lưu bảng/điều kiện phiếu điểm hiện có). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. Có phạm vi trường/năm, cột audit và comment theo quy tắc schema hiện hành. Đối chiếu thêm với thiết kế (PROPOSED): InnoDB, `utf8mb4`/`utf8mb4_general_ci`, không khai báo foreign key, có `idx_red_score_settings_01`, `uk_red_score_results_01`, `idx_red_score_results_01`, `setting_status` mặc định 0 và phân biệt rõ trạng thái 0/1/2; `red_score_results` có thêm `cell_generation`, `write_version` (mặc định 0), `judged_version`, `rule_revision` (cho phép NULL); bảng/cột cũ (`red_score`, `changed_red_score`) không đổi.<br>2. (PROPOSED) Chỉ thêm `red_score_display_type TINYINT UNSIGNED NOT NULL DEFAULT 0` vào `grade_publish_conf_grade_items` và `red_score_revision BIGINT UNSIGNED NOT NULL DEFAULT 0` vào `grade_evaluate_frame_items`; không đổi kiểu/khóa/collation của cột có sẵn, không thêm index hay foreign key. Thiết lập đỏ của Trích xuất thành tích（成績抽出） và Công cụ phiếu điểm（通知表ツール） không có cột/bảng mới (dùng JSON `grade_extract_conf.extract_setting` và phần lưu bảng/điều kiện phiếu điểm hiện có). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: hai cấu hình công khai cùng một mục, cấu hình công khai có mục điểm thường và mục điểm đơn vị; quyền đọc DB local (chỉ SELECT/SHOW); tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm), tài khoản của trường B |
| Thao tác | 1. SELECT `grade_publish_conf_id`, `year`, `evaluate_item_id`, `tangen_flg`, `red_score_display_type` của X, Y và của cấu hình cũ.<br>2. Mở cấu hình cũ trên màn, xem màn học sinh của cấu hình đó.<br>3. Sao chép X; SELECT dòng của bản sao.<br>4. Gửi request lưu với `red_score_display_type`=4, và với ID cấu hình công khai của trường B (tài khoản của trường B / trường B (trường khác)). |
| Expected | 1. X: 1 (ngoặc) ở dòng mục số nguyên (M=100); Y: 2 (`*` trước); dòng thường/đơn vị tách theo `tangen_flg`. Không có cột hiệu ứng trong bảng kết quả của học sinh.<br>2. Dòng cũ có giá trị 0; hiển thị giữ như trước khi có chức năng.<br>3. Bản sao có ID cấu hình mới và giữ giá trị 1; không có dòng kết quả học sinh nào được sao chép.<br>4. Bị từ chối; giá trị đã lưu không đổi. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| read-copy | Bước 1–3 đọc cấu hình cũ và sao chép | 1. X: 1 (ngoặc) ở dòng mục số nguyên (M=100); Y: 2 (`*` trước); dòng thường/đơn vị tách theo `tangen_flg`. Không có cột hiệu ứng trong bảng kết quả của học sinh.<br>2. Dòng cũ có giá trị 0; hiển thị giữ như trước khi có chức năng.<br>3. Bản sao có ID cấu hình mới và giữ giá trị 1; không có dòng kết quả học sinh nào được sao chép.<br>4. Bị từ chối; giá trị đã lưu không đổi. |
| invalid-enum | Bước 4 giá trị 4 | 1. X: 1 (ngoặc) ở dòng mục số nguyên (M=100); Y: 2 (`*` trước); dòng thường/đơn vị tách theo `tangen_flg`. Không có cột hiệu ứng trong bảng kết quả của học sinh.<br>2. Dòng cũ có giá trị 0; hiển thị giữ như trước khi có chức năng.<br>3. Bản sao có ID cấu hình mới và giữ giá trị 1; không có dòng kết quả học sinh nào được sao chép.<br>4. Bị từ chối; giá trị đã lưu không đổi. |
| foreign-school | Bước 4 ID trường B | 1. X: 1 (ngoặc) ở dòng mục số nguyên (M=100); Y: 2 (`*` trước); dòng thường/đơn vị tách theo `tangen_flg`. Không có cột hiệu ứng trong bảng kết quả của học sinh.<br>2. Dòng cũ có giá trị 0; hiển thị giữ như trước khi có chức năng.<br>3. Bản sao có ID cấu hình mới và giữ giá trị 1; không có dòng kết quả học sinh nào được sao chép.<br>4. Bị từ chối; giá trị đã lưu không đổi. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), cặp quy tắc cùng áp dụng (dưới 20 và dưới 30); học sinh S01 (điểm 29), học sinh S02 (điểm 30); quyền đọc DB local (chỉ SELECT/SHOW) |
| Thao tác | 1. SELECT `red_score_revision` của mục mục số nguyên (M=100) trên `grade_evaluate_frame_items`; SELECT `cell_generation`, `write_version`, `judged_version`, `rule_revision`, `judgment_status` của S01.<br>2. Chuỗi revision độc lập: trên fixture A, lần lượt thêm quy tắc; sửa ngưỡng; đổi thứ tự; xóa quy tắc. SELECT `red_score_revision` và kết quả S01 sau mỗi thao tác, chưa chạy xét.<br>3. Chuỗi xóa cuối độc lập trên fixture B: tạo S01=29 Đỏ, xóa tới quy tắc cuối, rồi chạy lại; không dùng kết quả của chuỗi revision A làm baseline.<br>4. Chuỗi reservation độc lập trên fixture C: đặt batch S01 nhưng chưa hoàn tất, SELECT S01; chỉ đánh giá trạng thái theo R18 §7.5/§8.2, không mặc định payload cũ được giữ.<br>5. Chuỗi cell-generation độc lập trên fixture D: lưu điểm S02 lần đầu, rồi xóa trống ô S01; SELECT từng ô. |
| Expected | 1. Có giá trị ban đầu; `judged_version` của S01 bằng phiên bản của lần ghi hoàn tất.<br>2. Trên fixture A, `red_score_revision` tăng sau mỗi thao tác cấu hình; kết quả S01 chỉ được đối chiếu trước khi có trigger chạy lại.<br>3. Trên fixture B, sau xóa rule cuối và chạy lại, S01 chuyển theo trạng thái Không áp dụng/đã ngừng kết quả cũ của G20/G21; không đọc kết quả từ fixture A.<br>4. Trên fixture C, ghi nhận chính sách trạng thái thực tế; không dùng “payload đỏ vẫn còn” làm expected cố định khi phiên bản lệch.<br>5. Trên fixture D, có đúng một dòng điều khiển cho mỗi ô; sau khi hoàn tất có trạng thái và `judged_at`.<br>6. Trên fixture D, `cell_generation` mới và thông tin rule/ngưỡng/nguồn cũ bị xóa theo trạng thái xóa ô; dòng điều khiển được giữ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| revision | Bước 1–2 fixture A, SELECT sau từng sự kiện | 1. Có giá trị ban đầu; `judged_version` của S01 bằng phiên bản của lần ghi hoàn tất.<br>2. Trên fixture A, `red_score_revision` tăng sau mỗi thao tác cấu hình; kết quả S01 chỉ được đối chiếu trước khi có trigger chạy lại.<br>3. Trên fixture B, sau xóa rule cuối và chạy lại, S01 chuyển theo trạng thái Không áp dụng/đã ngừng kết quả cũ của G20/G21; không đọc kết quả từ fixture A.<br>4. Trên fixture C, ghi nhận chính sách trạng thái thực tế; không dùng “payload đỏ vẫn còn” làm expected cố định khi phiên bản lệch.<br>5. Trên fixture D, có đúng một dòng điều khiển cho mỗi ô; sau khi hoàn tất có trạng thái và `judged_at`.<br>6. Trên fixture D, `cell_generation` mới và thông tin rule/ngưỡng/nguồn cũ bị xóa theo trạng thái xóa ô; dòng điều khiển được giữ. |
| delete-last-rule | Bước 1 và 3 fixture B độc lập | 1. Có giá trị ban đầu; `judged_version` của S01 bằng phiên bản của lần ghi hoàn tất.<br>2. Trên fixture A, `red_score_revision` tăng sau mỗi thao tác cấu hình; kết quả S01 chỉ được đối chiếu trước khi có trigger chạy lại.<br>3. Trên fixture B, sau xóa rule cuối và chạy lại, S01 chuyển theo trạng thái Không áp dụng/đã ngừng kết quả cũ của G20/G21; không đọc kết quả từ fixture A.<br>4. Trên fixture C, ghi nhận chính sách trạng thái thực tế; không dùng “payload đỏ vẫn còn” làm expected cố định khi phiên bản lệch.<br>5. Trên fixture D, có đúng một dòng điều khiển cho mỗi ô; sau khi hoàn tất có trạng thái và `judged_at`.<br>6. Trên fixture D, `cell_generation` mới và thông tin rule/ngưỡng/nguồn cũ bị xóa theo trạng thái xóa ô; dòng điều khiển được giữ. |
| reservation | Bước 1 và 4 fixture C độc lập | 1. Có giá trị ban đầu; `judged_version` của S01 bằng phiên bản của lần ghi hoàn tất.<br>2. Trên fixture A, `red_score_revision` tăng sau mỗi thao tác cấu hình; kết quả S01 chỉ được đối chiếu trước khi có trigger chạy lại.<br>3. Trên fixture B, sau xóa rule cuối và chạy lại, S01 chuyển theo trạng thái Không áp dụng/đã ngừng kết quả cũ của G20/G21; không đọc kết quả từ fixture A.<br>4. Trên fixture C, ghi nhận chính sách trạng thái thực tế; không dùng “payload đỏ vẫn còn” làm expected cố định khi phiên bản lệch.<br>5. Trên fixture D, có đúng một dòng điều khiển cho mỗi ô; sau khi hoàn tất có trạng thái và `judged_at`.<br>6. Trên fixture D, `cell_generation` mới và thông tin rule/ngưỡng/nguồn cũ bị xóa theo trạng thái xóa ô; dòng điều khiển được giữ. |
| cell-generation | Bước 1 và 5 fixture D độc lập | 1. Có giá trị ban đầu; `judged_version` của S01 bằng phiên bản của lần ghi hoàn tất.<br>2. Trên fixture A, `red_score_revision` tăng sau mỗi thao tác cấu hình; kết quả S01 chỉ được đối chiếu trước khi có trigger chạy lại.<br>3. Trên fixture B, sau xóa rule cuối và chạy lại, S01 chuyển theo trạng thái Không áp dụng/đã ngừng kết quả cũ của G20/G21; không đọc kết quả từ fixture A.<br>4. Trên fixture C, ghi nhận chính sách trạng thái thực tế; không dùng “payload đỏ vẫn còn” làm expected cố định khi phiên bản lệch.<br>5. Trên fixture D, có đúng một dòng điều khiển cho mỗi ô; sau khi hoàn tất có trạng thái và `judged_at`.<br>6. Trên fixture D, `cell_generation` mới và thông tin rule/ngưỡng/nguồn cũ bị xóa theo trạng thái xóa ô; dòng điều khiển được giữ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Có dữ liệu legacy `red_score` trước khi bật cấu hình mới; có cùng mục được cấu hình rule mới. |
| Thao tác | 1. Xem báo cáo riêng trường trước và sau khi cấu hình/chạy rule mới.<br>2. Đối chiếu giá trị legacy và kết luận của rule mới. |
| Expected | Legacy không bị chuyển thành rule mới, reset hoặc dùng thay cho rule mới; hai nguồn được giữ riêng và báo cáo legacy vẫn giữ cách dùng cũ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Legacy không bị chuyển thành rule mới, reset hoặc dùng thay cho rule mới; hai nguồn được giữ riêng và báo cáo legacy vẫn giữ cách dùng cũ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Nguồn: trường A / năm 2026 / mục Toán / nhóm G-A, có rule mới `&lt;30`, ngưỡng legacy `red_score=25` đang được báo cáo riêng, và S01 có kết quả Đỏ đã chốt. Đích: trường A / năm 2026 / mục Toán tương ứng / nhóm G-B, chưa có legacy/kết quả cá nhân; mapping môn Toán và identity ô đích khác nguồn. Có chức năng sao chép cấu hình trong phạm vi đợt. |
| Thao tác | 1. Ghi snapshot trước thao tác: rule, mapping mục/môn/nhóm, legacy và kết quả riêng của S01 ở nguồn.<br>2. Sao chép cấu hình sang mục/đối tượng đích; ghi identity nguồn/đích và mapping thực tế.<br>3. Mở cấu hình, legacy và kết quả của đích; không dùng dữ liệu nguồn làm baseline cho đích. |
| Expected | Cấu hình `&lt;30` được ánh xạ theo identity đích. Ngưỡng legacy `red_score=25` có mapping hợp lệ cũng được sao chép theo đường legacy hiện hữu: nguồn và đích đều đọc ra 25 tại cấu hình/báo cáo legacy riêng; không xóa, đổi nghĩa hoặc biến thành rule/fallback mới. Nếu đường sao chép legacy của build chưa được xác minh, giữ nhánh BLOCKED và ghi seam/mapping thiếu. Đích không có kết quả đỏ/bản chốt **cá nhân** của S01 nguồn; chỉ lần xét mới trên identity đích mới tạo kết quả cá nhân ở đích. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Cấu hình `&lt;30` được ánh xạ theo identity đích. Ngưỡng legacy `red_score=25` có mapping hợp lệ cũng được sao chép theo đường legacy hiện hữu: nguồn và đích đều đọc ra 25 tại cấu hình/báo cáo legacy riêng; không xóa, đổi nghĩa hoặc biến thành rule/fallback mới. Nếu đường sao chép legacy của build chưa được xác minh, giữ nhánh BLOCKED và ghi seam/mapping thiếu. Đích không có kết quả đỏ/bản chốt **cá nhân** của S01 nguồn; chỉ lần xét mới trên identity đích mới tạo kết quả cá nhân ở đích. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Nguồn: TD-LEGACY-01 tại trường A/năm 2025/kỳ Cuối kỳ học kỳ 1/mục Toán/nhóm G-A có rule mới `&lt;30`, ngưỡng legacy `red_score=25`, snapshot và kết quả cá nhân Đỏ của S01. Đích: cùng trường/năm 2026/kỳ tương ứng/mục Toán/nhóm được ánh xạ G-A→G-A năm mới, ban đầu không có ngưỡng legacy hay kết quả cá nhân; ghi identity học sinh đích riêng. Đường tạo/kế thừa năm cần provision và xác minh mapping thực tế. |
| Thao tác | 1. Chụp riêng rule mới, giá trị legacy 25 tại nguồn, snapshot và kết quả cá nhân S01 năm 2025; ghi đích chưa có legacy/kết quả.<br>2. Tạo năm 2026/kế thừa cấu hình; ghi mapping kỳ/mục Toán/môn Toán/nhóm G-A, identity ô và học sinh đích thực tế.<br>3. Đọc lại ngưỡng/báo cáo legacy của hai năm; mở kết quả cá nhân năm 2026 **trước** khi chạy xét, rồi chạy xét riêng ở đích. |
| Expected | Rule mới `&lt;30` và ngưỡng legacy **25** được kế thừa đúng mapping: nguồn vẫn 25, đích đọc 25 ở cấu hình/báo cáo legacy riêng; không thành rule/fallback mới. Trước lần xét mới, đích không có snapshot/kết quả **cá nhân** của S01 năm 2025; sau lần xét riêng, kết quả chỉ mang identity năm 2026. Nếu chưa xác minh được seam kế thừa/mapping hoặc reader legacy ở đích thì BLOCKED, không chỉ kiểm nguồn giữ nguyên. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Rule mới `&lt;30` và ngưỡng legacy **25** được kế thừa đúng mapping: nguồn vẫn 25, đích đọc 25 ở cấu hình/báo cáo legacy riêng; không thành rule/fallback mới. Trước lần xét mới, đích không có snapshot/kết quả **cá nhân** của S01 năm 2025; sau lần xét riêng, kết quả chỉ mang identity năm 2026. Nếu chưa xác minh được seam kế thừa/mapping hoặc reader legacy ở đích thì BLOCKED, không chỉ kiểm nguồn giữ nguyên. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Nguồn: TD-LEGACY-01 trường A/năm 2025/kỳ Cuối kỳ học kỳ 1/mục Toán/nhóm G-A. File cấu hình xuất phải chứa mapping kỳ/môn Toán/mục Toán/nhóm G-A **và giá trị legacy `red_score=25`**, không chỉ metadata/tên field; rule mới `&lt;30` nằm ở phần cấu hình mới riêng. Snapshot/kết quả cá nhân Đỏ của S01 làm đối chứng âm, không thuộc payload cấu hình được phép nhập. Đích: trường A/năm 2026/kỳ, môn, mục, nhóm tương ứng được ánh xạ, ban đầu chưa có legacy/kết quả cá nhân; quyền nhập hợp lệ. |
| Thao tác | 1. Ghi file xuất thật, vị trí giá trị legacy 25, mapping nguồn→đích và sự vắng mặt của snapshot/kết quả cá nhân trong phần cấu hình.<br>2. Nhập file vào trường/năm đích bằng đường import được hỗ trợ; ghi response/lỗi ánh xạ nếu có.<br>3. Đọc lại legacy ở nguồn và đích qua cấu hình/báo cáo riêng, rule mới và kết quả cá nhân đích trước/sau lần xét riêng. |
| Expected | Chỉ payload cấu hình có mapping hợp lệ được nhập: ngưỡng legacy nguồn 25 vẫn là 25, file chứa 25 và đích đọc ra **25** ở cấu hình/báo cáo legacy riêng; rule mới `&lt;30` giữ riêng, không dùng 25 như fallback. Snapshot/kết quả **cá nhân** của S01 nguồn không được nhập hoặc gắn vào identity đích trước lần xét riêng; kết quả mới phải mang identity đích. Nếu format/đường import hoặc reader legacy chưa xác minh thì BLOCKED đúng nhánh, ghi seam thiếu, không suy giá trị từ metadata trống. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Chỉ payload cấu hình có mapping hợp lệ được nhập: ngưỡng legacy nguồn 25 vẫn là 25, file chứa 25 và đích đọc ra **25** ở cấu hình/báo cáo legacy riêng; rule mới `&lt;30` giữ riêng, không dùng 25 như fallback. Snapshot/kết quả **cá nhân** của S01 nguồn không được nhập hoặc gắn vào identity đích trước lần xét riêng; kết quả mới phải mang identity đích. Nếu format/đường import hoặc reader legacy chưa xác minh thì BLOCKED đúng nhánh, ghi seam thiếu, không suy giá trị từ metadata trống. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Nguồn: TD-LEGACY-01, ô cũ trường A/năm 2025/kỳ Cuối kỳ học kỳ 1/mục Toán/nhóm G-A có rule mới `&lt;30`, ngưỡng legacy 25, snapshot và kết quả cá nhân Đỏ. Đích: ô/khung tạo lại có identity mới, cùng kỳ/môn Toán/mục Toán/nhóm G-A theo mapping được hỗ trợ, ban đầu chưa có legacy/kết quả cá nhân; đường khôi phục cần provision. |
| Thao tác | 1. Chụp identity, rule mới, ngưỡng legacy 25 và kết quả cá nhân ô cũ; ghi ô đích chưa có các giá trị đó.<br>2. Khôi phục/thay khung theo đường được hỗ trợ; ghi mapping kỳ/môn/mục/nhóm và ô cũ → ô mới, không tự ghép theo tên giống nhau.<br>3. Đọc lại ngưỡng/báo cáo legacy nguồn và đích, rule mới và kết quả cá nhân ô mới trước/sau khi xét riêng; kiểm ba đầu ra theo identity ô. |
| Expected | Nguồn giữ ngưỡng legacy **25**; ô/khung mới có mapping hợp lệ cũng đọc **25** qua cấu hình/báo cáo legacy riêng, không thành rule/fallback mới. Ô mới **không** nhận snapshot/kết quả cá nhân của ô cũ trước lần xét riêng; sau đó kết quả phải mang identity ô mới. Nếu chưa xác minh đường khôi phục/mapping hoặc reader legacy ở đích thì BLOCKED, không bỏ nhánh. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Nguồn giữ ngưỡng legacy **25**; ô/khung mới có mapping hợp lệ cũng đọc **25** qua cấu hình/báo cáo legacy riêng, không thành rule/fallback mới. Ô mới **không** nhận snapshot/kết quả cá nhân của ô cũ trước lần xét riêng; sau đó kết quả phải mang identity ô mới. Nếu chưa xác minh đường khôi phục/mapping hoặc reader legacy ở đích thì BLOCKED, không bỏ nhánh. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Nguồn: TD-LEGACY-01 trường A/năm 2025/kỳ Cuối kỳ học kỳ 1/mục Toán/nhóm G-A có rule mới `&lt;30`, ngưỡng legacy 25, snapshot và kết quả cá nhân Đỏ của S01. Đích: cùng trường/năm 2026/kỳ tương ứng/môn Toán/mục Toán/nhóm được ánh xạ G-A→G-A năm mới, ban đầu không có legacy, snapshot hoặc kết quả nguồn; đường sync cấu hình cần provision. |
| Thao tác | 1. Ghi mapping kỳ/môn/mục/nhóm, identity nguồn/đích, giá trị legacy nguồn 25 và snapshot/kết quả cá nhân nguồn; ghi trạng thái đích ban đầu.<br>2. Đồng bộ cấu hình; đọc lại rule mới và ngưỡng/báo cáo legacy ở cả nguồn lẫn đích.<br>3. Mở kết quả cá nhân và ba đầu ra của đích **trước** khi chạy xét, sau đó chạy xét riêng ở đích và đọc lại. |
| Expected | Đồng bộ cấu hình có mapping hợp lệ giữ ngưỡng legacy **25** ở nguồn và đưa **25** tới cấu hình/báo cáo legacy riêng của đích; không thành rule/fallback mới. Trước lần xét riêng, đích chưa được coi là đã xét và không dùng snapshot/kết quả **cá nhân** nguồn; sau đó kết quả chỉ thuộc identity đích. Nếu seam sync/mapping hoặc reader legacy ở đích chưa xác minh thì BLOCKED, không coi chỉ bảo toàn nguồn là đủ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Đồng bộ cấu hình có mapping hợp lệ giữ ngưỡng legacy **25** ở nguồn và đưa **25** tới cấu hình/báo cáo legacy riêng của đích; không thành rule/fallback mới. Trước lần xét riêng, đích chưa được coi là đã xét và không dùng snapshot/kết quả **cá nhân** nguồn; sau đó kết quả chỉ thuộc identity đích. Nếu seam sync/mapping hoặc reader legacy ở đích chưa xác minh thì BLOCKED, không coi chỉ bảo toàn nguồn là đủ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Có giá trị và kết quả legacy trước khi thêm rule mới. |
| Thao tác | 1. Thêm, sửa, xóa và chạy rule mới.<br>2. Đọc lại giá trị legacy và kết quả legacy. |
| Expected | Giá trị legacy không bị sửa, xóa hoặc dùng lại làm kết quả cá nhân của rule mới. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Giá trị legacy không bị sửa, xóa hoặc dùng lại làm kết quả cá nhân của rule mới. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Nguồn có cấu hình, bản chốt và kết quả cá nhân legacy; đích là năm mới/đối tượng mới. |
| Thao tác | 1. Thực hiện từng đường copy, kế thừa năm, import/export và sync.<br>2. Kiểm tra cấu hình, mapping identity, bản chốt và kết quả trước khi chạy xét ở đích. |
| Expected | Chỉ phần được phép copy/sync được chuyển; không chuyển kết quả cá nhân hoặc bản chốt legacy sang identity đích. Mapping đúng; đích chỉ có kết quả sau lượt xét riêng. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| copy | Đường copy, fixture DATA-015 | Chỉ phần được phép copy/sync được chuyển; không chuyển kết quả cá nhân hoặc bản chốt legacy sang identity đích. Mapping đúng; đích chỉ có kết quả sau lượt xét riêng. |
| year | Đường kế thừa năm, fixture DATA-016 | Chỉ phần được phép copy/sync được chuyển; không chuyển kết quả cá nhân hoặc bản chốt legacy sang identity đích. Mapping đúng; đích chỉ có kết quả sau lượt xét riêng. |
| import-export | Đường xuất nhập, fixture DATA-017 | Chỉ phần được phép copy/sync được chuyển; không chuyển kết quả cá nhân hoặc bản chốt legacy sang identity đích. Mapping đúng; đích chỉ có kết quả sau lượt xét riêng. |
| sync | Đường đồng bộ, fixture DATA-019 | Chỉ phần được phép copy/sync được chuyển; không chuyển kết quả cá nhân hoặc bản chốt legacy sang identity đích. Mapping đúng; đích chỉ có kết quả sau lượt xét riêng. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: tài khoản có quyền chạy hàng loạt |
| Thao tác | Mở Tổng hợp thành tích（成績集計）. |
| Expected | Mỗi khối có Thực hiện tổng hợp（集計実行） và Thực hiện tính toán tự động（自動算出実行） kèm thời điểm chạy trước, như màn hiện có. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Mỗi khối có Thực hiện tổng hợp（集計実行） và Thực hiện tính toán tự động（自動算出実行） kèm thời điểm chạy trước, như màn hiện có. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: nguồn chưa có kết quả tổng hợp |
| Thao tác | 1. Chạy nút cam khi thiếu nguồn.<br>2. Chạy khi có lỗi một phần (theo cách giả lập được team dev cho phép). |
| Expected | 1. Thông báo hoàn tất nêu có mục chưa xét được, phạm vi và lý do, và kết quả trước không còn dùng.<br>2. Thông báo nêu phạm vi đã cập nhật / chưa cập nhật và hướng dẫn chạy lại; không báo hoàn tất toàn bộ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| missing | Thiếu nguồn | 1. Thông báo hoàn tất nêu có mục chưa xét được, phạm vi và lý do, và kết quả trước không còn dùng.<br>2. Thông báo nêu phạm vi đã cập nhật / chưa cập nhật và hướng dẫn chạy lại; không báo hoàn tất toàn bộ. |
| partial | Lỗi một phần | 1. Thông báo hoàn tất nêu có mục chưa xét được, phạm vi và lý do, và kết quả trước không còn dùng.<br>2. Thông báo nêu phạm vi đã cập nhật / chưa cập nhật và hướng dẫn chạy lại; không báo hoàn tất toàn bộ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước |
| Thao tác | 1. Chạy trích xuất có lọc đỏ và xuất Excel.<br>2. Xem màn học sinh công khai.<br>3. Xuất PDF phiếu. |
| Expected | Chỉ ô (1) và (7) có dấu đỏ và làm học sinh thỏa lọc đỏ. Ô (2)–(6) không có dấu đỏ, không thỏa lọc; (3), (4), (5) không được hiển thị như "đạt". Ba đầu ra cho cùng kết luận. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| extract | Trích xuất cả bảy trạng thái không lọc | Chỉ ô (1) và (7) có dấu đỏ và làm học sinh thỏa lọc đỏ. Ô (2)–(6) không có dấu đỏ, không thỏa lọc; (3), (4), (5) không được hiển thị như "đạt". Ba đầu ra cho cùng kết luận. |
| publish | Công khai cả bảy trạng thái | Chỉ ô (1) và (7) có dấu đỏ và làm học sinh thỏa lọc đỏ. Ô (2)–(6) không có dấu đỏ, không thỏa lọc; (3), (4), (5) không được hiển thị như "đạt". Ba đầu ra cho cùng kết luận. |
| report | Phiếu điểm cả bảy trạng thái | Chỉ ô (1) và (7) có dấu đỏ và làm học sinh thỏa lọc đỏ. Ô (2)–(6) không có dấu đỏ, không thỏa lọc; (3), (4), (5) không được hiển thị như "đạt". Ba đầu ra cho cùng kết luận. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: S01, Toán 24 → sửa thành 35 (không đỏ nếu xét thành công), Ngữ văn 20 giữ nguyên; rule “Cố định 30” với dấu `&lt;`. Biến thể xóa dùng cùng điểm ban đầu nhưng bản reset khác biến thể sửa. |
| Thao tác | 1. Với `*-success-delete`, dùng ba bản reset riêng và xóa ô Toán lần lượt bằng nhập trực tiếp, Đăng ký thành tích bằng CSV（成績CSV登録） và liên kết điểm thi; không giả lập lỗi.<br>2. Với `*-delete-save-failure`, reset trước từng lượt, xóa ô Toán qua đúng đường tương ứng và gây lỗi **lưu điểm**. Với `*-delete-result-write-failure`, dùng ba bản reset khác, xóa ô Toán nhưng gây lỗi **ghi kết quả đỏ** sau đường xử lý điểm. Mỗi biến thể có Run ID, baseline, response và đọc lại riêng; không dùng kết quả của lỗi lưu điểm làm baseline cho lỗi ghi kết quả.<br>3. Với `*-edit-save-failure`, reset trước từng lượt, sửa Toán 24→35 qua từng đường và gây lỗi **lưu điểm**. Với `*-edit-result-write-failure`, dùng các bản reset khác, sửa cùng giá trị nhưng gây lỗi **ghi kết quả đỏ** sau đường xử lý điểm. Không dùng trạng thái từ biến thể xóa làm baseline sửa.<br>4. Sau mỗi biến thể, đọc lại điểm và kết quả đỏ của đúng ô Toán, ô Ngữ văn không đích và ba đầu ra; lưu thông báo, trạng thái giao dịch/response và identity để đối chiếu. Không dùng thông báo thành công hay một dấu UI làm bằng chứng duy nhất cho ghi điểm/kết quả. |
| Expected | 1. Mỗi đường xóa thành công chỉ xóa điểm/kết quả Toán của identity đích; Ngữ văn vẫn Đỏ và S01 vẫn qua bộ lọc nhờ Ngữ văn. CSV phải ánh xạ đúng ô.<br>2. Với `*-delete-save-failure`, không báo đã xóa/xét thành công; đối chiếu điểm và kết quả Toán với baseline 24/Đỏ. Với `*-delete-result-write-failure`, cũng không báo thành công giả và phải phân biệt điểm đã bị xóa hay chưa theo ranh giới giao dịch thực tế; không tự coi ô là trống/Chưa xét được hoặc mặc định rollback. Đọc lại điểm, kết quả và trạng thái giao dịch của **từng** biến thể; nếu ranh giới commit hoặc trạng thái nhất quán chưa quan sát được thì giữ đúng biến thể BLOCKED, ghi giá trị thực tế của hai ô và không sửa oracle theo kết quả chạy.<br>3. Với lỗi **sửa điểm 24→35**, không báo đã sửa và xét thành công giả. Lỗi lưu điểm phải được đối chiếu với điểm/kết quả trước đó; lỗi ghi kết quả phải phân biệt điểm đã lưu hay chưa theo ranh giới giao dịch hiện có. Không trình bày kết quả cũ Đỏ như kết luận mới đã hoàn tất cho điểm 35, cũng không tự đánh dấu Chưa xét được do lỗi kỹ thuật. Nếu ranh giới ghi/đọc hoặc trạng thái nhất quán chưa quan sát được, giữ đúng biến thể BLOCKED và ghi giá trị thực tế của cả hai ô thay vì tự đổi oracle thành PASS.<br>4. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên ở mọi lượt. Thông báo thất bại không chứa lỗi SQL, stack trace hay dữ liệu ngoài quyền. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| direct-success-delete | Nhánh direct-success-delete trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Mỗi đường xóa thành công chỉ xóa điểm/kết quả Toán của identity đích; Ngữ văn vẫn Đỏ và S01 vẫn qua bộ lọc nhờ Ngữ văn. CSV phải ánh xạ đúng ô.<br>2. Với `*-delete-save-failure`, không báo đã xóa/xét thành công; đối chiếu điểm và kết quả Toán với baseline 24/Đỏ. Với `*-delete-result-write-failure`, cũng không báo thành công giả và phải phân biệt điểm đã bị xóa hay chưa theo ranh giới giao dịch thực tế; không tự coi ô là trống/Chưa xét được hoặc mặc định rollback. Đọc lại điểm, kết quả và trạng thái giao dịch của **từng** biến thể; nếu ranh giới commit hoặc trạng thái nhất quán chưa quan sát được thì giữ đúng biến thể BLOCKED, ghi giá trị thực tế của hai ô và không sửa oracle theo kết quả chạy.<br>3. Với lỗi **sửa điểm 24→35**, không báo đã sửa và xét thành công giả. Lỗi lưu điểm phải được đối chiếu với điểm/kết quả trước đó; lỗi ghi kết quả phải phân biệt điểm đã lưu hay chưa theo ranh giới giao dịch hiện có. Không trình bày kết quả cũ Đỏ như kết luận mới đã hoàn tất cho điểm 35, cũng không tự đánh dấu Chưa xét được do lỗi kỹ thuật. Nếu ranh giới ghi/đọc hoặc trạng thái nhất quán chưa quan sát được, giữ đúng biến thể BLOCKED và ghi giá trị thực tế của cả hai ô thay vì tự đổi oracle thành PASS.<br>4. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên ở mọi lượt. Thông báo thất bại không chứa lỗi SQL, stack trace hay dữ liệu ngoài quyền. |
| csv-success-delete | Nhánh csv-success-delete trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Mỗi đường xóa thành công chỉ xóa điểm/kết quả Toán của identity đích; Ngữ văn vẫn Đỏ và S01 vẫn qua bộ lọc nhờ Ngữ văn. CSV phải ánh xạ đúng ô.<br>2. Với `*-delete-save-failure`, không báo đã xóa/xét thành công; đối chiếu điểm và kết quả Toán với baseline 24/Đỏ. Với `*-delete-result-write-failure`, cũng không báo thành công giả và phải phân biệt điểm đã bị xóa hay chưa theo ranh giới giao dịch thực tế; không tự coi ô là trống/Chưa xét được hoặc mặc định rollback. Đọc lại điểm, kết quả và trạng thái giao dịch của **từng** biến thể; nếu ranh giới commit hoặc trạng thái nhất quán chưa quan sát được thì giữ đúng biến thể BLOCKED, ghi giá trị thực tế của hai ô và không sửa oracle theo kết quả chạy.<br>3. Với lỗi **sửa điểm 24→35**, không báo đã sửa và xét thành công giả. Lỗi lưu điểm phải được đối chiếu với điểm/kết quả trước đó; lỗi ghi kết quả phải phân biệt điểm đã lưu hay chưa theo ranh giới giao dịch hiện có. Không trình bày kết quả cũ Đỏ như kết luận mới đã hoàn tất cho điểm 35, cũng không tự đánh dấu Chưa xét được do lỗi kỹ thuật. Nếu ranh giới ghi/đọc hoặc trạng thái nhất quán chưa quan sát được, giữ đúng biến thể BLOCKED và ghi giá trị thực tế của cả hai ô thay vì tự đổi oracle thành PASS.<br>4. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên ở mọi lượt. Thông báo thất bại không chứa lỗi SQL, stack trace hay dữ liệu ngoài quyền. |
| linked-success-delete | Nhánh linked-success-delete trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Mỗi đường xóa thành công chỉ xóa điểm/kết quả Toán của identity đích; Ngữ văn vẫn Đỏ và S01 vẫn qua bộ lọc nhờ Ngữ văn. CSV phải ánh xạ đúng ô.<br>2. Với `*-delete-save-failure`, không báo đã xóa/xét thành công; đối chiếu điểm và kết quả Toán với baseline 24/Đỏ. Với `*-delete-result-write-failure`, cũng không báo thành công giả và phải phân biệt điểm đã bị xóa hay chưa theo ranh giới giao dịch thực tế; không tự coi ô là trống/Chưa xét được hoặc mặc định rollback. Đọc lại điểm, kết quả và trạng thái giao dịch của **từng** biến thể; nếu ranh giới commit hoặc trạng thái nhất quán chưa quan sát được thì giữ đúng biến thể BLOCKED, ghi giá trị thực tế của hai ô và không sửa oracle theo kết quả chạy.<br>3. Với lỗi **sửa điểm 24→35**, không báo đã sửa và xét thành công giả. Lỗi lưu điểm phải được đối chiếu với điểm/kết quả trước đó; lỗi ghi kết quả phải phân biệt điểm đã lưu hay chưa theo ranh giới giao dịch hiện có. Không trình bày kết quả cũ Đỏ như kết luận mới đã hoàn tất cho điểm 35, cũng không tự đánh dấu Chưa xét được do lỗi kỹ thuật. Nếu ranh giới ghi/đọc hoặc trạng thái nhất quán chưa quan sát được, giữ đúng biến thể BLOCKED và ghi giá trị thực tế của cả hai ô thay vì tự đổi oracle thành PASS.<br>4. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên ở mọi lượt. Thông báo thất bại không chứa lỗi SQL, stack trace hay dữ liệu ngoài quyền. |
| direct-delete-save-failure | Nhánh direct-delete-save-failure trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Mỗi đường xóa thành công chỉ xóa điểm/kết quả Toán của identity đích; Ngữ văn vẫn Đỏ và S01 vẫn qua bộ lọc nhờ Ngữ văn. CSV phải ánh xạ đúng ô.<br>2. Với `*-delete-save-failure`, không báo đã xóa/xét thành công; đối chiếu điểm và kết quả Toán với baseline 24/Đỏ. Với `*-delete-result-write-failure`, cũng không báo thành công giả và phải phân biệt điểm đã bị xóa hay chưa theo ranh giới giao dịch thực tế; không tự coi ô là trống/Chưa xét được hoặc mặc định rollback. Đọc lại điểm, kết quả và trạng thái giao dịch của **từng** biến thể; nếu ranh giới commit hoặc trạng thái nhất quán chưa quan sát được thì giữ đúng biến thể BLOCKED, ghi giá trị thực tế của hai ô và không sửa oracle theo kết quả chạy.<br>3. Với lỗi **sửa điểm 24→35**, không báo đã sửa và xét thành công giả. Lỗi lưu điểm phải được đối chiếu với điểm/kết quả trước đó; lỗi ghi kết quả phải phân biệt điểm đã lưu hay chưa theo ranh giới giao dịch hiện có. Không trình bày kết quả cũ Đỏ như kết luận mới đã hoàn tất cho điểm 35, cũng không tự đánh dấu Chưa xét được do lỗi kỹ thuật. Nếu ranh giới ghi/đọc hoặc trạng thái nhất quán chưa quan sát được, giữ đúng biến thể BLOCKED và ghi giá trị thực tế của cả hai ô thay vì tự đổi oracle thành PASS.<br>4. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên ở mọi lượt. Thông báo thất bại không chứa lỗi SQL, stack trace hay dữ liệu ngoài quyền. |
| csv-delete-save-failure | Nhánh csv-delete-save-failure trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Mỗi đường xóa thành công chỉ xóa điểm/kết quả Toán của identity đích; Ngữ văn vẫn Đỏ và S01 vẫn qua bộ lọc nhờ Ngữ văn. CSV phải ánh xạ đúng ô.<br>2. Với `*-delete-save-failure`, không báo đã xóa/xét thành công; đối chiếu điểm và kết quả Toán với baseline 24/Đỏ. Với `*-delete-result-write-failure`, cũng không báo thành công giả và phải phân biệt điểm đã bị xóa hay chưa theo ranh giới giao dịch thực tế; không tự coi ô là trống/Chưa xét được hoặc mặc định rollback. Đọc lại điểm, kết quả và trạng thái giao dịch của **từng** biến thể; nếu ranh giới commit hoặc trạng thái nhất quán chưa quan sát được thì giữ đúng biến thể BLOCKED, ghi giá trị thực tế của hai ô và không sửa oracle theo kết quả chạy.<br>3. Với lỗi **sửa điểm 24→35**, không báo đã sửa và xét thành công giả. Lỗi lưu điểm phải được đối chiếu với điểm/kết quả trước đó; lỗi ghi kết quả phải phân biệt điểm đã lưu hay chưa theo ranh giới giao dịch hiện có. Không trình bày kết quả cũ Đỏ như kết luận mới đã hoàn tất cho điểm 35, cũng không tự đánh dấu Chưa xét được do lỗi kỹ thuật. Nếu ranh giới ghi/đọc hoặc trạng thái nhất quán chưa quan sát được, giữ đúng biến thể BLOCKED và ghi giá trị thực tế của cả hai ô thay vì tự đổi oracle thành PASS.<br>4. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên ở mọi lượt. Thông báo thất bại không chứa lỗi SQL, stack trace hay dữ liệu ngoài quyền. |
| linked-delete-save-failure | Nhánh linked-delete-save-failure trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Mỗi đường xóa thành công chỉ xóa điểm/kết quả Toán của identity đích; Ngữ văn vẫn Đỏ và S01 vẫn qua bộ lọc nhờ Ngữ văn. CSV phải ánh xạ đúng ô.<br>2. Với `*-delete-save-failure`, không báo đã xóa/xét thành công; đối chiếu điểm và kết quả Toán với baseline 24/Đỏ. Với `*-delete-result-write-failure`, cũng không báo thành công giả và phải phân biệt điểm đã bị xóa hay chưa theo ranh giới giao dịch thực tế; không tự coi ô là trống/Chưa xét được hoặc mặc định rollback. Đọc lại điểm, kết quả và trạng thái giao dịch của **từng** biến thể; nếu ranh giới commit hoặc trạng thái nhất quán chưa quan sát được thì giữ đúng biến thể BLOCKED, ghi giá trị thực tế của hai ô và không sửa oracle theo kết quả chạy.<br>3. Với lỗi **sửa điểm 24→35**, không báo đã sửa và xét thành công giả. Lỗi lưu điểm phải được đối chiếu với điểm/kết quả trước đó; lỗi ghi kết quả phải phân biệt điểm đã lưu hay chưa theo ranh giới giao dịch hiện có. Không trình bày kết quả cũ Đỏ như kết luận mới đã hoàn tất cho điểm 35, cũng không tự đánh dấu Chưa xét được do lỗi kỹ thuật. Nếu ranh giới ghi/đọc hoặc trạng thái nhất quán chưa quan sát được, giữ đúng biến thể BLOCKED và ghi giá trị thực tế của cả hai ô thay vì tự đổi oracle thành PASS.<br>4. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên ở mọi lượt. Thông báo thất bại không chứa lỗi SQL, stack trace hay dữ liệu ngoài quyền. |
| direct-delete-result-write-failure | Nhánh direct-delete-result-write-failure trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Mỗi đường xóa thành công chỉ xóa điểm/kết quả Toán của identity đích; Ngữ văn vẫn Đỏ và S01 vẫn qua bộ lọc nhờ Ngữ văn. CSV phải ánh xạ đúng ô.<br>2. Với `*-delete-save-failure`, không báo đã xóa/xét thành công; đối chiếu điểm và kết quả Toán với baseline 24/Đỏ. Với `*-delete-result-write-failure`, cũng không báo thành công giả và phải phân biệt điểm đã bị xóa hay chưa theo ranh giới giao dịch thực tế; không tự coi ô là trống/Chưa xét được hoặc mặc định rollback. Đọc lại điểm, kết quả và trạng thái giao dịch của **từng** biến thể; nếu ranh giới commit hoặc trạng thái nhất quán chưa quan sát được thì giữ đúng biến thể BLOCKED, ghi giá trị thực tế của hai ô và không sửa oracle theo kết quả chạy.<br>3. Với lỗi **sửa điểm 24→35**, không báo đã sửa và xét thành công giả. Lỗi lưu điểm phải được đối chiếu với điểm/kết quả trước đó; lỗi ghi kết quả phải phân biệt điểm đã lưu hay chưa theo ranh giới giao dịch hiện có. Không trình bày kết quả cũ Đỏ như kết luận mới đã hoàn tất cho điểm 35, cũng không tự đánh dấu Chưa xét được do lỗi kỹ thuật. Nếu ranh giới ghi/đọc hoặc trạng thái nhất quán chưa quan sát được, giữ đúng biến thể BLOCKED và ghi giá trị thực tế của cả hai ô thay vì tự đổi oracle thành PASS.<br>4. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên ở mọi lượt. Thông báo thất bại không chứa lỗi SQL, stack trace hay dữ liệu ngoài quyền. |
| csv-delete-result-write-failure | Nhánh csv-delete-result-write-failure trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Mỗi đường xóa thành công chỉ xóa điểm/kết quả Toán của identity đích; Ngữ văn vẫn Đỏ và S01 vẫn qua bộ lọc nhờ Ngữ văn. CSV phải ánh xạ đúng ô.<br>2. Với `*-delete-save-failure`, không báo đã xóa/xét thành công; đối chiếu điểm và kết quả Toán với baseline 24/Đỏ. Với `*-delete-result-write-failure`, cũng không báo thành công giả và phải phân biệt điểm đã bị xóa hay chưa theo ranh giới giao dịch thực tế; không tự coi ô là trống/Chưa xét được hoặc mặc định rollback. Đọc lại điểm, kết quả và trạng thái giao dịch của **từng** biến thể; nếu ranh giới commit hoặc trạng thái nhất quán chưa quan sát được thì giữ đúng biến thể BLOCKED, ghi giá trị thực tế của hai ô và không sửa oracle theo kết quả chạy.<br>3. Với lỗi **sửa điểm 24→35**, không báo đã sửa và xét thành công giả. Lỗi lưu điểm phải được đối chiếu với điểm/kết quả trước đó; lỗi ghi kết quả phải phân biệt điểm đã lưu hay chưa theo ranh giới giao dịch hiện có. Không trình bày kết quả cũ Đỏ như kết luận mới đã hoàn tất cho điểm 35, cũng không tự đánh dấu Chưa xét được do lỗi kỹ thuật. Nếu ranh giới ghi/đọc hoặc trạng thái nhất quán chưa quan sát được, giữ đúng biến thể BLOCKED và ghi giá trị thực tế của cả hai ô thay vì tự đổi oracle thành PASS.<br>4. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên ở mọi lượt. Thông báo thất bại không chứa lỗi SQL, stack trace hay dữ liệu ngoài quyền. |
| linked-delete-result-write-failure | Nhánh linked-delete-result-write-failure trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Mỗi đường xóa thành công chỉ xóa điểm/kết quả Toán của identity đích; Ngữ văn vẫn Đỏ và S01 vẫn qua bộ lọc nhờ Ngữ văn. CSV phải ánh xạ đúng ô.<br>2. Với `*-delete-save-failure`, không báo đã xóa/xét thành công; đối chiếu điểm và kết quả Toán với baseline 24/Đỏ. Với `*-delete-result-write-failure`, cũng không báo thành công giả và phải phân biệt điểm đã bị xóa hay chưa theo ranh giới giao dịch thực tế; không tự coi ô là trống/Chưa xét được hoặc mặc định rollback. Đọc lại điểm, kết quả và trạng thái giao dịch của **từng** biến thể; nếu ranh giới commit hoặc trạng thái nhất quán chưa quan sát được thì giữ đúng biến thể BLOCKED, ghi giá trị thực tế của hai ô và không sửa oracle theo kết quả chạy.<br>3. Với lỗi **sửa điểm 24→35**, không báo đã sửa và xét thành công giả. Lỗi lưu điểm phải được đối chiếu với điểm/kết quả trước đó; lỗi ghi kết quả phải phân biệt điểm đã lưu hay chưa theo ranh giới giao dịch hiện có. Không trình bày kết quả cũ Đỏ như kết luận mới đã hoàn tất cho điểm 35, cũng không tự đánh dấu Chưa xét được do lỗi kỹ thuật. Nếu ranh giới ghi/đọc hoặc trạng thái nhất quán chưa quan sát được, giữ đúng biến thể BLOCKED và ghi giá trị thực tế của cả hai ô thay vì tự đổi oracle thành PASS.<br>4. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên ở mọi lượt. Thông báo thất bại không chứa lỗi SQL, stack trace hay dữ liệu ngoài quyền. |
| direct-edit-save-failure | Nhánh direct-edit-save-failure trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Mỗi đường xóa thành công chỉ xóa điểm/kết quả Toán của identity đích; Ngữ văn vẫn Đỏ và S01 vẫn qua bộ lọc nhờ Ngữ văn. CSV phải ánh xạ đúng ô.<br>2. Với `*-delete-save-failure`, không báo đã xóa/xét thành công; đối chiếu điểm và kết quả Toán với baseline 24/Đỏ. Với `*-delete-result-write-failure`, cũng không báo thành công giả và phải phân biệt điểm đã bị xóa hay chưa theo ranh giới giao dịch thực tế; không tự coi ô là trống/Chưa xét được hoặc mặc định rollback. Đọc lại điểm, kết quả và trạng thái giao dịch của **từng** biến thể; nếu ranh giới commit hoặc trạng thái nhất quán chưa quan sát được thì giữ đúng biến thể BLOCKED, ghi giá trị thực tế của hai ô và không sửa oracle theo kết quả chạy.<br>3. Với lỗi **sửa điểm 24→35**, không báo đã sửa và xét thành công giả. Lỗi lưu điểm phải được đối chiếu với điểm/kết quả trước đó; lỗi ghi kết quả phải phân biệt điểm đã lưu hay chưa theo ranh giới giao dịch hiện có. Không trình bày kết quả cũ Đỏ như kết luận mới đã hoàn tất cho điểm 35, cũng không tự đánh dấu Chưa xét được do lỗi kỹ thuật. Nếu ranh giới ghi/đọc hoặc trạng thái nhất quán chưa quan sát được, giữ đúng biến thể BLOCKED và ghi giá trị thực tế của cả hai ô thay vì tự đổi oracle thành PASS.<br>4. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên ở mọi lượt. Thông báo thất bại không chứa lỗi SQL, stack trace hay dữ liệu ngoài quyền. |
| csv-edit-save-failure | Nhánh csv-edit-save-failure trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Mỗi đường xóa thành công chỉ xóa điểm/kết quả Toán của identity đích; Ngữ văn vẫn Đỏ và S01 vẫn qua bộ lọc nhờ Ngữ văn. CSV phải ánh xạ đúng ô.<br>2. Với `*-delete-save-failure`, không báo đã xóa/xét thành công; đối chiếu điểm và kết quả Toán với baseline 24/Đỏ. Với `*-delete-result-write-failure`, cũng không báo thành công giả và phải phân biệt điểm đã bị xóa hay chưa theo ranh giới giao dịch thực tế; không tự coi ô là trống/Chưa xét được hoặc mặc định rollback. Đọc lại điểm, kết quả và trạng thái giao dịch của **từng** biến thể; nếu ranh giới commit hoặc trạng thái nhất quán chưa quan sát được thì giữ đúng biến thể BLOCKED, ghi giá trị thực tế của hai ô và không sửa oracle theo kết quả chạy.<br>3. Với lỗi **sửa điểm 24→35**, không báo đã sửa và xét thành công giả. Lỗi lưu điểm phải được đối chiếu với điểm/kết quả trước đó; lỗi ghi kết quả phải phân biệt điểm đã lưu hay chưa theo ranh giới giao dịch hiện có. Không trình bày kết quả cũ Đỏ như kết luận mới đã hoàn tất cho điểm 35, cũng không tự đánh dấu Chưa xét được do lỗi kỹ thuật. Nếu ranh giới ghi/đọc hoặc trạng thái nhất quán chưa quan sát được, giữ đúng biến thể BLOCKED và ghi giá trị thực tế của cả hai ô thay vì tự đổi oracle thành PASS.<br>4. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên ở mọi lượt. Thông báo thất bại không chứa lỗi SQL, stack trace hay dữ liệu ngoài quyền. |
| linked-edit-save-failure | Nhánh linked-edit-save-failure trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Mỗi đường xóa thành công chỉ xóa điểm/kết quả Toán của identity đích; Ngữ văn vẫn Đỏ và S01 vẫn qua bộ lọc nhờ Ngữ văn. CSV phải ánh xạ đúng ô.<br>2. Với `*-delete-save-failure`, không báo đã xóa/xét thành công; đối chiếu điểm và kết quả Toán với baseline 24/Đỏ. Với `*-delete-result-write-failure`, cũng không báo thành công giả và phải phân biệt điểm đã bị xóa hay chưa theo ranh giới giao dịch thực tế; không tự coi ô là trống/Chưa xét được hoặc mặc định rollback. Đọc lại điểm, kết quả và trạng thái giao dịch của **từng** biến thể; nếu ranh giới commit hoặc trạng thái nhất quán chưa quan sát được thì giữ đúng biến thể BLOCKED, ghi giá trị thực tế của hai ô và không sửa oracle theo kết quả chạy.<br>3. Với lỗi **sửa điểm 24→35**, không báo đã sửa và xét thành công giả. Lỗi lưu điểm phải được đối chiếu với điểm/kết quả trước đó; lỗi ghi kết quả phải phân biệt điểm đã lưu hay chưa theo ranh giới giao dịch hiện có. Không trình bày kết quả cũ Đỏ như kết luận mới đã hoàn tất cho điểm 35, cũng không tự đánh dấu Chưa xét được do lỗi kỹ thuật. Nếu ranh giới ghi/đọc hoặc trạng thái nhất quán chưa quan sát được, giữ đúng biến thể BLOCKED và ghi giá trị thực tế của cả hai ô thay vì tự đổi oracle thành PASS.<br>4. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên ở mọi lượt. Thông báo thất bại không chứa lỗi SQL, stack trace hay dữ liệu ngoài quyền. |
| direct-edit-result-write-failure | Nhánh direct-edit-result-write-failure trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Mỗi đường xóa thành công chỉ xóa điểm/kết quả Toán của identity đích; Ngữ văn vẫn Đỏ và S01 vẫn qua bộ lọc nhờ Ngữ văn. CSV phải ánh xạ đúng ô.<br>2. Với `*-delete-save-failure`, không báo đã xóa/xét thành công; đối chiếu điểm và kết quả Toán với baseline 24/Đỏ. Với `*-delete-result-write-failure`, cũng không báo thành công giả và phải phân biệt điểm đã bị xóa hay chưa theo ranh giới giao dịch thực tế; không tự coi ô là trống/Chưa xét được hoặc mặc định rollback. Đọc lại điểm, kết quả và trạng thái giao dịch của **từng** biến thể; nếu ranh giới commit hoặc trạng thái nhất quán chưa quan sát được thì giữ đúng biến thể BLOCKED, ghi giá trị thực tế của hai ô và không sửa oracle theo kết quả chạy.<br>3. Với lỗi **sửa điểm 24→35**, không báo đã sửa và xét thành công giả. Lỗi lưu điểm phải được đối chiếu với điểm/kết quả trước đó; lỗi ghi kết quả phải phân biệt điểm đã lưu hay chưa theo ranh giới giao dịch hiện có. Không trình bày kết quả cũ Đỏ như kết luận mới đã hoàn tất cho điểm 35, cũng không tự đánh dấu Chưa xét được do lỗi kỹ thuật. Nếu ranh giới ghi/đọc hoặc trạng thái nhất quán chưa quan sát được, giữ đúng biến thể BLOCKED và ghi giá trị thực tế của cả hai ô thay vì tự đổi oracle thành PASS.<br>4. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên ở mọi lượt. Thông báo thất bại không chứa lỗi SQL, stack trace hay dữ liệu ngoài quyền. |
| csv-edit-result-write-failure | Nhánh csv-edit-result-write-failure trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Mỗi đường xóa thành công chỉ xóa điểm/kết quả Toán của identity đích; Ngữ văn vẫn Đỏ và S01 vẫn qua bộ lọc nhờ Ngữ văn. CSV phải ánh xạ đúng ô.<br>2. Với `*-delete-save-failure`, không báo đã xóa/xét thành công; đối chiếu điểm và kết quả Toán với baseline 24/Đỏ. Với `*-delete-result-write-failure`, cũng không báo thành công giả và phải phân biệt điểm đã bị xóa hay chưa theo ranh giới giao dịch thực tế; không tự coi ô là trống/Chưa xét được hoặc mặc định rollback. Đọc lại điểm, kết quả và trạng thái giao dịch của **từng** biến thể; nếu ranh giới commit hoặc trạng thái nhất quán chưa quan sát được thì giữ đúng biến thể BLOCKED, ghi giá trị thực tế của hai ô và không sửa oracle theo kết quả chạy.<br>3. Với lỗi **sửa điểm 24→35**, không báo đã sửa và xét thành công giả. Lỗi lưu điểm phải được đối chiếu với điểm/kết quả trước đó; lỗi ghi kết quả phải phân biệt điểm đã lưu hay chưa theo ranh giới giao dịch hiện có. Không trình bày kết quả cũ Đỏ như kết luận mới đã hoàn tất cho điểm 35, cũng không tự đánh dấu Chưa xét được do lỗi kỹ thuật. Nếu ranh giới ghi/đọc hoặc trạng thái nhất quán chưa quan sát được, giữ đúng biến thể BLOCKED và ghi giá trị thực tế của cả hai ô thay vì tự đổi oracle thành PASS.<br>4. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên ở mọi lượt. Thông báo thất bại không chứa lỗi SQL, stack trace hay dữ liệu ngoài quyền. |
| linked-edit-result-write-failure | Nhánh linked-edit-result-write-failure trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1. Mỗi đường xóa thành công chỉ xóa điểm/kết quả Toán của identity đích; Ngữ văn vẫn Đỏ và S01 vẫn qua bộ lọc nhờ Ngữ văn. CSV phải ánh xạ đúng ô.<br>2. Với `*-delete-save-failure`, không báo đã xóa/xét thành công; đối chiếu điểm và kết quả Toán với baseline 24/Đỏ. Với `*-delete-result-write-failure`, cũng không báo thành công giả và phải phân biệt điểm đã bị xóa hay chưa theo ranh giới giao dịch thực tế; không tự coi ô là trống/Chưa xét được hoặc mặc định rollback. Đọc lại điểm, kết quả và trạng thái giao dịch của **từng** biến thể; nếu ranh giới commit hoặc trạng thái nhất quán chưa quan sát được thì giữ đúng biến thể BLOCKED, ghi giá trị thực tế của hai ô và không sửa oracle theo kết quả chạy.<br>3. Với lỗi **sửa điểm 24→35**, không báo đã sửa và xét thành công giả. Lỗi lưu điểm phải được đối chiếu với điểm/kết quả trước đó; lỗi ghi kết quả phải phân biệt điểm đã lưu hay chưa theo ranh giới giao dịch hiện có. Không trình bày kết quả cũ Đỏ như kết luận mới đã hoàn tất cho điểm 35, cũng không tự đánh dấu Chưa xét được do lỗi kỹ thuật. Nếu ranh giới ghi/đọc hoặc trạng thái nhất quán chưa quan sát được, giữ đúng biến thể BLOCKED và ghi giá trị thực tế của cả hai ô thay vì tự đổi oracle thành PASS.<br>4. Ngữ văn 20 và kết quả Đỏ của ô không đích giữ nguyên ở mọi lượt. Thông báo thất bại không chứa lỗi SQL, stack trace hay dữ liệu ngoài quyền. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: BATCH-S01 thuộc BATCH-GA1, BATCH-S02 thuộc BATCH-GA2, BATCH-S03 thuộc BATCH-GC ngoài batch; mỗi học sinh có identity ô điểm fixture riêng. Không dùng S01/G-A hoặc lớp master làm bằng chứng nếu chưa chứng minh mapping. |
| Thao tác | 1. Chạy nút cam cho khối.<br>2. Xem thông báo và kết quả từng lớp.<br>3. Gỡ giả lập lỗi, chạy lại nút cam chỉ cho phạm vi BATCH-GA2.<br>4. Xem kết quả hai lớp.<br>5. Chạy nút cam cho BATCH-GA1; khi chưa xong, giáo viên sửa và lưu điểm BATCH-S01. Chờ batch xong, xem thông báo/tiến độ và kết quả BATCH-S01. |
| Expected | 1–2. G-A1 cập nhật; G-A2 giữ trạng thái trước lượt. Thông báo cho biết phạm vi đã cập nhật, chưa cập nhật và cần chạy lại; không báo hoàn tất toàn bộ; không suy số lớp đã xử lý thành số ô đã xét. Không hứa rollback toàn lượt. Không tự retry vô hạn. G-C ngoài batch không bị tính vào kết quả.<br><br>3–4. BATCH-GA2 được cập nhật; BATCH-GA1 giữ kết quả của bước 1, mỗi ô chỉ có một kết quả hiệu lực, không trùng.<br><br>5. Phần của BATCH-S01 trong lượt batch (đã bị lần lưu mới thay thế) không được tính là cập nhật thành công, cũng không được tính là Chưa xét được; BATCH-S01 giữ kết quả của lần lưu mới. (PROPOSED theo thiết kế DB v2 mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi”) Tiến độ ghi phần này là `superseded`; deadlock/timeout rollback toàn transaction đó và chỉ retry hữu hạn theo job hiện có. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| partial-G-A2-failure | Nhánh partial-G-A2-failure trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1–2. G-A1 cập nhật; G-A2 giữ trạng thái trước lượt. Thông báo cho biết phạm vi đã cập nhật, chưa cập nhật và cần chạy lại; không báo hoàn tất toàn bộ; không suy số lớp đã xử lý thành số ô đã xét. Không hứa rollback toàn lượt. Không tự retry vô hạn. G-C ngoài batch không bị tính vào kết quả.<br><br>3–4. BATCH-GA2 được cập nhật; BATCH-GA1 giữ kết quả của bước 1, mỗi ô chỉ có một kết quả hiệu lực, không trùng.<br><br>5. Phần của BATCH-S01 trong lượt batch (đã bị lần lưu mới thay thế) không được tính là cập nhật thành công, cũng không được tính là Chưa xét được; BATCH-S01 giữ kết quả của lần lưu mới. (PROPOSED theo thiết kế DB v2 mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi”) Tiến độ ghi phần này là `superseded`; deadlock/timeout rollback toàn transaction đó và chỉ retry hữu hạn theo job hiện có. |
| retry-G-A2-only | Nhánh retry-G-A2-only trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1–2. G-A1 cập nhật; G-A2 giữ trạng thái trước lượt. Thông báo cho biết phạm vi đã cập nhật, chưa cập nhật và cần chạy lại; không báo hoàn tất toàn bộ; không suy số lớp đã xử lý thành số ô đã xét. Không hứa rollback toàn lượt. Không tự retry vô hạn. G-C ngoài batch không bị tính vào kết quả.<br><br>3–4. BATCH-GA2 được cập nhật; BATCH-GA1 giữ kết quả của bước 1, mỗi ô chỉ có một kết quả hiệu lực, không trùng.<br><br>5. Phần của BATCH-S01 trong lượt batch (đã bị lần lưu mới thay thế) không được tính là cập nhật thành công, cũng không được tính là Chưa xét được; BATCH-S01 giữ kết quả của lần lưu mới. (PROPOSED theo thiết kế DB v2 mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi”) Tiến độ ghi phần này là `superseded`; deadlock/timeout rollback toàn transaction đó và chỉ retry hữu hạn theo job hiện có. |
| concurrent-score-write | Nhánh concurrent-score-write trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1–2. G-A1 cập nhật; G-A2 giữ trạng thái trước lượt. Thông báo cho biết phạm vi đã cập nhật, chưa cập nhật và cần chạy lại; không báo hoàn tất toàn bộ; không suy số lớp đã xử lý thành số ô đã xét. Không hứa rollback toàn lượt. Không tự retry vô hạn. G-C ngoài batch không bị tính vào kết quả.<br><br>3–4. BATCH-GA2 được cập nhật; BATCH-GA1 giữ kết quả của bước 1, mỗi ô chỉ có một kết quả hiệu lực, không trùng.<br><br>5. Phần của BATCH-S01 trong lượt batch (đã bị lần lưu mới thay thế) không được tính là cập nhật thành công, cũng không được tính là Chưa xét được; BATCH-S01 giữ kết quả của lần lưu mới. (PROPOSED theo thiết kế DB v2 mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi”) Tiến độ ghi phần này là `superseded`; deadlock/timeout rollback toàn transaction đó và chỉ retry hữu hạn theo job hiện có. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30) |
| Thao tác | 1. Bấm Thực hiện tính toán tự động（自動算出実行）, đọc thông báo ngay khi request trả về.<br>2. Bấm lại lần nữa khi lượt đầu chưa xong.<br>3. Sau khi xong, xem kết quả. |
| Expected | 1. Nếu xử lý chạy nền: thông báo là đã nhận/xếp hàng, không phải đã hoàn tất; kết quả chưa đổi cho tới khi xử lý xong.<br>2. Chống trùng theo cơ chế hiện có (không tạo hai lượt ghi chồng gây kết quả sai).<br>3. Một kết quả hiện hành cho mỗi ô, đúng theo ngưỡng mới. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | 1. Nếu xử lý chạy nền: thông báo là đã nhận/xếp hàng, không phải đã hoàn tất; kết quả chưa đổi cho tới khi xử lý xong.<br>2. Chống trùng theo cơ chế hiện có (không tạo hai lượt ghi chồng gây kết quả sai).<br>3. Một kết quả hiện hành cho mỗi ô, đúng theo ngưỡng mới. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | Thu thập mọi thông báo lỗi hiển thị cho người dùng trong các case trên. |
| Expected | Không có câu SQL, stack trace, đường dẫn file server hoặc tên/điểm học sinh ngoài quyền người thao tác. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| save-error | Lỗi lưu theo ERR-002 | Không có câu SQL, stack trace, đường dẫn file server hoặc tên/điểm học sinh ngoài quyền người thao tác. |
| batch-error | Lỗi batch theo ERR-003 | Không có câu SQL, stack trace, đường dẫn file server hoặc tên/điểm học sinh ngoài quyền người thao tác. |
| permission-error | Lỗi quyền theo ERR-006 | Không có câu SQL, stack trace, đường dẫn file server hoặc tên/điểm học sinh ngoài quyền người thao tác. |
| input-error | Lỗi dữ liệu theo ERR-009 | Không có câu SQL, stack trace, đường dẫn file server hoặc tên/điểm học sinh ngoài quyền người thao tác. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: học sinh S01 (điểm 29); quy tắc “Cố định 30” (dưới 30); cặp quy tắc phân nhánh theo trung bình 60 |
| Thao tác | 1. Khi batch chưa xong, sửa S01 từ 29 thành 40 và lưu.<br>2. Chờ batch xong, xem S01.<br>3. Chạy lại batch; khi chưa xong, đổi ngưỡng quy tắc “Cố định 30” (dưới 30) thành 45, lưu, rồi đăng ký lại điểm S01 (40). Chờ batch cũ xong, xem S01.<br>4. Với mục dùng cặp quy tắc phân nhánh theo trung bình 60: bắt đầu batch; khi chưa xong, bấm Thực hiện tổng hợp（集計実行） cho cùng phạm vi, chờ cả hai xong. SELECT kết quả và bản nguồn được ghi nhận cho các ô của lượt batch.<br>5. Khôi phục ngưỡng 30, S01 = 29 (Đỏ). Bắt đầu batch; khi batch đã đọc điểm 29 nhưng chưa xong, sửa S01 thành 40 và lưu, rồi sửa lại 29 và lưu. Chờ batch cũ xong, SELECT kết quả S01.<br>6. Lặp bước 5 nhưng thay bằng: xóa trống ô S01 và lưu, rồi nhập lại 29 và lưu.<br>7. S01 = 40 (Không đỏ). Bắt đầu batch; khi chưa xong, chỉ đổi ngưỡng quy tắc “Cố định 30” (dưới 30) thành 45 và lưu, không đăng ký lại điểm. Chờ batch cũ xong, xem S01; sau đó chạy lại batch và xem S01. |
| Expected | 1–2. S01 = 40 và Không đỏ; batch cũ không ghi lại kết quả Đỏ của điểm 29.<br><br>3. S01 Đỏ theo cấu hình mới (`40&lt;45`); batch cũ không ghi đè bằng kết quả theo ngưỡng 30.<br>4. Mọi ô của một lượt batch dùng cùng một bản nguồn (hoặc toàn bản cũ, hoặc toàn bản mới); không có lượt báo thành công mà ghép điểm/kết quả của hai thời điểm.<br>5–6. Kết quả hiện hành của S01 là kết quả của lần lưu cuối (29 → Đỏ, xét bởi lần đăng ký sau cùng); lượt batch cũ không ghi đè dù giá trị điểm cuối trùng với giá trị batch đã đọc. Ô chỉ có một dòng kết quả hiện hành.<br>7. Sau khi chỉ lưu ngưỡng: kết quả trước được giữ tới lần xét lại (tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại”). Chạy lại batch → S01 Đỏ theo ngưỡng 45. (PROPOSED theo thiết kế DB v2 mục 6.2 “Đăng ký thường và batch”) Lượt batch cũ bị từ chối ghi vì phiên bản danh sách quy tắc (`red_score_revision`) đã đổi, nên không ghi kết quả theo ngưỡng 30 sau khi ngưỡng mới đã được lưu.<br>8. (PROPOSED) SELECT `write_version`, `judged_version`, `rule_revision` của S01: `judged_version` bằng phiên bản của lần ghi hoàn tất sau cùng; lượt cũ không làm giảm hay ghi đè các giá trị này. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| score-update | Nhánh score-update trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1–2. S01 = 40 và Không đỏ; batch cũ không ghi lại kết quả Đỏ của điểm 29.<br><br>3. S01 Đỏ theo cấu hình mới (`40&lt;45`); batch cũ không ghi đè bằng kết quả theo ngưỡng 30.<br>4. Mọi ô của một lượt batch dùng cùng một bản nguồn (hoặc toàn bản cũ, hoặc toàn bản mới); không có lượt báo thành công mà ghép điểm/kết quả của hai thời điểm.<br>5–6. Kết quả hiện hành của S01 là kết quả của lần lưu cuối (29 → Đỏ, xét bởi lần đăng ký sau cùng); lượt batch cũ không ghi đè dù giá trị điểm cuối trùng với giá trị batch đã đọc. Ô chỉ có một dòng kết quả hiện hành.<br>7. Sau khi chỉ lưu ngưỡng: kết quả trước được giữ tới lần xét lại (tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại”). Chạy lại batch → S01 Đỏ theo ngưỡng 45. (PROPOSED theo thiết kế DB v2 mục 6.2 “Đăng ký thường và batch”) Lượt batch cũ bị từ chối ghi vì phiên bản danh sách quy tắc (`red_score_revision`) đã đổi, nên không ghi kết quả theo ngưỡng 30 sau khi ngưỡng mới đã được lưu.<br>8. (PROPOSED) SELECT `write_version`, `judged_version`, `rule_revision` của S01: `judged_version` bằng phiên bản của lần ghi hoàn tất sau cùng; lượt cũ không làm giảm hay ghi đè các giá trị này. |
| rule-update | Nhánh rule-update trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1–2. S01 = 40 và Không đỏ; batch cũ không ghi lại kết quả Đỏ của điểm 29.<br><br>3. S01 Đỏ theo cấu hình mới (`40&lt;45`); batch cũ không ghi đè bằng kết quả theo ngưỡng 30.<br>4. Mọi ô của một lượt batch dùng cùng một bản nguồn (hoặc toàn bản cũ, hoặc toàn bản mới); không có lượt báo thành công mà ghép điểm/kết quả của hai thời điểm.<br>5–6. Kết quả hiện hành của S01 là kết quả của lần lưu cuối (29 → Đỏ, xét bởi lần đăng ký sau cùng); lượt batch cũ không ghi đè dù giá trị điểm cuối trùng với giá trị batch đã đọc. Ô chỉ có một dòng kết quả hiện hành.<br>7. Sau khi chỉ lưu ngưỡng: kết quả trước được giữ tới lần xét lại (tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại”). Chạy lại batch → S01 Đỏ theo ngưỡng 45. (PROPOSED theo thiết kế DB v2 mục 6.2 “Đăng ký thường và batch”) Lượt batch cũ bị từ chối ghi vì phiên bản danh sách quy tắc (`red_score_revision`) đã đổi, nên không ghi kết quả theo ngưỡng 30 sau khi ngưỡng mới đã được lưu.<br>8. (PROPOSED) SELECT `write_version`, `judged_version`, `rule_revision` của S01: `judged_version` bằng phiên bản của lần ghi hoàn tất sau cùng; lượt cũ không làm giảm hay ghi đè các giá trị này. |
| aggregation-snapshot-update | Nhánh aggregation-snapshot-update trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1–2. S01 = 40 và Không đỏ; batch cũ không ghi lại kết quả Đỏ của điểm 29.<br><br>3. S01 Đỏ theo cấu hình mới (`40&lt;45`); batch cũ không ghi đè bằng kết quả theo ngưỡng 30.<br>4. Mọi ô của một lượt batch dùng cùng một bản nguồn (hoặc toàn bản cũ, hoặc toàn bản mới); không có lượt báo thành công mà ghép điểm/kết quả của hai thời điểm.<br>5–6. Kết quả hiện hành của S01 là kết quả của lần lưu cuối (29 → Đỏ, xét bởi lần đăng ký sau cùng); lượt batch cũ không ghi đè dù giá trị điểm cuối trùng với giá trị batch đã đọc. Ô chỉ có một dòng kết quả hiện hành.<br>7. Sau khi chỉ lưu ngưỡng: kết quả trước được giữ tới lần xét lại (tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại”). Chạy lại batch → S01 Đỏ theo ngưỡng 45. (PROPOSED theo thiết kế DB v2 mục 6.2 “Đăng ký thường và batch”) Lượt batch cũ bị từ chối ghi vì phiên bản danh sách quy tắc (`red_score_revision`) đã đổi, nên không ghi kết quả theo ngưỡng 30 sau khi ngưỡng mới đã được lưu.<br>8. (PROPOSED) SELECT `write_version`, `judged_version`, `rule_revision` của S01: `judged_version` bằng phiên bản của lần ghi hoàn tất sau cùng; lượt cũ không làm giảm hay ghi đè các giá trị này. |
| edit-away-and-back | Nhánh edit-away-and-back trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1–2. S01 = 40 và Không đỏ; batch cũ không ghi lại kết quả Đỏ của điểm 29.<br><br>3. S01 Đỏ theo cấu hình mới (`40&lt;45`); batch cũ không ghi đè bằng kết quả theo ngưỡng 30.<br>4. Mọi ô của một lượt batch dùng cùng một bản nguồn (hoặc toàn bản cũ, hoặc toàn bản mới); không có lượt báo thành công mà ghép điểm/kết quả của hai thời điểm.<br>5–6. Kết quả hiện hành của S01 là kết quả của lần lưu cuối (29 → Đỏ, xét bởi lần đăng ký sau cùng); lượt batch cũ không ghi đè dù giá trị điểm cuối trùng với giá trị batch đã đọc. Ô chỉ có một dòng kết quả hiện hành.<br>7. Sau khi chỉ lưu ngưỡng: kết quả trước được giữ tới lần xét lại (tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại”). Chạy lại batch → S01 Đỏ theo ngưỡng 45. (PROPOSED theo thiết kế DB v2 mục 6.2 “Đăng ký thường và batch”) Lượt batch cũ bị từ chối ghi vì phiên bản danh sách quy tắc (`red_score_revision`) đã đổi, nên không ghi kết quả theo ngưỡng 30 sau khi ngưỡng mới đã được lưu.<br>8. (PROPOSED) SELECT `write_version`, `judged_version`, `rule_revision` của S01: `judged_version` bằng phiên bản của lần ghi hoàn tất sau cùng; lượt cũ không làm giảm hay ghi đè các giá trị này. |
| delete-and-recreate | Nhánh delete-and-recreate trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1–2. S01 = 40 và Không đỏ; batch cũ không ghi lại kết quả Đỏ của điểm 29.<br><br>3. S01 Đỏ theo cấu hình mới (`40&lt;45`); batch cũ không ghi đè bằng kết quả theo ngưỡng 30.<br>4. Mọi ô của một lượt batch dùng cùng một bản nguồn (hoặc toàn bản cũ, hoặc toàn bản mới); không có lượt báo thành công mà ghép điểm/kết quả của hai thời điểm.<br>5–6. Kết quả hiện hành của S01 là kết quả của lần lưu cuối (29 → Đỏ, xét bởi lần đăng ký sau cùng); lượt batch cũ không ghi đè dù giá trị điểm cuối trùng với giá trị batch đã đọc. Ô chỉ có một dòng kết quả hiện hành.<br>7. Sau khi chỉ lưu ngưỡng: kết quả trước được giữ tới lần xét lại (tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại”). Chạy lại batch → S01 Đỏ theo ngưỡng 45. (PROPOSED theo thiết kế DB v2 mục 6.2 “Đăng ký thường và batch”) Lượt batch cũ bị từ chối ghi vì phiên bản danh sách quy tắc (`red_score_revision`) đã đổi, nên không ghi kết quả theo ngưỡng 30 sau khi ngưỡng mới đã được lưu.<br>8. (PROPOSED) SELECT `write_version`, `judged_version`, `rule_revision` của S01: `judged_version` bằng phiên bản của lần ghi hoàn tất sau cùng; lượt cũ không làm giảm hay ghi đè các giá trị này. |
| rule-update-without-score-write | Nhánh rule-update-without-score-write trong thủ tục và Expected của case; thực hiện các bước chuẩn bị chung trước nhánh | 1–2. S01 = 40 và Không đỏ; batch cũ không ghi lại kết quả Đỏ của điểm 29.<br><br>3. S01 Đỏ theo cấu hình mới (`40&lt;45`); batch cũ không ghi đè bằng kết quả theo ngưỡng 30.<br>4. Mọi ô của một lượt batch dùng cùng một bản nguồn (hoặc toàn bản cũ, hoặc toàn bản mới); không có lượt báo thành công mà ghép điểm/kết quả của hai thời điểm.<br>5–6. Kết quả hiện hành của S01 là kết quả của lần lưu cuối (29 → Đỏ, xét bởi lần đăng ký sau cùng); lượt batch cũ không ghi đè dù giá trị điểm cuối trùng với giá trị batch đã đọc. Ô chỉ có một dòng kết quả hiện hành.<br>7. Sau khi chỉ lưu ngưỡng: kết quả trước được giữ tới lần xét lại (tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại”). Chạy lại batch → S01 Đỏ theo ngưỡng 45. (PROPOSED theo thiết kế DB v2 mục 6.2 “Đăng ký thường và batch”) Lượt batch cũ bị từ chối ghi vì phiên bản danh sách quy tắc (`red_score_revision`) đã đổi, nên không ghi kết quả theo ngưỡng 30 sau khi ngưỡng mới đã được lưu.<br>8. (PROPOSED) SELECT `write_version`, `judged_version`, `rule_revision` của S01: `judged_version` bằng phiên bản của lần ghi hoàn tất sau cùng; lượt cũ không làm giảm hay ghi đè các giá trị này. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29) (29); tài khoản có quyền chạy hàng loạt, tài khoản giáo viên nhập điểm lớp G-A, G-B, G-C |
| Thao tác | 1. Cùng lúc: giáo viên lưu điểm S01 = 29 trên Đăng ký thành tích（成績登録） và người có quyền bấm nút cam cho G-A.<br>2. Xem kết quả S01 ở ba đầu ra; SELECT dòng kết quả của ô.<br>3. Lặp lại thao tác hoàn tất lần nữa với cùng dữ liệu (gửi lại form đăng ký, hoặc chạy lại job của cùng lượt nếu môi trường cho phép); xem lại và SELECT. |
| Expected | 1–2. S01 Đỏ; ô có đúng một kết quả hiện hành; ký hiệu đỏ không bị nhân đôi ở đầu ra (không có `**29`, `((29))`).<br>3. Không phát sinh dòng hoặc thao tác ghi thứ hai; kết quả không đổi. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| concurrent | Bước 1–2 hai lượt lần đầu | 1–2. S01 Đỏ; ô có đúng một kết quả hiện hành; ký hiệu đỏ không bị nhân đôi ở đầu ra (không có `**29`, `((29))`).<br>3. Không phát sinh dòng hoặc thao tác ghi thứ hai; kết quả không đổi. |
| replay-form | Bước 3 gửi lại form sau baseline bước 1–2 | 1–2. S01 Đỏ; ô có đúng một kết quả hiện hành; ký hiệu đỏ không bị nhân đôi ở đầu ra (không có `**29`, `((29))`).<br>3. Không phát sinh dòng hoặc thao tác ghi thứ hai; kết quả không đổi. |
| replay-job | Bước 3 chạy lại job cùng lượt nếu có seam, không có seam thì BLOCKED | 1–2. S01 Đỏ; ô có đúng một kết quả hiện hành; ký hiệu đỏ không bị nhân đôi ở đầu ra (không có `**29`, `((29))`).<br>3. Không phát sinh dòng hoặc thao tác ghi thứ hai; kết quả không đổi. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29); tài khoản giáo viên nhập điểm lớp G-A, G-B, G-C (hai phiên đăng nhập) |
| Thao tác | 1. Hai phiên cùng lúc: phiên 1 lưu S01 = 29 cho mục số nguyên (M=100); phiên 2 lưu S01 = 45 cho mục thứ hai.<br>2. Mở lại Đăng ký thành tích（成績登録）; xem trích xuất; SELECT dòng điểm của S01 (trường/năm/học sinh/lớp/kỳ/đơn vị) và dòng kết quả của hai ô. |
| Expected | - Cả hai điểm được giữ: mục số nguyên (M=100) = 29 (Đỏ), mục thứ hai = 45 (Không đỏ).<br>- Chỉ một dòng điểm vật lý cho S01/G-A/kỳ/điểm thường; không có dòng trùng; không mất điểm hoặc kết quả của mục nào. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | - Cả hai điểm được giữ: mục số nguyên (M=100) = 29 (Đỏ), mục thứ hai = 45 (Không đỏ).<br>- Chỉ một dòng điểm vật lý cho S01/G-A/kỳ/điểm thường; không có dòng trùng; không mất điểm hoặc kết quả của mục nào. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: — |
| Thao tác | 1. Mở màn Điều kiện áp dụng（適用条件設定）, xem các loại điều kiện.<br>2. Mở màn Ngưỡng đỏ（赤点の基準）, xem các loại ngưỡng.<br>3. Với loại không có trong danh sách phát hành (ví dụ Công thức（計算式）, điều kiện Trung bình（平均点））: nếu chọn được thì thử Lưu. |
| Expected | Loại ngoài phạm vi không hiện như lựa chọn dùng được; không lưu được cấu hình dùng loại đó. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Loại ngoài phạm vi không hiện như lựa chọn dùng được; không lưu được cấu hình dùng loại đó. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên có thêm tính tự động, quy tắc “Cố định 30” (dưới 30) |
| Thao tác | 1. Chạy nút cam cho khối 1.<br>2. So điểm của mục số nguyên có thêm tính tự động với baseline. |
| Expected | Mọi điểm tự động bằng baseline; chỉ có thêm kết quả đỏ. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Mọi điểm tự động bằng baseline; chỉ có thêm kết quả đỏ. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100); quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao), học sinh S07 (điểm 35, cờ Chưa dự thi（未受験）) |
| Thao tác | 1. Đăng ký S07=20; chạy nút cam.<br>2. Xem điểm S07 trên màn nhập điểm và DB. |
| Expected | Điểm S07 vẫn 20 (không bị xóa/NULL); kết quả là Không áp dụng. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Điểm S07 vẫn 20 (không bị xóa/NULL); kết quả là Không áp dụng. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên có thêm tính tự động |
| Thao tác | 1. Mở màn, chọn cùng phạm vi như baseline.<br>2. Chạy nút cam rồi nút xanh. |
| Expected | Nút hiện, phạm vi chọn và danh sách lớp xếp hàng như baseline; AutoRating tính như baseline (REG-001). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| orange | Nút cam | Nút hiện, phạm vi chọn và danh sách lớp xếp hàng như baseline; AutoRating tính như baseline (REG-001). |
| green | Nút xanh | Nút hiện, phạm vi chọn và danh sách lớp xếp hàng như baseline; AutoRating tính như baseline (REG-001). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: cặp quy tắc phân nhánh theo trung bình 60, quy tắc theo tỷ lệ điểm của nhóm từ 65% |
| Thao tác | 1. Chạy nút xanh rồi nút cam cho khối 1.<br>2. So trung bình, thứ hạng, số người với baseline. |
| Expected | Trung bình, thứ hạng, số người bằng baseline; nút cam không ghi lại kết quả tổng hợp. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Trung bình, thứ hạng, số người bằng baseline; nút cam không ghi lại kết quả tổng hợp. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc tỷ lệ 30%; mục điểm đơn vị (đơn vị U1 có M riêng 40) |
| Thao tác | 1. Đổi định nghĩa M ở Thiết lập điểm tối đa（満点設定）, lưu, mở lại.<br>2. Đổi Giá trị tối đa（最大値）, lưu, mở lại.<br>3. Lưu ở Thiết lập điểm tối đa hàng loạt（満点一括設定） lựa chọn M=50 cho G-B; xem danh sách job. |
| Expected | Giá trị lưu, thông báo và danh sách job (lớp/kỳ được xếp hàng) bằng baseline. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| definition | Đổi định nghĩa M | Giá trị lưu, thông báo và danh sách job (lớp/kỳ được xếp hàng) bằng baseline. |
| maximum | Đổi Giá trị tối đa | Giá trị lưu, thông báo và danh sách job (lớp/kỳ được xếp hàng) bằng baseline. |
| batch | Lưu điểm tối đa hàng loạt | Giá trị lưu, thông báo và danh sách job (lớp/kỳ được xếp hàng) bằng baseline. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: môi trường test (trường A, năm học 2026) |
| Thao tác | Chạy batch với từng cỡ dữ liệu; đếm truy vấn liên quan đến quy tắc/nguồn/kết quả đỏ. |
| Expected | Số truy vấn đọc quy tắc/nguồn/M không tăng tuyến tính theo số ô. Thời gian chạy chỉ ghi lại để so, không có ngưỡng pass/fail (tài liệu chưa đặt ngưỡng). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| size10 | Cỡ 10 học sinh | Số truy vấn đọc quy tắc/nguồn/M không tăng tuyến tính theo số ô. Thời gian chạy chỉ ghi lại để so, không có ngưỡng pass/fail (tài liệu chưa đặt ngưỡng). |
| size100 | Cỡ 100 học sinh, đối chiếu log cả hai cỡ | Số truy vấn đọc quy tắc/nguồn/M không tăng tuyến tính theo số ô. Thời gian chạy chỉ ghi lại để so, không có ngưỡng pass/fail (tài liệu chưa đặt ngưỡng). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: quy tắc “Cố định 30” (dưới 30); mục số nguyên (M=100); mục số nguyên có thêm tính tự động |
| Thao tác | 1. Lưu điểm môn con qua đường ghi điểm “Màn lớp NB 成績登録 (đăng ký điểm)”, đường ghi điểm “CSV lớp NB”, đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)”.<br>2. So điểm môn chính, điểm quan điểm được sao chép và tín chỉ với baseline.<br>3. Xem kết quả đỏ của ô môn chính và ô nhận điểm sao chép; chọn dữ liệu sao cho giá trị trung gian (trước bước môn chính/phụ hoặc sao chép) và giá trị cuối nằm khác phía ngưỡng 30. |
| Expected | 1–2. Điểm môn chính, điểm quan điểm được sao chép và tín chỉ bằng baseline; thông báo và hành vi lỗi của từng đường như baseline.<br><br>3. Ô môn chính và ô nhận điểm sao chép được xét theo giá trị cuối sau các bước sau tính tự động, không theo giá trị trung gian (đặc tả v2 mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất”). |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| direct | Màn đăng ký NB, đủ bước 1–3 | 1–2. Điểm môn chính, điểm quan điểm được sao chép và tín chỉ bằng baseline; thông báo và hành vi lỗi của từng đường như baseline.<br><br>3. Ô môn chính và ô nhận điểm sao chép được xét theo giá trị cuối sau các bước sau tính tự động, không theo giá trị trung gian (đặc tả v2 mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất”). |
| csv | CSV lớp NB, đủ bước 1–3 | 1–2. Điểm môn chính, điểm quan điểm được sao chép và tín chỉ bằng baseline; thông báo và hành vi lỗi của từng đường như baseline.<br><br>3. Ô môn chính và ô nhận điểm sao chép được xét theo giá trị cuối sau các bước sau tính tự động, không theo giá trị trung gian (đặc tả v2 mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất”). |
| hr-csv | CSV lớp chủ nhiệm hàng loạt, đủ bước 1–3 | 1–2. Điểm môn chính, điểm quan điểm được sao chép và tín chỉ bằng baseline; thông báo và hành vi lỗi của từng đường như baseline.<br><br>3. Ô môn chính và ô nhận điểm sao chép được xét theo giá trị cuối sau các bước sau tính tự động, không theo giá trị trung gian (đặc tả v2 mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất”). |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: mục số nguyên (M=100), mục số nguyên có thêm tính tự động |
| Thao tác | 1. Mở màn, so bố cục với baseline.<br>2. Bấm link ở hàng Tính tự động（自動計算） và Thiết lập ẩn mục nhập（入力項目の非表示設定）.<br>3. Sửa một giá trị ở hàng khác, lưu. |
| Expected | Cột thẳng hàng, link mở đúng màn của đúng mục, lưu các hàng khác như baseline. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Cột thẳng hàng, link mở đúng màn của đúng mục, lưu các hàng khác như baseline. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Consumer/báo cáo hiện có đang hiển thị giá trị legacy trước khi bật rule mới. |
| Thao tác | 1. Thêm và chạy rule đỏ mới.<br>2. Mở consumer/báo cáo legacy cùng kỳ. |
| Expected | Consumer legacy giữ hành vi và giá trị trước đó, trừ phần tích hợp đỏ được xác nhận riêng; không đọc nhầm payload kết quả cá nhân mới. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| Base | Toàn bộ thủ tục theo đúng thứ tự; các đối chứng cùng fixture được kiểm trong cùng lượt, không bỏ bước | Consumer legacy giữ hành vi và giá trị trước đó, trừ phần tích hợp đỏ được xác nhận riêng; không đọc nhầm payload kết quả cá nhân mới. |

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
| Kích hoạt | Thực hiện đúng thao tác và biến thể dưới đây; chỉ xem/xuất không tự chạy xét. |
| Quan sát | Quan sát nơi nêu trong thủ tục/expected; dùng trích xuất không lọc để thấy cả ô đối chứng. Trạng thái không có dấu đỏ cần đọc thêm trạng thái lưu; output Excel/PDF dùng file thật. |
| Actor và quyền | Dùng actor/quyền được nêu trong điều kiện; cấu hình bởi người được sửa đúng mục, ghi điểm bởi người phụ trách lớp, batch bởi người có quyền chạy; đầu ra và tài khoản học sinh giữ quyền riêng. |
| Fixture | local: - Có dữ liệu legacy và kết quả cá nhân ở nguồn; thực hiện một đường chuyển cấu hình được hỗ trợ. |
| Thao tác | 1. Chuyển cấu hình qua copy/năm mới/import hoặc sync.<br>2. Đọc lại nguồn và đích trên consumer/báo cáo. |
| Expected | Legacy ở nguồn vẫn nguyên vẹn; đích không nhận kết quả cá nhân ngoài mapping hợp lệ và không dùng lại kết quả nguồn. |
| Bảo toàn | Giữ điểm, cấu hình và đối tượng không đích theo expected; chỉ thay phần thủ tục yêu cầu, không tự đổi oracle hoặc mở rộng phạm vi. |
| Bằng chứng | Ghi actual và URL bằng chứng/lỗi của đúng case/variant trong cùng report; giữ file Excel/PDF, ảnh trạng thái hoặc request/đọc dữ liệu khi case yêu cầu. Chưa có bằng chứng không được kết luận đã chạy. |
| Reset | Trước mỗi biến thể, dựng lại điều kiện/dữ liệu đầu của case bằng đường được phép; giữ các reset/fixture độc lập đã nêu trong thủ tục. |

##### Variants

| Variant | Inputs | Expected |
| --- | --- | --- |
| copy | Đường copy DATA-015 | Legacy ở nguồn vẫn nguyên vẹn; đích không nhận kết quả cá nhân ngoài mapping hợp lệ và không dùng lại kết quả nguồn. |
| year | Đường năm mới DATA-016 | Legacy ở nguồn vẫn nguyên vẹn; đích không nhận kết quả cá nhân ngoài mapping hợp lệ và không dùng lại kết quả nguồn. |
| import | Đường import DATA-017 | Legacy ở nguồn vẫn nguyên vẹn; đích không nhận kết quả cá nhân ngoài mapping hợp lệ và không dùng lại kết quả nguồn. |
| sync | Đường sync DATA-019 | Legacy ở nguồn vẫn nguyên vẹn; đích không nhận kết quả cá nhân ngoài mapping hợp lệ và không dùng lại kết quả nguồn. |
