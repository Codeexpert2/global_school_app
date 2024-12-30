import 'package:flutter/material.dart';

import 'package:template/components/loading/loading_widget.dart';
import 'package:template/core/themes/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary500,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Splash Screen'),
            SizedBox(height: 32),
            LoadingWidget()
          ],
        ),
      ),
    );
  }
}
