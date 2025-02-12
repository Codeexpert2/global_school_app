import 'package:dio/dio.dart';
import 'package:global_school/core/client/client.dart';
import 'package:global_school/core/pagination/models/paginated_response.dart';
import 'package:global_school/features/student/word_wall/model/word_wall_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final wordWallServiceProvider = Provider<WordWallService>((ref) {
  final apiClient = ref.watch(clientProvider);
  return WordWallService(apiClient);
});

class WordWallService {
  WordWallService(this._apiClient);
  final ApiClient _apiClient;

  Future<PaginatedResponse<WordWall>> getWordWalls({
    String query = '',
    int page = 1,
    int perPage = 10,
  }) async {
    try {
      final response = await _apiClient.get(
        '/student/word-walls',
        queryParameters: {
          'query': query,
          'page': page.toString(),
          'per_page': perPage.toString(),
        },
      );
      return PaginatedResponse.fromJson(
        response.data,
        WordWall.fromJson,
      );
    } catch (e) {
      throw Exception('Failed to fetch word walls: $e');
    }
  }

  Future<WordWall> getWordWallById(int id) async {
    try {
      final response = await _apiClient.get('/student/word-walls/$id');
      return WordWall.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
          'Failed to fetch word wall details: ${e.response?.data ?? e.message}');
    }
  }
}
