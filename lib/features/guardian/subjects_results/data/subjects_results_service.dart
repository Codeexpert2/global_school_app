import 'package:global_school/core/client/client.dart';
import 'package:global_school/core/errors/error_handler.dart';

import 'models/subject_result_model.dart';
import 'models/subjects_model.dart';

class SubjectsResultsService {
  SubjectsResultsService(this.client);

  final ApiClient client;

  Future<List<SubjectResultModel>> getSubjectResult({
    required String childId,
    String? subjectId,
    String? semester,
  }) async {
    try {
      final res = await client.get(
        '/guardian/children/$childId/results',
        queryParameters: {
          'subject_id': subjectId,
          'semester': semester,
        }..removeWhere((key, value) => value == null), // Remove null values
      );

      return listSubjectResultModelFromJson(res.data);
    } catch (e) {
      // rethrow;
      throw ErrorHandler.handle(e);
    }
  }

  Future<Subjects> getSubjects(String childId) async {
    try {
      final res = await client.get(
        '/guardian/children/$childId/subjects',
      );

      final data = SubjectsModel.fromJson(res.data);

      return data.subjects ?? [];
    } catch (e) {
      // rethrow;
      throw ErrorHandler.handle(e);
    }
  }
}
