import 'package:global_school/core/pagination/models/pagination_state.dart';
import 'package:global_school/core/pagination/notifiers/paginated_list_notifier.dart';
import 'package:global_school/features/student/exam/model/exam_model.dart';
import 'package:global_school/features/student/exam/service/exam_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// final examProvider = FutureProvider<ExamModel>((ref) async {
//   final examService = ref.read(examServiceProvider);
//   return examService.fetchExams();
// });

final examSearchProvider = StateProvider<String>((ref) => '');
final examProvider = StateNotifierProvider.autoDispose<
    PaginatedListNotifier<Exam>, PaginationState<Exam>>((ref) {
  final examService = ref.watch(examServiceProvider);
  final query = ref.watch(examSearchProvider);

  return PaginatedListNotifier<Exam>(
    fetchData: (int page) async {
      final res = await examService.fetchExams(query: query, page: page);
      return res;
    },
  );
});
