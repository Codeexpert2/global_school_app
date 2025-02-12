import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:global_school/app.dart';
import 'package:global_school/core/log/app_logs.dart';
import 'package:global_school/initialize_app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers/observers.dart';

void main() async {
  runZonedGuarded(
    () async {
      // Initialize all necessary services and configurations
      await initializeApp();

      runApp(
        ProviderScope(
          observers: [
            RiverpodObserver(),
          ],
          child: const App(),
        ),
      );
    },
    (error, stackTrace) {
      // Handle the error gracefully
      AppLog.error('$error');
      // You can log the error or send it to a crash reporting service
      FirebaseCrashlytics.instance.recordError(
        error,
        stackTrace,
        fatal: true,
      );
      // FirebaseCrashlytics.instance.recordError(error, stackTrace);
    },
  );
}
