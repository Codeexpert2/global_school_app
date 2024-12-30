import 'package:flutter/material.dart';

import '../models/onboarding_model.dart';

class OnboardingPage extends StatelessWidget {

  const OnboardingPage({
    super.key,
    required this.pageData,
  });
  final OnboardingPageData pageData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset(
          //   pageData.imagePath,
          //   height: 250,
          // ),
          const SizedBox(height: 32),
          Text(
            pageData.title,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            pageData.description,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
