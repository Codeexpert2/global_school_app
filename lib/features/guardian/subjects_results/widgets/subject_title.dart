import 'package:flutter/material.dart';
import 'package:global_school/core/functions/generate_color_by_string.dart';

/// Widget for displaying the subject title
class SubjectTitle extends StatelessWidget {
  const SubjectTitle({
    super.key,
    required this.subjectName,
    required this.semester,
  });

  final String? subjectName;
  final String? semester;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          subjectName ?? 'Unknown Subject',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            // color: Colors.white,
            color: generateColorByString(subjectName),
          ),
        ),
        Text(
          semester ?? 'Unknown Semester',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
