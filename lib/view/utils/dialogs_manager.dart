import 'package:flutter/material.dart';
import 'package:kabaten/generated/l10n.dart';

class DialogsManager {
  static Future<void> showOkDialog({
    required BuildContext context,
    required String message,
    String? title,
  }) =>
      showDialog<void>(
        context: context,
        builder: (context) => _buildTitleMessageAlertDialog(
          context: context,
          message: message,
          title: title ?? S.current.appName,
        ),
      );

  static AlertDialog _buildTitleMessageAlertDialog({
    required BuildContext context,
    required String message,
    required String title,
  }) =>
      AlertDialog(
        title: Text(
          title,
        ),
        content: SingleChildScrollView(
          child: Text(
            message,
          ),
        ),
        actions: <Widget>[
          _buildOkButton(context),
        ],
      );

  static Widget _buildOkButton(BuildContext context) => TextButton(
        child: Text(
          S.current.answerOk,
        ),
        onPressed: () => Navigator.pop(context),
      );

  static Future<void> showYesNoDialog({
    required BuildContext context,
    required String message,
    String? title,
    String? yesLabel,
    String? noLabel,
    void Function()? onYes,
    void Function()? onNo,
  }) =>
      showDialog<void>(
        context: context,
        builder: (context) => _buildYesNoAlertDialog(
          context: context,
          message: message,
          title: title ?? S.current.appName,
          yesLabel: yesLabel ?? S.current.answerYes,
          noLabel: noLabel ?? S.current.answerNo,
          onYes: onYes,
          onNo: onNo,
        ),
      );

  static AlertDialog _buildYesNoAlertDialog({
    required BuildContext context,
    required String message,
    required String title,
    required String yesLabel,
    required String noLabel,
    required void Function()? onYes,
    required void Function()? onNo,
  }) =>
      AlertDialog(
        title: Text(
          title,
        ),
        content: SingleChildScrollView(
          child: Text(
            message,
          ),
        ),
        actions: <Widget>[
          _buildActionButton(
            context: context,
            labelText: yesLabel,
            action: onYes,
          ),
          _buildActionButton(
            context: context,
            labelText: noLabel,
            action: onNo,
          ),
        ],
      );

  static Widget _buildActionButton({
    required BuildContext context,
    required String labelText,
    void Function()? action,
  }) =>
      TextButton(
        child: Text(
          labelText,
        ),
        onPressed: () {
          Future.delayed(
            Duration.zero,
            () => action?.call(),
          );

          Navigator.pop(context);
        },
      );

  static Future<void> showWidgetDialog({
    required BuildContext context,
    required Widget child,
  }) =>
      showDialog<void>(
        context: context,
        builder: (_) => AlertDialog(
          content: SingleChildScrollView(
            child: child,
          ),
        ),
      );
}
