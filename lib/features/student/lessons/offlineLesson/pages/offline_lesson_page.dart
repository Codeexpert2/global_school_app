import 'package:flutter/material.dart';
import 'package:global_school/components/form/debounced_search.dart';
import 'package:global_school/core/pagination/paginated_list_widget.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:global_school/core/themes/app_colors.dart';
import 'package:global_school/core/themes/app_gradients.dart';
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
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: DebouncedSearch(
              onDebounceChange: (value) {
                ref.read(offlineLessonSearchProvider.notifier).state = value;
                ref.read(offlineLessonsProvider.notifier).refresh();
              },
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PaginatedListWidget<OfflineLesson>(
          provider: offlineLessonsProvider,
          itemBuilder: _buildLessonCard,
        ),
      ),
    );
  }

  Widget _buildLessonCard(BuildContext context, OfflineLesson lesson) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Container(
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
        title: Text(
          lesson.topic ?? 'بدون عنوان',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'الصف: ${lesson.classId ?? 'غير محدد'} - القسم: ${lesson.sectionId ?? 'غير محدد'}',
          style: TextStyle(color: Colors.grey[700]),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: AppColors.green1),
        onTap: () {
          context.pushNamed(
            AppRoutes.studentOfflineLessonsDetails.name,
            pathParameters: {'lessonId': lesson.id.toString()},
          );
        },
      ),
    );
  }
}
