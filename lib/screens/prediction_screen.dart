import 'package:flutter/material.dart';

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({super.key});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  final TextEditingController inputController = TextEditingController();
  bool loading = false;
  String? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Nova Previsão",
          style: TextStyle(
            color: Colors.amber,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Digite sua pergunta ou situação",
              style: TextStyle(color: Colors.amber, fontSize: 18),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: inputController,
              maxLines: 5,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Ex.: \"Quais tendências irão surgir para meu negócio?\"",
                hintStyle: const TextStyle(color: Colors.white38),
                filled: true,
                fillColor: Colors.black54,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber.shade700),
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: loading ? null : _generatePrediction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: loading
                    ? const CircularProgressIndicator(color: Colors.black)
                    : const Text(
                        "Gerar Previsão",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
              ),
            ),

            const SizedBox(height: 30),

            if (result != null)
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.amber),
                    ),
                    child: Text(
                      result!,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _generatePrediction() async {
    setState(() {
      loading = true;
      result = null;
    });

    await Future.delayed(const Duration(seconds: 2)); // TEMPORÁRIO

    setState(() {
      loading = false;
      result = "⚡ Previsão gerada com sucesso! (API será integrada depois)";
    });
  }
}
