import 'package:flutter/material.dart';
import '../config/routes.dart';

class AppNavigation {
  static void goToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.home,
      (route) => false,
    );
  }

  static void goToLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.login,
      (route) => false,
    );
  }

  static void goToPrediction(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.prediction);
  }

  static void goToSplash(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.splash,
      (route) => false,
    );
  }

  static void goToHistory(BuildContext context) {
    Navigator.pushNamed(context, "/history");
  }
}
