import 'package:flutter/material.dart';
import '../navigation/app_navigation.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "VoxFuture",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 40),

            const Text(
              "Escolha uma opção",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 50),

            _menuButton(
              context,
              title: "Nova Previsão",
              icon: Icons.auto_fix_high_rounded,
              route: AppNavigation.predictionRoute,
            ),

            const SizedBox(height: 20),

            _menuButton(
              context,
              title: "Histórico de Análises",
              icon: Icons.history_rounded,
              route: AppNavigation.historyRoute,
            ),

            const SizedBox(height: 20),

            _menuButton(
              context,
              title: "Planos de Assinatura",
              icon: Icons.workspace_premium_rounded,
              route: AppNavigation.subscriptionRoute,
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuButton(BuildContext context,
      {required String title, required IconData icon, required String route}) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.amberAccent, width: 1.3),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Icon(icon, color: Colors.amberAccent, size: 30),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
