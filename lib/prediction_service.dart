import 'dart:async';

class PredictionService {
  // Simulação de IA. Trocaremos pela API real depois.
  Future<String> generatePrediction(String input) async {
    await Future.delayed(const Duration(seconds: 2));

    // Temporário — resultado simulado
    return "🔮 Previsão gerada com sucesso para: \"$input\"\n\n"
           "• Tendências futuras detectadas.\n"
           "• Oportunidades emergentes.\n"
           "• Análise baseada no modelo VoxFuture.\n\n"
           "⚡ Integração com IA real será ativada em breve.";
  }
}
