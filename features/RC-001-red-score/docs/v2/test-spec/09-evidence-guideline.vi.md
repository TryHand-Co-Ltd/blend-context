# 09 — Hướng dẫn thu thập bằng chứng

Áp dụng cho mọi lần chạy test case trong bộ này. Mục tiêu: người review xác nhận được PASS/FAIL chỉ từ bằng chứng, mà bằng chứng không chứa bí mật hay dữ liệu cá nhân thật.

## 1. Quy tắc bắt buộc

1. **Không ghi bí mật:** không chụp hoặc dán mật khẩu, token, cookie phiên, header `Authorization`, khóa SSH, chuỗi kết nối DB. Tài khoản test được cấp riêng qua kênh team cho phép; trong bằng chứng chỉ ghi vai trò (ví dụ `TD-ROLE-03`), không ghi mật khẩu.
2. **Che dữ liệu cá nhân:** chỉ dùng dữ liệu test ([08](08-test-data.vi.md) «Đặc tả dữ liệu test»). Nếu buộc phải chạy trên dữ liệu có tên học sinh thật, che tên, mã học sinh, email trước khi lưu. Không đưa dữ liệu staging ra ngoài phạm vi team.
3. **Không sửa bằng chứng:** chỉ được che (mask); không cắt bỏ phần cho thấy lỗi.
4. **Đúng loại bằng chứng:** case yêu cầu file Excel/PDF thực thì phải đính kèm file, ảnh HTML không thay được (R18 «đặc tả RC-001 v2» §9.3 «Xuất file», §11.3 «Lưu và xuất»). Case học sinh phải lấy từ màn học sinh, không dùng màn hồ sơ giáo viên (R18 §10.3 «Quyền, thời điểm và đầu ra liên quan»).
5. **Không ghi PASS/FAIL trước khi chạy.** Trạng thái ban đầu của mọi case là NOT RUN.

## 2. Loại bằng chứng

| Loại | Khi nào | Cách lấy | Lưu ý |
| --- | --- | --- | --- |
| Ảnh màn hình | Case UI, kết quả đầu ra trên màn | Chụp cả thanh URL (che tham số nhạy cảm nếu có) và vùng liên quan | Tên file theo mục 3 |
| File Excel | Trích xuất thành tích（成績抽出） | Tải file thực từ nút xuất | Mở kiểm ký hiệu, màu nền, ô rỗng, số liệu |
| File PDF | Phiếu điểm, PDF công khai | Tải file thực | Kiểm tràn ô, mất ký tự |
| Phản hồi API/request | Case quyền, giả mạo, dữ liệu client | Copy request/response từ DevTools | Xóa cookie, token, header xác thực trước khi lưu |
| Kết quả SELECT | Case DATA, xác nhận điểm/kết quả lưu | Chạy SELECT/SHOW trên DB local (TD-ENV-03 «Truy cập DB: Kết nối MySQL local, chỉ dùng SELECT / SHOW FULL COLUMNS…») | Chỉ đọc; ghi câu SELECT và kết quả; không ghi thông tin kết nối |
| Log job/truy vấn | Batch, xếp hàng, N+1 | Log ứng dụng hoặc log truy vấn của môi trường local | Chỉ trích đoạn liên quan |
| Baseline | Case REG và case so sánh trước/sau | Lấy trước khi tạo quy tắc đỏ hoặc trên build cũ | Ghi rõ build/commit và thời điểm |

## 3. Bằng chứng theo loại test

Chỉ lấy những gì case yêu cầu ở dòng Bằng chứng cần chụp (mục 補足（Bổ sung） của case; cột Evidence Required của bảng chạy); danh sách dưới là mức tối thiểu cho từng loại.

| Loại test | Cần lấy |
| --- | --- |
| UI（E） | Ảnh toàn màn; ảnh vùng/trạng thái liên quan; trước và sau thao tác nếu case so sánh |
| Tính toán（D） | Giá trị đầu vào (S, M, A/R, N, dấu, cách làm tròn); nguồn đầu vào (bản chốt/mới nhất, dummy hay thật); ngưỡng kỳ vọng và cách tính; kết quả thực tế; ảnh hoặc file xuất |
| API/request（F quyền, giả mạo） | Request (method, URL, payload) đã che bí mật; response; HTTP status; phần payload liên quan |
| Lỗi/trạng thái（F） | Điều kiện gây lỗi; thông báo hiển thị; trạng thái sau lỗi (điểm, kết quả); cách khôi phục và kết quả sau khi chạy lại |
| Dữ liệu（G） | Câu SELECT và kết quả trước/sau (khi có schema) |
| Hồi quy（H） | Baseline và kết quả sau cùng dữ liệu; chỉ ra điểm khác nếu có |
| Đầu ra（A, C） | File Excel/PDF thực hoặc ảnh màn học sinh, tùy đầu ra case yêu cầu |

## 4. Đặt tên và lưu trữ

- Tên file: `<Test Case ID>_<Run ID>_<bước>_<mô tả ngắn>.<ext>`, ví dụ `TC-RS-FUNC-025_R01_s3_excel.xlsx`.
- Run ID: `R01`, `R02`… theo từng vòng chạy; ghi ở bảng chạy (mục 6).
- Nơi lưu: **TBD** — dùng kho lưu trữ team cho phép (chưa có nguồn quy định). Không commit bằng chứng vào repository ứng dụng.
- Cột Evidence Link chỉ chứa đường dẫn tới kho đó; không nhúng ảnh có dữ liệu thật vào tài liệu này.

## 5. Ghi kết quả

| Status | Dùng khi |
| --- | --- |
| NOT RUN | Chưa chạy (mặc định) |
| PASS | Kết quả thực tế khớp toàn bộ 期待結果（Kết quả mong đợi） phần CONFIRMED/IMPLEMENTED |
| FAIL | Có ít nhất một điểm lệch với phần CONFIRMED/IMPLEMENTED; phải có Bug ID |
| BLOCKED | Không chạy được vì thiếu môi trường, dữ liệu hoặc cách giả lập |
| SKIPPED | Case ngoài phạm vi đợt phát hành (R18 «đặc tả RC-001 v2» §13.1 «Điều kiện triển khai và kiểm chứng») hoặc môi trường không có tính năng liên quan; ghi lý do |

Phần PROPOSED/TBD/CONFLICT trong 期待結果（Kết quả mong đợi）: ghi hành vi thực tế vào Actual Result và Notes, **không** làm case FAIL. Nếu phát hiện lệch ở phần này, ghi vào Notes thay vì mở bug.

Actual Result phải mô tả điều quan sát được (giá trị, dấu, thông báo), không chỉ ghi "OK".

<a id="run-sheet"></a>

## 6. Bảng chạy test

- Bảng chạy gồm Excel theo bố cục báo cáo test（テスト報告） ([test-case-report.xlsx](test-case-report.xlsx), lưu cùng thư mục này), CSV (để nhập Google Sheets) và Excel dạng bảng (hai loại sau không lưu trong repository). Tất cả được team sinh tự động từ các file case 03–07; nếu thiết kế sai, sửa file case gốc rồi sinh lại, không sửa tay file Excel trong repository.
- Cột: Test Case ID, Title, Category, Priority, Status, Requirement ID, Source, Preconditions, Test Data, Steps, Expected Result, Evidence Required, Actual Result, Evidence Link, Bug ID, Tester, Executed At, Notes.
- Status mặc định NOT RUN. Mức chắc chắn (CONFIRMED/PROPOSED/…) nằm ở đầu Notes dạng `[Certainty: X]`. Với case REG, Notes có thêm Affected Area/Risk/Reason.
- Khi chạy: điền Status, Actual Result, Evidence Link, Bug ID, Tester, Executed At (định dạng `YYYY-MM-DD HH:MM` kèm múi giờ, ví dụ `+09:00`). Không sửa các cột thiết kế.
- Tester ghi tên hoặc mã người chạy, không ghi thông tin đăng nhập.
- Bản Excel theo bố cục báo cáo test: mỗi nhóm A–H một sheet; mỗi case gồm tiêu đề, dòng Priority ｜ Status ｜ Requirement ID, 前提条件（Điều kiện trước）, 操作（Thao tác）, 期待結果（Kết quả mong đợi）, 補足（Bổ sung）, 結果（Kết quả）, 証跡（Bằng chứng）. 結果 và 証跡 để trống; khi chạy, sao file ra bản của vòng chạy (không ghi kết quả vào bản trong repository), ghi Status (mục 5) và kết quả quan sát được vào 結果, dán ảnh đã che theo mục 1 vào 証跡. Bản có kết quả lưu ở nơi lưu bằng chứng (mục 4, **TBD**).
