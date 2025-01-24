import 'package:flutter/material.dart';
import 'package:global_school/features/student/offlineLesson/provider/offline_lesson_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflineLessonDetailsPage extends HookConsumerWidget {

  const OfflineLessonDetailsPage({super.key, required this.lessonId});
  final int lessonId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessonDetailsAsync =
        ref.watch(offlineLessonDetailsProvider(lessonId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الدرس'),
      ),
      body: lessonDetailsAsync.when(
        data: (lesson) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lesson.topic ?? 'بدون عنوان',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text('الصف: ${lesson.classId}'),
                Text('القسم: ${lesson.sectionId}'),
                if (lesson.file != null) Text('الملف: ${lesson.file}'),
                if (lesson.images != null) Text('الصور: ${lesson.images}'),
                if (lesson.videos != null) Text('الفيديو: ${lesson.videos}'),
                if (lesson.url != null) Text('الرابط: ${lesson.url}'),
                if (lesson.createdAt != null)
                  Text('تاريخ الإنشاء: ${lesson.createdAt}'),
                if (lesson.updatedAt != null)
                  Text('تاريخ التحديث: ${lesson.updatedAt}'),
              ],
            ),
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
