import 'package:flutter/material.dart';
import 'package:global_school/core/router/app_routes.dart';

class LessonSelectionPage extends StatelessWidget {
  const LessonSelectionPage({super.key, required this.subjectId});
  final String subjectId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Lesson Type'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLessonButton(
              icon: Icons.videocam,
              text: 'Online Lesson',
              color: Colors.blue,
              onTap: () {
                context.pushNamed(AppRoutes.studentOnlineLesson.name,
                    pathParameters: {'subjectId': subjectId});
              },
            ),
            const SizedBox(height: 20),
            _buildLessonButton(
              icon: Icons.location_on,
              text: 'Offline Lesson',
              color: Colors.green,
              onTap: () {},
            ),
            const SizedBox(height: 20),
            _buildLessonButton(
                icon: Icons.play_circle_fill,
                text: 'Recorded Lesson',
                color: Colors.orange,
                onTap: () {
                  context.pushNamed(AppRoutes.studentRecordedLesson.name,
                      pathParameters: {'subjectId': subjectId});
                }),
          ],
        ),
      ),
    );
  }

  Widget _buildLessonButton({
    required IconData icon,
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
