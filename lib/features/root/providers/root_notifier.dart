import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/core/router/app_router.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:global_school/core/router/go_router_extension.dart';

final rootProvider = NotifierProvider<RootNotifier, int>(RootNotifier.new);

class RootNotifier extends Notifier<int> {
  @override
  build() => 0;

  // reset
  void reset() {
    state = 0;
  }

  void onTap(int index) {
    if (index == state) return;

    final router = ref.watch(routerProvider);

    state = index;
    switch (index) {
      case 0:
        router.goNamed(AppRoutes.home.name);
        break;
      case 1:
        router.pushNamed(AppRoutes.category.name);
        break;
      case 2:
        router.pushNamed(AppRoutes.search.name, queryParameters: {
          // 'query': '',
        });
        break;
      case 3:
        router.pushNamed(AppRoutes.notifications.name);
        break;
      case 4:
        router.pushNamed(AppRoutes.profile.name);
        break;
    }
  }

  int get getIndex {
    final location = ref.watch(routerProvider).location;
    if (location.contains(AppRoutes.home.name)) {
      return 0;
    } else if (location.contains(AppRoutes.category.name)) {
      return 1;
    } else if (location.contains(AppRoutes.search.name)) {
      return 2;
    } else if (location.contains(AppRoutes.notifications.name)) {
      return 3;
    } else if (location.contains(AppRoutes.profile.name)) {
      return 4;
    } else {
      return 0;
    }
  }

  bool isExcludedPage() {
    final location = ref.watch(routerProvider).location;

    final excludedPages = [
      AppRoutes.profile.name,
      AppRoutes.search.name,
    ];

    return excludedPages.any(
      location.contains,
    );
  }
}
