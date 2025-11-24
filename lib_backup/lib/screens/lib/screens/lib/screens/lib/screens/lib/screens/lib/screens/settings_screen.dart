import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _logout(BuildContext context) async {
    final auth = AuthService();
    await auth.logout();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0F1A),
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "VoxFuture",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Configurações Gerais",
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),

            const SizedBox(height: 12),

            ListTile(
              leading: const Icon(Icons.person, color: Colors.amber),
              title: const Text("Conta", style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.security, color: Colors.amber),
              title: const Text("Privacidade", style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.star, color: Colors.amber),
              title: const Text("Assinatura", style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),

            const Spacer(),

            Center(
              child: ElevatedButton(
                onPressed: () => _logout(context),
                child: const Text("Sair da conta"),
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                "Versão 1.0.0",
                style: TextStyle(color: Colors.white38),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
