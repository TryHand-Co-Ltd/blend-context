# Điểm đỏ（赤点） — Tiêu chí nghiệm thu

**Ngày cập nhật:** 30/09/2026.


Tiêu chí nghiệm thu việc thiết lập, xét và hiển thị kết quả điểm đỏ.

`S` là điểm cuối đã lưu; `M` là điểm tối đa hiện hành; `A` là trung bình trước làm tròn của bản tổng hợp; `R` là tỷ lệ nhóm trước làm tròn của cùng bản; `T` là ngưỡng sau xử lý phần lẻ đã chọn. Điều kiện/công thức dùng tổng hợp áp dụng cho đợt triển khai có chọn loại đó.

## Quyền, đối tượng và thiết lập

- [ ] **AC-G01 — Quyền thao tác và phạm vi dữ liệu:** Giáo viên thường được thiết lập nếu có quyền truy cập chức năng và sửa đúng mục; quyền sửa mục không tự cấp quyền chạy hàng loạt. Kiểm quyền trường/năm/mục/lớp/đơn vị khi xem, lưu, xóa, đổi thứ tự, chọn nguồn; đăng ký, trích xuất, công khai và phiếu điểm giữ quyền riêng. Từ chối ID bị sửa trái phép mà không đổi cấu hình, điểm hoặc kết quả.
- [ ] **AC-G02 — Kiểu điểm được hỗ trợ:** Xét mục số nguyên, số thập phân và điểm số theo đơn vị bài học; không xét trực tiếp kiểu lựa chọn A/B/C hoặc đạt/không đạt. Bộ lọc lựa chọn hiện có vẫn dùng được để giới hạn đối tượng của một mục điểm số.
- [ ] **AC-G03 — Nhận diện ô điểm:** Kết quả thuộc đúng học sinh, trường, năm, lớp học phần/môn, mục, kỳ/thời điểm và đơn vị; không trộn mục cùng tên hoặc khác đơn vị. Không gắn kết quả cũ vào ô đã bị xóa rồi tạo lại. Nhập lại cùng điểm hoặc kích hoạt lại bản ghi xóa mềm cũng không được làm kết quả của xử lý cũ sống lại.
- [ ] **AC-G04 — Lưu và mở lại nhiều thiết lập:** Danh sách thể hiện mục/kiểu/thời điểm; khi trống, báo chưa thiết lập và cho thêm, không tự tạo rule từ ngưỡng cũ hay “dưới 30”. Sửa nhiều rule qua Điều kiện áp dụng（適用条件） và Thiết lập ngưỡng（基準設定）; mở lại đúng tên, thứ tự, điều kiện, ngưỡng, dấu, phần lẻ, tóm tắt. Đổi tên giữ liên kết; hủy/lưu lỗi giữ cấu hình và kết quả đã lưu. Rule mới lưu điều kiện còn trong danh sách để mở ngưỡng sửa tiếp nhưng không tham gia xét. Xóa xong thì không còn trong danh sách/bộ xét; tải lại hoặc lưu từ form cũ không làm rule sống lại.
- [ ] **AC-G05 — Đối tượng áp dụng và nhu cầu nguồn:** “Tất cả” vẫn trong phạm vi được phép. Bộ lọc giáo khoa/môn, khối, lớp/nhóm và lựa chọn được hỗ trợ dùng OR trong cùng loại, AND giữa các loại. Các dòng điều kiện trung bình/tỷ lệ nhóm dùng AND kể cả cùng loại, rồi AND với kết quả bộ lọc. Nếu điều kiện hoặc ngưỡng dùng trung bình/tỷ lệ nhóm thì bắt buộc có nguồn, không bỏ điều kiện khi thiếu dữ liệu; nếu cả hai độc lập thì không hiện hoặc bắt nhập nguồn không dùng.

Ví dụ: `A≥50 AND A<70` biểu diễn `50≤A<70`; 40/70 không thỏa, 50/60 thỏa. Hướng dẫn trên màn điều kiện áp dụng cũng phải phân biệt cách kết hợp bộ lọc đối tượng với các điều kiện trung bình/tỷ lệ nhóm.

- [ ] **AC-G06 — Chọn quy tắc khớp đầu tiên:** Chọn quy tắc khớp đầu tiên theo ưu tiên rồi mới tính, không chọn lại ngưỡng nghiêm ngặt hơn. Điều kiện ưu tiên cao có thể áp dụng nhưng chưa xác định được, hoặc quy tắc đã chọn không tính được, đều là chưa xét được và không thử quy tắc thấp hơn. Nếu bộ lọc độc lập đã xác định không áp dụng thì không cần nguồn tổng hợp của quy tắc đó. Không kết hợp nhiều rule bằng AND.

## Ngưỡng, điểm tối đa và độ chính xác

- [ ] **AC-G07 — Biên so sánh và cảnh báo:** Nhỏ hơn（未満） không bao gồm `S=T`; Nhỏ hơn hoặc bằng（以下） bao gồm giá trị này, không làm tròn `S` để xét. Khi đủ thông tin, cảnh báo ngưỡng 0/điểm tối đa cũng theo `T` cuối và dấu so sánh, không đổi giá trị hoặc hiểu `A−0` là ngưỡng 0.
- [ ] **AC-G08 — Điểm cố định:** Khi lưu hoặc mở rộng đối tượng, kiểm `0≤N≤M` cho mọi đối tượng; không hợp lệ thì từ chối, không thay nguồn hoặc tự sửa giá trị. Ngưỡng đã lưu hợp lệ vẫn là `T=N` khi điểm tối đa thay đổi sau đó; nếu điều kiện cũng độc lập thì không cần trung bình hay điểm tối đa dương để tính.
- [ ] **AC-G09 — Điểm tối đa hiện hành:** Phân giải theo mức chuẩn → ngoại lệ đơn vị có hiệu lực → lựa chọn lớp thực sự áp dụng; không có ngoại lệ đơn vị thì dùng mức chuẩn phù hợp. Không thay bằng định nghĩa/mã lựa chọn, điểm cao nhất thực tế, tổng điểm tối đa nhóm, mặc định 100 hoặc mức của bản tổng hợp đã chốt.
- [ ] **AC-G10 — Tỷ lệ điểm tối đa:** Nhận tỷ lệ 0–100, tính `M×N/100` rồi chỉ xử lý phần lẻ đã chọn; mặc định không xử lý. Khi chạy, `M` bằng 0, âm, không hữu hạn hoặc không xác định được thì chưa xét được, không dùng giá trị thay thế để tạo kết luận.
- [ ] **AC-G11 — Giữ chính xác giá trị:** Lưu/mở lại không cắt bớt giá trị nằm trong giới hạn đã công bố và phải so đúng `S=T`. Từ chối đầu vào không phải số, vô hạn hoặc vượt miền; tràn số khi chạy không được biến thành đỏ/không đỏ.

Các ví dụ biên dưới đây thuộc những quy tắc trên, không tách thành AC riêng.

| Quy tắc | Điều kiện → Kết quả |
| --- | --- |
| Ưu tiên | Cả hai cùng áp dụng: ưu tiên 1 `<20`, ưu tiên 2 `<30`, `S=25` → không đỏ |
| Ghi đè điểm tối đa | Chuẩn 100, đơn vị 40, lựa chọn lớp 50 → dùng 50; không có lựa chọn lớp → dùng 40 |
| Phần lẻ của tỷ lệ | `M=75`, 30%, `S=22.2`, dấu nhỏ hơn → đỏ với ngưỡng 22.5 không xử lý; không đỏ nếu chủ động làm tròn xuống số nguyên 22 |
| Điểm tối đa hiện hành | Hiện tại 50, lúc tổng hợp 100, 30%, `S=20`, dấu nhỏ hơn → `T=15`, không đỏ |
| Biên 0/điểm tối đa | Với điểm không âm, `T=0` và nhỏ hơn không chọn ai; nhỏ hơn hoặc bằng chọn điểm 0. `T=M` và nhỏ hơn không chọn điểm tối đa; nhỏ hơn hoặc bằng có chọn |

## Nguồn tổng hợp và công thức

- [ ] **AC-G12 — Đúng phạm vi tham chiếu:** Khớp Thời kỳ tổng hợp（集計対象時期）, Thiết lập tổng hợp thứ hạng（順位集計設定）, Nhóm học sinh được tổng hợp（集計対象（母集団）） và môn/mục/đơn vị; bộ lọc trích xuất không đổi nhóm tham chiếu. Điều kiện và công thức dùng nguồn đã lưu của từng phần, sửa phần này không đổi phần kia, và một lượt không trộn các thời điểm của cùng nguồn.
- [ ] **AC-G13 — Ưu tiên bản chốt và xử lý thiếu nguồn:** Ưu tiên bản chốt có hiệu lực đúng phạm vi; chỉ khi không có mới dùng bản tổng hợp hoàn tất mới nhất. Bản đã chọn thiếu dữ liệu hoặc không có bản phù hợp thì chưa xét được; không thay bằng kỳ/nhóm/bản thường khác, điểm chưa tổng hợp hay 0, cũng không thêm tùy chọn bỏ qua bản chốt. Áp dụng cùng cách xử lý thiếu/không hợp lệ khi loại tổng hợp được bật nhưng chưa có kết quả, hoặc tham chiếu đã lưu trở nên không khả dụng trước lần xét lại.

Các quy tắc chọn/đọc nhóm thuộc AC-G12/G13:

| Điều kiện | Hành vi mong đợi |
| --- | --- |
| Cấu hình tổng hợp khối/HR/lớp học | Chỉ cho chọn loại được bật trong thiết lập trường/năm hiện hữu. Server từ chối lưu lựa chọn không khả dụng; không có công tắc tổng hợp riêng phía điểm đỏ |
| Nhóm tổng hợp/tổ hợp/nhóm môn đã cấu hình | Có cấu hình đúng trường/năm thì chọn bằng tên đã đặt và lưu ID của cấu hình được chọn; dù cả ba cờ khối/HR/lớp học tắt vẫn không bị loại chỉ vì các cờ đó. Thiếu kết quả tổng hợp thì chưa xét được, không suy chọn được là đã có dữ liệu |
| Chọn nguồn ở điều kiện/công thức | Theo mẫu Công khai thành tích（成績公開設定）, chọn cấu hình tổng hợp rồi đối tượng tổng hợp; mở lại đúng nguồn độc lập của từng phần. Không bắt thiết lập thêm thứ hạng, tên hiển thị hoặc biểu đồ |
| Bật thêm tổng hợp lớp trong cùng cấu hình X | Cho chọn kết quả theo lớp của X, không yêu cầu tạo cấu hình tổng hợp khác và không đọc kết quả lớp khác với ô đang xét |
| Chọn nhóm môn học | Dùng cấu hình riêng của môn hoặc default đã lưu để phân giải nhóm. Không thay default thiếu/tham chiếu sai bằng nhóm khác hay 0 |
| Copy/kế thừa năm của cấu hình nguồn | Ánh xạ đúng mục, môn và nhóm; lớp theo ô đích, nhóm môn giữ đủ cấu hình phụ thuộc |

- [ ] **AC-G14 — Giá trị thô từ cùng tập dữ liệu:** Chọn nhánh bằng giá trị trước làm tròn; trung bình dùng số người có điểm cùng bản, không phải số người xếp hạng; tử/mẫu tỷ lệ dùng cùng tập đóng góp. Trung bình 49.99 thuộc `<50` dù hiển thị 50; phần lẻ không đổi nhánh; số người 0, tổng maximum sai hoặc tập đóng góp không xác định thì chưa xét được.
- [ ] **AC-G15 — Kế thừa tỷ lệ nhóm:** Dùng tổng điểm/tổng điểm tối đa của tổng hợp thứ hạng hiện có, không tính lại bằng trung bình tỷ lệ cá nhân hay điểm tối đa của học sinh đang xét. Khác điểm tối đa không cần cách tính riêng, không bị chặn cấu hình hoặc làm dừng xử lý chỉ vì khác biệt đó; dữ liệu sai vẫn phải được xử lý là sai.
- [ ] **AC-G16 — Công thức theo dòng và phần lẻ:** Công thức được chọn triển khai gồm các dòng dùng bốn phép toán, không có biểu thức tự do, script hoặc hàm tùy ý. Tham chiếu dòng trước nhận giá trị sau phần lẻ, dòng cuối tạo `T`; không dùng số hiển thị rút gọn, ghi/xóa điểm hoặc ép ngưỡng theo min/max của điểm. Form sửa, danh sách và giải thích của cùng rule đã lưu phải khớp vị trí xử lý phần lẻ từng dòng và kết quả.
- [ ] **AC-G17 — Kiểm công thức khi lưu:** Cần ít nhất một dòng đầy đủ; từ chối toán hạng thiếu, mẫu số cố định bằng 0, tham chiếu chính dòng/dòng sau/dòng đã xóa. Xóa hoặc đổi thứ tự dòng không được âm thầm trỏ sang công thức khác chỉ vì nó mang cùng số thứ tự.
- [ ] **AC-G18 — Ngưỡng âm:** `T` âm, hữu hạn và tính đúng vẫn hợp lệ, được so sánh bình thường, không ép về 0. Với `T=−5`, điểm không âm không đỏ; nếu mục cho điểm âm thì −6 đỏ với dấu nhỏ hơn, −5 chỉ đỏ với dấu nhỏ hơn hoặc bằng.

Nhóm có 60/100 và 80/100 cho 70%, khớp điều kiện từ 65% trở lên. Cùng rule trong 01-B/03-C: `A=49.7`, dòng 1 `A÷2` làm tròn xuống số nguyên, dòng 2 nhân 0.8 không xử lý, nên `T=19.2`; `S=19.1` xét nhỏ hơn thì đỏ. Cấu hình khác chỉ làm tròn xuống dòng 2 cho `T=19` và không đỏ; cả hai dòng không xử lý cho 19.88. Không trộn chúng thành trước/sau lưu của cùng cấu hình; tên nhóm tham chiếu trong danh sách không chồng lên cột phép toán.

## Điểm được xét và cập nhật kết quả

Chỉ kết quả đỏ còn hiệu lực mới đóng góp dấu/lọc đỏ; chưa có kết quả không có nghĩa là đỏ hoặc đã xét đạt.

- [ ] **AC-G19 — Dùng điểm cuối cùng:** Dùng giá trị đã lưu sau tính toán, giới hạn điểm và cập nhật liên quan; xét cả điểm sửa tay, Điểm dự kiến（見込点）, Chưa dự thi（未受験） có số và 0 hợp lệ, không phụ thuộc AutoRating hay đối tượng xếp hạng. Giữ trạng thái dự kiến riêng với đỏ; không đổi trống/NULL/đã xóa/không dùng thành 0, ngừng dấu/lọc của điểm đã mất và giữ cách hiển thị ô trống hiện có. Ngay khi lưu xóa điểm thành công, ô trống và dấu/lọc đỏ cũ của ô ngừng hiệu lực, không chờ chạy lại. Lưu lỗi không được coi là đã xóa xong.
- [ ] **AC-G20 — Trạng thái sau lần chạy:** Phân biệt đỏ, không đỏ, chưa từng xét, chưa xét được, không áp dụng và không có điểm; chưa xét/chưa xét được không phải đã đạt. Giữ nguyên điểm và ngừng dùng kết quả cũ theo bảng dưới sau khi lưu thành công trạng thái của lần chạy.

| Kết quả lần chạy | Kết quả hiện hành và xử lý tiếp |
| --- | --- |
| Đủ dữ liệu xác định mọi quy tắc đều không áp dụng | Không áp dụng; ngừng dấu/lọc cũ, không coi là đạt một ngưỡng |
| Thiếu nguồn/toán hạng, chia 0, số không hữu hạn hoặc không tạo được ngưỡng | Chưa xét được; không dùng kết quả cũ làm hiện hành, không thay bằng quy tắc thấp hơn, nguồn khác, 0 hoặc ngưỡng đỏ cũ |
| Đã khắc phục nhưng mới lưu cấu hình/nguồn | Chưa có kết luận mới; chạy lại thành công mới cập nhật đỏ/không đỏ |

- [ ] **AC-G21 — Giữ kết quả trước khi chạy lại và xóa rule cuối:** Chỉ đổi ngưỡng/dấu/công thức/ưu tiên/đối tượng/nguồn/bản tổng hợp hoặc xóa rule cuối thì vẫn giữ kết quả, cấu hình hiển thị và hiệu ứng trước đó. Thông báo phân biệt lưu với xét và hướng dẫn chạy lại; lần đăng ký/batch tiếp theo xác định hết rule mới chuyển không áp dụng. Màn công khai cũng không bỏ dấu ngay chỉ vì số rule bằng 0.
- [ ] **AC-G22 — Kết quả chung và thứ tự cập nhật:** Ba đầu ra đọc cùng kết quả có hiệu lực của ô; chạy lại cùng điều kiện cho cùng kết quả, không nhân đôi bản ghi hoặc ký hiệu. Lượt cũ hoàn tất muộn không ghi đè kết quả của điểm/cấu hình mới hơn, không ghép điểm và kết quả khác thời điểm rồi báo thành công.

Ví dụ thứ tự cập nhật thuộc AC-G03/G22:

| Cạnh tranh | Kết quả mong đợi |
| --- | --- |
| Batch đọc 29 → giáo viên lưu 40/không đỏ → batch hoàn tất muộn | Giữ 40/không đỏ |
| 29→40→29, hoặc xóa trống rồi nhập lại cùng giá trị | Lượt đọc điểm 29 cũ không được thay kết quả mới |
| Hai lượt xét lần đầu đồng thời, hoặc gửi lại cùng thao tác hoàn tất | Chỉ một kết quả hiện hành, không nhân đôi dấu hoặc thao tác ghi |
| Đăng ký lần đầu đồng thời hai mục khác nhau của cùng học sinh/lớp/thời điểm/đơn vị | Giữ cả hai mục trên một dòng điểm vật lý, không tạo dòng trùng hoặc mất điểm/kết quả của một mục |
| Sửa rule nhưng chưa chạy xét lại | Giữ kết quả đã hoàn tất trước đó, đồng thời không cho lượt bắt đầu trước thay đổi ghi đè sai |

Ví dụ: phép tính trung gian 120 nhưng lưu 100 thì xét 100; sửa tay 28→35 thì xét 35. Điểm 32 đang không đỏ với `<30` vẫn giữ kết quả khi chỉ lưu `<35`, sau xét thành công mới đỏ.

## Đăng ký, chạy hàng loạt và lỗi

- [ ] **AC-G23 — Bao phủ đường đăng ký và chạy lại:** Nhập trực tiếp, CSV, liên kết điểm thi và batch được hỗ trợ phải xét đúng lớp/thời điểm/học sinh được phép cùng ô liên quan thực sự bị cập nhật. Không bỏ sót vì thiếu AutoRating, bỏ tính điểm sửa tay, bỏ tính sau liên kết, chỉ có rule đỏ hoặc vừa xóa rule cuối; không mở thành xét lại toàn trường không liên quan.

| Điều kiện chạy thuộc AC-G23 | Kết quả bắt buộc |
| --- | --- |
| Cách thực thi | Không có chế độ xét đỏ thủ công/tự động riêng; chạy theo đăng ký điểm và tính hàng loạt hiện có |
| Cùng lượt có ô phụ thuộc nguồn và ô độc lập | Ô thiếu nguồn thì chưa xét được, nhưng ô khác xét độc lập được, chẳng hạn dùng ngưỡng cố định, vẫn được xử lý. Không có nghĩa thử rule thấp hơn trên cùng ô |

- [ ] **AC-G24 — Trigger khi đổi điểm tối đa/đơn vị:** Lưu định nghĩa hoặc mức tối đa ô nhập không tự xét toàn bộ; đăng ký lớp và thiết lập tối đa hàng loạt được bật, đủ quyền chỉ cập nhật kết quả sau khi đường tính hiện có thành công. Xóa/không dùng điểm đơn vị phải ngừng kết quả cũ; bộ tính hỗ trợ đơn vị không chứng minh mọi màn cấu hình đều có chọn đơn vị.
- [ ] **AC-G25 — Thứ tự đánh giá tương đối:** Đặt tự tổng hợp thứ hạng thành Không thực hiện（実行しない）, hoàn tất đầu vào → Thực hiện tổng hợp（集計実行） xong → Thực hiện tính toán tự động（自動算出実行） xong. Vẫn xét lúc đăng ký và ưu tiên bản chốt; không thêm vòng lặp đến hội tụ dù bước tính làm đổi điểm nguồn.
- [ ] **AC-G26 — Lưu thành công và thông báo an toàn:** Điểm và kết quả phải nhất quán tại ranh giới giao dịch hiện có của nhập trực tiếp/CSV/liên kết; lưu lỗi không được báo xét thành công hoặc kết quả cũ đã hết hiệu lực. Phân biệt đã lưu, chưa cập nhật, chưa xét được, thất bại để hướng dẫn xử lý; không lộ lỗi nội bộ/dữ liệu ngoài quyền hoặc thực thi tên/ký hiệu như mã.
- [ ] **AC-G27 — Batch hoàn tất một phần:** Phân biệt phạm vi đã cập nhật, chưa xét được và lỗi kỹ thuật; vào hàng đợi hoặc bộ đếm lớp không chứng minh mọi ô thành công. Không nói đã hoàn tác toàn bộ khi thực tế mới hoàn tất một phần; cho khắc phục và chạy lại phạm vi lỗi. Lượt cũ đã bị xử lý mới thay thế không được tính là cập nhật thành công hay chưa xét được về nghiệp vụ; giữ kết quả mới.
- [ ] **AC-G28 — Xem/xuất không tự xét:** Không chặn trích xuất, công khai hoặc phiếu chỉ vì chưa xét, chưa xét được hay đang chờ chạy lại; giữ quyền, lịch và ẩn điểm của từng chức năng. Xem, xuất Excel, công khai, in lại không kích hoạt tổng hợp hoặc xét.

## Ba đầu ra

- [ ] **AC-G29 — Lọc khi trích xuất:** Chỉ khi bật lọc, giữ học sinh có ít nhất một ô đỏ còn hiệu lực trong môn/mục/thời điểm/đơn vị được chọn. Ô đỏ ngoài phạm vi không giúp thỏa điều kiện; 0 kết quả là hợp lệ và các bộ lọc khác giữ nguyên nghĩa.
- [ ] **AC-G30 — Hiển thị ô trích xuất:** Chỉ áp ký hiệu trước/sau và màu trong palette hiện hữu cho ô đỏ; bật ký hiệu phải nhập giá trị và được bật cả hai. Chỉ trang trí không lọc học sinh, không lộ điểm ẩn, không giữ hiệu ứng cũ ở ô mất hiệu lực/trống hoặc ép màu mẫu cho mọi template (24 với trước `※`, sau `!` → `※24!`).
- [ ] **AC-G31 — Excel khớp và dùng kết luận server:** Cùng một lần xuất, màn hình và Excel thật phải khớp đối tượng, ký hiệu, màu, ô trống và giá trị. Sửa cờ đỏ/ngưỡng trong dữ liệu gửi lên không làm đổi kết luận của server hoặc phạm vi được phép.
- [ ] **AC-G32 — Cấu hình công khai và ẩn điểm:** Lưu/mở lại ngoặc, dấu `*` cố định trước/sau cho mục được thiết lập trong phạm vi điểm thường/đơn vị; không thêm ký tự tự do, lọc học sinh đỏ hoặc nền riêng. Không lộ điểm/trạng thái ẩn qua ký hiệu; khi đỏ hết hiệu lực vẫn giữ hiệu ứng dự kiến và nền/định dạng khác còn hiệu lực. Cùng mục có thể lưu/mở lại/copy độc lập cấu hình X dùng ngoặc, Y dùng `*` trước, không trộn thường/đơn vị và không copy kết quả cá nhân. Lỗi lưu giữ cấu hình cũ. Bộ chọn cách hiển thị ở cả điểm thường/đơn vị đều nhìn thấy và thao tác được; sửa lựa chọn bên này không đổi bên kia.
- [ ] **AC-G33 — Kết hợp hiệu ứng công khai:** Hiệu ứng dự kiến và đỏ khác nhau được kết hợp, trùng nhau chỉ áp một lần. Ngoặc + `*` trước thành `(*24)`; hai `*` trước thành `*24`; hai ngoặc thành `(24)`; `*` trước và sau thành `*24*`.
- [ ] **AC-G34 — Đúng người, lịch và đầu ra công khai:** Học sinh/phụ huynh chỉ xem dữ liệu đúng quan hệ sở hữu, trường, năm và lịch công khai được phép. Web phía học sinh, API liên quan và PDF công khai phải khớp trạng thái, cách hiển thị và ẩn của cùng ô.
- [ ] **AC-G35 — Tùy chọn trên phiếu:** Điều kiện đỏ có Nguyên trạng（そのまま表示）, Kèm ngoặc（カッコ付き）, ký tự trước hoặc sau; chỉ trước/sau mới bắt buộc ký tự. Không thêm ẩn, gạch chéo hoặc nền riêng cho đỏ; giữ những khả năng đó ở điều kiện có sẵn.
- [ ] **AC-G36 — Phiếu dừng ở điều kiện khớp đầu tiên:** Sau kiểm soát ẩn/thời điểm hiện có, xét môn cụ thể → ô chọn theo thứ tự → đỏ → ô trống → bình thường, dừng ngay khi khớp. Nguyên trạng cũng dừng, không tìm tiếp lệnh ẩn phía sau; dự kiến phía trên chọn ngoặc thì `(24)`, nguyên trạng thì `24`, không thêm `※` của đỏ hoặc bỏ ẩn/gạch chéo.
- [ ] **AC-G37 — Lưu, sao chép và PDF phiếu:** Hoàn tất hộp thoại rồi bấm Cập nhật（更新する） ở bảng để giữ lựa chọn/ký tự khi mở lại hoặc sao chép template, kể cả chỉ dùng đỏ; không sao chép kết quả cá nhân. PDF thật sau lưu/mở lại và đổi trạng thái phải đúng môn/thời điểm/đơn vị, thứ tự điều kiện; không còn dấu cũ trên ô trống, mất/tràn ký hiệu hay đổi cấu trúc; không thêm đóng băng/quản lý phiên bản toàn phiếu.

## Chức năng cũ, chuyển cấu hình và phạm vi triển khai

- [ ] **AC-G38 — Bảo toàn điểm đỏ cũ:** Không chuyển ngưỡng cũ thành rule mới, đổi nghĩa/reset hoặc dùng thay khi rule mới không có, không khớp hay thiếu dữ liệu. Giữ cách dùng giá trị cũ trong báo cáo riêng trường, sao chép, kế thừa năm, xuất/nhập, khôi phục và đồng bộ.
- [ ] **AC-G39 — Không dùng lại kết quả cho đối tượng mới:** Đồng bộ cấu hình không đồng nghĩa đã xét; khôi phục/thay khung không gắn kết quả ô đã mất vào ô mới. Các đường chuyển cấu hình được hỗ trợ cũng không dùng bản chốt năm cũ hoặc kết quả cá nhân làm kết quả của đối tượng mới.
- [ ] **AC-G40 — Phạm vi từng đợt:** Ghi rõ loại ngưỡng, điều kiện/công thức, trường/quyền, đường đăng ký và chuyển cấu hình; không hiển thị phần chưa hỗ trợ như đang hoạt động. Phần được chọn phải hoàn chỉnh từ cấu hình → xét → lưu → ba đầu ra; các xử lý dùng tổng hợp phải được kiểm với dữ liệu tổng hợp thực tế.

## Chi tiết thiết kế

Các phương án thiết kế đề xuất dưới đây bổ sung cho tiêu chí nghiệm thu, áp dụng theo phạm vi chức năng của từng đợt triển khai.

| Nội dung | Phương án thiết kế |
| --- | --- |
| Thêm và đổi loại | Thêm cuối danh sách, cố định, dấu nhỏ hơn, chưa nhập giá trị. Rule chưa đủ không có hiệu lực; giới hạn đối tượng nhưng bộ lọc rỗng thì báo lỗi. Giữ tạm input theo loại trong phiên sửa, mở lại loại đã lưu; không tạo lịch sử mọi loại |
| Điều kiện/công thức | Phân nhánh bằng `<`/`≤`/`≥`/`>`; toán hạng là trung bình, số/hệ số, kết quả dòng trước; một nguồn trung bình trong công thức. Danh sách công thức và toán hạng theo phạm vi triển khai của từng đợt |
| UI phần lẻ | Công thức cũng mặc định không xử lý; vị trí `p=1..9`, bật lần đầu là 1, giữ lại `p−1` chữ số (p=1 còn số nguyên; ô nhập ở Figma 03-C hiển thị Chữ số thập phân thứ p（小数第［p］位） kèm chú thích Vị trí 1 cho kết quả số nguyên（位置1は整数）). Phải chọn phương thức; gần nhất đưa điểm giữa ra xa 0, lên/xuống theo ceil/floor (−5.2→lên −5/xuống −6; −5.5→gần nhất −6) |
| Mặc định và thông báo | Lọc/hiệu ứng trích xuất mới OFF, công khai chưa chọn hiệu ứng, phiếu để nguyên trạng. Thông báo nêu rõ việc cần chạy lại, lý do thiếu dữ liệu và phần chưa cập nhật khi có lỗi |
| Giới hạn nhập | Độ chính xác, số chữ số, độ dài tên, miền hệ số và số dòng do thiết kế kỹ thuật xác định; giữ AC-G11 về biên so sánh, số hữu hạn và không âm thầm cắt giá trị |
| Chuyển cấu hình | Ánh xạ mục/thời điểm/môn/nhóm/đơn vị/dòng công thức trong phạm vi triển khai. Đề xuất không kích hoạt và thông báo khi không ánh xạ được; xử lý tệp cũ thiếu phần mới và phạm vi cập nhật/hoàn tác theo từng đường được hỗ trợ. Không tạo từ legacy hoặc âm thầm xóa rule hiện hành |
