import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const VoxFutureApp());
}

class VoxFutureApp extends StatelessWidget {
  const VoxFutureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VoxFuture',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF0A0F28),
        scaffoldBackgroundColor: const Color(0xFF0A0F28),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF1A224F),
          secondary: Color(0xFFD4AF37),
        ),
        fontFamily: 'Roboto',
      ),
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
