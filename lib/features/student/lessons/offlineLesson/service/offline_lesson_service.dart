import 'package:global_school/core/client/client.dart';
import 'package:global_school/features/student/lessons/offlineLesson/model/offline_lesson_model.dart';

class OfflineLessonService {
  OfflineLessonService(this._apiClient);
  final ApiClient _apiClient;

  Future<List<OfflineLessonModel>> getOfflineLessons() async {
    try {
      final response = await _apiClient.get('/student/offline-lesson');
      final data = OfflineLessonListResponse.fromJson(response.data['data']);
      return data.lessons;
    } catch (e) {
      throw Exception('Failed to fetch offline lessons: $e');
    }
  }

  Future<OfflineLessonModel> getOfflineLessonById(int id) async {
    try {
      final response = await _apiClient.get('/student/offline-lesson/$id');
      return OfflineLessonModel.fromJson(response.data['data']);
    } catch (e) {
      throw Exception('Failed to fetch offline lesson details: $e');
    }
  }
}
