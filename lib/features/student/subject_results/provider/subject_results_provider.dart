import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/core/client/client.dart';
import 'package:global_school/core/enums/enums.dart';

import '../model/subject_results_model.dart';
import '../service/subject_results_service.dart';

final subjectResultsServiceProvider = Provider<SubjectResultsService>((ref) {
  final apiClient = ref.read(clientProvider);
  return SubjectResultsService(apiClient);
});

final selectedSemesterProvider = StateProvider<Semester?>(
  (ref) => null,
);

final selectedSubjectIdProvider = StateProvider<String?>(
  (ref) => null,
);

final subjectResultsProvider = FutureProvider<List<SubjectResult>>(
  (ref) async {
    final subjectResultsService = ref.watch(subjectResultsServiceProvider);
    final subjectId = ref.watch(selectedSubjectIdProvider);
    final semester = ref.watch(selectedSemesterProvider);

    return subjectResultsService.fetchSubjectResults(
      semester: semester?.name,
      subjectId: subjectId,
    );
  },
);
