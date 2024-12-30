import 'package:flutter/material.dart';

import 'package:global_school/core/themes/app_colors.dart';

import 'loading/loading_widget.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.isLoading,
    required this.text,
    required this.onPressed,
    this.style,
  });

  final VoidCallback onPressed;
  final ButtonStyle? style;
  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style ??
            ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary500,
              minimumSize: const Size(double.infinity, 50),
            ),
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: LoadingWidget(
                  color: AppColors.white,
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  color: AppColors.white,
                ),
              ),
      ),
    );
  }
}
