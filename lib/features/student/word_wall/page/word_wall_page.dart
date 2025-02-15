import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/components/form/debounced_search.dart';
import 'package:global_school/core/locale/generated/l10n.dart';
import 'package:global_school/core/pagination/paginated_list_widget.dart';
import 'package:global_school/features/student/word_wall/model/word_wall_model.dart';
import 'package:global_school/features/student/word_wall/page/word_wall_details_page.dart';
import 'package:global_school/features/student/word_wall/provider/word_wall_provider.dart';

class WordWallPage extends ConsumerWidget {
  const WordWallPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).wordWalls),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: DebouncedSearch(
            onDebounceChange: (value) {
              // Update search query
              ref.read(wordWallSearchProvider.notifier).state = value;
              // Refresh the list
              ref.read(wordWallsProvider.notifier).refresh();
            },
          ),
        ),
      ),
      body: PaginatedListWidget<WordWall>(
        provider: wordWallsProvider,
        itemBuilder: (context, wordWall) {
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                wordWall.topic,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Class ID: ${wordWall.classId}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              trailing: wordWall.file != null
                  ? const Icon(Icons.file_copy, color: Colors.deepPurple)
                  : const Icon(Icons.link, color: Colors.deepPurple),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        WordWallDetailsPage(wordWallId: wordWall.id),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
