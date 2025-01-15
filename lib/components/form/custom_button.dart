import 'package:flutter/material.dart';
import 'package:global_school/core/themes/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height,
    this.borderRadius = 10,
    this.width = double.infinity,
    this.fontSize = 16.0,
    this.textColor = AppColors.white,
    this.backgroundColor1 = AppColors.green2,
    this.backgroundColor2 = AppColors.green1,
    this.borderColor = AppColors.white,
    this.fontWeight = FontWeight.bold,
  });
  final String text;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double fontSize;
  final Color textColor;
  final Color backgroundColor1;
  final Color backgroundColor2;
  final Color borderColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height ?? 45,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [backgroundColor1, backgroundColor2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(borderRadius!),
          border: Border.all(
            color: borderColor,
            width: 5.0,
          ),
        ),
        child: Center(
          child: Text(
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
    );
  }
}
