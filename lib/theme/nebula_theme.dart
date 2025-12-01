import 'package:flutter/material.dart';

class NebulaTheme {
  // 🎨 Paleta oficial Nebulosa Suprema
  static const Color starBlue = Color(0xFF0A0F29);     // Azul profundo estelar
  static const Color spaceBlack = Color(0xFF05060C);   // Preto espacial
  static const Color gold = Color(0xFFFFC525);         // Dourado vivo
  static const Color goldGlow = Color(0xFFFFE58F);     // Brilho suave

  // ⭐ Gradiente principal usado em telas
  static const LinearGradient nebulaBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF060B1A),
      Color(0xFF0B112E),
      Color(0xFF02040A),
    ],
  );

  // ✨ Gradiente dourado para botões premium
  static const LinearGradient goldGradient = LinearGradient(
    colors: [
      Color(0xFFFFC525),
      Color(0xFFFFE58F),
      Color(0xFFFFC525),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // 🌌 Tema principal aplicado ao MaterialApp
  static ThemeData theme = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor: spaceBlack,

    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: 'Roboto',
      ),
      bodyMedium: TextStyle(
        color: Colors.white70,
        fontSize: 16,
      ),
      titleLarge: TextStyle(
        color: gold,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: starBlue.withOpacity(0.4),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: gold),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: goldGlow, width: 2),
      ),
      labelStyle: const TextStyle(color: gold),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: gold,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: gold,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
