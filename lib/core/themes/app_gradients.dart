import 'package:flutter/material.dart';

class AppGradient {
  static const linearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF069ACC),
      Color(0xFF0594C6),
      Color(0xFF0483B6),
      Color(0xFF02679B),
      Color(0xFF004177),
      Color(0xFF003B71),
    ],
    stops: [
      0.1079,
      0.2481,
      0.446,
      0.6603,
      0.8995,
      0.9325,
    ],
    // Convert degrees to radians
    // transform: GradientRotation(
    //   132.5 * 3.14159265 / 180,
    // ),
  );

  static const imageOverlayGradient = LinearGradient(
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
    stops: [0.0, 1.0],
    colors: [
      Color.fromRGBO(0, 0, 0, 0),
      Color.fromRGBO(0, 0, 0, .5),
      // Colors.black87,
    ],
  );
}
