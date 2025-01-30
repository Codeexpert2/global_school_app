class PaginatedResponse<T> {
  PaginatedResponse({
    this.success,
    this.message,
    this.meta,
    this.data,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) dataFromJson,
  ) {
    final List<T> dataList = [];
    final jsonDataList = json['data'] as List<dynamic>;
    for (final item in jsonDataList) {
      dataList.add(dataFromJson(item));
    }
    return PaginatedResponse(
      success: json['success'],
      message: json['message'],
      meta: json['meta'] == null ? null : Meta.fromJson(json['meta']),
      data: dataList,
    );
  }
  bool? success;
  String? message;
  Meta? meta;
  List<T>? data;
}

class Meta {
  Meta({
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
    this.hasMore,
    this.hasPrev,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json['current_page'],
        lastPage: json['last_page'],
        perPage: json['per_page'],
        total: json['total'],
        hasMore: json['has_more'],
        hasPrev: json['has_prev'],
      );
  int? currentPage;
  int? lastPage;
  int? perPage;
  int? total;
  bool? hasMore;
  bool? hasPrev;
}
