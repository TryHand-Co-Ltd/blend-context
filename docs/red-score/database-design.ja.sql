-- 赤点設定・判定結果テーブルの作成

-- 赤点設定
CREATE TABLE `red_score_settings` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '赤点設定ID',
	`school_id` INT UNSIGNED NOT NULL COMMENT '学校ID',
	`year` INT UNSIGNED NOT NULL COMMENT '年度',
	`evaluate_frame_item_id` CHAR(32) NOT NULL COMMENT '評価フレーム項目ID',
	`setting_name` VARCHAR(255) NOT NULL COMMENT '設定名称',
	`sort_no` INT UNSIGNED NOT NULL COMMENT '優先順位（昇順）',
	`compare_type` TINYINT UNSIGNED NOT NULL COMMENT '比較方法（1:未満 2:以下）',
	`threshold_type` TINYINT UNSIGNED NOT NULL COMMENT '閾値種別（1:固定点数 2:得点率 3:計算式）',
	`threshold_value` DECIMAL(9,3) NULL DEFAULT NULL COMMENT '固定点数または百分率（閾値種別3の場合はNULL）',
	`apply_condition` TEXT NULL COMMENT '適用条件（JSON、NULLは項目の対象範囲全体）',
	`period_id` INT UNSIGNED NULL DEFAULT NULL COMMENT '計算式の参照平均の学期ID（period.id）',
	`term_id` INT UNSIGNED NULL DEFAULT NULL COMMENT '計算式の参照平均の時期ID（term.id）',
	`grade_calc_conf_id` CHAR(32) NULL DEFAULT NULL COMMENT '計算式の参照平均の順位集計設定ID（grade_calc_conf.id）',
	`population_type` TINYINT UNSIGNED NULL DEFAULT NULL COMMENT '母集団種別（1:学年 2:ホームルーム 3:順位集計グループ 4:組み合わせグループ）',
	`population_ref_id` CHAR(32) NULL DEFAULT NULL COMMENT '母集団参照ID（種別3:グループ種別ID 種別4:組み合わせグループID 種別1・2:NULL）',
	`formula` TEXT NULL COMMENT '計算式（JSON、各手順のオペランド・端数処理を保持、閾値種別3のみ）',
	`round_flg` TINYINT UNSIGNED NULL DEFAULT NULL COMMENT '端数処理フラグ（閾値種別2のみ、0:しない 1:する、閾値種別1・3はNULL）',
	`round_type` TINYINT UNSIGNED NULL DEFAULT NULL COMMENT '端数処理方法（閾値種別2で有効時のみ、1:四捨五入 2:切り上げ 3:切り捨て）',
	`round_digits` TINYINT UNSIGNED NULL DEFAULT NULL COMMENT '端数処理の桁（閾値種別2で有効時のみ、1～9、1は整数）',
	`active` TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '有効フラグ（0:未適用・無効・論理削除済み 1:設定完了・有効）',
	`created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
	`created` INT NOT NULL COMMENT '登録者',
	`updated_at` TIMESTAMP NULL DEFAULT NULL COMMENT '更新日時',
	`updated` INT NULL DEFAULT NULL COMMENT '更新者',
	PRIMARY KEY (`id`),
	KEY `idx_red_score_settings_01` (`school_id`, `year`, `evaluate_frame_item_id`, `active`, `sort_no`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_general_ci
  COMMENT='赤点設定（既存の赤点閾値とは独立して管理）';

-- 赤点判定結果
CREATE TABLE `red_score_results` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '赤点判定結果ID',
	`school_id` INT UNSIGNED NOT NULL COMMENT '学校ID',
	`year` INT UNSIGNED NOT NULL COMMENT '年度',
	`evaluate_frame_item_id` CHAR(32) NOT NULL COMMENT '評価フレーム項目ID',
	`group_id` INT UNSIGNED NOT NULL COMMENT '授業ID（grades.group_id）',
	`student_id` INT UNSIGNED NOT NULL COMMENT '生徒ID（grades.student_id）',
	`tangen_id` INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '単元ID（通常の得点は0）',
	`red_score_setting_id` BIGINT UNSIGNED NULL DEFAULT NULL COMMENT '判定に使用した赤点設定ID（未選択または該当なしの場合はNULL）',
	`judgment_status` TINYINT UNSIGNED NOT NULL COMMENT '判定状態（1:判定成功 2:判定不可 3:対象外 4:得点なし）',
	`is_red` TINYINT UNSIGNED NULL DEFAULT NULL COMMENT '赤点判定（判定状態1のみ、0:赤点ではない 1:赤点、その他の状態はNULL）',
	`reason_code` VARCHAR(32) NULL DEFAULT NULL COMMENT '判定理由コード（定義済みコードのみ、SQLエラーは保存しない）',
	`judgment_context` TEXT NULL COMMENT '判定時の参照情報（JSON、生徒一覧・連絡先は保存しない）',
	`judged_at` DATETIME NOT NULL COMMENT '判定完了日時（判定不可・対象外を含む）',
	`created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
	`created` INT NOT NULL COMMENT '登録者',
	`updated_at` TIMESTAMP NULL DEFAULT NULL COMMENT '更新日時',
	`updated` INT NULL DEFAULT NULL COMMENT '更新者',
	PRIMARY KEY (`id`),
	UNIQUE KEY `uk_red_score_results_01` (`school_id`, `year`, `evaluate_frame_item_id`, `group_id`, `student_id`, `tangen_id`),
	KEY `idx_red_score_results_01` (`school_id`, `year`, `group_id`, `student_id`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_general_ci
  COMMENT='赤点判定結果（得点セルごとに最新の完了済み判定状態を保持）';
