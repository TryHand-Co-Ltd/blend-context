# データベース設計 — 赤点機能

日付：**2026年9月28日**。

**v2 / Draft — レビュー用の技術設計。** 新規2テーブルに加え、既存の公開項目テーブルと評価フレーム項目テーブルを拡張する。DDLは未実行であり、実装・実環境での検証完了を示さない。

## 1. 概要と関連

| テーブル | 目的 | 保存単位 |
| --- | --- | --- |
| `red_score_settings` | 赤点の適用条件、優先順位、閾値を保存する | 学校・年度ごとの評価フレーム項目に対する1つのルール |
| `red_score_results` | 成績抽出・成績公開・通知表で共通利用する判定結果と状態を保存する | 1つの得点セルの現在有効な状態 |
| `grade_publish_conf_grade_items`（拡張） | 赤点の表示効果を保存する | 公開設定・年度・評価項目・通常／単元区分 |
| `grade_evaluate_frame_items`（拡張） | 赤点ルール一覧の版数を管理する | 1つの評価フレーム項目 |

1つの項目に複数のルールを設定でき、1つのルールは複数のセルに適用できる。結果には選択したルールのIDを保存し、ルールを選択できなかった場合は `NULL` とする。

### 1.1. 得点セルの識別キー

```text
school_id + year + evaluate_frame_item_id + group_id + student_id + tangen_id
```

各キーにつき現在有効な結果を1行保存する。通常の得点は `tangen_id=0` とし、単元が異なる場合は別セルとする。評価フレーム項目から、評価項目・学期／時期・`grades` 内の得点カラムを特定する。

### 1.2. 既存データとの関連

| フィールド | 参照先 |
| --- | --- |
| `school_id` | `school.id` |
| `year` | データの年度。外部キーではない |
| `evaluate_frame_item_id` | `grade_evaluate_frame_items.id` |
| セルの項目・学期・時期 | `grade_evaluate_frame_items.evaluate_item_id`、`save_period_id`、`save_term_id` |
| 得点カラム | `grade_evaluate_items.grades_column` |
| `group_id` | `groups.id`。`grades.group_id` と同じ授業 |
| `student_id` | `students.id`。`grades.student_id` と同じ生徒 |
| 0以外の `tangen_id` | `weekly_plan_curriculum_tangens.id` |
| 平均の参照元の `period_id` / `term_id` | `period.id` / `term.id` |
| `grade_calc_conf_id` | `grade_calc_conf.id` |
| `population_ref_id` | 種類3/4/6に応じて `grade_calc_groups.id`、`grade_calc_group_combos.id`、`grade_calc_group_sub_subjects.id` |
| `red_score_setting_id` | `red_score_settings.id` |
| `created` / `updated` | 既存の操作ユーザー記録方式による作成者／更新者ID |

平均の参照元の学期・時期は別途選択する。科目・項目・単元は対象範囲と一致させる。関連の整合性はアプリケーションで管理し、データベースには外部キー制約を定義しない。

## 2. テーブル定義

### 2.1. `red_score_settings`

| カラム | 型 | NULL許可 | デフォルト | 内容 |
| --- | --- | --- | --- | --- |
| `id` | BIGINT UNSIGNED | 不可 | 自動採番 | ルールの主キー |
| `school_id` | INT UNSIGNED | 不可 | — | 所属する学校 |
| `year` | INT UNSIGNED | 不可 | — | 年度 |
| `evaluate_frame_item_id` | CHAR(32) | 不可 | — | 評価フレーム項目 |
| `setting_name` | VARCHAR(255) | 不可 | — | ルールの識別名称。キーとしては使用しない |
| `sort_no` | INT UNSIGNED | 不可 | — | 優先順位。小さい値から判定する |
| `compare_type` | TINYINT UNSIGNED | 不可 | — | 得点と閾値の比較方法 |
| `threshold_type` | TINYINT UNSIGNED | 不可 | — | 閾値の種類 |
| `threshold_value` | DECIMAL(9,3) | 可 | NULL | 固定点数または百分率 |
| `apply_condition` | TEXT | 可 | NULL | 適用条件のJSON。SQL NULLは項目の対象範囲全体を表す |
| `period_id` | INT UNSIGNED | 可 | NULL | 計算式で参照する平均の学期 |
| `term_id` | INT UNSIGNED | 可 | NULL | 計算式で参照する平均の時期 |
| `grade_calc_conf_id` | CHAR(32) | 可 | NULL | 平均の参照元となる順位集計設定 |
| `population_type` | TINYINT UNSIGNED | 可 | NULL | 参照する母集団の種類 |
| `population_ref_id` | CHAR(32) | 可 | NULL | 種類3/4/6の設定ID。種類1/2/5はNULL |
| `formula` | TEXT | 可 | NULL | 閾値の計算手順と各行の端数処理を保存するJSON |
| `round_flg` | TINYINT UNSIGNED | 可 | NULL | 満点に対する割合の端数処理を行うかどうか |
| `round_type` | TINYINT UNSIGNED | 可 | NULL | 端数処理の方法 |
| `round_digits` | TINYINT UNSIGNED | 可 | NULL | 端数処理を行う桁 |
| `active` | TINYINT UNSIGNED | 不可 | 0 | 0：未適用または無効化／論理削除済み。1：必要な設定が揃った有効なルール |
| `created_at` | TIMESTAMP | 不可 | CURRENT_TIMESTAMP | 作成日時 |
| `created` | INT | 不可 | — | 作成者 |
| `updated_at` | TIMESTAMP | 可 | NULL | 最終更新日時 |
| `updated` | INT | 可 | NULL | 最終更新者 |

### 2.2. `red_score_results`

| カラム | 型 | NULL許可 | デフォルト | 内容 |
| --- | --- | --- | --- | --- |
| `id` | BIGINT UNSIGNED | 不可 | 自動採番 | 主キー |
| `school_id` | INT UNSIGNED | 不可 | — | 得点セルが所属する学校 |
| `year` | INT UNSIGNED | 不可 | — | 年度 |
| `evaluate_frame_item_id` | CHAR(32) | 不可 | — | 評価フレーム項目 |
| `group_id` | INT UNSIGNED | 不可 | — | 授業 |
| `student_id` | INT UNSIGNED | 不可 | — | 生徒 |
| `tangen_id` | INT UNSIGNED | 不可 | 0 | 単元。通常の得点は0 |
| `cell_generation` | CHAR(32) | 不可 | — | 新規・再作成時に発行する世代token。再利用しない |
| `write_version` | BIGINT UNSIGNED | 不可 | 0 | セルごとの最新予約／書込み版数 |
| `judged_version` | BIGINT UNSIGNED | 可 | NULL | 最後に保存した判定の予約版数 |
| `rule_revision` | BIGINT UNSIGNED | 可 | NULL | 最後の判定で使用したルール一覧版数 |
| `red_score_setting_id` | BIGINT UNSIGNED | 可 | NULL | 判定時に選択したルール |
| `judgment_status` | TINYINT UNSIGNED | 可 | NULL | 最後に完了した判定の状態。初回予約のみならNULL |
| `is_red` | TINYINT UNSIGNED | 可 | NULL | 判定成功時の赤点／非赤点の結果 |
| `reason_code` | VARCHAR(32) | 可 | NULL | 判定結果を出せない場合の理由コード |
| `judgment_context` | TEXT | 可 | NULL | 判定に使用したデータの情報を保存するJSON |
| `judged_at` | DATETIME | 可 | NULL | 保存した判定の完了日時。未判定ならNULL |
| `created_at` | TIMESTAMP | 不可 | CURRENT_TIMESTAMP | 行の作成日時 |
| `created` | INT | 不可 | — | 作成者 |
| `updated_at` | TIMESTAMP | 可 | NULL | 行の最終更新日時 |
| `updated` | INT | 可 | NULL | 最終更新者 |

### 2.3. キーとインデックス

| テーブル | キー／インデックス | カラム | 目的 |
| --- | --- | --- | --- |
| settings | PRIMARY KEY | `id` | ルールの識別 |
| settings | `idx_red_score_settings_01` | `school_id, year, evaluate_frame_item_id, active, sort_no` | 項目ごとに有効なルールを優先順位順で取得する |
| results | PRIMARY KEY | `id` | 結果行の識別 |
| results | `uk_red_score_results_01` | `school_id, year, evaluate_frame_item_id, group_id, student_id, tangen_id` | 1つのセルに対する現在有効な行を1行に制限する |
| results | `idx_red_score_results_01` | `school_id, year, group_id, student_id` | 学校・年度・授業・生徒による結果取得 |

両テーブルともInnoDBを使用し、テーブル単位で `utf8mb4` と `utf8mb4_general_ci` を設定する。CHAR(32)のIDは正規化された16進コードとし、参照元の識別・比較方式と互換性を持たせる。参照元のID自体は変更しない。

## 3. JSONデータ

既存テーブルの追加カラムは、公開項目に `red_score_display_type TINYINT UNSIGNED NOT NULL DEFAULT 0`、評価フレーム項目に `red_score_revision BIGINT UNSIGNED NOT NULL DEFAULT 0`。効果は5節、版数は6節で定義する。既存の型・key・照合順序は変更せず、追加indexや外部キーは設けない。

### 3.1. 参照元の情報

参照元は `period_id`、`term_id`、`grade_calc_conf_id`、`population_type`、`population_ref_id` の5項目で指定する。この構造を計算式の参照元カラムおよび `apply_condition` 内で使用する。

| `population_type` | 参照する母集団 | `population_ref_id` | 具体的な母集団の特定方法 |
| --- | --- | --- | --- |
| 1 | 学年 | NULL | 当該年度の生徒の学年 |
| 2 | ホームルーム | NULL | 当該年度の生徒のホームルーム |
| 3 | 順位集計グループ | `grade_calc_groups.id` | `grade_calc_group_members` の所属情報から `grade_calc_group_item_id` を特定する |
| 4 | 組み合わせグループ | `grade_calc_group_combos.id` | `grade_calc_group_combo_items` のグループ種別と対応する所属グループから特定する |
| 5 | 授業 | NULL | 対象セルの `group_id` に対応する授業別集計 |
| 6 | 科目グループ | `grade_calc_group_sub_subjects.id` | 対象科目の個別指定、なければ設定済みdefaultから種類1–5と対象を解決する |

この表は保存型の一覧であり、常に6種類を表示する指定ではない。学校・年度の `grade_calc_detail_conf.use_calc_hr_grade`、`use_calc_homeroom`、`use_calc_group` が1の場合だけ学年・HR・授業を選択可能とする。**顧客確認済みのA:** 順位集計グループ・組み合わせ・科目グループは当該学校／年度の設定が存在すれば名前で選択でき、上記3つのフラグとは独立する。フラグがすべて0でも、その理由だけで設定済みグループの表示・選択・保存を拒否しない。赤点側に独立した集計スイッチを追加しない。

成績公開設定の例と同じく、対象の順位集計設定を選択してから集計対象（母集団）を選択する。既存の時期指定は維持し、同じ `grade_calc_conf_id` の対応結果を種類で読み分ける。適用条件側と式側の両方にこの選択動作を使うが、保存する参照元は独立させる。例示画面の順位・表示項目名・グラフ設定は赤点側へ追加しない。

画面表示とserver保存検証で上記の区分別の利用可否を使い、利用不可の直接選択や別学校／年度のIDは拒否する。保存済み参照そのものが後から無効になった場合は黙って別の種類へ変えず、次の判定で `source_invalid` とする。単に設定が変わった時点では前回結果を消さない。設定済みグループを選択できても、有効な集計結果がなければ `source_missing` であり、選択可能性と結果の存在を混同しない。科目グループのdefaultの存在／型／権限／参照整合性は検証するが、学年・HR・授業のフラグを科目グループ自体の選択可否に転用しない。再帰的な科目グループ参照は許可しない。

種類5は科目だけでなく授業IDまで一致させる。種類6は選択した科目グループIDと解決後の種類・対象を両方保持し、その種類に対応する集計を読む。適用条件と式に同じ構造を使うが、選択値は独立して保存する。

グループ名称ではなくIDを使用し、学校・年度・学期／時期・母集団・科目・項目・単元を一致させる。対応する確定済み集計結果を優先し、それがない場合のみ最新の完了済み集計結果を使用する。データが不足または矛盾する場合は判定不可とし、別のグループや参照元に自動で切り替えない。

母集団の得点率は既存の集計結果を端数処理前の値で使用し、個人別得点率の平均を別途計算しない。授業間で満点が異なることだけを理由に設定を禁止したり、処理を停止したりしない。

### 3.2. `apply_condition`

`apply_condition` は `filters` と `aggregate_conditions` で構成する。各フィルターには `type`、空でない `values`、必要な種類では `key_id` を持たせる。各集計条件には `metric=average|group_rate`、`operator=lt|lte|gte|gt`、10進数の文字列である比較値 `value`、3.1節の `source` を持たせる。得点率の比較値は0–100とし、比較演算子は順に <、≤、≥、> を表す。

| `filters[].type` | `values` の内容 | `key_id` |
| --- | --- | --- |
| `hr_grade` | 学年の数値 | 使用しない |
| `subject` | `subjects.id` | 使用しない |
| `sub_subject` | `sub_subjects.id` | 使用しない |
| `group` | `groups.id` | 使用しない |
| `homeroom` | `homerooms.id` | 使用しない |
| `calc_group` | `grade_calc_group_items.id` | `grade_calc_groups.id` |
| `choice` | 項目の選択肢コードの文字列。表示名称ではない | `grade_evaluate_frame_items.id` |

`values` 内の値、および同じ `type` の要素は、keyが異なる場合もORで結合する。各値とkeyの対応は保持する。異なるtype間はANDとし、`aggregate_conditions` 同士、およびfiltersの結果との結合もANDとする。同じtype/keyのvaluesは統合し、重複を除く。AND/ORの入れ子構造は保存しない。

例：学年1または2で、グループAまたはBに属する条件は、A/Bのkeyが異なる場合も `(学年1 OR 学年2) AND (A OR B)` と解釈する。

授業201に対し、母集団の得点率が65%以上の場合に適用する例：
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

例中のIDはデータ構造を示すための仮の値である。

SQL NULLは項目の対象範囲全体を表す。JSON null、空の文字列／object、未定義のキー、または両方のarrayが空のデータは受け付けない。

ORはいずれか1つが一致すれば成立し、ANDはいずれか1つが不一致なら対象外となる。判断に必要な情報が不足する場合は判定不可とする。不正なJSONや権限外の参照を、別の条件が成立することを理由に無視してはならない。

優先順位順で最初に一致したルールを選択する。選択したルールで閾値を算出できない場合は判定不可とし、優先順位の低いルールを試さない。十分な情報があり、どのルールにも一致しない場合は対象外とする。

### 3.3. `formula`

`steps` を持つobjectとして計算手順を保存する。arrayの順序が計算順序であり、最後の手順の結果を閾値とする。

| 要素 | 定義 |
| --- | --- |
| `id` | 計算式内で一意かつ安定した内部ID。`[A-Za-z0-9_-]` に含まれるASCII文字で1–32文字 |
| `left` / `right` | 平均、定数、または前の手順の結果を表すオペランド |
| `operator` | `add`、`subtract`、`multiply`、`divide` |
| `rounding.enabled` | Boolean。デフォルトはfalse |
| `rounding.type` / `rounding.digits` | enabled=trueの場合は4.2節に従って必須。falseの場合は保存しない |

オペランドは次の3種類とする：
- `{"type":"average"}`：設定カラムで指定した参照元の平均。
- `{"type":"constant","value":"0.8"}`：数値または係数。
- `{"type":"step","step_id":"s1"}`：前にある手順の端数処理後の結果。

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

上記の例では、平均49.7 → 24 → 閾値19.2となる。計算式には少なくとも1つの完全な手順が必要で、参照できるのは存在する前の手順のみとする。並べ替え・削除で参照先を取り違えてはならない。定数の分母が0の場合は保存を拒否し、判定時にオペランド不足、0除算、不正な結果が生じた場合は判定不可とする。

### 3.4. `judgment_context`

現在の判定に使用した情報を保存する。全履歴や集計元の生徒一覧は保存しない。

| 要素 | データ |
| --- | --- |
| `score` | 使用した得点を数値文字列で保存。得点がない場合はNULL |
| `threshold` | 既約分数の整数の分子／分母。分母は正数。例：`{"numerator":"30","denominator":"1"}`。閾値がない場合はNULL |
| `compare_type` | 使用した比較方法に対応する1/2。未決定の場合はNULL |
| `maximum` | 得点率の計算で使用した満点を数値文字列で保存。使用しない場合はNULL |
| `sources` | 実際に使用した参照元のarray。参照元を使用しない場合は空のarray |

`sources` の各要素には次を保存する：
- `usage`：`condition`、`formula` または `both`。
- `kind`：確定済み集計結果は `confirmed`、最新の完了済み集計結果は `latest`。
- `reference`：実際の参照元を識別する `provider` と `key` を持つobject。
- 3.1節の参照元を表す5項目。
- `sub_subject_id`、`evaluate_item_id`、`tangen_id`、および特定した母集団のID／学年を文字列で保持するリスト `population_key`。
- 種類6では `resolved_population_type`（1–5）と `resolved_population_ref_id` を追加し、元の `population_type=6`／選択IDを上書きしない。種類5、または6から5へ解決した場合、`population_key` に実際の授業IDを保存する。

有効な得点を使った判定では `grade_id` に元の `grades.id` も記録する。これは説明用の記録であり、6節の版数制御の代替ではない。

状態1ではscore、threshold、compare_typeを必須とする。状態2では判明した情報を保持する。状態3/4では、今回使用していない前回の閾値・比較方法・参照元を残さない。

分子／分母は各整数を最大256桁とする案とし、範囲を超える場合は判定結果を出さない。入力パラメーターの精度制限を、これらの算出値に適用しない。氏名・連絡先・SQLエラーは保存せず、得点セルのアクセス権限に従って保護する。

## 4. データ制約

### 4.1. 閾値の種類と有効条件

`compare_type`：**1** = 未満（`S<T`）、**2** = 以下（`S≤T`）。

| `threshold_type` | 意味 | `threshold_value` | 計算式の平均参照元 | `formula` | ルール単位の端数処理 |
| --- | --- | --- | --- | --- | --- |
| 1 | 固定点数 | 必須 | すべてNULL | NULL | 3カラムともNULL |
| 2 | 満点に対する割合 | 必須 | すべてNULL | NULL | `round_flg=0` または `1` |
| 3 | 計算式 | NULL | 平均のオペランドがある場合は必須。使用しない場合はすべてNULL | 必須 | 3カラムともNULL。各手順に端数処理を保存する |

- 種類1：保存時または適用範囲変更時に、すべての対象について `0≤N≤M` を確認する。その後に満点が変更されてもNは自動変更しない。
- 種類2：`0≤N≤100` とし、得点セル・単元・授業の選択設定に対応する現在有効な満点を使用する。満点は正の有限値でなければならない。不足／不正な場合は判定不可とし、100や確定済み集計結果の満点で代用しない。
- 種類3：正しく算出された負の閾値は判定結果に保存し、0に補正しない。
- 適用条件の参照元と計算式の参照元は独立している。固定点数でも、適用条件が平均／母集団の得点率を使用する場合は参照元が必要となる。
- `sort_no≥1` とし、有効なルールを `sort_no,id` の確定した順序で取得する。ルール名称は一意でなくてもよい。
- 入力途中のルールを `active=1` にしてはならない。閾値の種類を変更した場合、使用しないカラムはSQL NULLで保存する。
- ルールは論理削除とし、結果を連鎖削除しない。IDを別のルールに再利用しない。

### 4.2. 端数処理と保存範囲

満点に対する割合では `round_flg=0` をデフォルトとし、type/digitsはNULLとする。端数処理を有効にする場合は両方を必須とする。計算式では同じ設定を各手順に保存する。

| フィールド | 有効な値 |
| --- | --- |
| `round_type` | 1：最も近い値へ丸め、ちょうど中間の場合は0から遠い方向。2：ceilによる切り上げ。3：floorによる切り捨て |
| `round_digits` | 1–9。pの場合、結果の小数部はp−1桁となる |

保存範囲の提案：

| データ | 制限 |
| --- | --- |
| ルール名称 | 前後の空白を除去した後、1–255文字 |
| 固定点数／百分率 | DECIMAL(9,3)に従い小数部は最大3桁。上記の業務上の制限も適用する |
| JSON内の係数・比較値 | 10進数の文字列。整数部は最大9桁、小数部は最大8桁 |
| 計算式 | 最大20手順 |
| 各TEXTカラム | UTF-8のデータ量で最大60,000バイト |

制限を超える値は拒否し、自動で切り詰めたり丸めたりしない。入力制限を端数処理前の平均に適用しない。閾値の代わりに生徒の得点を丸めてはならない。

### 4.3. 判定結果の状態

| 状態 | `judgment_status` | `is_red` | `red_score_setting_id` | `reason_code` |
| --- | --- | --- | --- | --- |
| 未判定 | 行なし、または初回制御行のNULL | NULL | NULL | NULL |
| 赤点 | 1 | 1 | 必須 | NULL |
| 赤点ではない | 1 | 0 | 必須 | NULL |
| 判定不可 | 2 | NULL | ルール選択済みの場合はそのID。それ以外はNULL | 必須 |
| 対象外 | 3 | NULL | NULL | `no_applicable_rule` |
| 得点なし | 4 | NULL | NULL | `no_score` |

状態2の理由コード：

| コード | 意味 |
| --- | --- |
| `source_missing` | 集計元データがない |
| `source_invalid` | 集計元データが不正、または対象範囲と一致しない |
| `membership_missing` | 所属する母集団を特定できない |
| `membership_ambiguous` | 母集団の所属情報が矛盾している |
| `maximum_invalid` | 割合の計算に使用する満点が不正 |
| `condition_invalid` | 適用条件が不正 |
| `formula_invalid` | 計算式が不正 |
| `division_by_zero` | 分母が0 |
| `numeric_overflow` | 計算結果が対応する数値範囲を超えている |

`is_red=NULL` は「赤点ではない」という判定ではない。再判定待ちでは前回の行を保持し、専用の状態は追加しない。状態と関連フィールドは一緒に保存を完了させる。保存エラーは業務上の「判定不可」とは区別する。

### 4.4. 更新と結果の有効性

| イベント | データの変更 |
| --- | --- |
| 閾値・条件・参照元・順序の変更 | settingsとownerの `red_score_revision` を同transactionで更新し、前回の結果を保持する |
| ルールの無効化／論理削除。最後のルールも含む | activeとownerの版数を更新し、次の判定まで前回の結果を保持する |
| 判定の完了 | 4.3節の状態に従って現在有効な1行を更新する。判定不可または対象外の場合、前回の結論は無効になる |
| 得点の削除による空欄化、または得点の無効化 | 同transactionで世代と版数を進めstatus=4。旧判定payloadを消す |
| セルの識別の削除または置換 | 制御行をtombstoneとして残し旧判定を停止。再作成時に新世代を発行し、旧結果を引き継がない |
| 閲覧・抽出・印刷 | 判定データを変更しない |

有効な得点が残っているセルのうち、`judgment_status=1 AND is_red=1` の結果だけを赤点の表示・抽出条件に使用する。ルールの無効化だけでは前回の結果は失効しない。再判定は、有効なルールがなくても前回の結果が残るセルを対象に含める。

判定結果は最終的な得点と整合させる。古いデータを使用した処理の保存は6節の世代・版数照合で拒否する。`judged_at` は監査日時であり、順序判定には使わない。

### 4.5. コピーと年度処理

- 操作対象の範囲内の設定だけをコピーし、評価フレーム項目・学期／時期・順位集計設定・母集団・JSON内のIDを対応付け直す。
- すべての参照が有効な場合のみコピー先のルールを保存する。所属先の評価フレーム項目を対応付けできなければルールを作成しない。その他の参照が不足する場合は、既存のコピー先ルールを上書きしない。
- 対応付けエラーを回避するためにフィルターを削除したり、`apply_condition` をNULLに変更したりしない。コピー処理の既存の一括／部分処理方式を維持し、保存できなかった範囲を通知する。
- 個人の判定結果や前年度の確定済み集計結果への参照を、新年度へコピーしない。
- 世代token・予約版数・完了版数もcopy/import/復元元から持ち込まない。ruleを移す先のowner版数を進める。種類6の設定と依存する科目／グループも対応付け、種類5は移行先セルの授業を解決する。公開設定のcopyは5節に従う。
- 既存の `red_score` と `changed_red_score` は変更しない。新しいルールへの変換や、設定がない場合の代替値としての利用も行わない。

## 5. 公開設定ごとの表示効果

`grade_publish_conf_grade_items.red_score_display_type` は `0=なし、1=括弧、2=前に*、3=後に*`。既存の `grade_publish_conf_id + year + evaluate_item_id + tangen_flg` の単位で保存する。`tangen_flg` は通常／単元区分であり、個別単元IDではない。対象となる数値項目のみ設定可能とし、未知の値・権限外の設定をserverで拒否する。未設定／既存行は0で表示を維持する。

例：同じ項目の赤点24を公開Xでは `(24)`、公開Yでは `*24` とできる。通常／単元の設定も独立。個人結果へ表示設定を保存せず、同じ判定を各公開設定の効果で表示する。

保存では `GradePublishConfController` のPOST整形と項目行の削除／再登録に新値を含める。`GradePublishConfGradeItems_m::getByPublishConfId` の明示SELECT、編集画面の読戻し、`GradePublishService` からweb/API/PDFへの受渡しにも含める。設定全体のtransactionを維持し、保存失敗は旧設定を保持する。コピーでは新公開設定IDへ効果を引き継ぎ、個人判定はコピーしない。年度をまたぐ対応経路では項目／年度も対応付け、失敗時は既存の全体／部分失敗の単位を維持する。

既存の見込点効果を置き換えず、異なる効果を合成して同じ効果を一度だけ適用する。非表示、権限、公開期間、背景・書式を維持する。別表示テーブル案は、現行行で必要な粒度を表せるため採用しない。子行IDが保存時に変わる問題を持ち込まず、既存のcopy経路を再利用する。

## 6. 同時更新の具体的な方式

### 6.1. 制御データとlock対象

このv2ではセルの制御行を `red_score_results` に同居させる。キーをK、`cell_generation` をG、予約した `write_version` をV、ownerの `red_score_revision` をRとし、workerは `(K,G,V,R,grade_id)` を保持する。Gは既存のID生成方式に合わせた新規CHAR(32) tokenで、削除／再作成時に発行し直す。版数はDBのlock内で増加し、上限時は失敗させて0に戻さない。

すべての参加writerは、同じ書込み接続のtransaction内で、対象 `grade_evaluate_frame_items` をID順に `FOR SHARE`、対象授業の既存 `groups` 行をID順に `FOR UPDATE`、対象Kの制御行をキー順に `FOR UPDATE`、存在する `grades` 行をID順に `FOR UPDATE` の順で取得する。設定追加／編集／削除／並べ替えはownerを `FOR UPDATE` で取得し、rule更新とRの増加を同transactionで行う。評価の通常読取りをread replicaへ逃がさず、lock後は必要な現行値を読み直す。

初回の制御行はunique keyでinsertし、重複時は既存行を取得してlockする。既存payloadを上書きするupsertは使わない。初期V=0、`judged_version`／`rule_revision`／判定payload／`judged_at` はNULL。この行の存在だけでは判定済みと扱わない。ownerまたは授業が削除済み、権限外なら作成／保存しない。

異なる項目のKは別でも、一つの `grades` 行の別カラムを共有する。その行が未作成の場合の共通lockは上記の `groups.id` とする。取得後、学校・年度・生徒・授業・学期・時期・単元の物理識別で `grades` をcurrent locking readし、待機中に作成された行があればそのIDで必要なカラムだけを更新する。未存在の場合だけinsertし、複数の有効行があれば整合性エラーとしてrollbackする。transaction前の「行なし」判定を再利用しない。

この方式は同じ授業の書込をtransaction単位で直列化するコストを持つ。batch全体の計算中は授業lockを保持せず、予約／保存transactionの間で解放する。関連科目の入力・更新先も必要な授業集合に含める。全参加writerがこの順序を守ることが前提であり、将来より細かいlockへ変える場合も未作成の物理行を共有する排他点を残す。

複数セル・関連科目は変更前に対象を確定し、同じ順序でまとめてlockする。途中で追加対象が判明したらそのtransactionをrollbackして対象を再構成する。既存の点数lockを取得した後に逆順で制御lockを追加しない。

### 6.2. 通常登録とbatch

- 通常入力／CSV／試験連携：点数変更前に上記lockを取得しVを増加。既存の計算・制限・関連更新後の最終点で判定し、点数と判定payload、`judged_version=V`、`rule_revision=R` を同transactionで保存する。手入力／式なし／連携後のAutoRating skipでも実更新セルを落とさない。保存失敗はこのtransactionをrollbackする。
- 判定だけのbatch：短い予約transactionでlock、V増加、点数とRおよび参照値の取得を行いcommitする。計算はその入力で実行。保存transactionで同じ順のlockを取り、G、V、R、元の点数行ID／有効性を照合する。`write_version=V` かつ `judged_version IS NULL OR judged_version<V` のときだけpayloadと完了版数を保存する。世代／版数不一致は上書きせず、旧ticketを破棄する。完了済みVの再送も更新しない。
- 点数も変更するbatch：上記の結果保存だけを後付けしない。計算入力を取得する前にticketを確保し、点数書込前に検証するか、対象範囲の計算・最終点・判定を同transaction／lock内に収める。関連入力を使う計算では入力側の変更も検証／保護する。既存AutoRatingの古い値を無条件に保存してから新しいticketを取得する方式は不可。

予約は前回完了payloadを消さない。読み手は `write_version != judged_version` や現在のrule版数差だけで前回結果を無効化しない。点数と結果は同じ整合した読取り範囲で取得し、別時点の組合せを出力しない。初回NULL、判定不可、対象外、得点なしは赤点扱いしない。

### 6.3. 削除・再作成、参照元、失敗

空欄化／論理削除／単元非使用／復元による削除は、同lockとtransactionで新Gを発行しVを増加、状態4と `judged_version=V` を保存し旧rule／閾値／参照情報を消す。制御行は残す。再作成時はさらに新Gと版数を使い、旧判定を引き継がない。通常の点数変更はVを増加するため29→40→29でも旧ticketは無効。制御行の物理削除やtoken再利用はこの版の通常処理に含めない。

参照元と最大値は入力取得時点で一貫して読み、同じ参照元のscalar値を一回の処理で使い回す。確定済み優先、期／科目／単元／母集団、raw精度を維持し、書換え中の集計から異なる時点を混ぜない。source IDが不変でも値が上書きされる保存方式なら、整合したsnapshot読取りまたはprovider版数で一貫性を保証する。source変更だけで全校を自動再判定する仕組みは追加しない。

旧処理は `superseded` として進捗上区別し、判定成功／判定不可に数えない。新しい処理の結果を消したり、削除済みセルを自動再作成したりしない。deadlock／timeoutは全transactionをrollbackし、既存jobの有限retry方針で再取得する。既存に有限retryがない経路では自動retryを追加せず、失敗範囲と手動再実行を案内する。batch全体のrollbackは約束しない。

### 6.4. 接続範囲と確認例

| 経路 | 必要な接続 |
| --- | --- |
| `AdminNBGradeSettingSystemLessonController`／`LessonCsvController` | transaction開始直後、点数や依存する選択値の書込前に対象を確定・lock。成功通知前に最終判定を保存 |
| `ScoringResultService` | 点数登録前にlockし、AutoRating skipでも登録済みセルの判定を同transactionで保存 |
| `AutoRating`／`AutoRatingBatch` | `save`、主副科目の `saveGradeToParentSubSubject`、関連copyを含めて入力と更新先を保護。外側のtransactionを途中commitしない |
| `Grades_m::regist/registReturnId/insertBatch/updateBatch/deleteGrade` | 共通の参加契約を必須とし、呼出側から対象Kとtransactionを渡す。ここだけで対象frameや最終値を推測しない |
| `FailbackUsecase::deleteGradeInfo`、単元削除／非使用、frame置換 | 削除対象の制御行を先にlockし、旧世代を失効。copy/import/復元で制御値を移植しない |

リリース対象のwriterがこの契約に参加していることを実装時に確認する。旧成績系・学校独自writerは調査済みと見なさず、未対応経路で変更されるセルに整合性を保証したと宣言しない。

例：batch Aが29を読んでV=10を予約→通常登録Bが40／非赤点をV=11で保存→AはV不一致で保存しない。A/Bの初回競合、同点への戻り、空欄再入力、再作成、rule変更、重複callback、保存失敗も同じ契約で確認する。2接続の競合試験、query件数／lock時間、出力の整合性は未実施であり、実装後の受入で証明する。
