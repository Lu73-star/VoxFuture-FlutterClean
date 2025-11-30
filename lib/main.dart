import 'package:flutter/material.dart';
import 'config/app_theme.dart';

void main() {
  runApp(const VoxFutureApp());
}

class VoxFutureApp extends StatelessWidget {
  const VoxFutureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VoxFuture',
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VoxFuture'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VoxFuture está vivo.',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
