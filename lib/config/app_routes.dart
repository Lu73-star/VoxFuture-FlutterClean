import 'package:flutter/material.dart';

import '../screens/splash_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/home_screen.dart';
import '../screens/history_screen.dart';
import '../screens/prediction_screen.dart';
import '../screens/plans_screen.dart';

class AppRoutes {
  // ROTAS NOMEADAS
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String history = '/history';
  static const String prediction = '/prediction';
  static const String plans = '/plans';

  // MÉTODO QUE CONSTROI ROTAS
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case history:
        return MaterialPageRoute(builder: (_) => const HistoryScreen());

      case prediction:
        return MaterialPageRoute(builder: (_) => const PredictionScreen());

      case plans:
        return MaterialPageRoute(builder: (_) => const PlansScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            backgroundColor: Colors.black,
            body: const Center(
              child: Text(
                'Rota não encontrada',
                style: TextStyle(color: Colors.redAccent, fontSize: 22),
              ),
            ),
          ),
        );
    }
  }
}
