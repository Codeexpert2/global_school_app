import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:template/core/enums/enums.dart';

/// A utility class to check the current network connectivity status.
///
/// This class uses the `connectivity_plus` package to provide a simple API for
/// determining if the device is connected to a network and the type of network.
class NetworkInfo {
  /// Creates instance of [NetworkInfo] with the given [Connectivity] instance.
  ///
  /// [connectivity] is an instance of the `connectivity_plus` used to check
  /// the network state.
  NetworkInfo(this._connectivity);

  /// The [Connectivity] instance used to check network connectivity.
  final Connectivity _connectivity;

  /// A getter that returns `true` if the device is connected to a network.
  ///
  /// Uses [checkConnectivity] to determine the current network status.
  Future<bool> get isConnected async =>
      await checkConnectivity() == ConnectivityStatus.isConnected;

  /// Checks the current network connectivity status and returns a
  /// [ConnectivityStatus] enum.
  ///
  /// This method maps the results from the `connectivity_plus` package to
  /// custom [ConnectivityStatus] enums for better abstraction.
  ///
  /// - **ConnectivityResult.mobile**: Mobile network is available.
  /// - **ConnectivityResult.wifi**: Wi-Fi is available.
  /// - **ConnectivityResult.ethernet**: Ethernet connection is available.
  /// - **ConnectivityResult.vpn**: VPN connection is active.
  /// - **ConnectivityResult.bluetooth**: Bluetooth connection is active.
  /// - **ConnectivityResult.other**: unrecognized type of network is connected.
  /// - **ConnectivityResult.none**: No network connection is available.
  ///
  /// Returns:
  /// - [ConnectivityStatus.isConnected] if any of the recognized network types
  ///   (mobile, Wi-Fi, ethernet, etc.) are connected.
  /// - [ConnectivityStatus.isDisconnected] if no network connection available.
  /// - [ConnectivityStatus.notDetermined] if network state can't determined.
  Future<ConnectivityStatus> checkConnectivity() async {
    final connectivityResult = await _connectivity.checkConnectivity();

    return getConnectivityStatus(connectivityResult);
  }

  ConnectivityStatus getConnectivityStatus(List<ConnectivityResult> status) {
    if (status.contains(ConnectivityResult.mobile)) {
      // Mobile network is available.
      return ConnectivityStatus.isConnected;
    } else if (status.contains(ConnectivityResult.wifi)) {
      // Wi-Fi is available.
      // Note for Android:
      // When both mobile and Wi-Fi are turned on, the system will return
      // Wi-Fi only as the active network type.
      return ConnectivityStatus.isConnected;
    } else if (status.contains(ConnectivityResult.ethernet)) {
      // Ethernet connection is available.
      return ConnectivityStatus.isConnected;
    } else if (status.contains(ConnectivityResult.vpn)) {
      // VPN connection is active.
      // Note for iOS and macOS:
      // There is no separate network interface type for [VPN].
      // It returns [other] on any device (including simulators).
      return ConnectivityStatus.isConnected;
    } else if (status.contains(ConnectivityResult.bluetooth)) {
      // Bluetooth connection is active.
      return ConnectivityStatus.isConnected;
    } else if (status.contains(ConnectivityResult.other)) {
      // Connected to a network that is not in the recognized types.
      return ConnectivityStatus.isConnected;
    } else if (status.contains(ConnectivityResult.none)) {
      // No network connection is available.
      return ConnectivityStatus.isDisonnected;
    }
    // If the connectivity state is unknown or cannot be determined.
    return ConnectivityStatus.notDetermined;
  }
}

