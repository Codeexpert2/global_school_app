import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:template/components/web/web.dart';
import 'package:template/core/keys/keys.dart';
import 'package:template/core/router/app_routes.dart';
import 'package:template/features/auth/pages/login_screen.dart';
import 'package:template/features/auth/pages/password_reset_screen.dart';
import 'package:template/features/auth/pages/register_screen.dart';
import 'package:template/features/category/category_screen.dart';
import 'package:template/features/help/pages/help_screen.dart';
import 'package:template/features/home/home.dart';
import 'package:template/features/notification/notification_screen.dart';
import 'package:template/features/onboarding/onboarding_screen.dart';
import 'package:template/features/profile/pages/change_password_screen.dart';
import 'package:template/features/profile/pages/profile_screen.dart';
import 'package:template/features/root/providers/root_notifier.dart';
import 'package:template/features/root/root_screen.dart';
import 'package:template/features/search/search_screen.dart';
import 'package:template/features/settings/pages/settings_screen.dart';
import 'package:template/features/splash/splash_screen.dart';
import 'package:template/features/statics/about.dart';
import 'package:template/features/statics/privacy_policy.dart';
import 'package:template/features/statics/terms_conditions.dart';

List<RouteBase> routes = <RouteBase>[
  GoRoute(
    path: AppRoutes.splash.path,
    name: AppRoutes.splash.name,
    builder: (_, __) => const SplashScreen(),
  ),
  GoRoute(
    path: AppRoutes.onboarding.path,
    name: AppRoutes.onboarding.name,
    builder: (context, state) => const OnboardingScreen(),
  ),
  GoRoute(
    path: AppRoutes.about.path,
    name: AppRoutes.about.name,
    builder: (_, __) => const AboutScreen(),
  ),
  GoRoute(
    path: AppRoutes.privacyPolicy.path,
    name: AppRoutes.privacyPolicy.name,
    builder: (_, __) => const PrivacyPolicyScreen(),
  ),
  GoRoute(
    path: AppRoutes.termsConditions.path,
    name: AppRoutes.termsConditions.name,
    builder: (_, __) => const TermsConditionsScreen(),
  ),
  GoRoute(
    path: AppRoutes.register.path,
    name: AppRoutes.register.name,
    builder: (_, __) => const RegisterScreen(),
  ),
  GoRoute(
    path: AppRoutes.login.path,
    name: AppRoutes.login.name,
    builder: (_, __) => const LoginScreen(),
    routes: [
      GoRoute(
        path: AppRoutes.resetPassword.path,
        name: AppRoutes.resetPassword.name,
        builder: (_, __) => const PasswordResetScreen(),
      ),
      // GoRoute(
      //   path: AppRoutes.resetPasswordDone.path,
      //   name: AppRoutes.resetPasswordDone.name,
      //   builder: (_, __) => const PasswordResetDoneScreen(),
      // ),
    ],
  ),
  GoRoute(
    path: AppRoutes.settings.path,
    name: AppRoutes.settings.name,
    builder: (_, __) => const SettingsScreen(),
  ),
  GoRoute(
    path: AppRoutes.changePassword.path,
    name: AppRoutes.changePassword.name,
    builder: (_, __) => const ChangePasswordScreen(),
  ),
  GoRoute(
    path: AppRoutes.help.path,
    name: AppRoutes.help.name,
    builder: (_, __) => const HelpScreen(),
  ),
  GoRoute(
    path: AppRoutes.web.path,
    name: AppRoutes.web.name,
    builder: (_, __) => const WebViewScreen(),
  ),
  ShellRoute(
    restorationScopeId: 'root',
    navigatorKey: shellNavigatorKey,
    builder: (context, state, child) {
      return RootScreen(child: child);
    },
    routes: [
      GoRoute(
        name: AppRoutes.home.name,
        path: AppRoutes.home.path,
        parentNavigatorKey: shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: HomeScreen(),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.category.name,
        path: AppRoutes.category.path,
        parentNavigatorKey: shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: CategoryScreen(),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.search.name,
        path: AppRoutes.search.path,
        parentNavigatorKey: shellNavigatorKey,
        pageBuilder: (context, state) {
          final query = state.uri.queryParameters['query'];

          return const NoTransitionPage(
            child: SearchScreen(),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.notifications.name,
        path: AppRoutes.notifications.path,
        parentNavigatorKey: shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: NotificationScreen(),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.profile.name,
        path: AppRoutes.profile.path,
        parentNavigatorKey: shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: ProfileScreen(),
          );
        },
        routes: [
          // GoRoute(
          //   path: AppRoutes.updateProfile.path,
          //   name: AppRoutes.updateProfile.name,
          //   builder: (_, __) => const UpdateProfileScreen(),
          // ),
        ],
      ),
    ],
  ),
];
