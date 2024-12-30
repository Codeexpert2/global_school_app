import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:template/core/client/client.dart';

final helpServiceProvider = Provider<HelpService>((ref) {
  final client = ref.watch(networkServiceProvider);
  return HelpService(client);
});

class HelpService {
  HelpService(this.client);
  final ApiClient client;

  // submit
  Future<void> submitHelp(String title, String message) async {
    // Simulate API call
    await Future.delayed(
      Durations.extralong4,
      () => Future.error('Submiting Faild!'),
    );
    // await client.post(
    //   '/api/help',
    //   body: {
    //     'title': title,
    //     'description': description,
    //   },
    // );
  }
}
