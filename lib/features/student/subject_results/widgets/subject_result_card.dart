import 'package:flutter/material.dart';

import 'package:global_school/components/main/app_divider.dart';
import 'package:global_school/core/enums/enums.dart';
import 'package:global_school/core/functions/generate_color_by_string.dart';
import 'package:global_school/core/locale/generated/l10n.dart';

import '../model/subject_results_model.dart';

import 'subject_info_row.dart';
import 'subject_title.dart';

class SubjectResultCard extends StatelessWidget {
  const SubjectResultCard({
    super.key,
    required this.subjectResult,
  });

  final SubjectResult subjectResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: BorderDirectional(
          start: BorderSide(
            width: 8,
            color: generateColorByString(subjectResult.subjectName),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 8.0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubjectTitle(
              subjectName: subjectResult.subjectName,
              semester: (subjectResult.semester ?? '').toSemester.title,
            ),
            const AppDivider(),
            SubjectInfoRow(
              label: S.of(context).exam,
              value: subjectResult.exam,
            ),
            SubjectInfoRow(
              label: S.of(context).worksheets,
              value: subjectResult.worksheets,
            ),
            SubjectInfoRow(
              label: S.of(context).study,
              value: subjectResult.study,
            ),
            SubjectInfoRow(
              label: S.of(context).notebook,
              value: subjectResult.noteBook,
            ),
            SubjectInfoRow(
              label: S.of(context).examGrade,
              value: subjectResult.examGrade,
            ),
            SubjectInfoRow(
              label: S.of(context).studyGrade,
              value: subjectResult.studyGrade?.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
