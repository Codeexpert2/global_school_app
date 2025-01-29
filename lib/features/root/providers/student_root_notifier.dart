import 'package:global_school/core/log/app_logs.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/core/router/app_router.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:global_school/core/router/go_router_extension.dart';

final studentRootProvider =
    NotifierProvider<StudentRootNotifier, int>(StudentRootNotifier.new);

class StudentRootNotifier extends Notifier<int> {
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
        router.goNamed(AppRoutes.studentHome.name);
        break;
      case 1:
        router.pushNamed(AppRoutes.studentLessonHome.name);
        break;
      case 2:
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

  int getIndex() {
    final location = ref.watch(routerProvider).location;

    if (location.contains(AppRoutes.studentHome.name)) {
      return 0;
    } else if (location.contains(AppRoutes.studentLessonHome.name)) {
      return 1;
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
