import 'package:flutter/material.dart';
import 'package:global_school/components/images/cached_image.dart';
import 'package:global_school/core/themes/app_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../components/form/components.dart';
import '../provider/online_lesson_provider.dart';

class OnlineLessonDetailsPage extends ConsumerWidget {
  const OnlineLessonDetailsPage({
    super.key,
    required this.lessonId,
  });

  final String lessonId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlineLessonDetailsAsync =
        ref.watch(onlineLessonDetailsProvider(lessonId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson Details'),
      ),
      body: onlineLessonDetailsAsync.when(
        data: (subject) => Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/code_expert.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'منهج الرياضيات الشامل',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconWithText(
                                icon: Icons.access_time,
                                text: '${subject.duration ?? 0} دقيقة'),
                            const IconWithText(
                                icon: Icons.play_circle, text: '50 فيديو'),
                            const IconWithText(
                                icon: Icons.library_books, text: '12 وحدة'),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Card(
                          color: const Color(0xFFEAF4FF),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'نبذة عن المادة',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  subject.topic ?? 'غير متوفر',
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'المدرسين',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CachedImage(
                                    imageUrl: '',
                                  ),
                                ),
                                const SizedBox(
                                    width: 16), 
                                Text(
                                  subject.creatingByName ?? 'غير متوفر',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        CustomButton(
                          height: 60,
                          text: 'بدء الدرس الآن',
                          onPressed: () {},
                        ),
                        const SizedBox(height: 15),
                        CustomButton(
                          height: 60,
                          text: 'الانضمام إلى الدرس',
                          backgroundColor1: AppColors.transparent,
                          backgroundColor2: AppColors.transparent,
                          borderColor: AppColors.green2,
                          textColor: AppColors.green2,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 120,
              left: MediaQuery.of(context).size.width / 3 - 90,
              child: const CircleAvatar(
                radius: 35,
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.play_arrow,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        error: (error, stack) => Center(child: Text('حدث خطأ: $error')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  const IconWithText({
    super.key,
    required this.icon,
    required this.text,
  });
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
              fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:global_school/core/extensions/extensions.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../provider/online_lesson_provider.dart';

// class OnlineLessonDetailsPage extends ConsumerWidget {
//   const OnlineLessonDetailsPage({
//     super.key,
//     required this.lessonId,
//   });

//   final String lessonId;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final onlineLessonDetailsAsync =
//         ref.watch(onlineLessonDetailsProvider(lessonId));

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Lesson Details'),
//       ),
//       body: onlineLessonDetailsAsync.when(
//         loading: () => const Center(child: CircularProgressIndicator()),
//         error: (error, stack) => Center(child: Text('Error: $error')),
//         data: (lesson) {
//           // if (response == null) {
//           //   return const Center(child: Text('No lesson details available.'));
//           // }
//           // final lesson = response; // تأكد من أن data ليس null
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 SizedBox(
//                   width: context.width,
//                 ),
//                 Text(
//                   'Topic: ${lesson.topic}',
//                   style: Theme.of(context).textTheme.headlineLarge,
//                 ),
//                 const SizedBox(height: 10),
//                 Text('Start Time: ${lesson.startTime}'),
//                 Text('End Time: ${lesson.endTime}'),
//                 Text('Created By: ${lesson.creatingByName}'),
//                 Text('Duration: ${lesson.duration} minutes'),
//                 Text('Meeting ID: ${lesson.meetingId}'),
//                 Text('Password: ${lesson.password}'),
//                 Text('Start URL: ${lesson.startUrl}'),
//                 Text('Join URL: ${lesson.joinUrl}'),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
