export 'package:go_router/go_router.dart';

enum AppRoutes {
  splash('/', 'splash'),
  onboarding('/onboarding', 'onboarding'),
  login('/login', 'login'),
  resetPassword('/reset-password', 'resetPassword'),
  changePassword('change-password', 'changePassword'),
  profile('/profile', 'profile'),
  help('/help', 'help'),
  about('/about', 'about'),
  termsConditions('/terms-conditions', 'termsConditions'),
  privacyPolicy('/privacy-policy', 'privacyPolicy'),
  web('/web', 'web'),

  // student,
  studentHome('/student/home', 'home'),
  studentFavorite('/student/favorite', 'favorite'),
  studentNotifications('/student/notifications', 'notifications'),
  studentSettings('/student/settings', 'settings'),
  studentCategory('/student/category', 'category'),
  studentSearch('/student/search', 'search'),
  studentAttachments('/student/attachments', 'studentAttachments'),
  studentCalendar('/student/calendar', 'studentCalendar'),
  studentCourses('/student/courses', 'studentCourses'),
  studentLessons('/student/lessonsPage', 'lessonsPage'),
  studentQuiz('/student/quizPage', 'quizPage'),
  studentSuccessquiz('/student/success-quiz', 'studentSuccessQuiz'),
  studentFailurequiz('/student/failure-quiz', 'studentFailureQuiz'),
  studentOnlineLesson('/student/online-lesson', 'studentOnlineLesson'),
  studentOnlineLessonDetails(
      '/student/onlineLesson/:lessonId', 'onlineLessonDetails'),
  studentOfflineLessons('/student/offlineLesson', 'offlineLesson'),
  studentOfflineLessonsDetails(
      '/student/offlineLesson/:lessonId', 'offlineLessonDetails'),
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
  teacherHome('/teacher/home', 'teacherHome'),

  teacherSections('/teacher/sections', 'teacherSections'),
  teacherSection('/teacher/sections/:sectionId', 'teacherSection'),
  teacherNewSection('/teacher/new-section', 'teacherNewSection'),
  teacherUpdateSection(
      '/teacher/sections/:sectionId/update', 'teacherUpdateSection'),

  teacherStudents('/teacher/students', 'teacherStudents'),
  teacherStudent('/teacher/students/:studentId', 'teacherStudent'),
  teacherNewStudent('/teacher/new-student', 'teacherNewStudent'),
  teacherUpdateStudent(
      '/teacher/students/:studentId/update', 'teacherUpdateStudent'),

  teacherExams('/teacher/exams', 'teacherExams'),
  teacherExam('/teacher/exams/:examId', 'teacherExam'),
  teacherNewExam('/teacher/new-exam', 'teacherNewExam'),
  teacherUpdateExam('/teacher/exams/:examId/update', 'teacherUpdateExam'),

  teacherCurriculums('/teacher/curriculums', 'teacherCurriculums'),
  teacherCurriculum('/teacher/curriculums/:curriculumId', 'teacherCurriculum'),
  teacherNewCurriculum('/teacher/new-curriculum', 'teacherNewCurriculum'),
  teacherUpdateCurriculum(
      '/teacher/curriculums/:curriculumId/update', 'teacherUpdateCurriculum');

  // guardian,
  // librarian,
  // supervisor

  final String path;
  final String name;
  // ignore: sort_constructors_first
  const AppRoutes(this.path, this.name);
}
