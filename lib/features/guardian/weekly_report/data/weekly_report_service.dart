import 'package:global_school/configs/app_configs.dart';
import 'package:global_school/core/client/client.dart';
import 'package:global_school/core/errors/error_handler.dart';
import 'package:global_school/core/pagination/models/paginated_response.dart';

import 'models/weekly_report_model.dart';

class WeeklyReportService {
  WeeklyReportService(this.client);

  final ApiClient client;

  Future<PaginatedResponse<WeeklyReportModel>> getWeeklyReport({
    required String childId,
    int page = 1,
    int perPage = AppConfigs.perPage,
  }) async {
    try {
      final res = await client.get(
        '/guardian/children/$childId/weekly-report',
        queryParameters: {
          'page': page,
          'per_page': perPage,
        },
      );

      return PaginatedResponse.fromJson(
        res.data,
        WeeklyReportModel.fromJson,
      );
    } catch (e) {
      // rethrow;
      throw ErrorHandler.handle(e);
    }
  }
}
