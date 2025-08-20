import 'package:finlit/components/themes/ficon_extension.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.grey[200],
    colorScheme: ColorScheme.light(
      primary: Colors.deepPurple,
      secondary: Colors.purpleAccent,
      surface: Colors.white, // used for cards/containers
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xFF1B023B), // your dark purple background
    cardColor: Color(0xFF321B4F),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,          // button bg
        foregroundColor: Color(0xFF6024B4),     // text + icon color
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: Colors.white
      )
    ),
    extensions: [
      const FIconTheme(
        backgroundColor: Colors.white,
        iconColor: Color(0xFF6024B4)
      ),
    ]
  );
}