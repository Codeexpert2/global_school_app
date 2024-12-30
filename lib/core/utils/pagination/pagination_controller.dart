import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: implementation_imports, depend_on_referenced_packages
import 'package:riverpod/src/async_notifier.dart';

import 'pagination_request.dart';
import 'pagination_response.dart';

// ignore: invalid_use_of_internal_member
mixin PaginationController<T> on AsyncNotifierBase<PaginationResponse<T>> {
  FutureOr<PaginationResponse<T>> loadData(PaginationRequest query);

  Future<void> loadMore() async {
    final oldState = state;
    if (oldState.requireValue.isCompleted) return;
    state = AsyncLoading<PaginationResponse<T>>().copyWithPrevious(oldState);

    state = await AsyncValue.guard<PaginationResponse<T>>(() async {
      final res = await loadData(oldState.requireValue.nextPage());
      res.data.insertAll(0, state.requireValue.data);
      return res;
    });
  }

  bool canLoadMore() {
    if (state.isLoading) return false;
    if (state.hasError) return false;
    if (!state.hasValue) return false;
    if (state.requireValue.isCompleted) return false;
    return true;
  }
}
