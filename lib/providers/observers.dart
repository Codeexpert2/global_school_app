import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/core/log/app_logs.dart';

/// Custom [ProviderObserver] for logging provider lifecycle changes.
class RiverpodObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    AppLog.info(
      'DidUpdate: Provider = ${provider.name ?? provider.runtimeType}, '
          'Previous Value = $previousValue, New Value = $newValue',
      'ProviderObserver',
    );
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    AppLog.warning(
      'DidDispose: Provider = ${provider.name ?? provider.runtimeType}',
      'ProviderObserver',
    );
    super.didDisposeProvider(provider, container);
  }
}
