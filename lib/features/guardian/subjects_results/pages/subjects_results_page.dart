import 'package:flutter/material.dart';
import 'package:global_school/components/errors/error_indicator.dart';
import 'package:global_school/components/loading/loading_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/subjects_results_provider.dart';
import '../widgets/semester_dropdown.dart';
import '../widgets/subject_dropdown.dart';
import '../widgets/subject_result_card.dart';

class ChildSubjectsResultsPage extends ConsumerWidget {
  const ChildSubjectsResultsPage({
    super.key,
    required this.childId,
  });

  final String childId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectsResultsState = ref.watch(subjectsResultsProvider(childId));
    return Scaffold(
      appBar: AppBar(
        title: Text('Subjects Results $childId'),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SubjectDropdown(),
              SemesterDropdown(),
            ],
          ),
        ),
      ),
      body: subjectsResultsState.when(
        error: (error, stackTrace) {
          return ErrorIndicator(
            errorMessage: error.toString(),
            onRetry: () {
              ref.refresh(subjectsResultsProvider(childId));
            },
          );
        },
        loading: LoadingWidget.new,
        data: (subjectResults) {
          return ListView.builder(
            itemCount: subjectResults.length,
            itemBuilder: (context, index) {
              final subjectResult = subjectResults[index];
              return SubjectResultCard(subjectResult: subjectResult);
            },
          );
        },
      ),
    );
  }
}
