<!-- blend-template: code-review@1.0.0 -->
# Review triển khai — RC-001 Điểm đỏ（赤点）

## Kết luận và căn cứ review

**Kết luận:** Chưa nên merge hoặc release branch được review. Review xác nhận sáu lỗi High và hai gap Medium; năm behavioral candidates đã qua Hunter → Skeptic → Referee độc lập và đều được kết luận `REAL_BUG`.

| Trường | Căn cứ đã kiểm tra |
| --- | --- |
| Danh tính | Feature `RC-001`, nguồn Sheet; phạm vi feature là cấu hình điều kiện Điểm đỏ（赤点）và dùng chung kết quả tại Trích xuất thành tích（成績抽出）, Công khai thành tích（成績公開） và Công cụ phiếu điểm（通知表ツール）. Chưa có Redmine/Task ID cụ thể được xác minh cho commit này. Authority hiện tại là [CONTEXT](../CONTEXT.md), [Q&A đã xác nhận](../sources/confirmed-business-qa.vi.md) và AC v2. |
| Nguồn và revision plan | `blend-context` revision `894ec4247bc78b9c777c6e5a1cc8482d28f162ca`; CONTEXT SHA-256 `75d405e121008e41e6dc41707a2c2b525f44133fdc5565e567e8a7ae8879c29e`; confirmed Q&A SHA-256 `179996ea8bf8afe240c48ff5dd80e02ae89f9398e715d0c3d2881c4a0f76d6ad`; [AC v2](v2/acceptance-criteria.vi.md) SHA-256 `02d9caebf49762d94d89baba7d1bfea52a866b27624becfbef237a90162ed6be`; [Test Spec hiện hành](v2/test-spec/README.md) chưa thực thi. Không tìm thấy implementation plan đã duyệt, nguồn/role/ngày duyệt implementation hoặc lát cắt release cuối cùng; review verdict không thay cho approval. |
| Base và head | Application repository `blend`; verified merge-base `4a82fb34e7a947d248ce6be4c32884d594c68f10`; head `32d8e8e86cff81f6de9b74d781a4e9fb3bf63e90`; range review là merge-base → head, gồm đúng một commit `Add red score setting, judgment, and publish/extract/report integration`. |
| Danh tính working bytes | Application worktree sạch: không staged, unstaged hoặc untracked application bytes. Các file quyết định đã capture read-only; ví dụ `blend:application/domain/service/RedScoreJudge.php` SHA-256 `4aca02dd2f5ee89e5b0ff8e8f87d2d46bd4a13f0449f1f115043ee633810533b` và `blend:application/controllers/grade_report_setting/manage/RedScoreSettingController.php` SHA-256 `6d570f57ba61c4f76f7914e82dcf8608681239fe35424934bb6bf63a265079f1`. Thay đổi cục bộ tại workbook Test Spec của documentation repository không được dùng làm implementation proof. |

## Phạm vi dự kiến, thay đổi thực tế và kiểm tra

Phạm vi nghiệp vụ dự kiến: Cấu hình nhiều rule theo ưu tiên; bộ lọc đối tượng và điều kiện nguồn tổng hợp; fixed/rate/formula threshold; xét sau các đường ghi điểm và batch; lưu một kết quả hiện hành dùng chung cho ba đầu ra; bảo toàn legacy, quyền trường/năm/người dùng, trạng thái khi xóa điểm/rule và thứ tự ghi đồng thời. CONTEXT vẫn ghi rõ danh sách triển khai/phát hành cuối cùng chưa được chốt; do đó review kiểm các AC mà branch đã hiện thực hoặc tuyên bố tích hợp, không suy toàn bộ thiết kế đã được duyệt release.

Thay đổi thực tế: 39 file, khoảng 5.182 dòng thêm và 14 dòng xóa. Diff gồm hai migration, hai model mới, rule engine mới, controller/views cấu hình mới, hook trong AutoRating, reader nguồn tổng hợp, cấu hình Trích xuất thành tích（成績抽出）, Công khai thành tích（成績公開）, Công cụ phiếu điểm（通知表ツール） và thay đổi shared `system/core/Security.php`. Có thêm sửa bảo vệ chia cho 0 ở layout report ngoài root feature chính.

Inventory kiểm tra: Đã đọc toàn bộ 39 file/hunk bằng Git diff và `srcwalk review`; kiểm source trực tiếp các seam entry/route → validation/authorization → settings/source → score write → result persistence → extraction/publish/report consumers; mở rộng tới exam-link, AutoRatingBatch, producer GradeCalc, copy template và read-replica/transaction helpers. Codebase Memory index khớp root/head nhưng nhiều affected paths báo `metadata_changed`, riêng `application/domain/tmp` bị exclude; graph chỉ được dùng discovery, không dùng để kết luận không có caller/impact. Không có assigned file/hunk bị bỏ đọc.

Findings trước: Đây là review implementation đầu tiên; không có prior finding IDs hoặc prior report revision để lập ledger.

## Findings và đề xuất cập nhật

### BH-001 — Liên kết điểm thi và batch có thể bỏ qua hoàn toàn bước xét đỏ

Finding ID: `BH-001`

Yêu cầu: [AC-G23 — Bao phủ đường đăng ký và chạy lại](v2/acceptance-criteria.vi.md) và Q11 yêu cầu nhập trực tiếp, CSV, liên kết điểm thi và batch đều xét Điểm đỏ（赤点）, kể cả khi AutoRating không áp dụng hoặc thiếu option của AutoRating.

Invariant: Sau khi một đường ghi điểm được hỗ trợ lưu điểm cuối thành công, các ô liên quan phải được xét hoặc chuyển trạng thái hiện hành phù hợp; eligibility của AutoRating không được loại bước xét đỏ.

Bằng chứng: `RedScoreJudge::judgeGroup()` chỉ được gọi từ `blend:application/domain/tmp/AutoRating.php:571-580`. Exam-link ghi grade tại `blend:application/blend/GradeExam/Service/ScoringResultService.php:654-656` nhưng `continue` trước `calc()` khi `createArgument()` loại group tại `:661-676`. `AutoRating::createArgument()` loại group ở `blend:application/domain/tmp/AutoRating.php:272-307`; batch chỉ chạy danh sách còn lại tại `blend:application/controllers/batch/grade/AutoRatingBatch.php:140-193`.

Actor và trigger: Người dùng liên kết kết quả chấm thi, hoặc người có quyền chạy batch trên group không có dữ liệu AutoRating/thiếu option bắt buộc; việc ghi điểm hoàn tất nhưng group bị loại trước `AutoRating::calc()`.

Expected và actual: Expected là xét đỏ theo điểm cuối hoặc lưu `no_score`/`not_applicable` đúng trạng thái. Actual là không có call xét đỏ trên hai nhánh bị loại.

Tác động: Kết quả đỏ cũ có thể tiếp tục được dùng hoặc ô không có kết luận mới; cả ba đầu ra đọc cùng dữ liệu sai/stale đó.

Counter-evidence: Nhập trực tiếp và CSV đi qua `AutoRating::calc()`; exam-link/batch cũng đúng khi group vượt qua guard. Counter-evidence này không bảo vệ các nhánh bị loại trước hook.

Đề xuất cập nhật: Đặt một hook dùng chung tại seam sau khi lưu điểm thành công, độc lập với eligibility của AutoRating; tái sử dụng hook cho direct, CSV, exam-link và batch thay vì vá từng consumer đầu ra. Giữ transaction hiện hành và không mở rộng sang lớp/ô không liên quan.

Kiểm chứng sau sửa: Chạy từng đường direct, CSV, exam-link và batch với no-AutoRating, missing-option, manual score và delete-score; đọc lại grade/result và ba consumer. Runtime proof hiện chưa được cung cấp.

Phạm vi: `IN_SCOPE` — nghĩa vụ trực tiếp của AC-G23.

Origin: `INTRODUCED` — branch mới chỉ gắn hook tại `AutoRating::calc()`.

Severity: `High`.

Confidence: Cao; caller/guard và đường skip đã được Hunter, Skeptic và Referee đọc trực tiếp.

Ảnh hưởng hoàn thành: `Task blocker` và `Regression blocker` vì một đường ghi được giao có thể hoàn tất với kết quả đỏ không cập nhật.

Giới hạn: Static source proof; chưa chạy app/batch hoặc quan sát DB.

### BH-002 — Bộ lọc curriculum được lưu nhưng bị bỏ qua khi xét

Finding ID: `BH-002`

Yêu cầu: AC-G03/G05 yêu cầu nhận diện đúng đối tượng và áp dụng AND giữa các loại filter.

Invariant: Khi rule chọn curriculum cụ thể, group/unit thuộc curriculum khác không được khớp chỉ vì cùng subject/sub-subject.

Bằng chứng: UI gửi `filter_curriculum_id[]` tại `blend:application/views/grade_report_setting/manage/red_score/_filter_row.php:28-35`; controller đọc, validate và lưu tại `blend:application/controllers/grade_report_setting/manage/RedScoreSettingController.php:482-499,630-650,893-911`. Runtime `matchFilter('subject', ...)` chỉ so `sub_subject_id` hoặc `subject_id`, không đọc `curriculum_id`, tại `blend:application/domain/service/RedScoreJudge.php:345-354`.

Actor và trigger: Rule chọn curriculum A; điểm được xét thuộc curriculum B nhưng dùng chung môn/phân môn.

Expected và actual: Expected là curriculum B không khớp. Actual là rule vẫn khớp theo môn.

Tác động: Rule ưu tiên cao áp dụng quá rộng, tạo đỏ/không đỏ sai hoặc chặn rule đúng phía dưới.

Counter-evidence: Validation ngăn curriculum thuộc môn khác; subject/sub-subject khác vẫn bị loại. Không có upstream guard thu hẹp group theo `curriculum_id` đã lưu.

Đề xuất cập nhật: Tái sử dụng mapping master/group curriculum hiện có của AutoRating/maximum resolver và thêm predicate curriculum vào `matchFilter`; không tạo mapping cạnh tranh mới.

Kiểm chứng sau sửa: Hai curriculum cùng môn, curriculum khác môn, normal/unit score và nhiều curriculum OR trong cùng loại.

Phạm vi: `IN_SCOPE` — AC-G03/G05.

Origin: `INTRODUCED` — payload/UI và evaluator mới không nhất quán.

Severity: `High`.

Confidence: Cao; source contract trực tiếp.

Ảnh hưởng hoàn thành: `Task blocker`.

Giới hạn: Chưa chạy fixture runtime có hai curriculum chung môn.

### BH-003 — Điều kiện tổng hợp dùng số đã làm tròn thay vì giá trị thô

Finding ID: `BH-003`

Yêu cầu: [AC-G14 — Giá trị thô từ cùng tập dữ liệu](v2/acceptance-criteria.vi.md) quy định chọn nhánh bằng giá trị trước làm tròn; ví dụ `49.99 < 50` phải khớp dù hiển thị 50.

Invariant: Average/group-rate dùng trong điều kiện và công thức phải là raw value của cùng snapshot, không phải presentation-rounded value.

Bằng chứng: GradeCalc tạo cả `plane_avg` và `avg`, trong đó `avg` qua `calcPrecision()`, tại `blend:application/domain/tmp/GradeCalc.php:1656-1669`; persisted total lưu `avg_score => avg`, còn `score_rate` cũng qua `calcPrecision()` tại `:1948-1961,2085-2098,2154-2172`. Reader mới chỉ select `total.avg_score`/`total.score_rate` tại `blend:application/models/GradeCalcResultEachGroupLogs_m.php:185-201` và `blend:application/models/GradeCalcResultEachSubSubjectLogs_m.php:231-275`; judge dùng trực tiếp các field này tại `blend:application/domain/service/RedScoreJudge.php:345-367,453-464`.

Actor và trigger: Nguồn raw `A=49.99`, aggregate configuration làm tròn thành 50, rule `A<50`; hoặc group-rate nằm sát biên tương tự.

Expected và actual: Expected là rule khớp theo 49.99. Actual là code so 50 và không khớp.

Tác động: Chọn sai rule đầu tiên, threshold và kết luận đỏ/không đỏ; ba đầu ra cùng nhận kết luận sai.

Counter-evidence: Tổng hợp còn lưu `total_score`, `examinees` và `max_score`, có thể dùng tái dựng raw value; reader mới hiện không select hoặc tái dựng chúng. Lỗi không biểu hiện khi rounding không đổi phía biên.

Đề xuất cập nhật: Trong một source-reader chung, tái dựng raw average/rate từ numerator/denominator của cùng snapshot hoặc đọc raw field có hợp đồng tương đương; không dùng cột đã làm tròn.

Kiểm chứng sau sửa: `49.99 < 50`, `64.99 < 65`, count/max bằng 0, bản chốt và latest aggregate.

Phạm vi: `IN_SCOPE` — AC-G14.

Origin: `INTRODUCED` — red-score reader/evaluator mới dùng cột rounded.

Severity: `High`.

Confidence: Cao; producer → persistence → reader → predicate đã được trace trực tiếp.

Ảnh hưởng hoàn thành: `Task blocker`.

Giới hạn: Chưa chạy aggregate thực tế hoặc kiểm DB precision đang deploy.

### BH-004 — Batch cũ có thể ghi kết quả dựa trên rule đã sửa hoặc xóa

Finding ID: `BH-004`

Yêu cầu: [AC-G22 — Kết quả chung và thứ tự cập nhật](v2/acceptance-criteria.vi.md) yêu cầu lượt bắt đầu trước không được ghi đè kết quả của điểm/cấu hình mới hơn.

Invariant: Kết quả chỉ được ghi nếu score generation, rule revision/order/status và source generation vẫn là revision mà lượt xét đã đọc.

Bằng chứng: Active settings chỉ load một lần trước vòng lặp tại `blend:application/domain/service/RedScoreJudge.php:66-71`. Mỗi cell chỉ lock grade và result row tại `:187-206`, rồi judge bằng settings snapshot và upsert vô điều kiện tại `:213-226`; `blend:application/models/RedScoreResult_m.php:74-109` không CAS revision/fingerprint. `makeFingerprint()` có setting timestamp nhưng không có code so sánh trước write.

Actor và trigger: Batch đang chạy; người dùng sửa/xóa/reorder rule hoặc một lượt mới hoàn tất; batch cũ tới cell muộn hơn.

Expected và actual: Expected là stale run bị từ chối hoặc đọc lại revision hiện hành. Actual là stale settings vẫn được dùng để ghi result.

Tác động: Result hiện hành có thể phản ánh rule đã xóa/cũ và được cả ba consumer dùng.

Counter-evidence: Grade được đọc lại dưới lock và unique result key ngăn duplicate; các guard này bảo vệ score race/identity tốt hơn nhưng không bảo vệ rule/source revision.

Đề xuất cập nhật: Dùng một `red_score_revision` trên owner item, tăng cùng transaction khi thêm/sửa/xóa/reorder và conditional write/CAS trên result; reload/verify revision dưới lock. Giữ Q6.2: sửa/xóa rule vẫn không vô hiệu hóa kết quả cũ trước lần xét mới thành công.

Kiểm chứng sau sửa: Two-connection tests cho edit/delete/reorder giữa load và persist, 29→40→29, first insert đồng thời và retry cùng operation.

Phạm vi: `IN_SCOPE` — AC-G22.

Origin: `INTRODUCED` — concurrency contract của settings/result mới thiếu revision guard.

Severity: `High`.

Confidence: Cao cho source-level defect; mức xác suất runtime phụ thuộc timing/isolation.

Ảnh hưởng hoàn thành: `Task blocker` và `Release risk`.

Giới hạn: Chưa chạy concurrent reproduction; chưa quan sát production isolation/locking.

### BH-005 — Fixed threshold chỉ kiểm maximum chuẩn

Finding ID: `BH-005`

Yêu cầu: [AC-G08 — Điểm cố định](v2/acceptance-criteria.vi.md)/G09 yêu cầu `0≤N≤M` đúng cho mọi target tại lúc lưu hoặc mở rộng scope.

Invariant: Một fixed threshold chỉ được active khi không vượt effective maximum của mọi group/unit/class option thuộc phạm vi rule.

Bằng chứng: Nhánh fixed chỉ gọi `numericMax($frame_item)` và so với maximum chuẩn tại `blend:application/controllers/grade_report_setting/manage/RedScoreSettingController.php:694-710,1199-1207`. Runtime có resolver chuẩn → unit override → class option override tại `blend:application/domain/service/RedScoreJudge.php:684-706`, nhưng resolver chỉ dùng cho rate threshold; fixed branch trả thẳng `N` tại `:370-378`.

Actor và trigger: Frame maximum 100, unit/class effective maximum 40, người dùng lưu fixed `N=50` áp dụng target đó.

Expected và actual: Expected là từ chối save hoặc yêu cầu thu hẹp scope. Actual là rule được active và dùng `T=50`.

Tác động: Phần lớn hoặc toàn bộ điểm hợp lệ trên thang 40 có thể bị đánh đỏ sai.

Counter-evidence: Default-only scope được kiểm; fixed threshold đúng là không cần resolve lại M trong mỗi lần xét sau khi đã lưu hợp lệ. Defect nằm ở validation lúc lưu/mở rộng.

Đề xuất cập nhật: Tái sử dụng `GradeScoreRangeService` và mapping unit/class option hiện có để validate mọi effective maximum trong scope trước khi chuyển `setting_status` sang active.

Kiểm chứng sau sửa: Default 100, unit 40, class override 50, scope hỗn hợp và mở rộng scope sau lần lưu đầu.

Phạm vi: `IN_SCOPE` — AC-G08/G09.

Origin: `INTRODUCED`.

Severity: `High`.

Confidence: Cao; save validator và runtime resolver đã được so trực tiếp.

Ảnh hưởng hoàn thành: `Task blocker`.

Giới hạn: Chưa chạy UI/runtime với fixture maximum override.

### RC-006 — Xóa dòng công thức âm thầm đổi tham chiếu sang dòng khác

Finding ID: `RC-006`

Yêu cầu: [AC-G17 — Kiểm công thức khi lưu](v2/acceptance-criteria.vi.md) cấm xóa/reorder làm tham chiếu trỏ sang công thức khác chỉ vì cùng số thứ tự.

Invariant: Operand tham chiếu dòng đã xóa phải trở thành invalid và bắt người dùng chọn lại; server không được nhận một formula đã bị client âm thầm đổi nghĩa.

Bằng chứng: `remapLineReference()` trả chuỗi rỗng khi xóa đúng dòng đang được tham chiếu tại `blend:application/views/grade_report_setting/manage/red_score/threshold.php:381-393`; `rebuildLineSelect()` sau đó để option đầu tiên được chọn và `refreshFormulaLineOptions()` ghi lại reference mới tại `:395-428,521-563`. Server chỉ thấy reference phía trước hợp lệ và lưu.

Actor và trigger: Dòng 3 tham chiếu dòng 2; người dùng xóa dòng 2 rồi lưu.

Expected và actual: Expected là báo invalid/buộc chọn lại. Actual là dòng còn lại có thể âm thầm trỏ dòng 1.

Tác động: Formula và kết quả đỏ thay đổi mà người dùng không chủ động chọn; danh sách mở lại trông hợp lệ nên khó phát hiện.

Counter-evidence: Reference lớn hơn dòng bị xóa được decrement để giữ cùng logical row khi row đó vẫn tồn tại; lỗi chỉ ở reference tới chính row bị xóa/reorder không còn hợp lệ.

Đề xuất cập nhật: Giữ operand rỗng/invalid, hiển thị yêu cầu chọn lại và để server validation từ chối; chưa cần thêm stable line-ID system nếu thao tác hiện tại chỉ hỗ trợ add/delete.

Kiểm chứng sau sửa: Test Spec `TC-RS-VAL-012`, variants `delete` và `reorder`; đọc lại JSON không được đổi sang line khác.

Phạm vi: `IN_SCOPE` — AC-G17.

Origin: `INTRODUCED`.

Severity: `High`.

Confidence: Cao; client remap và server validation đã đọc trực tiếp.

Ảnh hưởng hoàn thành: `Task blocker`.

Giới hạn: Spec/acceptance finding; chưa browser-run thao tác thực tế.

### RC-007 — Copy template phiếu điểm làm mất cấu hình hiển thị đỏ

Finding ID: `RC-007`

Yêu cầu: [AC-G37 — Lưu, sao chép và PDF phiếu](v2/acceptance-criteria.vi.md) yêu cầu giữ lựa chọn/ký tự đỏ khi mở lại hoặc sao chép template, nhưng không sao chép kết quả cá nhân.

Invariant: Template copy giữ red display option độc lập với result cá nhân; chỉ các item binding cần remap mới được xóa.

Bằng chứng: Khi `$copy_from_template=true`, `blend:application/blend/Report/Repository/ReportWidgetGradesNormalRepository.php:223-260` không đặt `save_display_option=true` cho `evaluate_item`; `display_option` trở thành NULL tại `:302`. Item binding cũng bị xóa tại `:289`.

Actor và trigger: Người cấu hình Công cụ phiếu điểm（通知表ツール）copy một template có ký tự/ngoặc đỏ.

Expected và actual: Expected là bản copy giữ red option, không copy result học sinh. Actual là toàn bộ evaluate-item display option bị bỏ.

Tác động: PDF/bản copy mất ký hiệu đỏ dù template nguồn chỉ dùng điều kiện đỏ.

Counter-evidence: Copy thường và change-year đặt `$copy_from_template=false`, nên giữ option; defect giới hạn ở template-copy path.

Đề xuất cập nhật: Carry riêng `display_option.evaluate_item.red_score` qua template copy, vẫn xóa result cá nhân và binding cần remap; không copy toàn bộ item-specific checkbox/subject option nếu chúng không portable.

Kiểm chứng sau sửa: Test Spec `TC-RS-FUNC-031`, hai template chỉ dùng red option và PDF sau remap.

Phạm vi: `IN_SCOPE` — AC-G37.

Origin: `INTRODUCED` đối với nghĩa vụ red-score mới trên seam copy có sẵn.

Severity: `Medium`.

Confidence: Cao; copy branch và persisted payload đã đọc trực tiếp.

Ảnh hưởng hoàn thành: `Task blocker` cho AC-G37.

Giới hạn: Chưa chạy copy/PDF thật.

### RC-008 — N+1 và DB work được kích hoạt cả khi chưa có cấu hình đỏ

Finding ID: `RC-008`

Yêu cầu: Development rule bắt buộc tránh N+1; Test Spec `TC-RS-REG-014` yêu cầu batch không query theo từng ô.

Invariant: No-config và non-red consumers không chịu write/query theo từng cell; configured batch dùng bounded/bulk access phù hợp.

Bằng chứng: `blend:application/domain/service/RedScoreJudge.php:97-137` lặp student × frame item × tangen; mỗi `persistCell()` lock grade, lock result và upsert tại `:192-226`. Khi settings rỗng, `judgeCell()` vẫn trả `STATUS_NOT_APPLICABLE` tại `:248-250`, nên đường AutoRating có thể ghi result cho mọi numeric cell dù trường chưa cấu hình red score. Công khai và report-card cũng load result map không điều kiện tại `blend:application/usecase/grade_setting/common/query_service/GradePublishService.php:1094` và `blend:application/blend/Report/Convert/ReportWidgetGradesNormalData.php:1488`.

Actor và trigger: Đăng ký điểm/AutoRating hoặc mở output tại trường/template không cấu hình red score; hoặc batch lớn ở trường có cấu hình.

Expected và actual: Expected là no-config short-circuit và bounded query count. Actual là tối thiểu hai SELECT + một write cho từng cell trong judge, cộng unconditional reads ở hai output.

Tác động: Tăng số query/row writes và thời gian giữ transaction trên chức năng điểm hiện có; rủi ro timeout/deadlock và tăng dữ liệu không cần thiết.

Counter-evidence: Source metrics có cache; extraction chỉ load result map khi có red-score filter. Chưa có benchmark chứng minh thời gian cụ thể.

Đề xuất cập nhật: Short-circuit khi không có active settings và không có result cũ cần invalidate; bulk-prefetch affected cells/results và upsert theo batch có giới hạn. Giữ concurrency guard của BH-004.

Kiểm chứng sau sửa: Đếm query no-config/configured batch theo `TC-RS-REG-014`, đo transaction/lock cho lớp và unit-scale đại diện.

Phạm vi: `IN_SCOPE` vì hook mới nằm trên luồng chung và test regression đã chỉ định.

Origin: `INTRODUCED`.

Severity: `Medium`.

Confidence: Cao về N+1/source path; thời gian và lock thực tế chưa đo.

Ảnh hưởng hoàn thành: `Regression blocker`.

Giới hạn: Chưa benchmark hoặc quan sát production volume.

## Luồng dùng chung và rủi ro DB

Ảnh hưởng consumer: `BH-001`–`BH-005` nằm trước hoặc tại result persistence nên ảnh hưởng đồng thời Trích xuất thành tích（成績抽出）, Công khai thành tích（成績公開） và Công cụ phiếu điểm（通知表ツール）. Direct/CSV thường tới hook, còn exam-link và một số batch guard không tới. Public/report-card phát sinh thêm result query cả khi không có red display option. Không thấy source evidence về cross-school/year exposure hoặc thiếu CSRF trong bốn route mới: controller kiểm school/year, setting ownership và routes POST đã được thêm vào CSRF include list; runtime permission/API vẫn chưa được kiểm. `RC-007` riêng ở template-copy; copy thường/change-year là counter-path đã bảo vệ.

Rủi ro DB: High và chưa đủ runtime proof. Migration hiện thực thiếu rule/cell/write generations cần cho AC-G22; schema/application naming đang drift với DB design v2; migration chưa được quan sát trên schema thật; chưa có bằng chứng volume, duplicate/NULL hiện hữu, lock duration, online-DDL, rollback, replica lag hoặc old/new-code compatibility.

### Chi tiết DB/migration (khi bị ảnh hưởng)

- Migration branch tạo `red_score_setting`/`red_score_result` số ít và `grade_publish_conf_grade_items.red_score_effect`; DB design v2 dùng `red_score_settings`/`red_score_results` và `red_score_display_type`. Tên schema là lựa chọn kỹ thuật chưa phải business approval, nhưng code và DDL release phải thống nhất trước execution.
- Branch thiếu `red_score_revision`, `cell_generation`, `write_version`, `judged_version`, `rule_revision`, `reason_code` và `judgment_context` được thiết kế để đáp ứng vòng đời và concurrency. Fingerprint hiện có không được compare trước write.
- DDL mới có BIGINT primary IDs, table/column comments, `utf8mb4_general_ci`, không FK/ROW_FORMAT và có unique result identity; các điểm này phù hợp rule chung. Tên table số ít không theo convention table số nhiều hiện hành.
- Không có backfill legacy, phù hợp yêu cầu không migrate ngưỡng cũ. Tuy nhiên chưa chứng minh copy/năm mới/import/export/restore giữ legacy và không gắn result cũ vào cell mới.
- Không có live DB read hoặc SQL execution trong review. Mọi claim về MySQL/Aurora lock, performance, rows hoặc migration duration vẫn `UNKNOWN`.

## Candidates và phân xử vai trò

RoleDisposition: Có đủ Hunter, Skeptic và Referee độc lập cho năm behavioral candidates. Mỗi role dùng cùng authority, merge-base/head và clean working identity; không có output thiếu hoặc malformed.

| candidate_id | role | run_identity | backend | independent | basis | evidence | counter_evidence | verdict | depth | limits |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `BH-001` | Hunter | `/root/hunter` completed | native collaboration agent | true | RC-001 AC-G23; base `4a82fb3`, head `32d8e8e`, clean | Sole `judgeGroup` caller và link/batch skip paths | Direct/CSV và non-skipped groups tới hook | `CANDIDATE` | direct-source | Chưa runtime |
| `BH-001` | Skeptic | `/root/skeptic` completed | native collaboration agent | true | Cùng basis | Re-read exam-link/batch guards và caller set | Hook đúng sau AutoRating với group không bị skip | `STANDS` | direct-source | Chưa runtime |
| `BH-001` | Referee | `/root/referee` completed | native collaboration agent | true | Cùng basis | Direct-source AC/caller reconciliation | Counter-path không phủ group bị loại | `REAL_BUG` | direct-source | Static proof, chưa app/batch |
| `BH-002` | Hunter | `/root/hunter` completed | native collaboration agent | true | RC-001 AC-G03/G05; cùng base/head | Form/payload lưu curriculum, evaluator bỏ qua | Subject/sub-subject guard | `CANDIDATE` | direct-source | Chưa fixture hai curriculum |
| `BH-002` | Skeptic | `/root/skeptic` completed | native collaboration agent | true | Cùng basis | Không tìm thấy upstream curriculum guard | Validation chỉ bảo vệ quan hệ dữ liệu lưu | `STANDS` | direct-source | Chưa browser/runtime |
| `BH-002` | Referee | `/root/referee` completed | native collaboration agent | true | Cùng basis | Đối chiếu form/controller/judge | Vô hại khi curriculum trống/không cạnh tranh | `REAL_BUG` | direct-source | Static proof |
| `BH-003` | Hunter | `/root/hunter` completed | native collaboration agent | true | RC-001 AC-G14; cùng base/head | Producer → rounded persistence → reader → predicate | Không lệch nếu không crossing boundary | `CANDIDATE` | direct-source | Chưa DB runtime |
| `BH-003` | Skeptic | `/root/skeptic` completed | native collaboration agent | true | Cùng basis | Raw có thể tái dựng nhưng reader không làm | `total_score`/denominator tồn tại | `STANDS` | direct-source | Chưa aggregate thật |
| `BH-003` | Referee | `/root/referee` completed | native collaboration agent | true | Cùng basis | AC-G14 và source chain trực tiếp | In-memory `plane_avg` không qua seam reader | `REAL_BUG` | direct-source | Static proof |
| `BH-004` | Hunter | `/root/hunter` completed | native collaboration agent | true | RC-001 AC-G22; cùng base/head | Settings snapshot, grade/result lock, unconditional upsert | Grade reread và unique key | `CANDIDATE` | direct-source | Chưa concurrency test |
| `BH-004` | Skeptic | `/root/skeptic` completed | native collaboration agent | true | Cùng basis | Không có reload/lock/CAS rule revision | Grade/duplicate race được bảo vệ một phần | `STANDS` | direct-source | Chưa quan sát isolation |
| `BH-004` | Referee | `/root/referee` completed | native collaboration agent | true | Cùng basis | Direct-source transaction/write inspection | Existing locks không bảo vệ rule revision | `REAL_BUG` | direct-source | Chưa two-connection repro |
| `BH-005` | Hunter | `/root/hunter` completed | native collaboration agent | true | RC-001 AC-G08/G09; cùng base/head | Fixed validator so với effective maximum resolver | Default-only scope được bảo vệ | `CANDIDATE` | direct-source | Chưa fixture override |
| `BH-005` | Skeptic | `/root/skeptic` completed | native collaboration agent | true | Cùng basis | Save path không enumerate unit/class maxima | Rate resolver đúng; fixed runtime đúng sau valid save | `STANDS` | direct-source | Chưa live data |
| `BH-005` | Referee | `/root/referee` completed | native collaboration agent | true | Cùng basis | Fixed save validation vs target override contract | Không guard nào bảo đảm mọi target M | `REAL_BUG` | direct-source | Static proof |

## Ngoài phạm vi, có sẵn và chưa rõ

- Không có finding `PRE_EXISTING` độc lập được xác nhận.
- Implementation approval và lát cắt release cuối cùng chưa tồn tại. Giới hạn `10 dòng/3 chữ số thập phân` trong code khác đề xuất `20 dòng/9+8 chữ số` của DB design; mục này giữ `UNRESOLVED / Needs evidence`, không tự gọi là business bug đã duyệt.
- Reader nguồn mới dùng `ORDER BY log.id DESC` trong khi ID được tạo bằng UUIDv1 dạng CHAR; cần xác minh ordering contract hoặc đổi sang timestamp/version rõ ràng. Chưa đưa thành finding đóng vì chưa qua role protocol/runtime schema.
- Batch per-cell rollback không trả trạng thái rõ lên caller; cần fault-injection để xác định có thể báo hoàn tất sai phạm vi. Hiện giữ `Needs evidence`.
- Chưa audit toàn bộ school-specific writers ngoài các entry paths được AC/test-spec đặt tên. Consumer phát hiện thêm phải được review trước khi tuyên bố coverage đầy đủ.
- Graph index có coverage/freshness gaps trên affected paths; các negative/exhaustive claims không dựa vào missing graph edges.

## Nghiệm thu và giới hạn bằng chứng

Kết luận độc lập: Acceptance `FAIL/BLOCKED` vì `BH-001`–`BH-005`, `RC-006` và `RC-007` vi phạm AC bắt buộc; regression `FAIL/RISK` do hook mới mở rộng query/write vào AutoRating và output hiện có; standards `FAIL` do N+1 và purpose comments thiếu ở một số method mới; DB risk `High / chưa đủ proof`; runtime/QA/release `NOT RUN / UNKNOWN`.

Giới hạn: Không có approved implementation plan/final release slice. Không chạy application tests, SQL/database, browser, API/Postman, Excel/PDF, migration hoặc release. Static source và role review không chứng minh deployment hay runtime behavior.

Checks đã chạy: `git merge-base`, commit/range/status và full diff inventory; `srcwalk guide`/`srcwalk review` cho 39 file; current-source reads và bounded callers/consumers; Hunter → Skeptic → Referee; `git diff --check` PASS; read-only SHA-256 capture cho authority và decisive code files.

Checks chưa chạy: PHP lint không chạy được vì `php` không có trong PowerShell PATH; không coi lỗi tool là PASS. Chưa chạy 216 cases/569 variants, concurrency reproduction, query-count benchmark, schema checks, UI/API/PDF/Excel/device/QA/release evidence. Test report hiện hành còn NOT RUN.

Bảo toàn: Review và report không sửa application source, không stage/commit/push, không chạy SQL hoặc external write. Giữ nguyên workbook Test Spec đang dirty và thư mục untracked ngoài phạm vi. Finding IDs, role dispositions, base/head, proposal và completion effects đã được cross-reference nhất quán; report này không tuyên bố fix, QA, approval, deployment hoặc release.
