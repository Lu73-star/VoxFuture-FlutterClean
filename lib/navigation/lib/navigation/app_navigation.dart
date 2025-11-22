import 'package:flutter/material.dart';
import 'package:voxfuture_flutterclean/screens/splash_screen.dart';
import 'package:voxfuture_flutterclean/screens/home_screen.dart';
import 'package:voxfuture_flutterclean/screens/login_screen.dart';
import 'package:voxfuture_flutterclean/screens/register_screen.dart';

class AppNavigation {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                'Rota não encontrada',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        );
    }
  }
}
