import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/components/errors/error_indicator.dart';
import 'package:global_school/components/errors/no_content_indicator.dart';
import 'package:global_school/components/loading/loading_widget.dart';
import 'package:global_school/core/locale/generated/l10n.dart';

import '../data/models/subject_result_model.dart';
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
        title: Text(S.of(context).subjectResults),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SubjectDropdown(childId: childId),
              const SemesterDropdown(),
            ],
          ),
        ),
      ),
      body: subjectsResultsState.when(
        error: (error, stackTrace) {
          return ErrorIndicator(
            errorMessage: error.toString(),
            onRetry: () => ref.refresh(subjectsResultsProvider(childId)),
          );
        },
        loading: LoadingWidget.new,
        data: (List<SubjectResultModel> subjectResults) {
          if (subjectResults.isEmpty) {
            return NoContentIndicator(
              message: S.of(context).noSubjectResultsFound,
            );
          }
          return ListView.builder(
            itemCount: subjectResults.length,
            itemBuilder: (context, index) {
              final SubjectResultModel subjectResult = subjectResults[index];
              return SubjectResultCard(subjectResult: subjectResult);
            },
          );
        },
      ),
    );
  }
}
