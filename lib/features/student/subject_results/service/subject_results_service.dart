import 'package:global_school/core/client/client.dart';
import 'package:global_school/core/errors/error_handler.dart';

import '../model/subject_model.dart';
import '../model/subject_results_model.dart';

class SubjectResultsService {
  SubjectResultsService(this._apiClient);

  final ApiClient _apiClient;

  Future<List<SubjectResult>> fetchSubjectResults({
    String? semester,
    String? subjectId,
  }) async {
    try {
      final response = await _apiClient.get(
        '/student/subject-results',
        queryParameters: {
          'semester': semester,
          'subject_id': subjectId,
        },
      );

      final data = SubjectResultsModel.fromJson(
        response.data,
      );

      return data.subjectResults ?? [];
    } catch (e) {
      // rethrow;
      throw ErrorHandler.handle(e).message;
    }
  }

  Future<List<Subject>> getSubjects() async {
    try {
      final response = await _apiClient.get(
        '/student/my-subjects',
      );

      final data = SubjectsModel.fromJson(response.data);

      return data.subjects ?? [];
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
