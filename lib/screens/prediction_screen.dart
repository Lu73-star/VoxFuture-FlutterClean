import 'package:flutter/material.dart';
import 'package:voxfuture_flutterclean/services/prediction_service.dart';

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({super.key});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  final TextEditingController _controller = TextEditingController();
  final PredictionService _predictionService = PredictionService();

  String _result = "";
  bool _loading = false;

  Future<void> _generate() async {
    final text = _controller.text.trim();

    if (text.isEmpty) {
      setState(() => _result = "Digite algo para gerar uma previsão.");
      return;
    }

    setState(() => _loading = true);

    final response = await _predictionService.generatePrediction(text);

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Digite sua
