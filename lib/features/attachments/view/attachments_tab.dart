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
                    'assets/images/code_expert.png',
                    'assets/images/code_expert.png',
                    'assets/images/code_expert.png',
                  ],
                ),
                AttachmentsList(
                  attachmentType: 'الفيديو',
                  icon: Icons.video_library,
                  data: [
                    'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
                    'https://www.w3schools.com/html/mov_bbb.mp4',
                    'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
                  ],
                ),
                AttachmentsList(
                  attachmentType: 'الملف',
                  icon: Icons.file_copy,
                  data: [
                     'assets/pdf/Doc1.pdf',
                     'assets/pdf/Doc1.pdf',
                     'assets/pdf/Doc1.pdf',
                  ],
                ),
                AttachmentsList(
                  attachmentType: 'الصوتية',
                  icon: Icons.audiotrack,
                  data: [
                    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
                    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
                    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
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
