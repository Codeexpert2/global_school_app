import 'package:global_school/features/student/lessons/offlineLesson/model/offline_lesson_model.dart';
import 'package:global_school/features/student/lessons/offlineLesson/service/offline_lesson_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:global_school/core/client/client.dart';

final offlineLessonServiceProvider = Provider<OfflineLessonService>((ref) {
  final apiClient = ref.watch(clientProvider);
  return OfflineLessonService(apiClient);
});

final offlineLessonProvider = FutureProvider<List<OfflineLesson>>((ref) async {
  final offlineLessonService = ref.watch(offlineLessonServiceProvider);

  final res = await offlineLessonService.getOfflineLessons();
  return res.data ?? [];
});

final offlineLessonDetailsProvider =
    FutureProvider.family<OfflineLesson, int>((ref, id) async {
  final offlineLessonService = ref.watch(offlineLessonServiceProvider);
  return await offlineLessonService.getOfflineLessonById(id);
});
