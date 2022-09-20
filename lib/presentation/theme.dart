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
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: headline1FontSize,
        color: primaryTextLightColor,
      ),
      headline2: TextStyle(
        fontSize: headline2FontSize,
        color: primaryTextLightColor,
      ),
      bodyText1: TextStyle(
        color: primaryTextLightColor,
      ),
      bodyText2: TextStyle(
        color: secondaryTextLightColor,
      ),
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
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: headline1FontSize,
        color: primaryTextDarkColor,
      ),
      headline2: TextStyle(
        fontSize: headline2FontSize,
        color: primaryTextDarkColor,
      ),
      bodyText1: TextStyle(
        color: primaryTextDarkColor,
      ),
      bodyText2: TextStyle(
        color: secondaryTextDarkColor,
      ),
    ),
  );
}
