# 08 — Đặc tả dữ liệu test

Dữ liệu dùng chung cho mọi test case. Giá trị số trong các case tính toán được ghi trực tiếp trong case ([04](04-calculation-test-cases.vi.md) «Test case tính toán (CALC)»); file này định nghĩa môi trường, vai trò, mục đánh giá, học sinh, nguồn tổng hợp, quy tắc và cấu hình đầu ra được tham chiếu bằng Data ID.

- **Không có mật khẩu, token hay khóa trong file này.** Tài khoản cho từng vai trò được cấp qua kênh được team duyệt (secret/biến môi trường).
- Tên trường/lớp/học sinh là tên giả để dựng dữ liệu; không dùng dữ liệu học sinh thật.
- Kỳ dùng xuyên suốt: Cuối kỳ học kỳ 1（1学期期末）, năm học 2026.
- "Loại" (Type): `env` môi trường, `role` vai trò, `master` dữ liệu gốc, `score` điểm, `source` nguồn tổng hợp, `rule` quy tắc đỏ, `output` cấu hình đầu ra.

## 1. Môi trường

| Data ID | Field | Value | Type | Purpose | Expected |
| --- | --- | --- | --- | --- | --- |
| TD-ENV-01 | Môi trường chạy | Local Docker (`docker-codeigniter`, `docker-mysql`) có build tính năng; hoặc staging được team cho phép ghi | env | Chạy toàn bộ case | Có quyền tạo/xóa dữ liệu test và reset |
| TD-ENV-01 | Trường test | Trường A (tên giả "Trường THPT Test A"), `school_id` do môi trường cấp | env | Phạm vi trường | Mọi dữ liệu test thuộc trường này |
| TD-ENV-01 | Năm học | 2026 | env | Phạm vi năm | Mọi dữ liệu test thuộc năm này |
| TD-ENV-02 | Trường khác | Trường B (tên giả), có ít nhất một mục đánh giá và một quy tắc đỏ | env | Kiểm tra giả mạo ID khác trường | Người dùng trường A không đọc/sửa được |
| TD-ENV-03 | Truy cập DB | Kết nối MySQL local, chỉ dùng SELECT / SHOW FULL COLUMNS để lấy bằng chứng | env | Bằng chứng dữ liệu | Không cần thông tin kết nối trong tài liệu |
| TD-ENV-04 | Nguồn snapshot | Dummy data cho bản tổng hợp đã chốt (R18 «đặc tả RC-001 v2» §5.5 «Chọn bản nguồn») cho tới khi [PR #57058](https://github.com/ednity/school-web/pull/57058) «PR thêm trạng thái xác nhận kết quả tổng hợp xếp hạng, còn mở» được tích hợp | env | Case nguồn trung bình | Bằng chứng ghi rõ "dummy data" |
| TD-ENV-05 | Đường dẫn màn (RSD-TASK «bản chia công việc v2») | Thiết lập nhập điểm（成績入力設定） `/admin/grade_report_setting/manage`; Tổng hợp thành tích（成績集計） `/admin/grade/grade_setting_system/grade_calc`; Đăng ký thành tích（成績登録） `/admin/nb/grade/grade_setting_system/lesson_group/regist/(:num)`; Đăng ký thành tích bằng CSV（成績CSV登録） `/admin/nb/grade/grade_setting_system/lesson_group_csv/regist/(:num)`; Thiết lập điểm tối đa hàng loạt（満点一括設定） `/admin/grade/lesson_group/setting?setting_type=change_max_score`; Trích xuất thành tích（成績抽出） `/admin/nb/grade/grade_setting_system/grade_extraction`; Thiết lập công khai thành tích（成績公開設定） `/admin/grade_report_setting/grade_publish`; Xác nhận thành tích（成績確認） `/student/grade/grade_publish`; Công cụ phiếu điểm（通知表ツール） `/admin/grade_report_setting/report_card` | env | Điều hướng khi chạy case | URL màn đỏ mới và màn liên kết điểm thi chưa chốt/chưa xác minh |

<a id="roles"></a>

## 2. Vai trò

| Data ID | Field | Value | Type | Purpose | Expected |
| --- | --- | --- | --- | --- | --- |
| TD-ROLE-01 | Giáo viên có quyền sửa mục | Có quyền vào Thiết lập nhập điểm（成績入力設定） và quyền sửa TD-ITEM-01…03 «mục đánh giá: Mục số nguyên: Điểm đánh… … Mục điểm đơn vị: Điểm bài kiểm tra…» | role | Cấu hình quy tắc | Xem/thêm/sửa/xóa/đổi thứ tự được |
| TD-ROLE-02 | Giáo viên không có quyền sửa mục | Vào được Thiết lập nhập điểm（成績入力設定） nhưng mục TD-ITEM-06 «Mục chỉ nội bộ: Mục số có cờ chỉ dành nội bộ（`mw_only_flg`）» là mục chỉ dành nội bộ（`mw_only_flg`） | role | Kiểm quyền mục | Không sửa được quy tắc của TD-ITEM-06 «Mục chỉ nội bộ: Mục số có cờ chỉ dành nội bộ（`mw_only_flg`）» |
| TD-ROLE-03 | Người có quyền chạy hàng loạt | Có quyền thực hiện Thực hiện tổng hợp（集計実行） và Thực hiện tính toán tự động（自動算出実行） theo cấu hình hiện hành | role | Chạy lại | Nút chạy dùng được |
| TD-ROLE-04 | Người sửa được mục nhưng không có quyền chạy | Như TD-ROLE-01 «Giáo viên có quyền sửa mục: Có quyền vào Thiết lập nhập điểm（成績入力設定） và…» nhưng không có quyền chạy hàng loạt | role | QAC «Q&A nghiệp vụ đã xác nhận» Q1 «Ai được thiết lập điều kiện điểm đỏ?» | Không chạy được hàng loạt |
| TD-ROLE-05 | Học sinh | Học sinh S01 của trường A, có lịch công khai đang mở | role | Xác nhận thành tích（成績確認） | Chỉ xem dữ liệu của chính mình |
| TD-ROLE-06 | Người dùng trường B | Giáo viên/quản trị của trường B | role | Giả mạo ID | Bị từ chối với dữ liệu trường A |
| TD-ROLE-07 | Người phụ trách đầu ra | Có quyền Trích xuất thành tích（成績抽出）, Thiết lập công khai thành tích（成績公開設定）, Công cụ phiếu điểm（通知表ツール） | role | Ba đầu ra | Mở và lưu được cấu hình đầu ra |
| TD-ROLE-08 | Phụ huynh | Phụ huynh có quan hệ với S01 ở trường A, lịch công khai đang mở (R18 «đặc tả RC-001 v2» §1.3 «Quyền sử dụng»; AC-G34 «Đúng người, lịch và đầu ra công khai») | role | Xác nhận thành tích（成績確認） phía phụ huynh | Chỉ xem dữ liệu của S01 |
| TD-ROLE-09 | Giáo viên nhập điểm | Giáo viên phụ trách lớp G-A, G-B, G-C: có quyền Đăng ký thành tích（成績登録）, Đăng ký thành tích bằng CSV（成績CSV登録） và Trích xuất thành tích（成績抽出） của các lớp này | role | Đăng ký điểm, quan sát kết quả xét | Lưu điểm và xem trích xuất được |

## 3. Mục đánh giá và điểm tối đa

| Data ID | Field | Value | Type | Purpose | Expected |
| --- | --- | --- | --- | --- | --- |
| TD-ITEM-01 | Mục số nguyên | Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định 100, môn Toán（数学） | master | Case chính | Có hàng Thiết lập điểm đỏ（赤点設定） |
| TD-ITEM-02 | Mục số thập phân | Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc định 100 | master | Điểm và ngưỡng thập phân | Có hàng Thiết lập điểm đỏ（赤点設定） |
| TD-ITEM-03 | Mục điểm đơn vị | Điểm bài kiểm tra đơn vị（単元テスト点）, M mặc định 100; đơn vị U1 có M riêng 40; đơn vị U2 không có ngoại lệ; lựa chọn lớp（満点設定） ghi đè 50 áp dụng cho lớp G-A | master | Phân giải M, ô theo đơn vị | M(G-A,U1)=50; M(G-B,U1)=40; M(G-B,U2)=100 |
| TD-ITEM-04 | Mục lựa chọn | Kiểu lựa chọn（選択肢型） A/B/C | master | Loại khỏi phạm vi | Không có thao tác tạo quy tắc có hiệu lực |
| TD-ITEM-05 | Mục đạt/không đạt | Đạt/không đạt（合否） | master | Loại khỏi phạm vi | Như TD-ITEM-04 «Mục lựa chọn: Kiểu lựa chọn（選択肢型） A/B/C» |
| TD-ITEM-06 | Mục chỉ nội bộ | Mục số có cờ chỉ dành nội bộ（`mw_only_flg`） | master | Kiểm quyền | Chỉ người có quyền nội bộ sửa được |
| TD-ITEM-07 | Mục khác M theo lớp | Mục số M mặc định 100; lớp G-A dùng lựa chọn lớp M=20; lớp G-B M=100 | master | Kiểm `0≤N≤M` của mọi đối tượng | N=30 không lưu được khi phạm vi gồm G-A |
| TD-ITEM-08 | M không hợp lệ | Mục số có M hiệu lực = 0 (nếu cấu hình được) hoặc không phân giải được M | master | Tỷ lệ với M không hợp lệ | Cách tạo dữ liệu: hỏi team dev khi chuẩn bị |
| TD-ITEM-09 | Mục cho phép điểm âm | Mục số có miền điểm cho phép số âm (nếu cấu hình được) | master | Ngưỡng âm | Cách tạo dữ liệu: hỏi team dev khi chuẩn bị |
| TD-ITEM-10 | Mục có tính tự động | TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» có thêm quy tắc tính tự động（自動計算設定） đang hoạt động | master | Hồi quy AutoRating | Điểm tự động giữ như trước |

## 4. Lớp, học sinh và điểm

| Data ID | Field | Value | Type | Purpose | Expected |
| --- | --- | --- | --- | --- | --- |
| TD-GRP-01 | Lớp học phần | G-A (Toán I（数学Ⅰ）, khối 1, nhóm thành tích Nâng cao), G-B (Toán I（数学Ⅰ）, khối 2), G-C (Ngữ văn logic（論理国語）, khối 1) | master | Bộ lọc, nhóm tham chiếu | Mỗi lớp có ≥ 2 học sinh |
| TD-GRP-02 | Lớp chủ nhiệm | HR1 (S01–S05), HR2 (S06–S10) | master | Nhóm tham chiếu ホームルーム (lớp chủ nhiệm; file Figma cũ ghi HR毎) | — |
| TD-STU-01 | S01 | G-A, HR1; TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» = 29 | score | Đỏ với `<30` | Đỏ |
| TD-STU-02 | S02 | G-A, HR1; TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» = 30 | score | Biên `S=T` | `<` không đỏ; `≤` đỏ |
| TD-STU-03 | S03 | G-A, HR1; TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» = 31 | score | Biên +1 | Không đỏ |
| TD-STU-04 | S04 | G-A, HR1; TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» = 0 | score | Điểm 0 hợp lệ | Xét như số 0 |
| TD-STU-05 | S05 | G-A, HR1; TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» = ô trống | score | Không có điểm | Không coi là 0 |
| TD-STU-06 | S06 | G-B, HR2; TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» = 24, là Điểm dự kiến（見込点） | score | Kết hợp dự kiến + đỏ | Đỏ; hiển thị theo đầu ra |
| TD-STU-07 | S07 | G-B, HR2; TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» = 35, cờ Chưa dự thi（未受験） | score | Cờ chưa dự thi không loại khỏi xét | Được xét |
| TD-STU-08 | S08 | G-B, HR2; TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» nhập tay 28 rồi sửa tay 35 | score | Điểm sửa tay | Xét 35 |
| TD-STU-09 | S09 | G-B, HR2; TD-ITEM-02 «Mục số thập phân: Điểm đánh giá（評点）, Nhập số thập phân（数値入力（小数））, M mặc…» = 29.5 | score | Điểm thập phân | Đỏ với `<30` |
| TD-STU-10 | S10 | HR2; lớp G-C Ngữ văn logic（論理国語）= 70; lớp G-B Toán I（数学Ⅰ）= 24 (cùng mục Điểm đánh giá（評点）, cùng quy tắc `<30`) | score | Trích xuất theo phạm vi môn | Chỉ ô Toán đỏ |

## 5. Nguồn tổng hợp (trung bình/tỷ lệ nhóm)

Nguồn = Thời kỳ tổng hợp（集計対象時期）+ Thiết lập tổng hợp thứ hạng（順位集計設定）+ Nhóm học sinh được tổng hợp — 集計対象（母集団）. Mặc định dùng 1学期期末 (cuối kỳ học kỳ 1) / 評点集計 (tổng hợp điểm đánh giá) / ホームルーム (lớp chủ nhiệm) như Figma MW 58:9137 «Figma MW: màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình» (file cũ 4595:381 «Figma: màn Điều kiện áp dụng – đối tượng, bộ lọc, điều kiện trung bình — MW 58:8930» ghi HR毎).

| Data ID | Field | Value | Type | Purpose | Expected |
| --- | --- | --- | --- | --- | --- |
| TD-SRC-01 | Bản đã chốt | Snapshot của nguồn mặc định, `A` thô = 49.99 (màn tổng hợp hiển thị 50.0) | source | Ưu tiên bản chốt, A trước làm tròn | Dùng 49.99 |
| TD-SRC-02 | Bản mới nhất chưa chốt | Tổng hợp chạy sau TD-SRC-01 «Bản đã chốt: Snapshot của nguồn mặc định, `A` thô = 49.99…», `A` = 62 | source | Không thay bản chốt | Không dùng khi có TD-SRC-01 «Bản đã chốt: Snapshot của nguồn mặc định, `A` thô = 49.99…» |
| TD-SRC-03 | Không có tổng hợp | Nguồn chưa từng chạy tổng hợp | source | Thiếu nguồn | Chưa xét được |
| TD-SRC-04 | Bản chốt thiếu dữ liệu | Snapshot tồn tại nhưng không có dòng cho môn/mục của ô | source | Không fallback | Chưa xét được, không dùng TD-SRC-02 «Bản mới nhất chưa chốt: Tổng hợp chạy sau TD-SRC-01, `A` = 62» |
| TD-SRC-05 | Tỷ lệ nhóm cùng M | 2 học sinh: 60/100 và 80/100 → `R=70%` | source | Tỷ lệ nhóm (R18 «đặc tả RC-001 v2» §5.3 «Tỷ lệ nhóm») | Khớp `R≥65%` |
| TD-SRC-06 | Tỷ lệ nhóm khác M | 2 học sinh: 20/50 (lớp dùng M=50) và 80/100 | source | Khác M không gây lỗi dừng | Xử lý không dừng |
| TD-SRC-07 | Có học sinh bị loại khỏi xếp hạng | 3 học sinh: 60, 40 và 20 (học sinh 20 điểm bị loại khỏi xếp hạng) | source | Mẫu số trung bình (R18 «đặc tả RC-001 v2» §5.5 «Chọn bản nguồn», AC-G14 «Giá trị thô từ cùng tập dữ liệu») | Kỳ vọng: `A=40` (chia số người có điểm, 3); chia số người thuộc xếp hạng (`A=50`) là sai. Trường nào (`examinees`/`student_count`) mang giá trị đúng: kiểm khi tích hợp |
| TD-SRC-08 | Trung bình bằng 0 | Mọi học sinh trong nhóm có 0 điểm → `A=0` | source | Chia 0 khi chạy | Chưa xét được |
| TD-SRC-09 | Trung bình cho điểm đơn vị | Điểm đơn vị U1, U2 cùng môn, trung bình khác nhau (U1=40, U2=70) | source | Không gộp đơn vị (nguồn trung bình theo đơn vị chưa tích hợp — R18 «đặc tả RC-001 v2» §13.1 «Các quyết định còn lại được phân loại rõ») | Mỗi đơn vị dùng trung bình riêng: TBD |
| TD-SRC-10 | A = 60 và 59.96 | Hai nguồn riêng: `A`=60.00 và `A`=59.96 (hiển thị 60.0) | source | Biên điều kiện phân nhánh | 60 khớp `≥60`; 59.96 không khớp |

<a id="population"></a>

### 5.1. Nhóm tham chiếu theo thiết lập tổng hợp hiện hữu

Theo QAC «Q&A nghiệp vụ đã xác nhận» Q32 «Nhóm tham chiếu phía điểm đỏ có tuân theo thiết lập tổng hợp hiện hữu không?…», Q33 «Ba loại nhóm cấu hình có xuất hiện ngoài khối/HR/lớp học không?» (CONFIRMED): khối（学年）, lớp chủ nhiệm（ホームルーム） và lớp học（授業） chỉ chọn được khi công tắc tổng hợp tương ứng của trường/năm đang bật (tab Thiết lập — chỉ nhân viên（設定 ※社員のみ） của Tổng hợp thành tích（成績集計）); nhóm tổng hợp thứ hạng（順位集計グループ）, nhóm tổ hợp（組み合わせグループ） và nhóm môn học（科目グループ） xuất hiện khi đã có cấu hình, độc lập với ba công tắc. Cách dựng dữ liệu: hỏi team dev khi chuẩn bị.

| Data ID | Field | Value | Type | Purpose | Expected |
| --- | --- | --- | --- | --- | --- |
| TD-POP-01 | Thiết lập tổng hợp X | Thiết lập tổng hợp thứ hạng（順位集計設定） "評点集計" (tổng hợp điểm đánh giá) của trường A/2026; công tắc hiện hữu: Khối（学年） BẬT, Lớp chủ nhiệm（ホームルーム） BẬT, Lớp học（授業） TẮT; X đã chạy tổng hợp cho kỳ đang dùng | source | Loại cơ bản theo công tắc | Trong ba loại cơ bản chỉ có khối và lớp chủ nhiệm |
| TD-POP-02 | X sau khi bật lớp học | Như TD-POP-01 «Thiết lập tổng hợp X: Thiết lập tổng hợp thứ hạng（順位集計設定）…» nhưng bật thêm Lớp học（授業）, chạy lại tổng hợp X; không tạo cấu hình tổng hợp mới | source | Thêm lựa chọn lớp học trong cùng X | Có lựa chọn lớp học; kết quả theo từng lớp G-A, G-B |
| TD-POP-03 | Nhóm tổng hợp thứ hạng（順位集計グループ） | "Toán I khối 1+2" gồm lớp G-A và G-B, thuộc trường A/2026, đã có kết quả tổng hợp trong X | source | Loại cấu hình: chọn bằng tên, lưu ID | Hiển thị đúng tên đã đặt |
| TD-POP-04 | Nhóm tổ hợp（組み合わせグループ） | "Tổ hợp Toán" (tên giả) thuộc trường A/2026, đã có kết quả tổng hợp trong X | source | Loại cấu hình độc lập ba công tắc | Hiển thị đúng tên đã đặt |
| TD-POP-05 | Nhóm môn học（科目グループ） | "Nhóm môn Toán" (tên giả): có cấu hình riêng cho Toán I（数学Ⅰ） và cấu hình default đã lưu. Biến thể: (a) môn không có cấu hình riêng → dùng default; (b) default bị xóa hoặc trỏ tới cấu hình không hợp lệ | source | Phân giải nhóm môn | Dùng cấu hình riêng hoặc default; thiếu/sai → Chưa xét được |
| TD-POP-06 | Học sinh học hai lớp cùng môn | S11 (tên giả, HR1) học cả G-A và G-D (Toán I（数学Ⅰ）, khối 1, lớp thứ hai); có điểm TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» ở cả hai lớp; trung bình lớp G-A = 40, G-D = 70 trong X | score | Loại lớp học đọc đúng lớp của ô | Ô ở G-A dùng kết quả G-A; ô ở G-D dùng kết quả G-D |

## 6. Quy tắc đỏ

| Data ID | Field | Value | Type | Purpose | Expected |
| --- | --- | --- | --- | --- | --- |
| TD-RULE-01 | Cố định `<` | Tên "Cố định 30"; Toàn bộ đối tượng（全員が対象）; Điểm cố định（固定点数） 30; Nhỏ hơn（未満） | rule | Quy tắc cơ bản | `T=30`, đỏ khi `S<30` |
| TD-RULE-02 | Cố định `≤` | Như TD-RULE-01 «Cố định `<`: Tên "Cố định 30"» nhưng Nhỏ hơn hoặc bằng（以下） | rule | Biên `S=T` | Đỏ khi `S≤30` |
| TD-RULE-03 | Tỷ lệ | Tỷ lệ điểm tối đa（得点率） 30%, không xử lý phần lẻ（しない）, Nhỏ hơn（未満） | rule | Tỷ lệ theo M hiện hành | `T=M×0.3` |
| TD-RULE-04 | Tỷ lệ làm tròn xuống | Như TD-RULE-03 «Tỷ lệ: Tỷ lệ điểm tối đa（得点率） 30%, không xử lý phần lẻ（しない）, Nhỏ hơn（未満）», xử lý phần lẻ: chữ số thập phân thứ 1（小数第1位）, Làm tròn xuống（切り捨て） | rule | Làm tròn | `T` là số nguyên làm tròn xuống |
| TD-RULE-05 | Tỷ lệ làm tròn gần nhất | Như TD-RULE-04 «Tỷ lệ làm tròn xuống: Như TD-RULE-03, xử lý phần lẻ: chữ số thập phân…» nhưng Làm tròn gần nhất（四捨五入） | rule | Làm tròn | `T` là số nguyên gần nhất |
| TD-RULE-06 | Công thức hai dòng | Dòng 1: Trung bình（平均点）÷ Số cố định（固定値）2, không xử lý; Dòng 2: Kết quả dòng 1（式の結果 式1）× 0.8, chữ số thập phân thứ 1 làm tròn xuống; Nhỏ hơn（未満）; nguồn mặc định | rule | Công thức Figma 58:8389 «Figma MW: màn Ngưỡng – công thức» | `T=floor((A÷2)×0.8)` |
| TD-RULE-07 | Cặp phân nhánh | Ưu tiên 1 "Trung bình từ 60": điều kiện `A≥60`, cố định 30 `<`. Ưu tiên 2 "Trung bình dưới 60": `A<60`, công thức `A×0.5` `<` | rule | Phân nhánh bằng nhiều quy tắc (R18 «đặc tả RC-001 v2» §5.2 «Điều kiện dựa trên trung bình») | Chọn đúng nhánh theo A thô |
| TD-RULE-08 | Cặp cùng áp dụng | Ưu tiên 1: Toàn bộ, cố định 20 `<`; Ưu tiên 2: Toàn bộ, cố định 30 `<` | rule | First match (R18 «đặc tả RC-001 v2» §4.3 «Chọn quy tắc») | Luôn dùng ưu tiên 1 |
| TD-RULE-09 | Tỷ lệ nhóm | Điều kiện Tỷ lệ điểm của nhóm（集団の得点率） `≥65%`; cố định 70 `<` | rule | Nguồn tỷ lệ nhóm | Học sinh 60 đỏ, 80 không đỏ khi khớp |
| TD-RULE-10 | Công thức âm | Dòng 1: Trung bình（平均点）− 20; Nhỏ hơn（未満） | rule | Ngưỡng âm (QAC «Q&A nghiệp vụ đã xác nhận» Q25 «Công thức cho ngưỡng âm thì xử lý thế nào?») | Với `A=15`: `T=−5` |
| TD-RULE-11 | Chia cho trung bình | Dòng 1: Số cố định（固定値）100 ÷ Trung bình（平均点） | rule | Chia 0 khi chạy | Với `A=0`: chưa xét được |
| TD-RULE-12 | Bộ lọc kết hợp | Giới hạn bằng bộ lọc（特定条件で絞り込む）: Khối（学年） = 1 hoặc 2; Nhóm thành tích（成績グループ） = Nâng cao; cố định 30 `<` | rule | OR trong loại, AND giữa loại | Chỉ học sinh khối 1/2 **và** nhóm Nâng cao |
| TD-RULE-13 | Cố định chưa có ngưỡng | Chỉ lưu điều kiện áp dụng, chưa lưu ngưỡng | rule | Trạng thái thêm dở (Figma 58:10165 «Figma MW: chương 01 – lối vào, danh sách, xóa thiết lập») | Không tham gia xét (PROPOSED) |
| TD-RULE-14 | Nhóm tổng hợp hai loại nhóm | Giới hạn bằng bộ lọc（特定条件で絞り込む）: nhóm tổng hợp loại K1 = Nâng cao HOẶC loại K2 = X; cố định 30 `<` | rule | HOẶC trong cùng loại bộ lọc dù khác loại nhóm (RSD-DB «thiết kế DB v2 đề xuất» §3.2 «`apply_condition`», PROPOSED) | P5, P6 thuộc; P7 không |

## 7. Cấu hình đầu ra

| Data ID | Field | Value | Type | Purpose | Expected |
| --- | --- | --- | --- | --- | --- |
| TD-OUT-01 | Trích xuất lọc + ký hiệu trước + màu | Lọc học sinh có điểm đỏ（抽出する） BẬT; ký hiệu đầu（強調記号を接頭に表示する） BẬT, ký hiệu `*`; ký hiệu cuối TẮT; tô màu ô（セルを色付けする） BẬT, màu Đỏ（赤） của bảng màu hiện có | output | Lọc và trang trí | Chỉ học sinh có ô đỏ; ô đỏ `*29` nền đỏ |
| TD-OUT-02 | Trích xuất chỉ ký hiệu | Lọc TẮT; ký hiệu đầu `※`, ký hiệu cuối `!` | output | Ký hiệu hai phía, không lọc | Ô đỏ `※24!`; danh sách không bị lọc |
| TD-OUT-03 | Công khai | Hiệu ứng đỏ: `*` phía trước（前に「*」）; Điểm dự kiến（見込点）: Ngoặc（括弧） | output | Kết hợp hiệu ứng | S06 hiển thị `(*24)` |
| TD-OUT-04 | Phiếu điểm | Dòng Thiết lập điểm đỏ（赤点設定）: Ký tự phía trước（前に任意の文字） `※`; các dòng khác: Nguyên trạng（そのまま表示） | output | First match | Ô đỏ `※29` |
| TD-OUT-05 | Hai cấu hình công khai cùng mục | Thiết lập công khai thành tích（成績公開設定） X: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» hiệu ứng đỏ Có ngoặc（括弧つき）; cấu hình Y: cùng TD-ITEM-01, hiệu ứng `*` phía trước（前に「*」）; cả hai không bật hiệu ứng Điểm dự kiến（見込点） | output | Hiệu ứng riêng theo cấu hình (AC-G32 «Cấu hình công khai và ẩn điểm») | S01 (29, đỏ): X hiển thị `(29)`, Y hiển thị `*29` |
| TD-OUT-06 | Công khai có mục thường và đơn vị | Cấu hình X: TD-ITEM-01 «Mục số nguyên: Điểm đánh giá（評点）, Nhập số nguyên（数値入力（整数））, M mặc định…» (điểm thường（通常）) chọn Có ngoặc; TD-ITEM-03 «Mục điểm đơn vị: Điểm bài kiểm tra đơn vị（単元テスト点）, M mặc định 100» (điểm đơn vị（単元）) chọn `*` phía sau（後ろに「*」） | output | Không trộn thường/đơn vị | Mở lại giữ đúng lựa chọn của từng phân loại |

<a id="value-classes"></a>

## 8. Phân loại theo lớp giá trị

Giá trị nhập trực tiếp trong bước test (ví dụ N=101) ghi ở cột Test Data của từng case; bảng dưới chỉ ra lớp giá trị nào đã có dữ liệu.

| Lớp | Dữ liệu / giá trị | Case dùng |
| --- | --- | --- |
| Hợp lệ（Valid） | TD-RULE-01…12 «quy tắc: Cố định `<`: Tên "Cố định 30" … Bộ lọc kết hợp: Giới hạn bằng bộ…», TD-STU-01 «S01: G-A, HR1», TD-STU-03 «S03: G-A, HR1», TD-SRC-01 «Bản đã chốt: Snapshot của nguồn mặc định, `A` thô = 49.99…», TD-SRC-05 «Tỷ lệ nhóm cùng M: 2 học sinh: 60/100 và 80/100 → `R=70%`» | TC-RS-FUNC-004 «Thêm quy tắc qua Điều kiện áp dụng（適用条件） và…», TC-RS-CALC-001 «Ngưỡng cố định 30: S = 29 / 30 / 31 với `<` và `≤`», TC-RS-CALC-005 «Tỷ lệ 30% với M=100» |
| Không hợp lệ（Invalid） | N=−1, N=101, tỷ lệ 101, chữ cái, mẫu số cố định 0, `NaN`, `Infinity`; vượt giới hạn đề xuất (29.5555, 21 dòng, hệ số 10 chữ số nguyên/9 chữ số lẻ, tên 256 ký tự) | TC-RS-VAL-001 «Điểm cố định: biên −1 / 0 / 100 / 101 với M=100», TC-RS-VAL-004 «Ngưỡng cố định/tỷ lệ trống hoặc không phải số», TC-RS-VAL-006 «Tỷ lệ N: biên −1 / 0 / 100 / 101», TC-RS-VAL-009 «Chia cho số cố định 0 không lưu được», TC-RS-ERR-009 «Server kiểm miền giá trị khi bỏ qua kiểm tra phía trình…», TC-RS-VAL-005 «Điểm cố định thập phân», TC-RS-VAL-014 «Tên thiết lập: bắt buộc, độ dài, trùng tên», TC-RS-VAL-023 «Giới hạn công thức: 20/21 dòng và số chữ số của số cố định» |
| Biên（Boundary） | S=29/30/31 (TD-STU-01…03 «học sinh: S01: G-A, HR1 … S03: G-A, HR1»); N=0/100; A=60.00/59.96 (TD-SRC-10 «A = 60 và 59.96: Hai nguồn riêng: `A`=60.00 và `A`=59.96 (hiển thị 60.0)»); A=49.99 (TD-SRC-01 «Bản đã chốt: Snapshot của nguồn mặc định, `A` thô = 49.99…»); M=20 và 100 (TD-ITEM-07 «Mục khác M theo lớp: Mục số M mặc định 100») | TC-RS-CALC-001 «Ngưỡng cố định 30: S = 29 / 30 / 31 với `<` và `≤`», TC-RS-CALC-009 «Tỷ lệ biên N=0 và N=100», TC-RS-CALC-022 «Phân nhánh theo trung bình: A = 40 / 50 / 49.99…», TC-RS-CALC-023 «Biên nhánh A=60.00 và A=59.96», TC-RS-VAL-002 «Điểm cố định phải ≤ M của mọi đối tượng (M=20 và M=100)» |
| Trống（Empty） | Ô điểm trống (TD-STU-05 «S05: G-A, HR1»); ô ngưỡng/toán hạng để trống; danh sách quy tắc trống; kết quả trích xuất 0 học sinh | TC-RS-BR-014 «Ô trống không bị coi là 0 (trạng thái Không có điểm)», TC-RS-VAL-004 «Ngưỡng cố định/tỷ lệ trống hoặc không phải số», TC-RS-VAL-010 «Toán hạng trống hoặc không phải số», TC-RS-FUNC-003 «Danh sách trống không tự tạo quy tắc mặc định hoặc chuyển…», TC-RS-UI-021 «Trích xuất: kết quả 0 học sinh và hiển thị ô đỏ số thập phân» |
| Không tồn tại（Null） | Nguồn chưa tổng hợp (TD-SRC-03 «Không có tổng hợp: Nguồn chưa từng chạy tổng hợp»); bản chốt thiếu dòng (TD-SRC-04 «Bản chốt thiếu dữ liệu: Snapshot tồn tại nhưng không có dòng cho…»); M không xác định (TD-ITEM-08 «M không hợp lệ: Mục số có M hiệu lực = 0 (nếu cấu hình được) hoặc không…»); nguồn có tổng điểm tối đa 0 hoặc không ai có điểm | TC-RS-BR-009 «Nguồn: bản đã chốt thiếu dữ liệu → Chưa xét được, không…», TC-RS-BR-010 «Chưa có kết quả tổng hợp → Chưa xét được, không thay bằng 0…», TC-RS-CALC-010 «Tỷ lệ với M = 0, M < 0 hoặc không xác định → Chưa xét được», TC-RS-CALC-031 «Nguồn không có mẫu số hợp lệ…» |
| Cực trị（Extreme） | `1e400`, số rất dài; 20 dòng `× 999999999.99999999`; `p=9`; ngưỡng âm (TD-RULE-10 «Công thức âm: Dòng 1: Trung bình（平均点）− 20»); ngưỡng vượt M; batch 100 học sinh | TC-RS-CALC-029 «Tràn số không tạo kết luận đỏ/không đỏ», TC-RS-CALC-019 «Định nghĩa phương thức làm tròn, số âm và p=9», TC-RS-CALC-016 «Ngưỡng âm: A=15, A−20 → T=−5», TC-RS-CALC-017 «Ngưỡng công thức vượt M vẫn hợp lệ», TC-RS-REG-014 «Batch không phát sinh truy vấn theo từng ô（N+1）» |
| Ví dụ thực tế trong nguồn | Ví dụ hai loại cũ: A=40 → nhánh `A<50`, `T=20`; A=50 → nhánh `A≥50`, `T=30`; R18 «đặc tả RC-001 v2»: M=75, S=22.2; M=45 → `T=13.5`; `(*24)` và `*24` ở công khai | TC-RS-CALC-022 «Phân nhánh theo trung bình: A = 40 / 50 / 49.99…», TC-RS-CALC-008 «Ví dụ đặc tả v2: M=75, N=30, S=22.2», TC-RS-CALC-006 «Tỷ lệ cho ngưỡng lẻ: M=45, N=30 → T=13.5», TC-RS-FUNC-027 «Công khai: kết hợp hiệu ứng Điểm dự kiến（見込点） và điểm đỏ…» |
