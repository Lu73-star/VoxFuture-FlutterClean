class AppConfig {
  static const String appName = 'VoxFuture';

  // API base URL do backend FastAPI (por enquanto deixamos placeholder)
  static const String apiBaseUrl = 'http://localhost:8000';

  // Limites de previsões para cada plano (placeholder até integrarmos com Firebase)
  static const int freeLimit = 5;
  static const int proLimit = 50;
  static const int masterLimit = 200;
  static const int ultraLimit = 999999;
}
