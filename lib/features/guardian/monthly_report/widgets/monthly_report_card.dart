import 'package:flutter/material.dart';

import '../data/models/monthly_report_model.dart';

class MonthlyReportCard extends StatelessWidget {
  const MonthlyReportCard({
    super.key,
    required this.report,
  });

  final MonthlyReportModel report;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          color: Colors.grey.shade50,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReportItem(
            title: 'Date : ',
            value: '${report.date?.toLocal().toString()}',
          ),
          ReportItem(
            title: 'arabicMaterialLevel : ',
            value: '${report.arabicMaterialLevel}',
          ),
          ReportItem(
            title: 'EnglishMaterialLevel : ',
            value: '${report.englishMaterialLevel}',
          ),
          ReportItem(
            title: 'ExcellenceInSubject : ',
            value: '${report.excellenceInSubject}',
          ),
          ReportItem(
            title: 'DifficultyInSubject : ',
            value: '${report.difficultyInSubject}',
          ),
          ReportItem(
            title: 'Nails : ',
            value: '${report.nails}',
          ),
          ReportItem(
            title: 'Hair : ',
            value: '${report.hair}',
          ),
          ReportItem(
            title: 'Clothing : ',
            value: '${report.clothing}',
          ),
          ReportItem(
            title: 'Child Academic Performance : ',
            value: '${report.childAcademicPerformance}',
          ),
          ReportItem(
            title: 'Worksheets Completion : ',
            value: '${report.workSheetsCompletion}',
          ),
          ReportItem(
            title: 'Projects Completion : ',
            value: '${report.projectsCompletion}',
          ),
          ReportItem(
            title: 'Participation and Interaction : ',
            value: '${report.participationAndInteraction}',
          ),
          ReportItem(
            title: 'Listening and Observation : ',
            value: '${report.listeningAndObservation}',
          ),
          ReportItem(
            title: 'Attendance and Absence : ',
            value: '${report.attendanceAndAbsence}',
          ),
          ReportItem(
            title: 'Behavior in Class and School : ',
            value: '${report.behaviorInClassAndSchool}',
          ),
          ReportItem(
            title: 'Healthy Food Commitment : ',
            value: '${report.healthyFoodCommitment}',
          ),
          ReportItem(
            title: 'School Uniform Commitment : ',
            value: '${report.schoolUniformCommitment}',
          ),
          const Text(
            'Note : ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${report.note}',
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

class ReportItem extends StatelessWidget {
  const ReportItem({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(value),
      ],
    );
  }
}
