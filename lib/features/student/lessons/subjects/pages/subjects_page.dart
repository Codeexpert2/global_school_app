import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:global_school/components/main/main_appbar.dart';
import 'package:global_school/features/student/lessons/subjects/provider/subject_provider.dart';
import 'package:global_school/features/student/lessons/subjects/widget/subject_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SubjectsPage extends ConsumerWidget {
  const SubjectsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjects = ref.watch(studentSubjectsProvider);
    return Scaffold(
      appBar: const MainAppBar(
        title: 'أهلاً وسهلاً',
        subtitleText: 'ابدأ رحلتك التعليمية الآن',
      ),
      body: subjects.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (response) {
          final subjects = response.data ?? [];
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: GridView.builder(
              itemCount: subjects.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final subject = subjects[index];
                return SubjectCard(
                  subject: subject,
                  onTap: () {
                    log('تم اختيار ${subject.name}');
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
