import 'package:flutter/material.dart';

LinearGradient generateGradient(
  Color baseColor, {
  AlignmentGeometry begin = Alignment.topLeft,
  AlignmentGeometry end = Alignment.bottomRight,
}) {
  List<Color> gradientColors = [];

  for (int i = 3; i < 9; i++) {
    double factor = (i + 1) / 9;
    if (factor != 1) {
      gradientColors.add(
        baseColor.withOpacity(factor),
      );
    }
  }

  return LinearGradient(
    colors: gradientColors,
    begin: begin,
    end: end,
  );
}
