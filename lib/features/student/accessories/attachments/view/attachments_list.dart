import 'package:flutter/material.dart';
import 'package:global_school/core/themes/app_colors.dart';
import 'package:global_school/features/student/accessories/attachments/widgets/audio_player_page.dart';
import 'package:global_school/features/student/accessories/widgets/image_viewer_page.dart';
import 'package:global_school/features/student/accessories/widgets/pdf_viewer_page.dart';
import 'package:global_school/features/student/accessories/widgets/video_player_page.dart';
import 'package:global_school/features/student/accessories/widgets/youtube_video_player.dart';

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
              _getTrailingIcon(attachmentType),
              color: AppColors.green2,
            ),
            onPressed: () {
              _navigateBasedOnType(context, attachmentType, item);
            },
          ),
        );
      },
    );
  }

  IconData _getTrailingIcon(String type) {
    switch (type) {
      case 'الصوتية':
        return Icons.headphones;
      case 'الفيديو':
        return Icons.play_arrow;
      case 'الملف':
        return Icons.download_sharp;
      default:
        return Icons.file_open_outlined;
    }
  }

  void _navigateBasedOnType(BuildContext context, String type, String item) {
    switch (type) {
      case 'الفيديو':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _buildVideoPlayer(item),
          ),
        );
        break;

      case 'الصوتية':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AudioPlayerPage(audioUrl: item),
          ),
        );
        break;

      case 'الملف':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PDFViewerPage(pdfPath: item),
          ),
        );
        break;
      case 'الصورة':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageViewerPage(
              imageUrl: item,
            ),
          ),
        );

        break;

      default:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('نوع المرفق غير مدعوم')),
        );
        break;
    }
  }

  Widget _buildVideoPlayer(String videoUrl) {
    if (videoUrl.contains('youtube.com') || videoUrl.contains('youtu.be')) {
      return YoutubeVideoPlayer(videoUrl: videoUrl);
    } else {
      return VideoPlayerPage(videoUrl: videoUrl);
    }
  }
}
