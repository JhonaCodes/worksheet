import 'package:worksheet/src/auth/model/auth_tokens.dart';
import 'package:worksheet/src/common/utils/local_preferences.dart';

class AuthStorage {


  static Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await setPreference('access_token', accessToken);
    await setPreference('refresh_token', refreshToken);
  }

  static Future<AuthTokens?> getTokens() async {
    final accessToken = await getPreference('access_token');
    final refreshToken = await getPreference('refresh_token');

    if (accessToken != null && refreshToken != null) {
      return AuthTokens(accessToken: accessToken, refreshToken: refreshToken);
    }
    return null;
  }

  static Future<void> deleteTokens() async {
    await removePreference('access_token');
    await removePreference('refresh_token');
  }
}