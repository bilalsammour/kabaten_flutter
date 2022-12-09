import 'package:kabaten/view/resources/app_resources.dart';
import 'package:kabaten/view/shared_widgets/dismissible_keyboard.dart';
import 'package:flutter/material.dart';

class MainTemplate extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;

  const MainTemplate({
    Key? key,
    required this.child,
    this.padding,
    this.appBar,
    this.drawer,
    this.bottomNavigationBar,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar,
        drawer: drawer,
        bottomNavigationBar: bottomNavigationBar,
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: DismissibleKeyboard(
            child: Padding(
              padding: padding ?? const EdgeInsets.all(AppDimensions.mainSpace),
              child: child,
            ),
          ),
        ),
      );
}
