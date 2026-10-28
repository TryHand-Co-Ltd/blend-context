# RA-001 — Rà soát code và màn hình sau khi chuyển bộ đọc (27/10/2026)

**Loại tài liệu:** topic research, kết quả rà soát code. Không phải nguồn yêu cầu nghiệp vụ; quy tắc nghiệp vụ nằm ở [CONTEXT](../CONTEXT.md) và [đặc tả](../docs/specification.vi.md). Các mục "đề xuất" chưa được duyệt và chưa sửa vào code.

**Code đã rà:** repository `blend`, nhánh `feature/RA-001_ranking_average` tại `55edefea7cf` cộng thay đổi chưa commit ngày 27/10/2026 (16 file so với điểm gốc `85986a865497`), đối chiếu với PR 57058 ở `9a91794106b`.

**Cách rà:** đọc toàn bộ diff; chạy thử `RankingAverageReader` và các hàm của `AutoRating` trên bảng bản chốt dựng ở DB local (số liệu ở [research bộ đọc, mục 8](confirmed-result-reader.vi.md#8-kết-quả-kiểm-trên-db-local-27102026)); một agent độc lập đọc riêng phần màn hình (controller, view, repository), sau đó từng phát hiện được đối chiếu lại với code. Chưa chạy giao diện trên trình duyệt (không có tài khoản đăng nhập local) và chưa chạy `AutoRating::calc` đầu cuối.

## 1. Kết luận

- Không thấy lỗi làm sai số trung bình hoặc kết quả so với mốc. Số khớp truy vấn SQL độc lập; chưa chốt, hủy chốt, thiếu bảng đều ra "không có trung bình" như Q2, Q4, Q7.
- Có **một rủi ro phát hành** ở hai trường Uenomiya (mục 3, R1) và **một lỗ hổng hiển thị** nằm sẵn trong màn nhật ký, nay có thêm nguồn đưa dữ liệu vào (mục 3, B1).
- Còn lại là lỗi nhỏ ở màn hình và kiểm tra khi lưu, chỉ gặp khi dữ liệu đặc biệt hoặc khi sửa request.

## 2. Đối chiếu với context và PR 57058

| Yêu cầu | Trong code | Kiểm bằng |
| --- | --- | --- |
| Q1: không thêm **科目平均** (trung bình môn) vào **[基準値]** (giá trị gốc) của ánh xạ | Ô giá trị gốc không đổi; công thức dưới ánh xạ dùng chung bảng công thức | Đọc diff |
| Q2: chỉ bản đã chốt | `hasActiveFixedResult` + `getTotalResults(..., true)`; không có đường lùi về số mới nhất | Chạy thử (chưa chốt, `active = 0`, thiếu bảng) |
| Q3: số chưa làm tròn, mẫu số = số học sinh có điểm | `total_score` ÷ `student_count` bằng `bcdiv`; so mốc bằng `bccomp` | Chạy thử (mốc 55,8974 `等しい` không khớp số 55,897…) |
| Q4: không tính được thì ghi trống | Vế `科目平均` trả `null`, `getformulas` trả `null` | Chạy thử (`getCalcValue`, `getformulas`) |
| Q5: nhóm như PR 57058, thêm `授業平均` | Dropdown thêm `学年平均`, `HR平均`, `授業平均`, nhóm thứ hạng, nhóm kết hợp, nhóm môn học | Chạy thử năm loại nhóm |
| Q6: nhiều mốc AND | `filterTargetsAND` giao các tập; hai dòng cùng nguồn gộp vào một danh sách | Chạy thử (`50 <` & `< 80` khớp, `50 <` & `< 55` không khớp) |
| Q7: thiếu trung bình thì điều kiện không khớp | Hàm trả tập rỗng, thiết lập phía dưới được xét | Chạy thử |
| Dùng chung bộ đọc với PR 57058 | Hai model và `getTotalResults` giống chữ với PR; gộp tự động | `git merge-tree` |

Tiêu chí nghiệm thu đã có bằng chứng chạy thử: AC-06, AC-08, AC-21, AC-22 (một phần: chưa chốt và hủy chốt), và phần so với số chưa làm tròn của AC-06. **Chưa có bằng chứng chạy:** AC-01 đến AC-05, AC-07, AC-09 đến AC-20, AC-23, AC-24 (ca `examinees` khác số học sinh có điểm).

## 3. Phát hiện

R là rủi ro phát hành; B là lỗi; N là điểm nhỏ. "Đã xác minh" nghĩa là đã đọc lại code hoặc chạy thử sau khi agent báo.

| Mã | Mức | Nội dung | Tình huống | Đề xuất | Trạng thái |
| --- | --- | --- | --- | --- | --- |
| R1 | Cao khi phát hành | Công thức **科目平均** đã lưu của **上宮高等学校** và **上宮学園中学校** trước đây đọc bảng kết quả thường (`GradeCalcResultService::getEachSubSubjectTotalResult`, bảng `grade_calc_result_*`); nay chỉ đọc bản đã chốt (Q2) | Kỳ nào chưa chốt thì công thức ghi trống và xóa điểm đang có. DB local có 294 thiết lập đang bật của trường cấp 2 và 644 của trường cấp 3 (DB thật chưa đếm) | Báo shite và nhà trường trước khi phát hành; chỉ phát hành sau khi hai trường đã dùng chức năng chốt | Đã xác minh. Đã ghi vào [đặc tả mục 15](../docs/specification.vi.md#out) và sửa AC-02 |
| R2 | Trung bình | Hàm chung của PR 57058 không kiểm `grade_calc_fix_log.active`, không kiểm bảng bản chốt tồn tại, không lọc đơn nguyên (単元); RA-001 tự bù cả ba | Nếu người làm PR đổi hàm chung mà không báo, hành vi của RA-001 và hai nhánh còn lại có thể lệch | Hỏi người làm PR; khi PR gộp, cân nhắc dùng `GradeCalcFixLogRepository` thay cho `hasActiveFixedResult` | Đã xác minh |
| B1 | Trung bình | Màn nhật ký tự động tính in không escape tên do quản trị đặt: `_log_modal.php` dòng 250 (`nl2br($condition_text)`) và các dòng 273, 282, 305, 314 (`*_formula_type_name`); `AdminNBGradeSettingSystemLessonController::getLog` không `html_escape`. Mẫu không escape này **đã có sẵn** (`setting_name` cũng in thô). RA-001 thêm hai nguồn: câu điều kiện **平均点** (`AutoRatingConfItemRepository`) và nhãn **科目平均** (`AutoRating::formatDetailLog`), nhãn này nay mở cho mọi trường | Tên 順位集計設定, nhóm hoặc học kỳ/thời kỳ chứa thẻ HTML được lưu hợp lệ (kiểm tra khi lưu lấy tên từ cùng danh sách); người mở nhật ký chạy đoạn script | Escape từng đoạn tên khi dựng câu (giữ `<br>` do `nl2br` tạo); hoặc escape ở nơi in cho các trường này | Đã xác minh mẫu không escape bằng đọc code. **Đã sửa 27/10/2026**: escape tên trong câu điều kiện (chế độ nhật ký) và ở bốn chỗ in nhãn của `_log_modal.php`; chưa khai thác thử |
| B2 | Thấp | Kiểm tra mốc dùng `$` nên chuỗi `"50\n"` qua được và lưu kèm ký tự xuống dòng; `"007"` lưu và hiện `007点` (`AutoRatingConfController::rankingAverageConditionValidate`) | Chỉ khi sửa request (ô số của giao diện không gửi các giá trị này) | Dùng `\z` hoặc cờ `D` trong biểu thức chính quy; chuẩn hóa số 0 đầu | Đã xác minh bằng chạy thử. **Đã sửa 27/10/2026**: dùng `\z`, không nhận số 0 đầu (chạy thử `"50\n"`, `"007"`, `"1000000"` bị từ chối) |
| B3 | Thấp | Gửi mảng vào `jouken-b`, `jouken-c` hoặc `*_calc_conf_name`, `*_sub_subject_avg` làm `strlen()` ném `TypeError` (lỗi 500); thiếu `jouken-b`/`jouken-c` sinh cảnh báo thiếu khóa, chữ HTML của cảnh báo đứng trước JSON nên màn hình báo lỗi im lặng | Chỉ khi sửa request | Kiểm `is_string` trước `strlen`; dùng `isset` khi đọc `jouken-b`, `jouken-c` | Đã xác minh. **Đã sửa 27/10/2026**: `is_string`, `??` |
| B4 | Thấp | Dòng cũ lưu cách nối OR: `edit_condition.php` nói "全て" (tất cả điều kiện), nhưng `filterTargetsOR` coi các dòng **平均点** là một trong các điều kiện. Ví dụ `50 <` hoặc `< 80` khớp mọi học sinh có trung bình | Chỉ dòng cũ đã lưu OR (form không cho chọn OR). Đặc tả mục 5.2 đã chấp nhận giữ nghĩa; DB local có 676 dòng đang bật có từ 2 điều kiện | Giữ như đặc tả; cân nhắc hiện ghi chú ở dòng OR; đếm trên DB thật trước khi phát hành | Đã xác minh |
| N1 | Thấp | Tên nhóm trùng nhau giữa nhóm thứ hạng, nhóm kết hợp, nhóm môn học chỉ hiện một mục trong dropdown (`isset` bỏ mục sau); khi tính, bộ đọc ưu tiên nhóm kết hợp, rồi nhóm thứ hạng, rồi nhóm môn học | Chỉ khi hai loại nhóm cùng tên | Giữ (khớp ưu tiên của code Uenomiya cũ); ghi vào hướng dẫn nếu gặp | Đã xác minh |
| N2 | Thấp | Tên nhóm có dấu phẩy ASCII (`,`) làm khóa lưu có 4 phần: danh sách không hiện nhãn, bộ đọc trả `null`, dropdown vẫn cho chọn và kiểm tra khi lưu vẫn chấp nhận | Tên nhóm có dấu phẩy | Loại mục có dấu phẩy khỏi dropdown, hoặc báo lỗi khi lưu | Đã xác minh |
| N3 | Thấp | Nhãn dấu bằng: dropdown hiện 「と等しい」 (dùng chung hằng với ánh xạ), đặc tả màn hình và Figma ghi 「等しい」; dropdown không có mục trống nên dấu mặc định là **以上** | Mọi người dùng thấy nhãn khác thiết kế | Chọn một bên và sửa bên kia | Đã xác minh. **Chốt 27/10/2026: dùng `と等しい`**; đã sửa tài liệu, Figma chưa sửa |
| N4 | Thấp | Nhãn **科目平均** trong nhật ký hiện chữ thô `…/学年毎`, `…/授業毎`; danh sách hiện `学年平均`, `授業平均` | Chỉ hiển thị | Dùng `subSubjectAvgLabel` ở cả hai nơi | Đã xác minh. **Đã sửa 27/10/2026** |
| N5 | Thấp | `$this->sub_subject_avg_options` (controller) và các thuộc tính của `RankingAverageReader` không khai báo; PHP 8.2 cảnh báo thuộc tính động (container local chạy PHP 8.2.35). Toàn codebase có cùng mẫu | Tùy cấu hình báo lỗi | Khai báo thuộc tính ở lớp mới | Đã xác minh |
| N6 | Thấp | `getSubSubjectAvgForFormula()` gọi `GradeCalcConf_m::getByYear` (kèm truy vấn phụ) chỉ để lấy tên; chạy mỗi lần mở `edit_condition`, `edit_formula` của mọi trường và một lần khi kiểm tra | Chậm nhẹ khi mở màn | Có thể lấy riêng danh sách tên | Theo đọc code |
| N7 | Thấp | `html_escape` tùy biến của ứng dụng trả lại thẻ `<a ...>` nguyên dạng khi chuỗi có `http(s)://` (`system/core/Common.php`); dùng trong thuộc tính `value="…"` thì không phải bảo đảm tuyệt đối | Có sẵn ở mọi `<option value>` của ứng dụng, không riêng RA-001 | Ngoài phạm vi RA-001 | Đã xác minh bằng đọc code |
| N8 | Thấp | Dropdown kỳ/nhóm không phụ thuộc thiết lập thứ hạng đã chọn: nhóm lấy theo cấu hình cả năm (`grade_calc_detail_conf`) | Có thể chọn nhóm mà thiết lập đó không có kết quả; khi tính thì không có trung bình | Đang chờ xác nhận ở [đặc tả mục 11](../docs/specification.vi.md#population) | Đã xác minh |

## 4. Đã kiểm, không thấy lỗi

- Lưu: dòng **平均点** theo số dòng nên `jouken-d`, `jouken-e` đi đúng cặp; `pickConditionFields` không để giá trị của loại trước lẫn vào; dấu kiểm theo danh sách cho phép; mốc không nhận số mũ, dấu hay quá 6 chữ số nguyên, 4 chữ số lẻ; `.5` đổi thành `0.5`; tham chiếu kiểm theo danh sách của đúng trường và năm; tham chiếu đã đổi tên hoặc xóa buộc chọn lại mới lưu được.
- Khớp định dạng lưu và engine: repository dựng `ranking_average => "tên,kỳ,thời kỳ,nhóm"` với giá trị `{calc_conf_name, sub_subject_avg, operator, threshold}`; `AutoRating` đọc đúng các khóa này; mã dấu 1 đến 5 khớp `compareAverage`.
- Escape: giá trị escape một lần; khóa mảng được escape riêng; không escape hai lần; giải mã `textarea` khi khôi phục đối xứng; trang danh sách escape đầy đủ; thông báo lỗi không chứa dữ liệu người dùng.
- JavaScript: đặt tên theo số dòng đúng, bản mẫu nằm ngoài form, ô thiết lập thứ hạng chuyển sang `.second_filter`, đổi loại dòng xóa điều khiển cũ, `ALLOW_MULTIPLE_FILTER` xử lý trong `resetOption`, thêm dòng công thức đặt lại ô `科目平均` và ẩn cảnh báo, đổi loại vế xóa giá trị `科目平均`.
- Bỏ giới hạn trường: không còn kiểm `uenomiya_id` ở các đường tự động tính; `registFormula` giữ khóa `calc_conf_name`, `sub_subject_avg`; token `学年毎`, `HR毎` giữ qua hằng; dòng cũ thiếu khóa vẫn mở được.
- Nơi khác đọc điều kiện/công thức: chuyển năm học (`output_data.php::setCondition`) không đụng tham chiếu theo tên, đúng; xuất SQL và màn quản lý không phân tích điều kiện; `DeleteAssociatedDm` không phân tích điều kiện; thêm vào `SELECT_TYPES` chỉ ảnh hưởng điều kiện ngoại lệ của ánh xạ (luôn rỗng).
- Bảo mật: có mã CSRF ở hai form; `checkAuthority('manage')` ở hàm khởi tạo; kiểm quyền theo trường không đổi.
- Bố cục: bộ chọn `.ranking_average_area` thắng `.d_none` theo độ ưu tiên CSS và nằm ngoài `.check_area`; ba ô chọn 180px + 10px + 180px nằm trong `.select_area` rộng 400px.

## 5. Còn mở

- Chạy `AutoRating::calc` đầu cuối và nút 自動算出実行 (chạy tính điểm tự động) sau khi chuyển bộ đọc; chạy giao diện **計算対象設定** (thiết lập đối tượng được tính) và **登録方法設定** (thiết lập cách đăng ký) trên trình duyệt, kiểm lỗi console.
- Quyết định xử lý B1 và B2 trước khi phát hành, và R1 với shite.
- Chạy lại mọi mục ở mục 2 trên bản chốt thật sau khi PR 57058 gộp.

## Kiểm thử trực tiếp trên trình duyệt (27/10/2026, DB local)

- Màn hình danh sách điều kiện, `edit_condition`, `edit_formula` của cấu hình tự động tính: hiển thị và khôi phục đúng `平均点` / `科目平均`; dropdown 平均点 vẫn dùng được khi có nhiều dòng; `授業平均` không hiện khi detail conf tắt; dòng mới bỏ trống bị báo lỗi; giá trị bị sửa tay (`"50\n"`, `"007"`, `"1e3"`, mảng) bị từ chối, không có lỗi 500. Console chỉ có lỗi cũ của thẻ audio, không liên quan.
- E2E: lưu lớp `3264122` (1年2組 数学Ⅰ) với dữ liệu 確定 giả lập: `auto_rating_log` ghi right_value `55.8974358974359` (= 2180 ÷ 39). Học sinh có 素点 cho ra công thức 140.897… → mapped 5. Học sinh không có 素点 cho `formula_result` null (đúng Q4/Q7, để trống).
- Quan sát giao diện: ở độ rộng khung hẹp, dòng 平均点 tràn mép phải; ở 1400px thì vừa. Mức độ thấp.
- Dữ liệu local đã khôi phục sau test (grades, auto_rating_log, bảng fix tạm, cột `use_relative_evaluation`). Dữ liệu EM-001 loại 9 còn sót ở local làm lỗi lưu lớp khi chạy code RA, không phải lỗi của RA.
