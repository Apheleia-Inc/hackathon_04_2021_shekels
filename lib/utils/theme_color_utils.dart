// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:hackathon_04_2021_shekels/global/app_theme_color.dart';

// class ThemeColorUtils {
//   // Some benefits of using this:
//   // - When we use this Utils, we don't have to care about which scheme (ColorScheme or CustomColorScheme) this color belongs to
//   // - Shorten the syntax when we use this
//   // - Easier to change theme method (eg: want to change to ThemeData)

//   static CustomColorScheme _getCustomColorScheme(BuildContext context) {
//     var currentAppThemeMode = context.read<IThemeViewmodel>().currentTheme;
//     return Theme.of(context).colorScheme.getCustomScheme(currentAppThemeMode);
//   }

//   // Main ColorScheme

//   static Color getPrimary(BuildContext context) =>
//       Theme.of(context).colorScheme.primary;

//   static Color getOnPrimary(BuildContext context) =>
//       Theme.of(context).colorScheme.onPrimary;

//   static Color getSecondary(BuildContext context) =>
//       Theme.of(context).colorScheme.secondary;

//   static Color getOnSecondary(BuildContext context) =>
//       Theme.of(context).colorScheme.onSecondary;

//   static Color getSurface(BuildContext context) =>
//       Theme.of(context).colorScheme.surface;

//   static Color getOnSurface(BuildContext context) =>
//       Theme.of(context).colorScheme.onSurface;

//   // Custom ColorScheme

//   static Color getLightPrimary(BuildContext context) =>
//       _getCustomColorScheme(context).lightPrimary;

//   static Color getDarkPrimary(BuildContext context) =>
//       _getCustomColorScheme(context).darkPrimary;

//   static Color getLightSecondary(BuildContext context) =>
//       _getCustomColorScheme(context).lightSecondary;

//   static Color getLightGrey(BuildContext context) =>
//       _getCustomColorScheme(context).lightGrey;

//   static Color getOnLightGrey(BuildContext context) =>
//       _getCustomColorScheme(context).onLightGrey;

//   static Color getBackgroundSuccess(BuildContext context) =>
//       _getCustomColorScheme(context).backgroundSuccess;

//   static Color getBackgroundError(BuildContext context) =>
//       _getCustomColorScheme(context).backgroundError;

//   static Color getBackgroundWarning(BuildContext context) =>
//       _getCustomColorScheme(context).backgroundWarning;

//   static Color getBackgroundInfo(BuildContext context) =>
//       _getCustomColorScheme(context).backgroundInfo;

//   static Color getShimmerBase(BuildContext context) =>
//       _getCustomColorScheme(context).shimmerBase;

//   static Color getShimmerHighlight(BuildContext context) =>
//       _getCustomColorScheme(context).shimmerHighlight;

//   static Color getFacebook(BuildContext context) =>
//       _getCustomColorScheme(context).facebook;

//   static Color getGoogle(BuildContext context) =>
//       _getCustomColorScheme(context).google;
// }
