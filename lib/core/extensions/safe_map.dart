import 'package:flutter/foundation.dart';

/// An extension on `Iterable<E>` that provides a safe mapping function.
///
/// The `safeMap` function attempts to transform each element using `toElement`.
/// If an exception occurs during transformation, it returns `null` instead of
/// crashing the app. In debug mode,
/// it rethrows the exception for easier debugging.
///
/// This ensures that only successfully transformed
/// elements are included in the result.
extension SafeMap<E> on Iterable<E> {
  /// Example:
  /// ```dart
  /// List<ChildrenModel> childrenModelFromJson(List<dynamic> jsons) =>
  ///     jsons.safeMap((x) => ChildrenModel.fromJson(x)).toList();
  /// ```
  /// Maps each element using the provided function `toElement`
  /// and handles exceptions safely.
  ///
  /// - If `toElement` throws exception, element ignored (returns `null`).
  /// - In debug mode (`kDebugMode`), the exception is rethrown for debugging .
  /// - The final result excludes `null` values using `whereType<T>()`.
  ///
  Iterable<T> safeMap<T>(T Function(E e) toElement) => map(
        (e) {
          try {
            return toElement(e);
          } catch (e) {
            if (kDebugMode) rethrow;
            return null;
          }
        },
      ).whereType<T>();
}
