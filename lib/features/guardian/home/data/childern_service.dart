import 'package:global_school/core/client/client.dart';
import 'package:global_school/core/errors/error_handler.dart';
import 'package:global_school/core/log/app_logs.dart';

import 'models/children_model.dart';

class ChildrenService {
  ChildrenService(this.client);

  final ApiClient client;

  Future<List<ChildrenModel>> getChildren() async {
    try {
      final res = await client.get('/guardian/children/');

      return childrenModelFromJson(res.data);
    } catch (e) {
      // rethrow;
      throw ErrorHandler.handle(e);
    }
  }
}
