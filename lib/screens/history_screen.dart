import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> fakeHistory = [
      "🔮 Previsão gerada recentemente",
      "✨ Insight profundo sobre a situação",
      "⚡ Orientação sobre decisão importante",
      "🌙 Tendência energética detectada",
      "🔥 Análise de caminho provável",
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Histórico",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          itemCount: fakeHistory.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white24,
                  width: 1,
                ),
              ),
              child: Text(
                fakeHistory[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
