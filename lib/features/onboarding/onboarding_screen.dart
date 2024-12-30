import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/core/keys/keys.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:global_school/core/themes/app_colors.dart';
import 'package:global_school/features/onboarding/pages.dart';
import 'package:global_school/features/onboarding/widgets/onboarding_page_widget.dart';
import 'package:global_school/initialize_app.dart';
import 'package:global_school/services/local_storage/storage_service.dart';

import 'constants/onboarding_constants.dart';
import 'provider/onboarding_provider.dart';

final storage = locator<StorageService>();

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(onboardingProvider);
    final pageController = PageController();

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: pages.length,
            onPageChanged: ref.read(onboardingProvider.notifier).setPage,
            itemBuilder: (context, index) => OnboardingPage(
              pageData: pages[index],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    pages.length,
                    (index) {
                      return AnimatedContainer(
                        curve: onboardingCurves,
                        duration: onboardingDuration,
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        width: currentPage == index ? maxSize : minSize,
                        height: currentPage == index ? maxSize : minSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPage == index
                              ? AppColors.primary500
                              : AppColors.gray400,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: currentPage == pages.length - 1
                            ? () async {
                                storage.saveBool(onboardingKey, true);
                                // Navigate to the next screen
                                context.goNamed(AppRoutes.home.name);
                              }
                            : () {
                                pageController.nextPage(
                                  duration: onboardingDuration,
                                  curve: onboardingCurves,
                                );
                              },
                        child: Text(
                          currentPage == pages.length - 1
                              ? 'Get Started'
                              : 'Next',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          storage.saveBool(onboardingKey, true);
                          // Navigate to the next screen
                          context.goNamed(AppRoutes.home.name);
                        },
                        child: const Text(
                          'Skip',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
