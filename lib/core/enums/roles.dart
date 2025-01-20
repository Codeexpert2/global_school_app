enum Roles {
  superAdmin,
  admin,
  teacher,
  student,
  guardian,
  librarian,
  supervisor;

  String get name {
    switch (this) {
      case Roles.superAdmin:
        return 'Super Admin';
      case Roles.admin:
        return 'Admin';
      case Roles.teacher:
        return 'Teacher';
      case Roles.student:
        return 'Student';
      case Roles.guardian:
        return 'Guardian';
      case Roles.librarian:
        return 'Librarian';
      case Roles.supervisor:
        return 'Supervisor';
    }
  }
}

extension RolesExtension on String {
  Roles? get toRole => switch (toLowerCase()) {
        'superadmin' => Roles.superAdmin,
        'admin' => Roles.admin,
        'teacher' => Roles.teacher,
        'student' => Roles.student,
        'guardian' => Roles.guardian,
        'librarian' => Roles.librarian,
        'supervisor' => Roles.supervisor,
        _ => null
      };
}
