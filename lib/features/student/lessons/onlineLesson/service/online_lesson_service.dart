import 'package:global_school/core/client/client.dart';
import 'package:global_school/core/pagination/models/paginated_response.dart';

import '../model/online_lesson_model.dart';

class OnlineLessonService {
  OnlineLessonService(this._apiClient);
  final ApiClient _apiClient;

  // دالة للحصول على جميع الدروس عبر الإنترنت
  Future<PaginatedResponse<OnlineLesson>> getOnlineLessons({
    String query = '',
    int page = 1,
    int perPage = 10,
    String? subjectId,
  }) async {
    try {
      final response = await _apiClient.get(
        '/student/online-lesson',
        queryParameters: {
          'query': query,
          'page': page.toString(),
          'per_page': perPage.toString(),
          'subject_id':subjectId.toString(),
        },
      );
      return PaginatedResponse.fromJson(
        response.data,
        OnlineLesson.fromJson,
      );
    } catch (e) {
      throw Exception('Failed to fetch online lessons: $e');
    }
  }

  // دالة للحصول على تفاصيل درس معين بناءً على الـ id
  Future<OnlineLesson> getOnlineLessonById(String id) async {
    try {
      final response = await _apiClient.get('/student/online-lesson/$id');
      return OnlineLesson.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch online lesson details: $e');
    }
  }
}
