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
  late AnimationController _controller;
  final Random random = Random();

  List<Offset> stars = [];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);

    for (int i = 0; i < 80; i++) {
      stars.add(Offset(random.nextDouble(), random.nextDouble()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF040710),
              Color(0xFF0A0F1F),
              Color(0xFF0D152B),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: CustomPaint(
          painter: StarPainter(stars, _controller.value),
          child: widget.child,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class StarPainter extends CustomPainter {
  final List<Offset> stars;
  final double animation;

  StarPainter(this.stars, this.animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.6)
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    for (final star in stars) {
      final dx = star.dx * size.width;
      final dy = star.dy * size.height;
      final offset = Offset(dx, dy + sin(animation * 2 * pi) * 4);
      canvas.drawPoints(PointMode.points, [offset], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
