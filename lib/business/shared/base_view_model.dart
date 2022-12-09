import 'package:flutter/material.dart';
import 'package:kabaten/models/shared/general_response.dart';

abstract class BaseViewModel with ChangeNotifier {
  bool busy = false;
  String? error;

  @override
  void dispose() {
    busy = false;
    error = null;

    super.dispose();
  }

  void start() {
    error = null;

    changeBusy(true);
  }

  void finish() => changeBusy(false);

  void changeBusy(bool value) {
    busy = value;

    notifyListeners();
  }

  bool processErrors(GeneralResponse result) {
    if (result.isEmptyError()) {
      error = null;
      return false;
    } else {
      setError(result.error);

      return true;
    }
  }

  void setError(String? value) {
    error = value;

    notifyListeners();
  }

  bool get hasError => error != null;

  String? get errorsOneString => error;
}
