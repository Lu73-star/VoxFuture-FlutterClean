import 'package:flutter/material.dart';
import '../models/prediction_model.dart';
import '../widgets/prediction_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  // Temporário — depois vamos carregar do Firebase
  List<PredictionModel> get dummyHistory => [
        PredictionModel(
          id: "1",
          text: "Pergunta teste",
          result: "Resultado simulado da previsão.",
          date: DateTime.now(),
        ),
        PredictionModel(
          id: "2",
          text: "Outro exemplo",
          result: "Resultado gerado pela IA.",
          date: DateTime.now().subtract(const Duration(days: 1)),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final history = dummyHistory;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0F1A),
      appBar: AppBar(
        title: const Text("Histórico de Previsões"),
      ),
      body: history.isEmpty
          ? const Center(
              child: Text(
                "Nenhuma previsão ainda.",
                style: TextStyle(color: Colors.white70),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: history.length,
              itemBuilder: (context, index) {
                return PredictionCard(prediction: history[index]);
              },
            ),
    );
  }
}
