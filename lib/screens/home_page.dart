import 'package:flutter/material.dart';
import '../widgets/stellar_background.dart';
import '../widgets/aurin_pulse.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StellarBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AurinPulse(size: 100),
              const SizedBox(height: 40),
              ShaderMask(
                shaderCallback: (rect) => const LinearGradient(
                  colors: [
                    Color(0xFFFFD44A),
                    Colors.white,
                    Color(0xFFFFD44A),
                  ],
                ).createShader(rect),
                child: const Text(
                  "VoxFuture",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 26),
              const Text(
                "O futuro já está falando.",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
