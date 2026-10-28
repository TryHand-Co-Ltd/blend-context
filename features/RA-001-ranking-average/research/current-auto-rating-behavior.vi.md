# RA-001 — Hiện trạng tính điểm tự động（自動計算）liên quan đến trung bình môn（科目平均）

**Loại tài liệu:** topic research, bằng chứng đọc code. Đây không phải nguồn yêu cầu. Yêu cầu hiện hành nằm ở [CONTEXT](../CONTEXT.md).

**Ngày đọc:** 10–11/10/2026.

**Source đã đọc:** repository `blend`, nhánh `chore/RC-001_design_gap_audit`, commit `efecfb80c42b22cd563aef2bdf155d95720bbde5`. Nhánh này **không phải `main`**. Cần đối chiếu lại trên `main` trước khi dùng làm căn cứ triển khai. Chỉ đọc tĩnh, không chạy ứng dụng, không chạy SQL. Số dòng là vị trí tại commit trên, có thể lệch ở revision khác.

## Câu hỏi

Tính điểm tự động hiện xử lý trung bình môn, điều kiện lọc, thứ tự dòng thiết lập và kết quả trống như thế nào. RA-001 cần biết điểm xuất phát để mô tả phần thay đổi và phần giữ nguyên.

## Kết luận

| # | Hành vi hiện tại | Bằng chứng | Ảnh hưởng tới RA-001 |
| --- | --- | --- | --- |
| 1 | **科目平均** (trung bình môn) chỉ có trong danh sách loại giá trị ở trường cấp 3 Uenomiya（上宮高等学校）và trường cấp 2 Uenomiya（上宮学園中学校） | `blend:application/controllers/grade_report_setting/auto_rating/AutoRatingConfController.php` khoảng dòng 1165–1170, so `uenomiya_id`, `uenomiya_jr_id` | Mở cho mọi trường phải bỏ điều kiện trường này |
| 2 | Trường khác lưu công thức thì các key chứa `calc_conf_name` và `sub_subject_avg` bị bỏ | Cùng file, hàm `registFormula` từ dòng 1277, đoạn bỏ key khoảng dòng 1302–1312 | Phải bỏ chặn khi lưu, nếu không mở lại sẽ mất lựa chọn |
| 3 | Vế trung bình môn lưu `left_formula_type`/`right_formula_type` = 5 (`TYPE_SUB_SUBJECT_AVG`), cùng `*_calc_conf_name` và `*_sub_subject_avg` | `blend:application/domain/model/AutoRatingConf/m_AutoRatingConfItemFormula.php` | Dữ liệu cũ của hai trường Uenomiya đã có định dạng này |
| 4 | `*_sub_subject_avg` là chuỗi `期間名,区分名,集団名` (tên kỳ, tên phân kỳ, tên nhóm). Thiết lập thứ hạng cũng lưu bằng **tên** | `blend:application/domain/tmp/AutoRating.php` khoảng dòng 2850–2856 | Đổi tên hoặc xóa thiết lập thứ hạng, kỳ, nhóm thì tham chiếu không còn khớp và không lấy được số |
| 5 | Nhóm là `学年毎` (theo khối), `HR毎` (theo lớp chủ nhiệm) hoặc tên nhóm thứ hạng | `AutoRating.php` khoảng dòng 2858–2870 | Danh sách nhóm của Q5 |
| 6 | Số trung bình đọc từ kết quả tổng hợp thứ hạng mới nhất, qua `GradeCalcResultService::getEachSubSubjectTotalResult` | `AutoRating.php` khoảng dòng 844–856; `blend:application/usecase/grade_setting/common/query_service/GradeCalcResultService.php` | Hiện chỉ có số vừa chạy. Q2 |
| 7 | Dùng số **chưa làm tròn**: `total_score ÷ student_count`. Có cờ `$use_round_avg = false` kèm TODO cho phép chuyển sau | `AutoRating.php` khoảng dòng 2874–2888 | Hiện trạng của Q3 |
| 8 | Không có kết quả của đúng kỳ, nhóm, môn thì vế trung bình không có giá trị | `AutoRating.php` khoảng dòng 2872 | Công thức không ra số. Q4 |
| 9 | Chia cho 0 trả `null` | `AutoRating.php` khoảng dòng 2912–2918 | Công thức không ra số |
| 10 | Xét dòng thiết lập từ trên xuống, dừng ở dòng khớp đầu tiên | `AutoRating.php` biến `$conf_item_matched`, khoảng dòng 1015–1054 | Quy tắc thứ tự của spec §4 |
| 11 | Học sinh không khớp dòng nào thì cột đích được ghi `null`, điểm đang có bị xóa | `AutoRating.php` khoảng dòng 1067–1072 | Điều kiện trung bình làm học sinh không khớp dòng nào cũng sẽ bị xóa điểm. Liên quan Q4 và Q7 |
| 12 | Điều kiện lọc lưu trong cột JSON `auto_rating_conf_items.condition`, mảng `setting_condition`, mỗi phần tử dùng `jouken-a` (loại), `jouken-b`, `jouken-c` | `blend:application/repository/grade_setting/AutoRatingConfItemRepository.php` khoảng dòng 60–110; `blend:application/models/AutoRatingConfItem_m.php` | Loại điều kiện trung bình mới thêm vào mảng này, không cần bảng mới |
| 13 | Các loại điều kiện hiện có là `TARGET` 1–11 (khối, khóa HR, nhóm thành tích, tổ hợp nhóm, checkbox, mục lựa chọn, vắng quá số tiết, loại tiết, chương trình…). Chưa có điểm trung bình | `blend:application/domain/model/AutoRatingConf/m_AutoRatingConfItemCondition.php` | Cần một loại mới |
| 14 | Cách nối điều kiện: `CONDITION_JOIN_TYPE_AND = 1` (かつ, và), `CONDITION_JOIN_TYPE_OR = 2` (または, hoặc) | `m_AutoRatingConfItemConditionJoinType.php` | Form hiện ẩn lựa chọn này, mặc định AND. OR chỉ còn trong dữ liệu cũ (ghi nhận khi đọc màn hình ngày 10/10) |
| 15 | Ánh xạ có dấu so sánh 1–5: 以上 (từ … trở lên), より大きい (lớn hơn), と等しい (bằng), より小さい (nhỏ hơn), 以下 (từ … trở xuống) | `m_AutoRatingConfItemMappingCondition.php` | Bộ dấu được dùng lại cho điều kiện trung bình |
| 16 | Giá trị gốc của ánh xạ: `STANDARD_TYPE_CALC = 1` (計算結果, kết quả tính), `STANDARD_TYPE_EVALUATE_ITEM = 2` (評価項目, mục đánh giá) | `m_AutoRatingConfItemMapping.php` | Q1 thêm một loại giá trị gốc |

## Các đường gọi tính điểm tự động

Các đường dưới đây đều tạo `domain\tmp\AutoRating` và tính theo cùng cơ chế. Mọi quy tắc của RA-001 áp dụng như nhau trên các đường này, gồm cả việc ghi trống ở mục 8–11.

| Đường | Bằng chứng |
| --- | --- |
| Màn tiết học, **自動算出実行** (chạy tính điểm tự động) | `blend:application/controllers/grade/grade_setting_system/AdminNBGradeSettingSystemLessonController.php` |
| Nhập CSV điểm | `blend:application/controllers/grade/grade_setting_system/AdminNBGradeSettingSystemLessonCsvController.php`, hàm `import` |
| Chạy hàng loạt | `blend:application/controllers/batch/grade/AutoRatingBatch.php` |
| Liên kết **試験・採点管理** (quản lý thi và chấm điểm), phía quản trị | `blend:application/controllers/grade_exam/AdminGradeExamController.php` |
| Liên kết thi, phía học sinh | `blend:application/controllers/student/grade_exam/StudentGradeExamController.php` |
| Xử lý riêng của trường | `blend:application/libraries/school/TakaokaEx.php`, `UlsEx.php`, `UlsJrEx.php`, `UlsElEx.php` |

## Giới hạn

- Đọc trên nhánh `chore/RC-001_design_gap_audit`, chưa đối chiếu `main`.
- Chưa đọc chi tiết bốn thư viện riêng của trường. Chưa biết chúng có thay đổi cách tính hay chỉ gọi lại cơ chế chung.
- Chưa đọc lại [PR 57058](https://github.com/ednity/school-web/pull/57058) trong lượt này.
- Mục 11 và việc ghi trống khi công thức không ra số là kết quả đọc code, chưa chạy trên môi trường.
