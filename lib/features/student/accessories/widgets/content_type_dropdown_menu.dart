import 'package:flutter/material.dart';
import 'package:global_school/core/enums/accessorie_content_type.dart';
import 'package:global_school/features/student/accessories/provider/accessorie_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContentTypeDropdownMenu extends ConsumerWidget {
  const ContentTypeDropdownMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentType = ref.watch(contentTypeProvider);

    return DropdownButton<ContentType>(
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
    );
  }
}
