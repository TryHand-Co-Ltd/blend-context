# Test cases RC-001 v2

# Kịch bản kiểm thử (Test Scenario)

Mỗi kịch bản gom các test case cùng mục tiêu. Ký hiệu `TC-RS-FUNC-001…007` nghĩa là các case từ 001 đến 007 liên tiếp. Mỗi test case thuộc ít nhất một kịch bản (được kiểm bằng script khi sinh [scope-and-approach.vi.md — coverage](scope-and-approach.vi.md) «Ma trận truy vết（Traceability Matrix）»).

Nguồn: R18 «đặc tả RC-001 v2» = [đặc tả RC-001 v2](../specification.vi.md); QAC «Q&A nghiệp vụ đã xác nhận» = [Q&A đã xác nhận](../../../sources/confirmed-business-qa.vi.md); RSD-AC «tiêu chí nghiệm thu v2»/RSD-DB/RSD-TASK = [tài liệu RC-001](../) (xem [scope-and-approach.vi.md §2](scope-and-approach.vi.md) «Nguồn làm chuẩn và thứ tự ưu tiên»). Trạng thái chắc chắn của từng case ghi trong file case.

## 1. Danh sách kịch bản

| Scenario ID | Kịch bản | Mục tiêu kiểm | Nguồn chính | Test case |
| --- | --- | --- | --- | --- |
| TS-RS-001 | Quản lý danh sách quy tắc đỏ của một mục | Thêm, sửa, xóa, đổi thứ tự, quay lại không lưu; màn danh sách | R18 «đặc tả RC-001 v2» §4 «Danh sách thiết lập và thứ tự ưu tiên» | TC-RS-FUNC-001…007 «case», TC-RS-FUNC-014, TC-RS-FUNC-033, TC-RS-VAL-014, TC-RS-VAL-016, TC-RS-DATA-001, TC-RS-DATA-004, TC-RS-UI-001…007 «case» |
| TS-RS-002 | Điều kiện áp dụng | Toàn bộ đối tượng, bộ lọc kế thừa tính tự động, phân nhánh theo trung bình/tỷ lệ nhóm | R18 «đặc tả RC-001 v2» §5.1 «Đối tượng áp dụng»–§5.3 «Tỷ lệ nhóm» | TC-RS-FUNC-008…010 «case», TC-RS-BR-004, TC-RS-BR-005, TC-RS-BR-029, TC-RS-BR-035, TC-RS-BR-041, TC-RS-VAL-015, TC-RS-VAL-022, TC-RS-UI-008…010 «case» |
| TS-RS-003 | Ngưỡng điểm cố định | Nhập, kiểm `0≤N≤M`, dấu so sánh, `T=N` không đổi khi M đổi | R18 «đặc tả RC-001 v2» §6.1 «Thành phần chung của màn ngưỡng»–§6.2 «Ngưỡng cố định»; QAC «Q&A nghiệp vụ đã xác nhận» Q4 «Điểm bằng ngưỡng có bị xét đỏ không?» | TC-RS-FUNC-011, TC-RS-FUNC-013, TC-RS-VAL-001…005 «case», TC-RS-CALC-001…004 «case», TC-RS-UI-011…013 «case» |
| TS-RS-004 | Ngưỡng tỷ lệ điểm tối đa | `T=M×N/100` với M hiện hành, xử lý phần lẻ, M không hợp lệ | R18 «đặc tả RC-001 v2» §2.4 «Phân giải điểm tối đa», §6.3 «Tỷ lệ điểm tối đa»; QAC «Q&A nghiệp vụ đã xác nhận» Q23 «Khi xét tỷ lệ điểm, dùng điểm tối đa nào?», Q24 «Tỷ lệ điểm tối đa có cho chọn xử lý phần lẻ không?» | TC-RS-VAL-006, TC-RS-VAL-007, TC-RS-CALC-005…012 «case», TC-RS-UI-014 |
| TS-RS-005 | Ngưỡng công thức | Dòng công thức, tham chiếu dòng, làm tròn, ngưỡng âm/vượt M, chia 0, độ chính xác số | R18 «đặc tả RC-001 v2» §6.4 «Công thức dùng trung bình»–§6.6 «Ngưỡng âm và cảnh báo biên», §6.8 «Yêu cầu độ chính xác»; QAC «Q&A nghiệp vụ đã xác nhận» Q6 «Ngưỡng dùng trung bình có chỉ gồm hai công thức cố định không?», Q25 «Công thức cho ngưỡng âm thì xử lý thế nào?» | TC-RS-FUNC-012, TC-RS-VAL-008…013 «case», TC-RS-VAL-019…021 «case», TC-RS-VAL-023, TC-RS-CALC-013…021 «case», TC-RS-CALC-028…030 «case», TC-RS-UI-015…017 «case» |
| TS-RS-006 | Chọn quy tắc và phân nhánh | Khớp đầu tiên, không áp dụng, không chuyển xuống khi thiếu dữ liệu, biên nhánh dùng giá trị trước làm tròn | R18 «đặc tả RC-001 v2» §4.3 «Chọn quy tắc», §5.2 «Điều kiện dựa trên trung bình»; QAC «Q&A nghiệp vụ đã xác nhận» Q22 «Cơ chế công thức và ưu tiên nào đã có để tham chiếu?», Q26 «Đã xét lại nhưng không tạo được ngưỡng hợp lệ thì dùng kết quả cũ không?», Q27 «Xét lại xong mà không còn thiết lập áp dụng thì làm gì?» | TC-RS-BR-001…003 «case», TC-RS-BR-036, TC-RS-CALC-022…025 «case» |
| TS-RS-007 | Nguồn trung bình và tỷ lệ nhóm | Ưu tiên bản chốt, không fallback, nhóm tham chiếu theo thiết lập tổng hợp hiện hữu, quy trình nút xanh → nút cam | R18 «đặc tả RC-001 v2» §5.3 «Tỷ lệ nhóm»–§5.5 «Chọn bản nguồn», §7.4 «Quy trình vận hành khi dùng trung bình/tỷ lệ nhóm»; QAC «Q&A nghiệp vụ đã xác nhận» Q8 «Trung bình dùng để chọn nhánh là trước hay sau làm tròn?», Q9 «Lấy trung bình của nhóm nào và kết quả tổng hợp nào?», Q31 «Tỷ lệ nhóm có cần xử lý riêng khi các lớp khác điểm tối đa không?», Q32 «Nhóm tham chiếu phía điểm đỏ có tuân theo thiết lập tổng hợp hiện hữu không?…», Q33 «Ba loại nhóm cấu hình có xuất hiện ngoài khối/HR/lớp học không?» | TC-RS-FUNC-015, TC-RS-FUNC-034, TC-RS-BR-006…011 «case», TC-RS-BR-028, TC-RS-BR-034, TC-RS-CALC-026, TC-RS-CALC-027, TC-RS-CALC-031, TC-RS-CALC-032, TC-RS-VAL-024, TC-RS-ERR-016, TC-RS-FUNC-036, TC-RS-BR-038…040 «case», TC-RS-VAL-025 |
| TS-RS-008 | Điểm được xét | Điểm cuối đã lưu, điểm dự kiến, sửa tay, chưa dự thi, ô trống, điểm đơn vị | R18 «đặc tả RC-001 v2» §2.2 «Một ô điểm được nhận diện như thế nào?», §7.1 «Trình tự cho một ô»; QAC «Q&A nghiệp vụ đã xác nhận» Q2 «Những loại điểm nào thuộc đối tượng?», Q3 «Dùng điểm nào để xét, và phân biệt điểm 0 với ô trống thế nào?» | TC-RS-BR-012…014 «case», TC-RS-BR-030, TC-RS-CALC-030, TC-RS-REG-003 |
| TS-RS-009 | Thời điểm xét và vòng đời kết quả | Trigger đăng ký/batch; lưu cấu hình không xét; ngừng/giữ kết quả cũ; xóa điểm; tạo lại ô | R18 «đặc tả RC-001 v2» §7.2 «Bảng sự kiện»–§7.3 «Thay đổi điểm tối đa», §8.2 «Bảng chuyển trạng thái»; QAC «Q&A nghiệp vụ đã xác nhận» Q10 «Điều kiện nào không cần nguồn trung bình?»–Q15 «Thiếu dữ liệu xét có chặn công khai hoặc phát hành không?», Q28 «Xóa thiết lập cuối cùng thì dấu đỏ mất ngay hay chờ chạy lại?» | TC-RS-FUNC-016…021 «case», TC-RS-FUNC-035, TC-RS-BR-015…024 «case», TC-RS-BR-027, TC-RS-BR-037, TC-RS-ERR-012, TC-RS-ERR-015 |
| TS-RS-010 | Trạng thái kết quả và lỗi | Sáu trạng thái, lỗi kỹ thuật, batch một phần, xếp hàng, thông báo, cập nhật đồng thời | R18 «đặc tả RC-001 v2» §7.5 «Phạm vi một lượt và thứ tự hoàn tất», §8 «Trạng thái kết quả và xử lý lỗi»; QAC «Q&A nghiệp vụ đã xác nhận» Q21 «Xử lý hiện có có bảo đảm cả lượt hàng loạt cùng thành công hoặc cùng thất bại…»; RSD-AC «tiêu chí nghiệm thu v2» AC-G03 «Nhận diện ô điểm», AC-G22 «Kết quả chung và thứ tự cập nhật», AC-G27 «Batch hoàn tất một phần»; CTX «context chuẩn điểm đỏ» §9.6 «Ba phản hồi review DB và bài học thiết kế ngày 28/09» | TC-RS-ERR-001…005 «case», TC-RS-ERR-011, TC-RS-VAL-016, TC-RS-UI-018, TC-RS-UI-019, TC-RS-ERR-018, TC-RS-ERR-019 |
| TS-RS-011 | Quyền và kiểm tra phía server | Quyền sửa mục, quyền chạy, giả mạo ID, dữ liệu client, hiển thị an toàn tên/ký hiệu, học sinh/phụ huynh | R18 «đặc tả RC-001 v2» §1.3 «Quyền sử dụng», §9.3 «Xuất file»; QAC «Q&A nghiệp vụ đã xác nhận» Q1 «Ai được thiết lập điều kiện điểm đỏ?» | TC-RS-BR-031…033 «case», TC-RS-ERR-006…010 «case», TC-RS-ERR-017, TC-RS-REG-015 |
| TS-RS-012 | Trích xuất thành tích（成績抽出） | Tùy chọn đỏ, lọc theo phạm vi, ký hiệu/màu từng ô, Excel khớp màn | R18 «đặc tả RC-001 v2» §9 «Trích xuất thành tích（成績抽出）»; QAC «Q&A nghiệp vụ đã xác nhận» Q16 «Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?» | TC-RS-FUNC-022…025 «case», TC-RS-VAL-017, TC-RS-UI-020, TC-RS-UI-021, TC-RS-ERR-013, TC-RS-REG-006 |
| TS-RS-013 | Công khai thành tích（成績公開） | Ba hiệu ứng (lưu riêng theo từng cấu hình công khai), lựa chọn thường/đơn vị độc lập, kết hợp với Điểm dự kiến（見込点）, web/API/PDF, không chặn công khai, điểm ẩn | R18 «đặc tả RC-001 v2» §10 «Công khai thành tích（成績公開）»; QAC «Q&A nghiệp vụ đã xác nhận» Q16 «Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?», Q30 «Công khai thành tích kết hợp điểm dự kiến và điểm đỏ thế nào?»; Q38 ngày 30/09; RSD-AC «tiêu chí nghiệm thu v2» AC-G32 «Cấu hình công khai và ẩn điểm»; CTX «context chuẩn điểm đỏ» §9.6 «Ba phản hồi review DB và bài học thiết kế ngày 28/09» | TC-RS-FUNC-026…028 «case», TC-RS-BR-025, TC-RS-UI-022, TC-RS-UI-023, TC-RS-UI-026, TC-RS-REG-007, TC-RS-REG-008, TC-RS-FUNC-037 |
| TS-RS-014 | Công cụ phiếu điểm（通知表ツール） và PDF | Bốn cách hiển thị, khớp đầu tiên, lưu qua Cập nhật（更新する）, sao chép mẫu, bố cục PDF | R18 «đặc tả RC-001 v2» §11 «Công cụ phiếu điểm（通知表ツール） và PDF»; QAC «Q&A nghiệp vụ đã xác nhận» Q29 «Điều kiện điểm đỏ nằm ở đâu trên phiếu điểm?» | TC-RS-FUNC-029…031 «case», TC-RS-VAL-018, TC-RS-UI-024, TC-RS-DATA-010, TC-RS-REG-009, TC-RS-REG-010 |
| TS-RS-015 | Ba đầu ra dùng chung một kết quả | Cùng ô cho cùng kết luận; xem/xuất không xét lại; điểm ẩn không bị lộ | R18 «đặc tả RC-001 v2» §1.1 «Mục tiêu», §7.1 «Trình tự cho một ô» bước 7; QAC «Q&A nghiệp vụ đã xác nhận» Q10 «Điều kiện nào không cần nguồn trung bình?», Q16 «Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?» | TC-RS-FUNC-032, TC-RS-BR-024, TC-RS-ERR-001, TC-RS-ERR-014 |
| TS-RS-016 | Dữ liệu và dữ liệu đỏ cũ | Lưu kết quả theo ô, trạng thái, không ghi điểm, cấu hình đầu ra riêng, sao chép, schema, `red_score` | R18 «đặc tả RC-001 v2» §12 «Dữ liệu, tích hợp và bảo toàn chức năng cũ»; RSD-DB «thiết kế DB v2 đề xuất» §3 «Dữ liệu JSON», §5 «Hiệu ứng theo cấu hình công khai», §6 «Phương thức xử lý cập nhật đồng thời» | TC-RS-DATA-002, TC-RS-DATA-003, TC-RS-DATA-005…009 «case», TC-RS-DATA-011, TC-RS-DATA-012, TC-RS-DATA-013 |
| TS-RS-017 | Phạm vi phát hành | Loại chưa chọn không hiện như đang hoạt động; mục không phải số không có quy tắc | R18 «đặc tả RC-001 v2» §1.2 «Phạm vi thiết kế», §1.4 «Ranh giới giữa thiết kế đầy đủ và phạm vi triển khai», §13.1 «Điều kiện triển khai và kiểm chứng» | TC-RS-FUNC-002, TC-RS-UI-025 |
| TS-RS-018 | Hồi quy AutoRating và các luồng hiện có | Điểm tự động, nút chạy, đăng ký điểm, các màn điểm tối đa, màn Thiết lập ô nhập（入力欄設定）, hiệu năng | R18 «đặc tả RC-001 v2» §12.2 «Điểm tích hợp chính» | TC-RS-REG-001…005 «case», TC-RS-REG-013, TC-RS-REG-014, TC-RS-REG-016, TC-RS-REG-017 |
| TS-RS-019 | Luồng đầu–cuối（end-to-end） | Cấu hình → đăng ký điểm → ba đầu ra, rồi đổi cấu hình → chạy lại → ba đầu ra | R18 «đặc tả RC-001 v2» §7 «Quy trình xét và thời điểm cập nhật», §9 «Trích xuất thành tích（成績抽出）»–§11 «Công cụ phiếu điểm（通知表ツール） và PDF» | TC-RS-FUNC-004, TC-RS-FUNC-016, TC-RS-FUNC-023, TC-RS-FUNC-026, TC-RS-FUNC-029, TC-RS-FUNC-032, TC-RS-BR-015, TC-RS-BR-019 |

## 2. Thứ tự chạy đề xuất

1. **Chuẩn bị:** tạo dữ liệu [test-data.vi.md](test-data.vi.md) «Đặc tả dữ liệu test», chụp baseline cho TS-RS-018 «Hồi quy AutoRating và các luồng hiện có» và các case REG trước khi tạo quy tắc đỏ.
2. **Cấu hình:** TS-RS-001 «Quản lý danh sách quy tắc đỏ của một mục» → TS-RS-005 «Ngưỡng công thức», TS-RS-017 «Phạm vi phát hành».
3. **Xét:** TS-RS-006 «Chọn quy tắc và phân nhánh» → TS-RS-009 «Thời điểm xét và vòng đời kết quả».
4. **Đầu ra:** TS-RS-012 «Trích xuất thành tích（成績抽出）» → TS-RS-015 «Ba đầu ra dùng chung một kết quả».
5. **Lỗi, quyền, dữ liệu:** TS-RS-010 «Trạng thái kết quả và lỗi», TS-RS-011 «Quyền và kiểm tra phía server», TS-RS-016 «Dữ liệu và dữ liệu đỏ cũ».
6. **Hồi quy và đầu–cuối:** TS-RS-018, TS-RS-019 «Luồng đầu–cuối（end-to-end）».

Case có Status khác CONFIRMED/IMPLEMENTED vẫn chạy; phần chưa chắc chắn ghi hành vi thực tế, không đánh FAIL (nhãn ở [scope-and-approach.vi.md §3](scope-and-approach.vi.md) «Nhãn trạng thái của test case»).


## Case theo nghiệp vụ

<a id="tc-rs-func-001"></a>

### TC-RS-FUNC-001 — Hàng Thiết lập điểm đỏ（赤点設定） xuất hiện trong Thiết lập ô nhập（入力欄設定） cho mục điểm số

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kiểu điểm được hỗ trợ” (AC-G02 «Kiểu điểm được hỗ trợ»)

<!-- Mã truy vết: TD-ROLE-01 «Giáo viên có quyền sửa mục: Có quyền vào Thiết lập nhập điểm（成績入力設定） và…», TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-ITEM-02 «Mục số thập phân: Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc…», TD-ENV-01 «Môi trường chạy, Trường test, Năm học», TD-ITEM-03 «Mục điểm đơn vị: Điểm bài kiểm tra đơn vị（単元テスト点）, M mặc định 100», TC-RS-UI-001 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Đăng nhập tài khoản giáo viên có quyền sửa mục. Chưa có quy tắc đỏ cho mục số nguyên (M=100); mục số thập phân (M=100) có ít nhất một quy tắc.
- Dữ liệu test: môi trường test (trường A, năm học 2026), tài khoản giáo viên có quyền sửa mục, mục số nguyên (M=100), mục số thập phân (M=100), mục điểm đơn vị (đơn vị U1 có M riêng 40)

**操作（Thao tác）**

1. Mở Thiết lập nhập điểm（成績入力設定）→ Thiết lập ô nhập（入力欄設定） của kỳ 1学期期末 (cuối kỳ học kỳ 1).
2. Tìm hàng Thiết lập điểm đỏ（赤点設定） ở bảng mục nhập.
3. Bấm link của hàng này ở cột mục số nguyên (M=100), mục số thập phân (M=100), mục điểm đơn vị (đơn vị U1 có M riêng 40).

**期待結果（Kết quả mong đợi）**

1. Hàng Thiết lập điểm đỏ（赤点設定） nằm giữa hàng Tính tự động（自動計算） và hàng Thiết lập ẩn mục nhập（入力項目の非表示設定）.
2. Có thao tác mở thiết lập cho mục số nguyên, số thập phân và điểm đơn vị.
3. Bấm link chuyển sang màn danh sách Thiết lập điểm đỏ（赤点設定） của đúng mục.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Đăng nhập tài khoản giáo viên có quyền sửa mục. Chưa có quy tắc đỏ cho mục số nguyên (M=100); mục số thập phân (M=100) có ít nhất một quy tắc. - Dữ liệu test: môi trường test (trường A, năm học 2026), tài khoản giáo viên có quyền sửa mục, mục số nguyên (M=100), mục số thập phân (M=100), mục điểm đơn vị (đơn vị U1 có M riêng 40) | Trigger/điểm quan sát: 1. Mở Thiết lập nhập điểm（成績入力設定）→ Thiết lập ô nhập（入力欄設定） của kỳ 1学期期末 (cuối kỳ học kỳ 1). 2. Tìm hàng Thiết lập điểm đỏ（赤点設定） ở bảng mục nhập. 3. Bấm link của hàng này ở cột mục số nguyên (M=100), mục số thập phân (M=100), mục điểm đơn vị (đơn vị U1 có M riêng 40). | Oracle/bằng chứng: 1. Hàng Thiết lập điểm đỏ（赤点設定） nằm giữa hàng Tính tự động（自動計算） và hàng Thiết lập ẩn mục nhập（入力項目の非表示設定）. 2. Có thao tác mở thiết lập cho mục số nguyên, số thập phân và điểm đơn vị. 3. Bấm link chuyển sang màn danh sách Thiết lập điểm đỏ（赤点設定） của đúng mục.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 4.1 “Điểm vào và trạng thái trống”; [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Những loại điểm nào thuộc đối tượng?” (Q2 «Những loại điểm nào thuộc đối tượng?»); Figma MW “màn Thiết lập ô nhập（入力欄設定）, lối vào điểm đỏ” (58:9629 «Figma MW: màn Thiết lập ô nhập（入力欄設定）, lối vào điểm đỏ») (UI｜01 入力欄設定 «Figma: màn Thiết lập ô nhập（入力欄設定）, lối vào điểm đỏ — MW 58:9629»), (58:9848–9870), ghi chú (58:9902) 「ここが新規：赤点設定」 (chỗ này là mới: thiết lập điểm đỏ)
- Bằng chứng cần chụp: Ảnh màn Thiết lập ô nhập（入力欄設定） thấy vị trí hàng; ảnh màn danh sách sau khi bấm link cho từng mục.
- Sau khi chạy: Không thay đổi dữ liệu.
- Ghi chú: Nhãn trạng thái trên hàng (chưa thiết lập/đã thiết lập) kiểm ở case “Nhãn trạng thái ở hàng Thiết lập điểm đỏ（赤点設定） trong Thiết lập ô nhập（入力欄設定）”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-002"></a>

### TC-RS-FUNC-002 — Mục kiểu lựa chọn và Đạt/không đạt（合否） không có thao tác tạo quy tắc đỏ có hiệu lực

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kiểu điểm được hỗ trợ” (AC-G02 «Kiểu điểm được hỗ trợ»); tiêu chí nghiệm thu “Phạm vi từng đợt” (AC-G40 «Phạm vi từng đợt»)

<!-- Mã truy vết: TD-ROLE-01 «Giáo viên có quyền sửa mục: Có quyền vào Thiết lập nhập điểm（成績入力設定） và…», TD-ITEM-04 «Mục lựa chọn: Kiểu lựa chọn（選択肢型） A/B/C», TD-ITEM-05 «Mục đạt/không đạt: Đạt/không đạt（合否）», TC-RS-UI-001 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Đăng nhập tài khoản giáo viên có quyền sửa mục.
- Dữ liệu test: mục kiểu lựa chọn A/B/C, mục Đạt/không đạt（合否）

**操作（Thao tác）**

1. Mở Thiết lập ô nhập（入力欄設定）.
2. Xem hàng Thiết lập điểm đỏ（赤点設定） ở cột mục kiểu lựa chọn A/B/C, mục Đạt/không đạt（合否）.
3. Thử mở URL màn danh sách điểm đỏ của mục kiểu lựa chọn A/B/C bằng ID mục (nếu biết URL).

**期待結果（Kết quả mong đợi）**

1. Không có thao tác tạo quy tắc đỏ có hiệu lực cho hai mục này.
2. Truy cập trực tiếp không cho tạo/lưu quy tắc cho mục không thuộc loại số.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Đăng nhập tài khoản giáo viên có quyền sửa mục. - Dữ liệu test: mục kiểu lựa chọn A/B/C, mục Đạt/không đạt（合否） | Trigger/điểm quan sát: 1. Mở Thiết lập ô nhập（入力欄設定）. 2. Xem hàng Thiết lập điểm đỏ（赤点設定） ở cột mục kiểu lựa chọn A/B/C, mục Đạt/không đạt（合否）. 3. Thử mở URL màn danh sách điểm đỏ của mục kiểu lựa chọn A/B/C bằng ID mục (nếu biết URL). | Oracle/bằng chứng: 1. Không có thao tác tạo quy tắc đỏ có hiệu lực cho hai mục này. 2. Truy cập trực tiếp không cho tạo/lưu quy tắc cho mục không thuộc loại số.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Những loại điểm nào thuộc đối tượng?” (Q2 «Những loại điểm nào thuộc đối tượng?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 1.2 “Phạm vi thiết kế”, mục 4.1 “Điểm vào và trạng thái trống”; Figma MW “màn Thiết lập ô nhập（入力欄設定）, lối vào điểm đỏ” (58:9861–9867 «Figma MW: màn Thiết lập ô nhập（入力欄設定）, lối vào điểm đỏ») (ô 「—」 trên hàng 赤点設定 (thiết lập điểm đỏ)), ghi chú “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9455 «Figma MW: chương 01 – lối vào, danh sách, xóa thiết lập») 「A/B/C・合否は初版対象外」 (A/B/C và đạt/không đạt ngoài bản đầu)
- Bằng chứng cần chụp: Ảnh hàng Thiết lập điểm đỏ（赤点設定） ở hai cột; ảnh/phản hồi khi truy cập trực tiếp.
- Sau khi chạy: Không có quy tắc nào được tạo cho mục kiểu lựa chọn A/B/C/05.
- Ghi chú: Cách hiển thị ô (Figma dùng 「—」) là thiết kế, kiểm ở case “Nhãn trạng thái ở hàng Thiết lập điểm đỏ（赤点設定） trong Thiết lập ô nhập（入力欄設定）”. URL màn mới chưa định nghĩa.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-004"></a>

### TC-RS-FUNC-004 — Thêm quy tắc qua Điều kiện áp dụng（適用条件） và Ngưỡng（基準設定） rồi quay lại danh sách

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04 «Lưu và mở lại nhiều thiết lập»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-08 «Cặp cùng áp dụng: Ưu tiên 1: Toàn bộ, cố định 20 `<`», TD-ROLE-01 «Giáo viên có quyền sửa mục: Có quyền vào Thiết lập nhập điểm（成績入力設定） và…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) đã có cặp quy tắc cùng áp dụng (dưới 20 và dưới 30) (2 quy tắc). Đăng nhập tài khoản giáo viên có quyền sửa mục.
- Dữ liệu test: mục số nguyên (M=100), cặp quy tắc cùng áp dụng (dưới 20 và dưới 30); quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

1. Ở danh sách, bấm Thêm thiết lập chi tiết（詳細設定の追加）.
2. Nhập Tên thiết lập（設定名称） "Cố định 30", chọn Toàn bộ đối tượng（全員が対象）, bấm Cập nhật（更新する）.
3. Mở Ngưỡng, chọn Điểm cố định（固定点数）, nhập 30, chọn Nhỏ hơn（未満）, bấm Cập nhật（更新する）.
4. Xem danh sách.

**期待結果（Kết quả mong đợi）**

1. Sau mỗi lần cập nhật, màn quay về danh sách.
2. Dòng mới hiện tên, tóm tắt điều kiện "toàn bộ" và ngưỡng "Điểm cố định: 30 điểm, Nhỏ hơn" đúng với dữ liệu đã lưu.
3. **PROPOSED (đặc tả v2 mục 4.4 “Lưu, đổi thứ tự và xóa”):** dòng mới nằm sau các quy tắc đã có.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) đã có cặp quy tắc cùng áp dụng (dưới 20 và dưới 30) (2 quy tắc). Đăng nhập tài khoản giáo viên có quyền sửa mục. - Dữ liệu test: mục số nguyên (M=100), cặp quy tắc cùng áp dụng (dưới 20 và dưới 30); quy tắc “Cố định 30” (dưới 30) | Trigger/điểm quan sát: 1. Ở danh sách, bấm Thêm thiết lập chi tiết（詳細設定の追加）. 2. Nhập Tên thiết lập（設定名称） "Cố định 30", chọn Toàn bộ đối tượng（全員が対象）, bấm Cập nhật（更新する）. 3. Mở Ngưỡng, chọn Điểm cố định（固定点数）, nhập 30, chọn Nhỏ hơn（未満）, bấm Cập nhật（更新する）. 4. Xem danh sách. | Oracle/bằng chứng: 1. Sau mỗi lần cập nhật, màn quay về danh sách. 2. Dòng mới hiện tên, tóm tắt điều kiện "toàn bộ" và ngưỡng "Điểm cố định: 30 điểm, Nhỏ hơn" đúng với dữ liệu đã lưu. 3. **PROPOSED (đặc tả v2 mục 4.4 “Lưu, đổi thứ tự và xóa”):** dòng mới nằm sau các quy tắc đã có.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 3 “Bản đồ màn hình và luồng thao tác” (luồng chuẩn), mục 4.2 “Nội dung một dòng”, mục 4.4 “Lưu, đổi thứ tự và xóa”; Figma MW “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9459 «Figma MW: chương 01 – lối vào, danh sách, xóa thiết lập») 「追加後に適用条件と基準を入力。各詳細の更新後は01-Bへ戻る。」 (sau khi thêm thì nhập điều kiện và ngưỡng; cập nhật xong quay về “chương 01, khung B – danh sách thứ tự ưu tiên thiết lập điểm đỏ” (01-B «Figma: chương 01, khung B – danh sách thứ tự ưu tiên thiết lập điểm đỏ — MW 58:9903»))
- Bằng chứng cần chụp: Ảnh danh sách trước/sau; ảnh từng màn sau khi bấm Cập nhật（更新する）.
- Sau khi chạy: mục số nguyên (M=100) có 3 quy tắc.
- Ghi chú: Vị trí dòng mới là đề xuất, không phải must-pass.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-005"></a>

### TC-RS-FUNC-005 — Nhiều quy tắc hiển thị theo ưu tiên; đổi thứ tự bằng ▲▼ được lưu

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04 «Lưu và mở lại nhiều thiết lập»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-RULE-08 «Cặp cùng áp dụng: Ưu tiên 1: Toàn bộ, cố định 20 `<`», TC-RS-BR-015 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có 3 quy tắc tên quy tắc 1, quy tắc 2, quy tắc 3 (tên tạm trong case) theo thứ tự.
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), cặp quy tắc cùng áp dụng (dưới 20 và dưới 30)

**操作（Thao tác）**

1. Bấm ▼ ở quy tắc 1.
2. Tải lại trang.
3. Bấm ▲ ở quy tắc 3.
4. Đăng xuất, đăng nhập lại, mở danh sách.

**期待結果（Kết quả mong đợi）**

1. Sau bước 1 thứ tự là quy tắc 2, quy tắc 1, quy tắc 3 và giữ nguyên sau khi tải lại.
2. Sau bước 3 thứ tự là quy tắc 2, quy tắc 3, quy tắc 1 và giữ nguyên khi mở lại.
3. Đổi thứ tự không làm thay kết quả đỏ hiện có (kiểm ở case “Lưu cấu hình không xét; kết quả trước giữ tới lần chạy lại”).

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) có 3 quy tắc tên quy tắc 1, quy tắc 2, quy tắc 3 (tên tạm trong case) theo thứ tự. - Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), cặp quy tắc cùng áp dụng (dưới 20 và dưới 30) | Trigger/điểm quan sát: 1. Bấm ▼ ở quy tắc 1. 2. Tải lại trang. 3. Bấm ▲ ở quy tắc 3. 4. Đăng xuất, đăng nhập lại, mở danh sách. | Oracle/bằng chứng: 1. Sau bước 1 thứ tự là quy tắc 2, quy tắc 1, quy tắc 3 và giữ nguyên sau khi tải lại. 2. Sau bước 3 thứ tự là quy tắc 2, quy tắc 3, quy tắc 1 và giữ nguyên khi mở lại. 3. Đổi thứ tự không làm thay kết quả đỏ hiện có (kiểm ở case “Lưu cấu hình không xét; kết quả trước giữ tới lần chạy lại”).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Một mục đánh giá có một hay nhiều thiết lập điểm đỏ?” (Q5 «Một mục đánh giá có một hay nhiều thiết lập điểm đỏ?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 4.2 “Nội dung một dòng”, mục 4.4 “Lưu, đổi thứ tự và xóa”; Figma MW “màn danh sách thiết lập điểm đỏ” (58:10053–10155 «Figma MW: màn danh sách thiết lập điểm đỏ») (cột 優先順位 (thứ tự ưu tiên) ▲▼), “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9461 «Figma MW: chương 01 – lối vào, danh sách, xóa thiết lập») 「▲▼で順序を保存。」 (lưu thứ tự bằng ▲▼)
- Bằng chứng cần chụp: Ảnh danh sách sau mỗi bước.
- Sau khi chạy: Thứ tự mới đã lưu.
- Ghi chú: Nút ▲ ở dòng đầu/▼ ở dòng cuối: hành vi chưa quy định (AutoRating hiện không kiểm biên); ghi nhận hiện trạng.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-006"></a>

### TC-RS-FUNC-006 — Xóa một quy tắc có xác nhận; Hủy（キャンセル） giữ nguyên

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04 «Lưu và mở lại nhiều thiết lập»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-08 «Cặp cùng áp dụng: Ưu tiên 1: Toàn bộ, cố định 20 `<`», TC-RS-BR-019, TC-RS-UI-006 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có 2 quy tắc.
- Dữ liệu test: mục số nguyên (M=100); cặp quy tắc cùng áp dụng (dưới 20 và dưới 30)

**操作（Thao tác）**

1. Bấm Xóa（削除） ở quy tắc thứ 2, chọn Hủy（キャンセル）.
2. Bấm Xóa（削除） lại, chọn Xóa（削除する）.

**期待結果（Kết quả mong đợi）**

1. Hộp xác nhận nêu thiết lập sẽ bị xóa và kết quả học sinh chỉ cập nhật ở lần xét tiếp theo.
2. Hủy: danh sách giữ 2 quy tắc.
3. Xóa: danh sách còn 1 quy tắc; kết quả đỏ hiện có không đổi cho tới lần xét tiếp theo (case “Xóa quy tắc cuối: giữ kết quả tới lần chạy lại; chạy lại → Không áp dụng”).

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) có 2 quy tắc. - Dữ liệu test: mục số nguyên (M=100); cặp quy tắc cùng áp dụng (dưới 20 và dưới 30) | Trigger/điểm quan sát: 1. Bấm Xóa（削除） ở quy tắc thứ 2, chọn Hủy（キャンセル）. 2. Bấm Xóa（削除） lại, chọn Xóa（削除する）. | Oracle/bằng chứng: 1. Hộp xác nhận nêu thiết lập sẽ bị xóa và kết quả học sinh chỉ cập nhật ở lần xét tiếp theo. 2. Hủy: danh sách giữ 2 quy tắc. 3. Xóa: danh sách còn 1 quy tắc; kết quả đỏ hiện có không đổi cho tới lần xét tiếp theo (case “Xóa quy tắc cuối: giữ kết quả tới lần chạy lại; chạy lại → Không áp dụng”).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 4.4 “Lưu, đổi thứ tự và xóa”; Figma MW “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9540–9625 «Figma MW: chương 01 – lối vào, danh sách, xóa thiết lập») (hộp xác nhận xóa)
- Bằng chứng cần chụp: Ảnh hộp xác nhận; ảnh danh sách sau Hủy và sau Xóa.
- Sau khi chạy: Còn 1 quy tắc.
- Ghi chú: Nội dung hộp xác nhận khi xóa quy tắc cuối cùng: case “Hộp xác nhận khi xóa quy tắc cuối”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-007"></a>

### TC-RS-FUNC-007 — Quay lại（戻る）/hủy chỉnh sửa không lưu dữ liệu đang nhập

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04 «Lưu và mở lại nhiều thiết lập»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30).
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

1. Mở Ngưỡng của quy tắc “Cố định 30” (dưới 30), đổi 30 thành 35 và đổi sang Nhỏ hơn hoặc bằng（以下）.
2. Bấm Quay lại（戻る）.
3. Mở Điều kiện áp dụng, đổi tên, bấm Quay lại（戻る）.
4. Mở lại hai màn.

**期待結果（Kết quả mong đợi）**

Danh sách và hai màn vẫn hiện giá trị đã lưu trước đó (30, Nhỏ hơn, tên cũ).

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30). - Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30) | Trigger/điểm quan sát: 1. Mở Ngưỡng của quy tắc “Cố định 30” (dưới 30), đổi 30 thành 35 và đổi sang Nhỏ hơn hoặc bằng（以下）. 2. Bấm Quay lại（戻る）. 3. Mở Điều kiện áp dụng, đổi tên, bấm Quay lại（戻る）. 4. Mở lại hai màn. | Oracle/bằng chứng: Danh sách và hai màn vẫn hiện giá trị đã lưu trước đó (30, Nhỏ hơn, tên cũ).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 4.4 “Lưu, đổi thứ tự và xóa”; Figma MW “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9461 «Figma MW: chương 01 – lối vào, danh sách, xóa thiết lập») 「戻る操作は未保存の入力を保存しない。」 (thao tác quay lại không lưu input chưa lưu), “chương 03 – ngưỡng, công thức, trạng thái nhập” (58:8712 «Figma MW: chương 03 – ngưỡng, công thức, trạng thái nhập»)
- Bằng chứng cần chụp: Ảnh danh sách trước/sau; ảnh màn mở lại.
- Sau khi chạy: Cấu hình không đổi.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-008"></a>

### TC-RS-FUNC-008 — Điều kiện áp dụng: Toàn bộ đối tượng hoặc giới hạn bằng bộ lọc kế thừa từ tính tự động

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05 «Đối tượng áp dụng và nhu cầu nguồn»)

<!-- Mã truy vết: TD-ROLE-01 «Giáo viên có quyền sửa mục: Có quyền vào Thiết lập nhập điểm（成績入力設定） và…», TD-GRP-01 «Lớp học phần: G-A (Toán I（数学Ⅰ）, khối 1, nhóm thành tích Nâng cao), G-B…», TD-RULE-12 «Bộ lọc kết hợp: Giới hạn bằng bộ lọc（特定条件で絞り込む）: Khối（学年） = 1 hoặc 2» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Đăng nhập tài khoản giáo viên có quyền sửa mục.
- Dữ liệu test: các lớp học phần G-A, G-B, G-C, quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao)

**操作（Thao tác）**

1. Mở Điều kiện áp dụng của một quy tắc mới.
2. Chọn Toàn bộ đối tượng（全員が対象）, lưu, mở lại.
3. Chọn Giới hạn bằng bộ lọc（特定条件で絞り込む）, bấm Thêm điều kiện lọc（絞り込み条件を追加）, liệt kê các loại lọc có trong danh sách.
4. Cấu hình như quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao), lưu, mở lại.

**期待結果（Kết quả mong đợi）**

1. Hai lựa chọn đối tượng lưu và mở lại đúng.
2. Có các bộ lọc Môn/phân môn（教科・科目）, Khối（学年）, lớp/nhóm và các điều kiện lựa chọn đang được hỗ trợ (đặc tả v2 mục 5.1 “Đối tượng áp dụng”). Danh sách đề xuất (PROPOSED, thiết kế DB v2 mục 3.2 “`apply_condition`”): khối (`hr_grade`), môn (`subject`), phân môn (`sub_subject`), lớp học phần (`group`), lớp chủ nhiệm (`homeroom`), nhóm tổng hợp (`calc_group`), mã lựa chọn của mục (`choice`).
3. Không có trình soạn AND/OR lồng nhau.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Đăng nhập tài khoản giáo viên có quyền sửa mục. - Dữ liệu test: các lớp học phần G-A, G-B, G-C, quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao) | Trigger/điểm quan sát: 1. Mở Điều kiện áp dụng của một quy tắc mới. 2. Chọn Toàn bộ đối tượng（全員が対象）, lưu, mở lại. 3. Chọn Giới hạn bằng bộ lọc（特定条件で絞り込む）, bấm Thêm điều kiện lọc（絞り込み条件を追加）, liệt kê các loại lọc có trong danh sách. 4. Cấu hình như quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao), lưu, mở lại. | Oracle/bằng chứng: 1. Hai lựa chọn đối tượng lưu và mở lại đúng. 2. Có các bộ lọc Môn/phân môn（教科・科目）, Khối（学年）, lớp/nhóm và các điều kiện lựa chọn đang được hỗ trợ (đặc tả v2 mục 5.1 “Đối tượng áp dụng”). Danh sách đề xuất (PROPOSED, thiết kế DB v2 mục 3.2 “`apply_condition`”): khối (`hr_grade`), môn (`subject`), phân môn (`sub_subject`), lớp học phần (`group`), lớp chủ nhiệm (`homeroom`), nhóm tổng hợp (`calc_group`), mã lựa chọn của mục (`choice`). 3. Không có trình soạn AND/OR lồng nhau.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.1 “Đối tượng áp dụng”; Figma MW “màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình” (58:8930 «Figma MW: màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình») (UI｜03A «Figma: màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình — MW 58:8930»), (58:9067–9103); CODE `AutoRatingConfController::registCondition`, `getFirstFilterList`; [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 3.2 “`apply_condition`” (`filters[].type`, PROPOSED)
- Bằng chứng cần chụp: Ảnh danh sách loại lọc; ảnh màn sau khi mở lại.
- Sau khi chạy: Quy tắc có bộ lọc quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao).
- Ghi chú: Danh sách loại lọc chưa chốt: đặc tả v2 ghi "các bộ lọc phù hợp"; thiết kế DB v2 mục 3.2 “`apply_condition`” đề xuất 7 loại (PROPOSED). Phần danh sách không đánh PASS/FAIL.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-009"></a>

### TC-RS-FUNC-009 — Điều kiện phân nhánh theo Trung bình（平均点） được lưu cùng bộ nguồn

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu»)

<!-- Mã truy vết: TD-ROLE-01 «Giáo viên có quyền sửa mục: Có quyền vào Thiết lập nhập điểm（成績入力設定） và…», TD-RULE-07 «Cặp phân nhánh: Ưu tiên 1 "Trung bình từ 60": điều kiện `A≥60`, cố định…», TD-SRC-02 «Bản mới nhất chưa chốt: Tổng hợp chạy sau TD-SRC-01, `A` = 62» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Đăng nhập tài khoản giáo viên có quyền sửa mục. Có nguồn tổng hợp mặc định.
- Dữ liệu test: cặp quy tắc phân nhánh theo trung bình 60, bản tổng hợp mới nhất chưa chốt (trung bình 62)

**操作（Thao tác）**

1. Tạo quy tắc "Trung bình dưới 60": thêm bộ lọc Môn（教科・科目）= Toán（数学） và điều kiện Trung bình（平均点）.
2. Chọn Thời kỳ tổng hợp（集計対象時期）= 1学期期末 (cuối kỳ học kỳ 1), Thiết lập tổng hợp thứ hạng（順位集計設定）= 評点集計 (tổng hợp điểm đánh giá), Nhóm học sinh được tổng hợp — 集計対象（母集団）= ホームルーム (lớp chủ nhiệm; file Figma cũ ghi HR毎).
3. Nhập mốc 60, dấu Nhỏ hơn（未満）, lưu.
4. Tạo quy tắc thứ hai với mốc 60, dấu Từ mức này trở lên（以上）.
5. Mở lại cả hai.

**期待結果（Kết quả mong đợi）**

1. Cả hai quy tắc lưu được, là hai dòng riêng trong danh sách (không phải một form hai nhánh).
2. Mở lại giữ đủ bộ nguồn, mốc, dấu.
3. Không có lựa chọn Kết quả tổng hợp dùng để tham chiếu（参照する集計結果） (đặc tả v2 mục 3 “Bản đồ màn hình và luồng thao tác”, mục 5.5 “Chọn bản nguồn”).

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Đăng nhập tài khoản giáo viên có quyền sửa mục. Có nguồn tổng hợp mặc định. - Dữ liệu test: cặp quy tắc phân nhánh theo trung bình 60, bản tổng hợp mới nhất chưa chốt (trung bình 62) | Trigger/điểm quan sát: 1. Tạo quy tắc "Trung bình dưới 60": thêm bộ lọc Môn（教科・科目）= Toán（数学） và điều kiện Trung bình（平均点）. 2. Chọn Thời kỳ tổng hợp（集計対象時期）= 1学期期末 (cuối kỳ học kỳ 1), Thiết lập tổng hợp thứ hạng（順位集計設定）= 評点集計 (tổng hợp điểm đánh giá), Nhóm học sinh được tổng hợp — 集計対象（母集団）= ホームルーム (lớp chủ nhiệm; file Figma cũ ghi HR毎). 3. Nhập mốc 60, dấu Nhỏ hơn（未満）, lưu. 4. Tạo quy tắc thứ hai với mốc 60, dấu Từ mức này trở lên（以上）. 5. Mở lại cả hai. | Oracle/bằng chứng: 1. Cả hai quy tắc lưu được, là hai dòng riêng trong danh sách (không phải một form hai nhánh). 2. Mở lại giữ đủ bộ nguồn, mốc, dấu. 3. Không có lựa chọn Kết quả tổng hợp dùng để tham chiếu（参照する集計結果） (đặc tả v2 mục 3 “Bản đồ màn hình và luồng thao tác”, mục 5.5 “Chọn bản nguồn”).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Một mục đánh giá có một hay nhiều thiết lập điểm đỏ?” (Q5 «Một mục đánh giá có một hay nhiều thiết lập điểm đỏ?»), câu “Lấy trung bình của nhóm nào và kết quả tổng hợp nào?” (Q9 «Lấy trung bình của nhóm nào và kết quả tổng hợp nào?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.2 “Điều kiện dựa trên trung bình”, mục 5.4 “Bộ thông tin nguồn”; Figma MW “màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình” (58:9052–9156 «Figma MW: màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình») (UI｜03A «Figma: màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình — MW 58:8930»: 平均点が 60 点 未満 (trung bình dưới 60 điểm))
- Bằng chứng cần chụp: Ảnh form sau khi mở lại; ảnh danh sách có hai dòng.
- Sau khi chạy: Có cặp quy tắc phân nhánh theo trung bình 60.
- Ghi chú: Tập dấu của điều kiện phân nhánh (`<`, `≤`, `≥`, `>`) là PROPOSED (đề xuất thiết kế chờ review — đặc tả v2 mục 13.1). Phạm vi phát hành phân nhánh trung bình: TBD (phạm vi phát hành chưa chốt — đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-010"></a>

### TC-RS-FUNC-010 — Điều kiện Tỷ lệ điểm của nhóm（集団の得点率） được lưu cùng bộ nguồn

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu»)

<!-- Mã truy vết: TD-ROLE-01 «Giáo viên có quyền sửa mục: Có quyền vào Thiết lập nhập điểm（成績入力設定） và…», TD-RULE-09 «Tỷ lệ nhóm: Điều kiện Tỷ lệ điểm của nhóm（集団の得点率） `≥65%`», TC-RS-CALC-025 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Đăng nhập tài khoản giáo viên có quyền sửa mục.
- Dữ liệu test: quy tắc theo tỷ lệ điểm của nhóm từ 65%

**操作（Thao tác）**

1. Tạo quy tắc với điều kiện Tỷ lệ điểm của nhóm（集団の得点率）, nguồn mặc định, mốc 65, dấu Từ mức này trở lên（以上）.
2. Lưu, mở lại.

**期待結果（Kết quả mong đợi）**

Lưu và mở lại đúng loại điều kiện, nguồn, mốc 65 và dấu. Không có tùy chọn chọn cách tính A/B.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Đăng nhập tài khoản giáo viên có quyền sửa mục. - Dữ liệu test: quy tắc theo tỷ lệ điểm của nhóm từ 65% | Trigger/điểm quan sát: 1. Tạo quy tắc với điều kiện Tỷ lệ điểm của nhóm（集団の得点率）, nguồn mặc định, mốc 65, dấu Từ mức này trở lên（以上）. 2. Lưu, mở lại. | Oracle/bằng chứng: Lưu và mở lại đúng loại điều kiện, nguồn, mốc 65 và dấu. Không có tùy chọn chọn cách tính A/B.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Tỷ lệ nhóm có cần xử lý riêng khi các lớp khác điểm tối đa không?” (Q31 «Tỷ lệ nhóm có cần xử lý riêng khi các lớp khác điểm tối đa không?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.3 “Tỷ lệ nhóm”; Figma MW “màn Điều kiện áp dụng – điều kiện tỷ lệ điểm của nhóm” (58:9164–9397 «Figma MW: màn Điều kiện áp dụng – điều kiện tỷ lệ điểm của nhóm») (UI｜03B «Figma: màn Điều kiện áp dụng – điều kiện tỷ lệ điểm của nhóm — MW 58:9164»: 得点率が 65 % 以上 (tỷ lệ từ 65% trở lên))
- Bằng chứng cần chụp: Ảnh form sau khi mở lại.
- Sau khi chạy: Có quy tắc theo tỷ lệ điểm của nhóm từ 65%.
- Ghi chú: Phạm vi phát hành: TBD (phạm vi phát hành chưa chốt — đặc tả v2 mục 13.1). Tính đúng `R`: case “Tỷ lệ nhóm 64.99% (hiển thị 65.0) không khớp ≥ 65%”…027.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-011"></a>

### TC-RS-FUNC-011 — Chọn loại ngưỡng làm thay đổi vùng nhập

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”, mục 6.1 “Thành phần chung của màn ngưỡng”

<!-- Mã truy vết: TC-RS-UI-015 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mở Ngưỡng của một quy tắc.
- Dữ liệu test: —

**操作（Thao tác）**

1. Chọn Điểm cố định（固定点数）.
2. Chọn Tỷ lệ điểm tối đa（得点率）.
3. Chọn Công thức（計算式）.

**期待結果（Kết quả mong đợi）**

1. Cố định: có ô ngưỡng và dấu so sánh; không có vùng nguồn trung bình, không có xử lý phần lẻ.
2. Tỷ lệ: có ô %, xử lý phần lẻ, dấu so sánh; không có vùng nguồn trung bình.
3. Công thức: có vùng nguồn trung bình, bảng dòng công thức, dấu so sánh.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Mở Ngưỡng của một quy tắc. - Dữ liệu test: — | Trigger/điểm quan sát: 1. Chọn Điểm cố định（固定点数）. 2. Chọn Tỷ lệ điểm tối đa（得点率）. 3. Chọn Công thức（計算式）. | Oracle/bằng chứng: 1. Cố định: có ô ngưỡng và dấu so sánh; không có vùng nguồn trung bình, không có xử lý phần lẻ. 2. Tỷ lệ: có ô %, xử lý phần lẻ, dấu so sánh; không có vùng nguồn trung bình. 3. Công thức: có vùng nguồn trung bình, bảng dòng công thức, dấu so sánh.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Điều kiện nào không cần nguồn trung bình?” (Q10 «Điều kiện nào không cần nguồn trung bình?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.6 “Khi nào không cần nguồn?”, mục 6.1 “Thành phần chung của màn ngưỡng”; Figma MW “màn Ngưỡng – điểm cố định” (58:8022 «Figma MW: màn Ngưỡng – điểm cố định») (UI｜04A «Figma: màn Ngưỡng – điểm cố định — MW 58:8022»), “màn Ngưỡng – tỷ lệ điểm tối đa” (58:8194 «Figma MW: màn Ngưỡng – tỷ lệ điểm tối đa») (UI｜04B «Figma: màn Ngưỡng – tỷ lệ điểm tối đa — MW 58:8194»), “màn Ngưỡng – công thức” (58:8389 «Figma MW: màn Ngưỡng – công thức») (UI｜04C «Figma: màn Ngưỡng – công thức — MW 58:8389»)
- Bằng chứng cần chụp: Ảnh màn ở ba loại.
- Ghi chú: Thứ tự khối trên màn công thức kiểm ở case “Màn Công thức: thứ tự khối nguồn trung bình và dòng công thức”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-012"></a>

### TC-RS-FUNC-012 — Công thức: thêm/xóa dòng, kết quả dòng cuối là ngưỡng

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16 «Công thức theo dòng và phần lẻ»)

<!-- Mã truy vết: TD-RULE-06 «Công thức hai dòng: Dòng 1: Trung bình（平均点）÷ Số cố định（固定値）2, chữ số…», TC-RS-CALC-015 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mở Ngưỡng loại Công thức（計算式）.
- Dữ liệu test: quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8)

**操作（Thao tác）**

1. Cấu hình dòng 1 và dòng 2 như quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8), lưu.
2. Mở lại; bấm Thêm công thức（計算式を追加） để có dòng 3, rồi xóa dòng 3, lưu.
3. Xem tóm tắt ở danh sách.

**期待結果（Kết quả mong đợi）**

1. Lưu được 2 dòng; mở lại giữ vế trái, phép toán, vế phải, xử lý phần lẻ từng dòng.
2. Danh sách tóm tắt đủ các dòng và dấu so sánh.
3. Khi xét, `T` = kết quả dòng cuối (tính đúng ở case “Công thức hai dòng theo Figma: (A÷2)×0.8, dòng 1 làm tròn xuống”).

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Mở Ngưỡng loại Công thức（計算式）. - Dữ liệu test: quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8) | Trigger/điểm quan sát: 1. Cấu hình dòng 1 và dòng 2 như quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8), lưu. 2. Mở lại; bấm Thêm công thức（計算式を追加） để có dòng 3, rồi xóa dòng 3, lưu. 3. Xem tóm tắt ở danh sách. | Oracle/bằng chứng: 1. Lưu được 2 dòng; mở lại giữ vế trái, phép toán, vế phải, xử lý phần lẻ từng dòng. 2. Danh sách tóm tắt đủ các dòng và dấu so sánh. 3. Khi xét, `T` = kết quả dòng cuối (tính đúng ở case “Công thức hai dòng theo Figma: (A÷2)×0.8, dòng 1 làm tròn xuống”).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Ngưỡng dùng trung bình có chỉ gồm hai công thức cố định không?” (Q6 «Ngưỡng dùng trung bình có chỉ gồm hai công thức cố định không?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.4 “Công thức dùng trung bình”; Figma MW “màn Ngưỡng – công thức” (58:8594 «Figma MW: màn Ngưỡng – công thức»), (58:8563) (bảng 式1/式2, nút 計算式を追加 (thêm công thức)), (58:8581) 「最後の式の結果を基準点として使用します。」 (dùng kết quả của công thức cuối làm điểm ngưỡng)
- Bằng chứng cần chụp: Ảnh form sau khi mở lại; ảnh tóm tắt trên danh sách.
- Sau khi chạy: Có quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8).
- Ghi chú: Tập toán hạng Trung bình（平均点）/Số cố định（固定値）/Kết quả dòng trước（式の結果） là PROPOSED (đề xuất thiết kế chờ review — đặc tả v2 mục 13.1). Giới hạn số dòng: TBD (đặc tả v2 mục 6.8 “Yêu cầu độ chính xác”). Phạm vi phát hành công thức: TBD (phạm vi phát hành chưa chốt — đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-013"></a>

### TC-RS-FUNC-013 — Dấu so sánh Nhỏ hơn（未満）/Nhỏ hơn hoặc bằng（以下） được lưu và hiển thị

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 6.1 “Thành phần chung của màn ngưỡng”

<!-- Mã truy vết: TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-RULE-02 «Cố định `≤`: Như TD-RULE-01 nhưng Nhỏ hơn hoặc bằng（以下）», TC-RS-CALC-001, TC-RS-UI-012 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Có quy tắc “Cố định 30” (dưới 30).
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30), quy tắc cố định 30 với Nhỏ hơn hoặc bằng（以下）

**操作（Thao tác）**

1. Đổi dấu của quy tắc “Cố định 30” (dưới 30) sang Nhỏ hơn hoặc bằng（以下）, lưu, mở lại.
2. Đổi lại Nhỏ hơn（未満）, lưu, mở lại.

**期待結果（Kết quả mong đợi）**

Dấu đã chọn được lưu, hiển thị đúng ở form và tóm tắt danh sách. Tác động lên kết quả: case “Ngưỡng cố định 30: S = 29 / 30 / 31 với `<` và `≤`”.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Có quy tắc “Cố định 30” (dưới 30). - Dữ liệu test: quy tắc “Cố định 30” (dưới 30), quy tắc cố định 30 với Nhỏ hơn hoặc bằng（以下） | Trigger/điểm quan sát: 1. Đổi dấu của quy tắc “Cố định 30” (dưới 30) sang Nhỏ hơn hoặc bằng（以下）, lưu, mở lại. 2. Đổi lại Nhỏ hơn（未満）, lưu, mở lại. | Oracle/bằng chứng: Dấu đã chọn được lưu, hiển thị đúng ở form và tóm tắt danh sách. Tác động lên kết quả: case “Ngưỡng cố định 30: S = 29 / 30 / 31 với `<` và `≤`”.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Điểm bằng ngưỡng có bị xét đỏ không?” (Q4 «Điểm bằng ngưỡng có bị xét đỏ không?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.1 “Thành phần chung của màn ngưỡng”; Figma MW “màn Ngưỡng – điểm cố định” (58:8176 «Figma MW: màn Ngưỡng – điểm cố định»), “màn Ngưỡng – công thức” (58:8572 «Figma MW: màn Ngưỡng – công thức») (比較条件 (điều kiện so sánh))
- Bằng chứng cần chụp: Ảnh form và danh sách sau mỗi lần lưu.
- Sau khi chạy: quy tắc “Cố định 30” (dưới 30) dùng Nhỏ hơn.
- Ghi chú: Mặc định khi tạo mới là `<` (PROPOSED, đề xuất thiết kế chờ review — đặc tả v2 mục 13.1) — case “Mặc định khi tạo quy tắc mới”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-014"></a>

### TC-RS-FUNC-014 — Quy tắc mới chỉ có điều kiện, chưa có ngưỡng, không tham gia xét

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 4.4 “Lưu, đổi thứ tự và xóa”; tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04 «Lưu và mở lại nhiều thiết lập»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-13 «Cố định chưa có ngưỡng: Chỉ lưu điều kiện áp dụng, chưa lưu ngưỡng», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-STU-01 «S01: G-A, HR1» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có quy tắc mới chỉ có điều kiện, chưa có ngưỡng ở ưu tiên 1 (Toàn bộ, chưa có ngưỡng) và quy tắc “Cố định 30” (dưới 30) ở ưu tiên 2.
- Dữ liệu test: mục số nguyên (M=100); quy tắc mới chỉ có điều kiện, chưa có ngưỡng, quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29)

**操作（Thao tác）**

1. Xem danh sách.
2. Đăng ký điểm S01=29.
3. Xem kết quả ở trích xuất.

**期待結果（Kết quả mong đợi）**

1. Dòng quy tắc mới chỉ có điều kiện, chưa có ngưỡng hiện ngưỡng "chưa thiết lập" và thao tác mở màn ngưỡng.
2. Khi xét, quy tắc mới chỉ có điều kiện, chưa có ngưỡng không được chọn như quy tắc hoàn chỉnh; S01 được xét theo quy tắc “Cố định 30” (dưới 30) → Đỏ.
3. Không tạo ngưỡng 0 ngầm.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) có quy tắc mới chỉ có điều kiện, chưa có ngưỡng ở ưu tiên 1 (Toàn bộ, chưa có ngưỡng) và quy tắc “Cố định 30” (dưới 30) ở ưu tiên 2. - Dữ liệu test: mục số nguyên (M=100); quy tắc mới chỉ có điều kiện, chưa có ngưỡng, quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29) | Trigger/điểm quan sát: 1. Xem danh sách. 2. Đăng ký điểm S01=29. 3. Xem kết quả ở trích xuất. | Oracle/bằng chứng: 1. Dòng quy tắc mới chỉ có điều kiện, chưa có ngưỡng hiện ngưỡng "chưa thiết lập" và thao tác mở màn ngưỡng. 2. Khi xét, quy tắc mới chỉ có điều kiện, chưa có ngưỡng không được chọn như quy tắc hoàn chỉnh; S01 được xét theo quy tắc “Cố định 30” (dưới 30) → Đỏ. 3. Không tạo ngưỡng 0 ngầm.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 4.4 “Lưu, đổi thứ tự và xóa” (Đề xuất thiết kế cho thao tác thêm); Figma MW “chương 01 – lối vào, danh sách, xóa thiết lập” (58:10165–10179 «Figma MW: chương 01 – lối vào, danh sách, xóa thiết lập») 「基準が未設定のため、この設定は判定に使用しません。」 (vì chưa thiết lập ngưỡng, thiết lập này không dùng để xét), “chương 02 – điều kiện áp dụng và nguồn trung bình” (58:8925 «Figma MW: chương 02 – điều kiện áp dụng và nguồn trung bình») 「基準未設定の行は判定に使わない。」 (dòng chưa có ngưỡng không dùng để xét)
- Bằng chứng cần chụp: Ảnh danh sách; ảnh kết quả trích xuất; SELECT `setting_status` của quy tắc mới chỉ có điều kiện, chưa có ngưỡng (khi có schema; kỳ vọng `setting_status=0` — thiết kế DB v2 mục 4.1: trạng thái 0 là đang thiết lập/vô hiệu và không tham gia xét).
- Ghi chú: Toàn bộ case là đề xuất: không phải must-pass. Nếu thiết kế cuối không lưu trung gian, chuyển SKIPPED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-015"></a>

### TC-RS-FUNC-015 — Quy trình vận hành dùng trung bình: tắt tự tổng hợp → nút xanh → nút cam

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Thứ tự đánh giá tương đối” (AC-G25 «Thứ tự đánh giá tương đối»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-07 «Cặp phân nhánh: Ưu tiên 1 "Trung bình từ 60": điều kiện `A≥60`, cố định…», TD-ROLE-03 «Người có quyền chạy hàng loạt: Có quyền thực hiện Thực hiện tổng…», TD-GRP-02 «Lớp chủ nhiệm: HR1 (S01–S05), HR2 (S06–S10)», TD-STU-01 «S01: G-A, HR1», TD-STU-02 «S02: G-A, HR1», TD-STU-03 «S03: G-A, HR1», TD-STU-04 «S04: G-A, HR1», TD-STU-05 «S05: G-A, HR1», AC-G25, TC-RS-BR-034 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có cặp quy tắc phân nhánh theo trung bình 60. Điểm của nhóm HR1 đã đầy đủ. Không có bản chốt cho nguồn mặc định. Đăng nhập tài khoản có quyền chạy hàng loạt.
- Dữ liệu test: mục số nguyên (M=100); cặp quy tắc phân nhánh theo trung bình 60, các lớp chủ nhiệm HR1, HR2, học sinh S01–S05

**操作（Thao tác）**

1. Thiết lập tổng hợp thứ hạng（順位集計設定）→ Thiết lập chi tiết（詳細設定）: đặt tự tổng hợp khi đăng ký điểm là Không thực hiện（実行しない）.
2. Ở Tổng hợp thành tích（成績集計）, chọn Khối 1, kỳ 1学期期末 (cuối kỳ học kỳ 1), bấm Thực hiện tổng hợp（集計実行）, chờ hoàn tất.
3. Bấm Thực hiện tính toán tự động（自動算出実行）, chờ hoàn tất.
4. Xem kết quả ở ba đầu ra.
5. Sau bước 3, xem lần chạy tổng hợp gần nhất hiển thị ở Tổng hợp thành tích（成績集計）.

**期待結果（Kết quả mong đợi）**

1. Sau bước 2 (chỉ nút xanh), kết quả đỏ chưa thay đổi.
2. Sau bước 3, mỗi ô của S01–S05 có kết quả theo nhánh đúng với `A` của tổng hợp vừa chạy.
3. Ba đầu ra hiển thị cùng kết quả mới.
4. (Theo tiêu chí nghiệm thu “Thứ tự đánh giá tương đối”) Bước 3 không tự chạy lại Thực hiện tổng hợp（集計実行） hay thêm lượt xét thứ hai, kể cả khi tính tự động làm đổi điểm dùng cho trung bình: lần chạy tổng hợp gần nhất vẫn là lần ở bước 2. Muốn dùng trung bình mới thì người dùng chạy lại quy trình.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) có cặp quy tắc phân nhánh theo trung bình 60. Điểm của nhóm HR1 đã đầy đủ. Không có bản chốt cho nguồn mặc định. Đăng nhập tài khoản có quyền chạy hàng loạt. - Dữ liệu test: mục số nguyên (M=100); cặp quy tắc phân nhánh theo trung bình 60, các lớp chủ nhiệm HR1, HR2, học sinh S01–S05 | Trigger/điểm quan sát: 1. Thiết lập tổng hợp thứ hạng（順位集計設定）→ Thiết lập chi tiết（詳細設定）: đặt tự tổng hợp khi đăng ký điểm là Không thực hiện（実行しない）. 2. Ở Tổng hợp thành tích（成績集計）, chọn Khối 1, kỳ 1学期期末 (cuối kỳ học kỳ 1), bấm Thực hiện tổng hợp（集計実行）, chờ hoàn tất. 3. Bấm Thực hiện tính toán tự động（自動算出実行）, chờ hoàn tất. 4. Xem kết quả ở ba đầu ra. 5. Sau bước 3, xem lần chạy tổng hợp gần nhất hiển thị ở Tổng hợp thành tích（成績集計）. | Oracle/bằng chứng: 1. Sau bước 2 (chỉ nút xanh), kết quả đỏ chưa thay đổi. 2. Sau bước 3, mỗi ô của S01–S05 có kết quả theo nhánh đúng với `A` của tổng hợp vừa chạy. 3. Ba đầu ra hiển thị cùng kết quả mới. 4. (Theo tiêu chí nghiệm thu “Thứ tự đánh giá tương đối”) Bước 3 không tự chạy lại Thực hiện tổng hợp（集計実行） hay thêm lượt xét thứ hai, kể cả khi tính tự động làm đổi điểm dùng cho trung bình: lần chạy tổng hợp gần nhất vẫn là lần ở bước 2. Muốn dùng trung bình mới thì người dùng chạy lại quy trình.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Quy trình vận hành khi có đánh giá tương đối là gì?” (Q12 «Quy trình vận hành khi có đánh giá tương đối là gì?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.4 “Quy trình vận hành khi dùng trung bình/tỷ lệ nhóm”; Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:6933 «Figma MW: chương 04 – đăng ký, tổng hợp, chạy lại và kết quả») (04), (58:6944) 「平均を使う場合は、成績登録時の自動集計を「実行しない」に設定」 (khi dùng trung bình, đặt tự tổng hợp khi đăng ký điểm là không thực hiện), (58:7022–7045); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Thứ tự đánh giá tương đối” (AC-G25 «Thứ tự đánh giá tương đối») (không thêm vòng lặp tới hội tụ); [tài liệu chia công việc v2](../split-tasks.vi.md) ([RSD-TASK](../split-tasks.vi.md) «bản chia công việc v2») công việc “Cập nhật kết quả khi đăng ký và chạy hàng loạt” (Task 4 «Cập nhật kết quả khi đăng ký và chạy hàng loạt») (Thay đổi nghiệp vụ, gạch đầu dòng 3)
- Bằng chứng cần chụp: Ảnh cấu hình 実行しない (không thực hiện); ảnh màn tổng hợp sau mỗi nút (thấy lần chạy gần nhất); ảnh/file ba đầu ra.
- Sau khi chạy: Kết quả hiện hành cập nhật.
- Ghi chú: Hệ thống không bắt buộc tắt tự tổng hợp (case “Bật tự tổng hợp khi đăng ký: hệ thống không chặn; quy tắc độc lập với trung bình vẫn xét”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-016"></a>

### TC-RS-FUNC-016 — Đăng ký/sửa điểm trực tiếp ở màn lớp kích hoạt xét

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23 «Bao phủ đường đăng ký và chạy lại»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-STU-01 «S01: G-A, HR1», TD-STU-03 «S03: G-A, HR1» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30); mục số nguyên (M=100) không có quy tắc tính tự động.
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29), học sinh S03 (điểm 31)

**操作（Thao tác）**

1. Ở màn đăng ký điểm của lớp G-A, nhập S01=29, S03=31, lưu.
2. Xem trích xuất.

**期待結果（Kết quả mong đợi）**

Sau khi lưu thành công: S01 Đỏ, S03 Không đỏ. Không cần chạy nút cam; không cần mục có quy tắc tính tự động.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30); mục số nguyên (M=100) không có quy tắc tính tự động. - Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29), học sinh S03 (điểm 31) | Trigger/điểm quan sát: 1. Ở màn đăng ký điểm của lớp G-A, nhập S01=29, S03=31, lưu. 2. Xem trích xuất. | Oracle/bằng chứng: Sau khi lưu thành công: S01 Đỏ, S03 Không đỏ. Không cần chạy nút cam; không cần mục có quy tắc tính tự động.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Khi nào xét điểm đỏ và có cần chế độ thủ công/tự động riêng không?” (Q11 «Khi nào xét điểm đỏ và có cần chế độ thủ công/tự động riêng không?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.2 “Bảng sự kiện” (Đăng ký/sửa điểm trực tiếp); CODE `AdminNBGradeSettingSystemLessonController::store` (đường ghi điểm “Màn lớp NB 成績登録 (đăng ký điểm)”)
- Bằng chứng cần chụp: Ảnh màn đăng ký điểm sau lưu; ảnh kết quả trích xuất.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-017"></a>

### TC-RS-FUNC-017 — Nhập CSV điểm lớp học phần (NB) kích hoạt xét

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23 «Bao phủ đường đăng ký và chạy lại»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-STU-01 «S01: G-A, HR1», AC-G26 «Lưu thành công và thông báo an toàn», AC-G23, TC-RS-FUNC-035 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30). Chạy hai lần: (a) trường có tính tự động, (b) trường không có tính tự động.
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29)

**操作（Thao tác）**

1. Mở Đăng ký thành tích bằng CSV（成績CSV登録） của lớp G-A, nhập CSV với S01=29.
2. Xem kết quả ở trích xuất.
3. Nhập lại CSV với S01=31, xem kết quả.

**期待結果（Kết quả mong đợi）**

1–2. Nhập thành công → S01 được xét: Đỏ, ở cả (a) và (b) (không phụ thuộc việc trường có tính tự động).

3. S01 Không đỏ; không còn dấu đỏ cũ.

Điểm và kết quả nhất quán theo ranh giới giao dịch hiện có (tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn”).

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30). Chạy hai lần: (a) trường có tính tự động, (b) trường không có tính tự động. - Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29) | Trigger/điểm quan sát: 1. Mở Đăng ký thành tích bằng CSV（成績CSV登録） của lớp G-A, nhập CSV với S01=29. 2. Xem kết quả ở trích xuất. 3. Nhập lại CSV với S01=31, xem kết quả. | Oracle/bằng chứng: 1–2. Nhập thành công → S01 được xét: Đỏ, ở cả (a) và (b) (không phụ thuộc việc trường có tính tự động). 3. S01 Không đỏ; không còn dấu đỏ cũ. Điểm và kết quả nhất quán theo ranh giới giao dịch hiện có (tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn”).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.2 “Bảng sự kiện” (Nhập CSV điểm); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23 «Bao phủ đường đăng ký và chạy lại»); [tài liệu chia công việc v2](../split-tasks.vi.md) ([RSD-TASK](../split-tasks.vi.md) «bản chia công việc v2») công việc “Cập nhật kết quả khi đăng ký và chạy hàng loạt” (Task 4 «Cập nhật kết quả khi đăng ký và chạy hàng loạt») (Đăng ký thành tích bằng CSV（成績CSV登録） `/admin/nb/grade/grade_setting_system/lesson_group_csv/regist/(:num)`); CODE đường ghi điểm “CSV lớp NB” `AdminNBGradeSettingSystemLessonCsvController::import`
- Bằng chứng cần chụp: File CSV đã dùng (không có dữ liệu thật); ảnh kết quả sau từng lần.
- Ghi chú: CSV đăng ký điểm lớp chủ nhiệm hàng loạt（HR成績CSV一括登録）: case “Nhập CSV đăng ký điểm lớp chủ nhiệm hàng loạt（HR成績CSV一括登録） kích hoạt xét” (TBD).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-018"></a>

### TC-RS-FUNC-018 — Liên kết kết quả chấm bài thi kích hoạt xét

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23 «Bao phủ đường đăng ký và chạy lại»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-GRP-01 «Lớp học phần: G-A (Toán I（数学Ⅰ）, khối 1, nhóm thành tích Nâng cao), G-B…», TD-STU-01 «S01: G-A, HR1», AC-G23 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Có bài thi đã chấm liên kết tới mục số nguyên (M=100) cho lớp G-A và lớp G-C; quy tắc “Cố định 30” (dưới 30) trên mục số nguyên (M=100). G-A đủ thiết lập để AutoRating chạy. G-C được chuẩn bị để `createArgument` không trả lớp này (ví dụ chưa đăng ký thiết lập lớp học bắt buộc（入力必須の授業設定）), nên AutoRating bị bỏ qua.
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), các lớp học phần G-A, G-B, G-C, học sinh S01 (điểm 29)

**操作（Thao tác）**

1. Liên kết kết quả chấm của G-A với S01=29 (quy tắc cố định quy tắc “Cố định 30” (dưới 30)), gồm trường hợp lớp không có quy tắc tính tự động.
2. Liên kết kết quả chấm của G-C với một học sinh của G-C = 28.
3. Xem điểm đã ghi và kết quả đỏ của hai lớp.
4. (Tùy chọn) Lặp lại với quy tắc cần trung bình.

**期待結果（Kết quả mong đợi）**

1. S01 Đỏ.

2–3. Điểm 28 của G-C đã được ghi và ô đó được xét → Đỏ, dù AutoRating bị bỏ qua. Không có ô đã ghi nào ở G-C bị để lại không có kết quả.

4. Quy tắc cần trung bình: liên kết không chạy tổng hợp thứ hạng nên trung bình có thể cũ — việc chấp nhận trung bình cũ chưa chốt, phần này TBD, không đánh PASS/FAIL.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Có bài thi đã chấm liên kết tới mục số nguyên (M=100) cho lớp G-A và lớp G-C; quy tắc “Cố định 30” (dưới 30) trên mục số nguyên (M=100). G-A đủ thiết lập để AutoRating chạy. G-C được chuẩn bị để `createArgument` không trả lớp này (ví dụ chưa đăng ký thiết lập lớp học bắt buộc（入力必須の授業設定）), nên AutoRating bị bỏ qua. - Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), các lớp học phần G-A, G-B, G-C, học sinh S01 (điểm 29) | Trigger/điểm quan sát: 1. Liên kết kết quả chấm của G-A với S01=29 (quy tắc cố định quy tắc “Cố định 30” (dưới 30)), gồm trường hợp lớp không có quy tắc tính tự động. 2. Liên kết kết quả chấm của G-C với một học sinh của G-C = 28. 3. Xem điểm đã ghi và kết quả đỏ của hai lớp. 4. (Tùy chọn) Lặp lại với quy tắc cần trung bình. | Oracle/bằng chứng: 1. S01 Đỏ. 2–3. Điểm 28 của G-C đã được ghi và ô đó được xét → Đỏ, dù AutoRating bị bỏ qua. Không có ô đã ghi nào ở G-C bị để lại không có kết quả. 4. Quy tắc cần trung bình: liên kết không chạy tổng hợp thứ hạng nên trung bình có thể cũ — việc chấp nhận trung bình cũ chưa chốt, phần này TBD, không đánh PASS/FAIL.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.2 “Bảng sự kiện” (Liên kết kết quả chấm bài thi: "kể cả nhánh tính tự động bị bỏ qua"), mục 12.2 “Điểm tích hợp chính” (Liên kết điểm thi); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23 «Bao phủ đường đăng ký và chạy lại»); [tài liệu chia công việc v2](../split-tasks.vi.md) ([RSD-TASK](../split-tasks.vi.md) «bản chia công việc v2») công việc “Cập nhật kết quả khi đăng ký và chạy hàng loạt” (Task 4 «Cập nhật kết quả khi đăng ký và chạy hàng loạt») (xử lý liên kết điểm thi ghi điểm trước rồi bỏ AutoRating nếu `createArgument` không trả lớp; phải bao phủ ô đã ghi ở đường này); code hiện tại “Liên kết điểm thi: transaction, bỏ AutoRating khi thiếu lớp” `ScoringResultService::linkStudentScoringResults` (bỏ qua ở `:671–677`, ví dụ trong code: chưa đăng ký thiết lập lớp học bắt buộc（入力必須の授業設定）); code hiện tại “Liên kết điểm thi ghi điểm rồi bỏ qua AutoRating khi lớp không có trong…”; code hiện tại “Liên kết điểm thi không chạy 順位集計 (tổng hợp xếp hạng)”
- Bằng chứng cần chụp: Ảnh thao tác liên kết; ảnh thiết lập lớp học của G-C cho thấy điều kiện bỏ qua; ảnh điểm đã ghi và kết quả của hai lớp.
- Sau khi chạy: Khôi phục thiết lập lớp học của G-C.
- Ghi chú: Bước 4 TBD vì chưa chốt việc chấp nhận trung bình cũ. Cách đưa G-C vào điều kiện bỏ qua lấy từ chú thích code; hỏi team dev khi chuẩn bị. URL màn liên kết chưa xác minh (tài liệu chia công việc v2 công việc “Cập nhật kết quả khi đăng ký và chạy hàng loạt”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-019"></a>

### TC-RS-FUNC-019 — Lưu lựa chọn điểm tối đa của lớp khi đăng ký điểm kích hoạt xét

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị” (AC-G24 «Trigger khi đổi điểm tối đa/đơn vị»)

<!-- Mã truy vết: TD-ITEM-03 «Mục điểm đơn vị: Điểm bài kiểm tra đơn vị（単元テスト点）, M mặc định 100», TD-RULE-03 «Tỷ lệ: Tỷ lệ điểm tối đa（得点率） 30%, không xử lý phần lẻ（しない）, Nhỏ hơn（未満）», TC-RS-ERR-012 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục điểm đơn vị (đơn vị U1 có M riêng 40) có quy tắc tỷ lệ 30% (30%). Lớp G-B chưa dùng lựa chọn lớp; S06 có điểm U1 = 14 (M=40 → T=12 → Không đỏ).
- Dữ liệu test: mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc tỷ lệ 30%

**操作（Thao tác）**

1. Ở màn đăng ký điểm lớp G-B, chọn lựa chọn lớp M=50 cho U1, lưu.
2. Xem kết quả S06.

**期待結果（Kết quả mong đợi）**

Sau khi lưu thành công: M=50 → T=15 → S06=14 Đỏ.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục điểm đơn vị (đơn vị U1 có M riêng 40) có quy tắc tỷ lệ 30% (30%). Lớp G-B chưa dùng lựa chọn lớp; S06 có điểm U1 = 14 (M=40 → T=12 → Không đỏ). - Dữ liệu test: mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc tỷ lệ 30% | Trigger/điểm quan sát: 1. Ở màn đăng ký điểm lớp G-B, chọn lựa chọn lớp M=50 cho U1, lưu. 2. Xem kết quả S06. | Oracle/bằng chứng: Sau khi lưu thành công: M=50 → T=15 → S06=14 Đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Thay điểm tối đa thì xử lý thế nào?” (Q14 «Thay điểm tối đa thì xử lý thế nào?»), câu “Những đường đổi điểm tối đa nào hiện chạy tính tự động?” (Q20 «Những đường đổi điểm tối đa nào hiện chạy tính tự động?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.3 “Thay đổi điểm tối đa”
- Bằng chứng cần chụp: Ảnh chọn lựa chọn lớp; ảnh kết quả trước/sau.
- Sau khi chạy: G-B dùng lựa chọn lớp M=50.
- Ghi chú: Đường CSV lựa chọn lớp không gọi tính tự động (khác biệt đặc tả–code về “CSV lựa chọn điểm tối đa của lớp”); việc có xét đỏ khi điểm tối đa đổi qua CSV chưa chốt — xem case “Nhập CSV lựa chọn điểm tối đa của lớp”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-020"></a>

### TC-RS-FUNC-020 — Lưu Thiết lập điểm tối đa hàng loạt（満点一括設定） xếp hàng tính toán rồi mới có kết quả mới

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị” (AC-G24 «Trigger khi đổi điểm tối đa/đơn vị»)

<!-- Mã truy vết: TD-ROLE-03 «Người có quyền chạy hàng loạt: Có quyền thực hiện Thực hiện tổng…», TD-RULE-03 «Tỷ lệ: Tỷ lệ điểm tối đa（得点率） 30%, không xử lý phần lẻ（しない）, Nhỏ hơn（未満）», TD-ITEM-03 «Mục điểm đơn vị: Điểm bài kiểm tra đơn vị（単元テスト点）, M mặc định 100» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Trường có chức năng Thiết lập điểm tối đa hàng loạt（満点一括設定） (`/admin/grade/lesson_group/setting?setting_type=change_max_score`); tài khoản có quyền chạy hàng loạt; quy tắc tỷ lệ 30% trên mục điểm đơn vị (đơn vị U1 có M riêng 40).
- Dữ liệu test: mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc tỷ lệ 30%

**操作（Thao tác）**

1. Lưu M=50 cho các lớp/kỳ được phép.
2. Ngay sau khi lưu (trước khi batch xong), xem kết quả.
3. Chờ batch hoàn tất, xem lại.

**期待結果（Kết quả mong đợi）**

1. Ngay sau khi lưu: kết quả cũ vẫn hiện; không báo "hoàn tất" khi mới xếp hàng.
2. Sau batch thành công: kết quả theo M=50.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Trường có chức năng Thiết lập điểm tối đa hàng loạt（満点一括設定） (`/admin/grade/lesson_group/setting?setting_type=change_max_score`); tài khoản có quyền chạy hàng loạt; quy tắc tỷ lệ 30% trên mục điểm đơn vị (đơn vị U1 có M riêng 40). - Dữ liệu test: mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc tỷ lệ 30% | Trigger/điểm quan sát: 1. Lưu M=50 cho các lớp/kỳ được phép. 2. Ngay sau khi lưu (trước khi batch xong), xem kết quả. 3. Chờ batch hoàn tất, xem lại. | Oracle/bằng chứng: 1. Ngay sau khi lưu: kết quả cũ vẫn hiện; không báo "hoàn tất" khi mới xếp hàng. 2. Sau batch thành công: kết quả theo M=50.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.3 “Thay đổi điểm tối đa”; CODE `GroupOptionUseCase::save` (đường ghi điểm “満点一括設定 (thiết lập điểm tối đa hàng loạt)”)
- Bằng chứng cần chụp: Ảnh sau lưu; ảnh trạng thái batch; ảnh kết quả sau batch.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-021"></a>

### TC-RS-FUNC-021 — Trường chỉ có quy tắc đỏ (không có tính tự động) vẫn có đường chạy hàng loạt

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23 «Bao phủ đường đăng ký và chạy lại»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-ROLE-03 «Người có quyền chạy hàng loạt: Có quyền thực hiện Thực hiện tổng…», AC-G23, SI-09 «Đường chạy cho mục chỉ có quy tắc đỏ» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Trường không có quy tắc tính tự động nào đang hoạt động; mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30).
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), tài khoản có quyền chạy hàng loạt

**操作（Thao tác）**

1. Mở Tổng hợp thành tích（成績集計） (`/admin/grade/grade_setting_system/grade_calc`).
2. Tìm thao tác Thực hiện tính toán tự động（自動算出実行） cho Khối 1, kỳ 1学期期末 (cuối kỳ học kỳ 1).
3. Chạy, chờ hoàn tất, xem kết quả.

**期待結果（Kết quả mong đợi）**

Chạy được bằng thao tác hàng loạt hiện có (không có chế độ xét đỏ riêng); sau khi chạy, các ô được xét theo quy tắc “Cố định 30” (dưới 30). Nhãn/cách hiện nút cho trường không có tính tự động chưa chốt — không đánh giá phần này.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Trường không có quy tắc tính tự động nào đang hoạt động; mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30). - Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), tài khoản có quyền chạy hàng loạt | Trigger/điểm quan sát: 1. Mở Tổng hợp thành tích（成績集計） (`/admin/grade/grade_setting_system/grade_calc`). 2. Tìm thao tác Thực hiện tính toán tự động（自動算出実行） cho Khối 1, kỳ 1学期期末 (cuối kỳ học kỳ 1). 3. Chạy, chờ hoàn tất, xem kết quả. | Oracle/bằng chứng: Chạy được bằng thao tác hàng loạt hiện có (không có chế độ xét đỏ riêng); sau khi chạy, các ô được xét theo quy tắc “Cố định 30” (dưới 30). Nhãn/cách hiện nút cho trường không có tính tự động chưa chốt — không đánh giá phần này.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.2 “Bảng sự kiện” (đoạn cuối), mục 12.2 “Điểm tích hợp chính”; [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Xóa thiết lập cuối cùng thì dấu đỏ mất ngay hay chờ chạy lại?” (Q28 «Xóa thiết lập cuối cùng thì dấu đỏ mất ngay hay chờ chạy lại?»); code hiện tại “Nút cam chỉ hiện khi có AutoRating active” (`grade_calc/index.php:124-126` chỉ hiện nút cam khi có tính tự động); Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:6949 «Figma MW: chương 04 – đăng ký, tổng hợp, chạy lại và kết quả») 「赤点ルールのみ・最後のルール削除後も既存操作で再実行できる設計。」 (thiết kế chạy lại được bằng thao tác hiện có cả khi chỉ có quy tắc đỏ hoặc đã xóa quy tắc cuối); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23 «Bao phủ đường đăng ký và chạy lại») (bảng: chạy theo đăng ký điểm và tính hàng loạt hiện có); [tài liệu chia công việc v2](../split-tasks.vi.md) ([RSD-TASK](../split-tasks.vi.md) «bản chia công việc v2») công việc “Cập nhật kết quả khi đăng ký và chạy hàng loạt” (Task 4 «Cập nhật kết quả khi đăng ký và chạy hàng loạt»)
- Bằng chứng cần chụp: Ảnh màn Tổng hợp thành tích（成績集計）; ảnh kết quả sau chạy.
- Ghi chú: Code hiện tại ẩn nút cam khi không có tính tự động (khác biệt đặc tả–code về “Đường chạy cho mục chỉ có quy tắc đỏ”) → dự kiến FAIL cho tới khi sửa. Cách hiển thị nút chưa chốt.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-022"></a>

### TC-RS-FUNC-022 — Trích xuất thành tích（成績抽出）: các tùy chọn đỏ được lưu và mở lại đúng

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Hiển thị ô trích xuất” (AC-G30 «Hiển thị ô trích xuất»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-ROLE-07 «Người phụ trách đầu ra: Có quyền Trích xuất thành tích（成績抽出）, Thiết lập…», TD-OUT-01 «Trích xuất lọc + ký hiệu trước + màu: Lọc học sinh có điểm đỏ（抽出する） BẬT», TD-OUT-02 «Trích xuất chỉ ký hiệu: Lọc TẮT», , TC-RS-UI-020 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30). Đăng nhập tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm).
- Dữ liệu test: mục số nguyên (M=100), quy tắc “Cố định 30” (dưới 30); cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau)

**操作（Thao tác）**

1. Mở thiết lập hiển thị của trích xuất, khung Thiết lập chi tiết thông tin lớp học（授業情報の詳細設定）, phần điều kiện đỏ.
2. Cấu hình cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, lưu, mở lại.
3. Cấu hình cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) (hai ký hiệu cùng bật), lưu, mở lại.
4. (PROPOSED) Chạy SELECT cột `extract_setting` của dòng `grade_extract_conf` tương ứng mẫu vừa lưu, lọc theo trường/năm test.
5. (PROPOSED) Nếu màn có chức năng sao chép thiết lập trích xuất hiện có: sao chép mẫu cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, mở bản sao.

**期待結果（Kết quả mong đợi）**

1. Có bốn tùy chọn độc lập: lọc học sinh có điểm đỏ, ký hiệu phía trước, ký hiệu phía sau, tô màu ô.
2. Ký hiệu trước và sau cùng bật được.
3. Màu chỉ chọn từ bảng màu hiện có (không có bộ chọn màu tự do).
4. Mở lại giữ đúng giá trị.
5. (PROPOSED) JSON `extract_setting` chứa phần điều kiện đỏ với các khóa `use_target_extract`, `use_prefix_mark`, `prefix_mark`, `use_suffix_mark`, `suffix_mark`, `use_cell_coloring`, `cell_color` khớp giá trị trên màn; không có cột/bảng mới cho thiết lập này.
6. (PROPOSED) Bản sao giữ nguyên bốn tùy chọn, ký hiệu và màu.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30). Đăng nhập tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm). - Dữ liệu test: mục số nguyên (M=100), quy tắc “Cố định 30” (dưới 30); cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) | Trigger/điểm quan sát: 1. Mở thiết lập hiển thị của trích xuất, khung Thiết lập chi tiết thông tin lớp học（授業情報の詳細設定）, phần điều kiện đỏ. 2. Cấu hình cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, lưu, mở lại. 3. Cấu hình cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) (hai ký hiệu cùng bật), lưu, mở lại. 4. (PROPOSED) Chạy SELECT cột `extract_setting` của dòng `grade_extract_conf` tương ứng mẫu vừa lưu, lọc theo trường/năm test. 5. (PROPOSED) Nếu màn có chức năng sao chép thiết lập trích xuất hiện có: | Oracle/bằng chứng: 1. Có bốn tùy chọn độc lập: lọc học sinh có điểm đỏ, ký hiệu phía trước, ký hiệu phía sau, tô màu ô. 2. Ký hiệu trước và sau cùng bật được. 3. Màu chỉ chọn từ bảng màu hiện có (không có bộ chọn màu tự do). 4. Mở lại giữ đúng giá trị. 5. (PROPOSED) JSON `extract_setting` chứa phần điều kiện đỏ với các khóa `use_target_extract`, `use_prefix_mark`, `prefix_mark`, `use_suffix_mark`, `suffix_mark`, `use_cell_coloring`, `cell_color` khớp giá trị trên màn; không có cột/bảng mới cho thiết lập này. 6. (P; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?” (Q16 «Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 9.1 “Thiết lập”; [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 5.1 “Thiết lập hiển thị của Trích xuất thành tích（成績抽出）và Công cụ phiếu điểm（通知表ツール）” (lưu trong `grade_extract_conf.extract_setting`, sao chép theo đường thiết lập trích xuất hiện có — PROPOSED); Figma MW “tùy chọn đỏ ở Trích xuất thành tích (đặc tả v2: 05-A «Figma: chương 05, khung A – thiết lập cách hiển thị/trích xuất — MW 58:6250»)” (58:6517–6529 «Figma MW: tùy chọn đỏ ở Trích xuất thành tích (đặc tả v2: 05-A)») (UI 07A «Figma: tùy chọn đỏ ở Trích xuất thành tích (đặc tả v2: 05-A) — MW 58:6359»), “chương 05 – trích xuất thành tích và kết quả Excel” (58:6241–6242 «Figma MW: chương 05 – trích xuất thành tích và kết quả Excel»)
- Bằng chứng cần chụp: Ảnh cấu hình sau mở lại cho cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau); kết quả SELECT (bước 4); ảnh bản sao (bước 5).
- Sau khi chạy: Mẫu trích xuất có cấu hình đỏ.
- Ghi chú: Nhãn và vị trí màn khác nhau giữa hai khung Figma — xung đột giữa các frame Figma về “Nhãn và vị trí tùy chọn đỏ ở Trích xuất thành tích（成績抽出）”, kiểm ở case “Trích xuất: vị trí và nhãn tùy chọn đỏ”. Bước 4–5 theo thiết kế DB đề xuất: nếu build lưu/sao chép theo cách khác nhưng bước 1–3 vẫn đạt thì ghi Notes, không FAIL; nếu màn không có chức năng sao chép thì ghi "không áp dụng" cho bước 5.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-023"></a>

### TC-RS-FUNC-023 — Trích xuất: lọc giữ học sinh có ít nhất một ô đỏ trong phạm vi đang xét

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lọc khi trích xuất” (AC-G29 «Lọc khi trích xuất»)

<!-- Mã truy vết: TD-ITEM-03 «Mục điểm đơn vị: Điểm bài kiểm tra đơn vị（単元テスト点）, M mặc định 100», TD-STU-10 «S10: HR2», TD-STU-03 «S03: G-A, HR1», TD-STU-06 «S06: G-B, HR2», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-OUT-01 «Trích xuất lọc + ký hiệu trước + màu: Lọc học sinh có điểm đỏ（抽出する） BẬT», TD-OUT-02 «Trích xuất chỉ ký hiệu: Lọc TẮT», AC-G29, TC-RS-ERR-013 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Kết quả đã xét: S10 Toán 24 Đỏ, Ngữ văn 70 Không đỏ; S03 Không đỏ ở mọi môn. S10 có thêm ô Toán ở một thời điểm khác, Không đỏ. S06 có mục điểm đơn vị (đơn vị U1 có M riêng 40) U1 = 25 Đỏ, U2 = 35 Không đỏ.
- Dữ liệu test: học sinh S10 (học lớp G-B và G-C), học sinh S03 (điểm 31), học sinh S06 (điểm dự kiến 24), mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc “Cố định 30” (dưới 30), cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau)

**操作（Thao tác）**

1. Chạy trích xuất với cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, phạm vi gồm Toán và Ngữ văn.
2. Chạy lại với phạm vi chỉ Ngữ văn.
3. Chạy với cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) (lọc tắt).
4. Với cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, chọn thời điểm khác thời điểm có ô Toán Đỏ của S10 (ô Toán của thời điểm đó Không đỏ).
5. Với cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu và mục điểm đơn vị (đơn vị U1 có M riêng 40): S06 có U1 Đỏ, U2 Không đỏ; chọn phạm vi chỉ U2.

**期待結果（Kết quả mong đợi）**

1. Bước 1: S10 có trong danh sách, S03 không.
2. Bước 2: S10 không thỏa điều kiện đỏ (ô Toán ngoài phạm vi); danh sách rỗng là kết quả hợp lệ.
3. Bước 3: danh sách không bị lọc theo đỏ (chỉ bật ký hiệu không giới hạn học sinh).
4. Bước 4: S10 không có trong danh sách; ô đỏ ở thời điểm khác không giúp thỏa điều kiện.
5. Bước 5: S06 không có trong danh sách; ô đỏ của U1 ngoài phạm vi đơn vị.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Kết quả đã xét: S10 Toán 24 Đỏ, Ngữ văn 70 Không đỏ; S03 Không đỏ ở mọi môn. S10 có thêm ô Toán ở một thời điểm khác, Không đỏ. S06 có mục điểm đơn vị (đơn vị U1 có M riêng 40) U1 = 25 Đỏ, U2 = 35 Không đỏ. - Dữ liệu test: học sinh S10 (học lớp G-B và G-C), học sinh S03 (điểm 31), học sinh S06 (điểm dự kiến 24), mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc “Cố định 30” (dưới 30), cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình trích xuất chỉ ký hiệu (“※” trư | Trigger/điểm quan sát: 1. Chạy trích xuất với cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, phạm vi gồm Toán và Ngữ văn. 2. Chạy lại với phạm vi chỉ Ngữ văn. 3. Chạy với cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) (lọc tắt). 4. Với cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, chọn thời điểm khác thời điểm có ô Toán Đỏ của S10 (ô Toán của thời điểm đó Không đỏ). 5. Với cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu và mục điểm đơn vị (đơn vị U1 có M riêng 40): S06 có U1 Đỏ, U | Oracle/bằng chứng: 1. Bước 1: S10 có trong danh sách, S03 không. 2. Bước 2: S10 không thỏa điều kiện đỏ (ô Toán ngoài phạm vi); danh sách rỗng là kết quả hợp lệ. 3. Bước 3: danh sách không bị lọc theo đỏ (chỉ bật ký hiệu không giới hạn học sinh). 4. Bước 4: S10 không có trong danh sách; ô đỏ ở thời điểm khác không giúp thỏa điều kiện. 5. Bước 5: S06 không có trong danh sách; ô đỏ của U1 ngoài phạm vi đơn vị.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 9.1 “Thiết lập”, mục 9.2 “Kết quả và ví dụ”; Figma MW “chương 05 – trích xuất thành tích và kết quả Excel” (58:6243 «Figma MW: chương 05 – trích xuất thành tích và kết quả Excel») 「抽出ONだけが生徒を絞る。対象範囲に赤点セルが1つ以上ある生徒が対象。」 (chỉ bật trích xuất mới lọc học sinh; học sinh có ≥1 ô đỏ trong phạm vi); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Lọc khi trích xuất” (AC-G29 «Lọc khi trích xuất») ("trong môn/mục/thời điểm/đơn vị được chọn")
- Bằng chứng cần chụp: Ảnh kết quả năm lần chạy.
- Ghi chú: Kết hợp màu với bộ lọc khác: case “Trích xuất: ô vừa thỏa điều kiện màu khác vừa là ô đỏ” (thứ tự bộ lọc đỏ chưa chốt).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-024"></a>

### TC-RS-FUNC-024 — Trích xuất: chỉ ô đỏ được thêm ký hiệu/tô màu

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Hiển thị ô trích xuất” (AC-G30 «Hiển thị ô trích xuất»)

<!-- Mã truy vết: TC-RS-FUNC-023, TD-STU-10 «S10: HR2», TD-OUT-01 «Trích xuất lọc + ký hiệu trước + màu: Lọc học sinh có điểm đỏ（抽出する） BẬT», TD-OUT-02 «Trích xuất chỉ ký hiệu: Lọc TẮT» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Như case “Trích xuất: lọc giữ học sinh có ít nhất một ô đỏ trong phạm vi đang xét”.
- Dữ liệu test: học sinh S10 (học lớp G-B và G-C), cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau)

**操作（Thao tác）**

1. Chạy trích xuất cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, xem dòng S10.
2. Chạy cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau), xem dòng S10.

**期待結果（Kết quả mong đợi）**

1. cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu: ô Toán hiện `*24` với nền màu Đỏ（赤） của bảng màu; ô Ngữ văn `70` không ký hiệu, không màu; không tô cả dòng.
2. cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau): ô Toán `※24!`; ô Ngữ văn `70`.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Như case “Trích xuất: lọc giữ học sinh có ít nhất một ô đỏ trong phạm vi đang xét”. - Dữ liệu test: học sinh S10 (học lớp G-B và G-C), cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) | Trigger/điểm quan sát: 1. Chạy trích xuất cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, xem dòng S10. 2. Chạy cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau), xem dòng S10. | Oracle/bằng chứng: 1. cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu: ô Toán hiện `*24` với nền màu Đỏ（赤） của bảng màu; ô Ngữ văn `70` không ký hiệu, không màu; không tô cả dòng. 2. cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau): ô Toán `※24!`; ô Ngữ văn `70`.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 9.1 “Thiết lập”, mục 9.2 “Kết quả và ví dụ” (ví dụ `※24!`); Figma MW “chương 05 – trích xuất thành tích và kết quả Excel” (58:6246 «Figma MW: chương 05 – trích xuất thành tích và kết quả Excel») 「赤点のセルだけ装飾。生徒の全セルを赤くしない。」 (chỉ trang trí ô đỏ; không tô đỏ mọi ô của học sinh)
- Bằng chứng cần chụp: Ảnh kết quả; mã màu ô (inspect) so với bảng màu hiện có.
- Ghi chú: Màu nền quan sát được `#E38487`, chữ `#222222` chỉ là minh họa (đặc tả v2 mục 9.1 “Thiết lập”); đối chiếu palette thực tế. Màu lấy từ bảng màu hiện có; không ép mã `#E38487` (đặc tả v2 mục 9.1 “Thiết lập”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-025"></a>

### TC-RS-FUNC-025 — Trích xuất: file Excel khớp màn hình

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Excel khớp và dùng kết luận server” (AC-G31 «Excel khớp và dùng kết luận server»)

<!-- Mã truy vết: TC-RS-FUNC-024, TD-OUT-01 «Trích xuất lọc + ký hiệu trước + màu: Lọc học sinh có điểm đỏ（抽出する） BẬT», TD-OUT-02 «Trích xuất chỉ ký hiệu: Lọc TẮT», TD-STU-05 «S05: G-A, HR1», TD-STU-10 «S10: HR2», TC-RS-BR-010, TC-RS-ERR-014, AC-G31 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Như case “Trích xuất: chỉ ô đỏ được thêm ký hiệu/tô màu”; S05 có ô trống.
- Dữ liệu test: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau), học sinh S05 (ô trống), học sinh S10 (học lớp G-B và G-C)

**操作（Thao tác）**

1. Chạy trích xuất, chụp màn kết quả.
2. Xuất Excel, mở file.
3. Lặp bước 1–2 với: (a) cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) (lọc đỏ TẮT); (b) phạm vi không có ô đỏ nào (0 kết quả); (c) sau khi một ô Đỏ bị ngừng kết quả cũ (như case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”, Chưa xét được); (d) mục có điểm bị ẩn theo thiết lập ẩn mục nhập (như case “Mục bị ẩn theo thiết lập ẩn mục nhập”).

**期待結果（Kết quả mong đợi）**

1–2. Danh sách học sinh trong Excel giống màn hình (lọc đỏ đang bật). Cùng ô: ký hiệu, màu nền, số liệu, ô trống trong Excel giống màn hình. Ô trống không hiện số 0. Tải Excel không kích hoạt xét.

3. Mỗi biến thể: file Excel khớp màn hình cùng lần — (a) đủ học sinh, chỉ ô đỏ có ký hiệu/màu; (b) Excel không có học sinh giống màn hình; (c) ô bị ngừng kết quả cũ không còn ký hiệu/màu; (d) điểm ẩn không hiện lại trong Excel.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Như case “Trích xuất: chỉ ô đỏ được thêm ký hiệu/tô màu”; S05 có ô trống. - Dữ liệu test: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau), học sinh S05 (ô trống), học sinh S10 (học lớp G-B và G-C) | Trigger/điểm quan sát: 1. Chạy trích xuất, chụp màn kết quả. 2. Xuất Excel, mở file. 3. Lặp bước 1–2 với: (a) cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) (lọc đỏ TẮT); (b) phạm vi không có ô đỏ nào (0 kết quả); (c) sau khi một ô Đỏ bị ngừng kết quả cũ (như case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”, Chưa xét được); (d) mục có điểm bị ẩn theo thiết lập ẩn mục nhập (như case “Mục bị ẩn theo thiết lập ẩn mục nhập”). | Oracle/bằng chứng: 1–2. Danh sách học sinh trong Excel giống màn hình (lọc đỏ đang bật). Cùng ô: ký hiệu, màu nền, số liệu, ô trống trong Excel giống màn hình. Ô trống không hiện số 0. Tải Excel không kích hoạt xét. 3. Mỗi biến thể: file Excel khớp màn hình cùng lần — (a) đủ học sinh, chỉ ô đỏ có ký hiệu/màu; (b) Excel không có học sinh giống màn hình; (c) ô bị ngừng kết quả cũ không còn ký hiệu/màu; (d) điểm ẩn không hiện lại trong Excel.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 9.3 “Xuất file”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Excel khớp và dùng kết luận server” (AC-G31 «Excel khớp và dùng kết luận server») ("màn hình và Excel thật phải khớp đối tượng, ký hiệu, màu, ô trống và giá trị"); [tài liệu chia công việc v2](../split-tasks.vi.md) ([RSD-TASK](../split-tasks.vi.md) «bản chia công việc v2») công việc “Lọc điểm đỏ và hiển thị trên Excel” (Task 5 «Lọc điểm đỏ và hiển thị trên Excel») (kiểm màn hình và file Excel thật với lọc ON/OFF, 0 kết quả, ngừng dùng kết quả cũ và ẩn điểm); Figma MW “chương 05 – trích xuất thành tích và kết quả Excel” (58:6358 «Figma MW: chương 05 – trích xuất thành tích và kết quả Excel») 「Excelも赤点セルだけに記号・選択色を反映。空欄や非表示の点数を表示し直さない。」 (Excel cũng chỉ phản ánh ký hiệu/màu ở ô đỏ; không hiện lại ô trống hoặc điểm ẩn)
- Bằng chứng cần chụp: **File Excel thực** đính kèm cho mỗi lần chạy; ảnh màn hình cùng lần.
- Ghi chú: Định dạng xuất khác (PDF…) chỉ kiểm nếu trích xuất thực sự hỗ trợ.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-026"></a>

### TC-RS-FUNC-026 — Công khai thành tích（成績公開）: ba hiệu ứng đỏ hiển thị đúng ở màn học sinh

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Cấu hình công khai và ẩn điểm” (AC-G32 «Cấu hình công khai và ẩn điểm»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-ITEM-03 «Mục điểm đơn vị: Điểm bài kiểm tra đơn vị（単元テスト点）, M mặc định 100», TD-STU-01 «S01: G-A, HR1», TD-STU-06 «S06: G-B, HR2», TD-ROLE-05 «Học sinh: Học sinh S01 của trường A, có lịch công khai đang mở», TD-ROLE-07 «Người phụ trách đầu ra: Có quyền Trích xuất thành tích（成績抽出）, Thiết lập…», AC-G32, , TC-RS-UI-023 -->

**前提条件（Điều kiện trước）**

- Điều kiện: S01 Đỏ (29), không phải điểm dự kiến. Lịch công khai đang mở.
- Dữ liệu test: mục số nguyên (M=100); mục điểm đơn vị (đơn vị U1 có M riêng 40); học sinh S01 (điểm 29), học sinh S06 (điểm dự kiến 24), tài khoản học sinh S01, tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm)

**操作（Thao tác）**

1. Ở Thiết lập công khai thành tích（成績公開設定）, mục mục số nguyên (M=100), chọn hiệu ứng đỏ Ngoặc（括弧）, lưu. Đăng nhập S01 xem Xác nhận thành tích（成績確認）.
2. Lặp với `*` phía trước.
3. Lặp với `*` phía sau.
4. Mở lại Thiết lập công khai thành tích.
5. Với mục điểm đơn vị mục điểm đơn vị (đơn vị U1 có M riêng 40) (S06 U1 = 25 Đỏ), chọn `*` phía trước, lưu; đăng nhập S06 xem.

**期待結果（Kết quả mong đợi）**

1–3. Lần lượt `(29)`, `*29`, `29*`. Không có nền màu riêng cho ô đỏ.

4. Hiệu ứng đã lưu gần nhất (`*` phía sau) được chọn sẵn.
5. Ô U1 hiện `*25`; ô U2 không ký hiệu.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: S01 Đỏ (29), không phải điểm dự kiến. Lịch công khai đang mở. - Dữ liệu test: mục số nguyên (M=100); mục điểm đơn vị (đơn vị U1 có M riêng 40); học sinh S01 (điểm 29), học sinh S06 (điểm dự kiến 24), tài khoản học sinh S01, tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm) | Trigger/điểm quan sát: 1. Ở Thiết lập công khai thành tích（成績公開設定）, mục mục số nguyên (M=100), chọn hiệu ứng đỏ Ngoặc（括弧）, lưu. Đăng nhập S01 xem Xác nhận thành tích（成績確認）. 2. Lặp với `*` phía trước. 3. Lặp với `*` phía sau. 4. Mở lại Thiết lập công khai thành tích. 5. Với mục điểm đơn vị mục điểm đơn vị (đơn vị U1 có M riêng 40) (S06 U1 = 25 Đỏ), chọn `*` phía trước, lưu; đăng nhập S06 xem. | Oracle/bằng chứng: 1–3. Lần lượt `(29)`, `*29`, `29*`. Không có nền màu riêng cho ô đỏ. 4. Hiệu ứng đã lưu gần nhất (`*` phía sau) được chọn sẵn. 5. Ô U1 hiện `*25`; ô U2 không ký hiệu.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?” (Q16 «Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 10.1 “Phạm vi và tùy chọn”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Cấu hình công khai và ẩn điểm” (AC-G32 «Cấu hình công khai và ẩn điểm») ("Lưu/mở lại … cho mục được thiết lập trong phạm vi điểm thường/đơn vị"); Figma “tùy chọn đỏ ở Công khai thành tích (đặc tả v2: 06-A)” (07B «Figma: tùy chọn đỏ ở Công khai thành tích (đặc tả v2: 06-A) — MW 58:5622»)/“màn học sinh xem thành tích công khai (đặc tả v2: 06-B)” (08B «Figma: màn học sinh xem thành tích công khai (đặc tả v2: 06-B) — MW 58:5805») 4595-2269, 4595-2453; Figma MW “chương 06 – dòng Cách hiển thị điểm đỏ（赤点の表示方法）có/không hiện” (58:5602–5610 «Figma MW: chương 06 – dòng Cách hiển thị điểm đỏ（赤点の表示方法）có/không hiện»)
- Bằng chứng cần chụp: Ảnh cấu hình (cả khi mở lại) và ảnh màn học sinh cho mỗi hiệu ứng.
- Ghi chú: Tùy chọn "nguyên trạng" trên Figma: xung đột Figma–đặc tả về “Tùy chọn hiển thị đỏ ở Công khai thành tích（成績公開）” (case “Công khai: danh sách tùy chọn hiển thị đỏ”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-027"></a>

### TC-RS-FUNC-027 — Công khai: kết hợp hiệu ứng Điểm dự kiến（見込点） và điểm đỏ, khử trùng

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kết hợp hiệu ứng công khai” (AC-G33 «Kết hợp hiệu ứng công khai»)

<!-- Mã truy vết: TD-STU-06 «S06: G-B, HR2», TD-ROLE-05 «Học sinh: Học sinh S01 của trường A, có lịch công khai đang mở», SI-03 «Kết hợp hiệu ứng ở công khai» -->

**前提条件（Điều kiện trước）**

- Điều kiện: S06 = 24, vừa là Điểm dự kiến（見込点） vừa Đỏ.
- Dữ liệu test: học sinh S06 (điểm dự kiến 24), tài khoản học sinh S01

**操作（Thao tác）**

Với mỗi dòng của bảng dưới, cấu hình hiệu ứng dự kiến và hiệu ứng đỏ, lưu, xem màn học sinh của S06.

(a) Ngoặc + `*` trước; (b) `*` trước + `*` trước; (c) Ngoặc + Ngoặc; (d) `*` trước + `*` sau; (e) không trang trí + Ngoặc; (f) điểm bị ẩn theo thiết lập hiện có（表示しない） + `*` trước.

**期待結果（Kết quả mong đợi）**

(a) `(*24)`; (b) `*24`, không phải `**24`; (c) `(24)`, không phải `((24))`; (d) `*24*`; (e) `(24)`; (f) vẫn ẩn, không hiện số, không để lại riêng dấu `*`.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: S06 = 24, vừa là Điểm dự kiến（見込点） vừa Đỏ. - Dữ liệu test: học sinh S06 (điểm dự kiến 24), tài khoản học sinh S01 | Trigger/điểm quan sát: Với mỗi dòng của bảng dưới, cấu hình hiệu ứng dự kiến và hiệu ứng đỏ, lưu, xem màn học sinh của S06. (a) Ngoặc + `*` trước; (b) `*` trước + `*` trước; (c) Ngoặc + Ngoặc; (d) `*` trước + `*` sau; (e) không trang trí + Ngoặc; (f) điểm bị ẩn theo thiết lập hiện có（表示しない） + `*` trước. | Oracle/bằng chứng: (a) `(*24)`; (b) `*24`, không phải `**24`; (c) `(24)`, không phải `((24))`; (d) `*24*`; (e) `(24)`; (f) vẫn ẩn, không hiện số, không để lại riêng dấu `*`.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Công khai thành tích kết hợp điểm dự kiến và điểm đỏ thế nào?” (Q30 «Công khai thành tích kết hợp điểm dự kiến và điểm đỏ thế nào?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 10.2 “Kết hợp điểm dự kiến và điểm đỏ”; Figma MW “chương 06 – công khai thành tích và màn học sinh” (58:5596–5597 «Figma MW: chương 06 – công khai thành tích và màn học sinh»); CODE `GradePublishService.php:1113-1166` (chuẩn hóa `*(`→`(*`; hiệu ứng trùng hiện đang chồng)
- Bằng chứng cần chụp: Ảnh màn học sinh cho từng dòng (a)–(f).
- Ghi chú: (a), (b) xác nhận trực tiếp (Q&A nghiệp vụ đã xác nhận câu “Công khai thành tích kết hợp điểm dự kiến và điểm đỏ thế nào?”); (c)–(f) cụ thể hóa cùng quy tắc (đặc tả v2 mục 10.2 “Kết hợp điểm dự kiến và điểm đỏ”). Code hiện chồng hiệu ứng trùng → `**24` (khác biệt đặc tả–code về “Kết hợp hiệu ứng ở công khai”). (f): cách hiện thực chưa chốt.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-028"></a>

### TC-RS-FUNC-028 — Công khai: web, API và PDF học sinh dùng cùng kết quả và cùng hiệu ứng

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đúng người, lịch và đầu ra công khai” (AC-G34 «Đúng người, lịch và đầu ra công khai»)

<!-- Mã truy vết: TC-RS-FUNC-026, TD-STU-01 «S01: G-A, HR1», TD-ROLE-05 «Học sinh: Học sinh S01 của trường A, có lịch công khai đang mở» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Như case “Công khai thành tích（成績公開）: ba hiệu ứng đỏ hiển thị đúng ở màn học sinh” với hiệu ứng `*` trước.
- Dữ liệu test: học sinh S01 (điểm 29), tài khoản học sinh S01

**操作（Thao tác）**

1. Xem màn web Xác nhận thành tích（成績確認） của S01.
2. Gọi API công khai thành tích của S01 bằng phiên học sinh.
3. Tải PDF công khai của S01.

**期待結果（Kết quả mong đợi）**

Cả ba hiển thị `*29` cho cùng ô; không nền màu.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Như case “Công khai thành tích（成績公開）: ba hiệu ứng đỏ hiển thị đúng ở màn học sinh” với hiệu ứng `*` trước. - Dữ liệu test: học sinh S01 (điểm 29), tài khoản học sinh S01 | Trigger/điểm quan sát: 1. Xem màn web Xác nhận thành tích（成績確認） của S01. 2. Gọi API công khai thành tích của S01 bằng phiên học sinh. 3. Tải PDF công khai của S01. | Oracle/bằng chứng: Cả ba hiển thị `*29` cho cùng ô; không nền màu.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 10.3 “Quyền, thời điểm và đầu ra liên quan”; CODE `WebGradePublishController`, `ApiGradePublishController`, `GradePublishPdfService` → `GradePublishService::getGradeData`
- Bằng chứng cần chụp: Ảnh web; response API (đã che thông tin cá nhân); **file PDF thực**.
- Ghi chú: Cần tài khoản học sinh test. Không dùng màn giáo viên thay màn học sinh.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-029"></a>

### TC-RS-FUNC-029 — Công cụ phiếu điểm（通知表ツール）: bốn cách hiển thị đỏ trên PDF

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Tùy chọn trên phiếu” (AC-G35 «Tùy chọn trên phiếu»)

<!-- Mã truy vết: TD-STU-01 «S01: G-A, HR1», TD-OUT-04 «Phiếu điểm: Dòng Thiết lập điểm đỏ（赤点設定）: Ký tự phía trước（前に任意の文字） `※`», TD-ROLE-07 «Người phụ trách đầu ra: Có quyền Trích xuất thành tích（成績抽出）, Thiết lập…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: S01 Đỏ (29), không điểm dự kiến, không cờ nào. Các dòng khác của hộp tùy chọn chọn Nguyên trạng（そのまま表示）.
- Dữ liệu test: học sinh S01 (điểm 29), cấu hình phiếu điểm: ký tự “※” phía trước, tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm)

**操作（Thao tác）**

Với từng cách hiển thị: chọn ở dòng Thiết lập điểm đỏ（赤点設定）, đóng hộp, bấm Cập nhật（更新する）, xuất PDF phiếu của S01.

(a) Nguyên trạng（そのまま表示）; (b) Kèm ngoặc（カッコ付き）; (c) Ký tự phía trước（前に任意の文字） `※`; (d) Ký tự phía sau（後ろに任意の文字） `※`.

**期待結果（Kết quả mong đợi）**

(a) `29`; (b) `(29)`; (c) `※29`; (d) `29※`. Không nền màu; ký tự không tràn ô, không mất ký tự, không đổi cấu trúc template.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: S01 Đỏ (29), không điểm dự kiến, không cờ nào. Các dòng khác của hộp tùy chọn chọn Nguyên trạng（そのまま表示）. - Dữ liệu test: học sinh S01 (điểm 29), cấu hình phiếu điểm: ký tự “※” phía trước, tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm) | Trigger/điểm quan sát: Với từng cách hiển thị: chọn ở dòng Thiết lập điểm đỏ（赤点設定）, đóng hộp, bấm Cập nhật（更新する）, xuất PDF phiếu của S01. (a) Nguyên trạng（そのまま表示）; (b) Kèm ngoặc（カッコ付き）; (c) Ký tự phía trước（前に任意の文字） `※`; (d) Ký tự phía sau（後ろに任意の文字） `※`. | Oracle/bằng chứng: (a) `29`; (b) `(29)`; (c) `※29`; (d) `29※`. Không nền màu; ký tự không tràn ô, không mất ký tự, không đổi cấu trúc template.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?” (Q16 «Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 11.1 “Tùy chọn hiển thị đỏ”; Figma MW “chương 07 – phiếu điểm PDF” (58:5111 «Figma MW: chương 07 – phiếu điểm PDF») (07), “tùy chọn đỏ ở Công cụ phiếu điểm (đặc tả v2: 07-A)” (58:5176 «Figma MW: tùy chọn đỏ ở Công cụ phiếu điểm (đặc tả v2: 07-A)») (UI 07C «Figma: tùy chọn đỏ ở Công cụ phiếu điểm (đặc tả v2: 07-A) — MW 58:5176»), (58:5128) 「29点は赤点の前記号で※29。25点は通常表示。赤点の背景色は追加しない。」 (29 điểm là đỏ → ※29; 25 điểm hiển thị thường; không thêm nền đỏ)
- Bằng chứng cần chụp: **File PDF thực** cho (a)–(d).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-030"></a>

### TC-RS-FUNC-030 — Phiếu điểm: thứ tự điều kiện và dừng ở điều kiện khớp đầu tiên

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Phiếu dừng ở điều kiện khớp đầu tiên” (AC-G36 «Phiếu dừng ở điều kiện khớp đầu tiên»)

<!-- Mã truy vết: TD-STU-06 «S06: G-B, HR2», TD-STU-01 «S01: G-A, HR1», TD-STU-05 «S05: G-A, HR1», TD-OUT-04 «Phiếu điểm: Dòng Thiết lập điểm đỏ（赤点設定）: Ký tự phía trước（前に任意の文字） `※`», AC-G36 -->

**前提条件（Điều kiện trước）**

- Điều kiện: S06 = 24 vừa dự kiến vừa Đỏ; S01 = 29 Đỏ, không cờ; S05 ô trống, trước đó từng Đỏ.
- Dữ liệu test: học sinh S06 (điểm dự kiến 24), học sinh S01 (điểm 29), học sinh S05 (ô trống), cấu hình phiếu điểm: ký tự “※” phía trước

**操作（Thao tác）**

Cấu hình hộp tùy chọn theo từng dòng, bấm Cập nhật（更新する）, xuất PDF.

(a) Dự kiến = Kèm ngoặc; đỏ = `※` trước → xem S06.

(b) Dự kiến = Nguyên trạng; đỏ = `※` trước → xem S06.

(c) Dự kiến = Ẩn（表示しない） hoặc Gạch chéo（斜線）; đỏ = `※` trước → xem S06.

(d) Không điều kiện phía trên khớp; đỏ = `※` trước → xem S01.

(e) Ô trống（空欄の場合）= Kèm ngoặc; đỏ = `※` trước → xem S05.

(f) Trường hợp môn cụ thể（特定の科目の場合） = Toán, Kèm ngoặc; đỏ = `※` trước → xem S01 (Toán, Đỏ).

(g) Tạm gắn thêm cờ Chưa dự thi（未受験） cho S06; Dự kiến = Nguyên trạng, Chưa dự thi = Ẩn（表示しない）; đỏ = `※` trước → xem S06.

**期待結果（Kết quả mong đợi）**

(a) `(24)`, không thêm `※`; (b) `24`, không chuyển xuống điều kiện đỏ; (c) giữ ẩn/gạch chéo, đỏ không làm hiện lại điểm; (d) `※29`; (e) không áp dấu đỏ của kết quả cũ; ô trống hiển thị theo cấu hình ô trống; (f) `(29)`, điều kiện môn cụ thể thắng, không thêm `※`; (g) `24`: Nguyên trạng ở dòng dự kiến dừng xét, không áp lệnh Ẩn của dòng chưa dự thi phía sau.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: S06 = 24 vừa dự kiến vừa Đỏ; S01 = 29 Đỏ, không cờ; S05 ô trống, trước đó từng Đỏ. - Dữ liệu test: học sinh S06 (điểm dự kiến 24), học sinh S01 (điểm 29), học sinh S05 (ô trống), cấu hình phiếu điểm: ký tự “※” phía trước | Trigger/điểm quan sát: Cấu hình hộp tùy chọn theo từng dòng, bấm Cập nhật（更新する）, xuất PDF. (a) Dự kiến = Kèm ngoặc; đỏ = `※` trước → xem S06. (b) Dự kiến = Nguyên trạng; đỏ = `※` trước → xem S06. (c) Dự kiến = Ẩn（表示しない） hoặc Gạch chéo（斜線）; đỏ = `※` trước → xem S06. (d) Không điều kiện phía trên khớp; đỏ = `※` trước → xem S01. (e) Ô trống（空欄の場合）= Kèm ngoặc; đỏ = `※` trước → xem S05. (f) Trường hợp môn cụ thể（特定の科目の場合） = Toán, Kèm ngoặc; đỏ = `※` trước → xem S01 (Toán, Đỏ). (g) Tạm gắn thêm cờ Chưa dự thi（未受験） cho S06;  | Oracle/bằng chứng: (a) `(24)`, không thêm `※`; (b) `24`, không chuyển xuống điều kiện đỏ; (c) giữ ẩn/gạch chéo, đỏ không làm hiện lại điểm; (d) `※29`; (e) không áp dấu đỏ của kết quả cũ; ô trống hiển thị theo cấu hình ô trống; (f) `(29)`, điều kiện môn cụ thể thắng, không thêm `※`; (g) `24`: Nguyên trạng ở dòng dự kiến dừng xét, không áp lệnh Ẩn của dòng chưa dự thi phía sau.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Điều kiện điểm đỏ nằm ở đâu trên phiếu điểm?” (Q29 «Điều kiện điểm đỏ nằm ở đâu trên phiếu điểm?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 11.2 “Thứ tự và điều kiện khớp đầu tiên”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Phiếu dừng ở điều kiện khớp đầu tiên” (AC-G36 «Phiếu dừng ở điều kiện khớp đầu tiên») ("xét môn cụ thể → ô chọn theo thứ tự → đỏ → ô trống → bình thường"; "Nguyên trạng cũng dừng, không tìm tiếp lệnh ẩn phía sau"); Figma MW “tùy chọn đỏ ở Công cụ phiếu điểm (đặc tả v2: 07-A)” (58:5176 «Figma MW: tùy chọn đỏ ở Công cụ phiếu điểm (đặc tả v2: 07-A)») (thứ tự hiển thị 特定の科目の場合 (trường hợp môn cụ thể) → [見込点]チェック (checkbox điểm dự kiến) → [未受験]チェック (checkbox chưa dự thi) → 赤点設定 (thiết lập điểm đỏ) → 空欄の場合 (trường hợp ô trống)); CODE `ReportWidgetGradesNormalData.php:734-798`
- Bằng chứng cần chụp: **File PDF thực** cho (a)–(g); ảnh hộp tùy chọn.
- Ghi chú: (e): Q&A nghiệp vụ đã xác nhận câu “Điều kiện điểm đỏ nằm ở đâu trên phiếu điểm?” đặt đỏ trước ô trống; ô trống ở trạng thái Không có điểm nên không có kết quả đỏ hiện hành (đặc tả v2 mục 11.2 “Thứ tự và điều kiện khớp đầu tiên”) — cách hiện thực TBD. Không kết hợp hiệu ứng như màn công khai. (g): gỡ cờ Chưa dự thi của S06 sau khi chạy.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-031"></a>

### TC-RS-FUNC-031 — Phiếu điểm: lưu qua Cập nhật（更新する）, mở lại giữ lựa chọn; chỉ dùng điều kiện đỏ vẫn được ghi nhận

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu, sao chép và PDF phiếu” (AC-G37 «Lưu, sao chép và PDF phiếu»)

<!-- Mã truy vết: TD-OUT-04 «Phiếu điểm: Dòng Thiết lập điểm đỏ（赤点設定）: Ký tự phía trước（前に任意の文字） `※`», AC-G37, TC-RS-DATA-011 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Bảng điểm（成績表） chưa dùng điều kiện nào (Thiết lập điều kiện hiển thị（表示条件を設定）= Không thiết lập（設定しない）).
- Dữ liệu test: cấu hình phiếu điểm: ký tự “※” phía trước

**操作（Thao tác）**

1. Mở hộp tùy chọn, chọn Thiết lập（設定する）, chỉ chọn dòng đỏ = `※` trước, các dòng khác Nguyên trạng. Đóng hộp, **không** bấm Cập nhật; tải lại trang.
2. Lặp lại, lần này bấm Cập nhật（更新する）; tải lại, mở hộp.
3. Xuất PDF.

**期待結果（Kết quả mong đợi）**

1. Không bấm Cập nhật: thay đổi không được lưu (hành vi hiện có).
2. Có bấm Cập nhật: mở lại thấy dòng đỏ = `※` trước; bảng được ghi nhận là có dùng điều kiện dù chỉ điều kiện đỏ được chọn.
3. PDF áp dụng điều kiện đỏ.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Bảng điểm（成績表） chưa dùng điều kiện nào (Thiết lập điều kiện hiển thị（表示条件を設定）= Không thiết lập（設定しない）). - Dữ liệu test: cấu hình phiếu điểm: ký tự “※” phía trước | Trigger/điểm quan sát: 1. Mở hộp tùy chọn, chọn Thiết lập（設定する）, chỉ chọn dòng đỏ = `※` trước, các dòng khác Nguyên trạng. Đóng hộp, **không** bấm Cập nhật; tải lại trang. 2. Lặp lại, lần này bấm Cập nhật（更新する）; tải lại, mở hộp. 3. Xuất PDF. | Oracle/bằng chứng: 1. Không bấm Cập nhật: thay đổi không được lưu (hành vi hiện có). 2. Có bấm Cập nhật: mở lại thấy dòng đỏ = `※` trước; bảng được ghi nhận là có dùng điều kiện dù chỉ điều kiện đỏ được chọn. 3. PDF áp dụng điều kiện đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 11.1 “Tùy chọn hiển thị đỏ”, mục 11.3 “Lưu và xuất”; Figma MW “chương 07 – phiếu điểm PDF” (58:5111 «Figma MW: chương 07 – phiếu điểm PDF») ghi chú đóng hộp chưa lưu, “tùy chọn đỏ ở Công cụ phiếu điểm (đặc tả v2: 07-A)” (07C «Figma: tùy chọn đỏ ở Công cụ phiếu điểm (đặc tả v2: 07-A) — MW 58:5176») 「※変更後はビューエリアの下の「更新する」ボタンを押してください。」 (sau khi đổi, bấm nút 「Cập nhật」 bên dưới vùng xem); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Lưu, sao chép và PDF phiếu” (AC-G37 «Lưu, sao chép và PDF phiếu»); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 5.1 “Thiết lập hiển thị của Trích xuất thành tích（成績抽出）và Công cụ phiếu điểm（通知表ツール）” (lưu vào phần lưu bảng/điều kiện hiện có, không thêm cột riêng — PROPOSED)
- Bằng chứng cần chụp: Ảnh hộp sau tải lại (hai lần); **file PDF thực**.
- Sau khi chạy: Bảng dùng điều kiện đỏ.
- Ghi chú: Mặc định Nguyên trạng cho dòng đỏ là PROPOSED (đặc tả v2 mục 11.1 “Tùy chọn hiển thị đỏ” Đề xuất mặc định). Nơi lưu vật lý không phải điều kiện PASS/FAIL; kiểm cột/bảng mới ở case “Bảng/cột mới theo quy tắc schema của BLEND”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-032"></a>

### TC-RS-FUNC-032 — Ba đầu ra dùng cùng kết quả cho cùng ô

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật” (AC-G22 «Kết quả chung và thứ tự cập nhật»)

<!-- Mã truy vết: TD-STU-01 «S01: G-A, HR1», TD-STU-03 «S03: G-A, HR1», TD-STU-05 «S05: G-A, HR1», TD-OUT-01 «Trích xuất lọc + ký hiệu trước + màu: Lọc học sinh có điểm đỏ（抽出する） BẬT», TD-OUT-03 «Công khai: Hiệu ứng đỏ: `*` phía trước（前に「*」）», TD-OUT-04 «Phiếu điểm: Dòng Thiết lập điểm đỏ（赤点設定）: Ký tự phía trước（前に任意の文字） `※`» -->

**前提条件（Điều kiện trước）**

- Điều kiện: cùng một lượt xét đã lưu kết quả S01 Đỏ, S03 Không đỏ, S05 Không có điểm; actor có quyền xem trích xuất, công khai và phiếu điểm.
- Dữ liệu test: S01 `S=29`, S03 `S=31`, S05 ô trống; cấu hình trích xuất lọc + “*” + tô màu; công khai “*”; phiếu điểm “※”.

**操作（Thao tác）**

1. Chạy trích xuất một lần với lọc bật và lưu file Excel trước/sau khi xem lại.
2. Mở màn học sinh công khai của cùng kỳ và cùng lượt xét.
3. Xuất PDF phiếu điểm của cùng học sinh/kỳ.
4. Đối chiếu ba output với kết quả đã lưu, không chỉ đối chiếu giao diện.

**期待結果（Kết quả mong đợi）**

Cả ba đầu ra đều dùng cùng kết quả đã lưu: S01 có dấu đỏ theo cấu hình riêng của từng output; S03 không có dấu đỏ; S05 không bị coi là điểm 0 và không có dấu đỏ. Excel phải giữ nguyên dữ liệu; màn công khai và PDF không được tự chọn lại rule hoặc tính lại ngưỡng. Nếu chạy lại sau khi chỉ xem/xuất, kết quả và bằng chứng phải không đổi.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: cùng một lượt xét đã lưu kết quả S01 Đỏ, S03 Không đỏ, S05 Không có điểm; actor có quyền xem trích xuất, công khai và phiếu điểm. - Dữ liệu test: S01 `S=29`, S03 `S=31`, S05 ô trống; cấu hình trích xuất lọc + “*” + tô màu; công khai “*”; phiếu điểm “※”. | Trigger/điểm quan sát: 1. Chạy trích xuất một lần với lọc bật và lưu file Excel trước/sau khi xem lại. 2. Mở màn học sinh công khai của cùng kỳ và cùng lượt xét. 3. Xuất PDF phiếu điểm của cùng học sinh/kỳ. 4. Đối chiếu ba output với kết quả đã lưu, không chỉ đối chiếu giao diện. | Oracle/bằng chứng: Cả ba đầu ra đều dùng cùng kết quả đã lưu: S01 có dấu đỏ theo cấu hình riêng của từng output; S03 không có dấu đỏ; S05 không bị coi là điểm 0 và không có dấu đỏ. Excel phải giữ nguyên dữ liệu; màn công khai và PDF không được tự chọn lại rule hoặc tính lại ngưỡng. Nếu chạy lại sau khi chỉ xem/xuất, kết quả và bằng chứng phải không đổi.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?” (Q16 «Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.1 “Trình tự cho một ô” bước 7; Figma MW “chương 00 – hướng dẫn đọc và luồng tổng thể” (58:10203 «Figma MW: chương 00 – hướng dẫn đọc và luồng tổng thể») 「3出力は同じ有効な判定結果を参照。」 (ba đầu ra tham chiếu cùng kết quả có hiệu lực)
- Bằng chứng cần chụp: Ảnh/file của ba đầu ra trong cùng thời điểm.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-033"></a>

### TC-RS-FUNC-033 — Đổi tên quy tắc: giữ liên kết, thứ tự và kết quả

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04 «Lưu và mở lại nhiều thiết lập»)

<!-- Mã truy vết: TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-STU-01 «S01: G-A, HR1», AC-G04 -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc “Cố định 30” (dưới 30) đã xét: S01 Đỏ.
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29)

**操作（Thao tác）**

1. Đổi tên quy tắc “Cố định 30” (dưới 30) từ "Cố định 30" thành "Ngưỡng học kỳ 1", Lưu.
2. Xem danh sách và ba đầu ra.
3. Chạy lại bằng đăng ký điểm S01=29.

**期待結果（Kết quả mong đợi）**

1–2. Danh sách hiện tên mới ở cùng vị trí ưu tiên, tóm tắt không đổi; S01 vẫn Đỏ ở ba đầu ra.

3. S01 Đỏ; quy tắc được chọn vẫn là quy tắc đã đổi tên (không tạo quy tắc mới, không mất liên kết).

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: quy tắc “Cố định 30” (dưới 30) đã xét: S01 Đỏ. - Dữ liệu test: quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29) | Trigger/điểm quan sát: 1. Đổi tên quy tắc “Cố định 30” (dưới 30) từ "Cố định 30" thành "Ngưỡng học kỳ 1", Lưu. 2. Xem danh sách và ba đầu ra. 3. Chạy lại bằng đăng ký điểm S01=29. | Oracle/bằng chứng: 1–2. Danh sách hiện tên mới ở cùng vị trí ưu tiên, tóm tắt không đổi; S01 vẫn Đỏ ở ba đầu ra. 3. S01 Đỏ; quy tắc được chọn vẫn là quy tắc đã đổi tên (không tạo quy tắc mới, không mất liên kết).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 4.2 “Nội dung một dòng” ("Tên chỉ để nhận biết, không dùng làm khóa liên kết dữ liệu"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04 «Lưu và mở lại nhiều thiết lập») ("Đổi tên giữ liên kết"); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 2.1 “`red_score_settings`” (`setting_name` không dùng làm khóa)
- Bằng chứng cần chụp: Ảnh danh sách trước/sau; ảnh đầu ra; SELECT `red_score_setting_id` (khi có schema).
- Sau khi chạy: Đổi lại tên "Cố định 30".

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-034"></a>

### TC-RS-FUNC-034 — Nguồn của điều kiện áp dụng và nguồn của công thức lưu độc lập

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu»)

<!-- Mã truy vết: AC-G12 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Ba nguồn cùng Thiết lập tổng hợp thứ hạng（順位集計設定） và nhóm ホームルーム (lớp chủ nhiệm), khác Thời kỳ tổng hợp（集計対象時期）: P `A=60`; P2 `A=70`; Q `A=40`.
- Dữ liệu test: Quy tắc: điều kiện Trung bình（平均点） `≥50` dùng nguồn P; ngưỡng Công thức（計算式） `A×0.5` dùng nguồn Q; `<`. S = 25

**操作（Thao tác）**

1. Lưu quy tắc, mở lại.
2. Chỉ đổi nguồn của điều kiện từ P sang P2, Lưu, mở lại.
3. Chạy nút cam.
4. Trên form, đổi Thời kỳ tổng hợp（集計対象時期） của nguồn điều kiện sang kỳ mà Thiết lập tổng hợp thứ hạng（順位集計設定） đang chọn vẫn hợp lệ; rồi đổi sang kỳ mà thiết lập đó không còn hợp lệ. Xem các ô chọn phụ thuộc sau mỗi lần đổi.

**期待結果（Kết quả mong đợi）**

1. Mỗi phần hiện đúng nguồn của mình (điều kiện: P; công thức: Q).
2. Điều kiện dùng P2; công thức vẫn dùng Q.
3. `70≥50` khớp; `T=40×0.5=20` → S=25 Không đỏ. Nếu công thức bị đổi theo P2 (`T=35`) hoặc dùng P (`T=30`) thì S=25 thành Đỏ — sai.
4. (PROPOSED) Chỉ lựa chọn phụ thuộc không còn hợp lệ bị xóa; lựa chọn còn hợp lệ được giữ; nguồn của công thức không đổi.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Ba nguồn cùng Thiết lập tổng hợp thứ hạng（順位集計設定） và nhóm ホームルーム (lớp chủ nhiệm), khác Thời kỳ tổng hợp（集計対象時期）: P `A=60`; P2 `A=70`; Q `A=40`. - Dữ liệu test: Quy tắc: điều kiện Trung bình（平均点） `≥50` dùng nguồn P; ngưỡng Công thức（計算式） `A×0.5` dùng nguồn Q; `<`. S = 25 | Trigger/điểm quan sát: 1. Lưu quy tắc, mở lại. 2. Chỉ đổi nguồn của điều kiện từ P sang P2, Lưu, mở lại. 3. Chạy nút cam. 4. Trên form, đổi Thời kỳ tổng hợp（集計対象時期） của nguồn điều kiện sang kỳ mà Thiết lập tổng hợp thứ hạng（順位集計設定） đang chọn vẫn hợp lệ; rồi đổi sang kỳ mà thiết lập đó không còn hợp lệ. Xem các ô chọn phụ thuộc sau mỗi lần đổi. | Oracle/bằng chứng: 1. Mỗi phần hiện đúng nguồn của mình (điều kiện: P; công thức: Q). 2. Điều kiện dùng P2; công thức vẫn dùng Q. 3. `70≥50` khớp; `T=40×0.5=20` → S=25 Không đỏ. Nếu công thức bị đổi theo P2 (`T=35`) hoặc dùng P (`T=30`) thì S=25 thành Đỏ — sai. 4. (PROPOSED) Chỉ lựa chọn phụ thuộc không còn hợp lệ bị xóa; lựa chọn còn hợp lệ được giữ; nguồn của công thức không đổi.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.4 “Bộ thông tin nguồn” ("Mỗi nơi sử dụng nguồn phải lưu đủ lựa chọn của chính nó"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu») ("sửa phần này không đổi phần kia"); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 3.1 “Bộ thông tin nguồn” (nguồn công thức ở cột quy tắc, nguồn điều kiện trong `apply_condition` — PROPOSED)
- Bằng chứng cần chụp: Ảnh form sau mỗi lần mở lại và sau mỗi lần đổi ở bước 4; ảnh kết quả.
- Ghi chú: Một bộ nguồn cho mọi toán hạng `A` trong công thức là PROPOSED (đặc tả v2 mục 5.4 “Bộ thông tin nguồn” Đề xuất thiết kế). Bước 4 theo đề xuất của tài liệu chia công việc v2 công việc “Thiết lập và lưu nhiều quy tắc” ("Đổi nguồn chỉ xóa lựa chọn phụ thuộc không còn hợp lệ") và tài liệu chia công việc v2 công việc “Hỗ trợ điều kiện và công thức dùng tổng hợp” ("đổi nguồn điều kiện không ngầm đổi nguồn công thức"). Phụ thuộc phạm vi đợt có công thức và điều kiện trung bình (phạm vi phát hành chưa chốt — đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-035"></a>

### TC-RS-FUNC-035 — Nhập CSV đăng ký điểm lớp chủ nhiệm hàng loạt（HR成績CSV一括登録） kích hoạt xét

Priority: TBD ｜ Status: TBD ｜ Requirement ID: tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23 «Bao phủ đường đăng ký và chạy lại»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-STU-01 «S01: G-A, HR1», SI-10 «Nhập CSV HR ở trường không có AutoRating» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30). Chạy hai lần: (a) trường có tính tự động, (b) trường không có tính tự động.
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29)

**操作（Thao tác）**

1. Nhập CSV đăng ký điểm lớp chủ nhiệm hàng loạt（HR成績CSV一括登録） với S01=28.
2. Xem kết quả.

**期待結果（Kết quả mong đợi）**

Theo đặc tả v2 mục 7.2 “Bảng sự kiện”: nhập thành công → S01 Đỏ. tài liệu chia công việc v2 chưa đưa đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)” vào đường được hỗ trợ; code đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)” chỉ xếp hàng khi trường dùng tính tự động (context điểm đỏ khoảng trống tích hợp “Không có công thức / điểm sửa tay”) — cần xác nhận đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)” có thuộc đợt không.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30). Chạy hai lần: (a) trường có tính tự động, (b) trường không có tính tự động. - Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29) | Trigger/điểm quan sát: 1. Nhập CSV đăng ký điểm lớp chủ nhiệm hàng loạt（HR成績CSV一括登録） với S01=28. 2. Xem kết quả. | Oracle/bằng chứng: Theo đặc tả v2 mục 7.2 “Bảng sự kiện”: nhập thành công → S01 Đỏ. tài liệu chia công việc v2 chưa đưa đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)” vào đường được hỗ trợ; code đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)” chỉ xếp hàng khi trường dùng tính tự động (context điểm đỏ khoảng trống tích hợp “Không có công thức / điểm sửa tay”) — cần xác nhận đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)” có thuộc đợt không.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.2 “Bảng sự kiện” (Nhập CSV điểm); khác biệt đặc tả–code về “Nhập CSV HR (đường ghi điểm HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)) ở trường không có AutoRating” (SI-10 «Nhập CSV HR ở trường không có AutoRating»); CODE đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)” `AdminGradeBulkInputCsvController::itemImport`; [tài liệu chia công việc v2](../split-tasks.vi.md) ([RSD-TASK](../split-tasks.vi.md) «bản chia công việc v2») công việc “Cập nhật kết quả khi đăng ký và chạy hàng loạt” (Task 4 «Cập nhật kết quả khi đăng ký và chạy hàng loạt») (không liệt kê đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)”; đường riêng/hệ thống cũ "chưa tự được coi là hỗ trợ")
- Bằng chứng cần chụp: File CSV đã dùng (không có dữ liệu thật); ảnh kết quả sau từng lần.
- Ghi chú: Đặc tả v2 yêu cầu xét; việc đường HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV) thuộc đợt nào chưa chốt (đặc tả v2 mục 13.1). Nếu ngoài đợt: SKIPPED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-036"></a>

### TC-RS-FUNC-036 — Danh sách nhóm tham chiếu theo thiết lập tổng hợp hiện hữu

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu»)

<!-- Mã truy vết: TD-POP-01 «Thiết lập tổng hợp X: Thiết lập tổng hợp thứ hạng（順位集計設定）…», TD-POP-03 «Nhóm tổng hợp thứ hạng（順位集計グループ）: "Toán I khối 1+2" gồm lớp G-A và G-B…», TD-POP-04 «Nhóm tổ hợp（組み合わせグループ）: "Tổ hợp Toán" (tên giả) thuộc trường A/2026, đã…», TD-POP-05 «Nhóm môn học（科目グループ）: "Nhóm môn Toán" (tên giả): có cấu hình riêng cho…», TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-POP-02 «X sau khi bật lớp học: Như TD-POP-01 nhưng bật thêm Lớp học（授業）, chạy…», TD-ROLE-01 «Giáo viên có quyền sửa mục: Có quyền vào Thiết lập nhập điểm（成績入力設定） và…», TD-ROLE-03 «Người có quyền chạy hàng loạt: Có quyền thực hiện Thực hiện tổng…», AC-G12 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Trường A/2026 có thiết lập tổng hợp X（評点集計） (khối, lớp chủ nhiệm bật; lớp học tắt), nhóm tổng hợp thứ hạng “Toán I khối 1+2”, nhóm tổ hợp “Tổ hợp Toán”, nhóm môn học “Nhóm môn Toán”. Mở form thêm quy tắc của mục số nguyên (M=100) với điều kiện Trung bình（平均点） và ngưỡng Công thức（計算式） dùng trung bình.
- Dữ liệu test: thiết lập tổng hợp X（評点集計）, thiết lập tổng hợp X đã bật thêm Lớp học（授業）, nhóm tổng hợp thứ hạng “Toán I khối 1+2”, nhóm tổ hợp “Tổ hợp Toán”, nhóm môn học “Nhóm môn Toán”; mục số nguyên (M=100); tài khoản giáo viên có quyền sửa mục, tài khoản có quyền chạy hàng loạt

**操作（Thao tác）**

1. Ở nguồn của điều kiện: chọn Thời kỳ tổng hợp（集計対象時期）, chọn Thiết lập tổng hợp thứ hạng（順位集計設定） X, rồi mở danh sách Đối tượng tổng hợp（集計対象）. Ghi lại các lựa chọn.
2. Bật thêm Lớp học（授業） trong công tắc tổng hợp hiện hữu (thành thiết lập tổng hợp X đã bật thêm Lớp học（授業）), chạy lại tổng hợp X; mở lại danh sách ở bước 1.
3. Tắt cả ba công tắc khối/lớp chủ nhiệm/lớp học; mở lại danh sách. Chọn nhóm tổng hợp thứ hạng “Toán I khối 1+2”, lưu, mở lại form.
4. Ở trường/năm không có nhóm tổng hợp/tổ hợp/nhóm môn nào được cấu hình và chỉ bật khối: mở danh sách.
5. Ở nguồn của công thức: lặp thứ tự chọn Thiết lập tổng hợp thứ hạng → Đối tượng tổng hợp, chọn nhóm khác với nguồn điều kiện; lưu, mở lại.

**期待結果（Kết quả mong đợi）**

1. Trong ba loại cơ bản chỉ có Khối（学年） và Lớp chủ nhiệm（ホームルーム）; không có Lớp học（授業）. Có nhóm tổng hợp thứ hạng “Toán I khối 1+2”, nhóm tổ hợp “Tổ hợp Toán”, nhóm môn học “Nhóm môn Toán”, hiển thị bằng tên đã đặt.
2. Có thêm lựa chọn Lớp học（授業） trong cùng X; không phải tạo cấu hình tổng hợp mới để có loại này.
3. Không còn khối/lớp chủ nhiệm/lớp học; nhóm tổng hợp, tổ hợp, nhóm môn vẫn chọn được. Mở lại hiện đúng tên nhóm tổng hợp thứ hạng “Toán I khối 1+2” (đã lưu theo ID).
4. Chỉ có Khối（学年）; không hiện cố định đủ sáu loại, không có lựa chọn rỗng mang tên loại chưa cấu hình.
5. Nguồn điều kiện và nguồn công thức mở lại đúng lựa chọn riêng của từng phần. Form không có công tắc bật/tắt tổng hợp riêng của điểm đỏ, không có trường thứ hạng, tên hiển thị hay biểu đồ lấy từ màn công khai.

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Trường A/2026 có thiết lập tổng hợp X（評点集計） (khối, lớp chủ nhiệm bật; lớp học tắt), nhóm tổng hợp thứ hạng “Toán I khối 1+2”, nhóm tổ hợp “Tổ hợp Toán”, nhóm môn học “Nhóm môn Toán”. Mở form thêm quy tắc của mục số nguyên (M=100) với điều kiện Trung bình（平均点） và ngưỡng Công thức（計算式） dùng trung bình. - Dữ liệu test: thiết lập tổng hợp X（評点集計）, thiết lập tổng hợp X đã bật thêm Lớp học（授業）, nhóm tổng hợp thứ hạng “Toán I khối 1+2”, nhóm tổ hợp “Tổ hợp Toán”, nhóm môn học “Nhóm môn Toá | Trigger/điểm quan sát: 1. Ở nguồn của điều kiện: chọn Thời kỳ tổng hợp（集計対象時期）, chọn Thiết lập tổng hợp thứ hạng（順位集計設定） X, rồi mở danh sách Đối tượng tổng hợp（集計対象）. Ghi lại các lựa chọn. 2. Bật thêm Lớp học（授業） trong công tắc tổng hợp hiện hữu (thành thiết lập tổng hợp X đã bật thêm Lớp học（授業）), chạy lại tổng hợp X; mở lại danh sách ở bước 1. 3. Tắt cả ba công tắc khối/lớp chủ nhiệm/lớp học; mở lại danh sách. Chọn nhóm tổng hợp thứ hạng “Toán I khối 1+2”, lưu, mở lại form. 4. Ở trường/năm không có nhóm tổng hợp/tổ  | Oracle/bằng chứng: 1. Trong ba loại cơ bản chỉ có Khối（学年） và Lớp chủ nhiệm（ホームルーム）; không có Lớp học（授業）. Có nhóm tổng hợp thứ hạng “Toán I khối 1+2”, nhóm tổ hợp “Tổ hợp Toán”, nhóm môn học “Nhóm môn Toán”, hiển thị bằng tên đã đặt. 2. Có thêm lựa chọn Lớp học（授業） trong cùng X; không phải tạo cấu hình tổng hợp mới để có loại này. 3. Không còn khối/lớp chủ nhiệm/lớp học; nhóm tổng hợp, tổ hợp, nhóm môn vẫn chọn được. Mở lại hiện đúng tên nhóm tổng hợp thứ hạng “Toán I khối 1+2” (đã lưu theo ID). 4. Chỉ có Khối（学年; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Nhóm tham chiếu phía điểm đỏ có tuân theo thiết lập tổng hợp hiện hữu không?…” (Q32 «Nhóm tham chiếu phía điểm đỏ có tuân theo thiết lập tổng hợp hiện hữu không?…»), câu “Ba loại nhóm cấu hình có xuất hiện ngoài khối/HR/lớp học không?” (Q33 «Ba loại nhóm cấu hình có xuất hiện ngoài khối/HR/lớp học không?») (phương án A); [context điểm đỏ](../../../CONTEXT.md) ([CTX](../../../CONTEXT.md) «context chuẩn điểm đỏ») mục 9.6 “Ba phản hồi review DB và bài học thiết kế ngày 28/09” (quyết định DB-R3 mục 1–6); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.4 “Bộ thông tin nguồn” (đoạn "Đã xác nhận về lựa chọn nhóm"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu») (bảng quy tắc chọn/đọc nhóm); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 3.1 “Bộ thông tin nguồn” (mã `population_type` 1–6 và cờ `use_calc_hr_grade`/`use_calc_homeroom`/`use_calc_group` — PROPOSED); Figma MW “chương 02 – điều kiện áp dụng và nguồn trung bình” (58:8731 «Figma MW: chương 02 – điều kiện áp dụng và nguồn trung bình») (quy tắc danh sách Đối tượng tổng hợp), “chương 02 – tái hiện công tắc tổng hợp theo khối/HR/lớp học hiện có（学年毎・HR毎・授業毎の集計）” (58:9405 «Figma MW: chương 02 – tái hiện công tắc tổng hợp theo khối/HR/lớp học hiện có（学年毎・HR毎・授業毎の集計）») (tái hiện công tắc 学年毎・HR毎・授業毎の集計 hiện có), “chương 02 – ví dụ mở danh sách Đối tượng tổng hợp（集計対象（母集団））” (58:9431 «Figma MW: chương 02 – ví dụ mở danh sách Đối tượng tổng hợp（集計対象（母集団））») (ví dụ danh sách: 学年, ホームルーム, 文系選択, 国数英, 科目別母集団 — tên giả)
- Bằng chứng cần chụp: Ảnh danh sách Đối tượng tổng hợp sau mỗi bước; ảnh công tắc tổng hợp đang dùng; ảnh form sau khi mở lại.
- Sau khi chạy: Khôi phục công tắc tổng hợp của trường/năm test như trước khi chạy.
- Ghi chú: Hành vi CONFIRMED qua Q32/Q33; tên/mã kỹ thuật là PROPOSED. Bố cục và nhãn của bộ chọn phải đối chiếu file Figma MW; khác biệt chỉ về nhãn/bố cục ghi CONFLICT, không FAIL. Dữ liệu nhóm tham chiếu: hỏi team dev khi chuẩn bị. Phụ thuộc phạm vi đợt có điều kiện trung bình/công thức (phạm vi phát hành chưa chốt — đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-func-037"></a>

### TC-RS-FUNC-037 — Công khai: cùng mục dùng hiệu ứng đỏ khác nhau ở hai cấu hình công khai

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Cấu hình công khai và ẩn điểm” (AC-G32 «Cấu hình công khai và ẩn điểm»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-OUT-05 «Hai cấu hình công khai cùng mục: Thiết lập công khai thành…», TD-OUT-06 «Công khai có mục thường và đơn vị: Cấu hình X: TD-ITEM-01…», TD-ITEM-03 «Mục điểm đơn vị: Điểm bài kiểm tra đơn vị（単元テスト点）, M mặc định 100», TD-STU-01 «S01: G-A, HR1», TD-ROLE-05 «Học sinh: Học sinh S01 của trường A, có lịch công khai đang mở», TD-ROLE-07 «Người phụ trách đầu ra: Có quyền Trích xuất thành tích（成績抽出）, Thiết lập…», AC-G32, TC-RS-DATA-012 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Hai cấu hình Thiết lập công khai thành tích（成績公開設定） X và Y cùng chứa mục số nguyên (M=100); S01 Đỏ (29), không phải điểm dự kiến; lịch công khai của cả hai đang mở cho S01.
- Dữ liệu test: hai cấu hình công khai cùng một mục, cấu hình công khai có mục điểm thường và mục điểm đơn vị; mục số nguyên (M=100), mục điểm đơn vị (đơn vị U1 có M riêng 40); học sinh S01 (điểm 29); tài khoản học sinh S01, tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm)

**操作（Thao tác）**

1. Ở X chọn hiệu ứng đỏ Ngoặc（括弧） cho mục số nguyên (M=100), lưu; ở Y chọn `*` phía trước（前に「*」） cho cùng mục, lưu.
2. Mở lại X và Y.
3. Đăng nhập S01, xem Xác nhận thành tích（成績確認） theo từng cấu hình; gọi API và xuất PDF tương ứng nếu có.
4. Sao chép X thành X' (theo chức năng sao chép cấu hình hiện có); mở X'.
5. Ở X, mục số nguyên (M=100) (điểm thường（通常）) chọn Ngoặc; mục điểm đơn vị (đơn vị U1 có M riêng 40) (điểm đơn vị（単元）) chọn `*` phía sau; lưu, mở lại.
6. Ở Y, đổi sang `*` phía sau và giả lập lỗi lưu; mở lại Y.

**期待結果（Kết quả mong đợi）**

1–2. X giữ Ngoặc, Y giữ `*` phía trước; lưu cấu hình này không đổi cấu hình kia.
3. Theo X: `(29)`; theo Y: `*29`. Web, API và PDF của cùng cấu hình cho cùng cách hiển thị.
4. X' giữ Ngoặc cho mục số nguyên (M=100); không sao chép kết quả xét của học sinh.
5. Mỗi phân loại thường/đơn vị mở lại đúng lựa chọn của mình; không trộn.
6. Có thông báo lỗi; Y vẫn là `*` phía trước (cấu hình cũ được giữ).

**補足（Bổ sung）**
- Chức năng: Chức năng nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Hai cấu hình Thiết lập công khai thành tích（成績公開設定） X và Y cùng chứa mục số nguyên (M=100); S01 Đỏ (29), không phải điểm dự kiến; lịch công khai của cả hai đang mở cho S01. - Dữ liệu test: hai cấu hình công khai cùng một mục, cấu hình công khai có mục điểm thường và mục điểm đơn vị; mục số nguyên (M=100), mục điểm đơn vị (đơn vị U1 có M riêng 40); học sinh S01 (điểm 29); tài khoản học sinh S01, tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm) | Trigger/điểm quan sát: 1. Ở X chọn hiệu ứng đỏ Ngoặc（括弧） cho mục số nguyên (M=100), lưu; ở Y chọn `*` phía trước（前に「*」） cho cùng mục, lưu. 2. Mở lại X và Y. 3. Đăng nhập S01, xem Xác nhận thành tích（成績確認） theo từng cấu hình; gọi API và xuất PDF tương ứng nếu có. 4. Sao chép X thành X' (theo chức năng sao chép cấu hình hiện có); mở X'. 5. Ở X, mục số nguyên (M=100) (điểm thường（通常）) chọn Ngoặc; mục điểm đơn vị (đơn vị U1 có M riêng 40) (điểm đơn vị（単元）) chọn `*` phía sau; lưu, mở lại. 6. Ở Y, đổi sang `*` phía sau và g | Oracle/bằng chứng: 1–2. X giữ Ngoặc, Y giữ `*` phía trước; lưu cấu hình này không đổi cấu hình kia. 3. Theo X: `(29)`; theo Y: `*29`. Web, API và PDF của cùng cấu hình cho cùng cách hiển thị. 4. X' giữ Ngoặc cho mục số nguyên (M=100); không sao chép kết quả xét của học sinh. 5. Mỗi phân loại thường/đơn vị mở lại đúng lựa chọn của mình; không trộn. 6. Có thông báo lỗi; Y vẫn là `*` phía trước (cấu hình cũ được giữ).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: BLOCKED

- Nguồn: [context điểm đỏ](../../../CONTEXT.md) ([CTX](../../../CONTEXT.md) «context chuẩn điểm đỏ») mục 9.6 “Ba phản hồi review DB và bài học thiết kế ngày 28/09” (phản hồi review DB của khách hàng: lưu riêng hiệu ứng theo cấu hình công khai, mục và phân loại thường/đơn vị; cùng mục có thể dùng ngoặc ở X và `*` phía trước ở Y); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 10.1 “Phạm vi và tùy chọn”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Cấu hình công khai và ẩn điểm” (AC-G32 «Cấu hình công khai và ẩn điểm») ("Cùng mục có thể lưu/mở lại/copy độc lập cấu hình X dùng ngoặc, Y dùng `*` trước, không trộn thường/đơn vị và không copy kết quả cá nhân. Lỗi lưu giữ cấu hình cũ"); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 5 “Hiệu ứng theo cấu hình công khai” (PROPOSED); Figma MW “chương 06 – công khai thành tích và màn học sinh” (58:5593 «Figma MW: chương 06 – công khai thành tích và màn học sinh») (lưu theo từng cấu hình công khai và từng mục, thường/đơn vị chọn riêng; X `(24)`, Y `*24`), “chương 06 – cách hiển thị đỏ riêng cho Thành tích（通常）và Thành tích theo đơn vị（単元別成績）” (58:6206 «Figma MW: chương 06 – cách hiển thị đỏ riêng cho Thành tích（通常）và Thành tích theo đơn vị（単元別成績）») (khung Thành tích（通常）`*24` và Thành tích theo đơn vị（単元別成績）`(24)`; cột đơn vị chỉ hiện ở trường dùng chức năng bài kiểm tra đơn vị)
- Bằng chứng cần chụp: Ảnh X, Y, X' khi mở lại; ảnh màn học sinh theo từng cấu hình; phản hồi API/PDF nếu có; ảnh thông báo lỗi ở bước 6.
- Sau khi chạy: Xóa X' và khôi phục hiệu ứng của X, Y.
- Ghi chú: Yêu cầu hành vi đến từ phản hồi review của khách hàng (CONFIRMED); cách lưu `red_score_display_type` là PROPOSED (case “Lưu, đọc lại và sao chép hiệu ứng đỏ theo dòng mục của cấu hình công khai”). Bước 6 cần cách giả lập lỗi lưu; không có thì BLOCKED cho bước đó. Cách chọn cấu hình khi học sinh có nhiều lịch công khai theo hành vi hiện có.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="br"></a>

## 2. Business Rules (BR)

<a id="tc-rs-br-001"></a>

### TC-RS-BR-001 — Chọn quy tắc khớp đầu tiên theo ưu tiên, không lấy ngưỡng nghiêm hơn

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Chọn quy tắc khớp đầu tiên” (AC-G06 «Chọn quy tắc khớp đầu tiên»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-08 «Cặp cùng áp dụng: Ưu tiên 1: Toàn bộ, cố định 20 `<`» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có cặp quy tắc cùng áp dụng (dưới 20 và dưới 30) (ưu tiên 1: `<20`, ưu tiên 2: `<30`).
- Dữ liệu test: mục số nguyên (M=100); cặp quy tắc cùng áp dụng (dưới 20 và dưới 30); S02 được sửa thành 25

**操作（Thao tác）**

1. Đăng ký S02=25.
2. Đổi thứ tự (ưu tiên 1 là `<30`), bấm chạy lại (đăng ký lại điểm hoặc nút cam).
3. Xem kết quả sau mỗi lần xét.

**期待結果（Kết quả mong đợi）**

1. Lần 1: chọn quy tắc `<20` → Không đỏ.
2. Lần 2 (sau chạy lại): chọn quy tắc `<30` → Đỏ.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) có cặp quy tắc cùng áp dụng (dưới 20 và dưới 30) (ưu tiên 1: `<20`, ưu tiên 2: `<30`). - Dữ liệu test: mục số nguyên (M=100); cặp quy tắc cùng áp dụng (dưới 20 và dưới 30); S02 được sửa thành 25 | Trigger/điểm quan sát: 1. Đăng ký S02=25. 2. Đổi thứ tự (ưu tiên 1 là `<30`), bấm chạy lại (đăng ký lại điểm hoặc nút cam). 3. Xem kết quả sau mỗi lần xét. | Oracle/bằng chứng: 1. Lần 1: chọn quy tắc `<20` → Không đỏ. 2. Lần 2 (sau chạy lại): chọn quy tắc `<30` → Đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Một mục đánh giá có một hay nhiều thiết lập điểm đỏ?” (Q5 «Một mục đánh giá có một hay nhiều thiết lập điểm đỏ?»), câu “Cơ chế công thức và ưu tiên nào đã có để tham chiếu?” (Q22 «Cơ chế công thức và ưu tiên nào đã có để tham chiếu?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 4.3 “Chọn quy tắc” (ví dụ ngưỡng 20/30, `S=25`); Figma MW “màn danh sách thiết lập điểm đỏ” (58:10035 «Figma MW: màn danh sách thiết lập điểm đỏ») 「上から順に適用条件を確認し、最初に一致した設定を使用します。」 (kiểm điều kiện từ trên xuống, dùng thiết lập khớp đầu tiên); code hiện tại “AutoRating chọn thiết lập khớp đầu tiên theo `sort_no` trước khi tính” `AutoRating.php:960-1014`
- Bằng chứng cần chụp: Ảnh danh sách thứ tự; ảnh kết quả sau mỗi lần xét.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-002"></a>

### TC-RS-BR-002 — Không quy tắc nào khớp khi đủ dữ liệu → Không áp dụng

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Chọn quy tắc khớp đầu tiên” (AC-G06 «Chọn quy tắc khớp đầu tiên»); tiêu chí nghiệm thu “Trạng thái sau lần chạy” (AC-G20 «Trạng thái sau lần chạy»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-12 «Bộ lọc kết hợp: Giới hạn bằng bộ lọc（特定条件で絞り込む）: Khối（学年） = 1 hoặc 2», TD-STU-07 «S07: G-B, HR2» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) chỉ có quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao) (khối 1/2 và nhóm Nâng cao). S07 thuộc khối 2 nhưng không thuộc nhóm Nâng cao.
- Dữ liệu test: mục số nguyên (M=100); quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao), học sinh S07 (điểm 35, cờ Chưa dự thi（未受験）)

**操作（Thao tác）**

1. Đăng ký S07=20.
2. Xem kết quả ở ba đầu ra.

**期待結果（Kết quả mong đợi）**

S07 ở trạng thái Không áp dụng: không có dấu/lọc đỏ; không được coi là "đạt một ngưỡng".

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) chỉ có quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao) (khối 1/2 và nhóm Nâng cao). S07 thuộc khối 2 nhưng không thuộc nhóm Nâng cao. - Dữ liệu test: mục số nguyên (M=100); quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao), học sinh S07 (điểm 35, cờ Chưa dự thi（未受験）) | Trigger/điểm quan sát: 1. Đăng ký S07=20. 2. Xem kết quả ở ba đầu ra. | Oracle/bằng chứng: S07 ở trạng thái Không áp dụng: không có dấu/lọc đỏ; không được coi là "đạt một ngưỡng".; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 4.3 “Chọn quy tắc” bước 5, mục 8.1 “Các trạng thái phải phân biệt”; [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Xét lại xong mà không còn thiết lập áp dụng thì làm gì?” (Q27 «Xét lại xong mà không còn thiết lập áp dụng thì làm gì?»)
- Bằng chứng cần chụp: Ảnh ba đầu ra; bằng chứng trạng thái lưu (khi có schema).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-003"></a>

### TC-RS-BR-003 — Ưu tiên 1 khớp nhưng thiếu dữ liệu → Chưa xét được, không chuyển xuống ưu tiên 2

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Chọn quy tắc khớp đầu tiên” (AC-G06 «Chọn quy tắc khớp đầu tiên»)

<!-- Mã truy vết: TD-RULE-11 «Chia cho trung bình: Dòng 1: Số cố định（固定値）100 ÷ Trung bình（平均点）», TD-SRC-08 «Trung bình bằng 0: Mọi học sinh trong nhóm có 0 điểm → `A=0`», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-SRC-03 «Không có tổng hợp: Nguồn chưa từng chạy tổng hợp», TD-STU-01 «S01: G-A, HR1» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Hai cấu hình thử: (A) ưu tiên 1 = quy tắc công thức 100 ÷ trung bình (100 ÷ A, Toàn bộ) với nguồn nhóm có trung bình 0 (`A=0`); ưu tiên 2 = quy tắc “Cố định 30” (dưới 30). (B) ưu tiên 1 = quy tắc có điều kiện `A≥60` với nguồn nguồn chưa có kết quả tổng hợp (không có tổng hợp); ưu tiên 2 = quy tắc “Cố định 30” (dưới 30). (C) ưu tiên 1 = quy tắc có bộ lọc Môn（教科・科目）= Ngữ văn và điều kiện `A≥60` (nguồn nguồn chưa có kết quả tổng hợp); ưu tiên 2 = quy tắc “Cố định 30” (dưới 30); ô đang xét là Toán.
- Dữ liệu test: quy tắc công thức 100 ÷ trung bình, quy tắc “Cố định 30” (dưới 30), nhóm có trung bình 0, nguồn chưa có kết quả tổng hợp, học sinh S01 (điểm 29)

**操作（Thao tác）**

Với từng cấu hình (A), (B), (C): đăng ký S01=29, xem kết quả.

**期待結果（Kết quả mong đợi）**

(A) Quy tắc 1 được chọn, chia 0 → Chưa xét được; không dùng ưu tiên 2.

(B) Không xác định được điều kiện trung bình → Chưa xét được; không coi thiếu dữ liệu là "không khớp" để xuống ưu tiên 2.

(C) Bộ lọc môn đã đủ chứng minh quy tắc 1 không áp dụng → được bỏ qua mà không cần nguồn; ưu tiên 2 áp dụng → Đỏ.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Hai cấu hình thử: (A) ưu tiên 1 = quy tắc công thức 100 ÷ trung bình (100 ÷ A, Toàn bộ) với nguồn nhóm có trung bình 0 (`A=0`); ưu tiên 2 = quy tắc “Cố định 30” (dưới 30). (B) ưu tiên 1 = quy tắc có điều kiện `A≥60` với nguồn nguồn chưa có kết quả tổng hợp (không có tổng hợp); ưu tiên 2 = quy tắc “Cố định 30” (dưới 30). (C) ưu tiên 1 = quy tắc có bộ lọc Môn（教科・科目）= Ngữ văn và điều kiện `A≥60` (nguồn nguồn chưa có kết quả tổng hợp); ưu tiên 2 = quy tắc “Cố định 30” (dưới 30); ô đang  | Trigger/điểm quan sát: Với từng cấu hình (A), (B), (C): đăng ký S01=29, xem kết quả. | Oracle/bằng chứng: (A) Quy tắc 1 được chọn, chia 0 → Chưa xét được; không dùng ưu tiên 2. (B) Không xác định được điều kiện trung bình → Chưa xét được; không coi thiếu dữ liệu là "không khớp" để xuống ưu tiên 2. (C) Bộ lọc môn đã đủ chứng minh quy tắc 1 không áp dụng → được bỏ qua mà không cần nguồn; ưu tiên 2 áp dụng → Đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Đã xét lại nhưng không tạo được ngưỡng hợp lệ thì dùng kết quả cũ không?” (Q26 «Đã xét lại nhưng không tạo được ngưỡng hợp lệ thì dùng kết quả cũ không?»), câu “Cơ chế công thức và ưu tiên nào đã có để tham chiếu?” (Q22 «Cơ chế công thức và ưu tiên nào đã có để tham chiếu?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 4.3 “Chọn quy tắc” bước 4 và đoạn cuối; Figma MW “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9460 «Figma MW: chương 01 – lối vào, danh sách, xóa thiết lập») 「計算不能でも下位へ移らない。」 (dù không tính được cũng không chuyển xuống thấp hơn)
- Bằng chứng cần chụp: Ảnh kết quả ba cấu hình; thông tin nguyên nhân chưa xét được (nếu có hiển thị/log).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-004"></a>

### TC-RS-BR-004 — Kết hợp bộ lọc: HOẶC trong cùng loại, VÀ giữa các loại

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05 «Đối tượng áp dụng và nhu cầu nguồn»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-12 «Bộ lọc kết hợp: Giới hạn bằng bộ lọc（特定条件で絞り込む）: Khối（学年） = 1 hoặc 2» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) chỉ có quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao). Bốn học sinh: P1 khối 1 + Nâng cao; P2 khối 2 + Nâng cao; P3 khối 3 + Nâng cao; P4 khối 1, không Nâng cao. Mỗi người điểm 20.
- Dữ liệu test: mục số nguyên (M=100); quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao)

**操作（Thao tác）**

1. Đăng ký điểm 20 cho P1–P4.
2. Xem kết quả.

**期待結果（Kết quả mong đợi）**

P1, P2: Đỏ. P3, P4: Không áp dụng.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) chỉ có quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao). Bốn học sinh: P1 khối 1 + Nâng cao; P2 khối 2 + Nâng cao; P3 khối 3 + Nâng cao; P4 khối 1, không Nâng cao. Mỗi người điểm 20. - Dữ liệu test: mục số nguyên (M=100); quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao) | Trigger/điểm quan sát: 1. Đăng ký điểm 20 cho P1–P4. 2. Xem kết quả. | Oracle/bằng chứng: P1, P2: Đỏ. P3, P4: Không áp dụng.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.1 “Đối tượng áp dụng” (ví dụ khối 1 hoặc 2 và nhóm nâng cao); Figma MW “chương 02 – điều kiện áp dụng và nguồn trung bình” (58:8729 «Figma MW: chương 02 – điều kiện áp dụng và nguồn trung bình») 「同じ種類の複数選択はOR、種類間はAND。」 (cùng loại chọn nhiều là HOẶC, giữa các loại là VÀ), MW “màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình” (58:9156 «Figma MW: màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình») 「※同じ種類の条件はいずれか1つ、種類が違う条件はすべて満たす生徒が対象となります。」 (cùng loại chỉ cần thỏa một điều kiện, khác loại phải thỏa tất cả; file cũ 4595:485 «Figma: màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình — MW 58:8930» ghi "thỏa tất cả điều kiện lọc")
- Bằng chứng cần chụp: Ảnh kết quả bốn học sinh.
- Ghi chú: P1–P4 là học sinh bổ sung ngoài TD-STU; tạo trong trường test.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-041"></a>

### TC-RS-BR-041 — Điều kiện trung bình cùng nguồn kết hợp AND

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05 «Đối tượng áp dụng và nhu cầu nguồn»)

<!-- Mã truy vết: TD-RULE-15 «Hai điều kiện trung bình cùng nguồn: Cùng nguồn `A`: `A≥50` và `A<70`», AC-G05 -->

**前提条件（Điều kiện trước）**

- Điều kiện: một rule có hai điều kiện cùng nguồn `A`: `A≥50` AND `A<70`; các học sinh đều thỏa bộ lọc đối tượng khác.
- Dữ liệu test: P9 `A=40`, P10 `A=50`, P11 `A=60`, P12 `A=70`, P13 `A=49.9`, P14 `A=50.0`, P15 `A=69.9`, P16 `A=70.0`, P17 `A=NaN`, P18 ô trống.

**操作（Thao tác）**

1. Lưu một rule chứa đồng thời `A≥50` và `A<70`.
2. Chạy xét cho P9–P18.
3. Mở lại rule và kiểm tra hai điều kiện vẫn thuộc cùng một rule/nguồn.

**期待結果（Kết quả mong đợi）**

1. P9, P13, P17 và P18 không thỏa; P12 và P16 không thỏa vì `A<70`; P10, P11, P14 và P15 thỏa cả hai điều kiện.
2. Chỉ các học sinh thỏa `50≤A<70` được xét theo ngưỡng của rule.
3. Không diễn giải hai điều kiện cùng nguồn thành OR; không ghép hai rule riêng biệt bằng AND.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: một rule có hai điều kiện cùng nguồn `A`: `A≥50` AND `A<70`; các học sinh đều thỏa bộ lọc đối tượng khác. - Dữ liệu test: P9 `A=40`, P10 `A=50`, P11 `A=60`, P12 `A=70`, P13 `A=49.9`, P14 `A=50.0`, P15 `A=69.9`, P16 `A=70.0`, P17 `A=NaN`, P18 ô trống. | Trigger/điểm quan sát: 1. Lưu một rule chứa đồng thời `A≥50` và `A<70`. 2. Chạy xét cho P9–P18. 3. Mở lại rule và kiểm tra hai điều kiện vẫn thuộc cùng một rule/nguồn. | Oracle/bằng chứng: 1. P9, P13, P17 và P18 không thỏa; P12 và P16 không thỏa vì `A<70`; P10, P11, P14 và P15 thỏa cả hai điều kiện. 2. Chỉ các học sinh thỏa `50≤A<70` được xét theo ngưỡng của rule. 3. Không diễn giải hai điều kiện cùng nguồn thành OR; không ghép hai rule riêng biệt bằng AND.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.1 và 5.2; [xác nhận thiết kế ngày 30/09](../../../sources/2026-09-30-design-review-confirmation.vi.md) (Q35: `A≥50` và `A<70` nghĩa là `50≤A<70`; 40/70 không thỏa, 50/60 thỏa).
- Bằng chứng cần chụp: Ảnh form mở lại; ảnh kết quả bốn học sinh; log hoặc SELECT kết quả nếu có schema.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-005"></a>

### TC-RS-BR-005 — Toàn bộ đối tượng（全員が対象） không vượt phạm vi mục, trường, năm

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05 «Đối tượng áp dụng và nhu cầu nguồn»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-ENV-02 «Trường khác: Trường B (tên giả), có ít nhất một mục đánh giá và một quy…», TD-ITEM-02 «Mục số thập phân: Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc…», TD-STU-09 «S09: G-B, HR2» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30) (Toàn bộ). Trường B (trường B (trường khác)) có học sinh điểm 10 ở mục tương tự. Mục mục số thập phân (M=100) (không có quy tắc) có S09=29.5.
- Dữ liệu test: mục số nguyên (M=100), mục số thập phân (M=100); quy tắc “Cố định 30” (dưới 30), trường B (trường khác), học sinh S09 (mục số thập phân 29.5)

**操作（Thao tác）**

1. Chạy xét hàng loạt cho trường A.
2. Xem kết quả S09 ở mục số thập phân (M=100) và dữ liệu trường B.

**期待結果（Kết quả mong đợi）**

Chỉ ô của mục số nguyên (M=100) trong trường A năm 2026 được xét. S09 ở mục số thập phân (M=100) và học sinh trường B không bị ảnh hưởng.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30) (Toàn bộ). Trường B (trường B (trường khác)) có học sinh điểm 10 ở mục tương tự. Mục mục số thập phân (M=100) (không có quy tắc) có S09=29.5. - Dữ liệu test: mục số nguyên (M=100), mục số thập phân (M=100); quy tắc “Cố định 30” (dưới 30), trường B (trường khác), học sinh S09 (mục số thập phân 29.5) | Trigger/điểm quan sát: 1. Chạy xét hàng loạt cho trường A. 2. Xem kết quả S09 ở mục số thập phân (M=100) và dữ liệu trường B. | Oracle/bằng chứng: Chỉ ô của mục số nguyên (M=100) trong trường A năm 2026 được xét. S09 ở mục số thập phân (M=100) và học sinh trường B không bị ảnh hưởng.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.1 “Đối tượng áp dụng”; Figma MW “chương 02 – điều kiện áp dụng và nguồn trung bình” (58:8728 «Figma MW: chương 02 – điều kiện áp dụng và nguồn trung bình») 「全員は、この評価項目の対象者全員。全校指定や全員赤点の意味ではない。」 (toàn bộ = mọi đối tượng của mục này, không phải toàn trường hay mọi người đều đỏ)
- Bằng chứng cần chụp: Ảnh kết quả; SELECT kết quả theo trường/năm (khi có schema).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-006"></a>

### TC-RS-BR-006 — Nhóm tham chiếu tách khỏi đối tượng áp dụng và danh sách đang lọc ở đầu ra

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu»)

<!-- Mã truy vết: TD-GRP-01 «Lớp học phần: G-A (Toán I（数学Ⅰ）, khối 1, nhóm thành tích Nâng cao), G-B…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Quy tắc chỉ áp dụng cho lớp G-A (bộ lọc lớp), công thức `A×0.5`, nguồn có nhóm tham chiếu là một nhóm tổng hợp chứa cả G-A và G-B, `A=50` (G-A riêng có trung bình 40). Đã xét: `T=25`.
- Dữ liệu test: Nguồn theo nhóm tổng hợp chứa G-A và G-B (không dùng nhóm theo khối vì G-A thuộc khối 1, G-B thuộc khối 2); các lớp học phần G-A, G-B, G-C

**操作（Thao tác）**

1. Xem kết quả của học sinh G-A điểm 24 (Đỏ) và 26 (Không đỏ).
2. Chạy trích xuất chỉ lọc lớp G-A.
3. Chạy lại xét.

**期待結果（Kết quả mong đợi）**

Kết quả vẫn dùng `T=25` (từ `A=50` của cả nhóm). Lọc lớp ở đầu ra hoặc đối tượng chỉ G-A không làm trung bình thành 40 (`T=20`).

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Quy tắc chỉ áp dụng cho lớp G-A (bộ lọc lớp), công thức `A×0.5`, nguồn có nhóm tham chiếu là một nhóm tổng hợp chứa cả G-A và G-B, `A=50` (G-A riêng có trung bình 40). Đã xét: `T=25`. - Dữ liệu test: Nguồn theo nhóm tổng hợp chứa G-A và G-B (không dùng nhóm theo khối vì G-A thuộc khối 1, G-B thuộc khối 2); các lớp học phần G-A, G-B, G-C | Trigger/điểm quan sát: 1. Xem kết quả của học sinh G-A điểm 24 (Đỏ) và 26 (Không đỏ). 2. Chạy trích xuất chỉ lọc lớp G-A. 3. Chạy lại xét. | Oracle/bằng chứng: Kết quả vẫn dùng `T=25` (từ `A=50` của cả nhóm). Lọc lớp ở đầu ra hoặc đối tượng chỉ G-A không làm trung bình thành 40 (`T=20`).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Lấy trung bình của nhóm nào và kết quả tổng hợp nào?” (Q9 «Lấy trung bình của nhóm nào và kết quả tổng hợp nào?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.4 “Bộ thông tin nguồn”; Figma MW “chương 05 – trích xuất thành tích và kết quả Excel” (58:6233 «Figma MW: chương 05 – trích xuất thành tích và kết quả Excel») 「抽出結果の絞り込みは平均の母集団を変更しません。」 (lọc kết quả trích xuất không đổi tập tham chiếu trung bình)
- Bằng chứng cần chụp: Ảnh cấu hình nguồn; ảnh kết quả trước/sau lọc.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-007"></a>

### TC-RS-BR-007 — Nguồn: bản đã chốt được ưu tiên hơn tổng hợp mới hơn

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn” (AC-G13 «Ưu tiên bản chốt và xử lý thiếu nguồn»); tiêu chí nghiệm thu “Phạm vi từng đợt” (AC-G40 «Phạm vi từng đợt»)

<!-- Mã truy vết: TD-SRC-01 «Bản đã chốt: Snapshot của nguồn mặc định, `A` thô = 49.99…», TD-SRC-02 «Bản mới nhất chưa chốt: Tổng hợp chạy sau TD-SRC-01, `A` = 62», TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-07 «Cặp phân nhánh: Ưu tiên 1 "Trung bình từ 60": điều kiện `A≥60`, cố định…», TD-ENV-04 «Nguồn snapshot: Dummy data cho bản tổng hợp đã chốt (R18 §5.5) cho tới…», AC-G13, AC-G40 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Có bản tổng hợp đã chốt (trung bình 49.99) (chốt, `A=49.99`) và bản tổng hợp mới nhất chưa chốt (trung bình 62) (mới hơn, `A=62`) cùng phạm vi. mục số nguyên (M=100) có cặp quy tắc phân nhánh theo trung bình 60. Dummy data (dữ liệu giả cho bản tổng hợp đã chốt).
- Dữ liệu test: mục số nguyên (M=100); bản tổng hợp đã chốt (trung bình 49.99), bản tổng hợp mới nhất chưa chốt (trung bình 62), cặp quy tắc phân nhánh theo trung bình 60; học sinh điểm 24 và 26

**操作（Thao tác）**

1. Chạy nút cam.
2. Xem kết quả.

**期待結果（Kết quả mong đợi）**

Dùng `A=49.99` → nhánh ưu tiên 2 (`A<60`), `T=24.995` → điểm 24 Đỏ, điểm 26 Không đỏ. Không dùng `A=62` (sẽ vào nhánh `A≥60`, `T=30`, điểm 26 Đỏ).

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Có bản tổng hợp đã chốt (trung bình 49.99) (chốt, `A=49.99`) và bản tổng hợp mới nhất chưa chốt (trung bình 62) (mới hơn, `A=62`) cùng phạm vi. mục số nguyên (M=100) có cặp quy tắc phân nhánh theo trung bình 60. Dummy data (dữ liệu giả cho bản tổng hợp đã chốt). - Dữ liệu test: mục số nguyên (M=100); bản tổng hợp đã chốt (trung bình 49.99), bản tổng hợp mới nhất chưa chốt (trung bình 62), cặp quy tắc phân nhánh theo trung bình 60; học sinh điểm 24 và 26 | Trigger/điểm quan sát: 1. Chạy nút cam. 2. Xem kết quả. | Oracle/bằng chứng: Dùng `A=49.99` → nhánh ưu tiên 2 (`A<60`), `T=24.995` → điểm 24 Đỏ, điểm 26 Không đỏ. Không dùng `A=62` (sẽ vào nhánh `A≥60`, `T=30`, điểm 26 Đỏ).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Lấy trung bình của nhóm nào và kết quả tổng hợp nào?” (Q9 «Lấy trung bình của nhóm nào và kết quả tổng hợp nào?»), câu “Quy trình vận hành khi có đánh giá tương đối là gì?” (Q12 «Quy trình vận hành khi có đánh giá tương đối là gì?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.5 “Chọn bản nguồn” bước 1, mục 7.4 “Quy trình vận hành khi dùng trung bình/tỷ lệ nhóm” bước 4; Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:6946 «Figma MW: chương 04 – đăng ký, tổng hợp, chạy lại và kết quả») 「確定平均を優先するため、常に直前の青ボタンの結果とは限らない。」 (vì ưu tiên trung bình đã chốt, không phải lúc nào cũng là kết quả nút xanh vừa bấm)
- Bằng chứng cần chụp: Ảnh/SELECT hai nguồn (ghi dummy data); ảnh kết quả.
- Ghi chú: Không có radio bỏ qua bản chốt. Thời điểm tích hợp nguồn thật chưa chốt (đặc tả v2 mục 13.1). PASS trên dummy data chưa đủ cho tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn”/tiêu chí nghiệm thu “Phạm vi từng đợt”: phải chạy lại case với bản chốt thật (sau PR thêm trạng thái xác nhận kết quả tổng hợp xếp hạng, còn mở) trước khi đánh dấu đạt hai tiêu chí này.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-008"></a>

### TC-RS-BR-008 — Nguồn: chưa có bản chốt → dùng tổng hợp hoàn tất mới nhất cùng phạm vi

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn” (AC-G13 «Ưu tiên bản chốt và xử lý thiếu nguồn»)

<!-- Mã truy vết: TD-SRC-02 «Bản mới nhất chưa chốt: Tổng hợp chạy sau TD-SRC-01, `A` = 62», TD-RULE-07 «Cặp phân nhánh: Ưu tiên 1 "Trung bình từ 60": điều kiện `A≥60`, cố định…», AC-G13 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Chỉ có bản tổng hợp mới nhất chưa chốt (trung bình 62) (`A=62`), không có bản chốt; có thêm một tổng hợp cũ hơn `A=55` và một tổng hợp khác kỳ mới hơn `A=40`.
- Dữ liệu test: bản tổng hợp mới nhất chưa chốt (trung bình 62), cặp quy tắc phân nhánh theo trung bình 60

**操作（Thao tác）**

1. Chạy nút cam.
2. Xem kết quả học sinh điểm 26 và 29.
3. Bắt đầu một lượt tổng hợp mới cùng phạm vi sau bản tổng hợp mới nhất chưa chốt (trung bình 62) nhưng chưa hoàn tất (đang chạy hoặc thất bại); chạy lại nút cam.

**期待結果（Kết quả mong đợi）**

1–2. Dùng `A=62` (mới nhất, cùng kỳ) → nhánh `A≥60`, `T=30` → 26 và 29 Đỏ. Không dùng bản cũ hơn hoặc bản khác kỳ.

3. Vẫn dùng `A=62` của bản hoàn tất mới nhất; không đọc lượt tổng hợp chưa hoàn tất.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Chỉ có bản tổng hợp mới nhất chưa chốt (trung bình 62) (`A=62`), không có bản chốt; có thêm một tổng hợp cũ hơn `A=55` và một tổng hợp khác kỳ mới hơn `A=40`. - Dữ liệu test: bản tổng hợp mới nhất chưa chốt (trung bình 62), cặp quy tắc phân nhánh theo trung bình 60 | Trigger/điểm quan sát: 1. Chạy nút cam. 2. Xem kết quả học sinh điểm 26 và 29. 3. Bắt đầu một lượt tổng hợp mới cùng phạm vi sau bản tổng hợp mới nhất chưa chốt (trung bình 62) nhưng chưa hoàn tất (đang chạy hoặc thất bại); chạy lại nút cam. | Oracle/bằng chứng: 1–2. Dùng `A=62` (mới nhất, cùng kỳ) → nhánh `A≥60`, `T=30` → 26 và 29 Đỏ. Không dùng bản cũ hơn hoặc bản khác kỳ. 3. Vẫn dùng `A=62` của bản hoàn tất mới nhất; không đọc lượt tổng hợp chưa hoàn tất.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Lấy trung bình của nhóm nào và kết quả tổng hợp nào?” (Q9 «Lấy trung bình của nhóm nào và kết quả tổng hợp nào?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.5 “Chọn bản nguồn” bước 2 ("kết quả tổng hợp hoàn tất mới nhất"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn” (AC-G13 «Ưu tiên bản chốt và xử lý thiếu nguồn»)
- Bằng chứng cần chụp: Ảnh danh sách tổng hợp; ảnh kết quả.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-009"></a>

### TC-RS-BR-009 — Nguồn: bản đã chốt thiếu dữ liệu → Chưa xét được, không chuyển sang bản thường

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn” (AC-G13 «Ưu tiên bản chốt và xử lý thiếu nguồn»); tiêu chí nghiệm thu “Phạm vi từng đợt” (AC-G40 «Phạm vi từng đợt»)

<!-- Mã truy vết: TD-SRC-04 «Bản chốt thiếu dữ liệu: Snapshot tồn tại nhưng không có dòng cho…», TD-SRC-02 «Bản mới nhất chưa chốt: Tổng hợp chạy sau TD-SRC-01, `A` = 62», TD-RULE-07 «Cặp phân nhánh: Ưu tiên 1 "Trung bình từ 60": điều kiện `A≥60`, cố định…», TD-ENV-04 «Nguồn snapshot: Dummy data cho bản tổng hợp đã chốt (R18 §5.5) cho tới…», AC-G13, AC-G40 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Có bản đã chốt thiếu dữ liệu của ô (chốt, thiếu dòng cho môn/mục) và bản tổng hợp mới nhất chưa chốt (trung bình 62) (thường, đầy đủ). cặp quy tắc phân nhánh theo trung bình 60. Ô trước đó Đỏ.
- Dữ liệu test: bản đã chốt thiếu dữ liệu của ô, bản tổng hợp mới nhất chưa chốt (trung bình 62), cặp quy tắc phân nhánh theo trung bình 60

**操作（Thao tác）**

1. Chạy nút cam.
2. Xem kết quả và ba đầu ra.

**期待結果（Kết quả mong đợi）**

Chưa xét được; ngừng dùng dấu/lọc đỏ cũ; điểm giữ nguyên. Không dùng bản tổng hợp mới nhất chưa chốt (trung bình 62) hay bản khác kỳ.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Có bản đã chốt thiếu dữ liệu của ô (chốt, thiếu dòng cho môn/mục) và bản tổng hợp mới nhất chưa chốt (trung bình 62) (thường, đầy đủ). cặp quy tắc phân nhánh theo trung bình 60. Ô trước đó Đỏ. - Dữ liệu test: bản đã chốt thiếu dữ liệu của ô, bản tổng hợp mới nhất chưa chốt (trung bình 62), cặp quy tắc phân nhánh theo trung bình 60 | Trigger/điểm quan sát: 1. Chạy nút cam. 2. Xem kết quả và ba đầu ra. | Oracle/bằng chứng: Chưa xét được; ngừng dùng dấu/lọc đỏ cũ; điểm giữ nguyên. Không dùng bản tổng hợp mới nhất chưa chốt (trung bình 62) hay bản khác kỳ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.5 “Chọn bản nguồn” bước 3, mục 8.3 “Không tạo được ngưỡng hợp lệ”; [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Lấy trung bình của nhóm nào và kết quả tổng hợp nào?” (Q9 «Lấy trung bình của nhóm nào và kết quả tổng hợp nào?»), câu “Đã xét lại nhưng không tạo được ngưỡng hợp lệ thì dùng kết quả cũ không?” (Q26 «Đã xét lại nhưng không tạo được ngưỡng hợp lệ thì dùng kết quả cũ không?»)
- Bằng chứng cần chụp: Ảnh/SELECT nguồn; ảnh kết quả và thông báo nguyên nhân. SELECT `reason_code` (khi có schema; đề xuất `source_missing` — thiết kế DB v2 mục 4.3 “Trạng thái kết quả”, PROPOSED).
- Ghi chú: Dummy data (dữ liệu giả cho bản tổng hợp đã chốt). PASS trên dummy data chưa đủ cho tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn”/tiêu chí nghiệm thu “Phạm vi từng đợt”: phải chạy lại với bản chốt thật (sau PR thêm trạng thái xác nhận kết quả tổng hợp xếp hạng, còn mở).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-010"></a>

### TC-RS-BR-010 — Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn” (AC-G13 «Ưu tiên bản chốt và xử lý thiếu nguồn»)

<!-- Mã truy vết: TD-SRC-03 «Không có tổng hợp: Nguồn chưa từng chạy tổng hợp» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Công thức `A×0.5` với nguồn nguồn chưa có kết quả tổng hợp (chưa tổng hợp). Ô trước đó Đỏ.
- Dữ liệu test: nguồn chưa có kết quả tổng hợp

**操作（Thao tác）**

1. Chạy nút cam.
2. Xem kết quả.

**期待結果（Kết quả mong đợi）**

Chưa xét được; `A` không bị coi là 0 (nếu coi 0 thì `T=0`, mọi điểm dương Không đỏ); không dùng nhóm khác; ngừng dấu đỏ cũ.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Công thức `A×0.5` với nguồn nguồn chưa có kết quả tổng hợp (chưa tổng hợp). Ô trước đó Đỏ. - Dữ liệu test: nguồn chưa có kết quả tổng hợp | Trigger/điểm quan sát: 1. Chạy nút cam. 2. Xem kết quả. | Oracle/bằng chứng: Chưa xét được; `A` không bị coi là 0 (nếu coi 0 thì `T=0`, mọi điểm dương Không đỏ); không dùng nhóm khác; ngừng dấu đỏ cũ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Thiếu dữ liệu xét có chặn công khai hoặc phát hành không?” (Q15 «Thiếu dữ liệu xét có chặn công khai hoặc phát hành không?»), câu “Đã xét lại nhưng không tạo được ngưỡng hợp lệ thì dùng kết quả cũ không?” (Q26 «Đã xét lại nhưng không tạo được ngưỡng hợp lệ thì dùng kết quả cũ không?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.5 “Chọn bản nguồn” bước 4; Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:7053 «Figma MW: chương 04 – đăng ký, tổng hợp, chạy lại và kết quả») 「参照する平均点がありません。」 (không có trung bình tham chiếu), (58:7058) 「前回の判定結果は使用しません。」 (không dùng kết quả xét lần trước)
- Bằng chứng cần chụp: Ảnh kết quả, thông báo. SELECT `reason_code` (khi có schema; đề xuất `source_missing` — thiết kế DB v2 mục 4.3 “Trạng thái kết quả”, PROPOSED).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-011"></a>

### TC-RS-BR-011 — Nguồn chỉ cần khi quy tắc đọc trung bình/tỷ lệ nhóm

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05 «Đối tượng áp dụng và nhu cầu nguồn»)

<!-- Mã truy vết: TD-SRC-03 «Không có tổng hợp: Nguồn chưa từng chạy tổng hợp», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-RULE-03 «Tỷ lệ: Tỷ lệ điểm tối đa（得点率） 30%, không xử lý phần lẻ（しない）, Nhỏ hơn（未満）», TD-STU-01 «S01: G-A, HR1» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Không có kết quả tổng hợp nào (nguồn chưa có kết quả tổng hợp).
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30), quy tắc tỷ lệ 30%, nguồn chưa có kết quả tổng hợp, học sinh S01 (điểm 29)

**操作（Thao tác）**

1. Chỉ có quy tắc “Cố định 30” (dưới 30) (Toàn bộ, không điều kiện trung bình): đăng ký S01=29.
2. Chỉ có quy tắc tỷ lệ 30%: đăng ký S01=29.
3. Chỉ có quy tắc "cố định 30 `<`, điều kiện `A≥60`": đăng ký S01=29.

**期待結果（Kết quả mong đợi）**

1. Đỏ (không cần nguồn).
2. Đỏ (`M=100`, `T=30`; không cần nguồn).
3. Chưa xét được; không bỏ điều kiện để áp 30 cho mọi học sinh.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Không có kết quả tổng hợp nào (nguồn chưa có kết quả tổng hợp). - Dữ liệu test: quy tắc “Cố định 30” (dưới 30), quy tắc tỷ lệ 30%, nguồn chưa có kết quả tổng hợp, học sinh S01 (điểm 29) | Trigger/điểm quan sát: 1. Chỉ có quy tắc “Cố định 30” (dưới 30) (Toàn bộ, không điều kiện trung bình): đăng ký S01=29. 2. Chỉ có quy tắc tỷ lệ 30%: đăng ký S01=29. 3. Chỉ có quy tắc "cố định 30 `<`, điều kiện `A≥60`": đăng ký S01=29. | Oracle/bằng chứng: 1. Đỏ (không cần nguồn). 2. Đỏ (`M=100`, `T=30`; không cần nguồn). 3. Chưa xét được; không bỏ điều kiện để áp 30 cho mọi học sinh.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Điều kiện nào không cần nguồn trung bình?” (Q10 «Điều kiện nào không cần nguồn trung bình?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.6 “Khi nào không cần nguồn?” (ví dụ cố định 30 khi `A≥60`); Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:6945 «Figma MW: chương 04 – đăng ký, tổng hợp, chạy lại và kết quả») 「平均に依存しない設定は成績登録で判定。平均を使う適用条件があれば参照元が必要。」 (thiết lập không phụ thuộc trung bình xét khi đăng ký điểm; có điều kiện dùng trung bình thì cần nguồn)
- Bằng chứng cần chụp: Ảnh kết quả ba lần.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-012"></a>

### TC-RS-BR-012 — Điểm được xét là điểm cuối đã lưu (dự kiến, sửa tay, sau giới hạn miền điểm)

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Dùng điểm cuối cùng” (AC-G19 «Dùng điểm cuối cùng»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-ITEM-10 «Mục có tính tự động: TD-ITEM-01 có thêm quy tắc tính tự…», TD-STU-06 «S06: G-B, HR2», TD-STU-08 «S08: G-B, HR2» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30) và (cho biến thể c) mục số nguyên có thêm tính tự động có quy tắc tính tự động cho kết quả vượt 100.
- Dữ liệu test: mục số nguyên (M=100), mục số nguyên có thêm tính tự động; học sinh S06 (điểm dự kiến 24), học sinh S08 (sửa tay 28 thành 35), quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

(a) S06 = 24 là Điểm dự kiến（見込点）: đăng ký.

(b) S08: nhập 28, lưu; sửa tay thành 35, lưu.

(c) Tạo dữ liệu mà phép tính cho 120 nhưng điểm lưu hợp lệ là 100; áp quy tắc cố định 100 `<` và 100 `≤`.

**期待結果（Kết quả mong đợi）**

(a) Đỏ.

(b) Sau lần lưu thứ hai: xét 35 → Không đỏ.

(c) Xét `S=100`: `<100` Không đỏ; `≤100` Đỏ.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30) và (cho biến thể c) mục số nguyên có thêm tính tự động có quy tắc tính tự động cho kết quả vượt 100. - Dữ liệu test: mục số nguyên (M=100), mục số nguyên có thêm tính tự động; học sinh S06 (điểm dự kiến 24), học sinh S08 (sửa tay 28 thành 35), quy tắc “Cố định 30” (dưới 30) | Trigger/điểm quan sát: (a) S06 = 24 là Điểm dự kiến（見込点）: đăng ký. (b) S08: nhập 28, lưu; sửa tay thành 35, lưu. (c) Tạo dữ liệu mà phép tính cho 120 nhưng điểm lưu hợp lệ là 100; áp quy tắc cố định 100 `<` và 100 `≤`. | Oracle/bằng chứng: (a) Đỏ. (b) Sau lần lưu thứ hai: xét 35 → Không đỏ. (c) Xét `S=100`: `<100` Không đỏ; `≤100` Đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Dùng điểm nào để xét, và phân biệt điểm 0 với ô trống thế nào?” (Q3 «Dùng điểm nào để xét, và phân biệt điểm 0 với ô trống thế nào?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 2.3 “Điểm được đưa vào xét” (ví dụ 28→35, 120→100)
- Bằng chứng cần chụp: Ảnh điểm đã lưu và kết quả mỗi biến thể.
- Ghi chú: (c) cần cách tạo dữ liệu giới hạn miền điểm — hỏi team dev khi chuẩn bị.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-013"></a>

### TC-RS-BR-013 — Cờ Chưa dự thi（未受験） không loại điểm số khỏi xét

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Dùng điểm cuối cùng” (AC-G19 «Dùng điểm cuối cùng»)

<!-- Mã truy vết: TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-STU-07 «S07: G-B, HR2», TD-STU-09 «S09: G-B, HR2», TD-ITEM-02 «Mục số thập phân: Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc…», AC-G19, TC-RS-CALC-026 -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc “Cố định 30” (dưới 30) (`<30`).
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30); học sinh S07 (điểm 35, cờ Chưa dự thi（未受験）) (35, cờ Chưa dự thi) và biến thể S07 = 25 cùng cờ; học sinh S09 (mục số thập phân 29.5) (mục số thập phân (M=100) = 29.5) được thiết lập loại khỏi xếp hạng; mục số thập phân (M=100) có quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

1. Đăng ký S07=35 kèm cờ Chưa dự thi（未受験）.
2. Sửa S07=25, giữ cờ.
3. Đăng ký điểm 29.5 cho S09 (học sinh bị loại khỏi xếp hạng); chạy nút xanh rồi nút cam.

**期待結果（Kết quả mong đợi）**

1. Được xét → Không đỏ.
2. Được xét → Đỏ.
3. S09 được xét → Đỏ (29.5 `<30`); việc bị loại khỏi xếp hạng không loại ô khỏi xét đỏ.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: quy tắc “Cố định 30” (dưới 30) (`<30`). - Dữ liệu test: quy tắc “Cố định 30” (dưới 30); học sinh S07 (điểm 35, cờ Chưa dự thi（未受験）) (35, cờ Chưa dự thi) và biến thể S07 = 25 cùng cờ; học sinh S09 (mục số thập phân 29.5) (mục số thập phân (M=100) = 29.5) được thiết lập loại khỏi xếp hạng; mục số thập phân (M=100) có quy tắc “Cố định 30” (dưới 30) | Trigger/điểm quan sát: 1. Đăng ký S07=35 kèm cờ Chưa dự thi（未受験）. 2. Sửa S07=25, giữ cờ. 3. Đăng ký điểm 29.5 cho S09 (học sinh bị loại khỏi xếp hạng); chạy nút xanh rồi nút cam. | Oracle/bằng chứng: 1. Được xét → Không đỏ. 2. Được xét → Đỏ. 3. S09 được xét → Đỏ (29.5 `<30`); việc bị loại khỏi xếp hạng không loại ô khỏi xét đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Dùng điểm nào để xét, và phân biệt điểm 0 với ô trống thế nào?” (Q3 «Dùng điểm nào để xét, và phân biệt điểm 0 với ô trống thế nào?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 2.3 “Điểm được đưa vào xét”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Dùng điểm cuối cùng” (AC-G19 «Dùng điểm cuối cùng») ("không phụ thuộc AutoRating hay đối tượng xếp hạng")
- Bằng chứng cần chụp: Ảnh kết quả ba lần; ảnh thiết lập loại khỏi xếp hạng của S09.
- Sau khi chạy: Gỡ thiết lập loại khỏi xếp hạng của S09.
- Ghi chú: Loại khỏi xếp hạng chỉ ảnh hưởng tổng hợp thứ hạng (mẫu số trung bình: case “Mẫu số trung bình khi có học sinh bị loại khỏi xếp hạng”), không ảnh hưởng việc xét ô.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-014"></a>

### TC-RS-BR-014 — Ô trống không bị coi là 0 (trạng thái Không có điểm)

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Dùng điểm cuối cùng” (AC-G19 «Dùng điểm cuối cùng»)

<!-- Mã truy vết: TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-RULE-02 «Cố định `≤`: Như TD-RULE-01 nhưng Nhỏ hơn hoặc bằng（以下）», TD-STU-05 «S05: G-A, HR1», TD-STU-04 «S04: G-A, HR1» -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc “Cố định 30” (dưới 30) (`<30`) và quy tắc cố định 30 với Nhỏ hơn hoặc bằng（以下） biến thể cố định 0 `≤`.
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30), quy tắc cố định 30 với Nhỏ hơn hoặc bằng（以下）; học sinh S05 (ô trống) (trống), học sinh S04 (điểm 0) (0)

**操作（Thao tác）**

1. Với quy tắc “Cố định 30” (dưới 30): đăng ký S04=0, để S05 trống.
2. Đổi thành quy tắc cố định 0 `≤`, chạy lại.

**期待結果（Kết quả mong đợi）**

1. S04 Đỏ (0 hợp lệ là số); S05 Không có điểm, không dấu đỏ.
2. S04 Đỏ (`0≤0`); S05 vẫn Không có điểm (không thành Đỏ như thể là 0).

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: quy tắc “Cố định 30” (dưới 30) (`<30`) và quy tắc cố định 30 với Nhỏ hơn hoặc bằng（以下） biến thể cố định 0 `≤`. - Dữ liệu test: quy tắc “Cố định 30” (dưới 30), quy tắc cố định 30 với Nhỏ hơn hoặc bằng（以下）; học sinh S05 (ô trống) (trống), học sinh S04 (điểm 0) (0) | Trigger/điểm quan sát: 1. Với quy tắc “Cố định 30” (dưới 30): đăng ký S04=0, để S05 trống. 2. Đổi thành quy tắc cố định 0 `≤`, chạy lại. | Oracle/bằng chứng: 1. S04 Đỏ (0 hợp lệ là số); S05 Không có điểm, không dấu đỏ. 2. S04 Đỏ (`0≤0`); S05 vẫn Không có điểm (không thành Đỏ như thể là 0).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Dùng điểm nào để xét, và phân biệt điểm 0 với ô trống thế nào?” (Q3 «Dùng điểm nào để xét, và phân biệt điểm 0 với ô trống thế nào?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 2.3 “Điểm được đưa vào xét”, mục 8.1 “Các trạng thái phải phân biệt”
- Bằng chứng cần chụp: Ảnh kết quả; bằng chứng trạng thái lưu (khi có schema).
- Ghi chú: Cách lưu trạng thái Không có điểm (`judgment_status=4`, `reason_code=no_score`) theo thiết kế DB v2 là PROPOSED, chờ review (đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-015"></a>

### TC-RS-BR-015 — Lưu cấu hình không xét; kết quả trước giữ tới lần chạy lại

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại” (AC-G21 «Giữ kết quả trước khi chạy lại và xóa rule cuối»)

<!-- Mã truy vết: TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», AC-G21 -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc “Cố định 30” (dưới 30); S03 sửa thành 32 và đã xét → Không đỏ.
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

1. Đổi ngưỡng thành 35 `<`, lưu.
2. Xem ba đầu ra.
3. Đổi thứ tự quy tắc/đổi nguồn (nếu có), lưu, xem lại.
4. Chỉ đổi dấu (`<35` → `≤35`), lưu, xem lại. Nếu công thức thuộc đợt phát hành: chỉ đổi công thức của một quy tắc công thức, lưu, xem lại.
5. Chạy lại (đăng ký lại điểm S03 hoặc nút cam), xem ba đầu ra.

**期待結果（Kết quả mong đợi）**

1. Sau lưu: không báo "đã cập nhật điểm đỏ học sinh"; có hướng dẫn chạy lại.

2–4. S03 vẫn Không đỏ theo kết quả trước; hiệu ứng hiển thị trước đó giữ nguyên.

5. Sau chạy lại thành công: S03 Đỏ.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: quy tắc “Cố định 30” (dưới 30); S03 sửa thành 32 và đã xét → Không đỏ. - Dữ liệu test: quy tắc “Cố định 30” (dưới 30) | Trigger/điểm quan sát: 1. Đổi ngưỡng thành 35 `<`, lưu. 2. Xem ba đầu ra. 3. Đổi thứ tự quy tắc/đổi nguồn (nếu có), lưu, xem lại. 4. Chỉ đổi dấu (`<35` → `≤35`), lưu, xem lại. Nếu công thức thuộc đợt phát hành: chỉ đổi công thức của một quy tắc công thức, lưu, xem lại. 5. Chạy lại (đăng ký lại điểm S03 hoặc nút cam), xem ba đầu ra. | Oracle/bằng chứng: 1. Sau lưu: không báo "đã cập nhật điểm đỏ học sinh"; có hướng dẫn chạy lại. 2–4. S03 vẫn Không đỏ theo kết quả trước; hiệu ứng hiển thị trước đó giữ nguyên. 5. Sau chạy lại thành công: S03 Đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Lưu điều kiện hoặc thay nguồn có cập nhật ngay kết quả không?” (Q13 «Lưu điều kiện hoặc thay nguồn có cập nhật ngay kết quả không?») (ví dụ 32, `<30`→`<35`); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 4.4 “Lưu, đổi thứ tự và xóa”, mục 7.2 “Bảng sự kiện”, mục 8.2 “Bảng chuyển trạng thái” dòng 1–2; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại” (AC-G21 «Giữ kết quả trước khi chạy lại và xóa rule cuối») ("Chỉ đổi ngưỡng/dấu/công thức/ưu tiên/đối tượng/nguồn… thì vẫn giữ kết quả"); Figma MW “màn danh sách thiết lập điểm đỏ” (58:10158 «Figma MW: màn danh sách thiết lập điểm đỏ») 「設定を変更した場合は、成績登録または成績集計の自動算出を再実行してください。」 (đổi thiết lập thì chạy lại đăng ký điểm hoặc tính tự động), “chương 01 – lối vào, danh sách, xóa thiết lập” (58:10179 «Figma MW: chương 01 – lối vào, danh sách, xóa thiết lập»)
- Bằng chứng cần chụp: Ảnh thông báo sau lưu; ảnh đầu ra trước/sau chạy lại.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-016"></a>

### TC-RS-BR-016 — Sửa điểm 29 → 40 được lưu và xét trong cùng lượt

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn” (AC-G26 «Lưu thành công và thông báo an toàn»)

<!-- Mã truy vết: TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-STU-01 «S01: G-A, HR1» -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc “Cố định 30” (dưới 30); S01=29 Đỏ.
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29)

**操作（Thao tác）**

1. Sửa S01 thành 40, lưu thành công.
2. Xem ba đầu ra ngay sau đó.

**期待結果（Kết quả mong đợi）**

S01 Không đỏ; không cần bật một chế độ thủ công/tự động riêng.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: quy tắc “Cố định 30” (dưới 30); S01=29 Đỏ. - Dữ liệu test: quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29) | Trigger/điểm quan sát: 1. Sửa S01 thành 40, lưu thành công. 2. Xem ba đầu ra ngay sau đó. | Oracle/bằng chứng: S01 Không đỏ; không cần bật một chế độ thủ công/tự động riêng.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Khi nào xét điểm đỏ và có cần chế độ thủ công/tự động riêng không?” (Q11 «Khi nào xét điểm đỏ và có cần chế độ thủ công/tự động riêng không?») (ví dụ 29→40); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 8.2 “Bảng chuyển trạng thái” dòng 3
- Bằng chứng cần chụp: Ảnh trước/sau.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-017"></a>

### TC-RS-BR-017 — Chạy lại không tạo được ngưỡng hợp lệ → Chưa xét được, ngừng kết quả cũ, giữ điểm

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Trạng thái sau lần chạy” (AC-G20 «Trạng thái sau lần chạy»)

<!-- Mã truy vết: TD-SRC-02 «Bản mới nhất chưa chốt: Tổng hợp chạy sau TD-SRC-01, `A` = 62», TD-ITEM-08 «M không hợp lệ: Mục số có M hiệu lực = 0 (nếu cấu hình được) hoặc không…», TD-RULE-11 «Chia cho trung bình: Dòng 1: Số cố định（固定値）100 ÷ Trung bình（平均点）», TD-STU-01 «S01: G-A, HR1», TD-SRC-03 «Không có tổng hợp: Nguồn chưa từng chạy tổng hợp» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Ô S01=29 Đỏ theo công thức `A×0.5` (nguồn bản tổng hợp mới nhất chưa chốt (trung bình 62)).
- Dữ liệu test: mục có M không hợp lệ, quy tắc công thức 100 ÷ trung bình, bản tổng hợp mới nhất chưa chốt (trung bình 62); học sinh S01 (điểm 29), nguồn chưa có kết quả tổng hợp

**操作（Thao tác）**

1. Biến thể (a): đổi nguồn sang nguồn chưa có kết quả tổng hợp (không có tổng hợp), lưu, chạy lại.
2. Biến thể (b): quy tắc tỷ lệ với M không hợp lệ (mục có M không hợp lệ), chạy lại.
3. Biến thể (c): quy tắc công thức 100 ÷ trung bình với `A=0`, chạy lại.
4. Sau mỗi biến thể: xem ba đầu ra và điểm S01.

**期待結果（Kết quả mong đợi）**

Mỗi biến thể: trạng thái Chưa xét được; dấu/lọc đỏ cũ ngừng ở cả ba đầu ra; điểm S01 vẫn 29; không đi xuống quy tắc thấp hơn; không bật lại ngưỡng cũ `red_score`.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Ô S01=29 Đỏ theo công thức `A×0.5` (nguồn bản tổng hợp mới nhất chưa chốt (trung bình 62)). - Dữ liệu test: mục có M không hợp lệ, quy tắc công thức 100 ÷ trung bình, bản tổng hợp mới nhất chưa chốt (trung bình 62); học sinh S01 (điểm 29), nguồn chưa có kết quả tổng hợp | Trigger/điểm quan sát: 1. Biến thể (a): đổi nguồn sang nguồn chưa có kết quả tổng hợp (không có tổng hợp), lưu, chạy lại. 2. Biến thể (b): quy tắc tỷ lệ với M không hợp lệ (mục có M không hợp lệ), chạy lại. 3. Biến thể (c): quy tắc công thức 100 ÷ trung bình với `A=0`, chạy lại. 4. Sau mỗi biến thể: xem ba đầu ra và điểm S01. | Oracle/bằng chứng: Mỗi biến thể: trạng thái Chưa xét được; dấu/lọc đỏ cũ ngừng ở cả ba đầu ra; điểm S01 vẫn 29; không đi xuống quy tắc thấp hơn; không bật lại ngưỡng cũ `red_score`.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Đã xét lại nhưng không tạo được ngưỡng hợp lệ thì dùng kết quả cũ không?” (Q26 «Đã xét lại nhưng không tạo được ngưỡng hợp lệ thì dùng kết quả cũ không?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 8.2 “Bảng chuyển trạng thái” dòng 4, mục 8.3 “Không tạo được ngưỡng hợp lệ”; Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:7047 «Figma MW: chương 04 – đăng ký, tổng hợp, chạy lại và kết quả») 「処理が完了しました。判定できない項目は判定不能とし、旧結果を停止しました。」 (xử lý xong; mục không xét được chuyển thành Không xét được（判定不能） và ngừng kết quả cũ), (58:7066) (file cũ 4592:2537 «Figma: chương 04 – đăng ký, tổng hợp, chạy lại và kết quả — MW 58:6933», 4592:2554 ghi 未判定 (chưa xét))
- Bằng chứng cần chụp: Ảnh đầu ra trước/sau; ảnh thông báo; ảnh điểm. SELECT `judgment_status`/`reason_code` (khi có schema; thiết kế DB v2 mục 4.3 “Trạng thái kết quả”, PROPOSED).
- Ghi chú: (b) phụ thuộc cách tạo M không hợp lệ.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-018"></a>

### TC-RS-BR-018 — Đổi phạm vi làm ô không còn quy tắc áp dụng: giữ khi chưa chạy; chạy lại → Không áp dụng

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại” (AC-G21 «Giữ kết quả trước khi chạy lại và xóa rule cuối»)

<!-- Mã truy vết: TD-STU-01 «S01: G-A, HR1» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Quy tắc lọc lớp G-A; S01 (G-A) = 29 Đỏ.
- Dữ liệu test: học sinh S01 (điểm 29)

**操作（Thao tác）**

1. Đổi bộ lọc sang lớp G-B, lưu. Xem đầu ra.
2. Chạy lại. Xem đầu ra.

**期待結果（Kết quả mong đợi）**

1. S01 vẫn Đỏ (kết quả trước).
2. S01 Không áp dụng; ngừng dấu/lọc đỏ cũ; điểm giữ nguyên.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Quy tắc lọc lớp G-A; S01 (G-A) = 29 Đỏ. - Dữ liệu test: học sinh S01 (điểm 29) | Trigger/điểm quan sát: 1. Đổi bộ lọc sang lớp G-B, lưu. Xem đầu ra. 2. Chạy lại. Xem đầu ra. | Oracle/bằng chứng: 1. S01 vẫn Đỏ (kết quả trước). 2. S01 Không áp dụng; ngừng dấu/lọc đỏ cũ; điểm giữ nguyên.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Xét lại xong mà không còn thiết lập áp dụng thì làm gì?” (Q27 «Xét lại xong mà không còn thiết lập áp dụng thì làm gì?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 8.2 “Bảng chuyển trạng thái” dòng 5–6; Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:7067 «Figma MW: chương 04 – đăng ký, tổng hợp, chạy lại và kết quả») 「再実行で適用条件なし：旧結果を停止し対象外。点数は残す。」 (chạy lại mà không có điều kiện áp dụng: ngừng kết quả cũ, ngoài đối tượng, giữ điểm)
- Bằng chứng cần chụp: Ảnh đầu ra hai lần.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-019"></a>

### TC-RS-BR-019 — Xóa quy tắc cuối: giữ kết quả tới lần chạy lại; chạy lại → Không áp dụng

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại” (AC-G21 «Giữ kết quả trước khi chạy lại và xóa rule cuối»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-OUT-01 «Trích xuất lọc + ký hiệu trước + màu: Lọc học sinh có điểm đỏ（抽出する） BẬT», TD-OUT-04 «Phiếu điểm: Dòng Thiết lập điểm đỏ（赤点設定）: Ký tự phía trước（前に任意の文字） `※`», TD-STU-01 «S01: G-A, HR1», TD-OUT-03 «Công khai: Hiệu ứng đỏ: `*` phía trước（前に「*」）», TC-RS-FUNC-021 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) chỉ có quy tắc “Cố định 30” (dưới 30); S01=29 Đỏ. Trích xuất cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, công khai `*` trước, phiếu cấu hình phiếu điểm: ký tự “※” phía trước đã cấu hình.
- Dữ liệu test: mục số nguyên (M=100), quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29), cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước

**操作（Thao tác）**

1. Xóa quy tắc “Cố định 30” (dưới 30) (quy tắc cuối).
2. Xem ba đầu ra.
3. Chạy lại bằng đăng ký điểm lớp G-A hoặc chạy hàng loạt.
4. Xem ba đầu ra và cấu hình trình bày đầu ra.

**期待結果（Kết quả mong đợi）**

1–2. Danh sách rỗng nhưng S01 vẫn hiện dấu đỏ/thỏa lọc ở ba đầu ra.

3–4. Lần chạy xét cả mục đã hết quy tắc: S01 Không áp dụng, ngừng dấu/lọc; điểm giữ nguyên. Cấu hình trình bày đỏ đã lưu ở đầu ra không bị xóa như tác dụng phụ.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) chỉ có quy tắc “Cố định 30” (dưới 30); S01=29 Đỏ. Trích xuất cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, công khai `*` trước, phiếu cấu hình phiếu điểm: ký tự “※” phía trước đã cấu hình. - Dữ liệu test: mục số nguyên (M=100), quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29), cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước | Trigger/điểm quan sát: 1. Xóa quy tắc “Cố định 30” (dưới 30) (quy tắc cuối). 2. Xem ba đầu ra. 3. Chạy lại bằng đăng ký điểm lớp G-A hoặc chạy hàng loạt. 4. Xem ba đầu ra và cấu hình trình bày đầu ra. | Oracle/bằng chứng: 1–2. Danh sách rỗng nhưng S01 vẫn hiện dấu đỏ/thỏa lọc ở ba đầu ra. 3–4. Lần chạy xét cả mục đã hết quy tắc: S01 Không áp dụng, ngừng dấu/lọc; điểm giữ nguyên. Cấu hình trình bày đỏ đã lưu ở đầu ra không bị xóa như tác dụng phụ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Xóa thiết lập cuối cùng thì dấu đỏ mất ngay hay chờ chạy lại?” (Q28 «Xóa thiết lập cuối cùng thì dấu đỏ mất ngay hay chờ chạy lại?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 4.1 “Điểm vào và trạng thái trống”, mục 4.4 “Lưu, đổi thứ tự và xóa”, mục 8.2 “Bảng chuyển trạng thái” dòng 7–8, mục 10.1 “Phạm vi và tùy chọn”; Figma MW “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9618 «Figma MW: chương 01 – lối vào, danh sách, xóa thiết lập») 「削除後も再実行まで前回結果を使用します。」 (sau khi xóa vẫn dùng kết quả trước tới khi chạy lại), “chương 05 – trích xuất thành tích và kết quả Excel” (58:6248 «Figma MW: chương 05 – trích xuất thành tích và kết quả Excel»), “chương 06 – công khai thành tích và màn học sinh” (58:5598 «Figma MW: chương 06 – công khai thành tích và màn học sinh»)
- Bằng chứng cần chụp: Ảnh/file ba đầu ra ở bước 2 và 4; ảnh cấu hình đầu ra sau bước 4.
- Ghi chú: Trường không có tính tự động: chạy lại bằng thao tác hàng loạt hiện có (case “Trường chỉ có quy tắc đỏ (không có tính tự động) vẫn có đường chạy hàng loạt”). Xóa chuyển `setting_status=2` trong cùng transaction; kết quả giữ đến lần xét tiếp theo (thiết kế DB v2 mục 4.1 và 4.4 — PROPOSED); có thể SELECT làm bằng chứng. Không dùng kiểm tra truthy/khác 0 để xác định rule có hiệu lực. Kiểm thêm (PROPOSED, khi có schema): sau bước 1, tạo một quy tắc mới → quy tắc mới có ID mới, không dùng lại ID đã xóa; kết quả cũ vẫn trỏ ID cũ.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-020"></a>

### TC-RS-BR-020 — Xóa điểm thành trống → Không có điểm, bỏ dấu đỏ cũ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Dùng điểm cuối cùng” (AC-G19 «Dùng điểm cuối cùng»)

<!-- Mã truy vết: TD-STU-01 «S01: G-A, HR1», TD-OUT-01 «Trích xuất lọc + ký hiệu trước + màu: Lọc học sinh có điểm đỏ（抽出する） BẬT» -->

**前提条件（Điều kiện trước）**

- Điều kiện: S01=29 Đỏ.
- Dữ liệu test: học sinh S01 (điểm 29), cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu

**操作（Thao tác）**

1. Xóa điểm S01 thành trống, lưu.
2. Xem ba đầu ra, chạy trích xuất có lọc đỏ.

**期待結果（Kết quả mong đợi）**

S01 Không có điểm; không còn dấu đỏ; không thỏa lọc đỏ nhờ ô này. Không cần chờ chạy lại.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: S01=29 Đỏ. - Dữ liệu test: học sinh S01 (điểm 29), cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu | Trigger/điểm quan sát: 1. Xóa điểm S01 thành trống, lưu. 2. Xem ba đầu ra, chạy trích xuất có lọc đỏ. | Oracle/bằng chứng: S01 Không có điểm; không còn dấu đỏ; không thỏa lọc đỏ nhờ ô này. Không cần chờ chạy lại.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.1 “Trình tự cho một ô” bước 2, mục 7.2 “Bảng sự kiện” (Xóa điểm số thành trống), mục 8.2 “Bảng chuyển trạng thái” dòng 9; [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Dùng điểm nào để xét, và phân biệt điểm 0 với ô trống thế nào?” (Q3 «Dùng điểm nào để xét, và phân biệt điểm 0 với ô trống thế nào?»)
- Bằng chứng cần chụp: Ảnh/file đầu ra.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-021"></a>

### TC-RS-BR-021 — Tổng hợp lại hoặc đổi nhóm tham chiếu không tự xét lại

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Thứ tự đánh giá tương đối” (AC-G25 «Thứ tự đánh giá tương đối»)

<!-- Mã truy vết: TD-SRC-02 «Bản mới nhất chưa chốt: Tổng hợp chạy sau TD-SRC-01, `A` = 62», TC-RS-BR-007 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Công thức `A×0.5`, `A=50` → `T=25`; học sinh điểm 24 Đỏ.
- Dữ liệu test: bản tổng hợp mới nhất chưa chốt (trung bình 62)

**操作（Thao tác）**

1. Sửa điểm nhóm để trung bình mới là 40, bấm Thực hiện tổng hợp（集計実行）.
2. Xem kết quả học sinh 24.
3. Bấm Thực hiện tính toán tự động（自動算出実行）, xem lại.

**期待結果（Kết quả mong đợi）**

1–2. Vẫn Đỏ theo kết quả trước (không tự xét lại).

3. `A=40` → `T=20` → 24 Không đỏ.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Công thức `A×0.5`, `A=50` → `T=25`; học sinh điểm 24 Đỏ. - Dữ liệu test: bản tổng hợp mới nhất chưa chốt (trung bình 62) | Trigger/điểm quan sát: 1. Sửa điểm nhóm để trung bình mới là 40, bấm Thực hiện tổng hợp（集計実行）. 2. Xem kết quả học sinh 24. 3. Bấm Thực hiện tính toán tự động（自動算出実行）, xem lại. | Oracle/bằng chứng: 1–2. Vẫn Đỏ theo kết quả trước (không tự xét lại). 3. `A=40` → `T=20` → 24 Không đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Lưu điều kiện hoặc thay nguồn có cập nhật ngay kết quả không?” (Q13 «Lưu điều kiện hoặc thay nguồn có cập nhật ngay kết quả không?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.2 “Bảng sự kiện” (Tổng hợp lại/cập nhật nhóm tham chiếu)
- Bằng chứng cần chụp: Ảnh kết quả sau mỗi bước.
- Ghi chú: Nếu có bản chốt cùng phạm vi, bước 3 vẫn dùng bản chốt (case “Nguồn: bản đã chốt được ưu tiên hơn tổng hợp mới hơn”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-022"></a>

### TC-RS-BR-022 — Đổi M ở Thiết lập điểm tối đa（満点設定） hoặc Giá trị tối đa（最大値） không tự xét lại

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị” (AC-G24 «Trigger khi đổi điểm tối đa/đơn vị»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-03 «Tỷ lệ: Tỷ lệ điểm tối đa（得点率） 30%, không xử lý phần lẻ（しない）, Nhỏ hơn（未満）» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có quy tắc tỷ lệ 30% (30%); S03 = 31, `M=100` → `T=30` → Không đỏ.
- Dữ liệu test: mục số nguyên (M=100); quy tắc tỷ lệ 30%

**操作（Thao tác）**

1. Sửa Giá trị tối đa（最大値） của mục số nguyên (M=100) ở Thiết lập ô nhập（入力欄設定） thành 200, lưu. Xem kết quả.
2. Lưu một định nghĩa lựa chọn ở Thiết lập điểm tối đa（満点設定） (`/admin/grade_report_setting/manage/detail/option/register/change_max_score`) (chưa gán cho lớp). Xem kết quả.
3. Đăng ký lại điểm S03. Xem kết quả.

**期待結果（Kết quả mong đợi）**

1–2. S03 vẫn Không đỏ (kết quả trước).

3. `M=200` → `T=60` → S03=31 Đỏ.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) có quy tắc tỷ lệ 30% (30%); S03 = 31, `M=100` → `T=30` → Không đỏ. - Dữ liệu test: mục số nguyên (M=100); quy tắc tỷ lệ 30% | Trigger/điểm quan sát: 1. Sửa Giá trị tối đa（最大値） của mục số nguyên (M=100) ở Thiết lập ô nhập（入力欄設定） thành 200, lưu. Xem kết quả. 2. Lưu một định nghĩa lựa chọn ở Thiết lập điểm tối đa（満点設定） (`/admin/grade_report_setting/manage/detail/option/register/change_max_score`) (chưa gán cho lớp). Xem kết quả. 3. Đăng ký lại điểm S03. Xem kết quả. | Oracle/bằng chứng: 1–2. S03 vẫn Không đỏ (kết quả trước). 3. `M=200` → `T=60` → S03=31 Đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Thay điểm tối đa thì xử lý thế nào?” (Q14 «Thay điểm tối đa thì xử lý thế nào?»), câu “Những đường đổi điểm tối đa nào hiện chạy tính tự động?” (Q20 «Những đường đổi điểm tối đa nào hiện chạy tính tự động?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.3 “Thay đổi điểm tối đa”; Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:7069 «Figma MW: chương 04 – đăng ký, tổng hợp, chạy lại và kết quả») 「定義としての満点設定保存と、授業の選択肢保存・成績登録は別の操作。」 (lưu định nghĩa điểm tối đa khác với lưu lựa chọn lớp/đăng ký điểm); CODE `itemStore`, `optionStore`
- Bằng chứng cần chụp: Ảnh kết quả sau mỗi bước.
- Sau khi chạy: Trả M về 100.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-023"></a>

### TC-RS-BR-023 — Nút xanh Thực hiện tổng hợp（集計実行） không xét điểm đỏ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Thứ tự đánh giá tương đối” (AC-G25 «Thứ tự đánh giá tương đối»)

<!-- Mã truy vết: TD-RULE-01 «Cố định `<`: Tên "Cố định 30"» -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc “Cố định 30” (dưới 30) vừa đổi từ 30 thành 35 và lưu; S03=32 Không đỏ (kết quả trước).
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

1. Bấm Thực hiện tổng hợp（集計実行）, chờ hoàn tất.
2. Xem kết quả S03.

**期待結果（Kết quả mong đợi）**

S03 vẫn Không đỏ.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: quy tắc “Cố định 30” (dưới 30) vừa đổi từ 30 thành 35 và lưu; S03=32 Không đỏ (kết quả trước). - Dữ liệu test: quy tắc “Cố định 30” (dưới 30) | Trigger/điểm quan sát: 1. Bấm Thực hiện tổng hợp（集計実行）, chờ hoàn tất. 2. Xem kết quả S03. | Oracle/bằng chứng: S03 vẫn Không đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Quy trình vận hành khi có đánh giá tương đối là gì?” (Q12 «Quy trình vận hành khi có đánh giá tương đối là gì?») ("chạy nút xanh không tự chứng minh đã cập nhật kết quả đỏ"); CODE đường ghi điểm “Nút xanh 集計実行 (chạy tổng hợp – nút xanh dương)”
- Bằng chứng cần chụp: Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](scope-and-approach.vi.md#conventions) mục 9 “Quy ước thực thi chung”） dòng S03 sau khi tổng hợp xong; ảnh thời điểm chạy trên màn Tổng hợp thành tích（成績集計）.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-024"></a>

### TC-RS-BR-024 — Xem, xuất, công khai, in lại không kích hoạt xét

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Xem/xuất không tự xét” (AC-G28 «Xem/xuất không tự xét»)

<!-- Mã truy vết: TC-RS-BR-015, TD-OUT-01 «Trích xuất lọc + ký hiệu trước + màu: Lọc học sinh có điểm đỏ（抽出する） BẬT», TD-OUT-03 «Công khai: Hiệu ứng đỏ: `*` phía trước（前に「*」）», TD-OUT-04 «Phiếu điểm: Dòng Thiết lập điểm đỏ（赤点設定）: Ký tự phía trước（前に任意の文字） `※`», AC-G28 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Như case “Lưu cấu hình không xét; kết quả trước giữ tới lần chạy lại” bước 1 (đã lưu `<35`, chưa chạy lại; S03=32 Không đỏ).
- Dữ liệu test: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước

**操作（Thao tác）**

1. Chạy trích xuất, xuất Excel.
2. Mở màn công khai học sinh, tải PDF công khai.
3. Xuất PDF phiếu.

**期待結果（Kết quả mong đợi）**

S03 vẫn Không đỏ ở mọi đầu ra; không có lượt xét mới (thời điểm kết quả không đổi); không có lượt tổng hợp mới (lượt/thời điểm tổng hợp mới nhất không đổi).

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Như case “Lưu cấu hình không xét; kết quả trước giữ tới lần chạy lại” bước 1 (đã lưu `<35`, chưa chạy lại; S03=32 Không đỏ). - Dữ liệu test: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước | Trigger/điểm quan sát: 1. Chạy trích xuất, xuất Excel. 2. Mở màn công khai học sinh, tải PDF công khai. 3. Xuất PDF phiếu. | Oracle/bằng chứng: S03 vẫn Không đỏ ở mọi đầu ra; không có lượt xét mới (thời điểm kết quả không đổi); không có lượt tổng hợp mới (lượt/thời điểm tổng hợp mới nhất không đổi).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?” (Q16 «Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.2 “Bảng sự kiện” (dòng cuối), mục 9.3 “Xuất file”, mục 10.3 “Quyền, thời điểm và đầu ra liên quan”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Xem/xuất không tự xét” (AC-G28 «Xem/xuất không tự xét») ("không xét lại hoặc tổng hợp lại"); Figma MW “chương 00 – hướng dẫn đọc và luồng tổng thể” (58:10202 «Figma MW: chương 00 – hướng dẫn đọc và luồng tổng thể») 「閲覧・出力だけでは再判定しない。」 (chỉ xem/xuất thì không xét lại), “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:7060 «Figma MW: chương 04 – đăng ký, tổng hợp, chạy lại và kết quả»)
- Bằng chứng cần chụp: File/ảnh đầu ra; bằng chứng thời điểm cập nhật kết quả và lượt tổng hợp mới nhất không đổi trước/sau (khi có schema).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-025"></a>

### TC-RS-BR-025 — Đầu ra không bị chặn vì chưa có hoặc chưa xét được kết quả đỏ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Xem/xuất không tự xét” (AC-G28 «Xem/xuất không tự xét»)

<!-- Mã truy vết: TD-OUT-01 «Trích xuất lọc + ký hiệu trước + màu: Lọc học sinh có điểm đỏ（抽出する） BẬT», TD-OUT-03 «Công khai: Hiệu ứng đỏ: `*` phía trước（前に「*」）», TD-OUT-04 «Phiếu điểm: Dòng Thiết lập điểm đỏ（赤点設定）: Ký tự phía trước（前に任意の文字） `※`» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Một số ô Chưa từng xét, một số Chưa xét được.
- Dữ liệu test: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước

**操作（Thao tác）**

1. Chạy trích xuất và xuất Excel.
2. Công khai cho học sinh, xem màn học sinh.
3. Xuất PDF phiếu.

**期待結果（Kết quả mong đợi）**

Mọi thao tác hoàn tất bình thường; ô chưa có kết quả không có dấu đỏ và hiển thị theo thiết lập hiện hữu. Quyền, lịch công khai, điều kiện ẩn hiện có vẫn giữ.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Một số ô Chưa từng xét, một số Chưa xét được. - Dữ liệu test: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước | Trigger/điểm quan sát: 1. Chạy trích xuất và xuất Excel. 2. Công khai cho học sinh, xem màn học sinh. 3. Xuất PDF phiếu. | Oracle/bằng chứng: Mọi thao tác hoàn tất bình thường; ô chưa có kết quả không có dấu đỏ và hiển thị theo thiết lập hiện hữu. Quyền, lịch công khai, điều kiện ẩn hiện có vẫn giữ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Thiếu dữ liệu xét có chặn công khai hoặc phát hành không?” (Q15 «Thiếu dữ liệu xét có chặn công khai hoặc phát hành không?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 8.4 “Lỗi kỹ thuật và thông báo” (đoạn cuối); Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:7068 «Figma MW: chương 04 – đăng ký, tổng hợp, chạy lại và kết quả») 「未判定だけを理由に公開・帳票発行を止めない。」 (không dừng công khai/phát hành phiếu chỉ vì chưa xét được)
- Bằng chứng cần chụp: Ảnh/file đầu ra.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-027"></a>

### TC-RS-BR-027 — Chạy lại nhiều lần cho cùng kết quả, không nhân đôi dấu

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật” (AC-G22 «Kết quả chung và thứ tự cập nhật»)

<!-- Mã truy vết: TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-OUT-02 «Trích xuất chỉ ký hiệu: Lọc TẮT», TD-STU-01 «S01: G-A, HR1» -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc “Cố định 30” (dưới 30); S01=29 Đỏ; trích xuất cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) (`※`, `!`).
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29), cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau)

**操作（Thao tác）**

1. Chạy nút cam 3 lần liên tiếp (chờ mỗi lần hoàn tất).
2. Xem trích xuất; SELECT số kết quả hiện hành của ô S01 (khi có schema).

**期待結果（Kết quả mong đợi）**

Ô S01 hiện `※29!` (không `※※29!!`); chỉ một kết quả hiện hành cho ô.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: quy tắc “Cố định 30” (dưới 30); S01=29 Đỏ; trích xuất cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) (`※`, `!`). - Dữ liệu test: quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29), cấu hình trích xuất chỉ ký hiệu (“※” trước, “!” sau) | Trigger/điểm quan sát: 1. Chạy nút cam 3 lần liên tiếp (chờ mỗi lần hoàn tất). 2. Xem trích xuất; SELECT số kết quả hiện hành của ô S01 (khi có schema). | Oracle/bằng chứng: Ô S01 hiện `※29!` (không `※※29!!`); chỉ một kết quả hiện hành cho ô.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.1 “Trình tự cho một ô” (đoạn cuối)
- Bằng chứng cần chụp: Ảnh trích xuất; ảnh SELECT.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-028"></a>

### TC-RS-BR-028 — Nhóm tham chiếu có lớp khác M không gây lỗi dừng xử lý

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kế thừa tỷ lệ nhóm” (AC-G15 «Kế thừa tỷ lệ nhóm»)

<!-- Mã truy vết: TD-SRC-06 «Tỷ lệ nhóm khác M: 2 học sinh: 20/50 (lớp dùng M=50) và 80/100», TD-RULE-09 «Tỷ lệ nhóm: Điều kiện Tỷ lệ điểm của nhóm（集団の得点率） `≥65%`», AC-G15, TC-RS-CALC-024 -->

**前提条件（Điều kiện trước）**

- Điều kiện: nhóm tham chiếu gồm G-A có `M=20` và G-B có `M=100`; rule dùng `R (tỷ lệ nhóm)` với điều kiện `R≥65%`; P1 thuộc phạm vi được xét.
- Dữ liệu test: G-A có `10/20`, G-B có `80/100`; tổng `90/120` nên `R=75%`; P1 có `S=60`, ngưỡng kết quả `T=70`.

**操作（Thao tác）**

1. Lưu quy tắc theo tỷ lệ điểm của nhóm từ 65% với nguồn là nhóm trên.
2. Chạy nút xanh rồi nút cam cho phạm vi.
3. Xem màn kết quả xử lý và kết quả P1.

**期待結果（Kết quả mong đợi）**

1. Lưu được; không bị chặn vì nhóm có lớp khác M.

2–3. Xử lý hoàn tất, không lỗi dừng do khác M. `R=(10+80)/(20+100)×100=75%` lấy từ tổng điểm/tổng M của cùng tập → khớp `≥65%` → `T=70` → P1 Đỏ. Không được tính bằng trung bình tỷ lệ cá nhân và không có tùy chọn A/B.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: nhóm tham chiếu gồm G-A có `M=20` và G-B có `M=100`; rule dùng `R (tỷ lệ nhóm)` với điều kiện `R≥65%`; P1 thuộc phạm vi được xét. - Dữ liệu test: G-A có `10/20`, G-B có `80/100`; tổng `90/120` nên `R=75%`; P1 có `S=60`, ngưỡng kết quả `T=70`. | Trigger/điểm quan sát: 1. Lưu quy tắc theo tỷ lệ điểm của nhóm từ 65% với nguồn là nhóm trên. 2. Chạy nút xanh rồi nút cam cho phạm vi. 3. Xem màn kết quả xử lý và kết quả P1. | Oracle/bằng chứng: 1. Lưu được; không bị chặn vì nhóm có lớp khác M. 2–3. Xử lý hoàn tất, không lỗi dừng do khác M. `R=(10+80)/(20+100)×100=75%` lấy từ tổng điểm/tổng M của cùng tập → khớp `≥65%` → `T=70` → P1 Đỏ. Không được tính bằng trung bình tỷ lệ cá nhân và không có tùy chọn A/B.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Tỷ lệ nhóm có cần xử lý riêng khi các lớp khác điểm tối đa không?” (Q31 «Tỷ lệ nhóm có cần xử lý riêng khi các lớp khác điểm tối đa không?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.3 “Tỷ lệ nhóm” (công thức `R` = tổng điểm ÷ tổng điểm tối đa của cùng tập; Phạm vi vận hành, đoạn cuối); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Kế thừa tỷ lệ nhóm” (AC-G15 «Kế thừa tỷ lệ nhóm») ("không tính lại bằng trung bình tỷ lệ cá nhân"; "không bị chặn cấu hình hoặc làm dừng xử lý"); C-01
- Bằng chứng cần chụp: Ảnh lưu quy tắc; ảnh màn kết quả xử lý và giá trị tỷ lệ nhóm của nguồn; ảnh kết quả P1; log lỗi (nếu có).
- Ghi chú: nhóm có M khác nhau (20/50 và 80/100) phân biệt được hai cách tính (66.7% và 60%); case “Tỷ lệ nhóm R = 70% khớp điều kiện ≥ 65%” thì không vì cùng M.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-029"></a>

### TC-RS-BR-029 — Mục lựa chọn không được xét, nhưng bộ lọc theo lựa chọn vẫn dùng để chọn đối tượng

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kiểu điểm được hỗ trợ” (AC-G02 «Kiểu điểm được hỗ trợ»)

<!-- Mã truy vết: TD-ITEM-04 «Mục lựa chọn: Kiểu lựa chọn（選択肢型） A/B/C», TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục kiểu lựa chọn A/B/C (A/B/C) có giá trị cho S01 = B, S02 = A.
- Dữ liệu test: mục số nguyên (M=100); mục kiểu lựa chọn A/B/C, quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

1. Tạo quy tắc cho mục số nguyên (M=100) với bộ lọc theo lựa chọn（選択肢型） mục kiểu lựa chọn A/B/C = B, cố định 30 `<`.
2. Đăng ký S01=29, S02=29.

**期待結果（Kết quả mong đợi）**

S01 Đỏ (thuộc đối tượng); S02 Không áp dụng. Không có ô nào của mục kiểu lựa chọn A/B/C được xét đỏ.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục kiểu lựa chọn A/B/C (A/B/C) có giá trị cho S01 = B, S02 = A. - Dữ liệu test: mục số nguyên (M=100); mục kiểu lựa chọn A/B/C, quy tắc “Cố định 30” (dưới 30) | Trigger/điểm quan sát: 1. Tạo quy tắc cho mục số nguyên (M=100) với bộ lọc theo lựa chọn（選択肢型） mục kiểu lựa chọn A/B/C = B, cố định 30 `<`. 2. Đăng ký S01=29, S02=29. | Oracle/bằng chứng: S01 Đỏ (thuộc đối tượng); S02 Không áp dụng. Không có ô nào của mục kiểu lựa chọn A/B/C được xét đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Những loại điểm nào thuộc đối tượng?” (Q2 «Những loại điểm nào thuộc đối tượng?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 1.2 “Phạm vi thiết kế” (đoạn cuối)
- Bằng chứng cần chụp: Ảnh cấu hình bộ lọc; ảnh kết quả.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-030"></a>

### TC-RS-BR-030 — Ô điểm đơn vị được xét riêng theo từng đơn vị

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kiểu điểm được hỗ trợ” (AC-G02 «Kiểu điểm được hỗ trợ»); tiêu chí nghiệm thu “Nhận diện ô điểm” (AC-G03 «Nhận diện ô điểm»)

<!-- Mã truy vết: TD-ITEM-03 «Mục điểm đơn vị: Điểm bài kiểm tra đơn vị（単元テスト点）, M mặc định 100», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TC-RS-CALC-011, TC-RS-CALC-027 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục điểm đơn vị (đơn vị U1 có M riêng 40) có quy tắc “Cố định 30” (dưới 30) (`<30`). S06 (G-B): U1 = 25, U2 = 35.
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30); mục điểm đơn vị (đơn vị U1 có M riêng 40)

**操作（Thao tác）**

1. Đăng ký điểm U1, U2 của S06.
2. Xem ba đầu ra ở phạm vi đơn vị.

**期待結果（Kết quả mong đợi）**

U1 Đỏ, U2 Không đỏ; dấu chỉ ở ô U1. Hai đơn vị không bị gộp thành một ô.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục điểm đơn vị (đơn vị U1 có M riêng 40) có quy tắc “Cố định 30” (dưới 30) (`<30`). S06 (G-B): U1 = 25, U2 = 35. - Dữ liệu test: quy tắc “Cố định 30” (dưới 30); mục điểm đơn vị (đơn vị U1 có M riêng 40) | Trigger/điểm quan sát: 1. Đăng ký điểm U1, U2 của S06. 2. Xem ba đầu ra ở phạm vi đơn vị. | Oracle/bằng chứng: U1 Đỏ, U2 Không đỏ; dấu chỉ ở ô U1. Hai đơn vị không bị gộp thành một ô.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Những loại điểm nào thuộc đối tượng?” (Q2 «Những loại điểm nào thuộc đối tượng?»), câu “Lấy trung bình của nhóm nào và kết quả tổng hợp nào?” (Q9 «Lấy trung bình của nhóm nào và kết quả tổng hợp nào?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 2.2 “Một ô điểm được nhận diện như thế nào?”; Figma MW “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9455 «Figma MW: chương 01 – lối vào, danh sách, xóa thiết lập») 「数値入力と単元別の点数が対象。」 (đối tượng là nhập số và điểm theo đơn vị), “chương 02 – điều kiện áp dụng và nguồn trung bình” (58:8855 «Figma MW: chương 02 – điều kiện áp dụng và nguồn trung bình»)
- Bằng chứng cần chụp: Ảnh/file đầu ra theo đơn vị.
- Ghi chú: M theo đơn vị: case “Phân giải M: mặc định → đơn vị → lựa chọn lớp”. Trung bình theo đơn vị: case “Trung bình riêng cho từng đơn vị” (nguồn trung bình theo đơn vị chưa tích hợp — đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-031"></a>

### TC-RS-BR-031 — Giáo viên có quyền sửa mục cấu hình được quy tắc đỏ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Quyền thao tác và phạm vi dữ liệu” (AC-G01 «Quyền thao tác và phạm vi dữ liệu»)

<!-- Mã truy vết: TD-ROLE-01 «Giáo viên có quyền sửa mục: Có quyền vào Thiết lập nhập điểm（成績入力設定） và…», TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Đăng nhập tài khoản giáo viên có quyền sửa mục (giáo viên thường, không phải nhân viên nội bộ).
- Dữ liệu test: tài khoản giáo viên có quyền sửa mục, mục số nguyên (M=100)

**操作（Thao tác）**

Thêm, sửa điều kiện, sửa ngưỡng, đổi thứ tự, xóa một quy tắc của mục số nguyên (M=100).

**期待結果（Kết quả mong đợi）**

Mọi thao tác thành công.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Đăng nhập tài khoản giáo viên có quyền sửa mục (giáo viên thường, không phải nhân viên nội bộ). - Dữ liệu test: tài khoản giáo viên có quyền sửa mục, mục số nguyên (M=100) | Trigger/điểm quan sát: Thêm, sửa điều kiện, sửa ngưỡng, đổi thứ tự, xóa một quy tắc của mục số nguyên (M=100). | Oracle/bằng chứng: Mọi thao tác thành công.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Ai được thiết lập điều kiện điểm đỏ?” (Q1 «Ai được thiết lập điều kiện điểm đỏ?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 1.3 “Quyền sử dụng”
- Bằng chứng cần chụp: Ảnh danh sách sau mỗi thao tác.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-032"></a>

### TC-RS-BR-032 — Vào được màn nhưng không có quyền sửa mục → không sửa được quy tắc của mục đó

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Quyền thao tác và phạm vi dữ liệu” (AC-G01 «Quyền thao tác và phạm vi dữ liệu»)

<!-- Mã truy vết: TD-ROLE-02 «Giáo viên không có quyền sửa mục: Vào được Thiết lập nhập…», TD-ITEM-06 «Mục chỉ nội bộ: Mục số có cờ chỉ dành nội bộ（`mw_only_flg`）», TC-RS-ERR-006 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Đăng nhập tài khoản giáo viên không có quyền sửa mục. mục chỉ dành nội bộ có một quy tắc.
- Dữ liệu test: tài khoản giáo viên không có quyền sửa mục, mục chỉ dành nội bộ

**操作（Thao tác）**

1. Mở Thiết lập ô nhập（入力欄設定）.
2. Thử mở và sửa quy tắc của mục chỉ dành nội bộ.

**期待結果（Kết quả mong đợi）**

Không có thao tác sửa/thêm/xóa cho mục chỉ dành nội bộ trên màn, hoặc lưu bị từ chối. Quy tắc không đổi.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Đăng nhập tài khoản giáo viên không có quyền sửa mục. mục chỉ dành nội bộ có một quy tắc. - Dữ liệu test: tài khoản giáo viên không có quyền sửa mục, mục chỉ dành nội bộ | Trigger/điểm quan sát: 1. Mở Thiết lập ô nhập（入力欄設定）. 2. Thử mở và sửa quy tắc của mục chỉ dành nội bộ. | Oracle/bằng chứng: Không có thao tác sửa/thêm/xóa cho mục chỉ dành nội bộ trên màn, hoặc lưu bị từ chối. Quy tắc không đổi.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Ai được thiết lập điều kiện điểm đỏ?” (Q1 «Ai được thiết lập điều kiện điểm đỏ?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 1.3 “Quyền sử dụng” ("có quyền vào màn hình không đồng nghĩa sửa mọi mục")
- Bằng chứng cần chụp: Ảnh màn; phản hồi khi lưu.
- Ghi chú: Kiểm request trực tiếp: case “Gửi request lưu quy tắc trực tiếp khi không có quyền sửa mục”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-033"></a>

### TC-RS-BR-033 — Quyền sửa mục không tự cấp quyền chạy hàng loạt

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Quyền thao tác và phạm vi dữ liệu” (AC-G01 «Quyền thao tác và phạm vi dữ liệu»)

<!-- Mã truy vết: TD-ROLE-04 «Người sửa được mục nhưng không có quyền chạy: Như TD-ROLE-01 nhưng…», TC-RS-ERR-008 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Đăng nhập tài khoản sửa được mục nhưng không có quyền chạy hàng loạt.
- Dữ liệu test: tài khoản sửa được mục nhưng không có quyền chạy hàng loạt

**操作（Thao tác）**

1. Sửa một quy tắc (thành công).
2. Mở Tổng hợp thành tích（成績集計）, thử chạy tính toán hàng loạt.

**期待結果（Kết quả mong đợi）**

Không chạy được hàng loạt (thao tác không có hoặc bị từ chối theo quyền hiện hành).

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Đăng nhập tài khoản sửa được mục nhưng không có quyền chạy hàng loạt. - Dữ liệu test: tài khoản sửa được mục nhưng không có quyền chạy hàng loạt | Trigger/điểm quan sát: 1. Sửa một quy tắc (thành công). 2. Mở Tổng hợp thành tích（成績集計）, thử chạy tính toán hàng loạt. | Oracle/bằng chứng: Không chạy được hàng loạt (thao tác không có hoặc bị từ chối theo quyền hiện hành).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Ai được thiết lập điều kiện điểm đỏ?” (Q1 «Ai được thiết lập điều kiện điểm đỏ?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 1.3 “Quyền sử dụng” (Chạy tính toán hàng loạt); Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:6950 «Figma MW: chương 04 – đăng ký, tổng hợp, chạy lại và kết quả») 「実行権限がない場合は、権限のある担当者へ再実行を依頼。」 (không có quyền chạy thì nhờ người có quyền chạy lại)
- Bằng chứng cần chụp: Ảnh màn Tổng hợp thành tích（成績集計）.
- Ghi chú: Request trực tiếp: case “Gọi trực tiếp request chạy tính toán hàng loạt khi không có quyền chạy”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-034"></a>

### TC-RS-BR-034 — Bật tự tổng hợp khi đăng ký: hệ thống không chặn; quy tắc độc lập với trung bình vẫn xét

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23 «Bao phủ đường đăng ký và chạy lại»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-ITEM-02 «Mục số thập phân: Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc…», TD-STU-01 «S01: G-A, HR1», TD-STU-09 «S09: G-B, HR2» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Tự tổng hợp khi đăng ký = Thực hiện（実行する）. mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30); mục số thập phân (M=100) có công thức `A×0.5`.
- Dữ liệu test: mục số nguyên (M=100), mục số thập phân (M=100); quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29), học sinh S09 (mục số thập phân 29.5)

**操作（Thao tác）**

1. Lưu quy tắc công thức (không bị chặn vì tự tổng hợp đang bật).
2. Đặt tự tổng hợp = Không thực hiện（実行しない）, đăng ký S01=29.

**期待結果（Kết quả mong đợi）**

1. Lưu được; không có ràng buộc hệ thống buộc tắt.
2. S01 vẫn được xét khi đăng ký → Đỏ.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Tự tổng hợp khi đăng ký = Thực hiện（実行する）. mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30); mục số thập phân (M=100) có công thức `A×0.5`. - Dữ liệu test: mục số nguyên (M=100), mục số thập phân (M=100); quy tắc “Cố định 30” (dưới 30), học sinh S01 (điểm 29), học sinh S09 (mục số thập phân 29.5) | Trigger/điểm quan sát: 1. Lưu quy tắc công thức (không bị chặn vì tự tổng hợp đang bật). 2. Đặt tự tổng hợp = Không thực hiện（実行しない）, đăng ký S01=29. | Oracle/bằng chứng: 1. Lưu được; không có ràng buộc hệ thống buộc tắt. 2. S01 vẫn được xét khi đăng ký → Đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Quy trình vận hành khi có đánh giá tương đối là gì?” (Q12 «Quy trình vận hành khi có đánh giá tương đối là gì?») ("tắt tự tổng hợp không tắt bước xét khi đăng ký điểm"); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.4 “Quy trình vận hành khi dùng trung bình/tỷ lệ nhóm” (đoạn sau các bước)
- Bằng chứng cần chụp: Ảnh cấu hình; ảnh kết quả.
- Sau khi chạy: Trả cấu hình về trạng thái ban đầu.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-035"></a>

### TC-RS-BR-035 — Bộ lọc nhóm tổng hợp khác loại phải kết hợp VÀ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05 «Đối tượng áp dụng và nhu cầu nguồn»)

<!-- Mã truy vết: TD-RULE-14 «Nhóm tổng hợp hai loại nhóm: Giới hạn bằng bộ lọc（特定条件で絞り込む）: nhóm tổng…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Hai loại nhóm tổng hợp: K1 = Nhóm thành tích（成績グループ） có mục Nâng cao; K2 = một loại nhóm tổng hợp khác có mục X. P5 chỉ thuộc Nâng cao; P6 chỉ thuộc X; P7 thuộc cả Nâng cao và X; P8 không thuộc cả hai. Cả bốn học khối 1.
- Dữ liệu test: quy tắc lọc theo nhóm tổng hợp thuộc hai loại nhóm; S = 20 cho P5–P8

**操作（Thao tác）**

1. Đăng ký điểm 20 cho P5–P8.
2. Xem kết quả.
3. Mở lại quy tắc.

**期待結果（Kết quả mong đợi）**

1–2. Chỉ P7 thỏa cả hai loại nhóm và được xét → Đỏ. P5, P6, P8: Không áp dụng.

3. Mỗi giá trị vẫn gắn đúng loại nhóm của nó.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Hai loại nhóm tổng hợp: K1 = Nhóm thành tích（成績グループ） có mục Nâng cao; K2 = một loại nhóm tổng hợp khác có mục X. P5 chỉ thuộc Nâng cao; P6 chỉ thuộc X; P7 thuộc cả Nâng cao và X; P8 không thuộc cả hai. Cả bốn học khối 1. - Dữ liệu test: quy tắc lọc theo nhóm tổng hợp thuộc hai loại nhóm; S = 20 cho P5–P8 | Trigger/điểm quan sát: 1. Đăng ký điểm 20 cho P5–P8. 2. Xem kết quả. 3. Mở lại quy tắc. | Oracle/bằng chứng: 1–2. Chỉ P7 thỏa cả hai loại nhóm và được xét → Đỏ. P5, P6, P8: Không áp dụng. 3. Mỗi giá trị vẫn gắn đúng loại nhóm của nó.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.1 “Đối tượng áp dụng”; [xác nhận thiết kế ngày 30/09](../../../sources/2026-09-30-design-review-confirmation.vi.md) (Q35: bộ lọc thường OR cùng loại/AND khác loại; điều kiện trung bình/tỷ lệ nhóm AND với bộ lọc); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 3.2 “`apply_condition`”.
- Bằng chứng cần chụp: Ảnh kết quả bốn học sinh; ảnh form mở lại xác nhận mỗi giá trị vẫn gắn đúng loại nhóm.
- Ghi chú: P5–P8 là học sinh bổ sung ngoài TD-STU. Oracle AND là CONFIRMED; biểu diễn JSON/schema vẫn có thể là PROPOSED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-036"></a>

### TC-RS-BR-036 — Cùng lượt đăng ký: ô thiếu nguồn chưa xét được, ô ngưỡng cố định vẫn được xét

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23 «Bao phủ đường đăng ký và chạy lại»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-06 «Công thức hai dòng: Dòng 1: Trung bình（平均点）÷ Số cố định（固定値）2, chữ số…», TD-SRC-03 «Không có tổng hợp: Nguồn chưa từng chạy tổng hợp», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-ITEM-02 «Mục số thập phân: Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc…», TD-GRP-01 «Lớp học phần: G-A (Toán I（数学Ⅰ）, khối 1, nhóm thành tích Nâng cao), G-B…», TD-STU-01 «S01: G-A, HR1», AC-G23, TC-RS-BR-010 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Trên mục số nguyên (M=100): ưu tiên 1 = quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8) (dùng trung bình, nguồn nguồn chưa có kết quả tổng hợp), ưu tiên 2 = quy tắc “Cố định 30” (dưới 30). Trên mục số thập phân (M=100): chỉ quy tắc “Cố định 30” (dưới 30). Lớp G-A có S01.
- Dữ liệu test: mục số nguyên (M=100); mục số thập phân (M=100); quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8); quy tắc “Cố định 30” (dưới 30); nguồn chưa có kết quả tổng hợp; các lớp học phần G-A, G-B, G-C; học sinh S01 (điểm 29); S01 mục số thập phân (M=100) = 29.5

**操作（Thao tác）**

1. Trong cùng một lượt đăng ký điểm của lớp G-A, lưu S01: mục số nguyên (M=100) = 29, mục số thập phân (M=100) = 29.5.
2. Xem kết quả hai ô và thông báo.

**期待結果（Kết quả mong đợi）**

1. Lượt lưu không dừng hay báo lỗi chung vì ô mục số nguyên (M=100) thiếu nguồn.
2. Ô mục số nguyên (M=100): Chưa xét được; không dùng ưu tiên 2 (quy tắc “Cố định 30” (dưới 30)) thay thế, nên không Đỏ.
3. Ô mục số thập phân (M=100): Đỏ (29.5 `<30`).

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Trên mục số nguyên (M=100): ưu tiên 1 = quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8) (dùng trung bình, nguồn nguồn chưa có kết quả tổng hợp), ưu tiên 2 = quy tắc “Cố định 30” (dưới 30). Trên mục số thập phân (M=100): chỉ quy tắc “Cố định 30” (dưới 30). Lớp G-A có S01. - Dữ liệu test: mục số nguyên (M=100); mục số thập phân (M=100); quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8); quy tắc “Cố định 30” (dưới 30); nguồn chưa có kết quả tổng hợp; các lớp học phần G-A, G-B, G-C; h | Trigger/điểm quan sát: 1. Trong cùng một lượt đăng ký điểm của lớp G-A, lưu S01: mục số nguyên (M=100) = 29, mục số thập phân (M=100) = 29.5. 2. Xem kết quả hai ô và thông báo. | Oracle/bằng chứng: 1. Lượt lưu không dừng hay báo lỗi chung vì ô mục số nguyên (M=100) thiếu nguồn. 2. Ô mục số nguyên (M=100): Chưa xét được; không dùng ưu tiên 2 (quy tắc “Cố định 30” (dưới 30)) thay thế, nên không Đỏ. 3. Ô mục số thập phân (M=100): Đỏ (29.5 `<30`).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại” (AC-G23 «Bao phủ đường đăng ký và chạy lại») (bảng điều kiện chạy, dòng "Cùng lượt có ô phụ thuộc nguồn và ô độc lập"); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 4.3 “Chọn quy tắc”, mục 5.5 “Chọn bản nguồn” bước 4; [tài liệu chia công việc v2](../split-tasks.vi.md) ([RSD-TASK](../split-tasks.vi.md) «bản chia công việc v2») công việc “Cập nhật kết quả khi đăng ký và chạy hàng loạt” (Task 4 «Cập nhật kết quả khi đăng ký và chạy hàng loạt») (Thay đổi nghiệp vụ)
- Bằng chứng cần chụp: Ảnh màn đăng ký sau khi lưu; ảnh kết quả hai ô; thông báo hiển thị. SELECT kết quả của hai ô (khi có schema).
- Ghi chú: Tiêu chí nghiệm thu tiêu chí nghiệm thu “Bao phủ đường đăng ký và chạy lại”. Ô thiếu nguồn đơn lẻ: case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-037"></a>

### TC-RS-BR-037 — Xóa hoặc thôi dùng điểm đơn vị thì ngừng kết quả đỏ cũ của ô đó

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị” (AC-G24 «Trigger khi đổi điểm tối đa/đơn vị»)

<!-- Mã truy vết: TD-ITEM-03 «Mục điểm đơn vị: Điểm bài kiểm tra đơn vị（単元テスト点）, M mặc định 100», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TC-RS-BR-030, TD-GRP-01 «Lớp học phần: G-A (Toán I（数学Ⅰ）, khối 1, nhóm thành tích Nâng cao), G-B…», TD-STU-06 «S06: G-B, HR2», AC-G24 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục điểm đơn vị (đơn vị U1 có M riêng 40) có quy tắc “Cố định 30” (dưới 30). S06 (G-B): U1 = 25, U2 = 35 đã đăng ký; U1 đang Đỏ, U2 Không đỏ (như case “Ô điểm đơn vị được xét riêng theo từng đơn vị”).
- Dữ liệu test: mục điểm đơn vị (đơn vị U1 có M riêng 40); quy tắc “Cố định 30” (dưới 30); các lớp học phần G-A, G-B, G-C; học sinh S06 (điểm dự kiến 24)

**操作（Thao tác）**

1. Xác nhận U1 Đỏ ở ba đầu ra.
2. Biến thể (a): xóa điểm U1 của S06 thành trống rồi lưu.
3. Biến thể (b): thôi dùng đơn vị U1 cho lớp G-B theo thao tác hiện có (nếu màn hỗ trợ), rồi đăng ký lại hoặc chạy nút cam cho G-B.
4. Xem ba đầu ra và bộ lọc đỏ của trích xuất.

**期待結果（Kết quả mong đợi）**

1. Sau (a) hoặc (b), ô U1 của S06 không còn dấu đỏ ở ba đầu ra; bộ lọc đỏ không giữ S06 chỉ vì U1 cũ.
2. U2 giữ kết quả Không đỏ; không bị gộp hay xét lại sai.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục điểm đơn vị (đơn vị U1 có M riêng 40) có quy tắc “Cố định 30” (dưới 30). S06 (G-B): U1 = 25, U2 = 35 đã đăng ký; U1 đang Đỏ, U2 Không đỏ (như case “Ô điểm đơn vị được xét riêng theo từng đơn vị”). - Dữ liệu test: mục điểm đơn vị (đơn vị U1 có M riêng 40); quy tắc “Cố định 30” (dưới 30); các lớp học phần G-A, G-B, G-C; học sinh S06 (điểm dự kiến 24) | Trigger/điểm quan sát: 1. Xác nhận U1 Đỏ ở ba đầu ra. 2. Biến thể (a): xóa điểm U1 của S06 thành trống rồi lưu. 3. Biến thể (b): thôi dùng đơn vị U1 cho lớp G-B theo thao tác hiện có (nếu màn hỗ trợ), rồi đăng ký lại hoặc chạy nút cam cho G-B. 4. Xem ba đầu ra và bộ lọc đỏ của trích xuất. | Oracle/bằng chứng: 1. Sau (a) hoặc (b), ô U1 của S06 không còn dấu đỏ ở ba đầu ra; bộ lọc đỏ không giữ S06 chỉ vì U1 cũ. 2. U2 giữ kết quả Không đỏ; không bị gộp hay xét lại sai.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: BLOCKED

- Nguồn: [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị” (AC-G24 «Trigger khi đổi điểm tối đa/đơn vị») ("Xóa/không dùng điểm đơn vị phải ngừng kết quả cũ"); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.3 “Thay đổi điểm tối đa” (dòng "Sửa maximum/việc sử dụng theo đơn vị"), mục 7.2 “Bảng sự kiện” (dòng "Xóa điểm số thành trống"), mục 2.2 “Một ô điểm được nhận diện như thế nào?”
- Bằng chứng cần chụp: Ảnh/file ba đầu ra trước và sau; ảnh thao tác xóa hoặc thôi dùng đơn vị.
- Sau khi chạy: Khôi phục điểm U1 và thiết lập đơn vị của G-B.
- Ghi chú: Tiêu chí nghiệm thu tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị”. Biến thể (b) BLOCKED cho tới khi xác minh màn và thao tác "thôi dùng đơn vị"; hỏi team dev.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-038"></a>

### TC-RS-BR-038 — Nhóm lớp học（授業）: dùng kết quả tổng hợp của đúng lớp chứa ô đang xét

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu»)

<!-- Mã truy vết: TD-POP-02 «X sau khi bật lớp học: Như TD-POP-01 nhưng bật thêm Lớp học（授業）, chạy…», TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-POP-06 «Học sinh học hai lớp cùng môn: S11 (tên giả, HR1) học cả G-A và G-D…», AC-G12 -->

**前提条件（Điều kiện trước）**

- Điều kiện: thiết lập tổng hợp X đã bật thêm Lớp học（授業） (X đã bật lớp học và đã tổng hợp). S11 học cả G-A và G-D; trong X trung bình lớp G-A = 40, G-D = 70. Quy tắc trên mục số nguyên (M=100): Toàn bộ đối tượng, ngưỡng Công thức（計算式） `A×0.5`, `<`; nguồn công thức = X / Lớp học（授業）.
- Dữ liệu test: thiết lập tổng hợp X đã bật thêm Lớp học（授業）, học sinh S11 học hai lớp Toán I (G-A, G-D); mục số nguyên (M=100); S11 có điểm 25 ở cả G-A và G-D

**操作（Thao tác）**

1. Chạy nút cam cho G-A và G-D.
2. Xem kết quả hai ô của S11 trên trích xuất.

**期待結果（Kết quả mong đợi）**

- Ô ở G-A: `T=40×0.5=20` → 25 Không đỏ.
- Ô ở G-D: `T=70×0.5=35` → 25 Đỏ.
- Không ô nào dùng kết quả của lớp kia, của khối/lớp chủ nhiệm, hay trung bình chung của môn.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: thiết lập tổng hợp X đã bật thêm Lớp học（授業） (X đã bật lớp học và đã tổng hợp). S11 học cả G-A và G-D; trong X trung bình lớp G-A = 40, G-D = 70. Quy tắc trên mục số nguyên (M=100): Toàn bộ đối tượng, ngưỡng Công thức（計算式） `A×0.5`, `<`; nguồn công thức = X / Lớp học（授業）. - Dữ liệu test: thiết lập tổng hợp X đã bật thêm Lớp học（授業）, học sinh S11 học hai lớp Toán I (G-A, G-D); mục số nguyên (M=100); S11 có điểm 25 ở cả G-A và G-D | Trigger/điểm quan sát: 1. Chạy nút cam cho G-A và G-D. 2. Xem kết quả hai ô của S11 trên trích xuất. | Oracle/bằng chứng: - Ô ở G-A: `T=40×0.5=20` → 25 Không đỏ. - Ô ở G-D: `T=70×0.5=35` → 25 Đỏ. - Không ô nào dùng kết quả của lớp kia, của khối/lớp chủ nhiệm, hay trung bình chung của môn.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [context điểm đỏ](../../../CONTEXT.md) ([CTX](../../../CONTEXT.md) «context chuẩn điểm đỏ») mục 9.6 “Ba phản hồi review DB và bài học thiết kế ngày 28/09” (quyết định DB-R3 mục 2: bật thêm lớp học thì dùng kết quả của lớp liên quan); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu») (bảng quy tắc chọn/đọc nhóm: "không đọc kết quả lớp khác với ô đang xét"); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 3.1 “Bộ thông tin nguồn” ("Loại 5 phải khớp cả lớp, không chỉ môn" — PROPOSED), mục 3.4 “`judgment_context`” (`population_key` chứa ID lớp thực tế)
- Bằng chứng cần chụp: Ảnh kết quả tổng hợp X theo lớp; ảnh trích xuất hai ô; SELECT `judgment_context.sources` của hai ô nếu có schema.
- Ghi chú: Dữ liệu học sinh học hai lớp cùng môn: hỏi team dev khi chuẩn bị; không tạo được thì dùng hai học sinh khác lớp và ghi Notes. Phụ thuộc phạm vi đợt có công thức (phạm vi phát hành chưa chốt — đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-039"></a>

### TC-RS-BR-039 — Nhóm môn học（科目グループ）: dùng cấu hình riêng của môn hoặc default đã lưu; thiếu/sai thì Chưa xét được

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu»); tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn” (AC-G13 «Ưu tiên bản chốt và xử lý thiếu nguồn»)

<!-- Mã truy vết: TD-POP-05 «Nhóm môn học（科目グループ）: "Nhóm môn Toán" (tên giả): có cấu hình riêng cho…», TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», AC-G12 -->

**前提条件（Điều kiện trước）**

- Điều kiện: nhóm môn học “Nhóm môn Toán” có cấu hình riêng cho Toán I（数学Ⅰ） và default. Quy tắc trên mục số nguyên (M=100) dùng nguồn công thức = X / nhóm môn học “Nhóm môn Toán”, ngưỡng `A×0.5`, `<`.
- Dữ liệu test: nhóm môn học “Nhóm môn Toán”; mục số nguyên (M=100); S01 = 25

**操作（Thao tác）**

1. Chạy nút cam; xem S01 và nhóm được dùng.
2. Xóa cấu hình riêng của Toán I (để môn rơi về default); chạy lại; xem.
3. Làm default thiếu hoặc trỏ tới cấu hình không hợp lệ (biến thể (b) của nhóm môn học “Nhóm môn Toán”); chạy lại; xem trạng thái và thông báo.

**期待結果（Kết quả mong đợi）**

1. Dùng kết quả của nhóm theo cấu hình riêng của Toán I.
2. Dùng kết quả của nhóm theo default đã lưu.
3. S01 Chưa xét được; không thay bằng nhóm khác, bằng 0 hay bằng kết quả trước; thông báo/tiến độ tách phần chưa xét được.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: nhóm môn học “Nhóm môn Toán” có cấu hình riêng cho Toán I（数学Ⅰ） và default. Quy tắc trên mục số nguyên (M=100) dùng nguồn công thức = X / nhóm môn học “Nhóm môn Toán”, ngưỡng `A×0.5`, `<`. - Dữ liệu test: nhóm môn học “Nhóm môn Toán”; mục số nguyên (M=100); S01 = 25 | Trigger/điểm quan sát: 1. Chạy nút cam; xem S01 và nhóm được dùng. 2. Xóa cấu hình riêng của Toán I (để môn rơi về default); chạy lại; xem. 3. Làm default thiếu hoặc trỏ tới cấu hình không hợp lệ (biến thể (b) của nhóm môn học “Nhóm môn Toán”); chạy lại; xem trạng thái và thông báo. | Oracle/bằng chứng: 1. Dùng kết quả của nhóm theo cấu hình riêng của Toán I. 2. Dùng kết quả của nhóm theo default đã lưu. 3. S01 Chưa xét được; không thay bằng nhóm khác, bằng 0 hay bằng kết quả trước; thông báo/tiến độ tách phần chưa xét được.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Ba loại nhóm cấu hình có xuất hiện ngoài khối/HR/lớp học không?” (Q33 «Ba loại nhóm cấu hình có xuất hiện ngoài khối/HR/lớp học không?»); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu»)/G13 (bảng quy tắc chọn/đọc nhóm: "Chọn nhóm môn học — dùng cấu hình riêng của môn hoặc default đã lưu. Không thay default thiếu/tham chiếu sai bằng nhóm khác hay 0"); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 3.1 “Bộ thông tin nguồn”, mục 3.4 “`judgment_context`” (PROPOSED)
- Bằng chứng cần chụp: Ảnh cấu hình nhóm môn ở mỗi bước; ảnh kết quả S01; SELECT `reason_code` và `judgment_context.sources` nếu có schema.
- Ghi chú: (PROPOSED) Bước 1–2: `sources[]` giữ `population_type=6` và ID nhóm môn đã chọn, thêm `resolved_population_type`/`resolved_population_ref_id`; bước 3: `reason_code` là `source_invalid` hoặc `membership_missing` theo thiết kế cuối. Dữ liệu nhóm tham chiếu: hỏi team dev khi chuẩn bị.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-br-040"></a>

### TC-RS-BR-040 — Loại nhóm được bật nhưng chưa có kết quả, hoặc tham chiếu đã lưu không còn hợp lệ → Chưa xét được, không tự đổi nhóm

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn” (AC-G13 «Ưu tiên bản chốt và xử lý thiếu nguồn»); tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại” (AC-G21 «Giữ kết quả trước khi chạy lại và xóa rule cuối»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-POP-02 «X sau khi bật lớp học: Như TD-POP-01 nhưng bật thêm Lớp học（授業）, chạy…», TD-POP-03 «Nhóm tổng hợp thứ hạng（順位集計グループ）: "Toán I khối 1+2" gồm lớp G-A và G-B…», TD-STU-01 «S01: G-A, HR1», AC-G13, AC-G21 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Quy tắc trên mục số nguyên (M=100) có điều kiện Trung bình `A≥50`, cố định 30 `<`; S01 = 29, đang Đỏ theo nguồn X / Lớp học（授業） đã tổng hợp.
- Dữ liệu test: thiết lập tổng hợp X đã bật thêm Lớp học（授業）, nhóm tổng hợp thứ hạng “Toán I khối 1+2”; mục số nguyên (M=100); học sinh S01 (điểm 29)

**操作（Thao tác）**

1. (a) Tạo quy tắc mới dùng nhóm tổng hợp nhóm tổng hợp thứ hạng “Toán I khối 1+2” nhưng X chưa chạy tổng hợp cho nhóm này; chạy nút cam; xem S01.
2. (b) Quy tắc đang dùng X / Lớp học: tắt công tắc Lớp học（授業） của trường/năm; mở danh sách quy tắc và xem S01 (chưa chạy).
3. Chạy nút cam; xem S01.
4. (c) Xóa nhóm nhóm tổng hợp thứ hạng “Toán I khối 1+2” đang được quy tắc khác tham chiếu; chạy nút cam; xem ô dùng quy tắc đó.

**期待結果（Kết quả mong đợi）**

1. S01 Chưa xét được (thiếu nguồn); lựa chọn nhóm tồn tại không có nghĩa đã có dữ liệu.
2. Chỉ đổi cấu hình: S01 vẫn giữ kết quả Đỏ trước (không bị xóa ngay).
3. S01 Chưa xét được; không tự chuyển sang khối/lớp chủ nhiệm hoặc nhóm khác, không dùng quy tắc ưu tiên thấp hơn, không dùng kết quả cũ làm hiện hành.
4. Ô chịu ảnh hưởng Chưa xét được; không âm thầm đổi loại/ID nhóm đã lưu.

**補足（Bổ sung）**
- Chức năng: Business Rule/quy tắc nghiệp vụ
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Quy tắc trên mục số nguyên (M=100) có điều kiện Trung bình `A≥50`, cố định 30 `<`; S01 = 29, đang Đỏ theo nguồn X / Lớp học（授業） đã tổng hợp. - Dữ liệu test: thiết lập tổng hợp X đã bật thêm Lớp học（授業）, nhóm tổng hợp thứ hạng “Toán I khối 1+2”; mục số nguyên (M=100); học sinh S01 (điểm 29) | Trigger/điểm quan sát: 1. (a) Tạo quy tắc mới dùng nhóm tổng hợp nhóm tổng hợp thứ hạng “Toán I khối 1+2” nhưng X chưa chạy tổng hợp cho nhóm này; chạy nút cam; xem S01. 2. (b) Quy tắc đang dùng X / Lớp học: tắt công tắc Lớp học（授業） của trường/năm; mở danh sách quy tắc và xem S01 (chưa chạy). 3. Chạy nút cam; xem S01. 4. (c) Xóa nhóm nhóm tổng hợp thứ hạng “Toán I khối 1+2” đang được quy tắc khác tham chiếu; chạy nút cam; xem ô dùng quy tắc đó. | Oracle/bằng chứng: 1. S01 Chưa xét được (thiếu nguồn); lựa chọn nhóm tồn tại không có nghĩa đã có dữ liệu. 2. Chỉ đổi cấu hình: S01 vẫn giữ kết quả Đỏ trước (không bị xóa ngay). 3. S01 Chưa xét được; không tự chuyển sang khối/lớp chủ nhiệm hoặc nhóm khác, không dùng quy tắc ưu tiên thấp hơn, không dùng kết quả cũ làm hiện hành. 4. Ô chịu ảnh hưởng Chưa xét được; không âm thầm đổi loại/ID nhóm đã lưu.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [context điểm đỏ](../../../CONTEXT.md) ([CTX](../../../CONTEXT.md) «context chuẩn điểm đỏ») mục 9.6 “Ba phản hồi review DB và bài học thiết kế ngày 28/09” (quyết định DB-R3 mục 4: được bật để chọn không đồng nghĩa đã có dữ liệu hợp lệ); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.4 “Bộ thông tin nguồn”, mục 5.5 “Chọn bản nguồn”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Ưu tiên bản chốt và xử lý thiếu nguồn” (AC-G13 «Ưu tiên bản chốt và xử lý thiếu nguồn») ("Áp dụng cùng cách xử lý thiếu/không hợp lệ khi loại tổng hợp được bật nhưng chưa có kết quả, hoặc tham chiếu đã lưu trở nên không khả dụng trước lần xét lại"), tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại” (AC-G21 «Giữ kết quả trước khi chạy lại và xóa rule cuối»); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 3.1 “Bộ thông tin nguồn” (PROPOSED: `source_missing`, `source_invalid`; thay đổi cấu hình đơn thuần không xóa kết quả trước)
- Bằng chứng cần chụp: Ảnh S01 sau mỗi bước; ảnh thông báo/tiến độ; SELECT `judgment_status`, `reason_code` nếu có schema.
- Sau khi chạy: Bật lại công tắc Lớp học, khôi phục nhóm tổng hợp thứ hạng “Toán I khối 1+2”.
- Ghi chú: (PROPOSED) Bước 1: `reason_code`=`source_missing`; bước 3–4: `source_invalid`. Nếu hệ thống chặn xóa nhóm đang được tham chiếu ở bước 4 thì ghi hành vi thực tế, không FAIL. Dữ liệu nhóm tham chiếu: hỏi team dev khi chuẩn bị.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="val"></a>

## 3. Validation (VAL)

<a id="tc-rs-val-001"></a>

### TC-RS-VAL-001 — Điểm cố định: biên −1 / 0 / 100 / 101 với M=100

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Điểm cố định” (AC-G08 «Điểm cố định»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TC-RS-UI-017 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) (M=100 cho mọi đối tượng), Toàn bộ đối tượng.
- Dữ liệu test: mục số nguyên (M=100); N = −1, 0, 100, 101

**操作（Thao tác）**

Lần lượt nhập Điểm cố định（固定点数）= −1, 0, 100, 101 và bấm Cập nhật（更新する）.

**期待結果（Kết quả mong đợi）**

−1: không lưu được, có lỗi. 0: lưu được. 100: lưu được. 101: không lưu được, có lỗi vượt M. Khi lỗi, cấu hình đã lưu trước đó không đổi.

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) (M=100 cho mọi đối tượng), Toàn bộ đối tượng. - Dữ liệu test: mục số nguyên (M=100); N = −1, 0, 100, 101 | Trigger/điểm quan sát: Lần lượt nhập Điểm cố định（固定点数）= −1, 0, 100, 101 và bấm Cập nhật（更新する）. | Oracle/bằng chứng: −1: không lưu được, có lỗi. 0: lưu được. 100: lưu được. 101: không lưu được, có lỗi vượt M. Khi lỗi, cấu hình đã lưu trước đó không đổi.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Điểm bằng ngưỡng có bị xét đỏ không?” (Q4 «Điểm bằng ngưỡng có bị xét đỏ không?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.2 “Ngưỡng cố định”; Figma MW “chương 03 – ngưỡng, công thức, trạng thái nhập” (58:7491 «Figma MW: chương 03 – ngưỡng, công thức, trạng thái nhập»); Figma MW (58:7979) 「基準点が対象の満点を超えています。対象の満点以下の値を入力してください。」 (điểm chuẩn vượt điểm tối đa của đối tượng; hãy nhập giá trị không vượt điểm tối đa), (58:8015) 「対象の満点（100点）以下の値を入力してください。」 (hãy nhập giá trị không vượt điểm tối đa của đối tượng (100))
- Bằng chứng cần chụp: Ảnh thông báo lỗi; ảnh danh sách sau mỗi lần.
- Ghi chú: Câu chữ theo Figma MW là PROPOSED, kiểm ở case “Thông báo lỗi vượt điểm tối đa và chia 0”; không FAIL case này chỉ vì câu chữ.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-002"></a>

### TC-RS-VAL-002 — Điểm cố định phải ≤ M của mọi đối tượng (M=20 và M=100)

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Điểm cố định” (AC-G08 «Điểm cố định»)

<!-- Mã truy vết: TD-ITEM-07 «Mục khác M theo lớp: Mục số M mặc định 100», SI-02 «Phân giải M» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục có M khác nhau theo lớp (G-A M=20, G-B M=100) (G-A M=20, G-B M=100).
- Dữ liệu test: mục có M khác nhau theo lớp (G-A M=20, G-B M=100); N = 30, 20

**操作（Thao tác）**

1. Toàn bộ đối tượng, N=30, Lưu.
2. Toàn bộ đối tượng, N=20, Lưu.
3. Lọc chỉ lớp G-B, N=30, Lưu.

**期待結果（Kết quả mong đợi）**

1. Không lưu được (G-A M=20).
2. Lưu được.
3. Lưu được.

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục có M khác nhau theo lớp (G-A M=20, G-B M=100) (G-A M=20, G-B M=100). - Dữ liệu test: mục có M khác nhau theo lớp (G-A M=20, G-B M=100); N = 30, 20 | Trigger/điểm quan sát: 1. Toàn bộ đối tượng, N=30, Lưu. 2. Toàn bộ đối tượng, N=20, Lưu. 3. Lọc chỉ lớp G-B, N=30, Lưu. | Oracle/bằng chứng: 1. Không lưu được (G-A M=20). 2. Lưu được. 3. Lưu được.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Điểm bằng ngưỡng có bị xét đỏ không?” (Q4 «Điểm bằng ngưỡng có bị xét đỏ không?») (N=30 với lớp M=20 và M=100); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.2 “Ngưỡng cố định”; Figma MW “chương 03 – ngưỡng, công thức, trạng thái nhập” (58:7979 «Figma MW: chương 03 – ngưỡng, công thức, trạng thái nhập») 「基準点が対象の満点を超えています。対象の満点以下の値を入力してください。」 (điểm chuẩn vượt điểm tối đa của đối tượng; hãy nhập giá trị không vượt điểm tối đa)
- Bằng chứng cần chụp: Ảnh lỗi và danh sách.
- Ghi chú: Cách phân giải M có chênh lệch trong code (khác biệt đặc tả–code về “Phân giải M”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-003"></a>

### TC-RS-VAL-003 — Mở rộng phạm vi sau khi lưu: kiểm lại ngưỡng cố định với M của đối tượng mới

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Điểm cố định” (AC-G08 «Điểm cố định»)

<!-- Mã truy vết: TD-ITEM-07 «Mục khác M theo lớp: Mục số M mặc định 100» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục có M khác nhau theo lớp (G-A M=20, G-B M=100); quy tắc lọc chỉ G-B, cố định 30 đã lưu.
- Dữ liệu test: mục có M khác nhau theo lớp (G-A M=20, G-B M=100)

**操作（Thao tác）**

Sửa bộ lọc thành G-A hoặc G-B (giữ N=30), bấm Lưu.

**期待結果（Kết quả mong đợi）**

Không lưu được vì G-A có M=20; cấu hình cũ (chỉ G-B) giữ nguyên.

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục có M khác nhau theo lớp (G-A M=20, G-B M=100); quy tắc lọc chỉ G-B, cố định 30 đã lưu. - Dữ liệu test: mục có M khác nhau theo lớp (G-A M=20, G-B M=100) | Trigger/điểm quan sát: Sửa bộ lọc thành G-A hoặc G-B (giữ N=30), bấm Lưu. | Oracle/bằng chứng: Không lưu được vì G-A có M=20; cấu hình cũ (chỉ G-B) giữ nguyên.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Điểm bằng ngưỡng có bị xét đỏ không?” (Q4 «Điểm bằng ngưỡng có bị xét đỏ không?») ("kiểm tra tại thời điểm lưu cho mọi đối tượng"); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.2 “Ngưỡng cố định” ("Kiểm tra lại khi sửa đối tượng áp dụng làm phạm vi… rộng hơn")
- Bằng chứng cần chụp: Ảnh lỗi; ảnh cấu hình sau khi đóng.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-004"></a>

### TC-RS-VAL-004 — Ngưỡng cố định/tỷ lệ trống hoặc không phải số

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11 «Giữ chính xác giá trị»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Màn cấu hình mục số nguyên (M=100).
- Dữ liệu test: mục số nguyên (M=100); Giá trị: trống, `abc`, `3O` (chữ O), `３０` (số toàn khổ)

**操作（Thao tác）**

Với loại Điểm cố định（固定点数） rồi Tỷ lệ điểm tối đa（得点率）: nhập từng giá trị, bấm Lưu.

**期待結果（Kết quả mong đợi）**

Trống, `abc`, `3O`: không lưu được, có lỗi. `３０`: xử lý theo quy ước nhập số hiện hành của BLEND (TBD — có thể chuẩn hóa thành 30 hoặc báo lỗi).

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Màn cấu hình mục số nguyên (M=100). - Dữ liệu test: mục số nguyên (M=100); Giá trị: trống, `abc`, `3O` (chữ O), `３０` (số toàn khổ) | Trigger/điểm quan sát: Với loại Điểm cố định（固定点数） rồi Tỷ lệ điểm tối đa（得点率）: nhập từng giá trị, bấm Lưu. | Oracle/bằng chứng: Trống, `abc`, `3O`: không lưu được, có lỗi. `３０`: xử lý theo quy ước nhập số hiện hành của BLEND (TBD — có thể chuẩn hóa thành 30 hoặc báo lỗi).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.1 “Thành phần chung của màn ngưỡng”, mục 6.2 “Ngưỡng cố định” ("Để trống hoặc nhập không phải số thì không được lưu")
- Bằng chứng cần chụp: Ảnh thông báo lỗi cho từng giá trị (trống, `abc`, `3O`) ở cả hai loại; ảnh giá trị sau khi Lưu với `３０`.
- Ghi chú: Ký tự toàn khổ: chưa có nguồn quy định tự chuyển hay báo lỗi.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-005"></a>

### TC-RS-VAL-005 — Điểm cố định thập phân

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11 «Giữ chính xác giá trị»)

<!-- Mã truy vết: TD-ITEM-02 «Mục số thập phân: Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số thập phân (M=100) (thập phân).
- Dữ liệu test: mục số thập phân (M=100); N = 29.5, 29.55, 29.555, 29.5555

**操作（Thao tác）**

Nhập từng giá trị, Lưu, mở lại.

**期待結果（Kết quả mong đợi）**

Đề xuất (thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ”): 29.5, 29.55, 29.555 lưu và mở lại đúng; 29.5555 bị từ chối, không tự cắt/làm tròn. Tối thiểu (CONFIRMED, đặc tả v2 mục 6.8 “Yêu cầu độ chính xác”): không được âm thầm làm tròn/cắt giá trị mà không báo.

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số thập phân (M=100) (thập phân). - Dữ liệu test: mục số thập phân (M=100); N = 29.5, 29.55, 29.555, 29.5555 | Trigger/điểm quan sát: Nhập từng giá trị, Lưu, mở lại. | Oracle/bằng chứng: Đề xuất (thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ”): 29.5, 29.55, 29.555 lưu và mở lại đúng; 29.5555 bị từ chối, không tự cắt/làm tròn. Tối thiểu (CONFIRMED, đặc tả v2 mục 6.8 “Yêu cầu độ chính xác”): không được âm thầm làm tròn/cắt giá trị mà không báo.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.1 “Thành phần chung của màn ngưỡng” ("Phạm vi chữ số thập phân của Điểm cố định: chưa chốt"); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 2.1 “`red_score_settings`”, mục 4.2 “Xử lý phần lẻ và miền lưu trữ” (`threshold_value` DECIMAL(9,3), tối đa 3 chữ số lẻ — PROPOSED)
- Bằng chứng cần chụp: Ảnh giá trị sau khi mở lại.
- Ghi chú: PROPOSED — giới hạn số chưa chốt (đặc tả v2 mục 13.1); ngoài phần tối thiểu, không phải must-pass.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-006"></a>

### TC-RS-VAL-006 — Tỷ lệ N: biên −1 / 0 / 100 / 101

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Tỷ lệ điểm tối đa” (AC-G10 «Tỷ lệ điểm tối đa»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100), loại Tỷ lệ điểm tối đa（得点率）.
- Dữ liệu test: mục số nguyên (M=100); N = −1, 0, 100, 101; biến thể thập phân 30.5, 30.5555

**操作（Thao tác）**

Nhập từng giá trị, Lưu.

**期待結果（Kết quả mong đợi）**

−1 và 101: không lưu được. 0 và 100: lưu được. 30.5 lưu được, 30.5555 bị từ chối (PROPOSED, thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ”).

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100), loại Tỷ lệ điểm tối đa（得点率）. - Dữ liệu test: mục số nguyên (M=100); N = −1, 0, 100, 101; biến thể thập phân 30.5, 30.5555 | Trigger/điểm quan sát: Nhập từng giá trị, Lưu. | Oracle/bằng chứng: −1 và 101: không lưu được. 0 và 100: lưu được. 30.5 lưu được, 30.5555 bị từ chối (PROPOSED, thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ”).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.2 “Ngưỡng cố định”, mục 6.8 “Yêu cầu độ chính xác” ("Tỷ lệ phần trăm: 0–100%"); [context điểm đỏ](../../../CONTEXT.md) ([CTX](../../../CONTEXT.md) «context chuẩn điểm đỏ») mục 5.1 “Giá trị xét và ngưỡng”; Figma MW “màn Ngưỡng – tỷ lệ điểm tối đa” (58:8194 «Figma MW: màn Ngưỡng – tỷ lệ điểm tối đa») 「0〜100」; [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 4.1 “Loại ngưỡng và tính hợp lệ” (`0≤N≤100`), mục 4.2 “Xử lý phần lẻ và miền lưu trữ” (tối đa 3 chữ số lẻ — PROPOSED)
- Bằng chứng cần chụp: Ảnh lỗi và danh sách.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-007"></a>

### TC-RS-VAL-007 — Xử lý phần lẻ: bắt buộc chọn cách làm tròn; p = 0 / 1 / 9 / 10; lần đầu p=1

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 6.5 “Xử lý phần lẻ”, mục 6.8 “Yêu cầu độ chính xác”

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100), Tỷ lệ 30%.
- Dữ liệu test: mục số nguyên (M=100); p = 0, 1, 9, 10; cách làm tròn: chưa chọn

**操作（Thao tác）**

1. Bật Xử lý phần lẻ（端数処理）: quan sát giá trị p mặc định.
2. Không chọn cách làm tròn, Lưu.
3. Chọn Làm tròn xuống（切り捨て） với p=0, 1, 9, 10; Lưu từng lần.

**期待結果（Kết quả mong đợi）**

1. p hiển thị 1.
2. Không lưu được.
3. p=1 và 9 lưu được; p=0 và 10 không lưu được.

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100), Tỷ lệ 30%. - Dữ liệu test: mục số nguyên (M=100); p = 0, 1, 9, 10; cách làm tròn: chưa chọn | Trigger/điểm quan sát: 1. Bật Xử lý phần lẻ（端数処理）: quan sát giá trị p mặc định. 2. Không chọn cách làm tròn, Lưu. 3. Chọn Làm tròn xuống（切り捨て） với p=0, 1, 9, 10; Lưu từng lần. | Oracle/bằng chứng: 1. p hiển thị 1. 2. Không lưu được. 3. p=1 và 9 lưu được; p=0 và 10 không lưu được.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.5 “Xử lý phần lẻ”, mục 6.8 “Yêu cầu độ chính xác” (đề xuất p=1–9); Figma MW “màn Ngưỡng – tỷ lệ điểm tối đa” (58:8194 «Figma MW: màn Ngưỡng – tỷ lệ điểm tối đa»), “màn Ngưỡng – công thức” (58:8389 «Figma MW: màn Ngưỡng – công thức») (ô 小数第［1］位 và danh sách cách làm tròn)
- Bằng chứng cần chụp: Ảnh từng bước.
- Ghi chú: PROPOSED — không phải must-pass.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-008"></a>

### TC-RS-VAL-008 — Công thức phải có ít nhất một dòng

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kiểm công thức khi lưu” (AC-G17 «Kiểm công thức khi lưu»)

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Loại Công thức tính（計算式）.
- Dữ liệu test: —

**操作（Thao tác）**

Xóa hết các dòng công thức (nếu UI cho phép), bấm Lưu.

**期待結果（Kết quả mong đợi）**

Không lưu được (hoặc UI không cho xóa dòng cuối).

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Loại Công thức tính（計算式）. - Dữ liệu test: — | Trigger/điểm quan sát: Xóa hết các dòng công thức (nếu UI cho phép), bấm Lưu. | Oracle/bằng chứng: Không lưu được (hoặc UI không cho xóa dòng cuối).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.4 “Công thức dùng trung bình” ("Công thức có ít nhất một dòng"); Figma MW “màn Ngưỡng – công thức” (58:8389 «Figma MW: màn Ngưỡng – công thức»)
- Bằng chứng cần chụp: Ảnh lỗi khi Lưu, hoặc ảnh cho thấy không xóa được dòng cuối.
- Ghi chú: Phạm vi phát hành của Công thức chưa chốt (đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-009"></a>

### TC-RS-VAL-009 — Chia cho số cố định 0 không lưu được

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kiểm công thức khi lưu” (AC-G17 «Kiểm công thức khi lưu»)

<!-- Mã truy vết: TC-RS-UI-017, TC-RS-CALC-021 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Loại Công thức tính（計算式）.
- Dữ liệu test: Dòng 1: Trung bình（平均点）÷ Số cố định（固定値）0; biến thể 0.0

**操作（Thao tác）**

Nhập công thức, Lưu.

**期待結果（Kết quả mong đợi）**

Không lưu được; lỗi chỉ rõ dòng/vế phải.

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Loại Công thức tính（計算式）. - Dữ liệu test: Dòng 1: Trung bình（平均点）÷ Số cố định（固定値）0; biến thể 0.0 | Trigger/điểm quan sát: Nhập công thức, Lưu. | Oracle/bằng chứng: Không lưu được; lỗi chỉ rõ dòng/vế phải.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.4 “Công thức dùng trung bình”; [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Ngưỡng dùng trung bình có chỉ gồm hai công thức cố định không?” (Q6 «Ngưỡng dùng trung bình có chỉ gồm hai công thức cố định không?»); Figma MW “chương 03 – ngưỡng, công thức, trạng thái nhập” (58:7507 «Figma MW: chương 03 – ngưỡng, công thức, trạng thái nhập»); Figma MW (58:7816) 「式1：0で割ることはできません。右辺の値を変更してください。」 (dòng 1: không thể chia cho 0; đổi giá trị vế phải), (58:7907) 「0で割ることはできません。右辺の値を変更してください。」 (thông báo tại dòng)
- Bằng chứng cần chụp: Ảnh lỗi chỉ rõ dòng/vế phải chia cho 0.
- Ghi chú: Câu chữ theo Figma MW là PROPOSED, kiểm ở case “Thông báo lỗi vượt điểm tối đa và chia 0”. Chia 0 khi chạy: case “Chia 0 phát sinh khi chạy → Chưa xét được”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-010"></a>

### TC-RS-VAL-010 — Toán hạng trống hoặc không phải số

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kiểm công thức khi lưu” (AC-G17 «Kiểm công thức khi lưu»)

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Loại Công thức tính（計算式）.
- Dữ liệu test: Vế phải Số cố định（固定値）: trống, `abc`; toán tử: chưa chọn

**操作（Thao tác）**

Nhập từng biến thể, Lưu.

**期待結果（Kết quả mong đợi）**

Không lưu được; lỗi chỉ ra dòng thiếu.

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Loại Công thức tính（計算式）. - Dữ liệu test: Vế phải Số cố định（固定値）: trống, `abc`; toán tử: chưa chọn | Trigger/điểm quan sát: Nhập từng biến thể, Lưu. | Oracle/bằng chứng: Không lưu được; lỗi chỉ ra dòng thiếu.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.4 “Công thức dùng trung bình” ("Mỗi dòng phải có đủ vế trái, toán tử và vế phải hợp lệ")
- Bằng chứng cần chụp: Ảnh lỗi cho từng biến thể, thấy dòng bị báo.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-011"></a>

### TC-RS-VAL-011 — Kết quả phép tính（式の結果） chỉ tham chiếu dòng phía trước

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kiểm công thức khi lưu” (AC-G17 «Kiểm công thức khi lưu»)

<!-- Mã truy vết: AC-G17 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Công thức 3 dòng.
- Dữ liệu test: (a) Dòng 1 dùng Kết quả phép tính; (b) dòng 2 tham chiếu chính dòng 2; (c) dòng 2 tham chiếu dòng 3; (d) dòng 3 tham chiếu dòng 1

**操作（Thao tác）**

Thử từng biến thể, bấm Lưu.

**期待結果（Kết quả mong đợi）**

(a), (b), (c): không chọn được hoặc không lưu được.

(d): lưu được.

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Công thức 3 dòng. - Dữ liệu test: (a) Dòng 1 dùng Kết quả phép tính; (b) dòng 2 tham chiếu chính dòng 2; (c) dòng 2 tham chiếu dòng 3; (d) dòng 3 tham chiếu dòng 1 | Trigger/điểm quan sát: Thử từng biến thể, bấm Lưu. | Oracle/bằng chứng: (a), (b), (c): không chọn được hoặc không lưu được. (d): lưu được.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.4 “Công thức dùng trung bình” (bảng toán hạng: "Kết quả một dòng phía trước… Dòng đầu không được chọn; không tham chiếu chính dòng, dòng phía sau hoặc dòng đã bị xóa"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Kiểm công thức khi lưu” (AC-G17 «Kiểm công thức khi lưu») ("từ chối… tham chiếu chính dòng/dòng sau/dòng đã xóa")
- Bằng chứng cần chụp: Ảnh từng biến thể.
- Ghi chú: Quy tắc tham chiếu dòng là tiêu chí nghiệm thu “Kiểm công thức khi lưu”. Chỉ chạy khi công thức nhiều dòng thuộc đợt phát hành (phạm vi phát hành chưa chốt — đặc tả v2 mục 13.1); ngoài đợt thì SKIPPED. Cách chọn toán hạng trên UI theo tập toán hạng đề xuất (đề xuất thiết kế chờ review — đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-012"></a>

### TC-RS-VAL-012 — Xóa/đổi thứ tự dòng không tự nối lại tham chiếu

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kiểm công thức khi lưu” (AC-G17 «Kiểm công thức khi lưu»)

<!-- Mã truy vết: AC-G17 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Công thức 3 dòng: dòng 2 dùng kết quả dòng 1, dòng 3 dùng kết quả dòng 2.
- Dữ liệu test: —

**操作（Thao tác）**

1. Xóa dòng 2, bấm Lưu.
2. Tạo lại công thức 3 dòng như điều kiện đầu; đổi thứ tự để dòng 3 lên vị trí 2, bấm Lưu.

**期待結果（Kết quả mong đợi）**

1. Dòng 3 báo tham chiếu không hợp lệ hoặc buộc chọn lại; không âm thầm trỏ sang dòng 1.
2. Dòng vừa chuyển lên (đang tham chiếu dòng mới nằm phía sau nó) bị báo tham chiếu không hợp lệ hoặc buộc chọn lại; không tự đổi sang dòng khác chỉ vì cùng số thứ tự.

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Công thức 3 dòng: dòng 2 dùng kết quả dòng 1, dòng 3 dùng kết quả dòng 2. - Dữ liệu test: — | Trigger/điểm quan sát: 1. Xóa dòng 2, bấm Lưu. 2. Tạo lại công thức 3 dòng như điều kiện đầu; đổi thứ tự để dòng 3 lên vị trí 2, bấm Lưu. | Oracle/bằng chứng: 1. Dòng 3 báo tham chiếu không hợp lệ hoặc buộc chọn lại; không âm thầm trỏ sang dòng 1. 2. Dòng vừa chuyển lên (đang tham chiếu dòng mới nằm phía sau nó) bị báo tham chiếu không hợp lệ hoặc buộc chọn lại; không tự đổi sang dòng khác chỉ vì cùng số thứ tự.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.4 “Công thức dùng trung bình” ("Khi xóa hoặc đổi thứ tự dòng, không tự nối lại tham chiếu sai"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Kiểm công thức khi lưu” (AC-G17 «Kiểm công thức khi lưu») ("Xóa hoặc đổi thứ tự dòng không được âm thầm trỏ sang công thức khác chỉ vì nó mang cùng số thứ tự")
- Bằng chứng cần chụp: Ảnh dòng liên quan sau mỗi lần Lưu (thông báo lỗi hoặc ô chọn dòng buộc chọn lại).
- Ghi chú: Tiêu chí tiêu chí nghiệm thu “Kiểm công thức khi lưu”; cơ chế UI (báo lỗi hay buộc chọn lại) theo thiết kế. Chỉ chạy khi công thức nhiều dòng thuộc đợt phát hành (phạm vi phát hành chưa chốt — đặc tả v2 mục 13.1); ngoài đợt thì SKIPPED. Bước 2 cần UI có thao tác đổi thứ tự dòng; nếu không có thì ghi N/A cho bước này.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-013"></a>

### TC-RS-VAL-013 — Số cố định trong công thức không bị giới hạn 0–100

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 6.4 “Công thức dùng trung bình”, mục 6.8 “Yêu cầu độ chính xác”

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Loại Công thức tính（計算式）.
- Dữ liệu test: `A × 150`, `A × 0.5`, `A − 150`

**操作（Thao tác）**

Nhập từng công thức, Lưu.

**期待結果（Kết quả mong đợi）**

Lưu được (không áp giới hạn 0–100 hay 0–M cho toán hạng).

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Loại Công thức tính（計算式）. - Dữ liệu test: `A × 150`, `A × 0.5`, `A − 150` | Trigger/điểm quan sát: Nhập từng công thức, Lưu. | Oracle/bằng chứng: Lưu được (không áp giới hạn 0–100 hay 0–M cho toán hạng).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.4 “Công thức dùng trung bình”, mục 6.8 “Yêu cầu độ chính xác” (giới hạn độ dài số: chưa chốt)
- Bằng chứng cần chụp: Ảnh danh sách quy tắc sau khi Lưu từng công thức (thấy công thức đã lưu).
- Ghi chú: PROPOSED; giới hạn số chữ số chưa chốt (đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-014"></a>

### TC-RS-VAL-014 — Tên thiết lập: bắt buộc, độ dài, trùng tên

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 4.2 “Nội dung một dòng”, mục 5.1 “Đối tượng áp dụng”

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Màn thêm quy tắc.
- Dữ liệu test: Tên trống; tên chỉ khoảng trắng; 255 ký tự; 256 ký tự; 255 ký tự có thêm khoảng trắng ở đầu và cuối; hai quy tắc cùng tên

**操作（Thao tác）**

1. Nhập từng giá trị, Lưu, mở lại.
2. Tạo quy tắc thứ hai trùng tên quy tắc thứ nhất, Lưu.

**期待結果（Kết quả mong đợi）**

1. Trống/chỉ khoảng trắng: không lưu được. 255 ký tự: lưu được, mở lại đủ. 256 ký tự: bị từ chối, không tự cắt. 255 ký tự kèm khoảng trắng đầu/cuối: lưu được, tên lưu đã bỏ khoảng trắng đầu/cuối (đủ 255 ký tự).
2. Lưu được; hai dòng riêng theo ưu tiên.

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Màn thêm quy tắc. - Dữ liệu test: Tên trống; tên chỉ khoảng trắng; 255 ký tự; 256 ký tự; 255 ký tự có thêm khoảng trắng ở đầu và cuối; hai quy tắc cùng tên | Trigger/điểm quan sát: 1. Nhập từng giá trị, Lưu, mở lại. 2. Tạo quy tắc thứ hai trùng tên quy tắc thứ nhất, Lưu. | Oracle/bằng chứng: 1. Trống/chỉ khoảng trắng: không lưu được. 255 ký tự: lưu được, mở lại đủ. 256 ký tự: bị từ chối, không tự cắt. 255 ký tự kèm khoảng trắng đầu/cuối: lưu được, tên lưu đã bỏ khoảng trắng đầu/cuối (đủ 255 ký tự). 2. Lưu được; hai dòng riêng theo ưu tiên.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: Figma MW “chương 02 – điều kiện áp dụng và nguồn trung bình” (58:8925 «Figma MW: chương 02 – điều kiện áp dụng và nguồn trung bình») 「設計案：名称は必須。」 (đề xuất thiết kế: tên là bắt buộc); CODE AutoRating `registCondition` 「設定名称を入力してください」 (hãy nhập tên thiết lập); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») không nêu; [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 2.1 “`red_score_settings`”, mục 4.1 “Loại ngưỡng và tính hợp lệ”–mục 4.2 “Xử lý phần lẻ và miền lưu trữ” (`setting_name` bắt buộc, 1–255 ký tự sau khi bỏ khoảng trắng đầu/cuối, không cần duy nhất — PROPOSED); [đặc tả v2](../specification.vi.md) (R18) mục 4.2 “Nội dung một dòng”, mục 5.1 “Đối tượng áp dụng”
- Bằng chứng cần chụp: Ảnh lỗi với tên trống và tên 256 ký tự; ảnh form mở lại với tên 255 ký tự; ảnh danh sách có hai quy tắc trùng tên.
- Ghi chú: PROPOSED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-015"></a>

### TC-RS-VAL-015 — Chọn giới hạn bằng bộ lọc nhưng không có bộ lọc nào

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05 «Đối tượng áp dụng và nhu cầu nguồn»)

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Màn thêm quy tắc.
- Dữ liệu test: Giới hạn bằng bộ lọc（特定条件で絞り込む）, không chọn giá trị

**操作（Thao tác）**

Chọn giới hạn bằng bộ lọc, không chọn điều kiện, Lưu.

**期待結果（Kết quả mong đợi）**

Không lưu được; có thông báo lỗi. Câu chữ thông báo không phải must-pass (Figma chưa có).

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Màn thêm quy tắc. - Dữ liệu test: Giới hạn bằng bộ lọc（特定条件で絞り込む）, không chọn giá trị | Trigger/điểm quan sát: Chọn giới hạn bằng bộ lọc, không chọn điều kiện, Lưu. | Oracle/bằng chứng: Không lưu được; có thông báo lỗi. Câu chữ thông báo không phải must-pass (Figma chưa có).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: CODE AutoRating `registCondition` 「絞り込み条件を１つ以上設定してください」 (hãy đặt ít nhất một điều kiện lọc); Figma MW “màn Điều kiện áp dụng – điều kiện tỷ lệ điểm của nhóm” (58:9164 «Figma MW: màn Điều kiện áp dụng – điều kiện tỷ lệ điểm của nhóm») không có thông báo này
- Bằng chứng cần chụp: Ảnh thông báo lỗi khi Lưu.
- Ghi chú: PROPOSED: đặc tả v2 mục 5.1 “Đối tượng áp dụng” ghi đây là đề xuất thiết kế ("chọn giới hạn nhưng không có bộ lọc thì báo lỗi"), khớp mẫu AutoRating; tiêu chí nghiệm thu v2 chỉ nêu ở phần Chi tiết thiết kế.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-016"></a>

### TC-RS-VAL-016 — Lỗi khi lưu không làm mất cấu hình/kết quả đã lưu

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04 «Lưu và mở lại nhiều thiết lập»)

<!-- Mã truy vết: TD-RULE-01 «Cố định `<`: Tên "Cố định 30"» -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc “Cố định 30” (dưới 30) đã lưu; S01 Đỏ.
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30); N = 101

**操作（Thao tác）**

1. Mở quy tắc “Cố định 30” (dưới 30), đổi N=101, Lưu (lỗi).
2. Quay lại danh sách, xem ba đầu ra.

**期待結果（Kết quả mong đợi）**

Cấu hình vẫn 30; S01 vẫn Đỏ. Giá trị vừa nhập có được giữ trên form hay không: PROPOSED (không must-pass).

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: quy tắc “Cố định 30” (dưới 30) đã lưu; S01 Đỏ. - Dữ liệu test: quy tắc “Cố định 30” (dưới 30); N = 101 | Trigger/điểm quan sát: 1. Mở quy tắc “Cố định 30” (dưới 30), đổi N=101, Lưu (lỗi). 2. Quay lại danh sách, xem ba đầu ra. | Oracle/bằng chứng: Cấu hình vẫn 30; S01 vẫn Đỏ. Giá trị vừa nhập có được giữ trên form hay không: PROPOSED (không must-pass).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 4.4 “Lưu, đổi thứ tự và xóa”, mục 8.4 “Lỗi kỹ thuật và thông báo”; [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Lưu điều kiện hoặc thay nguồn có cập nhật ngay kết quả không?” (Q13 «Lưu điều kiện hoặc thay nguồn có cập nhật ngay kết quả không?»)
- Bằng chứng cần chụp: Ảnh danh sách, đầu ra.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-017"></a>

### TC-RS-VAL-017 — Trích xuất: bật ký hiệu thì bắt buộc nhập ký hiệu

Priority: TBD ｜ Status: IMPLEMENTED ｜ Requirement ID: tiêu chí nghiệm thu “Hiển thị ô trích xuất” (AC-G30 «Hiển thị ô trích xuất»)

<!-- Mã truy vết: TD-ROLE-07 «Người phụ trách đầu ra: Có quyền Trích xuất thành tích（成績抽出）, Thiết lập…»,  -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mở Trích xuất thành tích（成績抽出）, tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm).
- Dữ liệu test: Ký hiệu đầu BẬT, ô trống; ký hiệu cuối BẬT, ô trống

**操作（Thao tác）**

Chạy trích xuất với từng biến thể.

**期待結果（Kết quả mong đợi）**

Có lỗi yêu cầu nhập ký hiệu; không chạy trích xuất.

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Mở Trích xuất thành tích（成績抽出）, tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm). - Dữ liệu test: Ký hiệu đầu BẬT, ô trống; ký hiệu cuối BẬT, ô trống | Trigger/điểm quan sát: Chạy trích xuất với từng biến thể. | Oracle/bằng chứng: Có lỗi yêu cầu nhập ký hiệu; không chạy trích xuất.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 9.1 “Thiết lập”; Figma MW “chương 05, khung A – thiết lập cách hiển thị/trích xuất” (58:6319 «Figma MW: chương 05, khung A – thiết lập cách hiển thị/trích xuất») 「前に付ける記号を入力してください。」 (hãy nhập ký hiệu gắn phía trước); Figma MW “chương 05 – trạng thái lỗi: bật ký hiệu nhưng chưa nhập” (58:6820 «Figma MW: chương 05 – trạng thái lỗi: bật ký hiệu nhưng chưa nhập») (trạng thái lỗi bật ký hiệu phía trước nhưng chưa nhập, cùng câu (58:6891)); CODE `AdminNBGradeExtractionSettingController::validateDisplayPattern` :1957 (bật ký hiệu mà ô trống → lỗi)
- Bằng chứng cần chụp: Ảnh lỗi cho từng biến thể; ảnh cho thấy trích xuất không chạy.
- Ghi chú: Nhãn/vị trí khác nhau giữa các frame Figma (xung đột giữa các frame Figma về “Nhãn và vị trí tùy chọn đỏ ở Trích xuất thành tích（成績抽出）”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-018"></a>

### TC-RS-VAL-018 — Phiếu điểm: chỉ bắt buộc ký tự khi chọn phía trước/phía sau

Priority: TBD ｜ Status: IMPLEMENTED ｜ Requirement ID: tiêu chí nghiệm thu “Tùy chọn trên phiếu” (AC-G35 «Tùy chọn trên phiếu»)

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Công cụ phiếu điểm（通知表ツール）, dòng Thiết lập điểm đỏ（赤点設定）.
- Dữ liệu test: Nguyên trạng（そのまま表示）, Kèm ngoặc（カッコ付き）, Ký tự phía trước（前に任意の文字） để trống, Ký tự phía sau（後ろに任意の文字） để trống

**操作（Thao tác）**

Chọn từng lựa chọn ở dòng Thiết lập điểm đỏ（赤点設定）, bấm Cập nhật（更新する）.

**期待結果（Kết quả mong đợi）**

Nguyên trạng, Kèm ngoặc: không hiện ô ký tự, lưu được. Phía trước/sau để trống: không lưu được.

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Công cụ phiếu điểm（通知表ツール）, dòng Thiết lập điểm đỏ（赤点設定）. - Dữ liệu test: Nguyên trạng（そのまま表示）, Kèm ngoặc（カッコ付き）, Ký tự phía trước（前に任意の文字） để trống, Ký tự phía sau（後ろに任意の文字） để trống | Trigger/điểm quan sát: Chọn từng lựa chọn ở dòng Thiết lập điểm đỏ（赤点設定）, bấm Cập nhật（更新する）. | Oracle/bằng chứng: Nguyên trạng, Kèm ngoặc: không hiện ô ký tự, lưu được. Phía trước/sau để trống: không lưu được.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 11.1 “Tùy chọn hiển thị đỏ”; Figma MW “tùy chọn đỏ ở Công cụ phiếu điểm (đặc tả v2: 07-A)” (58:5176 «Figma MW: tùy chọn đỏ ở Công cụ phiếu điểm (đặc tả v2: 07-A)») (modal lựa chọn); CODE `ReportCardWidgetController::grades_normal` validate :1981–2066 (kiểm `prepend_string` / `append_string` khi chọn phía trước/phía sau)
- Bằng chứng cần chụp: Ảnh dòng Thiết lập điểm đỏ（赤点設定） sau Cập nhật với từng lựa chọn; ảnh lỗi khi để trống ký tự.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-019"></a>

### TC-RS-VAL-019 — Cảnh báo ngưỡng biên không chặn lưu

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Biên so sánh và cảnh báo” (AC-G07 «Biên so sánh và cảnh báo»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», AC-G07 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100).
- Dữ liệu test: mục số nguyên (M=100); Cố định N=0 và N=100, mỗi giá trị với `<` và `≤`; Tỷ lệ N=0, N=100; Tỷ lệ N=0.4 với Làm tròn（四捨五入） (ra `T=0`)

**操作（Thao tác）**

Nhập từng giá trị, Lưu, mở lại.

**期待結果（Kết quả mong đợi）**

1. Cảnh báo theo `T` cuối và dấu: `<0` (không ai đỏ) và `≤100` (mọi điểm hợp lệ đỏ) phải có cảnh báo; các tổ hợp biên khác theo thiết kế.
2. Tỷ lệ 0.4 làm tròn ra `T=0`: cảnh báo xét theo `T=0`, không theo giá trị nhập 0.4.
3. Cảnh báo không chặn lưu; mở lại, giá trị đã lưu giữ nguyên (không tự đổi thành giá trị khác).

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100). - Dữ liệu test: mục số nguyên (M=100); Cố định N=0 và N=100, mỗi giá trị với `<` và `≤`; Tỷ lệ N=0, N=100; Tỷ lệ N=0.4 với Làm tròn（四捨五入） (ra `T=0`) | Trigger/điểm quan sát: Nhập từng giá trị, Lưu, mở lại. | Oracle/bằng chứng: 1. Cảnh báo theo `T` cuối và dấu: `<0` (không ai đỏ) và `≤100` (mọi điểm hợp lệ đỏ) phải có cảnh báo; các tổ hợp biên khác theo thiết kế. 2. Tỷ lệ 0.4 làm tròn ra `T=0`: cảnh báo xét theo `T=0`, không theo giá trị nhập 0.4. 3. Cảnh báo không chặn lưu; mở lại, giá trị đã lưu giữ nguyên (không tự đổi thành giá trị khác).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Điểm bằng ngưỡng có bị xét đỏ không?” (Q4 «Điểm bằng ngưỡng có bị xét đỏ không?») (cảnh báo không chặn); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.6 “Ngưỡng âm và cảnh báo biên”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Biên so sánh và cảnh báo” (AC-G07 «Biên so sánh và cảnh báo») ("cảnh báo ngưỡng 0/điểm tối đa cũng theo `T` cuối và dấu so sánh, không đổi giá trị"); Figma MW “chương 03 – ngưỡng, công thức, trạng thái nhập” (58:8018 «Figma MW: chương 03 – ngưỡng, công thức, trạng thái nhập»), (58:8019)
- Bằng chứng cần chụp: Ảnh cảnh báo từng tổ hợp; ảnh form mở lại.
- Ghi chú: Nguyên tắc cảnh báo theo `T` cuối và dấu là tiêu chí nghiệm thu “Biên so sánh và cảnh báo”; câu chữ cảnh báo và cảnh báo cho các tổ hợp khác (`≤0`, `<100`) TBD. Tỷ lệ thập phân chỉ chạy nếu ô tỷ lệ nhận thập phân.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-020"></a>

### TC-RS-VAL-020 — Kết quả công thức âm hoặc vượt M không phải lỗi lưu

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Ngưỡng âm” (AC-G18 «Ngưỡng âm»)

<!-- Mã truy vết: TD-RULE-10 «Công thức âm: Dòng 1: Trung bình（平均点）− 20», TC-RS-CALC-017, TC-RS-CALC-018 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Loại Công thức tính（計算式）.
- Dữ liệu test: quy tắc công thức trung bình − 20 (`A−20`); công thức `A × 3`

**操作（Thao tác）**

Lưu từng công thức.

**期待結果（Kết quả mong đợi）**

Lưu được; không kiểm `0≤T≤M` tại lúc lưu cho công thức.

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Loại Công thức tính（計算式）. - Dữ liệu test: quy tắc công thức trung bình − 20 (`A−20`); công thức `A × 3` | Trigger/điểm quan sát: Lưu từng công thức. | Oracle/bằng chứng: Lưu được; không kiểm `0≤T≤M` tại lúc lưu cho công thức.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Công thức cho ngưỡng âm thì xử lý thế nào?” (Q25 «Công thức cho ngưỡng âm thì xử lý thế nào?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.4 “Công thức dùng trung bình”, mục 6.7 “Đổi loại ngưỡng và đổi toán hạng”
- Bằng chứng cần chụp: Ảnh danh sách quy tắc sau khi Lưu từng công thức (thấy công thức đã lưu, không có lỗi).
- Ghi chú: Kết quả xét: case “Ngưỡng công thức vượt M vẫn hợp lệ”, case “Công thức A−0 cho ngưỡng bằng A”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-021"></a>

### TC-RS-VAL-021 — Đổi loại ngưỡng trong cùng phiên sửa

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 6.7 “Đổi loại ngưỡng và đổi toán hạng”

<!-- Mã truy vết: TD-RULE-01 «Cố định `<`: Tên "Cố định 30"» -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc “Cố định 30” (dưới 30) (cố định 30) đã lưu.
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

1. Đổi sang Tỷ lệ, nhập 40, đổi lại Cố định; xem ô Cố định; đổi sang Tỷ lệ lần nữa, xem ô Tỷ lệ.
2. Đổi lại Cố định, Lưu.
3. Mở lại quy tắc.
4. Đổi sang Tỷ lệ, nhập 50, bấm Hủy; mở lại.
5. (Khi có schema) Lưu quy tắc Tỷ lệ 40 có bật xử lý phần lẻ; đổi sang Cố định 30, Lưu, SELECT; đổi sang Công thức `A×0.5`, Lưu, SELECT.

**期待結果（Kết quả mong đợi）**

1. (PROPOSED) Trong phiên: ô Cố định vẫn 30; quay lại Tỷ lệ vẫn thấy 40.
2. Chỉ giá trị loại cuối cùng (Cố định 30) được kiểm và lưu; không lưu lẫn dữ liệu của loại khác.
3. Mở lại: Cố định 30; không bắt buộc còn giá trị Tỷ lệ 40.
4. Vẫn Cố định 30 (cấu hình đã lưu gần nhất).
5. (PROPOSED theo thiết kế DB v2) Sau mỗi lần lưu, các cột không dùng cho loại hiện tại (`round_*`, `threshold_value`, cột công thức/nguồn) là SQL NULL.

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: quy tắc “Cố định 30” (dưới 30) (cố định 30) đã lưu. - Dữ liệu test: quy tắc “Cố định 30” (dưới 30) | Trigger/điểm quan sát: 1. Đổi sang Tỷ lệ, nhập 40, đổi lại Cố định; xem ô Cố định; đổi sang Tỷ lệ lần nữa, xem ô Tỷ lệ. 2. Đổi lại Cố định, Lưu. 3. Mở lại quy tắc. 4. Đổi sang Tỷ lệ, nhập 50, bấm Hủy; mở lại. 5. (Khi có schema) Lưu quy tắc Tỷ lệ 40 có bật xử lý phần lẻ; đổi sang Cố định 30, Lưu, SELECT; đổi sang Công thức `A×0.5`, Lưu, SELECT. | Oracle/bằng chứng: 1. (PROPOSED) Trong phiên: ô Cố định vẫn 30; quay lại Tỷ lệ vẫn thấy 40. 2. Chỉ giá trị loại cuối cùng (Cố định 30) được kiểm và lưu; không lưu lẫn dữ liệu của loại khác. 3. Mở lại: Cố định 30; không bắt buộc còn giá trị Tỷ lệ 40. 4. Vẫn Cố định 30 (cấu hình đã lưu gần nhất). 5. (PROPOSED theo thiết kế DB v2) Sau mỗi lần lưu, các cột không dùng cho loại hiện tại (`round_*`, `threshold_value`, cột công thức/nguồn) là SQL NULL.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.7 “Đổi loại ngưỡng và đổi toán hạng” (đề xuất thiết kế: trong phiên chỉ ẩn/hiện vùng, có thể quay lại phần vừa nhập; sau lưu và mở lại chỉ khôi phục loại đã lưu; hủy quay về cấu hình đã lưu)
- Bằng chứng cần chụp: Ảnh form ở từng bước; SELECT cấu hình (khi có schema).
- Ghi chú: PROPOSED theo đề xuất thiết kế đặc tả v2 mục 6.7 “Đổi loại ngưỡng và đổi toán hạng”, tài liệu chia công việc v2 công việc “Thiết lập và lưu nhiều quy tắc” ("Đổi loại trong phiên sửa giữ tạm input; mở lại phục hồi loại đã lưu") và thiết kế DB v2 mục 4.1 “Loại ngưỡng và tính hợp lệ” (cột không dùng lưu SQL NULL); phần "chỉ loại đang chọn có hiệu lực" (bước 2) và "hủy quay về cấu hình đã lưu" (bước 4) là tiêu chí chắc hơn. Không phải must-pass cho tới khi đề xuất được review (đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-022"></a>

### TC-RS-VAL-022 — Giá trị điều kiện phân nhánh (trung bình/tỷ lệ nhóm)

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 5.2 “Điều kiện dựa trên trung bình”

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Màn thêm quy tắc có điều kiện.
- Dữ liệu test: Trung bình: trống, −1, 101, 60.5, 60.123456789; tỷ lệ nhóm: −1, 0, 100, 101

**操作（Thao tác）**

Nhập từng giá trị, Lưu.

**期待結果（Kết quả mong đợi）**

Đề xuất (thiết kế DB v2): trống → không lưu được (điều kiện chưa đủ); 60.5 lưu được; 60.123456789 (9 chữ số lẻ) bị từ chối; tỷ lệ nhóm 0 và 100 lưu được, −1 và 101 bị từ chối. Trung bình −1 và 101: thiết kế DB v2 không nêu miền — TBD, ghi hành vi thực tế.

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Màn thêm quy tắc có điều kiện. - Dữ liệu test: Trung bình: trống, −1, 101, 60.5, 60.123456789; tỷ lệ nhóm: −1, 0, 100, 101 | Trigger/điểm quan sát: Nhập từng giá trị, Lưu. | Oracle/bằng chứng: Đề xuất (thiết kế DB v2): trống → không lưu được (điều kiện chưa đủ); 60.5 lưu được; 60.123456789 (9 chữ số lẻ) bị từ chối; tỷ lệ nhóm 0 và 100 lưu được, −1 và 101 bị từ chối. Trung bình −1 và 101: thiết kế DB v2 không nêu miền — TBD, ghi hành vi thực tế.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.2 “Điều kiện dựa trên trung bình” (không định nghĩa kiểm tra giá trị); Figma MW “màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình” (58:8930 «Figma MW: màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình») (ô 60 + 未満), “màn Điều kiện áp dụng – điều kiện tỷ lệ điểm của nhóm” (58:9164 «Figma MW: màn Điều kiện áp dụng – điều kiện tỷ lệ điểm của nhóm») (ô 65 % + 以上); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 3.2 “`apply_condition`”, mục 4.2 “Xử lý phần lẻ và miền lưu trữ” (mốc `value` là chuỗi thập phân tối đa 9 chữ số nguyên và 8 chữ số lẻ; mốc tỷ lệ 0–100 — PROPOSED)
- Bằng chứng cần chụp: Ảnh sau khi Lưu từng giá trị (thông báo lỗi, hoặc giá trị khi mở lại).
- Ghi chú: PROPOSED; không phải must-pass.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-023"></a>

### TC-RS-VAL-023 — Giới hạn công thức: 20/21 dòng và số chữ số của số cố định

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11 «Giữ chính xác giá trị»)

<!-- Mã truy vết: TC-RS-ERR-009, AC-G11, SI-06 «Giới hạn giá trị ở server», TC-RS-DATA-001 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Màn Công thức（計算式）, nguồn mặc định.
- Dữ liệu test: (a) 20 dòng: dòng 1 `A × 1`, các dòng sau `kết quả dòng trước × 1`; (b) 21 dòng như (a); (c) `A × 999999999.99999999`; (d) `A × 1000000000`; (e) `A × 0.123456789`

**操作（Thao tác）**

Nhập từng cấu hình, Lưu, mở lại.

**期待結果（Kết quả mong đợi）**

(a) Lưu được, mở lại đủ 20 dòng.

(b) Không thêm được dòng 21 hoặc bị từ chối khi lưu.

(c) Lưu được, giá trị giữ nguyên.

(d), (e) Bị từ chối, không tự cắt/làm tròn.

Gửi trực tiếp request vượt giới hạn cũng bị server từ chối (case “Server kiểm miền giá trị khi bỏ qua kiểm tra phía trình duyệt”).

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Màn Công thức（計算式）, nguồn mặc định. - Dữ liệu test: (a) 20 dòng: dòng 1 `A × 1`, các dòng sau `kết quả dòng trước × 1`; (b) 21 dòng như (a); (c) `A × 999999999.99999999`; (d) `A × 1000000000`; (e) `A × 0.123456789` | Trigger/điểm quan sát: Nhập từng cấu hình, Lưu, mở lại. | Oracle/bằng chứng: (a) Lưu được, mở lại đủ 20 dòng. (b) Không thêm được dòng 21 hoặc bị từ chối khi lưu. (c) Lưu được, giá trị giữ nguyên. (d), (e) Bị từ chối, không tự cắt/làm tròn. Gửi trực tiếp request vượt giới hạn cũng bị server từ chối (case “Server kiểm miền giá trị khi bỏ qua kiểm tra phía trình duyệt”).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.8 “Yêu cầu độ chính xác” (miền giá trị do team chốt); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11 «Giữ chính xác giá trị»), Chi tiết thiết kế (Giới hạn nhập); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 4.2 “Xử lý phần lẻ và miền lưu trữ” (tối đa 20 bước; hệ số tối đa 9 chữ số nguyên và 8 chữ số lẻ; mỗi cột TEXT tối đa 60.000 byte — PROPOSED); khác biệt đặc tả–code về “Giới hạn giá trị ở server” (SI-06 «Giới hạn giá trị ở server»)
- Bằng chứng cần chụp: Ảnh form và thông báo; SELECT `formula` (khi có schema).
- Ghi chú: PROPOSED. Nguyên tắc không âm thầm cắt/làm tròn là CONFIRMED (đặc tả v2 mục 6.8 “Yêu cầu độ chính xác”, case “Cấu hình lưu và mở lại đầy đủ, không cắt/làm tròn âm thầm”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-024"></a>

### TC-RS-VAL-024 — Quy tắc dùng trung bình/tỷ lệ nhóm không lưu được khi thiếu nguồn

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05 «Đối tượng áp dụng và nhu cầu nguồn»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», AC-G05, TC-RS-BR-011 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Màn thêm quy tắc của mục số nguyên (M=100).
- Dữ liệu test: mục số nguyên (M=100); (a) Điều kiện trung bình `A≥60`, ngưỡng cố định 30, bỏ trống một phần hoặc toàn bộ nguồn (thời kỳ, thiết lập tổng hợp, nhóm tham chiếu); (b) điều kiện tỷ lệ nhóm ≥65%, nguồn bỏ trống; (c) Toàn bộ đối tượng, ngưỡng Công thức tính（計算式） `A×0.5`, nguồn của công thức bỏ trống

**操作（Thao tác）**

Nhập từng biến thể, bấm Lưu; mở lại danh sách.

**期待結果（Kết quả mong đợi）**

Cả ba biến thể không lưu được; có thông báo thiếu nguồn. Không lưu quy tắc với điều kiện bị bỏ đi hoặc nguồn trống; danh sách quy tắc không đổi.

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Màn thêm quy tắc của mục số nguyên (M=100). - Dữ liệu test: mục số nguyên (M=100); (a) Điều kiện trung bình `A≥60`, ngưỡng cố định 30, bỏ trống một phần hoặc toàn bộ nguồn (thời kỳ, thiết lập tổng hợp, nhóm tham chiếu); (b) điều kiện tỷ lệ nhóm ≥65%, nguồn bỏ trống; (c) Toàn bộ đối tượng, ngưỡng Công thức tính（計算式） `A×0.5`, nguồn của công thức bỏ trống | Trigger/điểm quan sát: Nhập từng biến thể, bấm Lưu; mở lại danh sách. | Oracle/bằng chứng: Cả ba biến thể không lưu được; có thông báo thiếu nguồn. Không lưu quy tắc với điều kiện bị bỏ đi hoặc nguồn trống; danh sách quy tắc không đổi.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Đối tượng áp dụng và nhu cầu nguồn” (AC-G05 «Đối tượng áp dụng và nhu cầu nguồn») ("Nếu điều kiện hoặc ngưỡng dùng trung bình/tỷ lệ nhóm thì bắt buộc có nguồn, không bỏ điều kiện khi thiếu dữ liệu"); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.4 “Bộ thông tin nguồn”, mục 5.6 “Khi nào không cần nguồn?”
- Bằng chứng cần chụp: Ảnh thông báo khi Lưu từng biến thể; ảnh danh sách sau đó.
- Ghi chú: Câu chữ thông báo không phải must-pass. (c) chỉ chạy khi công thức thuộc đợt phát hành (phạm vi phát hành chưa chốt — đặc tả v2 mục 13.1); ngoài đợt thì SKIPPED. Chiều ngược lại (quy tắc không dùng trung bình thì không hiện/không bắt nhập nguồn): case “Nguồn chỉ cần khi quy tắc đọc trung bình/tỷ lệ nhóm”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-val-025"></a>

### TC-RS-VAL-025 — Server từ chối lưu nhóm tham chiếu không khả dụng hoặc ngoài trường/năm

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu»)

<!-- Mã truy vết: TD-POP-01 «Thiết lập tổng hợp X: Thiết lập tổng hợp thứ hạng（順位集計設定）…», TD-ENV-02 «Trường khác: Trường B (tên giả), có ít nhất một mục đánh giá và một quy…», TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-ROLE-01 «Giáo viên có quyền sửa mục: Có quyền vào Thiết lập nhập điểm（成績入力設定） và…», AC-G12 -->

**前提条件（Điều kiện trước）**

- Điều kiện: thiết lập tổng hợp X（評点集計） (lớp học tắt). Công cụ sửa request (DevTools/proxy) trên môi trường test.
- Dữ liệu test: thiết lập tổng hợp X（評点集計）; ID nhóm tổng hợp của trường B (trường B (trường khác)); ID nhóm tổng hợp của năm khác; mục số nguyên (M=100); tài khoản giáo viên có quyền sửa mục

**操作（Thao tác）**

Gửi request lưu quy tắc có nguồn (điều kiện hoặc công thức) với từng biến thể:
1. Loại Lớp học（授業） trong khi công tắc lớp học đang tắt.
2. Nhóm tổng hợp mang ID của trường B.
3. Nhóm tổng hợp mang ID của năm học khác.
4. Nhóm môn học（科目グループ） có ID không tồn tại.

**期待結果（Kết quả mong đợi）**

Cả bốn biến thể bị từ chối; không lưu quy tắc; danh sách quy tắc không đổi; không trả về tên/dữ liệu của trường hay năm khác.

**補足（Bổ sung）**
- Chức năng: Validation/kiểm tra dữ liệu
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: thiết lập tổng hợp X（評点集計） (lớp học tắt). Công cụ sửa request (DevTools/proxy) trên môi trường test. - Dữ liệu test: thiết lập tổng hợp X（評点集計）; ID nhóm tổng hợp của trường B (trường B (trường khác)); ID nhóm tổng hợp của năm khác; mục số nguyên (M=100); tài khoản giáo viên có quyền sửa mục | Trigger/điểm quan sát: Gửi request lưu quy tắc có nguồn (điều kiện hoặc công thức) với từng biến thể: 1. Loại Lớp học（授業） trong khi công tắc lớp học đang tắt. 2. Nhóm tổng hợp mang ID của trường B. 3. Nhóm tổng hợp mang ID của năm học khác. 4. Nhóm môn học（科目グループ） có ID không tồn tại. | Oracle/bằng chứng: Cả bốn biến thể bị từ chối; không lưu quy tắc; danh sách quy tắc không đổi; không trả về tên/dữ liệu của trường hay năm khác.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu») (bảng quy tắc chọn/đọc nhóm: "Server từ chối lưu lựa chọn không khả dụng"); [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Nhóm tham chiếu phía điểm đỏ có tuân theo thiết lập tổng hợp hiện hữu không?…” (Q32 «Nhóm tham chiếu phía điểm đỏ có tuân theo thiết lập tổng hợp hiện hữu không?…»); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 3.1 “Bộ thông tin nguồn” ("từ chối lựa chọn trực tiếp không khả dụng hoặc ID ngoài trường/năm" — PROPOSED); quy tắc phát triển BLEND (phạm vi trường/năm, kiểm quyền ở server)
- Bằng chứng cần chụp: Request/response đã sửa (che token/cookie); ảnh danh sách quy tắc sau đó.
- Ghi chú: Không ghi token, cookie hay thông tin đăng nhập vào bằng chứng. Câu chữ lỗi không phải must-pass.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="data"></a>

## 4. Data / Persistence (DATA)

<a id="tc-rs-data-001"></a>

### TC-RS-DATA-001 — Cấu hình lưu và mở lại đầy đủ, không cắt/làm tròn âm thầm

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04 «Lưu và mở lại nhiều thiết lập»); tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11 «Giữ chính xác giá trị»)

<!-- Mã truy vết: TD-ITEM-02 «Mục số thập phân: Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-RULE-04 «Tỷ lệ làm tròn xuống: Như TD-RULE-03, xử lý phần lẻ: chữ số thập phân…», TD-RULE-06 «Công thức hai dòng: Dòng 1: Trung bình（平均点）÷ Số cố định（固定値）2, chữ số…», TD-RULE-12 «Bộ lọc kết hợp: Giới hạn bằng bộ lọc（特定条件で絞り込む）: Khối（学年） = 1 hoặc 2» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số thập phân (M=100).
- Dữ liệu test: mục số thập phân (M=100); quy tắc “Cố định 30” (dưới 30) với N=29.5; quy tắc tỷ lệ 30% làm tròn xuống; quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8); quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao)

**操作（Thao tác）**

1. Lưu từng quy tắc.
2. Tải lại trang, mở từng quy tắc.
3. SELECT cấu hình (khi có schema).

**期待結果（Kết quả mong đợi）**

Mọi trường (tên, phạm vi, bộ lọc, điều kiện, loại, N, p, cách làm tròn, toán hạng, so sánh, thứ tự) trùng giá trị đã nhập.

**補足（Bổ sung）**
- Chức năng: Dữ liệu và persistence
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số thập phân (M=100). - Dữ liệu test: mục số thập phân (M=100); quy tắc “Cố định 30” (dưới 30) với N=29.5; quy tắc tỷ lệ 30% làm tròn xuống; quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8); quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao) | Trigger/điểm quan sát: 1. Lưu từng quy tắc. 2. Tải lại trang, mở từng quy tắc. 3. SELECT cấu hình (khi có schema). | Oracle/bằng chứng: Mọi trường (tên, phạm vi, bộ lọc, điều kiện, loại, N, p, cách làm tròn, toán hạng, so sánh, thứ tự) trùng giá trị đã nhập.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.8 “Yêu cầu độ chính xác” ("không được âm thầm cắt hoặc làm tròn giá trị"); Figma MW “màn danh sách thiết lập điểm đỏ” (58:9903 «Figma MW: màn danh sách thiết lập điểm đỏ»)
- Bằng chứng cần chụp: Ảnh form mở lại; ảnh SELECT.
- Ghi chú: Ngưỡng cố định thập phân: thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ” đề xuất tối đa 3 chữ số lẻ (PROPOSED, giới hạn số chưa chốt — đặc tả v2 mục 13.1); nếu bản cuối không cho phép thập phân, thay 29.5 bằng 29.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-data-002"></a>

### TC-RS-DATA-002 — Kết quả lưu theo định danh ô; mỗi ô chỉ một kết quả hiện hành

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Nhận diện ô điểm” (AC-G03 «Nhận diện ô điểm»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-ITEM-03 «Mục điểm đơn vị: Điểm bài kiểm tra đơn vị（単元テスト点）, M mặc định 100», TD-STU-01 «S01: G-A, HR1», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», AC-G03 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Đã xét S01 (mục số nguyên (M=100)) và S06 U1/U2 (mục điểm đơn vị (đơn vị U1 có M riêng 40)).
- Dữ liệu test: mục số nguyên (M=100); học sinh S01 (điểm 29), mục điểm đơn vị (đơn vị U1 có M riêng 40); quy tắc “Cố định 30” (dưới 30) (bước 4)

**操作（Thao tác）**

1. SELECT `red_score_results` theo `school_id`, `year`, `evaluate_frame_item_id`, `group_id`, `student_id`, `tangen_id` của các ô.
2. Chạy lại nút cam, SELECT lại.
3. `SHOW INDEX FROM red_score_results`.
4. Chuẩn bị hai mục cùng tên Điểm đánh giá（評点） ở hai kỳ khác nhau; chỉ mục kỳ 1 có quy tắc “Cố định 30” (dưới 30). Đăng ký S01 = 25 ở cả hai mục, xem đầu ra và SELECT.
5. Đổi tên mục kỳ 1 và đổi thứ tự cột mục trên khung đánh giá (nếu màn hỗ trợ); xem đầu ra và SELECT lại, chưa chạy xét.

**期待結果（Kết quả mong đợi）**

1–3. Mỗi ô (trường, năm, mục trên khung đánh giá — gồm kỳ/thời điểm, lớp, học sinh, đơn vị) có đúng một dòng hiện hành; U1/U2 của S06 là hai dòng; ô điểm thường có `tangen_id=0`. Chạy lại không tạo dòng thứ hai.

4. Ô kỳ 1 Đỏ; ô kỳ 2 không có dấu đỏ (không mượn quy tắc hay kết quả của mục cùng tên); hai kết quả gắn đúng `evaluate_frame_item_id` của từng mục.
5. Kết quả Đỏ vẫn gắn với đúng mục kỳ 1 (không theo số thứ tự cột hay tên mục).

**補足（Bổ sung）**
- Chức năng: Dữ liệu và persistence
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Đã xét S01 (mục số nguyên (M=100)) và S06 U1/U2 (mục điểm đơn vị (đơn vị U1 có M riêng 40)). - Dữ liệu test: mục số nguyên (M=100); học sinh S01 (điểm 29), mục điểm đơn vị (đơn vị U1 có M riêng 40); quy tắc “Cố định 30” (dưới 30) (bước 4) | Trigger/điểm quan sát: 1. SELECT `red_score_results` theo `school_id`, `year`, `evaluate_frame_item_id`, `group_id`, `student_id`, `tangen_id` của các ô. 2. Chạy lại nút cam, SELECT lại. 3. `SHOW INDEX FROM red_score_results`. 4. Chuẩn bị hai mục cùng tên Điểm đánh giá（評点） ở hai kỳ khác nhau; chỉ mục kỳ 1 có quy tắc “Cố định 30” (dưới 30). Đăng ký S01 = 25 ở cả hai mục, xem đầu ra và SELECT. 5. Đổi tên mục kỳ 1 và đổi thứ tự cột mục trên khung đánh giá (nếu màn hỗ trợ); xem đầu ra và SELECT lại, chưa chạy xét. | Oracle/bằng chứng: 1–3. Mỗi ô (trường, năm, mục trên khung đánh giá — gồm kỳ/thời điểm, lớp, học sinh, đơn vị) có đúng một dòng hiện hành; U1/U2 của S06 là hai dòng; ô điểm thường có `tangen_id=0`. Chạy lại không tạo dòng thứ hai. 4. Ô kỳ 1 Đỏ; ô kỳ 2 không có dấu đỏ (không mượn quy tắc hay kết quả của mục cùng tên); hai kết quả gắn đúng `evaluate_frame_item_id` của từng mục. 5. Kết quả Đỏ vẫn gắn với đúng mục kỳ 1 (không theo số thứ tự cột hay tên mục).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 2.2 “Một ô điểm được nhận diện như thế nào?”, mục 7.1 “Trình tự cho một ô”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Nhận diện ô điểm” (AC-G03 «Nhận diện ô điểm»); [tài liệu chia công việc v2](../split-tasks.vi.md) ([RSD-TASK](../split-tasks.vi.md) «bản chia công việc v2») công việc “Xét điểm cuối và lưu kết quả chung” (Task 2 «Xét điểm cuối và lưu kết quả chung») ("Không dùng số thứ tự cột/tên mục làm khóa"); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 1.1 “Khóa nhận diện ô điểm”, mục 2.3 “Khóa và chỉ mục” (`uk_red_score_results_01` — PROPOSED)
- Bằng chứng cần chụp: Ảnh SELECT (che thông tin cá nhân); ảnh đầu ra hai mục ở bước 4.
- Ghi chú: Tên bảng/cột theo thiết kế DB v2 (PROPOSED, chưa migrate); nếu schema cuối khác, đổi câu SELECT, giữ kỳ vọng.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-data-003"></a>

### TC-RS-DATA-003 — Sáu trạng thái phân biệt được khi lưu

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Trạng thái sau lần chạy” (AC-G20 «Trạng thái sau lần chạy»)

<!-- Mã truy vết: TC-RS-BR-010, TC-RS-BR-002, TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-STU-01 «S01: G-A, HR1», TD-STU-03 «S03: G-A, HR1», TD-STU-05 «S05: G-A, HR1», TC-RS-BR-017, TC-RS-BR-003, AC-G20 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Có ô ở mỗi trạng thái: Đỏ (S01), Không đỏ (S03), Chưa từng xét (ô mới chưa chạy), Chưa xét được (case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”), Không áp dụng (case “Không quy tắc nào khớp khi đủ dữ liệu → Không áp dụng”), Không có điểm (S05).
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29), học sinh S03 (điểm 31), học sinh S05 (ô trống)

**操作（Thao tác）**

1. SELECT `judgment_status`, `is_red`, `red_score_setting_id`, `reason_code` của các ô.
2. Đổi ngưỡng quy tắc “Cố định 30” (dưới 30) thành 35 (chỉ lưu), SELECT lại ô S03.

**期待結果（Kết quả mong đợi）**

1. Sáu trạng thái phân biệt được, không gộp Chưa xét được với Không áp dụng hay Không đỏ. Việc dùng cột, mã số, `reason_code` hoặc `red_score_setting_id` cụ thể là phần thiết kế DB cần đối chiếu khi schema được chốt; không dùng mapping đề xuất làm business oracle. Bất kể cách lưu, kết quả quan sát phải phân biệt rõ sáu trạng thái và trạng thái Đang chờ chạy lại.
2. Dòng của S03 giữ nguyên (đang chờ chạy lại không có trạng thái riêng).

**補足（Bổ sung）**
- Chức năng: Dữ liệu và persistence
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Có ô ở mỗi trạng thái: Đỏ (S01), Không đỏ (S03), Chưa từng xét (ô mới chưa chạy), Chưa xét được (case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”), Không áp dụng (case “Không quy tắc nào khớp khi đủ dữ liệu → Không áp dụng”), Không có điểm (S05). - Dữ liệu test: quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29), học sinh S03 (điểm 31), học sinh S05 (ô trống) | Trigger/điểm quan sát: 1. SELECT `judgment_status`, `is_red`, `red_score_setting_id`, `reason_code` của các ô. 2. Đổi ngưỡng quy tắc “Cố định 30” (dưới 30) thành 35 (chỉ lưu), SELECT lại ô S03. | Oracle/bằng chứng: 1. Sáu trạng thái phân biệt được, không gộp Chưa xét được với Không áp dụng hay Không đỏ. Việc dùng cột, mã số, `reason_code` hoặc `red_score_setting_id` cụ thể là phần thiết kế DB cần đối chiếu khi schema được chốt; không dùng mapping đề xuất làm business oracle. Bất kể cách lưu, kết quả quan sát phải phân biệt rõ sáu trạng thái và trạng thái Đang chờ chạy lại. 2. Dòng của S03 giữ nguyên (đang chờ chạy lại không có trạng thái riêng).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 8.1 “Các trạng thái phải phân biệt”, mục 8.2 “Bảng chuyển trạng thái”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Trạng thái sau lần chạy” (AC-G20 «Trạng thái sau lần chạy»); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 4.3 “Trạng thái kết quả” (PROPOSED)
- Bằng chứng cần chụp: Ảnh SELECT.
- Ghi chú: Phần CONFIRMED: sáu trạng thái phân biệt được; chỉ lưu cấu hình thì giữ kết quả. Mã số trạng thái và tên cột là PROPOSED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-data-004"></a>

### TC-RS-DATA-004 — Xóa quy tắc không xóa dây chuyền kết quả hay điểm

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”, mục 12.2 “Điểm tích hợp chính”

<!-- Mã truy vết: TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-STU-01 «S01: G-A, HR1» -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc “Cố định 30” (dưới 30); S01 Đỏ.
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29)

**操作（Thao tác）**

1. Xóa quy tắc “Cố định 30” (dưới 30).
2. SELECT kết quả và điểm của S01.

**期待結果（Kết quả mong đợi）**

Kết quả S01 vẫn còn; điểm 29 giữ nguyên.

**補足（Bổ sung）**
- Chức năng: Dữ liệu và persistence
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: quy tắc “Cố định 30” (dưới 30); S01 Đỏ. - Dữ liệu test: quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29) | Trigger/điểm quan sát: 1. Xóa quy tắc “Cố định 30” (dưới 30). 2. SELECT kết quả và điểm của S01. | Oracle/bằng chứng: Kết quả S01 vẫn còn; điểm 29 giữ nguyên.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Xóa thiết lập cuối cùng thì dấu đỏ mất ngay hay chờ chạy lại?” (Q28 «Xóa thiết lập cuối cùng thì dấu đỏ mất ngay hay chờ chạy lại?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 4.1 “Điểm vào và trạng thái trống”, mục 12.2 “Điểm tích hợp chính”
- Bằng chứng cần chụp: Ảnh SELECT trước/sau.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-data-005"></a>

### TC-RS-DATA-005 — Xét điểm đỏ không ghi đè điểm học sinh

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 6.4 “Công thức dùng trung bình”, mục 7.1 “Trình tự cho một ô”

<!-- Mã truy vết: TD-STU-01 «S01: G-A, HR1», TD-STU-02 «S02: G-A, HR1», TD-STU-03 «S03: G-A, HR1», TD-STU-04 «S04: G-A, HR1», TD-STU-05 «S05: G-A, HR1», TD-STU-06 «S06: G-B, HR2», TD-STU-07 «S07: G-B, HR2», TD-STU-08 «S08: G-B, HR2», TD-STU-09 «S09: G-B, HR2», TD-RULE-06 «Công thức hai dòng: Dòng 1: Trung bình（平均点）÷ Số cố định（固定値）2, chữ số…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: học sinh S01–S09 có điểm. quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8) (có làm tròn).
- Dữ liệu test: quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8); học sinh S01–S09

**操作（Thao tác）**

1. SELECT điểm trước.
2. Chạy nút cam.
3. SELECT điểm sau.

**期待結果（Kết quả mong đợi）**

Mọi điểm giữ nguyên (kể cả S09=29.5).

**補足（Bổ sung）**
- Chức năng: Dữ liệu và persistence
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: học sinh S01–S09 có điểm. quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8) (có làm tròn). - Dữ liệu test: quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8); học sinh S01–S09 | Trigger/điểm quan sát: 1. SELECT điểm trước. 2. Chạy nút cam. 3. SELECT điểm sau. | Oracle/bằng chứng: Mọi điểm giữ nguyên (kể cả S09=29.5).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.4 “Công thức dùng trung bình” ("Không dùng xử lý làm tròn điểm học sinh hiện có"), mục 7.1 “Trình tự cho một ô”
- Bằng chứng cần chụp: Ảnh SELECT trước/sau.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-data-007"></a>

### TC-RS-DATA-007 — Cấu hình trình bày ở từng đầu ra lưu riêng, không làm đổi quy tắc/kết quả

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 9.1 “Thiết lập”, mục 10.1 “Phạm vi và tùy chọn”, mục 11.1 “Tùy chọn hiển thị đỏ”

<!-- Mã truy vết: TD-OUT-01 «Trích xuất lọc + ký hiệu trước + màu: Lọc học sinh có điểm đỏ（抽出する） BẬT», TD-OUT-03 «Công khai: Hiệu ứng đỏ: `*` phía trước（前に「*」）», TD-OUT-04 «Phiếu điểm: Dòng Thiết lập điểm đỏ（赤点設定）: Ký tự phía trước（前に任意の文字） `※`» -->

**前提条件（Điều kiện trước）**

- Điều kiện: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước.
- Dữ liệu test: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước

**操作（Thao tác）**

1. Đổi từng cấu hình đầu ra, lưu.
2. Kiểm quy tắc và kết quả xét.

**期待結果（Kết quả mong đợi）**

Quy tắc và kết quả không đổi; cấu hình mỗi đầu ra độc lập (đổi công khai không đổi trích xuất).

**補足（Bổ sung）**
- Chức năng: Dữ liệu và persistence
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước. - Dữ liệu test: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước | Trigger/điểm quan sát: 1. Đổi từng cấu hình đầu ra, lưu. 2. Kiểm quy tắc và kết quả xét. | Oracle/bằng chứng: Quy tắc và kết quả không đổi; cấu hình mỗi đầu ra độc lập (đổi công khai không đổi trích xuất).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?” (Q16 «Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 9.1 “Thiết lập”, mục 10.1 “Phạm vi và tùy chọn”, mục 11.1 “Tùy chọn hiển thị đỏ”
- Bằng chứng cần chụp: Ảnh cấu hình từng đầu ra trước/sau khi đổi; ảnh danh sách quy tắc và Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](scope-and-approach.vi.md#conventions) mục 9 “Quy ước thực thi chung”） dòng S01 trước/sau.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-data-008"></a>

### TC-RS-DATA-008 — Lưu thông tin giải thích kết quả

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 12.1 “Dữ liệu cấu hình và kết quả cần quản lý”

<!-- Mã truy vết: TD-RULE-03 «Tỷ lệ: Tỷ lệ điểm tối đa（得点率） 30%, không xử lý phần lẻ（しない）, Nhỏ hơn（未満）», TD-RULE-06 «Công thức hai dòng: Dòng 1: Trung bình（平均点）÷ Số cố định（固定値）2, chữ số…», TD-STU-01 «S01: G-A, HR1», TC-RS-BR-019 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Có ô Đỏ, ô Chưa xét được, ô Không áp dụng và (nếu tạo được) một ô chưa từng xét đã có dòng điều khiển; một ô dùng quy tắc Tỷ lệ (quy tắc tỷ lệ 30%); một ô dùng quy tắc có nguồn trung bình (quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8)).
- Dữ liệu test: học sinh S01 (điểm 29); quy tắc tỷ lệ 30%; quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8)

**操作（Thao tác）**

1. SELECT `red_score_setting_id`, `reason_code`, `judgment_context`, `judged_at` của ô Đỏ (S01), ô Chưa xét được, ô Không áp dụng, ô chưa từng xét, ô Tỷ lệ và ô có nguồn.
2. Làm ô S01 chuyển từ Đỏ sang Không áp dụng (như case “Xóa quy tắc cuối: giữ kết quả tới lần chạy lại; chạy lại → Không áp dụng”), SELECT lại.

**期待結果（Kết quả mong đợi）**

1. Ô Đỏ: có quy tắc được chọn; `judgment_context` có `score`="29", `threshold` dạng tử/mẫu (30/1), `compare_type`=1, `sources` rỗng với quy tắc cố định. Ô Chưa xét được: có `reason_code` (ví dụ `source_missing`). `judged_at` có giá trị cho cả ô Chưa xét được và Không áp dụng; NULL ở ô chưa từng xét. Ô có điểm hợp lệ: `judgment_context` có `grade_id` (ID dòng điểm nguồn). Ô Tỷ lệ: `judgment_context` có `maximum`. Ô có nguồn: `sources[]` có `usage`, `kind`, `reference`, `population_key`; với nhóm môn học（科目グループ） có thêm `resolved_population_type`/`resolved_population_ref_id` nhưng vẫn giữ loại/ID đã chọn. Không có tên học sinh, thông tin liên hệ hay câu lỗi SQL.
2. Sau khi chuyển sang Không áp dụng: không còn giữ ngưỡng, dấu so sánh hay nguồn của lần Đỏ trước.

**補足（Bổ sung）**
- Chức năng: Dữ liệu và persistence
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Có ô Đỏ, ô Chưa xét được, ô Không áp dụng và (nếu tạo được) một ô chưa từng xét đã có dòng điều khiển; một ô dùng quy tắc Tỷ lệ (quy tắc tỷ lệ 30%); một ô dùng quy tắc có nguồn trung bình (quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8)). - Dữ liệu test: học sinh S01 (điểm 29); quy tắc tỷ lệ 30%; quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8) | Trigger/điểm quan sát: 1. SELECT `red_score_setting_id`, `reason_code`, `judgment_context`, `judged_at` của ô Đỏ (S01), ô Chưa xét được, ô Không áp dụng, ô chưa từng xét, ô Tỷ lệ và ô có nguồn. 2. Làm ô S01 chuyển từ Đỏ sang Không áp dụng (như case “Xóa quy tắc cuối: giữ kết quả tới lần chạy lại; chạy lại → Không áp dụng”), SELECT lại. | Oracle/bằng chứng: 1. Ô Đỏ: có quy tắc được chọn; `judgment_context` có `score`="29", `threshold` dạng tử/mẫu (30/1), `compare_type`=1, `sources` rỗng với quy tắc cố định. Ô Chưa xét được: có `reason_code` (ví dụ `source_missing`). `judged_at` có giá trị cho cả ô Chưa xét được và Không áp dụng; NULL ở ô chưa từng xét. Ô có điểm hợp lệ: `judgment_context` có `grade_id` (ID dòng điểm nguồn). Ô Tỷ lệ: `judgment_context` có `maximum`. Ô có nguồn: `sources[]` có `usage`, `kind`, `reference`, `population_key`; với nhóm ; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 12.1 “Dữ liệu cấu hình và kết quả cần quản lý”; [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 3.4 “`judgment_context`” (`judgment_context` — PROPOSED)
- Bằng chứng cần chụp: Ảnh kết quả SELECT của các ô (không lấy cột tên học sinh).
- Ghi chú: PROPOSED — theo thiết kế DB v2 mục 3.4 “`judgment_context`”. `judgment_context` chỉ để giải thích, không thay cơ chế phiên bản (thiết kế DB v2 mục 6 “Phương thức xử lý cập nhật đồng thời”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-data-010"></a>

### TC-RS-DATA-010 — Sao chép mẫu phiếu điểm giữ lựa chọn hiển thị đỏ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu, sao chép và PDF phiếu” (AC-G37 «Lưu, sao chép và PDF phiếu»)

<!-- Mã truy vết: TD-OUT-04 «Phiếu điểm: Dòng Thiết lập điểm đỏ（赤点設定）: Ký tự phía trước（前に任意の文字） `※`», AC-G37, SI-04 «Sao chép mẫu phiếu điểm» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mẫu phiếu A có cấu hình phiếu điểm: ký tự “※” phía trước; mẫu phiếu B chỉ bật điều kiện đỏ (các dòng khác không dùng).
- Dữ liệu test: cấu hình phiếu điểm: ký tự “※” phía trước

**操作（Thao tác）**

1. Sao chép mẫu A và mẫu B.
2. Mở dòng Thiết lập điểm đỏ（赤点設定） ở từng bản sao.
3. Xuất PDF bản sao với S01.

**期待結果（Kết quả mong đợi）**

1–2. Bản sao giữ lựa chọn Ký tự phía trước（前に任意の文字） `※`; mẫu chỉ dùng điều kiện đỏ vẫn còn hiệu lực.

3. PDF: ô S01 hiển thị `※29`. Không sao chép kết quả xét của học sinh.

**補足（Bổ sung）**
- Chức năng: Dữ liệu và persistence
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Mẫu phiếu A có cấu hình phiếu điểm: ký tự “※” phía trước; mẫu phiếu B chỉ bật điều kiện đỏ (các dòng khác không dùng). - Dữ liệu test: cấu hình phiếu điểm: ký tự “※” phía trước | Trigger/điểm quan sát: 1. Sao chép mẫu A và mẫu B. 2. Mở dòng Thiết lập điểm đỏ（赤点設定） ở từng bản sao. 3. Xuất PDF bản sao với S01. | Oracle/bằng chứng: 1–2. Bản sao giữ lựa chọn Ký tự phía trước（前に任意の文字） `※`; mẫu chỉ dùng điều kiện đỏ vẫn còn hiệu lực. 3. PDF: ô S01 hiển thị `※29`. Không sao chép kết quả xét của học sinh.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 11.3 “Lưu và xuất”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Lưu, sao chép và PDF phiếu” (AC-G37 «Lưu, sao chép và PDF phiếu»); [tài liệu chia công việc v2](../split-tasks.vi.md) ([RSD-TASK](../split-tasks.vi.md) «bản chia công việc v2») công việc “Thêm điều kiện đỏ vào phiếu điểm” (Task 7 «Thêm điều kiện đỏ vào phiếu điểm») (xử lý lưu cấu hình phiếu điểm điều chỉnh `use_condition`; sao chép template thuộc công việc “Thêm điều kiện đỏ vào phiếu điểm” (Task 7)); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 5.1 “Thiết lập hiển thị của Trích xuất thành tích（成績抽出）và Công cụ phiếu điểm（通知表ツール）” (sao chép mẫu giữ lựa chọn và chuỗi, không sao chép kết quả xét của học sinh); CODE `application/blend/Report/Repository/ReportWidgetGradesNormalRepository.php` (nơi lưu `use_condition`); code hiện tại “Copy template 通知表 (phiếu điểm) làm mất display option” (sao chép mẫu mất `display_option`); khác biệt đặc tả–code về “Sao chép mẫu phiếu điểm” (SI-04 «Sao chép mẫu phiếu điểm»)
- Bằng chứng cần chụp: Ảnh bản gốc và bản sao; **file PDF thực** của bản sao.
- Ghi chú: Code hiện tại mất `display_option` khi sao chép (khác biệt đặc tả–code về “Sao chép mẫu phiếu điểm”) → dự kiến FAIL cho tới khi sửa. tài liệu chia công việc v2 đưa việc này vào công việc “Thêm điều kiện đỏ vào phiếu điểm”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-data-011"></a>

### TC-RS-DATA-011 — Bảng/cột mới theo quy tắc schema của BLEND

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 12.1 “Dữ liệu cấu hình và kết quả cần quản lý”, mục 12.3 “Không chuyển đổi dữ liệu đỏ cũ”

<!-- Mã truy vết: TD-ENV-03 «Truy cập DB: Kết nối MySQL local, chỉ dùng SELECT / SHOW FULL COLUMNS…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Build có migration của tính năng.
- Dữ liệu test: quyền đọc DB local (chỉ SELECT/SHOW)

**操作（Thao tác）**

1. `SHOW CREATE TABLE` và `SHOW FULL COLUMNS` cho `red_score_settings`, `red_score_results`.
2. `SHOW CREATE TABLE` cho `grade_publish_conf_grade_items` và `grade_evaluate_frame_items`; so với bản trước migration (hoặc DDL gốc trong source).

**期待結果（Kết quả mong đợi）**

1. Có phạm vi trường/năm, cột audit và comment theo quy tắc schema hiện hành. Đối chiếu thêm với thiết kế (PROPOSED): InnoDB, `utf8mb4`/`utf8mb4_general_ci`, không khai báo foreign key, có `idx_red_score_settings_01`, `uk_red_score_results_01`, `idx_red_score_results_01`, `setting_status` mặc định 0 và phân biệt rõ trạng thái 0/1/2; `red_score_results` có thêm `cell_generation`, `write_version` (mặc định 0), `judged_version`, `rule_revision` (cho phép NULL); bảng/cột cũ (`red_score`, `changed_red_score`) không đổi.
2. (PROPOSED) Chỉ thêm `red_score_display_type TINYINT UNSIGNED NOT NULL DEFAULT 0` vào `grade_publish_conf_grade_items` và `red_score_revision BIGINT UNSIGNED NOT NULL DEFAULT 0` vào `grade_evaluate_frame_items`; không đổi kiểu/khóa/collation của cột có sẵn, không thêm index hay foreign key. Thiết lập đỏ của Trích xuất thành tích（成績抽出） và Công cụ phiếu điểm（通知表ツール） không có cột/bảng mới (dùng JSON `grade_extract_conf.extract_setting` và phần lưu bảng/điều kiện phiếu điểm hiện có).

**補足（Bổ sung）**
- Chức năng: Dữ liệu và persistence
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Build có migration của tính năng. - Dữ liệu test: quyền đọc DB local (chỉ SELECT/SHOW) | Trigger/điểm quan sát: 1. `SHOW CREATE TABLE` và `SHOW FULL COLUMNS` cho `red_score_settings`, `red_score_results`. 2. `SHOW CREATE TABLE` cho `grade_publish_conf_grade_items` và `grade_evaluate_frame_items`; so với bản trước migration (hoặc DDL gốc trong source). | Oracle/bằng chứng: 1. Có phạm vi trường/năm, cột audit và comment theo quy tắc schema hiện hành. Đối chiếu thêm với thiết kế (PROPOSED): InnoDB, `utf8mb4`/`utf8mb4_general_ci`, không khai báo foreign key, có `idx_red_score_settings_01`, `uk_red_score_results_01`, `idx_red_score_results_01`, `setting_status` mặc định 0 và phân biệt rõ trạng thái 0/1/2; `red_score_results` có thêm `cell_generation`, `write_version` (mặc định 0), `judged_version`, `rule_revision` (cho phép NULL); bảng/cột cũ (`red_score`, `changed_re; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: Quy tắc phát triển BLEND (schema); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 2 “Định nghĩa bảng”, mục 2.3 “Khóa và chỉ mục”, mục 3 “Dữ liệu JSON” (cột bổ sung trên bảng hiện hữu), mục 5.1 “Thiết lập hiển thị của Trích xuất thành tích（成績抽出）và Công cụ phiếu điểm（通知表ツール）” (Trích xuất/phiếu điểm không thêm cột) và `database-design.sql` (PROPOSED); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 12.1 “Dữ liệu cấu hình và kết quả cần quản lý”, mục 12.3 “Không chuyển đổi dữ liệu đỏ cũ”
- Bằng chứng cần chụp: Ảnh kết quả SHOW.
- Ghi chú: Tên bảng theo thiết kế DB v2 (PROPOSED). Lệch thiết kế nhưng vẫn đúng quy tắc schema: ghi Notes, không FAIL. thiết kế DB v2 yêu cầu ID `CHAR(32)` là mã hex canonical, tương thích identity/cách so sánh của bảng nguồn (`latin1_bin`); kiểm thêm bằng một câu SELECT nối cột ID của `red_score_results` với bảng nguồn và ghi kết quả. Collation cụ thể trong DDL còn chờ chốt (chưa chốt). Bản v1 đã được khách hàng review và có ba phản hồi (context điểm đỏ mục 9.6 “Ba phản hồi review DB và bài học thiết kế ngày 28/09”); bản v2 đã sửa theo phản hồi nhưng chưa được review kỹ thuật và chưa thực thi DDL (chờ review — đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-data-012"></a>

### TC-RS-DATA-012 — Lưu, đọc lại và sao chép hiệu ứng đỏ theo dòng mục của cấu hình công khai

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 10.1 “Phạm vi và tùy chọn”

<!-- Mã truy vết: TD-OUT-05 «Hai cấu hình công khai cùng mục: Thiết lập công khai thành…», TD-OUT-06 «Công khai có mục thường và đơn vị: Cấu hình X: TD-ITEM-01…», TD-ENV-03 «Truy cập DB: Kết nối MySQL local, chỉ dùng SELECT / SHOW FULL COLUMNS…», TD-ROLE-07 «Người phụ trách đầu ra: Có quyền Trích xuất thành tích（成績抽出）, Thiết lập…», TD-ROLE-06 «Người dùng trường B: Giáo viên/quản trị của trường B», TD-ENV-02 «Trường khác: Trường B (tên giả), có ít nhất một mục đánh giá và một quy…», TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TC-RS-FUNC-037 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Build có migration thêm `red_score_display_type`; cấu hình công khai tạo trước khi migrate (dòng cũ) và hai cấu hình X, Y theo hai cấu hình công khai cùng một mục.
- Dữ liệu test: hai cấu hình công khai cùng một mục, cấu hình công khai có mục điểm thường và mục điểm đơn vị; quyền đọc DB local (chỉ SELECT/SHOW); tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm), tài khoản của trường B

**操作（Thao tác）**

1. SELECT `grade_publish_conf_id`, `year`, `evaluate_item_id`, `tangen_flg`, `red_score_display_type` của X, Y và của cấu hình cũ.
2. Mở cấu hình cũ trên màn, xem màn học sinh của cấu hình đó.
3. Sao chép X; SELECT dòng của bản sao.
4. Gửi request lưu với `red_score_display_type`=4, và với ID cấu hình công khai của trường B (tài khoản của trường B / trường B (trường khác)).

**期待結果（Kết quả mong đợi）**

1. X: 1 (ngoặc) ở dòng mục số nguyên (M=100); Y: 2 (`*` trước); dòng thường/đơn vị tách theo `tangen_flg`. Không có cột hiệu ứng trong bảng kết quả của học sinh.
2. Dòng cũ có giá trị 0; hiển thị giữ như trước khi có chức năng.
3. Bản sao có ID cấu hình mới và giữ giá trị 1; không có dòng kết quả học sinh nào được sao chép.
4. Bị từ chối; giá trị đã lưu không đổi.

**補足（Bổ sung）**
- Chức năng: Dữ liệu và persistence
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Build có migration thêm `red_score_display_type`; cấu hình công khai tạo trước khi migrate (dòng cũ) và hai cấu hình X, Y theo hai cấu hình công khai cùng một mục. - Dữ liệu test: hai cấu hình công khai cùng một mục, cấu hình công khai có mục điểm thường và mục điểm đơn vị; quyền đọc DB local (chỉ SELECT/SHOW); tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm), tài khoản của trường B | Trigger/điểm quan sát: 1. SELECT `grade_publish_conf_id`, `year`, `evaluate_item_id`, `tangen_flg`, `red_score_display_type` của X, Y và của cấu hình cũ. 2. Mở cấu hình cũ trên màn, xem màn học sinh của cấu hình đó. 3. Sao chép X; SELECT dòng của bản sao. 4. Gửi request lưu với `red_score_display_type`=4, và với ID cấu hình công khai của trường B (tài khoản của trường B / trường B (trường khác)). | Oracle/bằng chứng: 1. X: 1 (ngoặc) ở dòng mục số nguyên (M=100); Y: 2 (`*` trước); dòng thường/đơn vị tách theo `tangen_flg`. Không có cột hiệu ứng trong bảng kết quả của học sinh. 2. Dòng cũ có giá trị 0; hiển thị giữ như trước khi có chức năng. 3. Bản sao có ID cấu hình mới và giữ giá trị 1; không có dòng kết quả học sinh nào được sao chép. 4. Bị từ chối; giá trị đã lưu không đổi.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 5 “Hiệu ứng theo cấu hình công khai” (`0=không có, 1=ngoặc, 2=* trước, 3=* sau`); `database-design.sql` (ALTER TABLE `grade_publish_conf_grade_items`); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 10.1 “Phạm vi và tùy chọn”; [context điểm đỏ](../../../CONTEXT.md) ([CTX](../../../CONTEXT.md) «context chuẩn điểm đỏ») mục 9.6 “Ba phản hồi review DB và bài học thiết kế ngày 28/09” (bằng chứng source: model đọc danh sách cột tường minh và controller xóa/chèn lại dòng, nên thêm cột thôi chưa đủ cho lưu/đọc lại)
- Bằng chứng cần chụp: Ảnh SELECT; ảnh màn của cấu hình cũ; request/response đã sửa (che token/cookie).
- Ghi chú: PROPOSED — tên cột và mã giá trị chờ review kỹ thuật. Nếu schema cuối khác, giữ kỳ vọng hành vi của case “Công khai: cùng mục dùng hiệu ứng đỏ khác nhau ở hai cấu hình công khai” và đổi câu SELECT.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-data-013"></a>

### TC-RS-DATA-013 — Phiên bản quy tắc, dòng điều khiển và thế hệ ô được cập nhật đúng sự kiện

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất”, mục 12.1 “Dữ liệu cấu hình và kết quả cần quản lý”

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-RULE-08 «Cặp cùng áp dụng: Ưu tiên 1: Toàn bộ, cố định 20 `<`», TD-STU-01 «S01: G-A, HR1», TD-STU-02 «S02: G-A, HR1», TD-ENV-03 «Truy cập DB: Kết nối MySQL local, chỉ dùng SELECT / SHOW FULL COLUMNS…», TC-RS-ERR-011, TC-RS-BR-019 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Build có migration v2. mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30) và cặp quy tắc cùng áp dụng (dưới 20 và dưới 30); S01 = 29 đã được xét (Đỏ); ô S02 chưa từng xét.
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), cặp quy tắc cùng áp dụng (dưới 20 và dưới 30); học sinh S01 (điểm 29), học sinh S02 (điểm 30); quyền đọc DB local (chỉ SELECT/SHOW)

**操作（Thao tác）**

1. SELECT `red_score_revision` của mục mục số nguyên (M=100) trên `grade_evaluate_frame_items`; SELECT `cell_generation`, `write_version`, `judged_version`, `rule_revision`, `judgment_status` của S01.
2. Lần lượt: thêm một quy tắc; sửa ngưỡng; đổi thứ tự; xóa quy tắc; xóa tới quy tắc cuối. SELECT `red_score_revision` và kết quả S01 sau mỗi thao tác (chưa chạy xét).
3. Lưu lại điểm S01 = 29; SELECT S01.
4. Khi một batch đã đặt chỗ S01 nhưng chưa hoàn tất, SELECT S01.
5. Lưu điểm S02 lần đầu; SELECT S02.
6. Xóa trống ô S01; SELECT S01.

**期待結果（Kết quả mong đợi）**

1. Có giá trị ban đầu; `judged_version` của S01 bằng phiên bản của lần ghi hoàn tất.
2. `red_score_revision` tăng sau mỗi thao tác (kể cả xóa quy tắc cuối); kết quả S01 không đổi (vẫn Đỏ).
3. `write_version` tăng; `judged_version` = `write_version` mới; `rule_revision` = `red_score_revision` hiện tại.
4. `write_version` đã tăng nhưng payload kết quả đã hoàn tất (Đỏ) vẫn còn; đầu ra vẫn đọc kết quả đó, không tự bỏ dấu vì phiên bản lệch.
5. Có đúng một dòng điều khiển; sau khi hoàn tất có trạng thái và `judged_at`.
6. `cell_generation` mới, `judgment_status`=4, thông tin quy tắc/ngưỡng/nguồn cũ bị xóa; dòng điều khiển được giữ.

**補足（Bổ sung）**
- Chức năng: Dữ liệu và persistence
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Build có migration v2. mục số nguyên (M=100) có quy tắc “Cố định 30” (dưới 30) và cặp quy tắc cùng áp dụng (dưới 20 và dưới 30); S01 = 29 đã được xét (Đỏ); ô S02 chưa từng xét. - Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), cặp quy tắc cùng áp dụng (dưới 20 và dưới 30); học sinh S01 (điểm 29), học sinh S02 (điểm 30); quyền đọc DB local (chỉ SELECT/SHOW) | Trigger/điểm quan sát: 1. SELECT `red_score_revision` của mục mục số nguyên (M=100) trên `grade_evaluate_frame_items`; SELECT `cell_generation`, `write_version`, `judged_version`, `rule_revision`, `judgment_status` của S01. 2. Lần lượt: thêm một quy tắc; sửa ngưỡng; đổi thứ tự; xóa quy tắc; xóa tới quy tắc cuối. SELECT `red_score_revision` và kết quả S01 sau mỗi thao tác (chưa chạy xét). 3. Lưu lại điểm S01 = 29; SELECT S01. 4. Khi một batch đã đặt chỗ S01 nhưng chưa hoàn tất, SELECT S01. 5. Lưu điểm S02 lần đầu; SELE | Oracle/bằng chứng: 1. Có giá trị ban đầu; `judged_version` của S01 bằng phiên bản của lần ghi hoàn tất. 2. `red_score_revision` tăng sau mỗi thao tác (kể cả xóa quy tắc cuối); kết quả S01 không đổi (vẫn Đỏ). 3. `write_version` tăng; `judged_version` = `write_version` mới; `rule_revision` = `red_score_revision` hiện tại. 4. `write_version` đã tăng nhưng payload kết quả đã hoàn tất (Đỏ) vẫn còn; đầu ra vẫn đọc kết quả đó, không tự bỏ dấu vì phiên bản lệch. 5. Có đúng một dòng điều khiển; sau khi hoàn tất có trạng th; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 2.2 “`red_score_results`”, mục 4.4 “Cập nhật và hiệu lực kết quả”, mục 6.1 “Dữ liệu điều khiển và dòng được khóa”–mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi”; `database-design.sql` (ALTER TABLE `grade_evaluate_frame_items`); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất”, mục 12.1 “Dữ liệu cấu hình và kết quả cần quản lý”; [context điểm đỏ](../../../CONTEXT.md) ([CTX](../../../CONTEXT.md) «context chuẩn điểm đỏ») mục 9.6 “Ba phản hồi review DB và bài học thiết kế ngày 28/09” (bài học 2–3: fingerprint giá trị bỏ sót đổi rồi trở lại; sửa/xóa rule vẫn giữ kết quả trước đến lần xét lại)
- Bằng chứng cần chụp: Ảnh SELECT sau mỗi bước (không lấy cột tên học sinh).
- Ghi chú: PROPOSED — cơ chế thế hệ/phiên bản/khóa chờ review kỹ thuật, chưa chạy thử hai kết nối (thiết kế DB v2 mục 6.4 “Phạm vi kết nối và ví dụ kiểm tra”). Hành vi bắt buộc (giữ kết quả khi chỉ sửa quy tắc; lượt cũ không ghi đè) được kiểm ở case “Lượt cũ hoàn tất muộn không ghi đè kết quả của điểm/cấu hình mới hơn”, case “Xóa quy tắc cuối: giữ kết quả tới lần chạy lại; chạy lại → Không áp dụng”. Bước 4 cần cách làm chậm job.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-001"></a>

### TC-RS-CALC-001 — Ngưỡng cố định 30: S = 29 / 30 / 31 với `<` và `≤`

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Biên so sánh và cảnh báo” (AC-G07 «Biên so sánh và cảnh báo»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-RULE-02 «Cố định `≤`: Như TD-RULE-01 nhưng Nhỏ hơn hoặc bằng（以下）», TD-STU-01 «S01: G-A, HR1», TD-STU-02 «S02: G-A, HR1», TD-STU-03 «S03: G-A, HR1» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) (M=100).
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), quy tắc cố định 30 với Nhỏ hơn hoặc bằng（以下）, học sinh S01 (điểm 29), học sinh S02 (điểm 30), học sinh S03 (điểm 31)

**操作（Thao tác）**

1. Chỉ có quy tắc “Cố định 30” (dưới 30) (`T=30`, `<`): đăng ký S01=29, S02=30, S03=31.
2. Đổi thành quy tắc cố định 30 với Nhỏ hơn hoặc bằng（以下） (`≤`), chạy lại.

**期待結果（Kết quả mong đợi）**

Bước 1: 29 Đỏ; 30 Không đỏ; 31 Không đỏ.

Bước 2: 29 Đỏ; 30 Đỏ; 31 Không đỏ.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) (M=100). - Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30), quy tắc cố định 30 với Nhỏ hơn hoặc bằng（以下）, học sinh S01 (điểm 29), học sinh S02 (điểm 30), học sinh S03 (điểm 31) | Trigger/điểm quan sát: 1. Chỉ có quy tắc “Cố định 30” (dưới 30) (`T=30`, `<`): đăng ký S01=29, S02=30, S03=31. 2. Đổi thành quy tắc cố định 30 với Nhỏ hơn hoặc bằng（以下） (`≤`), chạy lại. | Oracle/bằng chứng: Bước 1: 29 Đỏ; 30 Không đỏ; 31 Không đỏ. Bước 2: 29 Đỏ; 30 Đỏ; 31 Không đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Điểm bằng ngưỡng có bị xét đỏ không?” (Q4 «Điểm bằng ngưỡng có bị xét đỏ không?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.1 “Thành phần chung của màn ngưỡng” (bảng `S=30`, `T=30`), mục 6.2 “Ngưỡng cố định”
- Bằng chứng cần chụp: Ảnh kết quả hai bước.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-002"></a>

### TC-RS-CALC-002 — Điểm 0 với ngưỡng 0 và 30

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Biên so sánh và cảnh báo” (AC-G07 «Biên so sánh và cảnh báo»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-STU-04 «S04: G-A, HR1» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100).
- Dữ liệu test: mục số nguyên (M=100); học sinh S04 (điểm 0) (S=0); N = 0, 30

**操作（Thao tác）**

Với từng cấu hình: cố định 0 `<`, cố định 0 `≤`, cố định 30 `<`: chạy lại, xem S04.

**期待結果（Kết quả mong đợi）**

0 `<`: `0<0` sai → Không đỏ.

0 `≤`: `0≤0` → Đỏ.

30 `<`: `0<30` → Đỏ.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100). - Dữ liệu test: mục số nguyên (M=100); học sinh S04 (điểm 0) (S=0); N = 0, 30 | Trigger/điểm quan sát: Với từng cấu hình: cố định 0 `<`, cố định 0 `≤`, cố định 30 `<`: chạy lại, xem S04. | Oracle/bằng chứng: 0 `<`: `0<0` sai → Không đỏ. 0 `≤`: `0≤0` → Đỏ. 30 `<`: `0<30` → Đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 2.3 “Điểm được đưa vào xét” ("`0` hợp lệ là số"), mục 6.1 “Thành phần chung của màn ngưỡng”, mục 6.6 “Ngưỡng âm và cảnh báo biên”
- Bằng chứng cần chụp: Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](scope-and-approach.vi.md#conventions) mục 9 “Quy ước thực thi chung”） dòng S04 sau mỗi cấu hình (3 ảnh).
- Ghi chú: Cảnh báo `T=0` (VAL-019).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-003"></a>

### TC-RS-CALC-003 — Điểm thập phân sát ngưỡng

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11 «Giữ chính xác giá trị»)

<!-- Mã truy vết: TD-ITEM-02 «Mục số thập phân: Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số thập phân (M=100) (thập phân, M=100); cố định 30.
- Dữ liệu test: mục số thập phân (M=100); S = 29.5, 29.9, 30.0, 30.01

**操作（Thao tác）**

Đăng ký bốn học sinh với các điểm trên; xét với `<` rồi `≤`.

**期待結果（Kết quả mong đợi）**

`<`: 29.5 Đỏ; 29.9 Đỏ; 30.0 Không đỏ; 30.01 Không đỏ.

`≤`: 29.5 Đỏ; 29.9 Đỏ; 30.0 Đỏ; 30.01 Không đỏ.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số thập phân (M=100) (thập phân, M=100); cố định 30. - Dữ liệu test: mục số thập phân (M=100); S = 29.5, 29.9, 30.0, 30.01 | Trigger/điểm quan sát: Đăng ký bốn học sinh với các điểm trên; xét với `<` rồi `≤`. | Oracle/bằng chứng: `<`: 29.5 Đỏ; 29.9 Đỏ; 30.0 Không đỏ; 30.01 Không đỏ. `≤`: 29.5 Đỏ; 29.9 Đỏ; 30.0 Đỏ; 30.01 Không đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.1 “Thành phần chung của màn ngưỡng”, mục 6.8 “Yêu cầu độ chính xác” ("phép so sánh đúng tại `S=T`")
- Bằng chứng cần chụp: Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](scope-and-approach.vi.md#conventions) mục 9 “Quy ước thực thi chung”） bốn học sinh với `<` và với `≤` (2 ảnh).
- Ghi chú: Số chữ số thập phân nhập được theo cấu hình mục hiện hành.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-004"></a>

### TC-RS-CALC-004 — Ngưỡng cố định giữ `T=N` khi M đổi về sau

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Điểm cố định” (AC-G08 «Điểm cố định»)

<!-- Mã truy vết: TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc “Cố định 30” (dưới 30) (N=30) lưu khi M=100. Sau đó đổi Giá trị tối đa（最大値） của mục số nguyên (M=100) thành 20.
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30); S = 15, 20

**操作（Thao tác）**

1. Đăng ký hai học sinh S=15 và S=20.
2. Mở lại quy tắc.

**期待結果（Kết quả mong đợi）**

1. `T=30` → 15 Đỏ; 20 Đỏ. Không chuyển thành Chưa xét được; không tự đổi `T` thành 20 hoặc `M×30%`.
2. N vẫn hiển thị 30 (không bị tự sửa).

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: quy tắc “Cố định 30” (dưới 30) (N=30) lưu khi M=100. Sau đó đổi Giá trị tối đa（最大値） của mục số nguyên (M=100) thành 20. - Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30); S = 15, 20 | Trigger/điểm quan sát: 1. Đăng ký hai học sinh S=15 và S=20. 2. Mở lại quy tắc. | Oracle/bằng chứng: 1. `T=30` → 15 Đỏ; 20 Đỏ. Không chuyển thành Chưa xét được; không tự đổi `T` thành 20 hoặc `M×30%`. 2. N vẫn hiển thị 30 (không bị tự sửa).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Điểm bằng ngưỡng có bị xét đỏ không?” (Q4 «Điểm bằng ngưỡng có bị xét đỏ không?»), câu “Thay điểm tối đa thì xử lý thế nào?” (Q14 «Thay điểm tối đa thì xử lý thế nào?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.2 “Ngưỡng cố định” (đoạn cuối)
- Bằng chứng cần chụp: Ảnh kết quả, ảnh quy tắc.
- Sau khi chạy: Trả M về 100.
- Ghi chú: Nếu mở quy tắc và bấm Lưu lại, kiểm tra `0≤N≤M` sẽ chặn (VAL-003).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-005"></a>

### TC-RS-CALC-005 — Tỷ lệ 30% với M=100

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Tỷ lệ điểm tối đa” (AC-G10 «Tỷ lệ điểm tối đa»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-03 «Tỷ lệ: Tỷ lệ điểm tối đa（得点率） 30%, không xử lý phần lẻ（しない）, Nhỏ hơn（未満）», TD-STU-01 «S01: G-A, HR1», TD-STU-02 «S02: G-A, HR1», TD-STU-03 «S03: G-A, HR1» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) (M=100).
- Dữ liệu test: mục số nguyên (M=100); quy tắc tỷ lệ 30%; học sinh S01 (điểm 29), học sinh S02 (điểm 30), học sinh S03 (điểm 31)

**操作（Thao tác）**

Đăng ký 29, 30, 31; xét với `<` rồi `≤`.

**期待結果（Kết quả mong đợi）**

`T=100×30/100=30`.

`<`: 29 Đỏ; 30 Không đỏ; 31 Không đỏ.

`≤`: 29 Đỏ; 30 Đỏ; 31 Không đỏ.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) (M=100). - Dữ liệu test: mục số nguyên (M=100); quy tắc tỷ lệ 30%; học sinh S01 (điểm 29), học sinh S02 (điểm 30), học sinh S03 (điểm 31) | Trigger/điểm quan sát: Đăng ký 29, 30, 31; xét với `<` rồi `≤`. | Oracle/bằng chứng: `T=100×30/100=30`. `<`: 29 Đỏ; 30 Không đỏ; 31 Không đỏ. `≤`: 29 Đỏ; 30 Đỏ; 31 Không đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Những loại điểm nào thuộc đối tượng?” (Q2 «Những loại điểm nào thuộc đối tượng?»), câu “Khi xét tỷ lệ điểm, dùng điểm tối đa nào?” (Q23 «Khi xét tỷ lệ điểm, dùng điểm tối đa nào?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.3 “Tỷ lệ điểm tối đa”
- Bằng chứng cần chụp: Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](scope-and-approach.vi.md#conventions) mục 9 “Quy ước thực thi chung”） ba học sinh với `<` và với `≤` (2 ảnh).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-006"></a>

### TC-RS-CALC-006 — Tỷ lệ cho ngưỡng lẻ: M=45, N=30 → T=13.5

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Tỷ lệ điểm tối đa” (AC-G10 «Tỷ lệ điểm tối đa»)

<!-- Mã truy vết: TD-ITEM-02 «Mục số thập phân: Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc…», TD-RULE-03 «Tỷ lệ: Tỷ lệ điểm tối đa（得点率） 30%, không xử lý phần lẻ（しない）, Nhỏ hơn（未満）» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số thập phân (M=100) với Giá trị tối đa（最大値）= 45.
- Dữ liệu test: mục số thập phân (M=100); quy tắc tỷ lệ 30% (không xử lý phần lẻ); S = 13, 13.5, 14

**操作（Thao tác）**

Đăng ký ba điểm; xét với `<` rồi `≤`.

**期待結果（Kết quả mong đợi）**

`T=45×30/100=13.5`.

`<`: 13 Đỏ; 13.5 Không đỏ; 14 Không đỏ.

`≤`: 13 Đỏ; 13.5 Đỏ; 14 Không đỏ.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số thập phân (M=100) với Giá trị tối đa（最大値）= 45. - Dữ liệu test: mục số thập phân (M=100); quy tắc tỷ lệ 30% (không xử lý phần lẻ); S = 13, 13.5, 14 | Trigger/điểm quan sát: Đăng ký ba điểm; xét với `<` rồi `≤`. | Oracle/bằng chứng: `T=45×30/100=13.5`. `<`: 13 Đỏ; 13.5 Không đỏ; 14 Không đỏ. `≤`: 13 Đỏ; 13.5 Đỏ; 14 Không đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.3 “Tỷ lệ điểm tối đa” (`T_thô = M × N / 100`); [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Tỷ lệ điểm tối đa có cho chọn xử lý phần lẻ không?” (Q24 «Tỷ lệ điểm tối đa có cho chọn xử lý phần lẻ không?») (mặc định không xử lý)
- Bằng chứng cần chụp: Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](scope-and-approach.vi.md#conventions) mục 9 “Quy ước thực thi chung”） ba học sinh với `<` và với `≤` (2 ảnh).
- Sau khi chạy: Trả M về 100.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-007"></a>

### TC-RS-CALC-007 — Tỷ lệ có xử lý phần lẻ: xuống / gần nhất / lên tại p1

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Tỷ lệ điểm tối đa” (AC-G10 «Tỷ lệ điểm tối đa»)

<!-- Mã truy vết: TD-ITEM-02 «Mục số thập phân: Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số thập phân (M=100); tỷ lệ 30%, dấu `<`.
- Dữ liệu test: mục số thập phân (M=100); (a) M=45 → `T_thô=13.5`, S=13; (b) M=47 → `T_thô=14.1`, S=14

**操作（Thao tác）**

Với (a) và (b): xét với Không xử lý（しない）, xuống p1, gần nhất p1, lên p1.

**期待結果（Kết quả mong đợi）**

(a) Không xử lý `T=13.5` → Đỏ; xuống `T=13` → Không đỏ; gần nhất `T=14` → Đỏ; lên `T=14` → Đỏ.

(b) Không xử lý `T=14.1` → Đỏ; xuống `T=14` → Không đỏ; gần nhất `T=14` → Không đỏ; lên `T=15` → Đỏ.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số thập phân (M=100); tỷ lệ 30%, dấu `<`. - Dữ liệu test: mục số thập phân (M=100); (a) M=45 → `T_thô=13.5`, S=13; (b) M=47 → `T_thô=14.1`, S=14 | Trigger/điểm quan sát: Với (a) và (b): xét với Không xử lý（しない）, xuống p1, gần nhất p1, lên p1. | Oracle/bằng chứng: (a) Không xử lý `T=13.5` → Đỏ; xuống `T=13` → Không đỏ; gần nhất `T=14` → Đỏ; lên `T=14` → Đỏ. (b) Không xử lý `T=14.1` → Đỏ; xuống `T=14` → Không đỏ; gần nhất `T=14` → Không đỏ; lên `T=15` → Đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Tỷ lệ điểm tối đa có cho chọn xử lý phần lẻ không?” (Q24 «Tỷ lệ điểm tối đa có cho chọn xử lý phần lẻ không?») (chọn vị trí và phương thức như Thiết lập tính toán tự động（自動計算設定）); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.3 “Tỷ lệ điểm tối đa”, mục 6.5 “Xử lý phần lẻ”; CODE `AutoRating.php::calcDecimalPlace` :3896–3915
- Bằng chứng cần chụp: Ảnh cấu hình và kết quả từng biến thể.
- Sau khi chạy: Trả M về 100.
- Ghi chú: Giới hạn `p` và giá trị mặc định khi bật: VAL-007 (PROPOSED).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-008"></a>

### TC-RS-CALC-008 — Ví dụ đặc tả v2: M=75, N=30, S=22.2

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Tỷ lệ điểm tối đa” (AC-G10 «Tỷ lệ điểm tối đa»)

<!-- Mã truy vết: TD-ITEM-02 «Mục số thập phân: Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số thập phân (M=100) với M=75; tỷ lệ 30%, `<`.
- Dữ liệu test: mục số thập phân (M=100); S = 22.2

**操作（Thao tác）**

Xét với Không xử lý, rồi xuống p1.

**期待結果（Kết quả mong đợi）**

Không xử lý: `T=22.5` → Đỏ.

Xuống p1: `T=22` → Không đỏ.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số thập phân (M=100) với M=75; tỷ lệ 30%, `<`. - Dữ liệu test: mục số thập phân (M=100); S = 22.2 | Trigger/điểm quan sát: Xét với Không xử lý, rồi xuống p1. | Oracle/bằng chứng: Không xử lý: `T=22.5` → Đỏ. Xuống p1: `T=22` → Không đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.3 “Tỷ lệ điểm tối đa” (ví dụ `M=75`, `N=30`)
- Bằng chứng cần chụp: Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](scope-and-approach.vi.md#conventions) mục 9 “Quy ước thực thi chung”） ô S=22.2 sau mỗi cấu hình (2 ảnh).
- Sau khi chạy: Trả M về 100.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-009"></a>

### TC-RS-CALC-009 — Tỷ lệ biên N=0 và N=100

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Tỷ lệ điểm tối đa” (AC-G10 «Tỷ lệ điểm tối đa»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) (M=100).
- Dữ liệu test: mục số nguyên (M=100); N = 0: S = 0; N = 100: S = 99, 100

**操作（Thao tác）**

Xét từng cấu hình với `<` và `≤`.

**期待結果（Kết quả mong đợi）**

N=0 (`T=0`): S=0 `<` Không đỏ; `≤` Đỏ.

N=100 (`T=100`): S=99 `<` Đỏ; S=100 `<` Không đỏ; S=100 `≤` Đỏ.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) (M=100). - Dữ liệu test: mục số nguyên (M=100); N = 0: S = 0; N = 100: S = 99, 100 | Trigger/điểm quan sát: Xét từng cấu hình với `<` và `≤`. | Oracle/bằng chứng: N=0 (`T=0`): S=0 `<` Không đỏ; `≤` Đỏ. N=100 (`T=100`): S=99 `<` Đỏ; S=100 `<` Không đỏ; S=100 `≤` Đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.3 “Tỷ lệ điểm tối đa” ("kể cả hai biên"), mục 6.6 “Ngưỡng âm và cảnh báo biên”
- Bằng chứng cần chụp: Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](scope-and-approach.vi.md#conventions) mục 9 “Quy ước thực thi chung”） sau mỗi cấu hình N và dấu so sánh.
- Ghi chú: Cảnh báo biên: VAL-019.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-010"></a>

### TC-RS-CALC-010 — Tỷ lệ với M = 0, M < 0 hoặc không xác định → Chưa xét được; cố định vẫn xét

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Tỷ lệ điểm tối đa” (AC-G10 «Tỷ lệ điểm tối đa»)

<!-- Mã truy vết: TD-ITEM-08 «M không hợp lệ: Mục số có M hiệu lực = 0 (nếu cấu hình được) hoặc không…», TD-RULE-03 «Tỷ lệ: Tỷ lệ điểm tối đa（得点率） 30%, không xử lý phần lẻ（しない）, Nhỏ hơn（未満）», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục có M không hợp lệ (M không hợp lệ). Ô trước đó Đỏ theo quy tắc khác.
- Dữ liệu test: mục có M không hợp lệ; quy tắc tỷ lệ 30%; quy tắc “Cố định 30” (dưới 30); S = 0

**操作（Thao tác）**

1. Chỉ có quy tắc tỷ lệ 30% (30%): chạy lại với M=0, M=−10, M không xác định.
2. Chỉ có quy tắc “Cố định 30” (dưới 30) (cố định 30) trên cùng mục, M=0: chạy lại.

**期待結果（Kết quả mong đợi）**

1. Cả ba: Chưa xét được; ngừng kết quả cũ; không dùng M=100.
2. `T=30`, `0<30` → Đỏ (không bỏ xét cố định vì M không dương).

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục có M không hợp lệ (M không hợp lệ). Ô trước đó Đỏ theo quy tắc khác. - Dữ liệu test: mục có M không hợp lệ; quy tắc tỷ lệ 30%; quy tắc “Cố định 30” (dưới 30); S = 0 | Trigger/điểm quan sát: 1. Chỉ có quy tắc tỷ lệ 30% (30%): chạy lại với M=0, M=−10, M không xác định. 2. Chỉ có quy tắc “Cố định 30” (dưới 30) (cố định 30) trên cùng mục, M=0: chạy lại. | Oracle/bằng chứng: 1. Cả ba: Chưa xét được; ngừng kết quả cũ; không dùng M=100. 2. `T=30`, `0<30` → Đỏ (không bỏ xét cố định vì M không dương).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.2 “Ngưỡng cố định” (đoạn cuối), mục 6.3 “Tỷ lệ điểm tối đa” ("`M=0`, `M<0`… không thay bằng 100"), mục 8.3 “Không tạo được ngưỡng hợp lệ”
- Bằng chứng cần chụp: Ảnh kết quả. SELECT `reason_code` (khi có schema; đề xuất `maximum_invalid` — thiết kế DB v2 mục 4.3 “Trạng thái kết quả”, PROPOSED).
- Ghi chú: Cách tạo dữ liệu M không hợp lệ: hỏi team dev khi chuẩn bị.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-011"></a>

### TC-RS-CALC-011 — Phân giải M: mặc định → đơn vị → lựa chọn lớp

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Điểm tối đa hiện hành” (AC-G09 «Điểm tối đa hiện hành»)

<!-- Mã truy vết: TD-ITEM-03 «Mục điểm đơn vị: Điểm bài kiểm tra đơn vị（単元テスト点）, M mặc định 100», AC-G09, SI-02 «Phân giải M», SI-14 «Phân giải M ở CSV HR» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục điểm đơn vị (đơn vị U1 có M riêng 40): mặc định 100; U1 riêng 40; lựa chọn lớp ghi đè 50 áp dụng cho G-A. Tỷ lệ 30%, `<`.
- Dữ liệu test: mục điểm đơn vị (đơn vị U1 có M riêng 40); S01 (G-A) U1=14; S06 (G-B) U1=14, U2=29

**操作（Thao tác）**

1. Đăng ký các điểm, xem kết quả.
2. Tạo thêm một định nghĩa lựa chọn M=20 ở Thiết lập điểm tối đa（満点設定） nhưng không gán cho G-B; đăng ký lại S06 U1.
3. Chuẩn bị G-B sao cho điểm cao nhất thực tế của U2 là 80 và nhóm tổng hợp chứa lớp có M khác (tổng điểm tối đa nhóm khác 100); đăng ký lại S06 U2 = 29.

**期待結果（Kết quả mong đợi）**

1. S01 U1: `M=50`, `T=15` → Đỏ. S06 U1: `M=40`, `T=12` → Không đỏ. S06 U2: `M=100`, `T=30` → Đỏ.
2. S06 U1 vẫn dùng `M=40` → Không đỏ.
3. S06 U2 vẫn dùng `M=100`, `T=30` → Đỏ; không dùng điểm cao nhất thực tế (80 → `T=24`, Không đỏ — sai) hay tổng điểm tối đa nhóm.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục điểm đơn vị (đơn vị U1 có M riêng 40): mặc định 100; U1 riêng 40; lựa chọn lớp ghi đè 50 áp dụng cho G-A. Tỷ lệ 30%, `<`. - Dữ liệu test: mục điểm đơn vị (đơn vị U1 có M riêng 40); S01 (G-A) U1=14; S06 (G-B) U1=14, U2=29 | Trigger/điểm quan sát: 1. Đăng ký các điểm, xem kết quả. 2. Tạo thêm một định nghĩa lựa chọn M=20 ở Thiết lập điểm tối đa（満点設定） nhưng không gán cho G-B; đăng ký lại S06 U1. 3. Chuẩn bị G-B sao cho điểm cao nhất thực tế của U2 là 80 và nhóm tổng hợp chứa lớp có M khác (tổng điểm tối đa nhóm khác 100); đăng ký lại S06 U2 = 29. | Oracle/bằng chứng: 1. S01 U1: `M=50`, `T=15` → Đỏ. S06 U1: `M=40`, `T=12` → Không đỏ. S06 U2: `M=100`, `T=30` → Đỏ. 2. S06 U1 vẫn dùng `M=40` → Không đỏ. 3. S06 U2 vẫn dùng `M=100`, `T=30` → Đỏ; không dùng điểm cao nhất thực tế (80 → `T=24`, Không đỏ — sai) hay tổng điểm tối đa nhóm.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 2.4 “Phân giải điểm tối đa” (ví dụ 100 → 40 → 50); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Điểm tối đa hiện hành” (AC-G09 «Điểm tối đa hiện hành») ("Không thay bằng … điểm cao nhất thực tế, tổng điểm tối đa nhóm"); [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Khi xét tỷ lệ điểm, dùng điểm tối đa nào?” (Q23 «Khi xét tỷ lệ điểm, dùng điểm tối đa nào?»); code hiện tại “Phân giải điểm tối đa hiện hành không thống nhất giữa các đường…”; khác biệt đặc tả–code về “Phân giải M” (SI-02 «Phân giải M»), khác biệt đặc tả–code về “Phân giải M ở CSV HR (đường ghi điểm HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV))” (SI-14 «Phân giải M ở CSV HR»)
- Bằng chứng cần chụp: Ảnh cấu hình M; ảnh kết quả.
- Ghi chú: Mã lựa chọn `1`/`2` không phải M=1/2 (đặc tả v2 mục 2.4 “Phân giải điểm tối đa”). Không dùng điểm cao nhất thực tế hoặc 100 thay cho M cá nhân.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-012"></a>

### TC-RS-CALC-012 — Tỷ lệ dùng M hiện hành, không dùng M của bản tổng hợp đã chốt

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Điểm tối đa hiện hành” (AC-G09 «Điểm tối đa hiện hành»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-03 «Tỷ lệ: Tỷ lệ điểm tối đa（得点率） 30%, không xử lý phần lẻ（しない）, Nhỏ hơn（未満）», TD-SRC-01 «Bản đã chốt: Snapshot của nguồn mặc định, `A` thô = 49.99…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Có bản chốt (dummy) tạo khi M=100. Sau đó M hiện hành của mục số nguyên (M=100) đổi thành 50.
- Dữ liệu test: mục số nguyên (M=100); quy tắc tỷ lệ 30%; S = 20; bản tổng hợp đã chốt (trung bình 49.99)

**操作（Thao tác）**

Đăng ký S=20, xem kết quả.

**期待結果（Kết quả mong đợi）**

`T=50×30/100=15` → `20<15` sai → Không đỏ. (Nếu dùng M=100 của bản chốt: `T=30` → Đỏ — sai.)

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Có bản chốt (dummy) tạo khi M=100. Sau đó M hiện hành của mục số nguyên (M=100) đổi thành 50. - Dữ liệu test: mục số nguyên (M=100); quy tắc tỷ lệ 30%; S = 20; bản tổng hợp đã chốt (trung bình 49.99) | Trigger/điểm quan sát: Đăng ký S=20, xem kết quả. | Oracle/bằng chứng: `T=50×30/100=15` → `20<15` sai → Không đỏ. (Nếu dùng M=100 của bản chốt: `T=30` → Đỏ — sai.); ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Khi xét tỷ lệ điểm, dùng điểm tối đa nào?” (Q23 «Khi xét tỷ lệ điểm, dùng điểm tối đa nào?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 2.4 “Phân giải điểm tối đa” (đoạn cuối), mục 6.3 “Tỷ lệ điểm tối đa” (ví dụ `M=100`→`50`, `S=20`)
- Bằng chứng cần chụp: Ảnh M hiện hành, kết quả.
- Sau khi chạy: Trả M về 100.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-013"></a>

### TC-RS-CALC-013 — Công thức một dòng với A=50

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16 «Công thức theo dòng và phần lẻ»)

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Nguồn có `A=50`; dấu `<`.
- Dữ liệu test: Công thức: (a) `A×0.5`; (b) `A−20`; (c) `A+5`; S = 24, 25, 29, 30, 54, 55

**操作（Thao tác）**

Với từng công thức, chạy nút cam, xem kết quả.

**期待結果（Kết quả mong đợi）**

(a) `T=25`: 24 Đỏ; 25 Không đỏ.

(b) `T=30`: 29 Đỏ; 30 Không đỏ.

(c) `T=55`: 54 Đỏ; 55 Không đỏ.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Nguồn có `A=50`; dấu `<`. - Dữ liệu test: Công thức: (a) `A×0.5`; (b) `A−20`; (c) `A+5`; S = 24, 25, 29, 30, 54, 55 | Trigger/điểm quan sát: Với từng công thức, chạy nút cam, xem kết quả. | Oracle/bằng chứng: (a) `T=25`: 24 Đỏ; 25 Không đỏ. (b) `T=30`: 29 Đỏ; 30 Không đỏ. (c) `T=55`: 54 Đỏ; 55 Không đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Ngưỡng dùng trung bình có chỉ gồm hai công thức cố định không?” (Q6 «Ngưỡng dùng trung bình có chỉ gồm hai công thức cố định không?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.4 “Công thức dùng trung bình” (bảng nhu cầu)
- Bằng chứng cần chụp: Ảnh cấu hình, nguồn (dummy), kết quả.
- Ghi chú: Phạm vi phát hành công thức chưa chốt (đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-014"></a>

### TC-RS-CALC-014 — Làm tròn theo từng dòng: A=49.7

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16 «Công thức theo dòng và phần lẻ»)

<!-- Mã truy vết: AC-G16 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Nguồn `A=49.7`; dòng 1 `A÷2`; dòng 2 `Kết quả dòng 1 × 0.8`; `<`.
- Dữ liệu test: S = 19.1 và S = 19.2

**操作（Thao tác）**

1. Lưu đúng cấu hình: dòng 1 bật xử lý phần lẻ, vị trí 1, làm tròn xuống; dòng 2 không xử lý.
2. Chạy xét với `S=19.1` và `S=19.2`.

**期待結果（Kết quả mong đợi）**

1. `24.85→24`; `T=24×0.8=19.2`.
2. Với dấu `<`: `S=19.1` Đỏ và `S=19.2` Không đỏ.
3. Không làm tròn dòng 2 thành `19`.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Nguồn `A=49.7`; dòng 1 `A÷2`; dòng 2 `Kết quả dòng 1 × 0.8`; `<`. - Dữ liệu test: S = 19.1 và S = 19.2 | Trigger/điểm quan sát: 1. Lưu đúng cấu hình: dòng 1 bật xử lý phần lẻ, vị trí 1, làm tròn xuống; dòng 2 không xử lý. 2. Chạy xét với `S=19.1` và `S=19.2`. | Oracle/bằng chứng: 1. `24.85→24`; `T=24×0.8=19.2`. 2. Với dấu `<`: `S=19.1` Đỏ và `S=19.2` Không đỏ. 3. Không làm tròn dòng 2 thành `19`.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.5 “Xử lý phần lẻ” (ví dụ `A=49.7`); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16 «Công thức theo dòng và phần lẻ»); [xác nhận thiết kế ngày 30/09](../../../sources/2026-09-30-design-review-confirmation.vi.md) (Q37: dòng 1 cắt xuống, dòng 2 không xử lý; `T=19.2`, `S=19.1` với `<` là đỏ).
- Bằng chứng cần chụp: Ảnh cấu hình, kết quả.
- Ghi chú: Là ví dụ của tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ”. Chỉ chạy khi công thức nhiều dòng thuộc đợt phát hành (phạm vi phát hành chưa chốt — đặc tả v2 mục 13.1); ngoài đợt thì SKIPPED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-015"></a>

### TC-RS-CALC-015 — Công thức hai dòng theo Figma: (A÷2)×0.8, dòng 1 làm tròn xuống

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16 «Công thức theo dòng và phần lẻ»)

<!-- Mã truy vết: TD-RULE-06 «Công thức hai dòng: Dòng 1: Trung bình（平均点）÷ Số cố định（固定値）2, chữ số…», AC-G16 -->

**前提条件（Điều kiện trước）**

- Điều kiện: giáo viên có quyền sửa thiết lập; mục G-B có `M (điểm tối đa)=100`; kỳ kiểm tra có nguồn trung bình `A=61`; chưa có kết quả đỏ cũ.
- Dữ liệu test: S01 có `S (điểm học sinh)=23.9`, S09 có `S=24`, S10 có `S=24.4`; quy tắc hai dòng `(A÷2)×0.8`.

**操作（Thao tác）**

1. Tạo dòng 1 `A÷2`, chọn cách xử lý phần lẻ sau dòng 1; dòng 2 `kết quả dòng trước×0.8`.
2. Lưu và chạy nút cam cho G-B, rồi chạy hai biến thể dấu `<` và `≤`.
3. Mở lại cấu hình và đối chiếu kết quả của S01, S09, S10.

**期待結果（Kết quả mong đợi）**

Dòng 1 `61÷2=30.5`; dòng 2 dùng đúng quy tắc phần lẻ đã chọn và phải hiển thị được giá trị trung gian, không tự ý đổi sang cách tính khác. Với oracle `T=24.4`: dấu `<` làm S01 và S09 đỏ, S10 không đỏ; dấu `≤` làm S10 đỏ. Nếu thiết kế chọn làm tròn xuống thành `T=24.0`, expected phải đổi tương ứng và được ghi rõ trong evidence.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: giáo viên có quyền sửa thiết lập; mục G-B có `M (điểm tối đa)=100`; kỳ kiểm tra có nguồn trung bình `A=61`; chưa có kết quả đỏ cũ. - Dữ liệu test: S01 có `S (điểm học sinh)=23.9`, S09 có `S=24`, S10 có `S=24.4`; quy tắc hai dòng `(A÷2)×0.8`. | Trigger/điểm quan sát: 1. Tạo dòng 1 `A÷2`, chọn cách xử lý phần lẻ sau dòng 1; dòng 2 `kết quả dòng trước×0.8`. 2. Lưu và chạy nút cam cho G-B, rồi chạy hai biến thể dấu `<` và `≤`. 3. Mở lại cấu hình và đối chiếu kết quả của S01, S09, S10. | Oracle/bằng chứng: Dòng 1 `61÷2=30.5`; dòng 2 dùng đúng quy tắc phần lẻ đã chọn và phải hiển thị được giá trị trung gian, không tự ý đổi sang cách tính khác. Với oracle `T=24.4`: dấu `<` làm S01 và S09 đỏ, S10 không đỏ; dấu `≤` làm S10 đỏ. Nếu thiết kế chọn làm tròn xuống thành `T=24.0`, expected phải đổi tương ứng và được ghi rõ trong evidence.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: Figma MW “màn Ngưỡng – công thức” (58:8389 «Figma MW: màn Ngưỡng – công thức») (UI 04C «Figma: màn Ngưỡng – công thức — MW 58:8389», công thức hai dòng); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.4 “Công thức dùng trung bình”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16 «Công thức theo dòng và phần lẻ») ("Tham chiếu dòng trước nhận giá trị sau phần lẻ, dòng cuối tạo `T`")
- Bằng chứng cần chụp: Ảnh cấu hình, kết quả.
- Ghi chú: Tham chiếu dòng trước là tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ”; danh sách toán hạng đầy đủ vẫn theo phạm vi đợt (đề xuất thiết kế chờ review — đặc tả v2 mục 13.1). Chỉ chạy khi công thức nhiều dòng thuộc đợt phát hành (phạm vi phát hành chưa chốt — đặc tả v2 mục 13.1); ngoài đợt thì SKIPPED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-016"></a>

### TC-RS-CALC-016 — Ngưỡng âm: A=15, A−20 → T=−5

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Ngưỡng âm” (AC-G18 «Ngưỡng âm»)

<!-- Mã truy vết: TD-RULE-10 «Công thức âm: Dòng 1: Trung bình（平均点）− 20», TD-ITEM-09 «Mục cho phép điểm âm: Mục số có miền điểm cho phép số âm…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc công thức trung bình − 20; nguồn `A=15`. Biến thể (b) cần mục cho phép điểm âm.
- Dữ liệu test: quy tắc công thức trung bình − 20; (a) Mục thường: S = 0; (b) mục cho phép điểm âm: S = −6, −5

**操作（Thao tác）**

(a) Xét S=0 với `<` và `≤`.

(b) Xét −6, −5 với `<` và `≤`.

**期待結果（Kết quả mong đợi）**

(a) `T=−5`: `<` Không đỏ; `≤` Không đỏ (nếu hệ thống ép `T` về 0 thì `≤` sẽ Đỏ — sai).

(b) `<`: −6 Đỏ; −5 Không đỏ. `≤`: −6 Đỏ; −5 Đỏ.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: quy tắc công thức trung bình − 20; nguồn `A=15`. Biến thể (b) cần mục cho phép điểm âm. - Dữ liệu test: quy tắc công thức trung bình − 20; (a) Mục thường: S = 0; (b) mục cho phép điểm âm: S = −6, −5 | Trigger/điểm quan sát: (a) Xét S=0 với `<` và `≤`. (b) Xét −6, −5 với `<` và `≤`. | Oracle/bằng chứng: (a) `T=−5`: `<` Không đỏ; `≤` Không đỏ (nếu hệ thống ép `T` về 0 thì `≤` sẽ Đỏ — sai). (b) `<`: −6 Đỏ; −5 Không đỏ. `≤`: −6 Đỏ; −5 Đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Công thức cho ngưỡng âm thì xử lý thế nào?” (Q25 «Công thức cho ngưỡng âm thì xử lý thế nào?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.6 “Ngưỡng âm và cảnh báo biên”
- Bằng chứng cần chụp: Ảnh nguồn `A=15`; Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](scope-and-approach.vi.md#conventions) mục 9 “Quy ước thực thi chung”） các ô (a), (b) với `<` và với `≤`.
- Ghi chú: (b) phụ thuộc cách tạo dữ liệu đặc biệt (hỏi team dev khi chuẩn bị).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-017"></a>

### TC-RS-CALC-017 — Ngưỡng công thức vượt M vẫn hợp lệ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16 «Công thức theo dòng và phần lẻ»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Nguồn `A=80`; công thức `A×1.5`; mục số nguyên (M=100) (M=100).
- Dữ liệu test: mục số nguyên (M=100); S = 100

**操作（Thao tác）**

Chạy nút cam; xem kết quả.

**期待結果（Kết quả mong đợi）**

`T=120`; `100<120` → Đỏ. Không bị Chưa xét được, không ép `T` về 100.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Nguồn `A=80`; công thức `A×1.5`; mục số nguyên (M=100) (M=100). - Dữ liệu test: mục số nguyên (M=100); S = 100 | Trigger/điểm quan sát: Chạy nút cam; xem kết quả. | Oracle/bằng chứng: `T=120`; `100<120` → Đỏ. Không bị Chưa xét được, không ép `T` về 100.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.6 “Ngưỡng âm và cảnh báo biên” (đoạn cuối: "ngưỡng công thức vượt maximum không tự trở thành lỗi")
- Bằng chứng cần chụp: Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](scope-and-approach.vi.md#conventions) mục 9 “Quy ước thực thi chung”） ô S=100; ảnh SELECT `judgment_context` có ngưỡng 120 (khi có schema).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-018"></a>

### TC-RS-CALC-018 — Công thức A−0 cho ngưỡng bằng A

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Biên so sánh và cảnh báo” (AC-G07 «Biên so sánh và cảnh báo»)

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Nguồn `A=50`; công thức `A−0`, `<`.
- Dữ liệu test: S = 49, 50

**操作（Thao tác）**

1. Lưu công thức (quan sát cảnh báo).
2. Chạy nút cam.

**期待結果（Kết quả mong đợi）**

1. Có cảnh báo giúp hiểu ngưỡng là A (câu chữ TBD), vẫn lưu được.
2. `T=50`: 49 Đỏ; 50 Không đỏ.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Nguồn `A=50`; công thức `A−0`, `<`. - Dữ liệu test: S = 49, 50 | Trigger/điểm quan sát: 1. Lưu công thức (quan sát cảnh báo). 2. Chạy nút cam. | Oracle/bằng chứng: 1. Có cảnh báo giúp hiểu ngưỡng là A (câu chữ TBD), vẫn lưu được. 2. `T=50`: 49 Đỏ; 50 Không đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.6 “Ngưỡng âm và cảnh báo biên” (bảng cảnh báo: "Công thức `A−0`: ngưỡng là `A`, không phải 0")
- Bằng chứng cần chụp: Ảnh cảnh báo, kết quả.
- Ghi chú: Câu chữ cảnh báo: chưa chốt.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-019"></a>

### TC-RS-CALC-019 — Định nghĩa phương thức làm tròn, số âm và p=9

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16 «Công thức theo dòng và phần lẻ»)

<!-- Mã truy vết: TD-ENV-04 «Nguồn snapshot: Dummy data cho bản tổng hợp đã chốt (R18 §5.5) cho tới…», TC-RS-DATA-008, TD-ITEM-09 «Mục cho phép điểm âm: Mục số có miền điểm cho phép số âm…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Dùng công thức một dòng `A+0` hoặc `A×1` để đưa giá trị vào bước làm tròn (nguồn dummy có `A` bằng giá trị cần thử).
- Dữ liệu test: Bảng ở Expected Result

**操作（Thao tác）**

1. Với từng dòng của Expected Result: đặt `A` (nguồn dummy, dữ liệu giả cho bản tổng hợp đã chốt), chọn xử lý phần lẻ.
2. Chạy lại (nút cam).
3. Đọc `T` qua thông tin giải thích (case “Lưu thông tin giải thích kết quả”) hoặc qua kết quả xét với S sát ngưỡng.

**期待結果（Kết quả mong đợi）**

29.7 không xử lý → 29.7.

29.7 xuống p1 → 29.

29.75 gần nhất p2 → 29.8.

−5.2 lên p1 → −5.

−5.2 xuống p1 → −6.

−5.5 gần nhất p1 → −6.

12.5 gần nhất p1 → 13; −12.5 gần nhất p1 → −13; −12.5 lên p1 → −12; −12.5 xuống p1 → −13.

12.345 gần nhất p2 → 12.3; lên p2 → 12.4.

2.675 gần nhất p3 → 2.68.

1.123456789 gần nhất p9 → 1.12345679; xuống p9 → 1.12345678.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Dùng công thức một dòng `A+0` hoặc `A×1` để đưa giá trị vào bước làm tròn (nguồn dummy có `A` bằng giá trị cần thử). - Dữ liệu test: Bảng ở Expected Result | Trigger/điểm quan sát: 1. Với từng dòng của Expected Result: đặt `A` (nguồn dummy, dữ liệu giả cho bản tổng hợp đã chốt), chọn xử lý phần lẻ. 2. Chạy lại (nút cam). 3. Đọc `T` qua thông tin giải thích (case “Lưu thông tin giải thích kết quả”) hoặc qua kết quả xét với S sát ngưỡng. | Oracle/bằng chứng: 29.7 không xử lý → 29.7. 29.7 xuống p1 → 29. 29.75 gần nhất p2 → 29.8. −5.2 lên p1 → −5. −5.2 xuống p1 → −6. −5.5 gần nhất p1 → −6. 12.5 gần nhất p1 → 13; −12.5 gần nhất p1 → −13; −12.5 lên p1 → −12; −12.5 xuống p1 → −13. 12.345 gần nhất p2 → 12.3; lên p2 → 12.4. 2.675 gần nhất p3 → 2.68. 1.123456789 gần nhất p9 → 1.12345679; xuống p9 → 1.12345678.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.5 “Xử lý phần lẻ” (bảng ví dụ, định nghĩa gần nhất = nửa đơn vị ra xa 0, lên = `ceil`, xuống = `floor`); CODE `AutoRating.php::calcDecimalPlace` :3896–3915
- Bằng chứng cần chụp: Bảng thực tế đối chiếu từng dòng.
- Ghi chú: PROPOSED. 2.675 kiểm việc tránh sai số nhị phân (đặc tả v2 mục 6.8 “Yêu cầu độ chính xác”). Giá trị âm cần mục cho phép điểm âm nếu kiểm qua kết quả xét.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-020"></a>

### TC-RS-CALC-020 — Làm tròn ngưỡng, không làm tròn điểm học sinh

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16 «Công thức theo dòng và phần lẻ»)

<!-- Mã truy vết: TD-ITEM-02 «Mục số thập phân: Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số thập phân (M=100) với M=99; tỷ lệ 30% (`T_thô=29.7`), `<`.
- Dữ liệu test: mục số thập phân (M=100); S = 29.5

**操作（Thao tác）**

(a) Xuống p1.

(b) Gần nhất p1.

**期待結果（Kết quả mong đợi）**

(a) `T=29`; `29.5<29` sai → Không đỏ. (Nếu làm tròn S thành 29 và giữ `T=29.7` → Đỏ — sai.)

(b) `T=30`; `29.5<30` → Đỏ. (Nếu làm tròn S thành 30 → Không đỏ — sai.)

Điểm lưu vẫn 29.5.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số thập phân (M=100) với M=99; tỷ lệ 30% (`T_thô=29.7`), `<`. - Dữ liệu test: mục số thập phân (M=100); S = 29.5 | Trigger/điểm quan sát: (a) Xuống p1. (b) Gần nhất p1. | Oracle/bằng chứng: (a) `T=29`; `29.5<29` sai → Không đỏ. (Nếu làm tròn S thành 29 và giữ `T=29.7` → Đỏ — sai.) (b) `T=30`; `29.5<30` → Đỏ. (Nếu làm tròn S thành 30 → Không đỏ — sai.) Điểm lưu vẫn 29.5.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Tỷ lệ điểm tối đa có cho chọn xử lý phần lẻ không?” (Q24 «Tỷ lệ điểm tối đa có cho chọn xử lý phần lẻ không?») ("Không cắt/làm tròn điểm của học sinh thay cho ngưỡng"); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.5 “Xử lý phần lẻ” (đoạn cuối)
- Bằng chứng cần chụp: Ảnh kết quả, điểm.
- Sau khi chạy: Trả M về 100.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-021"></a>

### TC-RS-CALC-021 — Chia 0 phát sinh khi chạy → Chưa xét được

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 6.4 “Công thức dùng trung bình”, mục 8.3 “Không tạo được ngưỡng hợp lệ”

<!-- Mã truy vết: TD-RULE-11 «Chia cho trung bình: Dòng 1: Số cố định（固定値）100 ÷ Trung bình（平均点）», TD-ITEM-02 «Mục số thập phân: Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc…», TD-SRC-08 «Trung bình bằng 0: Mọi học sinh trong nhóm có 0 điểm → `A=0`» -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc công thức 100 ÷ trung bình (`100÷A`), `<`, mục số thập phân (M=100).
- Dữ liệu test: mục số thập phân (M=100), quy tắc công thức 100 ÷ trung bình; (a) nhóm có trung bình 0 `A=0`; (b) `A=4`, S = 24; (c) `A=3`, S = 33.33, 33.34

**操作（Thao tác）**

Chạy nút cam cho từng nguồn.

**期待結果（Kết quả mong đợi）**

(a) Chưa xét được; không dùng ưu tiên thấp hơn.

(b) `T=25` → 24 Đỏ.

(c) `T=33.333…` → 33.33 Đỏ; 33.34 Không đỏ.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: quy tắc công thức 100 ÷ trung bình (`100÷A`), `<`, mục số thập phân (M=100). - Dữ liệu test: mục số thập phân (M=100), quy tắc công thức 100 ÷ trung bình; (a) nhóm có trung bình 0 `A=0`; (b) `A=4`, S = 24; (c) `A=3`, S = 33.33, 33.34 | Trigger/điểm quan sát: Chạy nút cam cho từng nguồn. | Oracle/bằng chứng: (a) Chưa xét được; không dùng ưu tiên thấp hơn. (b) `T=25` → 24 Đỏ. (c) `T=33.333…` → 33.33 Đỏ; 33.34 Không đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.4 “Công thức dùng trung bình” (đoạn cuối), mục 8.3 “Không tạo được ngưỡng hợp lệ”; CODE `AutoRating.php::getformulas` :2834–2837 (trả NULL khi chia 0)
- Bằng chứng cần chụp: Ảnh kết quả. SELECT `reason_code` (khi có schema; đề xuất `division_by_zero` — thiết kế DB v2 mục 4.3 “Trạng thái kết quả”, PROPOSED).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-022"></a>

### TC-RS-CALC-022 — Phân nhánh theo trung bình: A = 40 / 50 / 49.99 (dùng A trước làm tròn)

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14 «Giá trị thô từ cùng tập dữ liệu»)

<!-- Mã truy vết: TD-ITEM-02 «Mục số thập phân: Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc…», TD-SRC-01 «Bản đã chốt: Snapshot của nguồn mặc định, `A` thô = 49.99…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Ưu tiên 1: `A≥50` → cố định 30 `<`. Ưu tiên 2: `A<50` → `A×0.5` `<`. mục số thập phân (M=100).
- Dữ liệu test: mục số thập phân (M=100); Nguồn `A=40`, `A=50`, `A=49.99` (bản tổng hợp đã chốt (trung bình 49.99), màn tổng hợp hiện 50.0); S = 19, 20, 24.99, 25, 29, 30

**操作（Thao tác）**

1. Với từng nguồn, chạy nút cam, xem kết quả.
2. Với `A=49.99`: bật gần nhất p1 cho dòng `A×0.5`, chạy lại.

**期待結果（Kết quả mong đợi）**

`A=40` → ưu tiên 2, `T=20`: 19 Đỏ; 20 Không đỏ.

`A=50` → ưu tiên 1, `T=30`: 29 Đỏ; 30 Không đỏ.

`A=49.99` → ưu tiên 2, `T=24.995`: 24.99 Đỏ; 25 Không đỏ; 29 Không đỏ (nếu dùng 50 thì 29 Đỏ — sai).

Bước 2: `T=25`, vẫn ưu tiên 2: 24.99 Đỏ; 29 Không đỏ.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Ưu tiên 1: `A≥50` → cố định 30 `<`. Ưu tiên 2: `A<50` → `A×0.5` `<`. mục số thập phân (M=100). - Dữ liệu test: mục số thập phân (M=100); Nguồn `A=40`, `A=50`, `A=49.99` (bản tổng hợp đã chốt (trung bình 49.99), màn tổng hợp hiện 50.0); S = 19, 20, 24.99, 25, 29, 30 | Trigger/điểm quan sát: 1. Với từng nguồn, chạy nút cam, xem kết quả. 2. Với `A=49.99`: bật gần nhất p1 cho dòng `A×0.5`, chạy lại. | Oracle/bằng chứng: `A=40` → ưu tiên 2, `T=20`: 19 Đỏ; 20 Không đỏ. `A=50` → ưu tiên 1, `T=30`: 29 Đỏ; 30 Không đỏ. `A=49.99` → ưu tiên 2, `T=24.995`: 24.99 Đỏ; 25 Không đỏ; 29 Không đỏ (nếu dùng 50 thì 29 Đỏ — sai). Bước 2: `T=25`, vẫn ưu tiên 2: 24.99 Đỏ; 29 Không đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Trung bình dùng để chọn nhánh là trước hay sau làm tròn?” (Q8 «Trung bình dùng để chọn nhánh là trước hay sau làm tròn?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.2 “Điều kiện dựa trên trung bình” ("49.99 phải đi vào nhánh `<50`")
- Bằng chứng cần chụp: Ảnh nguồn (dummy), kết quả.
- Ghi chú: Dạng hai dòng `A×50÷100` (ví dụ trao đổi ban đầu) cần Kết quả phép tính（式の結果） (PROPOSED); kết quả tương đương.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-023"></a>

### TC-RS-CALC-023 — Biên nhánh A=60.00 và A=59.96

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14 «Giá trị thô từ cùng tập dữ liệu»)

<!-- Mã truy vết: TD-ITEM-02 «Mục số thập phân: Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc…», TD-SRC-10 «A = 60 và 59.96: Hai nguồn riêng: `A`=60.00 và `A`=59.96 (hiển thị 60.0)» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Ưu tiên 1: `A≥60` → cố định 25 `<`. Ưu tiên 2: `A<60` → `A×0.5` `<`. mục số thập phân (M=100).
- Dữ liệu test: mục số thập phân (M=100); hai nguồn có trung bình 60 và 59.96 (`A=60.00`; `A=59.96`); S = 27, 29.99

**操作（Thao tác）**

Chạy nút cam với từng nguồn.

**期待結果（Kết quả mong đợi）**

`A=60.00` → ưu tiên 1, `T=25`: 27 Không đỏ.

`A=59.96` → ưu tiên 2, `T=29.98`: 27 Đỏ; 29.99 Không đỏ.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Ưu tiên 1: `A≥60` → cố định 25 `<`. Ưu tiên 2: `A<60` → `A×0.5` `<`. mục số thập phân (M=100). - Dữ liệu test: mục số thập phân (M=100); hai nguồn có trung bình 60 và 59.96 (`A=60.00`; `A=59.96`); S = 27, 29.99 | Trigger/điểm quan sát: Chạy nút cam với từng nguồn. | Oracle/bằng chứng: `A=60.00` → ưu tiên 1, `T=25`: 27 Không đỏ. `A=59.96` → ưu tiên 2, `T=29.98`: 27 Đỏ; 29.99 Không đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Trung bình dùng để chọn nhánh là trước hay sau làm tròn?” (Q8 «Trung bình dùng để chọn nhánh là trước hay sau làm tròn?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.2 “Điều kiện dựa trên trung bình”
- Bằng chứng cần chụp: Ảnh nguồn, kết quả.
- Ghi chú: Dấu `≥` có trong ví dụ đặc tả v2 mục 5.2 “Điều kiện dựa trên trung bình”; bộ bốn dấu điều kiện là PROPOSED (đề xuất thiết kế chờ review — đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-024"></a>

### TC-RS-CALC-024 — Tỷ lệ nhóm R = 70% khớp điều kiện ≥ 65%

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kế thừa tỷ lệ nhóm” (AC-G15 «Kế thừa tỷ lệ nhóm»)

<!-- Mã truy vết: TD-RULE-09 «Tỷ lệ nhóm: Điều kiện Tỷ lệ điểm của nhóm（集団の得点率） `≥65%`», TD-SRC-05 «Tỷ lệ nhóm cùng M: 2 học sinh: 60/100 và 80/100 → `R=70%`» -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc theo tỷ lệ điểm của nhóm từ 65% là quy tắc duy nhất.
- Dữ liệu test: quy tắc theo tỷ lệ điểm của nhóm từ 65%; (a) nhóm có tỷ lệ điểm 70% (cùng M) (60/100, 80/100); (b) nguồn 50/100, 70/100; S = 60, 70, 80

**操作（Thao tác）**

Chạy nút xanh rồi nút cam cho từng nguồn.

**期待結果（Kết quả mong đợi）**

(a) `R=140/200×100=70%` → khớp; `T=70`: 60 Đỏ; 70 Không đỏ; 80 Không đỏ.

(b) `R=120/200×100=60%` → không khớp → cả ba Không áp dụng.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: quy tắc theo tỷ lệ điểm của nhóm từ 65% là quy tắc duy nhất. - Dữ liệu test: quy tắc theo tỷ lệ điểm của nhóm từ 65%; (a) nhóm có tỷ lệ điểm 70% (cùng M) (60/100, 80/100); (b) nguồn 50/100, 70/100; S = 60, 70, 80 | Trigger/điểm quan sát: Chạy nút xanh rồi nút cam cho từng nguồn. | Oracle/bằng chứng: (a) `R=140/200×100=70%` → khớp; `T=70`: 60 Đỏ; 70 Không đỏ; 80 Không đỏ. (b) `R=120/200×100=60%` → không khớp → cả ba Không áp dụng.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Tỷ lệ nhóm có cần xử lý riêng khi các lớp khác điểm tối đa không?” (Q31 «Tỷ lệ nhóm có cần xử lý riêng khi các lớp khác điểm tối đa không?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.3 “Tỷ lệ nhóm” (ví dụ 60/100 và 80/100); Figma MW “màn Điều kiện áp dụng – điều kiện tỷ lệ điểm của nhóm” (58:9164 «Figma MW: màn Điều kiện áp dụng – điều kiện tỷ lệ điểm của nhóm») (UI 03B «Figma: màn Điều kiện áp dụng – điều kiện tỷ lệ điểm của nhóm — MW 58:9164», 65 % 以上)
- Bằng chứng cần chụp: Ảnh nguồn, kết quả.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-025"></a>

### TC-RS-CALC-025 — Tỷ lệ nhóm 64.99% (hiển thị 65.0) không khớp ≥ 65%

Priority: TBD ｜ Status: TBD ｜ Requirement ID: tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14 «Giá trị thô từ cùng tập dữ liệu»)

<!-- Mã truy vết: TD-RULE-09 «Tỷ lệ nhóm: Điều kiện Tỷ lệ điểm của nhóm（集団の得点率） `≥65%`» -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc theo tỷ lệ điểm của nhóm từ 65%; mục thập phân.
- Dữ liệu test: quy tắc theo tỷ lệ điểm của nhóm từ 65%; (a) Nguồn 64.98/100 và 65.00/100 → `R=64.99%`; (b) 65/100 và 65/100 → `R=65%`; S = 60

**操作（Thao tác）**

Chạy nút xanh rồi nút cam cho từng nguồn.

**期待結果（Kết quả mong đợi）**

(a) Kỳ vọng theo đặc tả v2: không khớp → Không áp dụng. Nếu nguồn chỉ cung cấp giá trị đã làm tròn: ghi nhận khoảng trống, không kết luận PASS/FAIL (TBD).

(b) Khớp → S=60 Đỏ.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: quy tắc theo tỷ lệ điểm của nhóm từ 65%; mục thập phân. - Dữ liệu test: quy tắc theo tỷ lệ điểm của nhóm từ 65%; (a) Nguồn 64.98/100 và 65.00/100 → `R=64.99%`; (b) 65/100 và 65/100 → `R=65%`; S = 60 | Trigger/điểm quan sát: Chạy nút xanh rồi nút cam cho từng nguồn. | Oracle/bằng chứng: (a) Kỳ vọng theo đặc tả v2: không khớp → Không áp dụng. Nếu nguồn chỉ cung cấp giá trị đã làm tròn: ghi nhận khoảng trống, không kết luận PASS/FAIL (TBD). (b) Khớp → S=60 Đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.3 “Tỷ lệ nhóm” (Độ chính xác: giữ yêu cầu dùng `R` trước làm tròn; nguồn có thể chưa đủ độ chính xác)
- Bằng chứng cần chụp: Ảnh nguồn (giá trị thô và hiển thị), kết quả.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-026"></a>

### TC-RS-CALC-026 — Mẫu số trung bình khi có học sinh bị loại khỏi xếp hạng

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14 «Giá trị thô từ cùng tập dữ liệu»)

<!-- Mã truy vết: TD-SRC-07 «Có học sinh bị loại khỏi xếp hạng: 3 học sinh: 60, 40 và 20…», AC-G14, SI-07 «Mẫu số trung bình» -->

**前提条件（Điều kiện trước）**

- Điều kiện: nhóm có học sinh bị loại khỏi xếp hạng; công thức `A×0.5`, `<`.
- Dữ liệu test: nhóm có học sinh bị loại khỏi xếp hạng; S = 22

**操作（Thao tác）**

Chạy nút xanh rồi nút cam; ghi `A` đọc được.

**期待結果（Kết quả mong đợi）**

`A = (60+40+20)/3 = 40` (mẫu số là số người có điểm của cùng bản) → `T=20` → S=22 Không đỏ. Nếu hệ thống dùng số người thuộc xếp hạng (`A=100/2=50`, `T=25` → Đỏ) là sai.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: nhóm có học sinh bị loại khỏi xếp hạng; công thức `A×0.5`, `<`. - Dữ liệu test: nhóm có học sinh bị loại khỏi xếp hạng; S = 22 | Trigger/điểm quan sát: Chạy nút xanh rồi nút cam; ghi `A` đọc được. | Oracle/bằng chứng: `A = (60+40+20)/3 = 40` (mẫu số là số người có điểm của cùng bản) → `T=20` → S=22 Không đỏ. Nếu hệ thống dùng số người thuộc xếp hạng (`A=100/2=50`, `T=25` → Đỏ) là sai.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.5 “Chọn bản nguồn” ("Không thay số người có điểm bằng số người thuộc xếp hạng"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14 «Giá trị thô từ cùng tập dữ liệu») ("trung bình dùng số người có điểm cùng bản, không phải số người xếp hạng"); khác biệt đặc tả–code về “Mẫu số trung bình” (SI-07 «Mẫu số trung bình»)
- Bằng chứng cần chụp: Ảnh nguồn, kết quả, `A` thực tế.
- Ghi chú: đặc tả v2 mục 5.5 “Chọn bản nguồn” và tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (cùng tài liệu chia công việc v2 công việc “Hỗ trợ điều kiện và công thức dùng tổng hợp”: "Không thay số người có điểm bằng số người xếp hạng") đã nêu mẫu số là số người có điểm. Việc ánh xạ trường `examinees`/`student_count` của bản nguồn là kiểm tích hợp, không đổi kỳ vọng.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-027"></a>

### TC-RS-CALC-027 — Trung bình riêng cho từng đơn vị

Priority: TBD ｜ Status: TBD ｜ Requirement ID: đặc tả v2 mục 5.5 “Chọn bản nguồn”

<!-- Mã truy vết: TD-ITEM-03 «Mục điểm đơn vị: Điểm bài kiểm tra đơn vị（単元テスト点）, M mặc định 100», TD-SRC-09 «Trung bình cho điểm đơn vị: Điểm đơn vị U1, U2 cùng môn, trung bình…», SI-08 «Trung bình cho điểm đơn vị» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục điểm đơn vị (đơn vị U1 có M riêng 40) có công thức `A×0.5`, `<`.
- Dữ liệu test: mục điểm đơn vị (đơn vị U1 có M riêng 40); trung bình riêng theo đơn vị (U1=40, U2=70) (U1 `A=40`, U2 `A=70`); S06 U1 = 25, U2 = 30

**操作（Thao tác）**

Chạy nút xanh rồi nút cam.

**期待結果（Kết quả mong đợi）**

Kỳ vọng theo đặc tả v2: U1 `T=20` → 25 Không đỏ; U2 `T=35` → 30 Đỏ. Nguồn trung bình theo đơn vị chưa tích hợp (đặc tả v2 mục 13.1): nếu không tách được thì ghi nhận, không đánh PASS.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục điểm đơn vị (đơn vị U1 có M riêng 40) có công thức `A×0.5`, `<`. - Dữ liệu test: mục điểm đơn vị (đơn vị U1 có M riêng 40); trung bình riêng theo đơn vị (U1=40, U2=70) (U1 `A=40`, U2 `A=70`); S06 U1 = 25, U2 = 30 | Trigger/điểm quan sát: Chạy nút xanh rồi nút cam. | Oracle/bằng chứng: Kỳ vọng theo đặc tả v2: U1 `T=20` → 25 Không đỏ; U2 `T=35` → 30 Đỏ. Nguồn trung bình theo đơn vị chưa tích hợp (đặc tả v2 mục 13.1): nếu không tách được thì ghi nhận, không đánh PASS.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.5 “Chọn bản nguồn” ("không được bỏ chiều đơn vị"); [context điểm đỏ](../../../CONTEXT.md) ([CTX](../../../CONTEXT.md) «context chuẩn điểm đỏ») khoảng trống tích hợp “Trung bình theo đơn vị” (I07 «Trung bình theo đơn vị»); khác biệt đặc tả–code về “Trung bình cho điểm đơn vị” (SI-08 «Trung bình cho điểm đơn vị»)
- Bằng chứng cần chụp: Ảnh nguồn theo đơn vị, kết quả.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-028"></a>

### TC-RS-CALC-028 — Không sai kết quả do sai số dấu phẩy động

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11 «Giữ chính xác giá trị»)

<!-- Mã truy vết: TD-ITEM-02 «Mục số thập phân: Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số thập phân (M=100); nguồn dummy.
- Dữ liệu test: mục số thập phân (M=100); (a) `A=1.1`, công thức `A×3`, S = 3.3; (b) `A=0.1`, công thức `A+0.2`, S = 0.3

**操作（Thao tác）**

Xét với `<` và `≤`.

**期待結果（Kết quả mong đợi）**

(a) `T=3.3`: `<` Không đỏ; `≤` Đỏ.

(b) `T=0.3`: `<` Không đỏ; `≤` Đỏ.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số thập phân (M=100); nguồn dummy. - Dữ liệu test: mục số thập phân (M=100); (a) `A=1.1`, công thức `A×3`, S = 3.3; (b) `A=0.1`, công thức `A+0.2`, S = 0.3 | Trigger/điểm quan sát: Xét với `<` và `≤`. | Oracle/bằng chứng: (a) `T=3.3`: `<` Không đỏ; `≤` Đỏ. (b) `T=0.3`: `<` Không đỏ; `≤` Đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.8 “Yêu cầu độ chính xác” ("phép so sánh đúng tại `S=T`")
- Bằng chứng cần chụp: Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](scope-and-approach.vi.md#conventions) mục 9 “Quy ước thực thi chung”） ô (a), (b) với `<` và với `≤`.
- Ghi chú: Số thực nhị phân cho `1.1×3=3.3000000000000003` và `0.1+0.2=0.30000000000000004`; nếu hệ thống so sánh thô thì `<` sẽ Đỏ — sai.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-029"></a>

### TC-RS-CALC-029 — Tràn số không tạo kết luận đỏ/không đỏ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11 «Giữ chính xác giá trị»)

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Công thức.
- Dữ liệu test: (a) `A × 999999999999999999999` (21 chữ số); `A ÷ 0.000000001`.<br>(b) 20 dòng, mỗi dòng `× 999999999.99999999` (dòng 1: `A × 999999999.99999999`), không xử lý phần lẻ; `A=50`.

**操作（Thao tác）**

1. Nhập (a), Lưu.
2. Nhập (b), Lưu, chạy nút cam.

**期待結果（Kết quả mong đợi）**

1. (a) vượt giới hạn nhập đề xuất (9 chữ số nguyên, 8 chữ số lẻ) → bị từ chối khi lưu, không tự cắt số.
2. (b) nằm trong giới hạn nhập nên lưu được; khi chạy, ngưỡng vượt miền số được hỗ trợ → Chưa xét được (đề xuất `reason_code=numeric_overflow`) hoặc lỗi kỹ thuật được báo. Không có ô nào thành Đỏ/Không đỏ từ giá trị tràn.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Công thức. - Dữ liệu test: (a) `A × 999999999999999999999` (21 chữ số); `A ÷ 0.000000001`.<br>(b) 20 dòng, mỗi dòng `× 999999999.99999999` (dòng 1: `A × 999999999.99999999`), không xử lý phần lẻ; `A=50`. | Trigger/điểm quan sát: 1. Nhập (a), Lưu. 2. Nhập (b), Lưu, chạy nút cam. | Oracle/bằng chứng: 1. (a) vượt giới hạn nhập đề xuất (9 chữ số nguyên, 8 chữ số lẻ) → bị từ chối khi lưu, không tự cắt số. 2. (b) nằm trong giới hạn nhập nên lưu được; khi chạy, ngưỡng vượt miền số được hỗ trợ → Chưa xét được (đề xuất `reason_code=numeric_overflow`) hoặc lỗi kỹ thuật được báo. Không có ô nào thành Đỏ/Không đỏ từ giá trị tràn.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.8 “Yêu cầu độ chính xác” ("tràn số không được tạo kết luận đỏ/không đỏ"; "vượt giới hạn đã công bố thì báo lỗi"); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 3.4 “`judgment_context`” (tử/mẫu tối đa 256 chữ số — PROPOSED), mục 4.2 “Xử lý phần lẻ và miền lưu trữ” (giới hạn nhập — PROPOSED), mục 4.3 “Trạng thái kết quả” (`numeric_overflow`)
- Bằng chứng cần chụp: Ảnh lỗi hoặc kết quả.
- Ghi chú: Phần CONFIRMED: không tạo kết luận từ giá trị tràn, không âm thầm cắt số. Giới hạn cụ thể là PROPOSED (thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ”, giới hạn số chưa chốt — đặc tả v2 mục 13.1); nếu giới hạn cuối khác, chọn lại (b) sao cho lưu được nhưng tràn khi chạy.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-030"></a>

### TC-RS-CALC-030 — Công thức cho T=0; ô trống vẫn là Không có điểm

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 2.3 “Điểm được đưa vào xét”, mục 6.6 “Ngưỡng âm và cảnh báo biên”

<!-- Mã truy vết: TD-STU-04 «S04: G-A, HR1», TD-STU-05 «S05: G-A, HR1» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Nguồn `A=20`; công thức `A−20`.
- Dữ liệu test: học sinh S04 (điểm 0) (0), học sinh S05 (ô trống) (trống)

**操作（Thao tác）**

Xét với `<` rồi `≤`.

**期待結果（Kết quả mong đợi）**

`T=0`. `<`: S04 Không đỏ. `≤`: S04 Đỏ. S05: Không có điểm ở cả hai (không bị coi là 0).

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Nguồn `A=20`; công thức `A−20`. - Dữ liệu test: học sinh S04 (điểm 0) (0), học sinh S05 (ô trống) (trống) | Trigger/điểm quan sát: Xét với `<` rồi `≤`. | Oracle/bằng chứng: `T=0`. `<`: S04 Không đỏ. `≤`: S04 Đỏ. S05: Không có điểm ở cả hai (không bị coi là 0).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 2.3 “Điểm được đưa vào xét”, mục 6.6 “Ngưỡng âm và cảnh báo biên”; [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Dùng điểm nào để xét, và phân biệt điểm 0 với ô trống thế nào?” (Q3 «Dùng điểm nào để xét, và phân biệt điểm 0 với ô trống thế nào?»)
- Bằng chứng cần chụp: Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](scope-and-approach.vi.md#conventions) mục 9 “Quy ước thực thi chung”） S04, S05 với `<` và với `≤`; ảnh SELECT trạng thái của S05.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-031"></a>

### TC-RS-CALC-031 — Nguồn không có mẫu số hợp lệ (tổng điểm tối đa 0, số người có điểm 0) → Chưa xét được

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14 «Giá trị thô từ cùng tập dữ liệu»)

<!-- Mã truy vết: TD-RULE-09 «Tỷ lệ nhóm: Điều kiện Tỷ lệ điểm của nhóm（集団の得点率） `≥65%`», AC-G14 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Quy tắc 1: quy tắc theo tỷ lệ điểm của nhóm từ 65% (điều kiện tỷ lệ nhóm). Quy tắc 2 (mục khác): công thức `A×0.5`. Cách tạo dữ liệu: hỏi team dev khi chuẩn bị.
- Dữ liệu test: quy tắc theo tỷ lệ điểm của nhóm từ 65%; (a) Bản tổng hợp của nhóm có tổng điểm tối đa = 0; (b) bản tổng hợp tồn tại nhưng không học sinh nào có điểm; S01 = 29

**操作（Thao tác）**

Với từng nguồn: chạy nút xanh (nếu cần) rồi nút cam; xem kết quả S01.

**期待結果（Kết quả mong đợi）**

(a) Điều kiện tỷ lệ nhóm không xác định được → Chưa xét được; không coi `R=0` là không khớp để thành Không áp dụng hay chuyển xuống ưu tiên thấp hơn.

(b) `A` không xác định được → Chưa xét được; không coi `A=0` (nếu coi 0 thì `T=0`, S01 Không đỏ — sai).

Cả hai: ngừng dấu đỏ cũ; không lấy nguồn khác.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Quy tắc 1: quy tắc theo tỷ lệ điểm của nhóm từ 65% (điều kiện tỷ lệ nhóm). Quy tắc 2 (mục khác): công thức `A×0.5`. Cách tạo dữ liệu: hỏi team dev khi chuẩn bị. - Dữ liệu test: quy tắc theo tỷ lệ điểm của nhóm từ 65%; (a) Bản tổng hợp của nhóm có tổng điểm tối đa = 0; (b) bản tổng hợp tồn tại nhưng không học sinh nào có điểm; S01 = 29 | Trigger/điểm quan sát: Với từng nguồn: chạy nút xanh (nếu cần) rồi nút cam; xem kết quả S01. | Oracle/bằng chứng: (a) Điều kiện tỷ lệ nhóm không xác định được → Chưa xét được; không coi `R=0` là không khớp để thành Không áp dụng hay chuyển xuống ưu tiên thấp hơn. (b) `A` không xác định được → Chưa xét được; không coi `A=0` (nếu coi 0 thì `T=0`, S01 Không đỏ — sai). Cả hai: ngừng dấu đỏ cũ; không lấy nguồn khác.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: BLOCKED

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.3 “Tỷ lệ nhóm” (Phạm vi vận hành: dữ liệu không hợp lệ theo quy tắc chung, không thay bằng 0), mục 5.5 “Chọn bản nguồn”, mục 8.3 “Không tạo được ngưỡng hợp lệ”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14 «Giá trị thô từ cùng tập dữ liệu») ("số người 0, tổng maximum sai hoặc tập đóng góp không xác định thì chưa xét được"); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 4.3 “Trạng thái kết quả” (mã nguyên nhân — PROPOSED)
- Bằng chứng cần chụp: Ảnh kết quả; SELECT `reason_code` (khi có schema).
- Ghi chú: Mã nguyên nhân cụ thể là PROPOSED. Không tạo được dữ liệu (a)/(b): BLOCKED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-032"></a>

### TC-RS-CALC-032 — Tỷ lệ nhóm: tử số và mẫu số lấy cùng tập đóng góp

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14 «Giá trị thô từ cùng tập dữ liệu»)

<!-- Mã truy vết: TD-RULE-09 «Tỷ lệ nhóm: Điều kiện Tỷ lệ điểm của nhóm（集団の得点率） `≥65%`», AC-G14 -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc theo tỷ lệ điểm của nhóm từ 65% là quy tắc duy nhất. Nhóm tham chiếu có 3 học sinh: 60/100, 80/100 và một học sinh chưa có điểm (M=100).
- Dữ liệu test: quy tắc theo tỷ lệ điểm của nhóm từ 65%; S = 60

**操作（Thao tác）**

1. Chạy nút xanh; ghi tổng điểm và tổng điểm tối đa hiển thị ở kết quả tổng hợp.
2. Chạy nút cam; xem kết quả S=60.

**期待結果（Kết quả mong đợi）**

1. Tổng điểm và tổng điểm tối đa lấy cùng tập học sinh có điểm theo cấu hình tổng hợp.
2. Với cấu hình tổng hợp không tính học sinh chưa có điểm: `R=140/200×100=70%` → khớp `≥65%` → `T=70` → S=60 Đỏ. Ghép tổng điểm của 2 người với tổng tối đa của 3 người (`140/300=46.7%` → Không áp dụng) là sai.

**補足（Bổ sung）**
- Chức năng: Tính toán ngưỡng
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: quy tắc theo tỷ lệ điểm của nhóm từ 65% là quy tắc duy nhất. Nhóm tham chiếu có 3 học sinh: 60/100, 80/100 và một học sinh chưa có điểm (M=100). - Dữ liệu test: quy tắc theo tỷ lệ điểm của nhóm từ 65%; S = 60 | Trigger/điểm quan sát: 1. Chạy nút xanh; ghi tổng điểm và tổng điểm tối đa hiển thị ở kết quả tổng hợp. 2. Chạy nút cam; xem kết quả S=60. | Oracle/bằng chứng: 1. Tổng điểm và tổng điểm tối đa lấy cùng tập học sinh có điểm theo cấu hình tổng hợp. 2. Với cấu hình tổng hợp không tính học sinh chưa có điểm: `R=140/200×100=70%` → khớp `≥65%` → `T=70` → S=60 Đỏ. Ghép tổng điểm của 2 người với tổng tối đa của 3 người (`140/300=46.7%` → Không áp dụng) là sai.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.3 “Tỷ lệ nhóm” (công thức `R`), mục 5.5 “Chọn bản nguồn” ("tử số và mẫu số phải tương ứng cùng tập đóng góp theo cấu hình tổng hợp"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14 «Giá trị thô từ cùng tập dữ liệu») ("tử/mẫu tỷ lệ dùng cùng tập đóng góp")
- Bằng chứng cần chụp: Ảnh kết quả tổng hợp (tổng điểm, tổng tối đa, số người); ảnh kết quả xét.
- Ghi chú: Nếu cấu hình tổng hợp hiện có đưa học sinh chưa có điểm vào cả tử và mẫu theo cùng quy tắc thì ghi nhận giá trị thực tế; điều kiện kiểm là tử/mẫu cùng tập, không phải con số 70% cố định.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-001"></a>

### TC-RS-UI-001 — Nhãn trạng thái ở hàng Thiết lập điểm đỏ（赤点設定） trong Thiết lập ô nhập（入力欄設定）

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-ITEM-02 «Mục số thập phân: Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc…», TD-ITEM-04 «Mục lựa chọn: Kiểu lựa chọn（選択肢型） A/B/C», TD-ROLE-01 «Giáo viên có quyền sửa mục: Có quyền vào Thiết lập nhập điểm（成績入力設定） và…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) chưa có quy tắc; mục số thập phân (M=100) có quy tắc; mục kiểu lựa chọn A/B/C là mục lựa chọn. tài khoản giáo viên có quyền sửa mục.
- Dữ liệu test: mục số nguyên (M=100), mục số thập phân (M=100), mục kiểu lựa chọn A/B/C

**操作（Thao tác）**

1. Mở Thiết lập ô nhập（入力欄設定）.
2. Ghi lại nhãn/ký hiệu ở hàng Thiết lập điểm đỏ（赤点設定） cho từng cột mục.

**期待結果（Kết quả mong đợi）**

Mục chưa có quy tắc và mục đã có quy tắc được phân biệt được; mục lựa chọn không có thao tác mở thiết lập (đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”).

Nhãn cụ thể theo Figma (PROPOSED): [設定する] (thiết lập) / 編集 (sửa) + 設定済み (đã thiết lập) / —.

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) chưa có quy tắc; mục số thập phân (M=100) có quy tắc; mục kiểu lựa chọn A/B/C là mục lựa chọn. tài khoản giáo viên có quyền sửa mục. - Dữ liệu test: mục số nguyên (M=100), mục số thập phân (M=100), mục kiểu lựa chọn A/B/C | Trigger/điểm quan sát: 1. Mở Thiết lập ô nhập（入力欄設定）. 2. Ghi lại nhãn/ký hiệu ở hàng Thiết lập điểm đỏ（赤点設定） cho từng cột mục. | Oracle/bằng chứng: Mục chưa có quy tắc và mục đã có quy tắc được phân biệt được; mục lựa chọn không có thao tác mở thiết lập (đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”). Nhãn cụ thể theo Figma (PROPOSED): [設定する] (thiết lập) / 編集 (sửa) + 設定済み (đã thiết lập) / —.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: Figma MW “màn Thiết lập ô nhập（入力欄設定）, lối vào điểm đỏ” (58:9848–9870 «Figma MW: màn Thiết lập ô nhập（入力欄設定）, lối vào điểm đỏ») (ô [設定する] (thiết lập), 編集 (sửa) + 設定済み (đã thiết lập), —); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 4.1 “Điểm vào và trạng thái trống”
- Bằng chứng cần chụp: Ảnh hàng Thiết lập điểm đỏ（赤点設定）.
- Ghi chú: Nhãn chỉ có trong Figma là PROPOSED: lệch thì ghi Notes, không FAIL.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-002"></a>

### TC-RS-UI-002 — Cấu trúc màn danh sách Thiết lập điểm đỏ（赤点設定）

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”, mục 4.2 “Nội dung một dòng”

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-07 «Cặp phân nhánh: Ưu tiên 1 "Trung bình từ 60": điều kiện `A≥60`, cố định…», TD-ENV-05 «Đường dẫn màn (RSD-TASK): Thiết lập nhập…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có cặp quy tắc phân nhánh theo trung bình 60 (2 quy tắc).
- Dữ liệu test: mục số nguyên (M=100); cặp quy tắc phân nhánh theo trung bình 60

**操作（Thao tác）**

1. Mở Thiết lập nhập điểm（成績入力設定） (URL ở đường dẫn các màn liên quan) → Thiết lập ô nhập（入力欄設定） của kỳ Cuối kỳ học kỳ 1（1学期期末）.
2. Ở hàng Thiết lập điểm đỏ（赤点設定） của cột mục số nguyên (M=100), bấm nút mở thiết lập (Figma: 編集 (sửa)).
3. Trên màn danh sách, đối chiếu lần lượt các mục a–g ở Expected Result.

**期待結果（Kết quả mong đợi）**

a. Breadcrumb: Thiết lập bảng thành tích（成績帳票設定） - Thiết lập thành tích（成績設定） - Thiết lập nhập điểm（成績入力設定） - Thiết lập điểm đỏ（赤点設定）.

b. Link Quay lại Thiết lập nhập điểm（[成績入力設定へ戻る]）.

c. Khối Giải thích bổ sung（※補足説明※） thu gọn/mở được.

d. Nút Thêm thiết lập chi tiết（詳細設定の追加）.

e. Bảng có các cột Tên thiết lập（設定名称）; Điều kiện áp dụng（適用条件） kèm Sửa（[編集]）; Ngưỡng đỏ（赤点の基準） kèm Sửa（[編集]）; Xóa（削除）; Ưu tiên（優先順位） ▲▼; có 2 dòng theo cặp quy tắc phân nhánh theo trung bình 60.

f. Câu 「上から順に適用条件を確認し、最初に一致した設定を使用します。」 (kiểm điều kiện từ trên xuống, dùng thiết lập khớp đầu tiên).

g. Câu cuối trang 「設定を変更した場合は、成績登録または成績集計の自動算出を再実行してください。」 (đổi thiết lập thì chạy lại đăng ký điểm hoặc tính tự động).

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) có cặp quy tắc phân nhánh theo trung bình 60 (2 quy tắc). - Dữ liệu test: mục số nguyên (M=100); cặp quy tắc phân nhánh theo trung bình 60 | Trigger/điểm quan sát: 1. Mở Thiết lập nhập điểm（成績入力設定） (URL ở đường dẫn các màn liên quan) → Thiết lập ô nhập（入力欄設定） của kỳ Cuối kỳ học kỳ 1（1学期期末）. 2. Ở hàng Thiết lập điểm đỏ（赤点設定） của cột mục số nguyên (M=100), bấm nút mở thiết lập (Figma: 編集 (sửa)). 3. Trên màn danh sách, đối chiếu lần lượt các mục a–g ở Expected Result. | Oracle/bằng chứng: a. Breadcrumb: Thiết lập bảng thành tích（成績帳票設定） - Thiết lập thành tích（成績設定） - Thiết lập nhập điểm（成績入力設定） - Thiết lập điểm đỏ（赤点設定）. b. Link Quay lại Thiết lập nhập điểm（[成績入力設定へ戻る]）. c. Khối Giải thích bổ sung（※補足説明※） thu gọn/mở được. d. Nút Thêm thiết lập chi tiết（詳細設定の追加）. e. Bảng có các cột Tên thiết lập（設定名称）; Điều kiện áp dụng（適用条件） kèm Sửa（[編集]）; Ngưỡng đỏ（赤点の基準） kèm Sửa（[編集]）; Xóa（削除）; Ưu tiên（優先順位） ▲▼; có 2 dòng theo cặp quy tắc phân nhánh theo trung bình 60. f. Câu 「上から順に適用条件を確認し、最初に; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: Figma MW “màn danh sách thiết lập điểm đỏ” (58:9903 «Figma MW: màn danh sách thiết lập điểm đỏ») (UI｜02 «Figma: màn danh sách thiết lập điểm đỏ — MW 58:9903»): breadcrumb (58:10006–10008), (58:10020) [成績入力設定へ戻る] (quay lại Thiết lập nhập điểm), (58:10022–10024) ※補足説明※ ▼表示する (giải thích bổ sung, ▼ hiện), (58:10030) 詳細設定の追加 (thêm thiết lập chi tiết), cột (58:10041–10053), (58:10035), (58:10158); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 4.1 “Điểm vào và trạng thái trống”, mục 4.2 “Nội dung một dòng”
- Bằng chứng cần chụp: Ảnh toàn màn; ghi Actual Result theo từng mục a–g.
- Ghi chú: Có nhiều quy tắc và ưu tiên là CONFIRMED (đặc tả v2 mục 4.2 “Nội dung một dòng”, mục 4.3 “Chọn quy tắc”); nhãn và bố cục là PROPOSED. Không có mục Cho phép sửa tay（手動変更の可否） như AutoRating (suy từ đặc tả v2 mục 3: không có chế độ xét thủ công/tự động riêng).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-003"></a>

### TC-RS-UI-003 — Định dạng tiêu đề màn danh sách

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04 «Lưu và mở lại nhiều thiết lập»)

<!-- Mã truy vết: TD-ITEM-02 «Mục số thập phân: Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc…», AC-G04 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số thập phân (M=100).
- Dữ liệu test: mục số thập phân (M=100)

**操作（Thao tác）**

Mở màn danh sách của mục số thập phân (M=100), đọc tiêu đề.

**期待結果（Kết quả mong đợi）**

Theo tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập”: màn danh sách thể hiện kỳ Cuối kỳ học kỳ 1（1学期期末）, tên mục, kiểu nhập Nhập số – thập phân（数値入力・小数） và Thiết lập điểm đỏ（赤点設定）.

Định dạng tiêu đề theo Figma (PROPOSED): 「1学期期末 ／ 評点（数値入力・小数） の赤点設定」; lệch thì ghi Notes, không FAIL.

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số thập phân (M=100). - Dữ liệu test: mục số thập phân (M=100) | Trigger/điểm quan sát: Mở màn danh sách của mục số thập phân (M=100), đọc tiêu đề. | Oracle/bằng chứng: Theo tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập”: màn danh sách thể hiện kỳ Cuối kỳ học kỳ 1（1学期期末）, tên mục, kiểu nhập Nhập số – thập phân（数値入力・小数） và Thiết lập điểm đỏ（赤点設定）. Định dạng tiêu đề theo Figma (PROPOSED): 「1学期期末 ／ 評点（数値入力・小数） の赤点設定」; lệch thì ghi Notes, không FAIL.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: Figma MW “màn danh sách thiết lập điểm đỏ” (58:10026 «Figma MW: màn danh sách thiết lập điểm đỏ») 「1学期期末 ／ 評点（数値入力・小数） の赤点設定」, “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9532 «Figma MW: chương 01 – lối vào, danh sách, xóa thiết lập»); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Lưu và mở lại nhiều thiết lập” (AC-G04 «Lưu và mở lại nhiều thiết lập») ("Danh sách thể hiện mục/kiểu/thời điểm")
- Bằng chứng cần chụp: Ảnh tiêu đề.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-004"></a>

### TC-RS-UI-004 — Tóm tắt điều kiện và ngưỡng trên từng dòng danh sách

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 4.2 “Nội dung một dòng”

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-07 «Cặp phân nhánh: Ưu tiên 1 "Trung bình từ 60": điều kiện `A≥60`, cố định…», TD-RULE-06 «Công thức hai dòng: Dòng 1: Trung bình（平均点）÷ Số cố định（固定値）2, chữ số…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có cặp quy tắc phân nhánh theo trung bình 60 và một quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8).
- Dữ liệu test: mục số nguyên (M=100); quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8), cặp quy tắc phân nhánh theo trung bình 60

**操作（Thao tác）**

Xem cột Điều kiện áp dụng（適用条件） và Ngưỡng đỏ（赤点の基準） của từng dòng.

**期待結果（Kết quả mong đợi）**

Mỗi dòng cho biết môn/nguồn/mốc của điều kiện, loại ngưỡng, giá trị, dấu so sánh; dòng công thức cho thấy các dòng tính và xử lý phần lẻ. Định dạng theo Figma (đề xuất).

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) có cặp quy tắc phân nhánh theo trung bình 60 và một quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8). - Dữ liệu test: mục số nguyên (M=100); quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8), cặp quy tắc phân nhánh theo trung bình 60 | Trigger/điểm quan sát: Xem cột Điều kiện áp dụng（適用条件） và Ngưỡng đỏ（赤点の基準） của từng dòng. | Oracle/bằng chứng: Mỗi dòng cho biết môn/nguồn/mốc của điều kiện, loại ngưỡng, giá trị, dấu so sánh; dòng công thức cho thấy các dòng tính và xử lý phần lẻ. Định dạng theo Figma (đề xuất).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: Figma MW “màn danh sách thiết lập điểm đỏ” (58:10058–10142 «Figma MW: màn danh sách thiết lập điểm đỏ») (「数学／ホームルーム平均 60点以上」 (Toán / trung bình lớp chủ nhiệm từ 60), 「固定点数：30点未満」, bảng công thức 式1 ホームルーム平均 ÷ 2 小数第1位切り捨て / 式2 式1 × 0.8 しない, 「判定：計算結果未満」; file cũ ghi 「数学／HR平均 60点以上」); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 4.2 “Nội dung một dòng”
- Bằng chứng cần chụp: Ảnh toàn bảng danh sách, thấy đủ cột Điều kiện áp dụng（適用条件） và Ngưỡng đỏ（赤点の基準） của cả ba dòng.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-005"></a>

### TC-RS-UI-005 — Trạng thái danh sách trống

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) không có quy tắc.
- Dữ liệu test: mục số nguyên (M=100)

**操作（Thao tác）**

Mở danh sách.

**期待結果（Kết quả mong đợi）**

Hiển thị câu báo không có thiết lập và nút thêm; không có dòng mẫu.

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) không có quy tắc. - Dữ liệu test: mục số nguyên (M=100) | Trigger/điểm quan sát: Mở danh sách. | Oracle/bằng chứng: Hiển thị câu báo không có thiết lập và nút thêm; không có dòng mẫu.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: Figma MW “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9533–9539 «Figma MW: chương 01 – lối vào, danh sách, xóa thiết lập») (nút 詳細設定の追加, câu 「赤点設定はありません。」 (không có thiết lập điểm đỏ)); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 4.1 “Điểm vào và trạng thái trống”
- Bằng chứng cần chụp: Ảnh toàn màn danh sách trống.
- Ghi chú: Không tự tạo quy tắc mặc định là CONFIRMED (case “Danh sách trống không tự tạo quy tắc mặc định hoặc chuyển từ ngưỡng đỏ cũ”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-006"></a>

### TC-RS-UI-006 — Hộp xác nhận khi xóa quy tắc cuối

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 4.4 “Lưu, đổi thứ tự và xóa”

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TC-RS-BR-019 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) chỉ có quy tắc “Cố định 30” (dưới 30).
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

Bấm Xóa（削除） ở dòng duy nhất.

**期待結果（Kết quả mong đợi）**

Hộp xác nhận nêu đây là thiết lập cuối, kết quả trước còn dùng tới lần chạy lại, điểm được giữ; có Hủy và Xóa.

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) chỉ có quy tắc “Cố định 30” (dưới 30). - Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30) | Trigger/điểm quan sát: Bấm Xóa（削除） ở dòng duy nhất. | Oracle/bằng chứng: Hộp xác nhận nêu đây là thiết lập cuối, kết quả trước còn dùng tới lần chạy lại, điểm được giữ; có Hủy và Xóa.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: Figma MW “chương 01 – lối vào, danh sách, xóa thiết lập” (58:9613–9625 «Figma MW: chương 01 – lối vào, danh sách, xóa thiết lập») (「赤点設定を削除しますか？」 (xóa thiết lập điểm đỏ?), 「「設定1」はこの項目の最後の設定です。」 (「thiết lập 1」 là thiết lập cuối của mục này), 「削除後も再実行まで前回結果を使用します。」, 「再実行後に赤点表示・抽出を停止。点数は残します。」, nút キャンセル (hủy) / 削除する (xóa)); [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Xóa thiết lập cuối cùng thì dấu đỏ mất ngay hay chờ chạy lại?” (Q28 «Xóa thiết lập cuối cùng thì dấu đỏ mất ngay hay chờ chạy lại?»); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 4.4 “Lưu, đổi thứ tự và xóa”
- Bằng chứng cần chụp: Ảnh hộp.
- Sau khi chạy: Bấm Hủy.
- Ghi chú: Ý nghĩa (giữ kết quả tới lần chạy lại) là CONFIRMED (Q&A nghiệp vụ đã xác nhận câu “Xóa thiết lập cuối cùng thì dấu đỏ mất ngay hay chờ chạy lại?”, kiểm ở case “Xóa quy tắc cuối: giữ kết quả tới lần chạy lại; chạy lại → Không áp dụng”); câu chữ là PROPOSED. Hộp khi xóa quy tắc không phải cuối: Figma không có frame riêng.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-007"></a>

### TC-RS-UI-007 — Dòng quy tắc mới chỉ có điều kiện, chưa có ngưỡng

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 13.1 “Các quyết định còn lại được phân loại rõ”

<!-- Mã truy vết: TD-RULE-13 «Cố định chưa có ngưỡng: Chỉ lưu điều kiện áp dụng, chưa lưu ngưỡng», TC-RS-FUNC-014 -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc mới chỉ có điều kiện, chưa có ngưỡng vừa lưu điều kiện.
- Dữ liệu test: quy tắc mới chỉ có điều kiện, chưa có ngưỡng

**操作（Thao tác）**

Quay về danh sách, xem dòng.

**期待結果（Kết quả mong đợi）**

Dòng hiển thị chưa có ngưỡng, có link mở thiết lập ngưỡng và câu báo không dùng để xét.

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: quy tắc mới chỉ có điều kiện, chưa có ngưỡng vừa lưu điều kiện. - Dữ liệu test: quy tắc mới chỉ có điều kiện, chưa có ngưỡng | Trigger/điểm quan sát: Quay về danh sách, xem dòng. | Oracle/bằng chứng: Dòng hiển thị chưa có ngưỡng, có link mở thiết lập ngưỡng và câu báo không dùng để xét.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: Figma MW “chương 01 – lối vào, danh sách, xóa thiết lập” (58:10165–10179 «Figma MW: chương 01 – lối vào, danh sách, xóa thiết lập») (「基準が未設定のため、この設定は判定に使用しません。」 (vì chưa đặt ngưỡng, thiết lập này không được dùng để xét), cột ngưỡng 「未設定」, link 「基準設定を開く」 (mở thiết lập ngưỡng), (58:10179)); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 13.1 “Các quyết định còn lại được phân loại rõ” (trạng thái thêm dở là đề xuất)
- Bằng chứng cần chụp: Ảnh dòng quy tắc chưa có ngưỡng trên danh sách.
- Ghi chú: Hành vi xét: case “Quy tắc mới chỉ có điều kiện, chưa có ngưỡng, không tham gia xét”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-008"></a>

### TC-RS-UI-008 — Màn Điều kiện áp dụng（適用条件設定）: bố cục và chuyển Toàn bộ/Bộ lọc

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 5.1 “Đối tượng áp dụng”

<!-- Mã truy vết: TD-ITEM-02 «Mục số thập phân: Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mở thêm quy tắc cho mục số thập phân (M=100).
- Dữ liệu test: mục số thập phân (M=100)

**操作（Thao tác）**

1. Đối chiếu bố cục.
2. Chọn Toàn bộ đối tượng（全員が対象）.
3. Chọn Giới hạn bằng bộ lọc（特定条件で絞り込む）.

**期待結果（Kết quả mong đợi）**

1. Có các phần tử như Source.
2. Không hiện vùng Điều kiện lọc（絞り込み条件）.
3. Hiện vùng lọc, thêm được điều kiện và câu 「※同じ種類の条件はいずれか1つ、種類が違う条件はすべて満たす生徒が対象となります。」 (cùng loại chỉ cần thỏa một điều kiện, khác loại phải thỏa tất cả).

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Mở thêm quy tắc cho mục số thập phân (M=100). - Dữ liệu test: mục số thập phân (M=100) | Trigger/điểm quan sát: 1. Đối chiếu bố cục. 2. Chọn Toàn bộ đối tượng（全員が対象）. 3. Chọn Giới hạn bằng bộ lọc（特定条件で絞り込む）. | Oracle/bằng chứng: 1. Có các phần tử như Source. 2. Không hiện vùng Điều kiện lọc（絞り込み条件）. 3. Hiện vùng lọc, thêm được điều kiện và câu 「※同じ種類の条件はいずれか1つ、種類が違う条件はすべて満たす生徒が対象となります。」 (cùng loại chỉ cần thỏa một điều kiện, khác loại phải thỏa tất cả).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: Figma MW “màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình” (58:8930 «Figma MW: màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình») (UI｜03A «Figma: màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình — MW 58:8930»): breadcrumb (58:9033–9035), tiêu đề (58:9052), (58:9058) 設定名称, (58:9067–9079) 対象者 (đối tượng) 全員が対象 / 特定条件で絞り込む, (58:9083–9103) 絞り込み条件 + 絞り込み条件を追加 + 教科・科目を選択する, nút (58:9160) 戻る / (58:9163) 更新する; Figma MW (58:9156) (câu ghi chú bộ lọc mới; file cũ 4595:485 ghi 「※絞り込み条件を複数設定した場合、全ての条件を満たす生徒が対象となります。」 (nhiều điều kiện lọc thì phải thỏa tất cả)); Figma MW “chương 02 – điều kiện áp dụng và nguồn trung bình” (58:8754 «Figma MW: chương 02 – điều kiện áp dụng và nguồn trung bình») 「（絞り込み欄は表示しない）」 (không hiện vùng lọc); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.1 “Đối tượng áp dụng”
- Bằng chứng cần chụp: Ảnh bước 1–3.
- Sau khi chạy: Bấm Quay lại（戻る）.
- Ghi chú: Có đối tượng và bộ lọc như AutoRating là CONFIRMED (đặc tả v2 mục 5.1 “Đối tượng áp dụng”); danh sách loại bộ lọc cụ thể chưa chốt.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-009"></a>

### TC-RS-UI-009 — Khối điều kiện Trung bình（平均点） và nguồn tham chiếu, không có ô chọn "kết quả tổng hợp dùng để tham chiếu"

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 3 “Bản đồ màn hình và luồng thao tác”, mục 5.4 “Bộ thông tin nguồn”, mục 5.5 “Chọn bản nguồn”

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Màn Điều kiện áp dụng, Giới hạn bằng bộ lọc.
- Dữ liệu test: —

**操作（Thao tác）**

Thêm điều kiện Trung bình（平均点）, xem các ô.

**期待結果（Kết quả mong đợi）**

CONFIRMED: có ba ô nguồn (thời kỳ, thiết lập tổng hợp thứ hạng, nhóm tham chiếu); **không** có ô chọn kết quả tổng hợp cụ thể/bản chốt.

PROPOSED: câu mục tham chiếu, bố cục ô mốc + đơn vị 点 (điểm) + dấu.

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Màn Điều kiện áp dụng, Giới hạn bằng bộ lọc. - Dữ liệu test: — | Trigger/điểm quan sát: Thêm điều kiện Trung bình（平均点）, xem các ô. | Oracle/bằng chứng: CONFIRMED: có ba ô nguồn (thời kỳ, thiết lập tổng hợp thứ hạng, nhóm tham chiếu); **không** có ô chọn kết quả tổng hợp cụ thể/bản chốt. PROPOSED: câu mục tham chiếu, bố cục ô mốc + đơn vị 点 (điểm) + dấu.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: Figma MW “màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình” (58:9113–9150 «Figma MW: màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình») (平均点, 集計対象時期 (thời kỳ tổng hợp), 順位集計設定 (thiết lập tổng hợp xếp hạng), 集計対象（母集団） (nhóm tham chiếu), 「参照項目：評点　／　対象科目に対応する集計結果を使用」 (mục tham chiếu: điểm đánh giá / dùng kết quả tổng hợp ứng với môn), 平均点が [test-cases.vi.md] 点 [未満]); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 3 “Bản đồ màn hình và luồng thao tác”, mục 5.4 “Bộ thông tin nguồn”, mục 5.5 “Chọn bản nguồn”
- Bằng chứng cần chụp: Ảnh khối điều kiện.
- Ghi chú: Dấu điều kiện: đề xuất thiết kế chờ review — đặc tả v2 mục 13.1.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-010"></a>

### TC-RS-UI-010 — Khối điều kiện Tỷ lệ điểm của nhóm（集団の得点率）

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 5.3 “Tỷ lệ nhóm — kế thừa kết quả tổng hợp thứ hạng hiện có”

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Màn Điều kiện áp dụng.
- Dữ liệu test: —

**操作（Thao tác）**

Thêm điều kiện Tỷ lệ điểm của nhóm（集団の得点率）.

**期待結果（Kết quả mong đợi）**

Có ba ô nguồn như UI-009, ô mốc với đơn vị %, dấu so sánh. Không có tùy chọn cách tính A/B (Q&A nghiệp vụ đã xác nhận câu “Tỷ lệ nhóm có cần xử lý riêng khi các lớp khác điểm tối đa không?” — CONFIRMED).

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Màn Điều kiện áp dụng. - Dữ liệu test: — | Trigger/điểm quan sát: Thêm điều kiện Tỷ lệ điểm của nhóm（集団の得点率）. | Oracle/bằng chứng: Có ba ô nguồn như UI-009, ô mốc với đơn vị %, dấu so sánh. Không có tùy chọn cách tính A/B (Q&A nghiệp vụ đã xác nhận câu “Tỷ lệ nhóm có cần xử lý riêng khi các lớp khác điểm tối đa không?” — CONFIRMED).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: Figma MW “màn Điều kiện áp dụng – điều kiện tỷ lệ điểm của nhóm” (58:9164 «Figma MW: màn Điều kiện áp dụng – điều kiện tỷ lệ điểm của nhóm») (UI｜03B «Figma: màn Điều kiện áp dụng – điều kiện tỷ lệ điểm của nhóm — MW 58:9164»): (58:9347) 集団の得点率, (58:9354–9374) nguồn, (58:9376–9384) 「得点率が [test-cases.vi.md] % [以上]」; [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.3 “Tỷ lệ nhóm — kế thừa kết quả tổng hợp thứ hạng hiện có”
- Bằng chứng cần chụp: Ảnh khối điều kiện Tỷ lệ điểm của nhóm（集団の得点率）.
- Ghi chú: Không có tùy chọn A/B là CONFIRMED; phần còn lại PROPOSED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-011"></a>

### TC-RS-UI-011 — Màn Ngưỡng（基準設定）: ba loại, dấu so sánh và câu giải thích đổi theo dấu

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 6.1 “Thành phần chung của màn ngưỡng”

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mở ngưỡng của một quy tắc.
- Dữ liệu test: —

**操作（Thao tác）**

1. Xem ba lựa chọn loại.
2. Đổi Dấu so sánh（比較条件） giữa Nhỏ hơn（未満） và Nhỏ hơn hoặc bằng（以下）.

**期待結果（Kết quả mong đợi）**

1. Có Điểm cố định（固定点数）, Tỷ lệ điểm tối đa（得点率）, Công thức（計算式） (theo phạm vi phát hành — xem UI-025).
2. Câu giải thích dưới dấu đổi theo lựa chọn.

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Mở ngưỡng của một quy tắc. - Dữ liệu test: — | Trigger/điểm quan sát: 1. Xem ba lựa chọn loại. 2. Đổi Dấu so sánh（比較条件） giữa Nhỏ hơn（未満） và Nhỏ hơn hoặc bằng（以下）. | Oracle/bằng chứng: 1. Có Điểm cố định（固定点数）, Tỷ lệ điểm tối đa（得点率）, Công thức（計算式） (theo phạm vi phát hành — xem UI-025). 2. Câu giải thích dưới dấu đổi theo lựa chọn.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.1 “Thành phần chung của màn ngưỡng”; Figma MW “chương 03 – ngưỡng, công thức, trạng thái nhập” (58:7582–7591 «Figma MW: chương 03 – ngưỡng, công thức, trạng thái nhập») (radio 固定点数 / 得点率 / 計算式), (58:7625–7630) (比較条件 以下, 「生徒の点数が基準点以下の場合に赤点とします。」), (58:7733–7738) (未満, 「…基準点未満の場合に赤点とします。」), nút 戻る / 更新する
- Bằng chứng cần chụp: Ảnh hai trạng thái dấu.
- Ghi chú: Ba loại và hai dấu là CONFIRMED (Q&A nghiệp vụ đã xác nhận câu “Những loại điểm nào thuộc đối tượng?”, câu “Điểm bằng ngưỡng có bị xét đỏ không?”); câu chữ PROPOSED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-012"></a>

### TC-RS-UI-012 — Mặc định khi tạo quy tắc mới

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 6.1 “Thành phần chung của màn ngưỡng”

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Thêm quy tắc mới, lưu điều kiện, mở ngưỡng.
- Dữ liệu test: —

**操作（Thao tác）**

Quan sát giá trị ban đầu.

**期待結果（Kết quả mong đợi）**

Loại = Điểm cố định（固定点数）; dấu = Nhỏ hơn（未満）; ô Điểm chuẩn（基準点） trống; tỷ lệ/công thức (nếu mở) mặc định Không xử lý phần lẻ（しない）.

Quy tắc mới được thêm ở cuối danh sách (PROPOSED).

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Thêm quy tắc mới, lưu điều kiện, mở ngưỡng. - Dữ liệu test: — | Trigger/điểm quan sát: Quan sát giá trị ban đầu. | Oracle/bằng chứng: Loại = Điểm cố định（固定点数）; dấu = Nhỏ hơn（未満）; ô Điểm chuẩn（基準点） trống; tỷ lệ/công thức (nếu mở) mặc định Không xử lý phần lẻ（しない）. Quy tắc mới được thêm ở cuối danh sách (PROPOSED).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.1 “Thành phần chung của màn ngưỡng” ("Đề xuất mặc định khi tạo mới: mở loại cố định, dấu `<`, chưa nhập giá trị ngưỡng"); Figma MW “chương 03 – ngưỡng, công thức, trạng thái nhập” (58:7641–7738 «Figma MW: chương 03 – ngưỡng, công thức, trạng thái nhập») (“chương 03, khung A – ngưỡng điểm cố định” (03-A «Figma: chương 03, khung A – ngưỡng điểm cố định — MW 58:8022») → 新規作成｜基準は未入力 (tạo mới, chưa nhập ngưỡng)); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») Chi tiết thiết kế (Thêm và đổi loại); [tài liệu chia công việc v2](../split-tasks.vi.md) ([RSD-TASK](../split-tasks.vi.md) «bản chia công việc v2») công việc “Thiết lập và lưu nhiều quy tắc” (Task 1 «Thiết lập và lưu nhiều quy tắc»)
- Bằng chứng cần chụp: Ảnh form quy tắc mới trước khi nhập; ảnh danh sách sau khi lưu (vị trí dòng mới).
- Ghi chú: Mặc định Không xử lý cho tỷ lệ là CONFIRMED (Q&A nghiệp vụ đã xác nhận câu “Tỷ lệ điểm tối đa có cho chọn xử lý phần lẻ không?”); phần còn lại PROPOSED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-013"></a>

### TC-RS-UI-013 — Ngưỡng cố định không hiển thị nguồn trung bình

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mở ngưỡng, chọn Điểm cố định（固定点数）.
- Dữ liệu test: —

**操作（Thao tác）**

Xem màn.

**期待結果（Kết quả mong đợi）**

CONFIRMED: không có khối Trung bình tham chiếu（参照する平均点）; lưu không yêu cầu chọn nguồn.

PROPOSED: ô Điểm chuẩn（基準点） + đơn vị 点 (điểm), câu 「30点未満を赤点とします。30点は赤点になりません。」 (dưới 30 là đỏ; 30 không đỏ) đổi theo giá trị/dấu, câu 「判定には登録済みの最終点数を使用します。」 (xét dùng điểm cuối đã đăng ký).

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Mở ngưỡng, chọn Điểm cố định（固定点数）. - Dữ liệu test: — | Trigger/điểm quan sát: Xem màn. | Oracle/bằng chứng: CONFIRMED: không có khối Trung bình tham chiếu（参照する平均点）; lưu không yêu cầu chọn nguồn. PROPOSED: ô Điểm chuẩn（基準点） + đơn vị 点 (điểm), câu 「30点未満を赤点とします。30点は赤点になりません。」 (dưới 30 là đỏ; 30 không đỏ) đổi theo giá trị/dấu, câu 「判定には登録済みの最終点数を使用します。」 (xét dùng điểm cuối đã đăng ký).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.6 “Khi nào không cần nguồn?”; Figma MW “chương 03 – ngưỡng, công thức, trạng thái nhập” (58:7493 «Figma MW: chương 03 – ngưỡng, công thức, trạng thái nhập») 「独立した固定条件には平均の参照欄を表示しない。」 (điều kiện cố định độc lập không hiện ô tham chiếu trung bình), “màn Ngưỡng – điểm cố định” (58:8022 «Figma MW: màn Ngưỡng – điểm cố định») (UI｜04A «Figma: màn Ngưỡng – điểm cố định — MW 58:8022»: 基準点 [test-cases.vi.md] 点, (58:8184), (58:8186))
- Bằng chứng cần chụp: Ảnh màn ngưỡng cố định trước và sau khi đổi giá trị/dấu.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-014"></a>

### TC-RS-UI-014 — Màn Tỷ lệ điểm tối đa（得点率）: mô tả M và xử lý phần lẻ

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”, mục 6.3 “Tỷ lệ điểm tối đa”, mục 6.5 “Xử lý phần lẻ”

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mở ngưỡng, chọn Tỷ lệ điểm tối đa（得点率）.
- Dữ liệu test: mục số nguyên (M=100)

**操作（Thao tác）**

1. Xem màn.
2. Chọn Có（する） ở Xử lý phần lẻ.

**期待結果（Kết quả mong đợi）**

Không có khối nguồn trung bình (đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”); Xử lý phần lẻ có Không（しない）/Có（する）, mặc định Không; khi Có thì hiện ô vị trí chữ số và phương thức.

Mô tả M theo Figma (PROPOSED): câu chung 「対象の授業・時期・単元に適用される満点を使用」 (dùng điểm tối đa áp dụng cho lớp/kỳ/đơn vị).

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Mở ngưỡng, chọn Tỷ lệ điểm tối đa（得点率）. - Dữ liệu test: mục số nguyên (M=100) | Trigger/điểm quan sát: 1. Xem màn. 2. Chọn Có（する） ở Xử lý phần lẻ. | Oracle/bằng chứng: Không có khối nguồn trung bình (đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”); Xử lý phần lẻ có Không（しない）/Có（する）, mặc định Không; khi Có thì hiện ô vị trí chữ số và phương thức. Mô tả M theo Figma (PROPOSED): câu chung 「対象の授業・時期・単元に適用される満点を使用」 (dùng điểm tối đa áp dụng cho lớp/kỳ/đơn vị).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: Figma MW “màn Ngưỡng – tỷ lệ điểm tối đa” (58:8194 «Figma MW: màn Ngưỡng – tỷ lệ điểm tối đa») (UI｜04B «Figma: màn Ngưỡng – tỷ lệ điểm tối đa — MW 58:8194»): (58:8338–8344) 得点率 [test-cases.vi.md] %, (58:8348–8351) 満点 「対象の授業・時期・単元に適用される満点を使用」 (dùng điểm tối đa áp dụng cho lớp/kỳ/đơn vị), (58:8355–8367) 端数処理 しない/する, (58:8379), (58:8381) 「平均点の参照設定は不要です。」 (không cần thiết lập tham chiếu trung bình); Figma MW “chương 03 – ngưỡng, công thức, trạng thái nhập” (58:7605–7622 «Figma MW: chương 03 – ngưỡng, công thức, trạng thái nhập») (する: 小数第 [1] 位 [切り捨て]); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.6 “Khi nào không cần nguồn?”, mục 6.3 “Tỷ lệ điểm tối đa”, mục 6.5 “Xử lý phần lẻ”
- Bằng chứng cần chụp: Ảnh hai trạng thái.
- Ghi chú: Khi đối tượng có nhiều M khác nhau, không có một giá trị M duy nhất để hiện — ghi cách màn hình thực tế hiển thị.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-015"></a>

### TC-RS-UI-015 — Màn Công thức: thứ tự khối nguồn trung bình và dòng công thức

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”, mục 6.4 “Công thức dùng trung bình”

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mở ngưỡng, chọn Công thức（計算式）.
- Dữ liệu test: —

**操作（Thao tác）**

Ghi lại thứ tự các khối từ trên xuống.

**期待結果（Kết quả mong đợi）**

Khối nguồn chỉ hiện với Công thức, không hiện với cố định/tỷ lệ (đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”).

Thứ tự khối theo Figma (PROPOSED): khối Trung bình tham chiếu（参照する平均点） nằm trước bảng dòng công thức và trước Xét điểm đỏ（赤点の判定）. Đặc tả v2 không quy định thứ tự; lệch thì ghi Notes, không FAIL.

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Mở ngưỡng, chọn Công thức（計算式）. - Dữ liệu test: — | Trigger/điểm quan sát: Ghi lại thứ tự các khối từ trên xuống. | Oracle/bằng chứng: Khối nguồn chỉ hiện với Công thức, không hiện với cố định/tỷ lệ (đặc tả v2 mục 5.6 “Khi nào không cần nguồn?”). Thứ tự khối theo Figma (PROPOSED): khối Trung bình tham chiếu（参照する平均点） nằm trước bảng dòng công thức và trước Xét điểm đỏ（赤点の判定）. Đặc tả v2 không quy định thứ tự; lệch thì ghi Notes, không FAIL.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: Figma MW “màn Ngưỡng – công thức” (58:8389 «Figma MW: màn Ngưỡng – công thức») (UI｜04C «Figma: màn Ngưỡng – công thức — MW 58:8389»): (58:8533) 参照する平均点 nằm trước bảng dòng (58:8594), (58:8563) và trước (58:8566) 赤点の判定 (xét điểm đỏ); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.6 “Khi nào không cần nguồn?”, mục 6.4 “Công thức dùng trung bình”
- Bằng chứng cần chụp: Ảnh toàn màn.
- Ghi chú: Thứ tự khối chỉ có trong Figma là PROPOSED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-016"></a>

### TC-RS-UI-016 — Bảng dòng công thức

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 6.4 “Công thức dùng trung bình”

<!-- Mã truy vết: TD-RULE-06 «Công thức hai dòng: Dòng 1: Trung bình（平均点）÷ Số cố định（固定値）2, chữ số…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Công thức.
- Dữ liệu test: quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8)

**操作（Thao tác）**

1. Nhập quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8).
2. Thêm/xóa dòng.

**期待結果（Kết quả mong đợi）**

Có đủ cột; chọn Kết quả phép tính（式の結果） thì hiện ô chọn dòng; mỗi dòng có Xử lý phần lẻ riêng; thêm/xóa dòng được; có câu dòng cuối là ngưỡng.

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Công thức. - Dữ liệu test: quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8) | Trigger/điểm quan sát: 1. Nhập quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8). 2. Thêm/xóa dòng. | Oracle/bằng chứng: Có đủ cột; chọn Kết quả phép tính（式の結果） thì hiện ô chọn dòng; mỗi dòng có Xử lý phần lẻ riêng; thêm/xóa dòng được; có câu dòng cuối là ngưỡng.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.4 “Công thức dùng trung bình”; Figma MW “màn Ngưỡng – công thức” (58:8594 «Figma MW: màn Ngưỡng – công thức»), (58:8563) (cột No / 左辺 (vế trái) / 演算子 (toán tử) / 右辺 (vế phải) / 端数処理 / 削除; 式1 平均点 ÷ 固定値 2; 式2 式の結果 [式1] × 固定値 0.8, 小数第1位 切り捨て; nút 計算式を追加 (thêm công thức)), (58:8581) 「最後の式の結果を基準点として使用します。」 (dùng kết quả dòng cuối làm điểm chuẩn); “chương 03 – ngưỡng, công thức, trạng thái nhập” (58:7899 «Figma MW: chương 03 – ngưỡng, công thức, trạng thái nhập») (biến thể 「…赤点の基準点として…」)
- Bằng chứng cần chụp: Ảnh bảng công thức sau khi nhập quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8), sau khi thêm dòng và sau khi xóa dòng.
- Ghi chú: Câu chữ về dòng cuối trên Figma khác nhau giữa màn Ngưỡng – công thức và phần giải thích của chương 03 (ngưỡng, công thức, trạng thái nhập) — ghi nhận, không đánh giá câu chữ.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-017"></a>

### TC-RS-UI-017 — Thông báo lỗi vượt điểm tối đa và chia 0

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: đặc tả v2 mục 8.4 “Lỗi kỹ thuật và thông báo”

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TC-RS-VAL-001, TC-RS-VAL-009 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100).
- Dữ liệu test: mục số nguyên (M=100); Cố định N=120; công thức `A ÷ 0`

**操作（Thao tác）**

1. Lưu N=120.
2. Lưu công thức chia 0.

**期待結果（Kết quả mong đợi）**

1. Không lưu được. Đầu vùng nhập có 「基準点が対象の満点を超えています。対象の満点以下の値を入力してください。」 (điểm chuẩn vượt điểm tối đa của đối tượng; hãy nhập giá trị không vượt điểm tối đa); tại ô Điểm chuẩn（基準点） có 「対象の満点（100点）以下の値を入力してください。」 và dòng 「対象の満点：100点」 (điểm tối đa của đối tượng: 100); giá trị 120 còn giữ.
2. Không lưu được. Đầu vùng nhập có 「式1：0で割ることはできません。右辺の値を変更してください。」 (dòng 1: không thể chia cho 0; đổi giá trị vế phải); tại dòng 1 có 「0で割ることはできません。右辺の値を変更してください。」; các giá trị đã nhập còn giữ.

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100). - Dữ liệu test: mục số nguyên (M=100); Cố định N=120; công thức `A ÷ 0` | Trigger/điểm quan sát: 1. Lưu N=120. 2. Lưu công thức chia 0. | Oracle/bằng chứng: 1. Không lưu được. Đầu vùng nhập có 「基準点が対象の満点を超えています。対象の満点以下の値を入力してください。」 (điểm chuẩn vượt điểm tối đa của đối tượng; hãy nhập giá trị không vượt điểm tối đa); tại ô Điểm chuẩn（基準点） có 「対象の満点（100点）以下の値を入力してください。」 và dòng 「対象の満点：100点」 (điểm tối đa của đối tượng: 100); giá trị 120 còn giữ. 2. Không lưu được. Đầu vùng nhập có 「式1：0で割ることはできません。右辺の値を変更してください。」 (dòng 1: không thể chia cho 0; đổi giá trị vế phải); tại dòng 1 có 「0で割ることはできません。右辺の値を変更してください。」; các giá trị đã nhập còn giữ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: Figma MW “chương 03 – ngưỡng, công thức, trạng thái nhập” (58:7909 «Figma MW: chương 03 – ngưỡng, công thức, trạng thái nhập») (trạng thái vượt điểm tối đa: (58:7979), (58:8000), (58:8015)); Figma MW (58:7746) (trạng thái chia 0: (58:7816), (58:7907)); Figma MW (58:8712) (giữ giá trị đã nhập); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 8.4 “Lỗi kỹ thuật và thông báo”
- Bằng chứng cần chụp: Ảnh thông báo lỗi và ô/dòng bị đánh dấu cho từng bước, thấy giá trị đã nhập còn giữ.
- Ghi chú: File Figma cũ có hai biến thể câu chữ cho mỗi thông báo (vượt điểm tối đa và chia 0); file MW chỉ còn một bộ như trên nên case chuyển từ CONFLICT sang PROPOSED (câu chữ vẫn là thiết kế, chưa phải yêu cầu đã xác nhận). Khác câu chữ nhưng đúng ý nghĩa và vị trí: ghi Notes, không FAIL. Hành vi chặn lưu: case “Điểm cố định: biên −1 / 0 / 100 / 101 với M=100”, case “Chia cho số cố định 0 không lưu được”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-018"></a>

### TC-RS-UI-018 — Màn Tổng hợp thành tích（成績集計）: nút xanh/cam và lần chạy trước

Priority: TBD ｜ Status: IMPLEMENTED ｜ Requirement ID: đặc tả v2 mục 7.2 “Bảng sự kiện”

<!-- Mã truy vết: TD-ROLE-03 «Người có quyền chạy hàng loạt: Có quyền thực hiện Thực hiện tổng…», TC-RS-FUNC-021 -->

**前提条件（Điều kiện trước）**

- Điều kiện: tài khoản có quyền chạy hàng loạt; trường có tính tự động.
- Dữ liệu test: tài khoản có quyền chạy hàng loạt

**操作（Thao tác）**

Mở Tổng hợp thành tích（成績集計）.

**期待結果（Kết quả mong đợi）**

Mỗi khối có Thực hiện tổng hợp（集計実行） và Thực hiện tính toán tự động（自動算出実行） kèm thời điểm chạy trước, như màn hiện có.

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: tài khoản có quyền chạy hàng loạt; trường có tính tự động. - Dữ liệu test: tài khoản có quyền chạy hàng loạt | Trigger/điểm quan sát: Mở Tổng hợp thành tích（成績集計）. | Oracle/bằng chứng: Mỗi khối có Thực hiện tổng hợp（集計実行） và Thực hiện tính toán tự động（自動算出実行） kèm thời điểm chạy trước, như màn hiện có.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: Figma MW “màn Tổng hợp thành tích（成績集計） – nút xanh/cam, lần chạy trước” (58:7232 «Figma MW: màn Tổng hợp thành tích（成績集計） – nút xanh/cam, lần chạy trước») (UI｜06 «Figma: màn Tổng hợp thành tích（成績集計） – nút xanh/cam, lần chạy trước — MW 58:7232»): cột (58:7356–7371) (学年, 集計対象時期, 集計者, 集計日時, 順位集計, 成績自動算出), nút (58:7392) 集計実行 / (58:7397) 自動算出実行, (58:7399) 「前回実行：…」 (lần chạy trước), (58:7458); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.2 “Bảng sự kiện”
- Bằng chứng cần chụp: Ảnh từng khối có hai nút và thời điểm chạy trước.
- Ghi chú: Câu cuối trang của màn Tổng hợp thành tích（成績集計） trên Figma (nút xanh/cam, lần chạy trước) là PROPOSED. Nút cam với trường chỉ có quy tắc đỏ: case “Trường chỉ có quy tắc đỏ (không có tính tự động) vẫn có đường chạy hàng loạt” (cách hiển thị chưa chốt).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-019"></a>

### TC-RS-UI-019 — Thông báo kết quả sau khi chạy: hoàn tất, chưa xét được, thất bại một phần

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn” (AC-G26 «Lưu thành công và thông báo an toàn»)

<!-- Mã truy vết: TC-RS-BR-010, TC-RS-ERR-003, TD-SRC-03 «Không có tổng hợp: Nguồn chưa từng chạy tổng hợp», TC-RS-ERR-002 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Như case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác” (thiếu nguồn) và case “Batch hoàn tất một phần: báo đúng phạm vi đã/không cập nhật” (lỗi một phần).
- Dữ liệu test: nguồn chưa có kết quả tổng hợp

**操作（Thao tác）**

1. Chạy nút cam khi thiếu nguồn.
2. Chạy khi có lỗi một phần (theo cách giả lập được team dev cho phép).

**期待結果（Kết quả mong đợi）**

1. Thông báo hoàn tất nêu có mục chưa xét được, phạm vi và lý do, và kết quả trước không còn dùng.
2. Thông báo nêu phạm vi đã cập nhật / chưa cập nhật và hướng dẫn chạy lại; không báo hoàn tất toàn bộ.

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Như case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác” (thiếu nguồn) và case “Batch hoàn tất một phần: báo đúng phạm vi đã/không cập nhật” (lỗi một phần). - Dữ liệu test: nguồn chưa có kết quả tổng hợp | Trigger/điểm quan sát: 1. Chạy nút cam khi thiếu nguồn. 2. Chạy khi có lỗi một phần (theo cách giả lập được team dev cho phép). | Oracle/bằng chứng: 1. Thông báo hoàn tất nêu có mục chưa xét được, phạm vi và lý do, và kết quả trước không còn dùng. 2. Thông báo nêu phạm vi đã cập nhật / chưa cập nhật và hướng dẫn chạy lại; không báo hoàn tất toàn bộ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 8.4 “Lỗi kỹ thuật và thông báo”; Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:7047–7060 «Figma MW: chương 04 – đăng ký, tổng hợp, chạy lại và kết quả»), (58:7062) (「対象：第2学年・1学期期末 ／ 数学・評点（参照する平均点が不足）」 (đối tượng… thiếu trung bình tham chiếu)); Figma MW (58:7465–7479) (「一部のデータを保存できませんでした。…」 (một phần dữ liệu không lưu được), 更新済みの範囲 / 更新できなかった範囲, 「…保存失敗を「判定完了」として扱いません。」 (không coi lưu thất bại là xét xong))
- Bằng chứng cần chụp: Ảnh thông báo sau mỗi lần chạy (toàn văn thông báo).
- Ghi chú: Nguyên tắc phân biệt thành công / thiếu dữ liệu / lỗi kỹ thuật là CONFIRMED (đặc tả v2 mục 8.4 “Lỗi kỹ thuật và thông báo”, kiểm ở case “Lỗi kỹ thuật khi lưu kết quả khác với Chưa xét được; không báo thành công giả”/003); câu chữ và bố cục là PROPOSED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-020"></a>

### TC-RS-UI-020 — Trích xuất: vị trí và nhãn tùy chọn đỏ

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 9.1 “Thiết lập”

<!-- Mã truy vết: TD-ROLE-07 «Người phụ trách đầu ra: Có quyền Trích xuất thành tích（成績抽出）, Thiết lập…», TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-OUT-01 «Trích xuất lọc + ký hiệu trước + màu: Lọc học sinh có điểm đỏ（抽出する） BẬT»,  -->

**前提条件（Điều kiện trước）**

- Điều kiện: tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm); mục số nguyên (M=100) có quy tắc.
- Dữ liệu test: mục số nguyên (M=100); cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu

**操作（Thao tác）**

1. Mở Trích xuất thành tích（成績抽出）→ Thiết lập mục hiển thị（表示項目設定）→ chi tiết mục Điểm đánh giá（評点） kỳ Cuối kỳ học kỳ 1（1学期期末）.
2. Ghi lại vị trí và nhãn các tùy chọn đỏ.

**期待結果（Kết quả mong đợi）**

Theo specification v2 mục 9.1, có bốn tùy chọn độc lập: lọc học sinh có điểm đỏ, ký hiệu phía trước, ký hiệu phía sau và tô màu ô; màu chỉ chọn từ bảng màu hiện có. Vị trí và nhãn cụ thể trên UI theo Figma chỉ là tham khảo, không thay đổi oracle nghiệp vụ.

Không đánh giá nhãn/vị trí cụ thể của Figma như một oracle riêng; chỉ kiểm tra đủ bốn tùy chọn nghiệp vụ và việc lưu/mở lại đúng giá trị.

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm); mục số nguyên (M=100) có quy tắc. - Dữ liệu test: mục số nguyên (M=100); cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu | Trigger/điểm quan sát: 1. Mở Trích xuất thành tích（成績抽出）→ Thiết lập mục hiển thị（表示項目設定）→ chi tiết mục Điểm đánh giá（評点） kỳ Cuối kỳ học kỳ 1（1学期期末）. 2. Ghi lại vị trí và nhãn các tùy chọn đỏ. | Oracle/bằng chứng: Phần không tranh chấp: có bốn tùy chọn độc lập (lọc, ký hiệu trước, ký hiệu sau, tô màu); màu dùng bảng màu hiện có (đặc tả v2 mục 9.1 “Thiết lập”). Phần tranh chấp (không đánh giá): tùy chọn nằm ở Thiết lập chi tiết thông tin lớp học（授業情報の詳細設定） với nhãn 抽出する / 強調記号を接頭に表示する / 強調記号を接尾に表示する / セルを色付けする (frame “tùy chọn đỏ ở Trích xuất thành tích (đặc tả v2: 05-A «Figma: chương 05, khung A – thiết lập cách hiển thị/trích xuất — MW 58:6250»)”) hay ở màn điều kiện trích xuất với nhãn của frame “chương; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: Figma MW “tùy chọn đỏ ở Trích xuất thành tích (đặc tả v2: 05-A «Figma: chương 05, khung A – thiết lập cách hiển thị/trích xuất — MW 58:6250»)” (58:6359 «Figma MW: tùy chọn đỏ ở Trích xuất thành tích (đặc tả v2: 05-A)») (UI｜07A «Figma: tùy chọn đỏ ở Trích xuất thành tích (đặc tả v2: 05-A) — MW 58:6359», (58:6491–6536), khớp bốn tùy chọn ở đặc tả v2 mục 9.1, nút 戻る / 更新する); Figma MW “chương 05, khung A – thiết lập cách hiển thị/trích xuất” (58:6321–6354 «Figma MW: chương 05, khung A – thiết lập cách hiển thị/trích xuất») (05-A, màn 成績抽出 với 赤点の設定: 「赤点のある生徒を抽出する」 (trích xuất học sinh có điểm đỏ), 「前に記号を付ける」 (gắn ký hiệu phía trước), 「後ろに記号を付ける」, 「セルに色を付ける」, nút 戻る / 抽出する); xung đột giữa các frame Figma về “Nhãn và vị trí tùy chọn đỏ ở Trích xuất thành tích（成績抽出）” (); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 9.1 “Thiết lập”
- Bằng chứng cần chụp: Ảnh màn.
- Ghi chú: Đặc tả v2 mục 9.1 nêu bốn tùy chọn nhưng không chốt nhãn tiếng Nhật và vị trí; hai frame Figma khác nhau.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-021"></a>

### TC-RS-UI-021 — Trích xuất: kết quả 0 học sinh và hiển thị ô đỏ số thập phân

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: tiêu chí nghiệm thu “Lọc khi trích xuất” (AC-G29 «Lọc khi trích xuất»)

<!-- Mã truy vết: TD-OUT-01 «Trích xuất lọc + ký hiệu trước + màu: Lọc học sinh có điểm đỏ（抽出する） BẬT» -->

**前提条件（Điều kiện trước）**

- Điều kiện: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu.
- Dữ liệu test: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu; (a) Không ô đỏ nào; (b) học sinh điểm 23.9 Đỏ (mục thập phân)

**操作（Thao tác）**

Chạy trích xuất cho (a), (b).

**期待結果（Kết quả mong đợi）**

(a) Không lỗi; hiện thông báo không có học sinh khớp.

(b) Ô hiện `*23.9` (giữ nguyên giá trị điểm).

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu. - Dữ liệu test: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu; (a) Không ô đỏ nào; (b) học sinh điểm 23.9 Đỏ (mục thập phân) | Trigger/điểm quan sát: Chạy trích xuất cho (a), (b). | Oracle/bằng chứng: (a) Không lỗi; hiện thông báo không có học sinh khớp. (b) Ô hiện `*23.9` (giữ nguyên giá trị điểm).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: Figma MW “chương 05 – trích xuất thành tích và kết quả Excel” (58:6247 «Figma MW: chương 05 – trích xuất thành tích và kết quả Excel») 「0件は正常。未判定を非赤点／合格と数えない。」 (0 kết quả là bình thường; không tính chưa xét được là không đỏ/đạt), “chương 05, khung A – thiết lập cách hiển thị/trích xuất” (58:6354 «Figma MW: chương 05, khung A – thiết lập cách hiển thị/trích xuất») 「条件に一致する生徒はいません。」 (không có học sinh khớp điều kiện); Figma MW “kết quả Trích xuất thành tích (đặc tả v2: 05-B)” (58:6779 «Figma MW: kết quả Trích xuất thành tích (đặc tả v2: 05-B)») `*29`, (58:6803) `*23.9`
- Bằng chứng cần chụp: Ảnh kết quả trích xuất (a) và ô S=23.9 ở (b).
- Ghi chú: 0 kết quả không phải lỗi và không tính chưa xét được là không đỏ: nguyên tắc CONFIRMED (đặc tả v2 mục 8.1 “Các trạng thái phải phân biệt”, mục 9.2 “Kết quả và ví dụ”); câu chữ PROPOSED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-022"></a>

### TC-RS-UI-022 — Công khai: dòng cách hiển thị đỏ theo mục có thiết lập, kể cả khi 0 học sinh đỏ hoặc vừa xóa thiết lập cuối

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Cấu hình công khai và ẩn điểm” (AC-G32 «Cấu hình công khai và ẩn điểm»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-ROLE-07 «Người phụ trách đầu ra: Có quyền Trích xuất thành tích（成績抽出）, Thiết lập…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TC-RS-BR-019 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có quy tắc nhưng không ô nào đỏ; mục Tri thức – kỹ năng（知識・技能） chưa từng có quy tắc và chưa từng đặt cách hiển thị đỏ. tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm).
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

1. Mở Thiết lập công khai thành tích（成績公開設定）→ khung Thành tích（成績）.
2. Ở dòng của Điểm đánh giá（評点）, chọn `*` phía trước, bấm Đăng ký（登録する）.
3. Xóa quy tắc cuối của mục số nguyên (M=100) (chỉ còn quy tắc “Cố định 30” (dưới 30) thì xóa quy tắc “Cố định 30” (dưới 30)), **không** chạy lại; mở lại khung Thành tích（成績）.

**期待結果（Kết quả mong đợi）**

1. Mục Điểm đánh giá（評点） có dòng cách hiển thị đỏ dù 0 học sinh đỏ; mục Tri thức – kỹ năng（知識・技能） không có dòng.
2. Lưu được; mở lại vẫn là `*` phía trước.
3. Dòng của Điểm đánh giá（評点） vẫn hiện với lựa chọn `*` phía trước đã lưu; cấu hình trình bày không bị xóa theo thao tác xóa quy tắc.

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) có quy tắc nhưng không ô nào đỏ; mục Tri thức – kỹ năng（知識・技能） chưa từng có quy tắc và chưa từng đặt cách hiển thị đỏ. tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm). - Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30) | Trigger/điểm quan sát: 1. Mở Thiết lập công khai thành tích（成績公開設定）→ khung Thành tích（成績）. 2. Ở dòng của Điểm đánh giá（評点）, chọn `*` phía trước, bấm Đăng ký（登録する）. 3. Xóa quy tắc cuối của mục số nguyên (M=100) (chỉ còn quy tắc “Cố định 30” (dưới 30) thì xóa quy tắc “Cố định 30” (dưới 30)), **không** chạy lại; mở lại khung Thành tích（成績）. | Oracle/bằng chứng: 1. Mục Điểm đánh giá（評点） có dòng cách hiển thị đỏ dù 0 học sinh đỏ; mục Tri thức – kỹ năng（知識・技能） không có dòng. 2. Lưu được; mở lại vẫn là `*` phía trước. 3. Dòng của Điểm đánh giá（評点） vẫn hiện với lựa chọn `*` phía trước đã lưu; cấu hình trình bày không bị xóa theo thao tác xóa quy tắc.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 10.1 “Phạm vi và tùy chọn” (không dùng phép kiểm "còn rule không?" để bỏ ngay dấu đã cấu hình; không xóa cấu hình trình bày đã lưu khi xóa quy tắc); Figma MW “tùy chọn đỏ ở Công khai thành tích (đặc tả v2: 06-A)” (58:5622 «Figma MW: tùy chọn đỏ ở Công khai thành tích (đặc tả v2: 06-A)») (UI｜07B «Figma: tùy chọn đỏ ở Công khai thành tích (đặc tả v2: 06-A) — MW 58:5622»: (58:5783–5785) 「［赤点］判定時に評価項目の値を [前に「*」付きで表示する]」); Figma MW “chương 06 – công khai thành tích và màn học sinh” (58:5592 «Figma MW: chương 06 – công khai thành tích và màn học sinh») 「設定がある項目、または最後の設定削除後で再実行前の項目に表示方法の行を出す。赤点0人・未判定でも行は出る。」 (mục có thiết lập, hoặc mục vừa xóa thiết lập cuối mà chưa chạy lại, thì hiện dòng; 0 học sinh đỏ/chưa xét cũng hiện), “chương 06 – dòng Cách hiển thị điểm đỏ（赤点の表示方法）có/không hiện” (58:5611–5621 «Figma MW: chương 06 – dòng Cách hiển thị điểm đỏ（赤点の表示方法）có/không hiện») (B: 「一度も表示方法を設定していない」 (chưa từng đặt cách hiển thị) thì không hiện dòng; 「最後の設定削除直後は行を残す。保存済みの表示方法は消さない。」 (ngay sau khi xóa thiết lập cuối vẫn giữ dòng, không xóa cách hiển thị đã lưu))
- Bằng chứng cần chụp: Ảnh khung Thành tích（成績） có cả hai mục (bước 1); ảnh sau khi mở lại ở bước 2 và bước 3.
- Sau khi chạy: Tạo lại quy tắc “Cố định 30” (dưới 30) cho mục số nguyên (M=100) nếu case sau cần.
- Ghi chú: Hiện dòng theo mục có thiết lập và giữ cấu hình trình bày đã lưu khi xóa quy tắc là CONFIRMED (đặc tả v2 mục 10.1 “Phạm vi và tùy chọn”). Việc dòng vẫn hiện sau khi xóa thiết lập cuối và trước khi chạy lại theo Figma MW; nếu build ẩn dòng nhưng vẫn giữ giá trị đã lưu và dấu trên màn học sinh thì ghi Notes, không FAIL. Dấu trên màn học sinh sau khi xóa quy tắc cuối: case “Xóa quy tắc cuối: giữ kết quả tới lần chạy lại; chạy lại → Không áp dụng”. Nhãn dòng là PROPOSED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-023"></a>

### TC-RS-UI-023 — Công khai: danh sách tùy chọn hiển thị đỏ

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 10.1 “Phạm vi và tùy chọn”

<!-- Mã truy vết:  -->

**前提条件（Điều kiện trước）**

- Điều kiện: Như UI-022.
- Dữ liệu test: —

**操作（Thao tác）**

Mở danh sách chọn của dòng đỏ.

**期待結果（Kết quả mong đợi）**

Theo specification v2 mục 10.1 và Q&A Q16, danh sách chỉ có Kèm ngoặc, `*` phía trước và `*` phía sau; không có ô chữ tự do và không có màu nền riêng. Không đưa tùy chọn Nguyên trạng（そのまま表示） vào oracle vì không thuộc danh sách đã chốt trong specification/Q&A.

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Như UI-022. - Dữ liệu test: — | Trigger/điểm quan sát: Mở danh sách chọn của dòng đỏ. | Oracle/bằng chứng: Phần không tranh chấp: có Kèm ngoặc, `*` phía trước, `*` phía sau; không có ô chữ tự do; không có màu nền (đặc tả v2 mục 10.1 “Phạm vi và tùy chọn”). Phần tranh chấp (không đánh giá): có hay không tùy chọn Nguyên trạng（原状）.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?” (Q16 «Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?»): 括弧つき (có ngoặc) / 前に「*」 / 後ろに「*」; Figma MW “chương 06 – công khai thành tích và màn học sinh” (58:5591 «Figma MW: chương 06 – công khai thành tích và màn học sinh») 「原状／括弧／固定*の前後。自由文字・赤点専用背景色は追加しない。」 (nguyên trạng / ngoặc / `*` cố định trước-sau; không thêm chữ tự do và màu nền riêng); xung đột Figma–đặc tả về “Tùy chọn hiển thị đỏ ở Công khai thành tích（成績公開）” (); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 10.1 “Phạm vi và tùy chọn”
- Bằng chứng cần chụp: Ảnh danh sách chọn.
- Ghi chú: Có cần thêm Nguyên trạng（そのまま表示） cho dòng đỏ hay không chưa chốt.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-024"></a>

### TC-RS-UI-024 — Phiếu điểm: hộp Thiết lập hiển thị tùy chọn mục đăng ký điểm（成績登録項目オプション表示設定）

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Tùy chọn trên phiếu” (AC-G35 «Tùy chọn trên phiếu»)

<!-- Mã truy vết: TD-ROLE-07 «Người phụ trách đầu ra: Có quyền Trích xuất thành tích（成績抽出）, Thiết lập…», TD-OUT-04 «Phiếu điểm: Dòng Thiết lập điểm đỏ（赤点設定）: Ký tự phía trước（前に任意の文字） `※`» -->

**前提条件（Điều kiện trước）**

- Điều kiện: tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm); mẫu phiếu có ô Điểm đánh giá（評点）.
- Dữ liệu test: cấu hình phiếu điểm: ký tự “※” phía trước

**操作（Thao tác）**

1. Mở hộp tùy chọn của ô, chọn Thiết lập（設定する）.
2. Ghi lại thứ tự dòng và các lựa chọn của dòng Thiết lập điểm đỏ（赤点設定）.

**期待結果（Kết quả mong đợi）**

CONFIRMED: dòng đỏ nằm sau các dòng checkbox và trước Trường hợp ô trống（空欄の場合）; lựa chọn của dòng đỏ là Nguyên trạng（そのまま表示）, Kèm ngoặc（カッコ付き）, Ký tự phía trước（前に任意の文字）, Ký tự phía sau（後ろに任意の文字）; không có Ẩn（表示しない）/Gạch chéo（斜線）.

PROPOSED: nhãn dòng 「赤点設定」 (thiết lập điểm đỏ) và câu ghi chú.

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm); mẫu phiếu có ô Điểm đánh giá（評点）. - Dữ liệu test: cấu hình phiếu điểm: ký tự “※” phía trước | Trigger/điểm quan sát: 1. Mở hộp tùy chọn của ô, chọn Thiết lập（設定する）. 2. Ghi lại thứ tự dòng và các lựa chọn của dòng Thiết lập điểm đỏ（赤点設定）. | Oracle/bằng chứng: CONFIRMED: dòng đỏ nằm sau các dòng checkbox và trước Trường hợp ô trống（空欄の場合）; lựa chọn của dòng đỏ là Nguyên trạng（そのまま表示）, Kèm ngoặc（カッコ付き）, Ký tự phía trước（前に任意の文字）, Ký tự phía sau（後ろに任意の文字）; không có Ẩn（表示しない）/Gạch chéo（斜線）. PROPOSED: nhãn dòng 「赤点設定」 (thiết lập điểm đỏ) và câu ghi chú.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Điều kiện điểm đỏ nằm ở đâu trên phiếu điểm?” (Q29 «Điều kiện điểm đỏ nằm ở đâu trên phiếu điểm?»); Figma MW “tùy chọn đỏ ở Công cụ phiếu điểm (đặc tả v2: 07-A)” (58:5176 «Figma MW: tùy chọn đỏ ở Công cụ phiếu điểm (đặc tả v2: 07-A)») (UI｜07C «Figma: tùy chọn đỏ ở Công cụ phiếu điểm (đặc tả v2: 07-A) — MW 58:5176»): (58:5386) 「※上から最初に一致した条件の表示方法を使用します。非表示・斜線の設定は維持します。」, dòng (58:5401) 特定の科目の場合 → (58:5418) [見込点]チェック → [未受験]チェック → (58:5434) 赤点設定 → (58:5464) 空欄の場合, (58:5474); Figma MW “chương 07 – phiếu điểm PDF” (58:5175 «Figma MW: chương 07 – phiếu điểm PDF»)
- Bằng chứng cần chụp: Ảnh hộp.
- Ghi chú: Trong dữ liệu text Figma có lớp chồng hiển thị [未受験] sau 赤点設定; hiển thị của frame “tùy chọn đỏ ở Công cụ phiếu điểm (đặc tả v2: 07-A)” xác nhận thứ tự nhìn thấy khớp Q&A nghiệp vụ đã xác nhận câu “Điều kiện điểm đỏ nằm ở đâu trên phiếu điểm?”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-026"></a>

### TC-RS-UI-026 — Bộ chọn hiệu ứng đỏ của điểm thường và điểm đơn vị hiển thị độc lập

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Cấu hình công khai và ẩn điểm” (AC-G32 «Cấu hình công khai và ẩn điểm»)

<!-- Mã truy vết: Q38, AC-G32 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Có một cấu hình công khai chứa cả mục điểm thường và mục điểm đơn vị; tài khoản có quyền sửa cấu hình công khai.
- Dữ liệu test: mục thường và mục đơn vị cùng có kết quả đỏ; lựa chọn hiển thị khác nhau cho hai loại.

**操作（Thao tác）**

1. Mở màn hình cấu hình công khai và đến khu vực hiển thị điểm đỏ.
2. Kiểm tra panel điểm thường và panel điểm đơn vị.
3. Chọn hiệu ứng khác nhau cho hai panel, lưu, đóng và mở lại.

**期待結果（Kết quả mong đợi）**

1. Cả hai panel đều hiển thị bộ chọn tương ứng; panel điểm đơn vị không bị nền hoặc lớp khác che.
2. Có thể thao tác hai bộ chọn độc lập.
3. Sau khi mở lại, mỗi panel giữ đúng lựa chọn của mình; lựa chọn điểm thường không ghi đè lựa chọn điểm đơn vị và ngược lại.

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Có một cấu hình công khai chứa cả mục điểm thường và mục điểm đơn vị; tài khoản có quyền sửa cấu hình công khai. - Dữ liệu test: mục thường và mục đơn vị cùng có kết quả đỏ; lựa chọn hiển thị khác nhau cho hai loại. | Trigger/điểm quan sát: 1. Mở màn hình cấu hình công khai và đến khu vực hiển thị điểm đỏ. 2. Kiểm tra panel điểm thường và panel điểm đơn vị. 3. Chọn hiệu ứng khác nhau cho hai panel, lưu, đóng và mở lại. | Oracle/bằng chứng: 1. Cả hai panel đều hiển thị bộ chọn tương ứng; panel điểm đơn vị không bị nền hoặc lớp khác che. 2. Có thể thao tác hai bộ chọn độc lập. 3. Sau khi mở lại, mỗi panel giữ đúng lựa chọn của mình; lựa chọn điểm thường không ghi đè lựa chọn điểm đơn vị và ngược lại.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [xác nhận thiết kế ngày 30/09](../../../sources/2026-09-30-design-review-confirmation.vi.md) (Q38: hai phía thường/đơn vị phải hiển thị và kiểm được lựa chọn độc lập); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 10.1; [checklist cập nhật Figma](../figma-update-checklist.vi.md) mục 5.
- Bằng chứng cần chụp: Ảnh trước khi thao tác; ảnh từng panel sau khi chọn; ảnh mở lại sau khi lưu.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-ui-025"></a>

### TC-RS-UI-025 — Loại ngưỡng/điều kiện chưa thuộc phạm vi phát hành không hiện như đang hoạt động

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Phạm vi từng đợt” (AC-G40 «Phạm vi từng đợt»)

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Có danh sách phạm vi phát hành (đặc tả v2 mục 1.4, mục 13.1).
- Dữ liệu test: —

**操作（Thao tác）**

1. Mở màn Điều kiện áp dụng（適用条件設定）, xem các loại điều kiện.
2. Mở màn Ngưỡng đỏ（赤点の基準）, xem các loại ngưỡng.
3. Với loại không có trong danh sách phát hành (ví dụ Công thức（計算式）, điều kiện Trung bình（平均点））: nếu chọn được thì thử Lưu.

**期待結果（Kết quả mong đợi）**

Loại ngoài phạm vi không hiện như lựa chọn dùng được; không lưu được cấu hình dùng loại đó.

**補足（Bổ sung）**
- Chức năng: Giao diện và hiển thị
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Có danh sách phạm vi phát hành (đặc tả v2 mục 1.4, mục 13.1). - Dữ liệu test: — | Trigger/điểm quan sát: 1. Mở màn Điều kiện áp dụng（適用条件設定）, xem các loại điều kiện. 2. Mở màn Ngưỡng đỏ（赤点の基準）, xem các loại ngưỡng. 3. Với loại không có trong danh sách phát hành (ví dụ Công thức（計算式）, điều kiện Trung bình（平均点））: nếu chọn được thì thử Lưu. | Oracle/bằng chứng: Loại ngoài phạm vi không hiện như lựa chọn dùng được; không lưu được cấu hình dùng loại đó.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: BLOCKED

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 1.4 “Ranh giới giữa thiết kế đầy đủ và phạm vi triển khai”
- Bằng chứng cần chụp: Ảnh màn.
- Ghi chú: BLOCKED cho tới khi có danh sách phạm vi phát hành (đặc tả v2 mục 13.1). Các case của loại không được chọn: SKIPPED ([tài liệu “Chiến lược kiểm thử”](scope-and-approach.vi.md) mục 1 “Phạm vi”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-001"></a>

### TC-RS-ERR-001 — Hiển thị theo từng trạng thái kết quả ở ba đầu ra

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Trạng thái sau lần chạy” (AC-G20 «Trạng thái sau lần chạy»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TC-RS-BR-010, TC-RS-BR-002, TD-OUT-01 «Trích xuất lọc + ký hiệu trước + màu: Lọc học sinh có điểm đỏ（抽出する） BẬT», TD-OUT-03 «Công khai: Hiệu ứng đỏ: `*` phía trước（前に「*」）», TD-OUT-04 «Phiếu điểm: Dòng Thiết lập điểm đỏ（赤点設定）: Ký tự phía trước（前に任意の文字） `※`» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Chuẩn bị bảy ô cùng mục mục số nguyên (M=100): (1) Đỏ; (2) Không đỏ; (3) Chưa từng xét (ô mới, chưa có lượt xét); (4) Chưa xét được (như case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”); (5) Không áp dụng (như case “Không quy tắc nào khớp khi đủ dữ liệu → Không áp dụng”); (6) Không có điểm (S05); (7) Đang chờ chạy lại: Đỏ trước đó, sau đó đổi ngưỡng và chưa chạy lại.
- Dữ liệu test: mục số nguyên (M=100); cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, cấu hình công khai: “*” phía trước, cấu hình phiếu điểm: ký tự “※” phía trước

**操作（Thao tác）**

1. Chạy trích xuất có lọc đỏ và xuất Excel.
2. Xem màn học sinh công khai.
3. Xuất PDF phiếu.

**期待結果（Kết quả mong đợi）**

Chỉ ô (1) và (7) có dấu đỏ và làm học sinh thỏa lọc đỏ. Ô (2)–(6) không có dấu đỏ, không thỏa lọc; (3), (4), (5) không được hiển thị như "đạt". Ba đầu ra cho cùng kết luận.

**補足（Bổ sung）**
- Chức năng: Trạng thái, lỗi và quyền
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Chuẩn bị bảy ô cùng mục mục số nguyên (M=100): (1) Đỏ; (2) Không đỏ; (3) Chưa từng xét (ô mới, chưa có lượt xét); (4) Chưa xét được (như case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”); (5) Không áp dụng (như case “Không quy tắc nào khớp khi đủ dữ liệu → Không áp dụng”); (6) Không có điểm (S05); (7) Đang chờ chạy lại: Đỏ trước đó, sau đó đổi ngưỡng và chưa chạy lại. - Dữ liệu test: mục số nguyên (M=100); cấu hình trích xuất: lọc, ký hiệu “*” phía tr | Trigger/điểm quan sát: 1. Chạy trích xuất có lọc đỏ và xuất Excel. 2. Xem màn học sinh công khai. 3. Xuất PDF phiếu. | Oracle/bằng chứng: Chỉ ô (1) và (7) có dấu đỏ và làm học sinh thỏa lọc đỏ. Ô (2)–(6) không có dấu đỏ, không thỏa lọc; (3), (4), (5) không được hiển thị như "đạt". Ba đầu ra cho cùng kết luận.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 8.1 “Các trạng thái phải phân biệt” (bảng trạng thái và cột Dấu/lọc đỏ, đoạn "Đang chờ chạy lại"), mục 9.2 “Kết quả và ví dụ”, mục 10.3 “Quyền, thời điểm và đầu ra liên quan”, mục 11.2 “Thứ tự và điều kiện khớp đầu tiên”
- Bằng chứng cần chụp: File Excel, ảnh màn học sinh, file PDF.
- Ghi chú: Không bắt buộc có nhãn trạng thái trên màn học sinh (đặc tả v2 mục 8.1 “Các trạng thái phải phân biệt”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-002"></a>

### TC-RS-ERR-002 — Lỗi kỹ thuật khi lưu kết quả khác với Chưa xét được; không báo thành công giả

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn” (AC-G26 «Lưu thành công và thông báo an toàn»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-STU-01 «S01: G-A, HR1», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», AC-G26 -->

**前提条件（Điều kiện trước）**

- Điều kiện: S01 Đỏ. Có cách gây lỗi ghi kết quả trong lượt đăng ký và lỗi lưu điểm. Có file CSV điểm và bài thi đã chấm liên kết tới mục số nguyên (M=100) cho G-A.
- Dữ liệu test: học sinh S01 (điểm 29); mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

1. Đường (a) nhập trực tiếp ở màn đăng ký điểm của lớp: sửa S01 thành 40 trong khi giả lập lỗi ghi kết quả.
2. Đường (b) Đăng ký thành tích bằng CSV（成績CSV登録）: nhập S01 = 40 trong khi giả lập lỗi ghi kết quả.
3. Đường (c) liên kết điểm thi: liên kết S01 = 40 trong khi giả lập lỗi ghi kết quả.
4. Với một đường bất kỳ, giả lập lỗi ngay ở bước lưu điểm (điểm không được lưu).
5. Sau mỗi bước, xem thông báo, điểm và ba đầu ra.

**期待結果（Kết quả mong đợi）**

1–3. Ở cả ba đường: không báo đã xét thành công hay đã ngừng kết quả cũ. Điểm và kết quả nhất quán theo ranh giới giao dịch của đường đăng ký (không có tình trạng điểm 40 đã công bố thành công nhưng kết quả vẫn là Đỏ của 29 mà không có thông báo). Trạng thái không bị ghi thành Chưa xét được.

4. Điểm vẫn là 29 và kết quả Đỏ cũ vẫn hiệu lực; không báo xét thành công.
5. Thông báo không chứa lỗi SQL, stack trace hay dữ liệu học sinh ngoài quyền.

**補足（Bổ sung）**
- Chức năng: Trạng thái, lỗi và quyền
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: S01 Đỏ. Có cách gây lỗi ghi kết quả trong lượt đăng ký và lỗi lưu điểm. Có file CSV điểm và bài thi đã chấm liên kết tới mục số nguyên (M=100) cho G-A. - Dữ liệu test: học sinh S01 (điểm 29); mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30) | Trigger/điểm quan sát: 1. Đường (a) nhập trực tiếp ở màn đăng ký điểm của lớp: sửa S01 thành 40 trong khi giả lập lỗi ghi kết quả. 2. Đường (b) Đăng ký thành tích bằng CSV（成績CSV登録）: nhập S01 = 40 trong khi giả lập lỗi ghi kết quả. 3. Đường (c) liên kết điểm thi: liên kết S01 = 40 trong khi giả lập lỗi ghi kết quả. 4. Với một đường bất kỳ, giả lập lỗi ngay ở bước lưu điểm (điểm không được lưu). 5. Sau mỗi bước, xem thông báo, điểm và ba đầu ra. | Oracle/bằng chứng: 1–3. Ở cả ba đường: không báo đã xét thành công hay đã ngừng kết quả cũ. Điểm và kết quả nhất quán theo ranh giới giao dịch của đường đăng ký (không có tình trạng điểm 40 đã công bố thành công nhưng kết quả vẫn là Đỏ của 29 mà không có thông báo). Trạng thái không bị ghi thành Chưa xét được. 4. Điểm vẫn là 29 và kết quả Đỏ cũ vẫn hiệu lực; không báo xét thành công. 5. Thông báo không chứa lỗi SQL, stack trace hay dữ liệu học sinh ngoài quyền.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: BLOCKED

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 8.4 “Lỗi kỹ thuật và thông báo” (đoạn đầu, gạch đầu dòng 1 và 3); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn” (AC-G26 «Lưu thành công và thông báo an toàn»); [tài liệu chia công việc v2](../split-tasks.vi.md) ([RSD-TASK](../split-tasks.vi.md) «bản chia công việc v2») công việc “Cập nhật kết quả khi đăng ký và chạy hàng loạt” (Task 4 «Cập nhật kết quả khi đăng ký và chạy hàng loạt») (Thay đổi nghiệp vụ); Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:7476–7479 «Figma MW: chương 04 – đăng ký, tổng hợp, chạy lại và kết quả»)
- Bằng chứng cần chụp: Ảnh thông báo của từng đường; SELECT điểm và kết quả sau mỗi bước.
- Sau khi chạy: Gỡ giả lập lỗi.
- Ghi chú: BLOCKED cho tới khi có cách giả lập lỗi (hỏi team dev).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-003"></a>

### TC-RS-ERR-003 — Batch hoàn tất một phần: báo đúng phạm vi đã/không cập nhật

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Batch hoàn tất một phần” (AC-G27 «Batch hoàn tất một phần»)

<!-- Mã truy vết: TD-GRP-01 «Lớp học phần: G-A (Toán I（数学Ⅰ）, khối 1, nhóm thành tích Nâng cao), G-B…», AC-G27 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Batch cho khối gồm G-A và G-B; giả lập lỗi ở phần G-B.
- Dữ liệu test: các lớp học phần G-A, G-B, G-C

**操作（Thao tác）**

1. Chạy nút cam cho khối.
2. Xem thông báo và kết quả từng lớp.
3. Gỡ giả lập lỗi, chạy lại nút cam chỉ cho phạm vi G-B.
4. Xem kết quả hai lớp.
5. Chạy nút cam cho G-A; khi chưa xong, giáo viên sửa và lưu điểm S01. Chờ batch xong, xem thông báo/tiến độ và kết quả S01.

**期待結果（Kết quả mong đợi）**

1–2. G-A cập nhật; G-B giữ trạng thái trước lượt. Thông báo cho biết phạm vi đã cập nhật, chưa cập nhật và cần chạy lại; không báo hoàn tất toàn bộ; không suy số lớp đã xử lý thành số ô đã xét. Không hứa rollback toàn lượt. Không tự retry vô hạn.

3–4. G-B được cập nhật; G-A giữ kết quả của bước 1, mỗi ô chỉ có một kết quả hiệu lực, không trùng.

5. Phần của S01 trong lượt batch (đã bị lần lưu mới thay thế) không được tính là cập nhật thành công, cũng không được tính là Chưa xét được; S01 giữ kết quả của lần lưu mới. (PROPOSED theo thiết kế DB v2 mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi”) Tiến độ ghi phần này là `superseded`; deadlock/timeout rollback toàn transaction đó và chỉ retry hữu hạn theo job hiện có.

**補足（Bổ sung）**
- Chức năng: Trạng thái, lỗi và quyền
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Batch cho khối gồm G-A và G-B; giả lập lỗi ở phần G-B. - Dữ liệu test: các lớp học phần G-A, G-B, G-C | Trigger/điểm quan sát: 1. Chạy nút cam cho khối. 2. Xem thông báo và kết quả từng lớp. 3. Gỡ giả lập lỗi, chạy lại nút cam chỉ cho phạm vi G-B. 4. Xem kết quả hai lớp. 5. Chạy nút cam cho G-A; khi chưa xong, giáo viên sửa và lưu điểm S01. Chờ batch xong, xem thông báo/tiến độ và kết quả S01. | Oracle/bằng chứng: 1–2. G-A cập nhật; G-B giữ trạng thái trước lượt. Thông báo cho biết phạm vi đã cập nhật, chưa cập nhật và cần chạy lại; không báo hoàn tất toàn bộ; không suy số lớp đã xử lý thành số ô đã xét. Không hứa rollback toàn lượt. Không tự retry vô hạn. 3–4. G-B được cập nhật; G-A giữ kết quả của bước 1, mỗi ô chỉ có một kết quả hiệu lực, không trùng. 5. Phần của S01 trong lượt batch (đã bị lần lưu mới thay thế) không được tính là cập nhật thành công, cũng không được tính là Chưa xét được; S01 giữ kết ; ghi build, môi trường, variant và reset sau chạy.
- Readiness: BLOCKED

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 8.4 “Lỗi kỹ thuật và thông báo” (gạch đầu dòng 2–4); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Batch hoàn tất một phần” (AC-G27 «Batch hoàn tất một phần»); [tài liệu chia công việc v2](../split-tasks.vi.md) ([RSD-TASK](../split-tasks.vi.md) «bản chia công việc v2») công việc “Cập nhật kết quả khi đăng ký và chạy hàng loạt” (Task 4 «Cập nhật kết quả khi đăng ký và chạy hàng loạt») (Thay đổi nghiệp vụ; Hướng kỹ thuật: "Không giả định batch hoàn tác toàn bộ"); [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Xử lý hiện có có bảo đảm cả lượt hàng loạt cùng thành công hoặc cùng thất bại…” (Q21 «Xử lý hiện có có bảo đảm cả lượt hàng loạt cùng thành công hoặc cùng thất bại…»); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi” (lượt bị thay thế, deadlock/timeout — PROPOSED); Figma MW “chương 04 – đăng ký, tổng hợp, chạy lại và kết quả” (58:7467–7479 «Figma MW: chương 04 – đăng ký, tổng hợp, chạy lại và kết quả»)
- Bằng chứng cần chụp: Ảnh thông báo; ảnh kết quả hai lớp sau bước 1 và sau bước 3; ảnh thông báo/tiến độ và kết quả S01 ở bước 5.
- Ghi chú: Hành vi thành công một phần theo AutoRating hiện có là PROPOSED; phần kiểm ở đây là nguyên tắc CONFIRMED của đặc tả v2 mục 8.4 “Lỗi kỹ thuật và thông báo”. BLOCKED cho tới khi có cách giả lập lỗi (hỏi team dev).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-004"></a>

### TC-RS-ERR-004 — Đã xếp hàng không phải đã hoàn tất; bấm chạy trùng

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Batch hoàn tất một phần” (AC-G27 «Batch hoàn tất một phần»)

<!-- Mã truy vết: TD-ROLE-03 «Người có quyền chạy hàng loạt: Có quyền thực hiện Thực hiện tổng…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"» -->

**前提条件（Điều kiện trước）**

- Điều kiện: tài khoản có quyền chạy hàng loạt. Đã đổi ngưỡng, chưa chạy lại.
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

1. Bấm Thực hiện tính toán tự động（自動算出実行）, đọc thông báo ngay khi request trả về.
2. Bấm lại lần nữa khi lượt đầu chưa xong.
3. Sau khi xong, xem kết quả.

**期待結果（Kết quả mong đợi）**

1. Nếu xử lý chạy nền: thông báo là đã nhận/xếp hàng, không phải đã hoàn tất; kết quả chưa đổi cho tới khi xử lý xong.
2. Chống trùng theo cơ chế hiện có (không tạo hai lượt ghi chồng gây kết quả sai).
3. Một kết quả hiện hành cho mỗi ô, đúng theo ngưỡng mới.

**補足（Bổ sung）**
- Chức năng: Trạng thái, lỗi và quyền
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: tài khoản có quyền chạy hàng loạt. Đã đổi ngưỡng, chưa chạy lại. - Dữ liệu test: quy tắc “Cố định 30” (dưới 30) | Trigger/điểm quan sát: 1. Bấm Thực hiện tính toán tự động（自動算出実行）, đọc thông báo ngay khi request trả về. 2. Bấm lại lần nữa khi lượt đầu chưa xong. 3. Sau khi xong, xem kết quả. | Oracle/bằng chứng: 1. Nếu xử lý chạy nền: thông báo là đã nhận/xếp hàng, không phải đã hoàn tất; kết quả chưa đổi cho tới khi xử lý xong. 2. Chống trùng theo cơ chế hiện có (không tạo hai lượt ghi chồng gây kết quả sai). 3. Một kết quả hiện hành cho mỗi ô, đúng theo ngưỡng mới.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 8.4 “Lỗi kỹ thuật và thông báo” (gạch đầu dòng 4), mục 7.3 “Thay đổi điểm tối đa” (Thiết lập điểm tối đa hàng loạt（満点一括設定）: "kết quả mới chỉ có sau xử lý thành công")
- Bằng chứng cần chụp: Ảnh thông báo; ảnh kết quả; log job nếu có.
- Ghi chú: Không yêu cầu retry vô hạn.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-005"></a>

### TC-RS-ERR-005 — Thông báo lỗi không lộ SQL, stack trace hoặc dữ liệu ngoài quyền

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn” (AC-G26 «Lưu thành công và thông báo an toàn»)

<!-- Mã truy vết: — -->

**前提条件（Điều kiện trước）**

- Điều kiện: Các tình huống lỗi của ERR-002, ERR-003, ERR-006, ERR-009.
- Dữ liệu test: —

**操作（Thao tác）**

Thu thập mọi thông báo lỗi hiển thị cho người dùng trong các case trên.

**期待結果（Kết quả mong đợi）**

Không có câu SQL, stack trace, đường dẫn file server hoặc tên/điểm học sinh ngoài quyền người thao tác.

**補足（Bổ sung）**
- Chức năng: Trạng thái, lỗi và quyền
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Các tình huống lỗi của ERR-002, ERR-003, ERR-006, ERR-009. - Dữ liệu test: — | Trigger/điểm quan sát: Thu thập mọi thông báo lỗi hiển thị cho người dùng trong các case trên. | Oracle/bằng chứng: Không có câu SQL, stack trace, đường dẫn file server hoặc tên/điểm học sinh ngoài quyền người thao tác.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 8.4 “Lỗi kỹ thuật và thông báo” (gạch đầu dòng 3)
- Bằng chứng cần chụp: Ảnh toàn văn từng thông báo lỗi thu được ở ERR-002, ERR-003, ERR-006, ERR-009.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-006"></a>

### TC-RS-ERR-006 — Gửi request lưu quy tắc trực tiếp khi không có quyền sửa mục

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Quyền thao tác và phạm vi dữ liệu” (AC-G01 «Quyền thao tác và phạm vi dữ liệu»)

<!-- Mã truy vết: TD-ROLE-02 «Giáo viên không có quyền sửa mục: Vào được Thiết lập nhập…», TD-ITEM-06 «Mục chỉ nội bộ: Mục số có cờ chỉ dành nội bộ（`mw_only_flg`）», TD-ROLE-01 «Giáo viên có quyền sửa mục: Có quyền vào Thiết lập nhập điểm（成績入力設定） và…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: tài khoản giáo viên không có quyền sửa mục; mục chỉ dành nội bộ có một quy tắc. Có bản ghi request lưu/xóa/đổi thứ tự hợp lệ lấy từ tài khoản giáo viên có quyền sửa mục.
- Dữ liệu test: tài khoản giáo viên không có quyền sửa mục, mục chỉ dành nội bộ

**操作（Thao tác）**

Dùng phiên tài khoản giáo viên không có quyền sửa mục gửi lại các request POST lưu, xóa, đổi thứ tự quy tắc của mục chỉ dành nội bộ.

**期待結果（Kết quả mong đợi）**

Mọi request bị từ chối; cấu hình không đổi; không có lượt xét phát sinh.

**補足（Bổ sung）**
- Chức năng: Trạng thái, lỗi và quyền
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: tài khoản giáo viên không có quyền sửa mục; mục chỉ dành nội bộ có một quy tắc. Có bản ghi request lưu/xóa/đổi thứ tự hợp lệ lấy từ tài khoản giáo viên có quyền sửa mục. - Dữ liệu test: tài khoản giáo viên không có quyền sửa mục, mục chỉ dành nội bộ | Trigger/điểm quan sát: Dùng phiên tài khoản giáo viên không có quyền sửa mục gửi lại các request POST lưu, xóa, đổi thứ tự quy tắc của mục chỉ dành nội bộ. | Oracle/bằng chứng: Mọi request bị từ chối; cấu hình không đổi; không có lượt xét phát sinh.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 1.3 “Quyền sử dụng” ("Kiểm quyền sửa mục ở cả màn hình và yêu cầu lưu"); CODE `checkAuthority('manage')`, `mw_only_flg` (kiểm quyền server của màn manage và cờ mục chỉ nội bộ hiện có)
- Bằng chứng cần chụp: Mã phản hồi/nội dung phản hồi (che token); SELECT cấu hình trước/sau.
- Ghi chú: Không ghi cookie/token vào bằng chứng ([tài liệu “Hướng dẫn thu thập bằng chứng”](scope-and-approach.vi.md)).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-007"></a>

### TC-RS-ERR-007 — Giả mạo ID khác trường/năm hoặc nguồn không được phép

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Quyền thao tác và phạm vi dữ liệu” (AC-G01 «Quyền thao tác và phạm vi dữ liệu»)

<!-- Mã truy vết: TD-ROLE-06 «Người dùng trường B: Giáo viên/quản trị của trường B», TD-ROLE-01 «Giáo viên có quyền sửa mục: Có quyền vào Thiết lập nhập điểm（成績入力設定） và…», TD-ENV-02 «Trường khác: Trường B (tên giả), có ít nhất một mục đánh giá và một quy…», AC-G01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: tài khoản của trường B (trường B) và tài khoản giáo viên có quyền sửa mục (trường A). Ghi lại cấu hình, điểm và kết quả đỏ của trường A trước khi chạy.
- Dữ liệu test: trường B (trường khác), tài khoản của trường B

**操作（Thao tác）**

1. tài khoản của trường B mở URL/gửi request xem, lưu, xóa quy tắc với ID mục/quy tắc của trường A.
2. tài khoản giáo viên có quyền sửa mục lưu quy tắc của trường A nhưng sửa request để nguồn tổng hợp trỏ tới thiết lập tổng hợp của trường B hoặc năm 2025.
3. tài khoản giáo viên có quyền sửa mục lưu quy tắc của trường A nhưng sửa request: ID lớp/nhóm trong bộ lọc và ID đơn vị thuộc trường B hoặc năm 2025.

**期待結果（Kết quả mong đợi）**

1. Bị từ chối, không đọc được dữ liệu trường A.
2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi.
3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi.

Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy.

**補足（Bổ sung）**
- Chức năng: Trạng thái, lỗi và quyền
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: tài khoản của trường B (trường B) và tài khoản giáo viên có quyền sửa mục (trường A). Ghi lại cấu hình, điểm và kết quả đỏ của trường A trước khi chạy. - Dữ liệu test: trường B (trường khác), tài khoản của trường B | Trigger/điểm quan sát: 1. tài khoản của trường B mở URL/gửi request xem, lưu, xóa quy tắc với ID mục/quy tắc của trường A. 2. tài khoản giáo viên có quyền sửa mục lưu quy tắc của trường A nhưng sửa request để nguồn tổng hợp trỏ tới thiết lập tổng hợp của trường B hoặc năm 2025. 3. tài khoản giáo viên có quyền sửa mục lưu quy tắc của trường A nhưng sửa request: ID lớp/nhóm trong bộ lọc và ID đơn vị thuộc trường B hoặc năm 2025. | Oracle/bằng chứng: 1. Bị từ chối, không đọc được dữ liệu trường A. 2. Bị từ chối khi lưu; không có quy tắc tham chiếu nguồn ngoài phạm vi. 3. Bị từ chối khi lưu; không có quy tắc mang ID lớp/nhóm/đơn vị ngoài phạm vi. Sau cả ba bước: cấu hình, điểm và kết quả đỏ của trường A giống lúc trước khi chạy.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 1.3 “Quyền sử dụng” (đoạn cuối: "Không mở quyền qua việc đổi ID… Nguồn tổng hợp, mục đánh giá, lớp và đơn vị được chọn phải thuộc ngữ cảnh… được phép"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Quyền thao tác và phạm vi dữ liệu” (AC-G01 «Quyền thao tác và phạm vi dữ liệu») ("Từ chối ID bị sửa trái phép mà không đổi cấu hình, điểm hoặc kết quả")
- Bằng chứng cần chụp: Phản hồi; SELECT cấu hình, điểm và kết quả trước/sau.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-008"></a>

### TC-RS-ERR-008 — Gọi trực tiếp request chạy tính toán hàng loạt khi không có quyền chạy

Priority: TBD ｜ Status: TBD ｜ Requirement ID: tiêu chí nghiệm thu “Quyền thao tác và phạm vi dữ liệu” (AC-G01 «Quyền thao tác và phạm vi dữ liệu»)

<!-- Mã truy vết: TD-ROLE-04 «Người sửa được mục nhưng không có quyền chạy: Như TD-ROLE-01 nhưng…», TD-ROLE-03 «Người có quyền chạy hàng loạt: Có quyền thực hiện Thực hiện tổng…», SI-05 «Quyền chạy hàng loạt» -->

**前提条件（Điều kiện trước）**

- Điều kiện: tài khoản sửa được mục nhưng không có quyền chạy hàng loạt; bản ghi request chạy nút cam hợp lệ từ tài khoản có quyền chạy hàng loạt.
- Dữ liệu test: tài khoản sửa được mục nhưng không có quyền chạy hàng loạt

**操作（Thao tác）**

Dùng phiên tài khoản sửa được mục nhưng không có quyền chạy hàng loạt gửi request chạy tính toán hàng loạt cho khối 1.

**期待結果（Kết quả mong đợi）**

Kỳ vọng theo đặc tả v2: bị từ chối, không xếp hàng/không xét. Code hiện tại có khả năng lệch (`autoRatingRun` không kiểm lại quyền/điều kiện ở server) — ghi hành vi thực tế.

**補足（Bổ sung）**
- Chức năng: Trạng thái, lỗi và quyền
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: tài khoản sửa được mục nhưng không có quyền chạy hàng loạt; bản ghi request chạy nút cam hợp lệ từ tài khoản có quyền chạy hàng loạt. - Dữ liệu test: tài khoản sửa được mục nhưng không có quyền chạy hàng loạt | Trigger/điểm quan sát: Dùng phiên tài khoản sửa được mục nhưng không có quyền chạy hàng loạt gửi request chạy tính toán hàng loạt cho khối 1. | Oracle/bằng chứng: Kỳ vọng theo đặc tả v2: bị từ chối, không xếp hàng/không xét. Code hiện tại có khả năng lệch (`autoRatingRun` không kiểm lại quyền/điều kiện ở server) — ghi hành vi thực tế.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 1.3 “Quyền sử dụng” (Chạy tính toán hàng loạt); [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Ai được thiết lập điều kiện điểm đỏ?” (Q1 «Ai được thiết lập điều kiện điểm đỏ?»); code hiện tại “`autoRatingRun` không kiểm lại quyền/điều kiện ở server” (endpoint `autoRatingRun` chưa kiểm quyền); khác biệt đặc tả–code về “Quyền chạy hàng loạt” (SI-05 «Quyền chạy hàng loạt»)
- Bằng chứng cần chụp: Phản hồi; log job; kết quả trước/sau.
- Ghi chú: TBD vì phạm vi quyền chạy hiện hành cần xác định (quyền nào là "quyền thực thi hiện hành").

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-009"></a>

### TC-RS-ERR-009 — Server kiểm miền giá trị khi bỏ qua kiểm tra phía trình duyệt

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11 «Giữ chính xác giá trị»); tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16 «Công thức theo dòng và phần lẻ»)

<!-- Mã truy vết: TD-ROLE-01 «Giáo viên có quyền sửa mục: Có quyền vào Thiết lập nhập điểm（成績入力設定） và…», AC-G11, AC-G16, SI-06 «Giới hạn giá trị ở server» -->

**前提条件（Điều kiện trước）**

- Điều kiện: tài khoản giáo viên có quyền sửa mục; bản ghi request lưu ngưỡng hợp lệ.
- Dữ liệu test: N cố định = 101, −1; tỷ lệ = 101; mẫu số cố định = 0; N = `NaN`, `Infinity`, `1e400`, chuỗi rỗng; công thức có phép toán/hàm không được phép (ví dụ `^`, `max`) hoặc chuỗi biểu thức tự do thay cho các dòng; điều kiện áp dụng (khi có schema, PROPOSED theo thiết kế DB v2 mục 3.2 “`apply_condition`”): JSON `null`, chuỗi rỗng, object rỗng, khóa lạ, cả hai array rỗng

**操作（Thao tác）**

Sửa request (bỏ kiểm tra JS) và gửi từng giá trị.

**期待結果（Kết quả mong đợi）**

Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do.

**補足（Bổ sung）**
- Chức năng: Trạng thái, lỗi và quyền
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: tài khoản giáo viên có quyền sửa mục; bản ghi request lưu ngưỡng hợp lệ. - Dữ liệu test: N cố định = 101, −1; tỷ lệ = 101; mẫu số cố định = 0; N = `NaN`, `Infinity`, `1e400`, chuỗi rỗng; công thức có phép toán/hàm không được phép (ví dụ `^`, `max`) hoặc chuỗi biểu thức tự do thay cho các dòng; điều kiện áp dụng (khi có schema, PROPOSED theo thiết kế DB v2 mục 3.2 “`apply_condition`”): JSON `null`, chuỗi rỗng, object rỗng, khóa lạ, cả hai array rỗng | Trigger/điểm quan sát: Sửa request (bỏ kiểm tra JS) và gửi từng giá trị. | Oracle/bằng chứng: Mọi giá trị trên bị server từ chối; cấu hình đã lưu không đổi. Công thức chỉ nhận các dòng với phép toán và toán hạng được hỗ trợ; không lưu biểu thức tự do.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 6.2 “Ngưỡng cố định”, mục 6.3 “Tỷ lệ điểm tối đa”, mục 6.4 “Công thức dùng trung bình”, mục 6.8 “Yêu cầu độ chính xác” ("không nhận số vô hạn/không phải số"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11 «Giữ chính xác giá trị»), tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16 «Công thức theo dòng và phần lẻ») (công thức theo dòng, không biểu thức tự do); code hiện tại “AutoRating không giới hạn server `decimal_place` / số dòng công thức” (`decimal_place` không giới hạn ở server); khác biệt đặc tả–code về “Giới hạn giá trị ở server” (SI-06 «Giới hạn giá trị ở server»)
- Bằng chứng cần chụp: Phản hồi; SELECT cấu hình.
- Ghi chú: Giới hạn `p` 1–9 là PROPOSED: gửi `p=0`, `p=10` và ghi hành vi thực tế vào Notes, không đánh FAIL.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-010"></a>

### TC-RS-ERR-010 — Server không tin cờ đỏ hoặc ngưỡng do trình duyệt gửi lên

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Excel khớp và dùng kết luận server” (AC-G31 «Excel khớp và dùng kết luận server»)

<!-- Mã truy vết: TD-OUT-01 «Trích xuất lọc + ký hiệu trước + màu: Lọc học sinh có điểm đỏ（抽出する） BẬT», TD-STU-03 «S03: G-A, HR1», TD-ROLE-07 «Người phụ trách đầu ra: Có quyền Trích xuất thành tích（成績抽出）, Thiết lập…», AC-G31 -->

**前提条件（Điều kiện trước）**

- Điều kiện: S03=31 Không đỏ; cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu.
- Dữ liệu test: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu; học sinh S03 (điểm 31)

**操作（Thao tác）**

1. Đăng nhập tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm), chạy Trích xuất thành tích（成績抽出） với cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, bấm tải Excel.
2. Dùng công cụ chặn request được phép trên môi trường test, sửa bảng dữ liệu trong request POST gửi tới `output_excel` theo từng biến thể: (a) thêm dấu/màu đỏ cho ô S03; (b) đổi giá trị ô; (c) thêm tham số ngưỡng 50.
3. Gửi request, mở file Excel nhận được.

**期待結果（Kết quả mong đợi）**

Excel vẫn dựa trên kết quả đã kiểm quyền ở server: S03 không có dấu/màu đỏ, không thỏa lọc; không đưa ra học sinh/ô ngoài phạm vi được phép.

**補足（Bổ sung）**
- Chức năng: Trạng thái, lỗi và quyền
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: S03=31 Không đỏ; cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu. - Dữ liệu test: cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu; học sinh S03 (điểm 31) | Trigger/điểm quan sát: 1. Đăng nhập tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm), chạy Trích xuất thành tích（成績抽出） với cấu hình trích xuất: lọc, ký hiệu “*” phía trước, tô màu, bấm tải Excel. 2. Dùng công cụ chặn request được phép trên môi trường test, sửa bảng dữ liệu trong request POST gửi tới `output_excel` theo từng biến thể: (a) thêm dấu/màu đỏ cho ô S03; (b) đổi giá trị ô; (c) thêm tham số ngưỡng 50. 3. Gửi request, mở file Excel nhận được. | Oracle/bằng chứng: Excel vẫn dựa trên kết quả đã kiểm quyền ở server: S03 không có dấu/màu đỏ, không thỏa lọc; không đưa ra học sinh/ô ngoài phạm vi được phép.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 9.3 “Xuất file” ("Không nhận cờ đỏ hoặc kết quả tính ngưỡng do trình duyệt gửi lên như kết luận tin cậy"), mục 12.2 “Điểm tích hợp chính” (Trích xuất và Excel); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Excel khớp và dùng kết luận server” (AC-G31 «Excel khớp và dùng kết luận server»); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 5.1 “Thiết lập hiển thị của Trích xuất thành tích（成績抽出）và Công cụ phiếu điểm（通知表ツール）” (lọc/trang trí chỉ dựa trên kết quả xét hiện hành phía server); [tài liệu chia công việc v2](../split-tasks.vi.md) ([RSD-TASK](../split-tasks.vi.md) «bản chia công việc v2») công việc “Lọc điểm đỏ và hiển thị trên Excel” (Task 5 «Lọc điểm đỏ và hiển thị trên Excel») (xử lý xuất Excel nhận bảng qua POST); CODE `AdminNBGradeExtractionResultExcelController::output_excel`
- Bằng chứng cần chụp: Request đã sửa (che token); file Excel.
- Ghi chú: Nếu request không có tham số nào để sửa, ghi "không áp dụng" kèm bằng chứng request.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-011"></a>

### TC-RS-ERR-011 — Lượt cũ hoàn tất muộn không ghi đè kết quả của điểm/cấu hình mới hơn

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Nhận diện ô điểm” (AC-G03 «Nhận diện ô điểm»); tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu»); tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại” (AC-G21 «Giữ kết quả trước khi chạy lại và xóa rule cuối»); tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật” (AC-G22 «Kết quả chung và thứ tự cập nhật»)

<!-- Mã truy vết: TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-RULE-07 «Cặp phân nhánh: Ưu tiên 1 "Trung bình từ 60": điều kiện `A≥60`, cố định…», TD-STU-01 «S01: G-A, HR1», AC-G21, AC-G22, AC-G12, AC-G03 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Batch lớn đang chạy cho khối 1; quy tắc “Cố định 30” (dưới 30) trên mục của S01; nguồn trung bình của cặp quy tắc phân nhánh theo trung bình 60 đã có một bản tổng hợp.
- Dữ liệu test: học sinh S01 (điểm 29); quy tắc “Cố định 30” (dưới 30); cặp quy tắc phân nhánh theo trung bình 60

**操作（Thao tác）**

1. Khi batch chưa xong, sửa S01 từ 29 thành 40 và lưu.
2. Chờ batch xong, xem S01.
3. Chạy lại batch; khi chưa xong, đổi ngưỡng quy tắc “Cố định 30” (dưới 30) thành 45, lưu, rồi đăng ký lại điểm S01 (40). Chờ batch cũ xong, xem S01.
4. Với mục dùng cặp quy tắc phân nhánh theo trung bình 60: bắt đầu batch; khi chưa xong, bấm Thực hiện tổng hợp（集計実行） cho cùng phạm vi, chờ cả hai xong. SELECT kết quả và bản nguồn được ghi nhận cho các ô của lượt batch.
5. Khôi phục ngưỡng 30, S01 = 29 (Đỏ). Bắt đầu batch; khi batch đã đọc điểm 29 nhưng chưa xong, sửa S01 thành 40 và lưu, rồi sửa lại 29 và lưu. Chờ batch cũ xong, SELECT kết quả S01.
6. Lặp bước 5 nhưng thay bằng: xóa trống ô S01 và lưu, rồi nhập lại 29 và lưu.
7. S01 = 40 (Không đỏ). Bắt đầu batch; khi chưa xong, chỉ đổi ngưỡng quy tắc “Cố định 30” (dưới 30) thành 45 và lưu, không đăng ký lại điểm. Chờ batch cũ xong, xem S01; sau đó chạy lại batch và xem S01.

**期待結果（Kết quả mong đợi）**

1–2. S01 = 40 và Không đỏ; batch cũ không ghi lại kết quả Đỏ của điểm 29.

3. S01 Đỏ theo cấu hình mới (`40<45`); batch cũ không ghi đè bằng kết quả theo ngưỡng 30.
4. Mọi ô của một lượt batch dùng cùng một bản nguồn (hoặc toàn bản cũ, hoặc toàn bản mới); không có lượt báo thành công mà ghép điểm/kết quả của hai thời điểm.
5–6. Kết quả hiện hành của S01 là kết quả của lần lưu cuối (29 → Đỏ, xét bởi lần đăng ký sau cùng); lượt batch cũ không ghi đè dù giá trị điểm cuối trùng với giá trị batch đã đọc. Ô chỉ có một dòng kết quả hiện hành.
7. Sau khi chỉ lưu ngưỡng: kết quả trước được giữ tới lần xét lại (tiêu chí nghiệm thu “Giữ kết quả trước khi chạy lại”). Chạy lại batch → S01 Đỏ theo ngưỡng 45. (PROPOSED theo thiết kế DB v2 mục 6.2 “Đăng ký thường và batch”) Lượt batch cũ bị từ chối ghi vì phiên bản danh sách quy tắc (`red_score_revision`) đã đổi, nên không ghi kết quả theo ngưỡng 30 sau khi ngưỡng mới đã được lưu.
8. (PROPOSED) SELECT `write_version`, `judged_version`, `rule_revision` của S01: `judged_version` bằng phiên bản của lần ghi hoàn tất sau cùng; lượt cũ không làm giảm hay ghi đè các giá trị này.

**補足（Bổ sung）**
- Chức năng: Trạng thái, lỗi và quyền
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Batch lớn đang chạy cho khối 1; quy tắc “Cố định 30” (dưới 30) trên mục của S01; nguồn trung bình của cặp quy tắc phân nhánh theo trung bình 60 đã có một bản tổng hợp. - Dữ liệu test: học sinh S01 (điểm 29); quy tắc “Cố định 30” (dưới 30); cặp quy tắc phân nhánh theo trung bình 60 | Trigger/điểm quan sát: 1. Khi batch chưa xong, sửa S01 từ 29 thành 40 và lưu. 2. Chờ batch xong, xem S01. 3. Chạy lại batch; khi chưa xong, đổi ngưỡng quy tắc “Cố định 30” (dưới 30) thành 45, lưu, rồi đăng ký lại điểm S01 (40). Chờ batch cũ xong, xem S01. 4. Với mục dùng cặp quy tắc phân nhánh theo trung bình 60: bắt đầu batch; khi chưa xong, bấm Thực hiện tổng hợp（集計実行） cho cùng phạm vi, chờ cả hai xong. SELECT kết quả và bản nguồn được ghi nhận cho các ô của lượt batch. 5. Khôi phục ngưỡng 30, S01 = 29 (Đỏ). Bắt đầu | Oracle/bằng chứng: 1–2. S01 = 40 và Không đỏ; batch cũ không ghi lại kết quả Đỏ của điểm 29. 3. S01 Đỏ theo cấu hình mới (`40<45`); batch cũ không ghi đè bằng kết quả theo ngưỡng 30. 4. Mọi ô của một lượt batch dùng cùng một bản nguồn (hoặc toàn bản cũ, hoặc toàn bản mới); không có lượt báo thành công mà ghép điểm/kết quả của hai thời điểm. 5–6. Kết quả hiện hành của S01 là kết quả của lần lưu cuối (29 → Đỏ, xét bởi lần đăng ký sau cùng); lượt batch cũ không ghi đè dù giá trị điểm cuối trùng với giá trị batch đã đ; ghi build, môi trường, variant và reset sau chạy.
- Readiness: BLOCKED

- Nguồn: [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật” (AC-G22 «Kết quả chung và thứ tự cập nhật») ("Lượt cũ hoàn tất muộn không ghi đè kết quả của điểm/cấu hình mới hơn, không ghép điểm và kết quả khác thời điểm rồi báo thành công"), tiêu chí nghiệm thu “Đúng phạm vi tham chiếu” (AC-G12 «Đúng phạm vi tham chiếu») ("một lượt không trộn các thời điểm của cùng nguồn"); [tài liệu chia công việc v2](../split-tasks.vi.md) ([RSD-TASK](../split-tasks.vi.md) «bản chia công việc v2») công việc “Hỗ trợ điều kiện và công thức dùng tổng hợp” (Task 3 «Hỗ trợ điều kiện và công thức dùng tổng hợp») ("Một lượt dùng cùng nguồn nhiều lần phải cùng bản"); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất” (phương án kỹ thuật v2); [context điểm đỏ](../../../CONTEXT.md) ([CTX](../../../CONTEXT.md) «context chuẩn điểm đỏ») mục 9.6 “Ba phản hồi review DB và bài học thiết kế ngày 28/09” (phản hồi review DB của khách hàng: chống batch dùng điểm 29 ghi đè kết quả đã lưu cho điểm 40; xử lý xóa/tạo lại); tiêu chí nghiệm thu v2 (RSD-AC) tiêu chí nghiệm thu “Nhận diện ô điểm” (AC-G03 «Nhận diện ô điểm») (ví dụ thứ tự cập nhật: 29→40→29, xóa trống rồi nhập lại); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 6.2 “Đăng ký thường và batch”, mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi” (PROPOSED)
- Bằng chứng cần chụp: Thời điểm các thao tác; SELECT kết quả (và bản nguồn của từng ô khi có schema).
- Sau khi chạy: Khôi phục ngưỡng quy tắc “Cố định 30” (dưới 30) = 30.
- Ghi chú: Hành vi ở bước 1–6 là yêu cầu CONFIRMED (tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật”, tiêu chí nghiệm thu “Nhận diện ô điểm”, tiêu chí nghiệm thu “Đúng phạm vi tham chiếu”). Cơ chế thế hệ/phiên bản/khóa và bước 8 là PROPOSED (thiết kế DB v2 mục 6 “Phương thức xử lý cập nhật đồng thời”, chưa review/chưa thực thi DDL); nếu hiện thực khác nhưng hành vi đúng thì ghi Notes, không FAIL. Khó tái hiện — cần dữ liệu đủ lớn hoặc cách làm chậm job; nếu không tái hiện được thứ tự hoàn tất thì ghi BLOCKED, không ghi PASS.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-012"></a>

### TC-RS-ERR-012 — Nhập CSV lựa chọn điểm tối đa của lớp

Priority: TBD ｜ Status: TBD ｜ Requirement ID: tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị” (AC-G24 «Trigger khi đổi điểm tối đa/đơn vị»)

<!-- Mã truy vết: TD-ITEM-03 «Mục điểm đơn vị: Điểm bài kiểm tra đơn vị（単元テスト点）, M mặc định 100», TD-RULE-03 «Tỷ lệ: Tỷ lệ điểm tối đa（得点率） 30%, không xử lý phần lẻ（しない）, Nhỏ hơn（未満）», SI-01 «CSV lựa chọn điểm tối đa của lớp» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc tỷ lệ 30% (30%); S06 U1=14 Không đỏ với M=40.
- Dữ liệu test: mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc tỷ lệ 30%; CSV gán lựa chọn M=50 cho lớp G-B

**操作（Thao tác）**

1. Nhập CSV lựa chọn điểm tối đa.
2. Xem kết quả S06 U1.

**期待結果（Kết quả mong đợi）**

TBD (chưa chốt): có cần xét lại ngay (`T=15` → Đỏ) hay giữ kết quả trước tới lần chạy lại. Ghi hành vi thực tế.

**補足（Bổ sung）**
- Chức năng: Trạng thái, lỗi và quyền
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc tỷ lệ 30% (30%); S06 U1=14 Không đỏ với M=40. - Dữ liệu test: mục điểm đơn vị (đơn vị U1 có M riêng 40), quy tắc tỷ lệ 30%; CSV gán lựa chọn M=50 cho lớp G-B | Trigger/điểm quan sát: 1. Nhập CSV lựa chọn điểm tối đa. 2. Xem kết quả S06 U1. | Oracle/bằng chứng: TBD (chưa chốt): có cần xét lại ngay (`T=15` → Đỏ) hay giữ kết quả trước tới lần chạy lại. Ghi hành vi thực tế.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: code hiện tại: đường CSV lựa chọn lớp NB không gọi AutoRating; khác biệt đặc tả–code về “CSV lựa chọn điểm tối đa của lớp (đường ghi điểm CSV lựa chọn lớp NB)” (SI-01 «CSV lựa chọn điểm tối đa của lớp»)
- Bằng chứng cần chụp: File CSV (dữ liệu giả); ảnh kết quả.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-013"></a>

### TC-RS-ERR-013 — Trích xuất: ô vừa thỏa điều kiện màu khác vừa là ô đỏ

Priority: TBD ｜ Status: TBD ｜ Requirement ID: tiêu chí nghiệm thu “Hiển thị ô trích xuất” (AC-G30 «Hiển thị ô trích xuất»)

<!-- Mã truy vết: TD-STU-01 «S01: G-A, HR1», SI-12 «Trùng màu ở trích xuất» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mục có điều kiện Khoảng điểm（点数範囲） 0–30 tô Vàng（黄） và điều kiện đỏ tô Đỏ（赤）, ký hiệu `*`.
- Dữ liệu test: học sinh S01 (điểm 29) (29)

**操作（Thao tác）**

Chạy trích xuất, xuất Excel.

**期待結果（Kết quả mong đợi）**

TBD (chưa chốt) cho màu cuối. CONFIRMED phần không tranh chấp: điều kiện Khoảng điểm vẫn giữ nghĩa cũ; màn hình và Excel cho cùng kết quả.

**補足（Bổ sung）**
- Chức năng: Trạng thái, lỗi và quyền
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Mục có điều kiện Khoảng điểm（点数範囲） 0–30 tô Vàng（黄） và điều kiện đỏ tô Đỏ（赤）, ký hiệu `*`. - Dữ liệu test: học sinh S01 (điểm 29) (29) | Trigger/điểm quan sát: Chạy trích xuất, xuất Excel. | Oracle/bằng chứng: TBD (chưa chốt) cho màu cuối. CONFIRMED phần không tranh chấp: điều kiện Khoảng điểm vẫn giữ nghĩa cũ; màn hình và Excel cho cùng kết quả.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: CODE `addFilterResultProperty` (điều kiện sau ghi đè thuộc tính hiển thị); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 9.2 “Kết quả và ví dụ” (đoạn cuối); khác biệt đặc tả–code về “Trùng màu ở trích xuất” (SI-12 «Trùng màu ở trích xuất»)
- Bằng chứng cần chụp: Ảnh màn, file Excel.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-014"></a>

### TC-RS-ERR-014 — Mục bị ẩn theo thiết lập ẩn mục nhập

Priority: TBD ｜ Status: TBD ｜ Requirement ID: tiêu chí nghiệm thu “Cấu hình công khai và ẩn điểm” (AC-G32 «Cấu hình công khai và ẩn điểm»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-STU-06 «S06: G-B, HR2», TC-RS-FUNC-027 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) có quy tắc, bị ẩn cho G-B qua Thiết lập ẩn mục nhập（入力項目の非表示設定）.
- Dữ liệu test: mục số nguyên (M=100); học sinh S06 (điểm dự kiến 24)

**操作（Thao tác）**

Chạy xét; xem ba đầu ra cho S06.

**期待結果（Kết quả mong đợi）**

Có xét hay không: TBD (chưa chốt). CONFIRMED phần không tranh chấp: không đầu ra nào làm hiện lại điểm đang bị ẩn.

**補足（Bổ sung）**
- Chức năng: Trạng thái, lỗi và quyền
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) có quy tắc, bị ẩn cho G-B qua Thiết lập ẩn mục nhập（入力項目の非表示設定）. - Dữ liệu test: mục số nguyên (M=100); học sinh S06 (điểm dự kiến 24) | Trigger/điểm quan sát: Chạy xét; xem ba đầu ra cho S06. | Oracle/bằng chứng: Có xét hay không: TBD (chưa chốt). CONFIRMED phần không tranh chấp: không đầu ra nào làm hiện lại điểm đang bị ẩn.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: DRAFT

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?” (Q16 «Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?») (điểm ẩn không bị làm lộ)
- Bằng chứng cần chụp: Ảnh đầu ra.
- Ghi chú: Công khai với Không hiển thị（表示しない）: case “Công khai: kết hợp hiệu ứng Điểm dự kiến（見込点） và điểm đỏ, khử trùng”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-015"></a>

### TC-RS-ERR-015 — Bản ghi điểm bị xóa rồi tạo lại không kế thừa kết quả cũ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Nhận diện ô điểm” (AC-G03 «Nhận diện ô điểm»); tiêu chí nghiệm thu “Không dùng lại kết quả cho đối tượng mới” (AC-G39 «Không dùng lại kết quả cho đối tượng mới»)

<!-- Mã truy vết: TD-ITEM-03 «Mục điểm đơn vị: Điểm bài kiểm tra đơn vị（単元テスト点）, M mặc định 100», AC-G03 -->

**前提条件（Điều kiện trước）**

- Điều kiện: S01 Đỏ ở mục điểm đơn vị (đơn vị U1 có M riêng 40) U1.
- Dữ liệu test: mục điểm đơn vị (đơn vị U1 có M riêng 40)

**操作（Thao tác）**

1. Bỏ sử dụng đơn vị U1 cho lớp (hoặc thay khung điểm theo thao tác hiện có) để ô bị xóa/ngừng hoạt động.
2. Tạo lại ô, nhập 35, lưu.
3. Xem đầu ra.
4. Đưa ô về Đỏ (nhập 29, lưu). Xóa ô (hoặc xóa mềm theo thao tác hiện có), rồi kích hoạt lại/tạo lại ô với **cùng giá trị 29** nhưng không qua đường xét (nếu có thao tác như vậy, ví dụ khôi phục); xem đầu ra. Sau đó đăng ký lại điểm và xem.
5. Bắt đầu batch cho lớp khi ô đang Đỏ; khi batch chưa xong, xóa ô rồi tạo lại và nhập 35. Chờ batch cũ xong, xem đầu ra và SELECT.

**期待結果（Kết quả mong đợi）**

Sau bước 1: không còn dấu đỏ của ô cũ. Sau bước 2: ô mới được xét theo 35 → Không đỏ; không mang kết quả Đỏ cũ.

4. Kích hoạt lại/nhập lại cùng giá trị không làm kết quả Đỏ trước khi xóa sống lại; ô chỉ có kết quả của lần xét sau khi tạo lại.
5. Lượt batch cũ không ghi kết quả vào ô đã tạo lại; ô giữ kết quả của lần đăng ký 35 (Không đỏ). (PROPOSED theo thiết kế DB v2 mục 4.4 “Cập nhật và hiệu lực kết quả”, mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi”) Khi xóa: `cell_generation` mới, `judgment_status`=4 và thông tin quy tắc/ngưỡng/nguồn cũ bị xóa trong cùng transaction; dòng điều khiển được giữ; tạo lại dùng thế hệ mới.

**補足（Bổ sung）**
- Chức năng: Trạng thái, lỗi và quyền
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: S01 Đỏ ở mục điểm đơn vị (đơn vị U1 có M riêng 40) U1. - Dữ liệu test: mục điểm đơn vị (đơn vị U1 có M riêng 40) | Trigger/điểm quan sát: 1. Bỏ sử dụng đơn vị U1 cho lớp (hoặc thay khung điểm theo thao tác hiện có) để ô bị xóa/ngừng hoạt động. 2. Tạo lại ô, nhập 35, lưu. 3. Xem đầu ra. 4. Đưa ô về Đỏ (nhập 29, lưu). Xóa ô (hoặc xóa mềm theo thao tác hiện có), rồi kích hoạt lại/tạo lại ô với **cùng giá trị 29** nhưng không qua đường xét (nếu có thao tác như vậy, ví dụ khôi phục); xem đầu ra. Sau đó đăng ký lại điểm và xem. 5. Bắt đầu batch cho lớp khi ô đang Đỏ; khi batch chưa xong, xóa ô rồi tạo lại và nhập 35. Chờ batch cũ xong,  | Oracle/bằng chứng: Sau bước 1: không còn dấu đỏ của ô cũ. Sau bước 2: ô mới được xét theo 35 → Không đỏ; không mang kết quả Đỏ cũ. 4. Kích hoạt lại/nhập lại cùng giá trị không làm kết quả Đỏ trước khi xóa sống lại; ô chỉ có kết quả của lần xét sau khi tạo lại. 5. Lượt batch cũ không ghi kết quả vào ô đã tạo lại; ô giữ kết quả của lần đăng ký 35 (Không đỏ). (PROPOSED theo thiết kế DB v2 mục 4.4 “Cập nhật và hiệu lực kết quả”, mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi”) Khi xóa: `cell_generation` mới, `judgment_; ghi build, môi trường, variant và reset sau chạy.
- Readiness: BLOCKED

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 2.2 “Một ô điểm được nhận diện như thế nào?” (đoạn cuối), mục 7.3 “Thay đổi điểm tối đa” (dòng cuối bảng), mục 12.4 “Sao chép, năm mới, nhập/xuất và khôi phục” (Khôi phục/thay khung điểm); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Nhận diện ô điểm” (AC-G03 «Nhận diện ô điểm») ("Nhập lại cùng điểm hoặc kích hoạt lại bản ghi xóa mềm cũ cũng không được làm kết quả của xử lý cũ sống lại"); [context điểm đỏ](../../../CONTEXT.md) ([CTX](../../../CONTEXT.md) «context chuẩn điểm đỏ») mục 9.6 “Ba phản hồi review DB và bài học thiết kế ngày 28/09” (phản hồi review DB: xử lý xóa/tạo lại ô điểm); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 4.4 “Cập nhật và hiệu lực kết quả”, mục 6.3 “Xóa/tạo lại, nguồn tham chiếu và lỗi” (PROPOSED)
- Bằng chứng cần chụp: Ảnh đầu ra; SELECT kết quả.
- Ghi chú: Thao tác xóa/tạo lại ô cụ thể: hỏi team dev khi chuẩn bị. Bước 4 chỉ chạy nếu có đường kích hoạt lại không qua xét; không có thì ghi SKIPPED cho phần đó. Bước 5 cần cách làm chậm job; không tái hiện được thì BLOCKED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-016"></a>

### TC-RS-ERR-016 — Chưa xét được: sửa nguồn nhưng chỉ lưu cấu hình vẫn chưa có kết luận; xét lại mới có

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Trạng thái sau lần chạy” (AC-G20 «Trạng thái sau lần chạy»)

<!-- Mã truy vết: TC-RS-BR-010, TD-STU-01 «S01: G-A, HR1», TD-SRC-02 «Bản mới nhất chưa chốt: Tổng hợp chạy sau TD-SRC-01, `A` = 62» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Ô S01 Chưa xét được (như case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”: công thức `A×0.5`, nguồn chưa tổng hợp). Nguồn không có bản chốt.
- Dữ liệu test: học sinh S01 (điểm 29); nguồn sau tổng hợp có `A=62` (giá trị như bản tổng hợp mới nhất chưa chốt (trung bình 62))

**操作（Thao tác）**

1. Chạy Thực hiện tổng hợp（集計実行） cho nguồn để có `A=62`; mở lại và lưu thiết lập quy tắc (không đổi nội dung). Xem đầu ra.
2. Chạy nút cam. Xem đầu ra.

**期待結果（Kết quả mong đợi）**

1. Vẫn Chưa xét được; không có dấu đỏ.
2. `T=62×0.5=31` → S01=29 Đỏ.

**補足（Bổ sung）**
- Chức năng: Trạng thái, lỗi và quyền
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Ô S01 Chưa xét được (như case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”: công thức `A×0.5`, nguồn chưa tổng hợp). Nguồn không có bản chốt. - Dữ liệu test: học sinh S01 (điểm 29); nguồn sau tổng hợp có `A=62` (giá trị như bản tổng hợp mới nhất chưa chốt (trung bình 62)) | Trigger/điểm quan sát: 1. Chạy Thực hiện tổng hợp（集計実行） cho nguồn để có `A=62`; mở lại và lưu thiết lập quy tắc (không đổi nội dung). Xem đầu ra. 2. Chạy nút cam. Xem đầu ra. | Oracle/bằng chứng: 1. Vẫn Chưa xét được; không có dấu đỏ. 2. `T=62×0.5=31` → S01=29 Đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 8.2 “Bảng chuyển trạng thái” (hai dòng cuối), mục 7.2 “Bảng sự kiện” (Tổng hợp lại/cập nhật nhóm tham chiếu)
- Bằng chứng cần chụp: Ảnh đầu ra hai bước.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-017"></a>

### TC-RS-ERR-017 — Tên quy tắc và ký hiệu hiển thị như chữ, không bị thực thi

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn” (AC-G26 «Lưu thành công và thông báo an toàn»)

<!-- Mã truy vết: TD-ROLE-01 «Giáo viên có quyền sửa mục: Có quyền vào Thiết lập nhập điểm（成績入力設定） và…», TD-ROLE-07 «Người phụ trách đầu ra: Có quyền Trích xuất thành tích（成績抽出）, Thiết lập…», TD-STU-01 «S01: G-A, HR1», AC-G26 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Đăng nhập tài khoản giáo viên có quyền sửa mục và tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm).
- Dữ liệu test: Tên quy tắc `<b>X</b><script>alert(1)</script>`; ký hiệu đầu ở trích xuất `<`; ký tự phía trước ở phiếu điểm `&`; học sinh S01 (điểm 29)

**操作（Thao tác）**

1. Lưu quy tắc với tên trên; xem danh sách, form sửa, hộp xác nhận xóa, thông báo sau chạy.
2. Lưu ký hiệu/ký tự trên ở trích xuất và phiếu điểm; xem màn, Excel, PDF.

**期待結果（Kết quả mong đợi）**

Chuỗi hiển thị đúng như đã nhập dưới dạng chữ; không có hộp alert, không đổi định dạng HTML. Trích xuất và Excel: ô S01 là `<29`; PDF phiếu: `&29`.

**補足（Bổ sung）**
- Chức năng: Trạng thái, lỗi và quyền
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Đăng nhập tài khoản giáo viên có quyền sửa mục và tài khoản phụ trách đầu ra (trích xuất, công khai, phiếu điểm). - Dữ liệu test: Tên quy tắc `<b>X</b><script>alert(1)</script>`; ký hiệu đầu ở trích xuất `<`; ký tự phía trước ở phiếu điểm `&`; học sinh S01 (điểm 29) | Trigger/điểm quan sát: 1. Lưu quy tắc với tên trên; xem danh sách, form sửa, hộp xác nhận xóa, thông báo sau chạy. 2. Lưu ký hiệu/ký tự trên ở trích xuất và phiếu điểm; xem màn, Excel, PDF. | Oracle/bằng chứng: Chuỗi hiển thị đúng như đã nhập dưới dạng chữ; không có hộp alert, không đổi định dạng HTML. Trích xuất và Excel: ô S01 là `<29`; PDF phiếu: `&29`.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 12.1 “Dữ liệu cấu hình và kết quả cần quản lý” ("không thực thi chuỗi code từ input"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Lưu thành công và thông báo an toàn” (AC-G26 «Lưu thành công và thông báo an toàn») ("không … thực thi tên/ký hiệu như mã"); [tài liệu chia công việc v2](../split-tasks.vi.md) ([RSD-TASK](../split-tasks.vi.md) «bản chia công việc v2») công việc “Thiết lập và lưu nhiều quy tắc” (Task 1 «Thiết lập và lưu nhiều quy tắc») (escape tên/ký hiệu khi hiển thị)
- Bằng chứng cần chụp: Ảnh các màn; file Excel/PDF.
- Sau khi chạy: Xóa quy tắc/ký hiệu test.
- Ghi chú: Nếu ký tự/độ dài ký hiệu bị giới hạn, chọn dữ liệu trong giới hạn nhưng vẫn có ký tự đặc biệt HTML.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-018"></a>

### TC-RS-ERR-018 — Hai lượt xét lần đầu đồng thời hoặc gửi lại thao tác hoàn tất chỉ tạo một kết quả

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật” (AC-G22 «Kết quả chung và thứ tự cập nhật»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-STU-01 «S01: G-A, HR1», TD-ROLE-03 «Người có quyền chạy hàng loạt: Có quyền thực hiện Thực hiện tổng…», TD-ROLE-09 «Giáo viên nhập điểm: Giáo viên phụ trách lớp G-A, G-B, G-C: có quyền…», AC-G22 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Ô S01 của mục số nguyên (M=100) chưa từng được xét (chưa có dòng kết quả); quy tắc “Cố định 30” (dưới 30) là quy tắc duy nhất; có cách cho hai lượt chạy gần như cùng lúc.
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29) (29); tài khoản có quyền chạy hàng loạt, tài khoản giáo viên nhập điểm lớp G-A, G-B, G-C

**操作（Thao tác）**

1. Cùng lúc: giáo viên lưu điểm S01 = 29 trên Đăng ký thành tích（成績登録） và người có quyền bấm nút cam cho G-A.
2. Xem kết quả S01 ở ba đầu ra; SELECT dòng kết quả của ô.
3. Lặp lại thao tác hoàn tất lần nữa với cùng dữ liệu (gửi lại form đăng ký, hoặc chạy lại job của cùng lượt nếu môi trường cho phép); xem lại và SELECT.

**期待結果（Kết quả mong đợi）**

1–2. S01 Đỏ; ô có đúng một kết quả hiện hành; ký hiệu đỏ không bị nhân đôi ở đầu ra (không có `**29`, `((29))`).
3. Không phát sinh dòng hoặc thao tác ghi thứ hai; kết quả không đổi.

**補足（Bổ sung）**
- Chức năng: Trạng thái, lỗi và quyền
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Ô S01 của mục số nguyên (M=100) chưa từng được xét (chưa có dòng kết quả); quy tắc “Cố định 30” (dưới 30) là quy tắc duy nhất; có cách cho hai lượt chạy gần như cùng lúc. - Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29) (29); tài khoản có quyền chạy hàng loạt, tài khoản giáo viên nhập điểm lớp G-A, G-B, G-C | Trigger/điểm quan sát: 1. Cùng lúc: giáo viên lưu điểm S01 = 29 trên Đăng ký thành tích（成績登録） và người có quyền bấm nút cam cho G-A. 2. Xem kết quả S01 ở ba đầu ra; SELECT dòng kết quả của ô. 3. Lặp lại thao tác hoàn tất lần nữa với cùng dữ liệu (gửi lại form đăng ký, hoặc chạy lại job của cùng lượt nếu môi trường cho phép); xem lại và SELECT. | Oracle/bằng chứng: 1–2. S01 Đỏ; ô có đúng một kết quả hiện hành; ký hiệu đỏ không bị nhân đôi ở đầu ra (không có `**29`, `((29))`). 3. Không phát sinh dòng hoặc thao tác ghi thứ hai; kết quả không đổi.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: BLOCKED

- Nguồn: [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật” (AC-G22 «Kết quả chung và thứ tự cập nhật») (ví dụ thứ tự cập nhật: "Hai lượt xét lần đầu đồng thời, hoặc gửi lại cùng thao tác hoàn tất → chỉ một kết quả hiện hành, không nhân đôi dấu hoặc thao tác ghi"); [context điểm đỏ](../../../CONTEXT.md) ([CTX](../../../CONTEXT.md) «context chuẩn điểm đỏ») mục 9.6 “Ba phản hồi review DB và bài học thiết kế ngày 28/09” (bài học 2: khóa dòng kết quả có thể không tồn tại ở lần ghi đầu); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất”; [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 6.1 “Dữ liệu điều khiển và dòng được khóa”, mục 6.2 “Đăng ký thường và batch” (PROPOSED: insert dòng điều khiển theo unique key, trùng thì khóa dòng có sẵn; gửi lại phiên bản đã hoàn tất không cập nhật)
- Bằng chứng cần chụp: Thời điểm hai thao tác; ảnh đầu ra; ảnh SELECT (che thông tin cá nhân).
- Ghi chú: Hành vi là CONFIRMED; cơ chế là PROPOSED. Nếu không tạo được hai lượt đồng thời thì BLOCKED, không ghi PASS.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-err-019"></a>

### TC-RS-ERR-019 — Đăng ký lần đầu đồng thời hai mục khác nhau của cùng học sinh giữ đủ cả hai

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật” (AC-G22 «Kết quả chung và thứ tự cập nhật»)

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-STU-01 «S01: G-A, HR1», TD-ROLE-09 «Giáo viên nhập điểm: Giáo viên phụ trách lớp G-A, G-B, G-C: có quyền…», AC-G22 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Cùng học sinh S01, lớp G-A, cùng kỳ Cuối kỳ học kỳ 1（1学期期末）, điểm thường; hai mục số khác nhau (mục số nguyên (M=100) và một mục số thứ hai của cùng khung) đều có quy tắc cố định 30 `<`; chưa có dòng điểm vật lý nào của S01 cho kỳ này.
- Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29); tài khoản giáo viên nhập điểm lớp G-A, G-B, G-C (hai phiên đăng nhập)

**操作（Thao tác）**

1. Hai phiên cùng lúc: phiên 1 lưu S01 = 29 cho mục số nguyên (M=100); phiên 2 lưu S01 = 45 cho mục thứ hai.
2. Mở lại Đăng ký thành tích（成績登録）; xem trích xuất; SELECT dòng điểm của S01 (trường/năm/học sinh/lớp/kỳ/đơn vị) và dòng kết quả của hai ô.

**期待結果（Kết quả mong đợi）**

- Cả hai điểm được giữ: mục số nguyên (M=100) = 29 (Đỏ), mục thứ hai = 45 (Không đỏ).
- Chỉ một dòng điểm vật lý cho S01/G-A/kỳ/điểm thường; không có dòng trùng; không mất điểm hoặc kết quả của mục nào.

**補足（Bổ sung）**
- Chức năng: Trạng thái, lỗi và quyền
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Cùng học sinh S01, lớp G-A, cùng kỳ Cuối kỳ học kỳ 1（1学期期末）, điểm thường; hai mục số khác nhau (mục số nguyên (M=100) và một mục số thứ hai của cùng khung) đều có quy tắc cố định 30 `<`; chưa có dòng điểm vật lý nào của S01 cho kỳ này. - Dữ liệu test: mục số nguyên (M=100); quy tắc “Cố định 30” (dưới 30); học sinh S01 (điểm 29); tài khoản giáo viên nhập điểm lớp G-A, G-B, G-C (hai phiên đăng nhập) | Trigger/điểm quan sát: 1. Hai phiên cùng lúc: phiên 1 lưu S01 = 29 cho mục số nguyên (M=100); phiên 2 lưu S01 = 45 cho mục thứ hai. 2. Mở lại Đăng ký thành tích（成績登録）; xem trích xuất; SELECT dòng điểm của S01 (trường/năm/học sinh/lớp/kỳ/đơn vị) và dòng kết quả của hai ô. | Oracle/bằng chứng: - Cả hai điểm được giữ: mục số nguyên (M=100) = 29 (Đỏ), mục thứ hai = 45 (Không đỏ). - Chỉ một dòng điểm vật lý cho S01/G-A/kỳ/điểm thường; không có dòng trùng; không mất điểm hoặc kết quả của mục nào.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: BLOCKED

- Nguồn: [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Kết quả chung và thứ tự cập nhật” (AC-G22 «Kết quả chung và thứ tự cập nhật») (ví dụ thứ tự cập nhật: "Đăng ký lần đầu đồng thời hai mục khác nhau của cùng học sinh/lớp/thời điểm/đơn vị → giữ cả hai mục trên một dòng điểm vật lý"); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất” (khóa dòng lớp là điểm chung khi hai mục cùng tạo dòng điểm); [thiết kế DB v2](../database-design.vi.md) ([RSD-DB](../database-design.vi.md) «thiết kế DB v2 đề xuất») mục 6.1 “Dữ liệu điều khiển và dòng được khóa” (PROPOSED: khóa `groups` rồi đọc lại, chỉ insert khi vẫn chưa có dòng)
- Bằng chứng cần chụp: Thời điểm hai thao tác; ảnh màn đăng ký sau khi mở lại; ảnh SELECT (che thông tin cá nhân).
- Ghi chú: Hành vi là CONFIRMED; cách khóa là PROPOSED. Đây cũng là kiểm hồi quy của đường ghi điểm hiện có. Không tạo được hai lượt đồng thời thì BLOCKED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-001"></a>

### TC-RS-REG-001 — Điểm do tính tự động（自動計算） tạo ra không đổi khi có quy tắc đỏ

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 7.1 “Trình tự cho một ô”, mục 12.2 “Điểm tích hợp chính”

<!-- Mã truy vết: TD-ITEM-10 «Mục có tính tự động: TD-ITEM-01 có thêm quy tắc tính tự…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên có thêm tính tự động có quy tắc tính tự động; baseline điểm tự động của khối 1. Thêm quy tắc “Cố định 30” (dưới 30).
- Dữ liệu test: mục số nguyên có thêm tính tự động, quy tắc “Cố định 30” (dưới 30)

**操作（Thao tác）**

1. Chạy nút cam cho khối 1.
2. So điểm của mục số nguyên có thêm tính tự động với baseline.

**期待結果（Kết quả mong đợi）**

Mọi điểm tự động bằng baseline; chỉ có thêm kết quả đỏ.

**補足（Bổ sung）**
- Chức năng: Hồi quy
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên có thêm tính tự động có quy tắc tính tự động; baseline điểm tự động của khối 1. Thêm quy tắc “Cố định 30” (dưới 30). - Dữ liệu test: mục số nguyên có thêm tính tự động, quy tắc “Cố định 30” (dưới 30) | Trigger/điểm quan sát: 1. Chạy nút cam cho khối 1. 2. So điểm của mục số nguyên có thêm tính tự động với baseline. | Oracle/bằng chứng: Mọi điểm tự động bằng baseline; chỉ có thêm kết quả đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Phần chịu ảnh hưởng: AutoRating: tính điểm theo quy tắc tính tự động（自動計算設定）; batch nút cam
- Điều có thể hỏng: Gắn phần xét đỏ vào vòng tính AutoRating làm đổi điểm được tính, thứ tự tính hoặc cách làm tròn điểm
- Lý do cần kiểm: Xét đỏ được thêm vào cùng đường đăng ký/batch với AutoRating
- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.1 “Trình tự cho một ô” (đoạn cuối: "Quy tắc đỏ không ghi lại điểm học sinh"), mục 12.2 “Điểm tích hợp chính” (AutoRating và tính hàng loạt)
- Bằng chứng cần chụp: Bảng so sánh baseline/sau (SELECT hoặc Excel).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-002"></a>

### TC-RS-REG-002 — Quy tắc đỏ không kế thừa hành vi "không khớp thì ghi NULL" của AutoRating

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 12.2 “Điểm tích hợp chính”

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-RULE-12 «Bộ lọc kết hợp: Giới hạn bằng bộ lọc（特定条件で絞り込む）: Khối（学年） = 1 hoặc 2», TC-RS-BR-002, TD-STU-07 «S07: G-B, HR2», SI-11 «Không có quy tắc khớp» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) chỉ có quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao); S07=20 không khớp (như case “Không quy tắc nào khớp khi đủ dữ liệu → Không áp dụng”). Mục không có quy tắc tính tự động.
- Dữ liệu test: mục số nguyên (M=100); quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao), học sinh S07 (điểm 35, cờ Chưa dự thi（未受験）)

**操作（Thao tác）**

1. Đăng ký S07=20; chạy nút cam.
2. Xem điểm S07 trên màn nhập điểm và DB.

**期待結果（Kết quả mong đợi）**

Điểm S07 vẫn 20 (không bị xóa/NULL); kết quả là Không áp dụng.

**補足（Bổ sung）**
- Chức năng: Hồi quy
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên (M=100) chỉ có quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao); S07=20 không khớp (như case “Không quy tắc nào khớp khi đủ dữ liệu → Không áp dụng”). Mục không có quy tắc tính tự động. - Dữ liệu test: mục số nguyên (M=100); quy tắc có bộ lọc kết hợp (khối 1 hoặc 2, nhóm Nâng cao), học sinh S07 (điểm 35, cờ Chưa dự thi（未受験）) | Trigger/điểm quan sát: 1. Đăng ký S07=20; chạy nút cam. 2. Xem điểm S07 trên màn nhập điểm và DB. | Oracle/bằng chứng: Điểm S07 vẫn 20 (không bị xóa/NULL); kết quả là Không áp dụng.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Phần chịu ảnh hưởng: Chọn quy tắc đỏ; bảng điểm học sinh
- Điều có thể hỏng: Dùng lại code chọn thiết lập của AutoRating làm điểm của ô không khớp quy tắc đỏ bị ghi `NULL`
- Lý do cần kiểm: Code AutoRating hiện ghi `NULL` khi không có thiết lập khớp (AutoRating chọn thiết lập khớp đầu tiên theo `sort_no` trước khi tính)
- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 12.2 “Điểm tích hợp chính” (dòng AutoRating: điều phải tránh "Kế thừa hành vi ghi `NULL` khi không khớp"); code hiện tại “AutoRating chọn thiết lập khớp đầu tiên theo `sort_no` trước khi tính”; khác biệt đặc tả–code về “Không có quy tắc khớp” (SI-11 «Không có quy tắc khớp»)
- Bằng chứng cần chụp: Ảnh màn nhập điểm; SELECT điểm.
- Ghi chú: Hành vi ghi `NULL` của AutoRating cho điểm **tự động** vẫn giữ như cũ (không thuộc thay đổi này).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-003"></a>

### TC-RS-REG-003 — Ô nhập tay được AutoRating bỏ qua vẫn giữ giá trị tay và vẫn được xét đỏ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Dùng điểm cuối cùng” (AC-G19 «Dùng điểm cuối cùng»)

<!-- Mã truy vết: TD-ITEM-10 «Mục có tính tự động: TD-ITEM-01 có thêm quy tắc tính tự…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-STU-08 «S08: G-B, HR2» -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên có thêm tính tự động + quy tắc “Cố định 30” (dưới 30); S08 nhập tay 28.
- Dữ liệu test: mục số nguyên có thêm tính tự động, quy tắc “Cố định 30” (dưới 30); học sinh S08 (sửa tay 28 thành 35)

**操作（Thao tác）**

1. Lưu S08=28 bằng nhập tay; chạy nút cam.
2. Xem điểm và kết quả đỏ.

**期待結果（Kết quả mong đợi）**

Điểm S08 vẫn 28 (không bị AutoRating ghi đè); S08 Đỏ.

**補足（Bổ sung）**
- Chức năng: Hồi quy
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: mục số nguyên có thêm tính tự động + quy tắc “Cố định 30” (dưới 30); S08 nhập tay 28. - Dữ liệu test: mục số nguyên có thêm tính tự động, quy tắc “Cố định 30” (dưới 30); học sinh S08 (sửa tay 28 thành 35) | Trigger/điểm quan sát: 1. Lưu S08=28 bằng nhập tay; chạy nút cam. 2. Xem điểm và kết quả đỏ. | Oracle/bằng chứng: Điểm S08 vẫn 28 (không bị AutoRating ghi đè); S08 Đỏ.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Phần chịu ảnh hưởng: Đăng ký điểm (đường ghi điểm “Màn lớp NB 成績登録 (đăng ký điểm)”), liên kết điểm thi (đường ghi điểm “Liên kết điểm thi”); ô nhập tay（手動入力）
- Điều có thể hỏng: Chỉ gắn xét đỏ trong nhánh AutoRating nên bỏ sót ô nhập tay, hoặc làm AutoRating ghi đè giá trị tay
- Lý do cần kiểm: AutoRating hiện bỏ qua ô được POST và học sinh nhập tay
- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.2 “Bảng sự kiện” (Liên kết kết quả chấm bài thi), mục 12.2 “Điểm tích hợp chính” (Đăng ký điểm trực tiếp và CSV); code hiện tại: AutoRating bỏ qua ô POST/nhập tay; [context điểm đỏ](../../../CONTEXT.md) ([CTX](../../../CONTEXT.md) «context chuẩn điểm đỏ») khoảng trống tích hợp “Không có công thức / điểm sửa tay” (I02 «Không có công thức / điểm sửa tay»)
- Bằng chứng cần chụp: Ảnh màn nhập điểm; ảnh đầu ra.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-004"></a>

### TC-RS-REG-004 — Nút cam/nút xanh của trường đang dùng AutoRating hoạt động như trước

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 1.3 “Quyền sử dụng”, mục 7.4 “Quy trình vận hành khi dùng trung bình/tỷ lệ nhóm”

<!-- Mã truy vết: TD-ROLE-03 «Người có quyền chạy hàng loạt: Có quyền thực hiện Thực hiện tổng…», TD-ITEM-10 «Mục có tính tự động: TD-ITEM-01 có thêm quy tắc tính tự…», TC-RS-FUNC-021 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Trường có AutoRating active; tài khoản có quyền chạy hàng loạt. Baseline: phạm vi chọn được và danh sách lớp được xếp hàng.
- Dữ liệu test: mục số nguyên có thêm tính tự động

**操作（Thao tác）**

1. Mở màn, chọn cùng phạm vi như baseline.
2. Chạy nút cam rồi nút xanh.

**期待結果（Kết quả mong đợi）**

Nút hiện, phạm vi chọn và danh sách lớp xếp hàng như baseline; AutoRating tính như baseline (REG-001).

**補足（Bổ sung）**
- Chức năng: Hồi quy
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Trường có AutoRating active; tài khoản có quyền chạy hàng loạt. Baseline: phạm vi chọn được và danh sách lớp được xếp hàng. - Dữ liệu test: mục số nguyên có thêm tính tự động | Trigger/điểm quan sát: 1. Mở màn, chọn cùng phạm vi như baseline. 2. Chạy nút cam rồi nút xanh. | Oracle/bằng chứng: Nút hiện, phạm vi chọn và danh sách lớp xếp hàng như baseline; AutoRating tính như baseline (REG-001).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Phần chịu ảnh hưởng: Màn Tổng hợp thành tích（成績集計）: nút Thực hiện tổng hợp（集計実行） và Thực hiện tính toán tự động（自動算出実行）
- Điều có thể hỏng: Sửa điều kiện hiện nút cam (để chạy cho mục chỉ có rule đỏ) làm đổi phạm vi chạy hoặc quyền của trường đang dùng AutoRating
- Lý do cần kiểm: Nút cam hiện chỉ hiện khi có AutoRating active và phải mở rộng cho rule đỏ
- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 1.3 “Quyền sử dụng” (Chạy tính toán hàng loạt: "Giữ quyền thực thi hiện hành và phạm vi được phép"), mục 7.4 “Quy trình vận hành khi dùng trung bình/tỷ lệ nhóm”; Figma MW “màn Tổng hợp thành tích（成績集計） – nút xanh/cam, lần chạy trước” (58:7232 «Figma MW: màn Tổng hợp thành tích（成績集計） – nút xanh/cam, lần chạy trước»)
- Bằng chứng cần chụp: Ảnh màn; log/danh sách job.
- Ghi chú: Trường không có AutoRating: case “Trường chỉ có quy tắc đỏ (không có tính tự động) vẫn có đường chạy hàng loạt”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-005"></a>

### TC-RS-REG-005 — Kết quả tổng hợp thứ hạng（順位集計） không đổi khi có quy tắc đỏ đọc nguồn

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 5.5 “Chọn bản nguồn”, mục 7.4 “Quy trình vận hành khi dùng trung bình/tỷ lệ nhóm”, mục 12.2 “Điểm tích hợp chính”

<!-- Mã truy vết: TD-RULE-07 «Cặp phân nhánh: Ưu tiên 1 "Trung bình từ 60": điều kiện `A≥60`, cố định…», TD-RULE-09 «Tỷ lệ nhóm: Điều kiện Tỷ lệ điểm của nhóm（集団の得点率） `≥65%`», TC-RS-BR-023 -->

**前提条件（Điều kiện trước）**

- Điều kiện: cặp quy tắc phân nhánh theo trung bình 60 và quy tắc theo tỷ lệ điểm của nhóm từ 65% đang dùng nguồn của khối 1. Baseline: kết quả tổng hợp (trung bình, thứ hạng, số người) chạy trên build cũ với cùng dữ liệu.
- Dữ liệu test: cặp quy tắc phân nhánh theo trung bình 60, quy tắc theo tỷ lệ điểm của nhóm từ 65%

**操作（Thao tác）**

1. Chạy nút xanh rồi nút cam cho khối 1.
2. So trung bình, thứ hạng, số người với baseline.

**期待結果（Kết quả mong đợi）**

Trung bình, thứ hạng, số người bằng baseline; nút cam không ghi lại kết quả tổng hợp.

**補足（Bổ sung）**
- Chức năng: Hồi quy
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: cặp quy tắc phân nhánh theo trung bình 60 và quy tắc theo tỷ lệ điểm của nhóm từ 65% đang dùng nguồn của khối 1. Baseline: kết quả tổng hợp (trung bình, thứ hạng, số người) chạy trên build cũ với cùng dữ liệu. - Dữ liệu test: cặp quy tắc phân nhánh theo trung bình 60, quy tắc theo tỷ lệ điểm của nhóm từ 65% | Trigger/điểm quan sát: 1. Chạy nút xanh rồi nút cam cho khối 1. 2. So trung bình, thứ hạng, số người với baseline. | Oracle/bằng chứng: Trung bình, thứ hạng, số người bằng baseline; nút cam không ghi lại kết quả tổng hợp.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Phần chịu ảnh hưởng: Tổng hợp thứ hạng（順位集計）; bảng kết quả tổng hợp; màn Tổng hợp thành tích（成績集計）
- Điều có thể hỏng: Phần đọc nguồn trung bình/tỷ lệ nhóm ghi vào hoặc làm đổi kết quả tổng hợp, trung bình, thứ hạng
- Lý do cần kiểm: Tính năng đọc trung bình/tỷ lệ nhóm từ kết quả tổng hợp hiện có
- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 5.5 “Chọn bản nguồn”, mục 7.4 “Quy trình vận hành khi dùng trung bình/tỷ lệ nhóm” bước 3–5, mục 12.2 “Điểm tích hợp chính” (`GradeCalcResultService` và nguồn chốt)
- Bằng chứng cần chụp: Bảng so sánh tổng hợp baseline/sau.
- Ghi chú: Nút xanh không xét điểm đỏ: case “Nút xanh Thực hiện tổng hợp（集計実行） không xét điểm đỏ”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-006"></a>

### TC-RS-REG-006 — Trích xuất: mẫu hiện có không cấu hình đỏ cho kết quả như trước

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 9.1 “Thiết lập”, mục 9.2 “Kết quả và ví dụ”, mục 9.3 “Xuất file”

<!-- Mã truy vết: TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-STU-01 «S01: G-A, HR1», TD-STU-02 «S02: G-A, HR1», TD-STU-03 «S03: G-A, HR1», TD-STU-04 «S04: G-A, HR1», TD-STU-05 «S05: G-A, HR1», TD-STU-06 «S06: G-B, HR2», TD-STU-07 «S07: G-B, HR2», TD-STU-08 «S08: G-B, HR2», TD-STU-09 «S09: G-B, HR2», TD-STU-10 «S10: HR2» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Ba mẫu trích xuất hiện có (có Khoảng điểm（点数範囲） tô màu, có lọc, có ký hiệu). Baseline màn và Excel. Mục có quy tắc “Cố định 30” (dưới 30).
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30); học sinh S01–S10

**操作（Thao tác）**

1. Chạy lại ba mẫu, xuất Excel, so với baseline.
2. Mở màn tạo mẫu trích xuất mới, Thiết lập công khai thành tích（成績公開設定） chưa từng lưu hiệu ứng đỏ, và dòng Thiết lập điểm đỏ（赤点設定） của một bảng phiếu điểm mới.

**期待結果（Kết quả mong đợi）**

1. Danh sách học sinh, giá trị, ký hiệu, màu và định dạng Excel bằng baseline (mẫu chưa bật tùy chọn đỏ).
2. (PROPOSED) Trích xuất: lọc đỏ và các hiệu ứng đỏ mặc định TẮT; công khai: chưa chọn hiệu ứng đỏ nào, và khi chưa cấu hình thì màn học sinh vẫn hiển thị như hiện có dù mục có ô Đỏ; phiếu điểm: Nguyên trạng（そのまま表示）.

**補足（Bổ sung）**
- Chức năng: Hồi quy
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Ba mẫu trích xuất hiện có (có Khoảng điểm（点数範囲） tô màu, có lọc, có ký hiệu). Baseline màn và Excel. Mục có quy tắc “Cố định 30” (dưới 30). - Dữ liệu test: quy tắc “Cố định 30” (dưới 30); học sinh S01–S10 | Trigger/điểm quan sát: 1. Chạy lại ba mẫu, xuất Excel, so với baseline. 2. Mở màn tạo mẫu trích xuất mới, Thiết lập công khai thành tích（成績公開設定） chưa từng lưu hiệu ứng đỏ, và dòng Thiết lập điểm đỏ（赤点設定） của một bảng phiếu điểm mới. | Oracle/bằng chứng: 1. Danh sách học sinh, giá trị, ký hiệu, màu và định dạng Excel bằng baseline (mẫu chưa bật tùy chọn đỏ). 2. (PROPOSED) Trích xuất: lọc đỏ và các hiệu ứng đỏ mặc định TẮT; công khai: chưa chọn hiệu ứng đỏ nào, và khi chưa cấu hình thì màn học sinh vẫn hiển thị như hiện có dù mục có ô Đỏ; phiếu điểm: Nguyên trạng（そのまま表示）.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Phần chịu ảnh hưởng: Trích xuất thành tích（成績抽出）: bộ lọc, trang trí ô, Excel
- Điều có thể hỏng: Thêm điều kiện đỏ làm đổi kết quả lọc, màu hoặc định dạng Excel của mẫu đang dùng
- Lý do cần kiểm: Điều kiện đỏ dùng chung cơ chế lọc/trang trí ô (`addFilterResultProperty`)
- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 9.1 “Thiết lập” (đề xuất mặc định không bật), mục 9.2 “Kết quả và ví dụ” (đoạn cuối: "không thay ý nghĩa các điều kiện khác… đi qua cơ chế trang trí ô hiện có"), mục 9.3 “Xuất file”
- Bằng chứng cần chụp: Excel baseline và sau; ảnh màn; ảnh mặc định của ba màn ở bước 2.
- Ghi chú: Mặc định không bật tùy chọn đỏ là PROPOSED (đặc tả v2 mục 9.1 “Thiết lập” Đề xuất mặc định; tiêu chí nghiệm thu v2 Chi tiết thiết kế; tài liệu chia công việc v2 công việc “Hiển thị điểm đỏ trên công khai, không lặp hiệu ứng”: "chưa cấu hình thì giữ hiển thị hiện có"); phần "điều kiện khác không đổi nghĩa" là CONFIRMED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-007"></a>

### TC-RS-REG-007 — Công khai: hiệu ứng Điểm dự kiến（見込点） và thiết lập khác được giữ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kết hợp hiệu ứng công khai” (AC-G33 «Kết hợp hiệu ứng công khai»)

<!-- Mã truy vết: TD-OUT-03 «Công khai: Hiệu ứng đỏ: `*` phía trước（前に「*」）», TD-STU-06 «S06: G-B, HR2», TC-RS-BR-010 -->

**前提条件（Điều kiện trước）**

- Điều kiện: cấu hình công khai: “*” phía trước. S06 (dự kiến, Đỏ). Một học sinh khác có điểm dự kiến, Không đỏ. Baseline màn học sinh.
- Dữ liệu test: cấu hình công khai: “*” phía trước; học sinh S06 (điểm dự kiến 24)

**操作（Thao tác）**

1. Xem màn học sinh.
2. Làm S06 chuyển Chưa xét được (như case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”), xem lại.
3. Xóa quy tắc cuối, mở Thiết lập công khai thành tích（成績公開設定）.

**期待結果（Kết quả mong đợi）**

1. Học sinh Không đỏ hiển thị như baseline (ngoặc dự kiến).
2. S06 bỏ `*` đỏ nhưng giữ ngoặc dự kiến: `(24)`.
3. Cấu hình hiển thị đã lưu không bị xóa. Nền và định dạng khác như baseline.

**補足（Bổ sung）**
- Chức năng: Hồi quy
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: cấu hình công khai: “*” phía trước. S06 (dự kiến, Đỏ). Một học sinh khác có điểm dự kiến, Không đỏ. Baseline màn học sinh. - Dữ liệu test: cấu hình công khai: “*” phía trước; học sinh S06 (điểm dự kiến 24) | Trigger/điểm quan sát: 1. Xem màn học sinh. 2. Làm S06 chuyển Chưa xét được (như case “Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0 hay nhóm khác”), xem lại. 3. Xóa quy tắc cuối, mở Thiết lập công khai thành tích（成績公開設定）. | Oracle/bằng chứng: 1. Học sinh Không đỏ hiển thị như baseline (ngoặc dự kiến). 2. S06 bỏ `*` đỏ nhưng giữ ngoặc dự kiến: `(24)`. 3. Cấu hình hiển thị đã lưu không bị xóa. Nền và định dạng khác như baseline.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Phần chịu ảnh hưởng: Thiết lập công khai thành tích（成績公開設定）; màn học sinh Xác nhận thành tích（成績確認）, API, PDF
- Điều có thể hỏng: Sửa hàm trang trí điểm làm mất hiệu ứng dự kiến, nền tiêu đề/bảng; hoặc xóa quy tắc cuối làm mất cấu hình trình bày đã lưu
- Lý do cần kiểm: Hiệu ứng đỏ dùng chung hàm trang trí với Điểm dự kiến（見込点）
- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 10.1 “Phạm vi và tùy chọn” (đoạn cuối), mục 10.3 “Quyền, thời điểm và đầu ra liên quan” (đoạn 2); code hiện tại “公開 (công khai) hiệu ứng” (`GradePublishService.php:1020-1217`)
- Bằng chứng cần chụp: Ảnh màn học sinh; ảnh cấu hình.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-008"></a>

### TC-RS-REG-008 — Công khai: điểm ẩn, lịch và đối tượng công khai được giữ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Cấu hình công khai và ẩn điểm” (AC-G32 «Cấu hình công khai và ẩn điểm»)

<!-- Mã truy vết: TD-STU-06 «S06: G-B, HR2», TD-ROLE-05 «Học sinh: Học sinh S01 của trường A, có lịch công khai đang mở», SI-13 «Công khai với Không hiển thị（表示しない）», TC-RS-BR-025 -->

**前提条件（Điều kiện trước）**

- Điều kiện: S06 Đỏ, mục đặt Không hiển thị（表示しない） cho điểm dự kiến; lịch công khai đang mở cho HR2; một lịch đã đóng.
- Dữ liệu test: học sinh S06 (điểm dự kiến 24), tài khoản học sinh S01

**操作（Thao tác）**

1. Xem màn học sinh, API, PDF của S06.
2. Xem khi lịch đóng.

**期待結果（Kết quả mong đợi）**

1. Điểm vẫn ẩn; không có dấu đỏ riêng lẻ.
2. Không xem được như baseline.

**補足（Bổ sung）**
- Chức năng: Hồi quy
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: S06 Đỏ, mục đặt Không hiển thị（表示しない） cho điểm dự kiến; lịch công khai đang mở cho HR2; một lịch đã đóng. - Dữ liệu test: học sinh S06 (điểm dự kiến 24), tài khoản học sinh S01 | Trigger/điểm quan sát: 1. Xem màn học sinh, API, PDF của S06. 2. Xem khi lịch đóng. | Oracle/bằng chứng: 1. Điểm vẫn ẩn; không có dấu đỏ riêng lẻ. 2. Không xem được như baseline.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Phần chịu ảnh hưởng: Màn học sinh, API, PDF công khai
- Điều có thể hỏng: Hiệu ứng đỏ làm hiện lại số bị ẩn hoặc để lại dấu `*`/ngoặc làm lộ trạng thái; đường đọc mới bỏ qua lịch công khai
- Lý do cần kiểm: Code công khai xử lý Không hiển thị（表示しない） trong cùng vòng lặp trang trí (khác biệt đặc tả–code về “Công khai với Không hiển thị（表示しない）”)
- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 10.2 “Kết hợp điểm dự kiến và điểm đỏ” (dòng "Đã bị ẩn…"), mục 10.3 “Quyền, thời điểm và đầu ra liên quan” (đoạn 1), mục 8.4 “Lỗi kỹ thuật và thông báo” (đoạn cuối); [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) ([QAC](../../../sources/confirmed-business-qa.vi.md) «Q&A nghiệp vụ đã xác nhận») câu “Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?” (Q16 «Ba đầu ra có dùng chung kết quả và tự xét khi xem lại không?»); khác biệt đặc tả–code về “Công khai với Không hiển thị（表示しない）” (SI-13 «Công khai với Không hiển thị（表示しない）»)
- Bằng chứng cần chụp: Ảnh màn, phản hồi API (che token), PDF.
- Ghi chú: Cách hiện thực ẩn khi dự kiến = Không hiển thị chưa chốt. Không chặn công khai khi thiếu kết quả đỏ: case “Đầu ra không bị chặn vì chưa có hoặc chưa xét được kết quả đỏ”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-009"></a>

### TC-RS-REG-009 — Phiếu điểm: các điều kiện hiển thị hiện có giữ hành vi

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Phiếu dừng ở điều kiện khớp đầu tiên” (AC-G36 «Phiếu dừng ở điều kiện khớp đầu tiên»)

<!-- Mã truy vết: TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-STU-05 «S05: G-A, HR1», TD-STU-07 «S07: G-B, HR2» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Hai bảng điểm hiện có: (a) dùng điều kiện môn cụ thể và ô trống; (b) dùng checkbox Chưa dự thi（未受験） với ẩn. Baseline PDF. Mục có quy tắc “Cố định 30” (dưới 30); hai bảng chưa bật dòng đỏ.
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30); học sinh S05 (ô trống), học sinh S07 (điểm 35, cờ Chưa dự thi（未受験）)

**操作（Thao tác）**

Xuất PDF hai bảng, so với baseline.

**期待結果（Kết quả mong đợi）**

PDF bằng baseline (cùng ký hiệu, ô ẩn, ô trống).

**補足（Bổ sung）**
- Chức năng: Hồi quy
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Hai bảng điểm hiện có: (a) dùng điều kiện môn cụ thể và ô trống; (b) dùng checkbox Chưa dự thi（未受験） với ẩn. Baseline PDF. Mục có quy tắc “Cố định 30” (dưới 30); hai bảng chưa bật dòng đỏ. - Dữ liệu test: quy tắc “Cố định 30” (dưới 30); học sinh S05 (ô trống), học sinh S07 (điểm 35, cờ Chưa dự thi（未受験）) | Trigger/điểm quan sát: Xuất PDF hai bảng, so với baseline. | Oracle/bằng chứng: PDF bằng baseline (cùng ký hiệu, ô ẩn, ô trống).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Phần chịu ảnh hưởng: Công cụ phiếu điểm（通知表ツール）: bộ chuyển đổi điều kiện hiển thị; PDF
- Điều có thể hỏng: Chèn điều kiện đỏ vào chuỗi first-match làm đổi kết quả của các điều kiện môn cụ thể, checkbox, ô trống
- Lý do cần kiểm: Điều kiện đỏ được chèn vào giữa chuỗi điều kiện hiện có
- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 11.1 “Tùy chọn hiển thị đỏ” (không thêm ẩn/gạch chéo riêng; điều kiện có sẵn giữ), mục 11.2 “Thứ tự và điều kiện khớp đầu tiên”; code hiện tại “通知表 (phiếu điểm) first match”
- Bằng chứng cần chụp: PDF baseline và sau.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-010"></a>

### TC-RS-REG-010 — PDF phiếu: bố cục template không đổi khi có dấu đỏ

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Lưu, sao chép và PDF phiếu” (AC-G37 «Lưu, sao chép và PDF phiếu»)

<!-- Mã truy vết: TD-OUT-04 «Phiếu điểm: Dòng Thiết lập điểm đỏ（赤点設定）: Ký tự phía trước（前に任意の文字） `※`», TD-STU-01 «S01: G-A, HR1», TD-STU-09 «S09: G-B, HR2» -->

**前提条件（Điều kiện trước）**

- Điều kiện: cấu hình phiếu điểm: ký tự “※” phía trước với ký tự `※`; ô hẹp nhất của template chứa điểm 3 chữ số (ví dụ 100 nếu có quy tắc `≤100`, hoặc 29.5 cho mục thập phân).
- Dữ liệu test: cấu hình phiếu điểm: ký tự “※” phía trước; học sinh S01 (điểm 29), học sinh S09 (mục số thập phân 29.5)

**操作（Thao tác）**

Xuất PDF; so với baseline.

**期待結果（Kết quả mong đợi）**

Dấu hiển thị đủ trong ô; không mất ký tự, không nền đỏ; các phần khác bằng baseline.

**補足（Bổ sung）**
- Chức năng: Hồi quy
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: cấu hình phiếu điểm: ký tự “※” phía trước với ký tự `※`; ô hẹp nhất của template chứa điểm 3 chữ số (ví dụ 100 nếu có quy tắc `≤100`, hoặc 29.5 cho mục thập phân). - Dữ liệu test: cấu hình phiếu điểm: ký tự “※” phía trước; học sinh S01 (điểm 29), học sinh S09 (mục số thập phân 29.5) | Trigger/điểm quan sát: Xuất PDF; so với baseline. | Oracle/bằng chứng: Dấu hiển thị đủ trong ô; không mất ký tự, không nền đỏ; các phần khác bằng baseline.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Phần chịu ảnh hưởng: PDF phiếu điểm
- Điều có thể hỏng: Ký tự thêm vào làm tràn ô, mất ký tự, xuống dòng hoặc đổi cấu trúc template
- Lý do cần kiểm: Ô điểm có độ rộng cố định theo template
- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 11.1 “Tùy chọn hiển thị đỏ” (không nền đỏ, không ép template), mục 11.3 “Lưu và xuất” (đoạn 2)
- Bằng chứng cần chụp: PDF thực (ảnh HTML không thay được).
- Ghi chú: Chiều dài tối đa của ký tự tùy ý: chưa có nguồn.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-013"></a>

### TC-RS-REG-013 — Các màn điểm tối đa lưu và xếp hàng như trước

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Trigger khi đổi điểm tối đa/đơn vị” (AC-G24 «Trigger khi đổi điểm tối đa/đơn vị»)

<!-- Mã truy vết: TD-ITEM-03 «Mục điểm đơn vị: Điểm bài kiểm tra đơn vị（単元テスト点）, M mặc định 100», TD-RULE-03 «Tỷ lệ: Tỷ lệ điểm tối đa（得点率） 30%, không xử lý phần lẻ（しない）, Nhỏ hơn（未満）», TC-RS-BR-022, TC-RS-FUNC-020 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Baseline trên build cũ: giá trị lưu, thông báo và danh sách job khi thực hiện ba bước dưới với cùng dữ liệu. mục điểm đơn vị (đơn vị U1 có M riêng 40) có quy tắc tỷ lệ 30%.
- Dữ liệu test: quy tắc tỷ lệ 30%; mục điểm đơn vị (đơn vị U1 có M riêng 40)

**操作（Thao tác）**

1. Đổi định nghĩa M ở Thiết lập điểm tối đa（満点設定）, lưu, mở lại.
2. Đổi Giá trị tối đa（最大値）, lưu, mở lại.
3. Lưu ở Thiết lập điểm tối đa hàng loạt（満点一括設定） lựa chọn M=50 cho G-B; xem danh sách job.

**期待結果（Kết quả mong đợi）**

Giá trị lưu, thông báo và danh sách job (lớp/kỳ được xếp hàng) bằng baseline.

**補足（Bổ sung）**
- Chức năng: Hồi quy
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Baseline trên build cũ: giá trị lưu, thông báo và danh sách job khi thực hiện ba bước dưới với cùng dữ liệu. mục điểm đơn vị (đơn vị U1 có M riêng 40) có quy tắc tỷ lệ 30%. - Dữ liệu test: quy tắc tỷ lệ 30%; mục điểm đơn vị (đơn vị U1 có M riêng 40) | Trigger/điểm quan sát: 1. Đổi định nghĩa M ở Thiết lập điểm tối đa（満点設定）, lưu, mở lại. 2. Đổi Giá trị tối đa（最大値）, lưu, mở lại. 3. Lưu ở Thiết lập điểm tối đa hàng loạt（満点一括設定） lựa chọn M=50 cho G-B; xem danh sách job. | Oracle/bằng chứng: Giá trị lưu, thông báo và danh sách job (lớp/kỳ được xếp hàng) bằng baseline.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Phần chịu ảnh hưởng: Thiết lập điểm tối đa（満点設定）, Giá trị tối đa（最大値） trong Thiết lập ô nhập（入力欄設定）, Thiết lập điểm tối đa hàng loạt（満点一括設定）
- Điều có thể hỏng: Gắn xét đỏ vào các màn này làm đổi giá trị được lưu, thông báo hoặc cách xếp hàng batch của lưu hàng loạt
- Lý do cần kiểm: Loại tỷ lệ phụ thuộc M hiện hành nên dễ bị gắn thêm trigger vào các màn này
- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.3 “Thay đổi điểm tối đa”; code hiện tại: đường ghi điểm “満点一括設定 (thiết lập điểm tối đa hàng loạt)”, “入力欄設定 (thiết lập ô nhập) `itemStore` :990 / `optionStore` :2472…”
- Bằng chứng cần chụp: Ảnh trước/sau; log job.
- Sau khi chạy: Khôi phục M ban đầu.
- Ghi chú: Thời điểm kết quả đỏ thay đổi sau các thao tác này: case “Đổi M ở Thiết lập điểm tối đa（満点設定） hoặc Giá trị tối đa（最大値） không tự xét lại”, case “Lưu Thiết lập điểm tối đa hàng loạt（満点一括設定） xếp hàng tính toán rồi mới có kết quả mới”.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-014"></a>

### TC-RS-REG-014 — Batch không phát sinh truy vấn theo từng ô（N+1）

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 12.2 “Điểm tích hợp chính”

<!-- Mã truy vết: TD-ENV-01 «Môi trường chạy, Trường test, Năm học» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Khối có ít nhất 2 cỡ dữ liệu khác nhau (ví dụ 10 và 100 học sinh) trên môi trường local; bật log truy vấn.
- Dữ liệu test: môi trường test (trường A, năm học 2026)

**操作（Thao tác）**

Chạy batch với từng cỡ dữ liệu; đếm truy vấn liên quan đến quy tắc/nguồn/kết quả đỏ.

**期待結果（Kết quả mong đợi）**

Số truy vấn đọc quy tắc/nguồn/M không tăng tuyến tính theo số ô. Thời gian chạy chỉ ghi lại để so, không có ngưỡng pass/fail (tài liệu chưa đặt ngưỡng).

**補足（Bổ sung）**
- Chức năng: Hồi quy
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Khối có ít nhất 2 cỡ dữ liệu khác nhau (ví dụ 10 và 100 học sinh) trên môi trường local; bật log truy vấn. - Dữ liệu test: môi trường test (trường A, năm học 2026) | Trigger/điểm quan sát: Chạy batch với từng cỡ dữ liệu; đếm truy vấn liên quan đến quy tắc/nguồn/kết quả đỏ. | Oracle/bằng chứng: Số truy vấn đọc quy tắc/nguồn/M không tăng tuyến tính theo số ô. Thời gian chạy chỉ ghi lại để so, không có ngưỡng pass/fail (tài liệu chưa đặt ngưỡng).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Phần chịu ảnh hưởng: Batch nút cam; đăng ký điểm lớp nhiều học sinh
- Điều có thể hỏng: Tải quy tắc/nguồn/M theo từng ô làm số truy vấn tăng theo số ô
- Lý do cần kiểm: Xét đỏ chạy trên mọi ô bị tác động của lượt
- Nguồn: Quy tắc phát triển BLEND (không N+1); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 12.2 “Điểm tích hợp chính”
- Bằng chứng cần chụp: Log/số truy vấn hai cỡ dữ liệu.
- Sau khi chạy: Tắt log truy vấn.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-015"></a>

### TC-RS-REG-015 — Quyền học sinh/phụ huynh giữ nguyên

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Đúng người, lịch và đầu ra công khai” (AC-G34 «Đúng người, lịch và đầu ra công khai»)

<!-- Mã truy vết: TD-ROLE-05 «Học sinh: Học sinh S01 của trường A, có lịch công khai đang mở», TD-ROLE-08 «Phụ huynh: Phụ huynh có quan hệ với S01 ở trường A, lịch công khai đang…», AC-G34 -->

**前提条件（Điều kiện trước）**

- Điều kiện: tài khoản học sinh S01 (S01), tài khoản phụ huynh của học sinh S01 (phụ huynh của S01). Tài khoản học sinh/phụ huynh test lấy theo kênh được phép.
- Dữ liệu test: tài khoản học sinh S01, tài khoản phụ huynh của học sinh S01

**操作（Thao tác）**

1. Đăng nhập S01, xem màn.
2. Đổi ID học sinh trong URL/request API sang S02.
3. Mở URL màn cấu hình đỏ.
4. Đăng nhập phụ huynh của S01, xem màn và PDF công khai.
5. Đổi ID học sinh trong URL/request API sang S02.

**期待結果（Kết quả mong đợi）**

1. Chỉ thấy dữ liệu S01.
2. Bị từ chối.
3. Bị từ chối.
4. Chỉ thấy dữ liệu S01; dấu đỏ và điểm ẩn giống màn học sinh.
5. Bị từ chối.

**補足（Bổ sung）**
- Chức năng: Hồi quy
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: tài khoản học sinh S01 (S01), tài khoản phụ huynh của học sinh S01 (phụ huynh của S01). Tài khoản học sinh/phụ huynh test lấy theo kênh được phép. - Dữ liệu test: tài khoản học sinh S01, tài khoản phụ huynh của học sinh S01 | Trigger/điểm quan sát: 1. Đăng nhập S01, xem màn. 2. Đổi ID học sinh trong URL/request API sang S02. 3. Mở URL màn cấu hình đỏ. 4. Đăng nhập phụ huynh của S01, xem màn và PDF công khai. 5. Đổi ID học sinh trong URL/request API sang S02. | Oracle/bằng chứng: 1. Chỉ thấy dữ liệu S01. 2. Bị từ chối. 3. Bị từ chối. 4. Chỉ thấy dữ liệu S01; dấu đỏ và điểm ẩn giống màn học sinh. 5. Bị từ chối.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Phần chịu ảnh hưởng: Màn học sinh Xác nhận thành tích（成績確認）, API công khai
- Điều có thể hỏng: Đường đọc kết quả đỏ mới trả dữ liệu học sinh khác hoặc cho truy cập cấu hình đỏ
- Lý do cần kiểm: Kết quả đỏ là dữ liệu mới được đưa vào đầu ra học sinh
- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 1.3 “Quyền sử dụng” (Học sinh/phụ huynh xem kết quả), mục 10.3 “Quyền, thời điểm và đầu ra liên quan” (đoạn 1); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) ([RSD-AC](../acceptance-criteria.vi.md) «tiêu chí nghiệm thu v2») tiêu chí nghiệm thu “Đúng người, lịch và đầu ra công khai” (AC-G34 «Đúng người, lịch và đầu ra công khai»)
- Bằng chứng cần chụp: Ảnh màn; phản hồi (che token).
- Ghi chú: Màn hồ sơ phía giáo viên không thay được bằng chứng màn học sinh (đặc tả v2 mục 10.3 “Quyền, thời điểm và đầu ra liên quan”).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-016"></a>

### TC-RS-REG-016 — Đăng ký điểm: xử lý điểm liên quan và giao dịch giữ như trước

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất”, mục 8.4 “Lỗi kỹ thuật và thông báo”

<!-- Mã truy vết: TD-ITEM-10 «Mục có tính tự động: TD-ITEM-01 có thêm quy tắc tính tự…», TD-RULE-01 «Cố định `<`: Tên "Cố định 30"», TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Mục có môn chính/môn con và quan điểm, có quy tắc tính tự động（自動計算設定） (mục số nguyên có thêm tính tự động) để các bước sau tính tự động chạy; baseline điểm môn chính, điểm quan điểm được sao chép và tín chỉ（単位） sau khi lưu điểm môn con. quy tắc “Cố định 30” (dưới 30) ở mục môn chính và ở mục nhận điểm sao chép theo quan điểm.
- Dữ liệu test: quy tắc “Cố định 30” (dưới 30); mục số nguyên (M=100); mục số nguyên có thêm tính tự động

**操作（Thao tác）**

1. Lưu điểm môn con qua đường ghi điểm “Màn lớp NB 成績登録 (đăng ký điểm)”, đường ghi điểm “CSV lớp NB”, đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)”.
2. So điểm môn chính, điểm quan điểm được sao chép và tín chỉ với baseline.
3. Xem kết quả đỏ của ô môn chính và ô nhận điểm sao chép; chọn dữ liệu sao cho giá trị trung gian (trước bước môn chính/phụ hoặc sao chép) và giá trị cuối nằm khác phía ngưỡng 30.

**期待結果（Kết quả mong đợi）**

1–2. Điểm môn chính, điểm quan điểm được sao chép và tín chỉ bằng baseline; thông báo và hành vi lỗi của từng đường như baseline.

3. Ô môn chính và ô nhận điểm sao chép được xét theo giá trị cuối sau các bước sau tính tự động, không theo giá trị trung gian (đặc tả v2 mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất”).

**補足（Bổ sung）**
- Chức năng: Hồi quy
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Mục có môn chính/môn con và quan điểm, có quy tắc tính tự động（自動計算設定） (mục số nguyên có thêm tính tự động) để các bước sau tính tự động chạy; baseline điểm môn chính, điểm quan điểm được sao chép và tín chỉ（単位） sau khi lưu điểm môn con. quy tắc “Cố định 30” (dưới 30) ở mục môn chính và ở mục nhận điểm sao chép theo quan điểm. - Dữ liệu test: quy tắc “Cố định 30” (dưới 30); mục số nguyên (M=100); mục số nguyên có thêm tính tự động | Trigger/điểm quan sát: 1. Lưu điểm môn con qua đường ghi điểm “Màn lớp NB 成績登録 (đăng ký điểm)”, đường ghi điểm “CSV lớp NB”, đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)”. 2. So điểm môn chính, điểm quan điểm được sao chép và tín chỉ với baseline. 3. Xem kết quả đỏ của ô môn chính và ô nhận điểm sao chép; chọn dữ liệu sao cho giá trị trung gian (trước bước môn chính/phụ hoặc sao chép) và giá trị cuối nằm khác phía ngưỡng 30. | Oracle/bằng chứng: 1–2. Điểm môn chính, điểm quan điểm được sao chép và tín chỉ bằng baseline; thông báo và hành vi lỗi của từng đường như baseline. 3. Ô môn chính và ô nhận điểm sao chép được xét theo giá trị cuối sau các bước sau tính tự động, không theo giá trị trung gian (đặc tả v2 mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất”).; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Phần chịu ảnh hưởng: Đăng ký điểm trực tiếp (đường ghi điểm “Màn lớp NB 成績登録 (đăng ký điểm)”), CSV lớp (đường ghi điểm “CSV lớp NB”), CSV HR (đường ghi điểm “HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)”)
- Điều có thể hỏng: Chèn xét đỏ làm đổi thứ tự xử lý điểm môn chính/quan điểm, hoặc làm hỏng transaction
- Lý do cần kiểm: Xét đỏ phải chạy sau mọi ghi của lượt (context điểm đỏ khoảng trống tích hợp “Điểm cuối và môn liên quan”)
- Nguồn: [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 7.5 “Phạm vi một lượt và thứ tự hoàn tất” (đoạn 1), mục 8.4 “Lỗi kỹ thuật và thông báo” (gạch đầu dòng 1); code hiện tại: `saveGradeToParentSubSubject`, `copyKantenGrade`, transaction của đường “Màn lớp NB 成績登録 (đăng ký điểm)”/“CSV lớp NB”/“HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV)”; [context điểm đỏ](../../../CONTEXT.md) ([CTX](../../../CONTEXT.md) «context chuẩn điểm đỏ») khoảng trống tích hợp “Điểm cuối và môn liên quan” (I03 «Điểm cuối và môn liên quan»), khoảng trống tích hợp “Thành công/skip/lỗi” (I05 «Thành công/skip/lỗi»); [tài liệu chia công việc v2](../split-tasks.vi.md) ([RSD-TASK](../split-tasks.vi.md) «bản chia công việc v2») công việc “Cập nhật kết quả khi đăng ký và chạy hàng loạt” (Task 4 «Cập nhật kết quả khi đăng ký và chạy hàng loạt») (Hướng kỹ thuật, gạch đầu dòng 3: "Xác định tập ô cuối gồm cả cập nhật liên quan, không xét trung gian"); code hiện tại “Các bước sau `calcAutoRating`: môn chính/phụ, sao chép theo tiêu chí…” (`calcAutoRating` → `saveGradeToParentSubSubject` môn chính/phụ → `copyKantenGrade` sao chép điểm theo quan điểm → `registStudentUnitFix` ghi tín chỉ（単位）)
- Bằng chứng cần chụp: SELECT điểm và tín chỉ trước/sau; ảnh kết quả.
- Ghi chú: Cấu trúc môn chính/con cụ thể: hỏi dev khi chuẩn bị dữ liệu.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-reg-017"></a>

### TC-RS-REG-017 — Thiết lập ô nhập（入力欄設定）: các hàng hiện có không bị ảnh hưởng

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 4.1 “Điểm vào và trạng thái trống”, mục 12.2 “Điểm tích hợp chính”

<!-- Mã truy vết: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…», TD-ITEM-10 «Mục có tính tự động: TD-ITEM-01 có thêm quy tắc tính tự…» -->

**前提条件（Điều kiện trước）**

- Điều kiện: Baseline màn với nhiều mục; có mục có tính tự động và mục bị ẩn.
- Dữ liệu test: mục số nguyên (M=100), mục số nguyên có thêm tính tự động

**操作（Thao tác）**

1. Mở màn, so bố cục với baseline.
2. Bấm link ở hàng Tính tự động（自動計算） và Thiết lập ẩn mục nhập（入力項目の非表示設定）.
3. Sửa một giá trị ở hàng khác, lưu.

**期待結果（Kết quả mong đợi）**

Cột thẳng hàng, link mở đúng màn của đúng mục, lưu các hàng khác như baseline.

**補足（Bổ sung）**
- Chức năng: Hồi quy
- Ngữ cảnh: Actor/quyền và fixture: - Điều kiện: Baseline màn với nhiều mục; có mục có tính tự động và mục bị ẩn. - Dữ liệu test: mục số nguyên (M=100), mục số nguyên có thêm tính tự động | Trigger/điểm quan sát: 1. Mở màn, so bố cục với baseline. 2. Bấm link ở hàng Tính tự động（自動計算） và Thiết lập ẩn mục nhập（入力項目の非表示設定）. 3. Sửa một giá trị ở hàng khác, lưu. | Oracle/bằng chứng: Cột thẳng hàng, link mở đúng màn của đúng mục, lưu các hàng khác như baseline.; ghi build, môi trường, variant và reset sau chạy.
- Readiness: READY

- Phần chịu ảnh hưởng: Màn Thiết lập ô nhập（入力欄設定）
- Điều có thể hỏng: Chèn hàng mới giữa Tính tự động（自動計算） và Thiết lập ẩn mục nhập（入力項目の非表示設定） làm lệch cột, hỏng link hoặc lưu sai các hàng khác
- Lý do cần kiểm: Hàng mới được thêm vào bảng cột theo mục
- Nguồn: code hiện tại “Hàng 自動計算 (tính tự động) / 入力項目の非表示設定 (thiết lập ẩn mục nhập)” (`manage/index.php:612-778`); [đặc tả v2](../specification.vi.md) ([R18](../specification.vi.md) «đặc tả RC-001 v2») mục 4.1 “Điểm vào và trạng thái trống”, mục 12.2 “Điểm tích hợp chính”
- Bằng chứng cần chụp: Ảnh màn trước/sau.

**結果（Kết quả）**

**証跡（Bằng chứng）**
