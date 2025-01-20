import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class SuccessQuizPage extends StatelessWidget {
  const SuccessQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Lottie.asset(
              'assets/animation/Animation - 1737409561651.json',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
