import 'package:flutter/material.dart';

import '../model/course.dart';

class LessonsPage extends StatelessWidget {
  const LessonsPage({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    if (course.lessons.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('${course.title} Lessons'),
        ),
        body: const Center(
          child: Text('No lessons available for this course.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${course.title} Lessons'),
      ),
      body: ListView.builder(
        itemCount: course.lessons.length,
        itemBuilder: (context, index) {
          final lesson = course.lessons[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(lesson.title),
              subtitle: Text('Duration: ${lesson.duration}'),
            ),
          );
        },
      ),
    );
  }
}
