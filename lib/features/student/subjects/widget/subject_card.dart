import 'package:flutter/material.dart';

import 'package:global_school/core/functions/generate_color_by_string.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:global_school/core/themes/app_colors.dart';

import '../models/subject_model.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key,
    required this.subject,
  });

  final Subject subject;

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
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              generateColorByString(
                '${subject.name}',
              ).withOpacity(.6),
              generateColorByString(
                '${subject.name}',
              ).withOpacity(.75),
              generateColorByString(
                '${subject.name}',
              ).withOpacity(.9),
              generateColorByString(
                '${subject.name}',
              ),
            ],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Icon(
                Icons.book,
                size: 100,
                color: AppColors.gray50.withOpacity(.1),
              ),
            ),
            Column(
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
          ],
        ),
      ),
    );
  }
}
