import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:global_school/features/student/exam/model/exam_model.dart';

class ExamCard extends StatelessWidget {
  const ExamCard({super.key, required this.exam});
  final Exam exam;

  @override
  Widget build(BuildContext context) {
    final formattedDate = exam.date != null
        ? DateFormat('dd MMM yyyy, hh:mm a').format(exam.date!.toLocal())
        : 'No Date';

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
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date: $formattedDate',
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            if (exam.mark != null)
              Text(
                'Mark: ${exam.mark}',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            if (exam.semester != null)
              Text(
                'Semester: ${exam.semester}',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
          ],
        ),
      ),
    );
  }
}
