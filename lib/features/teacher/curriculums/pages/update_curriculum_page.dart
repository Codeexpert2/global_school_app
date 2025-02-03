import 'package:flutter/material.dart';

class UpdateCurriculumPage extends StatelessWidget {
  const UpdateCurriculumPage({
    super.key,
    required this.curriculumId,
  });

  final String curriculumId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UpdateCurriculum'),
      ),
      body: Form(
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Curriculum Name',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Curriculum Description',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Save the curriculum to the database
                print('Saving curriculum...');
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
