import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:template/components/submit_button.dart';
import 'package:template/core/functions/validators.dart';
import 'package:template/core/router/app_routes.dart';

import '../providers/login_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);
    final loginNotifier = ref.read(loginProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Form(
        key: loginState.formKey,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Email Input
              SizedBox(
                height: 65,
                child: TextFormField(
                  autofocus: true,
                  autocorrect: true,
                  enableSuggestions: true,
                  focusNode: loginState.emailFocusNode,
                  controller: loginState.emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: emailValidator,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  onFieldSubmitted: (_) =>
                      loginState.passwordFocusNode.requestFocus(),
                  decoration: const InputDecoration(
                    hintText: 'Enter your Email',
                    // labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Password Input
              SizedBox(
                height: 65,
                child: TextFormField(
                  controller: loginState.passwordController,
                  focusNode: loginState.passwordFocusNode,
                  textInputAction: TextInputAction.send,
                  obscureText: !loginState.isPasswordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  validator: passwordValidator,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  onFieldSubmitted: (_) => loginNotifier.login(),
                  decoration: InputDecoration(
                    hintText: 'Enter your Password',
                    // labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(loginState.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: loginNotifier.togglePasswordVisibility,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () => context.goNamed(
                    AppRoutes.resetPassword.name,
                  ),
                  child: const Text('Did Forget your Password ?'),
                ),
              ),
              // Submit Button
              SubmitButton(
                text: 'Login',
                onPressed: loginNotifier.login,
                isLoading: loginNotifier.isLoading,
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () => context.goNamed(
                  AppRoutes.register.name,
                ),
                child: const Text('You don\'t have account ?'),
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () => context.goNamed(
                  AppRoutes.settings.name,
                ),
                child: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
