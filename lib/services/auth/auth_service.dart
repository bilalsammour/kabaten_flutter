import 'package:kabaten/services/data_storage/data_storage_manager.dart';

class AuthService {
  static const String _key = 'secured_token_key';

  static bool hasToken() => DataStorageManager.containsKey(
        key: _key,
        box: Boxes.auth,
      );

  static Future<String> getToken() async =>
      DataStorageManager.getParsed<String>(
        key: _key,
        box: Boxes.auth,
      );

  static Future<void> storeToken(String token) async => DataStorageManager.put(
        key: _key,
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
