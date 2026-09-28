# Điểm đỏ（赤点） — Nội dung thay đổi và chia công việc

**Ngày cập nhật:** 28/09/2026.

Cho phép đặt nhiều quy tắc đỏ cho mục đánh giá số, xét điểm cuối đã lưu và dùng chung kết quả tại Trích xuất thành tích（成績抽出）, Công khai thành tích（成績公開） và Công cụ phiếu điểm（通知表ツール）, với cách hiển thị riêng của từng đầu ra. Đối tượng gồm số nguyên, số thập phân và điểm số theo đơn vị bài học. Giáo viên thường cũng được thiết lập nếu có quyền truy cập chức năng và sửa đúng mục.

Đây là **phương án chia việc cho thiết kế toàn feature**, chưa phải duyệt triển khai/phát hành toàn bộ. Điểm cố định là mức tối thiểu từng trao đổi; tỷ lệ điểm tối đa, công thức trung bình và điều kiện trung bình/tỷ lệ nhóm phải được chọn riêng cho từng đợt. Phần được chọn phải hoàn chỉnh từ cấu hình → xét → lưu → ba đầu ra; phần chưa chọn không được hiển thị như lựa chọn đang hoạt động.

Q3 đã chốt: tỷ lệ nhóm dùng kết quả tổng hợp thứ hạng hiện có. Không thêm cách tính riêng hoặc chặn cấu hình khác điểm tối đa; sự khác biệt đó không được làm dừng xử lý. Độ chính xác, nhận diện đơn vị và tích hợp bản tổng hợp đã chốt vẫn cần được xác minh kỹ thuật.

Tham chiếu bố cục tại [Bản thiết kế tiếng Nhật trên Figma](https://www.figma.com/design/O2fNFrlnuG8XdQlQIc3H3T/Red-Score-UI-Mockup---Final?node-id=4592-1631). URL của các màn đỏ mới chưa chốt; bên dưới ghi điểm vào đã xác định. Phần kỹ thuật mô tả trách nhiệm xử lý và cách tích hợp.

## Danh sách công việc

| Task | Màn hình chính | Thay đổi | Đầu vào thực sự cần có |
| --- | --- | --- | --- |
| 1. Thiết lập và lưu nhiều quy tắc | [Thiết lập nhập điểm（成績入力設定）] - `/admin/grade_report_setting/manage` | Danh sách, ưu tiên, đối tượng, cố định và tỷ lệ được chọn triển khai | Loại được triển khai; cấu trúc lưu và cách lấy điểm tối đa của Task 2 |
| 2. Xét điểm cuối và lưu kết quả chung | Không có màn trực tiếp | Chọn rule, xét cố định/tỷ lệ, lưu trạng thái, đọc chung, thiết kế DB | Thiết kế dữ liệu ô điểm/cấu hình/kết quả; phần độc lập không cần chờ trung bình |
| 3. Hỗ trợ điều kiện và công thức dùng tổng hợp | [Thiết lập nhập điểm（成績入力設定）] - `/admin/grade_report_setting/manage` | Chọn nguồn, phân nhánh trung bình/tỷ lệ nhóm, công thức và phần lẻ từng dòng | Danh sách điều kiện/công thức được chọn; form Task 1 và đầu vào/đầu ra xét của Task 2 |
| 4. Cập nhật kết quả khi đăng ký và chạy hàng loạt | [Tổng hợp thành tích（成績集計）] - `/admin/grade/grade_setting_system/grade_calc` | Nhập trực tiếp, CSV, liên kết điểm thi, batch, chạy lại sau xóa, báo lỗi | Xét/lưu của Task 2; nguồn Task 3 nếu quy tắc phụ thuộc nguồn |
| 5. Lọc điểm đỏ và hiển thị trên Excel | [Trích xuất thành tích（成績抽出）] - `/admin/nb/grade/grade_setting_system/grade_extraction` | Lọc học sinh theo ô đỏ trong phạm vi; ký hiệu và màu ô | Kết quả chung Task 2, cập nhật trạng thái Task 4 |
| 6. Hiển thị điểm đỏ trên công khai, không lặp hiệu ứng | [Thiết lập công khai thành tích（成績公開設定）] - `/admin/grade_report_setting/grade_publish` | Kết hợp với điểm dự kiến; web/API/PDF phía học sinh | Kết quả chung Task 2, cập nhật trạng thái Task 4 |
| 7. Thêm điều kiện đỏ vào phiếu điểm | [Công cụ phiếu điểm（通知表ツール）] - `/admin/grade_report_setting/report_card` | Thứ tự điều kiện, lưu/mở lại, sao chép template, PDF | Kết quả chung Task 2, cập nhật trạng thái Task 4 |
| 8. Bảo toàn chuyển cấu hình và chức năng cũ | [Thiết lập nhập điểm（成績入力設定）] - `/admin/grade_report_setting/manage` | Các đường sao chép, năm mới, xuất/nhập, khôi phục, đồng bộ được chọn | Chốt đường hỗ trợ và xử lý lỗi; cấu trúc dữ liệu Task 1–3 |

## 1. Thiết lập và lưu nhiều quy tắc

**Màn hình chính:** [Thiết lập nhập điểm（成績入力設定）] - `/admin/grade_report_setting/manage`

**Màn hình bị ảnh hưởng:**

- [Tổng hợp thành tích（成績集計）] - `/admin/grade/grade_setting_system/grade_calc`
- [Thiết lập công khai thành tích（成績公開設定）] - `/admin/grade_report_setting/grade_publish`

**Phạm vi thay đổi:** Thêm màn hình và xử lý lưu từ Thiết lập ô nhập（入力欄設定） đến danh sách điểm đỏ, Điều kiện áp dụng（適用条件） và Thiết lập ngưỡng（基準設定） cho giáo viên có quyền truy cập và sửa mục. Task này sở hữu form chung, bộ lọc không dùng tổng hợp, cấu hình cố định và tỷ lệ được chọn. Phần dùng tổng hợp thuộc Task 3, chạy lại thuộc Task 4, cấu hình công khai thuộc Task 6; không triển khai trùng đầu ra tại đây.

### Thay đổi nghiệp vụ

- Hiển thị mục, kiểu điểm, kỳ/thời điểm; có tên, ưu tiên, tóm tắt điều kiện/ngưỡng đã lưu, thêm, xóa, đổi thứ tự. Tên chỉ để nhận biết, không làm khóa liên kết; không tạo quy tắc có hiệu lực cho mục không phải số.
- Áp dụng cho toàn bộ phạm vi được phép của mục hoặc giới hạn bằng giáo khoa/môn, khối, lớp/nhóm và bộ lọc lựa chọn đang hỗ trợ. Cùng loại lọc dùng HOẶC, giữa các loại dùng VÀ. Không xét trực tiếp A/B/C nhưng vẫn dùng lựa chọn đó để lọc đối tượng.
- Khi lưu cố định, kiểm `0≤N≤M` cho mọi đối tượng và kiểm lại khi mở rộng phạm vi. Tỷ lệ phải thỏa `0≤N≤100`; dấu cuối là Nhỏ hơn（未満） hoặc Nhỏ hơn hoặc bằng（以下）. Không bắt nhập nguồn tổng hợp không dùng.
- Lưu, đổi thứ tự, xóa chỉ đổi cấu hình, không báo đã xét xong. Xóa rule cuối vẫn giữ kết quả đến lần chạy lại và phải có hướng dẫn; hủy hoặc lưu lỗi giữ cấu hình/kết quả đã lưu.
- **Đề xuất cần review:** Rule mới đặt cuối, mở loại cố định, dấu nhỏ hơn, chưa nhập giá trị. Rule chưa hoàn chỉnh không có hiệu lực; giới hạn đối tượng nhưng không có bộ lọc hợp lệ thì báo lỗi. Đổi loại trong phiên sửa giữ tạm input; mở lại phục hồi loại đã lưu. Đổi nguồn chỉ xóa lựa chọn phụ thuộc không còn hợp lệ.

### Hướng kỹ thuật

- Các hàm `edit`, `editCondition`, `registCondition`, `editFormula`, `registFormula`, `sort`, `delete` tại bộ điều khiển thiết lập tính tự động hiện có là mẫu hiện hữu cho danh sách, điều kiện, công thức và lưu. Tái sử dụng phần form/validation phù hợp, không chuyển cấu hình AutoRating thành rule đỏ. Không sao chép giới hạn riêng một trường thành yêu cầu chung.
- Nối với điểm vào ô nhập trong cấu hình điều hướng màn hình ứng dụng; chốt URL mới, HTTP method và dữ liệu lưu khi thiết kế triển khai. Cả xem và lưu đều kiểm trường, năm, quyền sửa mục, nguồn thuộc phạm vi; giữ CSRF, kiểm tra server và escape tên/ký hiệu khi hiển thị.
- Lưu thứ tự, đối tượng, loại ngưỡng đang chọn, dấu và phần lẻ theo thiết kế Task 2. Tránh cập nhật dở khi lỗi và đọc lại giá trị cũ do replica trễ; không cập nhật/reset `red_score` hoặc `changed_red_score`.
- Dùng chung cách phân giải điểm tối đa của Task 2 để kiểm cấu hình. Giới hạn cố định là kiểm lúc lưu; không tự sửa ngưỡng đã lưu khi điểm tối đa giảm về sau.

### Phụ thuộc và phần chưa chốt

Có thể bắt đầu thiết kế trường nhập, điều hướng và validation. Lưu dữ liệu cần cấu trúc Task 2. Review các đề xuất về mặc định, thêm dở, đổi loại; Task 3 thêm trường nguồn/trung bình/tỷ lệ nhóm và cần phối hợp thứ tự sửa form chung.

### Hoàn tất khi

Giáo viên đủ quyền thiết lập nhiều rule cho mục số, mở lại đúng nội dung/thứ tự và phân biệt thời điểm lưu cấu hình với cập nhật kết quả xét.

## 2. Xét điểm cuối và lưu kết quả chung

**Màn hình chính:** Không có màn trực tiếp; đây là xử lý xét, lưu và đọc chung.

**Màn hình bị ảnh hưởng:**

- [Thiết lập nhập điểm（成績入力設定）] - `/admin/grade_report_setting/manage`
- [Tổng hợp thành tích（成績集計）] - `/admin/grade/grade_setting_system/grade_calc`
- [Trích xuất thành tích（成績抽出）] - `/admin/nb/grade/grade_setting_system/grade_extraction`
- [Xác nhận thành tích（成績確認）] - `/student/grade/grade_publish`
- [Công cụ phiếu điểm（通知表ツール）] - `/admin/grade_report_setting/report_card`

**Phạm vi thay đổi:** Sở hữu thiết kế DB cấu hình/kết quả, phân giải điểm tối đa, chọn rule, xét cố định/tỷ lệ được chọn, lưu trạng thái và đọc chung cho tập đối tượng đã kiểm quyền. Các màn là nơi sử dụng kết quả; Task 5–7 sở hữu hiển thị riêng. Báo cáo tùy biến trường đọc ngưỡng cũ chỉ cần kiểm hồi quy.

### Thay đổi nghiệp vụ

- Một kết quả hiện hành thuộc đúng ô gồm học sinh, trường, năm, lớp/môn, mục, kỳ/thời điểm, đơn vị. Dùng `S` cuối đã lưu, gồm sửa tay, Điểm dự kiến（見込点）, Chưa dự thi（未受験） có số và 0 hợp lệ; không đổi trống hoặc điểm không hoạt động thành 0.
- Kiểm điều kiện theo ưu tiên, chọn rule khớp đầu tiên rồi mới tính ngưỡng. Điều kiện ưu tiên cao có thể áp dụng nhưng chưa xác định được, hoặc rule đã chọn không tính được, đều không được đi xuống rule thấp hơn. Nếu bộ lọc độc lập đã đủ xác định không áp dụng thì bỏ qua mà không cần đọc tổng hợp.
- Cố định dùng `T=N`; tỷ lệ dùng `M×N/100` với `M` hiện hành rồi xử lý phần lẻ đã chọn. Phân giải mức chuẩn → đơn vị có hiệu lực → lựa chọn lớp thực sự áp dụng. Tỷ lệ cần `M` dương, hữu hạn; cố định không phụ thuộc việc `M` thay đổi sau lưu.
- Phân biệt đỏ, không đỏ, chưa từng xét, chưa xét được, không áp dụng, không có điểm. Chỉ đổi cấu hình/nguồn thì giữ trước; chạy lại không tạo được ngưỡng thì chưa xét được, mọi rule không khớp thì không áp dụng và ngừng kết quả cũ. Xóa/không dùng điểm phải ngừng hiệu ứng của số đã mất.
- Xét không đổi điểm; ba đầu ra đọc cùng kết quả. Chạy lại không nhân đôi kết quả/dấu và lượt cũ hoàn tất muộn không ghi đè điểm/kết quả mới.

### Hướng kỹ thuật

- Bộ đọc điểm chung theo khung đánh giá đọc điểm kèm mục, lớp, học sinh, kỳ/thời điểm và đơn vị. Gắn kết quả chung vào luồng này hoặc dùng đường đọc có cùng nhận diện. Không dùng số thứ tự cột/tên mục làm khóa; phân biệt bản ghi bị xóa/tạo lại.
- `calcPerStudent` tại bộ tính điểm tự động hiện có phân giải maximum chuẩn, đơn vị, hiệu ứng lựa chọn rồi giới hạn điểm tính theo min/max. Chỉ tham khảo phần phân giải; không áp giới hạn điểm hoặc ghi qua `createRegistData` lên `T`. bộ lấy miền điểm hiện có riêng lẻ chưa đủ tầng đơn vị.
- **Đề xuất thiết kế:** Tách cấu hình/kết quả mới khỏi scalar cũ; lưu nhận diện ô, trạng thái hiện hành, rule/lượt dùng, thời gian và thông tin giải thích cần thiết. Quan hệ dữ liệu phải cho đọc kết quả sau xóa rule đến khi chạy lại, không phụ thuộc xóa dây chuyền. Task này trình thiết kế bảng vật lý, độ chính xác, index, thứ tự cập nhật; không thêm version toàn bộ rule hoặc màn lịch sử.
- Bảo đảm so `S=T`, số hữu hạn, xử lý tràn và độ chính xác lưu/mở lại ở phần chung. Không chạy mã tùy ý; dùng model/repository và đọc theo tập, tránh query trong vòng lặp. Cụ thể hóa tính nhất quán giữa ghi/đọc, yêu cầu trùng và từ chối ghi cũ bằng transaction/job hiện hữu.
- Task 3 cung cấp giá trị nguồn và kết quả công thức/lý do chưa xét được; Task này tập trung lưu và ngừng hiệu lực. Task 4 nối trigger, tập ô và giao dịch; đầu ra không tính lại.

### Phụ thuộc và phần chưa chốt

Có thể bắt đầu nhận diện ô, trạng thái và phần cố định/tỷ lệ độc lập mà không chờ nguồn thật. Hoàn tất thiết kế DB/độ chính xác trước khi hoàn thiện lưu; Task 3 chưa tích hợp không làm phần độc lập bị chặn theo. Xong thiết kế DB khác với xong triển khai hoặc đã chạy migration.

### Hoàn tất khi

Lưu duy nhất đúng trạng thái của ô mà không đổi điểm; ba đầu ra đọc cùng ý nghĩa trước/sau xóa rule, thiếu dữ liệu và không áp dụng.

## 3. Hỗ trợ điều kiện và công thức dùng tổng hợp

**Màn hình chính:** [Thiết lập nhập điểm（成績入力設定）] - `/admin/grade_report_setting/manage`

**Màn hình bị ảnh hưởng:**

- [Tổng hợp thành tích（成績集計）] - `/admin/grade/grade_setting_system/grade_calc`

**Phạm vi thay đổi:** Với điều kiện/công thức được chọn triển khai, sở hữu phần bổ sung vào form Task 1, lưu/kiểm input, phân giải nguồn và tính công thức. Giữ quyền sửa mục và trường/năm của nguồn. Tổng hợp hiện có là phụ thuộc cần thiết; không xây phương thức xếp hạng mới.

### Thay đổi nghiệp vụ

- Chọn Thời kỳ tổng hợp（集計対象時期）, Thiết lập tổng hợp thứ hạng（順位集計設定）, Nhóm học sinh được tổng hợp（集計対象（母集団）） và đúng môn/mục/đơn vị. Tách đối tượng áp dụng khỏi nhóm tham chiếu, không đổi trung bình theo bộ lọc trích xuất. Ngưỡng cố định có điều kiện trung bình/tỷ lệ cũng phụ thuộc nguồn.
- Tự ưu tiên bản chốt đúng phạm vi; chỉ khi không có mới dùng bản hoàn tất mới nhất cùng phạm vi. Không lấy bản khác lấp dữ liệu thiếu của bản chốt, không tính lại trung bình từ điểm chưa tổng hợp.
- Chọn nhánh bằng `A`/`R` trước làm tròn: `A=49.99` thuộc `<50`. `R` kế thừa tổng điểm/tổng maximum của cùng tập đóng góp, không dùng trung bình cộng tỷ lệ cá nhân hoặc `A/M` của học sinh đang xét.
- Công thức gồm vế trái/phải, bốn phép toán, phần lẻ từng dòng; tham chiếu nhận kết quả sau phần lẻ, dòng cuối cho `T`. Ngưỡng âm hữu hạn hợp lệ, không ép về 0/maximum. Từ chối mẫu số cố định 0, thiếu giá trị, tham chiếu chính dòng/dòng sau/dòng đã xóa lúc lưu; lỗi chỉ xuất hiện khi chạy thì trả chưa xét được cho Task 2.
- **Đề xuất cần review:** Dấu phân nhánh `<`/`≤`/`≥`/`>`; toán hạng trung bình, số/hệ số, kết quả dòng trước. Công thức có một bộ nguồn cho trung bình; điều kiện có lựa chọn nguồn riêng. Vị trí phần lẻ `p=1..9` xử lý chữ số thập phân thứ p; phương thức gần nhất/lên/xuống. Với số âm, điểm giữa làm tròn ra xa 0, lên/xuống là ceil/floor.

### Hướng kỹ thuật

- Bộ đọc kết quả tổng hợp hiện có là điểm đọc theo bộ tổng hợp, nhóm, môn, thời điểm. Không coi đường đọc hiện tại đã có bản chốt và đơn vị; phải giữ nhận diện đơn vị và lựa chọn bản chốt đến cuối.
- Đối chiếu tổng điểm, số người có điểm, tổng maximum trong cùng bản và cùng tập đóng góp. Không thay số người có điểm bằng số người xếp hạng; lấy tỷ lệ đủ độ chính xác hoặc các thành phần, không dùng số đã làm tròn để hiển thị. Số người 0, mẫu sai, thiếu dữ liệu không phải giá trị 0 thật.
- Tham khảo editor của bộ điều khiển thiết lập tính tự động và `calcResult`, `getCalcValue`, `calcDecimalPlace` tại bộ tính điểm tự động hiện có. Không mở mọi toán hạng sẵn có; tách công thức ngưỡng khỏi ghi/xóa/giới hạn điểm. Sau xóa/đổi thứ tự dòng phải kiểm đúng nghĩa tham chiếu.
- Nối cấu hình qua đường lưu Task 1, kết quả công thức qua đầu vào/đầu ra xét của Task 2. Một lượt dùng cùng nguồn nhiều lần phải cùng bản; đổi nguồn điều kiện không ngầm đổi nguồn công thức. Chốt chữ số, miền hệ số, số dòng trong thiết kế kỹ thuật, không âm thầm làm tròn giá trị đã nhận khi lưu.

### Phụ thuộc và phần chưa chốt

Cần chọn rõ điều kiện/công thức trong đợt triển khai. Phần đã chọn được dùng dummy data để làm trước; không chặn mọi việc chỉ vì chờ kết nối liên quan [PR nguồn tổng hợp #57058](https://github.com/ednity/school-web/pull/57058). Tài liệu không xác nhận trạng thái merge hiện tại. Chưa hoàn tất tích hợp phần này nếu chưa kiểm nguồn thật, ưu tiên bản chốt, đơn vị và độ chính xác.

### Hoàn tất khi

Điều kiện/công thức được chọn tạo ngưỡng từ đúng nguồn, phân biệt thiếu dữ liệu với ngưỡng âm hợp lệ và trả về bộ xét chung.

## 4. Cập nhật kết quả khi đăng ký và chạy hàng loạt

**Màn hình chính:** [Tổng hợp thành tích（成績集計）] - `/admin/grade/grade_setting_system/grade_calc`

**Màn hình bị ảnh hưởng:**

- [Đăng ký thành tích（成績登録）] - `/admin/nb/grade/grade_setting_system/lesson_group/regist/(:num)`
- [Đăng ký thành tích bằng CSV（成績CSV登録）] - `/admin/nb/grade/grade_setting_system/lesson_group_csv/regist/(:num)`
- [Thiết lập điểm tối đa hàng loạt（満点一括設定）] - `/admin/grade/lesson_group/setting?setting_type=change_max_score`
- [Thiết lập nhập điểm（成績入力設定）] - `/admin/grade_report_setting/manage`
- [Liên kết điểm từ quản lý thi/chấm bài（試験・採点管理の成績連携）] - Chưa xác minh URL chi tiết; xử lý liên kết được nêu bên dưới.

**Phạm vi thay đổi:** Gọi Task 2 từ nhập trực tiếp, CSV, liên kết điểm thi được hỗ trợ và batch trong quyền đăng ký/chạy hiện có. Màn tối đa hàng loạt phụ thuộc đường job sẵn có; màn định nghĩa maximum và lưu mức tối đa của ô nhập chỉ kiểm hồi quy hành vi lưu cấu hình, không thêm trigger xét toàn trường.

### Thay đổi nghiệp vụ

- Xét sau giới hạn điểm, cập nhật môn chính/phụ và ô liên quan. Không bỏ mục không có AutoRating, điểm sửa tay bị bỏ tính lại hoặc ô đã liên kết nhưng không gọi AutoRating.
- Trường chỉ có rule đỏ vẫn chạy được bằng thao tác hàng loạt hiện hữu; mục đã xóa rule cuối vẫn được xử lý kết quả cũ. Không mở rộng quyền trường/năm/lớp/học sinh/thời điểm/thực thi.
- Với đánh giá tương đối: tự tổng hợp để Không thực hiện（実行しない）, hoàn tất đầu vào → nút xanh Thực hiện tổng hợp（集計実行） hoàn tất → nút cam Thực hiện tính toán tự động（自動算出実行） hoàn tất. Tắt tự tổng hợp không tắt xét lúc đăng ký; bản chốt vẫn ưu tiên. Không thêm vòng lặp hội tụ hoặc quản lý hoàn tất mọi môn.
- Nhập trực tiếp/CSV/liên kết giữ ranh giới giao dịch hiện có và điểm/kết quả nhất quán. Batch phân biệt phần hoàn tất, chưa xét được, thất bại; vào hàng đợi hay số lớp đã xử lý không được báo mọi ô đã xét xong.
- Tách chưa chạy lại sau đổi cấu hình, đã chạy nhưng không tạo được ngưỡng, và lỗi kỹ thuật không lưu được. Hướng dẫn chạy lại, không thêm retry vô hạn, lộ lỗi nội bộ hoặc cấm công khai mới.

### Hướng kỹ thuật

- Xử lý đăng ký điểm trực tiếp của lớp và xử lý đăng ký điểm bằng CSV nối lưu điểm → AutoRating → kết thúc giao dịch → tổng hợp thứ hạng. Dùng tập ô và thời điểm đã được phép; lưu kết quả nhất quán trước thông báo đăng ký thành công.
- Xử lý liên kết điểm thi ghi điểm trước rồi bỏ AutoRating nếu `createArgument` không trả lớp. Không chỉ đặt xét bên trong `AutoRating::calc`; phải bao phủ những ô đã ghi ở đường này.
- luồng thực thi tính điểm tự động còn xử lý môn chính/phụ, sao chép đánh giá theo tiêu chí và cập nhật đơn vị sau tính tự động. Xác định tập ô cuối gồm cả cập nhật liên quan, không xét trung gian; không dùng các nhánh không có công thức, bỏ điểm tay hoặc ghi NULL khi không khớp làm chính sách loại/xóa điểm của bộ xét.
- Đồng bộ điều kiện chạy, dựng đối tượng, tiến độ ở xử lý dựng đối tượng tính hàng loạt, xử lý lưu tiến độ batch, xử lý điều khiển tổng hợp thành tích và giao diện tổng hợp thành tích. Không phụ thuộc duy nhất vào có công thức; cho xử lý kết quả sau xóa rule cuối.
- Không giả định batch hoàn tác toàn bộ. Nối chống trùng/thứ tự của Task 2 với phục hồi job hiện có; tách thành công, chưa xét được về nghiệp vụ, lỗi lưu. Không yêu cầu queue mới hoặc khóa toàn trường.

### Phụ thuộc và phần chưa chốt

Có thể bắt đầu thiết kế tập ô và điểm kết nối giao dịch. Thực thi cần Task 2; tích hợp quy tắc phụ thuộc nguồn cần Task 3. Hệ thống thành tích cũ/đường riêng trường chưa tự được coi là hỗ trợ; ghi rõ, điều tra và kiểm những đường được chọn cho đợt triển khai.

### Hoàn tất khi

Mọi đường đăng ký và batch được chọn giữ điểm cuối/kết quả nhất quán trong quyền, đồng thời xử lý được kết quả còn lại sau khi xóa rule cuối.

## 5. Lọc điểm đỏ và hiển thị trên Excel

**Màn hình chính:** [Trích xuất thành tích（成績抽出）] - `/admin/nb/grade/grade_setting_system/grade_extraction`

**Màn hình bị ảnh hưởng:** Không có màn khác; bao gồm cấu hình, kết quả và Excel của cùng chức năng.

**Phạm vi thay đổi:** Sở hữu bộ lọc học sinh đỏ, cấu hình hiển thị ô, lưu/mở lại và Excel cho giáo viên có quyền trích xuất. Phụ thuộc đọc kết quả Task 2; bộ lọc khác, palette và ẩn điểm là phạm vi hồi quy.

### Thay đổi nghiệp vụ

- Chỉ khi bật lọc đỏ, giữ học sinh có ít nhất một ô đỏ hiện hành trong môn/mục/kỳ/thời điểm/đơn vị được chọn. Ô đỏ ngoài phạm vi không giúp thỏa; 0 kết quả hợp lệ.
- Ký hiệu trước/sau và màu ô là các lựa chọn độc lập, trước/sau dùng đồng thời được và bật thì bắt buộc nhập. Chỉ bật hiển thị không lọc học sinh; chỉ trang trí ô đỏ, không cả dòng.
- Dùng palette hiện có, không hiện lại điểm ẩn. Ví dụ 24 đỏ có trước `※`, sau `!` thì `※24!`; kết quả cũ đã hết hiệu lực không ảnh hưởng lọc/trang trí.
- Màn hình và Excel của cùng lần xuất dùng cùng trạng thái, không xét lại. **Đề xuất mặc định:** các hiệu ứng/bộ lọc mới OFF để không tự đổi mẫu đang dùng.

### Hướng kỹ thuật

- Nối trạng thái Task 2 vào điều kiện đối tượng và dựng kết quả tại xử lý chung của trích xuất thành tích và xử lý dựng kết quả trích xuất. Bổ sung giá trị hiển thị vào lưu/đọc cấu hình.
- Xử lý xuất Excel từ kết quả trích xuất nhận bảng gửi qua POST. Kết luận đỏ, học sinh và ô trang trí phải dựa trên kết quả server đã kiểm quyền, không tin cờ/ngưỡng gửi lên. Dùng cơ chế Excel và màu hiện có.
- Phạm vi môn/thời điểm/đơn vị dùng để lọc phải khớp nhận diện ô trang trí. Lấy cùng tập kết quả, không tính riêng hoặc trộn trạng thái khác thời điểm chỉ trong Excel. Không thêm định dạng báo cáo không liên quan.

### Phụ thuộc và điều kiện hoàn tất

Có thể chuẩn bị UI khi thống nhất dạng kết quả chung. Sau tích hợp Task 2/4, kiểm màn hình và **file Excel thật** khớp ký hiệu, màu, trống, giá trị với lọc ON/OFF, 0 kết quả, ngừng dùng kết quả cũ và ẩn điểm.

## 6. Hiển thị điểm đỏ trên công khai, không lặp hiệu ứng

**Màn hình chính:** [Thiết lập công khai thành tích（成績公開設定）] - `/admin/grade_report_setting/grade_publish`

**Màn hình bị ảnh hưởng:**

- [Xác nhận thành tích（成績確認）] - `/student/grade/grade_publish`

**Phạm vi thay đổi:** Cấu hình bởi giáo viên có quyền sửa công khai, hiển thị cho học sinh/phụ huynh được phép trên web, API liên quan, PDF công khai. Phụ thuộc kết quả Task 2 và cập nhật Task 4; giữ lịch, trường/năm, quan hệ sở hữu và ẩn điểm.

### Thay đổi nghiệp vụ

- Với mục đỏ đủ điều kiện, lưu ngoặc hoặc `*` cố định trước/sau trong phạm vi điểm thường/đơn vị. Không thêm ký tự tự do, lọc học sinh đỏ hay nền đỏ riêng. **Đề xuất mặc định:** chưa cấu hình thì giữ hiển thị hiện có.
- Kết hợp hiệu ứng dự kiến và đỏ khác nhau; trùng thì chỉ một lần. Ngoặc và `*` trước → `(*24)`; hai `*` trước → `*24`; hai ngoặc → `(24)`; trước/sau → `*24*`.
- Tuân theo ẩn điểm có hiệu lực, không lộ điểm hoặc chỉ dấu. Khi đỏ hết hiệu lực vẫn giữ các hiệu ứng dự kiến/khác còn hợp lệ.
- Xóa rule cuối không xóa cấu hình hiển thị; trước chạy lại vẫn dùng hiệu ứng cho kết quả còn hiệu lực. Renderer không bỏ dấu ngay dựa vào số rule; xem/xuất lại không kích hoạt xét.

### Hướng kỹ thuật

- Xử lý dựng dữ liệu điểm công khai tổ chức kết quả `GradeService` thành điểm thường/đơn vị rồi áp hiệu ứng ô chọn. Gắn đúng trạng thái Task 2 vào cùng ô, kết hợp/khử trùng sau khi giữ quy tắc ẩn; không suy trạng thái dự kiến/đỏ từ số lượng dấu.
- Theo xử lý xuất PDF công khai, đường lưu cấu hình và nơi dùng web/API để giữ cùng trạng thái/quy tắc. Giữ cách đọc theo tập hiện có khi xuất PDF hàng loạt.
- Không dùng cơ chế dừng tại điều kiện đầu tiên của phiếu làm sai quy tắc công khai. Tách điều kiện cho sửa cấu hình hiển thị với thời gian được dùng kết quả/cấu hình đã lưu.

### Phụ thuộc và điều kiện hoàn tất

Chuẩn bị theo cấu trúc kết quả chung. Sau Task 2/4, kiểm kết hợp, khử trùng, ẩn, chuyển trạng thái qua đường xem thật của học sinh/phụ huynh, API, PDF công khai; màn thông tin học sinh phía giáo viên chưa đủ bằng chứng.

## 7. Thêm điều kiện đỏ vào phiếu điểm

**Màn hình chính:** [Công cụ phiếu điểm（通知表ツール）] - `/admin/grade_report_setting/report_card`

**Màn hình bị ảnh hưởng:** Không có màn khác; gồm tùy chọn ô, cập nhật bảng, sao chép template và PDF trong công cụ.

**Phạm vi thay đổi:** Sở hữu điều kiện hiển thị đỏ, lưu, mở lại, đầu ra cho giáo viên có quyền thiết kế phiếu. Dùng kết quả Task 2; giữ điều kiện môn cụ thể/ô chọn/ô trống, ẩn/gạch chéo và cấu trúc template riêng trường.

### Thay đổi nghiệp vụ

- Có Nguyên trạng（そのまま表示）, Kèm ngoặc（カッコ付き）, ký tự trước/sau; chỉ trước/sau bắt buộc ký tự. Không thêm ẩn/gạch chéo/nền riêng cho đỏ. **Đề xuất mặc định:** nguyên trạng.
- Sau các kiểm soát ẩn/thời điểm hợp lệ, xét môn cụ thể → ô chọn theo thứ tự hiện có → đỏ → ô trống → bình thường. Khớp đầu tiên thì dừng, kể cả nguyên trạng.
- Dự kiến phía trên chọn ngoặc thì 24 đỏ vẫn `(24)`, nguyên trạng thì `24`, không thêm `※` của đỏ. Không hiện lại điểm đã ẩn/gạch chéo; không đổi thành quét toàn bộ để tìm bất kỳ lệnh ẩn ở đâu.
- Hoàn tất hộp thoại rồi Cập nhật（更新する） ở bảng để lưu. Chỉ có điều kiện đỏ cũng phải còn hiệu lực khi mở lại; sao chép template giữ cách hiển thị, không sao chép kết quả cá nhân.

### Hướng kỹ thuật

- Thêm kiểm trạng thái đỏ sau ô chọn, trước ô trống trong nhánh `evaluate_item` tại xử lý định dạng ô phiếu điểm. Giữ return của nguyên trạng tại `formatValueByDisplayValueType`; không gắn dấu cũ lên ô trống.
- Xử lý lưu cấu hình bảng phiếu điểm điều chỉnh `use_condition` theo lựa chọn cũ. Đồng bộ lưu, đọc lại, copy để cấu hình chỉ có đỏ không bị vô hiệu; không chỉ sửa hộp thoại.
- Gắn trạng thái Task 2 đúng đơn vị, thời điểm, môn vào dữ liệu converter. Dùng đường PDF hiện có, kiểm không tràn/mất ký hiệu hoặc đổi cấu trúc. Không thêm đóng băng hay quản lý phiên bản toàn phiếu.

### Phụ thuộc và điều kiện hoàn tất

Chuẩn bị lưu cấu hình theo kết quả chung. Sau Task 2/4, kiểm lưu/mở lại/copy và **PDF thật** cho điều kiện khớp đầu tiên, chỉ bật đỏ và chuyển trạng thái.

## 8. Bảo toàn chuyển cấu hình và chức năng cũ

**Màn hình chính:** [Thiết lập nhập điểm（成績入力設定）] - `/admin/grade_report_setting/manage`

**Màn hình bị ảnh hưởng:**

- [Đăng ký thành tích（成績登録）] - `/admin/nb/grade/grade_setting_system/lesson_group/regist/(:num)`
- [Kế thừa năm học, xuất/nhập và khôi phục cấu hình（年度継承・設定の入出力／復元）] - Chưa xác minh URL từng thao tác; usecase hiện có nêu bên dưới.

**Phạm vi thay đổi:** Triển khai đường sao chép cấu hình, năm mới, xuất/nhập, khôi phục, đồng bộ lớp đã chọn cho giáo viên có quyền hiện hữu. Dữ liệu đỏ cũ và nơi dùng riêng trường thuộc phạm vi bảo toàn/hồi quy. Copy template phiếu do Task 7 sở hữu, không làm trùng.

### Thay đổi nghiệp vụ

- Không chuyển ngưỡng cũ thành rule mới có hiệu lực. Giữ nghĩa dữ liệu, phép so sánh ở báo cáo riêng trường, không reset khi lưu mới; thiếu rule, chưa xét được hoặc không áp dụng đều không dùng ngưỡng cũ thay thế.
- **Đề xuất cho đường được hỗ trợ:** Chỉ chuyển rule trong phạm vi cấu hình đã chọn; ánh xạ đúng trường/năm/mục/thời điểm/môn/nhóm/đơn vị, giữ thứ tự và tham chiếu công thức. Không copy kết quả xét hoặc gắn thẳng bản chốt năm cũ sang năm mới.
- **Đề xuất xử lý lỗi:** Không thay tham chiếu không ánh xạ được bằng dữ liệu cùng tên, không bật rule chưa đủ; thông báo phần lỗi và chốt cách xử lý theo giao dịch hiện có.
- Tệp cũ thiếu phần đỏ mới không được tạo từ legacy hoặc âm thầm xóa rule hiện hành; chốt theo chế độ nhập. Khôi phục/thay khung không nối kết quả cũ vào ô xóa/tạo lại; đồng bộ cấu hình không đồng nghĩa đã xét.

### Hướng kỹ thuật

- Sao chép cấu hình, kế thừa năm học, xuất cấu hình, nhập cấu hình, khôi phục cấu hình đang xử lý ngưỡng và ánh xạ mục. Đường thêm cấu hình mới dùng thiết kế Task 1–3 và bảng ánh xạ ID hiện có, giữ lưu và xuất/nhập giá trị cũ.
- Xử lý ánh xạ dữ liệu khi sao chép và xử lý ánh xạ dữ liệu khi kế thừa năm xử lý ID mục mới cùng ngưỡng cũ. Không nhân bản ID kết quả; bổ sung ánh xạ dòng công thức, đơn vị, nguồn, rồi đọc cấu hình ở quyền/ngữ cảnh đích.
- Trước triển khai, chốt phạm vi, thứ tự áp dụng, phần dữ liệu giữ khi lỗi của import thiếu phần mới, failback thay thế, đồng bộ lớp. Không ghi đường chưa xác minh thành đã hỗ trợ; chưa hỗ trợ phải nêu giới hạn. Không mở rộng thành chuyển mọi báo cáo riêng trường sang rule mới.

### Phụ thuộc và phần chưa chốt

Có thể bắt đầu kiểm hồi quy legacy và điều tra ánh xạ. Chuyển cấu hình mới cần chốt đường hỗ trợ, xử lý định dạng cũ/tham chiếu thiếu và dữ liệu Task 1–3. Chưa chốt một đường thì không coi đường đó đã nghiệm thu.

### Hoàn tất khi

Đường chuyển được hỗ trợ giữ đúng quan hệ và quyền, không dùng lại kết quả cá nhân hoặc phá cách dùng ngưỡng cũ.

## Bắt đầu công việc và hoàn tất tích hợp

- **Review phạm vi/thiết kế:** Có thể review theo phân công này. Bộ Q&A đã gửi, gồm Q3, đã có câu trả lời; không mở lại cùng câu hỏi.
- **Có thể làm trước:** Thiết kế ô/trạng thái/DB, dữ liệu cấu hình/đầu ra, phần cố định/tỷ lệ độc lập, dummy data cho phần phụ thuộc nguồn đã chọn. Bắt đầu triển khai theo loại/đường của từng đợt và xác nhận thiết kế cần thiết.
- **Trước khi hoàn tất toàn bộ:** Chốt danh sách đợt, đề xuất UI, độ chính xác lưu và DB, nguồn thật về bản chốt/đơn vị/độ chính xác, đường chuyển cấu hình và kiểm thực thi từng đầu vào cùng ba đầu ra. Tài liệu/source không chứng minh đã xong triển khai, QA hoặc phát hành.

Không bao gồm biểu thức tự do, script/hệ biến tùy ý, xét trực tiếp điểm lựa chọn, phương thức xếp hạng mới, tự chuyển legacy, theo dõi phụ thuộc toàn trường, lặp tổng hợp vô hạn, chặn phát hành vì thiếu kết quả đỏ hoặc version toàn phiếu.
