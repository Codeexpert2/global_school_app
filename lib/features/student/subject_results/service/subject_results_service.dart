import 'package:global_school/core/client/client.dart';
import 'package:global_school/features/student/subject_results/model/subject_results_model.dart';

class SubjectResultsService {
  SubjectResultsService(this.apiClient);
  final ApiClient apiClient;

  Future<SubjectresultsModel> fetchSubjectResults() async {
    final response = await apiClient.get('/student/subject-results');

    if (response.statusCode == 200) {
      return SubjectresultsModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load subject results');
    }
  }
}
