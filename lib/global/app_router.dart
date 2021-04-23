import 'package:flutter/material.dart';
import 'package:hackathon_04_2021_shekels/ui/screens/splash_screen/splash_screen.dart';
import 'package:hackathon_04_2021_shekels/ui/screens/test_screen/test_screen.dart';

class _AppRouteProps {
  final Widget Function(RouteSettings) routeBuilder;
  final Type argumentsType;

  const _AppRouteProps({
    @required this.routeBuilder,
    @required this.argumentsType,
  });
}

class AppRouter {
  static const String splash = '/';
  static const String home = '/home';
  static const String test = '/test';

  static Map<String, _AppRouteProps> routerBuildMap = {
    splash: _AppRouteProps(
      routeBuilder: (settings) => SplashScreen(),
      argumentsType: Null,
    ),
    test: _AppRouteProps(
      routeBuilder: (settings) => TestScreen(arguments: settings.arguments),
      argumentsType: TestScreenArguments,
    ),
  };

  static List<String> getRouteNames() {
    return routerBuildMap.keys.toList();
  }
}

class MyRouterUtils {
  static PageRoute _buildPageRoute(
    RouteSettings settings,
    Widget widget,
  ) {
    return MaterialPageRoute(
      builder: (_) => widget,
      settings: settings,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var myRouteBuilder = AppRouter.routerBuildMap[settings.name]?.routeBuilder;
    if (myRouteBuilder != null) {
      return _buildPageRoute(settings, myRouteBuilder(settings));
    }

    return _buildPageRoute(
      settings,
      Scaffold(
        body: Center(
          child: Text('No route found: ${settings.name}.'),
        ),
      ),
    );
  }
}
