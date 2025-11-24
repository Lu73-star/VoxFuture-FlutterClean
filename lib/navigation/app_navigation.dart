import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/home_screen.dart';
import '../screens/history_screen.dart';
import '../screens/prediction_screen.dart';
import '../screens/plans_screen.dart';
import '../splash_screen.dart';

class AppNavigation {
  // Rotas nomeadas
  static const String rotaSplash = '/';
  static const String rotaLogin = '/login';
  static const String rotaCadastro = '/cadastro';
  static const String rotaHome = '/home';
  static const String rotaHistory = '/history';
  static const String rotaPrediction = '/prediction';
  static const String rotaPlans = '/plans';

  // Mapa de rotas
  static Map<String, WidgetBuilder> rotas = {
    rotaSplash: (context) => const TelaInicial(),
    rotaLogin: (context) => const LoginScreen(),
    rotaCadastro: (context) => const RegisterScreen(),
    rotaHome: (context) => const HomeScreen(),
    rotaHistory: (context) => const HistoryScreen(),
    rotaPrediction: (context) => const PredictionScreen(),
    rotaPlans: (context) => const PlansScreen(),
  };

  // Navegações rápidas - Portuguese methods
  static void irParaLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, rotaLogin);
  }

  static void irParaCadastro(BuildContext context) {
    Navigator.pushNamed(context, rotaCadastro);
  }

  static void irParaHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, rotaHome);
  }

  // English method names for compatibility
  static void goToLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, rotaLogin);
  }

  static void goToRegister(BuildContext context) {
    Navigator.pushNamed(context, rotaCadastro);
  }

  static void goToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, rotaHome);
  }

  static void goToHistory(BuildContext context) {
    Navigator.pushNamed(context, rotaHistory);
  }

  static void goToPrediction(BuildContext context) {
    Navigator.pushNamed(context, rotaPrediction);
  }

  static void goToPlans(BuildContext context) {
    Navigator.pushNamed(context, rotaPlans);
  }
}
