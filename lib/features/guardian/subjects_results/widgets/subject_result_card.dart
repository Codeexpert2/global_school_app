import 'package:flutter/material.dart';

import '../data/models/subject_result_model.dart';

class SubjectResultCard extends StatelessWidget {
  const SubjectResultCard({
    super.key,
    required this.subjectResult,
  });

  final SubjectResultModel subjectResult;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        tileColor: Colors.blueGrey.shade50,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'subjectName : ${subjectResult.subjectName}',
            ),
            Text(
              'semester : ${subjectResult.semester}',
            ),
            Text(
              'exam : ${subjectResult.exam}',
            ),
            Text(
              'worksheets : ${subjectResult.worksheets}',
            ),
            Text(
              'Study : ${subjectResult.study}',
            ),
            Text(
              'Note Book : ${subjectResult.noteBook}',
            ),
            Text(
              'Exam Grade : ${subjectResult.examGrade}',
            ),
            Text(
              'Study Grade : ${subjectResult.studyGrade}',
            ),
          ],
        ),
      ),
    );
  }
}
