enum Semester {
  first,
  second;

  String get title {
    switch (this) {
      case first:
        return 'First Semester';
      case second:
        return 'Second Semester';
      default:
        return 'Invalid Semester';
    }
  }
}

extension SemestersExtension on String {
  Semester get toSemester => switch (toLowerCase()) {
        'first' => Semester.first,
        'second' => Semester.second,
        _ => Semester.first,
      };
}
