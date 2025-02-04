import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({super.key, required this.subject});
  final dynamic subject;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28.0,
          backgroundColor: Colors.grey.shade200,
          child: Icon(
            Icons.book,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          '${subject.name}',
          style: const TextStyle(fontSize: 12.0),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
