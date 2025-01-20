
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/course.dart';
import '../model/lesson.dart';

final coursesProvider = Provider<List<Course>>((ref) {
  return [
    Course(
      id: '1',
      title: 'Mathematics',
      lessons: [
        Lesson(
          id: '1',
          title: 'Introduction to Algebra',
          url: 'https://example.com/algebra',
          duration: '15:30',
        ),
        Lesson(
          id: '2',
          title: 'Geometry Basics',
          url: 'https://example.com/geometry',
          duration: '20:45',
        ),
      ],
    ),
    Course(
      id: '2',
      title: 'Science',
      lessons: [
        Lesson(
          id: '3',
          title: 'Introduction to Physics',
          url: 'https://example.com/physics',
          duration: '18:00',
        ),
        Lesson(
          id: '4',
          title: 'Chemistry 101',
          url: 'https://example.com/chemistry',
          duration: '25:00',
        ),
      ],
    ),
  ];
});
