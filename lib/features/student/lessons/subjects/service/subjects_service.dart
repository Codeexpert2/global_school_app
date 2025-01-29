import 'package:global_school/core/client/client.dart';
import 'package:global_school/core/errors/error_handler.dart';

import '../../onlineLesson/model/online_lesson_model.dart';
import '../models/subject_model.dart';

class StudentSubjectsService {
  StudentSubjectsService(this._apiClient);
  final ApiClient _apiClient;

  // دالة للحصول على جميع الدروس عبر الإنترنت
  Future<SubjectModel> getSubjects() async {
    try {
      final response = await _apiClient.get('/student/my-subjects');
      return SubjectModel.fromJson(response.data);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  // دالة للحصول على تفاصيل درس معين بناءً على الـ id
  Future<OnlineLessonModel> getSubjectsOnlineCourse(int id) async {
    try {
      final response = await _apiClient.get('/get-subject-online-course/$id');
      return OnlineLessonModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch online lesson details: $e');
    }
  }
}
