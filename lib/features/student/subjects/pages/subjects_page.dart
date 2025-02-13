import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/components/errors/no_content_indicator.dart';
import 'package:global_school/components/loading/loading_widget.dart';
import 'package:global_school/components/main/main_appbar.dart';
import 'package:global_school/core/locale/generated/l10n.dart';

import '../models/subject_model.dart';
import '../provider/subject_provider.dart';
import '../widget/subject_card.dart';

class SubjectsPage extends ConsumerWidget {
  const SubjectsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjects = ref.watch(studentSubjectsProvider);
    return Scaffold(
      appBar: MainAppBar(
        title: S.of(context).subjects,
      ),
      body: subjects.when(
        loading: LoadingWidget.new,
        error: (error, stack) => NoContentIndicator(
          message: error.toString(),
        ),
        data: (SubjectModel res) {
          final subjects = res.data ?? [];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
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
                );
              },
            ),
          );
        },
      ),
    );
  }
}
