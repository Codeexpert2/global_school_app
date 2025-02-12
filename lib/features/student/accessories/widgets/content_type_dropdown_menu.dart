import 'package:flutter/material.dart';
import 'package:global_school/core/enums/accessorie_content_type.dart';
import 'package:global_school/core/themes/app_colors.dart';
import 'package:global_school/features/student/accessories/provider/accessorie_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContentTypeDropdownMenu extends ConsumerWidget {
  const ContentTypeDropdownMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentType = ref.watch(contentTypeProvider);

    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                color: AppColors.green2,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }).toList(),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        underline: const SizedBox(),
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(12),
        elevation: 5,
      ),
    );
  }
}
