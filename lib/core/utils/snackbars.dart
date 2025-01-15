import 'package:flutter/material.dart';

import 'package:global_school/core/keys/keys.dart';
import 'package:global_school/core/log/app_logs.dart';

// ScaffoldFeatureController<SnackBar, SnackBarClosedReason>?
void showSnackBar(
  String message, {
  Color? backgroundColor,
  SnackBarAction? action,
}) {
  if (scaffoldKey.currentState == null) return;
  scaffoldKey.currentState!.clearSnackBars();
  scaffoldKey.currentState!.showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      action: action ??
          SnackBarAction(
            label: 'X', // Xx
            textColor: Colors.white,
            onPressed: scaffoldKey.currentState!.hideCurrentSnackBar,
          ),
    ),
  );
}

void showSuccessSnackbar(
  String message, {
  SnackBarAction? action,
}) {
  AppLog.success(message);
  showSnackBar(
    message,
    backgroundColor: Colors.green.shade400,
    action: action,
  );
}

void showErrorSnackbar(
  String message, {
  SnackBarAction? action,
}) {
  AppLog.error(message);
  showSnackBar(
    message,
    backgroundColor: Colors.red.shade400,
    action: action,
  );
}

void showWarningSnackbar(
  String message, {
  SnackBarAction? action,
}) {
  AppLog.warning(message);
  showSnackBar(
    message,
    backgroundColor: Colors.amber.shade400,
    action: action,
  );
}

void showInfoSnackbar(
  String message, {
  SnackBarAction? action,
}) {
  AppLog.info(message);
  showSnackBar(
    message,
    backgroundColor: Colors.blue.shade400,
    action: action,
  );
}
