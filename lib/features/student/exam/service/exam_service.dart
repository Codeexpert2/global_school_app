import 'package:global_school/core/client/client.dart';
import 'package:global_school/core/pagination/models/paginated_response.dart';
import 'package:global_school/features/student/exam/model/exam_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final examServiceProvider = Provider<ExamService>(ExamService.new);

class ExamService {
  ExamService(this.ref);
  final Ref ref;

  Future<PaginatedResponse<Exam>> fetchExams(
      {String query = '', int page = 1, int perPage = 10}) async {
    final apiClient = ref.read(clientProvider);
    final response = await apiClient.get(
      '/student/exams',
      queryParameters: {
        'query': query,
        'page': page.toString(),
        'per_page': perPage.toString(),
      },
    );
    return PaginatedResponse.fromJson(
      response.data,
      Exam.fromJson,
    );
  }
}
