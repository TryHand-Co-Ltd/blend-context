# BLEND Context

Kho tài liệu dùng chung của dự án **BLEND**, lưu bối cảnh nghiệp vụ, yêu cầu, thiết kế, quyết định và căn cứ liên quan để các thành viên có thể tiếp nối công việc.

Repository này quản lý tài liệu độc lập với mã nguồn ứng dụng. Các tệp SQL là tài liệu thiết kế; trạng thái triển khai, kiểm thử và phát hành được xác nhận riêng.

## Cấu trúc

```text
context/
  <feature>/   Bối cảnh, Q&A và trạng thái quyết định của từng chức năng
docs/
  <feature>/   Đặc tả, thiết kế, tiêu chí nghiệm thu và kế hoạch của từng chức năng
```

Tài liệu được nhóm theo chức năng. Khi có chức năng mới, bổ sung thư mục tương ứng trong `context/` và `docs/`, rồi cập nhật mục lục bên dưới.

## Danh sách chức năng

Mỗi chức năng có thư mục context và tài liệu tương ứng. Đọc context trước để nắm bối cảnh và trạng thái xác nhận, sau đó xem tài liệu chi tiết trong docs.

| Chức năng | Context | Tài liệu |
| --- | --- | --- |
| Điểm đỏ（赤点） | [context/red-score/](context/red-score/) | [docs/red-score/](docs/red-score/) |

Context chuẩn xác định yêu cầu hiện hành và trạng thái quyết định. Q&A bổ trợ cách đọc theo câu hỏi; đặc tả, thiết kế và phương án chia việc phải được đối chiếu với context. Ngày cập nhật mới hơn không tự biến một đề xuất thành quyết định đã được duyệt.

## Quy ước cập nhật

- **Context:** ghi mục tiêu, phạm vi, thuật ngữ, nguồn xác nhận, điều đã biết và điểm còn mở trong `context/<feature>/`.
- **Docs:** lưu đặc tả, thiết kế, tiêu chí nghiệm thu, kế hoạch và kết quả kiểm chứng trong `docs/<feature>/`.
- **Decisions:** ghi quyết định cùng bối cảnh liên quan; khi cần tài liệu riêng, dùng `docs/<feature>/decisions/`. Mỗi quyết định cần ngày, trạng thái, vấn đề, lựa chọn đã chốt, lý do, tác động và căn cứ xác nhận. Nêu rõ quyết định nào bị thay thế.
- **Trạng thái:** phân biệt đề xuất, đã xác nhận, chưa chốt và đã thay thế. Tài liệu thiết kế không tự chứng minh chức năng đã được triển khai hoặc kiểm thử thành công.
- **Ngôn ngữ:** dùng hậu tố `.vi.md`, `.ja.md`, `.en.md` cho các bản tương ứng; giữ nguyên nhãn UI tiếng Nhật để đối chiếu. Khi sửa quy tắc, đồng bộ các bản dịch liên quan hoặc ghi rõ bản nào chưa cập nhật.
- **Tham chiếu:** README chỉ liên kết đến thư mục của từng chức năng; cập nhật bảng trên khi thêm chức năng mới. Trong tài liệu chi tiết, dùng liên kết tương đối cho tệp trong repository. Với nguồn bên ngoài, dùng liên kết dùng chung; tài liệu không được đính kèm cần được ghi rõ. Các nguồn Slack, Figma hoặc hệ thống nghiệp vụ có thể yêu cầu quyền truy cập riêng.
- **Thông tin chia sẻ:** không đưa đường dẫn máy cá nhân, cấu hình môi trường cá nhân, mật khẩu, token, khóa riêng hoặc dữ liệu nhạy cảm vào repository.

Khi cập nhật yêu cầu, sửa context và các tài liệu chịu ảnh hưởng trong cùng thay đổi, ghi rõ căn cứ và phạm vi thay đổi để người đọc tiếp theo có thể truy vết.
