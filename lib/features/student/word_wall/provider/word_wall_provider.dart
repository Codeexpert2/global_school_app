import 'package:global_school/features/student/word_wall/model/word_wall_model.dart';
import 'package:global_school/features/student/word_wall/service/word_wall_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final wordWallProvider = FutureProvider<ApiResponse>((ref) async {
  final wordWallService = ref.watch(wordWallServiceProvider);
  return wordWallService.fetchWordWalls();
});

final wordWallByIdProvider =
    FutureProvider.family<WordWall, int>((ref, id) async {
  final service = ref.watch(wordWallServiceProvider);
  final apiResponse = await service.fetchWordWallById(id);

  return apiResponse.data.isNotEmpty
      ? apiResponse.data[0]
      : throw Exception('لا يوجد');
});
