import 'package:global_school/core/client/client.dart';
import 'package:global_school/core/errors/error_handler.dart';
import 'package:global_school/features/guardian/home/data/models/children_model.dart';

class ChildDetailsService {
  ChildDetailsService(this.client);

  final ApiClient client;

  Future<ChildrenModel> getChildDetails(String childId) async {
    try {
      final res = await client.get(
        '/guardian/children/$childId',
      );

      return ChildrenModel.fromJson(res.data);
    } catch (e) {
      // rethrow;
      throw ErrorHandler.handle(e);
    }
  }
}
