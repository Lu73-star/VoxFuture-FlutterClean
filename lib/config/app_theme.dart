import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF0A0F28),
    scaffoldBackgroundColor: const Color(0xFF0A0F28),

    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF1A224F),     // azul escuro
      secondary: Color(0xFFFDD4A3),   // dourado suave
    ),

    fontFamily: 'Roboto',

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0A0F28),
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
