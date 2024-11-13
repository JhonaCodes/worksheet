class AuthTokens {
  final String accessToken;
  final String refreshToken;
  final DateTime? accessTokenExpiration;

  const AuthTokens({
    required this.accessToken,
    required this.refreshToken,
    this.accessTokenExpiration,
  });

  factory AuthTokens.fromJson(Map<String, dynamic> json) {
    return AuthTokens(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      accessTokenExpiration: json['expires_at'] != null
          ? DateTime.parse(json['expires_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'access_token': accessToken,
    'refresh_token': refreshToken,
    'expires_at': accessTokenExpiration?.toIso8601String(),
  };

  bool get isAccessTokenExpired {
    if (accessTokenExpiration == null) return false;
    return DateTime.now().isAfter(accessTokenExpiration!);
  }

  AuthTokens copyWith({
    String? accessToken,
    String? refreshToken,
    DateTime? accessTokenExpiration,
  }) {
    return AuthTokens(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      accessTokenExpiration: accessTokenExpiration ?? this.accessTokenExpiration,
    );
  }

  @override
  String toString() => 'AuthTokens('
      'accessToken: ${accessToken.substring(0, 10)}..., '
      'refreshToken: ${refreshToken.substring(0, 10)}..., '
      'expires: $accessTokenExpiration)';
}