// import 'package:dio/dio.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import 'package:rifq/core/data/local/secure_storage_service.dart';
// import 'package:rifq/core/keys/keys.dart';
// import 'package:rifq/features/auth/presentation/provider/auth_notifier.dart';

// class AuthInterceptor extends Interceptor {
//   AuthInterceptor();

//   @override
//   void onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     final token = await SecureStorageService().read(tokenKey);

//     options.headers['Authorization'] = token;

//     return handler.next(options);
//   }

//   @override
//   void onError(
//     DioException err,
//     ErrorInterceptorHandler handler,
//   ) async {
//     if (err.response?.statusCode == 403) {
//       await SecureStorageService().remove(tokenKey);
//       await SecureStorageService().remove(cachedUserKey);
//       ProviderScope.containerOf(rootNavigatorKey.currentContext!)
//           .read(authNotifierProvider.notifier)
//           .logout();
//     }

//     // If refreshing the token fails or the error is not 401, forward the error
//     return handler.next(err);
//   }
// }
