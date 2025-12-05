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
       title: 'VoxFuture',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: background,
        colorScheme: const ColorScheme.dark(
          primary: primaryGold,
          secondary: primaryGold,
        ),
      ),
      home: const VoxFutureHome(),
      routes: {
        '/voice': (context) => const VoicePage(),
      },
    );
  }
}

class VoxFutureHome extends StatelessWidget {
  const VoxFutureHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VoxFuture'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'VoxFuture pronto para compilar.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.mic),
              label: const Text('Abrir Voice Page'),
              onPressed: () => Navigator.of(context).pushNamed('/voice'),
            ),
          ],
        ),
      ),
    );
  }
}
