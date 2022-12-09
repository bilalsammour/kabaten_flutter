import 'package:kabaten/services/data_storage/data_storage_manager.dart';

class AuthService {
  static const String _tokenKey = 'token_key';
  static const String _refreshTokenKey = 'refresh_token_key';

  static bool hasToken() => DataStorageManager.containsKey(
        key: _tokenKey,
        box: Boxes.auth,
      );

  static Future<String> getToken() async =>
      DataStorageManager.getParsed<String>(
        key: _tokenKey,
        box: Boxes.auth,
      );
  static Future<String> getRefreshToken() async =>
      DataStorageManager.getParsed<String>(
        key: _refreshTokenKey,
        box: Boxes.auth,
      );

  static Future<void> storeToken(String token) async => DataStorageManager.put(
        key: _tokenKey,
        value: token,
        box: Boxes.auth,
      );

  static Future<void> storeRefreshToken(String token) async =>
      DataStorageManager.put(
        key: _refreshTokenKey,
        value: token,
        box: Boxes.auth,
      );

  static Future<void> logout() => DataStorageManager.clear(
        box: Boxes.auth,
      );

  static Function()? _onForceLogout;

  static void setOnForceLogout(Function() value) => _onForceLogout = value;

  static void forceLogout() => _onForceLogout?.call();
}
