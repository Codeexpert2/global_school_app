import 'package:flutter/material.dart';
import 'package:global_school/components/form/components.dart';
import 'package:global_school/core/themes/app_colors.dart';
import 'package:global_school/locale/generated/l10n.dart';

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
      // appBar: AppBar(
      //   title: Text(S.of(context).login),
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: loginState.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 120),
              SizedBox(
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    'assets/images/madares_icon.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                S.of(context).welcomeToMadares,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: AppColors.green1,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                'Log in via email or student serial number',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              // Email Input
              // SizedBox(
              //   height: 65,
              //   child: TextFormField(
              //     autofocus: true,
              //     autocorrect: true,
              //     enableSuggestions: true,
              //     focusNode: loginState.emailFocusNode,
              //     controller: loginState.emailController,
              //     keyboardType: TextInputType.emailAddress,
              //     textInputAction: TextInputAction.next,
              //     validator: emailValidator,
              //     onTapOutside: (event) {
              //       FocusManager.instance.primaryFocus!.unfocus();
              //     },
              //     onFieldSubmitted: (_) =>
              //         loginState.passwordFocusNode.requestFocus(),
              //     decoration: InputDecoration(
              //       hintText: S.of(context).enterYourEmail,
              //       // labelText: 'Email',
              //       prefixIcon: const Icon(Icons.email),
              //     ),
              //   ),
              // ),
              CustomTextField(
                controller: loginState.emailController,
                hintText: S.of(context).enterYourEmail,
                validator: emailValidator,
                keyboardType: TextInputType.emailAddress,
                iconData: Icons.email,
                iconColor: AppColors.gray600,
              ),
              const SizedBox(height: 16),
              // Password Input
              CustomPasswordField(
                controller: loginState.passwordController,
                validator: passwordValidator,
              ),
              // SizedBox(
              //   height: 65,
              //   child: TextFormField(
              //     controller: loginState.passwordController,
              //     focusNode: loginState.passwordFocusNode,
              //     textInputAction: TextInputAction.send,
              //     obscureText: !loginState.isPasswordVisible,
              //     keyboardType: TextInputType.visiblePassword,
              //     validator: passwordValidator,
              //     onTapOutside: (event) {
              //       FocusManager.instance.primaryFocus!.unfocus();
              //     },
              //     onFieldSubmitted: (_) => loginNotifier.login(),
              //     decoration: InputDecoration(
              //       hintText: S.of(context).enterYourPassword,
              //       // labelText: 'Password',
              //       prefixIcon: const Icon(Icons.lock),
              //       suffixIcon: IconButton(
              //         icon: Icon(loginState.isPasswordVisible
              //             ? Icons.visibility
              //             : Icons.visibility_off),
              //         onPressed: loginNotifier.togglePasswordVisibility,
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 24),
              // Align(
              //   alignment: AlignmentDirectional.centerEnd,
              //   child: TextButton(
              //     onPressed: () => context.pushNamed(
              //       AppRoutes.resetPassword.name,
              //     ),
              //     child: Text(S.of(context).didForgetYourPassword),
              //   ),
              // ),
              // Submit Button
              SubmitButton(
                text: S.of(context).login,
                onPressed: loginNotifier.login,
                isLoading: loginNotifier.isLoading,
              ),
              // const SizedBox(height: 24),
              // TextButton(
              //   onPressed: () => context.goNamed(
              //     AppRoutes.register.name,
              //   ),
              //   child: Text(S.of(context).youDontHaveAccount),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
