import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:template/components/submit_button.dart';
import 'package:template/configs/app_configs.dart';
import 'package:template/core/functions/validators.dart';
import 'package:template/core/router/app_routes.dart';
import 'package:template/core/themes/app_colors.dart';
import 'package:template/core/utils/url_luncher.dart';
import 'package:template/providers/auth_provider.dart';

import '../providers/register_provider.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerState = ref.watch(registerProvider);
    final registerNotifier = ref.read(registerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Form(
        key: registerState.formKey,
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
                  focusNode: registerState.emailFocusNode,
                  controller: registerState.emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: emailValidator,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  onFieldSubmitted: (_) =>
                      registerState.passwordFocusNode.requestFocus(),
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
                  controller: registerState.passwordController,
                  focusNode: registerState.passwordFocusNode,
                  textInputAction: TextInputAction.next,
                  obscureText: !registerState.isPasswordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  validator: passwordValidator,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  onFieldSubmitted: (_) =>
                      registerState.confirmPasswordFocusNode.requestFocus(),
                  decoration: InputDecoration(
                    hintText: 'Enter your Password',
                    // labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(registerState.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: registerNotifier.togglePasswordVisibility,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Password Input
              SizedBox(
                height: 65,
                child: TextFormField(
                  controller: registerState.confirmPasswordController,
                  focusNode: registerState.confirmPasswordFocusNode,
                  textInputAction: TextInputAction.send,
                  obscureText: !registerState.isPasswordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (val) => confirmPasswordValidator(
                    val,
                    registerState.passwordController.text,
                  ),
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  onFieldSubmitted: (_) => registerNotifier.register(),
                  decoration: InputDecoration(
                    hintText: 'Enter your Password',
                    // labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(registerState.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: registerNotifier.togglePasswordVisibility,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Terms and Conditions
              Row(
                children: [
                  Transform.scale(
                    scale: 1.1,
                    child: Checkbox(
                      splashRadius: 16,
                      checkColor: AppColors.white,
                      activeColor: AppColors.primary500,
                      value: registerState.isChecked,
                      onChanged: registerNotifier.toggleTermsAndConditions,
                      side: const BorderSide(
                        color: AppColors.gray700,
                        width: 1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text.rich(
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.8,
                      ),
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'By registering, you agree to our ',
                          ),
                          TextSpan(
                            text: 'Terms of Service',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary700,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => openUrl(AppConfigs.termsOfServiceUrl),
                          ),
                          const TextSpan(
                            text: ' and ',
                          ),
                          TextSpan(
                            text: 'Privacy Policy.',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary500,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => openUrl(AppConfigs.privacyPolicyUrl),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              // Social Media Login Buttons
              const SizedBox(height: 24),
              // Submit Button
              SubmitButton(
                text: 'Register',
                onPressed: registerNotifier.register,
                isLoading: registerNotifier.isLoading,
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {
                    ref.invalidate(authNotifierProvider);
                    context.goNamed(
                      AppRoutes.login.name,
                    );
                  },
                  child: const Text(
                    'Do you have an account ?',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
