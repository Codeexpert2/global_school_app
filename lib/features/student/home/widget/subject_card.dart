import 'package:flutter/material.dart';

import 'package:global_school/core/extensions/extensions.dart';
import 'package:global_school/core/functions/generate_color_by_string.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key,
    required this.subject,
  });

  final dynamic subject;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: context.width / 5,
      child: Column(
        children: [
          CircleAvatar(
            radius: 28.0,
            backgroundColor: Colors.grey.shade200,
            child: Icon(
              Icons.book,
              color: generateColorByString(
                '${subject.name}',
              ),
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            '${subject.name}',
            maxLines: 2,
            style: const TextStyle(fontSize: 14.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
