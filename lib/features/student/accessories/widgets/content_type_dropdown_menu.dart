import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/core/enums/accessorie_content_type.dart';

import '../provider/accessorie_provider.dart';

class ContentTypeDropdownMenu extends ConsumerWidget {
  const ContentTypeDropdownMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentType = ref.watch(contentTypeProvider);

    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: DropdownButton<ContentType>(
        value: contentType,
        onChanged: (ContentType? newValue) {
          if (newValue != null) {
            ref.read(contentTypeProvider.notifier).state = newValue;
          }
        },
        items: ContentType.values.map((ContentType type) {
          return DropdownMenuItem<ContentType>(
            value: type,
            child: Text(
              type.value,
              style: const TextStyle(
                // color: AppColors.green2,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }).toList(),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black54,
        ),
        underline: const SizedBox(),
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(8),
        // elevation: 5,
      ),
    );
  }
}
