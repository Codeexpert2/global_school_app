import 'package:global_school/core/pagination/models/pagination_state.dart';
import 'package:global_school/core/pagination/notifiers/paginated_list_notifier.dart';
import 'package:global_school/features/student/certificate/model/certificate_model.dart';
import 'package:global_school/features/student/certificate/service/certificate_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// final certificateListProvider = FutureProvider<List<Certificate>>((ref) {
//   final certificateService = ref.read(certificateServiceProvider);
//   return certificateService.fetchCertificates();
// });
final certificateSearchProvider= StateProvider<String>((ref) => '');
final certificateListProvider = StateNotifierProvider.autoDispose<
    PaginatedListNotifier<Certificate>, PaginationState<Certificate>>(
  (ref) {
    final certificateService = ref.watch(certificateServiceProvider);
    final query = ref.watch(certificateSearchProvider);

    return PaginatedListNotifier<Certificate>(
      fetchData: (int page) async {
        final res = await certificateService.fetchCertificates(
          query: query,
          page: page,
        );
        return res;
      },
    );
  },
);

final certificateProvider =
    FutureProvider.family<Certificate, String>((ref, id) {
  final certificateService = ref.read(certificateServiceProvider);
  return certificateService.fetchCertificateById(id);
});

