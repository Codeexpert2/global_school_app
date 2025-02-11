// class RecordedLessonService {
//   RecordedLessonService(this.apiClient);
//   final ApiClient apiClient;

//   Future<RecordedLessonModel> getRecordedLessons() async {
//     final response = await apiClient.get('/student/recorded-lesson');
//     return RecordedLessonModel.fromJson(response.data);
//   }
// }
import 'package:global_school/core/client/client.dart';
import 'package:global_school/core/pagination/models/paginated_response.dart';
import 'package:global_school/features/student/recorded_lesson/model/recorded_lesson_model.dart';

class RecordedLessonService {
  RecordedLessonService(this.apiClient);
  final ApiClient apiClient;

  Future<PaginatedResponse<RecordedLessonModel>> getRecordedLessons(
      {String query = '',
      int page = 1,
      int perPage = 10,
      String? subjectId}) async {
    try {
      final response = await apiClient.get(
        '/student/recorded-lesson',
        queryParameters: {
          'query': query,
          'page': page.toString(),
          'per_page': perPage.toString(),
          'subject_id': subjectId.toString(),
        },
      );
      return PaginatedResponse.fromJson(
        response.data,
        RecordedLessonModel.fromJson,
      );
    } catch (e) {
      throw Exception('Failed to fetch recorded lessons: $e');
    }
  }

  // Future<RecordedLesson> getRecordedLessonsById(String lessonId) async {
  //   final response =
  //       await apiClient.get('/student/recorded-lesson/$lessonId',);
  //   return RecordedLesson.fromJson(response.data);
  // }
}
