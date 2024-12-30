import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, this.width});

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'logo',
      width: width,
    );
  }
}

// class WhiteLogo extends StatelessWidget {
//   const WhiteLogo({super.key, this.width});

//   final double? width;

//   @override
//   Widget build(BuildContext context) {
//     return Image.asset(
//       'logoMono',
//       width: width,
//     );
//   }
// }
