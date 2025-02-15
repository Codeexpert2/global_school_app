import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/components/form/debounced_search.dart';
import 'package:global_school/core/locale/generated/l10n.dart';
import 'package:global_school/core/pagination/paginated_list_widget.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:global_school/features/student/certificate/model/certificate_model.dart';
import 'package:global_school/features/student/certificate/provider/certificate_provider.dart';

class CertificatesPage extends ConsumerWidget {
  const CertificatesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).certificates),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: DebouncedSearch(
            onDebounceChange: (value) {
              // Update search query
              ref.read(certificateSearchProvider.notifier).state = value;
              // Refresh the list
              ref.read(certificateListProvider.notifier).refresh();
            },
          ),
        ),
      ),
      body: PaginatedListWidget<Certificate>(
        provider: certificateListProvider,
        itemBuilder: (context, certificate) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    "GPA : ${certificate.gpa ?? "غير متوفر"}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // حالة الشهادة
                  Row(
                    children: [
                      const Icon(Icons.info, size: 16, color: Colors.orange),
                      const SizedBox(width: 4),
                      Text(
                        "Status: ${certificate.status ?? "غير معروف"}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        context.pushNamed(
                          AppRoutes.studentCertificateDetails.name,
                          pathParameters: {
                            'id': certificate.id.toString(),
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Show Certificate',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
