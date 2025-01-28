import 'package:global_school/core/client/client.dart';
import 'package:global_school/features/student/recorded_lesson/model/recorded_lesson_model.dart';
import 'package:global_school/features/student/recorded_lesson/service/recorded_lesson_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final recordedLessonServiceProvider = Provider<RecordedLessonService>((ref) {
  final apiClient = ref.read(clientProvider);
  return RecordedLessonService(apiClient);
});
final recordedLessonProvider = FutureProvider<RecordedLessonModel>((ref) async {
  final service = ref.read(recordedLessonServiceProvider); 
  return service.getRecordedLessons();
});