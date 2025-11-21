class PredictionModel {
  final String id;
  final String text;
  final String result;
  final DateTime date;

  PredictionModel({
    required this.id,
    required this.text,
    required this.result,
    required this.date,
  });

  // Converter para JSON (salvar no Firebase)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'result': result,
      'date': date.toIso8601String(),
    };
  }

  // Ler JSON (carregar do Firebase)
  factory PredictionModel.fromJson(Map<String, dynamic> json) {
    return PredictionModel(
      id: json['id'],
      text: json['text'],
      result: json['result'],
      date: DateTime.parse(json['date']),
    );
  }
}
