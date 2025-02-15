import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/core/locale/generated/l10n.dart';
import 'package:global_school/core/themes/app_colors.dart';
import 'package:global_school/core/themes/app_gradients.dart';
import 'package:global_school/core/utils/snackbars.dart';
import 'package:global_school/features/student/certificate/provider/certificate_provider.dart';

class CertificateDetailsPage extends ConsumerWidget {
  const CertificateDetailsPage({super.key, required this.id});
  final String id;

  String _getMotivationalMessage(double? gpa) {
    if (gpa == null) return 'لا يوجد بيانات عن المعدل التراكمي.';
    if (gpa >= 90) {
      return 'معدل تراكمي ممتاز! أنت مثال للتفوق والتميز. استمر في تحقيق النجاحات!';
    } else if (gpa >= 70) {
      return 'معدل تراكمي جيد! أنت على الطريق الصحيح، واصل العمل بجد لتحقيق المزيد.';
    } else {
      return 'معدل تراكمي يحتاج إلى تحسين. لا تيأس، كل بداية صعبة، ولكن المثابرة ستوصلك إلى القمة.';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final certificateData = ref.watch(certificateProvider(id));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).certificateDetails,
        ),
        centerTitle: true,
      ),
      body: certificateData.when(
        data: (certificate) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: AppGradient.linearGradient,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 12,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.school, size: 60, color: Colors.white),
                  const SizedBox(height: 15),
                  const Text(
                    'Certificate of Achievement',
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Ahmad Aldali',
                    // certificate.user?.name ?? 'اسم الطالب غير متوفر',
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Number: 123456',
                    // 'الرقم التسلسلي: ${certificate.user?.serialNumber ?? "غير متوفر"}',
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "GPA: ${certificate.gpa ?? "غير متوفر"}",
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _getMotivationalMessage(
                        double.tryParse(certificate.gpa ?? '0')),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  if (certificate.createdAt != null)
                    Text(
                      'تاريخ الإنشاء: ${certificate.createdAt}',
                    ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      showSuccessSnackbar('تم تحميل الشهادة بنجاح.');
                    },
                    icon: const Icon(Icons.download, color: AppColors.green2),
                    label: const Text(
                      'تحميل الشهادة',
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
            child: Text('حدث خطأ: $error',
                style: const TextStyle(color: Colors.red))),
      ),
    );
  }
}
