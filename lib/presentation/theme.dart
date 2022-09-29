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
    splashColor: primaryTextLightColor.withOpacity(0.3),
    highlightColor: primaryTextLightColor.withOpacity(0.3),
    iconTheme: const IconThemeData(
      color: primaryTextLightColor,
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
    splashColor: primaryTextDarkColor.withOpacity(0.3),
    highlightColor: primaryTextDarkColor.withOpacity(0.3),
    iconTheme: const IconThemeData(
      color: primaryTextDarkColor,
    ),
  );
}
