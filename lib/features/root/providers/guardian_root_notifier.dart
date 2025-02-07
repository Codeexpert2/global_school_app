import 'package:global_school/core/log/app_logs.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/core/router/app_router.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:global_school/core/router/go_router_extension.dart';

final guardianRootProvider =
    NotifierProvider<GuardianRootNotifier, int>(GuardianRootNotifier.new);

class GuardianRootNotifier extends Notifier<int> {
  @override
  build() => getIndex();

  // reset
  void reset() {
    state = 0;
  }

  // Add this method to update the index without navigation
  void updateIndex() {
    state = getIndex();
  }

  void onTap(int index) {
    AppLog.info('index: $index');
    if (index == state) return;

    final router = ref.watch(routerProvider);

    state = index;
    switch (index) {
      case 0:
        router.goNamed(AppRoutes.guardianHome.name);
        break;
      case 1:
        router.pushNamed(AppRoutes.guardianNotifications.name);
        break;
      case 2:
        router.pushNamed(AppRoutes.guardianProfile.name);
        break;
    }
  }

  int getIndex() {
    final location = ref.watch(routerProvider).location;

    if (location.contains(AppRoutes.guardianHome.name)) {
      return 0;
    } else if (location.contains(AppRoutes.guardianNotifications.name)) {
      return 1;
    } else if (location.contains(AppRoutes.guardianProfile.name)) {
      return 2;
    } else {
      return 0;
    }
  }
}

// final isExcludedProvider = StateProvider<bool>((ref) {
//   final location = ref.watch(routerProvider).location;
//   AppLog.debug('location: $location');

//   final excludedPages = [
//     AppRoutes.profile.name,
//     AppRoutes.studentSearch.name,
//   ];

//   return excludedPages.any(location.contains);
// });

// bool isExcludedPage(String location) {
//   AppLog.debug('location: $location');

//   final excludedPages = [
//     AppRoutes.profile.name,
//     AppRoutes.studentSearch.name,
//   ];

//   return excludedPages.any(location.contains);
// }

bool isExcludedPage(String location) {
  final excludedPages = [
    AppRoutes.profile.name,
    AppRoutes.studentSearch.name,
  ];
  // Make sure this logic correctly identifies excluded pages
  return excludedPages.any((route) => location.contains(route));
}
