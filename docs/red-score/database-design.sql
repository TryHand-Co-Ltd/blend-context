-- Thiết kế cơ sở dữ liệu điểm đỏ — Định nghĩa bảng
-- Hai bảng mới; không thay đổi dữ liệu hoặc cấu trúc legacy.

CREATE TABLE `red_score_settings` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã quy tắc điểm đỏ',
	`school_id` INT UNSIGNED NOT NULL COMMENT 'Trường sở hữu quy tắc',
	`year` INT UNSIGNED NOT NULL COMMENT 'Năm học',
	`evaluate_frame_item_id` CHAR(32) NOT NULL COMMENT 'grade_evaluate_frame_items.id',
	`setting_name` VARCHAR(255) NOT NULL COMMENT 'Tên nhận biết quy tắc, không dùng làm khóa',
	`sort_no` INT UNSIGNED NOT NULL COMMENT 'Ưu tiên tăng dần trong một mục',
	`compare_type` TINYINT UNSIGNED NOT NULL COMMENT '1: nhỏ hơn, 2: nhỏ hơn hoặc bằng',
	`threshold_type` TINYINT UNSIGNED NOT NULL COMMENT '1: cố định, 2: tỷ lệ maximum, 3: công thức',
	`threshold_value` DECIMAL(9,3) NULL DEFAULT NULL COMMENT 'Điểm hoặc phần trăm của loại 1 và 2; loại 3 là NULL',
	`apply_condition` TEXT NULL COMMENT 'JSON điều kiện áp dụng; SQL NULL là toàn bộ phạm vi được phép',
	`period_id` INT UNSIGNED NULL DEFAULT NULL COMMENT 'period.id của nguồn A trong công thức',
	`term_id` INT UNSIGNED NULL DEFAULT NULL COMMENT 'term.id của nguồn A trong công thức',
	`grade_calc_conf_id` CHAR(32) NULL DEFAULT NULL COMMENT 'grade_calc_conf.id của nguồn A trong công thức',
	`population_type` TINYINT UNSIGNED NULL DEFAULT NULL COMMENT '1: khối, 2: lớp chủ nhiệm, 3: nhóm tổng hợp, 4: tổ hợp nhóm',
	`population_ref_id` CHAR(32) NULL DEFAULT NULL COMMENT 'ID loại nhóm khi type=3, ID tổ hợp khi type=4; type=1/2 là NULL',
	`formula` TEXT NULL COMMENT 'JSON danh sách bước, toán hạng và làm tròn từng bước; chỉ loại 3',
	`round_flg` TINYINT UNSIGNED NULL DEFAULT NULL COMMENT 'Chỉ loại 2: 0 không làm tròn, 1 có; loại 1/3 là NULL',
	`round_type` TINYINT UNSIGNED NULL DEFAULT NULL COMMENT 'Chỉ loại 2 khi bật: 1 gần nhất, 2 ceil, 3 floor',
	`round_digits` TINYINT UNSIGNED NULL DEFAULT NULL COMMENT 'Chỉ loại 2 khi bật: vị trí 1-9; 1 ra số nguyên',
	`active` TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 chưa áp dụng hoặc đã tắt/xóa mềm; 1 cấu hình đầy đủ có hiệu lực',
	`created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm tạo',
	`created` INT NOT NULL COMMENT 'Người tạo theo audit hiện có',
	`updated_at` TIMESTAMP NULL DEFAULT NULL COMMENT 'Thời điểm cập nhật',
	`updated` INT NULL DEFAULT NULL COMMENT 'Người cập nhật theo audit hiện có',
	PRIMARY KEY (`id`),
	KEY `idx_red_score_settings_01` (`school_id`, `year`, `evaluate_frame_item_id`, `active`, `sort_no`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_general_ci
  COMMENT='Quy tắc điểm đỏ mới, độc lập ngưỡng legacy';

CREATE TABLE `red_score_results` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã trạng thái xét điểm đỏ của ô',
	`school_id` INT UNSIGNED NOT NULL COMMENT 'Trường sở hữu ô điểm',
	`year` INT UNSIGNED NOT NULL COMMENT 'Năm học',
	`evaluate_frame_item_id` CHAR(32) NOT NULL COMMENT 'grade_evaluate_frame_items.id của ô',
	`group_id` INT UNSIGNED NOT NULL COMMENT 'Lớp học phần, cùng identity grades.group_id',
	`student_id` INT UNSIGNED NOT NULL COMMENT 'Học sinh, cùng identity grades.student_id',
	`tangen_id` INT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Đơn vị bài học; điểm thường là 0',
	`red_score_setting_id` BIGINT UNSIGNED NULL DEFAULT NULL COMMENT 'Quy tắc đã chọn; NULL khi chưa chọn được hoặc không có',
	`judgment_status` TINYINT UNSIGNED NOT NULL COMMENT '1 xét thành công, 2 chưa xét được, 3 không áp dụng, 4 không có điểm',
	`is_red` TINYINT UNSIGNED NULL DEFAULT NULL COMMENT 'Chỉ status=1: 0 không đỏ, 1 đỏ; status khác là NULL',
	`reason_code` VARCHAR(32) NULL DEFAULT NULL COMMENT 'Mã nguyên nhân theo contract, không lưu thông báo SQL',
	`judgment_context` TEXT NULL COMMENT 'JSON bằng chứng tối thiểu, không chép danh sách học sinh hoặc thông tin liên hệ',
	`judged_at` DATETIME NOT NULL COMMENT 'Thời điểm hoàn tất lần xét được lưu, kể cả chưa xét được/không áp dụng',
	`created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm tạo dòng',
	`created` INT NOT NULL COMMENT 'Người tạo theo audit hiện có',
	`updated_at` TIMESTAMP NULL DEFAULT NULL COMMENT 'Thời điểm cập nhật',
	`updated` INT NULL DEFAULT NULL COMMENT 'Người cập nhật theo audit hiện có',
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_red_score_results_01` (`school_id`, `year`, `evaluate_frame_item_id`, `group_id`, `student_id`, `tangen_id`),
	KEY `idx_red_score_results_01` (`school_id`, `year`, `group_id`, `student_id`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_general_ci
  COMMENT='Trạng thái lần xét hoàn tất gần nhất của từng ô điểm';
