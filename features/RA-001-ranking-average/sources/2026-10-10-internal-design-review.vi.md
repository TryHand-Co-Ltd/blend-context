# Thống nhất nội bộ ngày 10/10/2026 — RA-001

**Nguồn:** trao đổi giữa người phụ trách và AI trong phiên dựng Figma ngày 10–11/10/2026.

**Đây là thống nhất nội bộ của người phụ trách, không phải câu trả lời của khách hàng.** Khách hàng có thể chỉnh lại khi trả lời [bản hỏi](2026-10-09-business-questions.vi.md). Ngày ghi nhận không phải bằng chứng đã triển khai.

## 1. Dấu so sánh của điều kiện điểm trung bình

Dùng lại bộ dấu đang có của **マッピングした結果を登録する** (đăng ký kết quả đã so và chọn): **以上** (từ … trở lên), **より大きい** (lớn hơn), **等しい** (bằng), **より小さい** (nhỏ hơn), **以下** (từ … trở xuống). Không dùng **未満** (dưới).

Lý do: cùng màn tính điểm tự động, bộ dấu đã có trong code, người dùng không phải học hai cách ghi. Nhánh "dưới 50" ghi là **50 より小さい** (nhỏ hơn 50).

## 2. Đổi đề xuất Q3

Đề xuất Q3 đổi từ "đưa số đang hiện trên màn thứ hạng" sang **đưa số chưa làm tròn** (tổng điểm ÷ số học sinh).

Lý do: code hiện tại đã dùng số chưa làm tròn ([research](../research/current-auto-rating-behavior.vi.md), mục 7). Cách này tránh làm tròn hai lần; phần lẻ chỉ xử lý ở **端数処理** (xử lý phần lẻ) của dòng công thức. Bản hỏi Q3 được cập nhật theo đề xuất mới.

## 3. Figma

File: [RA-001 ranking average — Detailed Business Design](https://www.figma.com/design/OkFTBuOyoF2hNnxCFy4Uds/).

- Vẽ lại các màn theo UI đang chạy của sản phẩm. Màn **登録方法設定** (thiết lập cách đăng ký) / **計算結果を登録する** (đăng ký kết quả tính) là chuẩn cho các màn khác.
- Ghi chú trường hợp thiếu điểm trung bình theo hướng Q4 ở màn 01 và 02-A-2.
- Ví dụ điều kiện trên màn 01 ghi rõ thiết lập thứ hạng: "平均点 評点集計 1学期期末/学年平均 50点以上" (điểm trung bình, tổng hợp điểm đánh giá, cuối kỳ 1 / trung bình cả khối, từ 50 trở lên).
- Các radio của màn 02 đặt trên một hàng.
- Version đã lưu trong lịch sử Figma: "RA-001 v2" đến "RA-001 v5".

## 4. Cập nhật tài liệu

Ngày 10/10 người phụ trách chưa cho cập nhật tài liệu. Ngày 11/10 người phụ trách yêu cầu bổ sung phần còn thiếu, giữ trạng thái **đang xác nhận với khách**.
