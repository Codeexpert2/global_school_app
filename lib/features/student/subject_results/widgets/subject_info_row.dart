import 'package:flutter/material.dart';
import 'package:global_school/core/enums/performance_level.dart';

class SubjectInfoRow extends StatelessWidget {
  const SubjectInfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final dynamic value; // Handle both int and String

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.black;
    String displayValue = value?.toString() ?? 'N/A';
    String levelText = '';

    if (value is int) {
      final (color, level) = getLevelInfo(value);
      textColor = color;
      levelText = level;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              displayValue, // Show number
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              levelText, // Show result level
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
