import 'package:flutter/material.dart';
import 'package:global_school/components/form/debounced_search.dart';
import 'package:global_school/components/images/cached_image.dart';
import 'package:global_school/core/pagination/paginated_list_widget.dart';
import 'package:global_school/core/utils/snackbars.dart';
import 'package:global_school/features/student/accessories/widgets/content_type_dropdown_menu.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/accessorie_model.dart';
import '../provider/accessorie_provider.dart';
import 'package:global_school/core/enums/accessorie_content_type.dart';

class AccessoriesPage extends ConsumerWidget {
  const AccessoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentType = ref.watch(contentTypeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('الإكسسوارات'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: DebouncedSearch(
            onDebounceChange: (value) {
              // تحديث استعلام البحث
              ref.read(accessoriesSearchProvider.notifier).state = value;
              // تحديث البيانات
              ref.read(accessoriesProvider.notifier).refresh();
            },
          ),
        ),
        actions: [
          const ContentTypeDropdownMenu(),
        ],
      ),
      body: PaginatedListWidget<Accessorie>(
        key: Key(contentType.name),
        provider: accessoriesProvider,
        itemBuilder: (context, accessory) {
          return ListTile(
            leading: CachedImage(
              imageUrl: accessory.images ?? '',
              width: 32,
              height: 32,
            ),
            title: Text(accessory.topic ?? 'بدون عنوان'),
            subtitle: _buildContent(accessory, contentType),
            onTap: () => showInfoSnackbar(
              'تم النقر على: ${accessory.topic}',
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(Accessorie accessory, ContentType contentType) {
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
