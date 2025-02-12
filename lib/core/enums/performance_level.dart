import 'package:flutter/material.dart';

import 'package:global_school/core/locale/generated/l10n.dart';

enum PerformanceLevel {
  excellent,
  good,
  accepted,
  bad,
  veryBad,
}

/// Determines the performance level based on the student's mark
PerformanceLevel getPerformanceLevel(int mark) {
  if (mark >= 90) return PerformanceLevel.excellent;
  if (mark >= 75) return PerformanceLevel.good;
  if (mark >= 50) return PerformanceLevel.accepted;
  if (mark >= 30) return PerformanceLevel.bad;
  return PerformanceLevel.veryBad;
}

/// Returns the level color and text based on the mark
(Color, String) getLevelInfo(int? mark) {
  if (mark == null) return (Colors.grey, 'N/A');

  final level = getPerformanceLevel(mark);
  switch (level) {
    case PerformanceLevel.excellent:
      return (Colors.green, S.current.excellent);
    case PerformanceLevel.good:
      return (Colors.blue, S.current.good);
    case PerformanceLevel.accepted:
      return (Colors.orange, S.current.accepted);
    case PerformanceLevel.bad:
      return (Colors.red, S.current.bad);
    case PerformanceLevel.veryBad:
      return (Colors.black, S.current.veryBad);
  }
}
