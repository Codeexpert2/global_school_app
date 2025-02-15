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
  notifications('/notifications', 'notifications'),
  settings('/settings', 'settings'),

  // global,
  pdfViewer('/pdf-viewer/:pdfPath', 'pdfViewer'),
  videoPlayer('/video-player/:videoUrl', 'videoPlayer'),
  youtubeVideoPlayer('/youtube-video-player/:videoUrl', 'youtubeVideoPlayer'), 
  imageViewer('/image-viewet/:imageUrl', 'imageViewer'), 

  // student,
  studentHome('/student/home', 'studentHome'),
  studentExam('/student/exam', 'studentExam'),
  studentExamDetails('/student/exam/:examId', 'studentExamDetails'),
  studentFavorite('/student/favorite', 'studentFavorite'),
  studentCategory('/student/category', 'studentCategory'),
  studentSearch('/student/search', 'studentSearch'),
  studentAttachments('/student/attachments', 'studentAttachments'),
  studentCalendar('/student/student-calendar', 'studentCalendar'),
  studentCourses('/student/courses', 'studentCourses'),
  studentLessons('/student/lessons', 'studentLessons'),
  studentQuiz('/student/quiz', 'studentQuiz'),
  studentSuccessquiz('/student/success-quiz', 'studentSuccessQuiz'),
  studentFailurequiz('/student/failure-quiz', 'studentFailureQuiz'),
  studentSubjectResults('/student/subject-results', 'studentSubjectResults'),
  studentOnlineLesson(
      '/student/online-lesson/subject/:subjectId', 'studentOnlineLesson'),
  studentRecordedLesson(
      '/student/recorded-lesson/subject/:subjectId', 'studentRecordedLesson'),
  studentLessonSelection(
      '/student/selection-lesson/:subjectId', 'studentLessonSelection'),
  studentOnlineLessonDetails(
      '/student/online-lesson/:lessonId', 'studentOnlineLessonDetails'),
  studentCertificateDetails(
      '/student/certificate/:id', 'studentCertificateDetails'),
  studentSubjectDetails('/student/subject/:id', 'studentSubjectDetails'),
  studentOfflineLessons('/student/offline-lesson', 'studentOfflineLesson'),
  studentOfflineLessonsDetails(
      '/student/offline-lesson/:lessonId', 'studentOfflineLessonDetails'),
  studentLessonHome('/student/lessons', 'studentStudentLesson'),
  // studentHomeExam('/student/exam', 'studentExam'),
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
      '/teacher/curriculums/:curriculumId/update', 'teacherUpdateCurriculum'),

  // Guardian,
  guardianHome('/guardian/home', 'guardianHome'),
  guardianChildren('/guardian/children', 'children'),
  guardianChild('/guardian/children/:childId', 'child'),
  guardianChildOnlineExamResults(
      'online-exam-results', 'guardianOnlineExamResults'),
  guardianSubjectsResults('subjects-results', 'guardianSubjectsResults'),
  guardianWeeklyReport('weekly-report', 'guardianWeeklyReport'),
  guardianMonthlyReport('monthly-report', 'guardianMonthlyReport');

  // librarian,
  // supervisor

  final String path;
  final String name;
  // ignore: sort_constructors_first
  const AppRoutes(this.path, this.name);
}
