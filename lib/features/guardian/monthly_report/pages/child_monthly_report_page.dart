import 'package:flutter/material.dart';

import 'package:global_school/components/main/main_appbar.dart';
import 'package:global_school/core/locale/generated/l10n.dart';
import 'package:global_school/core/pagination/paginated_list_widget.dart';

import '../data/models/monthly_report_model.dart';
import '../providers/child_monthly_report_provider.dart';
import '../widgets/monthly_report_card.dart';

class ChildMonthlyReportPage extends StatelessWidget {
  const ChildMonthlyReportPage({
    super.key,
    required this.childId,
  });

  final String childId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: S.of(context).monthlyReport,
      ),
      body: PaginatedListWidget<MonthlyReportModel>(
        provider: monthlyReportsProvider(childId),
        itemBuilder: (context, report) {
          return MonthlyReportCard(report: report);
        },
      ),
    );
  }
}
