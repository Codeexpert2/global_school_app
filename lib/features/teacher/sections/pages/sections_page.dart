import 'package:flutter/material.dart';
import 'package:global_school/components/main/debounced_search_app_bar.dart';
import 'package:global_school/core/router/app_routes.dart';

class SectionsPage extends StatelessWidget {
  const SectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DebouncedSearchAppBar(
        title: 'Sections',
        onDebounceChange: (query) {
          // Update your search logic here
          // print('Search query: $query');
        },
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.school),
            title: Text('Section $index'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            subtitle: Text('Subsection $index'),
            onTap: () => context.pushNamed(
              AppRoutes.teacherSection.name,
              pathParameters: {
                'sectionId': '123', // Replace with actual section ID
              },
            ),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => context.pushNamed(
      //     AppRoutes.teacherNewSection.name,
      //   ),
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      // ),
    );
  }
}
