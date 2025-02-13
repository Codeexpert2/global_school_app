import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/core/client/client.dart';

import '../models/subject_model.dart';
import '../service/subjects_service.dart';

final studentSubjectsServiceProvider = Provider<StudentSubjectsService>((ref) {
  final apiClient = ref.watch(clientProvider);
  return StudentSubjectsService(apiClient);
});

final studentSubjectsProvider = FutureProvider<List<Subject>>((ref) async {
  final studentSubjectsService = ref.watch(studentSubjectsServiceProvider);
  return studentSubjectsService.getSubjects();
});
