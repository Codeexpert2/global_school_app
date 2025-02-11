import 'package:flutter/material.dart';
import 'package:global_school/components/form/debounced_search.dart';
import 'package:global_school/core/locale/generated/l10n.dart';
import 'package:global_school/core/pagination/paginated_list_widget.dart';
import 'package:global_school/features/student/lessons/onlineLesson/widget/online_lesson_card.dart';
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
        title: Text(S.of(context).onlineLessons),
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
