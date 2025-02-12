import 'package:flutter/material.dart';
import 'package:global_school/components/form/debounced_search.dart';
import 'package:global_school/core/locale/generated/l10n.dart';
import 'package:global_school/core/pagination/paginated_list_widget.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:global_school/features/student/certificate/model/certificate_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:global_school/features/student/certificate/provider/certificate_provider.dart';

class CertificatesPage extends ConsumerWidget {
  const CertificatesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title:  Text(S.of(context).certificates),
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
              child: ListTile(
                title:
                    Text('المعدل التراكمي: ${certificate.gpa ?? "غير متوفر"}'),
                subtitle: Text('الحالة: ${certificate.status ?? "غير معروف"}'),
                trailing: IconButton(
                  icon: const Icon(Icons.visibility),
                  onPressed: () {
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
        ));
  }
}
