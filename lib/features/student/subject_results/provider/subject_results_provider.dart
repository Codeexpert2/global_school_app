import 'package:global_school/core/client/client.dart';
import 'package:global_school/features/student/subject_results/model/subject_results_model.dart';
import 'package:global_school/features/student/subject_results/service/subject_results_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final apiClientProvider = Provider<ApiClient>((ref) => ApiClient());

final subjectResultsServiceProvider = Provider<SubjectResultsService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return SubjectResultsService(apiClient);
});

final subjectResultsProvider = FutureProvider<SubjectresultsModel>((ref) async {
  final service = ref.read(subjectResultsServiceProvider);
  return service.fetchSubjectResults();
});
