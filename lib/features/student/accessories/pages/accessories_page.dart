import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:global_school/components/form/debounced_search.dart';
import 'package:global_school/core/pagination/paginated_list_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/accessorie_model.dart';
import '../provider/accessorie_provider.dart';
import 'package:global_school/core/enums/accessorie_content_type.dart';

class AccessoriesPage extends HookConsumerWidget {
  const AccessoriesPage({super.key, required this.sectionId});
  final int sectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentType = ref.watch(contentTypeProvider);
    ref.listen<ContentType>(contentTypeProvider, (previous, next) {
      if (previous != next) {
        log('ContentType changed from $previous to $next');
        ref.refresh(accessoriesProvider); 
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('الإكسسوارات'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: DebouncedSearch(
            onDebonceChange: (value) {
              // تحديث استعلام البحث
              ref.read(accessoriesSearchProvider.notifier).state = value;
              // تحديث البيانات
              ref.read(accessoriesProvider.notifier).refresh();
            },
          ),
        ),
        actions: [
          DropdownButton<ContentType>(
            value: contentType,
            onChanged: (ContentType? newValue) {
              if (newValue != null) {
                ref.read(contentTypeProvider.notifier).state = newValue;
              }
            },
            items: ContentType.values.map((ContentType type) {
              return DropdownMenuItem<ContentType>(
                value: type,
                child: Text(type.value),
              );
            }).toList(),
          ),
        ],
      ),
      body: PaginatedListWidget<Datum>(
        key: Key(contentType.value),
        provider: accessoriesProvider,
        itemBuilder: (context, accessory) {
          return ListTile(
            leading: accessory.images != null
                ? Image.network(accessory.images!)
                : const Icon(Icons.accessibility),
            title: Text(accessory.topic ?? 'بدون عنوان'),
            subtitle: _buildContent(accessory, contentType),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('تم النقر على: ${accessory.topic}')),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildContent(Datum accessory, ContentType contentType) {
    switch (contentType) {
      case ContentType.files:
        return Text('ملف: ${accessory.file ?? 'لا يوجد ملف'}');
      case ContentType.urls:
        return Text('رابط: ${accessory.url ?? 'لا يوجد رابط'}');
      case ContentType.videos:
        return Text('فيديوهات: ${accessory.videos ?? 'لا توجد فيديوهات'}');
      case ContentType.images:
        return Text('صور: ${accessory.images ?? 'لا توجد صور'}');
      default:
        return const Text('محتوى غير معروف');
    }
  }
}
