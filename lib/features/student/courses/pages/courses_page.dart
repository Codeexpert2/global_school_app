import 'package:flutter/material.dart';
import 'package:global_school/components/main/main_appbar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider/courses_provider.dart';
import 'lessons_page.dart';

class CoursesPage extends ConsumerWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(coursesProvider);

    return Scaffold(
      appBar: const MainAppBar(
        title: 'Courses',
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return ListTile(
            title: Text(course.title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LessonsPage(course: course),
                ),
              );
              // context.pushNamed(AppRoutes.lessonsPage.name, extra: course);
            },
          );
        },
      ),
    );
  }
}
