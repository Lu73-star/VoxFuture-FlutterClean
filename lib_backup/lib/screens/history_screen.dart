import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // MOCK TEMPORÁRIO
    // Quando o backend estiver ativo, trocaremos por dados reais
    final mockHistory = [
      {
        "input": "Qual será o futuro do mercado financeiro?",
        "result": "As tendências mostram crescimento moderado...",
        "date": "20/02/2025"
      },
      {
        "input": "Negócio X vai prosperar?",
        "result": "Alta chance de expansão nos próximos meses...",
        "date": "19/02/2025"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Histórico de Previsões"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mockHistory.length,
        itemBuilder: (context, index) {
          final item = mockHistory[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["input"]!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item["result"]!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    item["date"]!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white38,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
