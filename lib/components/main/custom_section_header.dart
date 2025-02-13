import 'package:flutter/material.dart';

import 'package:global_school/core/themes/app_colors.dart';

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({
    super.key,
    required this.title,
    required this.actionText,
    this.onActionTap,
    this.titleStyle,
    this.actionStyle,
  });

  final String title;
  final String actionText;
  final VoidCallback? onActionTap;
  final TextStyle? titleStyle;
  final TextStyle? actionStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: titleStyle ??
                const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppColors.green1,
                ),
          ),
          InkWell(
            onTap: onActionTap,
            child: Text(
              actionText,
              style: actionStyle ??
                  const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.green1,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
