# RA-001 — Kiểm tra 高度な除外設定 (cài đặt loại trừ nâng cao) cho 見込み点

**Loại tài liệu:** topic research, bằng chứng chạy thử trên DB local. Không phải nguồn yêu cầu. Yêu cầu nằm ở [CONTEXT](../CONTEXT.md).

**Ngày:** 23/10/2026. **Môi trường:** DB local, trường `2 : デモ用高等学校`, nhánh `feature/RA-001_ranking_average`.

## Câu hỏi

shite (22/10) hỏi: 順位集計 đã có 高度な除外設定, chẳng phải đã loại được 見込み点 sao? Có thể dùng nó để 見込み点 không ảnh hưởng thứ hạng và trung bình không?

## Cơ chế trong code

- Cấu hình ở màn 順位集計設定 (`grade_report_setting/grade_calc`), lưu trong `grade_calc_exclude_conf` (cột `exclude_target`, `exclude_target_type`: 0 = 授業設定, 1 = checkbox, 2 = 選択肢; `exclude_from_rank`, `exclude_from_aggregate`).
- Áp dụng khi 集計実行 (`GradeCalc.php`): **loại khỏi xếp hạng** = đặt cờ loại khỏi hạng; **loại khỏi tổng/trung bình** = đặt điểm thành null.
- Điều kiện loại là học sinh có giá trị đã chọn hoặc có checkbox được đánh dấu trên mục tương ứng.
- Tính tự động (`AutoRating::save`) chỉ ghi điểm vào `grades`; không ghi `grades_checkbox`.

## Kết quả chạy thử

Thiết lập `【RC001】評点集計`, khối 1, 1学期期末, môn 10028, tổng khối (`学年毎`). Học sinh 1741169 (素点 30) có giá trị loại trừ. Chạy `aggregateCalc` (lệnh batch của 集計実行) cho từng cấu hình.

| Cấu hình | Tổng | Số dòng thứ hạng (mẫu số RA-001) | Trung bình | 1741169 |
| --- | --- | --- | --- | --- |
| Không loại | 2180 | 39 | 55,897 | có điểm 30, hạng 31 |
| 順位集計から除外 | 2180 | 39 | 55,897 (không đổi) | có điểm, không có hạng |
| 集計対象から除外 | 2150 | 38 | 56,58 | bị bỏ khỏi bảng thứ hạng |
| Cả hai | 2150 | 38 | 56,58 | bị bỏ khỏi bảng thứ hạng |

Kết quả giống nhau với hai loại điều kiện thử: mục **選択肢** (giá trị A của `【RC001】選択ABC`) và checkbox **見込点** của **素点** (có sẵn ở DB local, viết không có "み").

Sau khi đánh dấu checkbox cho 1741169 và chạy batch tính tự động, dòng `grades_checkbox` vẫn còn nguyên: tính tự động không xóa và không đặt cờ.

## Kết luận

- 高度な除外設定 loại được 見込み点, cả khỏi xếp hạng lẫn trung bình. Không cần chức năng mới.
- Cần bật **集計対象から除外**; chỉ loại khỏi xếp hạng thì trung bình không đổi.
- Cờ phải có trước khi 集計実行 chạy; tính tự động không tự đặt cờ. Dùng mục lý do vắng (điểm 1 của shite) làm điều kiện loại là cách không cần sửa tính tự động.

## Chưa kiểm

- Bản chốt (確定): chạy trên kết quả mới nhất, chưa kiểm khi chốt rồi đọc qua RA-001.
- Mục chọn hoặc checkbox thuộc kỳ khác kỳ đang tính, nhiều học sinh, đơn nguyên (tangen).
- Cấu hình trường thật.
