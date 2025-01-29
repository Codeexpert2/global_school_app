export 'package:go_router/go_router.dart';

enum AppRoutes {
  splash('/', 'splash'),
  onboarding('/onboarding', 'onboarding'),
  login('/login', 'login'),
  resetPassword('/reset-password', 'resetPassword'),
  changePassword('change-password', 'changePassword'),
  profile('/profile', 'profile'),
  help('/help', 'help'),
  about('about', 'about'),
  termsConditions('terms-conditions', 'termsConditions'),
  privacyPolicy('privacy-policy', 'privacyPolicy'),
  web('/web', 'web'),

  // student,
  studentHome('/student/home', 'home'),
  studentFavorite('/student/favorite', 'favorite'),
  studentNotifications('/student/notifications', 'notifications'),
  studentSettings('/student/settings', 'settings'),
  studentCategory('/student/category', 'category'),
  studentSearch('/student/search', 'search'),
  studentAttachments('/student/attachmentsPage', 'studentAttachmentsPage'),
  studentCalendar('/student/studentCalendarPage', 'studentCalendarPage'),
  studentCourses('/student/coursesPage', 'coursesPage'),
  studentLessons('/student/lessonsPage', 'lessonsPage'),
  studentQuiz('/student/quizPage', 'quizPage'),
  studentSuccessquiz('/student/successquizpage', 'successquizpage'),
  studentFailurequiz('/student/failurequizpage', 'failurequizpage'),
  studentOnlineLesson('/student/onlineLesson', 'onlineLesson'),
  studentOnlineLessonDetails('/student/onlineLesson/:lessonId', 'onlineLessonDetails'),
  studentOfflineLessons('/student/offlineLesson', 'offlineLesson'),
  studentOfflineLessonsDetails('/student/offlineLesson/:lessonId', 'offlineLessonDetails'),
  studentLessonHome('/student/lessons', 'studentLesson'),
  studentHomeExam('/student/exam', 'studentExam'),
  studentGame('/student/game', 'game'),
  studentSubjectAttachments(
    '/student/subjectAttachments',
    'subjectAttachments',
  ),
  // superAdmin,
  // admin,
  // teacher,
  teacherHome('/teacher/home', 'teacherHome');

  // guardian,
  // librarian,
  // supervisor

  final String path;
  final String name;
  // ignore: sort_constructors_first
  const AppRoutes(this.path, this.name);
}
