import 'package:flutter/material.dart';
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
      destinations: studentBottomNavBarDestinations,
      onDestinationSelected: state.onTap,
    );
  }
}

const List<NavigationDestination> studentBottomNavBarDestinations = [
  NavigationDestination(
    icon: Icon(Icons.home_outlined),
    selectedIcon: Icon(Icons.home),
    label: 'Home',
  ),
  NavigationDestination(
    icon: Icon(Icons.play_lesson_outlined),
    selectedIcon: Icon(Icons.play_lesson),
    label: 'Lessons',
  ),
  NavigationDestination(
    icon: Icon(Icons.assignment_outlined),
    selectedIcon: Icon(Icons.assignment),
    label: 'Exams',
  ),
  NavigationDestination(
    icon: Icon(Icons.games_outlined),
    selectedIcon: Icon(Icons.games),
    label: 'Games',
  ),
  NavigationDestination(
    icon: Icon(Icons.person_outline),
    selectedIcon: Icon(Icons.person),
    label: 'Profile',
  ),
];
