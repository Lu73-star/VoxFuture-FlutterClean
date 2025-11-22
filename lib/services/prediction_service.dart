import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config/api_keys.dart';

class PredictionService {
  Future<String> generatePrediction(String userInput) async {
    try {
      final uri = Uri.parse("https://api.openai.com/v1/chat/completions");

      final response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${ApiKeys.openAIApiKey}",
        },
        body: jsonEncode({
          "model": "gpt-4o-mini",
          "messages": [
            {
              "role": "system",
              "content": "Você é o motor de previsão oficial do aplicativo VoxFuture."
            },
            {
              "role": "user",
              "content": userInput
            }
          ],
          "max_tokens": 300,
          "temperature": 0.7
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["choices"][0]["message"]["content"];
      } else {
        return "Erro da API: ${response.body}";
      }
    } catch (e) {
      return "Erro ao conectar: $e";
    }
  }
}
