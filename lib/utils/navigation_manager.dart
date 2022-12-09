import 'package:flutter/material.dart';

class NavigationManager {
  static Future<dynamic> push(
    BuildContext context,
    Widget page,
  ) =>
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
          settings: RouteSettings(
            name: page.runtimeType.toString(),
          ),
        ),
      );

  static Future<dynamic> pushNoDuplication(
    BuildContext context,
    Widget page,
    String routeName,
  ) async {
    final currentRoute = ModalRoute.of(context);
    final currentRouteName = currentRoute?.settings.name;

    if (currentRouteName == routeName) {
      return;
    }

    return push(context, page);
  }

  static Future<dynamic> pushNamed(
    BuildContext context,
    String routeName, {
    Object? arguments,
    bool rootNavigator = false,
  }) =>
      Navigator.of(
        context,
        rootNavigator: rootNavigator,
      ).pushNamed(routeName, arguments: arguments);

  static Future<dynamic> pushNamedNoDuplication(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) async {
    final currentRoute = ModalRoute.of(context);
    final currentRouteName = currentRoute?.settings.name;

    if (currentRouteName == routeName) {
      return;
    }

    return pushNamed(context, routeName, arguments: arguments);
  }

  static Future<dynamic> pushNoBack(
    BuildContext context,
    Widget page, {
    Object? arguments,
  }) =>
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => page,
          settings: RouteSettings(
            name: page.runtimeType.toString(),
          ),
        ),
      );

  static Future<dynamic> pushNamedNoBack(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) =>
      Navigator.pushReplacementNamed(
        context,
        routeName,
        arguments: arguments,
      );

  static Future<dynamic> pushNamedWithoutBack(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) =>
      Navigator.pushNamedAndRemoveUntil(
        context,
        routeName,
        (v) => false,
        arguments: arguments,
      );

  static Future<dynamic> pushClearBack(
    BuildContext context,
    Widget page,
  ) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => page,
          settings: RouteSettings(
            name: page.runtimeType.toString(),
          ),
        ),
        (v) => false,
      );

  static Future<dynamic> pushNamedClearBack(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) =>
      Navigator.pushNamedAndRemoveUntil(
        context,
        routeName,
        (v) => false,
        arguments: arguments,
      );

  static void pop(BuildContext context) => Navigator.pop(context);

  static bool canPop(BuildContext context) => Navigator.canPop(context);

  static void popWithReturn(BuildContext context, Object value) =>
      Navigator.pop(context, value);
}
