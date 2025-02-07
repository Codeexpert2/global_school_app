import 'package:flutter/material.dart';
import 'package:global_school/features/guardian/subjects_results/providers/subjects_results_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SubjectDropdown extends ConsumerWidget {
  const SubjectDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSubjectIdState = ref.watch(selectedSubjectIdProvider);

    return DropdownButton<String>(
      value: selectedSubjectIdState,
      items: [
        const DropdownMenuItem<String>(value: '1', child: Text('Math')),
        const DropdownMenuItem<String>(value: '2', child: Text('Science')),
        const DropdownMenuItem<String>(value: '3', child: Text('English')),
        const DropdownMenuItem<String>(
            value: '4', child: Text('Social Studies')),
        const DropdownMenuItem<String>(value: '5', child: Text('Geography')),
        const DropdownMenuItem<String>(value: '6', child: Text('History')),
        const DropdownMenuItem<String>(value: '7', child: Text('Music')),
      ],
      onChanged: (value) {
        ref.read(selectedSubjectIdProvider.notifier).state = value ?? '';
      },
    );
  }
}
