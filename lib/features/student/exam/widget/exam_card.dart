import 'package:flutter/material.dart';
import 'package:global_school/features/student/exam/model/exam_model.dart';

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
