import 'package:global_school/core/client/client.dart';
import 'package:global_school/core/pagination/models/paginated_response.dart';
import 'package:global_school/features/student/subject_results/model/subject_results_model.dart';

class SubjectResultsService {
  SubjectResultsService(this.apiClient);
  final ApiClient apiClient;

  Future<PaginatedResponse<Subjectresults>> fetchSubjectResults({
    String query = '',
    int page = 1,
    int perPage = 10,
    String? subjectId,
  }) async {
    try {
      final response = await apiClient.get(
        '/student/subject-results',
        queryParameters: {
          'query': query,
          'page': page.toString(),
          'per_page': perPage.toString(),
          'subject_id': subjectId.toString(),
        },
      );
      return PaginatedResponse.fromJson(
        response.data,
        Subjectresults.fromJson,
      );
    } catch (e) {
      throw Exception('Failed to fetch subject results: $e');
    }
    // final response = await apiClient.get('/student/subject-results');

    // if (response.statusCode == 200) {
    //   return SubjectresultsModel.fromJson(response.data);
    // } else {
    //   throw Exception('Failed to load subject results');
    // }
  }
  //   Future<PaginatedResponse<OnlineLesson>> getOnlineLessons({
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
}
