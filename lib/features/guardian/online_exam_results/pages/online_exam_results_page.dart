import 'package:flutter/material.dart';

class ChildOnlineExamResultsPage extends StatelessWidget {
  const ChildOnlineExamResultsPage({
    super.key,
    required this.childId,
  });

  final String childId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Exam Results'),
      ),
      body: Center(
        child: Text('Child ID: $childId'),
      ),
    );
  }
}
