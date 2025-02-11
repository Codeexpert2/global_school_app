// // import 'package:flutter/material.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:global_school/features/student/lessons/subjects/models/subject_details_model.dart';
// // import 'package:global_school/features/student/lessons/subjects/provider/subject_provider.dart';
// // import 'package:intl/intl.dart';

// // class SubjectDetailsPage extends ConsumerWidget {
// //   const SubjectDetailsPage({super.key, required this.id});
// //   final int id;

// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     final subjectDetailsAsync = ref.watch(subjectDetailsProvider(id));

// //     return Scaffold(
// //       appBar: AppBar(title: const Text('تفاصيل المادة')),
// //       body: subjectDetailsAsync.when(
// //         data: _buildDetailsView,
// //         loading: () => const Center(child: CircularProgressIndicator()),
// //         error: (error, stack) => Center(child: Text('حدث خطأ: $error')),
// //       ),
// //     );
// //   }

// //   Widget _buildDetailsView(SubjectDetails subject) {
// //     return Padding(
// //       padding: const EdgeInsets.all(16.0),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           _buildDetailRow('الموضوع', subject.topic ?? 'غير متوفر'),
// //           _buildDetailRow('اسم المُنشئ', subject.creatingByName ?? 'غير متوفر'),
// //           _buildDetailRow('تاريخ اليوم', _formatDate(subject.day)),
// //           _buildDetailRow('وقت البدء', _formatDate(subject.startTime)),
// //           _buildDetailRow('وقت الانتهاء', _formatDate(subject.endTime)),
// //           _buildDetailRow('المدة', '${subject.duration ?? 0} دقيقة'),
// //           _buildDetailRow('كلمة المرور', subject.password ?? 'غير متوفر'),
// //           const SizedBox(height: 20),
// //           _buildActionButton('بدء الجلسة', subject.startUrl),
// //           _buildActionButton('الانضمام إلى الجلسة', subject.joinUrl),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildDetailRow(String label, String value) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 4.0),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
// //           Text(value, style: const TextStyle(color: Colors.grey)),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildActionButton(String label, String? url) {
// //     return url != null
// //         ? Padding(
// //             padding: const EdgeInsets.only(top: 10.0),
// //             child: ElevatedButton(
// //               onPressed: () {}, // قم بتنفيذ فتح الرابط
// //               child: Text(label),
// //             ),
// //           )
// //         : const SizedBox();
// //   }

// //   String _formatDate(DateTime? date) {
// //     return date != null
// //         ? DateFormat('yyyy-MM-dd HH:mm').format(date)
// //         : 'غير متوفر';
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:global_school/components/images/cached_image.dart';
// import 'package:global_school/components/main/main_appbar.dart';
// import 'package:global_school/core/themes/app_colors.dart';
// import 'package:global_school/features/student/lessons/subjects/provider/subject_provider.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../../../components/form/components.dart';

// class SubjectDetailsPage extends ConsumerWidget {
//   const SubjectDetailsPage({super.key, required this.id});
//   final String id;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final subjectDetailsAsync = ref.watch(subjectDetailsProvider(id));
//     return Scaffold(
//       appBar: const MainAppBar(
//         title: 'الرياضيات',
//       ),
//       body: subjectDetailsAsync.when(
//         data: (subject) => Stack(
//           children: [
//             SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     height: 150,
//                     width: double.infinity,
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage('assets/images/code_expert.png'),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'منهج الرياضيات الشامل',
//                           style: Theme.of(context).textTheme.headlineSmall,
//                         ),
//                         const SizedBox(height: 15),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             IconWithText(
//                                 icon: Icons.access_time,
//                                 text: '${subject.duration ?? 0} دقيقة'),
//                             const IconWithText(
//                                 icon: Icons.play_circle, text: '50 فيديو'),
//                             const IconWithText(
//                                 icon: Icons.library_books, text: '12 وحدة'),
//                           ],
//                         ),
//                         const SizedBox(height: 16),
//                         Card(
//                           color: const Color(0xFFEAF4FF),
//                           child: Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   'نبذة عن المادة',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   subject.topic ?? 'غير متوفر',
//                                   style: const TextStyle(
//                                       fontSize: 14, color: Colors.black54),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         const Text(
//                           'المدرسين',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Card(
//                           child: ListTile(
//                             leading: const CachedImage(
//                               imageUrl: '',
//                             ),
//                             title: Text(subject.creatingByName ?? 'غير متوفر'),
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         CustomButton(
//                           height: 60,
//                           text: 'بدء الدرس الآن',
//                           onPressed: () {},
//                         ),
//                         const SizedBox(height: 15),
//                         CustomButton(
//                           height: 60,
//                           text: 'الانضمام إلى الدرس',
//                           backgroundColor1: AppColors.transparent,
//                           backgroundColor2: AppColors.transparent,
//                           borderColor: AppColors.green2,
//                           textColor: AppColors.green2,
//                           onPressed: () {},
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               top: 120,
//               left: MediaQuery.of(context).size.width / 3 - 90,
//               child: const CircleAvatar(
//                 radius: 35,
//                 backgroundColor: Colors.green,
//                 child: Icon(
//                   Icons.play_arrow,
//                   size: 40,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         error: (error, stack) => Center(child: Text('حدث خطأ: $error')),
//         loading: () => const Center(child: CircularProgressIndicator()),
//       ),
//     );
//   }
// }

// class IconWithText extends StatelessWidget {
//   const IconWithText({
//     super.key,
//     required this.icon,
//     required this.text,
//   });
//   final IconData icon;
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(icon, size: 18, color: Colors.grey),
//         const SizedBox(width: 4),
//         Text(
//           text,
//           style: const TextStyle(
//               fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold),
//         ),
//       ],
//     );
//   }
// }
