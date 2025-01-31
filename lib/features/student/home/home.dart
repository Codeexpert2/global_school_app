import 'package:flutter/material.dart';
import 'package:global_school/components/main/main_appbar.dart';
import 'package:global_school/components/main/main_drawer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:global_school/core/locale/generated/l10n.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(S.of(context).homeScreen),
      //   actions: [
      //     IconButton(
      //       onPressed: ref.read(authNotifierProvider.notifier).logout,
      //       icon: const Icon(Icons.logout_rounded),
      //     )
      //   ],
      // ),
      appBar: const MainAppBar(
        title: 'Hello Ahmed',
        subtitleText: 'Start your educational journey now',
      ),

      drawer: const MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.of(context).welcomeToTheHomeScreen),
            TextButton(
              onPressed: () {
                context.pushNamed(AppRoutes.studentSettings.name);
              },
              child: Text(S.of(context).settings),
            ),
            TextButton(
              onPressed: () {
                context.pushNamed(AppRoutes.profile.name);
              },
              child: Text(S.of(context).profile),
            ),
            // TextButton(
            //   onPressed: () {
            //     ref.watch(clientProvider).get('/');
            //   },
            //   child: Text(S.of(context).test),
            // ),
            // TextButton(
            //   onPressed: () async {
            //     await ref.read(authServiceProvider).profile();
            //   },
            //   child: const Text('profile'),
            // ),
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
