import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/core/utils/snackbars.dart';

import '../services/help_service.dart';

final helpProvider = ChangeNotifierProvider<HelpNotifier>(
  HelpNotifier.new,
);

class HelpNotifier extends ChangeNotifier {
  HelpNotifier(this.ref);
  final Ref ref;

  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final messageController = TextEditingController();

  final titleFocusNode = FocusNode();
  final messageFocusNode = FocusNode();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  // submit
  Future<void> submit() async {
    try {
      if (formKey.currentState?.validate() ?? false) {
        titleFocusNode.unfocus();
        messageFocusNode.unfocus();
        setLoading(true);

        await ref.read(helpServiceProvider).submitHelp(
              titleController.text,
              messageController.text,
            );

        // Proceed to the next screen
        showSuccessSnackbar('Submiting Send Successfuly!');
        titleController.text = '';
        messageController.text = '';
      }
    } catch (e) {
      showErrorSnackbar(e.toString());
    } finally {
      setLoading(false);
    }
  }
}
