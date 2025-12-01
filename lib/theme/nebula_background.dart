import 'package:flutter/material.dart';
import 'nebula_theme.dart';

class NebulaBackground extends StatelessWidget {
  final Widget child;

  const NebulaBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: NebulaTheme.nebulaBackground,
      ),
      child: Stack(
        children: [
          // ⭐ Partículas estelares
          Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(
                painter: StarfieldPainter(),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

// ⭐ Campo estelar
class StarfieldPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.25);

    for (int i = 0; i < 150; i++) {
      final dx = (size.width * (i / 150)) + (i % 7) * 3;
      final dy = (size.height * ((i * 2) % 150) / 150);

      canvas.drawCircle(Offset(dx, dy), (i % 4 == 0) ? 1.8 : 1.0, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
