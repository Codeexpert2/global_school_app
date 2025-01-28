import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:global_school/features/student/recorded_lesson/provider/recorded_lesson_provider.dart'; // استيراد الـ Provider

class RecordedLessonPage extends HookConsumerWidget {
  const RecordedLessonPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordedLessonAsyncValue = ref.watch(recordedLessonProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recorded Lessons'),
      ),
      body: recordedLessonAsyncValue.when(
        data: (recordedLesson) {
          if (recordedLesson.data == null || recordedLesson.data!.isEmpty) {
            return const Center(child: Text('No recorded lessons available.'));
          }
          return ListView.builder(
            itemCount: recordedLesson.data!.length,
            itemBuilder: (context, index) {
              final lesson = recordedLesson.data![index];
              return ListTile(
                title: Text(lesson.title ?? 'No Title'),
                subtitle: Text(lesson.description ?? 'No Description'),
                trailing: Text(lesson.createdAt?.toString() ?? 'No Date'),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
