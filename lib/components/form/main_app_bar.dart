// import 'package:flutter/material.dart';

// class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String greetingText;
//   final String subtitleText;
//   final String? avatarImage;
//   final VoidCallback? onMenuPressed;
//   final VoidCallback? onNotificationPressed;
//   final bool showMenuIcon;
//   final bool showNotificationIcon;
//   final bool showAvatar;

//   const MainAppBar({
//     Key? key,
//     this.greetingText = 'أهلاً بك',
//     this.subtitleText = 'ابدأ رحلتك التعليمية الآن',
//     this.avatarImage,
//     this.onMenuPressed,
//     this.onNotificationPressed,
//     this.showMenuIcon = true,
//     this.showNotificationIcon = true,
//     this.showAvatar = true,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.white,
//       elevation: 0,
//       automaticallyImplyLeading: false,
//       leading: showMenuIcon
//           ? GestureDetector(
//               onTap: onMenuPressed,
//               child: const Padding(
//                 padding: EdgeInsets.all(12.0),
//                 child: Icon(
//                   Icons.menu,
//                   color: Colors.black,
//                 ),
//               ),
//             )
//           : null,
//       title: Row(
//         children: [
//           if (showNotificationIcon)
//             GestureDetector(
//               onTap: onNotificationPressed,
//               child: Stack(
//                 alignment: Alignment.topRight,
//                 children: [
//                   const Icon(
//                     Icons.notifications_none,
//                     color: Colors.black,
//                     size: 28,
//                   ),
//                   Positioned(
//                     right: 0,
//                     top: 2,
//                     child: Container(
//                       width: 8,
//                       height: 8,
//                       decoration: const BoxDecoration(
//                         color: Colors.red,
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           if (showNotificationIcon) const SizedBox(width: 12),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 greetingText,
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 subtitleText,
//                 style: const TextStyle(
//                   color: Colors.black54,
//                   fontSize: 14,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       actions: [
//         if (showAvatar)
//           Padding(
//             padding: const EdgeInsets.only(right: 16),
//             child: CircleAvatar(
//               radius: 20,
//               backgroundColor: Colors.pinkAccent,
//               child: avatarImage != null
//                   ? ClipOval(
//                       child: Image.asset(
//                         avatarImage!,
//                         fit: BoxFit.cover,
//                       ),
//                     )
//                   : const Icon(
//                       Icons.person,
//                       color: Colors.white,
//                     ),
//             ),
//           ),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
