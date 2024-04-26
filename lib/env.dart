abstract class Env {
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: '',
  );
  static const String apiKey = String.fromEnvironment(
    'API_KEY',
    defaultValue: '',
  );
  static const String secretKey = String.fromEnvironment(
    'SECRET_KEY',
    defaultValue: '',
  );
}
