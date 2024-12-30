import 'dart:async';

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final authNotifierProvider =
    AsyncNotifierProvider<AuthNotifier, bool>(AuthNotifier.new);

class AuthNotifier extends AsyncNotifier<bool> {
  @override
  FutureOr<bool> build() {
    return Future.delayed(
      Durations.extralong4,
      () => true,
    );
  }

  // login
  Future<void> login() async {
    state = await AsyncValue.guard(
      () => Future.delayed(
        Durations.medium1,
        () => true,
      ),
    );
  }

  // logout
  Future<void> logout() async {
    state = await AsyncValue.guard(
      () => Future.delayed(
        Durations.medium1,
        () => false,
      ),
    );
  }
}
