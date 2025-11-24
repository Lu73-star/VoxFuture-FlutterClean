import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/home_screen.dart';
import '../splash_screen.dart';

class AppNavigation {
  // Rotas nomeadas
  static const String rotaSplash = '/';
  static const String rotaLogin = '/login';
  static const String rotaCadastro = '/cadastro';
  static const String rotaHome = '/home';

  // Mapa de rotas
  static Map<String, WidgetBuilder> rotas = {
    rotaSplash: (context) => const TelaInicial(),
    rotaLogin: (context) => const LoginScreen(),
    rotaCadastro: (context) => const RegisterScreen(),
    rotaHome: (context) => const HomeScreen(),
  };

  // Navegações rápidas
  static void irParaLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, rotaLogin);
  }

  static void irParaCadastro(BuildContext context) {
    Navigator.pushNamed(context, rotaCadastro);
  }

  static void irParaHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, rotaHome);
  }
}
