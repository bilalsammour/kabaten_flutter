import 'package:kabaten/view/resources/app_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarTransparentTemplate extends StatelessWidget
    with PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;

  const AppBarTransparentTemplate({
    Key? key,
    this.title,
    this.leading,
    this.bottom,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AppBar(
        title: title,
        leading: leading,
        bottom: bottom,
        actions: actions,
        elevation: AppDimensions.zero,
        backgroundColor: AppColors.transparent,
        foregroundColor: AppColors.primary,
        bottomOpacity: AppDimensions.zero,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
          systemNavigationBarDividerColor: null,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
