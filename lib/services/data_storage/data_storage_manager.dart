import 'package:hive_flutter/hive_flutter.dart';

class DataStorageManager {
  static const String _settings = 'settings';
  static const String _auth = 'auth';

  static const Map<Boxes, String> _map = {
    Boxes.settings: _settings,
    Boxes.auth: _auth,
  };

  static Future<void> init() async {
    await Hive.initFlutter();

    await openBox(box: Boxes.settings);
    await openBox(box: Boxes.auth);
  }

  static Future<void> openBox({
    Boxes box = Boxes.settings,
  }) =>
      Hive.openBox(
        _toBoxName(box),
      );

  static void put({
    required String key,
    required dynamic value,
    Boxes box = Boxes.settings,
  }) =>
      _instance(
        box: box,
      ).put(key, value);

  static T getParsed<T>({
    required String key,
    dynamic defaultValue,
    Boxes box = Boxes.settings,
  }) =>
      get(
        key: key,
        defaultValue: defaultValue,
        box: box,
      ) as T;

  static dynamic get({
    required String key,
    dynamic defaultValue,
    Boxes box = Boxes.settings,
  }) =>
      _instance(
        box: box,
      ).get(
        key,
        defaultValue: defaultValue,
      );

  static bool containsKey({
    required String key,
    Boxes box = Boxes.settings,
  }) =>
      _instance(
        box: box,
      ).containsKey(key);

  static Future<void> delete({
    required String key,
    Boxes box = Boxes.settings,
  }) =>
      _instance(
        box: box,
      ).delete(key);

  static Future<int> clear({
    Boxes box = Boxes.settings,
  }) =>
      _instance(
        box: box,
      ).clear();

  static Future<void> closeALL() async {
    await close(box: Boxes.settings);
    await close(box: Boxes.auth);
  }

  static Future<void> close({
    Boxes box = Boxes.settings,
  }) =>
      _instance(
        box: box,
      ).close();

  static Box<dynamic> _instance({
    Boxes box = Boxes.settings,
  }) =>
      Hive.box<dynamic>(
        _toBoxName(box),
      );

  static String _toBoxName(Boxes box) => _map[box] ?? _settings;
}

enum Boxes {
  settings,
  auth,
}
