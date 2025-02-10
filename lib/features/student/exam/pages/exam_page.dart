import 'package:flutter/material.dart';
import 'package:global_school/components/main/main_appbar.dart';
import 'package:global_school/features/student/exam/model/exam_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:global_school/features/student/exam/provider/exam_provider.dart';

class ExamPage extends ConsumerWidget {
  const ExamPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examAsyncValue = ref.watch(examProvider);

    return Scaffold(
      appBar: const MainAppBar(title: 'Exams'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: examAsyncValue.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Text(
              'Error: $error',
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
          data: (examModel) {
            if (examModel.data == null || examModel.data!.isEmpty) {
              return const Center(
                child: Text(
                  'No exams available',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              );
            }

            return ListView.builder(
              itemCount: examModel.data!.length,
              itemBuilder: (context, index) {
                final exam = examModel.data![index];
                final formattedDate = exam.date != null
                    ? DateFormat('dd MMM yyyy, hh:mm a')
                        .format(exam.date!.toLocal())
                    : 'No Date';

                return ExamCard(
                  exam: exam,
                  date: formattedDate,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class ExamCard extends StatelessWidget {
  const ExamCard({super.key, required this.exam, required this.date});
  final Exam exam;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: const Icon(Icons.school, color: Colors.blueAccent, size: 40),
        title: Text(
          exam.topic ?? 'No Topic',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Date: $date',
          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        ),
      ),
    );
  }
}
