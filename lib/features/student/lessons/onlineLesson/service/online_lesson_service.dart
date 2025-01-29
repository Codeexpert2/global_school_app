import 'package:global_school/core/client/client.dart';

import '../model/online_lesson_model.dart';

class OnlineLessonService {
  OnlineLessonService(this._apiClient);
  final ApiClient _apiClient;

  // دالة للحصول على جميع الدروس عبر الإنترنت
  Future<OnlineLessonModel> getOnlineLessons() async {
    try {
      final response = await _apiClient.get('/student/online-lesson');
      return OnlineLessonModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch online lessons: $e');
    }
  }

  // دالة للحصول على تفاصيل درس معين بناءً على الـ id
  Future<OnlineLesson> getOnlineLessonById(int id) async {
    try {
      final response = await _apiClient.get('/student/online-lesson/$id');
      return OnlineLesson.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch online lesson details: $e');
    }
  }
}
