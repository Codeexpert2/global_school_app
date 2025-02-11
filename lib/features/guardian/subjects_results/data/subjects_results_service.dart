import 'package:global_school/core/client/client.dart';
import 'package:global_school/core/errors/error_handler.dart';

import 'models/subject_result_model.dart';

class SubjectsResultsService {
  SubjectsResultsService(this.client);

  final ApiClient client;

  Future<List<SubjectResultModel>> getSubjectResult({
    required String childId,
    required String subjectId,
    required String semester,
  }) async {
    try {
      final res = await client.get(
        '/guardian/children/$childId/results',
        queryParameters: {
          'subject_id': subjectId,
          'semester': semester,
        },
      );

      return listSubjectResultModelFromJson(res.data);
    } catch (e) {
      // rethrow;
      throw ErrorHandler.handle(e);
    }
  }

  Future<List<SubjectResultModel>> getSubjects(String childId) async {
    try {
      final res = await client.get(
        '/guardian/children/$childId/subjects',
      );

      return listSubjectResultModelFromJson(res.data);
    } catch (e) {
      // rethrow;
      throw ErrorHandler.handle(e);
    }
  }
}
