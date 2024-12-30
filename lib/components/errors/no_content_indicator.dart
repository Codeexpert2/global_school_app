import 'package:flutter/material.dart';

import 'package:template/core/themes/app_colors.dart';

class NoContentIndicator extends StatelessWidget {
  const NoContentIndicator({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.info_outline_rounded,
            color: AppColors.gray300,
            size: 64,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.gray400,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
