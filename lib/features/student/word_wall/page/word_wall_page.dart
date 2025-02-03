import 'package:flutter/material.dart';
import 'package:global_school/features/student/word_wall/page/word_wall_details_page.dart';
import 'package:global_school/features/student/word_wall/provider/word_wall_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WordWallPage extends ConsumerWidget {
  const WordWallPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordWallAsyncValue = ref.watch(wordWallProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Walls'),
      ),
      body: wordWallAsyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (apiResponse) {
          final wordWalls = apiResponse.data;
          return ListView.builder(
            itemCount: wordWalls.length,
            itemBuilder: (context, index) {
              final wordWall = wordWalls[index];
              return ListTile(
                title: Text(wordWall.topic),
                subtitle: Text('Class ID: ${wordWall.classId}'),
                trailing: wordWall.file != null
                    ? const Icon(Icons.file_copy)
                    : const Icon(Icons.link),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          WordWallDetailsPage(wordWallId: wordWall.id),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
