import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/core/enums/connectivity_status.dart';

import 'network_info.dart';

/// Provides an instance of [Connectivity] to monitor network connectivity state
///
/// This provider makes it easy to use the `connectivity_plus` package
/// within a Riverpod-powered state management environment.
final connectivityProvider = Provider<Connectivity>((ref) {
  return Connectivity();
});

/// Provides an instance of [NetworkInfo] which handles checking
/// network connectivity.
///
/// This is built using the [connectivityProvider] to abstract and centralize
/// network state management.
final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfo(ref.read(connectivityProvider));
});

final connectivityChangesProvider = StreamProvider<List<ConnectivityResult>>(
  (ref) async* {
    yield* ref.read(connectivityProvider).onConnectivityChanged;
  },
);

final isConnectedProvider = StreamProvider<bool>((ref) async* {
  // Create connectivity instance
  final connectivity = ref.read(connectivityProvider);
  final networkInfo = ref.read(networkInfoProvider);

  // Check initial connection status
  final initialStatus = await networkInfo.checkConnectivity();
  yield initialStatus == ConnectivityStatus.isConnected;

  // Listen to connectivity changes
  await for (final status in connectivity.onConnectivityChanged) {
    yield networkInfo.getConnectivityStatus(status) ==
        ConnectivityStatus.isConnected;
  }
});
