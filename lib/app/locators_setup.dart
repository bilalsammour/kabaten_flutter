import 'package:get_it/get_it.dart';
import 'package:kabaten/business/auth/auth_repository.dart';
import 'package:kabaten/services/auth/auth_service.dart';

class LocatorsSetup {
  static GetIt getIt = GetIt.instance;

  static void setup() {
    getIt.registerLazySingleton<AuthService>(
      () => AuthService(),
    );
    getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepository(),
    );
  }
}
