import 'package:flutter/material.dart';
import 'package:global_school/core/themes/app_colors.dart';
import 'package:global_school/core/locale/generated/l10n.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    required this.controller,
    this.hintText = 'Enter your Password',
    this.validator,
  });
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: !_showPassword,
      textInputAction: TextInputAction.send,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.black26),
        hintText: S.of(context).enterYourPassword,
        prefixIcon: const Icon(
          Icons.lock,
          color: AppColors.gray600,
          size: 16,
        ),
        filled: true,
        fillColor: AppColors.backgroundColorTextFild,
        contentPadding: const EdgeInsets.symmetric(vertical: 17.0),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
          icon: Icon(
            _showPassword ? Icons.visibility : Icons.visibility_off,
            color: AppColors.gray600,
            size: 16,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: widget.validator,
    );
  }
}
