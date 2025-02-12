import 'package:flutter/material.dart';

import 'package:global_school/components/main/app_divider.dart';
import 'package:global_school/core/locale/generated/l10n.dart';

import '../data/models/monthly_report_model.dart';

class MonthlyReportCard extends StatelessWidget {
  const MonthlyReportCard({
    super.key,
    required this.report,
  });

  final MonthlyReportModel report;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 8,
      shadowColor: Theme.of(context).shadowColor.withOpacity(.25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.calendar_today,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  report.date?.toLocal().toString().split(' ')[0] ?? 'N/A',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const AppDivider(),

            // Academic Levels
            WeeklyReportSectionTitle(
              title: S.of(context).academicPerformance,
            ),
            ReportItem(
                title: S.of(context).arabicLevel,
                value: report.arabicMaterialLevel ?? 'N/A'),
            ReportItem(
                title: S.of(context).englishLevel,
                value: report.englishMaterialLevel ?? 'N/A'),
            ReportItem(
                title: S.of(context).outstandingSubject,
                value: report.excellenceInSubject ?? 'N/A'),
            ReportItem(
                title: S.of(context).challengingSubject,
                value: report.difficultyInSubject ?? 'N/A'),

            // Personal Hygiene
            WeeklyReportSectionTitle(title: S.of(context).personalHygiene),
            ReportItem(
                title: S.of(context).nails, value: report.nails ?? 'N/A'),
            ReportItem(title: S.of(context).hair, value: report.hair ?? 'N/A'),
            ReportItem(
                title: S.of(context).clothing, value: report.clothing ?? 'N/A'),

            // Class Participation
            WeeklyReportSectionTitle(title: S.of(context).classParticipation),
            ReportItem(
                title: S.of(context).academicPerformance,
                value: report.childAcademicPerformance ?? 'N/A'),
            ReportItem(
                title: S.of(context).worksheetsCompletion,
                value: report.workSheetsCompletion ?? 'N/A'),
            ReportItem(
                title: S.of(context).projectsCompletion,
                value: report.projectsCompletion ?? 'N/A'),
            ReportItem(
                title: S.of(context).participationInteraction,
                value: report.participationAndInteraction ?? 'N/A'),
            ReportItem(
                title: S.of(context).listeningObservation,
                value: report.listeningAndObservation ?? 'N/A'),

            // Attendance & Behavior
            WeeklyReportSectionTitle(title: S.of(context).attendanceBehavior),
            ReportItem(
                title: S.of(context).attendanceAbsence,
                value: report.attendanceAndAbsence ?? 'N/A'),
            ReportItem(
                title: S.of(context).behaviorInClass,
                value: report.behaviorInClassAndSchool ?? 'N/A'),

            // Commitments
            WeeklyReportSectionTitle(title: S.of(context).commitments),
            ReportItem(
                title: S.of(context).healthyFoodCommitment,
                value: report.healthyFoodCommitment ?? 'N/A'),
            ReportItem(
                title: S.of(context).schoolUniformCommitment,
                value: report.schoolUniformCommitment ?? 'N/A'),

            // Note Section
            const SizedBox(height: 8),
            Text(
              S.of(context).teachersNote,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                report.note?.isNotEmpty == true
                    ? report.note!
                    : S.of(context).noAdditionalNotes,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeeklyReportSectionTitle extends StatelessWidget {
  const WeeklyReportSectionTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
