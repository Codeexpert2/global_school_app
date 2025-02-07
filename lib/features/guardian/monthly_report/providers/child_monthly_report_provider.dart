import 'package:global_school/core/pagination/models/pagination_state.dart';
import 'package:global_school/core/pagination/notifiers/paginated_list_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:global_school/core/client/client.dart';

import '../data/models/monthly_report_model.dart';
import '../data/monthly_report_service.dart';

final monthlyReportServiceProvider = Provider<MonthlyReportService>((ref) {
  final apiClient = ref.watch(clientProvider);
  return MonthlyReportService(apiClient);
});

// Create the products provider using PaginatedListNotifier
final monthlyReportsProvider = StateNotifierProvider.autoDispose.family<
    PaginatedListNotifier<MonthlyReportModel>,
    PaginationState<MonthlyReportModel>,
    String>((ref, childId) {
  final monthlyReportService = ref.watch(monthlyReportServiceProvider);

  return PaginatedListNotifier<MonthlyReportModel>(
    fetchData: (int page) {
      return monthlyReportService.getMonthlyReport(
        childId: childId,
        page: page,
      );
    },
  );
});
