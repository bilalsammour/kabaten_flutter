import 'package:get_it/get_it.dart';
import 'package:kabaten/business/auth/auth_repository.dart';
import 'package:kabaten/business/shared/base_view_model.dart';
import 'package:kabaten/models/auth/token_model.dart';
import 'package:kabaten/models/shared/general_response.dart';
import 'package:kabaten/services/auth/auth_service.dart';

class AuthViewModel extends BaseViewModel {
  final _repository = GetIt.I<AuthRepository>();

  Future<void> signInWithEmailAndPassword({
    required String username,
    required String password,
  }) async {
    changeBusy(true);

    try {
      await _trySignInWithEmailAndPassword(
        username: username,
        password: password,
      );
    } catch (_) {
    } finally {
      changeBusy(false);
    }
  }

  Future<void> _trySignInWithEmailAndPassword({
    required String username,
    required String password,
  }) async {
    final result = await _repository.signInWithEmailAndPassword(
      username: username,
      password: password,
    );

    await _onResult(result);
  }

  Future<void> signUpWithEmailAndPassword({
    required String username,
    required String password,
  }) async {
    changeBusy(true);

    try {
      await _trySignUpWithEmailAndPassword(
        username: username,
        password: password,
      );
    } catch (_) {
    } finally {
      changeBusy(false);
    }
  }

  Future<void> _trySignUpWithEmailAndPassword({
    required String username,
    required String password,
  }) async {
    final result = await _repository.signUpWithEmailAndPassword(
      username: username,
      password: password,
    );

    await _onResult(result);
  }

  Future<void> refreshToken() async {
    try {
      await _tryRefreshToken();
    } catch (_) {}
  }

  Future<void> _tryRefreshToken() async {
    final result = await _repository.refreshToken();

    await _onResult(result);
  }

  Future<void> verify({required String activationCode}) async {
    changeBusy(true);

    try {
      await _tryVerify(activationCode: activationCode);
    } catch (_) {
    } finally {
      changeBusy(false);
    }
  }

  Future<void> _tryVerify({required String activationCode}) async {
    await _repository.verify(activationCode: activationCode);
  }

  Future<void> _onResult(GeneralResponse result) async {
    if (processErrors(result)) {
      return;
    }

    await _parseAndProcess(result);
  }

  Future<void> _parseAndProcess(GeneralResponse result) async {
    final token = result.toItem().getParsedResults<TokenModel>(
          (map) => TokenModel.fromMap(map),
        );

    if (token.accessToken.isNotEmpty) {
      await _storeToken(token: token);
    }
  }

  Future<void> _storeToken({required TokenModel token}) async {
    await AuthService.storeToken(token.accessToken);
    await AuthService.storeRefreshToken(token.refreshToken);
  }

  Future<void> signOut() async {
    try {
      await AuthService.logout();
    } catch (_) {}
  }

  bool hasToken() => AuthService.hasToken();
}
