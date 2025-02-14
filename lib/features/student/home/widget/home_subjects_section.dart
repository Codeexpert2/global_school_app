import 'package:flutter/material.dart';
import 'package:global_school/components/loading/loading_widget.dart';
import 'package:global_school/features/student/home/widget/subject_card.dart';
import 'package:global_school/features/student/subjects/provider/subject_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeSubjectsSection extends ConsumerWidget {
  const HomeSubjectsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectsState = ref.watch(studentSubjectsProvider);

    return subjectsState.when(
      data: (subjects) {
        return SizedBox(
          height: 124,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              return SubjectCard(
                subject: subjects[index],
              );
            },
          ),
        );
      },
      loading: LoadingWidget.new,
      error: (error, stack) => Center(
        child: Text('Error: $error'),
      ),
    );
  }
}
