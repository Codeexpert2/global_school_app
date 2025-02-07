import 'package:global_school/core/client/client.dart';
import 'package:global_school/features/guardian/home/data/models/children_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/child_details_service.dart';

final childDetailsServiceProvider = Provider<ChildDetailsService>((ref) {
  final apiClient = ref.watch(clientProvider);
  return ChildDetailsService(apiClient);
});

final childDetailsProvider =
    FutureProvider.family<ChildrenModel, String>((ref, childId) async {
  final childDetailsService = ref.watch(childDetailsServiceProvider);

  return childDetailsService.getChildDetails(childId);
});
