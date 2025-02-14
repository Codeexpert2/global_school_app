import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/components/loading/loading_widget.dart';
import 'package:global_school/core/locale/generated/l10n.dart';

import '../models/subject_model.dart';
import '../provider/subject_provider.dart';

class SubjectDropdown extends ConsumerWidget {
  const SubjectDropdown({
    super.key,
    required this.selectedSubjectId,
    required this.onChanged,
  });

  final String? selectedSubjectId;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectsState = ref.watch(studentSubjectsProvider);

    return subjectsState.when(
      data: (List<Subject> subjects) {
        return DropdownButton<String?>(
          onChanged: onChanged,
          value: selectedSubjectId,
          elevation: 2,
          underline: const SizedBox(),
          borderRadius: BorderRadius.circular(8),
          padding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 12,
          ),
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
