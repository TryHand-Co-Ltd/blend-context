# Context RA-001 — Trung bình tổng hợp thứ hạng（順位集計の平均点）

Cập nhật: **27/10/2026** (bộ đọc bản chốt dùng chung, mục 7).

**Tài liệu này là nguồn yêu cầu hiện hành của feature.** Đặc tả trong [docs](docs/README.md) diễn giải nguồn này.

**Trạng thái: làm tiếp từ 22/10/2026** (shite nhờ làm nốt các phần còn lại để sau đó hỗ trợ 見込み点, [thread Slack](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1791290094955599)). Trước đó chức năng được tạm dừng từ 19/10. Khách đã xác nhận Q1, Q3–Q7 ngày 12/10/2026 và Q2 ngày 19/10/2026: **chỉ dùng kết quả tổng hợp thứ hạng đã chốt** ([đặc tả mục 8.2](docs/specification.vi.md#source)). Cùng ngày shite chỉ đạo tạm dừng chức năng này, giữ tiến độ và ưu tiên việc khác, vì người làm chức năng chốt tổng hợp thứ hạng có thể làm cùng phần này ([thread Slack](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1792383099678219)). Code (nhánh `feature/RA-001_ranking_average`) **chỉ dùng bản đã chốt**, không lấy số mới nhất thay thế. Từ 27/10/2026 code đọc bản chốt qua `getTotalResults()` có `$use_fix_table` của PR 57058 (mục 7); trước đó đọc qua `getRedScoreSourceMetric` giống nhánh 赤点 `feature/RC-001_red_score_spec`. Đã chạy thử bằng bảng chốt dựng tạm ở DB local (22–27/10/2026).

**Cập nhật 26–27/10/2026:** shite và người làm PR 57058 (chức năng chốt) thống nhất bộ đọc bản chốt dùng chung cho ba chức năng (xét điểm liệt, RA-001, EM-001) là `getTotalResults()` / `getTotalData()` có tham số `$use_fix_table`, không dùng `getStudentCalcResults()`; PR đã có thay đổi này (commit `9a91794106b`, 27/10), chưa gộp. **RA-001 đã chuyển sang hàm chung ngày 27/10/2026** (code chưa commit): `RankingAverageReader` gọi `getTotalResults(..., true)` và vẫn tự kiểm bản chốt còn hiệu lực trước khi đọc; RC-001 và EM-001 chưa chuyển ([research](research/confirmed-result-reader.vi.md)). Quy tắc nghiệp vụ không đổi.

Work item: **Implement Ranking Average in Automatic Grade Calculation and Apply It to Conditions, Formulas, and Grade Registration**.

## 1. Yêu cầu của khách hàng

Dùng điểm trung bình do tổng hợp thứ hạng（順位集計）tính ra trong tính điểm tự động（自動計算）.

Ví dụ điểm dự kiến（見込み点）: điểm của học sinh ở bài đã thi là 60, trung bình nhóm ở bài đó là 50, trung bình nhóm ở bài học sinh nghỉ là 70. Phép tính 60 × 70 ÷ 50 = 84.

- 60 là điểm ở cột được chọn trong công thức, ví dụ **素点** (điểm thô).
- 84 được ghi vào cột đang tính, ví dụ **1学期期末 評点** (điểm đánh giá cuối học kỳ 1).
- 75 nếu đang nằm ở cột đích là điểm đã có, không phải số đưa vào phép tính.

Yêu cầu phân nhánh: điểm trung bình từ 50 trở lên thì dùng công thức A, dưới 50 thì dùng công thức B. Điểm liệt（赤点）đã có điều kiện trung bình nhưng chỉ kết luận có bị điểm liệt hay không; tính điểm tự động cần điều kiện riêng.

Một số trường đã chọn **科目平均** (trung bình môn) trong công thức. Yêu cầu là đưa cơ chế đó thành chức năng dùng chung, gồm lưu, mở lại, tính và ghi điểm, nối với kết quả tổng hợp thứ hạng.

## 2. Phạm vi

| Mục | Quy tắc |
| --- | --- |
| Công thức | Ở **計算結果を登録する** (đăng ký kết quả tính), vế trái và vế phải chọn được **科目平均** tại mọi trường. Mỗi vế chọn riêng thiết lập thứ hạng và kỳ/nhóm |
| Ánh xạ | **[基準値]** (giá trị gốc) không thêm **科目平均** (Q1). Chọn **計算結果** rồi dùng **科目平均** trong công thức bên dưới |
| Điều kiện lọc | **計算対象設定** thêm loại **平均点**: thiết lập thứ hạng, kỳ/nhóm, mốc, dấu. Hai nhánh A/B là hai dòng thiết lập |
| Nhiều mốc | Một dòng được đặt nhiều điều kiện trung bình, nối AND (Q6) |
| Dấu so sánh | **以上**, **より大きい**, **と等しい**, **より小さい**, **以下**. Không dùng **未満** |
| Nhóm | `学年平均`, `HR平均`, `授業平均`, nhóm thứ hạng, nhóm kết hợp, nhóm môn học; giống xét điểm liệt và PR 57058 (Q5) |
| Số trung bình | Trước làm tròn, như xét điểm liệt (Q3). Chỉ dùng bản tổng hợp đã chốt và còn hiệu lực, không lấy số mới nhất thay thế (Q2, 19/10). Không có bản chốt hợp lệ thì coi như thiếu trung bình |
| Thứ tự | Xét từ trên xuống, dòng khớp đầu tiên thì chạy |
| Thiếu trung bình ở điều kiện | Coi là không khớp, xét dòng dưới; không khớp dòng nào thì ghi trống (Q7) |
| Không tính được | Ghi trống vào cột đích, điểm đang có bị xóa (Q4) |
| Thời điểm ghi | Chỉ khi chạy tính điểm tự động và các đường gọi cùng cơ chế. Lưu thiết lập và **集計実行** không ghi điểm |
| Môn, trường | Môn của tiết đang tính, không thêm ô chọn môn. Mọi trường |

Bằng chứng hiện trạng code: [research](research/current-auto-rating-behavior.vi.md). Ghi nhận nội bộ ngày 10/10: [design review](sources/2026-10-10-internal-design-review.vi.md).

## 3. Câu hỏi khách hàng

| Câu | Trạng thái | Nội dung |
| --- | --- | --- |
| [Q1](sources/2026-10-09-business-questions.vi.md#q1) | Đã xác nhận 12/10 | Không thêm **科目平均** vào **[基準値]**; dùng **計算結果** + công thức |
| [Q2](sources/2026-10-09-business-questions.vi.md#q2) | Đã xác nhận 19/10 | Chỉ dùng bản đã chốt, thống nhất cho xét điểm liệt, tính điểm tự động và bảng ánh xạ theo khoảng điểm trung bình. Thay phương án ưu tiên bản chốt ngày 12/10. Dropdown **順位集計設定** hiện mọi thiết lập, bất kể đã chốt hay chưa |
| [Q3](sources/2026-10-09-business-questions.vi.md#q3) | Đã xác nhận 12/10 | Số trước làm tròn, như điểm liệt |
| [Q4](sources/2026-10-09-business-questions.vi.md#q4) | Đã xác nhận 12/10 | Ghi trống như hiện trạng (khách đổi từ "giữ điểm") |
| [Q5](sources/2026-10-09-business-questions.vi.md#q5) | Đã xác nhận 12/10 | Thêm `授業平均`; danh sách nhóm như PR 57058 |
| [Q6](sources/2026-10-09-business-questions.vi.md#q6) | Đã xác nhận 12/10 | Được đặt cận dưới và cận trên, AND |
| [Q7](sources/2026-10-09-business-questions.vi.md#q7) | Đã xác nhận 12/10 | Thiếu trung bình thì điều kiện không khớp, xét dòng dưới |

## 4. Quyết định nội bộ

Chi tiết ở [đặc tả](docs/specification.vi.md).

| Mục | Quyết định |
| --- | --- |
| Lưu điều kiện | Thêm một loại vào `setting_condition` của `auto_rating_conf_items.condition`. Không thêm bảng, không thêm cột |
| Bộ đọc nguồn | Quy tắc chọn bản ở một chỗ, dùng chung với xét điểm liệt ([PR 57572](https://github.com/ednity/school-web/pull/57572)) về quy tắc. Từ 27/10/2026 hàm đọc là `getTotalResults()` / `getTotalData()` có `$use_fix_table` của PR 57058 (thống nhất giữa shite và người làm PR), không còn `getRedScoreSourceMetric`. Nhóm **授業** (tiết học), nhóm thứ hạng（順位集計グループ）và nhóm kết hợp（組合わせグループ）đọc thêm điều kiện khối của học sinh. So sánh với mốc bằng số thập phân chính xác như điểm liệt |
| Mẫu số trung bình | Số học sinh có điểm của cùng bản nguồn, như điểm liệt; không dùng `examinees`. Trùng với code Uenomiya hiện tại |
| Kiểm tra khi lưu | Thiết lập, kỳ/nhóm, mốc, dấu bắt buộc; mốc ≥ 0, cho phép thập phân |
| Tham chiếu bị đổi tên/xóa | Mở lại hiện `選択してください` kèm cảnh báo; khi tính xử lý như thiếu trung bình |
| Dữ liệu cũ dùng OR | Giữ nghĩa; đếm trước khi phát hành |
| Danh sách | Hiện điều kiện dạng `平均点 評点集計 1学期期末/学年平均 50点以上`; thêm hai dòng chú thích ※ |
| Quyền | Giữ quyền màn tính điểm tự động hiện có |

## 5. Thiết kế giao diện

[Figma RA-001](https://www.figma.com/design/OkFTBuOyoF2hNnxCFy4Uds/), version "RA-001 v9 – cân bố cục, ghi chú cho khách". Trang **00｜Guide**, **01｜List and priority**, **02｜Conditions**, **03｜Formula**, **04｜Mapping states**. Đối chiếu với đặc tả ở [đặc tả màn hình, mục 08](docs/screen-definition.vi.md).

## 6. Tài liệu

- [Đặc tả](docs/specification.vi.md), gồm tiêu chí nghiệm thu AC-01 → AC-24 (mục 14).
- [Đặc tả màn hình](docs/screen-definition.vi.md), [bản tiếng Nhật](docs/screen-definition.ja.md).
- Chưa làm: chia việc và đặc tả kiểm thử chi tiết. Làm khi bắt đầu triển khai.

## 7. Việc còn mở trước khi phát hành

| Việc | Ảnh hưởng |
| --- | --- |
| Đổi bộ đọc nguồn sang chỉ bản đã chốt (Q2, 19/10) | **Đã làm trong code** (nhánh `feature/RA-001_ranking_average`, commit `7d1e115ee02`, 23/10/2026; đổi sang hàm chung ngày 27/10/2026, chưa commit): `RankingAverageReader` gọi `getTotalResults(..., true)` cho mọi loại tập hợp, kiểm `grade_calc_fix_log.active = 1` và đủ bảng bản chốt trước khi đọc. Đã chạy thử với bảng chốt dựng từ migration của PR: có bản chốt thì đọc đúng số; chưa chốt, đã hủy chốt, thiếu bảng hoặc thiếu dòng nguồn thì không có trung bình ([research, mục 8](research/confirmed-result-reader.vi.md#8-kết-quả-kiểm-trên-db-local-27102026)) |
| Dropdown kỳ/nhóm sau Q2 | Chưa rõ có lọc nhóm "có kết quả" theo bản đã chốt hay theo mọi kết quả tổng hợp ([đặc tả mục 11](docs/specification.vi.md#population)). Cần xác nhận |
| Nhánh 赤点 chưa gộp (PR 57572, nhánh `feature/RC-001_red_score_spec`) | Từ 27/10/2026 RA-001 không còn dùng `getRedScoreSourceMetric` của nhánh 赤点 (đã bỏ khỏi hai model của RA-001), nên hai nhánh không còn khớp từng dòng ở `GradeCalcResultEachSubSubjectLogs_m` và `GradeCalcResultEachGroupLogs_m`. Gộp thử RA-001 (có thay đổi chưa commit) với đầu nhánh 赤点 `6e44cbfd2a0` (22/10/2026): không xung đột, hai bên cùng tồn tại. Nhánh 赤点 còn đổi hằng ngày: so lại trước khi gộp. Quy tắc đọc vẫn một chỗ cho đến khi nhánh 赤点 cũng chuyển sang hàm chung |
| Xung đột với EM-001 | `AutoRating.php` xung đột 2 chỗ khi gộp. EM-001 vẫn dùng `GradeCalcResultService` và `calc_group_map` mà RA-001 đã bỏ; khi giải xung đột phải giữ lại hai thứ này cho EM-001. Import `GradeCalcResultService` đã có lại ở nhánh RA-001 (commit `55edefea7cf`, 27/10/2026) |
| Quyết định của người phụ trách RA-001 (27/10/2026, nội bộ, chưa phải xác nhận của khách) | (1) Uenomiya: giữ ghi trống khi kỳ chưa chốt (theo Q4); cần báo shite và nhà trường trước khi phát hành. (2) Ba điểm hàm chung của PR 57058 thiếu (kiểm `active`, kiểm bảng tồn tại, lọc đơn nguyên): người làm PR **không thêm**, RA-001 giữ phần tự bù. (3) Nhãn dấu bằng thống nhất là `と等しい` (như màn ánh xạ); đã sửa đặc tả và đặc tả màn hình, **Figma chưa sửa**. Rà soát code và màn hình: [research](research/implementation-review-2026-10-27.vi.md) |
| Test tự động | Chưa có. Trước khi chuyển bộ đọc (23/10) đã kiểm tay bằng nút 自動算出実行 (chạy tính điểm tự động) và lệnh batch trên DB local (có/không bản chốt, từng loại tập hợp). Sau khi chuyển (27/10) mới chạy riêng `RankingAverageReader` trên bảng chốt dựng ở DB local; chưa chạy lại đầu cuối nút 自動算出実行 (chạy tính điểm tự động) và batch |
| PR 57058 chưa gộp | Q2 = chỉ bản đã chốt, nên RA-001 phát hành sau PR 57058; trước đó mọi điều kiện/công thức trung bình đều thiếu số. Sau khi gộp, kiểm lại trường hợp đã chốt. Gộp thử với đầu PR `9a91794106b` (27/10/2026, sau khi chuyển bộ đọc): RA-001 xung đột chữ 2 file, mỗi file 1 chỗ (`AutoRating.php` khối `unset`, `AutoRatingConfController.php` chỗ chèn hàm kiểm tra), giải bằng cách giữ cả hai bên. Hai model và `GradeCalcResultService.php` tự gộp vì giống chữ với PR |
| Chuyển sang bộ đọc bản chốt dùng chung | **Đã thống nhất hướng (27/10/2026) và đã làm trong code RA-001 (cùng ngày, chưa commit).** `getTotalResults()` / `getTotalData()` có `$use_fix_table` trong PR 57058 trả `total_score` và `student_count` (số dòng thứ hạng của cùng log, đúng mẫu số RA-001; không dùng `examinees`). `RankingAverageReader` đã đổi sang hàm này, hai hàm `getRedScoreSourceMetric` đã bỏ khỏi hai model của RA-001; số đã khớp truy vấn SQL độc lập trên bảng chốt dựng ở DB local. Còn lại: chạy `AutoRating::calc` đầu cuối; kiểm lại AC-21 đến AC-24 sau khi PR gộp; hỏi người làm PR về ba điểm của hàm chung mà RA-001 đang tự bù (hàm chung không kiểm `grade_calc_fix_log.active`, không kiểm bảng bản chốt tồn tại, không lọc đơn nguyên). Chi tiết ở [research](research/confirmed-result-reader.vi.md#7-điểm-cần-kiểm-khi-chuyển-và-trạng-thái) |
| Bốn thư viện riêng của trường (`TakaokaEx`, `UlsEx`, `UlsJrEx`, `UlsElEx`) | **Đã kiểm (27/10/2026)**: cả bốn tự tính 評定 (điểm đánh giá), không gọi `AutoRating` chung, không dùng trung bình tổng hợp thứ hạng khi tính và không đổi hành vi khi chuyển sang bản đã chốt. ② không ảnh hưởng. Chi tiết ở [research](research/school-library-and-or-check.vi.md) |
| Dữ liệu cũ dùng OR | **Đã đếm trên DB local (27/10/2026)**: 676 dòng đang bật có từ 2 điều kiện trở lên (39 trường), 29 dòng đã tắt. **Chưa đếm trên DB thật**; truy vấn chỉ đọc có trong [research](research/school-library-and-or-check.vi.md#3-dữ-liệu-cũ-dùng-or) |

## 8. Thứ tự đọc

1. Context này.
2. [Đặc tả](docs/specification.vi.md) và [đặc tả màn hình](docs/screen-definition.vi.md).
3. [Bản hỏi tiếng Việt](sources/2026-10-09-business-questions.vi.md), [bản hỏi tiếng Nhật](sources/2026-10-09-business-questions.ja.md).
4. [Ghi nhận nội bộ 10/10](sources/2026-10-10-internal-design-review.vi.md), [hiện trạng code](research/current-auto-rating-behavior.vi.md), [kiểm tra loại trừ cho 見込み点](research/mikomi-exclusion-check.vi.md), [bộ đọc bản chốt dùng chung](research/confirmed-result-reader.vi.md).

## 9. Việc tiếp theo: 見込み点 (chưa có quyết định của khách)

Nguồn: [thread Slack](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1791290094955599), sheet 見込み点参考資料 (shite gửi 22/10). shite chỉ nhờ làm nốt RA-001 để sau đó hỗ trợ 見込み点. Ngày 23/10 hieunv nêu bốn điểm cần khách xác nhận, shite trả lời cùng ngày (hieunv báo phần còn lại của ② đã xong). Bằng chứng kiểm tra loại trừ ở [research](research/mikomi-exclusion-check.vi.md).

| # | Điểm | Đề xuất của hieunv | Trả lời của shite (23/10) | Trạng thái |
| --- | --- | --- | --- | --- |
| 1 | Phân biệt 欠席 (hệ số 0.8) và 公欠 (1.0) | Dùng trường chọn (選択肢) ghi lý do vắng; công thức áp hệ số theo điều kiện chọn | Trường thường **để trống** khi vắng; hệ thống **không** có mục mặc định ghi vắng là 公欠 hay bệnh. Đồng ý tạo **mục thành tích chọn lý do vắng** (欠席理由) và dùng làm hệ số khi tính tự động: "要件は対応できそう" | **Hướng đã chấp nhận.** Cần quy ước lý do vắng gắn với kỳ thi nào |
| 2 | Chọn kỳ tham chiếu khi vắng nhiều kỳ (真和, học kỳ 3) | Không tự chọn; mỗi trường tự cấu hình bằng nhiều dòng điều kiện | Cần xem có làm hết các mẫu của từng trường hay không; shite điều chỉnh với MW (phía khách), giữ làm mục xác nhận của shite | **Chưa quyết.** hieunv chờ kết quả trước khi làm |
| 3 | Giới hạn điểm tối đa (真和: từ 100 trở lên ghi 99) | Thêm ô "giới hạn tối đa" vào dòng công thức, mặc định trống | Cần xác nhận có bắt buộc không | **Chưa quyết.** hieunv chờ kết quả trước khi làm |
| 4 | Loại 見込み点 khỏi 順位集計, không tính lại | Loại cho mọi trường như 日大習志野 | shite hỏi chẳng phải 順位集計 đã có **高度な除外設定** loại được 見込み点 sao (kèm ảnh màn hình) | Đã kiểm tra: **có, không cần chức năng mới** (xem dưới) |

**Kết luận điểm 4 (hieunv báo 23/10, đã kiểm trên local):** 高度な除外設定 loại được học sinh khỏi xếp hạng và khỏi trung bình khi mục chọn hoặc checkbox tương ứng được chọn/đánh dấu. Có thể dùng chính mục **lý do vắng** (điểm 1) làm điều kiện loại trừ, nên không cần chức năng mới cho 見込み点.

Lưu ý khi dùng (kết quả kiểm trên local, chi tiết ở [research](research/mikomi-exclusion-check.vi.md)):
- Phải bật **集計対象から除外** (loại khỏi tổng/trung bình). Chỉ bật 順位集計から除外 thì xếp hạng đổi nhưng trung bình RA-001 không đổi.
- Tính tự động chỉ ghi điểm, **không đặt cờ**. Vì vậy cờ phải do mục lý do vắng (hoặc checkbox đánh dấu tay) bảo đảm trước khi 集計実行 chạy. Tính tự động cũng không xóa cờ có sẵn.
- Bật loại trừ là cấu hình theo từng 順位集計設定 của từng trường.
- Chưa kiểm: loại trừ khi đọc lại qua bản chốt (確定); mục lý do vắng của kỳ khác kỳ đang tính (mã loại trừ gom theo lớp và đơn nguyên, chưa xác nhận có phân biệt kỳ); mục lý do vắng dạng chọn nhiều kỳ.

Hiện trạng code liên quan: AutoRating chưa đọc được trạng thái/lý do vắng thi trực tiếp, chỉ đọc được qua điều kiện **選択肢型** đã có; cơ chế tương tự đã có riêng ở `ChikujyoEx`. 見込み点 cần cả hai kỳ (kỳ đã thi, kỳ vắng) đã chốt vì Q2 chỉ dùng bản chốt.
