import 'package:global_school/core/enums/semester.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:global_school/core/client/client.dart';

import '../data/models/subject_result_model.dart';
import '../data/subjects_results_service.dart';

final subjectsResultsServiceProvider = Provider<SubjectsResultsService>((ref) {
  final apiClient = ref.watch(clientProvider);
  return SubjectsResultsService(apiClient);
});

final selectedSemesterProvider =
    StateProvider<Semester>((ref) => Semester.first);
final selectedSubjectIdProvider = StateProvider<String>((ref) => '1');

final subjectsResultsProvider =
    FutureProvider.family<List<SubjectResultModel>, String>(
  (ref, childId) async {
    final subjectsResultsService = ref.watch(subjectsResultsServiceProvider);
    final semester = ref.watch(selectedSemesterProvider);
    final subjectId = ref.watch(selectedSubjectIdProvider);

    return subjectsResultsService.getSubjectResult(
      childId: childId,
      subjectId: subjectId,
      semester: semester.name,
    );
  },
);
