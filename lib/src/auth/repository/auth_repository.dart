import 'package:dio/dio.dart';
import 'package:reactive_notify/reactive_notify.dart';
import 'package:worksheet/src/auth/infrastructure/auth_storage.dart';
import 'package:worksheet/src/auth/model/user_model.dart';

class AuthRepository implements RepositoryImpl {
  final Dio _dio;


  AuthRepository(this._dio);

  Future<UserModel?> getCurrentUser() async {
    try {
      final tokens = await AuthStorage.getTokens();
      if (tokens == null) return null;

      final response = await _dio.get('/auth/me');
      return UserModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 401) {
        await AuthStorage.deleteTokens();
        return null;
      }
      rethrow;
    }
  }

  Future<UserModel> login(String email, String password) async {
    try {
      final response = await _dio.post('/auth/login', data: {
        'email': email,
        'password': password,
      });

      await AuthStorage.saveTokens(
        accessToken: response.data['access_token'],
        refreshToken: response.data['refresh_token'],
      );

      return UserModel.fromJson(response.data['user']);
    } catch (e) {
      throw _handleAuthError(e);
    }
  }

  Future<UserModel> register(String email, String password, String name) async {
    try {
      final response = await _dio.post('/auth/register', data: {
        'email': email,
        'password': password,
        'name': name,
      });

      await AuthStorage.saveTokens(
        accessToken: response.data['access_token'],
        refreshToken: response.data['refresh_token'],
      );

      return UserModel.fromJson(response.data['user']);
    } catch (e) {
      throw _handleAuthError(e);
    }
  }

  Future<void> logout() async {
    try {
      await _dio.post('/auth/logout');
    } finally {
      await AuthStorage.deleteTokens();
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _dio.post('/auth/forgot-password', data: {'email': email});
    } catch (e) {
      throw _handleAuthError(e);
    }
  }

  Exception _handleAuthError(dynamic error) {
    // if (error is DioException) {
    //   switch (error.response?.statusCode) {
    //     case 401:
    //       return UnauthorizedException();
    //     case 404:
    //       return NotFoundException();
    //     default:
    //       return AuthException(error.message ?? 'Unknown error occurred');
    //   }
    // }
    // return AuthException('Unknown error occurred');

    throw Exception();
  }
}