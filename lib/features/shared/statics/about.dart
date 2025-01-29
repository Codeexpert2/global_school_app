import 'package:flutter/material.dart';
import 'package:global_school/components/main/main_appbar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(
        title: 'About',
      ),
      body: Center(
        child: Column(
          children: [
            Text('This is the About screen'),
            Text('Version 1.0.0'),
            SizedBox(height: 16),
            Text('Created by Your Name'),
          ],
        ),
      ),
    );
  }
}
