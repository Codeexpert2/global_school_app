import 'package:flutter/material.dart';

import 'package:template/core/themes/app_colors.dart';

class LinearLoadingWidget extends StatelessWidget {
  const LinearLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      color: Theme.of(context).scaffoldBackgroundColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      valueColor: const AlwaysStoppedAnimation(AppColors.primary500),
    );
  }
}
