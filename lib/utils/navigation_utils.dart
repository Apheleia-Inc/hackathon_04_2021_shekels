import 'package:flutter/material.dart';
import 'package:hackathon_04_2021_shekels/global/app_router.dart';

class NavigationUtils {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<void> navigateTo(String routeName, {Object arguments}) async {
    checkArgumentsTypeValid(routeName, arguments: arguments);
    await navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  static Future<void> navigateOff(String routeName, {Object arguments}) async {
    checkArgumentsTypeValid(routeName, arguments: arguments);
    await navigatorKey.currentState.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Navigate and remove all routes that are not included in AppRouter
  static Future<void> navigateOffNoneAppRoutes(String routeName,
      {Object arguments}) async {
    checkArgumentsTypeValid(routeName, arguments: arguments);
    await navigatorKey.currentState.pushNamedAndRemoveUntil(
      routeName,
      (route) {
        final String routeName = route.settings?.name;
        // * Remove routes until met first route that is in app routeNames
        return AppRouter.getRouteNames().contains(routeName) == true;
      },
      arguments: arguments,
    );
  }

  static Future<void> navigateOffAll(String routeName,
      {Object arguments}) async {
    checkArgumentsTypeValid(routeName, arguments: arguments);
    await navigatorKey.currentState.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  static void navigateBack() {
    navigatorKey.currentState.pop();
  }

  /// Check arguments type first to see if it's matched with routeName
  static void checkArgumentsTypeValid(String routeName, {Object arguments}) {
    Type argumentsType = AppRouter.routerBuildMap[routeName].argumentsType;
    if (arguments.runtimeType != argumentsType) {
      throw Exception(
        '${routeName} must has arguments of type ${argumentsType}',
      );
    }
  }
}
