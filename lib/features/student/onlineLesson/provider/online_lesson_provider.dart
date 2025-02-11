import 'package:global_school/core/pagination/models/pagination_state.dart';
import 'package:global_school/core/pagination/notifiers/paginated_list_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:global_school/core/client/client.dart';

import '../model/online_lesson_model.dart';
import '../service/online_lesson_service.dart';

// Provider للـ Service
final onlineLessonServiceProvider = Provider<OnlineLessonService>((ref) {
  final apiClient = ref.watch(clientProvider);
  return OnlineLessonService(apiClient);
});

final onlineLessonSearchProvider = StateProvider<String>((ref) => '');


final onlineLessonsProvider = StateNotifierProvider.autoDispose.family<
    PaginatedListNotifier<OnlineLesson>, PaginationState<OnlineLesson>, String>(
  (ref, id) {
    final onlineLessonService = ref.watch(onlineLessonServiceProvider);
    final query = ref.watch(onlineLessonSearchProvider);

    return PaginatedListNotifier<OnlineLesson>(
      fetchData: (int page) async {
        final res = await onlineLessonService.getOnlineLessons(
          query: query,
          page: page,
          subjectId: id, 
        );
        return res;
      },
    );
  },
);

// Provider للحصول على تفاصيل درس معين
final onlineLessonDetailsProvider =
    FutureProvider.family<OnlineLesson, String>((ref, id) async {
  final onlineLessonService = ref.watch(onlineLessonServiceProvider);
  return await onlineLessonService.getOnlineLessonById(id);
});
