import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:template/core/utils/snackbars.dart';

final resetPasswordProvider = ChangeNotifierProvider<ResetPasswordNotifier>(
  ResetPasswordNotifier.new,
);

class ResetPasswordNotifier extends ChangeNotifier {
  ResetPasswordNotifier(this.ref);
  final Ref ref;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  // Reset Password
  Future<void> resetPassword() async {
    try {
      if (formKey.currentState?.validate() ?? false) {
        emailFocusNode.unfocus();
        setLoading(true);

        // Simulate API call
        await Future.delayed(
          Durations.extralong4,
          () => Future.error('Reset Password Faild!'),
        );

        // Proceed to the next screen
        showSuccessSnackbar('Reset Password successful!');
        emailController.text = '';
      }
    } catch (e) {
      showErrorSnackbar(e.toString());
    } finally {
      setLoading(false);
    }
  }
}
