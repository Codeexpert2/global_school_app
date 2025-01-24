import 'package:flutter/material.dart';

import 'package:global_school/core/themes/app_colors.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    this.color,
  });

  final String title;
  final String subtitle;
  final IconData? icon;
  final Color? color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color?.withOpacity(.15) ?? Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.borderColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Container(
                //   padding: const EdgeInsets.all(6),
                //   decoration: BoxDecoration(
                //     color: AppColors.backgroundColor,
                //     borderRadius: BorderRadius.circular(50),
                //   ),
                //   child: Image.asset(
                //     AppIcons.book,
                //     width: 24,
                //     height: 24,
                //   ),
                // ),
                Icon(
                  icon,
                  // color:
                  color: color ?? AppColors.gray400,
                ),
                const SizedBox(width: 12),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: color,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.primary500,
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  color: color ?? AppColors.gray400,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
