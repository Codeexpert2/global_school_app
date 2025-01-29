import 'package:flutter/material.dart';
import 'package:global_school/core/pagination/paginated_list_widget.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/offline_lesson_model.dart';
import '../provider/offline_lesson_provider.dart';

class OfflineLessonsPage extends HookConsumerWidget {
  const OfflineLessonsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الدروس الافتراضية',
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              onChanged: (value) {
                // Update search query
                ref.read(offlineLessonSearchProvider.notifier).state = value;
                // Refresh the list
                ref.read(offlineLessonsProvider.notifier).refresh();
              },
            ),
          ),
        ),
      ),
      body: PaginatedListWidget<OfflineLesson>(
        provider: offlineLessonsProvider,
        // loadTriggerThreshold: 1,
        itemBuilder: (context, lesson) {
          final topic = lesson.topic ?? 'بدون عنوان';
          final classId = lesson.classId ?? 'غير محدد';
          final sectionId = lesson.sectionId ?? 'غير محدد';
          final lessonId = lesson.id ?? 0;
          return ListTile(
            title: Text(topic),
            subtitle: Text(
              'الصف: $classId - القسم: $sectionId',
            ),
            onTap: () {
              context.pushNamed(
                AppRoutes.studentOfflineLessonsDetails.name,
                pathParameters: {
                  'lessonId': lessonId.toString(),
                },
              );
            },
          );
        },
      ),
    );
  }
}
