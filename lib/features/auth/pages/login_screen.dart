import 'package:flutter/material.dart';
import 'package:global_school/core/extensions/extensions.dart';
import 'package:global_school/core/themes/app_colors.dart';
import 'package:global_school/core/locale/generated/l10n.dart';
import 'package:global_school/features/student/settings/widgets/locale_buttom.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/components/submit_button.dart';
import 'package:global_school/core/functions/validators.dart';

import '../providers/login_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);
    final loginNotifier = ref.read(loginProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: LocaleButtom(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: loginState.formKey,
          child: AutofillGroup(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: kToolbarHeight),
                SizedBox(
                  height: context.width / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Image.asset(
                      'assets/images/madares_icon.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  S.of(context).welcomeToMadares,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppColors.green1,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Log in via email or student serial number',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                // Email Input
                SizedBox(
                  height: 65,
                  child: TextFormField(
                    autofocus: true,
                    autocorrect: true,
                    enableSuggestions: true,
                    autofillHints: [AutofillHints.email],
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
                    decoration: InputDecoration(
                      hintText: S.of(context).enterYourEmail,
                      // labelText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Password Input
                SizedBox(
                  height: 65,
                  child: TextFormField(
                    autofillHints: [AutofillHints.password],
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
                      hintText: S.of(context).enterYourPassword,
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
                // Submit Button
                SubmitButton(
                  text: S.of(context).login,
                  onPressed: loginNotifier.login,
                  isLoading: loginNotifier.isLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
