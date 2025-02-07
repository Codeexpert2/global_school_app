import 'package:global_school/configs/app_configs.dart';
import 'package:global_school/core/client/client.dart';
import 'package:global_school/core/pagination/models/paginated_response.dart';

import '../model/offline_lesson_model.dart';

class OfflineLessonService {
  OfflineLessonService(this._apiClient);
  final ApiClient _apiClient;

  Future<PaginatedResponse<OfflineLesson>> getOfflineLessons({
    String query = '',
    int page = 1,
    int perPage = AppConfigs.perPage,
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
      return PaginatedResponse.fromJson(
        response.data,
        OfflineLesson.fromJson,
      );
    } catch (e) {
      throw Exception('Failed to fetch offline lessons: $e');
    }
  }

  Future<OfflineLesson> getOfflineLessonById(String id) async {
    try {
      final response = await _apiClient.get('/student/offline-lesson/$id');
      return OfflineLesson.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch offline lesson details: $e');
    }
  }
}
