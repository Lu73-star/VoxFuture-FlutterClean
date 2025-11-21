import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  // Lista temporária de previsões
  List<Map<String, String>> predictions = [
    {
      "date": "Hoje, 15:30",
      "text": "Tendências fortes em tecnologia para 2025.",
    },
    {
      "date": "Ontem, 21:10",
      "text": "Aumento de oportunidades na área de IA aplicada.",
    },
    {
      "date": "15/11/2025",
      "text": "Momento favorável para investimentos digitais.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Histórico de Previsões",
          style: TextStyle(
            color: Colors.amber,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: predictions.isEmpty
          ? const Center(
              child: Text(
                "Nenhuma previsão feita ainda.",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 18,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: predictions.length,
              itemBuilder: (context, index) {
                final item = predictions[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 18),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.amber),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["date"]!,
                        style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item["text"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
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
