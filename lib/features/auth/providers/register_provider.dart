import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:template/core/utils/snackbars.dart';
import 'package:template/providers/auth_provider.dart';

final registerProvider = ChangeNotifierProvider<RegisterNotifier>(
  RegisterNotifier.new,
);

class RegisterNotifier extends ChangeNotifier {
  RegisterNotifier(this.ref);
  final Ref ref;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  bool _isChecked = false;
  bool get isChecked => _isChecked;

  void toggleTermsAndConditions(bool? val) {
    _isChecked = val ?? false;
    notifyListeners();
  }

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
  Future<void> register() async {
    try {
      if (formKey.currentState?.validate() ?? false) {
        emailFocusNode.unfocus();
        passwordFocusNode.unfocus();
        confirmPasswordFocusNode.unfocus();
        setLoading(true);

        // Simulate API call
        await Future.delayed(
          Durations.extralong4,
          () => Future.error('Register Faild!'),
        );

        ref.read(authNotifierProvider.notifier).login();

        // Proceed to the next screen
        showSuccessSnackbar('Register successful!');
        emailController.text = '';
        passwordController.text = '';
        confirmPasswordController.text = '';
      }
    } catch (e) {
      showErrorSnackbar(e.toString());
    } finally {
      setLoading(false);
    }
  }
}
