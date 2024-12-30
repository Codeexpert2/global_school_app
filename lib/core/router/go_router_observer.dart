import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:global_school/core/log/app_logs.dart';

/// A custom [NavigatorObserver] for logging route changes with AppLogs.
class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AppLogs.info(
      'DidPush: New Route = ${route.settings.name}, '
          'Arguments = ${route.settings.arguments}, '
          'Previous Route = ${previousRoute?.settings.name ?? 'None'}',
      'Navigation',
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AppLogs.info(
      'DidPop: Popped Route = ${route.settings.name}, '
          'Arguments = ${route.settings.arguments}, '
          'New Top Route = ${previousRoute?.settings.name ?? 'None'}',
      'Navigation',
    );
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AppLogs.warning(
      'DidRemove: Removed Route = ${route.settings.name}, '
          'Arguments = ${route.settings.arguments}, '
          'Previous Route = ${previousRoute?.settings.name ?? 'None'}',
      'Navigation',
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    AppLogs.info(
      'DidReplace: Old Route = ${oldRoute?.settings.name ?? 'None'}, '
          'New Route = ${newRoute?.settings.name ?? 'None'}, '
          'Arguments = ${newRoute?.settings.arguments}',
      'Navigation',
    );
  }
}
