import 'package:flutter/material.dart';
import 'package:global_school/components/main/main_appbar.dart';

class ChildDetailsPage extends StatelessWidget {
  const ChildDetailsPage({
    super.key,
    required this.childId,
  });

  final String childId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'Child Details #$childId',
      ),
      body: const Center(
        child: Text('This is the Child Details Page'),
      ),
    );
  }
}
