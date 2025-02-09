// final recordedLessonServiceProvider = Provider<RecordedLessonService>((ref) {
//   final apiClient = ref.read(clientProvider);
//   return RecordedLessonService(apiClient);
// });
// final recordedLessonProvider = FutureProvider<RecordedLessonModel>((ref) async {
//   final service = ref.read(recordedLessonServiceProvider);
//   return service.getRecordedLessons();
// });
import 'package:global_school/core/client/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:global_school/features/student/lessons/recorded_lesson/service/recorded_lesson_service.dart';
import 'package:global_school/features/student/lessons/recorded_lesson/model/recorded_lesson_model.dart';

final recordedLessonServiceProvider = Provider<RecordedLessonService>((ref) {
  final apiClient = ref.read(clientProvider);
  return RecordedLessonService(apiClient);
});

final recordedLessonProvider =
    FutureProvider.family<RecordedLesson, String>((ref, subjectId) async {
  final service = ref.read(recordedLessonServiceProvider);
  return service.getRecordedLessons(subjectId);
});
