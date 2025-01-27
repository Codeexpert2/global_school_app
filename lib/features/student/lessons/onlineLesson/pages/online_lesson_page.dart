import 'package:flutter/material.dart';
import 'package:global_school/features/student/lessons/onlineLesson/pages/online_lesson_details_page.dart';
import 'package:global_school/features/student/lessons/onlineLesson/provider/online_lesson_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineLessonPage extends ConsumerWidget {
  const OnlineLessonPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlineLessonAsync = ref.watch(onlineLessonProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Lessons'),
      ),
      body: onlineLessonAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (response) {
          final lessons = response.data?.courses ?? [];
          return ListView.builder(
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              final lesson = lessons[index];
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(lesson.topic ?? 'No Topic'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Start Time: ${lesson.startTime ?? 'N/A'}'),
                      Text('End Time: ${lesson.endTime ?? 'N/A'}'),
                      Text('Created By: ${lesson.creatingByName ?? 'Unknown'}'),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OnlineLessonDetailsPage(lessonId: lesson.id ?? 0),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
