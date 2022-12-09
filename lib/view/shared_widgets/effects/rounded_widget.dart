import 'package:flutter/material.dart';
import 'package:kabaten/view/resources/app_resources.dart';

class RoundedWidget extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final Color? borderColor;
  final double radius;
  final Widget child;

  const RoundedWidget({
    Key? key,
    this.padding = const EdgeInsets.all(AppDimensions.halfSpace),
    this.backgroundColor = AppColors.primary,
    this.borderColor,
    this.radius = AppDimensions.halfRadius,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: padding,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? backgroundColor,
            width: AppDimensions.border,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
          color: backgroundColor,
        ),
        child: child,
      );
}
