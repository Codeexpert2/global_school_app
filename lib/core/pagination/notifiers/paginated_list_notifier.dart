import 'package:global_school/configs/app_configs.dart';
import 'package:global_school/core/pagination/models/paginated_response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/pagination_state.dart';
import '../models/pagination_status.dart';

/// Type definition for the data fetching callback
typedef FetchDataCallback<T> = Future<PaginatedResponse<T>> Function(int page);

/// Notifier class that manages paginated list state
class PaginatedListNotifier<T> extends StateNotifier<PaginationState<T>> {
  PaginatedListNotifier({
    required this.fetchData,
    this.itemsPerPage = AppConfigs.perPage,
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
        currentPage: (res.meta?.currentPage ?? 1) + 1,
      );
    } catch (e) {
      state = state.copyWith(
        status: PaginationStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}
