import 'package:flutter/material.dart';
import 'package:global_school/core/enums/roles.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/widgets.dart';

class RootScreen extends ConsumerWidget {
  const RootScreen({
    super.key,
    required this.child,
    this.bottomNavigationBar,
  });

  final Widget child;
  final Widget? bottomNavigationBar;

  Widget _buildBottomNavigationBar() {
    final role = getCurrentRole();
    return switch (role) {
      UserRole.superAdmin => const SuperAdminBottomNavBar(),
      UserRole.admin => const AdminBottomNavBar(),
      UserRole.teacher => const TeacherBottomNavBar(),
      UserRole.student => const StudentBottomNavBar(),
      UserRole.guardian => const GuardianBottomNavBar(),
      UserRole.librarian => const LibrarianBottomNavBar(),
      UserRole.supervisor => const SupervisorBottomNavBar(),
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: child,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
