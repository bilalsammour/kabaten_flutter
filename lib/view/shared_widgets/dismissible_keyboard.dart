import 'package:kabaten/utils/keyboard_manager.dart';
import 'package:flutter/material.dart';

class DismissibleKeyboard extends StatelessWidget {
  final Widget child;

  const DismissibleKeyboard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => KeyboardManager.hideKeyboard(context),
        child: child,
      );
}
