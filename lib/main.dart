import 'package:flutter/material.dart';
import 'routes.dart'; // mantém suas rotas já existentes

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const VoxFutureApp());
}

class VoxFutureApp extends StatelessWidget {
  const VoxFutureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "VoxFuture",
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0F1F), // Fundo azul-escuro
        primaryColor: const Color(0xFFFFC300), // Dourado vivo
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFFC300),
          secondary: Color(0xFFFFC300),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
          titleLarge: TextStyle(
            color: Color(0xFFFFC300),
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white10,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white24),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white24),
          ),
          labelStyle: const TextStyle(color: Colors.white70),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
