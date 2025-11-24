class SubscriptionModel {
  final String id;
  final String name;
  final double price;
  final int maxPredictions;
  final int maxUsers;
  final bool hasAdvancedGraphs;
  final bool hasReports;

  SubscriptionModel({
    required this.id,
    required this.name,
    required this.price,
    required this.maxPredictions,
    required this.maxUsers,
    required this.hasAdvancedGraphs,
    required this.hasReports,
  });

  // Converter para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'maxPredictions': maxPredictions,
      'maxUsers': maxUsers,
      'hasAdvancedGraphs': hasAdvancedGraphs,
      'hasReports': hasReports,
    };
  }

  // Ler JSON
  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      maxPredictions: json['maxPredictions'],
      maxUsers: json['maxUsers'],
      hasAdvancedGraphs: json['hasAdvancedGraphs'],
      hasReports: json['hasReports'],
    );
  }
}
