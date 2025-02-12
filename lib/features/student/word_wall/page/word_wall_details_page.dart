import 'package:flutter/material.dart';
import 'package:global_school/core/locale/generated/l10n.dart';
import 'package:global_school/features/student/word_wall/provider/word_wall_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WordWallDetailsPage extends ConsumerWidget {
  const WordWallDetailsPage({super.key, required this.wordWallId});
  final int wordWallId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordWallAsyncValue = ref.watch(wordWallByIdProvider(wordWallId));

    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).wordWallDetails)),
      body: wordWallAsyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('خطأ: ${error.toString()}')),
        data: (wordWall) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('الموضوع: ${wordWall.topic}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                wordWall.file != null
                    ? Text('ملف مرفق: ${wordWall.file}')
                    : Text('رابط: ${wordWall.url ?? "لا يوجد"}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
