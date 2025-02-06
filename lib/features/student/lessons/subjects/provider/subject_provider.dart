import 'package:global_school/core/client/client.dart';
import 'package:global_school/features/student/lessons/subjects/models/subject_details_model.dart';
import 'package:global_school/features/student/lessons/subjects/service/subjects_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/subject_model.dart';

final studentSubjectsServiceProvider = Provider<StudentSubjectsService>((ref) {
  final apiClient = ref.watch(clientProvider);
  return StudentSubjectsService(apiClient);
});

// Provider للحصول على جميع الدروس
final studentSubjectsProvider = FutureProvider<SubjectModel>((ref) async {
  final studentSubjectsService = ref.watch(studentSubjectsServiceProvider);
  return await studentSubjectsService.getSubjects();
});

final subjectDetailsProvider =
    FutureProvider.autoDispose.family<SubjectDetails, String>((ref, id) async {
  final studentSubjectsService = ref.watch(studentSubjectsServiceProvider);
  return await studentSubjectsService.getSubjectDetails(id);
});