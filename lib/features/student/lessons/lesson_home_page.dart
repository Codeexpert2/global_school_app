import 'package:flutter/material.dart';

import 'package:global_school/components/main/main_appbar.dart';

class LessonHomePage extends StatelessWidget {
  const LessonHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(
        title: 'اختر نوع الدرس',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
