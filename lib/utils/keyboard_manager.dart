import 'package:flutter/material.dart';

class KeyboardManager {
  static void hideKeyboard(BuildContext context) =>
      FocusScope.of(context).requestFocus(
        FocusNode(),
      );
}
