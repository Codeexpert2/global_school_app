import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/components/form/debounced_search.dart';
import 'package:global_school/core/pagination/paginated_list_widget.dart';

import '../model/accessorie_model.dart';
import '../provider/accessorie_provider.dart';
import '../widgets/accessory_card.dart';
import '../widgets/content_type_dropdown_menu.dart';

class AccessoriesPage extends ConsumerWidget {
  const AccessoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentType = ref.watch(contentTypeProvider);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Attachments',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: DebouncedSearch(
                    onDebounceChange: (value) {
                      ref.read(accessoriesSearchProvider.notifier).state =
                          value;
                      ref.read(accessoriesProvider.notifier).refresh();
                    },
                  ),
                ),
                const ContentTypeDropdownMenu(),
              ],
            ),
          ),
        ),
      ),
      body: PaginatedListWidget<Accessorie>(
        key: Key(contentType.name),
        provider: accessoriesProvider,
        itemBuilder: (context, accessory) {
          return AccessoryCard(
            accessory: accessory,
            contentType: contentType,
          );
        },
      ),
    );
  }
}
