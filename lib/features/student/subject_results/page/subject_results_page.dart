import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/components/errors/no_content_indicator.dart';
import 'package:global_school/components/loading/loading_widget.dart';
import 'package:global_school/core/locale/generated/l10n.dart';

import '../model/subject_results_model.dart';
import '../provider/subject_results_provider.dart';
import '../widgets/semester_dropdown.dart';
import '../widgets/subject_dropdown.dart';
import '../widgets/subject_result_card.dart';

class SubjectResultsPage extends ConsumerWidget {
  const SubjectResultsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectResultsState = ref.watch(subjectResultsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).subjectResults),
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
      body: subjectResultsState.when(
        data: (List<SubjectResult> subjectResults) {
          if (subjectResults.isEmpty) {
            return const SizedBox.shrink();
          }
          return ListView.builder(
            itemCount: subjectResults.length,
            itemBuilder: (context, index) {
              final result = subjectResults[index];
              return SubjectResultCard(
                subjectResult: result,
              );
            },
          );
        },
        error: (error, stackTrace) => NoContentIndicator(
          message: error.toString(),
        ),
        loading: LoadingWidget.new,
      ),
    );
  }
}
