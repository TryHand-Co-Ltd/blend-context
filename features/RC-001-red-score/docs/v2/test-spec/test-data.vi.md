<!-- blend-template: test-data@1.0.0 -->
# RC-001 — Dữ liệu kiểm thử

## Quy ước dữ liệu

| Field | Value |
| --- | --- |
| Revision | RC-001-v2-report-2026-10-04 |
| Conventions | Giữ toàn bộ TD IDs và giá trị gốc từ bộ bba351f. Tên là alias giả; không mật khẩu/token/dữ liệu cá nhân. Đây là dữ liệu thiết kế, không xác nhận fixture đã provision; chuẩn bị/đọc lại/reset phải được kiểm trên đúng build. |

## Fixtures

### Fixture: TD-ENV-01

| Field | Value |
| --- | --- |
| Vai trò | Môi trường chạy; loại dữ liệu nguồn: env |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Local Docker (`docker-codeigniter`, `docker-mysql`) có build tính năng; hoặc staging được team cho phép ghi |
| Target và non-target | Chạy toàn bộ case; đối chứng/kết quả thiết kế: Có quyền tạo/xóa dữ liệu test và reset |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ENV-02

| Field | Value |
| --- | --- |
| Vai trò | Trường khác; loại dữ liệu nguồn: env |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Trường B (tên giả), có ít nhất một mục đánh giá và một quy tắc đỏ |
| Target và non-target | Kiểm tra giả mạo ID khác trường; đối chứng/kết quả thiết kế: Người dùng trường A không đọc/sửa được |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ENV-03

| Field | Value |
| --- | --- |
| Vai trò | Truy cập DB; loại dữ liệu nguồn: env |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Kết nối MySQL local, chỉ dùng SELECT / SHOW FULL COLUMNS để lấy bằng chứng |
| Target và non-target | Bằng chứng dữ liệu; đối chứng/kết quả thiết kế: Không cần thông tin kết nối trong tài liệu |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ENV-04

| Field | Value |
| --- | --- |
| Vai trò | Nguồn snapshot; loại dữ liệu nguồn: env |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Dummy data cho bản tổng hợp đã chốt (R18 «đặc tả RC-001 v2» §5.5 «Chọn bản nguồn») cho tới khi PR #57058 «PR thêm trạng thái xác nhận kết quả tổng hợp xếp hạng, còn mở» được tích hợp |
| Target và non-target | Case nguồn trung bình; đối chứng/kết quả thiết kế: Bằng chứng ghi rõ "dummy data" |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ENV-05

| Field | Value |
| --- | --- |
| Vai trò | Đường dẫn màn (RSD-TASK «bản chia công việc v2»); loại dữ liệu nguồn: env |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Thiết lập nhập điểm（成績入力設定） `/admin/grade_report_setting/manage`; Tổng hợp thành tích（成績集計） `/admin/grade/grade_setting_system/grade_calc`; Đăng ký thành tích（成績登録） `/admin/nb/grade/grade_setting_system/lesson_group/regist/(:num)`; Đăng ký thành tích bằng CSV（成績CSV登録） `/admin/nb/grade/grade_setting_system/lesson_group_csv/regist/(:num)`; Thiết lập điểm tối đa hàng loạt（満点一括設定） `/admin/grade/lesson_group/setting?setting_type=change_max_score`; Trích xuất thành tích（成績抽出） `/admin/nb/grade/grade_setting_system/grade_extraction`; Thiết lập công khai thành tích（成績公開設定） `/admin/grade_report_setting/grade_publish`; Xác nhận thành tích（成績確認） `/student/grade/grade_publish`; Công cụ phiếu điểm（通知表ツール） `/admin/grade_report_setting/report_card` |
| Target và non-target | Điều hướng khi chạy case; đối chứng/kết quả thiết kế: URL màn đỏ mới và màn liên kết điểm thi chưa chốt/chưa xác minh |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ENV-06

| Field | Value |
| --- | --- |
| Vai trò | Trường test; loại dữ liệu nguồn: env |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Trường A (tên giả "Trường THPT Test A"), `school_id` do môi trường cấp |
| Target và non-target | Phạm vi trường; đối chứng/kết quả thiết kế: Mọi dữ liệu test thuộc trường này |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ENV-07

| Field | Value |
| --- | --- |
| Vai trò | Năm học; loại dữ liệu nguồn: env |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | 2026 |
| Target và non-target | Phạm vi năm; đối chứng/kết quả thiết kế: Mọi dữ liệu test thuộc năm này |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ROLE-01

| Field | Value |
| --- | --- |
| Vai trò | Giáo viên có quyền sửa mục; loại dữ liệu nguồn: role |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Có quyền vào Thiết lập nhập điểm（成績入力設定） và quyền sửa TD-ITEM-01…03 «mục đánh giá: Mục số nguyên: Điểm đánh… … Mục điểm đơn vị: Điểm bài kiểm tra…» |
| Target và non-target | Cấu hình quy tắc; đối chứng/kết quả thiết kế: Xem/thêm/sửa/xóa/đổi thứ tự được |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ROLE-02

| Field | Value |
| --- | --- |
| Vai trò | Giáo viên không có quyền sửa mục; loại dữ liệu nguồn: role |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Vào được Thiết lập nhập điểm（成績入力設定） nhưng mục TD-ITEM-06 «Mục chỉ nội bộ: Mục số có cờ chỉ dành nội bộ（`mw_only_flg`）» là mục chỉ dành nội bộ（`mw_only_flg`） |
| Target và non-target | Kiểm quyền mục; đối chứng/kết quả thiết kế: Không sửa được quy tắc của TD-ITEM-06 «Mục chỉ nội bộ: Mục số có cờ chỉ dành nội bộ（`mw_only_flg`）» |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ROLE-03

| Field | Value |
| --- | --- |
| Vai trò | Người có quyền chạy hàng loạt; loại dữ liệu nguồn: role |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Có quyền thực hiện Thực hiện tổng hợp（集計実行） và Thực hiện tính toán tự động（自動算出実行） theo cấu hình hiện hành |
| Target và non-target | Chạy lại; đối chứng/kết quả thiết kế: Nút chạy dùng được |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ROLE-04

| Field | Value |
| --- | --- |
| Vai trò | Người sửa được mục nhưng không có quyền chạy; loại dữ liệu nguồn: role |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Như TD-ROLE-01 «Giáo viên có quyền sửa mục: Có quyền vào Thiết lập nhập điểm（成績入力設定） và…» nhưng không có quyền chạy hàng loạt |
| Target và non-target | QAC «Q&amp;A nghiệp vụ đã xác nhận» Q1 «Ai được thiết lập điều kiện điểm đỏ?»; đối chứng/kết quả thiết kế: Không chạy được hàng loạt |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ROLE-05

| Field | Value |
| --- | --- |
| Vai trò | Học sinh; loại dữ liệu nguồn: role |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Học sinh S01 của trường A, có lịch công khai đang mở |
| Target và non-target | Xác nhận thành tích（成績確認）; đối chứng/kết quả thiết kế: Chỉ xem dữ liệu của chính mình |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ROLE-06

| Field | Value |
| --- | --- |
| Vai trò | Học sinh; loại dữ liệu nguồn: role |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Học sinh S06 của trường A, có lịch công khai đang mở cho HR2 |
| Target và non-target | Xác nhận thành tích（成績確認）; đối chứng/kết quả thiết kế: Chỉ xem dữ liệu của chính mình; dùng cho FUNC-027 và REG-008, không thay bằng tài khoản S01 |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ROLE-07

| Field | Value |
| --- | --- |
| Vai trò | Người phụ trách đầu ra; loại dữ liệu nguồn: role |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Có quyền Trích xuất thành tích（成績抽出）, Thiết lập công khai thành tích（成績公開設定）, Công cụ phiếu điểm（通知表ツール） |
| Target và non-target | Ba đầu ra; đối chứng/kết quả thiết kế: Mở và lưu được cấu hình đầu ra |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ROLE-08

| Field | Value |
| --- | --- |
| Vai trò | Phụ huynh; loại dữ liệu nguồn: role |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Phụ huynh có quan hệ với S01 ở trường A, lịch công khai đang mở (R18 «đặc tả RC-001 v2» §1.3 «Quyền sử dụng»; AC-G34 «Đúng người, lịch và đầu ra công khai») |
| Target và non-target | Xác nhận thành tích（成績確認） phía phụ huynh; đối chứng/kết quả thiết kế: Chỉ xem dữ liệu của S01 |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ROLE-09

| Field | Value |
| --- | --- |
| Vai trò | Giáo viên nhập điểm; loại dữ liệu nguồn: role |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Giáo viên phụ trách lớp G-A, G-B, G-C: có quyền Đăng ký thành tích（成績登録）, Đăng ký thành tích bằng CSV（成績CSV登録） và Trích xuất thành tích（成績抽出） của các lớp này |
| Target và non-target | Đăng ký điểm, quan sát kết quả xét; đối chứng/kết quả thiết kế: Lưu điểm và xem trích xuất được |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ROLE-10

| Field | Value |
| --- | --- |
| Vai trò | Người dùng trường B; loại dữ liệu nguồn: role |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Giáo viên/quản trị của trường B |
| Target và non-target | Giả mạo ID; đối chứng/kết quả thiết kế: Bị từ chối với dữ liệu trường A |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ITEM-01

| Field | Value |
| --- | --- |
| Vai trò | Mục số nguyên; loại dữ liệu nguồn: master |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định 100, môn Toán（数学） |
| Target và non-target | Case chính; đối chứng/kết quả thiết kế: Có hàng Thiết lập điểm đỏ（赤点設定） |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ITEM-02

| Field | Value |
| --- | --- |
| Vai trò | Mục số thập phân; loại dữ liệu nguồn: master |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc định 100 |
| Target và non-target | Điểm và ngưỡng thập phân; đối chứng/kết quả thiết kế: Có hàng Thiết lập điểm đỏ（赤点設定） |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ITEM-03

| Field | Value |
| --- | --- |
| Vai trò | Mục điểm đơn vị; loại dữ liệu nguồn: master |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Điểm bài kiểm tra đơn vị（単元テスト点）, M mặc định 100; đơn vị U1 có M riêng 40; đơn vị U2 không có ngoại lệ; lựa chọn lớp（満点設定） ghi đè 50 áp dụng cho lớp G-A |
| Target và non-target | Phân giải M, ô theo đơn vị; đối chứng/kết quả thiết kế: M(G-A,U1)=50; M(G-B,U1)=40; M(G-B,U2)=100 |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ITEM-04

| Field | Value |
| --- | --- |
| Vai trò | Mục lựa chọn; loại dữ liệu nguồn: master |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Kiểu lựa chọn（選択肢型） A/B/C |
| Target và non-target | Loại khỏi phạm vi; đối chứng/kết quả thiết kế: Không có thao tác tạo quy tắc có hiệu lực |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ITEM-05

| Field | Value |
| --- | --- |
| Vai trò | Mục đạt/không đạt; loại dữ liệu nguồn: master |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Đạt/không đạt（合否） |
| Target và non-target | Loại khỏi phạm vi; đối chứng/kết quả thiết kế: Như TD-ITEM-04 «Mục lựa chọn: Kiểu lựa chọn（選択肢型） A/B/C» |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ITEM-06

| Field | Value |
| --- | --- |
| Vai trò | Mục chỉ nội bộ; loại dữ liệu nguồn: master |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Mục số có cờ chỉ dành nội bộ（`mw_only_flg`） |
| Target và non-target | Kiểm quyền; đối chứng/kết quả thiết kế: Chỉ người có quyền nội bộ sửa được |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ITEM-07

| Field | Value |
| --- | --- |
| Vai trò | Mục khác M theo lớp; loại dữ liệu nguồn: master |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Mục số M mặc định 100; lớp G-A dùng lựa chọn lớp M=20; lớp G-B M=100 |
| Target và non-target | Kiểm `0≤N≤M` của mọi đối tượng; đối chứng/kết quả thiết kế: N=30 không lưu được khi phạm vi gồm G-A |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ITEM-08

| Field | Value |
| --- | --- |
| Vai trò | M không hợp lệ; loại dữ liệu nguồn: master |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Mục số có M hiệu lực = 0 (nếu cấu hình được) hoặc không phân giải được M |
| Target và non-target | Tỷ lệ với M không hợp lệ; đối chứng/kết quả thiết kế: Cách tạo dữ liệu: hỏi team dev khi chuẩn bị |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ITEM-09

| Field | Value |
| --- | --- |
| Vai trò | Mục cho phép điểm âm; loại dữ liệu nguồn: master |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Mục số có miền điểm cho phép số âm (nếu cấu hình được) |
| Target và non-target | Ngưỡng âm; đối chứng/kết quả thiết kế: Cách tạo dữ liệu: hỏi team dev khi chuẩn bị |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-ITEM-10

| Field | Value |
| --- | --- |
| Vai trò | Mục có tính tự động; loại dữ liệu nguồn: master |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» có thêm quy tắc tính tự động（自動計算設定） đang hoạt động |
| Target và non-target | Hồi quy AutoRating; đối chứng/kết quả thiết kế: Điểm tự động giữ như trước |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-GRP-01

| Field | Value |
| --- | --- |
| Vai trò | Lớp học phần; loại dữ liệu nguồn: master |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | G-A (Toán I（数学Ⅰ）, khối 1, nhóm thành tích Nâng cao), G-B (Toán I（数学Ⅰ）, khối 2), G-C (Ngữ văn logic（論理国語）, khối 1) |
| Target và non-target | Bộ lọc, nhóm tham chiếu; đối chứng/kết quả thiết kế: Mỗi lớp có ≥ 2 học sinh |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-GRP-03

| Field | Value |
| --- | --- |
| Vai trò | Fixture batch cùng khối (cần provision); loại dữ liệu nguồn: synthetic fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Tạo lớp fixture `BATCH-GA1` và `BATCH-GA2` cùng khối 1, với học sinh riêng `BATCH-S01` và `BATCH-S02`; `BATCH-GC`/`BATCH-S03` là control ngoài batch. Trước chạy ghi identity thật `learner → class → score cell → batch scope` và giá trị baseline; ID `BATCH-*` là alias fixture, không khẳng định record đã tồn tại. |
| Target và non-target | ERR-003 batch partial; đối chứng/kết quả thiết kế: BLOCKED đến khi alias được map thành fixture identities thật và seam lỗi riêng BATCH-GA2 được provision/quan sát; không dùng lớp master làm bằng chứng |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-GRP-04

| Field | Value |
| --- | --- |
| Vai trò | Fixture bộ lọc BR-041 (cần provision); loại dữ liệu nguồn: synthetic fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Ba identity độc lập: `BR041-FILTER-POS` thuộc khối 1 + Nâng cao; `BR041-FILTER-GRADE-NEG` thuộc khối 3 + Nâng cao; `BR041-FILTER-GROUP-NEG` thuộc khối 1 + nhóm không phải Nâng cao. Trên mỗi identity, nguồn reader riêng phải trả `A=60`, `R=60%`, điểm học sinh `S=60`; cùng rule yêu cầu `A≥50 AND R≥50%`, ngưỡng `T=70`, dấu `&lt;`. Ghi source/snapshot identity, membership, A/R/S thực đọc trước khi xét; giữa ba lượt chỉ thay một predicate bộ lọc, không đổi điều kiện A/R. |
| Target và non-target | BR-041 / `FILTER-POS`, `FILTER-GRADE-NEG`, `FILTER-GROUP-NEG`; đối chứng/kết quả thiết kế: BLOCKED đến khi cả ba reader/membership được quan sát: positive Đỏ, hai negative Không áp dụng dù A/R đều khớp; không PASS nếu chỉ biết A/R hợp lệ |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-GRP-05

| Field | Value |
| --- | --- |
| Vai trò | Fixture lớp CALC-015 decimal (cần provision); loại dữ liệu nguồn: synthetic fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Lớp/nhóm `CALC015-DECIMAL` dùng đúng mục điểm thập phân TD-ITEM-02 (M=100), cùng rule TD-RULE-06; chứa ba học sinh C15-P1=23.9, C15-P2=24, C15-P3=24.4. Không suy thành viên từ S01/S09/S10; ghi membership, source identity/revision và reader response A=61. |
| Target và non-target | CALC-015 / các biến thể biên &lt; và ≤; đối chứng/kết quả thiết kế: BLOCKED cho tới khi fixture được provision và reader xác nhận cùng scope có A=61; không PASS bằng cách thay expected trong lúc chạy |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-GRP-06

| Field | Value |
| --- | --- |
| Vai trò | Fixture kiểm trạng thái nguồn BR-041 (cần provision); loại dữ liệu nguồn: synthetic fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Identity độc lập P17/P18/P19 trong cùng phạm vi áp dụng, mỗi identity có bản chạy riêng: P17 source A=NaN, P18 source A=null/missing, P19 source A=Infinity; P17/P18/P19 có S=25 và rule ưu tiên thấp hơn T=30 để phát hiện fallback. P18-S-EMPTY là lượt khác của identity P18 với A=60 và không có điểm S. |
| Target và non-target | BR-041 / P17-A-NAN, P19-A-INFINITY, P18-A-EMPTY, P18-S-EMPTY; đối chứng/kết quả thiết kế: BLOCKED đến khi reader chứng minh được source invalid/null và trạng thái điểm riêng; NaN/Infinity có thể cần seam, không thay oracle nếu UI không cho nhập |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-GRP-02

| Field | Value |
| --- | --- |
| Vai trò | Lớp chủ nhiệm; loại dữ liệu nguồn: master |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | HR1 (S01–S05), HR2 (S06–S10) |
| Target và non-target | Nhóm tham chiếu ホームルーム (lớp chủ nhiệm; file Figma cũ ghi HR毎); đối chứng/kết quả thiết kế: — |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-STU-01

| Field | Value |
| --- | --- |
| Vai trò | S01; loại dữ liệu nguồn: score |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | G-A, HR1; TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» = 29 |
| Target và non-target | Đỏ với `&lt;30`; đối chứng/kết quả thiết kế: Đỏ |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-STU-02

| Field | Value |
| --- | --- |
| Vai trò | S02; loại dữ liệu nguồn: score |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | G-A, HR1; TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» = 30 |
| Target và non-target | Biên `S=T`; đối chứng/kết quả thiết kế: `&lt;` không đỏ; `≤` đỏ |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-STU-03

| Field | Value |
| --- | --- |
| Vai trò | S03; loại dữ liệu nguồn: score |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | G-A, HR1; TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» = 31 |
| Target và non-target | Biên +1; đối chứng/kết quả thiết kế: Không đỏ |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-STU-04

| Field | Value |
| --- | --- |
| Vai trò | S04; loại dữ liệu nguồn: score |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | G-A, HR1; TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» = 0 |
| Target và non-target | Điểm 0 hợp lệ; đối chứng/kết quả thiết kế: Xét như số 0 |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-STU-05

| Field | Value |
| --- | --- |
| Vai trò | S05; loại dữ liệu nguồn: score |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | G-A, HR1; TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» = ô trống |
| Target và non-target | Không có điểm; đối chứng/kết quả thiết kế: Không coi là 0 |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-STU-06

| Field | Value |
| --- | --- |
| Vai trò | S06; loại dữ liệu nguồn: score |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | G-B, HR2; TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» = 24, là Điểm dự kiến（見込点） |
| Target và non-target | Kết hợp dự kiến + đỏ; đối chứng/kết quả thiết kế: Đỏ; hiển thị theo đầu ra |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-STU-07

| Field | Value |
| --- | --- |
| Vai trò | S07; loại dữ liệu nguồn: score |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | G-B, HR2; TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» = 35, cờ Chưa dự thi（未受験） |
| Target và non-target | Cờ chưa dự thi không loại khỏi xét; đối chứng/kết quả thiết kế: Được xét |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-STU-08

| Field | Value |
| --- | --- |
| Vai trò | S08; loại dữ liệu nguồn: score |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | G-B, HR2; TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» nhập tay 28 rồi sửa tay 35 |
| Target và non-target | Điểm sửa tay; đối chứng/kết quả thiết kế: Xét 35 |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-STU-09

| Field | Value |
| --- | --- |
| Vai trò | S09; loại dữ liệu nguồn: score |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | G-B, HR2; TD-ITEM-02 «Mục số thập phân: Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc…» = 29.5 |
| Target và non-target | Điểm thập phân; đối chứng/kết quả thiết kế: Đỏ với `&lt;30` |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-STU-10

| Field | Value |
| --- | --- |
| Vai trò | S10; loại dữ liệu nguồn: score |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | HR2; lớp G-C Ngữ văn logic（論理国語）= 70; lớp G-B Toán I（数学Ⅰ）= 24 (cùng mục Điểm đánh giá（評点）, cùng quy tắc `&lt;30`) |
| Target và non-target | Trích xuất theo phạm vi môn; đối chứng/kết quả thiết kế: Chỉ ô Toán đỏ |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-01

| Field | Value |
| --- | --- |
| Vai trò | Bản đã chốt; loại dữ liệu nguồn: source |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Snapshot của nguồn mặc định, `A` thô = 49.99 (màn tổng hợp hiển thị 50.0) |
| Target và non-target | Ưu tiên bản chốt, A trước làm tròn; đối chứng/kết quả thiết kế: Dùng 49.99 |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-02

| Field | Value |
| --- | --- |
| Vai trò | Bản mới nhất chưa chốt; loại dữ liệu nguồn: source |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Tổng hợp chạy sau TD-SRC-01 «Bản đã chốt: Snapshot của nguồn mặc định, `A` thô = 49.99…», `A` = 62 |
| Target và non-target | Không thay bản chốt; đối chứng/kết quả thiết kế: Không dùng khi có TD-SRC-01 «Bản đã chốt: Snapshot của nguồn mặc định, `A` thô = 49.99…» |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-03

| Field | Value |
| --- | --- |
| Vai trò | Không có tổng hợp; loại dữ liệu nguồn: source |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Nguồn chưa từng chạy tổng hợp |
| Target và non-target | Thiếu nguồn; đối chứng/kết quả thiết kế: Chưa xét được |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-04

| Field | Value |
| --- | --- |
| Vai trò | Bản chốt thiếu dữ liệu; loại dữ liệu nguồn: source |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Snapshot tồn tại nhưng không có dòng cho môn/mục của ô |
| Target và non-target | Không fallback; đối chứng/kết quả thiết kế: Chưa xét được, không dùng TD-SRC-02 «Bản mới nhất chưa chốt: Tổng hợp chạy sau TD-SRC-01, `A` = 62» |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-05

| Field | Value |
| --- | --- |
| Vai trò | Tỷ lệ nhóm cùng M; loại dữ liệu nguồn: source |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | 2 học sinh: 60/100 và 80/100 → `R=70%` |
| Target và non-target | Tỷ lệ nhóm (R18 «đặc tả RC-001 v2» §5.3 «Tỷ lệ nhóm»); đối chứng/kết quả thiết kế: Khớp `R≥65%` |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-06

| Field | Value |
| --- | --- |
| Vai trò | Tỷ lệ nhóm khác M; loại dữ liệu nguồn: source |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | G-A: `10/20`; G-B: `80/100`; học sinh kiểm P1 ở G-B có `M=100` |
| Target và non-target | Khác M không gây lỗi dừng; giá trị `R` phải lấy từ snapshot/reader thực tế và ghi trong evidence; đối chứng/kết quả thiết kế: Xử lý không dừng; không suy fixture thành yêu cầu tính mới |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-07

| Field | Value |
| --- | --- |
| Vai trò | Có học sinh bị loại khỏi xếp hạng; loại dữ liệu nguồn: source |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | 3 học sinh: 60, 40 và 20 (học sinh 20 điểm bị loại khỏi xếp hạng) |
| Target và non-target | Mẫu số trung bình (R18 «đặc tả RC-001 v2» §5.5 «Chọn bản nguồn», AC-G14 «Giá trị thô từ cùng tập dữ liệu»); đối chứng/kết quả thiết kế: Kỳ vọng: `A=40` (chia số người có điểm, 3); chia số người thuộc xếp hạng (`A=50`) là sai. Trường nào (`examinees`/`student_count`) mang giá trị đúng: kiểm khi tích hợp |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-08

| Field | Value |
| --- | --- |
| Vai trò | Trung bình bằng 0; loại dữ liệu nguồn: source |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Mọi học sinh trong nhóm có 0 điểm → `A=0` |
| Target và non-target | Chia 0 khi chạy; đối chứng/kết quả thiết kế: Chưa xét được |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-09

| Field | Value |
| --- | --- |
| Vai trò | Trung bình cho điểm đơn vị; loại dữ liệu nguồn: required source fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Hai snapshot độc lập cùng môn: `UNIT-U1` trả A thô=40 và `UNIT-U2` trả A thô=70; lưu source identity, revision và reader response cho mỗi snapshot. Đây là fixture cần tích hợp/quan sát, không phải dữ liệu đã tồn tại. |
| Target và non-target | CALC-027; trung bình riêng U1/U2 (R18 «đặc tả RC-001 v2» §13.1 «Điều kiện triển khai và kiểm chứng»); đối chứng/kết quả thiết kế: Chưa PASS cho tới khi reader chứng minh U1 dùng 40, U2 dùng 70 và không gộp; chưa có seam thì BLOCKED |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-10

| Field | Value |
| --- | --- |
| Vai trò | A = 60 và 59.96; loại dữ liệu nguồn: source |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Hai nguồn riêng: `A`=60.00 và `A`=59.96 (hiển thị 60.0) |
| Target và non-target | Biên điều kiện phân nhánh; đối chứng/kết quả thiết kế: 60 khớp `≥60`; 59.96 không khớp |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-11

| Field | Value |
| --- | --- |
| Vai trò | BR-041 R+R positive; loại dữ liệu nguồn: required source fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Fixture `BR041-RR-60`, snapshot identity riêng; source reader phải trả `R=60%`; rule yêu cầu `R≥50% AND R&lt;70%`; control P1 `S=60`, `T=70`, `&lt;` |
| Target và non-target | BR-041 / `RR-60`; đối chứng/kết quả thiết kế: Chỉ đánh giá sau khi snapshot/reader evidence xác nhận chính `R=60%`; khi xác nhận, rule khớp và P1 Đỏ |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-12

| Field | Value |
| --- | --- |
| Vai trò | BR-041 R dưới biên; loại dữ liệu nguồn: required source fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Fixture `BR041-RR-49.9`, snapshot identity riêng; reader phải trả `R=49.9%` |
| Target và non-target | BR-041 / `RR-49.9`; đối chứng/kết quả thiết kế: Chỉ đánh giá khi reader xác nhận; khi xác nhận, `R≥50%` sai → Không áp dụng |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-13

| Field | Value |
| --- | --- |
| Vai trò | BR-041 R trên biên; loại dữ liệu nguồn: required source fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Fixture `BR041-RR-70`, snapshot identity riêng; reader phải trả `R=70%` |
| Target và non-target | BR-041 / `RR-70`; đối chứng/kết quả thiết kế: Chỉ đánh giá khi reader xác nhận; khi xác nhận, `R&lt;70%` sai → Không áp dụng |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-14

| Field | Value |
| --- | --- |
| Vai trò | BR-041 A+R positive; loại dữ liệu nguồn: required source fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Fixture `BR041-AR-60-60`, identity/source mapping được ghi riêng; reader observables `A=60`, `R=60%` |
| Target và non-target | BR-041 / `AR-60-60`; đối chứng/kết quả thiết kế: Chỉ đánh giá khi cùng đối tượng áp dụng xác nhận cả hai giá trị; hai điều kiện AND đúng → P1 Đỏ |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-15

| Field | Value |
| --- | --- |
| Vai trò | BR-041 A âm, R dương; loại dữ liệu nguồn: required source fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Fixture `BR041-AR-40-60`, identity/snapshot riêng; reader observables `A=40`, `R=60%` |
| Target và non-target | BR-041 / `AR-40-60`; đối chứng/kết quả thiết kế: Chỉ đánh giá khi reader xác nhận; A sai nên AND sai → Không áp dụng |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-16

| Field | Value |
| --- | --- |
| Vai trò | BR-041 A dương, R âm; loại dữ liệu nguồn: required source fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Fixture `BR041-AR-60-40`, identity/snapshot riêng; reader observables `A=60`, `R=40%` |
| Target và non-target | BR-041 / `AR-60-40`; đối chứng/kết quả thiết kế: Chỉ đánh giá khi reader xác nhận; R sai nên AND sai → Không áp dụng |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-17

| Field | Value |
| --- | --- |
| Vai trò | BR-041 A boundary P9; loại dữ liệu nguồn: required source fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Snapshot `BR041-A-P9`, identity riêng; reader trả `A=40`; P9 có `S=60,T=70,&lt;` |
| Target và non-target | BR-041 / `A-P9`; đối chứng/kết quả thiết kế: Chỉ đánh giá sau khi mapping/reader xác nhận đúng P9 và A=40; A≥50 sai → Không áp dụng |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-18

| Field | Value |
| --- | --- |
| Vai trò | BR-041 A boundary P10; loại dữ liệu nguồn: required source fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Snapshot `BR041-A-P10`, identity riêng; reader trả `A=50`; P10 có `S=60,T=70,&lt;` |
| Target và non-target | BR-041 / `A-P10`; đối chứng/kết quả thiết kế: Chỉ đánh giá sau khi mapping/reader xác nhận đúng P10 và A=50; cả hai điều kiện A khớp → P10 Đỏ |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-19

| Field | Value |
| --- | --- |
| Vai trò | BR-041 A boundary P11; loại dữ liệu nguồn: required source fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Snapshot `BR041-A-P11`, identity riêng; reader trả `A=60`; P11 có `S=60,T=70,&lt;` |
| Target và non-target | BR-041 / `A-P11`; đối chứng/kết quả thiết kế: Chỉ đánh giá sau khi mapping/reader xác nhận đúng P11 và A=60; cả hai điều kiện A khớp → P11 Đỏ |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-20

| Field | Value |
| --- | --- |
| Vai trò | BR-041 A boundary P12; loại dữ liệu nguồn: required source fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Snapshot `BR041-A-P12`, identity riêng; reader trả `A=70`; P12 có `S=60,T=70,&lt;` |
| Target và non-target | BR-041 / `A-P12`; đối chứng/kết quả thiết kế: Chỉ đánh giá sau khi mapping/reader xác nhận đúng P12 và A=70; điều kiện A&lt;70 sai → Không áp dụng |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-21

| Field | Value |
| --- | --- |
| Vai trò | BR-041 A boundary P13; loại dữ liệu nguồn: required source fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Snapshot `BR041-A-P13`, identity riêng; reader trả `A=49.9`; P13 có `S=60,T=70,&lt;` |
| Target và non-target | BR-041 / `A-P13`; đối chứng/kết quả thiết kế: Chỉ đánh giá sau khi mapping/reader xác nhận đúng P13 và A=49.9; A≥50 sai → Không áp dụng |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-22

| Field | Value |
| --- | --- |
| Vai trò | BR-041 A boundary P14; loại dữ liệu nguồn: required source fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Snapshot `BR041-A-P14`, identity riêng; reader trả `A=50.0`; P14 có `S=60,T=70,&lt;` |
| Target và non-target | BR-041 / `A-P14`; đối chứng/kết quả thiết kế: Chỉ đánh giá sau khi mapping/reader xác nhận đúng P14 và A=50.0; cả hai điều kiện A khớp → P14 Đỏ |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-23

| Field | Value |
| --- | --- |
| Vai trò | BR-041 A boundary P15; loại dữ liệu nguồn: required source fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Snapshot `BR041-A-P15`, identity riêng; reader trả `A=69.9`; P15 có `S=60,T=70,&lt;` |
| Target và non-target | BR-041 / `A-P15`; đối chứng/kết quả thiết kế: Chỉ đánh giá sau khi mapping/reader xác nhận đúng P15 và A=69.9; cả hai điều kiện A khớp → P15 Đỏ |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-24

| Field | Value |
| --- | --- |
| Vai trò | BR-041 A boundary P16; loại dữ liệu nguồn: required source fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Snapshot `BR041-A-P16`, identity riêng; reader trả `A=70.0`; P16 có `S=60,T=70,&lt;` |
| Target và non-target | BR-041 / `A-P16`; đối chứng/kết quả thiết kế: Chỉ đánh giá sau khi mapping/reader xác nhận đúng P16 và A=70.0; điều kiện A&lt;70 sai → Không áp dụng |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-25

| Field | Value |
| --- | --- |
| Vai trò | CALC-015 reader source; loại dữ liệu nguồn: required source fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Snapshot `CALC015-A61` gắn với TD-GRP-05; reader phải trả trung bình nguồn A=61 cho đúng lớp/môn/scope CALC015-DECIMAL |
| Target và non-target | CALC-015 / `&lt;`, `≤`; đối chứng/kết quả thiết kế: BLOCKED tới khi mapping và reader response A=61 có evidence; sau đó expected cố định T=24, không đổi oracle theo kết quả chạy |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-26

| Field | Value |
| --- | --- |
| Vai trò | BR-041 P17 nguồn NaN; loại dữ liệu nguồn: required source fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Snapshot riêng `BR041-P17-A-NAN`; reader phải cho thấy A không hữu hạn/không thể so sánh, identity P17 thuộc bộ lọc và S=25 |
| Target và non-target | BR-041 / P17-A-NAN; đối chứng/kết quả thiết kế: BLOCKED tới khi có evidence reader/seam; expected là Chưa xét được, không xuống rule T=30 |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-27

| Field | Value |
| --- | --- |
| Vai trò | BR-041 P18 thiếu nguồn A; loại dữ liệu nguồn: required source fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Snapshot riêng `BR041-P18-A-EMPTY`; reader trả A null/không có giá trị, identity P18 thuộc bộ lọc và S=25 |
| Target và non-target | BR-041 / P18-A-EMPTY; đối chứng/kết quả thiết kế: BLOCKED tới khi có evidence reader/seam; expected là Chưa xét được, không xuống rule T=30 |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-28

| Field | Value |
| --- | --- |
| Vai trò | BR-041 P18 thiếu điểm S; loại dữ liệu nguồn: required score/source fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Lượt riêng `BR041-P18-S-EMPTY`; reader trả A=60 cho identity P18 nhưng ô điểm S không có điểm |
| Target và non-target | BR-041 / P18-S-EMPTY; đối chứng/kết quả thiết kế: BLOCKED tới khi chứng minh A hợp lệ và ô S trống; expected là Không có điểm, không đổi thành Chưa xét được |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-SRC-29

| Field | Value |
| --- | --- |
| Vai trò | BR-041 P19 nguồn Infinity; loại dữ liệu nguồn: required source fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Snapshot riêng `BR041-P19-A-INFINITY`; reader cho thấy A vô hạn/không thể so sánh, identity P19 thuộc bộ lọc và S=25 |
| Target và non-target | BR-041 / P19-A-INFINITY; đối chứng/kết quả thiết kế: BLOCKED tới khi có evidence reader/seam; expected là Chưa xét được, không xuống rule T=30 |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-POP-01

| Field | Value |
| --- | --- |
| Vai trò | Thiết lập tổng hợp X; loại dữ liệu nguồn: source |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Thiết lập tổng hợp thứ hạng（順位集計設定） "評点集計" (tổng hợp điểm đánh giá) của trường A/2026; công tắc hiện hữu: Khối（学年） BẬT, Lớp chủ nhiệm（ホームルーム） BẬT, Lớp học（授業） TẮT; X đã chạy tổng hợp cho kỳ đang dùng |
| Target và non-target | Loại cơ bản theo công tắc; đối chứng/kết quả thiết kế: Trong ba loại cơ bản chỉ có khối và lớp chủ nhiệm |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-POP-02

| Field | Value |
| --- | --- |
| Vai trò | X sau khi bật lớp học; loại dữ liệu nguồn: source |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Như TD-POP-01 «Thiết lập tổng hợp X: Thiết lập tổng hợp thứ hạng（順位集計設定）…» nhưng bật thêm Lớp học（授業）, chạy lại tổng hợp X; không tạo cấu hình tổng hợp mới |
| Target và non-target | Thêm lựa chọn lớp học trong cùng X; đối chứng/kết quả thiết kế: Có lựa chọn lớp học; kết quả theo từng lớp G-A, G-B |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-POP-03

| Field | Value |
| --- | --- |
| Vai trò | Nhóm tổng hợp thứ hạng（順位集計グループ）; loại dữ liệu nguồn: source |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | "Toán I khối 1+2" gồm lớp G-A và G-B, thuộc trường A/2026, đã có kết quả tổng hợp trong X |
| Target và non-target | Loại cấu hình: chọn bằng tên, lưu ID; đối chứng/kết quả thiết kế: Hiển thị đúng tên đã đặt |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-POP-04

| Field | Value |
| --- | --- |
| Vai trò | Nhóm tổ hợp（組み合わせグループ）; loại dữ liệu nguồn: source |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | "Tổ hợp Toán" (tên giả) thuộc trường A/2026, đã có kết quả tổng hợp trong X |
| Target và non-target | Loại cấu hình độc lập ba công tắc; đối chứng/kết quả thiết kế: Hiển thị đúng tên đã đặt |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-POP-05

| Field | Value |
| --- | --- |
| Vai trò | Nhóm môn học（科目グループ）; loại dữ liệu nguồn: source |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | "Nhóm môn Toán" (tên giả): có cấu hình riêng cho Toán I（数学Ⅰ） và cấu hình default đã lưu. Biến thể: (a) môn không có cấu hình riêng → dùng default; (b) default bị xóa hoặc trỏ tới cấu hình không hợp lệ |
| Target và non-target | Phân giải nhóm môn; đối chứng/kết quả thiết kế: Dùng cấu hình riêng hoặc default; thiếu/sai → Chưa xét được |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-POP-06

| Field | Value |
| --- | --- |
| Vai trò | Học sinh học hai lớp cùng môn; loại dữ liệu nguồn: score |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | S11 (tên giả, HR1) học cả G-A và G-D (Toán I（数学Ⅰ）, khối 1, lớp thứ hai); có điểm TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» ở cả hai lớp; trung bình lớp G-A = 40, G-D = 70 trong X |
| Target và non-target | Loại lớp học đọc đúng lớp của ô; đối chứng/kết quả thiết kế: Ô ở G-A dùng kết quả G-A; ô ở G-D dùng kết quả G-D |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-RULE-01

| Field | Value |
| --- | --- |
| Vai trò | Cố định `&lt;`; loại dữ liệu nguồn: rule |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Tên "Cố định 30"; Toàn bộ đối tượng（全員が対象）; Điểm cố định（固定点数） 30; Nhỏ hơn（未満） |
| Target và non-target | Quy tắc cơ bản; đối chứng/kết quả thiết kế: `T=30`, đỏ khi `S&lt;30` |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-RULE-02

| Field | Value |
| --- | --- |
| Vai trò | Cố định `≤`; loại dữ liệu nguồn: rule |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Như TD-RULE-01 «Cố định `&lt;`: Tên "Cố định 30"» nhưng Nhỏ hơn hoặc bằng（以下） |
| Target và non-target | Biên `S=T`; đối chứng/kết quả thiết kế: Đỏ khi `S≤30` |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-RULE-03

| Field | Value |
| --- | --- |
| Vai trò | Tỷ lệ; loại dữ liệu nguồn: rule |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Tỷ lệ điểm tối đa（得点率） 30%, không xử lý phần lẻ（しない）, Nhỏ hơn（未満） |
| Target và non-target | Tỷ lệ theo M hiện hành; đối chứng/kết quả thiết kế: `T=M×0.3` |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-RULE-04

| Field | Value |
| --- | --- |
| Vai trò | Tỷ lệ làm tròn xuống; loại dữ liệu nguồn: rule |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Như TD-RULE-03 «Tỷ lệ: Tỷ lệ điểm tối đa（得点率） 30%, không xử lý phần lẻ（しない）, Nhỏ hơn（未満）», xử lý phần lẻ: chữ số thập phân thứ 1（小数第1位）, Làm tròn xuống（切り捨て） |
| Target và non-target | Làm tròn; đối chứng/kết quả thiết kế: `T` là số nguyên làm tròn xuống |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-RULE-05

| Field | Value |
| --- | --- |
| Vai trò | Tỷ lệ làm tròn gần nhất; loại dữ liệu nguồn: rule |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Như TD-RULE-04 «Tỷ lệ làm tròn xuống: Như TD-RULE-03, xử lý phần lẻ: chữ số thập phân…» nhưng Làm tròn gần nhất（四捨五入） |
| Target và non-target | Làm tròn; đối chứng/kết quả thiết kế: `T` là số nguyên gần nhất |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-RULE-06

| Field | Value |
| --- | --- |
| Vai trò | Công thức hai dòng; loại dữ liệu nguồn: rule |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Dòng 1: Trung bình（平均点）÷ Số cố định（固定値）2, Chữ số thập phân thứ 1（小数第1位）, Làm tròn xuống（切り捨て） về số nguyên; Dòng 2: Kết quả dòng 1（式の結果 式1）× 0.8, Không xử lý phần lẻ（しない）; Nhỏ hơn（未満）; nguồn mặc định |
| Target và non-target | Cấu hình cố định cho TC-RS-CALC-015; không cho tester chọn phương thức khác trong case này; đối chứng/kết quả thiết kế: `T=floor(A÷2)×0.8`; với `A=61`, `T=24` |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-RULE-07

| Field | Value |
| --- | --- |
| Vai trò | Cặp phân nhánh; loại dữ liệu nguồn: rule |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Ưu tiên 1 "Trung bình từ 60": điều kiện `A≥60`, cố định 30 `&lt;`. Ưu tiên 2 "Trung bình dưới 60": `A&lt;60`, công thức `A×0.5` `&lt;` |
| Target và non-target | Phân nhánh bằng nhiều quy tắc (R18 «đặc tả RC-001 v2» §5.2 «Điều kiện dựa trên trung bình»); đối chứng/kết quả thiết kế: Chọn đúng nhánh theo A thô |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-RULE-08

| Field | Value |
| --- | --- |
| Vai trò | Cặp cùng áp dụng; loại dữ liệu nguồn: rule |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Ưu tiên 1: Toàn bộ, cố định 20 `&lt;`; Ưu tiên 2: Toàn bộ, cố định 30 `&lt;` |
| Target và non-target | First match (R18 «đặc tả RC-001 v2» §4.3 «Chọn quy tắc»); đối chứng/kết quả thiết kế: Luôn dùng ưu tiên 1 |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-RULE-09

| Field | Value |
| --- | --- |
| Vai trò | Tỷ lệ nhóm; loại dữ liệu nguồn: rule |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Điều kiện Tỷ lệ điểm của nhóm（集団の得点率） `≥65%`; cố định 70 `&lt;` |
| Target và non-target | Nguồn tỷ lệ nhóm; đối chứng/kết quả thiết kế: Học sinh 60 đỏ, 80 không đỏ khi khớp |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-RULE-10

| Field | Value |
| --- | --- |
| Vai trò | Công thức âm; loại dữ liệu nguồn: rule |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Dòng 1: Trung bình（平均点）− 20; Nhỏ hơn（未満） |
| Target và non-target | Ngưỡng âm (QAC «Q&amp;A nghiệp vụ đã xác nhận» Q25 «Công thức cho ngưỡng âm thì xử lý thế nào?»); đối chứng/kết quả thiết kế: Với `A=15`: `T=−5` |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-RULE-11

| Field | Value |
| --- | --- |
| Vai trò | Chia cho trung bình; loại dữ liệu nguồn: rule |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Dòng 1: Số cố định（固定値）100 ÷ Trung bình（平均点） |
| Target và non-target | Chia 0 khi chạy; đối chứng/kết quả thiết kế: Với `A=0`: chưa xét được |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-RULE-12

| Field | Value |
| --- | --- |
| Vai trò | Bộ lọc kết hợp; loại dữ liệu nguồn: rule |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Giới hạn bằng bộ lọc（特定条件で絞り込む）: Khối（学年） = 1 hoặc 2; Nhóm thành tích（成績グループ） = Nâng cao; cố định 30 `&lt;` |
| Target và non-target | OR trong loại, AND giữa loại; đối chứng/kết quả thiết kế: Chỉ học sinh khối 1/2 **và** nhóm Nâng cao |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-RULE-13

| Field | Value |
| --- | --- |
| Vai trò | Cố định chưa có ngưỡng; loại dữ liệu nguồn: rule |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Chỉ lưu điều kiện áp dụng, chưa lưu ngưỡng |
| Target và non-target | Hành vi đã xác nhận theo AC-G04/Q34: hiển thị là chưa thiết lập, không tham gia xét và không hồi sinh sau stale-form; enum/schema biểu diễn trạng thái vẫn PROPOSED; đối chứng/kết quả thiết kế: Không tham gia xét; sau xóa và gửi form cũ không xuất hiện lại |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-RULE-14

| Field | Value |
| --- | --- |
| Vai trò | Nhóm tổng hợp hai loại nhóm; loại dữ liệu nguồn: rule |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Giới hạn bằng bộ lọc（特定条件で絞り込む）: nhóm tổng hợp loại K1 = Nâng cao VÀ loại K2 = X; cố định 30 `&lt;` |
| Target và non-target | AND giữa các loại nhóm theo xác nhận Q35; đối chứng/kết quả thiết kế: P7 thuộc cả hai; P5/P6 chỉ thuộc một loại và không áp dụng |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-RULE-15

| Field | Value |
| --- | --- |
| Vai trò | Hai điều kiện cùng rule và phối hợp nguồn; loại dữ liệu nguồn: rule |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Biến thể A: cùng nguồn `A`, `A≥50` AND `A&lt;70`; biến thể R: `R≥50%` AND `R&lt;70%`; biến thể A+R: `A≥50` AND `R≥50%`; rule cố định `T=70`, dấu `&lt;` |
| Target và non-target | AND trong một rule theo xác nhận Q35; reader/source thực tế là căn cứ, fixture không tạo yêu cầu tính nguồn mới; đối chứng/kết quả thiết kế: A: chỉ `50≤A&lt;70`; R: chỉ khi source thực tế nằm trong khoảng; A+R: cả hai đúng mới áp dụng |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-LEGACY-01

| Field | Value |
| --- | --- |
| Vai trò | Ngưỡng cũ qua các đường chuyển cấu hình (cần provision); loại dữ liệu nguồn: legacy fixture, chưa provision |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Ở nguồn trường A/năm 2025/mục Toán/nhóm G-A, `red_score=25` là **ngưỡng cấu hình legacy**, khác rule mới `&lt;30`; ghi identity kỳ/môn/mục/nhóm và ảnh/đọc dữ liệu legacy trước thao tác. Với mỗi đường kế thừa năm, xuất/nhập, khôi phục hoặc sync được hỗ trợ, chuẩn bị một đích riêng có mapping hợp lệ và ban đầu không có ngưỡng legacy/kết quả xét cá nhân; file xuất phải chứa **giá trị 25**, không chỉ tên field/metadata. Ghi bảng đối chiếu nguồn 25 → đích 25, identity đích và nơi đọc báo cáo legacy sau thao tác. S01 nguồn có kết quả cá nhân Đỏ và snapshot nguồn; đích chưa chạy xét mới. DATA-015 dùng cùng giá trị 25 nhưng fixture sao chép riêng ở năm 2026 theo điều kiện của case đó, không dùng lại identity năm 2025. Đây là fixture dự kiến, không khẳng định đường/record đã được provision. |
| Target và non-target | DATA-015…019; AC-G38/G39; đối chứng/kết quả thiết kế: Giữ ngưỡng 25 đúng nghĩa ở nguồn/đích theo đường hiện hữu; không thành rule mới/fallback; đích không nhận snapshot/kết quả cá nhân nguồn. Chưa có seam/mapping của đường nào thì đường đó BLOCKED |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-OUT-01

| Field | Value |
| --- | --- |
| Vai trò | Trích xuất lọc + ký hiệu trước + màu; loại dữ liệu nguồn: output |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Lọc học sinh có điểm đỏ（抽出する） BẬT; ký hiệu đầu（強調記号を接頭に表示する） BẬT, ký hiệu `*`; ký hiệu cuối TẮT; tô màu ô（セルを色付けする） BẬT, màu Đỏ（赤） của bảng màu hiện có |
| Target và non-target | Lọc và trang trí; đối chứng/kết quả thiết kế: Chỉ học sinh có ô đỏ; ô đỏ `*29` nền đỏ |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-OUT-02

| Field | Value |
| --- | --- |
| Vai trò | Trích xuất chỉ ký hiệu; loại dữ liệu nguồn: output |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Lọc TẮT; ký hiệu đầu `※`, ký hiệu cuối `!` |
| Target và non-target | Ký hiệu hai phía, không lọc; đối chứng/kết quả thiết kế: Ô đỏ `※24!`; danh sách không bị lọc |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-OUT-03

| Field | Value |
| --- | --- |
| Vai trò | Công khai; loại dữ liệu nguồn: output |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Hiệu ứng đỏ: `*` phía trước（前に「*」）; Điểm dự kiến（見込点）: Ngoặc（括弧） |
| Target và non-target | Kết hợp hiệu ứng; đối chứng/kết quả thiết kế: S06 hiển thị `(*24)` |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-OUT-04

| Field | Value |
| --- | --- |
| Vai trò | Phiếu điểm; loại dữ liệu nguồn: output |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Dòng Thiết lập điểm đỏ（赤点設定）: Ký tự phía trước（前に任意の文字） `※`; các dòng khác: Nguyên trạng（そのまま表示） |
| Target và non-target | First match; đối chứng/kết quả thiết kế: Ô đỏ `※29` |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-OUT-05

| Field | Value |
| --- | --- |
| Vai trò | Hai cấu hình công khai cùng mục; loại dữ liệu nguồn: output |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Thiết lập công khai thành tích（成績公開設定） X: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» hiệu ứng đỏ Có ngoặc（括弧つき）; cấu hình Y: cùng TD-ITEM-01, hiệu ứng `*` phía trước（前に「*」）; cả hai không bật hiệu ứng Điểm dự kiến（見込点） |
| Target và non-target | Hiệu ứng riêng theo cấu hình (AC-G32 «Cấu hình công khai và ẩn điểm»); đối chứng/kết quả thiết kế: S01 (29, đỏ): X hiển thị `(29)`, Y hiển thị `*29` |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |

### Fixture: TD-OUT-06

| Field | Value |
| --- | --- |
| Vai trò | Công khai có mục thường và đơn vị; loại dữ liệu nguồn: output |
| Phạm vi | Trường/năm/mục/nhóm theo giá trị gốc và case sử dụng; không mở rộng quyền từ alias. |
| Trạng thái | Fixture thiết kế; chỉ coi đã chuẩn bị khi có quan sát đúng build/identity. |
| Giá trị | Cấu hình X: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» (điểm thường（通常）) chọn Có ngoặc; TD-ITEM-03 «Mục điểm đơn vị: Điểm bài kiểm tra đơn vị（単元テスト点）, M mặc định 100» (điểm đơn vị（単元）) chọn `*` phía sau（後ろに「*」） |
| Target và non-target | Không trộn thường/đơn vị; đối chứng/kết quả thiết kế: Mở lại giữ đúng lựa chọn của từng phân loại |
| Tạo | Chuẩn bị qua thao tác hiện hữu được phép theo giá trị trên; đường chưa rõ cần xác minh, không tự thực thi SQL hoặc dựng route. |
| Kiểm tra | Đọc lại identity và giá trị của target/non-target trước lượt chạy; thiếu phép đọc đáng tin thì giữ gap chuẩn bị. |
| Reset | Khôi phục fixture theo baseline của case bằng đường được phép; biến thể độc lập không dùng trạng thái của lượt trước. |
