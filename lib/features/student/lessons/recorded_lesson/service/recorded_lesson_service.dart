// class RecordedLessonService {
//   RecordedLessonService(this.apiClient);
//   final ApiClient apiClient;

//   Future<RecordedLessonModel> getRecordedLessons() async {
//     final response = await apiClient.get('/student/recorded-lesson');
//     return RecordedLessonModel.fromJson(response.data);
//   }
// }
import 'package:global_school/core/client/client.dart';
import 'package:global_school/features/student/lessons/recorded_lesson/model/recorded_lesson_model.dart';

class RecordedLessonService {
  RecordedLessonService(this.apiClient);
  final ApiClient apiClient;

  Future<RecordedLesson> getRecordedLessons(String subjectId) async {
    final response =
        await apiClient.get('/student/recorded-lesson', queryParameters: {
      'subjectId': subjectId,
    });
    return RecordedLesson.fromJson(response.data);
  }

  // Future<RecordedLesson> getRecordedLessonsById(String lessonId) async {
  //   final response =
  //       await apiClient.get('/student/recorded-lesson/$lessonId',);
  //   return RecordedLesson.fromJson(response.data);
  // }
}
