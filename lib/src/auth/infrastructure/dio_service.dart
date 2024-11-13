import 'package:dio/dio.dart';

import 'package:worksheet/src/auth/infrastructure/auth_storage.dart';

class DioService {

  late final Dio _dio;

  DioService() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://api.your-domain.com',
      contentType: 'application/json',
    ))..interceptors.add(_createAuthInterceptor());
  }

  Interceptor _createAuthInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final tokens = await AuthStorage.getTokens();
        if (tokens != null) {
          options.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
        }
        handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          try {
            final tokens = await AuthStorage.getTokens();
            if (tokens?.refreshToken != null) {
              final response = await _dio.post('/auth/refresh', data: {
                'refresh_token': tokens!.refreshToken,
              });

              await AuthStorage.saveTokens(
                accessToken: response.data['access_token'],
                refreshToken: response.data['refresh_token'],
              );

              final opts = error.requestOptions;
              opts.headers['Authorization'] = 'Bearer ${response.data['access_token']}';
              final newResponse = await _dio.fetch(opts);
              handler.resolve(newResponse);
              return;
            }
          } catch (e) {
            await AuthStorage.deleteTokens();
          }
        }
        handler.next(error);
      },
    );
  }

  Dio get dio => _dio;
}