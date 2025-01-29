import 'package:global_school/core/client/client.dart';

import '../model/offline_lesson_model.dart';

class OfflineLessonService {
  OfflineLessonService(this._apiClient);
  final ApiClient _apiClient;

  Future<OfflineLessonModel> getOfflineLessons({
    String query = '',
    int page = 1,
    int perPage = 10,
  }) async {
    try {
      final response = await _apiClient.get(
        '/student/offline-lesson',
        queryParameters: {
          'query': query,
          'page': page.toString(),
          'per_page': perPage.toString(),
        },
      );
      final data = OfflineLessonModel.fromJson(response.data);
      return data;
    } catch (e) {
      throw Exception('Failed to fetch offline lessons: $e');
    }
  }

  Future<OfflineLesson> getOfflineLessonById(String id) async {
    try {
      final response = await _apiClient.get('/student/offline-lesson/$id');
      return OfflineLesson.fromJson(response.data['data']);
    } catch (e) {
      throw Exception('Failed to fetch offline lesson details: $e');
    }
  }
}
