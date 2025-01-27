import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdminBottomNavBar extends ConsumerWidget {
  const AdminBottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      destinations: [
        const NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        const NavigationDestination(
          icon: Badge(child: Icon(Icons.notifications_sharp)),
          label: 'Notifications',
        ),
        const NavigationDestination(
          icon: Badge(
            label: Text('2'),
            child: Icon(Icons.messenger_sharp),
          ),
          label: 'Messages',
        ),
      ],
    );
  }
}
