import 'package:flutter/material.dart';
import 'package:global_school/core/locale/generated/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/guardian_root_notifier.dart';

class GuardianBottomNavBar extends ConsumerWidget {
  const GuardianBottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(guardianRootProvider);
    final state = ref.read(guardianRootProvider.notifier);

    return NavigationBar(
      elevation: 1,
      animationDuration: Durations.medium1,
      shadowColor: Theme.of(context).shadowColor,
      surfaceTintColor: Theme.of(context).shadowColor,
      indicatorColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).canvasColor,
      // indicatorShape: const OutlineInputBorder(
      //   borderRadius: BorderRadius.vertical(
      //     top: Radius.circular(50),
      //   ),
      // ),
      selectedIndex: index,
      onDestinationSelected: state.onTap,
      destinations: [
        NavigationDestination(
          selectedIcon: const Icon(Icons.home),
          icon: const Icon(Icons.home_outlined),
          label: S.of(context).home,
        ),
        NavigationDestination(
          icon: const Badge(child: Icon(Icons.notifications_sharp)),
          label: S.of(context).notifications,
        ),
        NavigationDestination(
          icon: const Icon(Icons.person_outline),
          selectedIcon: const Icon(Icons.person),
          label: S.of(context).profile,
        ),
      ],
    );
  }
}
