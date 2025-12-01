import 'package:flutter/material.dart';
import 'dart:math';

class NebulaBackground extends StatefulWidget {
  final Widget child;

  const NebulaBackground({super.key, required this.child});

  @override
  State<NebulaBackground> createState() => _NebulaBackgroundState();
}

class _NebulaBackgroundState extends State<NebulaBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 22),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return CustomPaint(
          painter: _NebulaPainter(_controller.value),
          child: widget.child,
        );
      },
    );
  }
}

class _NebulaPainter extends CustomPainter {
  final double progress;
  _NebulaPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Fundo cósmico azul profundo
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xFF020024),
        const Color(0xFF090979),
        const Color(0xFF4F00BC),
      ],
    );

    paint.shader = gradient.createShader(Offset.zero & size);
    canvas.drawRect(Offset.zero & size, paint);

    final starPaint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);

    final rand = Random(50);

    // Estrelas piscando
    for (var i = 0; i < 150; i++) {
      final x = rand.nextDouble() * size.width;
      final y = rand.nextDouble() * size.height;
      final radius = (rand.nextDouble() * 1.5) + 0.5;

      final flicker =
          0.5 + 0.5 * sin(progress * 2 * pi + (i * 0.1)); // brilho suave

      canvas.drawCircle(
        Offset(x, y),
        radius * flicker,
        starPaint,
      );
    }

    // Nebulosa dourada suave
    final nebulaPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.amber.withOpacity(0.25),
          Colors.transparent,
        ],
      ).createShader(
        Rect.fromCircle(
          center: Offset(size.width * 0.6, size.height * 0.4),
          radius: size.width * 0.9,
        ),
      );

    canvas.drawCircle(
      Offset(size.width * 0.6, size.height * 0.4),
      size.width * 0.9,
      nebulaPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
