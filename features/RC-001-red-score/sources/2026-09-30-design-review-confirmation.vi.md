# Xác nhận thiết kế ngày 30/09/2026

Nguồn: nguyên văn do người phụ trách cung cấp trong phiên ngày 30/09/2026. Chưa có permalink hoặc thời điểm gửi được xác minh độc lập. Phản hồi này bổ sung/thay thế trạng thái tương ứng của [năm phản hồi ngày 29/09](2026-09-29-design-review-feedback.vi.md); ngày ghi nhận không phải bằng chứng triển khai hoặc sửa Figma.

## ① Trạng thái rule

> できるだけカラム数を増やしたくないため、まずは active を setting_status に変更し、設定途中・無効／有効／削除済みを区別する方法を検討してください。共通処理との都合で active を残す必要がある場合は、理由を整理したうえで deleted_flg を追加する形でお願いします。

Nghĩa: ưu tiên đổi active thành setting_status để quản lý đang thiết lập/vô hiệu, có hiệu lực và đã xóa, hạn chế số cột. Chỉ nếu xử lý chung buộc giữ active thì giải thích lý do và thêm deleted_flg. Không tiếp tục coi active + deleted_at là phương án mặc định. Khách hàng chưa quy định mã số/kiểu dữ liệu cụ thể.

## ② AND/OR

> ご提示の解釈で問題ありません。1つの赤点ルール内では、以下の扱いとしてください。
>
> • 通常の対象フィルタ：同じ種類内はOR、異なる種類間はAND.
> • 平均点・集団得点率の条件：条件同士をANDで結合し、対象フィルタともANDで結合.
> 同じ参照元の平均に対して「50点以上」「70点未満」を設定した場合は、50 ≤ 平均 < 70という意味で、平均40点は対象外です。
> 複数の赤点ルールがある場合は、従来どおり優先順位に従って最初に適用条件が一致したルールを使用します。ルール同士をANDで結合する意味ではありません。

Nghĩa: đã chấp nhận cách kết hợp trong từng rule: bộ lọc OR cùng loại/AND khác loại; các điều kiện trung bình/tỷ lệ nhóm AND với nhau và với bộ lọc. Cùng nguồn A≥50 và A<70 nghĩa là 50≤A<70; A=40 không áp dụng. Nhiều rule vẫn chọn rule đầu tiên khớp theo ưu tiên, không AND các rule. Đây là xác nhận đóng Q35, không còn đề xuất chờ trả lời.

## ③ Xóa điểm

> 認識は一致しています。点数削除の保存が成功した時点で空欄となり、その点数の赤点表示・赤点抽出への利用を停止してください。ルール削除との違いをモックにも反映してください。

Nghĩa: đã xác nhận lưu xóa điểm thành công thì ô trống và ngừng dấu/lọc đỏ của ô ngay. Mockup phải thể hiện khác biệt với xóa rule, không chờ xét lại để xóa dấu của điểm đã mất.

## ④ Làm tròn

> 提示された設定例で統一してください。平均49.7の場合は閾値19.2となり、「未満」なら19.1点は赤点、という認識で一致しています。文字の重なりも修正をお願いします。

Nghĩa: đã đồng ý thống nhất theo ví dụ: A=49.7 cho T=19.2; S=19.1 với dấu nhỏ hơn là đỏ. Giữ cấu hình dòng 1 cắt xuống số nguyên, dòng 2 không xử lý; sửa chữ chồng nhau.

## ⑤ Hiển thị điểm đơn vị

> 提示された修正方針で問題ありません。通常成績と単元別成績で、それぞれ独立した選択内容が確認できるようにしてください。

Nghĩa: đồng ý hướng sửa, hai phía điểm thường/đơn vị phải hiển thị được lựa chọn riêng biệt. Không phải bằng chứng panel B đã sửa xong.

Theo dõi quyết định lưu trạng thái tại [DEC-002](../decisions/DEC-002-setting-status.vi.md) và tình trạng công việc tại [context](../CONTEXT.md#review-consistency-20260930). Bộ tài liệu gửi review tiếp tục chỉ mô tả thiết kế, không đưa lịch sử phản hồi lên tài liệu hoặc canvas.
