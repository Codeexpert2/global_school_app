import 'package:flutter/material.dart';
import 'package:global_school/core/router/app_routes.dart';

class LessonHomePage extends StatelessWidget {
  const LessonHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اختر نوع الدرس'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.pushNamed(AppRoutes.studentOnlineLesson.name);
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('الدروس عبر الإنترنت (Online Lessons)'),
            ),
            const SizedBox(height: 20), 
            ElevatedButton(
              onPressed: () {
                context.pushNamed(AppRoutes.studentOfflineLessons.name);
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('الدروس خارج الإنترنت (Offline Lessons)'),
            ),
          ],
        ),
      ),
    );
  }
}
