import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/pagination_state.dart';
import '../models/pagination_status.dart';

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

/// Type definition for the data fetching callback
typedef FetchDataCallback<T> = Future<PaginatedResponse<T>> Function(int page);

/// Notifier class that manages paginated list state
class PaginatedListNotifier<T> extends StateNotifier<PaginationState<T>> {
  PaginatedListNotifier({
    required this.fetchData,
    this.itemsPerPage = 20,
  }) : super(PaginationState<T>());
  final FetchDataCallback<T> fetchData;
  final int itemsPerPage;

  /// Refreshes the list by clearing existing data and reloading
  Future<void> refresh() async {
    state = state.copyWith(
      status: PaginationStatus.initial,
      items: [],
      currentPage: 1,
      hasMoreData: true,
    );
    await loadNextPage();
  }

  /// Loads the next page of data
  Future<void> loadNextPage() async {
    if (state.status == PaginationStatus.loading || !state.hasMoreData) return;

    state = state.copyWith(status: PaginationStatus.loading);

    try {
      final res = await fetchData(state.currentPage);

      final updatedItems = [...state.items, ...((res.data ?? []).cast<T>())];

      state = state.copyWith(
        items: updatedItems,
        status: PaginationStatus.success,
        hasMoreData: res.meta?.hasMore ?? false,
        currentPage: res.meta?.currentPage,
      );
    } catch (e) {
      state = state.copyWith(
        status: PaginationStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}
