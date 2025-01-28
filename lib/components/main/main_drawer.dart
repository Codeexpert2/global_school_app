import 'package:flutter/material.dart';
import 'package:global_school/core/themes/app_colors.dart';
import 'package:global_school/core/themes/app_gradients.dart';
import 'package:global_school/features/student/subject_results.dart/page/subject_results_page.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/core/router/app_routes.dart';
import 'package:global_school/features/auth/providers/auth_provider.dart';
import 'app_divider.dart';

class MainDrawer extends ConsumerWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      bottom: false,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                context.goNamed(AppRoutes.profile.name);
              },
              child: DrawerHeader(
                decoration:
                    const BoxDecoration(gradient: AppGradient.linearGradient),
                padding: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          'https://www.example.com/user_image.png',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Ahmad Al-Dali',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(color: AppColors.white),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Daliahmad418@example.com',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: AppColors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text(
                'Calendar Page',
              ),
              onTap: () {
                Navigator.pop(context);
                context.pushNamed(AppRoutes.studentCalendar.name);
              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Courses'),
              onTap: () {
                Navigator.pop(context);
                context.pushNamed(AppRoutes.studentCourses.name);
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_to_photos_rounded),
              title: const Text(
                'Attachments',
              ),
              onTap: () {
                Navigator.pop(context);
                context.pushNamed(AppRoutes.studentAttachments.name);
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.assignment),
            //   title: const Text(
            //     'Exams',
            //   ),
            //   onTap: () {
            //     Navigator.pop(context);
            //     // context.pushNamed(AppRoutes.quizPage.name);
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const HomeExamPage(),
            //       ),
            //     );
            //   },
            // ),
            const AppDivider(),
            ListTile(
              leading: const Icon(Icons.sports_esports),
              title: const Text(
                'Games',
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // builder: (context) => const RecordedLessonPage(),
                    builder: (context) => const SubjectResultsPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text(
                'Help',
              ),
              onTap: () {
                Navigator.pop(context);
                context.pushNamed(AppRoutes.help.name);
              },
            ),
            const AppDivider(),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Theme.of(context).colorScheme.error,
              ),
              title: Text(
                'تسجيل الخروج',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                ref.read(authNotifierProvider.notifier).logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
