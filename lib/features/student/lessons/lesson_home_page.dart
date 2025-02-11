import 'package:flutter/material.dart';
import 'package:global_school/components/main/main_appbar.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../subjects/provider/subject_provider.dart';

class LessonHomePage extends StatelessWidget {
  const LessonHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: 'اختر نوع الدرس',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => context.pushNamed(
              AppRoutes.studentOnlineLesson.name,
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle: const TextStyle(fontSize: 18),
            ),
            child: const Text('الدروس عبر الإنترنت (Online Lessons)'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => context.pushNamed(
              AppRoutes.studentOfflineLessons.name,
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle: const TextStyle(fontSize: 18),
            ),
            child: const Text('الدروس خارج الإنترنت (Offline Lessons)'),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Subject Section',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),

          // subjects grid
          const Expanded(child: SubjectSection()),
        ],
      ),
    );
  }
}

class SubjectSection extends ConsumerWidget {
  const SubjectSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjects = ref.watch(studentSubjectsProvider);

    return subjects.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
      data: (response) {
        final subjects = response.data ?? [];
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            final subject = subjects[index];
            return ListTile(
              contentPadding: const EdgeInsets.all(12),
              tileColor: Theme.of(context).shadowColor.withOpacity(.05),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              title: Text(
                '${subject.name}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              leading: const Icon(Icons.subject),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to subject details page
                // context.pushNamed(AppRoutes.subjectDetails.name,
                //     arguments: subject);
              },
              subtitle: Text(
                '${subject.level}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          },
        );
      },
    );
  }
}
