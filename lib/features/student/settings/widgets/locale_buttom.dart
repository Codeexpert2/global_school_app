import 'package:flutter/material.dart';
import 'package:global_school/core/themes/app_gradients.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/locale_provider.dart';

class LocaleButtom extends ConsumerWidget {
  const LocaleButtom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeMode = ref.watch(localeProvider);
    final localeNotifier = ref.read(localeProvider.notifier);

    return GestureDetector(
      onTap: () {
        final newLocale = localeMode.languageCode == 'en'
            ? const Locale('ar')
            : const Locale('en');
        localeNotifier.changeLocale(newLocale);
      },
      child: Container(
        decoration: BoxDecoration(
          gradient:AppGradient.linearGradient,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              localeMode.languageCode == 'en' ? 'العربية' : 'English',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(width: 8),
            Icon(
              localeMode.languageCode == 'en' ? Icons.language : Icons.translate,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
