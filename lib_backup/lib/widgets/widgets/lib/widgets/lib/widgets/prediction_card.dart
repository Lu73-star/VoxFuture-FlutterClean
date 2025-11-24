import 'package:flutter/material.dart';
import '../models/prediction_model.dart';

class PredictionCard extends StatelessWidget {
  final PredictionModel prediction;

  const PredictionCard({
    super.key,
    required this.prediction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF111827),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              prediction.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              prediction.result,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              "Data: ${prediction.date.day}/${prediction.date.month}/${prediction.date.year}",
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
