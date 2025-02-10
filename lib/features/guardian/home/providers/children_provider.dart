import 'package:global_school/core/client/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/childern_service.dart';
import '../data/models/children_model.dart';

final childrenServiceProvider = Provider<ChildrenService>((ref) {
  final apiClient = ref.watch(clientProvider);
  return ChildrenService(apiClient);
});

final childrenProvider = FutureProvider<List<ChildrenModel>>((ref) async {
  final childrenService = ref.watch(childrenServiceProvider);

  return childrenService.getChildren();
});
