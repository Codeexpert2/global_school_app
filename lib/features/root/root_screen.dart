import 'package:flutter/material.dart';
import 'package:global_school/core/enums/roles.dart';
import 'package:global_school/core/keys/keys.dart';
import 'package:global_school/core/log/app_logs.dart';
import 'package:global_school/features/auth/data/models/auth_model.dart';
import 'package:global_school/initialize_app.dart';
import 'package:global_school/services/local_storage/storage_service.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/widgets.dart';

final storageService = locator<StorageService>();

class RootScreen extends ConsumerWidget {
  const RootScreen({
    super.key,
    required this.child,
    this.bottomNavigationBar,
  });

  final Widget child;
  final Widget? bottomNavigationBar;

  Widget _buildBottomNavigationBar() {
    final storedJson = storageService.readJson(localUserKey);
    AppLog.debug('storedJson: $storedJson');

    // if (storedJson == null) return const SizedBox.shrink();

    // final role = AuthModel.fromJson(storedJson).data?.role?.toRole;
    final role = Roles.student;

    AppLog.debug('role: $role');

    return switch (role) {
      Roles.superAdmin => const SuperAdminBottomNavBar(),
      Roles.admin => const AdminBottomNavBar(),
      Roles.teacher => const TeacherBottomNavBar(),
      Roles.student => const StudentBottomNavBar(),
      Roles.guardian => const GuardianBottomNavBar(),
      Roles.librarian => const LibrarianBottomNavBar(),
      Roles.supervisor => const SupervisorBottomNavBar(),
      _ => const SizedBox.shrink()
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
