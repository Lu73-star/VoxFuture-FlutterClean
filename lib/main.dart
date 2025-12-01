import 'package:flutter/material.dart';
import 'theme/nebula_theme.dart';

void main() {
  runApp(const VoxFuture());
}

class VoxFuture extends StatelessWidget {
  const VoxFuture({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "VoxFuture",
      debugShowCheckedModeBanner: false,
      theme: NebulaTheme.theme,
      home: const NebulaBackground(child: LoginPage()),
    );
  }
}
