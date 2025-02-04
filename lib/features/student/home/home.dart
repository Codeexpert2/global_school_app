// import 'package:flutter/material.dart';
// import 'package:global_school/components/main/main_appbar.dart';
// import 'package:global_school/components/main/main_drawer.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:global_school/core/router/app_routes.dart';
// import 'package:global_school/core/locale/generated/l10n.dart';

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text(S.of(context).homeScreen),
//       //   actions: [
//       //     IconButton(
//       //       onPressed: ref.read(authNotifierProvider.notifier).logout,
//       //       icon: const Icon(Icons.logout_rounded),
//       //     )
//       //   ],
//       // ),
//       appBar: const MainAppBar(
//         title: 'Hello Ahmed',
//         subtitleText: 'Start your educational journey now',
//       ),

//       drawer: const MainDrawer(),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(S.of(context).welcomeToTheHomeScreen),
//             TextButton(
//               onPressed: () {
//                 context.pushNamed(AppRoutes.studentSettings.name);
//               },
//               child: Text(S.of(context).settings),
//             ),
//             TextButton(
//               onPressed: () {
//                 context.pushNamed(AppRoutes.profile.name);
//               },
//               child: Text(S.of(context).profile),
//             ),
//             // TextButton(
//             //   onPressed: () {
//             //     ref.watch(clientProvider).get('/');
//             //   },
//             //   child: Text(S.of(context).test),
//             // ),
//             // TextButton(
//             //   onPressed: () async {
//             //     await ref.read(authServiceProvider).profile();
//             //   },
//             //   child: const Text('profile'),
//             // ),
//             TextButton(
//               onPressed: () async {
//                 context.pushNamed('ar');
//               },
//               child: const Text('Ar'),
//             ),
//           ],
//         ),
//       ),
//       // body: ListView.builder(
//       //   itemCount: 5,
//       //   itemBuilder: (context, index) {
//       //     return Padding(
//       //       padding: const EdgeInsets.all(16),
//       //       child: Row(
//       //         children: [
//       //           ShimmerWidget(
//       //             child: Container(
//       //               width: 50,
//       //               height: 50,
//       //               decoration: BoxDecoration(
//       //                 color: Colors.grey[300],
//       //                 borderRadius: BorderRadius.circular(8),
//       //               ),
//       //             ),
//       //           ),
//       //           const SizedBox(width: 16),
//       //           Expanded(
//       //             child: ShimmerWidget(
//       //               child: Container(
//       //                 width: double.infinity,
//       //                 height: 20,
//       //                 color: Colors.grey[300],
//       //               ),
//       //             ),
//       //           ),
//       //         ],
//       //       ),
//       //     );
//       //   },
//       // ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:global_school/components/main/custom_section_header.dart';
import 'package:global_school/components/main/main_appbar.dart';
import 'package:global_school/components/main/main_drawer.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:global_school/features/student/home/widget/subject_card.dart';
import 'package:global_school/features/student/lessons/subjects/provider/subject_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjects = ref.watch(studentSubjectsProvider);
    // final subjects = [
    //   'الجغرافيا',
    //   'الرياضيات',
    //   'العلوم',
    //   'الكيمياء',
    //   'الفيزياء',
    //   'الأحياء',
    //   'التاريخ',
    //   'اللغة العربية'
    // ];

    return Scaffold(
        appBar: const MainAppBar(
          title: 'Hello Ahmed',
          subtitleText: 'Start your educational journey now',
        ),
        drawer: const MainDrawer(),
        body: subjects.when(
          data: (response) {
            final subjects = response.data ?? [];
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildWelcomeCard(),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      _buildCircularProgressCard(
                        context,
                        title: 'الرسوم',
                        progress: 0.75,
                        color: Colors.blue.shade100,
                      ),
                      const SizedBox(width: 16.0),
                      _buildCircularProgressCard(
                        context,
                        title: 'نسبة الحضور',
                        progress: 0.4,
                        color: Colors.red.shade100,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  CustomSectionHeader(
                    title: 'موادي',
                    actionText: 'عرض الكل',
                    onActionTap: () {
                      context.pushNamed(AppRoutes.studentSubjects.name);
                    },
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: subjects.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SubjectCard(subject: subjects[index]),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'تقدمك اليوم',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8.0),
                  _buildProgressCard(),
                ],
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ));
  }

  Widget _buildWelcomeCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: const Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'كن فضولياً، استكشف،',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'تعلم، واصنع مستقبلك!',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.computer,
            size: 48.0,
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: CircleAvatar(
          radius: 24.0,
          backgroundColor: Colors.green.shade100,
          child: const Icon(
            Icons.school,
            color: Colors.green,
          ),
        ),
        title: const Text(
          'الرياضيات',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: const Text('20/24 فيديو'),
        trailing: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '90%',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'كورس مكتمل',
              style: TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularProgressCard(
    BuildContext context, {
    required String title,
    required double progress,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8.0),
            Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation(
                    Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
