import 'package:flutter/foundation.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:template/core/keys/keys.dart';
import 'package:template/core/router/routes.dart';
import 'package:template/features/statics/not_found.dart';
import 'package:template/initialize_app.dart';
import 'package:template/providers/auth_provider.dart';
import 'package:template/services/local_storage/storage_service.dart';

import 'app_routes.dart';
import 'go_router_observer.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final isAuth = ValueNotifier<AsyncValue<bool>>(const AsyncLoading());
  //  final firebaseAnalyticsObserver =
  //       ref.watch(firebaseAnalyticsObserverProvider);
  ref
    ..onDispose(isAuth.dispose)
    // update the listenable, when some provider value changes
    // here, we are just interested in wheter the user's logged in
    ..listen(
      authNotifierProvider.select(
        (val) => val.whenData((val) => val),
      ),
      (_, next) {
        isAuth.value = AsyncValue.data(next.value ?? false);
      },
    );

  final router = GoRouter(
    routes: routes,
    refreshListenable: isAuth,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    initialLocation: AppRoutes.splash.path,
    errorBuilder: (context, state) => const NotFoundScreen(),
    observers: [
      // Add your navigator observers
      GoRouterObserver(),
      // firebaseAnalyticsObserver,
    ],
    // onException: (context, state, router) {
    //   AppLogs.error('GoRouter onException: ${state.error}', 'AppRoutes');
    // },
    redirect: (context, state) {
      final storage = locator<StorageService>();

      final isOnboardingCompleted = storage.readBool(onboardingKey);

      // final isLogin = state.uri.path == AppRoutes.login.path;
      // final isRegister = state.uri.path == AppRoutes.register.path;

      // final isResetPassword =
      //     state.uri.path.startsWith(AppRoutes.resetPassword.path) ||
      //         state.uri.path.contains('/reset-password');

      // Extract the current path
      final currentPath = state.uri.path;

      // Allowed paths for unauthenticated users
      final allowedUnauthPaths = [
        AppRoutes.splash.path,
        AppRoutes.onboarding.path,
        AppRoutes.login.path,
        AppRoutes.register.path,
        AppRoutes.resetPassword.path,
        AppRoutes.resetPasswordDone.path,
      ];

      // 1. Show splash screen if auth state is loading or not available
      if (isAuth.value.isLoading || !isAuth.value.hasValue) {
        return AppRoutes.splash.path;
      }

      // 2. Go to onboarding screen if not completed
      if (!isOnboardingCompleted) {
        return AppRoutes.onboarding.path;
      }

      // 3. Authenticated user logic
      if (isAuth.value.requireValue) {
        //   // Allow authenticated users to access their allowed paths
        //   if (allowedAuthPaths.contains(currentPath)) {
        //     return null; // Stay on the requested path
        //   }
        //   // Redirect to home if accessing an invalid path
        //   return AppRoutes.home.path;
        if (currentPath == AppRoutes.splash.path) {
          return AppRoutes.home.path;
        }
      }

      // 4. Unauthenticated user logic
      if (!isAuth.value.requireValue) {
        // Allow unauthenticated users to access their allowed paths
        if (allowedUnauthPaths.contains(currentPath)) {
          return null; // Stay on the requested path
        }
        // Redirect to login if accessing an invalid path
        return AppRoutes.login.path;
      }

      // 5. Allow navigation to register, reset password, or login if auth false
      return null;
    },
  );

  ref.onDispose(router.dispose);

  return router;
});

final routeInformationProvider =
    ChangeNotifierProvider<GoRouteInformationProvider>((ref) {
  final router = ref.watch(routerProvider);
  return router.routeInformationProvider;
});
