import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/loading_indicator.dart';
import '../services/prediction_service.dart';

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({super.key});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  final textController = TextEditingController();
  bool loading = false;
  String? predictionResult;

  void _generatePrediction() async {
    if (textController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Digite algo para gerar uma previsão.")),
      );
      return;
    }

    setState(() {
      loading = true;
      predictionResult = null;
    });

    final service = PredictionService();
    final result = await service.generatePrediction(
      textController.text.trim(),
    );

    setState(() {
      loading = false;
      predictionResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova Previsão"),
      ),
      backgroundColor: const Color(0xFF0A0F1A),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InputField(
              label: "Digite sua pergunta ou texto",
              controller: textController,
              keyboardType: TextInputType.multiline,
            ),

            const SizedBox(height: 20),

            PrimaryButton(
              text: "Gerar Previsão",
              loading: loading,
              onPressed: _generatePrediction,
            ),

            const SizedBox(height: 30),

            if (loading) const LoadingIndicator(size: 38),

            if (predictionResult != null && !loading)
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      predictionResult!,
                      style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
