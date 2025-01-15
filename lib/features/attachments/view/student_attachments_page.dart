import 'package:flutter/material.dart';

import 'attachments_tab.dart';
import 'subjects_tab.dart';


class StudentAttachmentsPage extends StatelessWidget {
  const StudentAttachmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ملحقات الطالب'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'ملحقات مادة'),
              Tab(text: 'ملحقات صف'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SubjectsTab(),
            AttachmentsTab(),
          ],
        ),
      ),
    );
  }
}
