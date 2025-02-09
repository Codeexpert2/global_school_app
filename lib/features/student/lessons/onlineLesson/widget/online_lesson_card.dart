import 'package:flutter/material.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:global_school/core/themes/app_colors.dart';
import 'package:global_school/core/themes/app_gradients.dart';
import 'package:global_school/features/student/lessons/onlineLesson/model/online_lesson_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineLessonCard extends ConsumerWidget {
  const OnlineLessonCard({
    super.key,
    required this.lesson,
  });

  final OnlineLesson lesson;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppGradient.linearGradient,
              ),
              child: Center(
                child: Text(
                  lesson.id.toString(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lesson.topic ?? 'No Topic',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Created By: ${lesson.creatingByName ?? 'Unknown'}'),
                ],
              ),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {
                context.pushNamed(
                  AppRoutes.studentOnlineLessonDetails.name,
                  pathParameters: {
                    'lessonId': lesson.id?.toString() ?? '',
                  },
                );
              },
              icon:
                  const Icon(Icons.arrow_forward_ios, color: AppColors.green1),
            ),
          ],
        ),
      ),
    );
  }
}
