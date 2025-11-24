class AppConfig {
  // Nome público do aplicativo
  static const String appName = 'VoxFuture';

  // Ativar logs no console do Replit
  static const bool debugMode = true;

  // ================================
  // BACKEND (ajustar quando o servidor estiver online)
  // ================================
  static const String baseUrl = 'https://seu-backend-aqui.com/api';

  // Endpoint específico das previsões
  static const String predictionEndpoint = '/predict';
}
