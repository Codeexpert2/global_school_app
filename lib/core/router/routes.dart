import 'package:global_school/core/keys/keys.dart';
import 'package:global_school/core/router/app_routes.dart';

import 'package:global_school/features/student/ar/ar_page.dart';
import 'package:global_school/features/student/ar/model_viewer_page.dart';
import 'package:global_school/features/auth/pages/login_screen.dart';
import 'package:global_school/features/auth/pages/password_reset_screen.dart';

import 'package:global_school/features/student/exam/pages/home_exam_page.dart';

import 'package:global_school/features/student/help/pages/help_screen.dart';
import 'package:global_school/features/student/home/home.dart';
import 'package:global_school/features/student/lessons/lesson_home_page.dart';
import 'package:global_school/features/student/lessons/offlineLesson/pages/offline_lesson_page.dart';
import 'package:global_school/features/student/lessons/onlineLesson/pages/online_lesson_page.dart';
import 'package:global_school/features/shared/onboarding/onboarding_screen.dart';
import 'package:global_school/features/student/profile/pages/profile_screen.dart';
import 'package:global_school/features/root/root_screen.dart';
import 'package:global_school/features/student/settings/pages/settings_screen.dart';
import 'package:global_school/features/shared/splash/splash_screen.dart';
import 'package:global_school/features/shared/statics/about.dart';
import 'package:global_school/features/shared/statics/privacy_policy.dart';
import 'package:global_school/features/shared/statics/terms_conditions.dart';
import '../../features/student/games/pages/game_page.dart';

List<RouteBase> routes = <RouteBase>[
  GoRoute(
    path: AppRoutes.studentOnlineLesson.path,
    name: AppRoutes.studentOnlineLesson.name,
    builder: (context, state) => const OnlineLessonPage(),
  ),
  GoRoute(
    path: AppRoutes.studentOfflineLessons.path,
    name: AppRoutes.studentOfflineLessons.name,
    builder: (context, state) => const OfflineLessonsPage(),
  ),
  // GoRoute(
  //   path: AppRoutes.studentHomeExam.path,
  //   name: AppRoutes.studentHomeExam.name,
  //   builder: (context, state) => const HomeExamPage(),
  // ),
  // GoRoute(
  //   path: AppRoutes.studentLessonHomePage.path,
  //   name: AppRoutes.studentLessonHomePage.name,
  //   builder: (context, state) => const LessonHomePage(),
  // ),
  GoRoute(
    path: AppRoutes.splash.path,
    name: AppRoutes.splash.name,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: AppRoutes.onboarding.path,
    name: AppRoutes.onboarding.name,
    builder: (context, state) => const OnboardingScreen(),
  ),
  GoRoute(
    path: AppRoutes.privacyPolicy.path,
    name: AppRoutes.privacyPolicy.name,
    builder: (context, state) => const PrivacyPolicyScreen(),
  ),
  GoRoute(
    path: AppRoutes.termsConditions.path,
    name: AppRoutes.termsConditions.name,
    builder: (context, state) => const TermsConditionsScreen(),
  ),
  GoRoute(
    path: AppRoutes.about.path,
    name: AppRoutes.about.name,
    builder: (context, state) => const AboutScreen(),
  ),

  GoRoute(
    path: AppRoutes.help.path,
    name: AppRoutes.help.name,
    builder: (context, state) => const HelpScreen(),
  ),
  GoRoute(
    path: AppRoutes.login.path,
    name: AppRoutes.login.name,
    builder: (_, __) => const LoginScreen(),
  ),
  GoRoute(
    path: AppRoutes.resetPassword.path,
    name: AppRoutes.resetPassword.name,
    builder: (_, __) => const PasswordResetScreen(),
  ),
  // ShellRoute for authenticated users (role-specific screens)
  ShellRoute(
    restorationScopeId: 'root',
    navigatorKey: shellNavigatorKey,
    builder: (_, __, child) => RootScreen(child: child),
    routes: [
      // Role-specific routes (superAdmin, admin, teacher, etc.)

      GoRoute(
        name: AppRoutes.studentHome.name,
        path: AppRoutes.studentHome.path,
        parentNavigatorKey: shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: HomeScreen(),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.studentLessonHomePage.name,
        path: AppRoutes.studentLessonHomePage.path,
        parentNavigatorKey: shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: LessonHomePage(),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.studentHomeExam.name,
        path: AppRoutes.studentHomeExam.path,
        parentNavigatorKey: shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: HomeExamPage(),
          );
        },
      ),
      // GoRoute(
      //   name: AppRoutes.studentSearch.name,
      //   path: AppRoutes.studentSearch.path,
      //   parentNavigatorKey: shellNavigatorKey,
      //   pageBuilder: (context, state) {
      //     final query = state.uri.queryParameters['query'];

      //     return const NoTransitionPage(
      //       child: SearchScreen(),
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: AppRoutes.studentNotifications.name,
      //   path: AppRoutes.studentNotifications.path,
      //   parentNavigatorKey: shellNavigatorKey,
      //   pageBuilder: (context, state) {
      //     return const NoTransitionPage(
      //       child: NotificationScreen(),
      //     );
      //   },
      // ),
      GoRoute(
        name: AppRoutes.studentGame.name,
        path: AppRoutes.studentGame.path,
        parentNavigatorKey: shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: GamePage(),
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
      // GoRoute(
      //   name: AppRoutes.studentLessons.name,
      //   path: AppRoutes.studentLessons.path,
      //   builder: (context, state) {
      //     final course = state.extra as Course;
      //     return LessonsPage(course: course);
      //   },
      // ),
      GoRoute(
          name: 'ar',
          path: '/ar',
          builder: (context, state) {
            return const ArPage();
          },
          routes: [
            GoRoute(
              name: 'assets',
              path: ':assets',
              builder: (context, state) {
                final assets = state.pathParameters['assets']!;
                return ModelViewerPage(assets: assets);
              },
            ),
          ]),
      // Add other role-specific routes here...
      GoRoute(
        path: AppRoutes.studentSettings.path,
        name: AppRoutes.studentSettings.name,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  ),
];
// List<RouteBase> routes = <RouteBase>[
//   GoRoute(
//     path: AppRoutes.splash.path,
//     name: AppRoutes.splash.name,
//     builder: (_, __) => const SplashScreen(),
//   ),
//   GoRoute(
//     path: AppRoutes.onboarding.path,
//     name: AppRoutes.onboarding.name,
//     builder: (context, state) => const OnboardingScreen(),
//   ),
//   GoRoute(
//     path: AppRoutes.studentAttachmentsPage.path,
//     name: AppRoutes.studentAttachmentsPage.name,
//     builder: (context, state) => const StudentAttachmentsPage(),
//   ),
//   GoRoute(
//     path: AppRoutes.about.path,
//     name: AppRoutes.about.name,
//     builder: (_, __) => const AboutScreen(),
//   ),
//   GoRoute(
//     path: AppRoutes.privacyPolicy.path,
//     name: AppRoutes.privacyPolicy.name,
//     builder: (_, __) => const PrivacyPolicyScreen(),
//   ),
//   GoRoute(
//     path: AppRoutes.studentCalendarPage.path,
//     name: AppRoutes.studentCalendarPage.name,
//     builder: (_, __) => const StudentCalendarPage(),
//   ),
//   GoRoute(
//     path: AppRoutes.termsConditions.path,
//     name: AppRoutes.termsConditions.name,
//     builder: (_, __) => const TermsConditionsScreen(),
//   ),
//   GoRoute(
//     path: AppRoutes.register.path,
//     name: AppRoutes.register.name,
//     builder: (_, __) => const RegisterScreen(),
//   ),
//   GoRoute(
//     path: AppRoutes.login.path,
//     name: AppRoutes.login.name,
//     builder: (_, __) => const LoginScreen(),
//     routes: [],
//   ),
//   GoRoute(
//     path: AppRoutes.resetPassword.path,
//     name: AppRoutes.resetPassword.name,
//     builder: (_, __) => const PasswordResetScreen(),
//   ),
//   // GoRoute(
//   //   path: AppRoutes.resetPasswordDone.path,
//   //   name: AppRoutes.resetPasswordDone.name,
//   //   builder: (_, __) => const PasswordResetDoneScreen(),
//   // ),
//   GoRoute(
//     path: AppRoutes.settings.path,
//     name: AppRoutes.settings.name,
//     builder: (_, __) => const SettingsScreen(),
//   ),
//   GoRoute(
//     path: AppRoutes.changePassword.path,
//     name: AppRoutes.changePassword.name,
//     builder: (_, __) => const ChangePasswordScreen(),
//   ),
//   GoRoute(
//     path: AppRoutes.help.path,
//     name: AppRoutes.help.name,
//     builder: (_, __) => const HelpScreen(),
//   ),
//   GoRoute(
//     path: AppRoutes.coursesPage.path,
//     name: AppRoutes.coursesPage.name,
//     builder: (_, __) => const CoursesPage(),
//   ),
//   GoRoute(
//     path: AppRoutes.web.path,
//     name: AppRoutes.web.name,
//     builder: (_, __) => const WebViewScreen(),
//   ),
//   GoRoute(
//     path: AppRoutes.quizPage.path,
//     name: AppRoutes.quizPage.name,
//     builder: (_, __) => const QuizPage(),
//   ),
//   GoRoute(
//     path: AppRoutes.successquizpage.path,
//     name: AppRoutes.successquizpage.name,
//     builder: (_, __) => const SuccessQuizPage(),
//   ),
//    GoRoute(
//     path: AppRoutes.failurequizpage.path,
//     name: AppRoutes.failurequizpage.name,
//     builder: (_, __) => const FailureQuizPage(),
//   ),
  //  GoRoute(
  //   path = AppRoutes.studentOnlineLesson.path,
  //   name = AppRoutes.studentOnlineLesson.name,
  //   builder = (_, __) => const OnlineLessonPage(),
  // ),
//   ShellRoute(
//     restorationScopeId: 'root',
//     navigatorKey: shellNavigatorKey,
//     builder: (context, state, child) {
//       return RootScreen(child: child);
//     },
//     routes: [
//       GoRoute(
//         name: AppRoutes.home.name,
//         path: AppRoutes.home.path,
//         parentNavigatorKey: shellNavigatorKey,
//         pageBuilder: (context, state) {
//           return const NoTransitionPage(
//             child: HomeScreen(),
//           );
//         },
//       ),
//       GoRoute(
//         name: AppRoutes.category.name,
//         path: AppRoutes.category.path,
//         parentNavigatorKey: shellNavigatorKey,
//         pageBuilder: (context, state) {
//           return const NoTransitionPage(
//             child: CategoryScreen(),
//           );
//         },
//       ),
//       GoRoute(
//         name: AppRoutes.search.name,
//         path: AppRoutes.search.path,
//         parentNavigatorKey: shellNavigatorKey,
//         pageBuilder: (context, state) {
//           final query = state.uri.queryParameters['query'];

//           return const NoTransitionPage(
//             child: SearchScreen(),
//           );
//         },
//       ),
//       GoRoute(
//         name: AppRoutes.notifications.name,
//         path: AppRoutes.notifications.path,
//         parentNavigatorKey: shellNavigatorKey,
//         pageBuilder: (context, state) {
//           return const NoTransitionPage(
//             child: NotificationScreen(),
//           );
//         },
//       ),
//       GoRoute(
//         name: AppRoutes.profile.name,
//         path: AppRoutes.profile.path,
//         parentNavigatorKey: shellNavigatorKey,
//         pageBuilder: (context, state) {
//           return const NoTransitionPage(
//             child: ProfileScreen(),
//           );
//         },
//         routes: [
//           // GoRoute(
//           //   path: AppRoutes.updateProfile.path,
//           //   name: AppRoutes.updateProfile.name,
//           //   builder: (_, __) => const UpdateProfileScreen(),
//           // ),
//         ],
//       ),
//       // GoRoute(
//       //   name: AppRoutes.subjectAttachments.name,
//       //   path: AppRoutes.subjectAttachments.path,
//       //   builder: (context, state) {
//       //     final subjectName = state.pathParameters['subjectName']!;
//       //     return SubjectAttachmentsPage(subjectName: subjectName);
//       //   },
//       // ),
//       GoRoute(
//         name: AppRoutes.lessonsPage.name,
//         path: AppRoutes.lessonsPage.path,
//         builder: (context, state) {
//           final course = state.extra as Course;
//           return LessonsPage(course: course);
//         },
//       ),
//       GoRoute(
//           name: 'ar',
//           path: '/ar',
//           builder: (context, state) {
//             return const ArPage();
//           },
//           routes: [
//             GoRoute(
//               name: 'assets',
//               path: ':assets',
//               builder: (context, state) {
//                 final assets = state.pathParameters['assets']!;
//                 return ModelViewerPage(assets: assets);
//               },
//             ),
//           ]),
//     ],
//   ),
// ];


