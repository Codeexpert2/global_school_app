import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/components/loading/loading_widget.dart';
import 'package:global_school/components/main/custom_section_header.dart';
import 'package:global_school/components/main/logo.dart';
import 'package:global_school/components/main/main_appbar.dart';
import 'package:global_school/components/main/main_drawer.dart';
import 'package:global_school/core/locale/generated/l10n.dart';
import 'package:global_school/core/router/app_routes.dart';

import '../subjects/provider/subject_provider.dart';

import 'widget/subject_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjects = ref.watch(studentSubjectsProvider);

    return Scaffold(
      appBar: MainAppBar(
        title: const Logo(
          height: kToolbarHeight,
        ),
        actions: [
          IconButton(
            icon: const Badge(
              offset: Offset(-8, -8),
              label: Text(
                '9',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
              child: Icon(Icons.notifications),
            ),
            onPressed: () => context.pushNamed(
              AppRoutes.notifications.name,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.pushNamed(
              AppRoutes.settings.name,
            ),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: subjects.when(
        data: (subjects) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildWelcomeCard(context),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      _buildCircularProgressCard(
                        context,
                        title: S.of(context).fees,
                        progress: 0.75,
                        color: Colors.blue.shade100,
                      ),
                      const SizedBox(width: 16.0),
                      _buildCircularProgressCard(
                        context,
                        title: S.of(context).attendanceRate,
                        progress: 0.4,
                        color: Colors.red.shade100,
                      ),
                    ],
                  ),
                ),
                HomeSectionHeader(
                  title: S.of(context).mySubjects,
                  actionText: S.of(context).viewAll,
                  onActionTap: () => context.pushNamed(
                    AppRoutes.studentSubjects.name,
                  ),
                ),
                SizedBox(
                  height: 124,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: subjects.length,
                    itemBuilder: (context, index) {
                      return SubjectCard(
                        subject: subjects[index],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.trending_up_rounded),
                      const SizedBox(width: 8.0),
                      Text(
                        S.of(context).yourProgressToday,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                _buildProgressCard(context),
                const SizedBox(height: 16.0),
                HomeSectionHeader(
                  title: S.of(context).onlineLessons,
                  actionText: S.of(context).viewAll,
                  onActionTap: () => context.pushNamed(
                    AppRoutes.studentLessonHome.name,
                  ),
                ),
                HomeSectionHeader(
                  title: S.of(context).recordedLessons,
                  actionText: S.of(context).viewAll,
                  onActionTap: () => context.pushNamed(
                    AppRoutes.studentSubjects.name,
                  ),
                ),
                HomeSectionHeader(
                  title: S.of(context).subjectResults,
                  actionText: S.of(context).viewAll,
                  onActionTap: () => context.pushNamed(
                    AppRoutes.studentSubjectResults.name,
                    pathParameters: {
                      // 'subjectId': subjectId,
                    },
                  ),
                ),
              ],
            ),
          );
        },
        loading: LoadingWidget.new,
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildWelcomeCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).beCuriousExplore,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  S.of(context).learnAndShapeYourFuture,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.computer,
            size: 48.0,
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          leading: CircleAvatar(
            radius: 24.0,
            backgroundColor: Colors.green.shade100,
            child: const Icon(
              Icons.school,
              color: Colors.green,
            ),
          ),
          title: Text(
            S.of(context).mathematics,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: const Text('20/24 Videos'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '90%',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                S.of(context).courseCompleted,
                style: const TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircularProgressCard(
    BuildContext context, {
    required String title,
    required double progress,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8.0),
            Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation(
                    Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
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
