# Review thay đổi trong blend-context

Để bắt đầu đọc repository, xem [README chính](../README.md).

Repository phục vụ đọc và tra cứu là chính. Mọi thay đổi context, rules, tài liệu, cấu trúc hoặc hướng dẫn AI đều đi qua PR vào `main`.

## Quy định review

- Mỗi PR phải request reviewer đại diện cho từng team đang sử dụng chung repository.
- Tác giả không tự duyệt PR của mình. Chỉ merge khi đã có approval hợp lệ và các ý kiến review đã được xử lý.
- Reviewer kiểm tra nội dung, nguồn xác nhận, ID, liên kết và ảnh hưởng tới phần dùng chung. Nếu nội dung thay đổi sau approval, request review lại phần thay đổi.
- Request reviewer không đồng nghĩa đã nhận approval; theo dõi kết quả review trực tiếp trên PR.

## Luồng cập nhật

1. Chuẩn bị thay đổi đúng phạm vi và kiểm tra tài liệu liên quan. AI mặc định để thay đổi chưa stage/commit/push để người phụ trách review, trừ khi được yêu cầu riêng.
2. Khi được phép xuất bản, tạo nhánh `docs/<Feature-ID>-<slug>`; thay đổi chung dùng `docs/repository-<slug>`. Đẩy nhánh và mở PR, không đẩy trực tiếp vào `main`.
3. Dùng mẫu PR để mô tả vấn đề, thay đổi, nguồn, kết quả kiểm tra và điểm cần xác nhận; request reviewer theo quy định trên.
4. Hoàn tất review trước khi merge. Phê duyệt tài liệu không thay cho approval nghiệp vụ, triển khai, chạy SQL hoặc phát hành ứng dụng `blend`.
