import 'package:kabaten/generated/l10n.dart';
import 'package:kabaten/services/auth/auth_service.dart';
import 'package:kabaten/services/requests/request_all.dart';

abstract class BaseRepository {
  final globalRequest = GlobalRequest();

  Future init(bool withToken) => _addHeaders(withToken);

  Future<void> _addHeaders(bool withToken) async {
    globalRequest.addHeader('Content-Type', 'application/json; charset=UTF-8');
    globalRequest.addHeader('language', S.current.locale);

    if (withToken) {
      await _addUserHeadersIfOk();
    }
  }

  Future<void> _addUserHeadersIfOk() async {
    if (AuthService.hasToken()) {
      await _addUserHeaders();
    }
  }

  Future<void> _addUserHeaders() async => globalRequest.addHeader(
        'authorization',
        await _getAuthorization(),
      );

  Future<String> _getAuthorization() async =>
      'JWT ${await AuthService.getToken()}';

  Future<String> getRefreshToken() async => await AuthService.getRefreshToken();
}
