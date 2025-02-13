import 'package:flutter/material.dart';

import 'package:global_school/components/loading/loading_widget.dart';
import 'package:global_school/core/constants/images.dart';
import 'package:global_school/core/extensions/context_ext.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            Image.asset(
              AppImages.imagesMadaresIcon,
            ),
            const SizedBox(height: 24),
            const LoadingWidget(),
            const Spacer(),
            const Text('Devloped By '),
            Image.asset(
              AppImages.imagesCodeExpert,
              width: context.width / 3,
            ),
            const SizedBox(height: kToolbarHeight),
          ],
        ),
      ),
    );
  }
}
