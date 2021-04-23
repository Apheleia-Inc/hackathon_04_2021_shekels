import 'package:flutter/material.dart';
import 'package:hackathon_04_2021_shekels/utils/enums.dart';

class AppThemeColor {
  static AppThemeColorInfo getAppThemeColorInfo(AppThemeMode appThemeMode) {
    final themeColorSchemeMap = _initThemeColorSchemeMap();
    return themeColorSchemeMap[appThemeMode];
  }

  static Map<AppThemeMode, AppThemeColorInfo> _initThemeColorSchemeMap() {
    AppThemeColorInfo _lightThemeInfo = AppThemeColorInfo(
      colorScheme: ColorScheme.light(
        primary: Colors.blue[900],
        primaryVariant: Colors.blue[900],
        onPrimary: Colors.white,
        secondary: Colors.grey[800],
        onSecondary: Colors.white,
        surface: Colors.white,
        onSurface: Colors.black,
      ),
      customColorScheme: CustomColorScheme(
        lightPrimary: Colors.blue,
        darkPrimary: Colors.indigo[900],
        lightSecondary: Colors.grey[700],
        lightGrey: Colors.grey[200],
        onLightGrey: Colors.grey[800],
        backgroundSuccess: Colors.green,
        backgroundError: Colors.red,
        backgroundWarning: Colors.orange,
        backgroundInfo: Colors.blue,
        shimmerBase: Colors.grey[300],
        shimmerHighlight: Colors.grey[100],
        facebook: Color(0xFF3B5998),
        google: Color(0xFFD9372B),
      ),
    );

    AppThemeColorInfo _darkThemeInfo = AppThemeColorInfo(
      colorScheme: ColorScheme.dark(
        primary: Color(0xFF4F77E6),
        primaryVariant: Color(0xFF4F77E6),
        onPrimary: Colors.white,
        secondary: Colors.grey[100],
        onSecondary: Colors.grey[800],
        surface: Color(0xFF121212),
        onSurface: Colors.white,
      ),
      customColorScheme: CustomColorScheme(
        lightPrimary: Color(0xFF95ADF0),
        darkPrimary: Color(0xFF2A56CE),
        lightSecondary: Colors.grey[200],
        lightGrey: Colors.grey[800],
        onLightGrey: Colors.white,
        backgroundSuccess: Colors.green,
        backgroundError: Colors.red,
        backgroundWarning: Colors.orange,
        backgroundInfo: Colors.blue,
        shimmerBase: Colors.grey[800],
        shimmerHighlight: Colors.grey[600],
        facebook: Color(0xFF2F4D8D),
        google: Color(0xFFD9372B),
      ),
    );

    return {
      AppThemeMode.light: _lightThemeInfo,
      AppThemeMode.dark: _darkThemeInfo,
    };
  }
}

class CustomColorScheme {
  final Color lightPrimary;
  final Color darkPrimary;
  final Color lightSecondary;
  final Color lightGrey;
  final Color onLightGrey;
  final Color backgroundSuccess;
  final Color backgroundError;
  final Color backgroundWarning;
  final Color backgroundInfo;
  final Color shimmerBase;
  final Color shimmerHighlight;
  final Color facebook;
  final Color google;

  const CustomColorScheme({
    @required this.lightPrimary,
    @required this.darkPrimary,
    @required this.lightSecondary,
    @required this.lightGrey,
    @required this.onLightGrey,
    @required this.backgroundSuccess,
    @required this.backgroundError,
    @required this.backgroundWarning,
    @required this.backgroundInfo,
    @required this.shimmerBase,
    @required this.shimmerHighlight,
    @required this.facebook,
    @required this.google,
  });
}

/// Group ColorScheme & CustomColorScheme
class AppThemeColorInfo {
  final ColorScheme colorScheme;
  final CustomColorScheme customColorScheme;

  const AppThemeColorInfo({
    @required this.colorScheme,
    @required this.customColorScheme,
  });
}

extension AppColorScheme on ColorScheme {
  CustomColorScheme getCustomScheme(AppThemeMode appThemeMode) {
    return AppThemeColor.getAppThemeColorInfo(appThemeMode).customColorScheme;
  }
}
