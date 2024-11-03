import 'package:flutter/material.dart';

final class AppTheme {
  static const Color whiteSmoke = Color(0xFFF5F5F5);
  static const Color white = Color(0xFFFFFFFF);
  static const Color irisBlue = Color(0xFF11B0C8);
  static const Color nero = Color(0xFF1F1F1F);
  static const Color grey = Color(0xFF7D7D7D);

  static const TextTheme textTheme = TextTheme(
    headlineSmall: TextStyle(
      fontFamily: 'Lato',
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 1.4,
      color: nero,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Lato',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      height: 1.4,
      color: nero,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Lato',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.4,
      color: nero,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Lato',
      fontSize: 12,
      fontWeight: FontWeight.w700,
      height: 1.4,
      color: nero,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Lato',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.4,
      color: nero,
    ),
  );

  static final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: whiteSmoke,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: irisBlue,
      secondary: nero,
      surface: white,
    ),
    textTheme: textTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: white,
      elevation: 0,
      iconTheme: IconThemeData(color: nero),
      titleTextStyle: TextStyle(
        color: nero,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w700,
        fontSize: 16,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: irisBlue,
        textStyle: const TextStyle(
          fontFamily: 'Lato',
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}
