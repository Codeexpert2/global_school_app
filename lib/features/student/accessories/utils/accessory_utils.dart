import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:global_school/core/enums/accessorie_content_type.dart';
import 'package:global_school/core/utils/snackbars.dart';
import 'package:global_school/features/student/accessories/model/accessorie_model.dart';
import 'package:global_school/features/student/accessories/widgets/video_player_page.dart';
import 'package:global_school/features/student/accessories/widgets/youtube_video_player.dart';

Widget buildContent(Accessorie accessory, ContentType contentType) {
  Widget content;
  switch (contentType) {
    case ContentType.files:
      content = Text('File: ${accessory.file ?? 'Not found file'}',
          style: TextStyle(color: Colors.deepPurple.shade700));
      break;
    case ContentType.urls:
      content = Text('Url: ${accessory.url ?? 'Not found url'}',
          style: TextStyle(color: Colors.deepPurple.shade700));
      break;
    case ContentType.videos:
      content = Text('Videos: ${accessory.videos ?? 'Not found videos'}',
          style: TextStyle(color: Colors.deepPurple.shade700));
      break;
    case ContentType.images:
      content = Text('Images: ${accessory.images ?? 'Not found images'}',
          style: TextStyle(color: Colors.deepPurple.shade700));
      break;
    default:
      content = Text('Not found content type',
          style: TextStyle(color: Colors.deepPurple.shade700));
  }

  return Row(
    children: [
      Icon(
        getContentIcon(contentType),
        color: Colors.deepPurple,
        size: 16,
      ),
      const SizedBox(width: 8),
      Expanded(child: content),
    ],
  );
}

Widget buildActionButton(
    BuildContext context, Accessorie accessory, ContentType contentType) {
  IconData icon;
  VoidCallback? onPressed;

  switch (contentType) {
    case ContentType.files:
      icon = Icons.file_open;
      onPressed = () {
        // TODO: فتح الملف
        showInfoSnackbar('فتح الملف: ${accessory.file}');
      };
      break;
    case ContentType.urls:
      icon = Icons.open_in_new;
      onPressed = () async {
        if (accessory.url != null) {
          final Uri uri = Uri.parse(accessory.url!);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          } else {
            showInfoSnackbar('تعذر فتح الرابط: ${accessory.url}');
          }
        }
      };
      break;
    case ContentType.videos:
      icon = Icons.play_circle_filled;
      onPressed = () {
        showInfoSnackbar('تشغيل الفيديو: ${accessory.videos}');
        if (accessory.videos != null &&
            (accessory.videos!.contains('youtube.com') ||
                accessory.videos!.contains('youtu.be'))) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  YoutubeVideoPlayer(videoUrl: accessory.videos),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoPlayerPage(videoUrl: accessory.videos),
            ),
          );
        }
      };
      break;
    case ContentType.images:
      icon = Icons.zoom_in;
      onPressed = () {
        // TODO: عرض الصورة بشكل كامل
        showInfoSnackbar('عرض الصورة: ${accessory.images}');
      };
      break;
    default:
      icon = Icons.error;
      onPressed = null;
  }

  return IconButton(
    icon: Icon(icon, color: Colors.deepPurple),
    onPressed: onPressed,
  );
}

IconData getContentIcon(ContentType contentType) {
  switch (contentType) {
    case ContentType.files:
      return Icons.file_present;
    case ContentType.urls:
      return Icons.link;
    case ContentType.videos:
      return Icons.video_library;
    case ContentType.images:
      return Icons.image;
    default:
      return Icons.error;
  }
}
