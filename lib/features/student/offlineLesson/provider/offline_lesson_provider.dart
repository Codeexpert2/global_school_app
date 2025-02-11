import 'package:global_school/core/pagination/models/pagination_state.dart';
import 'package:global_school/core/pagination/notifiers/paginated_list_notifier.dart';
import 'package:global_school/features/student/offlineLesson/model/offline_lesson_model.dart';
import 'package:global_school/features/student/offlineLesson/service/offline_lesson_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:global_school/core/client/client.dart';

final offlineLessonServiceProvider = Provider<OfflineLessonService>((ref) {
  final apiClient = ref.watch(clientProvider);
  return OfflineLessonService(apiClient);
});

final offlineLessonSearchProvider = StateProvider<String>((ref) => '');

// Create the products provider using PaginatedListNotifier
final offlineLessonsProvider = StateNotifierProvider.autoDispose<
    PaginatedListNotifier<OfflineLesson>, PaginationState<OfflineLesson>>(
  (ref) {
    final offlineLessonService = ref.watch(offlineLessonServiceProvider);
    final query = ref.watch(offlineLessonSearchProvider);

    return PaginatedListNotifier<OfflineLesson>(
      fetchData: (int page) async {
        return offlineLessonService.getOfflineLessons(
          query: query,
          page: page,
        );
      },
    );
  },
);

final offlineLessonDetailsProvider =
    FutureProvider.family<OfflineLesson, String>((ref, id) async {
  final offlineLessonService = ref.watch(offlineLessonServiceProvider);
  return await offlineLessonService.getOfflineLessonById(id);
});
