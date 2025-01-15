import 'package:flutter/material.dart';
import 'package:global_school/core/themes/app_colors.dart';

import 'attachments_list.dart';

class AttachmentsTab extends StatelessWidget {
  const AttachmentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 4,
      child: Column(
        children: [
          TabBar(
            indicatorColor: AppColors.green1,
            labelColor: AppColors.green2,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.image), text: 'صور'),
              Tab(icon: Icon(Icons.video_library), text: 'فيديوهات'),
              Tab(icon: Icon(Icons.file_copy), text: 'ملفات'),
              Tab(icon: Icon(Icons.audiotrack), text: 'صوتيات'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                AttachmentsList(
                  attachmentType: 'الصورة',
                  icon: Icons.image,
                  data: [
                    'assets/images/picture1.jpg',
                    'assets/images/picture2.jpg',
                    'assets/images/picture3.jpg',
                  ],
                ),
                AttachmentsList(
                  attachmentType: 'الفيديو',
                  icon: Icons.video_library,
                  data: [
                    'https://youtu.be/dQw4w9WgXcQ',
                    'https://youtu.be/9bZkp7q19f0',
                    'https://youtu.be/3JZ_D3ELwOQ',
                  ],
                ),
                AttachmentsList(
                  attachmentType: 'الملف',
                  icon: Icons.file_copy,
                  data: [
                    'Document 1.pdf',
                    'Document 2.pdf',
                    'Document 3.pdf',
                  ],
                ),
                AttachmentsList(
                  attachmentType: 'الصوتية',
                  icon: Icons.audiotrack,
                  data: [
                    'Audio 1.mp3',
                    'Audio 2.mp3',
                    'Audio 3.mp3',
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
