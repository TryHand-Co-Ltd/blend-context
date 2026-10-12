# Context RA-001 — Trung bình tổng hợp thứ hạng（順位集計の平均点）

Cập nhật: **12/10/2026**.

**Tài liệu này là nguồn yêu cầu hiện hành của feature.** Đặc tả trong [docs](docs/README.md) diễn giải nguồn này.

**Trạng thái: sẵn sàng triển khai, còn Q2 chờ khách.** Khách đã xác nhận Q1, Q3–Q7 ngày 12/10/2026. Q2 là spec chung với xét điểm liệt, đã ghi ở **成績シート** No.1, chỉ ảnh hưởng một chỗ trong bộ đọc nguồn trung bình ([đặc tả mục 8.2](docs/specification.vi.md#source)).

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
| Số trung bình | Trước làm tròn, như xét điểm liệt (Q3). Bản đã chốt hay số mới nhất theo Q2 chung |
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
| [Q2](sources/2026-10-09-business-questions.vi.md#q2) | **Đang chờ**, 成績シート No.1 | 案A: ưu tiên bản đã chốt, chưa có thì dùng số mới nhất (như điểm liệt hiện tại). 案B: chỉ bản đã chốt. Khách nghiêng về 案B, sẽ bàn với mw |
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
| Bộ đọc nguồn | Dùng chung với xét điểm liệt (`RedScoreJudge::sourceMetric`), quy tắc chọn bản ở một chỗ |
| Mẫu số trung bình | `total_score ÷ examinees` như điểm liệt, thay `student_count` của code Uenomiya hiện tại |
| Kiểm tra khi lưu | Thiết lập, kỳ/nhóm, mốc, dấu bắt buộc; mốc ≥ 0, cho phép thập phân |
| Tham chiếu bị đổi tên/xóa | Mở lại hiện `選択してください` kèm cảnh báo; khi tính xử lý như thiếu trung bình |
| Dữ liệu cũ dùng OR | Giữ nghĩa; đếm trước khi phát hành |
| Danh sách | Hiện điều kiện dạng `平均点 評点集計 1学期期末/学年平均 50点以上`; thêm hai dòng chú thích ※ |
| Quyền | Giữ quyền màn tính điểm tự động hiện có |

## 5. Thiết kế giao diện

[Figma RA-001](https://www.figma.com/design/OkFTBuOyoF2hNnxCFy4Uds/), version "RA-001 v9 – cân bố cục, ghi chú cho khách". Trang **00｜Guide**, **01｜List and priority**, **02｜Conditions**, **03｜Formula**, **04｜Mapping states**. Đối chiếu với đặc tả ở [đặc tả màn hình, mục 08](docs/screen-definition.vi.md).

## 6. Tài liệu

- [Đặc tả](docs/specification.vi.md), gồm tiêu chí nghiệm thu AC-01 → AC-22 (mục 14).
- [Đặc tả màn hình](docs/screen-definition.vi.md), [bản tiếng Nhật](docs/screen-definition.ja.md).
- Chưa làm: chia việc và đặc tả kiểm thử chi tiết. Làm khi bắt đầu triển khai.

## 7. Việc còn mở trước khi phát hành

| Việc | Ảnh hưởng |
| --- | --- |
| Q2 | Một chỗ trong bộ đọc nguồn chung, áp cho cả điểm liệt |
| PR 57058 chưa gộp | Nếu Q2 = 案B thì RA-001 phát hành sau PR 57058 |
| Mẫu số `examinees` thay `student_count` | Báo Uenomiya nếu số thay đổi |
| Bốn thư viện riêng của trường | Kiểm khi triển khai |
| Dữ liệu cũ dùng OR | Đếm trước khi phát hành |

## 8. Thứ tự đọc

1. Context này.
2. [Đặc tả](docs/specification.vi.md) và [đặc tả màn hình](docs/screen-definition.vi.md).
3. [Bản hỏi tiếng Việt](sources/2026-10-09-business-questions.vi.md), [bản hỏi tiếng Nhật](sources/2026-10-09-business-questions.ja.md).
4. [Ghi nhận nội bộ 10/10](sources/2026-10-10-internal-design-review.vi.md), [hiện trạng code](research/current-auto-rating-behavior.vi.md).
