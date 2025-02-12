import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/core/enums/semester.dart';

import '../providers/subjects_results_provider.dart';

class SemesterDropdown extends ConsumerWidget {
  const SemesterDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSemesterState = ref.watch(selectedSemesterProvider);

    return DropdownButton<Semester?>(
      elevation: 2,
      underline: const SizedBox(),
      borderRadius: BorderRadius.circular(8),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
      value: selectedSemesterState,
      items: [
        DropdownMenuItem<Semester?>(
          value: null,
          child: Text(Semester.all.title),
        ),
        DropdownMenuItem<Semester>(
          value: Semester.first,
          child: Text(Semester.first.title),
        ),
        DropdownMenuItem<Semester>(
          value: Semester.second,
          child: Text(Semester.second.title),
        ),
      ],
      onChanged: (Semester? value) {
        ref.read(selectedSemesterProvider.notifier).state = value;
      },
    );
  }
}
