import 'package:flutter/material.dart';
import 'package:global_school/components/main/main_appbar.dart';
import 'package:global_school/core/pagination/paginated_list_widget.dart';
import 'package:global_school/features/student/exam/model/exam_model.dart';
import 'package:global_school/features/student/exam/widget/exam_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:global_school/features/student/exam/provider/exam_provider.dart';

class ExamPage extends ConsumerWidget {
  const ExamPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const MainAppBar(title: 'Exams'),
      body: PaginatedListWidget<Exam>(
        provider: examProvider(''),
        itemBuilder: (context, exam) {
          final formattedDate = exam.date != null
              ? DateFormat('dd MMM yyyy, hh:mm a').format(exam.date!.toLocal())
              : 'No Date';

          return InkWell(
            onTap: () {},
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
