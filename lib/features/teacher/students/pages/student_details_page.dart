import 'package:flutter/material.dart';
import 'package:global_school/core/router/app_routes.dart';

class StudentDetailsPage extends StatelessWidget {
  const StudentDetailsPage({
    super.key,
    required this.studentId,
  });

  final String studentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
      ),
      body: const Center(
        child: Column(
          children: [
            Text('Student Name: John Doe'),
            Text('Student ID: 12345'),
            Text('Student Age: 18'),
            Text('Student Grade: A'),
            Text('Student Address: 123 Main St, City, State, ZIP'),
            Text('Student Phone: 123-456-7890'),
            Text('Student Email: johndoe@example.com'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.pushNamed(
          AppRoutes.teacherUpdateStudent.name,
          pathParameters: {
            'studentId': studentId,
          },
        ),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        label: const Text(
          'Edit',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
