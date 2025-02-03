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
import 'package:global_school/features/student/lessons/offlineLesson/pages/offline_lesson_details_page.dart';
import 'package:global_school/features/student/lessons/offlineLesson/pages/offline_lesson_page.dart';
import 'package:global_school/features/student/lessons/onlineLesson/pages/online_lesson_details_page.dart';
import 'package:global_school/features/student/lessons/onlineLesson/pages/online_lesson_page.dart';
import 'package:global_school/features/shared/onboarding/onboarding_screen.dart';
import 'package:global_school/features/student/profile/pages/profile_screen.dart';
import 'package:global_school/features/root/root_screen.dart';
import 'package:global_school/features/student/settings/pages/settings_screen.dart';
import 'package:global_school/features/shared/splash/splash_screen.dart';
import 'package:global_school/features/shared/statics/about.dart';
import 'package:global_school/features/shared/statics/privacy_policy.dart';
import 'package:global_school/features/shared/statics/terms_conditions.dart';
import 'package:global_school/features/teacher/curriculums/pages/curriculum_page.dart';
import 'package:global_school/features/teacher/curriculums/pages/curriculums_page.dart';
import 'package:global_school/features/teacher/curriculums/pages/new_curriculum_page.dart';
import 'package:global_school/features/teacher/curriculums/pages/update_curriculum_page.dart';
import 'package:global_school/features/teacher/exams/pages/exam_page.dart';
import 'package:global_school/features/teacher/exams/pages/exams_page.dart';
import 'package:global_school/features/teacher/exams/pages/new_exam_page.dart';
import 'package:global_school/features/teacher/exams/pages/update_exam_page.dart';
import 'package:global_school/features/teacher/sections/pages/section_details_page.dart';
import 'package:global_school/features/teacher/sections/pages/sections_page.dart';
import 'package:global_school/features/teacher/students/pages/new_student_page.dart';
import 'package:global_school/features/teacher/students/pages/student_details_page.dart';
import 'package:global_school/features/teacher/students/pages/students_page.dart';
import 'package:global_school/features/teacher/students/pages/update_student_page.dart';
import '../../features/student/games/pages/game_page.dart';
import 'package:global_school/features/teacher/home/home.dart';

List<RouteBase> routes = <RouteBase>[
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
  ShellRoute(
    restorationScopeId: 'root',
    navigatorKey: shellNavigatorKey,
    builder: (context, state, child) {
      // Check if current route requires navbar

      return RootScreen(
        child: child,
      );
    },
    routes: [
      GoRoute(
        name: AppRoutes.teacherHome.name,
        path: AppRoutes.teacherHome.path,
        parentNavigatorKey: shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: TeacherHomeScreen(),
          );
        },
      ),
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
        name: AppRoutes.studentLessonHome.name,
        path: AppRoutes.studentLessonHome.path,
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
      GoRoute(
        path: AppRoutes.studentSettings.path,
        name: AppRoutes.studentSettings.name,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: AppRoutes.studentOnlineLesson.path,
        name: AppRoutes.studentOnlineLesson.name,
        builder: (context, state) => const OnlineLessonPage(),
      ),
      GoRoute(
        path: AppRoutes.studentOnlineLessonDetails.path,
        name: AppRoutes.studentOnlineLessonDetails.name,
        builder: (context, state) {
          final lessonId = state.pathParameters['lessonId'];
          return OnlineLessonDetailsPage(lessonId: lessonId ?? '');
        },
      ),
      GoRoute(
        path: AppRoutes.studentOfflineLessons.path,
        name: AppRoutes.studentOfflineLessons.name,
        builder: (context, state) => const OfflineLessonsPage(),
      ),
      GoRoute(
        path: AppRoutes.studentOfflineLessonsDetails.path,
        name: AppRoutes.studentOfflineLessonsDetails.name,
        builder: (context, state) {
          final lessonId = state.pathParameters['lessonId'];
          return OfflineLessonDetailsPage(
            lessonId: lessonId ?? '',
          );
        },
      ),
      GoRoute(
        path: AppRoutes.teacherExams.path,
        name: AppRoutes.teacherExams.name,
        builder: (context, state) => const ExamsPage(),
      ),
      GoRoute(
        path: AppRoutes.teacherExam.path,
        name: AppRoutes.teacherExam.name,
        builder: (context, state) {
          final examId = state.pathParameters['examId'];

          return ExamPage(id: examId ?? '');
        },
      ),
      GoRoute(
        path: AppRoutes.teacherNewExam.path,
        name: AppRoutes.teacherNewExam.name,
        builder: (context, state) => const NewExamPage(),
      ),
      GoRoute(
        path: AppRoutes.teacherUpdateExam.path,
        name: AppRoutes.teacherUpdateExam.name,
        builder: (context, state) {
          final examId = state.pathParameters['examId'];

          return UpdateExamPage(id: examId ?? '');
        },
      ),
      GoRoute(
        path: AppRoutes.teacherCurriculums.path,
        name: AppRoutes.teacherCurriculums.name,
        builder: (context, state) => const CurriculumsPage(),
      ),
      GoRoute(
        path: AppRoutes.teacherCurriculum.path,
        name: AppRoutes.teacherCurriculum.name,
        builder: (context, state) {
          final curriculumId = state.pathParameters['curriculumId'];
          return CurriculumPage(
            curriculumId: curriculumId ?? '',
          );
        },
      ),
      GoRoute(
        path: AppRoutes.teacherNewCurriculum.path,
        name: AppRoutes.teacherNewCurriculum.name,
        builder: (context, state) => const NewCurriculumPage(),
      ),
      GoRoute(
        path: AppRoutes.teacherUpdateCurriculum.path,
        name: AppRoutes.teacherUpdateCurriculum.name,
        builder: (context, state) {
          final curriculumId = state.pathParameters['curriculumId'];
          return UpdateCurriculumPage(
            curriculumId: curriculumId ?? '',
          );
        },
      ),
      GoRoute(
        path: AppRoutes.teacherSections.path,
        name: AppRoutes.teacherSections.name,
        builder: (context, state) => const SectionsPage(),
      ),
      GoRoute(
        path: AppRoutes.teacherSection.path,
        name: AppRoutes.teacherSection.name,
        builder: (context, state) {
          final sectionId = state.pathParameters['sectionId'];
          return SectionDetailsPage(sectionId: sectionId ?? '');
        },
      ),
      GoRoute(
        path: AppRoutes.teacherStudents.path,
        name: AppRoutes.teacherStudents.name,
        builder: (context, state) => const StudentsPage(),
      ),
      GoRoute(
        path: AppRoutes.teacherNewStudent.path,
        name: AppRoutes.teacherNewStudent.name,
        builder: (context, state) => const NewStudentPage(),
      ),
      GoRoute(
        path: AppRoutes.teacherStudent.path,
        name: AppRoutes.teacherStudent.name,
        builder: (context, state) {
          final studentId = state.pathParameters['studentId'];
          return StudentDetailsPage(studentId: studentId ?? '');
        },
      ),
      GoRoute(
        path: AppRoutes.teacherUpdateStudent.path,
        name: AppRoutes.teacherUpdateStudent.name,
        builder: (context, state) {
          final studentId = state.pathParameters['studentId'];
          return UpdateStudentPage(studentId: studentId ?? '');
        },
      ),
    ],
  ),
];
