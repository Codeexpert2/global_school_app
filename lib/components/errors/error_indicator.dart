import 'package:flutter/material.dart';

import 'package:global_school/core/themes/app_colors.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({
    super.key,
    required this.errorMessage,
    required this.onRetry,
  });

  final String errorMessage;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.error600,
            ),
          ),
          const SizedBox(height: 10.0),
          ElevatedButton.icon(
            onPressed: onRetry,
            icon: const Icon(
              Icons.refresh_rounded,
              color: AppColors.primary500,
            ),
            label: const Text(
              'إعادة المحاولة',
              // style: body16,
            ),
          ),
        ],
      ),
    );
  }
}
