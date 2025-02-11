import 'package:flutter/material.dart';
import 'package:global_school/core/locale/generated/l10n.dart';
import 'package:global_school/features/student/exam/model/exam_model.dart';

class ExamCard extends StatelessWidget {
  const ExamCard({super.key, required this.exam, required this.date});
  final Exam exam;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: const Icon(Icons.school, color: Colors.blueAccent, size: 40),
          title: Text(
            exam.topic ?? S.of(context).noTopic,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            '${S.of(context).date}: $date',
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
        ),
      ),
    );
  }
}
