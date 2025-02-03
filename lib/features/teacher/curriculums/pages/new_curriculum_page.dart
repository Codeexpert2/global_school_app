import 'package:flutter/material.dart';

class NewCurriculumPage extends StatelessWidget {
  const NewCurriculumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Curriculum'),
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
