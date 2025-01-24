import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/configs/app_configs.dart';
import 'package:global_school/core/keys/keys.dart';
import 'package:global_school/initialize_app.dart';
import 'package:global_school/services/local_storage/storage_service.dart';

final storage = locator<StorageService>();

class LocaleNotifier extends Notifier<Locale> {
  @override
  build() {
    final savedLanguageCode = storage.read(languageCodeKey);
    return Locale(
      savedLanguageCode.isEmpty ? AppConfigs.defaultLocale : savedLanguageCode,
    );
  }

  /// Change the default locale
  Future<void> changeLocale(Locale? value) async {
    if (value != null) {
      state = value;

      await storage.save(languageCodeKey, value.languageCode);
    }
  }
}

final localeProvider =
    NotifierProvider<LocaleNotifier, Locale>(LocaleNotifier.new);
