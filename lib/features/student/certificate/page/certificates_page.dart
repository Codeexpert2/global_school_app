import 'package:flutter/material.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:global_school/features/student/certificate/provider/certificate_provider.dart';

class CertificatesPage extends ConsumerWidget {
  const CertificatesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final certificateData = ref.watch(certificateListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('الشهادات'),
      ),
      body: certificateData.when(
        data: (certificates) {
          if (certificates.isEmpty) {
            return const Center(child: Text('لا توجد شهادات متاحة.'));
          }
          return ListView.builder(
            itemCount: certificates.length,
            itemBuilder: (context, index) {
              final certificate = certificates[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                      'المعدل التراكمي: ${certificate.gpa ?? "غير متوفر"}'),
                  subtitle:
                      Text('الحالة: ${certificate.status ?? "غير معروف"}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.visibility),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => CertificateDetailsPage(
                      //       id: certificate.id.toString(),
                      //     ),
                      //   ),
                      // );
                      context.pushNamed(
                        AppRoutes.studentCertificateDetails.name,
                        pathParameters: {
                          'id': certificate.id.toString(),
                        },
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('حدث خطأ: $error')),
      ),
    );
  }
}
