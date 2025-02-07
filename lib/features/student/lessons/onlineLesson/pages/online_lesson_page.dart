import 'package:flutter/material.dart';
import 'package:global_school/components/form/debounced_search.dart';
import 'package:global_school/core/pagination/paginated_list_widget.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:global_school/core/themes/app_colors.dart';
import 'package:global_school/core/themes/app_gradients.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/online_lesson_model.dart';
import '../provider/online_lesson_provider.dart';

class OnlineLessonPage extends ConsumerWidget {
  const OnlineLessonPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Lessons'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: DebouncedSearch(
            onDebounceChange: (value) {
              // Update search query
              ref.read(onlineLessonSearchProvider.notifier).state = value;
              // Refresh the list
              ref.read(onlineLessonsProvider(id).notifier).refresh();
            },
          ),
        ),
      ),
      body: PaginatedListWidget<OnlineLesson>(
        provider: onlineLessonsProvider(id),
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
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppGradient.linearGradient,
              ),
              child: Center(
                child: Text(
                  lesson.id.toString(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lesson.topic ?? 'No Topic',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Created By: ${lesson.creatingByName ?? 'Unknown'}'),
                ],
              ),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {
                context.pushNamed(
                  AppRoutes.studentOnlineLessonDetails.name,
                  pathParameters: {
                    'lessonId': lesson.id?.toString() ?? '',
                  },
                );
              },
              icon:
                  const Icon(Icons.arrow_forward_ios, color: AppColors.green1),
            ),
          ],
        ),
      ),
    );
  }
}
