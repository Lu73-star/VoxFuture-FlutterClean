import 'dart:math';
import 'package:flutter/material.dart';

class StellarBackground extends StatefulWidget {
  final Widget child;
  const StellarBackground({super.key, required this.child});

  @override
  State<StellarBackground> createState() => _StellarBackgroundState();
}

class _StellarBackgroundState extends State<StellarBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  final Random random = Random();

  late List<Offset> stars;

  @override
  void initState() {
    super.initState();

    stars = List.generate(
      90,
      (_) => Offset(random.nextDouble(), random.nextDouble()),
    );

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF050817),
                Color(0xFF0A1129),
                Color(0xFF0F1A3B),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: CustomPaint(
            painter: _NebulaPainter(controller.value),
            foregroundPainter: _StarPainter(stars, controller.value),
            child: widget.child,
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

class _NebulaPainter extends CustomPainter {
  final double value;
  _NebulaPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    final cx = size.width * 0.4;
    final cy = size.height * 0.3;

    // Nebulosa central
    paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 80);
    paint.color = Colors.blueAccent.withOpacity(0.24 + sin(value * 2 * pi) * 0.08);
    canvas.drawCircle(Offset(cx, cy), 180, paint);

    // Nebulosa dourada suave
    paint.color = Colors.amber.withOpacity(0.14 + cos(value * 2 * pi) * 0.06);
    canvas.drawCircle(Offset(cx + 120, cy + 90), 140, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _StarPainter extends CustomPainter {
  final List<Offset> stars;
  final double t;

  _StarPainter(this.stars, this.t);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.7)
      ..strokeWidth = 1.2
      ..strokeCap = StrokeCap.round;

    for (final star in stars) {
      final dx = star.dx * size.width;
      final dy = star.dy * size.height;

      final dyAnim = dy + sin((dx + t * 400) * 0.01) * 2;

      canvas.drawPoints(PointMode.points, [Offset(dx, dyAnim)], paint);
    }
  }

  @override
  bool shouldRepaint(_) => true;
}
