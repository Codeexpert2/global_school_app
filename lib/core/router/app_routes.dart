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
  studentHome('/student/home', 'studentHome'),
  studentFavorite('/student/favorite', 'studentFavorite'),
  studentNotifications('/student/notifications', 'studentNotifications'),
  studentSettings('/student/settings', 'studentSettings'),
  studentCategory('/student/category', 'studentCategory'),
  studentSearch('/student/search', 'studentSearch'),
  studentAttachments('/student/attachments', 'studentAttachments'),
  studentCalendar('/student/student-calendar', 'studentCalendar'),
  studentCourses('/student/courses', 'studentCourses'),
  studentLessons('/student/lessons', 'studentLessons'),
  studentQuiz('/student/quiz', 'studentQuiz'),
  studentSuccessquiz('/student/success-quiz', 'studentSuccessQuiz'),
  studentFailurequiz('/student/failure-quiz', 'studentFailureQuiz'),
  studentOnlineLesson('/student/online-lesson', 'studentOnlineLesson'),
  studentOnlineLessonDetails(
      '/student/online-lesson/:lessonId', 'studentOnlineLessonDetails'),
  studentCertificateDetails(
      '/student/certificate/:id', 'studentCertificateDetails'),
  studentOfflineLessons('/student/offline-lesson', 'studentOfflineLesson'),
  studentOfflineLessonsDetails(
      '/student/offline-lesson/:lessonId', 'studentOfflineLessonDetails'),
  studentLessonHome('/student/lessons', 'studentStudentLesson'),
  studentHomeExam('/student/exam', 'studentExam'),
  studentGame('/student/game', 'studentGame'),
  studentCertificates('/student/certificates', 'studentCertificates'),
  studentSubjects('/student/subjects', 'studentSubjects'),
  studentSubjectAttachments(
    '/student/subject-attachments',
    'studentSubjectAttachments',
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
