import 'dart:async';

import 'package:global_school/core/keys/keys.dart';
import 'package:global_school/features/auth/data/auth_service.dart';
import 'package:global_school/initialize_app.dart';
import 'package:global_school/services/local_storage/secure_storage_service.dart';
import 'package:global_school/services/local_storage/storage_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final storageService = locator<StorageService>();
final secureStorageService = locator<SecureStorageService>();

final authNotifierProvider =
    AsyncNotifierProvider<AuthNotifier, bool>(AuthNotifier.new);

class AuthNotifier extends AsyncNotifier<bool> {
  @override
  FutureOr<bool> build() async {
    // return true;
    try {
      final res = await ref.read(authServiceProvider).profile();
      return res.id != null;
    } catch (e) {
      return false;
    }
  }

  Future<void> login() async {
    state = const AsyncValue.data(true);
  }

  Future<void> logout() async {
    // await ref.read(authServiceProvider).logout();

    Future.wait([
      storageService.remove(localUserKey),
      secureStorageService.remove(tokenKey),
    ]);

    state = const AsyncValue.data(false);
  }
}
