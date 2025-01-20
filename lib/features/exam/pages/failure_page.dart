import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class FailureQuizPage extends StatelessWidget {
  const FailureQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Lottie.asset(
              'assets/animation/failure.json',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
