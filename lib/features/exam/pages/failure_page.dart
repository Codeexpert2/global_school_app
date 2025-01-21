import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FailureQuizPage extends StatelessWidget {
  const FailureQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFB24592), Color(0xFF8E44AD)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/animation/failure.json',
                  // width: 100,
                  // height: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                const Text(
                  'لا بأس!',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 3),
                        blurRadius: 5,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'لم توفق هذه المرة، لكن الفرصة ما زالت قائمة.\nحاول مرة أخرى ونحن نؤمن بك! 💪',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'عودة إلى الصفحة الرئيسية',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      decoration: TextDecoration.underline,
                    ),
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
