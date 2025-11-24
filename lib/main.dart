import 'package:flutter/material.dart';
import 'navigation/app_navigation.dart';
import 'app_theme.dart';

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

      title: 'VoxFuture',

      // Tema global do app
      theme: AppTheme.themeData,

      // Rota inicial
      initialRoute: AppNavigation.rotaSplash,

      // Mapa de rotas
      routes: AppNavigation.rotas,
    );
  }
}
