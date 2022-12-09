import 'package:kabaten/models/map_model.dart';

class TokenModel extends MapModel {
  final String accessToken;
  final String refreshToken;

  const TokenModel({
    this.accessToken = '',
    this.refreshToken = '',
  });

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      accessToken: (map['access_token'] ?? '') as String,
      refreshToken: (map['refresh_token'] ?? '') as String,
    );
  }
}
