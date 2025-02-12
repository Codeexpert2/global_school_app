import 'package:flutter/material.dart';

import 'package:global_school/core/locale/generated/l10n.dart';

class ChildOnlineExamResultsPage extends StatelessWidget {
  const ChildOnlineExamResultsPage({
    super.key,
    required this.childId,
  });

  final String childId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).onlineExamResults),
      ),
      body: Center(
        // child: Text('Child ID: $childId'),
        child: Text(S.of(context).onlineExamResults),
      ),
    );
  }
}
