import 'package:flutter/material.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/offline_lesson_provider.dart';

class OfflineLessonsPage extends HookConsumerWidget {
  const OfflineLessonsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offlineLessonsAsync = ref.watch(offlineLessonProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('الدروس الافتراضية'),
      ),
      body: offlineLessonsAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Text('حدث خطأ: $error'),
        ),
        data: (offlineLessons) {
          if (offlineLessons.isEmpty) {
            return const Center(
              child: Text('لا توجد دروس متاحة.'),
            );
          }

          return ListView.builder(
            itemCount: offlineLessons.length,
            itemBuilder: (context, index) {
              final lesson = offlineLessons[index];

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
          );
        },
      ),
    );
  }
}
