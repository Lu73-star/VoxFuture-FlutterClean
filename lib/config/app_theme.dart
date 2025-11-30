import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF0A0F28),
    scaffoldBackgroundColor: const Color(0xFF0A0F28),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF1A224F),
      secondary: Color(0xFFD4AF37), // dourado
    ),
    fontFamily: 'Roboto',
    useMaterial3: true,
  );
}
