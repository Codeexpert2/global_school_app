import 'package:flutter/material.dart';

import 'package:global_school/core/constants/images.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.imagesMadaresIcon,
      width: width,
      height: height,
      fit: BoxFit.contain,
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
