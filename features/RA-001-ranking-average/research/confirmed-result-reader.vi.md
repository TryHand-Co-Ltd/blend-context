# RA-001 — Bộ đọc bản chốt dùng chung: PR 57058 và ba nhánh

**Loại tài liệu:** topic research, đối chiếu code và ghi nhận trao đổi nội bộ. Không phải nguồn yêu cầu nghiệp vụ. Quy tắc nghiệp vụ (Q2: chỉ bản đã chốt, Q3: số trước làm tròn) vẫn nằm ở [CONTEXT](../CONTEXT.md).

**Ngày:** 26–27/10/2026. **Cách kiểm:** đọc code, chạy thử gộp (`git merge-tree`, không đổi repo) và chạy `getTotalResults(..., true)` qua `RankingAverageReader` trên bảng bản chốt dựng ở DB local từ migration của PR (đã xóa sau khi kiểm). Chưa chạy giao diện của PR.

**Code đã kiểm:** repository `blend`, nhánh `feature/RA-001_ranking_average` tại `55edefea7cf` cộng thay đổi chưa commit ngày 27/10/2026 (các file ở mục 4). PR 57058 ở `9a91794106b`.

## 1. Kết luận

- Hướng đã thống nhất (27/10/2026) giữa shite và người làm PR 57058: **bộ đọc bản chốt dùng chung cho ba chức năng** (赤点判定 = xét điểm liệt, tính điểm tự động dùng trung bình, ánh xạ theo khoảng điểm trung bình) là `getTotalResults()` / `getTotalData()` có thêm tham số `$use_fix_table`, không phải `getStudentCalcResults()`.
- Người làm PR 57058 đã đưa thay đổi này vào PR (commit `9a91794106b`, 27/10/2026 13:30 giờ Nhật). PR vẫn là WIP, chưa gộp vào `master`.
- **RA-001 đã chuyển sang hàm chung (27/10/2026, chưa commit).** `RankingAverageReader` gọi `GradeCalcResultService::getTotalResults(..., true)`; hai hàm `getRedScoreSourceMetric` và hàm phụ đã bỏ khỏi hai model của nhánh RA-001.
- RC-001 (điểm liệt) và EM-001 **vẫn đọc bằng truy vấn riêng** (cùng bảng `grade_calc_fix_*`, cùng quy tắc), chưa chuyển. Không nhánh nào gọi hoặc sửa `getStudentCalcResults()`.

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
- **Đọc cấp tập hợp (mới, 27/10):** `getTotalResults()` / `getTotalData()` trả `total_score`, `avg_score`, `examinees`, `student_count` (`count(*)` các dòng thứ hạng của cùng log, gồm cả học sinh bị loại khỏi thứ hạng). `getTotalData` của model nhóm tiết học đổi nối bảng thứ hạng từ `..._total as rank` sang `..._ranks as rank` (trước đó `count(*)` đếm nhầm bảng tổng).
- **Đọc trạng thái chốt:** `GradeCalcFixLogRepository` (`findActiveBy`, `findActiveListByGradePeriodTerms`), `GradeCalcFixUseCase::getFixStateList`. `GradeCalcFixStateResolver` phân bốn trạng thái: `unfixed`, `fixed`, `stale` (đã chốt nhưng tổng hợp mới hơn bản chốt), `not_aggregated`.
- PR cũng tự thêm chức năng **順位連動設定** (cài đặt liên kết thứ hạng, mã loại đăng ký 8) dùng `getStudentCalcResults(..., true)` ở `AutoRating.php`. Trước khi đọc, `prepareRankLink` lọc các khối đã chốt bằng `GradeCalcFixLogRepository::findActiveListByGradePeriodTerms` (có dòng `active = 1`, kể cả trạng thái `stale`).

## 4. Ba nhánh đang đọc như thế nào

| | RC-001 (赤点, điểm liệt) | RA-001 (sau khi chuyển) | EM-001 |
| --- | --- | --- | --- |
| Điểm vào | `RedScoreJudge::loadSourceRow` | `RankingAverageReader::getAverage` | `AverageRangeSourceStub` và `getFinalizedEachSubSubjectTotalResult` / `getFinalizedEachGroupTotalResult` |
| Truy vấn | `getRedScoreSourceMetric` trong hai model | `GradeCalcResultService::getTotalResults(..., true)` (hàm chung của PR) | hàm riêng trong `GradeCalcResultService` |
| Bảng đọc | `grade_calc_fix_each_{sub_subject,group}_{logs,total,ranks}` | như RC-001 (qua hàm chung) | như RC-001 |
| Kiểm bản chốt | `grade_calc_fix_log.active = 1` theo (trường, năm, khối, học kỳ, thời kỳ) | như RC-001, ở `GradeCalcResultEachSubSubjectLogs_m::hasActiveFixedResult`, gọi trước khi đọc | `EXISTS` trên `grade_calc_fix_log.active = 1` |
| Chưa chốt | trả rỗng, không lùi về kết quả mới nhất | như RC-001 | trả rỗng |
| Môi trường chưa có bảng | kiểm `table_exists`, trả rỗng | kiểm bảy bảng bản chốt trong `hasActiveFixedResult`, thiếu một bảng thì trả rỗng | như RC-001 |
| Số học sinh | số dòng thứ hạng của cùng log | `student_count` của hàm chung (cùng định nghĩa) | `count(ranks...)` |
| Trung bình | tổng ÷ số học sinh, phân số, không làm tròn | `bcdiv` scale 20 | `bcdiv` scale 20 |
| Nhóm môn học (科目グループ) | có | có (`RankingAverageReader` đổi sang nhóm thực tế theo môn của tiết rồi mới gọi hàm chung) | **không có** (giao diện chọn và `AverageRangeSourceStub` đều không xử lý) |

Mọi cột mà truy vấn của ba nhánh dùng đều có trong migration `20260825_grade_calc_fix.sql` của PR.

**File RA-001 đã đổi cho việc chuyển bộ đọc:** `GradeCalcResultEachSubSubjectLogs_m.php` và `GradeCalcResultEachGroupLogs_m.php` (chỉ hunk `getTotalData` của PR, bỏ khối `getRedScoreSourceMetric`), `GradeCalcResultService.php` (tham số `$use_fix_table` của `getTotalResults`, chú thích như PR), `RankingAverageReader.php` (viết lại cách đọc), `AutoRating.php` (truyền danh sách học sinh của tiết vào `prepare()`). Hunk của hai model và của `getTotalResults` giống chữ với PR nên gộp tự động.

## 5. Liên quan đến `getStudentCalcResults()`

- Cả ba nhánh không gọi hàm này trong code mới và không sửa nó (`git diff master...nhánh` không có thay đổi nào chạm hàm). Các nơi gọi có sẵn trên `master` không đổi: `ReportWidgetGradesNormalData`, `AdminNBGradeExtractionResultController`, `GradeCalcResultService::getByCalcGroupSubSubject`.
- Hàm này không dùng được cho trung bình cấp tập hợp: chỉ trả dòng thứ hạng của các `student_ids` được truyền vào nên không đếm được số học sinh có điểm; `avg_score` lưu sau khi làm tròn (`GradeCalc.php`, `calcPrecision`) trong khi Q3 yêu cầu số trước làm tròn. Đó là lý do hướng được đổi sang `getTotalResults()` / `getTotalData()`.

## 6. Cách RA-001 đọc sau khi chuyển

1. `AutoRating::calc` tạo `RankingAverageReader` (chỉ khi có thiết lập dùng trung bình) và gọi `prepare(trường, năm, danh sách học sinh của tiết)`. Danh sách là `format_student_list` đã có sẵn; reader gom học sinh theo khối.
2. Với mỗi điều kiện hoặc vế công thức, reader đổi nhóm đã chọn thành loại nhóm cụ thể (`hr_grade`, `homeroom`, `group`, `calc_group__<id>`, `calc_group_combo__<id>`; 科目グループ đổi theo môn của tiết), rồi kiểm `hasActiveFixedResult` cho (khối, học kỳ, thời kỳ): đủ bảy bảng bản chốt và có `grade_calc_fix_log.active = 1`. Không đạt thì không có trung bình.
3. Đạt thì gọi `getTotalResults(thiết lập, nhóm, học sinh cùng khối, [môn của tiết], khối, [học kỳ], [thời kỳ], năm, true)` **một lần cho mỗi tổ hợp** (thiết lập, nhóm, môn, khối, học kỳ, thời kỳ) và nhớ kết quả theo học sinh. Không gọi theo từng học sinh vì mỗi lần gọi hàm lấy thông tin học sinh trong hàm chung đóng và mở lại kết nối đọc.
4. Từ các dòng của học sinh, reader chọn dòng đúng: nhóm 授業 chỉ lấy dòng của tiết đang tính; các nhóm khác chỉ lấy dòng đúng `tangen_id` đang tính (kỳ không phải 単元 dùng 0). Tên thiết lập trùng ở nhiều chương trình học thì dùng thiết lập sau có kết quả, như trước.
5. Trung bình = `total_score` ÷ `student_count` bằng `bcdiv` scale 20. Không có dòng, hoặc `student_count` ≤ 0, thì trả `null` và phía gọi xử lý như thiếu trung bình (Q4, Q7).

## 7. Điểm cần kiểm khi chuyển và trạng thái

Hiện trạng của PR ở `9a91794106b` và cách RA-001 xử lý:

| Điểm | Hiện trạng trong PR | RA-001 sau khi chuyển | Còn lại |
| --- | --- | --- | --- |
| Điều kiện bản chốt hợp lệ | Hàm chung không kiểm `grade_calc_fix_log.active`; dựa vào việc hủy chốt và cập nhật xóa dữ liệu bản chốt cũ | Tự kiểm `active = 1` trước khi đọc (`hasActiveFixedResult`), giống nhánh 赤点. Trạng thái `stale` vẫn dùng bản chốt, giống `prepareRankLink` của PR | Hỏi người làm PR: có cần kiểm `active` trong hàm chung không. Khi PR gộp, cân nhắc thay `hasActiveFixedResult` bằng `GradeCalcFixLogRepository` để chỉ còn một nơi kiểm |
| Môi trường chưa có bảng | `$use_fix_table = true` không kiểm `table_exists`, lỗi SQL nếu chưa chạy migration | Kiểm bảy bảng, thiếu thì không có trung bình (đã thử đổi tên một bảng: trả rỗng, không lỗi SQL) | Hỏi người làm PR như dòng trên |
| Mẫu số | `student_count` đúng | Dùng `student_count`; số khớp truy vấn độc lập (mục 8) | Chạy lại AC-21 đến AC-24 sau khi PR gộp |
| Không lùi về số chưa chốt | Với `true` chỉ đọc bảng bản chốt | Giữ; không đọc số thường khi rỗng | — |
| Đơn nguyên (単元) | `getTotalData` chọn `tangen_id` nhưng không lọc | Reader lọc theo đơn nguyên đang tính; nhóm 授業 + kỳ 単元 thì không có trung bình | Hỏi người làm PR có lọc trong hàm chung không (EM-001 cũng cần) |
| Nhóm môn học | `getTotalResults` xử lý qua `calc_group_sub_subject` | Reader tự đổi theo môn của tiết rồi gọi bằng loại nhóm cụ thể | EM-001 chưa có 科目グループ |
| Nhóm kết hợp | Tra theo `grade_calc_group_item_ids` của học sinh | Khớp truy vấn độc lập | — |
| Hồi quy so với `getRedScoreSourceMetric` | — | Chưa chạy hai hàm trên cùng dữ liệu; số đã so với truy vấn SQL độc lập | So khi RC-001 chuyển |

Khi RC-001 và EM-001 chuyển, các hàm riêng có thể bỏ: `getRedScoreSourceMetric` (và hàm phụ) trong hai model của RC-001; `getFinalizedEach*TotalResult` trong `GradeCalcResultService` của EM-001.

## 8. Kết quả kiểm trên DB local (27/10/2026)

Dựng bảy bảng bản chốt từ migration của PR, chép dữ liệu từ bảng kết quả thường của một thiết lập (trường 2, năm 2026, khối 1), thêm hai dòng `grade_calc_fix_log` `active = 1` (1学期 (học kỳ 1) và 3学期 (học kỳ 3), thời kỳ 期末 (cuối kỳ)). Học sinh thử: hai học sinh cùng lớp chủ nhiệm 175219 (khối 1). Số đối chiếu lấy bằng truy vấn SQL độc lập trên bảng bản chốt.

| Nhóm (môn của tiết) | Tổng điểm ÷ số học sinh có điểm | Reader trả | Khớp |
| --- | --- | --- | --- |
| `学年毎` (khối), môn 10028 | 2180 ÷ 39 | 55,897435… | Có |
| `HR毎` (lớp 175219), môn 10028 | 1230 ÷ 25 | 49,2 | Có |
| Nhóm thứ hạng `文理`, môn 10028 | 195 ÷ 6 | 32,5 | Có |
| Nhóm kết hợp `【RC001】数学組合せ`, môn 10028 | 115 ÷ 5 | 23 | Có |
| `授業毎` (tiết học 3166623), 3学期 (học kỳ 3) | 62 ÷ 3 | 20,666666… | Có |
| Nhóm thứ hạng `コース` (học sinh không thuộc nhóm) | — | `null` | Có |
| Thiết lập chưa chốt (không có dòng `grade_calc_fix_log` `active = 1`) | — | `null` | Có |
| Đặt `active = 0` ở 1学期 (học kỳ 1) | — | `null` ở học kỳ 1, 3学期 (học kỳ 3) vẫn có số | Có |
| Đổi tên bảng `grade_calc_fix_each_group_total` | — | `null`, không lỗi SQL | Có |
| Tên thiết lập không tồn tại | — | `null` | Có |

So sánh với mốc bằng `compareAverage`: 55,897… `より小さい` (nhỏ hơn) 55,9 là đúng; 55,9 `以上` (từ trở lên) 55,9 là đúng; 55,9 `より大きい` (lớn hơn) 55,9 là sai.

Kiểm thêm các hàm của `AutoRating` trên cùng dữ liệu (gọi trực tiếp hàm, không chạy `AutoRating::calc`, không ghi điểm), học sinh có trung bình khối 55,897…:

| Hàm | Đầu vào | Kết quả |
| --- | --- | --- |
| `getRankingAverageMatchedStudentIds` | `以上` 55 / `より大きい` 55,9 / `より小さい` 55,9 | khớp / không khớp / khớp |
| | `等しい` (bằng) 55,8974 (số làm tròn của trung bình) | không khớp (so với số chưa làm tròn) |
| | thiết lập chưa chốt; mốc không phải số | không khớp |
| `filterTargetsAND` (nối AND) | `より大きい` 50 và `より小さい` 80 / `より大きい` 50 và `より小さい` 55 | khớp / không khớp |
| `filterTargetsOR` (nối OR cũ) | `より大きい` 80 hoặc `より小さい` 60 / `より大きい` 80 hoặc `より小さい` 50 | khớp / không khớp |
| `getCalcValue` (vế `科目平均`) | thiết lập đã chốt / chưa chốt | số thực 55,897… / `null` |
| `getformulas` | 55,897… × 2 / 55,897… × `null` | 111,79… / `null` |
| `useRankingAverage` | chỉ có điều kiện / chỉ có công thức / không có | có / có / không |

Migration của PR có thêm một lệnh `ALTER TABLE school_grade_conf ADD COLUMN use_relative_evaluation`; cột này đã được bỏ sau khi kiểm để DB local về như trước.

Lần gọi thứ hai với cùng điều kiện dùng bộ nhớ đệm, không gọi lại hàm chung (45 lần gọi mất 0,0003 giây). Đã dọn bảng và dữ liệu thử sau khi kiểm. Bốn bảng `grade_calc_fix_*_bak` có sẵn từ 06/10 trong DB local không thuộc việc này và không đổi.

## 9. Gộp thử với PR 57058 và các nhánh khác (chạy thử, 27/10/2026)

Đầu nhánh: PR `9a91794106b`, RC-001 `6e44cbfd2a0` (22/10), EM-001 `14a355bfded` (22/10). RA-001 là `55edefea7cf` cộng thay đổi chưa commit (gộp thử bằng commit tạm từ `git stash create`, không đổi nhánh).

| Gộp RA-001 với | Xung đột chữ | Ghi chú |
| --- | --- | --- |
| PR 57058 | 2 file, mỗi file 1 chỗ: `AutoRating.php` (khối `unset`: RA bỏ `each_sub_subject_result` và thêm `ranking_average_reader`, PR thêm ba biến `rank_link_*`), `AutoRatingConfController.php` (RA chèn các hàm kiểm tra mới ngay trước hàm mà PR đổi chữ ký) | Giữ cả hai bên ở cả hai chỗ. Hai model, `GradeCalcResultService.php`, `AutoRatingConfItemRepository.php`, `edit.php`, `edit_formula.php` tự gộp. Import `GradeCalcResultService` ở `AutoRating.php` đã có (commit `55edefea7cf`) nên `prepareRankLink` của PR không lỗi thiếu class |
| RC-001 | Không | Nhánh RC-001 giữ `getRedScoreSourceMetric` của nó; sau khi gộp hai nhánh cùng tồn tại, không trùng khai báo |
| EM-001 | 1 file, 2 chỗ: `AutoRating.php` (khối `unset`; khối chuẩn bị, chỗ RA thay đoạn gom tên thiết lập bằng `useRankingAverage`) | Khi giải xung đột phải giữ phần EM-001 còn dùng (`GradeCalcResultService`, `calc_group_map`, biến `average_range_*`) |

Kết quả gộp thử RC-001 và EM-001 trước đó (22/10, trước khi chuyển bộ đọc) về `m_AutoRatingConfItemRegistType.php` (EM-001 mã loại 9, PR mã 8) không đổi.

## 10. Chưa kiểm

- Chưa chạy `AutoRating::calc` đầu cuối với thiết lập có điều kiện hoặc công thức dùng trung bình sau khi chuyển bộ đọc; chưa chạy giao diện của PR.
- Chưa so `getTotalResults(..., true)` với `getRedScoreSourceMetric` trên cùng dữ liệu (chỉ đối chiếu với SQL độc lập).
- Chưa đo thời gian trên dữ liệu lớn. Mỗi tiết gọi hàm chung theo từng tổ hợp, và mỗi lần hàm chung đóng, mở lại kết nối đọc; batch nhiều tiết sẽ nhân lên.
- Đầu RC-001 và EM-001 ở trên là ngày 22/10; hai nhánh còn thay đổi.
- Ảnh chụp trao đổi 27/10 không có URL; nội dung ghi lại từ ảnh.
- PR còn là WIP, có thể đổi.
