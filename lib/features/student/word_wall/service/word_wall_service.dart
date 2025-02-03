import 'package:dio/dio.dart';
import 'package:global_school/core/client/client.dart';
import 'package:global_school/features/student/word_wall/model/word_wall_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final wordWallServiceProvider = Provider<WordWallService>((ref) {
  final apiClient = ref.watch(clientProvider);
  return WordWallService(apiClient);
});

class WordWallService {
  WordWallService(this._apiClient);
  final ApiClient _apiClient;

  Future<ApiResponse> fetchWordWalls() async {
    try {
      final response = await _apiClient.get('/student/word-walls');
      return ApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
          'فشل في جلب بيانات الحائط: ${e.response?.data ?? e.message}');
    }
  }

  Future<ApiResponse> fetchWordWallById(int id) async {
    try {
      final response = await _apiClient.get('/student/word-walls/$id');
      return ApiResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
          'فشل في جلب بيانات الحائط رقم $id: ${e.response?.data ?? e.message}');
    }
  }
}
