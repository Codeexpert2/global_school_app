import 'package:global_school/core/client/client.dart';
import 'package:global_school/core/errors/error_handler.dart';
import 'package:global_school/features/student/subjects/models/subject_details_model.dart';

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

  Future<SubjectDetails> getSubjectDetails(String id) async {
    try {
      final response = await _apiClient.get('/get-subject-online-course/$id');
      return SubjectDetails.fromJson(response.data);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
