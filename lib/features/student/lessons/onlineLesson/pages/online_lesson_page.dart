import 'package:flutter/material.dart';
import 'package:global_school/components/form/debounced_search.dart';
import 'package:global_school/core/pagination/paginated_list_widget.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/online_lesson_model.dart';
import '../provider/online_lesson_provider.dart';

class OnlineLessonPage extends ConsumerWidget {
  const OnlineLessonPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Lessons'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: DebouncedSearch(
            onDebonceChange: (value) {
              // Update search query
              ref.read(onlineLessonSearchProvider.notifier).state = value;
              // Refresh the list
              ref.read(onlineLessonsProvider.notifier).refresh();
            },
          ),
        ),
      ),
      body: PaginatedListWidget<OnlineLesson>(
        provider: onlineLessonsProvider,
        itemBuilder: (context, lesson) {
          return OnlineLessonCard(
            lesson: lesson,
          );
        },
      ),
    );
  }
}

class OnlineLessonCard extends StatelessWidget {
  const OnlineLessonCard({
    super.key,
    required this.lesson,
  });

  final OnlineLesson lesson;

  @override
  Widget build(BuildContext context) {
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
          context.pushNamed(
            AppRoutes.studentOnlineLessonDetails.name,
            pathParameters: {
              'lessonId': lesson.id?.toString() ?? '',
            },
          );
        },
      ),
    );
  }
}
