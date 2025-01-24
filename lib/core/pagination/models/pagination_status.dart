/// Represents the possible states of a pagination operation.
enum PaginationStatus {
  initial, // Initial state before any data is loaded
  loading, // Currently loading data
  success, // Data loaded successfully
  error, // Error occurred while loading data
  noMoreData // No more data available to load
}
