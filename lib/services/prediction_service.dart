import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/keys.dart';

class PredictionService {
  final String endpoint =
      "https://api.openai.com/v1/chat/completions";

  Future<String> generatePrediction(String userText) async {
    // Check if API key is configured
    if (!AppKeys.isConfigured) {
      return "Erro: API key não configurada. Configure OPENAI_API_KEY nas Secrets do Replit.";
    }

    final uri = Uri.parse(endpoint);

    try {
      final response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AppKeys.apiKey}",
        },
        body: jsonEncode({
          "model": "gpt-4o-mini",
          "messages": [
            {"role": "user", "content": userText}
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["choices"][0]["message"]["content"];
      } else {
        return "Erro: ${response.statusCode} — Não foi possível gerar previsão.";
      }
    } catch (e) {
      return "Erro de rede: $e";
    }
  }
}
