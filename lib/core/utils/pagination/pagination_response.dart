import 'pagination_request.dart';

typedef JsonData = Map<String, dynamic>;

class PaginationResponse<T> {

  PaginationResponse({
    this.totalCourses,
    this.totalPages,
    this.currentPage,
    required this.data,
  });

  factory PaginationResponse.fromJson(
    JsonData json,
    T Function(JsonData json) dataFromJson, [
    String dataKey = 'data',
    bool isPaginationObject = false,
  ]) {
    final List<T> dataList = [];
    final jsonDataList = json[dataKey] as List<dynamic>;
    for (final item in jsonDataList) {
      dataList.add(dataFromJson(item));
    }

    if (isPaginationObject) {
      return PaginationResponse(
        totalCourses: json['pagination']['total_courses'],
        totalPages: json['pagination']['total_pages'],
        currentPage: json['pagination']['current_page'],
        data: dataList,
      );
    } else {
      return PaginationResponse(
        totalCourses: json['total_courses'],
        totalPages: json['total_pages'],
        currentPage: json['current_page'],
        data: dataList,
      );
    }
  }
  final int? totalCourses;
  final int? totalPages;
  final int? currentPage;
  final List<T> data;

  bool get isCompleted => (currentPage ?? 0) >= (totalPages ?? 0);

  PaginationRequest nextPage() => PaginationRequest(
        page: (currentPage ?? 0) + 1,
      );
}
