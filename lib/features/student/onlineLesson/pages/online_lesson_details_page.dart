import 'package:flutter/material.dart';
import 'package:global_school/features/student/onlineLesson/provider/online_lesson_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineLessonDetailsPage extends ConsumerWidget {
  const OnlineLessonDetailsPage({super.key, required this.lessonId});
  final int lessonId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlineLessonDetailsAsync =
        ref.watch(onlineLessonDetailsProvider(lessonId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson Details'),
      ),
      body: onlineLessonDetailsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (response) {
          if (response.data == null) {
            return const Center(child: Text('No lesson details available.'));
          }
          final lesson = response.data!; // تأكد من أن data ليس null
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Topic: ${lesson.topic}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Start Time: ${lesson.startTime}'),
                Text('End Time: ${lesson.endTime}'),
                Text('Created By: ${lesson.creatingByName}'),
                Text('Duration: ${lesson.duration} minutes'),
                Text('Meeting ID: ${lesson.meetingId}'),
                Text('Password: ${lesson.password}'),
                Text('Start URL: ${lesson.startUrl}'),
                Text('Join URL: ${lesson.joinUrl}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
