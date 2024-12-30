import 'dart:async';
import 'dart:ui';

/// A utility class for debouncing actions.
///
/// Debouncing is a technique used to limit the rate at which a func is called.
/// It ensures that the function is not called more frequently than a 
/// specified interval.
///
/// This class provides a [run] method to debounce an action and a [dispose] 
/// method to cancel any ongoing debouncing.
class Debouncer {

  /// Creates a new instance of [Debouncer].
  ///
  /// The [milliseconds] parameter specifies the delay in milliseconds between 
  /// each call to the debounced function.
  Debouncer({required this.milliseconds});
  /// The delay in milliseconds between each call to the debounced function.
  final int milliseconds;

  /// The timer used to debounce the action.
  Timer? _timer;

  /// Debounces the given [action].
  ///
  /// If the debouncer is already debouncing an action, it cancels the previous 
  /// timer and starts a new one.
  /// The [action] will be called after the specified [milliseconds] 
  /// have passed since the last call to [run].
  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  /// Cancels any ongoing debouncing.
  ///
  /// If the debouncer is currently debouncing an action, it cancels the timer 
  /// and prevents the action from being called.
  void dispose() {
    _timer?.cancel();
  }
}
