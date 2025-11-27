import 'package:flutter/material.dart';

void main() {
  runApp(const VoxFutureApp());
}

class VoxFutureApp extends StatelessWidget {
  const VoxFutureApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryGold = Color(0xFFFFA800);
    const background = Color(0xFF050814);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VoxFuture',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: background,
        colorScheme: const ColorScheme.dark(
          primary: primaryGold,
          secondary: primaryGold,
        ),
      ),
      home: const VoxFutureHome(),
    );
  }
}

class VoxFutureHome extends StatelessWidget {
  const VoxFutureHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VoxFuture'),
      ),
      body: const Center(
        child: Text(
          'VoxFuture pronto para compilar.',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
