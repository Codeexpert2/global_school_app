import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/components/submit_button.dart';
import 'package:global_school/core/functions/validators.dart';

import '../providers/reset_password_provider.dart';

class PasswordResetScreen extends ConsumerWidget {
  const PasswordResetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resetPasswordState = ref.watch(resetPasswordProvider);
    final resetPasswordNotifier = ref.read(resetPasswordProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Password Reset')),
      body: Form(
        key: resetPasswordState.formKey,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(size: 100),
              const SizedBox(height: 64),
              // Email Input
              SizedBox(
                height: 65,
                child: TextFormField(
                  autofocus: true,
                  autocorrect: true,
                  enableSuggestions: true,
                  focusNode: resetPasswordState.emailFocusNode,
                  controller: resetPasswordState.emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.send,
                  validator: emailValidator,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  onFieldSubmitted: (_) =>
                      resetPasswordNotifier.resetPassword(),
                  decoration: const InputDecoration(
                    hintText: 'Enter your Email',
                    // labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SubmitButton(
                text: 'Reset Password',
                onPressed: resetPasswordNotifier.resetPassword,
                isLoading: resetPasswordNotifier.isLoading,
              ),
              // Submit Button
            ],
          ),
        ),
      ),
    );
  }
}
