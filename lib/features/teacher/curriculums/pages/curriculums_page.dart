import 'package:flutter/material.dart';
import 'package:global_school/components/main/debounced_search_app_bar.dart';
import 'package:global_school/core/router/app_routes.dart';

class CurriculumsPage extends StatelessWidget {
  const CurriculumsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DebouncedSearchAppBar(
        title: 'Curriculums',
        onDebounceChange: (query) {
          // Update your search logic here
          // print('Search query: $query');
        },
      ),
      body: const Center(
        child: Column(
          children: [
            CurriculumCard(),
            CurriculumCard(),
            CurriculumCard(),
            CurriculumCard(),
            CurriculumCard(),
            CurriculumCard(),
            CurriculumCard(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(
          AppRoutes.teacherNewCurriculum.name,
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class CurriculumCard extends StatelessWidget {
  const CurriculumCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.book),
      trailing: const Icon(Icons.arrow_forward),
      title: const Text('Introduction to Computer Science'),
      subtitle: const Text('Learn the basics of computer science'),
      onTap: () {
        context.pushNamed(
          AppRoutes.teacherCurriculum.name,
          pathParameters: {
            'curriculumId': '1', // Replace with actual curriculum ID
          },
        );
      },
    );
  }
}
