import 'package:global_school/core/client/client.dart';
import 'package:global_school/core/pagination/models/paginated_response.dart';
import 'package:global_school/features/student/exam/model/exam_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final examServiceProvider = Provider<ExamService>(ExamService.new);

class ExamService {
  ExamService(this.ref);
  final Ref ref;

  Future<PaginatedResponse<Exam>> fetchExams(
      {int page = 1, int perPage = 10}) async {
    final apiClient = ref.read(clientProvider);
    final response = await apiClient.get(
      '/student/exams',
      queryParameters: {
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
  // Future<PaginatedResponse<OnlineLesson>> getOnlineLessons({
  //   String query = '',
  //   int page = 1,
  //   int perPage = 10,
  //   String? subjectId,
  // }) async {
  //   try {
  //     final response = await _apiClient.get(
  //       '/student/online-lesson',
  //       queryParameters: {
  //         'query': query,
  //         'page': page.toString(),
  //         'per_page': perPage.toString(),
  //         'subject_id':subjectId.toString(),
  //       },
  //     );
  //     return PaginatedResponse.fromJson(
  //       response.data,
  //       OnlineLesson.fromJson,
  //     );
  //   } catch (e) {
  //     throw Exception('Failed to fetch online lessons: $e');
  //   }
  // }
  
  
    // ) async {
  //   final apiClient = ref.read(clientProvider);
  //   final response = await apiClient.get('/student/exams');
  //   return ExamModel.fromJson(response.data);
  // }