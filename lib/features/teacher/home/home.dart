import 'package:flutter/material.dart';
import 'package:global_school/components/main/main_appbar.dart';
import 'package:global_school/components/main/main_drawer.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/core/router/app_routes.dart';
import 'package:global_school/core/locale/generated/l10n.dart';

class TeacherHomeScreen extends ConsumerWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const MainAppBar(
        title: 'Hello Teacher',
      ),
      drawer: const MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.of(context).welcomeToTheHomeScreen),
            TextButton(
              onPressed: () => context.pushNamed('ar'),
              child: const Text('Ar'),
            ),
            TextButton(
              onPressed: () => context.pushNamed(
                AppRoutes.teacherCurriculums.name,
              ),
              child: const Text('Curriculums'),
            ),
            TextButton(
              onPressed: () => context.pushNamed(
                AppRoutes.teacherExams.name,
              ),
              child: const Text('Exams'),
            ),
            TextButton(
              onPressed: () => context.pushNamed(
                AppRoutes.teacherSections.name,
              ),
              child: const Text('Sections'),
            ),
            TextButton(
              onPressed: () => context.pushNamed(
                AppRoutes.teacherStudents.name,
              ),
              child: const Text('Students'),
            ),
          ],
        ),
      ),
    );
  }
}
