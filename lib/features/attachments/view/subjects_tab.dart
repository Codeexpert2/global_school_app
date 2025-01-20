import 'package:flutter/material.dart';
import 'package:global_school/core/themes/app_colors.dart';
import 'package:global_school/features/attachments/view/subject_attachments_page.dart';


class SubjectsTab extends StatelessWidget {
  const SubjectsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final subjects = [
      {'id': 1, 'name': 'الرياضيات'},
      {'id': 2, 'name': 'العلوم'},
      {'id': 3, 'name': 'التاريخ'},
      {'id': 4, 'name': 'الجغرافيا'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        final subject = subjects[index];
        return ListTile(
          leading: const Icon(Icons.book, color: AppColors.green1),
          title: Text('${subject['name']}'),
          trailing: const Icon(Icons.arrow_forward, color: AppColors.green2),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SubjectAttachmentsPage(subjectName: '${subject['name']}'),
              ),
            );
            // context.pushNamed(
            //   'subjectAttachments', 
            //   pathParameters: {
            //     'subjectName': '${subject['name']}',
            //   },
            // );
          },
        );
      },
    );
  }
}
