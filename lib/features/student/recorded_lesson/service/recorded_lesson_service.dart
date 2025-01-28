import 'package:global_school/core/client/client.dart';
import 'package:global_school/features/student/recorded_lesson/model/recorded_lesson_model.dart';

class RecordedLessonService {
  RecordedLessonService(this.apiClient);
  final ApiClient apiClient;

  Future<RecordedLessonModel> getRecordedLessons() async {
    final response = await apiClient.get('/student/recorded-lesson');
    return RecordedLessonModel.fromJson(response.data);
  }
}