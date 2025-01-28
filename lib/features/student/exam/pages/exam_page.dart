import 'package:flutter/material.dart';
import 'package:global_school/features/student/exam/provider/exam_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExamPage extends ConsumerWidget {
  const ExamPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examAsyncValue = ref.watch(examProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exams'),
      ),
      body: examAsyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Errors: $error')),
        data: (examModel) {
          return ListView.builder(
            itemCount: examModel.data?.length ?? 0,
            itemBuilder: (context, index) {
              final exam = examModel.data![index];
              return ListTile(
                title: Text(exam.topic ?? 'No Topic'),
                subtitle: Text('Date: ${exam.date?.toLocal()}'),
              );
            },
          );
        },
      ),
    );
  }
}
