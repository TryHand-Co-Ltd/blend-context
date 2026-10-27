# RA-001-H — Kiểm 4 thư viện riêng của trường và đếm dữ liệu cũ dùng OR

**Loại tài liệu:** topic research, bằng chứng đọc code và đếm dữ liệu. Đây không phải nguồn yêu cầu. Yêu cầu hiện hành nằm ở [CONTEXT](../CONTEXT.md).

**Ngày kiểm:** 27/10/2026. **Người làm:** Tuan.

**Source đã đọc:** repository `blend`, nhánh `feature/RA-001_ranking_average`, commit `7d1e115ee0216e8f7b935fa40c7f280587a7d197`. Chỉ đọc tĩnh. Số dòng là vị trí tại commit này.

**Dữ liệu đã đếm:** DB **local** (dump dùng để phát triển), chỉ chạy SELECT trong phiên READ ONLY. **Chưa đếm trên DB thật**, xem mục 3.

## 1. Kết luận

| Thư viện (trường) | Gọi cơ chế chung `AutoRating`? | Tự tính? | Ảnh hưởng tới ② (trung bình tổng hợp thứ hạng, 順位集計の平均点) |
| --- | --- | --- | --- |
| `TakaokaEx` (Takaoka, 高岡) | Không | Có. Đổi điểm thi thành 評定 (điểm đánh giá 1–5) bằng hàm riêng | **Không bị ảnh hưởng.** Không dùng trung bình tổng hợp thứ hạng để tính; trên DB local trường này chưa bật **NB成績2023** (use_blend2023) và chưa có thiết lập tính điểm tự động nào, nên cũng không đi qua cơ chế chung |
| `UlsEx` (Uls cấp 3, 上宮高等学校) | Không | Có. Đổi 観点 (quan điểm đánh giá) và điểm 1・2 học kỳ thành 評定 | **Không bị ảnh hưởng.** Chỉ tự lấy trung bình điểm của chính học sinh; từ năm 2025 thư viện không chạy tự động nữa |
| `UlsJrEx` (Uls cấp 2, 上宮学園中学校) | Không | Có. Tương tự `UlsEx` | **Không bị ảnh hưởng tới tính điểm.** Có đọc kết quả tổng hợp thứ hạng nhưng chỉ để in phiếu **データシート** (data sheet), không dùng khi tính |
| `UlsElEx` (Uls cấp 1, 上宮学園小学校) | Không | Có. Tính 評点・評定 từ trung bình 観点 | **Không bị ảnh hưởng.** Không đọc tổng hợp thứ hạng |

**Không thư viện nào gọi `AutoRating` chung** và không thư viện nào có hành vi đổi khi chuyển sang bản tổng hợp đã chốt (確定). Thay đổi của ② áp dụng như bình thường cho mọi trường, kể cả ba trường Uls (trên DB local cả ba đã bật **NB成績2023**).

## 2. Bằng chứng

### 2.1 Không gọi cơ chế chung

- Bốn tệp không tham chiếu `domain\tmp\AutoRating`, `AutoRatingFacade`, `auto_rating_conf*` hay `sub_subject_avg`. Các hàm tính nằm trong chính tệp: `TakaokaEx.php` L351 (`autoCalc`), `UlsEx.php` L756, `UlsJrEx.php` L827, `UlsElEx.php` L362.
- Điểm vào là hàm `autoCalc` do bộ điều khiển (controller) gọi theo cột `libraly_code` của bảng `school`:
  - Chạy hàng loạt `AutoRatingBatch.php` L986.
  - Màn tiết học cũ `AdminGradeSettingSystemLessonController.php` L777 và nhập CSV cũ `AdminGradeSettingSystemLessonCsvController.php` L1027.
- Đường dùng cơ chế chung (`new AutoRating()`) **không gọi `autoCalc`**: màn tiết học NB `AdminNBGradeSettingSystemLessonController.php`, CSV NB, `AdminGradeExamController.php`, `StudentGradeExamController.php`. Trong `AutoRatingBatch.php` L180–L202, nhóm của trường bật `use_blend2023` chạy `AutoRating->calc` rồi `continue`, không tới đoạn gọi `autoCalc` ở L986. Màn tiết học cũ chuyển hướng sang NB khi `use_blend2023` bật (L82).
- Vì vậy với trường bật `use_blend2023`, thư viện riêng không chạy ở đường tính điểm tự động; hai cơ chế không ghi đè nhau.

### 2.2 Từng thư viện tự tính thế nào

| Thư viện | Điểm vào → hàm tính | Đầu vào | Dùng trung bình? |
| --- | --- | --- | --- |
| `TakaokaEx` | `autoCalc` L351 → `newCurriculumAutoRating` L3329, `oldCurriculumAutoRating` L3108, `autoKantenConvert` L3560 (chỉ từ 2022) | `grade_score` làm tròn xuống → `autoRating5` L3654 / `newCurriculumAutoRating5` L3671 | Các `average_score` trong tệp (L534–L605…) đọc từ `GradeUnitAggregatesAverages_m` / `GradeSumAggregatesAverages_m` chỉ để xuất PDF báo cáo, không dùng khi tính |
| `UlsEx` | `autoCalc` L756; **`return` từ năm 2025** (L758, "NB移行後は実施しない") → `autoKantenConvert`, `newCurriculumAutoRating` L1030, `oldCurriculumAutoRating` L803… | 観点 và `free_score` → `autoRating5` L1331 | Chỉ trung bình điểm của chính học sinh (L854, L951, L1105: "1,2学期評点から平均", "観点別点数の平均"). `GradeCalcResultService` chỉ được khai báo `use` (L6), không gọi |
| `UlsJrEx` | `autoCalc` L827 → `autoKantenConvert` L858, `curriculumAutoRating` L1012, `…Middle` L1116, `…LateAge` L1160 | 観点 → `autoRating5` L1263 | Trung bình 観点 của học sinh (L1069, L1215). `GradeCalcResultService` dùng ở `getGradeCalcResultData` L766 (「総合点集計」「5教科」: tổng điểm và độ lệch chuẩn) và `getEachSubSubjectResult` L1967, **chỉ cho `downloadDataSheet`** L164 |
| `UlsElEx` | `autoCalc` L362 → `semesterAutoRating` L385, `thirdSemesterAutoRating` L493 | 観点 → `autoRating3` L606 | Trung bình 観点 (L443, L551) |

### 2.3 Thay đổi của RA-001 không chạm vào bốn thư viện

So với điểm tách nhánh (`85986a865`), nhánh RA-001 **không sửa** bốn thư viện và không sửa `GradeCalcResultService`. Hai model `GradeCalcResultEachGroupLogs_m` và `GradeCalcResultEachSubSubjectLogs_m` chỉ **thêm** hàm (0 dòng bị xóa), nên phần in data sheet của `UlsJrEx` không đổi hành vi.

## 3. Dữ liệu cũ dùng OR（または, "hoặc"）

Cột `auto_rating_conf_items.condition_join_type`: `1` = AND, `2` = OR. Form mới ẩn lựa chọn này nên OR chỉ còn ở dữ liệu cũ.

**Kết quả trên DB local** (chỉ là số tham khảo, chưa phải số của môi trường thật):

| Cách đếm | Dòng thiết lập | Trường | Bộ thiết lập（auto_rating_conf） |
| --- | --- | --- | --- |
| OR, đang bật (`active = 1`) | **776** | 42 | 577 |
| OR, đã tắt (`active = 0`) | 29 | 9 | 21 |
| OR **và có từ 2 điều kiện trở lên**, đang bật | **676** | 39 | 509 |
| OR **và có từ 2 điều kiện trở lên**, đã tắt | 29 | 9 | 21 |
| Tổng số dòng thiết lập (AND + OR, mọi trạng thái) | 56.257 | | |

- Con số cần báo người phụ trách là **676 dòng đang bật** (OR có từ 2 điều kiện trở lên). OR chỉ có 1 điều kiện cho kết quả như AND nên không bị ảnh hưởng. 100 dòng OR đang bật còn lại (776 − 676) có 0–1 điều kiện.
- Cả 29 dòng đã tắt đều có từ 2 điều kiện nhưng tắt nên không chạy.
- Không dòng OR nào có `condition` lỗi JSON.
- Bốn trường Uls/Takaoka: **không có dòng OR nào** (Uls cấp 3: 72 dòng, cấp 2: 68 dòng, cấp 1: 132 dòng, đều AND; Takaoka chưa có thiết lập nào).

**Giới hạn:** số trên lấy từ DB local. Số thật phải đếm trên DB vận hành. Phải có quyền truy cập đã được phê duyệt theo quy trình của nhóm (theo hướng dẫn workspace, chỉ SELECT có giới hạn). Truy vấn đề xuất, chỉ đọc:

```sql
SELECT i.active,
       COUNT(*) AS or_items,
       COUNT(DISTINCT i.school_id) AS schools,
       COUNT(DISTINCT i.auto_rating_conf_id) AS confs
FROM auto_rating_conf_items i
WHERE i.condition_join_type = 2
  AND JSON_VALID(i.`condition`)
  AND JSON_LENGTH(JSON_EXTRACT(i.`condition`, '$.setting_condition')) >= 2
GROUP BY i.active;
```

Muốn báo theo trường, thêm `i.school_id` vào `SELECT` và `GROUP BY`. Chưa lọc theo năm học vì bảng này gắn với bộ thiết lập（auto_rating_conf）chứ không có cột năm; nếu cần theo năm, nối thêm bảng `auto_rating_conf`.

## 4. Việc đề xuất sau kiểm

- Cập nhật hai dòng ở mục 7 của [CONTEXT](../CONTEXT.md) ("Bốn thư viện riêng của trường" và "Dữ liệu cũ dùng OR") sang đã kiểm tra, trỏ tới tài liệu này.
- Chạy truy vấn mục 3 trên DB vận hành để có số thật trước khi phát hành.
- Chưa kiểm: thư viện chạy ở đường nào với **năm học cũ** trên môi trường thật (mới đọc code, chưa chạy ứng dụng), và Takaoka có bật `use_blend2023` ở môi trường thật hay không (local không có dòng cấu hình).
