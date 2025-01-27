import 'package:flutter/material.dart';
import 'package:global_school/components/main/main_appbar.dart';
import 'package:global_school/components/main/main_drawer.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/core/router/app_routes.dart';
import 'package:global_school/core/locale/generated/l10n.dart';

class TeacherHomeScreen extends ConsumerWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const MainAppBar(
        title: 'Hello Teacher',
      ),
      drawer: const MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.of(context).welcomeToTheHomeScreen),
            TextButton(
              onPressed: () async {
                context.pushNamed('ar');
              },
              child: const Text('Ar'),
            ),
          ],
        ),
      ),
      // body: ListView.builder(
      //   itemCount: 5,
      //   itemBuilder: (context, index) {
      //     return Padding(
      //       padding: const EdgeInsets.all(16),
      //       child: Row(
      //         children: [
      //           ShimmerWidget(
      //             child: Container(
      //               width: 50,
      //               height: 50,
      //               decoration: BoxDecoration(
      //                 color: Colors.grey[300],
      //                 borderRadius: BorderRadius.circular(8),
      //               ),
      //             ),
      //           ),
      //           const SizedBox(width: 16),
      //           Expanded(
      //             child: ShimmerWidget(
      //               child: Container(
      //                 width: double.infinity,
      //                 height: 20,
      //                 color: Colors.grey[300],
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
