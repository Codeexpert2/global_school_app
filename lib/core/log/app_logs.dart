import 'dart:developer';

import 'package:flutter/foundation.dart';

import 'package:template/core/enums/log_level.dart';

/// A utility class for structured and colorful logging in Flutter.
///
/// Provides methods for different log levels such as success, info, warning,
/// debug, and error. Supports dynamic log levels, optional metadata, and
/// formatting for better readability.
///
/// Example Usage:
/// ```dart
/// AppLogs.success('Operation completed successfully.');
/// AppLogs.info('Fetching data from server.');
/// AppLogs.warning('This might cause a problem.', 'WarningTag');
/// AppLogs.error('An unexpected error occurred.', 'ErrorTag',
///                   metadata: {'userId': 123});
/// ```
class AppLogs {
  // Private constructor to prevent instantiation
  AppLogs._();

  /// The current log level. Logs below this level will not be shown.
  static LogLevel _currentLogLevel = LogLevel.info;

  /// Flag to enable logging in release mode.
  /// Set this to `true` if you want logs to appear in release builds.
  static bool enableReleaseLogging = false;

  /// Enum representing the available log levels.

  /// Map to define the styling for each log level.
  static final Map<LogLevel, LogStyle> _styles = {
    LogLevel.success: const LogStyle(emoji: '🟢', colorCode: '32'), // Green
    LogLevel.info: const LogStyle(emoji: '🔵', colorCode: '36'), // Cyan
    LogLevel.warning: const LogStyle(emoji: '🟠', colorCode: '33'), // Yellow
    LogLevel.error: const LogStyle(emoji: '🚫', colorCode: '31'), // Red
    LogLevel.debug: const LogStyle(emoji: '⚪️', colorCode: '37'), // White
  };

  /// Gets the current time formatted as `hour:minute:second:millisecond`.
  static String get _getCurrentTime {
    final DateTime now = DateTime.now();
    return '${now.hour}:${now.minute}:${now.second}'; // :${now.millisecond}
  }

  /// Sets the log level. Logs below this level will not be displayed.
  ///
  /// Example:
  /// ```dart
  /// AppLogs.setLogLevel(LogLevel.warning); // Only warnings and errors will be logged.
  /// ```
  static void setLogLevel(LogLevel level) {
    _currentLogLevel = level;
  }

  /// Logs a success message with a green checkmark.
  ///
  /// [message]: The success message to log.
  /// [tag]: An optional tag to categorize the log.
  ///
  /// Example:
  /// ```dart
  /// AppLogs.success('User successfully logged in.');
  /// ```
  static void success(String message, [String tag = 'Success']) =>
      _log(message, tag, LogLevel.success);

  /// Logs an informational message with a blue marker.
  ///
  /// [message]: The info message to log.
  /// [tag]: An optional tag to categorize the log.
  ///
  /// Example:
  /// ```dart
  /// AppLogs.info('Application started.');
  /// ```
  static void info(String message, [String tag = 'Info']) =>
      _log(message, tag, LogLevel.info);

  /// Logs a warning message with a yellow marker.
  ///
  /// [message]: The warning message to log.
  /// [tag]: An optional tag to categorize the log.
  ///
  /// Example:
  /// ```dart
  /// AppLogs.warning('Low disk space detected.', 'System');
  /// ```
  static void warning(String message, [String tag = 'Warning']) =>
      _log(message, tag, LogLevel.warning);

  /// Logs a debug message with a gray marker.
  ///
  /// [message]: The debug message to log.
  /// [tag]: An optional tag to categorize the log.
  ///
  /// Example:
  /// ```dart
  /// AppLogs.debug('Fetching data from API.');
  /// ```
  static void debug(String message, [String tag = 'Debug']) =>
      _log(message, tag, LogLevel.debug);

  /// Logs an error message with a red marker.
  ///
  /// [message]: The error message to log.
  /// [tag]: An optional tag to categorize the log.
  /// [metadata]: Additional information to log (e.g., user ID, environment).
  ///
  /// Example:
  /// ```dart
  /// AppLogs.error('Failed to load user data.', 'API', metadata: {'endpoint': '/user', 'userId': 123});
  /// ```
  static void error(String message,
          [String tag = 'Error', Map<String, dynamic>? metadata]) =>
      _log(message, tag, LogLevel.error, metadata: metadata);

  /// Logs a message based on the log level and applies color and styling.
  ///
  /// [message]: The main message to log.
  /// [tag]: The category tag for the log.
  /// [level]: The log level (e.g., success, info, warning).
  /// [metadata]: Optional metadata for context.
  static void _log(
    String message,
    String tag,
    LogLevel level, {
    Map<String, dynamic>? metadata,
  }) {
    if ((kDebugMode || enableReleaseLogging) &&
        level.index >= _currentLogLevel.index) {
      final style = _styles[level]!;
      final metaInfo =
          metadata != null ? ' | Metadata: ${metadata.toString()}' : '';
      log(
        '${style.emoji} \x1B[${style.colorCode}m$tag: $message$metaInfo\x1B[0m',
        name: _getCurrentTime, // ${level.name.toUpperCase()}
        level: level.index,
      );
    }
  }

  /// Updates the style for a specific log level.
  ///
  /// [level]: The log level to customize.
  /// [style]: The new style to apply.
  ///
  /// Example:
  /// ```dart
  /// AppLogs.setLogStyle(LogLevel.success, LogStyle('35', '🌟'));
  /// ```
  static void setLogStyle(LogLevel level, LogStyle style) {
    _styles[level] = style;
  }
}

/// A class to define the style for a log level.
class LogStyle {
  // Emoji or symbol to display.

  const LogStyle({required this.colorCode, required this.emoji});
  final String colorCode; // ANSI color code for terminal output.
  final String emoji;
}
