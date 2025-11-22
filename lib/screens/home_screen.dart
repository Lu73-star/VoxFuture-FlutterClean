import 'package:flutter/material.dart';
import '../navigation/app_navigation.dart';
import '../services/auth_service.dart';
import '../utils/custom_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "VoxFuture",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () async {
              await AuthService().logout();
              AppNavigation.goToLogin(context);
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            const Text(
              "O que deseja fazer?",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 40),

            _homeButton(
              context,
              title: "Nova Previsão",
              icon: Icons.auto_awesome,
              action: () => AppNavigation.goToPrediction(context),
            ),

            const SizedBox(height: 20),

            _homeButton(
              context,
              title: "Histórico de Análises",
              icon: Icons.history,
              action: () => AppNavigation.goToHistory(context),
            ),

            const SizedBox(height: 20),

            _homeButton(
              context,
              title: "Planos de Assinatura",
              icon: Icons.star,
              action: () => AppNavigation.goToPlans(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _homeButton(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback action,
  }) {
    return InkWell(
      onTap: action,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: CustomColors.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
