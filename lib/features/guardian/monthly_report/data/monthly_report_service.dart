import 'package:global_school/configs/app_configs.dart';
import 'package:global_school/core/client/client.dart';
import 'package:global_school/core/errors/error_handler.dart';
import 'package:global_school/core/pagination/models/paginated_response.dart';

import 'models/monthly_report_model.dart';

class MonthlyReportService {
  MonthlyReportService(this.client);

  final ApiClient client;

  Future<PaginatedResponse<MonthlyReportModel>> getMonthlyReport({
    required String childId,
    int page = 1,
    int perPage = AppConfigs.perPage,
  }) async {
    try {
      final res = await client.get(
        '/guardian/children/$childId/monthly-report',
        queryParameters: {
          'page': page,
          'per_page': perPage,
        },
      );

      return PaginatedResponse.fromJson(
        res.data,
        MonthlyReportModel.fromJson,
      );
    } catch (e) {
      // rethrow;
      throw ErrorHandler.handle(e);
    }
  }
}
