import 'package:global_school/core/client/client.dart';
import 'package:global_school/core/errors/error_handler.dart';

import '../models/subject_model.dart';

class StudentSubjectsService {
  StudentSubjectsService(this._apiClient);

  final ApiClient _apiClient;

  Future<List<Subject>> getSubjects() async {
    try {
      final response = await _apiClient.get(
        '/student/my-subjects',
        isCached: true,
      );

      final data = SubjectsModel.fromJson(response.data);

      return data.subjects ?? [];
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
