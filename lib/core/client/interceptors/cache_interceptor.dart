import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';

import 'package:global_school/configs/app_configs.dart';
import 'package:global_school/initialize_app.dart';
import 'package:global_school/services/file_services/file_service.dart';

/* 
 ? https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cache-Control
 */

final fileService = locator<FileService>();

final cacheOptions = CacheOptions(
  // A default store is required for interceptor.
  // store: MemCacheStore(),
  store: HiveCacheStore(
    fileService.cachePath,
  ),

  policy: CachePolicy.forceCache,
  // Returns a cached response on error but for statuses 401 & 403.
  // Also allows to return a cached response on network errors (e.g. offline usage).
  // Defaults to [null].
  hitCacheOnErrorExcept: [401, 403, 404, 422],
  // Overrides any HTTP directive to delete entry past this duration.
  // Useful only when origin server has no cache config or custom behaviour is desired.
  // Defaults to [null].
  maxStale: const Duration(days: AppConfigs.cacheDays),
  // Default. Allows 3 cache sets and ease cleanup.
  priority: CachePriority.high,
  // Default. Body and headers encryption with your own algorithm.
  cipher: null,
  // Default. Key builder to retrieve requests.
  keyBuilder: CacheOptions.defaultCacheKeyBuilder,
  // Default. Allows to cache POST requests.
  // Overriding [keyBuilder] is strongly recommended when [true].
  allowPostMethod: false,
);
