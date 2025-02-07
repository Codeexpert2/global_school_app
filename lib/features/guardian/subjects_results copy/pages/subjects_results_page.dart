import 'package:flutter/material.dart';

class ChildSubjectsResultsPage extends StatelessWidget {
  const ChildSubjectsResultsPage({
    super.key,
    required this.childId,
  });

  final String childId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subjects Results $childId'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Subjects Results Page'),
            Text('This is the child results page.'),
          ],
        ),
      ),
    );
  }
}
