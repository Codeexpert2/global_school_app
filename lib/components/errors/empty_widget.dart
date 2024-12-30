import 'package:flutter/material.dart';

import 'package:template/core/extensions/extensions.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              color: Theme.of(context).shadowColor.withOpacity(0.2),
              size: context.width / 4,
            ),
            const SizedBox(height: 16),
            Text(
              'لا يوجد بيانات !',
              style: TextStyle(
                color: Theme.of(context).shadowColor.withOpacity(0.2),
                fontSize: 24,
              ),
            ),
          ],
        ),
      );
}
