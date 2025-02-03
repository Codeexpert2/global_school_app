import 'package:flutter/material.dart';

class UpdateStudentPage extends StatelessWidget {
  const UpdateStudentPage({
    super.key,
    required this.studentId,
  });

  final String studentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Student id $studentId'),
      ),
      body: Form(
        child: Column(
          children: [
            const Text('Update Student Page'),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Student ID'),
              onChanged: (value) {
                // Update student ID
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'First Name'),
              onChanged: (value) {
                // Update first name
              },
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Last Name'),
              onChanged: (value) {
                // Update last name
              },
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                // Update email
              },
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Update student data and navigate back to the StudentListPage
              },
              child: const Text('Update'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate back to the StudentListPage
              },
              child: const Text('Cancel'),
            ),

            const SizedBox(height: 32),
            // Additional fields for updating other student details, if needed
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Update student data and navigate back to the StudentListPage
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
