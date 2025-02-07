import 'package:global_school/core/pagination/models/pagination_state.dart';
import 'package:global_school/core/pagination/notifiers/paginated_list_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:global_school/core/client/client.dart';

import '../data/models/weekly_report_model.dart';
import '../data/weekly_report_service.dart';

final weeklyReportServiceProvider = Provider<WeeklyReportService>((ref) {
  final apiClient = ref.watch(clientProvider);
  return WeeklyReportService(apiClient);
});

// Create the products provider using PaginatedListNotifier
final weeklyReportsProvider = StateNotifierProvider.autoDispose.family<
    PaginatedListNotifier<WeeklyReportModel>,
    PaginationState<WeeklyReportModel>,
    String>((ref, childId) {
  final weeklyReportService = ref.watch(weeklyReportServiceProvider);

  return PaginatedListNotifier<WeeklyReportModel>(
    fetchData: (int page) {
      return weeklyReportService.getWeeklyReport(
        childId: childId,
        page: page,
      );
    },
  );
});
