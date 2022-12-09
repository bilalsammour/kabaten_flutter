import 'package:uuid/uuid.dart';

class KeyGenerator {
  static const _uuid = Uuid();

  static String generateGuid() => _uuid.v4();
}
