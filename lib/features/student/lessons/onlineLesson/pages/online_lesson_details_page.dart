import 'package:flutter/material.dart';
import 'package:global_school/core/extensions/extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/online_lesson_provider.dart';

class OnlineLessonDetailsPage extends ConsumerWidget {
  const OnlineLessonDetailsPage({
    super.key,
    required this.lessonId,
  });

  final String lessonId;

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
        data: (lesson) {
          // if (response == null) {
          //   return const Center(child: Text('No lesson details available.'));
          // }
          // final lesson = response; // تأكد من أن data ليس null
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: context.width,
                ),
                Text(
                  'Topic: ${lesson.topic}',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
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
