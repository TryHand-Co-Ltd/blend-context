# RC-001 — Kế thừa năm học（年度引継ぎ）của cấu hình điểm đỏ: hiện trạng và phương án

Ngày: 2026-11-10. Phạm vi: bảng ``red_score_settings`` (``apply_condition`` v2 / dạng cũ, ``formula``, nguồn tham chiếu). Bằng chứng mã nguồn: ``blend:application/usecase/grade_setting/takeover/TakeOverUsecase.php`` và ``blend:application/views/grade_report_setting/manage/red_score/_note.php`` tại nhánh ``feature/RC-001_red_score_spec`` (b699266c6f5, chưa merge). Đây là **báo cáo hiện trạng và đề xuất**, không phải yêu cầu đã được xác nhận.

## 1. Kết luận

- **Chưa hỗ trợ.** Không có đường kế thừa năm học, sao chép, xuất/nhập nào xử lý ``red_score_settings`` (tìm trong ``usecase``, ``blend/Grade``: không có tham chiếu). Màn hình ghi rõ cấu hình và kết quả điểm đỏ nằm ngoài các thao tác này; năm mới phải cấu hình lại.
- Việc bỏ HR/授業 khỏi điều kiện áp dụng **không** làm kế thừa năm học hoàn chỉnh: ID nhóm thành tích, tổ hợp, mục đánh giá, kỳ, cấu hình xếp hạng… đều thay đổi khi sang năm mới.
- Quyết định hiện tại của sản phẩm (chữ trên màn hình) là “ngoài phạm vi”; đặc tả mục 12.4 chỉ **đề xuất** hỗ trợ. Cần xác nhận với khách hàng trước khi làm.

## 2. Khả thi: dùng lại cơ chế ánh xạ ID sẵn có

``TakeOverUsecase`` tạo bản sao theo từng nhóm dữ liệu (``->copy($to_year, ...)``) và đã có các bảng ánh xạ cũ→mới dạng ``getter('link_*_ids')`` cho đúng các ID mà điểm đỏ cần: kỳ/học kỳ (``linked_period_ids``, ``linked_term_ids``), mục khung điểm (``link_frame_item_ids``), cấu hình xếp hạng (``link_grade_calc_conf_ids``), nhóm/mục/tổ hợp/nhóm môn (``link_grade_calc_group_ids``, ``..._item_ids``, ``..._combo_ids``, ``..._sub_subject_ids``), カリキュラム/単元 (``link_curriculum_ids``, ``linked_master_curriculum_ids``, ``linked_tangens_ids``), lựa chọn/ô tích. Mẫu gần nhất: ``AutoRatingConf->copy(...)`` (cũng dùng frame item, nhóm, mục, tổ hợp). Chưa xác minh các getter trả đủ cho trường hợp khung điểm không được sao chép.

## 3. ID cần ánh xạ trong ``red_score_settings``

| Dữ liệu | Cách ánh xạ |
| --- | --- |
| ``evaluate_frame_item_id`` | ``link_frame_item_ids``; không ánh xạ được → không tạo rule |
| ``period_id`` / ``term_id`` (công thức, nguồn) | ``linked_period_ids`` / ``linked_term_ids`` |
| ``grade_calc_conf_id`` (nguồn trung bình/tỷ lệ) | ``link_grade_calc_conf_ids`` |
| ``population_ref_id`` loại 3/4/6 | nhóm / tổ hợp / nhóm môn tương ứng; loại 1/2/5 không cần |
| ``apply_condition``: ``calc_group`` (key_id + giá trị) | ``link_grade_calc_group_ids`` + ``..._item_ids`` |
| ``apply_condition``: ``calc_group_combo`` (key_id + "mục,mục") | ``link_grade_calc_group_combo_ids`` + ``..._item_ids`` |
| ``apply_condition``: ``choice`` (key_id + mã lựa chọn) | mục khung điểm + mã lựa chọn của khung mới |
| ``apply_condition``: ``subject``/``sub_subject`` + ``curriculum_id`` | ID môn có thể theo năm; ``curriculum_id`` qua ánh xạ カリキュラム |
| ``apply_condition``: ``homeroom``/``group``/``hr_course`` (điều kiện cũ) | ID theo năm: không ánh xạ được → không kích hoạt |
| ``hr_grade``, ``aggregate`` loại 1/2/5 | không cần |
| Không mang theo | kết quả xét học sinh, token/version đồng thời, nguồn đã chốt của năm cũ |

## 4. Đề xuất triển khai

1. Lớp ``FromRedScoreSetting`` (theo mẫu ``AutoRatingConf``), thêm vào danh sách ``->copy`` của ``TakeOverUsecase`` và bước insert cùng giao dịch.
2. Rule có tham chiếu không ánh xạ được: lưu ``setting_status=0`` (chưa hoàn tất, giữ nguyên giá trị nhập), không đổi hay xóa điều kiện; báo danh sách chưa mang theo. Rule đã xóa không mang theo. Khớp DB design 4.5.
3. Cập nhật ghi chú màn hình, spec 12.4, test-spec; test: bản sao một năm có đủ loại điều kiện (v2, cũ, nhiều key, combo, trung bình), rule thiếu ánh xạ, năm đích đã có rule.
4. Xác định đường “sao chép phạm vi khác”, xuất/nhập riêng nếu muốn bao gồm.

Ước lượng thô: **2–3 ngày công** cho đường kế thừa năm học (lớp copy, ánh xạ ``apply_condition`` theo loại, test, tài liệu) nếu các getter ``link_*`` đủ dùng; thêm **1–2 ngày** cho sao chép/xuất nhập. Rủi ro: luồng takeover dùng chung nhiều bảng và chạy trong một giao dịch; cần dữ liệu thử nhiều năm để kiểm chứng.

## 5. Cần quyết định

- Khách hàng có muốn mang cấu hình điểm đỏ sang năm mới không (hiện sản phẩm ghi “ngoài phạm vi”)?
- Rule thiếu ánh xạ: để ``setting_status=0`` (đề xuất) hay bỏ qua toàn bộ?
- Có gộp sao chép phạm vi khác và xuất/nhập vào cùng đợt không?

## Cập nhật 13/11/2026

Thread PR 57572 báo đã triển khai đường kế thừa năm học trong `TakeOverUsecase` (xem [CONTEXT mục cập nhật 13/11/2026](../CONTEXT.md)). Mục 1 ở trên là hiện trạng tại 10/11/2026 và không còn đúng với nhánh mới nhất. Điểm khác đề xuất mục 4.2: ID không thay được giữ ID cũ cùng điều kiện (không lưu `setting_status=0`). Chưa kiểm tích hợp độc lập.
