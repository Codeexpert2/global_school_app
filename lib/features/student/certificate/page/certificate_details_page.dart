import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:global_school/features/student/certificate/provider/certificate_provider.dart';

class CertificateDetailsPage extends ConsumerWidget {
  const CertificateDetailsPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final certificateData = ref.watch(certificateProvider(id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الشهادة'),
      ),
      body: certificateData.when(
        data: (certificate) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('المعدل التراكمي: ${certificate.gpa}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('الحالة: ${certificate.status ?? "غير معروف"}'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('حدث خطأ: $error')),
      ),
    );
  }
}
