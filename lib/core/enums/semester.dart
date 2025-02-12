import 'package:global_school/core/locale/generated/l10n.dart';

enum Semester {
  all,
  first,
  second;

  String get title {
    switch (this) {
      case all:
        return S.current.all;
      case first:
        return S.current.firstSemester;
      case second:
        return S.current.secondSemester;
      default:
        return 'Invalid Semester';
    }
  }
}

extension SemestersExtension on String {
  Semester get toSemester => switch (toLowerCase()) {
        'all' => Semester.all,
        'first' => Semester.first,
        'second' => Semester.second,
        _ => Semester.first,
      };
}
