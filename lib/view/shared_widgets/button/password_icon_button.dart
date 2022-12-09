import 'package:flutter/material.dart';
import 'package:kabaten/generated/l10n.dart';
import 'package:kabaten/view/resources/app_resources.dart';

class PasswordIconButton extends StatefulWidget {
  final void Function(bool value) onPressed;

  const PasswordIconButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<PasswordIconButton> createState() => _PasswordIconButtonState();
}

class _PasswordIconButtonState extends State<PasswordIconButton> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () => _onPressed(),
        tooltip: _tooltip,
        icon: Icon(
          _icon,
          size: AppDimensions.defaultIcon,
          color: AppColors.primary,
        ),
      );

  String get _tooltip =>
      _passwordVisible ? S.current.hidePassword : S.current.showPassword;

  IconData get _icon => _passwordVisible ? AppIcons.eyeSlash : AppIcons.eye;

  void _onPressed() {
    setState(() => _passwordVisible = !_passwordVisible);

    widget.onPressed.call(_passwordVisible);
  }
}
