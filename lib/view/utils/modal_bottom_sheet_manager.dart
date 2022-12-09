import 'package:flutter/material.dart';
import 'package:kabaten/view/resources/app_resources.dart';

class ModalBottomSheetManager {
  static Future<void> show(
    BuildContext context,
    String text,
  ) =>
      showModalBottomSheet(
        context: context,
        builder: (_) => Container(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.doubleMainSpace,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),
      );

  static Future<void> showRounded({
    required BuildContext context,
    required Widget child,
    bool isScrollControlled = false,
    bool isCustomScroll = false,
  }) =>
      showModalBottomSheet(
        context: context,
        isScrollControlled: isScrollControlled,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              AppDimensions.mainBorderRadius,
            ),
          ),
        ),
        builder: (_) => isCustomScroll
            ? SingleChildScrollView(
                child: child,
              )
            : child,
      );

  static Future<void> showChild({
    required BuildContext context,
    required Widget child,
  }) =>
      showModalBottomSheet(
        context: context,
        builder: (_) => child,
      );
}
