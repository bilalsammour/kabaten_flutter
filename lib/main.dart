import 'package:flutter/material.dart';
import 'package:kabaten/app/app.dart';
import 'package:kabaten/app/locators_setup.dart';
import 'package:kabaten/services/data_storage/data_storage_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DataStorageManager.init();

  LocatorsSetup.setup();

  runApp(
    const App(),
  );
}
