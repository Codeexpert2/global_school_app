import 'package:flutter/material.dart';
import 'package:global_school/core/themes/app_colors.dart';

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
          Image.asset(
            pageData.imagePath,
            // pageData.imagePath,
            height: 250,
          ),
          const SizedBox(height: 32),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [AppColors.green1,AppColors.green2],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bounds),
            child: Text(
              pageData.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.white,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            pageData.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 16
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
