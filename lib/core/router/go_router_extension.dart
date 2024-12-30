import 'package:go_router/go_router.dart';

import 'package:global_school/configs/app_configs.dart';

/// An extension on [GoRouter] to provide additional utility methods.
extension GoRouterExtension on GoRouter {
  /// Retrieves the current location (path) of the router as a [String].
  ///
  /// The location is determined based on the last match in the current
  /// configuration of the router's delegate.
  ///
  /// Example:
  /// ```dart
  /// final currentLocation = GoRouter.of(context).location;
  /// print('Current location: $currentLocation');
  /// ```
  String get location {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();

    return location;
  }

  /// Constructs the full URL path by appending the current location to the
  /// base domain.
  ///
  /// Combines [AppConfigs.baseDomin] with the current [location] to create
  /// the full path.
  ///
  /// Example:
  /// ```dart
  /// final fullPath = GoRouter.of(context).fullPath;
  /// print('Full path: $fullPath');
  /// ```
  String get fullPath {
    return '${AppConfigs.baseDomin}$location';
  }

  /// Retrieves the query parameters of current route as a [Map] key-value.
  ///
  /// The query parameters are extracted from the URI of the last match
  /// in the router's current configuration.
  ///
  /// Example:
  /// ```dart
  /// final queryParams = GoRouter.of(context).queryParams;
  /// queryParams.forEach((key, value) {
  ///   print('Key: $key, Value: $value');
  /// });
  /// ```
  Map<String, String> get queryParams {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    final Map<String, String> queryParams =
        matchList.uri.queryParameters.map(MapEntry.new);
    return queryParams;
  }
}
