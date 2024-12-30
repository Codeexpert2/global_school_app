import 'package:flutter/material.dart';

import 'package:template/core/enums/alert_dialog_type.dart';

/// A customizable alert dialog that supports different types
/// such as Error, Warning, Info, and Success.
///
/// Dialog dynamically changes its icon and color based on the provided type.
///
/// ### Usage Example:
/// ```dart
/// final bool? confirmed = await showDialog<bool>(
///   context: context,
///   builder: (ctx) => CustomAlertDialog(
///     title: 'Confirm Delete Account',
///     description: 'Are you sure you want to permanently delete your account?
///                   This action cannot be undone.',
///     acceptText: 'Delete',
///     cancelText: 'Cancel',
///     type: AlertDialogType.error, // Type is Error
///     onAccept: () {
///       // Handle account deletion logic
///       print('Account deleted.');
///     },
///   ),
/// );
///
/// if (confirmed ?? false) {
///   print('User confirmed account deletion.');
/// } else {
///   print('User canceled account deletion.');
/// }
/// ```
class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.description,
    required this.acceptText,
    required this.cancelText,
    required this.type,
    required this.onAccept,
  });

  /// The title of the alert dialog.
  final String title;

  /// The description text displayed in the alert dialog.
  final String description;

  /// The text for the "Accept" button.
  final String acceptText;

  /// The text for the "Cancel" button.
  final String cancelText;

  /// The type of the alert dialog, which determines the icon and colors used.
  final AlertDialogType type;

  /// The callback function executed when the "Accept" button is pressed.
  final VoidCallback onAccept;

  /// Returns the appropriate icon for the given [type].
  IconData _getIcon() => switch (type) {
        AlertDialogType.error => Icons.error_outline,
        AlertDialogType.warning => Icons.warning_amber_rounded,
        AlertDialogType.info => Icons.info_outline,
        AlertDialogType.success => Icons.check_circle_outline,
      };

  /// Returns the appropriate color for the given [type].
  Color _getColor(BuildContext context) => switch (type) {
        AlertDialogType.error => Colors.red,
        AlertDialogType.warning => Colors.orange,
        AlertDialogType.info => Theme.of(context).colorScheme.primary,
        AlertDialogType.success => Colors.green,
      };

  @override
  Widget build(BuildContext context) {
    final icon = _getIcon();
    final color = _getColor(context);

    return AlertDialog(
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      titleTextStyle: Theme.of(context).textTheme.titleLarge,
      contentTextStyle: Theme.of(context).textTheme.bodyLarge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      title: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              icon,
              color: color,
              size: 38,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          description,
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: color.withOpacity(0.5),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(
            cancelText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color.withOpacity(0.5),
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
            onAccept();
          },
          child: Text(
            acceptText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
