import 'package:flutter/material.dart';
import 'package:global_school/components/form/debounced_search.dart';
import 'package:global_school/core/locale/generated/l10n.dart';
import 'package:global_school/core/pagination/paginated_list_widget.dart';
import 'package:global_school/features/student/subject_results/model/subject_results_model.dart';
import 'package:global_school/features/student/subject_results/provider/subject_results_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SubjectResultsPage extends ConsumerWidget {
  const SubjectResultsPage({super.key, required this.subjectId});
  final String subjectId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).subjectResults),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: DebouncedSearch(
            onDebounceChange: (value) {
              // Update search query
              ref.read(subjectResultsSearchProvider.notifier).state = value;
              // Refresh the list
              ref.read(subjectResultsProvider(subjectId).notifier).refresh();
            },
          ),
        ),
      ),
      body: PaginatedListWidget<Subjectresults>(
        provider: subjectResultsProvider(subjectId),
        itemBuilder: (context, result) {
          return ListTile(
                title: Text(result.subject?.name ?? 'No Subject Name'),
                subtitle: Text('Exam Grade: ${result.examGrade}'),
              );
        },
      ),
      // body: subjectResultsAsync.when(
      //   loading: () => const Center(child: CircularProgressIndicator()),
      //   error: (error, stack) => Center(child: Text('Error: $error')),
      //   data: (subjectResults) {
      //     return ListView.builder(
      //       itemCount: subjectResults.data?.length ?? 0,
      //       itemBuilder: (context, index) {
      //         final result = subjectResults.data![index];
      //         return ListTile(
      //           title: Text(result.subject?.name ?? 'No Subject Name'),
      //           subtitle: Text('Exam Grade: ${result.examGrade}'),
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}
