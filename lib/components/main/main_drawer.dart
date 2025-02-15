import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/core/locale/generated/l10n.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:global_school/core/themes/app_colors.dart';
import 'package:global_school/core/themes/app_gradients.dart';
import 'package:global_school/features/auth/providers/auth_provider.dart';
import 'package:global_school/features/shared/settings/pages/settings_screen.dart';
import 'package:global_school/features/student/word_wall/page/word_wall_page.dart';

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
                decoration: const BoxDecoration(
                  gradient: AppGradient.linearGradient,
                ),
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
            // ListTile(
            //   leading: const Icon(Icons.school),
            //   title: const Text('Courses'),
            //   onTap: () {
            //     Navigator.pop(context);
            //     context.pushNamed(AppRoutes.studentCourses.name);
            //   },
            // ),
            ListTile(
              leading: const Icon(Icons.add_to_photos_rounded),
              title: const Text(
                'Certificates',
              ),
              onTap: () {
                Navigator.pop(context);
                context.pushNamed(AppRoutes.studentCertificates.name);
              },
            ),
            const AppDivider(),
            ListTile(
              leading: const Icon(Icons.sports_esports),
              title: const Text(
                'Word Wall',
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WordWallPage(),
                    // builder: (context) => const AccessoriesPage(
                    //   sectionId: 3,
                    // ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title:  Text(
                S.of(context).help,
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
