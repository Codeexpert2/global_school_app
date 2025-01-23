// lib/widgets/paginated_list_widget.dart
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'models/pagination_state.dart';
import 'models/pagination_status.dart';
import 'notifiers/paginated_list_notifier.dart';

/// A widget that displays a paginated list of items with built-in loading,
/// error handling, and infinite scrolling capabilities.
///
/// This widget uses Riverpod for state management and automatically handles
/// pagination when scrolling reaches the specified threshold.
class PaginatedListWidget<T> extends ConsumerStatefulWidget {
  const PaginatedListWidget({
    super.key,
    required this.itemBuilder,
    required this.provider,
    this.loadingWidget,
    this.errorWidget,
    this.emptyWidget,
    this.bottomLoadingWidget,
    this.bottomErrorWidget,
    this.noMoreDataWidget,
    this.loadTriggerThreshold = 0.8,
    this.enablePullToRefresh = true,
    this.scrollController,
    this.padding,
    this.separatorBuilder,
  });

  /// Builder function to create list items
  final Widget Function(BuildContext context, T item) itemBuilder;

  /// Provider that manages the pagination state
  // / AutoDisposeStateNotifierProvider
  // StateNotifierProvider
  final AutoDisposeStateNotifierProvider<PaginatedListNotifier<T>,
      PaginationState<T>> provider;

  /// Custom widget to display while loading
  final Widget? loadingWidget;

  /// Custom widget to display when an error occurs
  final Widget? errorWidget;

  /// Custom widget to display when the list is empty
  final Widget? emptyWidget;

  /// Custom widget to display at the bottom while loading more items
  final Widget? bottomLoadingWidget;

  /// Custom widget to display at the bottom when an error occurs
  final Widget? bottomErrorWidget;

  /// Custom widget to display when no more data is available
  final Widget? noMoreDataWidget;

  /// Scroll threshold at which to load more data (0.0 to 1.0)
  final double loadTriggerThreshold;

  /// Whether to show the pull-to-refresh indicator
  final bool enablePullToRefresh;

  /// Optional scroll controller
  final ScrollController? scrollController;

  /// Padding around the list
  final EdgeInsetsGeometry? padding;

  /// Separator builder for list items
  final Widget Function(BuildContext, int)? separatorBuilder;

  @override
  ConsumerState<PaginatedListWidget<T>> createState() =>
      _PaginatedListWidgetState<T>();
}

class _PaginatedListWidgetState<T>
    extends ConsumerState<PaginatedListWidget<T>> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    _scrollController.addListener(_onScroll);
    _loadInitialData();
  }

  /// Loads the initial page of data
  void _loadInitialData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(widget.provider.notifier).loadNextPage();
    });
  }

  /// Handles scroll events to trigger pagination
  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final threshold = _scrollController.position.maxScrollExtent *
        widget.loadTriggerThreshold;

    if (_scrollController.position.pixels >= threshold) {
      ref.read(widget.provider.notifier).loadNextPage();
    }
  }

  /// Builds the loading widget
  Widget _buildLoadingWidget() {
    return widget.loadingWidget ??
        const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(
              strokeWidth: 3,
              strokeCap: StrokeCap.round,
              color: Colors.blue,
            ),
          ),
        );
  }

  /// Builds the error widget
  Widget _buildErrorWidget(String? errorMessage) {
    return widget.errorWidget ??
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 48,
                  color: Colors.red,
                ),
                const SizedBox(height: 16),
                Text(
                  errorMessage ?? 'An error occurred',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: ref.read(widget.provider.notifier).refresh,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Retry'),
                ),
              ],
            ),
          ),
        );
  }

  /// Builds the empty widget
  Widget _buildEmptyWidget() {
    return widget.emptyWidget ??
        const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.inbox,
                  size: 48,
                  color: Colors.grey,
                ),
                SizedBox(height: 16),
                Text(
                  'No items found',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        );
  }

  /// Builds the bottom loading widget
  Widget _buildBottomLoadingWidget() {
    return widget.bottomLoadingWidget ??
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        );
  }

  /// Builds the bottom error widget
  Widget _buildBottomErrorWidget() {
    return widget.bottomErrorWidget ??
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ElevatedButton.icon(
              onPressed: ref.read(widget.provider.notifier).loadNextPage,
              icon: const Icon(Icons.refresh, size: 18),
              label: const Text('Load More'),
            ),
          ),
        );
  }

  /// Builds the no more data widget
  Widget _buildNoMoreDataWidget() {
    return widget.noMoreDataWidget ??
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              'No more items',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(widget.provider);

    // Show loading state for initial load
    if (state.status == PaginationStatus.initial) {
      return _buildLoadingWidget();
    }

    // Show empty state if no items and not loading
    if (state.status == PaginationStatus.loading && state.items.isEmpty) {
      return _buildLoadingWidget();
    }

    // Show error state if error occurred and no items are loaded
    if (state.status == PaginationStatus.error && state.items.isEmpty) {
      return _buildErrorWidget(state.errorMessage);
    }

    // Show empty state if no items and not loading
    if (state.items.isEmpty) {
      return _buildEmptyWidget();
    }

    // Build the main list
    Widget listView = widget.separatorBuilder != null
        ? ListView.separated(
            controller: _scrollController,
            padding: widget.padding,
            itemCount: state.items.length + 1,
            separatorBuilder: widget.separatorBuilder!,
            itemBuilder: _buildListItem,
          )
        : ListView.builder(
            controller: _scrollController,
            padding: widget.padding,
            itemCount: state.items.length + 1,
            itemBuilder: _buildListItem,
          );

    // Wrap with RefreshIndicator if pull-to-refresh is enabled
    if (widget.enablePullToRefresh) {
      listView = RefreshIndicator(
        onRefresh: ref.read(widget.provider.notifier).refresh,
        child: listView,
      );
    }

    return listView;
  }

  /// Builds individual list items and the bottom loader/error widget
  Widget _buildListItem(BuildContext context, int index) {
    final state = ref.watch(widget.provider);

    // Return bottom loader/error widget if at the last index
    if (index == state.items.length) {
      if (state.status == PaginationStatus.loading) {
        return _buildBottomLoadingWidget();
      }
      if (state.status == PaginationStatus.error) {
        return _buildBottomErrorWidget();
      }
      if (!state.hasMoreData) {
        return _buildNoMoreDataWidget();
      }
      return const SizedBox.shrink();
    }

    // Return list item
    return widget.itemBuilder(context, state.items[index]);
  }

  @override
  void dispose() {
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }
}

/// Example usage:
/// ```dart
/// PaginatedListWidget<User>(
///   provider: userListProvider,
///   itemBuilder: (context, user) => UserListItem(user: user),
///   loadTriggerThreshold: 0.8,
///   enablePullToRefresh: true,
///   separatorBuilder: (context, index) => const Divider(),
/// )
/// ```
