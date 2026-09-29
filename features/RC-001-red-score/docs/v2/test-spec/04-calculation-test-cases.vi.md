# 04 — Test case tính toán (CALC)

Vai trò mặc định, nơi xem kết quả xét, bằng chứng mặc định và tra nhanh mã dữ liệu (TD-…): [01 §9](01-test-strategy.vi.md#conventions) «Quy ước thực thi chung».

Mỗi case ghi giá trị đầu vào, phép tính và kết quả mong đợi cụ thể. Quy ước như [03](03-test-cases.vi.md) «Test case chức năng, quy tắc nghiệp vụ, validation và dữ…»: `S` điểm cuối đã lưu, `M` điểm tối đa hiện hành, `A` trung bình trước làm tròn, `R` tỷ lệ nhóm, `N` giá trị nhập, `T` ngưỡng cuối. Dấu `<` = Nhỏ hơn（未満）, `≤` = Nhỏ hơn hoặc bằng（以下）. Mọi case đang **NOT RUN**.

Ký hiệu xử lý phần lẻ（端数処理）: "xuống p1" = Làm tròn xuống（切り捨て） tại chữ số thập phân thứ 1（小数第1位） (kết quả còn số nguyên); "gần nhất p2" = Làm tròn gần nhất（四捨五入） tại chữ số thập phân thứ 2 (còn một chữ số thập phân); "lên" = Làm tròn lên（切り上げ）. Theo R18 «đặc tả RC-001 v2» §6.5 «Xử lý phần lẻ» và code `AutoRating.php::calcDecimalPlace` (:3896–3915): `p` giữ `p−1` chữ số thập phân.

Các case cần trung bình/tỷ lệ nhóm dùng nguồn dummy khi snapshot chưa tích hợp (TD-ENV-04 «Nguồn snapshot: Dummy data cho bản tổng hợp đã chốt (R18 §5.5) cho tới…»); bằng chứng phải ghi "dummy data".

## Bảng tổng hợp

| ID | Nội dung | Status |
| --- | --- | --- |
| [CALC-001](#tc-rs-calc-001) | Cố định, biên `S=T` | CONFIRMED |
| [CALC-002](#tc-rs-calc-002) | `S=0` | CONFIRMED |
| [CALC-003](#tc-rs-calc-003) | Điểm thập phân | CONFIRMED |
| [CALC-004](#tc-rs-calc-004) | Cố định không đổi khi M đổi | CONFIRMED |
| [CALC-005](#tc-rs-calc-005) | Tỷ lệ cơ bản | CONFIRMED |
| [CALC-006](#tc-rs-calc-006) | Tỷ lệ cho ngưỡng lẻ | CONFIRMED |
| [CALC-007](#tc-rs-calc-007) | Tỷ lệ có xử lý phần lẻ | CONFIRMED |
| [CALC-008](#tc-rs-calc-008) | Ví dụ R18 «đặc tả RC-001 v2» `M=75` | CONFIRMED |
| [CALC-009](#tc-rs-calc-009) | Tỷ lệ biên 0/100 | CONFIRMED |
| [CALC-010](#tc-rs-calc-010) | M không hợp lệ | CONFIRMED |
| [CALC-011](#tc-rs-calc-011) | Phân giải M | CONFIRMED |
| [CALC-012](#tc-rs-calc-012) | M hiện hành, không lấy M của bản chốt | CONFIRMED |
| [CALC-013](#tc-rs-calc-013) | Công thức một dòng | CONFIRMED |
| [CALC-014](#tc-rs-calc-014) | Làm tròn theo từng dòng | PROPOSED |
| [CALC-015](#tc-rs-calc-015) | Công thức hai dòng Figma | PROPOSED |
| [CALC-016](#tc-rs-calc-016) | Ngưỡng âm | CONFIRMED |
| [CALC-017](#tc-rs-calc-017) | Ngưỡng công thức vượt M | CONFIRMED |
| [CALC-018](#tc-rs-calc-018) | `A−0` | CONFIRMED |
| [CALC-019](#tc-rs-calc-019) | Định nghĩa làm tròn, số âm, `p=9` | PROPOSED |
| [CALC-020](#tc-rs-calc-020) | Làm tròn `T`, không làm tròn `S` | CONFIRMED |
| [CALC-021](#tc-rs-calc-021) | Chia 0 khi chạy | CONFIRMED |
| [CALC-022](#tc-rs-calc-022) | Phân nhánh theo `A` trước làm tròn | CONFIRMED |
| [CALC-023](#tc-rs-calc-023) | Biên `A=60` / `59.96` | CONFIRMED |
| [CALC-024](#tc-rs-calc-024) | Tỷ lệ nhóm `R=70%` | CONFIRMED |
| [CALC-025](#tc-rs-calc-025) | Độ chính xác `R` 64.99 | TBD |
| [CALC-026](#tc-rs-calc-026) | Mẫu số trung bình | TBD |
| [CALC-027](#tc-rs-calc-027) | Trung bình theo đơn vị | TBD |
| [CALC-028](#tc-rs-calc-028) | Sai số dấu phẩy động | CONFIRMED |
| [CALC-029](#tc-rs-calc-029) | Tràn số | CONFIRMED |
| [CALC-030](#tc-rs-calc-030) | `T=0` từ công thức, ô trống | CONFIRMED |
| [CALC-031](#tc-rs-calc-031) | Mẫu số nguồn bằng 0 | CONFIRMED |

<a id="tc-rs-calc-001"></a>

### TC-RS-CALC-001 — Ngưỡng cố định 30: S = 29 / 30 / 31 với `<` và `≤`

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Biên so sánh và cảnh báo” (AC-G07)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-01, TD-RULE-02, TD-STU-01, TD-STU-02, TD-STU-03 -->

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

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Điểm bằng ngưỡng có bị xét đỏ không?” (Q4); [đặc tả v2](../specification.vi.md) (R18) mục 6.1 “Thành phần chung của màn ngưỡng” (bảng `S=30`, `T=30`), mục 6.2 “Ngưỡng cố định”
- Bằng chứng cần chụp: Ảnh kết quả hai bước.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-002"></a>

### TC-RS-CALC-002 — Điểm 0 với ngưỡng 0 và 30

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Biên so sánh và cảnh báo” (AC-G07)

<!-- Mã truy vết: TD-ITEM-01, TD-STU-04 -->

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

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 2.3 “Điểm được đưa vào xét” ("`0` hợp lệ là số"), mục 6.1 “Thành phần chung của màn ngưỡng”, mục 6.6 “Ngưỡng âm và cảnh báo biên”
- Bằng chứng cần chụp: Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](01-test-strategy.vi.md#conventions) mục 9 “Quy ước thực thi chung”） dòng S04 sau mỗi cấu hình (3 ảnh).
- Ghi chú: Cảnh báo `T=0` (VAL-019).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-003"></a>

### TC-RS-CALC-003 — Điểm thập phân sát ngưỡng

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11)

<!-- Mã truy vết: TD-ITEM-02 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số thập phân (M=100) (thập phân, M=100); cố định 30.
- Dữ liệu test: mục số thập phân (M=100); S = 29.5, 29.9, 30.0, 30.01

**操作（Thao tác）**

Đăng ký bốn học sinh với các điểm trên; xét với `<` rồi `≤`.

**期待結果（Kết quả mong đợi）**

`<`: 29.5 Đỏ; 29.9 Đỏ; 30.0 Không đỏ; 30.01 Không đỏ.

`≤`: 29.5 Đỏ; 29.9 Đỏ; 30.0 Đỏ; 30.01 Không đỏ.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.1 “Thành phần chung của màn ngưỡng”, mục 6.8 “Yêu cầu độ chính xác” ("phép so sánh đúng tại `S=T`")
- Bằng chứng cần chụp: Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](01-test-strategy.vi.md#conventions) mục 9 “Quy ước thực thi chung”） bốn học sinh với `<` và với `≤` (2 ảnh).
- Ghi chú: Số chữ số thập phân nhập được theo cấu hình mục hiện hành.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-004"></a>

### TC-RS-CALC-004 — Ngưỡng cố định giữ `T=N` khi M đổi về sau

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Điểm cố định” (AC-G08)

<!-- Mã truy vết: TD-RULE-01, TD-ITEM-01 -->

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

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Điểm bằng ngưỡng có bị xét đỏ không?” (Q4), câu “Thay điểm tối đa thì xử lý thế nào?” (Q14); [đặc tả v2](../specification.vi.md) (R18) mục 6.2 “Ngưỡng cố định” (đoạn cuối)
- Bằng chứng cần chụp: Ảnh kết quả, ảnh quy tắc.
- Sau khi chạy: Trả M về 100.
- Ghi chú: Nếu mở quy tắc và bấm Lưu lại, kiểm tra `0≤N≤M` sẽ chặn (VAL-003).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-005"></a>

### TC-RS-CALC-005 — Tỷ lệ 30% với M=100

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Tỷ lệ điểm tối đa” (AC-G10)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-03, TD-STU-01, TD-STU-02, TD-STU-03 -->

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

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Những loại điểm nào thuộc đối tượng?” (Q2), câu “Khi xét tỷ lệ điểm, dùng điểm tối đa nào?” (Q23); [đặc tả v2](../specification.vi.md) (R18) mục 6.3 “Tỷ lệ điểm tối đa”
- Bằng chứng cần chụp: Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](01-test-strategy.vi.md#conventions) mục 9 “Quy ước thực thi chung”） ba học sinh với `<` và với `≤` (2 ảnh).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-006"></a>

### TC-RS-CALC-006 — Tỷ lệ cho ngưỡng lẻ: M=45, N=30 → T=13.5

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Tỷ lệ điểm tối đa” (AC-G10)

<!-- Mã truy vết: TD-ITEM-02, TD-RULE-03 -->

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

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.3 “Tỷ lệ điểm tối đa” (`T_thô = M × N / 100`); [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Tỷ lệ điểm tối đa có cho chọn xử lý phần lẻ không?” (Q24) (mặc định không xử lý)
- Bằng chứng cần chụp: Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](01-test-strategy.vi.md#conventions) mục 9 “Quy ước thực thi chung”） ba học sinh với `<` và với `≤` (2 ảnh).
- Sau khi chạy: Trả M về 100.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-007"></a>

### TC-RS-CALC-007 — Tỷ lệ có xử lý phần lẻ: xuống / gần nhất / lên tại p1

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Tỷ lệ điểm tối đa” (AC-G10)

<!-- Mã truy vết: TD-ITEM-02 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số thập phân (M=100); tỷ lệ 30%, dấu `<`.
- Dữ liệu test: mục số thập phân (M=100); (a) M=45 → `T_thô=13.5`, S=13; (b) M=47 → `T_thô=14.1`, S=14

**操作（Thao tác）**

Với (a) và (b): xét với Không xử lý（しない）, xuống p1, gần nhất p1, lên p1.

**期待結果（Kết quả mong đợi）**

(a) Không xử lý `T=13.5` → Đỏ; xuống `T=13` → Không đỏ; gần nhất `T=14` → Đỏ; lên `T=14` → Đỏ.

(b) Không xử lý `T=14.1` → Đỏ; xuống `T=14` → Không đỏ; gần nhất `T=14` → Không đỏ; lên `T=15` → Đỏ.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Tỷ lệ điểm tối đa có cho chọn xử lý phần lẻ không?” (Q24) (chọn vị trí và phương thức như Thiết lập tính toán tự động（自動計算設定）); [đặc tả v2](../specification.vi.md) (R18) mục 6.3 “Tỷ lệ điểm tối đa”, mục 6.5 “Xử lý phần lẻ”; CODE `AutoRating.php::calcDecimalPlace` :3896–3915
- Bằng chứng cần chụp: Ảnh cấu hình và kết quả từng biến thể.
- Sau khi chạy: Trả M về 100.
- Ghi chú: Giới hạn `p` và giá trị mặc định khi bật: VAL-007 (PROPOSED).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-008"></a>

### TC-RS-CALC-008 — Ví dụ đặc tả v2: M=75, N=30, S=22.2

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Tỷ lệ điểm tối đa” (AC-G10)

<!-- Mã truy vết: TD-ITEM-02 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số thập phân (M=100) với M=75; tỷ lệ 30%, `<`.
- Dữ liệu test: mục số thập phân (M=100); S = 22.2

**操作（Thao tác）**

Xét với Không xử lý, rồi xuống p1.

**期待結果（Kết quả mong đợi）**

Không xử lý: `T=22.5` → Đỏ.

Xuống p1: `T=22` → Không đỏ.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.3 “Tỷ lệ điểm tối đa” (ví dụ `M=75`, `N=30`)
- Bằng chứng cần chụp: Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](01-test-strategy.vi.md#conventions) mục 9 “Quy ước thực thi chung”） ô S=22.2 sau mỗi cấu hình (2 ảnh).
- Sau khi chạy: Trả M về 100.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-009"></a>

### TC-RS-CALC-009 — Tỷ lệ biên N=0 và N=100

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Tỷ lệ điểm tối đa” (AC-G10)

<!-- Mã truy vết: TD-ITEM-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số nguyên (M=100) (M=100).
- Dữ liệu test: mục số nguyên (M=100); N = 0: S = 0; N = 100: S = 99, 100

**操作（Thao tác）**

Xét từng cấu hình với `<` và `≤`.

**期待結果（Kết quả mong đợi）**

N=0 (`T=0`): S=0 `<` Không đỏ; `≤` Đỏ.

N=100 (`T=100`): S=99 `<` Đỏ; S=100 `<` Không đỏ; S=100 `≤` Đỏ.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.3 “Tỷ lệ điểm tối đa” ("kể cả hai biên"), mục 6.6 “Ngưỡng âm và cảnh báo biên”
- Bằng chứng cần chụp: Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](01-test-strategy.vi.md#conventions) mục 9 “Quy ước thực thi chung”） sau mỗi cấu hình N và dấu so sánh.
- Ghi chú: Cảnh báo biên: VAL-019.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-010"></a>

### TC-RS-CALC-010 — Tỷ lệ với M = 0, M < 0 hoặc không xác định → Chưa xét được; cố định vẫn xét

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Tỷ lệ điểm tối đa” (AC-G10)

<!-- Mã truy vết: TD-ITEM-08, TD-RULE-03, TD-RULE-01 -->

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

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.2 “Ngưỡng cố định” (đoạn cuối), mục 6.3 “Tỷ lệ điểm tối đa” ("`M=0`, `M<0`… không thay bằng 100"), mục 8.3 “Không tạo được ngưỡng hợp lệ”
- Bằng chứng cần chụp: Ảnh kết quả. SELECT `reason_code` (khi có schema; đề xuất `maximum_invalid` — thiết kế DB v2 mục 4.3 “Trạng thái kết quả”, PROPOSED).
- Ghi chú: Cách tạo dữ liệu M không hợp lệ: hỏi team dev khi chuẩn bị.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-011"></a>

### TC-RS-CALC-011 — Phân giải M: mặc định → đơn vị → lựa chọn lớp

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Điểm tối đa hiện hành” (AC-G09)

<!-- Mã truy vết: TD-ITEM-03, AC-G09, SI-02, SI-14 -->

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

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 2.4 “Phân giải điểm tối đa” (ví dụ 100 → 40 → 50); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Điểm tối đa hiện hành” (AC-G09) ("Không thay bằng … điểm cao nhất thực tế, tổng điểm tối đa nhóm"); [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Khi xét tỷ lệ điểm, dùng điểm tối đa nào?” (Q23); code hiện tại “Phân giải điểm tối đa hiện hành không thống nhất giữa các đường…”; khác biệt đặc tả–code về “Phân giải M” (SI-02), khác biệt đặc tả–code về “Phân giải M ở CSV HR (đường ghi điểm HR成績CSV一括登録 (đăng ký điểm hàng loạt bằng CSV))” (SI-14)
- Bằng chứng cần chụp: Ảnh cấu hình M; ảnh kết quả.
- Ghi chú: Mã lựa chọn `1`/`2` không phải M=1/2 (đặc tả v2 mục 2.4 “Phân giải điểm tối đa”). Không dùng điểm cao nhất thực tế hoặc 100 thay cho M cá nhân.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-012"></a>

### TC-RS-CALC-012 — Tỷ lệ dùng M hiện hành, không dùng M của bản tổng hợp đã chốt

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Điểm tối đa hiện hành” (AC-G09)

<!-- Mã truy vết: TD-ITEM-01, TD-RULE-03, TD-SRC-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Có bản chốt (dummy) tạo khi M=100. Sau đó M hiện hành của mục số nguyên (M=100) đổi thành 50.
- Dữ liệu test: mục số nguyên (M=100); quy tắc tỷ lệ 30%; S = 20; bản tổng hợp đã chốt (trung bình 49.99)

**操作（Thao tác）**

Đăng ký S=20, xem kết quả.

**期待結果（Kết quả mong đợi）**

`T=50×30/100=15` → `20<15` sai → Không đỏ. (Nếu dùng M=100 của bản chốt: `T=30` → Đỏ — sai.)

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Khi xét tỷ lệ điểm, dùng điểm tối đa nào?” (Q23); [đặc tả v2](../specification.vi.md) (R18) mục 2.4 “Phân giải điểm tối đa” (đoạn cuối), mục 6.3 “Tỷ lệ điểm tối đa” (ví dụ `M=100`→`50`, `S=20`)
- Bằng chứng cần chụp: Ảnh M hiện hành, kết quả.
- Sau khi chạy: Trả M về 100.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-013"></a>

### TC-RS-CALC-013 — Công thức một dòng với A=50

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16)

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

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Ngưỡng dùng trung bình có chỉ gồm hai công thức cố định không?” (Q6); [đặc tả v2](../specification.vi.md) (R18) mục 6.4 “Công thức dùng trung bình” (bảng nhu cầu)
- Bằng chứng cần chụp: Ảnh cấu hình, nguồn (dummy), kết quả.
- Ghi chú: Phạm vi phát hành công thức chưa chốt (đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-014"></a>

### TC-RS-CALC-014 — Làm tròn theo từng dòng: A=49.7

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16)

<!-- Mã truy vết: AC-G16 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Nguồn `A=49.7`; dòng 1 `A÷2`; dòng 2 `Kết quả dòng 1 × 0.8`; `<`.
- Dữ liệu test: S = 19.5

**操作（Thao tác）**

(a) Dòng 1 xuống p1, dòng 2 không xử lý.

(b) Cả hai dòng không xử lý.

**期待結果（Kết quả mong đợi）**

(a) `24.85→24`; `T=24×0.8=19.2` → Không đỏ.

(b) `T=24.85×0.8=19.88` → Đỏ.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.5 “Xử lý phần lẻ” (ví dụ `A=49.7`); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16) ("Tham chiếu dòng trước nhận giá trị sau phần lẻ"; ví dụ `A=49.7` → 19.2 / 19.88)
- Bằng chứng cần chụp: Ảnh cấu hình, kết quả.
- Ghi chú: Là ví dụ của tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ”. Chỉ chạy khi công thức nhiều dòng thuộc đợt phát hành (phạm vi phát hành chưa chốt — đặc tả v2 mục 13.1); ngoài đợt thì SKIPPED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-015"></a>

### TC-RS-CALC-015 — Công thức hai dòng theo Figma: (A÷2)×0.8, xuống p1 ở dòng 2

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16)

<!-- Mã truy vết: TD-RULE-06, AC-G16 -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8); nguồn `A=61`.
- Dữ liệu test: quy tắc công thức hai dòng (trung bình ÷ 2 × 0.8); S = 23.9, 24

**操作（Thao tác）**

Chạy nút cam; xét với `<` rồi `≤`.

**期待結果（Kết quả mong đợi）**

Dòng 1 `61÷2=30.5`; dòng 2 `30.5×0.8=24.4` → xuống p1 → `T=24`.

`<`: 23.9 Đỏ; 24 Không đỏ. `≤`: 24 Đỏ.

**補足（Bổ sung）**

- Nguồn: Figma MW “màn Ngưỡng – công thức” (58:8389) (UI 04C, công thức hai dòng); [đặc tả v2](../specification.vi.md) (R18) mục 6.4 “Công thức dùng trung bình”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16) ("Tham chiếu dòng trước nhận giá trị sau phần lẻ, dòng cuối tạo `T`")
- Bằng chứng cần chụp: Ảnh cấu hình, kết quả.
- Ghi chú: Tham chiếu dòng trước là tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ”; danh sách toán hạng đầy đủ vẫn theo phạm vi đợt (đề xuất thiết kế chờ review — đặc tả v2 mục 13.1). Chỉ chạy khi công thức nhiều dòng thuộc đợt phát hành (phạm vi phát hành chưa chốt — đặc tả v2 mục 13.1); ngoài đợt thì SKIPPED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-016"></a>

### TC-RS-CALC-016 — Ngưỡng âm: A=15, A−20 → T=−5

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Ngưỡng âm” (AC-G18)

<!-- Mã truy vết: TD-RULE-10, TD-ITEM-09 -->

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

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Công thức cho ngưỡng âm thì xử lý thế nào?” (Q25); [đặc tả v2](../specification.vi.md) (R18) mục 6.6 “Ngưỡng âm và cảnh báo biên”
- Bằng chứng cần chụp: Ảnh nguồn `A=15`; Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](01-test-strategy.vi.md#conventions) mục 9 “Quy ước thực thi chung”） các ô (a), (b) với `<` và với `≤`.
- Ghi chú: (b) phụ thuộc cách tạo dữ liệu đặc biệt (hỏi team dev khi chuẩn bị).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-017"></a>

### TC-RS-CALC-017 — Ngưỡng công thức vượt M vẫn hợp lệ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16)

<!-- Mã truy vết: TD-ITEM-01 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Nguồn `A=80`; công thức `A×1.5`; mục số nguyên (M=100) (M=100).
- Dữ liệu test: mục số nguyên (M=100); S = 100

**操作（Thao tác）**

Chạy nút cam; xem kết quả.

**期待結果（Kết quả mong đợi）**

`T=120`; `100<120` → Đỏ. Không bị Chưa xét được, không ép `T` về 100.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.6 “Ngưỡng âm và cảnh báo biên” (đoạn cuối: "ngưỡng công thức vượt maximum không tự trở thành lỗi")
- Bằng chứng cần chụp: Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](01-test-strategy.vi.md#conventions) mục 9 “Quy ước thực thi chung”） ô S=100; ảnh SELECT `judgment_context` có ngưỡng 120 (khi có schema).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-018"></a>

### TC-RS-CALC-018 — Công thức A−0 cho ngưỡng bằng A

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Biên so sánh và cảnh báo” (AC-G07)

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

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.6 “Ngưỡng âm và cảnh báo biên” (bảng cảnh báo: "Công thức `A−0`: ngưỡng là `A`, không phải 0")
- Bằng chứng cần chụp: Ảnh cảnh báo, kết quả.
- Ghi chú: Câu chữ cảnh báo: chưa chốt.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-019"></a>

### TC-RS-CALC-019 — Định nghĩa phương thức làm tròn, số âm và p=9

Priority: TBD ｜ Status: PROPOSED ｜ Requirement ID: tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16)

<!-- Mã truy vết: TD-ENV-04, TC-RS-DATA-008, TD-ITEM-09 -->

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

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.5 “Xử lý phần lẻ” (bảng ví dụ, định nghĩa gần nhất = nửa đơn vị ra xa 0, lên = `ceil`, xuống = `floor`); CODE `AutoRating.php::calcDecimalPlace` :3896–3915
- Bằng chứng cần chụp: Bảng thực tế đối chiếu từng dòng.
- Ghi chú: PROPOSED. 2.675 kiểm việc tránh sai số nhị phân (đặc tả v2 mục 6.8 “Yêu cầu độ chính xác”). Giá trị âm cần mục cho phép điểm âm nếu kiểm qua kết quả xét.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-020"></a>

### TC-RS-CALC-020 — Làm tròn ngưỡng, không làm tròn điểm học sinh

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Công thức theo dòng và phần lẻ” (AC-G16)

<!-- Mã truy vết: TD-ITEM-02 -->

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

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Tỷ lệ điểm tối đa có cho chọn xử lý phần lẻ không?” (Q24) ("Không cắt/làm tròn điểm của học sinh thay cho ngưỡng"); [đặc tả v2](../specification.vi.md) (R18) mục 6.5 “Xử lý phần lẻ” (đoạn cuối)
- Bằng chứng cần chụp: Ảnh kết quả, điểm.
- Sau khi chạy: Trả M về 100.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-021"></a>

### TC-RS-CALC-021 — Chia 0 phát sinh khi chạy → Chưa xét được

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 6.4 “Công thức dùng trung bình”, mục 8.3 “Không tạo được ngưỡng hợp lệ”

<!-- Mã truy vết: TD-RULE-11, TD-ITEM-02, TD-SRC-08 -->

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

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.4 “Công thức dùng trung bình” (đoạn cuối), mục 8.3 “Không tạo được ngưỡng hợp lệ”; CODE `AutoRating.php::getformulas` :2834–2837 (trả NULL khi chia 0)
- Bằng chứng cần chụp: Ảnh kết quả. SELECT `reason_code` (khi có schema; đề xuất `division_by_zero` — thiết kế DB v2 mục 4.3 “Trạng thái kết quả”, PROPOSED).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-022"></a>

### TC-RS-CALC-022 — Phân nhánh theo trung bình: A = 40 / 50 / 49.99 (dùng A trước làm tròn)

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14)

<!-- Mã truy vết: TD-ITEM-02, TD-SRC-01 -->

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

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Trung bình dùng để chọn nhánh là trước hay sau làm tròn?” (Q8); [đặc tả v2](../specification.vi.md) (R18) mục 5.2 “Điều kiện dựa trên trung bình” ("49.99 phải đi vào nhánh `<50`")
- Bằng chứng cần chụp: Ảnh nguồn (dummy), kết quả.
- Ghi chú: Dạng hai dòng `A×50÷100` (ví dụ trao đổi ban đầu) cần Kết quả phép tính（式の結果） (PROPOSED); kết quả tương đương.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-023"></a>

### TC-RS-CALC-023 — Biên nhánh A=60.00 và A=59.96

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14)

<!-- Mã truy vết: TD-ITEM-02, TD-SRC-10 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Ưu tiên 1: `A≥60` → cố định 25 `<`. Ưu tiên 2: `A<60` → `A×0.5` `<`. mục số thập phân (M=100).
- Dữ liệu test: mục số thập phân (M=100); hai nguồn có trung bình 60 và 59.96 (`A=60.00`; `A=59.96`); S = 27, 29.99

**操作（Thao tác）**

Chạy nút cam với từng nguồn.

**期待結果（Kết quả mong đợi）**

`A=60.00` → ưu tiên 1, `T=25`: 27 Không đỏ.

`A=59.96` → ưu tiên 2, `T=29.98`: 27 Đỏ; 29.99 Không đỏ.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Trung bình dùng để chọn nhánh là trước hay sau làm tròn?” (Q8); [đặc tả v2](../specification.vi.md) (R18) mục 5.2 “Điều kiện dựa trên trung bình”
- Bằng chứng cần chụp: Ảnh nguồn, kết quả.
- Ghi chú: Dấu `≥` có trong ví dụ đặc tả v2 mục 5.2 “Điều kiện dựa trên trung bình”; bộ bốn dấu điều kiện là PROPOSED (đề xuất thiết kế chờ review — đặc tả v2 mục 13.1).

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-024"></a>

### TC-RS-CALC-024 — Tỷ lệ nhóm R = 70% khớp điều kiện ≥ 65%

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Kế thừa tỷ lệ nhóm” (AC-G15)

<!-- Mã truy vết: TD-RULE-09, TD-SRC-05 -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc theo tỷ lệ điểm của nhóm từ 65% là quy tắc duy nhất.
- Dữ liệu test: quy tắc theo tỷ lệ điểm của nhóm từ 65%; (a) nhóm có tỷ lệ điểm 70% (cùng M) (60/100, 80/100); (b) nguồn 50/100, 70/100; S = 60, 70, 80

**操作（Thao tác）**

Chạy nút xanh rồi nút cam cho từng nguồn.

**期待結果（Kết quả mong đợi）**

(a) `R=140/200×100=70%` → khớp; `T=70`: 60 Đỏ; 70 Không đỏ; 80 Không đỏ.

(b) `R=120/200×100=60%` → không khớp → cả ba Không áp dụng.

**補足（Bổ sung）**

- Nguồn: [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Tỷ lệ nhóm có cần xử lý riêng khi các lớp khác điểm tối đa không?” (Q31); [đặc tả v2](../specification.vi.md) (R18) mục 5.3 “Tỷ lệ nhóm” (ví dụ 60/100 và 80/100); Figma MW “màn Điều kiện áp dụng – điều kiện tỷ lệ điểm của nhóm” (58:9164) (UI 03B, 65 % 以上)
- Bằng chứng cần chụp: Ảnh nguồn, kết quả.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-025"></a>

### TC-RS-CALC-025 — Tỷ lệ nhóm 64.99% (hiển thị 65.0) không khớp ≥ 65%

Priority: TBD ｜ Status: TBD ｜ Requirement ID: tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14)

<!-- Mã truy vết: TD-RULE-09 -->

**前提条件（Điều kiện trước）**

- Điều kiện: quy tắc theo tỷ lệ điểm của nhóm từ 65%; mục thập phân.
- Dữ liệu test: quy tắc theo tỷ lệ điểm của nhóm từ 65%; (a) Nguồn 64.98/100 và 65.00/100 → `R=64.99%`; (b) 65/100 và 65/100 → `R=65%`; S = 60

**操作（Thao tác）**

Chạy nút xanh rồi nút cam cho từng nguồn.

**期待結果（Kết quả mong đợi）**

(a) Kỳ vọng theo đặc tả v2: không khớp → Không áp dụng. Nếu nguồn chỉ cung cấp giá trị đã làm tròn: ghi nhận khoảng trống, không kết luận PASS/FAIL (TBD).

(b) Khớp → S=60 Đỏ.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 5.3 “Tỷ lệ nhóm” (Độ chính xác: giữ yêu cầu dùng `R` trước làm tròn; nguồn có thể chưa đủ độ chính xác)
- Bằng chứng cần chụp: Ảnh nguồn (giá trị thô và hiển thị), kết quả.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-026"></a>

### TC-RS-CALC-026 — Mẫu số trung bình khi có học sinh bị loại khỏi xếp hạng

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14)

<!-- Mã truy vết: TD-SRC-07, AC-G14, SI-07 -->

**前提条件（Điều kiện trước）**

- Điều kiện: nhóm có học sinh bị loại khỏi xếp hạng; công thức `A×0.5`, `<`.
- Dữ liệu test: nhóm có học sinh bị loại khỏi xếp hạng; S = 22

**操作（Thao tác）**

Chạy nút xanh rồi nút cam; ghi `A` đọc được.

**期待結果（Kết quả mong đợi）**

`A = (60+40+20)/3 = 40` (mẫu số là số người có điểm của cùng bản) → `T=20` → S=22 Không đỏ. Nếu hệ thống dùng số người thuộc xếp hạng (`A=100/2=50`, `T=25` → Đỏ) là sai.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 5.5 “Chọn bản nguồn” ("Không thay số người có điểm bằng số người thuộc xếp hạng"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14) ("trung bình dùng số người có điểm cùng bản, không phải số người xếp hạng"); khác biệt đặc tả–code về “Mẫu số trung bình” (SI-07)
- Bằng chứng cần chụp: Ảnh nguồn, kết quả, `A` thực tế.
- Ghi chú: đặc tả v2 mục 5.5 “Chọn bản nguồn” và tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (cùng tài liệu chia công việc v2 công việc “Hỗ trợ điều kiện và công thức dùng tổng hợp”: "Không thay số người có điểm bằng số người xếp hạng") đã nêu mẫu số là số người có điểm. Việc ánh xạ trường `examinees`/`student_count` của bản nguồn là kiểm tích hợp, không đổi kỳ vọng.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-027"></a>

### TC-RS-CALC-027 — Trung bình riêng cho từng đơn vị

Priority: TBD ｜ Status: TBD ｜ Requirement ID: đặc tả v2 mục 5.5 “Chọn bản nguồn”

<!-- Mã truy vết: TD-ITEM-03, TD-SRC-09, SI-08 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục điểm đơn vị (đơn vị U1 có M riêng 40) có công thức `A×0.5`, `<`.
- Dữ liệu test: mục điểm đơn vị (đơn vị U1 có M riêng 40); trung bình riêng theo đơn vị (U1=40, U2=70) (U1 `A=40`, U2 `A=70`); S06 U1 = 25, U2 = 30

**操作（Thao tác）**

Chạy nút xanh rồi nút cam.

**期待結果（Kết quả mong đợi）**

Kỳ vọng theo đặc tả v2: U1 `T=20` → 25 Không đỏ; U2 `T=35` → 30 Đỏ. Nguồn trung bình theo đơn vị chưa tích hợp (đặc tả v2 mục 13.1): nếu không tách được thì ghi nhận, không đánh PASS.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 5.5 “Chọn bản nguồn” ("không được bỏ chiều đơn vị"); [context điểm đỏ](../../../CONTEXT.md) (CTX) khoảng trống tích hợp “Trung bình theo đơn vị” (I07); khác biệt đặc tả–code về “Trung bình cho điểm đơn vị” (SI-08)
- Bằng chứng cần chụp: Ảnh nguồn theo đơn vị, kết quả.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-028"></a>

### TC-RS-CALC-028 — Không sai kết quả do sai số dấu phẩy động

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11)

<!-- Mã truy vết: TD-ITEM-02 -->

**前提条件（Điều kiện trước）**

- Điều kiện: mục số thập phân (M=100); nguồn dummy.
- Dữ liệu test: mục số thập phân (M=100); (a) `A=1.1`, công thức `A×3`, S = 3.3; (b) `A=0.1`, công thức `A+0.2`, S = 0.3

**操作（Thao tác）**

Xét với `<` và `≤`.

**期待結果（Kết quả mong đợi）**

(a) `T=3.3`: `<` Không đỏ; `≤` Đỏ.

(b) `T=0.3`: `<` Không đỏ; `≤` Đỏ.

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.8 “Yêu cầu độ chính xác” ("phép so sánh đúng tại `S=T`")
- Bằng chứng cần chụp: Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](01-test-strategy.vi.md#conventions) mục 9 “Quy ước thực thi chung”） ô (a), (b) với `<` và với `≤`.
- Ghi chú: Số thực nhị phân cho `1.1×3=3.3000000000000003` và `0.1+0.2=0.30000000000000004`; nếu hệ thống so sánh thô thì `<` sẽ Đỏ — sai.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-029"></a>

### TC-RS-CALC-029 — Tràn số không tạo kết luận đỏ/không đỏ

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giữ chính xác giá trị” (AC-G11)

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

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 6.8 “Yêu cầu độ chính xác” ("tràn số không được tạo kết luận đỏ/không đỏ"; "vượt giới hạn đã công bố thì báo lỗi"); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 3.4 “`judgment_context`” (tử/mẫu tối đa 256 chữ số — PROPOSED), mục 4.2 “Xử lý phần lẻ và miền lưu trữ” (giới hạn nhập — PROPOSED), mục 4.3 “Trạng thái kết quả” (`numeric_overflow`)
- Bằng chứng cần chụp: Ảnh lỗi hoặc kết quả.
- Ghi chú: Phần CONFIRMED: không tạo kết luận từ giá trị tràn, không âm thầm cắt số. Giới hạn cụ thể là PROPOSED (thiết kế DB v2 mục 4.2 “Xử lý phần lẻ và miền lưu trữ”, giới hạn số chưa chốt — đặc tả v2 mục 13.1); nếu giới hạn cuối khác, chọn lại (b) sao cho lưu được nhưng tràn khi chạy.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-030"></a>

### TC-RS-CALC-030 — Công thức cho T=0; ô trống vẫn là Không có điểm

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: đặc tả v2 mục 2.3 “Điểm được đưa vào xét”, mục 6.6 “Ngưỡng âm và cảnh báo biên”

<!-- Mã truy vết: TD-STU-04, TD-STU-05 -->

**前提条件（Điều kiện trước）**

- Điều kiện: Nguồn `A=20`; công thức `A−20`.
- Dữ liệu test: học sinh S04 (điểm 0) (0), học sinh S05 (ô trống) (trống)

**操作（Thao tác）**

Xét với `<` rồi `≤`.

**期待結果（Kết quả mong đợi）**

`T=0`. `<`: S04 Không đỏ. `≤`: S04 Đỏ. S05: Không có điểm ở cả hai (không bị coi là 0).

**補足（Bổ sung）**

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 2.3 “Điểm được đưa vào xét”, mục 6.6 “Ngưỡng âm và cảnh báo biên”; [Q&A nghiệp vụ đã xác nhận](../../../sources/confirmed-business-qa.vi.md) (QAC) câu “Dùng điểm nào để xét, và phân biệt điểm 0 với ô trống thế nào?” (Q3)
- Bằng chứng cần chụp: Ảnh Trích xuất（[tài liệu “Chiến lược kiểm thử”](01-test-strategy.vi.md#conventions) mục 9 “Quy ước thực thi chung”） S04, S05 với `<` và với `≤`; ảnh SELECT trạng thái của S05.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-031"></a>

### TC-RS-CALC-031 — Nguồn không có mẫu số hợp lệ (tổng điểm tối đa 0, số người có điểm 0) → Chưa xét được

Priority: Cao ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14)

<!-- Mã truy vết: TD-RULE-09, AC-G14 -->

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

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 5.3 “Tỷ lệ nhóm” (Phạm vi vận hành: dữ liệu không hợp lệ theo quy tắc chung, không thay bằng 0), mục 5.5 “Chọn bản nguồn”, mục 8.3 “Không tạo được ngưỡng hợp lệ”; [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14) ("số người 0, tổng maximum sai hoặc tập đóng góp không xác định thì chưa xét được"); [thiết kế DB v2](../database-design.vi.md) (RSD-DB) mục 4.3 “Trạng thái kết quả” (mã nguyên nhân — PROPOSED)
- Bằng chứng cần chụp: Ảnh kết quả; SELECT `reason_code` (khi có schema).
- Ghi chú: Mã nguyên nhân cụ thể là PROPOSED. Không tạo được dữ liệu (a)/(b): BLOCKED.

**結果（Kết quả）**

**証跡（Bằng chứng）**

<a id="tc-rs-calc-032"></a>

### TC-RS-CALC-032 — Tỷ lệ nhóm: tử số và mẫu số lấy cùng tập đóng góp

Priority: TBD ｜ Status: CONFIRMED ｜ Requirement ID: tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14)

<!-- Mã truy vết: TD-RULE-09, AC-G14 -->

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

- Nguồn: [đặc tả v2](../specification.vi.md) (R18) mục 5.3 “Tỷ lệ nhóm” (công thức `R`), mục 5.5 “Chọn bản nguồn” ("tử số và mẫu số phải tương ứng cùng tập đóng góp theo cấu hình tổng hợp"); [tiêu chí nghiệm thu v2](../acceptance-criteria.vi.md) (RSD-AC) tiêu chí nghiệm thu “Giá trị thô từ cùng tập dữ liệu” (AC-G14) ("tử/mẫu tỷ lệ dùng cùng tập đóng góp")
- Bằng chứng cần chụp: Ảnh kết quả tổng hợp (tổng điểm, tổng tối đa, số người); ảnh kết quả xét.
- Ghi chú: Nếu cấu hình tổng hợp hiện có đưa học sinh chưa có điểm vào cả tử và mẫu theo cùng quy tắc thì ghi nhận giá trị thực tế; điều kiện kiểm là tử/mẫu cùng tập, không phải con số 70% cố định.

**結果（Kết quả）**

**証跡（Bằng chứng）**
