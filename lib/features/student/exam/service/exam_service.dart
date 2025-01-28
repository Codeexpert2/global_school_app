import 'package:global_school/core/client/client.dart';
import 'package:global_school/features/student/exam/model/exam_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final examServiceProvider = Provider<ExamService>(ExamService.new);

class ExamService {
  ExamService(this.ref);
  final Ref ref;

  Future<ExamModel> fetchExams() async {
    final apiClient = ref.read(clientProvider);
    final response = await apiClient.get('/student/exams');
    return ExamModel.fromJson(response.data);
  }
}
