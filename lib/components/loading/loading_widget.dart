import 'package:flutter/material.dart';

import 'package:template/core/themes/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.color = AppColors.primary200,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        strokeWidth: 2,
        strokeCap: StrokeCap.round,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
