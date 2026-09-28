# Thiết kế cơ sở dữ liệu — Chức năng điểm đỏ

Ngày: **28/09/2026**.

Thiết kế đề xuất gồm hai bảng dưới đây.

## 1. Tổng quan và quan hệ

| Bảng | Mục đích | Đơn vị lưu trữ |
| --- | --- | --- |
| `red_score_settings` | Lưu điều kiện áp dụng, độ ưu tiên và ngưỡng điểm đỏ | Một quy tắc của một mục trên khung đánh giá, trong một trường và năm học |
| `red_score_results` | Lưu kết quả và trạng thái xét dùng chung cho trích xuất, công khai và phiếu điểm | Một trạng thái hiện hành của một ô điểm |

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
| `population_ref_id` | `grade_calc_groups.id` hoặc `grade_calc_group_combos.id`, tùy loại nhóm |
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
| `population_ref_id` | CHAR(32) | Có | NULL | ID loại nhóm hoặc tổ hợp nhóm |
| `formula` | TEXT | Có | NULL | JSON các bước tính ngưỡng và làm tròn từng bước |
| `round_flg` | TINYINT UNSIGNED | Có | NULL | Bật/tắt xử lý phần lẻ của loại tỷ lệ maximum |
| `round_type` | TINYINT UNSIGNED | Có | NULL | Cách xử lý phần lẻ |
| `round_digits` | TINYINT UNSIGNED | Có | NULL | Vị trí chữ số cần xử lý |
| `active` | TINYINT UNSIGNED | Không | 0 | 0: chưa áp dụng hoặc đã tắt/xóa mềm; 1: cấu hình đầy đủ có hiệu lực |
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
| `red_score_setting_id` | BIGINT UNSIGNED | Có | NULL | Quy tắc được chọn trong lần xét |
| `judgment_status` | TINYINT UNSIGNED | Không | — | Trạng thái lần xét hoàn tất gần nhất |
| `is_red` | TINYINT UNSIGNED | Có | NULL | Kết luận đỏ/không đỏ khi xét thành công |
| `reason_code` | VARCHAR(32) | Có | NULL | Mã nguyên nhân khi chưa có kết luận |
| `judgment_context` | TEXT | Có | NULL | JSON thông tin dữ liệu được dùng trong lần xét |
| `judged_at` | DATETIME | Không | — | Thời điểm hoàn tất lần xét đã lưu, kể cả chưa xét được/không áp dụng |
| `created_at` | TIMESTAMP | Không | CURRENT_TIMESTAMP | Thời điểm tạo dòng |
| `created` | INT | Không | — | Người tạo |
| `updated_at` | TIMESTAMP | Có | NULL | Thời điểm cập nhật dòng gần nhất |
| `updated` | INT | Có | NULL | Người cập nhật gần nhất |

### 2.3. Khóa và chỉ mục

| Bảng | Khóa/chỉ mục | Cột | Mục đích |
| --- | --- | --- | --- |
| settings | PRIMARY KEY | `id` | Định danh quy tắc |
| settings | `idx_red_score_settings_01` | `school_id, year, evaluate_frame_item_id, active, sort_no` | Đọc quy tắc có hiệu lực theo mục và thứ tự |
| results | PRIMARY KEY | `id` | Định danh dòng kết quả |
| results | `uk_red_score_results_01` | `school_id, year, evaluate_frame_item_id, group_id, student_id, tangen_id` | Một dòng hiện hành cho một ô |
| results | `idx_red_score_results_01` | `school_id, year, group_id, student_id` | Đọc kết quả theo trường/năm/lớp/học sinh |

Hai bảng dùng InnoDB, `utf8mb4` và `utf8mb4_general_ci` cấp bảng. ID CHAR(32) là mã hex canonical, phải tương thích identity/cách so sánh của bảng nguồn; không thay đổi ID nguồn.

## 3. Dữ liệu JSON

### 3.1. Bộ thông tin nguồn

Bộ nguồn gồm `period_id`, `term_id`, `grade_calc_conf_id`, `population_type` và `population_ref_id`. Cấu trúc này dùng ở các cột nguồn của công thức và trong `apply_condition`.

| `population_type` | Nhóm tham chiếu | `population_ref_id` | Cách xác định nhóm cụ thể |
| --- | --- | --- | --- |
| 1 | Khối | NULL | Khối của học sinh trong năm học |
| 2 | Lớp chủ nhiệm | NULL | Lớp chủ nhiệm của học sinh trong năm học |
| 3 | Nhóm tổng hợp | `grade_calc_groups.id` | Thành viên trong `grade_calc_group_members` xác định `grade_calc_group_item_id` |
| 4 | Tổ hợp nhóm | `grade_calc_group_combos.id` | Các loại nhóm trong `grade_calc_group_combo_items` và nhóm thành viên tương ứng |

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

Chọn quy tắc khớp đầu tiên theo ưu tiên. Nếu quy tắc đã chọn không tạo được ngưỡng, ghi chưa xét được và không thử quy tắc thấp hơn. Đủ dữ liệu nhưng không quy tắc nào khớp thì không áp dụng.

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

Trạng thái 1 bắt buộc có score, threshold và compare_type. Trạng thái 2 giữ phần thông tin đã xác định; trạng thái 3/4 không giữ ngưỡng, dấu so sánh hoặc nguồn của lần trước nếu lần hiện tại không dùng chúng.

Tử/mẫu đề xuất tối đa 256 chữ số mỗi số nguyên; vượt miền thì không tạo kết luận. Precision tham số nhập không giới hạn dữ liệu suy ra này. Không lưu tên, thông tin liên hệ hoặc lỗi SQL; bảo vệ dữ liệu theo quyền của ô điểm.

## 4. Ràng buộc dữ liệu

### 4.1. Loại ngưỡng và tính hợp lệ

`compare_type`: **1** = nhỏ hơn (`S<T`); **2** = nhỏ hơn hoặc bằng (`S≤T`).

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
- Quy tắc nhập dở không được có `active=1`. Khi thay loại ngưỡng, các cột không dùng được lưu thành SQL NULL.
- Xóa quy tắc là xóa mềm, không xóa dây chuyền kết quả và không tái sử dụng ID cho quy tắc khác.

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
| Chưa từng xét | Không có dòng | — | — | — |
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
| Sửa ngưỡng, điều kiện, nguồn hoặc thứ tự | Cập nhật settings; giữ kết quả trước |
| Tắt/xóa mềm quy tắc, kể cả quy tắc cuối | Cập nhật active; giữ kết quả trước đến lần xét tiếp theo |
| Lần xét hoàn tất | Cập nhật một dòng hiện hành theo trạng thái tại mục 4.3; kết luận cũ hết hiệu lực khi chưa xét được hoặc không áp dụng |
| Điểm bị xóa thành trống hoặc ngừng hoạt động | Cập nhật status=4 nếu identity còn tồn tại |
| Identity ô bị hủy hoặc thay thế | Loại bỏ kết quả gắn với identity cũ; không gắn sang ô mới |
| Xem, trích xuất hoặc in | Không thay đổi dữ liệu xét |

Chỉ `judgment_status=1 AND is_red=1` của ô còn điểm hợp lệ được đánh dấu/lọc đỏ. Rule đã tắt không tự làm mất kết quả trước; chạy lại phải bao phủ cả ô hết rule nhưng còn kết quả cũ.

Kết quả phải nhất quán với điểm cuối. Lượt dùng dữ liệu cũ không được ghi đè lượt mới; `judged_at` và unique key không tự bảo đảm điều này.

### 4.5. Sao chép và năm học

- Chỉ sao chép cấu hình thuộc phạm vi thao tác; ánh xạ lại frame item, kỳ/thời điểm, thiết lập tổng hợp, nhóm và ID trong JSON.
- Chỉ lưu quy tắc đích sau khi toàn bộ tham chiếu hợp lệ. Không ánh xạ được frame item sở hữu thì không tạo quy tắc; thiếu tham chiếu phụ thì không ghi đè quy tắc đích đã có.
- Không bỏ bộ lọc hoặc đổi `apply_condition` thành NULL để vượt qua lỗi ánh xạ. Giữ đúng chế độ toàn bộ/từng phần của thao tác sao chép và báo phần không được lưu.
- Không sao chép kết quả cá nhân hoặc tham chiếu bản chốt năm cũ sang năm mới.
- Dữ liệu `red_score` và `changed_red_score` hiện có giữ nguyên; không chuyển thành quy tắc mới hoặc dùng làm giá trị thay thế khi thiếu cấu hình.
