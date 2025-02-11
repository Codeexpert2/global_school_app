import 'package:flutter/material.dart';
import 'package:global_school/components/form/debounced_search.dart';
import 'package:global_school/core/locale/generated/l10n.dart';
import 'package:global_school/core/pagination/paginated_list_widget.dart';
import 'package:global_school/features/student/recorded_lesson/model/recorded_lesson_model.dart';
import 'package:global_school/features/student/recorded_lesson/widget/recorded_lesson_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:global_school/features/student/recorded_lesson/provider/recorded_lesson_provider.dart';

class RecordedLessonPage extends HookConsumerWidget {
  const RecordedLessonPage({super.key, required this.subjectId});
  final String subjectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).recordedLessons),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: DebouncedSearch(
            onDebounceChange: (value) {
              // Update search query
              ref.read(recordedLessonSearchProvider.notifier).state = value;
              // Refresh the list
              ref.read(recordedLessonProvider(subjectId).notifier).refresh();
            },
          ),
        ),
      ),
      body: PaginatedListWidget<RecordedLessonModel>(
        provider: recordedLessonProvider(subjectId),
        itemBuilder: (context, lesson) {
          return RecordedLessonCard(
            lesson: lesson,
          );
        },
      ),
    );
  }
}
