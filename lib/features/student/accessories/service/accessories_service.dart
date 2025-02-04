import 'dart:developer';

import 'package:global_school/core/client/client.dart';
import 'package:global_school/core/enums/accessorie_content_type.dart';
import 'package:global_school/core/pagination/models/paginated_response.dart';
import 'package:global_school/features/student/accessories/model/accessorie_model.dart';

class AccessoriesService {
  AccessoriesService(this._apiClient);
  final ApiClient _apiClient;

  Future<PaginatedResponse<Accessorie>> getAccessories({
    required int sectionId,
    required ContentType contentType,
    String query = '',
    int page = 1,
    int perPage = 10,
  }) async {
    final cacheKey = '$sectionId-$contentType-$query-$page-$perPage';
    if (_cache.containsKey(cacheKey)) {
      return _cache[cacheKey]!;
    }

    try {
      final contentTypeValue = contentType.value;
      final queryValue = query.isEmpty ? null : query;

      final response = await _apiClient.get(
        '/student/accessories/$sectionId',
        queryParameters: {
          'content_type': contentTypeValue,
          'query': queryValue,
          'page': page.toString(),
          'per_page': perPage.toString(),
        },
      );

      if (response.statusCode != 200) {
        throw Exception('API returned status code ${response.statusCode}');
      }

      if (response.data == null) {
        throw Exception('API returned null data');
      }

      final accessories = PaginatedResponse.fromJson(
        response.data,
        Accessorie.fromJson,
      );

      _cache[cacheKey] = accessories;
      return accessories;
    } catch (e) {
      log('Error fetching accessories: $e');
      throw Exception('Failed to fetch accessories: $e');
    }
  }

  final _cache = <String, PaginatedResponse<Accessorie>>{};
}
