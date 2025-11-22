import 'package:flutter/material.dart';
import '../services/prediction_service.dart';
import '../utils/custom_colors.dart';

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({super.key});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  final TextEditingController inputController = TextEditingController();
  String generatedText = "";
  bool isLoading = false;
  bool typing = false;

  Future<void> generatePrediction() async {
    final text = inputController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      generatedText = "";
      typing = false;
      isLoading = true;
    });

    final result = await PredictionService().generatePrediction(text);

    setState(() {
      isLoading = false;
      typing = true;
    });

    /// Efeito digitando — letra por letra
    for (int i = 0; i < result.length; i++) {
      await Future.delayed(const Duration(milliseconds: 18));
      if (!mounted) return;
      setState(() {
        generatedText += result[i];
      });
    }

    setState(() => typing = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Nova Previsão",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _inputBox(),
            const SizedBox(height: 20),
            _actionButton(),
            const SizedBox(height: 30),
            _outputBox(),
          ],
        ),
      ),
    );
  }

  Widget _inputBox() {
    return TextField(
      controller: inputController,
      maxLines: 4,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Digite sua pergunta...",
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.white12,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.amber),
        ),
      ),
    );
  }

  Widget _actionButton() {
    return InkWell(
      onTap: isLoading ? null : generatePrediction,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: CustomColors.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            isLoading ? "Gerando..." : "Gerar Previsão",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _outputBox() {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.amberAccent.withOpacity(0.4)),
        ),
        child: generatedText.isEmpty && !isLoading
            ? const Center(
                child: Text(
                  "A resposta aparecerá aqui...",
                  style: TextStyle(color: Colors.white54),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isLoading) ...[
                      const Center(
                        child: CircularProgressIndicator(
                          color: Colors.amber,
                        ),
                      ),
                    ],
                    if (!isLoading)
                      AnimatedOpacity(
                        opacity: 1,
                        duration: const Duration(milliseconds: 300),
                        child: Text(
                          generatedText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            height: 1.4,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
      ),
    );
  }
}
