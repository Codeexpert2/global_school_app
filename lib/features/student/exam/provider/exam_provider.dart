import 'package:global_school/features/student/exam/model/exam_model.dart';
import 'package:global_school/features/student/exam/service/exam_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final examProvider = FutureProvider<ExamModel>((ref) async {
  final examService = ref.read(examServiceProvider);
  return examService.fetchExams();
});