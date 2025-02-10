import 'package:flutter/material.dart';
import 'package:global_school/components/main/debounced_search_app_bar.dart';
import 'package:global_school/core/router/app_routes.dart';

class ExamsPage extends StatelessWidget {
  const ExamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DebouncedSearchAppBar(
        title: 'Exams',
        onDebounceChange: (query) {},
      ),
      body: const Center(
        child: Column(
          children: [
            ExamCard(),
            ExamCard(),
            ExamCard(),
            ExamCard(),
            ExamCard(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(
          AppRoutes.teacherNewExam.name,
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ExamCard extends StatelessWidget {
  const ExamCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.book),
      title: const Text('Exam 1'),
      onTap: () => context.pushNamed(
        AppRoutes.teacherExam.name,
        pathParameters: {
          'examId': '1',
        },
      ),
      trailing: const Icon(Icons.edit),
    );
  }
}
