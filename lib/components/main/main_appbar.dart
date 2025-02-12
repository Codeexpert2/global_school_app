import 'package:flutter/material.dart';

import 'package:global_school/core/themes/app_colors.dart';

// class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const MainAppBar({
//     super.key,
//     required this.title,
//     this.actions,
//     this.bottom,
//   });
//   final String title;
//   final List<Widget>? actions;
//   final PreferredSizeWidget? bottom;
//   @override
//   Size get preferredSize =>
//       Size.fromHeight(bottom == null ? kToolbarHeight : kToolbarHeight * 2);
//   @override
//   Widget build(BuildContext context) => AppBar(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
//         centerTitle: true,
//         title: Text(
//           title,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         // titleSpacing: 0,
//         iconTheme: IconThemeData(
//           color: Theme.of(context).colorScheme.onSurface,
//         ),
//         actions: actions,
//         bottom: bottom,
//       );
// }
// class LiteAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const LiteAppBar({
//     super.key,
//     required this.title,
//     this.actions,
//     this.bottom,
//   });
//   final String title;
//   final PreferredSizeWidget? bottom;
//   final List<Widget>? actions;
//   @override
//   Size get preferredSize =>
//       Size.fromHeight(bottom == null ? kToolbarHeight : kToolbarHeight * 2);
//   @override
//   Widget build(BuildContext context) => AppBar(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
//         centerTitle: true,
//         title: Text(
//           title,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         // titleSpacing: 0,
//         actions: actions,
//         bottom: bottom,
//       );
// }
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.title,
    this.subtitleText,
    this.avatarImage = 'assets/images/madares_icon.png',
    this.onBackPressed,
    this.showBackButton = false,
    this.showAvatar = true,
  });

  final String? title;
  final String? subtitleText;
  final String? avatarImage;
  final VoidCallback? onBackPressed;
  final bool showBackButton;
  final bool showAvatar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: BackButton(),
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          if (showBackButton)
            // GestureDetector(
            //   onTap: onBackPressed ?? () => context.pop(),
            //   child: const Icon(
            //     Icons.arrow_back,
            //     color: Colors.black,
            //     size: 28,
            //   ),
            // ),
            const BackButton(),
          if (showBackButton) const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Text(
                  title!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              if (subtitleText != null)
                Column(
                  children: [
                    if (title != null) const SizedBox(height: 4),
                    Text(
                      subtitleText!,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
      actions: [
        if (showAvatar)
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 15),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.transparent,
              child: avatarImage != null
                  ? ClipOval(
                      child: Image.asset(
                        avatarImage!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
