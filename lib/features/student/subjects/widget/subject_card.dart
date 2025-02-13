import 'package:flutter/material.dart';

import 'package:global_school/core/router/app_routes.dart';

import '../models/subject_model.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key,
    required this.subject,
  });

  final Datum subject;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          AppRoutes.studentLessonSelection.name,
          pathParameters: {
            'subjectId': subject.id.toString(),
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            Text(
              '${subject.name}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${subject.level}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
