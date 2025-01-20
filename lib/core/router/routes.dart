import 'package:global_school/components/web/web.dart';
import 'package:global_school/core/keys/keys.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:global_school/features/attachments/view/student_attachments_page.dart';
import 'package:global_school/features/auth/pages/login_screen.dart';
import 'package:global_school/features/auth/pages/password_reset_screen.dart';
import 'package:global_school/features/auth/pages/register_screen.dart';
import 'package:global_school/features/calendar/view/calender.dart';
import 'package:global_school/features/category/category_screen.dart';
import 'package:global_school/features/help/pages/help_screen.dart';
import 'package:global_school/features/home/home.dart';
import 'package:global_school/features/notification/notification_screen.dart';
import 'package:global_school/features/onboarding/onboarding_screen.dart';
import 'package:global_school/features/profile/pages/change_password_screen.dart';
import 'package:global_school/features/profile/pages/profile_screen.dart';
import 'package:global_school/features/root/root_screen.dart';
import 'package:global_school/features/search/search_screen.dart';
import 'package:global_school/features/settings/pages/settings_screen.dart';
import 'package:global_school/features/splash/splash_screen.dart';
import 'package:global_school/features/statics/about.dart';
import 'package:global_school/features/statics/privacy_policy.dart';
import 'package:global_school/features/statics/terms_conditions.dart';

import '../../features/courses/model/course.dart';
import '../../features/courses/pages/courses_page.dart';
import '../../features/courses/pages/lessons_page.dart';

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
    path: AppRoutes.studentAttachmentsPage.path,
    name: AppRoutes.studentAttachmentsPage.name,
    builder: (context, state) => const StudentAttachmentsPage(),
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
    path: AppRoutes.studentCalendarPage.path,
    name: AppRoutes.studentCalendarPage.name,
    builder: (_, __) => const StudentCalendarPage(),
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
    routes: [],
  ),
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
    path: AppRoutes.coursesPage.path,
    name: AppRoutes.coursesPage.name,
    builder: (_, __) => const CoursesPage(),
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
      // GoRoute(
      //   name: AppRoutes.subjectAttachments.name,
      //   path: AppRoutes.subjectAttachments.path,
      //   builder: (context, state) {
      //     final subjectName = state.pathParameters['subjectName']!;
      //     return SubjectAttachmentsPage(subjectName: subjectName);
      //   },
      // ),
      GoRoute(
      name: AppRoutes.lessonsPage.name,
      path: AppRoutes.lessonsPage.path,
      builder: (context, state) {
        // تمرير البيانات إلى LessonsPage
        final course = state.extra as Course;
        return LessonsPage(course: course);
      },
    ),
    ],
  ),
];
