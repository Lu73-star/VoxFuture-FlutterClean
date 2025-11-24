class AppKeys {
  // API keys should be configured as environment variables in Replit
  // Go to Secrets tab in Replit to add OPENAI_API_KEY
  // This prevents exposing sensitive keys in source code
  
  static const String apiKey = String.fromEnvironment(
    'OPENAI_API_KEY',
    defaultValue: '',
  );
  
  // Check if API key is configured
  static bool get isConfigured => apiKey.isNotEmpty;
}
