import 'package:flutter/material.dart';

class SnackBarManager {
  static void showSimple({
    required BuildContext context,
    required String message,
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
          ),
        ),
      );
}
