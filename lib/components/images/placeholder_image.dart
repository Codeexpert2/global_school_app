import 'package:flutter/material.dart';

import 'package:global_school/core/constants/images.dart';

class PlaceHolderImage extends StatelessWidget {
  const PlaceHolderImage({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage(AppImages.imagesProfilePlaceholder),
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }
}
