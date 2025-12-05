// File: lib/screens/home_page.dart

import 'package:flutter/material.dart';
import '../widgets/nebula_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return NebulaBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.3),
          title: const Text(
            "Dashboard",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: const Center(
          child: Text(
            "Bem-vindo ao Vox Future!",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
