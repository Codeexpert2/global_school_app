import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:template/features/root/constants/destinations.dart';
import 'package:template/features/root/providers/root_notifier.dart';

class RootScreen extends ConsumerWidget {
  const RootScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(rootProvider.notifier);
    return Scaffold(
      body: child,
      bottomNavigationBar: state.isExcludedPage()
          ? null
          : NavigationBar(
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
              selectedIndex: state.getIndex,
              destinations: destinations,
              onDestinationSelected: state.onTap,
            ),
    );
  }
}
