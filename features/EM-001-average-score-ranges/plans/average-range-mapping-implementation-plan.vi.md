# Kế hoạch triển khai EM-001 — Ánh xạ đánh giá theo khoảng điểm trung bình

| Mục | Nội dung |
| --- | --- |
| Feature ID | `EM-001` (người phụ trách xác nhận ngày 14/10/2026; chưa đối chiếu Work Item trên Sheet hoặc Redmine) |
| Task ID | Chưa có Task ID được xác minh; không suy ra từ RA-001 hoặc RC-001 |
| Ngày lập | 19/10/2026 |
| Loại tài liệu | Kế hoạch triển khai **đề xuất**, dự thảo để review |
| Phạm vi | Toàn bộ chức năng EM-001: thiết lập, tính, lịch sử, kế thừa năm học, kiểm thử |
| Revision code đã đọc | `blend` nhánh `master` @ `d16ed632e164755eea09863e7cacf7c9a03393f6`; nhánh `feature/RA-001_ranking_average` @ `b7a21736e2bf01f1e110ae632be8c6dfcc324dba` (nhánh này chưa được merge vào `master` tại thời điểm đọc) |

Kế hoạch này chỉ ghi lại hướng làm đề xuất. Đọc trước [context](../CONTEXT.md), [Q&A và nguồn xác nhận](../sources/confirmed-business-qa.vi.md), [đặc tả dự thảo](../docs/specification.vi.md) và [hiện trạng ánh xạ](../research/current-mapping-behavior.vi.md).

## 1. Trạng thái đầu vào và quyền thực thi

| Đầu vào | Trạng thái | Nguồn |
| --- | --- | --- |
| Yêu cầu Pattern B và Q1–Q4 | Khách đã xác nhận | [Yêu cầu gốc](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1791290107759389), [trả lời Q1–Q4](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1791883926294639) |
| Điểm cá nhân trống thì kết quả trống; không tạo màn đếm riêng, dùng bảng và biểu đồ phân bố ở trích xuất thành tích（成績抽出） | Nhóm phát triển bổ sung, chưa có phản hồi tiếp theo của khách | [Phản hồi của nhóm](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1791893930779779) |
| Thiết kế Figma 4 màn và kết quả thử trên staging | Nhóm đã gửi khách review ngày 16/10/2026; nguồn chưa có phản hồi hoặc phê duyệt | [Tin nhắn 16/10](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1792135534437659), [Figma](https://www.figma.com/design/ECOs3PWUGyxIS6LS0MnTjm?node-id=152-2) |
| Chi tiết hai lớp điều kiện, tên phương thức mới, cấu trúc JSON, nội dung log | Đề xuất kỹ thuật | Kế hoạch này |
| Chính sách bản nguồn (đã chốt hay số mới nhất) | **Đã xác nhận 19/10/2026:** chỉ dùng bản chốt hợp lệ, thiếu thì trống, không dùng số mới nhất chưa chốt | [Thread RC-001 ④](https://tryhand.slack.com/archives/C0BRGJA6XDE/p1792383099678219), [context EM-001, mục 4](../CONTEXT.md) |

**Quyền thực thi:** kế hoạch này không cấp quyền sửa ứng dụng, chạy SQL, tạo ticket, commit hoặc tạo PR. Mỗi việc đó cần yêu cầu riêng. Ước lượng ở mục 12 là đề xuất để review, chưa được duyệt.

## 2. Hướng làm

- Thêm **loại đăng ký thứ 9** (mã `9`; mã `8` đã thuộc 順位連動設定 của [PR #57058](https://github.com/ednity/school-web/pull/57058)): **平均点の範囲で評価を登録する** (đăng ký đánh giá theo khoảng điểm trung bình) vào **自動計算設定** (thiết lập tính tự động).
- **Không cần DDL.** Cột `regist_type` là TINYINT. Cấu hình lưu trong JSON của `auto_rating_conf_items.condition`, đúng cách RA-001 đang lưu điều kiện trung bình.
- Engine tính trong `domain\tmp\AutoRating`: chọn hàng theo trung bình nhóm (chưa làm tròn), rồi xét điều kiện điểm cá nhân trong hàng đó.
- Trung bình nhóm đọc bằng `RankingAverageReader` của RA-001.
- Kiểm tra số lượng theo Q4: dùng bảng và biểu đồ phân bố ở **成績抽出** (trích xuất thành tích), không làm màn mới.

## 3. Điều kiện tiên quyết

1. **`master` chưa có RA-001 và RC-001.** `RankingAverageReader`, loại điều kiện **平均点** (điểm trung bình) và việc bỏ chặn **科目平均** (trung bình môn) cho trường ngoài Uenomiya chỉ có ở nhánh RA-001.
   **Chiến lược nhánh (đề xuất): tạo nhánh EM-001 từ `master`, không copy hàm của RA-001.** Phần EM-001 cần từ RA-001 đi qua một **giao diện nhỏ** (mục 7.1), có một bản **tạm** nằm trong file mới riêng. Khi RA-001 được merge thì đổi một dòng khởi tạo sang `RankingAverageReader` và xóa bản tạm.
2. **RA-001 và RC-001 xung đột nhau** ở `blend:application/models/GradeCalcResultEachSubSubjectLogs_m.php`, `blend:application/models/GradeCalcResultEachGroupLogs_m.php` và khối `unset(...)` trong `AutoRating::calc`. Vì vậy trên nhánh từ `master`, EM-001 **không sửa và không thêm** method vào hai model này, và **không sửa** `useRankingAverage`, `getSubSubjectAvgForFormula` hay các hàm khác của RA-001. Thêm bản thứ ba của các hàm đó sẽ gây xung đột ba chiều, trùng khai báo, và có thể lệch quy tắc so với RA-001.
3. **Chính sách bản nguồn đã xác nhận (19/10/2026).** Chỉ dùng kết quả tổng hợp thứ hạng đã chốt và còn hiệu lực; chưa chốt, đã gỡ chốt hoặc thiếu nhóm thì coi là thiếu trung bình và ghi trống, không dùng số mới nhất. Quy tắc nằm một chỗ trong bộ đọc chung, không tách riêng cho EM-001. Bản tạm trên nhánh từ `master` đã đọc **chỉ bảng bản chốt** (`GradeCalcResultService::getFinalizedEachSubSubjectTotalResult`); khi chưa có bảng bản chốt thì trả trống.

## 4. Quy tắc cần cài đặt

| Loại | Quy tắc |
| --- | --- |
| Đã xác nhận (Q1–Q4) | Điểm cá nhân và nguồn trung bình là **mục số**, không dùng mục lựa chọn A/B/C làm căn cứ xét. Mục nhận có thể là số hoặc lựa chọn. |
| | Số điều kiện không cần bằng số mức của mục nhận. Toán tử: **以上** (từ … trở lên), **より大きい** (lớn hơn), **等しい** (bằng), **より小さい** (nhỏ hơn), **以下** (từ … trở xuống). |
| | Nhiều điều kiện cùng khớp thì lấy điều kiện đầu tiên theo thứ tự. Không khớp thì ghi trống, kể cả khi ô đã có kết quả. Không tự gán mức thấp nhất. |
| | Điểm cá nhân trống thì kết quả trống (nhóm bổ sung theo hiện trạng); điểm 0 không phải ô trống. |
| Kế thừa RA-001 | Trung bình chưa làm tròn = tổng điểm ÷ số học sinh có điểm của cùng bản nguồn, không dùng `examinees`. Mẫu số 0 hoặc thiếu nhóm nghĩa là thiếu trung bình. So sánh với mốc bằng bcmath. Hàng có trung bình không lấy được thì coi là không khớp và xét hàng tiếp theo (RA-001 Q7). |
| Diễn giải thiết kế (chưa được khách xác nhận riêng) | Đã chọn một hàng trung bình mà điểm cá nhân không khớp điều kiện nào thì **ghi trống**, không quay sang hàng trung bình kế tiếp. Cài đặt gọn trong một hàm để dễ đổi nếu khách yêu cầu khác. |

## 5. Thiết kế giao diện theo Figma và nơi cần sửa

| Màn Figma | Nội dung | Nơi sửa |
| --- | --- | --- |
| **01｜一覧** (danh sách) | Cột **登録方法** (cách đăng ký) hiện tên phương thức, `平均点：…　時期：…　集計対象：…`, `個人点：…`, bảng khoảng × điều kiện và link [編集]. | `blend:application/views/grade_report_setting/auto_rating/edit.php` thêm nhánh `elseif`; `AutoRatingConfItemRepository::formatAutoRatingConfItemList` thêm `case` tạo text tóm tắt. |
| **02｜編集（数値）** (sửa, mục số) | Radio mới ở hàng thứ hai. Vùng **参照元** (nguồn tham chiếu): 3 ô cho điểm trung bình (**順位集計設定** — thiết lập tổng hợp thứ hạng, **対象時期** — thời kỳ đối tượng, **集計対象** — nhóm được tổng hợp) và 1 ô cho **個人点** (điểm cá nhân). Lưới khoảng trung bình × điều kiện 1..n; nút **戻る** (quay lại) và **更新する** (cập nhật). | `blend:application/views/grade_report_setting/auto_rating/edit_formula.php` (panel mới, hằng JS, khối khôi phục dữ liệu) và `AutoRatingConfController::editFormula`. |
| **02-C｜編集（選択式）** (sửa, mục lựa chọn) | Giống 02, nhưng chỉ có 3 radio: **マッピングした結果を登録する** (đăng ký kết quả đã ánh xạ), **固定の値を登録する** (đăng ký giá trị cố định) và phương thức mới. **登録値** (giá trị đăng ký) chọn từ các lựa chọn của mục nhận. | Thêm loại mới vào `REGIST_TYPES_CHOICE`. Ô giá trị là select dùng `$choice_item_values`, có `(空欄)` (trống) = `'null'`. |
| **03｜履歴** (lịch sử) | Modal **成績自動算出履歴** (lịch sử tính điểm tự động) hiện: nguồn trung bình, `1812 ÷ 30 = 60.4`, điểm cá nhân, bảng khoảng (tô đậm khoảng khớp), bảng điều kiện (tô đậm điều kiện khớp), **登録結果** (kết quả đăng ký). | `blend:application/views/grade/grade_setting_system/lesson_group/_log_modal.php` thêm nhánh `elseif`; dữ liệu từ `detail_log` mới. |

Ghi chú khi đối chiếu Figma:

- Lưới: **hàng là khoảng trung bình, cột là điều kiện**. Nút thêm/xóa khoảng (**範囲を追加** — thêm khoảng) và thêm/xóa cột (**条件列を追加** — thêm cột điều kiện). Thêm hoặc xóa cột áp dụng cho mọi hàng. Mock chưa vẽ trạng thái lỗi.
- Figma vẽ mọi ô là ô trắng, không phân biệt dropdown với ô số. Mặc định đề xuất: toán tử và lựa chọn là select (`no-nice`); ngưỡng và giá trị số là `<input type="number">`.
- Figma có 3 ô cho nguồn trung bình, còn dữ liệu của RA-001 là một chuỗi `"学期名,時期名,母集団"` (tên kỳ, tên thời kỳ, nhóm). Đề xuất: giao diện dùng 3 select; server ghép lại thành chuỗi đó và kiểm bằng `subSubjectAvgValidate` có sẵn của RA-001.

## 6. Dữ liệu (không DDL)

Thêm `REGIST_TYPE_AVERAGE_RANGE = 9`, nhãn `平均点の範囲で評価を登録する`. Cập nhật `REGIST_TYPES` và `REGIST_TYPES_CHOICE` trong `blend:application/domain/model/AutoRatingConf/m_AutoRatingConfItemRegistType.php`.

```json
"regist_type": "9",
"average_range": {
  "calc_conf_name": "1学期集計（評点）",
  "sub_subject_avg": "1学期,期末,グループ1",
  "score_frame_item_id": "<frame item id>",
  "ranges": [
    {
      "id": 0,
      "sort_no": 0,
      "lower": {"operator": 1, "value": "0"},
      "upper": {"operator": 4, "value": "50"},
      "conditions": [
        {"id": 0, "operator": 1, "threshold": "80", "save_value": "5"}
      ]
    }
  ]
}
```

- `save_value` giữ quy ước hiện có: giá trị lựa chọn, hoặc `'null'` cho trống.
- Tên thiết lập thứ hạng, kỳ và nhóm lưu **bằng tên**, như RA-001. Đổi tên hoặc xóa thì tham chiếu không còn khớp; khi mở lại hiện `選択してください` (hãy chọn) kèm cảnh báo, theo cách của hàm `restoreSubSubjectAvg` bên RA-001.
- Class mới phải được đăng ký trong `blend:application/config/namespaces.php` (khối `domain\model\AutoRatingConfItem`).
- `registFormula` luôn ghi mọi key của mọi loại đăng ký. Key `average_range` phải đọc an toàn khi không có, để không phát sinh warning hoặc notice.

## 7. Engine

**Tách logic thuần thành `domain\service\AverageRangeMapper`**, không phụ thuộc CodeIgniter, nhận hàm so sánh qua tham số. Nhờ đó viết được PHPUnit (`blend:application/tests/phpunit.xml` đã có; `bcmath` đã được cài trong Dockerfile của dự án). `AutoRating` chỉ làm phần đọc dữ liệu và ghi kết quả.

```
calcAverageRange(cfg, student, st_grades, save_info, tangen_id):
  score = filterStudentGrade(st_grades, cfg.score_frame_item_id, tangen_id, true)   // trống => null; '0' vẫn là giá trị
  avg   = reader.getAverageDetail(...)      // null nếu thiếu; kèm total_score, student_count
  range = hàng đầu tiên thỏa compareAverage(avg, lower) và (không có upper hoặc compareAverage(avg, upper))
  nếu không có range           -> null   (lý do: thiếu trung bình / không khoảng nào khớp)
  nếu score không phải số      -> null   (lý do: điểm cá nhân trống)
  cond  = điều kiện đầu tiên thỏa compare(score, threshold, operator)      // compare() hiện có
  value = cond ? (save_value == 'null' ? null : save_value) : null
  ghi detail_log; return [value, save_info]
```

### 7.1. Giao diện nguồn trung bình và bản tạm (khi làm từ `master`)

`AverageRangeMapper` và `calcAverageRange` chỉ gọi nguồn trung bình qua giao diện `AverageRangeSource` (file mới), cùng chữ ký với `RankingAverageReader` của RA-001:

- `prepare($school_id, $year)`
- `getAverageDetail($calc_conf_name, $sub_subject_avg, $student_data, $group, $tangen_id)` → `['average', 'total_score', 'student_count']` hoặc `null`
- `compareAverage($average, $threshold, $operator)` (bcmath)

| Bản | Nội dung | Trạng thái |
| --- | --- | --- |
| **Tạm** `AverageRangeSourceStub` (file mới, tên khác hẳn) | Chỉ đọc kết quả đã chốt (bảng `grade_calc_fix_each_sub_subject_*`) do `AutoRating` truyền vào; không có số mới nhất thay thế, chưa có bản chốt thì trả `null` (trống). `AutoRating` truyền kết quả đã chốt theo từng khối (`hr_grade`, mỗi khối một lần gọi `getFinalizedEachSubSubjectTotalResult`) và stub chỉ tra theo `hr_grade` của học sinh, nên nhóm giờ học nhiều khối không bị lẫn kết quả "学年毎" giữa các khối; khối không có bản chốt thì trống. Kết quả còn được tách theo `tangen_id`: kỳ 単元 dùng đúng 単元 đang tính, kỳ khác dùng `tangen_id = 0`. Chưa dùng bộ đọc chung. Ghi comment rõ là tạm, không dùng cho staging hoặc production. | Xóa khi RA-001 vào `master`. |
| **Thật** adapter bọc `RankingAverageReader` | `getAverageDetail()` thêm vào `RankingAverageReader` dưới dạng method mới, không sửa `getAverage`. | Làm sau khi RA-001 merge. |

Quy tắc khi dùng bản tạm:
- Không sửa file nào của RA-001 hay RC-001; chỉ thêm file mới.
- Dữ liệu cho 3 ô nguồn trên `master`: `getSubSubjectAvgForFormula()` chỉ chạy cho Uenomiya. Dùng danh sách tạm trong controller của EM-001 (đánh dấu tạm) hoặc dữ liệu cứng khi test; thay bằng hàm của RA-001 sau khi merge.
- Kết quả test với bản tạm không thay thế test đầu-cuối sau khi nối `RankingAverageReader` thật (bản chốt, mẫu số, nhóm). Bản tạm cần dữ liệu bản chốt; bảng bản chốt thật chưa có trong DB local nên ca "có bản chốt" mới được kiểm bằng test đơn vị với dữ liệu giả.

### 7.2. Điểm sửa trong `AutoRating.php`

Điểm sửa trong `blend:application/domain/tmp/AutoRating.php`:

- `getCalcPatterns`: thêm `case` cho loại 9.
- `calcPerStudent`: thêm `case` cho loại 9. Switch này không có `default`; thiếu `case` sẽ gây undefined variable.
- Trên nhánh từ `master`: khởi tạo `AverageRangeSource` (bản tạm) ngay trong nhánh xử lý loại 9, không dùng `useRankingAverage`.
- **Sau khi RA-001 merge:** thêm loại 9 vào `useRankingAverage` (**nếu quên thì bộ đọc trung bình là `null` và mọi học sinh có kết quả trống**) và đổi khởi tạo sang adapter của `RankingAverageReader`.
- `RankingAverageReader`: thêm method **mới** `getAverageDetail()` trả thêm `total_score` và `student_count` để màn lịch sử hiện `1812 ÷ 30 = 60.4`. Không sửa `getAverage` để tránh xung đột.
- Giữ nguyên phần sau switch của `calcPerStudent`: giới hạn min/max, `use_flg` của đơn vị bài học（単元）, `createRegistData` (đổi giá trị thành tên lựa chọn cho cột `rating_late_age_text`), ghi `auto_rating_log`.

**`detail_log` mới** (đủ cho Figma 03 và cho trường hợp ghi trống):

```
{type, source{...nhãn}, average{value, total_score, student_count} | null,
 score{item_name, value} | null,
 ranges[{id, label}], matched_range_id,
 conditions[{id, label, save_value}], matched_condition_id,
 blank_reason: null | average_missing | no_range | score_blank | no_condition}
```

Màn lịch sử nên hiện **登録結果** (kết quả đăng ký) bằng giá trị thực của ô (`grade_value`, đã qua giới hạn min/max), như loại đăng ký 4 hiện có.

## 8. Các bước thực hiện

| # | Việc | Nơi sửa |
| --- | --- | --- |
| 1 | Tạo nhánh từ `master`. Chốt schema JSON ở mục 6 và giao diện `AverageRangeSource` ở mục 7.1 làm hợp đồng giữa backend và giao diện. | — |
| 2 | **Domain**: hằng số; value object `m_AutoRatingConfItemAverageRange`; thuộc tính và accessor trong `AutoRatingConfItem` và `Methods`; `case` trong `AutoRatingConfItemRepository::getAutoRatingConfItem`; đăng ký `namespaces.php`. | `blend:application/domain/model/AutoRatingConf/*`, `blend:application/repository/grade_setting/AutoRatingConfItemRepository.php` |
| 3 | **Engine**: `AverageRangeSource` và bản tạm, `AverageRangeMapper`, `calcAverageRange`, các điểm nối ở mục 7. | `AutoRating.php` (chỉ thêm `case`, không sửa hàm RA-001) |
| 3b | **Sau khi RA-001 merge** (rebase lên `master`): thêm `getAverageDetail()` vào `RankingAverageReader`; adapter thật; thêm loại 9 vào `useRankingAverage`; thay danh sách nguồn tạm bằng `getSubSubjectAvgForFormula()`; xóa bản tạm; chạy lại toàn bộ kiểm thử, ưu tiên các ca bản chốt, mẫu số, nhóm. **Lưu ý:** `RankingAverageReader` trên nhánh RA-001 hiện dùng số mới nhất khi chưa chốt (cùng quy tắc `getRedScoreSourceMetric`); phải đổi sang chỉ dùng bản chốt theo xác nhận 19/10/2026 trước khi nối. | `RankingAverageReader.php`, `AutoRating.php`, controller |
| 4 | **Controller**: `editFormula` cấp dữ liệu (danh sách điểm cá nhân chỉ gồm mục số; danh sách lựa chọn của mục nhận; tái dùng `getSubSubjectAvgForFormula()`); `registFormula` chuẩn hóa `average_range`; `conditionValidate` thêm `case`. | `blend:application/controllers/grade_report_setting/auto_rating/AutoRatingConfController.php` |
| 5 | **Giao diện sửa**: panel mới, lưới lồng nhau với tên field có **chỉ số tường minh**, thêm/xóa khoảng và cột (tối thiểu 1 khoảng và 1 cột), khôi phục khi mở lại. Dùng class riêng và selector giới hạn trong panel. | `edit_formula.php` |
| 6 | **Danh sách và lịch sử**: text tóm tắt trong repository và `edit.php`; modal `_log_modal.php` (escape mọi giá trị, vì modal nhận `$data` chưa `html_escape`); `getLog` truyền đủ dữ liệu. | `edit.php`, `_log_modal.php`, `AdminNBGradeSettingSystemLessonController::getLog` |
| 7 | **Kế thừa năm học**: ánh xạ lại `score_frame_item_id` trong `FromAutoRatingConf::setCondition` (cạnh khối `calc_average`), nếu không sang năm mới vẫn giữ ID năm cũ. | `blend:application/usecase/grade_setting/takeover/output_data.php` |
| 8 | Kiểm thử, thu bằng chứng, sửa lỗi; cập nhật tài liệu feature (mục 13). | — |

Chi tiết cần lưu ý ở bước 4–5:

- Form gửi **toàn bộ panel** bằng `serialize()`; server chọn dữ liệu theo `regist_type`.
- Các hàm mapping hiện có dùng selector toàn cục và tự đánh chỉ số bằng `[]`, không phù hợp dữ liệu lồng nhau (`addFormula` chỉ thay chỉ số đầu tiên). Không tái dùng trực tiếp.
- Danh sách mục điểm cá nhân chỉ gồm mục số (nhập điểm hoặc số thập phân), loại mục nhận. Khi `auto_rating_conf.item_type` là **同一学期項目** (mục cùng học kỳ), lọc thêm theo cùng kỳ và thời kỳ, vì engine chỉ nạp điểm của các mục cùng kỳ ở chế độ này.
- Số thập phân: ô số của mục nhận dạng thập phân cần `step="any"`.
- Không có route mới; dùng lại `regist_formula`.

## 9. Kiểm tra phía server

Hiện `registFormula` chưa kiểm các điều sau. Với loại mới phải kiểm:

- Loại đăng ký hợp lệ với mục nhận (số hoặc lựa chọn).
- Mục điểm cá nhân thuộc đúng khung điểm của setting, là mục số và khác mục nhận.
- Nguồn trung bình thuộc các lựa chọn hợp lệ (`subSubjectAvgValidate`).
- Toán tử nằm trong 1–5.
- Ngưỡng là số hợp lệ: cận trung bình theo RA-001 (từ 0, tối đa 6 chữ số nguyên và 4 chữ số thập phân); ngưỡng điểm cá nhân cho phép số âm và thập phân vì có mục cho phép âm.
- `save_value` thuộc các lựa chọn của mục nhận (hoặc `'null'`), hoặc là số. Với mục số/thập phân: nằm trong `min_value`–`max_value` của mục nhận, và mục số (数値入力) chỉ nhận số nguyên; báo lỗi ngay khi lưu. Min/max theo 単元 hoặc 項目効果 chỉ áp dụng lúc chạy 自動算出 (vẫn bị ép về giới hạn).
- Ô điều kiện nhập dở thì báo lỗi tại ô đó (xem D2).
- Thiếu giá trị thì phản hồi lỗi có thông báo, không phát sinh warning hoặc notice.

Áp dụng quy tắc phát triển của dự án: thụt lề bằng tab, chuỗi nháy đơn, mảng `[]`, comment mục đích trước mỗi method, `no-nice` cho select, không dùng template literal trong view, `html_escape` khi in giá trị, comment nội bộ trong view dùng comment PHP, kiểm tra phạm vi trường và năm khi đọc dữ liệu theo ID.

## 10. Kế hoạch kiểm thử

**Kiểm thử tự động (PHPUnit)** cho `AverageRangeMapper`: biên và toán tử, thứ tự và chồng lấn, thiếu trung bình, ô trống và 0, không khớp điều kiện, nhiều khoảng.

**Kiểm thử thủ công** theo `unit-testing.md` (chuẩn bị dữ liệu qua giao diện, có ảnh chụp bằng chứng):

| Nhóm | Ca chính |
| --- | --- |
| Ví dụ của khách | Trung bình 49, điểm 85 → 5; trung bình 60,4, điểm 85 → 3; trung bình 60, điểm 30 → 1; trung bình 70, điểm 70 với điều kiện cuối `<65` → trống và xóa kết quả cũ. |
| Mục số chỉ 1, 3, 5 | Giới hạn 1–5 giữ nguyên, 2 và 4 không xuất hiện. Nếu giới hạn hiệu lực bị đổi thành 4 thì kết quả 5 thành 4. |
| Mục lựa chọn | Kết quả A/B/C và `(空欄)` (trống). Cột lưu theo tên (`rating_late_age_text`) lưu đúng tên. |
| Thiếu dữ liệu | Chưa chạy **集計実行** (chạy tổng hợp); học sinh ngoài nhóm; mẫu số 0 → trống. Điểm cá nhân trống → trống; điểm 0 vẫn được xét. |
| Lưu và mở lại | Giữ thứ tự, toán tử, giá trị. Đổi tên thiết lập thứ hạng thì có cảnh báo. Thêm/xóa khoảng và cột giữ đúng chỉ số. |
| Danh sách và ưu tiên | Tóm tắt đúng; nút thứ tự ▲▼ và xóa chạy đúng; tương tác với **全員が対象** (mọi học sinh là đối tượng) và các dòng thiết lập khác. |
| Lịch sử | Khớp Figma 03, tô đúng khoảng và điều kiện, cảnh báo khi cấu hình đã đổi sau lần tính, escape XSS. |
| Các đường gọi | **自動算出実行** (chạy tính điểm tự động), lưu điểm, nhập CSV, chạy hàng loạt, liên kết quản lý thi và chấm điểm cho kết quả giống nhau. |
| Khác | Kế thừa năm học; ô nhập tay bị bỏ qua; chỉ dùng bản chốt, chưa chốt/gỡ chốt thì trống và không giữ giá trị cũ (xác nhận 19/10/2026), chỉ chạy tổng hợp lại thì kết quả cũ giữ nguyên; hồi quy các loại đăng ký cũ và dữ liệu Uenomiya. |
| Q4 | Sau khi tính, xem **度数分布表・グラフ** (bảng và biểu đồ phân bố tần suất) ở trích xuất thành tích với **評価項目の値の表示単位** (đơn vị hiển thị giá trị mục đánh giá) bằng 1 và 10, cho mục số và A/B/C; ghi nhận kết quả trống. |

## 11. Điểm cần chốt (kèm đề xuất)

| # | Vấn đề | Đề xuất |
| --- | --- | --- |
| D1 | Cận trên có bắt buộc không? Context ghi cận thứ hai tùy chọn, Figma luôn điền cả hai. | Tùy chọn: để trống giá trị cận trên thì không xét cận trên. |
| D2 | Ô điều kiện để trống hoàn toàn (do lưới dùng chung số cột). | Trống hoàn toàn thì bỏ qua; nhập dở thì báo lỗi. Cần chủ thiết kế xác nhận. |
| D3 | Danh sách Figma ghi **未満** (dưới) ở cận trên và điều kiện cá nhân, còn màn sửa và lịch sử dùng **より小さい** (nhỏ hơn). RA-001 chủ ý tránh **未満**. | Thống nhất một cách ghi với chủ thiết kế. |
| D4 | Ô kết quả **trống** hiện không mở được lịch sử (kiểm tra `checkPostData` từ chối giá trị rỗng); học sinh không khớp setting nào cũng không có log. Figma 03 chỉ vẽ trường hợp khớp. | v1 giữ nguyên, nhưng vẫn ghi `blank_reason` vào log để bật sau. |
| D5 | Tự chạy lại khi trung bình hoặc bảng đổi (yêu cầu gốc). | Không tự kích hoạt; vận hành là **集計実行** → **自動算出実行**, như RA-001. Hiện không có đường nào chạy AutoRating sau tổng hợp thứ hạng, và thêm hook dễ tạo vòng lặp vì batch AutoRating lại xếp lịch tổng hợp thứ hạng. |
| D6 | `auto_rating_detail_conf.average_round_type` (trung bình trước hay sau làm tròn) hiện là code chết. | EM-001 luôn dùng trước làm tròn, không nối cài đặt này. |
| D7 | Mục nhận thuộc thời kỳ **単元** (kiểm tra theo đơn vị bài học). | Cho phép như ánh xạ hiện có và test ở trường dùng tính năng này; nếu rủi ro thì vô hiệu radio ở v1. |
| D8 | CSRF: `regist_formula` chưa có trong `$csrf_include_uris` (form đã gửi token). | Cân nhắc thêm như việc hardening riêng; không bắt buộc cho EM-001. |

## 12. Rủi ro, rollback và ước lượng

**Rủi ro và rollback:**

- **Rollback code là điểm nguy hiểm nhất.** Constructor `m_AutoRatingConfItemRegistType` kiểm `in_array` trên `REGIST_TYPES`. Nếu setting loại 9 đã lưu mà code bị rollback, `resolveByConfId` ném exception cho **cả conf**. Trước khi rollback phải xóa hoặc đặt lại các setting loại 9 ở môi trường đó.
- Xung đột merge giữa RA-001 và RC-001 (mục 3). Nhánh từ `master` giảm rủi ro này bằng cách chỉ thêm file mới và không sửa hàm của RA-001.
- **Bản tạm bị bỏ quên:** nếu phát hành khi bản tạm vẫn còn, trung bình chỉ đọc bảng bản chốt của bản tạm, chưa lọc khối và chưa theo mẫu số của RA-001, hai chức năng có thể ra số khác nhau. Không phát hành EM-001 trước khi bước 3b hoàn tất; ghi bước 3b vào checklist PR.
- Nếu RA-001 đổi chữ ký hoặc hành vi của `RankingAverageReader` trước khi merge, adapter ở bước 3b phải cập nhật theo.
- Trung bình đọc từ lần tổng hợp thứ hạng gần nhất; ở luồng lưu điểm, AutoRating chạy trước rồi mới xếp lịch tổng hợp thứ hạng. Số có thể cũ nếu chưa chạy lại tổng hợp; lịch sử hiện không cảnh báo điều này.
- Tham chiếu bằng tên: đổi tên thì mất tham chiếu (có cảnh báo khi mở lại).
- `auto_rating_log.detail_log` là TEXT (tối đa 64KB); chỉ lưu nhãn gọn.
- Q4: từ kiểm tra trên staging của nhóm, bảng phân bố không có hàng cho ô trống nên tổng có thể nhỏ hơn sĩ số lớp. Đây là hành vi của code hiện có, không phải lỗi của EM-001; cần ghi rõ trong tài liệu gửi khách.

**Ước lượng đề xuất** (ước lượng 13–20,5 ngày công cũ trong context không còn áp dụng cho phạm vi này):

| Phần | Ngày công (ước) |
| --- | --- |
| Backend (bước 2–3) và kế thừa năm học (bước 7) | khoảng 5; thêm khoảng 1 cho bản tạm và bước 3b |
| Giao diện (bước 4–6) | khoảng 6 |
| Kiểm thử và bằng chứng | khoảng 3 |
| Tổng | khoảng 14 (12–18) |

Có thể chia hai người sau khi chốt schema JSON: backend (bước 2–3, 7) và giao diện (bước 4–6) chạy song song.

## 13. Giao hàng và tài liệu cần cập nhật

- Quy trình nhánh và PR của ứng dụng theo [GitHub PR](../../../rules/development/github-pr.md) và [development flow](../../../rules/development/development-flow.md); bàn giao QA theo [QA request](../../../rules/development/qa-request.md).
- Sau khi triển khai, cập nhật [context](../CONTEXT.md), [đặc tả](../docs/specification.vi.md) và [nội dung màn hình](../docs/screen-definition.vi.md) để ghi nhận Figma và các quyết định D1–D8 (hiện context còn ghi chưa có Figma). Cập nhật cả bản tiếng Nhật tương ứng.
- Sau khi yêu cầu và thiết kế hoàn tất, chuẩn bị tài liệu tổng quan tương tự chức năng điểm đỏ theo yêu cầu của khách ([Q&A](../sources/confirmed-business-qa.vi.md)).

## 14. Giới hạn bằng chứng

Toàn bộ kết luận về code là **đọc tĩnh** ở các revision nêu đầu tài liệu; chưa chạy ứng dụng, chưa chạy SQL, chưa chạy kiểm thử. Số dòng và hành vi cần đối chiếu lại ở revision thực tế trước khi triển khai. Nội dung Figma được đọc từ bản vẽ ngày 16/10/2026; mock không vẽ trạng thái lỗi và không phân biệt dropdown với ô số. Quy tắc trong bảng ở mục 4 chỉ kế thừa hoặc diễn giải, không phải xác nhận mới của khách.

## 15. Phụ thuộc và cách tránh xung đột với PR #57058 (ghi nhận 20/10/2026)

PR [#57058](https://github.com/ednity/school-web/pull/57058) 「順位集計結果の確定・順位連動設定」(WIP, nhánh `feature/225156_grade_calc_fix`) thêm chức năng chốt kết quả 順位集計 và loại đăng ký **順位連動設定 = 8**. Hệ quả cho EM-001:

| Nội dung | Quyết định |
| --- | --- |
| Mã loại đăng ký | EM-001 nhường mã `8` và dùng **`9`**. Không cần đổi dữ liệu thật vì EM-001 chưa phát hành; dữ liệu test local đã chuyển 8 → 9 |
| Nguồn bản chốt | Đọc bảng `grade_calc_fix_each_sub_subject_{logs,total,ranks}` của PR, chỉ với khối/học kỳ/thời kỳ có dòng `grade_calc_fix_log` `active = 1`. Gỡ chốt thì PR xóa dòng `fix` nên không còn kết quả (trống) |
| Môi trường chưa có bảng của PR | Thiếu `grade_calc_fix_log`, `..._logs` hoặc `..._total` thì coi là chưa có bản chốt và trả trống, **không báo lỗi** |
| Tránh xung đột file | Các file chung với PR (`m_AutoRatingConfItemRegistType`, `AutoRatingConfItem`, `Methods`, `AutoRatingConfItemRepository`, `AutoRatingConfController`, `edit.php`, `edit_formula.php`, `GradeCalcResultService`) được sửa ở vị trí không kề dòng PR sửa, và `AutoRatingConfItem` không thêm tham số constructor mà dùng `setAverageRange()` sau khi tạo. Đã mô phỏng merge với đầu PR (`6d3f27d`) bằng `git merge-tree`: không có xung đột |
| Còn lại | PR chưa merge và đang là WIP; kiểm lại merge-tree khi PR đổi. Cần quyết định có giới hạn loại 9 theo `school_grade_conf.use_relative_evaluation` như 順位連動設定 hay không (chưa làm) |

### 15.x. Bổ sung sau review (20/10/2026)

- **Khóa theo khối:** kết quả đã chốt có khóa "学年毎" trùng nhau giữa các khối, nên `AutoRating` lấy theo từng khối (`hr_grade`) và `AverageRangeSourceStub` nhận mảng `[hr_grade => kết quả]`, tra theo `hr_grade` của học sinh. Có test cho nhóm nhiều khối. Khi thay stub bằng bộ đọc chung của RA-001, bộ đọc đó cũng phải tra theo khối của học sinh.
- **Cấu hình thiếu `sub_subject_avg`:** bỏ qua việc thu thập học kỳ/thời kỳ (không phát sinh warning); ô kết quả để trống.
- **Hiển thị danh sách cài đặt (`edit.php`):** mọi giá trị của nhánh loại 9 đều qua `html_escape`.
- **Còn mở:** `RankingAverageReader` (RA-001) phải đổi sang "chỉ đọc kết quả đã chốt" khi được đưa vào; điều kiện `use_relative_evaluation`, F-08, F-09 chờ chủ sở hữu quyết định.

### 15.y. Sửa theo feedback review commit `344d71b2221` (20/10/2026)

| # | Mức | Nội dung | Cách xử lý |
| --- | --- | --- | --- |
| 1 | Cao | Kỳ 単元: 順位集計 tạo 1 log cho mỗi 単元, nhưng hàm đọc không lọc `tangen_id` và key chỉ theo môn nên các 単元 ghi đè nhau | `getEachSubSubjectTotalResult` có tham số `$tangen_ids` (`null` = hành vi cũ, không đổi key). Khi là mảng thì lấy `log.tangen_id` và thêm `tangen_id` làm key ngoài cùng (mảng rỗng = tất cả 単元). `AutoRating` lấy tất cả 単元 theo từng khối; `AverageRangeSourceStub` nhận thêm ID kỳ 単元: nếu kỳ nguồn là 単元 thì dùng 単元 đang tính (`$tangen_id`), kỳ khác dùng `tangen_id = 0` |
| 2 | Trung bình | Giá trị đăng ký chưa kiểm theo mục nhận (số 1–5 vẫn lưu được 6; mục số vẫn nhận số lẻ) | `validateRanges` nhận thêm `$save_value_limits` (`min`, `max`, `integer`): báo lỗi khi lưu nếu ngoài min/max hoặc là số lẻ ở mục số (数値入力). Mục thập phân (小数入力) chỉ kiểm min/max |
| 3 | Thấp | `count(*)` + `LEFT JOIN ranks` + `GROUP BY ranks.…log_id`: log không có dòng ranks bị gộp vào nhóm NULL và đếm 1 | Chỉ ở đường đọc bản chốt: `COUNT(ranks.…log_id)` và `GROUP BY log.id`. Đường đọc kết quả mới nhất (mã cũ) giữ nguyên để không ảnh hưởng chức năng khác |
| 4a | Thấp | `REGIST_TYPE_AVERAGE_RANGE = 9` bỏ qua số 8 | Giữ 9. Số 8 đã được PR #57058 dùng cho `REGIST_TYPE_RANK_LINK`, nên EM-001 nhường để không trùng khi PR vào `master` (master và RA-001 hiện chưa dùng 8) |
| 4b | Thấp | `average_range_source` / `average_range_mapper` chưa khai báo property | Đã khai báo `protected`; `unset` ở cuối xử lý đổi thành gán `null` |

Kiểm tra: unit test (mapper 24, stub 9, AutoRating 11, service 11) và `spec_matrix` 43/43 đều đạt; trên MySQL local với bảng mô phỏng PR, 単元 7 (50 ÷ 2) và 単元 8 (29 ÷ 1) được tách riêng, lọc `[7]` chỉ trả 単元 7, chưa chốt thì trống; tính tự động kỳ thường cho kết quả giống trước khi sửa. Chưa kiểm tra bằng bảng PR #57058 thật và chưa chạy E2E trọn vẹn một nhóm 単元 qua màn hình.

### 15.z. Bổ sung nguồn `授業平均` (trung bình theo tiết học) — phản hồi test TC-EM-UI-002 (21/10/2026)

- **Nguyên nhân:** ô chọn nguồn của EM-001 dựng từ danh sách dùng chung với công thức hiện có (`getSubSubjectAvgForFormula`) chỉ có 学年平均, HR平均, nhóm thứ hạng và nhóm kết hợp; không có `授業平均` dù thiết lập 順位集計 đã bật tổng hợp theo tiết học (`use_calc_group = 1`). RA-001 (Q5 đã xác nhận 12/10) đã gồm `授業平均` và EM-001 kế thừa quy tắc nguồn này, nên đây là chức năng còn thiếu, không phải khác biệt thiết kế.
- **UI:** thêm `授業:授業平均` ngay sau HR平均 khi `use_calc_group = 1` (chỉ trong ô chọn của EM-001, không đổi danh sách dùng chung). Lưu dạng `{学期},{時期},授業`; kiểm tra khi lưu dùng cùng danh sách nên giá trị này hợp lệ.
- **Bộ đọc:** `GradeCalcResultService::getFinalizedEachGroupTotalResult` đọc bảng bản chốt theo tiết học (`grade_calc_fix_each_group_logs/total/ranks`), chỉ với khối/học kỳ/thời kỳ có `grade_calc_fix_log.active = 1`, lọc theo `group_id` của tiết đang tính và môn của tiết; mẫu số = `COUNT` dòng ranks (không dùng `examinees`); thiếu bảng thì trả trống. Kết quả tách theo khối của học sinh. `AverageRangeSourceStub` dùng kết quả này khi nguồn là `授業`.
- **Kỳ 単元:** theo RA-001, `授業平均` không có trung bình theo đơn vị, nên chọn kỳ 単元 thì coi như thiếu trung bình (ô trống).
- **Kiểm tra:** test đơn vị (stub 11, service 14) đạt; trên MySQL local với bảng mô phỏng PR (`use_calc_group` bật tạm): chưa chốt → ô trống, đã chốt → trung bình = 62 ÷ 3 = 20,6667 của đúng tiết và range được chọn, chưa chốt lại → ô trống. Đã khôi phục cấu hình/dữ liệu local sau test. Chưa kiểm tra bằng bảng PR #57058 thật.
- **Hạn chế:** nếu có nhóm thứ hạng tên đúng là `授業` thì trùng với nguồn này (khóa lưu theo tên).

### 15.w. Ba case còn lại trong phản hồi test (chưa xử lý, 21/10/2026)

| Case | Đánh giá | Hướng |
| --- | --- | --- |
| TC-EM-FUNC-002 (ô chưa dùng hiện A) | Đúng như mô tả: ô không có ngưỡng được coi là chưa dùng, không lưu; khi dựng lại bảng ô lấy lựa chọn mặc định A. Không mất dữ liệu hợp lệ | Cân nhắc hiển thị ô chưa dùng ở trạng thái trống; đổi kỳ vọng test nếu giữ nguyên |
| TC-EM-CALC-003 (không mở lịch sử ô trống) | Hạn chế sẵn có của màn lịch sử (nút không có nội dung) ở ô trống; không phải lỗi tính | Tách issue UI riêng |
| TC-EM-ERR-001 (nhóm mới trùng tên thay nhóm đã xóa) | Tham chiếu lưu bằng tên (giống các nguồn hiện có), nên thấy nhóm mới cùng tên; giữ theo ID chưa có trong spec | Cần quyết định có lưu ID nhóm hay không; tách khỏi case xóa nguồn |

### 15.v. Sửa TC-EM-FUNC-002: ô điều kiện chưa dùng hiện trống (21/10/2026)

- **Nguyên nhân:** với mục dạng chọn, ô giá trị đăng ký luôn có một lựa chọn được chọn sẵn (A), nên `normalizeRanges` chỉ dựa vào ngưỡng trống để bỏ ô chưa dùng; khi dựng lại bảng ô lấy lựa chọn đầu (A). Hệ quả phụ: hàng đã chọn giá trị nhưng để trống ngưỡng bị bỏ im lặng, trái với D2 (ô nhập dở phải báo lỗi).
- **Cách sửa:** ô giá trị đăng ký của mục dạng chọn có thêm lựa chọn đầu "選択してください" (giá trị rỗng) làm mặc định, tách biệt với "(空欄)" (giá trị `null`, là giá trị đăng ký hợp lệ). `normalizeRanges` chỉ bỏ điều kiện khi cả ngưỡng và giá trị đăng ký đều chưa nhập (rỗng); điều kiện nhập dở được giữ lại và `validateRanges` báo lỗi (ví dụ 「範囲3 条件4 個人点の値を入力してください」). Tham số `$save_value_choices` của `normalizeRanges` không còn dùng nên đã bỏ.
- **Kiểm tra:** unit test (mapper) đạt. Trên localhost: cột điều kiện mới mặc định "選択してください"; lưu ô 空欄 ở range 1–2 và để range 3 chưa dùng → mở lại giữ `null` ở range 1–2 và trống ở range 3 (không còn hiện A); chọn giá trị nhưng bỏ trống ngưỡng → báo lỗi, không lưu. Đã trả cấu hình test về 3 điều kiện mỗi range.
