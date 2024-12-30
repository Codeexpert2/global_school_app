// Enum for theme modes
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/core/keys/keys.dart';
import 'package:global_school/initialize_app.dart';
import 'package:global_school/services/local_storage/storage_service.dart';

final storage = locator<StorageService>();

// StateNotifier to manage the theme mode
class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier(this.ref) : super(ThemeMode.system) {
    _loadTheme();
  }
  final Ref ref;

  // Load saved theme from local storage
  Future<void> _loadTheme() async {
    final savedTheme = storage.read(themeKey);
    if (savedTheme.isNotEmpty) {
      state = ThemeMode.values.firstWhere(
        (e) => e.toString() == savedTheme,
        orElse: () => ThemeMode.system,
      );
    }
  }

  // Update theme and save to local storage
  Future<void> setTheme(ThemeMode? value) async {
    if (value != null) {
      state = value;

      await storage.save(themeKey, value.toString());
    }
  }
}

// Riverpod provider for the theme notifier
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
  ThemeNotifier.new,
);
