import 'package:flutter/material.dart';
import 'package:global_school/components/form/debounced_search.dart';
import 'package:global_school/core/locale/generated/l10n.dart';
import 'package:global_school/core/pagination/paginated_list_widget.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:global_school/features/student/exam/model/exam_model.dart';
import 'package:global_school/features/student/exam/widget/exam_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:global_school/features/student/exam/provider/exam_provider.dart';

class ExamStudentPage extends ConsumerWidget {
  const ExamStudentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(S.of(context).exams),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: DebouncedSearch(
            onDebounceChange: (value) {
              // Update search query
              ref.read(examSearchProvider.notifier).state = value;
              // Refresh the list
              ref.read(examProvider.notifier).refresh();
            },
          ),
        ),
      ),
      body: PaginatedListWidget<Exam>(
        provider: examProvider,
        itemBuilder: (context, exam) {
          final formattedDate = exam.date != null
              ? DateFormat('dd MMM yyyy, hh:mm a').format(exam.date!.toLocal())
              : 'No Date';

          return InkWell(
            onTap: () {
              context.pushNamed(
                AppRoutes.studentExamDetails.name,
                pathParameters: {
                  'examId': exam.id?.toString() ?? '',
                },
              );
            },
            child: ExamCard(
              exam: exam,
              date: formattedDate,
            ),
          );
        },
      ),
    );
  }
}
