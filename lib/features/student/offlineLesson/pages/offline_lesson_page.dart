import 'package:flutter/material.dart';
import 'package:global_school/features/student/offlineLesson/pages/offline_lesson_details_page.dart';
import 'package:global_school/features/student/offlineLesson/provider/offline_lesson_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
              return ListTile(
                title: Text(lesson.topic ?? 'بدون عنوان'),
                subtitle: Text(
                    'الصف: ${lesson.classId} - القسم: ${lesson.sectionId}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OfflineLessonDetailsPage(lessonId: lesson.id!),
                    ),
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Text('حدث خطأ: $error'),
        ),
      ),
    );
  }
}
