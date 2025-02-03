import 'package:flutter/material.dart';

class CurriculumPage extends StatelessWidget {
  const CurriculumPage({
    super.key,
    required this.curriculumId,
  });

  final String curriculumId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Curriculum'),
      ),
      body: const Center(
        child: Column(
          children: [
            Text('Subject 1'),
            Text('Subject 2'),
            Text('Subject 3'),
            Text('Subject 4'),
            Text('Subject 5'),
            Text('Subject 6'),
            Text('Subject 7'),
            Text('Subject 8'),
            Text('Subject 9'),
            Text('Subject 10'),
            Text('Subject 11'),
            Text('Subject 12'),
            Text('Subject 13'),
            Text('Subject 14'),
            Text('Subject 15'),
            Text('Subject 16'),
            Text('Subject 17'),
            Text('Subject 18'),
            Text('Subject 19'),
            Text('Subject 20'),
            Text('Subject 21'),
          ],
        ),
      ),
    );
  }
}
