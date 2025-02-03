import 'package:global_school/core/client/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:global_school/core/pagination/models/pagination_state.dart';
import 'package:global_school/core/pagination/notifiers/paginated_list_notifier.dart';
import 'package:global_school/features/student/accessories/service/accessories_service.dart';
import 'package:global_school/features/student/accessories/model/accessorie_model.dart';
import 'package:global_school/core/enums/accessorie_content_type.dart';

// Provider للـ Service
final accessoriesServiceProvider = Provider<AccessoriesService>((ref) {
  final apiClient = ref.watch(clientProvider);
  return AccessoriesService(apiClient);
});

// Search query for accessories
final accessoriesSearchProvider = StateProvider<String>((ref) => '');

// Create the accessories provider using PaginatedListNotifier
final accessoriesProvider = StateNotifierProvider.autoDispose<
    PaginatedListNotifier<Datum>, PaginationState<Datum>>((ref) {
  final accessoriesService = ref.watch(accessoriesServiceProvider);
  final query = ref.watch(accessoriesSearchProvider);
  final contentType = ref.watch(contentTypeProvider); 

  return PaginatedListNotifier<Datum>(fetchData: (int page) async {
    final res = await accessoriesService.getAccessories(
      sectionId: 3,
      contentType: contentType,
      query: query,
      page: page,
      perPage: 10,
    );
    return res;
  });
});

final contentTypeProvider =
    StateProvider<ContentType>((ref) => ContentType.files);
