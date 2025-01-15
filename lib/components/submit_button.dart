import 'package:flutter/material.dart';
import 'package:global_school/core/themes/app_colors.dart';
import 'package:global_school/core/themes/app_gradients.dart';
import 'loading/loading_widget.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.isLoading,
    required this.text,
    required this.onPressed,
    this.height = 60,
    this.width = double.infinity,
    this.borderRadius = 15,
    this.fontSize = 16.0,
    this.textColor = AppColors.white,
    this.backgroundColor1 = AppColors.green2,
    this.backgroundColor2 = AppColors.green1,
    this.borderColor = AppColors.transparent,
    this.fontWeight = FontWeight.bold,
  });

  final VoidCallback onPressed;
  final String text;
  final bool isLoading;
  final double height;
  final double width;
  final double borderRadius;
  final double fontSize;
  final Color textColor;
  final Color backgroundColor1;
  final Color backgroundColor2;
  final Color borderColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [backgroundColor1, backgroundColor2],
            //   begin: Alignment.centerRight,
            //   end: Alignment.centerLeft,
            // ),
            gradient: AppGradient.linearGradient,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: borderColor,
              width: 5.0,
            ),
          ),
          child: Center(
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
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
