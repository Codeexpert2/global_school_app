import 'package:flutter/material.dart';
import 'package:global_school/core/locale/generated/l10n.dart';
import 'package:global_school/core/themes/app_colors.dart';
import 'package:global_school/core/themes/app_gradients.dart';
import 'package:global_school/features/student/lessons/recorded_lesson/model/recorded_lesson_model.dart';

class RecordedLessonCard extends StatelessWidget {
  const RecordedLessonCard({super.key, required this.lesson});

  final Datum lesson;

  @override
  Widget build(BuildContext context) {
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
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lesson.title ?? S.of(context).noTitle,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    lesson.description ?? S.of(context).noDescription,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {
                // فتح رابط الفيديو
                if (lesson.url != null) {
                  _launchURL(context, lesson.url!);
                }
              },
              icon: const Icon(Icons.play_circle_fill, color: AppColors.green1),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(BuildContext context, String url) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('فتح الرابط: $url')),
    );
  }
}
