import 'package:flutter/material.dart';
import 'package:global_school/features/student/subject_results/provider/subject_results_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SubjectResultsPage extends ConsumerWidget {
  const SubjectResultsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectResultsAsync = ref.watch(subjectResultsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Subject Results'),
      ),
      body: subjectResultsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (subjectResults) {
          return ListView.builder(
            itemCount: subjectResults.data?.length ?? 0,
            itemBuilder: (context, index) {
              final result = subjectResults.data![index];
              return ListTile(
                title: Text(result.subject?.name ?? 'No Subject Name'),
                subtitle: Text('Exam Grade: ${result.examGrade}'),
              );
            },
          );
        },
      ),
    );
  }
}
