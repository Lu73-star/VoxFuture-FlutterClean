import 'package:flutter/material.dart';
import '../screens/home_page.dart';
import '../screens/login_page.dart';
import '../screens/register_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const LoginPage(),
    '/login': (context) => const LoginPage(),
    '/register': (context) => const RegisterPage(),
    '/home': (context) => const HomePage(),
  };
}
