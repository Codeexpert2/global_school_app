import 'package:flutter/material.dart';
import 'package:global_school/components/main/main_appbar.dart';
import 'package:global_school/features/student/lessons/recorded_lesson/widget/recorded_lesson_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:global_school/features/student/lessons/recorded_lesson/provider/recorded_lesson_provider.dart';

class RecordedLessonPage extends HookConsumerWidget {
  const RecordedLessonPage({super.key, required this.subjectId});
  final String subjectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordedLessonAsyncValue =
        ref.watch(recordedLessonProvider(subjectId));

    return Scaffold(
      appBar: const MainAppBar(title: 'Recorded Lessons'),
      body: recordedLessonAsyncValue.when(
        data: (recordedLesson) {
          if (recordedLesson.data == null || recordedLesson.data!.isEmpty) {
            return const Center(child: Text('No recorded lessons available.'));
          }
          return ListView.builder(
            itemCount: recordedLesson.data!.length,
            itemBuilder: (context, index) {
              final lesson = recordedLesson.data![index];
              return RecordedLessonCard(lesson: lesson);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
