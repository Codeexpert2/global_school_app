/// Parameters for controlling pagination, filtering, and sorting.
class PaginationParams {
  /// Creates a new [PaginationParams] instance.
  const PaginationParams({
    this.query,
    this.orderBy,
    this.sortDirection = 'asc',
    this.filters,
    this.page = 1,
    this.perPage = 20,
  });

  /// Search query string for filtering results
  final String? query;

  /// Field name to sort by
  final String? orderBy;

  /// Sort direction ('asc' or 'desc')
  final String? sortDirection;

  /// Additional filters as key-value pairs
  final Map<String, dynamic>? filters;

  /// Current page number (1-based)
  final int page;

  /// Number of items per page
  final int perPage;

  /// Converts the parameters to a JSON map for API requests.
  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'per_page': perPage,
      if (query != null && query!.isNotEmpty) 'query': query,
      if (orderBy != null) 'orderBy': orderBy,
      if (sortDirection != null) 'sortDirection': sortDirection,
      if (filters != null) ...filters!,
    };
  }

  /// Creates a copy of the current params with some fields replaced.
  PaginationParams copyWith({
    String? query,
    String? orderBy,
    String? sortDirection,
    Map<String, dynamic>? filters,
    int? page,
    int? perPage,
  }) {
    return PaginationParams(
      query: query ?? this.query,
      orderBy: orderBy ?? this.orderBy,
      sortDirection: sortDirection ?? this.sortDirection,
      filters: filters ?? this.filters,
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
    );
  }
}
