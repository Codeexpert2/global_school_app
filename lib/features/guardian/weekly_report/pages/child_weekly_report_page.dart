import 'package:flutter/material.dart';
import 'package:global_school/components/main/main_appbar.dart';

class ChildWeeklyReportPage extends StatelessWidget {
  const ChildWeeklyReportPage({
    super.key,
    required this.childId,
  });

  final String childId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'Weekly Report $childId',
      ),
      body: const Center(
        child: Text('Child Weekly Report Page'),
      ),
    );
  }
}
