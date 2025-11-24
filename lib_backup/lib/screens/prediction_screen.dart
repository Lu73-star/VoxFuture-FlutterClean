import 'package:flutter/material.dart';
import '../services/prediction_service.dart';

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({super.key});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  final TextEditingController _controller = TextEditingController();
  final PredictionService _service = PredictionService();

  bool _loading = false;
  String? _result;

  Future<void> _generate() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _loading = true;
      _result = null;
    });

    final response = await _service.generatePrediction(text);

    setState(() {
      _loading = false;
      _result = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova Previsão"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "Digite sua pergunta...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Colors.white.withOpacity(0.05),
                filled: true,
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _loading ? null : _generate,
              child: _loading
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text("Gerar Previsão"),
            ),

            const SizedBox(height: 30),

            if (_result != null)
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white12),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      _result!,
                      style: const TextStyle(fontSize: 16),
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
