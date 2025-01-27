import 'package:global_school/core/keys/keys.dart';
import 'package:global_school/features/auth/data/models/auth_model.dart';
import 'package:global_school/initialize_app.dart';
import 'package:global_school/services/local_storage/storage_service.dart';

enum UserRole {
  superAdmin,
  admin,
  teacher,
  student,
  guardian,
  librarian,
  supervisor;

  String get name {
    switch (this) {
      case UserRole.superAdmin:
        return 'Super Admin';
      case UserRole.admin:
        return 'Admin';
      case UserRole.teacher:
        return 'Teacher';
      case UserRole.student:
        return 'Student';
      case UserRole.guardian:
        return 'Guardian';
      case UserRole.librarian:
        return 'Librarian';
      case UserRole.supervisor:
        return 'Supervisor';
    }
  }
}

extension RolesExtension on String {
  UserRole? get toRole => switch (toLowerCase()) {
        'superadmin' => UserRole.superAdmin,
        'admin' => UserRole.admin,
        'teacher' => UserRole.teacher,
        'student' => UserRole.student,
        'guardian' => UserRole.guardian,
        'librarian' => UserRole.librarian,
        'supervisor' => UserRole.supervisor,
        _ => null
      };
}

UserRole getCurrentRole() {
  final storageService = locator<StorageService>();
  final storedJson = storageService.readJson(localUserKey);

  if (storedJson == null) return UserRole.student;

  final role = AuthModel.fromJson(storedJson).data?.role?.toRole;
  return role ?? UserRole.student;
}
