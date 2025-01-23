import 'package:global_school/features/student/onlineLesson/model/online_lesson_model.dart';
import 'package:global_school/features/student/onlineLesson/service/online_lesson_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:global_school/core/client/client.dart';

// Provider للـ Service
final onlineLessonServiceProvider = Provider<OnlineLessonService>((ref) {
  final apiClient = ref.watch(clientProvider);
  return OnlineLessonService(apiClient);
});

// Provider للحصول على جميع الدروس
final onlineLessonProvider = FutureProvider<OnlineLessonModel>((ref) async {
  final onlineLessonService = ref.watch(onlineLessonServiceProvider);
  return await onlineLessonService.getOnlineLessons();
});

// Provider للحصول على تفاصيل درس معين
final onlineLessonDetailsProvider = FutureProvider.family<OnlineLessonModel, int>((ref, id) async {
  final onlineLessonService = ref.watch(onlineLessonServiceProvider);
  return await onlineLessonService.getOnlineLessonById(id);
});