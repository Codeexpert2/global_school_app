import 'package:flutter/material.dart';
import 'package:global_school/core/enums/semester.dart';
import 'package:global_school/features/guardian/subjects_results/providers/subjects_results_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SemesterDropdown extends ConsumerWidget {
  const SemesterDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSemesterState = ref.watch(selectedSemesterProvider);

    return DropdownButton<Semester>(
      value: selectedSemesterState,
      items: [
        const DropdownMenuItem<Semester>(
          value: Semester.first,
          child: Text('First Semester'),
        ),
        const DropdownMenuItem<Semester>(
          value: Semester.second,
          child: Text('Second Semester'),
        ),
      ],
      onChanged: (value) {
        ref.read(selectedSemesterProvider.notifier).state =
            value ?? Semester.first;
      },
    );
  }
}
