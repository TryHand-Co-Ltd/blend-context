# Context RA-001 — Trung bình tổng hợp thứ hạng（順位集計の平均点）

Cập nhật: **20/10/2026**.

**Tài liệu này là nguồn yêu cầu hiện hành của feature.** Đặc tả trong [docs](docs/README.md) diễn giải nguồn này.

**Trạng thái: tạm dừng ở mức hiện tại.** Khách đã xác nhận Q1, Q3–Q7 ngày 12/10/2026 và Q2 ngày 19/10/2026: **chỉ dùng kết quả tổng hợp thứ hạng đã chốt** ([đặc tả mục 8.2](docs/specification.vi.md#source)). Cùng ngày shite chỉ đạo tạm dừng chức năng này, giữ tiến độ và ưu tiên việc khác, vì người làm chức năng chốt tổng hợp thứ hạng có thể làm cùng phần này ([thread Slack](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1792383099678219)). Code hiện theo 案A (ưu tiên bản chốt, chưa chốt thì dùng số mới nhất), **chưa đổi** sang chỉ bản đã chốt.

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
| Dấu so sánh | **以上**, **より大きい**, **等しい**, **より小さい**, **以下**. Không dùng **未満** |
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
| Bộ đọc nguồn | Dùng chung với xét điểm liệt ([PR 57572](https://github.com/ednity/school-web/pull/57572)), quy tắc chọn bản ở một chỗ. Nhóm **授業** (tiết học), nhóm thứ hạng（順位集計グループ）và nhóm kết hợp（組合わせグループ）đọc thêm điều kiện khối của học sinh. So sánh với mốc bằng số thập phân chính xác như điểm liệt |
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
| Đổi bộ đọc nguồn sang chỉ bản đã chốt (Q2, 19/10) | Một chỗ trong bộ đọc nguồn chung. Chưa làm vì chức năng đang tạm dừng; người làm chức năng chốt có thể làm cùng |
| Dropdown kỳ/nhóm sau Q2 | Chưa rõ có lọc nhóm "có kết quả" theo bản đã chốt hay theo mọi kết quả tổng hợp ([đặc tả mục 11](docs/specification.vi.md#population)). Cần xác nhận |
| PR 57572 (điểm liệt) chưa gộp | RA-001 dùng chung bộ đọc nguồn; phần code chung giống hệt PR nên gộp trước hay sau đều không xung đột |
| PR 57058 chưa gộp | Q2 = chỉ bản đã chốt, nên RA-001 phát hành sau PR 57058; trước đó mọi điều kiện/công thức trung bình đều thiếu số. Sau khi gộp, kiểm lại trường hợp đã chốt |
| Bốn thư viện riêng của trường | Kiểm khi triển khai |
| Dữ liệu cũ dùng OR | Đếm trước khi phát hành |

## 8. Thứ tự đọc

1. Context này.
2. [Đặc tả](docs/specification.vi.md) và [đặc tả màn hình](docs/screen-definition.vi.md).
3. [Bản hỏi tiếng Việt](sources/2026-10-09-business-questions.vi.md), [bản hỏi tiếng Nhật](sources/2026-10-09-business-questions.ja.md).
4. [Ghi nhận nội bộ 10/10](sources/2026-10-10-internal-design-review.vi.md), [hiện trạng code](research/current-auto-rating-behavior.vi.md).
