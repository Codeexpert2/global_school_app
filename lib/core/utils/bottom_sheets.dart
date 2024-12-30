import 'package:flutter/material.dart';

/// Displays a modal bottom sheet with a list of customizable [children] widgets
///
/// The [children] parameter is a list of [Widget] objects that will be 
/// displayed in the bottom sheet.
///
/// The function returns a [Future] that completes with the result of 
/// dismissing the bottom sheet.
///
/// Example usage:
/// ```dart
/// showOptions([
///  ButtonWidget(
///    text: 'تفاصيل الدبلوم',
///    onTap: () {
///      Navigator.pop(rootNavigatorKey.currentContext!);
///      context.pushNamed(
///        AppRoutes.diplomsDetail.name,
///      );
///    },
///  ),
///  const SizedBox(height: 16),
///  ButtonWidget(
///    text: 'إلغاء',
///    textColor: AppColor.error600,
///    onTap: () {
///      Navigator.pop(rootNavigatorKey.currentContext!);
///    },
///  ),
///  const SizedBox(height: kBottomNavigationBarHeight),
///]);
/// ```

Future<dynamic> openModalBottomSheet(
    BuildContext context, List<Widget> children) {
  return showModalBottomSheet(
    useSafeArea: true,
    isDismissible: true,
    showDragHandle: true,
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: kBottomNavigationBarHeight,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      );
    },
  );
}

void closeModalBottomSheet(BuildContext context) {
  if (Navigator.of(context).canPop()) {
    Navigator.of(context).pop();
  }
}

//?   No Scaffold widget found.
PersistentBottomSheetController openBottomSheet(
  BuildContext context,
  List<Widget> children,
) {
  // Navigator.of(context).pop();

  return showBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
    },
  );
}

void closeBottomSheet(BuildContext context) {
  if (Navigator.of(context).canPop()) {
    Navigator.of(context).pop();
  }
}
