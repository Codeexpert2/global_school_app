import 'package:flutter/material.dart';
import 'package:global_school/components/main/main_appbar.dart';
import 'package:global_school/core/pagination/paginated_list_widget.dart';
import 'package:global_school/features/guardian/weekly_report/widgets/weekly_report_card.dart';

import '../data/models/weekly_report_model.dart';
import '../providers/child_weekly_report_provider.dart';

class ChildWeeklyReportPage extends StatelessWidget {
  const ChildWeeklyReportPage({
    super.key,
    required this.childId,
  });

  final String childId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'Weekly Report $childId',
      ),
      body: PaginatedListWidget<WeeklyReportModel>(
        provider: weeklyReportsProvider(childId),
        itemBuilder: (context, report) {
          return WeeklyReportCard(report: report);
        },
      ),
    );
  }
}
