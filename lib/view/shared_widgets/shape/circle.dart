import 'package:flutter/material.dart';
import 'package:kabaten/view/resources/app_resources.dart';

class Circle extends StatelessWidget {
  final Color color;
  final bool empty;
  final double? width;
  final double? height;

  const Circle({
    Key? key,
    this.color = AppColors.primary,
    this.empty = false,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: !empty ? color : null,
          shape: BoxShape.circle,
          border: empty
              ? Border.all(
                  color: color,
                )
              : null,
        ),
      );
}
