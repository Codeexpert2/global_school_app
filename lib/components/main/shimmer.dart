import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

/// A reusable shimmer effect widget for loading states.
///
/// Wrap your content layout inside this widget to display a shimmering effect
/// while the data is loading.
///
/// ### Usage Example:
/// ```dart
/// ShimmerWidget(
///   child: Container(
///     width: 100,
///     height: 20,
///     color: Colors.grey[300], // Base color for the shimmer
///   ),
/// );
/// ```
class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
    required this.child,
    this.baseColor = Colors.grey,
    this.highlightColor = Colors.white,
  });

  /// The widget that will be wrapped with the shimmer effect.
  final Widget child;

  /// The base color of the shimmer effect.
  final Color? baseColor;

  /// The highlight color of the shimmer effect.
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey[300]!,
      highlightColor: highlightColor ?? Colors.grey[100]!,
      child: child,
    );
  }
}
