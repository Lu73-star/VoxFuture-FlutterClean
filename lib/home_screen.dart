import 'package:flutter/material.dart';
import '../navigation/app_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "VoxFuture",
          style: TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),

            // Botão Nova Previsão
            ElevatedButton(
              onPressed: () => AppNavigation.goToPrediction(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 40),
              ),
              child: const Text(
                "Nova Previsão",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),

            const SizedBox(height: 20),

            // Botão Histórico
            ElevatedButton(
              onPressed: () => AppNavigation.goToHistory(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 40),
              ),
              child: const Text(
                "Histórico",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),

            const SizedBox(height: 20),

            // Botão Configurações
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/settings"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 40),
              ),
              child: const Text(
                "Configurações",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
