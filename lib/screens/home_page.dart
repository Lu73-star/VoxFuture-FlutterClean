import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "VoxFuture",
              style: TextStyle(
                color: Color(0xFFFFC300),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            Text(
              "VoxFuture está vivo.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
