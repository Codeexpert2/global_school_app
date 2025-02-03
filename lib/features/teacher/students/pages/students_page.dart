import 'package:flutter/material.dart';
import 'package:global_school/components/main/debounced_search_app_bar.dart';
import 'package:global_school/core/router/app_routes.dart';

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DebouncedSearchAppBar(
        title: 'Students',
        onDebounceChange: (query) {
          // Update your search logic here
          // print('Search query: $query');
        },
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue,
            ),
            trailing: const Icon(Icons.info),
            title: const Text('Student Name'),
            subtitle: const Text('Student ID'),
            onTap: () => context.pushNamed(
              AppRoutes.teacherStudent.name,
              pathParameters: {
                'studentId': '123', // Replace with actual section ID
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(
          AppRoutes.teacherNewStudent.name,
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
