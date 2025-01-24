import 'package:flutter/material.dart';

import 'attachments_tab.dart';

class SubjectAttachmentsPage extends StatelessWidget {
  const SubjectAttachmentsPage({super.key, required this.subjectName});

  final String subjectName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ملحقات $subjectName'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const AttachmentsTab(),
    );
  }
}
