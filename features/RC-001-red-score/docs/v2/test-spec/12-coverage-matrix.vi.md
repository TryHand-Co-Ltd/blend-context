# 12 — Ma trận độ phủ（Coverage Matrix）

Sinh bằng script. Mọi tỷ lệ đều ghi công thức. Đây là độ phủ **thiết kế** (có case), không phải kết quả chạy.

Tổng số test case: **210**.

## 1. Theo category và trạng thái chắc chắn

| Category | CONFIRMED | IMPLEMENTED | PROPOSED | TBD | CONFLICT | Tổng | Priority Cao | Priority TBD |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| A. Functional | 35 | 0 | 1 | 1 | 0 | 37 | 21 | 16 |
| B. Validation | 15 | 2 | 8 | 0 | 0 | 25 | 3 | 22 |
| C. Business Rules | 41 | 0 | 0 | 0 | 0 | 41 | 38 | 3 |
| D. Calculation | 29 | 0 | 1 | 2 | 0 | 32 | 25 | 7 |
| E. UI/Visual | 7 | 1 | 16 | 0 | 2 | 26 | 1 | 25 |
| F. State/Error | 15 | 0 | 0 | 4 | 0 | 19 | 12 | 7 |
| G. Data/Persistence | 9 | 0 | 4 | 0 | 0 | 13 | 2 | 11 |
| H. Regression | 17 | 0 | 0 | 0 | 0 | 17 | 6 | 11 |
| **Tổng** | 168 | 3 | 30 | 7 | 2 | 210 | 108 | 102 |

Case có kỳ vọng chắc chắn (CONFIRMED + IMPLEMENTED): 171/210. Công thức: số case có Status CONFIRMED hoặc IMPLEMENTED ÷ tổng số case.

## 2. Độ phủ yêu cầu

Công thức: **số tiêu chí (hoặc mục đặc tả) có ít nhất 1 test case ÷ tổng số tiêu chí (hoặc mục) của nhóm**. Một tiêu chí có case không có nghĩa mọi khía cạnh đã được kiểm; xem nội dung case.

| Nhóm yêu cầu | Có case | Tổng | Tỷ lệ |
| --- | --- | --- | --- |
| Tiêu chí nghiệm thu AC-G01…AC-G40 «tiêu chí nghiệm thu: Quyền thao tác và phạm vi dữ liệu … Phạm vi từng đợt» ([11 §5](11-traceability-matrix.vi.md#ac) «Tiêu chí nghiệm thu（RSD-AC）→ test case») | 40 | 40 | 40/40 = 100.0% |
| Tiêu chí nghiệm thu có ≥1 case CONFIRMED/IMPLEMENTED | 40 | 40 | 40/40 = 100.0% |
| Mục đặc tả v2, chương 1–12 ([11 §1](11-traceability-matrix.vi.md#spec) «Mục đặc tả v2 → test case») | 47 | 49 | 47/49 = 95.9% |
| Mục đặc tả v2 có ≥1 case CONFIRMED/IMPLEMENTED | 47 | 49 | 47/49 = 95.9% |

### 2.1. Theo chương của đặc tả v2

Mục = số mục (N.M) của chương. Test Cases = số case khác nhau trích các mục đó. Covered = số mục có ≥1 case. Missing = Mục − Covered.

| Chương | Mục | Test Cases | Covered | Missing | Mục chưa có case |
| --- | ---: | ---: | ---: | ---: | --- |
| 1. Mục tiêu, phạm vi và quyền sử dụng | 4 | 11 | 3 | 1 | 1.1 |
| 2. Khái niệm và dữ liệu dùng để xét | 4 | 11 | 3 | 1 | 2.1 |
| 3. Bản đồ màn hình và luồng thao tác | 1 | 2 | 1 | 0 | — |
| 4. Danh sách thiết lập và thứ tự ưu tiên | 4 | 24 | 4 | 0 | — |
| 5. Điều kiện áp dụng và nguồn tham chiếu | 6 | 37 | 6 | 0 | — |
| 6. Ngưỡng điểm, công thức và xử lý phần lẻ | 8 | 51 | 8 | 0 | — |
| 7. Quy trình xét và thời điểm cập nhật | 5 | 34 | 5 | 0 | — |
| 8. Trạng thái kết quả và xử lý lỗi | 4 | 26 | 4 | 0 | — |
| 9. Trích xuất thành tích（成績抽出） | 3 | 12 | 3 | 0 | — |
| 10. Công khai thành tích（成績公開） | 3 | 15 | 3 | 0 | — |
| 11. Công cụ phiếu điểm（通知表ツール） và PDF | 3 | 9 | 3 | 0 | — |
| 12. Dữ liệu, tích hợp và bảo toàn chức năng cũ | 4 | 21 | 4 | 0 | — |

### 2.2. Theo nhóm test case

Tiêu chí = số tiêu chí nghiệm thu khác nhau được case của nhóm trích. Test Cases = số case của nhóm. Covered = số tiêu chí trong đó có ≥1 case của nhóm có Status CONFIRMED/IMPLEMENTED (có oracle chắc chắn để chạy). Missing = Tiêu chí − Covered.

| Area | Tiêu chí | Test Cases | Covered | Missing | Notes |
| --- | ---: | ---: | ---: | ---: | --- |
| Functional | 19 | 37 | 19 | 0 | — |
| Validation | 11 | 25 | 11 | 0 | — |
| Business Rules | 19 | 41 | 19 | 0 | — |
| Calculation | 9 | 32 | 9 | 0 | — |
| UI | 6 | 26 | 4 | 2 | Chưa chắc chắn: AC-G26 «Lưu thành công và thông báo an toàn», AC-G29 «Lọc khi trích xuất» |
| Error Handling | 15 | 19 | 12 | 3 | Chưa chắc chắn: AC-G24 «Trigger khi đổi điểm tối đa/đơn vị», AC-G30 «Hiển thị ô trích xuất», AC-G32 «Cấu hình công khai và ẩn điểm» |
| Data | 8 | 13 | 6 | 2 | Chưa chắc chắn: AC-G12 «Đúng phạm vi tham chiếu», AC-G39 «Không dùng lại kết quả cho đối tượng mới» |
| Regression | 9 | 17 | 9 | 0 | — |

Tiêu chí và mục chưa có case: [11 §2](11-traceability-matrix.vi.md#uncovered) «Tiêu chí và mục đặc tả chưa có test case».

## 3. Độ phủ kịch bản

| Scenario | Kịch bản | Số case |
| --- | --- | --- |
| TS-RS-001 | Quản lý danh sách quy tắc đỏ của một mục | 20 |
| TS-RS-002 | Điều kiện áp dụng | 13 |
| TS-RS-003 | Ngưỡng điểm cố định | 14 |
| TS-RS-004 | Ngưỡng tỷ lệ điểm tối đa | 11 |
| TS-RS-005 | Ngưỡng công thức | 26 |
| TS-RS-006 | Chọn quy tắc và phân nhánh | 8 |
| TS-RS-007 | Nguồn trung bình và tỷ lệ nhóm | 21 |
| TS-RS-008 | Điểm được xét | 6 |
| TS-RS-009 | Thời điểm xét và vòng đời kết quả | 21 |
| TS-RS-010 | Trạng thái kết quả và lỗi | 11 |
| TS-RS-011 | Quyền và kiểm tra phía server | 10 |
| TS-RS-012 | Trích xuất thành tích（成績抽出） | 9 |
| TS-RS-013 | Công khai thành tích（成績公開） | 10 |
| TS-RS-014 | Công cụ phiếu điểm（通知表ツール） và PDF | 8 |
| TS-RS-015 | Ba đầu ra dùng chung một kết quả | 4 |
| TS-RS-016 | Dữ liệu và dữ liệu đỏ cũ | 13 |
| TS-RS-017 | Phạm vi phát hành | 2 |
| TS-RS-018 | Hồi quy AutoRating và các luồng hiện có | 9 |
| TS-RS-019 | Luồng đầu–cuối（end-to-end） | 8 |

Case thuộc ít nhất một kịch bản: 210/210 (số case có trong cột Test case của [02](02-test-scenarios.vi.md) «Kịch bản kiểm thử (Test Scenario)» ÷ tổng số case).

## 4. Lớp giá trị trong tính toán

| Lớp giá trị | Test case | Status các case |
| --- | --- | --- |
| Giá trị điển hình | [TC-RS-CALC-001](04-calculation-test-cases.vi.md#tc-rs-calc-001) «Ngưỡng cố định 30: S = 29 / 30 / 31 với `<` và `≤`», [TC-RS-CALC-005](04-calculation-test-cases.vi.md#tc-rs-calc-005) «Tỷ lệ 30% với M=100», [TC-RS-CALC-013](04-calculation-test-cases.vi.md#tc-rs-calc-013) «Công thức một dòng với A=50» | CONFIRMED |
| Nhỏ nhất (S=0, N=0) | [TC-RS-CALC-002](04-calculation-test-cases.vi.md#tc-rs-calc-002) «Điểm 0 với ngưỡng 0 và 30», [TC-RS-CALC-009](04-calculation-test-cases.vi.md#tc-rs-calc-009) «Tỷ lệ biên N=0 và N=100», [TC-RS-VAL-001](03-test-cases.vi.md#tc-rs-val-001) «Điểm cố định: biên −1 / 0 / 100 / 101 với M=100», [TC-RS-VAL-006](03-test-cases.vi.md#tc-rs-val-006) «Tỷ lệ N: biên −1 / 0 / 100 / 101» | CONFIRMED |
| Lớn nhất (N=M, N=100%) | [TC-RS-CALC-009](04-calculation-test-cases.vi.md#tc-rs-calc-009) «Tỷ lệ biên N=0 và N=100», [TC-RS-VAL-001](03-test-cases.vi.md#tc-rs-val-001) «Điểm cố định: biên −1 / 0 / 100 / 101 với M=100», [TC-RS-VAL-006](03-test-cases.vi.md#tc-rs-val-006) «Tỷ lệ N: biên −1 / 0 / 100 / 101» | CONFIRMED |
| Biên ±1 (29/30/31, −1/101) | [TC-RS-CALC-001](04-calculation-test-cases.vi.md#tc-rs-calc-001) «Ngưỡng cố định 30: S = 29 / 30 / 31 với `<` và `≤`», [TC-RS-VAL-001](03-test-cases.vi.md#tc-rs-val-001) «Điểm cố định: biên −1 / 0 / 100 / 101 với M=100», [TC-RS-VAL-006](03-test-cases.vi.md#tc-rs-val-006) «Tỷ lệ N: biên −1 / 0 / 100 / 101» | CONFIRMED |
| Bằng 0 (T=0, A=0, trừ 0) | [TC-RS-CALC-002](04-calculation-test-cases.vi.md#tc-rs-calc-002) «Điểm 0 với ngưỡng 0 và 30», [TC-RS-CALC-018](04-calculation-test-cases.vi.md#tc-rs-calc-018) «Công thức A−0 cho ngưỡng bằng A», [TC-RS-CALC-021](04-calculation-test-cases.vi.md#tc-rs-calc-021) «Chia 0 phát sinh khi chạy → Chưa xét được», [TC-RS-CALC-030](04-calculation-test-cases.vi.md#tc-rs-calc-030) «Công thức cho T=0» | CONFIRMED |
| Trống / null | [TC-RS-BR-014](03-test-cases.vi.md#tc-rs-br-014) «Ô trống không bị coi là 0 (trạng thái Không có điểm)», [TC-RS-CALC-030](04-calculation-test-cases.vi.md#tc-rs-calc-030) «Công thức cho T=0», [TC-RS-VAL-004](03-test-cases.vi.md#tc-rs-val-004) «Ngưỡng cố định/tỷ lệ trống hoặc không phải số», [TC-RS-VAL-010](03-test-cases.vi.md#tc-rs-val-010) «Toán hạng trống hoặc không phải số» | CONFIRMED |
| Số thập phân | [TC-RS-CALC-003](04-calculation-test-cases.vi.md#tc-rs-calc-003) «Điểm thập phân sát ngưỡng», [TC-RS-CALC-006](04-calculation-test-cases.vi.md#tc-rs-calc-006) «Tỷ lệ cho ngưỡng lẻ: M=45, N=30 → T=13.5», [TC-RS-CALC-008](04-calculation-test-cases.vi.md#tc-rs-calc-008) «Ví dụ đặc tả v2: M=75, N=30, S=22.2», [TC-RS-VAL-005](03-test-cases.vi.md#tc-rs-val-005) «Điểm cố định thập phân» | CONFIRMED, PROPOSED |
| Làm tròn | [TC-RS-CALC-007](04-calculation-test-cases.vi.md#tc-rs-calc-007) «Tỷ lệ có xử lý phần lẻ: xuống / gần nhất / lên tại p1», [TC-RS-CALC-014](04-calculation-test-cases.vi.md#tc-rs-calc-014) «Làm tròn theo từng dòng: A=49.7», [TC-RS-CALC-019](04-calculation-test-cases.vi.md#tc-rs-calc-019) «Định nghĩa phương thức làm tròn, số âm và p=9», [TC-RS-CALC-020](04-calculation-test-cases.vi.md#tc-rs-calc-020) «Làm tròn ngưỡng, không làm tròn điểm học sinh» | CONFIRMED, PROPOSED |
| Số âm | [TC-RS-CALC-016](04-calculation-test-cases.vi.md#tc-rs-calc-016) «Ngưỡng âm: A=15, A−20 → T=−5», [TC-RS-CALC-019](04-calculation-test-cases.vi.md#tc-rs-calc-019) «Định nghĩa phương thức làm tròn, số âm và p=9», [TC-RS-VAL-001](03-test-cases.vi.md#tc-rs-val-001) «Điểm cố định: biên −1 / 0 / 100 / 101 với M=100», [TC-RS-VAL-006](03-test-cases.vi.md#tc-rs-val-006) «Tỷ lệ N: biên −1 / 0 / 100 / 101» | CONFIRMED, PROPOSED |
| M không hợp lệ | [TC-RS-CALC-010](04-calculation-test-cases.vi.md#tc-rs-calc-010) «Tỷ lệ với M = 0, M < 0 hoặc không xác định → Chưa xét được» | CONFIRMED |
| Chia 0 | [TC-RS-CALC-021](04-calculation-test-cases.vi.md#tc-rs-calc-021) «Chia 0 phát sinh khi chạy → Chưa xét được», [TC-RS-VAL-009](03-test-cases.vi.md#tc-rs-val-009) «Chia cho số cố định 0 không lưu được» | CONFIRMED |
| Sai số dấu phẩy động | [TC-RS-CALC-028](04-calculation-test-cases.vi.md#tc-rs-calc-028) «Không sai kết quả do sai số dấu phẩy động» | CONFIRMED |
| Tràn số | [TC-RS-CALC-029](04-calculation-test-cases.vi.md#tc-rs-calc-029) «Tràn số không tạo kết luận đỏ/không đỏ» | CONFIRMED |
| Giá trị trước/sau làm tròn ở biên nhánh | [TC-RS-CALC-022](04-calculation-test-cases.vi.md#tc-rs-calc-022) «Phân nhánh theo trung bình: A = 40 / 50 / 49.99…», [TC-RS-CALC-023](04-calculation-test-cases.vi.md#tc-rs-calc-023) «Biên nhánh A=60.00 và A=59.96», [TC-RS-CALC-025](04-calculation-test-cases.vi.md#tc-rs-calc-025) «Tỷ lệ nhóm 64.99% (hiển thị 65.0) không khớp ≥ 65%» | CONFIRMED, TBD |

## 5. Theo file

| File | Số case |
| --- | --- |
| [03-test-cases.vi.md](03-test-cases.vi.md) | 116 |
| [04-calculation-test-cases.vi.md](04-calculation-test-cases.vi.md) | 32 |
| [05-ui-test-cases.vi.md](05-ui-test-cases.vi.md) | 26 |
| [06-error-and-edge-case-test-cases.vi.md](06-error-and-edge-case-test-cases.vi.md) | 19 |
| [07-regression-test-cases.vi.md](07-regression-test-cases.vi.md) | 17 |
