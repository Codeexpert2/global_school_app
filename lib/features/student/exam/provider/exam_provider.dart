import 'package:global_school/core/pagination/models/pagination_state.dart';
import 'package:global_school/core/pagination/notifiers/paginated_list_notifier.dart';
import 'package:global_school/features/student/exam/model/exam_model.dart';
import 'package:global_school/features/student/exam/service/exam_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// final examProvider = FutureProvider<ExamModel>((ref) async {
//   final examService = ref.read(examServiceProvider);
//   return examService.fetchExams();
// });
final examProvider = StateNotifierProvider.autoDispose.family<
    PaginatedListNotifier<Exam>,
    PaginationState<Exam>,
    String>((ref, id) {
  final examService = ref.watch(examServiceProvider);
  return PaginatedListNotifier<Exam>(
    fetchData: (int page) async {
      final res = await examService.fetchExams(page: page);
      return res;
    },
  );
});




// final onlineLessonsProvider = StateNotifierProvider.autoDispose.family<
//     PaginatedListNotifier<OnlineLesson>, PaginationState<OnlineLesson>, String>(
//   (ref, id) {
//     final onlineLessonService = ref.watch(onlineLessonServiceProvider);
//     final query = ref.watch(onlineLessonSearchProvider);

//     return PaginatedListNotifier<OnlineLesson>(
//       fetchData: (int page) async {
//         final res = await onlineLessonService.getOnlineLessons(
//           query: query,
//           page: page,
//           subjectId: id, 
//         );
//         return res;
//       },
//     );
//   },
// );