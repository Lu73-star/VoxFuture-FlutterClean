// File: lib/widgets/nebula_background.dart
import 'dart:ui';
import 'package:flutter/material.dart';

class NebulaBackground extends StatelessWidget {
  final Widget child;

  const NebulaBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF020617), // azul espaço profundo
            Color(0xFF020617),
            Color(0xFF05001A), // roxo escuro no rodapé
          ],
        ),
      ),
      child: Stack(
        children: [
          // Glow esquerdo
          Positioned(
            top: -80,
            left: -40,
            child: _NebulaGlow(
              color: const Color(0xFF38BDF8).withOpacity(0.45),
              size: 260,
            ),
          ),

          // Glow direito
          Positioned(
            bottom: -60,
            right: -30,
            child: _NebulaGlow(
              color: const Color(0xFFFFC94A).withOpacity(0.50),
              size: 260,
            ),
          ),

          // Pontos de estrela
          const _StarField(),

          // Véu escuro para não atrapalhar legibilidade
          Container(
            color: Colors.black.withOpacity(0.35),
          ),

          // Conteúdo da tela (Scaffold, etc.)
          child,
        ],
      ),
    );
  }
}

class _NebulaGlow extends StatelessWidget {
  final Color color;
  final double size;

  const _NebulaGlow({
    Key? key,
    required this.color,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                color,
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StarField extends StatelessWidget {
  const _StarField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Pontos simples de luz – leve para Web e Android
    return IgnorePointer(
      child: CustomPaint(
        painter: _StarFieldPainter(),
        size: Size.infinite,
      ),
    );
  }
}

class _StarFieldPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.65)
      ..style = PaintingStyle.fill;

    final randomPoints = <Offset>[
      Offset(size.width * 0.15, size.height * 0.18),
      Offset(size.width * 0.35, size.height * 0.12),
      Offset(size.width * 0.65, size.height * 0.20),
      Offset(size.width * 0.80, size.height * 0.10),
      Offset(size.width * 0.25, size.height * 0.45),
      Offset(size.width * 0.55, size.height * 0.38),
      Offset(size.width * 0.78, size.height * 0.42),
      Offset(size.width * 0.18, size.height * 0.72),
      Offset(size.width * 0.42, size.height * 0.80),
      Offset(size.width * 0.70, size.height * 0.75),
    ];

    for (final p in randomPoints) {
      canvas.drawCircle(p, 0.9, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
