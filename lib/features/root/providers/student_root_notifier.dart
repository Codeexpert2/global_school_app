import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/core/router/app_router.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:global_school/core/router/go_router_extension.dart';

final studentRootProvider =
    NotifierProvider<StudentRootNotifier, int>(StudentRootNotifier.new);

class StudentRootNotifier extends Notifier<int> {
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
        router.goNamed(AppRoutes.studentHome.name);
        break;
      case 1:
        router.pushNamed(AppRoutes.studentLessonHomePage.name);
        break;
      case 2:
        // router.pushNamed(AppRoutes.studentSearch.name, queryParameters: {
        //   // 'query': '',
        // });
        router.pushNamed(AppRoutes.studentHomeExam.name);
        break;
      case 3:
        router.pushNamed(AppRoutes.studentGame.name);
        break;
      case 4:
        router.pushNamed(AppRoutes.profile.name);
        break;
    }
  }

  int get getIndex {
    final location = ref.watch(routerProvider).location;
    if (location.contains(AppRoutes.studentHome.name)) {
      return 0;
    } else if (location.contains(AppRoutes.studentLessonHomePage.name)) {
      return 1;
    // } else if (location.contains(AppRoutes.studentSearch.name)) {
    } else if (location.contains(AppRoutes.studentHomeExam.name)) {
      return 2;
    } else if (location.contains(AppRoutes.studentGame.name)) {
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
      AppRoutes.studentSearch.name,
    ];

    return excludedPages.any(
      location.contains,
    );
  }
}
