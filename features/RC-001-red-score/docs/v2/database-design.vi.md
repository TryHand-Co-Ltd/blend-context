# Thiết kế cơ sở dữ liệu — Chức năng điểm đỏ

Ngày: **30/09/2026**.

Phương án thiết kế dùng hai bảng mới cho quy tắc và kết quả xét, đồng thời mở rộng bảng mục công khai và bảng mục trên khung đánh giá hiện hữu.

## 1. Tổng quan và quan hệ

| Bảng | Mục đích | Đơn vị lưu trữ |
| --- | --- | --- |
| `red_score_settings` | Lưu điều kiện áp dụng, độ ưu tiên và ngưỡng điểm đỏ | Một quy tắc của một mục trên khung đánh giá, trong một trường và năm học |
| `red_score_results` | Lưu kết quả và trạng thái xét dùng chung cho trích xuất, công khai và phiếu điểm | Một trạng thái hiện hành của một ô điểm |
| `grade_publish_conf_grade_items` (mở rộng) | Lưu hiệu ứng hiển thị điểm đỏ | Cấu hình công khai, năm, mục đánh giá, phân loại thường/đơn vị |
| `grade_evaluate_frame_items` (mở rộng) | Quản lý phiên bản danh sách quy tắc điểm đỏ | Một mục trên khung đánh giá |

Một mục có nhiều quy tắc; một quy tắc có thể áp dụng cho nhiều ô. Kết quả lưu ID quy tắc đã chọn, hoặc `NULL` nếu không chọn được.

### 1.1. Khóa nhận diện ô điểm

```text
school_id + year + evaluate_frame_item_id + group_id + student_id + tangen_id
```

Mỗi khóa có một dòng kết quả hiện hành. `tangen_id=0` cho điểm thường; khác đơn vị là khác ô. Frame item xác định mục, kỳ/thời điểm và cột điểm trong `grades`.

### 1.2. Liên kết với dữ liệu hiện có

| Trường | Dữ liệu tham chiếu |
| --- | --- |
| `school_id` | `school.id` |
| `year` | Năm học của dữ liệu; không phải khóa ngoại |
| `evaluate_frame_item_id` | `grade_evaluate_frame_items.id` |
| Mục/kỳ/thời điểm của ô | `grade_evaluate_frame_items.evaluate_item_id`, `save_period_id`, `save_term_id` |
| Cột điểm | `grade_evaluate_items.grades_column` |
| `group_id` | `groups.id`; cùng lớp học phần với `grades.group_id` |
| `student_id` | `students.id`; cùng học sinh với `grades.student_id` |
| `tangen_id` khác 0 | `weekly_plan_curriculum_tangens.id` |
| `period_id` / `term_id` của nguồn trung bình | `period.id` / `term.id` |
| `grade_calc_conf_id` | `grade_calc_conf.id` |
| `population_ref_id` | `grade_calc_groups.id`, `grade_calc_group_combos.id` hoặc `grade_calc_group_sub_subjects.id`, tương ứng loại 3/4/6 |
| `red_score_setting_id` | `red_score_settings.id` |
| `created` / `updated` | ID người tạo/cập nhật theo cơ chế ghi nhận người thao tác hiện có |

Kỳ/thời điểm nguồn trung bình được chọn riêng; môn, mục và đơn vị phải đúng phạm vi. Ứng dụng kiểm soát liên kết, không khai báo foreign key.

## 2. Định nghĩa bảng

### 2.1. `red_score_settings`

| Cột | Kiểu | NULL | Mặc định | Nội dung |
| --- | --- | --- | --- | --- |
| `id` | BIGINT UNSIGNED | Không | Tự tăng | Khóa chính của quy tắc |
| `school_id` | INT UNSIGNED | Không | — | Trường sở hữu |
| `year` | INT UNSIGNED | Không | — | Năm học |
| `evaluate_frame_item_id` | CHAR(32) | Không | — | Mục trên khung đánh giá |
| `setting_name` | VARCHAR(255) | Không | — | Tên nhận biết quy tắc; không dùng làm khóa |
| `sort_no` | INT UNSIGNED | Không | — | Thứ tự ưu tiên; số nhỏ được xét trước |
| `compare_type` | TINYINT UNSIGNED | Không | — | Dấu so sánh điểm với ngưỡng |
| `threshold_type` | TINYINT UNSIGNED | Không | — | Loại ngưỡng |
| `threshold_value` | DECIMAL(9,3) | Có | NULL | Ngưỡng cố định hoặc phần trăm |
| `apply_condition` | TEXT | Có | NULL | JSON điều kiện áp dụng; SQL NULL nghĩa toàn bộ đối tượng trong phạm vi của mục |
| `period_id` | INT UNSIGNED | Có | NULL | Học kỳ của nguồn trung bình trong công thức |
| `term_id` | INT UNSIGNED | Có | NULL | Thời điểm của nguồn trung bình trong công thức |
| `grade_calc_conf_id` | CHAR(32) | Có | NULL | Thiết lập tổng hợp của nguồn trung bình |
| `population_type` | TINYINT UNSIGNED | Có | NULL | Loại nhóm tham chiếu |
| `population_ref_id` | CHAR(32) | Có | NULL | ID cấu hình của loại 3/4/6; loại 1/2/5 là NULL |
| `formula` | TEXT | Có | NULL | JSON các bước tính ngưỡng và làm tròn từng bước |
| `round_flg` | TINYINT UNSIGNED | Có | NULL | Bật/tắt xử lý phần lẻ của loại tỷ lệ maximum |
| `round_type` | TINYINT UNSIGNED | Có | NULL | Cách xử lý phần lẻ |
| `round_digits` | TINYINT UNSIGNED | Có | NULL | Vị trí chữ số cần xử lý |
| `setting_status` | TINYINT UNSIGNED | Không | 0 | 0: đang thiết lập/vô hiệu; 1: hoàn chỉnh, có hiệu lực; 2: đã xóa |

| `created_at` | TIMESTAMP | Không | CURRENT_TIMESTAMP | Thời điểm tạo |
| `created` | INT | Không | — | Người tạo |
| `updated_at` | TIMESTAMP | Có | NULL | Thời điểm cập nhật gần nhất |
| `updated` | INT | Có | NULL | Người cập nhật gần nhất |

### 2.2. `red_score_results`

| Cột | Kiểu | NULL | Mặc định | Nội dung |
| --- | --- | --- | --- | --- |
| `id` | BIGINT UNSIGNED | Không | Tự tăng | Khóa chính |
| `school_id` | INT UNSIGNED | Không | — | Trường sở hữu ô điểm |
| `year` | INT UNSIGNED | Không | — | Năm học |
| `evaluate_frame_item_id` | CHAR(32) | Không | — | Mục trên khung đánh giá |
| `group_id` | INT UNSIGNED | Không | — | Lớp học phần |
| `student_id` | INT UNSIGNED | Không | — | Học sinh |
| `tangen_id` | INT UNSIGNED | Không | 0 | Đơn vị bài học; 0 cho điểm thường |
| `cell_generation` | CHAR(32) | Không | — | Token thế hệ mới khi tạo/tạo lại ô; không tái sử dụng |
| `write_version` | BIGINT UNSIGNED | Không | 0 | Phiên bản đặt chỗ/ghi mới nhất của ô |
| `judged_version` | BIGINT UNSIGNED | Có | NULL | Phiên bản đặt chỗ của kết quả đã lưu gần nhất |
| `rule_revision` | BIGINT UNSIGNED | Có | NULL | Phiên bản danh sách quy tắc được dùng trong lần xét đã lưu |
| `red_score_setting_id` | BIGINT UNSIGNED | Có | NULL | Quy tắc được chọn trong lần xét |
| `judgment_status` | TINYINT UNSIGNED | Có | NULL | Trạng thái lần xét hoàn tất gần nhất; NULL nếu mới đặt chỗ lần đầu |
| `is_red` | TINYINT UNSIGNED | Có | NULL | Kết luận đỏ/không đỏ khi xét thành công |
| `reason_code` | VARCHAR(32) | Có | NULL | Mã nguyên nhân khi chưa có kết luận |
| `judgment_context` | TEXT | Có | NULL | JSON thông tin dữ liệu được dùng trong lần xét |
| `judged_at` | DATETIME | Có | NULL | Thời điểm hoàn tất lần xét đã lưu; NULL khi chưa từng xét |
| `created_at` | TIMESTAMP | Không | CURRENT_TIMESTAMP | Thời điểm tạo dòng |
| `created` | INT | Không | — | Người tạo |
| `updated_at` | TIMESTAMP | Có | NULL | Thời điểm cập nhật dòng gần nhất |
| `updated` | INT | Có | NULL | Người cập nhật gần nhất |

### 2.3. Khóa và chỉ mục

| Bảng | Khóa/chỉ mục | Cột | Mục đích |
| --- | --- | --- | --- |
| settings | PRIMARY KEY | `id` | Định danh quy tắc |
| settings | `idx_red_score_settings_01` | `school_id, year, evaluate_frame_item_id, setting_status, sort_no` | Đọc quy tắc có hiệu lực theo mục và thứ tự |
| results | PRIMARY KEY | `id` | Định danh dòng kết quả |
| results | `uk_red_score_results_01` | `school_id, year, evaluate_frame_item_id, group_id, student_id, tangen_id` | Một dòng hiện hành cho một ô |
| results | `idx_red_score_results_01` | `school_id, year, group_id, student_id` | Đọc kết quả theo trường/năm/lớp/học sinh |

Hai bảng dùng InnoDB, `utf8mb4` và `utf8mb4_general_ci` cấp bảng. ID CHAR(32) là mã hex canonical, phải tương thích identity/cách so sánh của bảng nguồn; không thay đổi ID nguồn.

## 3. Dữ liệu JSON

Cột bổ sung trên bảng hiện hữu: `red_score_display_type TINYINT UNSIGNED NOT NULL DEFAULT 0` trên mục công khai, và `red_score_revision BIGINT UNSIGNED NOT NULL DEFAULT 0` trên mục khung đánh giá. Hiệu ứng được định nghĩa tại mục 5, phiên bản tại mục 6. Không đổi kiểu/key/collation hiện có và không thêm index hoặc foreign key.

### 3.1. Bộ thông tin nguồn

Bộ nguồn gồm `period_id`, `term_id`, `grade_calc_conf_id`, `population_type` và `population_ref_id`. Cấu trúc này dùng ở các cột nguồn của công thức và trong `apply_condition`.

| `population_type` | Nhóm tham chiếu | `population_ref_id` | Cách xác định nhóm cụ thể |
| --- | --- | --- | --- |
| 1 | Khối | NULL | Khối của học sinh trong năm học |
| 2 | Lớp chủ nhiệm | NULL | Lớp chủ nhiệm của học sinh trong năm học |
| 3 | Nhóm tổng hợp | `grade_calc_groups.id` | Thành viên trong `grade_calc_group_members` xác định `grade_calc_group_item_id` |
| 4 | Tổ hợp nhóm | `grade_calc_group_combos.id` | Các loại nhóm trong `grade_calc_group_combo_items` và nhóm thành viên tương ứng |
| 5 | Lớp học（授業） | NULL | Kết quả tổng hợp theo lớp ứng với `group_id` của ô đang xét |
| 6 | Nhóm môn học（科目グループ） | `grade_calc_group_sub_subjects.id` | Dùng cấu hình riêng của môn, nếu không có thì default đã lưu, để phân giải thành loại 1–5 và nhóm thực tế |

Bảng này mô tả kiểu lưu, không yêu cầu luôn hiển thị sáu lựa chọn. Khối/HR/lớp học chỉ được chọn khi `grade_calc_detail_conf.use_calc_hr_grade`, `use_calc_homeroom`, `use_calc_group` tương ứng bằng 1 trong trường/năm. Nhóm tổng hợp, tổ hợp và nhóm môn có cấu hình tương ứng trong trường/năm thì được chọn bằng tên đã đặt, độc lập với ba cờ trên. Dù cả ba cờ bằng 0, không vì thế mà ẩn hoặc từ chối chọn/lưu nhóm đã cấu hình. Không thêm công tắc tổng hợp riêng phía điểm đỏ.

Theo mẫu Thiết lập công khai thành tích（成績公開設定）, chọn Thiết lập tổng hợp thứ hạng（順位集計設定） rồi chọn Đối tượng tổng hợp（集計対象）. Giữ trường thời kỳ hiện có; cùng `grade_calc_conf_id` được dùng để đọc kết quả tương ứng loại đã chọn. Áp dụng luồng chọn cho cả điều kiện và công thức nhưng lưu nguồn độc lập. Không thêm trường thứ hạng, tên hiển thị hoặc biểu đồ từ màn ví dụ vào form điểm đỏ.

UI và kiểm tra lưu phía server dùng điều kiện khả dụng theo từng nhóm như trên; từ chối lựa chọn trực tiếp không khả dụng hoặc ID ngoài trường/năm. Nếu chính tham chiếu đã lưu trở nên không hợp lệ, không âm thầm đổi loại; lần xét tiếp theo ghi `source_invalid`. Thay đổi cấu hình đơn thuần không xóa kết quả trước. Nhóm cấu hình chọn được nhưng chưa có kết quả hợp lệ thì ghi `source_missing`; khả năng chọn khác với việc nguồn đã có dữ liệu. Kiểm default nhóm môn tồn tại, đúng loại/quyền và quan hệ tham chiếu, nhưng không dùng ba cờ khối/HR/lớp học để chặn chọn chính nhóm môn. Không cho tham chiếu đệ quy tới nhóm môn khác.

Loại 5 phải khớp cả lớp, không chỉ môn. Loại 6 giữ cả ID nhóm môn đã chọn và loại/nhóm được phân giải rồi đọc nhánh tổng hợp tương ứng. Điều kiện áp dụng và công thức dùng cùng cấu trúc nguồn nhưng lưu lựa chọn độc lập.

Dùng ID thay tên nhóm và xác định đúng trường/năm/kỳ/nhóm/môn/mục/đơn vị. Ưu tiên bản chốt; chỉ khi chưa có bản chốt tương ứng mới dùng kết quả hoàn tất mới nhất. Thiếu hoặc mâu thuẫn dữ liệu thì chưa xét được, không tự đổi nhóm/bản nguồn.

Tỷ lệ nhóm kế thừa kết quả tổng hợp hiện có trước làm tròn; không tính trung bình tỷ lệ cá nhân riêng. Không chặn cấu hình hoặc dừng xử lý chỉ vì các lớp khác maximum.

### 3.2. `apply_condition`

`apply_condition` gồm `filters` và `aggregate_conditions`. Mỗi filter có `type`, `values` không rỗng và `key_id` khi loại yêu cầu. Mỗi điều kiện tổng hợp có `metric=average|group_rate`, `operator=lt|lte|gte|gt`, mốc `value` dạng chuỗi thập phân và bộ `source` tại mục 3.1. Mốc tỷ lệ nằm trong 0–100; các dấu lần lượt là <, ≤, ≥, >.

| `filters[].type` | Nội dung `values` | `key_id` |
| --- | --- | --- |
| `hr_grade` | Số khối | Không sử dụng |
| `subject` | `subjects.id` | Không sử dụng |
| `sub_subject` | `sub_subjects.id` | Không sử dụng |
| `group` | `groups.id` | Không sử dụng |
| `homeroom` | `homerooms.id` | Không sử dụng |
| `calc_group` | `grade_calc_group_items.id` | `grade_calc_groups.id` |
| `choice` | Chuỗi mã lựa chọn của mục, không phải tên hiển thị | `grade_evaluate_frame_items.id` |

Các giá trị trong `values` và các phần tử cùng `type` dùng OR, kể cả khác key; giữ key gắn với từng giá trị. Khác type dùng AND; các `aggregate_conditions` kết hợp AND với nhau và với filters. Cùng type/key thì gộp values và bỏ trùng. Không lưu AND/OR lồng nhau.

OR cùng loại áp dụng cho bộ lọc đối tượng thông thường. Các điều kiện trung bình/tỷ lệ nhóm dùng AND với nhau, kể cả nhiều dòng cùng metric, rồi AND với kết quả bộ lọc. Hướng dẫn màn hình phân biệt hai cách kết hợp này. Ví dụ `A≥50 AND A<70` biểu diễn `50≤A<70`: 40/70 không thỏa, 50/60 thỏa.

Ví dụ: khối 1 hoặc 2 và nhóm A hoặc B được hiểu là `(khối 1 OR khối 2) AND (A OR B)`, kể cả A/B có key khác nhau.

Ví dụ áp dụng cho lớp học phần 201 khi tỷ lệ nhóm từ 65% trở lên:
```json
{
  "filters": [{"type": "group", "values": [201]}],
  "aggregate_conditions": [
    {
      "metric": "group_rate",
      "operator": "gte",
      "value": "65",
      "source": {
        "period_id": 1,
        "term_id": 2,
        "grade_calc_conf_id": "11111111111111111111111111111111",
        "population_type": 3,
        "population_ref_id": "22222222222222222222222222222222"
      }
    }
  ]
}
```

ID trong các ví dụ chỉ minh họa cấu trúc dữ liệu.

SQL NULL nghĩa toàn bộ phạm vi của mục. Từ chối JSON null, chuỗi/object rỗng, khóa lạ hoặc cả hai array rỗng.

OR có một nhánh khớp là đủ; AND có một nhánh không khớp thì loại. Chưa đủ thông tin thì chưa xét được. JSON hỏng/tham chiếu ngoài quyền không được bỏ qua nhờ nhánh khác.

Cách kết hợp AND/OR áp dụng cho điều kiện bên trong từng rule, không AND các rule với nhau. Chọn quy tắc khớp đầu tiên theo ưu tiên. Nếu quy tắc đã chọn không tạo được ngưỡng, ghi chưa xét được và không thử quy tắc thấp hơn. Đủ dữ liệu nhưng không quy tắc nào khớp thì không áp dụng.

### 3.3. `formula`

Object có khóa `steps` chứa danh sách bước. Thứ tự array là thứ tự tính; kết quả bước cuối là ngưỡng.

| Thành phần | Quy định |
| --- | --- |
| `id` | ID nội bộ ổn định, duy nhất trong công thức; 1–32 ký tự ASCII thuộc `[A-Za-z0-9_-]` |
| `left` / `right` | Toán hạng trung bình, hằng số hoặc kết quả bước trước |
| `operator` | `add`, `subtract`, `multiply`, `divide` |
| `rounding.enabled` | Boolean; mặc định false |
| `rounding.type` / `rounding.digits` | Bắt buộc khi enabled=true, theo mục 4.2; không lưu khi false |

Ba dạng toán hạng:
- `{"type":"average"}`: trung bình từ bộ nguồn trong các cột cấu hình.
- `{"type":"constant","value":"0.8"}`: số hoặc hệ số.
- `{"type":"step","step_id":"s1"}`: kết quả sau làm tròn của bước đã có phía trước.

```json
{
  "steps": [
    {
      "id": "s1",
      "left": {"type": "average"},
      "operator": "divide",
      "right": {"type": "constant", "value": "2"},
      "rounding": {"enabled": true, "type": 3, "digits": 1}
    },
    {
      "id": "s2",
      "left": {"type": "step", "step_id": "s1"},
      "operator": "multiply",
      "right": {"type": "constant", "value": "0.8"},
      "rounding": {"enabled": false}
    }
  ]
}
```

Ví dụ trên: trung bình 49.7 → 24 → ngưỡng 19.2. Công thức phải có ít nhất một bước đầy đủ, chỉ tham chiếu bước trước còn tồn tại; sắp/xóa bước không được đổi nhầm tham chiếu. Từ chối mẫu số hằng bằng 0 lúc lưu; thiếu toán hạng, chia 0 hoặc kết quả không hợp lệ lúc xét → chưa xét được.

Danh sách 01-B, form 03-C và phần giải thích của cùng rule thống nhất: chỉ dòng 1 làm tròn xuống số nguyên, dòng 2 không xử lý phần lẻ. Với `S=19.1`, dấu nhỏ hơn thì đỏ. Không xử lý dòng 1 nhưng làm tròn xuống dòng 2 cho ngưỡng 19 và không đỏ, nên không thể coi là cùng cấu hình đã lưu. Đây là cấu hình của ví dụ, không bắt mọi rule làm tròn ở dòng 1.

### 3.4. `judgment_context`

Lưu thông tin của lần xét hiện hành, không lưu toàn bộ lịch sử hoặc danh sách học sinh của nguồn tổng hợp.

| Thành phần | Dữ liệu |
| --- | --- |
| `score` | Điểm được dùng, dạng chuỗi số; NULL khi không có điểm |
| `threshold` | Tử/mẫu số nguyên rút gọn, mẫu dương; ví dụ `{"numerator":"30","denominator":"1"}`; NULL khi chưa có ngưỡng |
| `compare_type` | 1/2 theo dấu đã dùng; NULL khi chưa có |
| `maximum` | Maximum đã dùng cho tỷ lệ, dạng chuỗi; không dùng thì NULL |
| `sources` | Array các nguồn thực sự được dùng; không dùng nguồn thì array rỗng |

Mỗi phần tử `sources` chứa:
- `usage`: `condition`, `formula` hoặc `both`.
- `kind`: `confirmed` cho bản chốt, `latest` cho kết quả hoàn tất mới nhất.
- `reference`: object gồm `provider` và `key` để định danh bản nguồn thực tế.
- Bộ năm trường nguồn tại mục 3.1.
- `sub_subject_id`, `evaluate_item_id`, `tangen_id` và `population_key` — danh sách chuỗi ID/số khối của nhóm đã phân giải.
- Với loại 6, thêm `resolved_population_type` (1–5) và `resolved_population_ref_id`; không ghi đè `population_type=6`/ID đã chọn. Với loại 5 hoặc loại 6 phân giải thành 5, `population_key` chứa ID lớp thực tế.

Lần xét dùng điểm hợp lệ cũng lưu `grade_id` là `grades.id` nguồn. Đây là thông tin giải thích, không thay thế cơ chế phiên bản tại mục 6.

Trạng thái 1 bắt buộc có score, threshold và compare_type. Trạng thái 2 giữ phần thông tin đã xác định; trạng thái 3/4 không giữ ngưỡng, dấu so sánh hoặc nguồn của lần trước nếu lần hiện tại không dùng chúng.

Tử/mẫu đề xuất tối đa 256 chữ số mỗi số nguyên; vượt miền thì không tạo kết luận. Precision tham số nhập không giới hạn dữ liệu suy ra này. Không lưu tên, thông tin liên hệ hoặc lỗi SQL; bảo vệ dữ liệu theo quyền của ô điểm.

## 4. Ràng buộc dữ liệu

### 4.1. Loại ngưỡng và tính hợp lệ

`compare_type`: **1** = nhỏ hơn (`S<T`); **2** = nhỏ hơn hoặc bằng (`S≤T`).

Các giá trị bắt buộc trong bảng dưới áp dụng khi lưu thiết lập ngưỡng và kích hoạt rule. Dòng chỉ mới lưu điều kiện tuân theo quy tắc lưu dở ở cuối mục này và giữ các giá trị chưa nhập là NULL.

| `threshold_type` | Ý nghĩa | `threshold_value` | Nguồn trung bình của công thức | `formula` | Làm tròn cấp quy tắc |
| --- | --- | --- | --- | --- | --- |
| 1 | Điểm cố định | Bắt buộc | Tất cả NULL | NULL | Cả ba cột NULL |
| 2 | Tỷ lệ điểm tối đa | Bắt buộc | Tất cả NULL | NULL | `round_flg=0` hoặc `1` |
| 3 | Công thức | NULL | Bắt buộc khi có toán hạng trung bình; không sử dụng thì tất cả NULL | Bắt buộc | Cả ba cột NULL; lưu làm tròn trong từng bước |

- Loại 1: kiểm `0≤N≤M` của mọi đối tượng khi lưu hoặc đổi phạm vi. Maximum đổi sau đó không tự thay N.
- Loại 2: `0≤N≤100`; dùng maximum hiện hành đúng ô, đơn vị và lựa chọn lớp. Maximum phải dương, hữu hạn; thiếu/không hợp lệ thì chưa xét được, không thay bằng 100 hoặc maximum bản chốt.
- Loại 3: ngưỡng âm được tính hợp lệ vẫn được lưu trong kết quả xét; không ép về 0.
- Nguồn chọn điều kiện và nguồn công thức độc lập. Fixed vẫn cần nguồn nếu điều kiện áp dụng dùng trung bình/tỷ lệ nhóm.
- `sort_no≥1`. Các quy tắc có hiệu lực có thứ tự xác định; đọc theo `sort_no,id`. Tên quy tắc không cần duy nhất.
- Quy tắc nhập dở không được có `setting_status=1`. Khi thay loại ngưỡng, các cột không dùng được lưu thành SQL NULL.
- Xóa quy tắc là xóa mềm, không xóa dây chuyền kết quả và không tái sử dụng ID cho quy tắc khác.

#### Lưu và đọc trạng thái chưa hoàn chỉnh, có hiệu lực và đã xóa

Quản lý trạng thái rule bằng một cột `setting_status`: 0 đang thiết lập/vô hiệu, 1 có hiệu lực, 2 đã xóa. Từ chối giá trị khác khi lưu. Mức hoàn chỉnh của dữ liệu quyết định nhãn đang thiết lập; không bổ sung thao tác vô hiệu hóa hoặc màn quản lý trạng thái mới.

| Trạng thái | Giá trị lưu | Danh sách/mở lại | Xét đỏ |
| --- | --- | --- | --- |
| Mới lưu điều kiện, chưa có ngưỡng | setting_status=0, ngưỡng chưa nhập | Hiện chưa hoàn chỉnh; tiếp tục bằng Mở thiết lập ngưỡng（基準設定を開く） | Không tham gia |
| Hoàn chỉnh, có hiệu lực | setting_status=1, đủ giá trị hợp lệ | Hiện và cho sửa | Xét theo ưu tiên |
| Không có hiệu lực nhưng chưa xóa | setting_status=0 | Có thể hiện; không yêu cầu thêm UI tắt rule | Không tham gia |
| Đã xóa, kể cả khi chưa hoàn chỉnh | setting_status=2 | Không hiện; URL/form chỉnh sửa cũ không được lưu lại | Không tham gia |

Danh sách lọc `setting_status IN (0,1)`; bộ xét lọc `setting_status=1`. Không đưa trạng thái không hợp lệ hoặc trạng thái đã xóa 2 vào đối tượng xử lý. Khi lưu dở, giữ `threshold_type`/`compare_type` đang chọn và để các giá trị chưa nhập là NULL. Lựa chọn ban đầu cố định/nhỏ hơn theo đề xuất UI, không điền ngầm ngưỡng 0. Kiểm định dạng, quyền và tham chiếu của phần đã nhập khi lưu; chỉ cho có hiệu lực sau khi đáp ứng toàn bộ điều kiện ngưỡng bắt buộc ở mục 4.1. Rule chưa hoàn chỉnh không chặn xét hoặc chọn rule phía dưới như một rule ưu tiên cao. Khi triển khai dùng hằng có tên và so sánh trạng thái tường minh, không dùng truthy hoặc khác 0 để xác định có hiệu lực.

Khi xóa, khóa mục sở hữu rồi cập nhật setting_status=2 và tăng phiên bản rule trong cùng transaction. Nếu xóa cạnh tranh với sửa, kiểm lại chưa xóa ngay trước lưu để form cũ không làm rule sống lại. Xóa rule chưa hoàn chỉnh dùng cùng cơ chế. Không xóa dây chuyền kết quả cá nhân; kết quả đã hoàn tất trước đó vẫn giữ đến lần xét tiếp theo. Không bổ sung chức năng hoàn tác/khôi phục rule đã xóa.

### 4.2. Xử lý phần lẻ và miền lưu trữ

Tỷ lệ maximum mặc định `round_flg=0`, type/digits là NULL; bật làm tròn thì phải có đủ cả hai. Công thức lưu cùng bộ lựa chọn trên từng bước.

| Trường | Giá trị hợp lệ |
| --- | --- |
| `round_type` | 1: gần nhất, nửa đơn vị ra xa 0; 2: làm tròn lên theo ceil; 3: làm tròn xuống theo floor |
| `round_digits` | 1–9; giá trị p nghĩa kết quả còn p−1 chữ số thập phân |

Giới hạn lưu trữ đề xuất:

| Dữ liệu | Giới hạn |
| --- | --- |
| Tên quy tắc | 1–255 ký tự sau khi bỏ khoảng trắng đầu/cuối |
| Ngưỡng cố định/phần trăm | Tối đa 3 chữ số thập phân theo DECIMAL(9,3); vẫn áp dụng giới hạn nghiệp vụ phía trên |
| Hệ số và mốc so sánh trong JSON | Chuỗi thập phân, tối đa 9 chữ số nguyên và 8 chữ số lẻ |
| Công thức | Tối đa 20 bước |
| Mỗi cột TEXT | Payload UTF-8 tối đa 60.000 byte |

Từ chối giá trị vượt giới hạn, không tự cắt/làm tròn. Giới hạn nhập không áp lên trung bình thô; không làm tròn điểm học sinh thay cho ngưỡng.

### 4.3. Trạng thái kết quả

| Trạng thái | `judgment_status` | `is_red` | `red_score_setting_id` | `reason_code` |
| --- | --- | --- | --- | --- |
| Chưa từng xét | Không có dòng, hoặc NULL trên dòng điều khiển khởi tạo | NULL | NULL | NULL |
| Đỏ | 1 | 1 | Bắt buộc | NULL |
| Không đỏ | 1 | 0 | Bắt buộc | NULL |
| Chưa xét được | 2 | NULL | Có nếu đã chọn được quy tắc; không thì NULL | Bắt buộc |
| Không áp dụng | 3 | NULL | NULL | `no_applicable_rule` |
| Không có điểm | 4 | NULL | NULL | `no_score` |

Các mã nguyên nhân của trạng thái 2:

| Mã | Ý nghĩa |
| --- | --- |
| `source_missing` | Thiếu nguồn tổng hợp |
| `source_invalid` | Nguồn tổng hợp không hợp lệ hoặc không đúng phạm vi |
| `membership_missing` | Không xác định được nhóm thành viên |
| `membership_ambiguous` | Dữ liệu nhóm thành viên mâu thuẫn |
| `maximum_invalid` | Maximum không hợp lệ cho tỷ lệ |
| `condition_invalid` | Điều kiện áp dụng không hợp lệ |
| `formula_invalid` | Công thức không hợp lệ |
| `division_by_zero` | Mẫu số bằng 0 |
| `numeric_overflow` | Kết quả vượt miền số được hỗ trợ |

`is_red=NULL` không phải kết luận không đỏ. Chờ chạy lại giữ dòng trước, không thêm trạng thái riêng. Trạng thái và các trường liên quan phải được lưu thành công cùng nhau; lỗi lưu dữ liệu không phải trạng thái nghiệp vụ “chưa xét được”.

### 4.4. Cập nhật và hiệu lực kết quả

| Sự kiện | Thay đổi dữ liệu |
| --- | --- |
| Sửa ngưỡng, điều kiện, nguồn hoặc thứ tự | Cập nhật settings và `red_score_revision` của mục sở hữu trong cùng transaction; giữ kết quả trước |
| Tắt quy tắc | Cập nhật setting_status=0 và phiên bản mục sở hữu; giữ kết quả trước đến lần xét tiếp theo |
| Xóa mềm quy tắc, kể cả chưa hoàn chỉnh hoặc quy tắc cuối | Cùng lúc lưu setting_status=2 và tăng phiên bản mục sở hữu. Bỏ khỏi danh sách; giữ kết quả trước đến lần xét tiếp theo |
| Lần xét hoàn tất | Cập nhật một dòng hiện hành theo trạng thái tại mục 4.3; kết luận cũ hết hiệu lực khi chưa xét được hoặc không áp dụng |
| Điểm bị xóa thành trống hoặc ngừng hoạt động | Cùng transaction đổi thế hệ, tăng phiên bản, ghi status=4. Ngay khi lưu thành công, hiển thị ô trống và ngừng dấu/lọc đỏ của ô; không chờ chạy lại |
| Identity ô bị hủy hoặc thay thế | Giữ dòng điều khiển đánh dấu ô đã bị xóa, ngừng kết quả cũ; tái tạo dùng thế hệ mới, không kế thừa kết quả |
| Xem, trích xuất hoặc in | Không thay đổi dữ liệu xét |

Chỉ `judgment_status=1 AND is_red=1` của ô còn điểm hợp lệ được đánh dấu/lọc đỏ. Rule đã tắt không tự làm mất kết quả trước; chạy lại phải bao phủ cả ô hết rule nhưng còn kết quả cũ.

Kết quả phải nhất quán với điểm cuối. Lượt dùng dữ liệu cũ bị từ chối ghi bằng đối chiếu thế hệ/phiên bản tại mục 6. `judged_at` chỉ là thời gian audit, không dùng để quyết định thứ tự.

### 4.5. Sao chép và năm học

Loại rule đã xóa khỏi sao chép/kế thừa năm. Nếu đường được hỗ trợ có chuyển rule chưa hoàn chỉnh và chưa xóa, ánh xạ đầy đủ các tham chiếu đã nhập rồi giữ setting_status=0 cùng các giá trị chưa nhập; không tự kích hoạt. Không đổi trạng thái đã xóa 2 về 0/1 để phục hồi rule.

- Chỉ sao chép cấu hình thuộc phạm vi thao tác; ánh xạ lại frame item, kỳ/thời điểm, thiết lập tổng hợp, nhóm và ID trong JSON.
- Chỉ lưu quy tắc đích sau khi toàn bộ tham chiếu đã nhập hợp lệ; bản chưa hoàn chỉnh tiếp tục không có hiệu lực. Không ánh xạ được frame item sở hữu thì không tạo quy tắc; thiếu tham chiếu phụ thì không ghi đè quy tắc đích đã có.
- Không bỏ bộ lọc hoặc đổi `apply_condition` thành NULL để vượt qua lỗi ánh xạ. Giữ đúng chế độ toàn bộ/từng phần của thao tác sao chép và báo phần không được lưu.
- Không sao chép kết quả cá nhân hoặc tham chiếu bản chốt năm cũ sang năm mới.
- Không mang token thế hệ, phiên bản đặt chỗ/hoàn tất từ dữ liệu copy/import/khôi phục vào đích. Tăng phiên bản mục sở hữu khi chuyển quy tắc vào đích. Loại 6 phải ánh xạ cấu hình và các môn/nhóm phụ thuộc; loại 5 phân giải theo lớp của ô đích. Copy cấu hình công khai theo mục 5.
- Dữ liệu `red_score` và `changed_red_score` hiện có giữ nguyên; không chuyển thành quy tắc mới hoặc dùng làm giá trị thay thế khi thiếu cấu hình.

## 5. Hiệu ứng theo cấu hình công khai

`grade_publish_conf_grade_items.red_score_display_type` có giá trị `0=không có, 1=ngoặc, 2=* trước, 3=* sau`. Lưu theo `grade_publish_conf_id + year + evaluate_item_id + tangen_flg` hiện có. `tangen_flg` là phân loại thường/đơn vị, không phải ID đơn vị cụ thể. Chỉ cho thiết lập trên mục số thuộc đối tượng; server từ chối mã lạ và cấu hình ngoài quyền. Chưa thiết lập/dòng cũ dùng 0 để giữ hiển thị hiện hữu.

Ví dụ cùng mục có điểm đỏ 24: cấu hình X hiển thị `(24)`, cấu hình Y hiển thị `*24`; cấu hình thường/đơn vị cũng độc lập. Không lưu hiệu ứng vào kết quả cá nhân; cùng kết quả xét được trình bày theo từng cấu hình công khai.

Luồng lưu bổ sung giá trị vào bước dựng POST và xóa/chèn lại mục trong `GradePublishConfController`. Bổ sung vào SELECT tường minh của `GradePublishConfGradeItems_m::getByPublishConfId`, đọc lại form và dữ liệu từ `GradePublishService` tới web/API/PDF. Giữ transaction của toàn cấu hình; lỗi lưu giữ cấu hình cũ. Copy giữ hiệu ứng dưới ID cấu hình công khai mới, không copy kết quả học sinh. Với đường chuyển năm được hỗ trợ, ánh xạ cả mục/năm và giữ đơn vị thất bại toàn bộ/từng phần của thao tác hiện hữu.

Không thay thế hiệu ứng điểm dự kiến; kết hợp hiệu ứng khác và loại trùng. Giữ ẩn điểm, quyền, lịch công khai, nền/định dạng. Không chọn bảng hiển thị riêng vì dòng hiện hữu đã thể hiện được đơn vị lưu cần thiết; tránh phát sinh quan hệ phụ thuộc ID dòng con vốn đổi khi lưu và tái sử dụng đường copy hiện có.

### 5.1. Thiết lập hiển thị của Trích xuất thành tích（成績抽出）và Công cụ phiếu điểm（通知表ツール）

Hai đầu ra còn lại không thêm cột hay bảng mới.

Bộ lọc điểm đỏ, ký hiệu trước/sau và màu ô của Trích xuất thành tích（成績抽出）được đề xuất lưu trong JSON `grade_extract_conf.extract_setting` hiện có, với cùng các khóa của mẫu hiển thị hiện hành: `use_target_extract`, `use_prefix_mark`, `prefix_mark`, `use_suffix_mark`, `suffix_mark`, `use_cell_coloring`, `cell_color`. Lưu, đọc lại và sao chép đi theo đường thiết lập trích xuất hiện có. Chỉ dùng kết quả xét hiện hành phía server làm căn cứ lọc/trang trí; không tin cờ điểm đỏ hay ngưỡng gửi lên.

Điều kiện điểm đỏ trên Công cụ phiếu điểm（通知表ツール）được đề xuất thêm vào phần lưu bảng/điều kiện hiện có, không thêm cột riêng như cấu hình công khai. Lưu bằng nút Cập nhật（更新する）ở bảng sau khi đóng hộp thoại. Sao chép mẫu giữ lựa chọn và chuỗi, không sao chép kết quả xét của học sinh.

## 6. Phương thức xử lý cập nhật đồng thời

### 6.1. Dữ liệu điều khiển và dòng được khóa

`red_score_results` đồng thời là dòng điều khiển của ô. K là khóa ô, G là `cell_generation`, V là `write_version` đã đặt chỗ, R là `red_score_revision` của mục sở hữu; worker giữ `(K,G,V,R,grade_id)`. G là token CHAR(32) mới theo cách tạo ID hiện có, cấp lại khi xóa/tạo lại ô. Phiên bản tăng trong khóa DB; khi tới giới hạn thì báo lỗi, không quay về 0.

Mọi đường ghi tham gia dùng cùng kết nối ghi trong transaction và cùng thứ tự: các `grade_evaluate_frame_items` liên quan theo ID bằng `FOR SHARE`, các dòng `groups` hiện hữu của lớp liên quan theo ID bằng `FOR UPDATE`, dòng điều khiển theo K bằng `FOR UPDATE`, rồi các dòng `grades` tồn tại theo ID bằng `FOR UPDATE`. Thêm/sửa/xóa/sắp rule lấy `FOR UPDATE` trên mục sở hữu, cập nhật rule và tăng R cùng transaction. Không đọc phần cần nhất quán qua replica; đọc lại dữ liệu hiện hành cần thiết sau khi lấy khóa.

Lần đầu insert dòng điều khiển theo unique key; nếu trùng thì lấy và khóa dòng có sẵn. Không dùng upsert ghi đè payload đã tồn tại. Khởi tạo V=0, `judged_version`, `rule_revision`, payload kết luận và `judged_at` đều NULL. Có dòng này không có nghĩa đã xét. Không tạo/lưu nếu mục sở hữu hoặc lớp đã bị xóa hay ngoài quyền.

Các mục có K khác nhau vẫn có thể dùng các cột trong cùng một dòng `grades`. Khi dòng đó chưa tồn tại, điểm khóa chung là `groups.id` ở trên. Sau khi lấy khóa, đọc hiện hành có khóa theo nhận diện vật lý trường/năm/học sinh/lớp/học kỳ/thời điểm/đơn vị; nếu dòng đã được tạo trong lúc chờ thì dùng ID đó để chỉ cập nhật cột cần thay đổi. Chỉ insert khi vẫn chưa có dòng; nếu có nhiều dòng có hiệu lực thì rollback và báo lỗi nhất quán. Không dùng lại kết luận “chưa có dòng” từ trước transaction.

Đổi lại, các lượt ghi cùng lớp được tuần tự hóa trong phạm vi transaction. Không giữ khóa lớp suốt phần tính của toàn batch; nhả khóa giữa transaction đặt chỗ và transaction lưu. Đưa cả lớp nguồn/đích của môn liên quan vào tập khóa cần thiết. Mọi writer tham gia phải theo cùng thứ tự; nếu sau này thu nhỏ phạm vi khóa thì vẫn phải có điểm loại trừ chung khi dòng vật lý chưa tồn tại.

Với nhiều ô/môn liên quan, xác định tập bị thay đổi trước rồi khóa cùng thứ tự. Nếu phát hiện thêm đối tượng giữa chừng thì rollback transaction đó và dựng lại tập; không lấy khóa điều khiển ngược thứ tự sau khi đã khóa điểm.

### 6.2. Đăng ký thường và batch

- Nhập thường/CSV/liên kết thi: lấy các khóa trên và tăng V trước khi sửa điểm. Sau tính toán, giới hạn và cập nhật liên quan, xét điểm cuối rồi lưu điểm, payload kết luận, `judged_version=V`, `rule_revision=R` trong cùng transaction. Không bỏ ô đã cập nhật vì nhập tay, không có công thức hoặc liên kết skip AutoRating. Lỗi lưu rollback transaction này.
- Batch chỉ xét kết quả: transaction đặt chỗ ngắn lấy khóa, tăng V, đọc điểm/R/các giá trị tham chiếu rồi commit. Tính trên đầu vào đó. Transaction lưu lấy khóa cùng thứ tự và đối chiếu G, V, R, ID/tính hợp lệ của dòng điểm gốc. Chỉ lưu payload và phiên bản hoàn tất khi `write_version=V` và `judged_version IS NULL OR judged_version<V`. Khác thế hệ/phiên bản thì bỏ ticket cũ, không ghi đè; gửi lại V đã hoàn tất cũng không cập nhật.
- Batch có sửa điểm: không chỉ bổ sung kiểm tra ở bước ghi kết quả đỏ. Phải giữ ticket từ trước khi đọc đầu vào tính điểm và kiểm trước khi ghi điểm, hoặc thực hiện tính toán/ghi điểm cuối/xét trong cùng transaction có khóa của phạm vi đó. Công thức dùng ô đầu vào liên quan cũng phải bảo vệ/đối chiếu thay đổi ở đầu vào. Không lưu điểm AutoRating cũ vô điều kiện rồi mới lấy ticket mới.

Đặt chỗ không xóa payload đã hoàn tất. Bộ đọc không vô hiệu hóa kết quả trước chỉ vì `write_version != judged_version` hoặc phiên bản rule hiện tại khác. Đọc điểm/kết quả trong cùng phạm vi nhất quán, không ghép hai thời điểm. Trạng thái NULL lần đầu, chưa xét được, không áp dụng hoặc không có điểm không được đánh dấu đỏ.

### 6.3. Xóa/tạo lại, nguồn tham chiếu và lỗi

Xóa thành trống/xóa mềm/ngừng dùng đơn vị/xóa khi khôi phục dùng cùng khóa và transaction: cấp G mới, tăng V, lưu trạng thái 4 với `judged_version=V`, xóa thông tin rule/ngưỡng/nguồn cũ. Giữ dòng điều khiển. Khi tạo lại, tiếp tục cấp G và phiên bản mới, không kế thừa kết luận trước. Thay điểm thông thường tăng V, nên 29→40→29 vẫn làm ticket cũ hết hiệu lực. Xóa vật lý dòng điều khiển hoặc tái sử dụng token không thuộc luồng thông thường của phiên bản này.

Nguồn tham chiếu và maximum được đọc nhất quán tại thời điểm lấy đầu vào; dùng lại scalar đã lấy cho cùng nguồn trong một lượt. Giữ ưu tiên bản chốt, đúng kỳ/môn/đơn vị/nhóm và độ chính xác trước làm tròn; không trộn thời điểm khi tổng hợp đang ghi lại. Nếu ID nguồn giữ nguyên nhưng dữ liệu bị ghi đè, dùng snapshot đọc nhất quán hoặc phiên bản provider để bảo đảm cùng bộ giá trị. Không thêm cơ chế tự xét lại toàn trường mỗi khi nguồn thay đổi.

Tiến độ phân biệt lượt cũ là `superseded`, không tính thành cập nhật thành công hay chưa xét được theo nghiệp vụ. Không xóa kết quả mới hoặc tự tái tạo ô đã xóa. Deadlock/timeout rollback toàn transaction, đọc lại theo chính sách retry hữu hạn của job hiện có. Đường không có retry hữu hạn thì không bổ sung retry tự động; báo phạm vi thất bại và hướng dẫn chạy lại thủ công. Không hứa rollback toàn batch.

### 6.4. Phạm vi kết nối và ví dụ kiểm tra

| Đường xử lý | Phần phải kết nối |
| --- | --- |
| `AdminNBGradeSettingSystemLessonController` / `LessonCsvController` | Ngay sau bắt đầu transaction, trước khi ghi điểm/lựa chọn phụ thuộc, xác định đối tượng và lấy khóa; lưu xét cuối trước thông báo thành công |
| `ScoringResultService` | Khóa trước đăng ký điểm; dù skip AutoRating vẫn lưu xét cho ô đã đăng ký trong cùng transaction |
| `AutoRating` / `AutoRatingBatch` | Bao phủ đầu vào và đích của `save`, `saveGradeToParentSubSubject` và copy liên quan; không commit giữa chừng transaction do bên ngoài sở hữu |
| `Grades_m::regist/registReturnId/insertBatch/updateBatch/deleteGrade` | Bắt buộc tham gia hợp đồng chung; bên gọi truyền tập K và transaction. Không tự suy frame hoặc điểm cuối chỉ tại model |
| `FailbackUsecase::deleteGradeInfo`, xóa/ngừng dùng đơn vị, thay frame | Khóa dòng điều khiển của ô bị xóa trước, làm thế hệ cũ hết hiệu lực; không chuyển giá trị điều khiển qua copy/import/khôi phục |

Khi triển khai phải xác nhận mọi writer thuộc phạm vi phát hành đều tham gia. Không xem hệ thống điểm cũ hoặc writer tùy biến trường là đã điều tra xong; không tuyên bố bảo đảm nhất quán cho ô còn bị đường chưa hỗ trợ thay đổi.

Ví dụ: batch A đọc 29, đặt V=10 → đăng ký B lưu 40/không đỏ với V=11 → A bị từ chối vì khác V. Kiểm thêm cạnh tranh lần đầu, đổi rồi quay về điểm cũ, xóa/nhập lại, tái tạo, sửa rule, callback trùng và lỗi lưu. Chưa chạy thử hai kết nối, đo query/thời gian khóa hoặc kiểm đầu ra; các bằng chứng này thuộc nghiệm thu sau triển khai.
