import 'package:flutter/material.dart';

void main() {
  runApp(const VoxFutureApp());
}

class VoxFutureApp extends StatelessWidget {
  const VoxFutureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VoxFuture',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0D47A1), // azul profundo
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const VoxFutureHomePage(),
    );
  }
}

class VoxFutureHomePage extends StatelessWidget {
  const VoxFutureHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'VoxFuture',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Estrutura Flutter básica pronta.\nPronta para integrar voz e IA.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
