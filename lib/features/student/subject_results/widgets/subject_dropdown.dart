import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/components/loading/loading_widget.dart';
import 'package:global_school/core/locale/generated/l10n.dart';

import '../model/subject_model.dart';
import '../provider/subject_results_provider.dart';

class SubjectDropdown extends ConsumerWidget {
  const SubjectDropdown({
    super.key,
    required this.subjectId,
  });
  final String subjectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectIdState = ref.watch(subjectIdProvider);
    final subjectsState = ref.watch(subjectsProvider);

    return subjectsState.when(
      data: (List<Subject> subjects) {
        return DropdownButton<String?>(
          elevation: 2,
          underline: const SizedBox(),
          borderRadius: BorderRadius.circular(8),
          padding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 12,
          ),
          value: subjectIdState,
          items: [
            DropdownMenuItem<String?>(
              value: null,
              child: Text(S.of(context).all),
            ),
            ...subjects.map(
              (Subject subject) => DropdownMenuItem<String>(
                value: subject.id.toString(),
                child: Text('${subject.name}'),
              ),
            )
          ],
          onChanged: (String? value) {
            ref.read(subjectIdProvider.notifier).state = value;
          },
        );
      },
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const SizedBox(
        height: 24,
        width: 24,
        child: LoadingWidget(),
      ),
    );
  }
}
