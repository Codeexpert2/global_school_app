// import 'package:flutter/material.dart';

// import 'package:global_school/core/keys/keys.dart';
// import 'package:global_school/core/themes/app_colors.dart';
// import 'package:global_school/core/themes/app_fonts.dart';

// void showAlert(
//   Widget? title,
//   Widget? content,
//   VoidCallback onPressed,
// ) {
//   WidgetsBinding.instance.addPostFrameCallback((_) {
//     if (rootNavigatorKey.currentContext == null) return;
//     showDialog(
//       context: rootNavigatorKey.currentContext!,
//       builder: (context) => AlertDialog(
//         title: title,
//         content: content,
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               // context.popFalse();
//               Navigator.of(context).pop();
//               onPressed();
//             },
//             child: const Text(
//               'Ok',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             // child: Text(S.of(context).ok),
//           ),
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),

//             // onPressed: () => context.popFalse(),
//             child: const Text(
//               'Cancel',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.red,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   });
// }

// void openDialog(
//   BuildContext context,
//   Widget title,
//   Widget content,
//   List<Widget>? actions,
// ) {
//   WidgetsBinding.instance.addPostFrameCallback((_) {
//     if (rootNavigatorKey.currentContext == null) return;
//     showDialog(
//       context: context,
//       useRootNavigator: true,
//       // routeSettings: const RouteSettings(
//       //   arguments: {},
//       //   name: '',
//       // ),
//       builder: (context) => AlertDialog(
//         alignment: Alignment.center,
//         actionsAlignment: MainAxisAlignment.center,
//         titleTextStyle: const TextStyle(
//           fontWeight: FontWeight.w600,
//           fontSize: 24,
//           color: AppColors.gray700,
//           fontFamily: AppFont.fontFamily,
//         ),
//         contentTextStyle: const TextStyle(
//           fontWeight: FontWeight.w400,
//           fontSize: 16,
//           color: AppColors.gray700,
//           fontFamily: AppFont.fontFamily,
//         ),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(16),
//           ),
//         ),
//         title: title,
//         content: content,
//         actions: actions,
//       ),
//     );
//   });
// }
