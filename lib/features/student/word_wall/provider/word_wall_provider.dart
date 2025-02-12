import 'package:global_school/core/pagination/models/pagination_state.dart';
import 'package:global_school/core/pagination/notifiers/paginated_list_notifier.dart';
import 'package:global_school/features/student/word_wall/model/word_wall_model.dart';
import 'package:global_school/features/student/word_wall/service/word_wall_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final wordWallSearchProvider = StateProvider<String>((ref) => '');

final wordWallsProvider = StateNotifierProvider.autoDispose<
    PaginatedListNotifier<WordWall>, PaginationState<WordWall>>((ref) {
  final wordWallService = ref.watch(wordWallServiceProvider);
  final query = ref.watch(wordWallSearchProvider);

  return PaginatedListNotifier<WordWall>(
    fetchData: (int page) async {
      final res = await wordWallService.getWordWalls(
        query: query,
        page: page,
      );
      return res;
    },
  );
});

final wordWallByIdProvider =
    FutureProvider.family<WordWall, int>((ref, id) async {
  final service = ref.watch(wordWallServiceProvider);
  final apiResponse = await service.getWordWallById(id);

  return apiResponse;
});
