# DEC-002 — 赤点ルールを1つの状態カラムで管理する

日付：**2026年9月30日**。対象：RC-001。[新しい回答](../sources/2026-09-30-design-review-confirmation.vi.md)と担当者の更新指示に基づく。[DEC-001](DEC-001-review-state-and-ui-consistency.ja.md)の①、active + deleted_at案を置き換える。

## 決定と承認範囲

新規ruleテーブルは `setting_status TINYINT UNSIGNED NOT NULL DEFAULT 0` を使用する。現行案ではactiveを残さず、deleted_at／deleted_flgも追加しない。

| 技術上の値 | 意味 | 一覧 | 判定 |
| --- | --- | --- | --- |
| 0 | 設定途中・無効 | 表示。必須項目不足は未完成として編集継続 | 対象外 |
| 1 | 設定完了・有効 | 表示 | 優先順で対象 |
| 2 | 削除済み | 非表示。旧編集画面から復活不可 | 対象外 |

1カラムを優先する方針が顧客要求であり、0/1/2とTINYINTはチームの技術案である。DB規約や顧客指定の番号ではない。初期値0で中間保存が自動的に判定対象になることを防ぐ。実装では名前付き定数と明示比較を使い、truthyや0以外で有効判定しない。2も0以外だからである。設定途中・無効は回答の区分に合わせ0とし、入力の充足で未完成表示を判断する。新しい無効化ボタンは追加しない。

## 共通処理との整合確認

application baseline `7652109b4542ecc9fb392bde6f2afb755a244316` の静的確認では、`application` 内に `red_score_settings` の文字列は見つからなかった。`blend:application/models/common/Base_m.php` は読取り／書込み接続の切替であり、activeカラムやactiveによる自動絞込み／削除を強制していない。これは読んだ範囲の証拠であり、全moduleや実DBの制約不存在を保証するものではない。

確認範囲にactiveを保持する理由がないため、顧客の優先案を採る。統合時に具体的な共通処理依存が判明した場合のみ、経路と理由を整理してactive + deleted_flgを提案する。両方をDDLへ同時採用したり、未要求の削除日時を追加したりしない。

`rules/development/database-rules.md` は型の整合、comment、index規約を定めるが、statusを0/1/2にする指定はない。規約の文字列status例も全状態を文字列に統一する命令ではない。他テーブルの既存enumは変更しない。

## 影響

- DB／DDLのカラムとindexをsetting_statusへ変更し、0/1/2のみ受理する。一覧はIN (0,1)、判定は=1。
- 中間保存は0と未入力値を保持し、validation後に1とする。削除は2への更新とrule版数増加を同transactionで実施する。旧フォームやcopyからの復活・ID再利用を防ぐ。
- rule変更／削除だけでは完了済みの個人判定を次回判定まで保持する。点数削除は保存成功と同時に旧記号／抽出を停止する。
- AC／UIは動作を説明し、状態番号やカラム名をcanvasに出す必要はない。
- Q35–Q38は直接の確認回答あり。ANDはrule内、複数ruleは最初の適用条件一致を使用する。以前の回答待ち表現を現行状態として残さない。

## Lessonsと残る作業

追加カラムより先に1つの状態でライフサイクルを表現する。小さい整数型をbooleanと混同せず、保存コードの選択を規約と呼ばない。新回答はcontext・読取り条件/index・task・UI案内まで反映し、置換済み設計の履歴はdecisionに保持して提出文書へ混在させない。

実装・DDL実行は未実施。Figmaは[checklist](../docs/v2/figma-update-checklist.ja.md)で再確認が必要であり、要件への同意は修正完了の証拠ではない。
