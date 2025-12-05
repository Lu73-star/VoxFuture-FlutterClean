import 'package:flutter/material.dart';

class AurinPulse extends StatefulWidget {
  final double size;
  const AurinPulse({super.key, this.size = 60});

  @override
  State<AurinPulse> createState() => _AurinPulseState();
}

class _AurinPulseState extends State<AurinPulse>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
      lowerBound: 0.85,
      upperBound: 1.15,
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Transform.scale(
          scale: controller.value,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.amber.withOpacity(0.7),
                  blurRadius: 20,
                  spreadRadius: 4,
                )
              ],
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFFFD44A),
                  Color(0xFFFFA500),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
