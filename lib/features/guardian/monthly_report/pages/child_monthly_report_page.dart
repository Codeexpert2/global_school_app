import 'package:flutter/material.dart';
import 'package:global_school/components/main/main_appbar.dart';

class ChildMonthlyReportPage extends StatelessWidget {
  const ChildMonthlyReportPage({
    super.key,
    required this.childId,
  });

  final String childId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'Monthly Report $childId',
      ),
      body: const Center(
        child: Text('Child Monthly Report Page'),
      ),
    );
  }
}
