import 'package:flutter/material.dart';
import 'package:global_school/components/main/main_appbar.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(
        title: 'Games',
      ),
      body: Center(
        child: Text('Games'),
      ),
    );
  }
}
