import 'package:flutter/material.dart';
import 'package:global_school/core/locale/generated/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/student_root_notifier.dart';

class StudentBottomNavBar extends ConsumerWidget {
  const StudentBottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(studentRootProvider);
    final state = ref.read(studentRootProvider.notifier);

    return NavigationBar(
      elevation: 1,
      animationDuration: Durations.medium1,
      shadowColor: Theme.of(context).shadowColor,
      surfaceTintColor: Theme.of(context).shadowColor,
      indicatorColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).canvasColor,
      selectedIndex: index,
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.home_outlined),
          selectedIcon: const Icon(Icons.home),
          label: S.of(context).home,
        ),
        NavigationDestination(
          icon: const Icon(Icons.play_lesson_outlined),
          selectedIcon: const Icon(Icons.play_lesson),
          label: S.of(context).lessons,
        ),
        NavigationDestination(
          icon: const Icon(Icons.assignment_outlined),
          selectedIcon: const Icon(Icons.assignment),
          label: S.of(context).exams,
        ),
        NavigationDestination(
          icon: const Icon(Icons.games_outlined),
          selectedIcon: const Icon(Icons.games),
          label: S.of(context).games,
        ),
        NavigationDestination(
          icon: const Icon(Icons.person_outline),
          selectedIcon: const Icon(Icons.person),
          label: S.of(context).profile,
        ),
      ],
      onDestinationSelected: state.onTap,
    );
  }
}
