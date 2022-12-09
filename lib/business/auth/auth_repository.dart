import 'package:kabaten/business/shared/base_repository.dart';
import 'package:kabaten/models/shared/general_response.dart';
import 'package:kabaten/services/requests/request_all.dart';

class AuthRepository extends BaseRepository {
  static const _api = 'user/login';
  static const _refreshTokenApi = 'user/refresh';

  Future<GeneralResponse> signInWithEmailAndPassword({
    required String username,
    required String password,
  }) async {
    await init(false);

    return (globalRequest
          ..addParameter('email', username)
          ..addParameter('password', password))
        .sendRequest(
      requestType: RequestType.post,
      api: _api,
      ignoring: const [401],
    );
  }

  Future<GeneralResponse> refreshToken() async {
    await init(false);

    final refreshToken = await getRefreshToken();

    return globalRequest.sendRequest(
      requestType: RequestType.post,
      api: '$_refreshTokenApi?refresh_token=$refreshToken',
    );
  }
}
