import 'package:flutter/material.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Page'),
      ),
      body: const Center(
        child: Text('This is the exam page.'),
      ),
    );
  }
}
