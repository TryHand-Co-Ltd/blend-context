# Nội dung cần thể hiện trên giao diện — EM-001

Cập nhật: 22/10/2026. Tài liệu mô tả bằng văn bản đi kèm thiết kế. **Figma đã được nhóm gửi Shite review ngày 16/10 và 21/10/2026 ([thread](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1791290107759389)); chưa có phản hồi phê duyệt của Shite trong thread.**

## 1. Thiết lập quy tắc

Người dùng xác định mục nhận kết quả, nguồn trung bình (thiết lập tổng hợp, kỳ, tập thể), mục điểm cá nhân, điều kiện và giá trị đăng ký theo thứ tự. Mục nhận có thể là số hoặc lựa chọn.

Cần thể hiện rõ giới hạn của mục nhận độc lập với số điều kiện. Ví dụ mục số giới hạn 1–5 nhưng bảng chỉ trả 1, 3, 5; thêm/xóa điều kiện không thay giới hạn mục. Không tạo thiết lập số mức riêng hoặc tự gán mức thấp nhất khi không khớp.

Nguồn trung bình có thêm 授業平均 (khi 順位集計 bật tổng hợp theo tiết học). Ô giá trị đăng ký của mục dạng chọn có lựa chọn đầu "選択してください" (ô chưa dùng) tách biệt với "(空欄)" (đăng ký trống). Tối đa 20 khoảng và 20 điều kiện mỗi khoảng.

## 2. Xem lại cấu hình

Người dùng phải mở lại được nguồn, điều kiện, toán tử, giá trị và thứ tự đã lưu. Bố cục, loại điều khiển và cách điều hướng sẽ được xác định khi thiết kế Figma.

## 3. Kiểm tra kết quả

Dùng bảng/biểu đồ phân bố tần suất（度数分布表・グラフ）trong trích xuất thành tích（成績抽出）theo Q4, không bổ sung màn đếm người riêng. Kiểm tra local ngày 16/10/2026 đã xác nhận mục số và A/B/C đều xuất được bảng và biểu đồ với số lượng khớp nhau; xem [context, mục 10](../CONTEXT.md). Còn kiểm tra staging, kết quả trống và luồng tự tính EM-001 → trích xuất trước khi kết luận nghiệm thu.

Việc bổ sung nội dung lịch sử tính toán để giải thích nguồn và điều kiện khớp là đề xuất thiết kế, chưa phải màn hình được khách yêu cầu riêng hoặc phê duyệt.

## 4. Khi có Figma

Bổ sung liên kết file và phiên bản do người phụ trách cung cấp, rồi đối chiếu với [context](../CONTEXT.md) và [Q&A](../sources/confirmed-business-qa.vi.md). Ví dụ số trong [đặc tả dự thảo](specification.vi.md) là dữ liệu minh họa nghiệp vụ, không quyết định bố cục giao diện.

Bản tiếng Nhật: [screen-definition.ja.md](screen-definition.ja.md). Bản dịch cùng nội dung, không bổ sung phê duyệt nghiệp vụ.
