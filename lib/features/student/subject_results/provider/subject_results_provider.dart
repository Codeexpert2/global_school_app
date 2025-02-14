import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/core/client/client.dart';
import 'package:global_school/core/enums/enums.dart';

import '../model/subject_model.dart';
import '../model/subject_results_model.dart';
import '../service/subject_results_service.dart';

final subjectResultsServiceProvider = Provider<SubjectResultsService>((ref) {
  final apiClient = ref.read(clientProvider);
  return SubjectResultsService(apiClient);
});

final subjectIdProvider = StateProvider<String?>((ref) => null);
final semesterProvider = StateProvider<Semester?>((ref) => null);

final subjectResultsProvider = FutureProvider<List<SubjectResult>>(
  (ref) async {
    final subjectResultsService = ref.watch(subjectResultsServiceProvider);
    final subjectId = ref.watch(subjectIdProvider);
    final semester = ref.watch(semesterProvider);

    return subjectResultsService.fetchSubjectResults(
      semester: semester?.name,
      subjectId: subjectId,
    );
  },
);

final subjectsProvider = FutureProvider<List<Subject>>(
  (ref) async {
    final subjectsResultsService = ref.watch(subjectResultsServiceProvider);

    return subjectsResultsService.getSubjects();
  },
);
