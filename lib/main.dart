import 'package:flutter/material.dart';
import 'config/app_theme.dart';
import 'screens/home_page.dart';

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
