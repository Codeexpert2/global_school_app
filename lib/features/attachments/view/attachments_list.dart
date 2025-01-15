import 'package:flutter/material.dart';
import 'package:global_school/core/themes/app_colors.dart';

class AttachmentsList extends StatelessWidget {
  const AttachmentsList({
    super.key,
    required this.attachmentType,
    required this.icon,
    required this.data,
  });

  final String attachmentType;
  final IconData icon;
  final List<String> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        return ListTile(
          leading: Icon(icon, color: AppColors.green1),
          title: Text('$attachmentType ${index + 1}'),
          subtitle: attachmentType == 'الفيديو' ? Text(item) : null,
          trailing: IconButton(
            icon: Icon(
              attachmentType == 'الصوتية' || attachmentType == 'الفيديو'
                  ? Icons.play_arrow
                  : Icons.download,
              color: AppColors.green2,
            ),
            onPressed: () {
              if (attachmentType == 'الصوتية' || attachmentType == 'الفيديو') {
              } else {
              }
            },
          ),
        );
      },
    );
  }
}
