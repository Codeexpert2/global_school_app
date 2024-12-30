import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:template/core/extensions/extensions.dart';
import 'package:template/core/keys/keys.dart';
import 'package:template/core/router/app_router.dart';
import 'package:template/core/themes/app_themes.dart';
import 'package:template/features/settings/providers/locale_provider.dart';
import 'package:template/features/settings/providers/theme_notifier.dart';
import 'package:template/locale/generated/l10n.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final locale = ref.watch(localeProvider);
    final themeMode = ref.watch(themeProvider);

    // final storage = ref.watch(storageServiceProvider);
    // storage.remove(onboardingKey);

    return MaterialApp.router(
      onGenerateTitle: (context) => S.of(context).appName,
      debugShowCheckedModeBanner: kDebugMode,
      scaffoldMessengerKey: scaffoldKey,
      routerConfig: router,
      themeMode: themeMode,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeAnimationCurve: Curves.easeInOut,
      locale: locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // supportedLocales: AppConfigs.supportedLocales.map(
      //   (i) => Locale(i['locale'] as String),
      // ),
      supportedLocales: S.delegate.supportedLocales,
      builder: (context, child) {
        return MediaQuery(
          // Replace the textScaler with the calculated scale.
          data: context.mediaQuery.copyWith(
            textScaler: context.clampTextScaler,
          ),
          child: child!,
        );
      },
    );
  }
}
