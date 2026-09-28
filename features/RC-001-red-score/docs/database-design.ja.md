# データベース設計 — 赤点機能

日付：**2026年9月28日**。

以下の2テーブルを設計案とする。

## 1. 概要と関連

| テーブル | 目的 | 保存単位 |
| --- | --- | --- |
| `red_score_settings` | 赤点の適用条件、優先順位、閾値を保存する | 学校・年度ごとの評価フレーム項目に対する1つのルール |
| `red_score_results` | 成績抽出・成績公開・通知表で共通利用する判定結果と状態を保存する | 1つの得点セルの現在有効な状態 |

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
| `population_ref_id` | 母集団の種類に応じて `grade_calc_groups.id` または `grade_calc_group_combos.id` |
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
| `population_ref_id` | CHAR(32) | 可 | NULL | 順位集計グループ種別または組み合わせグループのID |
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
| `red_score_setting_id` | BIGINT UNSIGNED | 可 | NULL | 判定時に選択したルール |
| `judgment_status` | TINYINT UNSIGNED | 不可 | — | 最後に完了した判定の状態 |
| `is_red` | TINYINT UNSIGNED | 可 | NULL | 判定成功時の赤点／非赤点の結果 |
| `reason_code` | VARCHAR(32) | 可 | NULL | 判定結果を出せない場合の理由コード |
| `judgment_context` | TEXT | 可 | NULL | 判定に使用したデータの情報を保存するJSON |
| `judged_at` | DATETIME | 不可 | — | 保存した判定の完了日時。判定不可／対象外も含む |
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

### 3.1. 参照元の情報

参照元は `period_id`、`term_id`、`grade_calc_conf_id`、`population_type`、`population_ref_id` の5項目で指定する。この構造を計算式の参照元カラムおよび `apply_condition` 内で使用する。

| `population_type` | 参照する母集団 | `population_ref_id` | 具体的な母集団の特定方法 |
| --- | --- | --- | --- |
| 1 | 学年 | NULL | 当該年度の生徒の学年 |
| 2 | ホームルーム | NULL | 当該年度の生徒のホームルーム |
| 3 | 順位集計グループ | `grade_calc_groups.id` | `grade_calc_group_members` の所属情報から `grade_calc_group_item_id` を特定する |
| 4 | 組み合わせグループ | `grade_calc_group_combos.id` | `grade_calc_group_combo_items` のグループ種別と対応する所属グループから特定する |

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
| 未判定 | 行なし | — | — | — |
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
| 閾値・条件・参照元・順序の変更 | settingsを更新し、前回の結果を保持する |
| ルールの無効化／論理削除。最後のルールも含む | activeを更新し、次の判定まで前回の結果を保持する |
| 判定の完了 | 4.3節の状態に従って現在有効な1行を更新する。判定不可または対象外の場合、前回の結論は無効になる |
| 得点の削除による空欄化、または得点の無効化 | セルの識別が存続する場合はstatus=4に更新する |
| セルの識別の削除または置換 | 旧セルに紐づく結果を削除し、新しいセルへ引き継がない |
| 閲覧・抽出・印刷 | 判定データを変更しない |

有効な得点が残っているセルのうち、`judgment_status=1 AND is_red=1` の結果だけを赤点の表示・抽出条件に使用する。ルールの無効化だけでは前回の結果は失効しない。再判定は、有効なルールがなくても前回の結果が残るセルを対象に含める。

判定結果は最終的な得点と整合させる。古いデータを使用した処理が新しい結果を上書きしてはならない。`judged_at` と一意キーだけではこの整合性は保証されない。

### 4.5. コピーと年度処理

- 操作対象の範囲内の設定だけをコピーし、評価フレーム項目・学期／時期・順位集計設定・母集団・JSON内のIDを対応付け直す。
- すべての参照が有効な場合のみコピー先のルールを保存する。所属先の評価フレーム項目を対応付けできなければルールを作成しない。その他の参照が不足する場合は、既存のコピー先ルールを上書きしない。
- 対応付けエラーを回避するためにフィルターを削除したり、`apply_condition` をNULLに変更したりしない。コピー処理の既存の一括／部分処理方式を維持し、保存できなかった範囲を通知する。
- 個人の判定結果や前年度の確定済み集計結果への参照を、新年度へコピーしない。
- 既存の `red_score` と `changed_red_score` は変更しない。新しいルールへの変換や、設定がない場合の代替値としての利用も行わない。
