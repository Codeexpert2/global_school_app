import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:global_school/configs/app_configs.dart';
import 'package:global_school/core/constants/network.dart';

import 'interceptors/auth_interceptor.dart';

// Provide Dio instance
final dioProvider = Provider<Dio>((ref) => Dio());

final clientProvider = Provider<ApiClient>((ref) => ApiClient());

/// Create a singleton class to contain all Dio methods and helper functions
class ApiClient {
  CancelToken cancelToken = CancelToken();

  BaseOptions options = BaseOptions(
    baseUrl: AppConfigs.baseApiUrl,
    receiveTimeout: timeoutDuration,
    connectTimeout: timeoutDuration,
    sendTimeout: timeoutDuration,
    followRedirects: false,
    responseType: ResponseType.json,
    contentType: Headers.jsonContentType,
    // validateStatus: (status) => status! <= 500,
    headers: {
      'Accept': 'application/json',
      // 'Cache-Control': 'max-age=604800',
    },
  );

  late final Dio _dio = Dio()
    ..options = options
    ..interceptors.addAll({
      AuthInterceptor(),
      // if (kDebugMode) DioCacheInterceptor(options: cacheOptions),
      PrettyDioLogger(
        enabled: kDebugMode,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        request: true,
        error: true,
        compact: true,
        maxWidth: 90,
      )
    });

  /// Get Method
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Response response = await _dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  /// Post Method
  Future<Response> post(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    final Response response = await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  /// Put Method
  Future<Response> put(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    final Response response = await _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  /// Delete Method
  Future<Response> delete(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    final Response response = await _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    return response;
  }
}
