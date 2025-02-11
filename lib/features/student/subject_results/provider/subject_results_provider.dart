import 'package:global_school/core/client/client.dart';
import 'package:global_school/core/pagination/models/pagination_state.dart';
import 'package:global_school/core/pagination/notifiers/paginated_list_notifier.dart';
import 'package:global_school/features/student/subject_results/model/subject_results_model.dart';
import 'package:global_school/features/student/subject_results/service/subject_results_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final apiClientProvider = Provider<ApiClient>((ref) => ApiClient());

final subjectResultsServiceProvider = Provider<SubjectResultsService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return SubjectResultsService(apiClient);
});
final subjectResultsSearchProvider = StateProvider<String>((ref) => '');

final subjectResultsProvider = StateNotifierProvider.autoDispose.family<
    PaginatedListNotifier<Subjectresults>,
    PaginationState<Subjectresults>,
    String>(
  (ref, subjectId) {
    final subjectResultsService = ref.watch(subjectResultsServiceProvider);
    final query = ref.watch(subjectResultsSearchProvider);

    return PaginatedListNotifier<Subjectresults>(
      fetchData: (int page) async {
        return subjectResultsService.fetchSubjectResults(
          query: query,
          page: page,
          subjectId: subjectId,
        );
      },
    );
  },
);


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