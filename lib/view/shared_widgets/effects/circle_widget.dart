import 'package:flutter/material.dart';
import 'package:kabaten/view/resources/app_resources.dart';

class CircleWidget extends StatelessWidget {
  final Widget child;
  final double borderThickness;
  final Color? borderColor;
  final Color? backgroundColor;

  const CircleWidget({
    Key? key,
    required this.child,
    this.borderThickness = AppDimensions.border,
    this.borderColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        color: backgroundColor ?? Colors.transparent,
        shape: CircleBorder(
          side: BorderSide(
            color: borderColor ?? AppColors.primary,
            width: borderThickness,
          ),
        ),
        child: child,
      );
}
