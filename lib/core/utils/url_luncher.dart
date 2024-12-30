import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:template/core/utils/snackbars.dart';

void openUrl(String url) async {
  final Uri uri = Uri.parse(url);
  debugPrint('URI: $uri');
  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  } else {
    showErrorSnackbar(
      '${'The link cannot be opened:'} $url',
    );
  }
}
