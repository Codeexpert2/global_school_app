import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:template/features/settings/providers/theme_notifier.dart';

class ThemeDropdown extends ConsumerWidget {
  const ThemeDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);

    // Theme mode options
    final options = [
      {'mode': ThemeMode.light, 'name': 'Light', 'icon': Icons.light_mode},
      {'mode': ThemeMode.dark, 'name': 'Dark', 'icon': Icons.dark_mode},
      {'mode': ThemeMode.system, 'name': 'System', 'icon': Icons.settings},
    ];

    return DropdownButtonFormField<ThemeMode>(
      isExpanded: true,
      value: themeMode,
      decoration: const InputDecoration(
          // labelText: 'Theme Mode',
          ),
      onChanged: themeNotifier.setTheme,
      items: options.map((option) {
        return DropdownMenuItem<ThemeMode>(
          value: option['mode'] as ThemeMode,
          child: Row(
            children: [
              Icon(option['icon'] as IconData, size: 20),
              const SizedBox(width: 8),
              Text(option['name'] as String),
            ],
          ),
        );
      }).toList(),
    );
  }
}
