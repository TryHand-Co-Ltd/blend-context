# 00 — Tổng quan bộ đặc tả kiểm thử: Thiết lập điểm đỏ（赤点条件設定）

Bộ đặc tả kiểm thử cho tính năng điểm đỏ（赤点, Phân tích / Đánh giá tương đối）. Viết từ [đặc tả v2](../specification.vi.md), [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md), [thiết kế DB v2](../database-design.vi.md), [chia công việc v2](../split-tasks.vi.md), [CONTEXT RC-001](../../../CONTEXT.md), [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md), Figma (chỉ đọc) và code hiện có (đọc tĩnh), theo commit `bbcd99b` của repo này. **Chưa có test nào được chạy**; tính năng mới chưa được triển khai tại thời điểm viết.

## 1. Phạm vi và nguồn

- **Phạm vi:** thiết kế đầy đủ theo đặc tả v2 (cấu hình quy tắc, ba loại ngưỡng, điều kiện áp dụng, nguồn trung bình/tỷ lệ nhóm, thời điểm xét và vòng đời kết quả, ba đầu ra, quyền, dữ liệu, hồi quy). Phạm vi phát hành từng đợt chưa chốt (đặc tả v2 mục 1.4, 13.1): QA lead đánh dấu case ngoài đợt là SKIPPED theo [01](01-test-strategy.vi.md) «Chiến lược kiểm thử».
- **Thứ tự ưu tiên nguồn:** Q&A đã xác nhận → đặc tả v2 → tiêu chí nghiệm thu v2 → CONTEXT → thiết kế DB v2 / chia công việc v2 → Figma → code (chi tiết ở [01 §2](01-test-strategy.vi.md) «Nguồn làm chuẩn và thứ tự ưu tiên»). Đoạn gắn nhãn "Đề xuất thiết kế", thiết kế DB chưa review và nhãn chỉ có trên Figma được tính là PROPOSED.
- **Mức chắc chắn:** CONFIRMED / IMPLEMENTED / PROPOSED / TBD / CONFLICT. Chỉ phần CONFIRMED/IMPLEMENTED là điều kiện PASS/FAIL.
- **Bảo mật:** tài liệu không chứa mật khẩu, token hay thông tin kết nối. Tài khoản/môi trường chỉ ghi dưới dạng yêu cầu vai trò ([08 §2](08-test-data.vi.md) «Vai trò»).

## 2. Danh sách file

| File | Nội dung |
| --- | --- |
| [01-test-strategy.vi.md](01-test-strategy.vi.md) | Chiến lược, nguồn, quy ước trạng thái, quy tắc ưu tiên, môi trường, rủi ro, quy ước thực thi chung |
| [02-test-scenarios.vi.md](02-test-scenarios.vi.md) | 19 kịch bản kiểm thử và ánh xạ sang case |
| [03-test-cases.vi.md](03-test-cases.vi.md) | Case Functional, Business Rules, Validation, Data |
| [04-calculation-test-cases.vi.md](04-calculation-test-cases.vi.md) | Case tính toán với giá trị cụ thể |
| [05-ui-test-cases.vi.md](05-ui-test-cases.vi.md) | Case UI theo Figma |
| [06-error-and-edge-case-test-cases.vi.md](06-error-and-edge-case-test-cases.vi.md) | Case trạng thái, lỗi, quyền phía server, trường hợp biên |
| [07-regression-test-cases.vi.md](07-regression-test-cases.vi.md) | Case hồi quy có vùng ảnh hưởng, rủi ro, lý do |
| [08-test-data.vi.md](08-test-data.vi.md) | Đặc tả dữ liệu test và phân loại lớp giá trị |
| [09-evidence-guideline.vi.md](09-evidence-guideline.vi.md) | Hướng dẫn thu thập bằng chứng, bảng chạy test |
| [11-traceability-matrix.vi.md](11-traceability-matrix.vi.md) | Mục đặc tả v2 ↔ case; tiêu chí nghiệm thu ↔ case; kịch bản; xung đột và khác biệt |
| [12-coverage-matrix.vi.md](12-coverage-matrix.vi.md) | Độ phủ theo category, tiêu chí, mục đặc tả, kịch bản, lớp giá trị (có công thức) |
| [test-case-report.xlsx](test-case-report.xlsx) | 208 case theo bố cục báo cáo test（テスト報告）, mỗi nhóm A–H một sheet; 結果（Kết quả）/証跡（Bằng chứng） để trống |

11, 12 và `test-case-report.xlsx` được sinh bằng công cụ nội bộ của team từ 02–08. CSV, Excel dạng bảng và mẫu ghi kết quả cũng sinh từ cùng nguồn nhưng không lưu trong repo; xem [09 §6](09-evidence-guideline.vi.md#run-sheet) «Bảng chạy test». Khi sửa case, sửa 02–08 rồi sinh lại 11, 12 và file Excel.

## 3. Số liệu

| Category | Số case |
| --- | ---: |
| A. Functional | 37 |
| B. Validation | 25 |
| C. Business Rules | 40 |
| D. Calculation | 32 |
| E. UI/Visual | 25 |
| F. State/Error | 19 |
| G. Data/Persistence | 13 |
| H. Regression | 17 |
| **Tổng** | **208** |

Theo mức chắc chắn: CONFIRMED 165, IMPLEMENTED 3, PROPOSED 31, TBD 7, CONFLICT 2. Priority: Cao 105, TBD 103 (quy tắc ở [01 §4](01-test-strategy.vi.md) «Ưu tiên»). Độ phủ: 40/40 tiêu chí nghiệm thu có case chắc chắn; 47/49 mục đặc tả v2 (chương 1–12) có case, hai mục chưa có là mục định nghĩa 1.1 "Mục tiêu" và 2.1 "Các đại lượng". Chi tiết: [12](12-coverage-matrix.vi.md) «Ma trận độ phủ（Coverage Matrix）».

<a id="self-review"></a>

## 4. Tự review

- **Đầy đủ:** mọi tiêu chí nghiệm thu có case; mọi quy tắc nghiệp vụ, công thức (cố định, tỷ lệ, công thức, phân nhánh trung bình, tỷ lệ nhóm), biên (±1, bằng nhau, 0/100, trước/sau làm tròn), sáu trạng thái kết quả, lỗi kỹ thuật, batch một phần và rủi ro hồi quy đều có case.
- **Đúng nguồn:** mọi case có dòng Nguồn chỉ tới mục đặc tả v2, tiêu chí nghiệm thu, Q&A đã xác nhận, node Figma hoặc file/hàm code. Phần không có nguồn ghi TBD; quy ước riêng của bộ test (ưu tiên, đặt tên bằng chứng) ghi rõ là quy ước. Ví dụ số được tính lại theo đặc tả v2 và Q&A.
- **Không nhầm mức chắc chắn:** case chưa chắc chắn không có Priority Cao; phần PROPOSED trong case CONFIRMED được tách ở Kết quả mong đợi hoặc Ghi chú.
- **Truy vết:** Requirement ID của mỗi case ghi tiêu chí nghiệm thu v2 (hoặc mục đặc tả v2) bằng lời, mã trong ngoặc; ánh xạ hai chiều ở [11](11-traceability-matrix.vi.md) «Ma trận truy vết（Traceability Matrix）». Bằng chứng: dòng Bằng chứng cần chụp trong case và [09](09-evidence-guideline.vi.md) «Hướng dẫn thu thập bằng chứng».
- **Thuật ngữ:** tên tiếng Nhật kèm nghĩa tiếng Việt ngay bên cạnh.

## 5. Điều cần biết trước khi chạy

- **Chắc chắn:** quy tắc chọn quy tắc/ngưỡng/so sánh, vòng đời kết quả, ba đầu ra dùng chung kết quả, hiển thị ở công khai/phiếu điểm, quyền, nhóm tham chiếu theo thiết lập tổng hợp hiện hữu.
- **Chưa đủ thông tin:** phạm vi phát hành; trung bình cho điểm đơn vị, độ chính xác tỷ lệ nhóm; cơ chế cập nhật đồng thời và schema lưu kết quả (thiết kế DB v2 đề xuất, chưa review, chưa thực thi DDL); một số đường ghi điểm (CSV, liên kết điểm thi, CSV lựa chọn lớp).
- **Xung đột và khác biệt** ([11 §4](11-traceability-matrix.vi.md#conflicts) «Xung đột và khác biệt»): tùy chọn hiển thị đỏ ở Công khai thành tích（成績公開） giữa Figma và Q&A/đặc tả v2; nhãn và vị trí tùy chọn đỏ ở Trích xuất thành tích（成績抽出） giữa các frame Figma; câu thông báo lỗi vượt điểm tối đa/chia 0 giữa file Figma cũ và file hiện hành (đã theo file hiện hành); đặc tả v2 và CONTEXT vẫn dẫn link file Figma cũ (tra frame tương ứng trên file hiện hành theo tên chương/frame). Khác biệt đặc tả–code SI-01…SI-14 «khác biệt spec–code: CSV lựa chọn điểm tối đa của lớp … Phân giải M ở CSV HR» dựa trên đọc code tĩnh, chưa chạy. Case UI còn PROPOSED/CONFLICT: ghi hành vi thực tế, không FAIL.
- **Chuẩn bị:** cách tạo điểm tối đa không hợp lệ/điểm âm, tài khoản học sinh/phụ huynh, giả lập lỗi — hỏi team dev khi chuẩn bị. Nơi lưu bằng chứng: TBD (QA lead chốt).
- Nguồn trung bình đã chốt có thể là dummy data cho tới khi [PR #57058](https://github.com/ednity/school-web/pull/57058) «PR thêm trạng thái xác nhận kết quả tổng hợp xếp hạng, còn mở» được tích hợp (đặc tả v2 mục 5.5); bằng chứng phải ghi rõ.
