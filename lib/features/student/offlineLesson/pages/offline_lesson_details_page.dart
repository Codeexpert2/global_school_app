import 'package:flutter/material.dart';
import 'package:global_school/components/images/cached_image.dart';
import 'package:global_school/components/main/main_appbar.dart';
import 'package:global_school/core/locale/generated/l10n.dart';
import 'package:global_school/core/themes/app_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/offline_lesson_provider.dart';

class OfflineLessonDetailsPage extends HookConsumerWidget {
  const OfflineLessonDetailsPage({
    super.key,
    required this.lessonId,
  });

  final String lessonId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessonDetailsAsync =
        ref.watch(offlineLessonDetailsProvider(lessonId));

    return Scaffold(
      appBar: MainAppBar(title: S.of(context).offlineLessonDetails),
      body: lessonDetailsAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: Colors.deepOrange),
        ),
        error: (error, stack) => Center(
          child: Text('An error occurred: $error',
              style: const TextStyle(color: Colors.red, fontSize: 16)),
        ),
        data: (lesson) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lesson.topic ?? 'No Title',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.green1,
                      ),
                ),
                const SizedBox(height: 12),
                const Divider(thickness: 2),
                _buildTextRow(S.of(context).className, '${lesson.classId}'),
                _buildTextRow(S.of(context).section, '${lesson.sectionId}'),
                if (lesson.file != null)
                  _buildFileSection(context, S.of(context).file, lesson.file!),
                if (lesson.images != null)
                  _buildImageSection(
                      context, S.of(context).images, lesson.images!),
                if (lesson.videos != null)
                  _buildVideoSection(
                      context, S.of(context).video, '${lesson.videos}'),
                if (lesson.url != null)
                  _buildLinkSection(
                      context, S.of(context).link, '${lesson.url}'),
                _buildTextRow(S.of(context).createdAt, '${lesson.createdAt}'),
                _buildTextRow(S.of(context).updatedAt, '${lesson.updatedAt}'),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextRow(String title, String? value) {
    if (value == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            '$title: ',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileSection(BuildContext context, String title, String fileUrl) {
    return _buildSection(
      title: title,
      icon: Icons.insert_drive_file,
      actions: [
        _actionButton(Icons.download, S.of(context).download),
        _actionButton(Icons.open_in_new, S.of(context).open),
      ],
    );
  }

  Widget _buildImageSection(
      BuildContext context, String title, String imageUrl) {
    return _buildSection(
      title: title,
      icon: Icons.image,
      content: CachedImage(imageUrl: imageUrl),
      actions: [
        _actionButton(Icons.fullscreen, S.of(context).fullscreen),
      ],
    );
  }

  Widget _buildVideoSection(
      BuildContext context, String title, String videoUrl) {
    return _buildSection(
      title: title,
      icon: Icons.video_library,
      actions: [
        _actionButton(Icons.play_arrow, S.of(context).play),
      ],
    );
  }

  Widget _buildLinkSection(BuildContext context, String title, String url) {
    return _buildSection(
      title: title,
      icon: Icons.link,
      actions: [
        _actionButton(Icons.open_in_browser, S.of(context).openLink),
        _actionButton(Icons.copy, S.of(context).copyLink),
      ],
    );
  }

  Widget _buildSection(
      {required String title,
      required IconData icon,
      Widget? content,
      List<Widget>? actions}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.green2),
              const SizedBox(width: 8),
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          if (content != null) ...[
            const SizedBox(height: 8),
            content,
          ],
          if (actions != null) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              children: actions,
            ),
          ],
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, String label) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: AppColors.green2),
      label: Text(label, style: const TextStyle(color: AppColors.green1)),
    );
  }
}
