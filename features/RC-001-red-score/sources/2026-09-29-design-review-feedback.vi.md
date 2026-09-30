# Phản hồi review thiết kế — năm điểm cần thống nhất

Ngày ghi nhận: **29/09/2026**. Nguồn: nguyên văn khách hàng do người phụ trách cung cấp trong phiên; chưa có permalink hoặc ngày gửi được xác minh độc lập. Người phụ trách yêu cầu cập nhật tài liệu và Figma theo phản hồi này. Reply tiếng Anh do agent soạn là bản nháp; chưa có bằng chứng đã gửi hoặc khách hàng đã trả lời đề xuất AND.

## ① Rule chưa hoàn chỉnh và đã xóa

> 未完成ルールと削除済みルールを区別できる状態を保存する現在の active=0 は「未適用・無効・論理削除」を兼ねています。一方、条件だけ保存した状態のモックでは、未完成ルールを一覧に残し、「基準設定を開く」から編集を続けます。この未完成ルールを削除すると、削除前後とも active=0・基準未入力の状態になります。現在の定義には削除を識別する別の情報がなく、一覧へ戻す未完成行と、一覧から除く削除済み行を判別できないのでは？

Nghĩa: `active=0` đang gộp chưa áp dụng, vô hiệu và xóa mềm. Mockup vẫn giữ dòng chỉ mới lưu điều kiện để tiếp tục bằng Mở thiết lập ngưỡng（基準設定を開く）. Xóa dòng đó vẫn cho cùng dữ liệu active=0/ngưỡng trống; cần trạng thái phân biệt dòng tiếp tục sửa với dòng phải loại khỏi danh sách. Khách hàng yêu cầu phân biệt trạng thái, không chỉ định tên cột hay kiểu lưu.

## ② AND/OR của điều kiện trung bình

> 平均条件のAND／ORの説明をそろえる適用条件画面02-Aと02-Bには、「同じ種類の条件はいずれか1つ、種類が違う条件はすべて満たす」とあります。画面上では平均点・集団の得点率も同じ条件追加欄に並ぶため、平均点の条件を2行追加した場合もORと読めます。しかし、DB設計3.2は aggregate_conditions 同士をANDとしています。例えば「平均50点以上」「平均70点未満」を2行設定し、平均が40点の場合、ORなら条件成立、ANDなら不成立です。

Nghĩa: hướng dẫn 02-A/02-B có thể khiến người dùng hiểu hai dòng trung bình cùng loại dùng OR, trái AND trong DB. Với A≥50 và A<70, A=40 thỏa OR nhưng không thỏa AND. Yêu cầu đã rõ là phải thống nhất hướng dẫn và dữ liệu; khách hàng chưa chọn riêng AND hay OR. Phương án tiếp tục dùng AND giữa điều kiện tổng hợp là đề xuất để xác nhận.

## ③ Thời điểm xóa điểm

> 点数削除の反映時点が違う04の注記に「削除した点数は再実行後に空欄」とあります。一方、DB設計は点数の削除・空欄化と同じトランザクションで status=4 にし、旧赤点結果の利用を停止するように見えます。「点数削除を保存した時点で空欄となり、その点数の赤点表示・抽出を停止する」の認識で合っていますか。

Nghĩa: chú thích 04 nói chờ chạy lại mới trống, trái DB xử lý cùng transaction xóa. Khách hàng hỏi xác nhận cách hiểu: khi lưu xóa điểm thành công thì ô trống và ngừng dấu/lọc đỏ của ô. Cách hiểu này phù hợp thiết kế dữ liệu hiện hành; đây không phải thao tác xóa rule. Không diễn giải câu hỏi thành một reply xác nhận từ khách hàng chưa tồn tại.

## ④ Vị trí làm tròn và độ rộng cột

> 計算式の端数処理位置を編集画面・一覧・説明でそろえる同じ「平均60点未満」ルールを示す画面で、次の違いがあります。

| Màn được khách hàng nêu | Dòng 1: trung bình ÷ 2 | Dòng 2: kết quả dòng 1 × 0.8 | T khi A=49.7 |
| --- | --- | --- | --- |
| 03-C | Không xử lý | Làm tròn xuống số nguyên | 19 |
| 01-B, giải thích ngoài 03-C và JSON DB | Làm tròn xuống số nguyên | Không xử lý | 19.2 |

> 例えば19.1点・未満判定なら、前者は非赤点、後者は赤点です。単なる見た目の相違ではありません。DBの例に合わせるなら、03-Cを「式1で切り捨て、式2は処理なし」へそろえてください。異なる設定例を意図している場合は、同じルールの保存前後に見えないよう、別例と明示します。あと、一覧の「ホームルーム平均」が演算子の欄へはみ出している点も、列幅調整で併せて修正してください。

Nghĩa: với S=19.1 và dấu nhỏ hơn, hai cấu hình cho kết luận khác nhau. Nếu dùng ví dụ DB thì 03-C phải làm tròn xuống dòng 1, không xử lý dòng 2; nếu khác ví dụ phải ghi rõ. Điều chỉnh cột để Trung bình lớp chủ nhiệm（ホームルーム平均） không đè sang phép toán. Người phụ trách cho phép cập nhật theo hướng thống nhất với ví dụ DB; không tạo quy tắc mọi công thức phải làm tròn dòng đầu.

## ⑤ Bộ chọn điểm đơn vị bị che

> 単元側の公開表示選択欄が隠れている06の通常／単元比較パネルでは、Aの通常成績に選択欄が見えますが、Bの単元別成績は見出しと結果例だけが見え、選択欄が白い背景に隠れています。Bの「赤点の表示方法」「括弧付きで表示する」が存在しますが、後ろに追加された背景が重なっています。表示順を直して、Bでも独立した選択欄が見えるようにしてください。

Nghĩa: panel B có Cách hiển thị điểm đỏ（赤点の表示方法） và Hiển thị kèm ngoặc（括弧付きで表示する） nhưng bị lớp nền che; cần sửa thứ tự lớp để hiển thị bộ chọn độc lập như panel A.

Các quan sát canvas trên là do khách hàng báo. Tài liệu này không chứng minh agent đã nhìn thấy hoặc sửa những node đó. Hướng xử lý và trạng thái tại [decision](../decisions/DEC-001-review-state-and-ui-consistency.vi.md); checklist tại [hướng dẫn Figma](../docs/v2/figma-update-checklist.vi.md).
