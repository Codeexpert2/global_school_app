import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_school/core/keys/keys.dart';
import 'package:global_school/initialize_app.dart';
import 'package:global_school/core/locale/generated/l10n.dart';
import 'package:global_school/services/local_storage/secure_storage_service.dart';
import 'package:global_school/services/local_storage/storage_service.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/core/utils/snackbars.dart';
import 'package:global_school/features/auth/providers/auth_provider.dart';

import '../data/auth_service.dart';

final loginProvider = ChangeNotifierProvider<LoginNotifier>(
  LoginNotifier.new,
);

class LoginNotifier extends ChangeNotifier {
  LoginNotifier(this.ref);
  final Ref ref;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController(
    text: 'student@gmail.com',
    // text: 'admin@gmail.com',
  );
  final passwordController = TextEditingController(
    text: 'Cx123456789',
    // text: 'Password2',
  );

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  // login
  Future<void> login() async {
    try {
      if (formKey.currentState?.validate() ?? false) {
        TextInput.finishAutofillContext();
        emailFocusNode.unfocus();
        passwordFocusNode.unfocus();
        setLoading(true);
        final res = await ref.read(authServiceProvider).login(
              emailController.text,
              passwordController.text,
            );

        if (res.status == false) {
          throw (res.message ?? S.current.loginFailed);
        }

        // Update the token
        final storageService = locator<StorageService>();
        final secureStorageService = locator<SecureStorageService>();

        await storageService.saveJson(localUserKey, res.toJson());
        await secureStorageService.save(tokenKey, res.token ?? '');

        await ref.read(authNotifierProvider.notifier).login();

        // Proceed to the next screen
        showSuccessSnackbar(S.current.loginSuccessful);
        reset();
      }
    } catch (e) {
      showErrorSnackbar(e.toString());
    } finally {
      setLoading(false);
    }
  }

  void reset() {
    emailController.clear();
    passwordController.clear();
  }
}
