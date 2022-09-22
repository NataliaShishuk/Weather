import 'package:flutter/material.dart';

import 'constans.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: primmaryBackgroundDarkColor,
    ),
    backgroundColor: secondaryBackgroundLightColor,
    scaffoldBackgroundColor: primmaryBackgroundLightColor,
    colorScheme: const ColorScheme.light().copyWith(
      primary: primaryTextLightColor,
      secondary: secondaryTextLightColor,
    ),
  );
}

// Dark Theme
ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: primmaryBackgroundDarkColor,
    ),
    backgroundColor: secondaryBackgroundDarkColor,
    scaffoldBackgroundColor: primmaryBackgroundDarkColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: primaryTextDarkColor,
      secondary: secondaryTextDarkColor,
    ),
  );
}
