import 'package:flutter/material.dart';
import 'package:global_school/components/main/main_appbar.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(
        title: 'Terms & Conditions',
      ),
      body: Center(
        child: Text(
          'This is the Terms & Conditions screen.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
