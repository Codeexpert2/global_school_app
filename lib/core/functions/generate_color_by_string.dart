import 'dart:math';
import 'package:flutter/material.dart';

Color generateColorByString(String? str) {
  if (str == null || str.isEmpty) {
    return Colors.blueGrey.shade600; // Default color for null/empty subjects
  }

  // Convert subject name to hash
  int hash = str.codeUnits.fold(0, (prev, char) => prev + char);
  Random random = Random(hash);

  // Generate an HSL color with varying hues but controlled saturation & lightness
  return HSLColor.fromAHSL(
    1.0, // Full opacity
    random.nextDouble() * 360, // Random hue (0-360)
    0.6, // Keep saturation moderate
    0.5, // Keep lightness balanced
  ).toColor();
}
