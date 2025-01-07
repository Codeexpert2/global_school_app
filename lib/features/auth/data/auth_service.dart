import 'package:dio/dio.dart';
import 'package:global_school/core/errors/error_handler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/core/client/client.dart';

import 'models/auth_model.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref.watch(clientProvider));
});

class AuthService {
  AuthService(this.client);

  final ApiClient client;

  Future<AuthModel> login(String email, String password) async {
    try {
      final data = FormData.fromMap({
        'email_or_serial_number': email,
        'password': password,
      });
      final res = await client.post(
        '/login',
        data: data,
      );

      return AuthModel.fromJson(res.data);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> logout() async {
    try {
      final res = await client.post('/logout');
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register(String email, String password) async {
    // Simulate a network request
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<AuthModel> refreshToken() async {
    try {
      final res = await client.post('/refreshToken');
      return AuthModel.fromJson(res.data);
    } catch (e) {
      // rethrow;
      throw ErrorHandler.handle(e);
    }
  }

  // changePassword
  Future<void> changePassword(
    String password,
    String passwordConfirmation,
  ) async {
    try {
      final data = FormData.fromMap({
        'password': password,
        'password_confirmation': passwordConfirmation,
      });
      final res = await client.post(
        '/changePassword',
        data: data,
      );
      return res.data;
    } catch (e) {
      // rethrow;
      throw ErrorHandler.handle(e);
    }
  }

  Future<AuthModel> profile() async {
    try {
      final res = await client.get('/profile');
      return AuthModel.fromJson(res.data);
    } catch (e) {
      // rethrow;
      throw ErrorHandler.handle(e);
    }
  }
}
