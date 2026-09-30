# Checklist cập nhật Figma theo năm phản hồi

Ngày: **30/09/2026**. Đã đối chiếu trực tiếp trên Figma MW hiện hành (bản Nhật); toàn bộ 36 mục dưới đây đã được kiểm và đánh dấu. Căn cứ: [nguồn phản hồi](../../sources/2026-09-29-design-review-feedback.vi.md), [decision và lessons](../../decisions/DEC-001-review-state-and-ui-consistency.vi.md), [DB](database-design.vi.md), [AC](acceptance-criteria.vi.md), [chia việc](split-tasks.vi.md).

**Hướng hiện hành:** dùng [xác nhận 30/09](../../sources/2026-09-30-design-review-confirmation.vi.md) và [DEC-002](../../decisions/DEC-002-setting-status.vi.md). AND/OR, xóa điểm, ví dụ ngưỡng 19.2 và hai lựa chọn thường/đơn vị đã được chốt. Phần dưới là căn cứ đối chiếu Figma với DB, AC và chia việc. Figma là bản vẽ tĩnh, không có prototype, nên việc lưu vào DB được kiểm khi cài đặt.

Chỉ sửa [Figma MW hiện hành](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=0-1), bản Nhật. Các link bên dưới là cụm màn đã xác định trước đây; tìm lại đúng màn/layer con trước khi sửa. Không dùng node của file Figma lịch sử. Giữ font, component và bố cục hiện có, không đưa tên cột DB vào UI.

## 1. Rule chỉ mới lưu điều kiện — phản hồi ①

Vị trí: [cụm 01 — danh sách/xóa](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=6-4277), cùng các đường quay lại từ điều kiện/ngưỡng.

- [x] Giữ dòng chỉ mới lưu điều kiện trong danh sách với nhãn Chưa hoàn chỉnh（未完成） hoặc nhãn tương đương đã có; giữ thao tác Mở thiết lập ngưỡng（基準設定を開く）.
- [x] Ngưỡng chưa nhập được thể hiện là Chưa thiết lập（未設定）/dấu trống phù hợp, không tự hiện 0 hoặc coi đã có hiệu lực.
- [x] Phân biệt trên màn: đang thiết lập/chưa có hiệu lực thì còn trong danh sách và sửa tiếp; có hiệu lực thì được xét; đã xóa thì không hiện/không xét. Thiết kế dữ liệu dùng setting_status, nhưng không đưa tên cột hoặc mã 0/1/2 lên UI, không thêm trường chọn trạng thái/nút vô hiệu hóa/phục hồi mới.
- [x] Minh họa lưu dở → tải/mở lại → tiếp tục nhập ngưỡng. Dòng chưa hoàn chỉnh không tham gia chọn rule ưu tiên hoặc xét đỏ.
- [x] Minh họa xóa dòng chưa hoàn chỉnh → dòng biến mất; tải lại không xuất hiện lại. Nếu có trạng thái form đã mở trước khi xóa, không cho lưu để phục hồi dòng. Hủy/lưu lỗi không mất dòng cũ.
- [x] Chú thích ngoài UI: “条件のみ保存した未完成ルールは一覧に残り、編集を続けられます。削除したルールは一覧に表示せず、判定対象にも含めません。” — Rule chỉ mới lưu điều kiện còn trong danh sách để sửa tiếp; rule đã xóa không hiển thị và không tham gia xét.
- [x] Giữ thông báo xóa rule có hiệu lực: kết quả học sinh trước đó giữ đến lần xét lại. Không nhầm với xóa điểm ở mục 3.

## 2. Hướng dẫn AND/OR — phản hồi ②

Vị trí: [cụm 02](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=6-3582), **cả 02-A và 02-B**, helper của khu vực thêm điều kiện và chú thích ngoài màn.

- [x] Tách hướng dẫn bộ lọc đối tượng khỏi điều kiện trung bình/tỷ lệ nhóm. Có thể dùng hai câu/nhãn khu vực trong form hiện hữu; không thêm bộ soạn AND/OR tùy ý.
- [x] Câu cho bộ lọc: “対象フィルターは、同じ種類のいずれか1つ、異なる種類はすべて満たす必要があります。” — Trong bộ lọc đối tượng, cùng loại chỉ cần một, khác loại phải thỏa tất cả.
- [x] Câu cho điều kiện tổng hợp: “平均点・集団の得点率の条件は、同じ種類でもすべて満たす必要があります。対象フィルターともANDで組み合わせます。” — Trung bình/tỷ lệ nhóm phải thỏa tất cả kể cả cùng loại, và AND với bộ lọc đối tượng.
- [x] Nếu cần chú thích **ngoài UI**, mô tả phương án trực tiếp: “平均点・集団の得点率の条件はANDで組み合わせます。” — Các điều kiện trung bình/tỷ lệ nhóm kết hợp AND. Không đưa lịch sử phản hồi hoặc nhãn chờ xác nhận lên mockup gửi review; trạng thái xác nhận đã có chỉ theo dõi trong context; không đặt nhãn chờ xác nhận cũ lên canvas.
- [x] Ví dụ cùng nguồn `A≥50` và `A<70`: A=40/70 không thỏa; A=50/60 thỏa. Không minh họa A=40 là áp dụng theo OR.
- [x] Bổ sung câu Nhật ở 02-A/02-B hoặc chú thích nghiệp vụ cạnh khu vực rule: “これらのAND／ORは1つの赤点ルール内の条件に適用します。複数の赤点ルールは優先順位に従い、最初に適用条件が一致したルールを使用します。ルール同士をANDで結合しません。” — AND/OR áp dụng trong một rule; nhiều rule chọn khớp đầu tiên theo ưu tiên, không AND các rule. Đối chiếu danh sách 01-B cùng giải thích ưu tiên.
- [x] Ví dụ nhiều rule cùng khớp: ưu tiên 1 có T=20, ưu tiên 2 có T=30, S=25 và dấu <: dùng rule 1 nên không đỏ; không lấy ngưỡng 30 hoặc yêu cầu tất cả rule đồng thời đúng.
- [x] Rà mọi bản sao/helper/guide còn dùng câu “cùng loại OR” cho toàn bộ điều kiện và sửa cùng phạm vi. Giữ nguồn của điều kiện và công thức độc lập.

## 3. Xóa điểm và xóa rule — phản hồi ③

Vị trí: [cụm 04 — thực hiện/kết quả](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=6-1799); đối chiếu hộp xóa ở cụm 01 và các chú thích đầu ra.

- [x] Bỏ câu “削除した点数は再実行後に空欄” — Điểm đã xóa trở thành trống sau chạy lại.
- [x] Thay bằng “点数削除の保存が成功した時点で空欄となり、そのセルの赤点表示・赤点抽出への寄与を停止します。再実行は不要です。” — Ngay khi lưu xóa điểm thành công, ô trống và ngừng dấu/đóng góp vào lọc đỏ của ô; không cần chạy lại.
- [x] Tách câu “ルールの変更・削除だけでは前回結果を保持し、次回判定で更新します。” — Chỉ sửa/xóa rule vẫn giữ kết quả trước và cập nhật khi xét lại.
- [x] Ví dụ điểm đỏ 29 → lưu xóa thành công → ô trống, không còn dấu. Lưu xóa lỗi thì không báo đã trống hoặc đã ngừng kết quả.
- [x] Bộ lọc đỏ không tính ô đã xóa; học sinh vẫn có thể nằm trong kết quả nếu còn ô đỏ khác trong phạm vi. Giữ các hiệu ứng/ẩn/quyền khác.

## 4. Cùng cấu hình làm tròn — phản hồi ④

Vị trí: [cụm 03 — form 03-C](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=6-2346), [cụm 01 — danh sách 01-B](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=6-4277) và phần giải thích ngoài 03-C.

- [x] Cùng rule Trung bình dưới 60 điểm（平均60点未満）: dòng 1 là trung bình ÷ 2, **bật xử lý phần lẻ, vị trí 1, làm tròn xuống**; dòng 2 là kết quả dòng 1 × 0.8, **không xử lý phần lẻ**. Vị trí 1 nghĩa còn số nguyên, không phải một chữ số lẻ.
- [x] Đọc lại cả danh sách, form và ghi chú: `49.7÷2=24.85 → 24 → 24×0.8=19.2`; S=19.1, dấu nhỏ hơn thì đỏ.
- [x] Không để ví dụ ngưỡng 19 xuất hiện như trước/sau lưu của cùng rule. Nếu giữ nó để so sánh, ghi rõ **cấu hình khác: chỉ làm tròn dòng 2**, và kết quả không đỏ. Không đổi dấu `<` thành `≤` hoặc làm tròn điểm học sinh để che sai biệt.
- [x] Lưu/mở lại hoặc prototype có liên quan phải giữ đúng xử lý của từng dòng; tóm tắt dùng giá trị đã lưu.
- [x] Tăng/chỉnh cột hoặc cho wrap phù hợp để Trung bình lớp chủ nhiệm（ホームルーム平均） nằm trọn trong ô toán hạng, không đè cột phép toán. Kiểm cả tên nhóm dài, độ cao dòng và không cắt chữ; giữ font hiện hữu.
- [x] Quy tắc này chỉ áp dụng ví dụ đang sửa; các công thức khác vẫn cho phép chọn xử lý phần lẻ từng dòng.

## 5. Hiển thị bộ chọn điểm đơn vị — phản hồi ⑤

Vị trí: [cụm 06 — panel so sánh thường/đơn vị](https://www.figma.com/design/iAB9nFC3RuqxbLUMsh79jd/?node-id=6-471), panel B.

- [x] Tìm layer của Cách hiển thị điểm đỏ（赤点の表示方法） và Hiển thị kèm ngoặc（括弧付きで表示する） đang bị nền trắng che theo báo cáo khách hàng.
- [x] Đưa nền xuống dưới nội dung hoặc sửa thứ tự/quan hệ chứa đúng panel; không tạo thêm control trùng và không xóa nền hợp lệ của panel khác.
- [x] Kiểm clipping/opacity/visibility và thứ tự lớp: nhãn, ô chọn, mũi tên và giá trị chọn của B phải nhìn thấy đầy đủ, thao tác được nếu có prototype.
- [x] A và B vẫn là hai lựa chọn độc lập. Giữ ví dụ khác nhau để kiểm; thay bên này không thay bên kia, phần kết quả bên dưới khớp lựa chọn tương ứng.
- [x] Không thêm nền đỏ riêng, không sửa quy tắc phối hợp hiệu ứng dự kiến/đỏ hoặc quyền hiển thị.

## 6. Kiểm cuối và ghi nhận hoàn tất

- [x] Rà guide/các chú thích và bản sao bị ảnh hưởng ở 00–07; không để câu cũ trái các thay đổi trên.
- [x] Xuất/xem ảnh sau sửa cho 01-B và dòng chưa hoàn chỉnh/xóa; 02-A/02-B; 03-C cùng ghi chú; trạng thái xóa điểm 04; panel A/B của 06. Kiểm ở mức zoom đọc được, không chỉ ảnh tổng quan.
- [x] Kiểm các liên kết/prototype liên quan nếu có; bản vẽ tĩnh không chứng minh lưu vào DB.
- [x] Ghi người thực hiện, ngày và node/ảnh thực tế trong bàn giao; chỉ đánh dấu các mục đã kiểm. AND đã được xác nhận; chỉ theo dõi nguồn xác nhận trong context, không đưa lịch sử hoặc nhãn chờ xác nhận vào bản vẽ gửi review.
- [x] Chỉ sau bằng chứng trên mới cập nhật trạng thái Figma trong context; không đổi thành hoàn tất chỉ vì tài liệu đã sửa.
