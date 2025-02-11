// final recordedLessonServiceProvider = Provider<RecordedLessonService>((ref) {
//   final apiClient = ref.read(clientProvider);
//   return RecordedLessonService(apiClient);
// });
// final recordedLessonProvider = FutureProvider<RecordedLessonModel>((ref) async {
//   final service = ref.read(recordedLessonServiceProvider);
//   return service.getRecordedLessons();
// });
import 'package:global_school/core/client/client.dart';
import 'package:global_school/core/pagination/models/paginated_response.dart';
import 'package:global_school/core/pagination/models/pagination_state.dart';
import 'package:global_school/core/pagination/notifiers/paginated_list_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:global_school/features/student/recorded_lesson/service/recorded_lesson_service.dart';
import 'package:global_school/features/student/recorded_lesson/model/recorded_lesson_model.dart';

final recordedLessonServiceProvider = Provider<RecordedLessonService>((ref) {
  final apiClient = ref.read(clientProvider);
  return RecordedLessonService(apiClient);
});

final recordedLessonSearchProvider = StateProvider<String>((ref) => '');

final recordedLessonProvider = StateNotifierProvider.autoDispose.family<
    PaginatedListNotifier<RecordedLessonModel>,
    PaginationState<RecordedLessonModel>,
    String>(
  (ref, subjectId) {
    final recordedLessonService = ref.watch(recordedLessonServiceProvider);
    final query = ref.watch(recordedLessonSearchProvider);
    return PaginatedListNotifier<RecordedLessonModel>(
      fetchData: (int page) async {
        final PaginatedResponse<RecordedLessonModel> res =
            await recordedLessonService.getRecordedLessons(
                query: query, page: page, subjectId: subjectId);
        return res;
      },
    );
  },
);
// final recordedLessonProvider =
//     FutureProvider.family<RecordedLesson, String>((ref, subjectId) async {
//   final service = ref.read(recordedLessonServiceProvider);
//   return service.getRecordedLessons(subjectId);
// });



// final recordedLessonByIdProvider =
//     FutureProvider.family<RecordedLesson, String>((ref, lessonId) async {
//   final service = ref.read(recordedLessonServiceProvider);
//   return service.getRecordedLessons(lessonId);
// });
