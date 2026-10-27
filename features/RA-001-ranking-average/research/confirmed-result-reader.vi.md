# RA-001 — Bộ đọc bản chốt dùng chung: PR 57058 và ba nhánh

**Loại tài liệu:** topic research, đối chiếu code và ghi nhận trao đổi nội bộ. Không phải nguồn yêu cầu nghiệp vụ. Quy tắc nghiệp vụ (Q2: chỉ bản đã chốt, Q3: số trước làm tròn) vẫn nằm ở [CONTEXT](../CONTEXT.md).

**Ngày:** 26–27/10/2026. **Cách kiểm:** đọc code và chạy thử gộp (`git merge-tree`, không đổi repo). Chưa chạy code của PR, chưa chạy truy vấn của nhánh nào trên bảng của PR.

## 1. Kết luận

- Hướng đã thống nhất (27/10/2026) giữa shite và người làm PR 57058: **bộ đọc bản chốt dùng chung cho ba chức năng** (赤点判定 = xét điểm liệt, tính điểm tự động dùng trung bình, ánh xạ theo khoảng điểm trung bình) sẽ là `getTotalResults()` / `getTotalData()` có thêm tham số `$use_fix_table`, không phải `getStudentCalcResults()`.
- Người làm PR 57058 đã đưa thay đổi này vào PR (commit `9a91794106b`, 27/10/2026 13:30 giờ Nhật). PR vẫn là WIP, chưa gộp vào `master`.
- Cả ba nhánh (RC-001, RA-001, EM-001) hiện **vẫn đọc bản chốt bằng truy vấn riêng**, cùng các bảng `grade_calc_fix_*` và cùng quy tắc. Không nhánh nào gọi hoặc sửa `getStudentCalcResults()`.
- Chưa chuyển nhánh nào sang hàm chung. Việc chuyển làm sau khi PR được gộp hoặc ổn định (mục 6).

## 2. Diễn biến

| Ngày | Nội dung | Nguồn |
| --- | --- | --- |
| 26/10/2026 | shite chuyển tiếp mô tả phương thức lấy bản chốt từ phía chức năng 確定 (chốt kết quả tổng hợp thứ hạng): các tập hợp lấy được là 学年 (khối), ホームルーム (lớp chủ nhiệm), 授業 (tiết học; chỉ khi bật 授業毎の集計 = tổng hợp theo tiết), 順位集計グループ (nhóm thứ hạng), 組み合わせグループ (nhóm kết hợp), 科目グループ (nhóm môn học, tên cũ 科目ごとの母集団). Cách lấy: `GradeCalcResultService::getStudentCalcResults()` có thêm tham số `$use_fix_table`; `true` thì đọc bảng bản chốt. Nhờ xem hàm này và các nơi gọi trong PR. shite yêu cầu 各所切り替えてください (chuyển từng chỗ) | [thread Slack, Reply 26](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1792997495748829?thread_ts=1791290094.955599&cid=C0BRGJA6XDE) |
| 27/10/2026 08:00 | shite hỏi người làm PR: ba chức năng cần dùng chung một phương thức; cần **tổng điểm ÷ số học sinh có điểm** của bản chốt (trung bình trước làm tròn); thành viên đã xác nhận `getStudentCalcResults()` không lấy được số học sinh này; `examinees` là số người tính thứ hạng nên không thay được. Đề xuất thêm lấy bản chốt vào `getTotalResults()` / `getTotalData()` với ba hành vi: (1) lấy tổng điểm bản chốt và số học sinh có điểm; (2) không có bản chốt hợp lệ thì coi như không lấy được, không dùng số chưa chốt thay thế; (3) nơi gọi hiện có vẫn lấy kết quả thường. Cho phép cách khác nếu hợp lý hơn | Ảnh chụp kênh nội bộ NB成績 (chưa có URL) |
| 27/10/2026 08:20 | Người làm PR trả lời: làm được, đây là cách tốt nhất, sẽ đưa vào PR của mình và báo lại khi sửa xong | Cùng nguồn |
| 27/10/2026 13:30 (JST) | Commit `9a91794106b` trong PR: `getTotalResults` và hai `getTotalData` (model `GradeCalcResultEachSubSubjectLogs_m`, `GradeCalcResultEachGroupLogs_m`) có `$use_fix_table`; chú thích ghi mẫu số trung bình là `student_count`, không phải `examinees` | Code PR 57058 |

Đây là thống nhất nội bộ giữa shite và người làm PR, không phải xác nhận của khách.

## 3. PR 57058 cung cấp gì (đọc code ở `9a91794106b`)

- **Ghi bản chốt:** `GradeCalcFixUseCase` (`fix` / `unfix` / `update`) chép kết quả sang `grade_calc_fix_*` và ghi `grade_calc_fix_log` (`active = 1`). Hủy chốt hoặc cập nhật thì xóa bản chốt cũ và đặt `active = 0`. Đơn vị chốt: trường, năm, khối, học kỳ, thời kỳ.
- **Đọc theo học sinh:** `getStudentCalcResults()` (qua `getStudentData` của hai model) trả thứ hạng, điểm, `examinees` theo từng học sinh truyền vào.
- **Đọc cấp tập hợp (mới, 27/10):** `getTotalResults()` / `getTotalData()` trả `total_score`, `avg_score`, `examinees`, `student_count` (`count(*)` các dòng thứ hạng của cùng log, gồm cả học sinh bị loại khỏi thứ hạng).
- **Đọc trạng thái chốt:** `GradeCalcFixLogRepository` (`findActiveBy`, `findActiveListByGradePeriodTerms`), `GradeCalcFixUseCase::getFixStateList`.
- PR cũng tự thêm chức năng **順位連動設定** (cài đặt liên kết thứ hạng, mã loại đăng ký 8) dùng `getStudentCalcResults(..., true)` ở `AutoRating.php`.

## 4. Ba nhánh đang đọc như thế nào

| | RC-001 (赤点, điểm liệt) | RA-001 | EM-001 |
| --- | --- | --- | --- |
| Điểm vào | `RedScoreJudge::loadSourceRow` | `RankingAverageReader::getAverage` | `AverageRangeSourceStub` và `getFinalizedEachSubSubjectTotalResult` / `getFinalizedEachGroupTotalResult` |
| Truy vấn | `getRedScoreSourceMetric` trong hai model | như RC-001 (dùng lại) | hàm riêng trong `GradeCalcResultService` |
| Bảng đọc | `grade_calc_fix_each_{sub_subject,group}_{logs,total,ranks}` | như RC-001 | như RC-001 |
| Kiểm bản chốt | `grade_calc_fix_log.active = 1` theo (trường, năm, khối, học kỳ, thời kỳ) | như RC-001 | `EXISTS` trên `grade_calc_fix_log.active = 1` |
| Chưa chốt | trả rỗng, không lùi về kết quả mới nhất | như RC-001 | trả rỗng |
| Môi trường chưa có bảng | kiểm `table_exists`, trả rỗng | như RC-001 | như RC-001 |
| Số học sinh | số dòng thứ hạng của cùng log | như RC-001 | `count(ranks...)` |
| Trung bình | tổng ÷ số học sinh, phân số, không làm tròn | `bcdiv` scale 20 | `bcdiv` scale 20 |
| Nhóm môn học (科目グループ) | có | có | **không có** (giao diện chọn và `AverageRangeSourceStub` đều không xử lý) |

Mọi cột mà truy vấn của ba nhánh dùng đều có trong migration `20260825_grade_calc_fix.sql` của PR.

## 5. Liên quan đến `getStudentCalcResults()`

- Cả ba nhánh không gọi hàm này trong code mới và không sửa nó (`git diff master...nhánh` không có thay đổi nào chạm hàm). Các nơi gọi có sẵn trên `master` không đổi: `ReportWidgetGradesNormalData`, `AdminNBGradeExtractionResultController`, `GradeCalcResultService::getByCalcGroupSubSubject`.
- Hàm này không dùng được cho trung bình cấp tập hợp: chỉ trả dòng thứ hạng của các `student_ids` được truyền vào nên không đếm được số học sinh có điểm; `avg_score` lưu sau khi làm tròn (`GradeCalc.php`, `calcPrecision`) trong khi Q3 yêu cầu số trước làm tròn. Đó là lý do hướng được đổi sang `getTotalResults()` / `getTotalData()`.

## 6. Điểm cần kiểm khi chuyển nhánh sang hàm chung

Đây là việc cần làm, chưa làm. Hiện trạng ở `9a91794106b`:

| Điểm | Hiện trạng trong PR | Cần làm |
| --- | --- | --- |
| Điều kiện bản chốt hợp lệ | Không kiểm `grade_calc_fix_log.active`; dựa vào việc hủy chốt/cập nhật xóa dữ liệu bản chốt cũ | Xác nhận với người làm PR; nếu giữ thì ghi rõ giả định |
| Môi trường chưa có bảng | `$use_fix_table = true` không kiểm `table_exists`, sẽ lỗi SQL nếu chưa chạy migration | Ba nhánh đang trả rỗng; cần cùng hành vi hoặc xác nhận migration luôn có trước |
| Mẫu số | `student_count` đúng như ba nhánh | Giữ; kiểm lại bằng AC-21 đến AC-23 của [RA-001](../docs/specification.vi.md#ac) |
| Không lùi về số chưa chốt | Với `true` chỉ đọc bảng bản chốt, thiếu thì rỗng | Giữ; phía gọi không được tự đọc số thường khi rỗng |
| Đơn nguyên (単元) | `getTotalData` chọn `tangen_id` nhưng không lọc | Phía gọi phải lọc theo đơn nguyên đang tính |
| Nhóm môn học | `getTotalResults` xử lý qua `calc_group_sub_subject`; EM-001 chưa dùng | Khi EM-001 chuyển, cần thêm 科目グループ vào giao diện và nguồn nếu muốn đồng nhất với RA-001 |
| Nhóm kết hợp | `getTotalResults` tra theo `grade_calc_group_item_ids` của học sinh | Kiểm cùng kết quả với `getRedScoreSourceMetric` |
| Hồi quy | Ba nhánh đang khớp từng dòng ở hai model | Sau khi chuyển, so số liệu trước và sau trên cùng dữ liệu |

Khi chuyển, các hàm riêng có thể bỏ: `getRedScoreSourceMetric` (và hàm phụ) trong hai model của RC-001/RA-001; `getFinalizedEach*TotalResult` trong `GradeCalcResultService` của EM-001.

## 7. Gộp với PR 57058 (chạy thử, 27/10/2026)

Đầu nhánh: PR `9a91794106b`, RC-001 `6e44cbfd2a0` (22/10), RA-001 `55edefea7cf`, EM-001 `14a355bfded` (22/10).

| Nhánh | Xung đột chữ | Ghi chú |
| --- | --- | --- |
| RC-001 | 1 file: `AdminGradeSettingSystemGradeCalcController.php` (hàm khởi tạo: RC thêm hai model, PR thêm `GradeCalcFixUseCase`; giữ cả hai) | Không xung đột ở `AutoRating.php` |
| RA-001 | 2 file: `AutoRating.php` (khối `unset`), `AutoRatingConfController.php` (PR đổi chữ ký `conditionValidate`, RA chèn hàm mới ngay trước) | Import `GradeCalcResultService` ở `AutoRating.php` đã có lại (commit `55edefea7cf`), nên code của PR (`prepareRankLink`) không lỗi thiếu class |
| EM-001 | 2 file: `AutoRating.php` (4 chỗ: `unset`, khối chuẩn bị, hai chỗ trong `switch`) và `m_AutoRatingConfItemRegistType.php` (cùng thêm một dòng vào `REGIST_TYPES`) | Giữ cả hai ở mọi chỗ. Mã loại không trùng: PR dùng 8, EM-001 dùng 9 |

Xung đột giữa RA-001 và EM-001 ở `AutoRating.php` vẫn còn. RA-001 và RC-001 gộp với nhau không xung đột. Ai gộp sau thì giải xung đột; thứ tự gộp chưa chốt.

## 8. Chưa kiểm

- Chưa chạy PR; chưa so số liệu `getTotalResults(..., true)` với `getRedScoreSourceMetric` trên cùng dữ liệu.
- Đầu RC-001 và EM-001 ở trên là ngày 22/10; hai nhánh còn thay đổi.
- Ảnh chụp trao đổi 27/10 không có URL; nội dung ghi lại từ ảnh.
- PR còn là WIP, có thể đổi.
